
--------------------------------------------------------------------------------
--------------------- ENTREPRISE D'ELECTRONIQUE --------------------------------
--------------------------------------------------------------------------------

--------------------- ERREURS ET AVERTISSEMENTS --------------------------------

-- Erreur : un magasin se trouve déja à cette adresse
INSERT INTO Magasins VALUES (006, 'Vinewood', 'Grenoble');


-- Erreur : type de produit inconnu
INSERT INTO Produits VALUES ('IphoneX', 'ERREUR', 'Apple', 1099);
-- Erreur : prix négatif
INSERT INTO Produits VALUES ('IphoneX', 'mobile', 'Apple', -1099);


-- Erreur : stock initial de produit négatif
INSERT INTO StocksProduits_base VALUES (001, 'G14', -18);
-- A éviter : produit non listé
INSERT INTO StocksProduits_base VALUES (001, 'ERREUR', 18);


-- Erreur : role inconnu
INSERT INTO Employes VALUES (009, 'NOM', 'PRENOM', '2015-05-01', 'ERREUR', 001);
-- A éviter : magasin inconnu
INSERT INTO Employes VALUES (010, 'NOM', 'PRENOM', '2015-05-01', 'vendeur', 009);


-- Erreur : nombre d'article achetés négatif ou égal à 0
INSERT INTO Ventes_base VALUES (0013, '2015-11-02', 002, 004, 'Xiaomi20', 0, 0001);
-- A éviter : magasin inconnu
INSERT INTO Ventes_base VALUES (0014, '2015-11-02', 010, 004, 'Xiaomi20', 1, 0001);
-- A éviter : employe inconnu
INSERT INTO Ventes_base VALUES (0015, '2015-11-02', 002, 011, 'Xiaomi20', 1, 0001);
-- A éviter : produit non listé
INSERT INTO Ventes_base VALUES (0016, '2015-11-02', 002, 004, 'ERREUR', 1, 0001);
