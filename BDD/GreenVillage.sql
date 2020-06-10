CREATE TABLE commercial(
  Id_commercial INT NOT NULL AUTO_INCREMENT UNIQUE,
  nom_admin VARCHAR(50) NOT NULL UNIQUE,
  pass_admin VARCHAR(50) NOT NULL,
  reduc_admin VARCHAR(50),
  role_commercial VARCHAR(50) NOT NULL,
  PRIMARY KEY(Id_commercial)
);

CREATE TABLE Commande(
  Id_Com INT NOT NULL AUTO_INCREMENT UNIQUE,
  nbr_prod VARCHAR(50) NOT NULL,
  date_paie DATE,
  etat_com VARCHAR(50),
  mod_com VARCHAR(50),
  prix_uni DECIMAL(15, 2),
  pro_qte INT,
  total_ht DECIMAL(15, 2),
  TVA INT,
  PRIMARY KEY(Id_Com)
);

CREATE TABLE Livraison(
  Id_livr INT NOT NULL AUTO_INCREMENT UNIQUE,
  date_livr DATE,
  stat_livr VARCHAR(50),
  fact_livr VARCHAR(50),
  bon_livr VARCHAR(50),
  PRIMARY KEY(Id_livr)
);

CREATE TABLE Fournisseur(
  Id_Four INT NOT NULL AUTO_INCREMENT UNIQUE,
  prix_ht_four DECIMAL(15, 2),
  Id_commercial INT NOT NULL,
  PRIMARY KEY(Id_Four),
  FOREIGN KEY(Id_commercial) REFERENCES commercial(Id_commercial)
);

CREATE TABLE Catalogue(
  Id_prod INT NOT NULL AUTO_INCREMENT UNIQUE,
  nom_prod VARCHAR(50) NOT NULL,
  libellec_prod VARCHAR(50) NOT NULL,
  libellel_prod VARCHAR(50),
  ref_prod VARCHAR(50) NOT NULL UNIQUE,
  desc_prod VARCHAR(50),
  stock_prod INT NOT NULL,
  prix_ht_prod DECIMAL(15, 2) NOT NULL,
  photo_prod VARCHAR(50),
  date_modif_prod DATE,
  date_ajout_prod DATE NOT NULL,
  PRIMARY KEY(Id_prod)
);

CREATE TABLE Users(
  Id_user INT NOT NULL AUTO_INCREMENT UNIQUE,
  nom_user VARCHAR(50) NOT NULL UNIQUE,
  pass_user VARCHAR(16) NOT NULL,
  role_user VARCHAR(50),
  PRIMARY KEY(Id_user)
);

CREATE TABLE Categories(
  id_cat INT NOT NULL AUTO_INCREMENT UNIQUE,
  nom_cat VARCHAR(50) NOT NULL UNIQUE,
  parent_cat INT NOT NULL,
  PRIMARY KEY(id_cat)
);

CREATE TABLE Client(
  Id_cli INT NOT NULL AUTO_INCREMENT UNIQUE,
  nom_cli VARCHAR(50),
  nom_entr VARCHAR(50),
  contact_entr VARCHAR(50),
  adrs_liv_cli VARCHAR(50) NOT NULL,
  adrs_fact_cli VARCHAR(50),
  num_tele_cli VARCHAR(50),
  mail_cli VARCHAR(130) NOT NULL UNIQUE,
  adrs_liv_entr VARCHAR(50),
  code_cli INT,
  code_entr INT,
  adrs_fact_entr VARCHAR(50),
  Id_user INT NOT NULL,
  PRIMARY KEY(Id_cli),
  FOREIGN KEY(Id_user) REFERENCES Users(Id_user)
);

CREATE TABLE Expedier(
  Id_livr INT,
  Id_Four INT,
  PRIMARY KEY(Id_livr, Id_Four),
  FOREIGN KEY(Id_livr) REFERENCES Livraison(Id_livr),
  FOREIGN KEY(Id_Four) REFERENCES Fournisseur(Id_Four)
);

CREATE TABLE livrer(
  Id_livr INT,
  Id_cli INT,
  PRIMARY KEY(Id_livr, Id_cli),
  FOREIGN KEY(Id_livr) REFERENCES Livraison(Id_livr),
  FOREIGN KEY(Id_cli) REFERENCES Client(Id_cli)
);

CREATE TABLE attribuer(
  Id_commercial INT,
  Id_user INT,
  PRIMARY KEY(Id_commercial, Id_user),
  FOREIGN KEY(Id_commercial) REFERENCES commercial(Id_commercial),
  FOREIGN KEY(Id_user) REFERENCES Users(Id_user)
);

CREATE TABLE choisir(
  Id_prod INT,
  Id_user INT,
  PRIMARY KEY(Id_prod, Id_user),
  FOREIGN KEY(Id_prod) REFERENCES Catalogue(Id_prod),
  FOREIGN KEY(Id_user) REFERENCES Users(Id_user)
);

CREATE TABLE Commander(
  Id_Com INT,
  Id_prod INT,
  PRIMARY KEY(Id_Com, Id_prod),
  FOREIGN KEY(Id_Com) REFERENCES Commande(Id_Com),
  FOREIGN KEY(Id_prod) REFERENCES Catalogue(Id_prod)
);

CREATE TABLE Compta(
  Id_commercial INT,
  Id_Com INT,
  PRIMARY KEY(Id_commercial, Id_Com),
  FOREIGN KEY(Id_commercial) REFERENCES commercial(Id_commercial),
  FOREIGN KEY(Id_Com) REFERENCES Commande(Id_Com)
);

CREATE TABLE Appartient(
  Id_prod INT,
  id_cat INT,
  PRIMARY KEY(Id_prod, id_cat),
  FOREIGN KEY(Id_prod) REFERENCES Catalogue(Id_prod),
  FOREIGN KEY(id_cat) REFERENCES Categories(id_cat)
);