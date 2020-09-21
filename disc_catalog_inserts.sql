
-- Envy
INSERT INTO disc_catalog.flight_ref(stability, speed, glide, turn, fade) VALUES ('OS', 2.7, 3.1, -0.1, 1.9);
INSERT INTO disc_catalog.disc(name,brand,plastic,flightRefId,isInBag,isCollected,isOwned,description,link)
    VALUES (
            'Axiom', 'Envy', 'Electron',
            (SELECT flightRefId FROM disc_catalog.flight_ref WHERE speed = 2.7 AND glide = 3.1),
            true, true, true,
            'The Axiom Envy is the first putt & approach disc in the new Axiom line. Compared with the MVP Ion and Anode, this disc is beefier and has a thicker wing. The Envy is a slower, more overstable, putter that is stable at high speeds with a dependable drop. It is described as a uniquely “lid-like” putter. This new disc will still feature MVP’s overmold GYRO technology.',
            'https://infinitediscs.com/Axiom-Envy'
            );

-- Vanish
INSERT INTO disc_catalog.flight_ref(stability, speed, glide, turn, fade) VALUES ('US', 11.5, 5, -2.7, 1.9);
INSERT INTO disc_catalog.disc(name,brand,plastic,flightRefId,isInBag,isCollected,isOwned,description,link)
VALUES (
           'Axiom', 'Vanish', 'Proton',
           (SELECT flightRefId FROM disc_catalog.flight_ref WHERE speed = 11.5 AND glide = 5),
           true,  true, true,
           'The Vanish is a straight to understable disc depending on the thrower and wind conditions.  The Vanish’s stability profile places it near a threshold of being straight at low power or in tailwinds, and controllably understable at high power or in mild headwinds.  As a 21.5mm class GYRO™ driver, the Vanish is designed to hit a midpoint of stability between two MVP Disc Sports models, the Wave and Orbital.  The Vanish will debut in grippy opaque dual-color Neutron plastic.',
           'https://infinitediscs.com/Axiom-Vanish'
       );


