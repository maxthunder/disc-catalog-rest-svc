INSERT INTO disc_catalog.brand_ref(brandname, location, description) VALUES
('Axiom', 'Marlette, Michigan', 'Axiom is a disc golf brand manufactured by MVP. Axiom utilizes gyro technology and multiple color options to create discs that fly well and look great.'),
('DGA', 'California', 'Disc Golf Association (DGA) offers a full product line of quality disc golf discs. They use Discraft for manufacturing and feature great plastic blends and a variety of discs for all purposes. The Blowfly and Gumputt putters are made of the most unique and flexible material, while the drivers, and mids are usually presented in premium, durable plastics. Note: DGA uses weight stickers that feature a weight range (for example 170-172). When we list the discs on our website, we list the lower weight in the range for consistency, but the actual weight of the disc could fall anywhere in the range on the sticker.'),
('Discmania', 'Colorado','Discmania offers some of the best disc golf discs on the market. They have headquarters in Colorado, but work closely with Innova, Latitude 64 and Yikun to produce and manufacture their discs with their own unique designs. Discmania Originals are produced by Innova Champion Discs in California. The Discmania Evolution Line is produced by Latitude 64 in Sweden. The Discmania Active Line is produced by Yikun Discs in China.'),
('Discraft', 'USA', 'Discraft is the second largest manufacturer of golf discs in the United States, and offers a full product line of every imaginable type of disc. Discraft produces six different plastic blends and make some of the least expensive and highest quality golf discs. They have discs designed for beginners, intermediate players, and professionals.'),
('Dynamic Discs', 'Emporia, Kansas', 'Dynamic Discs is one of the leading brands in disc golf. Located in Emporia Kansas, they partner with Latitude 64 in Sweden to distribute some of the best discs on all of disc golf. If you like high quality discs from a brand that focuses on growing disc golf, consider trying Dynamic Discs.'),
('Gateway', null, 'Gateway Disc Sports provides quality and innovative disc golf discs. They offer a full line of golf discs, and offer several of the top rated putters including the popular Wizard. Gateway also has a special line of light weight golf disc that are perfect for children and beginners. These discs are very inexpensive, and offer a great way to get started with the exciting sport of disc golf.'),
('Infinite Discs', 'USA','Infinite Discs are manufactured by Innova Champion Discs. Each disc is designed and manufactured to fill precise niches and needs in every disc golf bag. Most Infinite Discs models are designed for players at all levels, while some discs will be fine-tuned for the specific demands of experienced throwers. Every run specifies the run number and includes the total number of discs manufactured. This information helps throwers find consistency and allows collectors to know the rarity of their discs.'),
('Innova', null, 'Innova is one of the world''s largest manufacturer of disc golf discs. A full line of quality discs including distance drivers, fairway drivers, mid-range, approach discs, and putters in all stability ratings and plastic types. All the Innova discs we have for sale are below.'),
('Latitude 64', 'Sweden', 'Latitude 64 manufacturers premium golf discs in Sweden. Latitude 64 has become well known in the United States as a result of their premium disc manufacturing and attractive final product. Many disc golfers feel that Latitude 64 produces the most superior plastic blends available. '),
('MVP', 'Marlette, Michigan', 'Maple Valley Plastics, located in Marlette, Michigan, creates premium plastic discs. These discs are unique in the fact that they use two different plastics on each disc, this GYRO technology affects aerodynamics, linear momentum and angular momentum. MVP discs is one of the fastest growing disc golf manufacturers and includes dozens of disc molds and plastic varieties.'),
('Prodigy', null, 'Prodigy Disc provides high quality golf discs, supported by some of the worlds top disc golf professionals. They offer a full lineup of golf discs in varying stability and multiple plastic bends. Prodigy discs are well known for their grippy plastic feel and easy release technology. In 2019 they released their Ace Line discs which include additional molds manufactured overseas and available at a lower price.'),
('Streamline', null, 'Streamline Discs is the third brand in the MVP family. Unlike MVP and Axiom, which focus on double mold gyro technology, Streamline uses single mold technology to provide quality, premium plastic at the most affordable cost on the market. Streamline discs use the familiar plastic names Neutron and Proton that are familiar with the overmold discs.'),
('Westside', null, 'Westside provides a full lineup of premium golf discs, including some very high quality fast flying drivers. The King, World, Destiny, and Catapult all have speed ratings of14. Westside Discs originated by Finland but is now owned by Latitude 64 and Dynamic Discs.');

INSERT INTO disc_catalog.stability_ref(stability, shortname) VALUES
('Understable', 'US'),
('Stable', 'SS'),
('Overstable', 'OS'),
('Very Overstable', 'OS+');

INSERT INTO disc_catalog.plastic_ref(plasticname, description) VALUES
('Neutron', 'Most popular. Flagship blend offering a premium look and feel. Widest selection of bright opaque colors. Shares great durability characteristics of Proton. Easy-to-find colors in any given terrain.'),
('Cosmic Neutron', 'Premium color enhanced Neutron blend. Plethora of bright color swirls. Shares durability with Neutron and Proton. Unique color blends are great for custom stamping'),
('Proton', 'High durability for a long consistent life. Designed to withstand the roughest conditions. Transparent candy colors. Also available in soft flexibility for putters'),
('Plasma', 'Metallic sheen on core plastic. Semi-gummy, grippy flex polymer. Highly durable premium blend. “Color-shift” tones in select color options'),
('Eclipse', 'High durability for a long consistent life. Designed to withstand the roughest conditions. Transparent candy colors. Also available in soft flexibility for putters.'),
('Electron', 'Tactile boutique blends for superb grip. Designed to wear slowly with use. Added glide and neutral flight with wear. Also available in soft flexibility for putters.'),
('Cosmic Electron', 'Cosmic Ray patterns with multi-tone colors. Tactile boutique blends for superb grip. Added glide and neutral flight with wear. Available in Soft, Medium, and Firm flexibility for putters.'),
('Star', 'Our Star line is created with a special blend of grippy, resilient polymers. Star plastic offers the same outstanding durability of our regular Champion plastic, plus improved grip like our Pro plastic. Star discs have the same flight characteristics as Champion discs, but are slightly less firm. High performance, longevity, and superior grip make Innova Star line discs a great choice for your game. Many Star line discs are available for custom hot stamping.'),
('Echo Star', 'In an effort to minimize waste, we created a product with great characteristics that is also environmentally friendly. Echo Star plastic has shown that reprocessed plastic can be blended into high performance discs that players want. Made up of a blend of high-tech recycled plastic with a minimum of 50% pre-consumer waste plastic, each Echo Star disc has nearly the same durability as our premium plastics with a superior grip. Provides predictable performance. Long-lasting durability even on wooded or rugged courses. Good all-weather grip, Ideal for those who like the durability of Champion plastic with the superior grip of Pro plastic, Retains flight characteristics longer than DX or Pro Plastics. Best plastic for use with the INNColor process. Most models available for Custom Hot-Stamping');

INSERT INTO disc_catalog.disc(brandrefid, discname, plasticrefid, stabilityrefid, speed, glide, turn, fade, isbeaded, iscollected, isowned, description, link) VALUES
(
    (SELECT brandrefid FROM disc_catalog.brand_ref WHERE brand_ref.name = 'Axiom'),
    'Envy',
    (SELECT plasticrefid FROM disc_catalog.plastic_ref WHERE plastic_ref.name = 'Cosmic Electron'),
    (SELECT stabilityrefid FROM disc_catalog.stability_ref WHERE shortname = 'OS'),
    2.7,
    3.1,
    -0.1,
    1.9,
    FALSE,
    TRUE,
    TRUE,
    'The Axiom Envy is the first putt & approach disc in the new Axiom line. Compared with the MVP Ion and Anode, this disc is beefier and has a thicker wing. The Envy is a slower, more overstable, putter that is stable at high speeds with a dependable drop. It is described as a uniquely “lid-like” putter. This new disc will still feature MVP’s overmold GYRO technology.',
    'https://infinitediscs.com/Axiom-Envy'
);

