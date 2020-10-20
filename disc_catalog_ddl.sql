create table disc_catalog.plastic_ref(
                                         plasticRefId SERIAL PRIMARY KEY,
                                         name VARCHAR(50) NOT NULL,
                                         description VARCHAR(1000) DEFAULT '' NOT NULL
);

create unique index plastic_ref_name_uindex on disc_catalog.plastic_ref (name);

create table disc_catalog.stability_ref(
                                           stabilityRefId SERIAL PRIMARY KEY,
                                           stability VARCHAR(25) NOT NULL,
                                           shortName VARCHAR(10) NOT NULL,
                                           description VARCHAR(1000) DEFAULT '' NOT NULL
);

create unique index stability_ref_stability_uindex on disc_catalog.stability_ref (stability);
create unique index stability_ref_shortName_uindex on disc_catalog.stability_ref (shortName);

create table disc_catalog.brand_ref(
                                       brandRefId SERIAL PRIMARY KEY,
                                       name VARCHAR(50) NOT NULL,
                                       location VARCHAR(50) NOT NULL,
                                       description VARCHAR(1000) DEFAULT '' NOT NULL
);

create unique index brand_ref_name_uindex on disc_catalog.brand_ref (name);

create table disc_catalog.disc(
                                  discId SERIAL PRIMARY KEY,
                                  brandRefId INT NOT NULL,
                                  CONSTRAINT fk_brandRefId
                                      FOREIGN KEY(brandRefId)
                                          REFERENCES disc_catalog.brand_ref(brandRefId),
                                  name VARCHAR(50) NOT NULL,
                                  plasticRefId INT NOT NULL,
                                  CONSTRAINT fk_plasticRefId
                                      FOREIGN KEY(plasticRefId)
                                          REFERENCES disc_catalog.plastic_ref(plasticRefId),
                                  stabilityRefId INT NOT NULL,
                                  CONSTRAINT fk_stabilityRefId
                                      FOREIGN KEY(stabilityRefId)
                                          REFERENCES disc_catalog.stability_ref(stabilityRefId),
                                  speed numeric(4,2) NOT NULL,
                                  glide numeric(4,2) NOT NULL,
                                  turn numeric(4,2) NOT NULL,
                                  fade numeric(4,2) NOT NULL,
                                  isBeaded BOOLEAN DEFAULT FALSE NOT NULL,
                                  isInBag BOOLEAN DEFAULT FALSE NOT NULL,
                                  isCollected BOOLEAN DEFAULT FALSE NOT NULL,
                                  isOwned BOOLEAN DEFAULT FALSE NOT NULL,
                                  description VARCHAR(1000) DEFAULT '' NOT NULL,
                                  notes VARCHAR(1000) DEFAULT '' NOT NULL,
                                  link VARCHAR(1000) DEFAULT '' NOT NULL
);
