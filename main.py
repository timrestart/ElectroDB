#!/usr/bin/python3

from re import S
from utils import db
from utils import requests as rq


def main():
    # Nom de la BD à créer
    db_file = "data/electro.db"

    # Créer une connexion a la BD
    con = db.creer_connexion(db_file)

    # Remplir la BD
    print("Création de la DB et initialisation du jeu de données")
    db.mise_a_jour_bd(con, "data/electro-creation.sql")
    db.mise_a_jour_bd(con, "data/electro-inserts-ok.sql")
    print()

    # Exlporer et modifier la BD
    exlporer = input("Commencer à consulter la DB (y/n)\n")
    user = ''
    while exlporer != 'n':
        user = input("\nQue voulez-vous faire ?\n"
                    "n : Arrêter d'explorer la BD\n"
                    "a : Afficher toutes les tables\n"
                    "t : Afficher une ou plusieurs tables\n"
                    "v : Effectuer une vente\n"
                    "c : Enregistrer nouveau un client\n"
                    "p : Lister un nouveau produit\n"
                    "s : Stocker produit dans un magasin\n")

        if user == 'n':
            break
        elif user == 'a':
            rq.afficher_toutes_tables(con)
            exlporer = input("Continuer à consulter la DB (y/n)\n")
        elif user == 't':
            rq_tables = input("Quelle(s) table(s) voulez-vous afficher ? (table1,table2,...)\n").split(",")
            rq.afficher_tables(con, rq_tables)
            exlporer = input("Continuer à consulter la DB (y/n)\n")
        elif user == 'v':
            vente = input("Entrez le numero de la vente:\n")
            date = input("Entrez la date de vente :\n")
            magasin = input("Entrez le numero du magasin où s'effectue la vente :\n")
            employe = input("Entrez le numero du vendeur qui supervise la vente :\n")
            produit = input("Entrez le nom du produit acheté :\n")
            nbArticles = input("Entrez le nombre d'articles commandés pour ce produit :\n")
            client = input("Entrez le numero du client :\n")
            rq.ajouter_vente(con, vente, date, magasin, employe, produit, nbArticles, client)
            rq.afficher_tables(con, ["Ventes_base"])
            exlporer = input("Continuer à consulter la DB (y/n)\n")
        elif user == 'c':
            client = input("Entrez le numero du client :\n")
            nom = input("Entrez le nom du client :\n")
            prenom = input("Entrez le prenom du client :\n")
            rq.ajouter_client(con, client, nom, prenom)
            rq.afficher_tables(con, ["Clients"])
            exlporer = input("Continuer à consulter la DB (y/n)\n")
        elif user == 'p':
            produit = input("Entrez le nom du produit :\n")
            categorie = input("Entrez la catégorie du produit (mobile, ordinateur, peripherique, multimedia):\n")
            marque = input("Entrez la marque du produit :\n")
            prix = input("Entrez le prix de base du produit :\n")
            rq.ajouter_produit(con, produit, categorie, marque, prix)
            rq.afficher_tables(con, ["Produits"])
            exlporer = input("Continuer à consulter la DB (y/n)\n")
        elif user == 's':
            magasin = input("Entrez le numero du magasin :\n")
            produit = input("Entrez le nom du produit :\n")
            stockInit = input("Entrez la quantité de base de ce produit stocké dans ce magasin :\n")
            rq.ajouter_produit_dans_magasin(con, magasin, produit, stockInit)
            rq.afficher_tables(con, ["StocksProduits_base"])
            exlporer = input("Continuer à consulter la DB (y/n)\n")


if __name__ == "__main__":
    main()
