﻿CREATE DATABASE catering;

CREATE SCHEMA public;

CREATE TABLE client (
    id BIGSERIAL NOT NULL
            CONSTRAINT client_id_pk
                PRIMARY KEY,
    name VARCHAR (25) NOT NULL
);

CREATE TABLE catering_point (
    id BIGSERIAL NOT NULL
            CONSTRAINT catering_point_id_pk
                PRIMARY KEY,
    name VARCHAR (25) NOT NULL
);

CREATE TABLE client_catering_point (
    id BIGSERIAL NOT NULL
            CONSTRAINT client_catering_point_id_pk
                PRIMARY KEY,
    client_id INTEGER NOT NULL,
    catering_point_id INTEGER NOT NULL,
    day_of_week INTEGER NOT NULL
        CHECK (day_of_week BETWEEN 1 AND 7),
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT fk_client
        FOREIGN KEY (client_id)
            REFERENCES client(id),
    CONSTRAINT fk_catering_point
        FOREIGN KEY (catering_point_id)
            REFERENCES catering_point(id)
);

CREATE UNIQUE INDEX client_id_idx on client (id);
CREATE UNIQUE INDEX catering_point_id_idx on catering_point (id);
CREATE UNIQUE INDEX client_catering_point_id_idx on client_catering_point (id);

INSERT INTO catering_point (id, name) VALUES (1, 'Ultimate Food');
INSERT INTO catering_point (id, name) VALUES (2, 'Cater Me Mexican');
INSERT INTO catering_point (id, name) VALUES (3, 'The Better Caterer');
INSERT INTO catering_point (id, name) VALUES (4, 'Catering Masters');
INSERT INTO catering_point (id, name) VALUES (5, 'Cater Nation');

INSERT INTO client (id, name) VALUES (1, 'VK');
INSERT INTO client (id, name) VALUES (2, 'Yandex');
INSERT INTO client (id, name) VALUES (3, 'EPAM');
INSERT INTO client (id, name) VALUES (4, 'Google');
INSERT INTO client (id, name) VALUES (5, 'Ubisoft');
INSERT INTO client (id, name) VALUES (6, 'DevSoft');

INSERT INTO client_catering_point (client_id, catering_point_id, day_of_week) VALUES (1, 2, 1);
INSERT INTO client_catering_point (client_id, catering_point_id, day_of_week) VALUES (5, 4, 5);
INSERT INTO client_catering_point (client_id, catering_point_id, day_of_week) VALUES (5, 3, 4);
INSERT INTO client_catering_point (client_id, catering_point_id, day_of_week) VALUES (5, 1, 2);
INSERT INTO client_catering_point (client_id, catering_point_id, day_of_week) VALUES (3, 5, 1);
INSERT INTO client_catering_point (client_id, catering_point_id, day_of_week) VALUES (3, 5, 2);
INSERT INTO client_catering_point (client_id, catering_point_id, day_of_week) VALUES (3, 5, 3);
INSERT INTO client_catering_point (client_id, catering_point_id, day_of_week) VALUES (3, 5, 4);
INSERT INTO client_catering_point (client_id, catering_point_id, day_of_week) VALUES (3, 5, 5);
INSERT INTO client_catering_point (client_id, catering_point_id, day_of_week) VALUES (3, 5, 6);
INSERT INTO client_catering_point (client_id, catering_point_id, day_of_week) VALUES (6, 1, 6);
INSERT INTO client_catering_point (client_id, catering_point_id, day_of_week, is_deleted) VALUES (6, 5, 3, TRUE);