create schema disc_catalog collate utf8_general_ci;

DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS contacts;

create table disc_catalog.flight_ref(
    flightRefId SERIAL PRIMARY KEY,
    stability VARCHAR(25) NOT NULL,
    speed numeric(4,2) NOT NULL,
    glide numeric(4,2) NOT NULL,
    turn numeric(4,2) NOT NULL,
    fade numeric(4,2) NOT NULL
);

create table disc_catalog.disc(
    discId SERIAL PRIMARY KEY,
    brand VARCHAR(25) NOT NULL,
    name VARCHAR(50) NOT NULL,
    plastic VARCHAR(25),
    flightRefId INT NOT NULL,
    CONSTRAINT fk_flight_ref
        FOREIGN KEY(flightRefId)
            REFERENCES disc_catalog.flight_ref(flightRefId),
    isInBag BOOLEAN DEFAULT FALSE NOT NULL,
    isCollected BOOLEAN DEFAULT FALSE NOT NULL,
    isOwned BOOLEAN DEFAULT FALSE NOT NULL,
    description VARCHAR(1000) DEFAULT '' NOT NULL,
    notes VARCHAR(1000) DEFAULT '' NOT NULL,
    link VARCHAR(1000) DEFAULT '' NOT NULL
);


