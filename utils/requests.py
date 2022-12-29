from pydoc import cli
import sqlite3


# renvoie la liste des tables
def afficher_liste_tables(con):
    cur = con.cursor()
    cur.execute("SELECT name FROM sqlite_master WHERE type='table';")
    tables = []

    for table in cur.fetchall():
        tables.append(table[0])

    return tables


# affiche le contenue de chacune des tables
def afficher_toutes_tables(con):
    cur = con.cursor()
    tables = afficher_liste_tables(con)

    for table in tables:
        print(table)
        cur.execute(f"SELECT * FROM {table}")
        rows = cur.fetchall()
        for row in rows:
            print(row)


# afficher le contenue des tables donnees en paramètres
def afficher_tables(con, rq_tables):
    cur = con.cursor()
    tables = afficher_liste_tables(con)

    for rq_table in rq_tables:
        if rq_table in tables:
            print(rq_table)
            cur.execute(f"SELECT * FROM {rq_table}")
            rows = cur.fetchall()
            for row in rows:
                print(row)


# ajouter une vente dans la table Ventes_base
def ajouter_vente(con, vente, date, magasin, employe, produit, nbArticles, client):
    cur = con.cursor()
    cur.execute(f"INSERT INTO Ventes_base VALUES ({vente}, \'{date}\', {magasin}, {employe}, \'{produit}\', {nbArticles}, {client});")


# ajouter un client dans la table Clients
def ajouter_client(con, client, nom, prenom):
    cur = con.cursor()
    cur.execute(f"INSERT INTO Clients VALUES ({client}, \'{nom}\', \'{prenom}\');")


# ajouter un produit dans la table Produits
def ajouter_produit(con, produit, categorie, marque, prix):
    cur = con.cursor()
    cur.execute(f"INSERT INTO Produits VALUES (\'{produit}\', \'{categorie}\', \'{marque}\', {prix});")


# ajouter un produit dans un magasin
def ajouter_produit_dans_magasin(con, magasin, produit, stockInit):
    cur = con.cursor()
    cur.execute(f"INSERT INTO StocksProduits_base VALUES ({magasin}, \'{produit}\', {stockInit});")