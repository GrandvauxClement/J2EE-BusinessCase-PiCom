DROP
ALL OBJECTS;
CREATE SCHEMA IF NOT EXISTS db;

CREATE TABLE country
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name varchar(50),
    phone_indicative varchar(6)
);

CREATE TABLE city
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name varchar(50),
    id_country INT,
    FOREIGN KEY (id_country) REFERENCES country(id)
);

CREATE TABLE roles
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name varchar(10)
);

CREATE TABLE user
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    last_name  varchar(50),
    first_name varchar(50),
    email      varchar(50),
    password   varchar(250),
    phone_number varchar(15),
    is_verified boolean,
    num_siret char(14),
    company_name varchar(50),
    road_name varchar(250),
    postal_code varchar(10),
    id_city INT,
    id_role INT,
    FOREIGN KEY (id_city) REFERENCES city(id),
    FOREIGN KEY (id_role) REFERENCES roles(id)
);

CREATE TABLE ad
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(250),
    image VARCHAR(250),
    text TEXT,
    created_at DATETIME,
    start_date DATE,
    num_days_of_diffusion SMALLINT,
    id_user INT,
    FOREIGN KEY (id_user) REFERENCES user(id)
);

CREATE TABLE time_interval
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    time_slot DOUBLE,
    nbre_ad SMALLINT NULL,
    coef_multi FLOAT
);

CREATE TABLE area
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    price FLOAT
);

CREATE TABLE ad_area
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_ad INT,
    id_area INT,
    FOREIGN KEY (id_ad) REFERENCES ad(id),
    FOREIGN KEY (id_area) REFERENCES area(id)
);

CREATE TABLE ad_time_interval
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_ad_area INT,
    id_time_interval INT,
    FOREIGN KEY (id_ad_area) REFERENCES ad_area(id),
    FOREIGN KEY (id_time_interval) REFERENCES time_interval(id)
);


CREATE TABLE stop
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    latitude FLOAT,
    longitude FLOAT,
    id_area INT,
    address_ip VARCHAR(15) UNIQUE,
    FOREIGN KEY (id_area) REFERENCES area(id)
);

INSERT INTO country (name, phone_indicative) VALUES
       ( 'France', '+33' ),
       ('Angleterre', '+42');

INSERT INTO city (name, id_country) VALUES
      ( 'Lyon', 1 ),
      ('Paris', 1),
      ('Clermont', 1);

INSERT INTO roles (name) VALUES
   ( 'Admin' ),
   ('User');

INSERT INTO user (last_name, first_name, email, password, phone_number, is_verified, num_siret, company_name, road_name, postal_code, id_city, id_role)
VALUES ( 'admin', 'admin', 'admin@admin.com', '$2a$10$mijxhHWPRgXi.eMDB..TgO7S.rwelrs5x6CyuqHuUJFmyqGhOK.8S', '66666666', true, '14242535652521', 'admin', 'rue admin', '69000', 1, 1),
       ('Jack', 'Seller','contact@hb.com', '$2a$10$mijxhHWPRgXi.eMDB..TgO7S.rwelrs5x6CyuqHuUJFmyqGhOK.8S', '385685894', true, '94258436525325', 'hb', 'rue de la formation', '63000', 3, 1 );

INSERT INTO time_interval(time_slot, nbre_ad, coef_multi) VALUES
   (6.7, NULL, 1.8),
   (7.8, NULL, 2.4),
   (8.9, NULL, 2.5),
   (9.10, NULL, 1.8),
   (11.12, NULL, 1.2),
   (12.13, NULL, 2.5),
   (13.14, NULL, 2.4),
   (14.15, NULL, 1.4),
   (15.16, NULL, 1.1),
   (16.17, NULL, 1.4),
   (17.18, NULL, 1.7),
   (18.19, NULL, 1.8),
   (19.20, NULL, 1.9);

INSERT INTO area(name, price) VALUES
  ('Centre-ville', 5.50 ),
  ('Gare SNCF', 5.20),
  ('Ballainvilliers', 3.80),
  ('Chamalières Mairie', 2.70),
  ('Châtaigneraie', 2.90);

INSERT INTO stop(name, latitude, longitude, id_area, address_ip) VALUES
  ( 'centre-ville-1', 45.6584528, 43.98478557, 1, '197.25.65.01' ),
  ( 'centre-ville-2', 45.6584528, 43.98478557, 1, '197.25.65.02' ),
  ( 'centre-ville-3', 45.6584528, 43.98478557, 1, '192.25.65.03' ),
  ( 'centre-ville-4', 45.6584528, 43.98478557, 1, '197.23.65.03' ),
  ( 'centre-ville-5', 45.6584528, 43.98478557, 1, '197.25.68.04' ),
  ( 'Gare SNCF (quai 1)', 45.6584528, 43.98478557, 2, '197.25.68.05' ),
  ( 'Gare SNCF (quai 2)', 45.6584528, 43.98478557, 2, '197.25.68.06' ),
  ( 'Gare SNCF (quai 3)', 45.6584528, 43.98478557, 2, '197.25.68.07' ),
  ( 'Gare SNCF (quai 4)', 45.6584528, 43.98478557, 2, '197.25.68.08' ),
  ( 'Parc SNCF (quai 8)', 45.6584528, 43.98478557, 2, '197.25.68.09' ),
  ( 'Parc SNCF (quai 9)', 45.6584528, 43.98478557, 2, '197.25.68.10' ),
  ( 'Esplanade', 45.6584528, 43.98478557, 2, '197.25.68.11' ),
  ( 'Carnot', 45.6584528, 43.98478557, 2, '197.25.68.12' ),
  ( 'Fleury', 45.6584528, 43.98478557, 2, '197.25.68.13' ),
  ( 'Cartoucherie', 45.6584528, 43.98478557, 2, '197.25.68.14' ),
  ( 'Vertaizon', 45.6584528, 43.98478557, 2, '197.25.68.15' ),
  ( 'Hôtel de ville', 45.6584528, 43.98478557, 3, '197.25.68.16' ),
  ( 'Gaillard', 45.6584528, 43.98478557, 3, '197.25.68.17' ),
  ( 'Jaude', 45.6584528, 43.98478557, 3, '197.25.68.18' ),
  ( 'Lagarlaye', 45.6584528, 43.98478557, 3, '197.25.68.19' ),
  ( 'Ballaivilliers', 45.6584528, 43.98478557, 3, '197.25.68.20' ),
  ( 'Michel de l Hospital', 45.6584528, 43.98478557, 3, '197.25.68.21' ),
  ( 'Pl. Royale', 45.6584528, 43.98478557, 3, '197.25.68.22' ),
  ( 'Jules Guesde', 45.6584528, 43.98478557, 4, '197.25.68.23' ),
  ( 'St André', 45.6584528, 43.98478557, 4, '197.25.68.24' ),
  ( 'Chamalières Mairie', 45.6584528, 43.98478557, 4, '197.25.68.25' ),
  ( 'Parc Montjoly', 45.6584528, 43.98478557, 4, '197.25.68.26' ),
  ( 'Europe', 45.6584528, 43.98478557, 4, '197.25.68.27' ),
  ( 'Fontmaure Europe', 45.6584528, 43.98478557, 4, '197.25.68.28' ),
  ( 'Teilhard de Chardin', 45.6584528, 43.98478557, 4, '197.25.68.29' ),
  ( 'Châtaigneraie', 45.6584528, 43.98478557, 5, '197.25.68.30' ),
  ( 'Chaussades', 45.6584528, 43.98478557, 5, '197.25.68.31' ),
  ( 'Chapelle de l agneau', 45.6584528, 43.98478557, 5, '197.25.68.32' ),
  ( 'Les Roches', 45.6584528, 43.98478557, 5, '197.25.68.33' );

INSERT INTO ad(title, image, text, created_at, start_date, num_days_of_diffusion, id_user) VALUES
   ('Venez decouvrir la savane', 'discover-jungle.jpg', 'Spot publicitaire disponible, inscrivez vous sur picom.fr ou contacter nous au 0352958457', '2022-04-20', '2022-04-28', 20, 1),
   ('Votre super coiffeur', 'lyon_hair_shop.jpg', 'Lorem ipsum super texte de l annonce 2 qui va servir de description', '2022-04-20', '2022-04-30', 30, 1),
   ('Encore Malade ?', 'ted-sick.jpg', 'Lorem ipsum super texte de l annonce 2 qui va servir de description', '2022-04-21', '2022-05-30', 60, 1),
   ('Campagne nike', 'nike.png', 'Lorem ipsum super texte de l annonce 2 qui va servir de description', '2022-05-12', '2022-05-15', 60, 1);

INSERT INTO ad_area(id_ad, id_area) VALUES
   (1, 1),
   (1, 2),
   (2, 1),
   (3, 1),
   (3, 3),
   (4, 2),
   (4, 3);

INSERT INTO ad_time_interval(id_ad_area, id_time_interval) VALUES
   (1, 2),
   (1, 4),
   (2, 7),
   (2, 1),
   (3, 5),
   (3, 6),
   (4, 3),
   (4, 6),
   (5, 4),
   (5, 8),
   (5, 12),
   (6, 2),
   (6, 11),
   (7, 4),
   (7, 5),
   (7, 9),
   (7, 11);