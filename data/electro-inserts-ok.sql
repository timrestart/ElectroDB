
--------------------------------------------------------------------------------
--------------------- ENTREPRISE D'ELECTRONIQUE --------------------------------
--------------------------------------------------------------------------------

--------------------- JEU DE DONNEES -------------------------------------------

INSERT INTO Magasins VALUES (001,'Vinewood','Genoble');	
INSERT INTO Magasins VALUES (002,'Groove Street','Genoble');		
INSERT INTO Magasins VALUES (003,'Victor Hugo','Lyon');	
INSERT INTO Magasins VALUES (004,'Daguerre et Niepce','Lyon');	
INSERT INTO Magasins VALUES (005,'Chilliad','Paris');

INSERT INTO Produits VALUES ('IphoneX', 'mobile', 'Apple', 1099);
INSERT INTO Produits VALUES ('Ipad Pro', 'mobile', 'Apple', 1299);
INSERT INTO Produits VALUES ('Legion5', 'ordinateur', 'Lenovo', 1499);	
INSERT INTO Produits VALUES ('G14', 'ordinateur', 'Acet', 1499);
INSERT INTO Produits VALUES ('Xiaomi20', 'mobile', 'Xioami ', 899);
INSERT INTO Produits VALUES ('Blue Yeti', 'peripherique', 'Samsung', 79);
INSERT INTO Produits VALUES ('Keychron k3', 'peripherique', 'Keychron', 69);
INSERT INTO Produits VALUES ('BasiliksV3', 'peripherique', 'RazerBlade', 49);
INSERT INTO Produits VALUES ('Mac', 'ordinateur', 'Apple ', 1999);

INSERT INTO StocksProduits_base VALUES (001, 'G14', 18);
INSERT INTO StocksProduits_base VALUES (001, 'Legion5', 18);
INSERT INTO StocksProduits_base VALUES (001, 'Mac', 12);
INSERT INTO StocksProduits_base VALUES (002, 'IphoneX', 32);
INSERT INTO StocksProduits_base VALUES (002, 'Ipad Pro', 28);
INSERT INTO StocksProduits_base VALUES (002, 'Xiaomi20', 38);
INSERT INTO StocksProduits_base VALUES (003, 'Blue Yeti', 49);
INSERT INTO StocksProduits_base VALUES (003, 'Keychron k3', 52);
INSERT INTO StocksProduits_base VALUES (003, 'BasiliksV3', 62);
INSERT INTO StocksProduits_base VALUES (004, 'Mac', 18);
INSERT INTO StocksProduits_base VALUES (004, 'IphoneX', 26);
INSERT INTO StocksProduits_base VALUES (004, 'Ipad Pro', 20);
INSERT INTO StocksProduits_base VALUES (005, 'Mac', 20);

INSERT INTO Employes VALUES (001, 'Merveilles', 'Alice', '2015-05-01', 'vendeur', 001);
INSERT INTO Employes VALUES (002, 'Lenon', 'Bob', '2015-05-01', 'technicien', 001);
INSERT INTO Employes VALUES (003, 'Chaplin', 'Charlie', '2017-01-19', 'technicien', 001);
INSERT INTO Employes VALUES (004, 'Duck', 'Donald', '2019-02-19', 'vendeur', 002);
INSERT INTO Employes VALUES (005, 'Queen', 'Elisabeth', '2020-03-02', 'vendeur', 003);
INSERT INTO Employes VALUES (006, 'Clinton', 'Franklin', '2020-03-02', 'vendeur', 004);
INSERT INTO Employes VALUES (007, 'King', 'Georges', '2022-03-05', 'vendeur', 004);
INSERT INTO Employes VALUES (008, 'Potter', 'Harry', '2021-09-20', 'vendeur', 005);

INSERT INTO Clients VALUES (0001, 'Romi', 'Ismael');
INSERT INTO Clients VALUES (0002, 'Cesar', 'Jules');
INSERT INTO Clients VALUES (0003, 'Dupont', 'Kevin');
INSERT INTO Clients VALUES (0004, 'Zodiac', 'Leon');
INSERT INTO Clients VALUES (0005, 'Orel', 'Mark');

INSERT INTO Ventes_base VALUES (0001, '2015-11-02', 002, 004, 'Xiaomi20', 2, 0001);
INSERT INTO Ventes_base VALUES (0002, '2015-12-22', 001, 001, 'G14', 1, 0001);
INSERT INTO Ventes_base VALUES (0003, '2015-12-22', 001, 001, 'Mac', 2, 0002);
INSERT INTO Ventes_base VALUES (0004, '2016-04-02', 003, 005, 'BasiliksV3', 2, 0001);
INSERT INTO Ventes_base VALUES (0005, '2016-11-28', 002, 004, 'IphoneX', 2, 0004);
INSERT INTO Ventes_base VALUES (0006, '2017-02-03', 003, 005, 'Keychron k3', 2, 0001);
INSERT INTO Ventes_base VALUES (0007, '2015-11-02', 003, 005, 'Blue Yeti', 1, 0001);
INSERT INTO Ventes_base VALUES (0008, '2015-11-02', 004, 006, 'Mac', 1, 0005);
INSERT INTO Ventes_base VALUES (0009, '2015-11-02', 004, 006, 'IphoneX', 1, 0002);
INSERT INTO Ventes_base VALUES (0010, '2015-11-02', 004, 006, 'Ipad Pro', 1, 0002);
INSERT INTO Ventes_base VALUES (0011, '2015-11-02', 003, 005, 'Blue Yeti', 1, 0003);
INSERT INTO Ventes_base VALUES (0012, '2015-11-02', 003, 005, 'BasiliksV3', 1, 0001);		


