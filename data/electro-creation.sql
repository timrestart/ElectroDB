
--------------------------------------------------------------------------------
--------------------- ENTREPRISE D'ELECTRONIQUE --------------------------------
--------------------------------------------------------------------------------

--------------------- DROPS ----------------------------------------------------

DROP TABLE IF EXISTS Ventes_base;
DROP TABLE IF EXISTS Clients;
DROP TABLE IF EXISTS Employes;
DROP TABLE IF EXISTS StocksProduits_base;
DROP TABLE IF EXISTS Produits;
DROP TABLE IF EXISTS Magasins;

--------------------- TABLES ---------------------------------------------------

PRAGMA FOREIGN_KEYS=ON;

CREATE TABLE Magasins (
    num_magasin INTEGER,
    adresse_magasin TEXT NOT NULL,
    ville_magasin TEXT,

    CONSTRAINT pk_num_magasin PRIMARY KEY (num_magasin),
    CONSTRAINT uq_adresse_magasin UNIQUE (adresse_magasin),

    CONSTRAINT ck_num_magasin CHECK (num_magasin > 0)
);

CREATE TABLE Produits (
    nom_produit TEXT,
    categorie_produit TEXT,
    marque_produit TEXT,
    prix_produit FLOAT NOT NULL,

    CONSTRAINT pk_nom_produit PRIMARY KEY (nom_produit),

    CONSTRAINT ck_categorie_produit CHECK (
        categorie_produit = 'mobile' OR 
        categorie_produit = 'ordinateur' OR 
        categorie_produit = 'peripherique' OR 
        categorie_produit = 'multimedia'
    ),
    CONSTRAINT ck_prix_produit CHECK (prix_produit > 0)
);

CREATE TABLE StocksProduits_base (
    num_magasin INTEGER,
    nom_produit TEXT,
    initial_stockProduit INTEGER NOT NULL,

    CONSTRAINT pk_num_magasin_nom_produit PRIMARY KEY (num_magasin, nom_produit),

    CONSTRAINT ck_initial_stockProduit CHECK (initial_stockProduit > 0),

    CONSTRAINT fk_num_magasin FOREIGN KEY (num_magasin) REFERENCES Magasins(num_magasin),
    CONSTRAINT fk_nom_produit FOREIGN KEY (nom_produit) REFERENCES Produits(nom_produit)
);

CREATE TABLE Employes (
    num_employe INTEGER,
    nom_employe TEXT,
    prenom_employe TEXT,
    dateEmbauche_employe DATE,
    role_employe TEXT,
    num_magasin INTEGER NOT NULL,

    CONSTRAINT pk_num_employe PRIMARY KEY (num_employe),

    CONSTRAINT ck_num_employe CHECK (num_employe > 0),
    CONSTRAINT ck_role_employe CHECK (
        role_employe = 'vendeur' OR 
        role_employe = 'technicien'
    ),

    CONSTRAINT fk_num_magasin FOREIGN KEY (num_magasin) REFERENCES Magasins(num_magasin)
);

CREATE TABLE Clients (
    num_client INTEGER,
    nom_client TEXT,
    prenom_client TEXT,

    CONSTRAINT pk_num_client PRIMARY KEY (num_client),

    CONSTRAINT ck_num_client CHECK (num_client > 0)
);

CREATE TABLE Ventes_base (
    num_vente INTEGER,
    date_vente DATE NOT NULL,
    num_magasin INTEGER NOT NULL,
    num_employe INTEGER NOT NULL,
    nom_produit TEXT NOT NULL,
    nbArticle_quantiteAchetee INTEGER NOT NULL,
    num_client INTEGER NOT NULL,

    CONSTRAINT pk_num_vente PRIMARY KEY (num_vente),

    CONSTRAINT ck_nbArticle_quantiteAchetee CHECK (nbArticle_quantiteAchetee > 0),

    CONSTRAINT fk_num_magasin FOREIGN KEY (num_magasin) REFERENCES Magasins(num_magasin),
    CONSTRAINT fk_num_employe FOREIGN KEY (num_employe) REFERENCES Employes(num_employe),
    CONSTRAINT fk_num_client FOREIGN KEY (num_client) REFERENCES Clients(num_client),
    CONSTRAINT fk_nom_produit FOREIGN KEY (nom_produit) REFERENCES Produits(nom_produit)

    -- Contrainte : Seul un vendeur peut vendre
    -- Contrainte : Le vendeur qui a supervisé la vente doit travailler au même
        -- magasin que celui où la vente a été effectuée
    -- Contrainte : Le produit acheté doit être stocké dans le magasin où s'effectue la vente
);

--------------------- VIEWS ----------------------------------------------------

DROP VIEW IF EXISTS StocksProduits_view;
DROP VIEW IF EXISTS Ventes_view;

CREATE VIEW IF NOT EXISTS StocksProduits_view (
    num_magasin,
    nom_produit,
    initial_stockProduit,
    restant_stockProduit) AS
        SELECT 
            SP.num_magasin,
            SP.nom_produit,
            SP.initial_stockProduit,
            SP.initial_stockProduit - SUM(V.nbArticle_quantiteAchetee) AS restant_stockProduit
        FROM StocksProduits_base SP
            JOIN Produits P ON (SP.nom_produit = P.nom_produit)
            JOIN Ventes_base V ON (P.nom_produit = V.nom_produit)
        GROUP BY SP.num_magasin, SP.nom_produit, SP.initial_stockProduit
;

CREATE VIEW IF NOT EXISTS Ventes_view (
    num_vente,
    date_vente,
    num_magasin,
    num_employe,
    nom_produit,
    nbArticle_quantiteAchetee,
    num_client,
    montant_vente) AS
        SELECT
            num_vente,
            date_vente,
            num_magasin,
            num_employe,
            nom_produit,
            nbArticle_quantiteAchetee,
            num_client,
            prix_produit * nbArticle_quantiteAchetee AS montant_vente
        FROM Ventes_base JOIN Produits USING (nom_produit)
;