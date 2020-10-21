create table disc_catalog.plastic_ref(
                                         plasticrefid SERIAL PRIMARY KEY,
                                         plasticname VARCHAR(50) NOT NULL,
                                         description VARCHAR(1000) DEFAULT '' NOT NULL
);

create unique index plastic_ref_name_uindex on disc_catalog.plastic_ref (plasticname);

create table disc_catalog.stability_ref(
                                           stabilityrefid SERIAL PRIMARY KEY,
                                           stability VARCHAR(25) NOT NULL,
                                           shortname VARCHAR(10) NOT NULL,
                                           description VARCHAR(1000) DEFAULT '' NOT NULL
);

create unique index stability_ref_stability_uindex on disc_catalog.stability_ref (stability);
create unique index stability_ref_shortName_uindex on disc_catalog.stability_ref (shortname);

create table disc_catalog.brand_ref(
                                       brandrefid SERIAL PRIMARY KEY,
                                       brandname VARCHAR(50) NOT NULL,
                                       location VARCHAR(50) NOT NULL,
                                       description VARCHAR(1000) DEFAULT '' NOT NULL
);

create unique index brand_ref_name_uindex on disc_catalog.brand_ref (brandname);

create table disc_catalog.disc(
                                  discId SERIAL PRIMARY KEY,
                                  brandrefid INT NOT NULL,
                                  CONSTRAINT fk_brandrefid
                                      FOREIGN KEY(brandrefid)
                                          REFERENCES disc_catalog.brand_ref(brandrefid),
                                  discname VARCHAR(50) NOT NULL,
                                  plasticrefid INT NOT NULL,
                                  CONSTRAINT fk_plasticrefid
                                      FOREIGN KEY(plasticrefid)
                                          REFERENCES disc_catalog.plastic_ref(plasticrefid),
                                  stabilityrefid INT NOT NULL,
                                  CONSTRAINT fk_stabilityrefid
                                      FOREIGN KEY(stabilityrefid)
                                          REFERENCES disc_catalog.stability_ref(stabilityrefid),
                                  speed numeric(4,2) NOT NULL,
                                  glide numeric(4,2) NOT NULL,
                                  turn numeric(4,2) NOT NULL,
                                  fade numeric(4,2) NOT NULL,
                                  isbeaded BOOLEAN DEFAULT FALSE NOT NULL,
                                  iscollected BOOLEAN DEFAULT FALSE NOT NULL,
                                  isowned BOOLEAN DEFAULT FALSE NOT NULL,
                                  description VARCHAR(1000) DEFAULT '' NOT NULL,
                                  notes VARCHAR(1000) DEFAULT '' NOT NULL,
                                  link VARCHAR(1000) DEFAULT '' NOT NULL
);
