create extension if not exists pgcrypto;
--create function for getting data from bounded tables
CREATE OR REPLACE FUNCTION get_id_from_table(element_number integer, table_name regclass,column_name varchar(20))
    RETURNS uuid AS $$
DECLARE result_id uuid;
BEGIN
    EXECUTE format('SELECT (SELECT %s FROM %s LIMIT 1 OFFSET $1)::uuid',  column_name ,table_name)
        INTO result_id
        USING element_number;

    RETURN result_id;
END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- Inserting into the BonusPoints table
INSERT INTO bonus_points (points)
VALUES (100),
       (111),
       (23),
       (234),
       ( 23),
       ( 45),
       (89),
       ( 68),
       ( 200),
       ( 190),
       ( 500),
       ( 45),
       (0),
       (0),
       ( 0),
       ( 0);
--
INSERT INTO app_user (username, password, email, registration_date, total_purchase_amount,bonus_points_id)
VALUES (  'john_doe', 'password123', 'john.doe@gmail.com', '2024-02-07', 100,(SELECT get_id_from_table(0, 'bonus_points','bonus_points_id')) ),
       ('jane_smith', 'abc123', 'jane.smith@gmail.com', '2024-02-07', 111,(SELECT get_id_from_table(1, 'bonus_points','bonus_points_id'))),
       ('mike_jackson', 'pass456', 'mike.jackson@gmail.com', '2024-02-07', 23,(SELECT get_id_from_table(2, 'bonus_points','bonus_points_id'))),
       ('emily_davis', 'password789', 'emily.davis@gmail.com', '2024-02-07', 234,(SELECT get_id_from_table(3, 'bonus_points','bonus_points_id'))),
       ('michael_brown', 'securepassword', 'michael.brown@gmail.com', '2024-02-07', 23,(SELECT get_id_from_table(4, 'bonus_points','bonus_points_id'))),
       ('sarah_johnson', 'p@ssw0rd', 'sarah.johnson@gmail.com', '2024-02-07', 45 ,(SELECT get_id_from_table(5, 'bonus_points','bonus_points_id'))),
       ('alexander_wilson', 'password2024', 'alexander.wilson@gmail.com', '2024-02-07', 89,(SELECT get_id_from_table(6, 'bonus_points','bonus_points_id')) ),
       ('olivia_martin', 'qwerty123', 'olivia.martin@gmail.com', '2024-02-07', 68,(SELECT get_id_from_table(7, 'bonus_points','bonus_points_id'))),
       ('william_taylor', 'letmein', 'william.taylor@gmail.com', '2024-02-07', 200,(SELECT get_id_from_table(8, 'bonus_points','bonus_points_id'))),
       ('amelia_anderson', 'iloveyou', 'amelia.anderson@gmail.com', '2024-02-07', 190,(SELECT get_id_from_table(9, 'bonus_points','bonus_points_id'))),
       ('david_thomas', 'password1234', 'david.thomas@gmail.com', '2024-02-07', 500,(SELECT get_id_from_table(10, 'bonus_points','bonus_points_id'))),
       ('sophia_white', 'password2023', 'sophia.white@gmail.com', '2024-02-07', 45,(SELECT get_id_from_table(11, 'bonus_points','bonus_points_id'))),
       ('james_martinez', 'abc123', 'james.martinez@gmail.com', '2024-02-07', 0,(SELECT get_id_from_table(12, 'bonus_points','bonus_points_id'))),
       ('emma_thompson', 'password567', 'emma.thompson@gmail.com', '2024-02-07', 0,(SELECT get_id_from_table(13, 'bonus_points','bonus_points_id'))),
       ('ethan_hernandez', 'welcome123', 'ethan.hernandez@gmail.com', '2024-02-07', 0,(SELECT get_id_from_table(14, 'bonus_points','bonus_points_id'))),
       ('ava_garcia', 'letmein2024', 'ava.garcia@gmail.com', '2024-02-07', 0,(SELECT get_id_from_table(15, 'bonus_points','bonus_points_id')));


--
--
-- Додавання даних до таблиці Categories
INSERT INTO categories (name_categories, description)
VALUES ('Smartphones',
        'The latest smartphones with cutting-edge technology and features for communication and entertainment.'),
       ('Computers', 'Powerful desktop computers for work, gaming, and multimedia tasks.'),
       ('Laptops', 'Portable laptops for productivity on the go, with sleek designs and long-lasting battery life.'),
       ('Accessories for laptops and PCs',
        'A range of accessories including bags, cases, keyboards, and mice to enhance your laptop or PC experience.'),
       ('Appliances for the home',
        'Essential appliances for everyday living, including vacuum cleaners, irons, and more.'),
       ('Kitchen appliances', 'Innovative kitchen gadgets and appliances to simplify cooking and food preparation.'),
       ('For gamers', 'Products and accessories specifically tailored for gamers, including gaming consoles, peripherals, gaming chairs, and more.');

-- --Додавання даних до таблиці Provider
-- INSERT INTO provider (name_company, country)
-- VALUES ('TechSupplier', 'USA'),
--        ('TechWarehouse', 'USA'),
--        ('GadgetEmporium', 'China'),
--        ('PCParadise', 'China'),
--        ('ElectroMart', 'Germany'),
--        ('HomeTechSolutions', 'Germany'),
--        ('KitchenTech', 'Italy'),
--        ('CulinaryAppliances', 'Italy'),
--        ('GameMaster', 'Japan'),
--        ('GamerZone', 'Japan');
--
--
-- -- Додавання даних до таблиці Product
INSERT INTO product (name_product, description, price, stock_quantity)
VALUES ('iPhone 13 Pro', 'The latest flagship smartphone from Apple with advanced features and stunning design',
        1099.99, 50),
       ('Samsung Galaxy S22 Ultra', 'Powerful Android smartphone with a high-quality camera and impressive performance',
        1199.99, 40),
       ('Dell XPS 15', 'Premium laptop with a stunning display, powerful performance, and sleek design', 1499.99, 30),
       ('Lenovo ThinkPad X1 Carbon', 'Ultra-lightweight and durable laptop for professionals', 1299.99, 25),
       ('Logitech MX Master 3', 'Advanced wireless mouse with customizable buttons and ergonomic design', 99.99, 100),
       ('Razer BlackShark V2', 'High-performance gaming headset with THX 7.1 Surround Sound', 129.99, 50),
       ('Dyson V11 Absolute',
        'Powerful cordless vacuum cleaner with advanced filtration and intelligent cleaning modes', 599.99, 20),
       ('Rowenta DW5080 Focus', 'Steam iron with stainless steel soleplate for precise ironing', 79.99, 50),
       ('Breville Smart Oven Air', 'Versatile countertop oven with air frying and dehydrating functions', 349.99, 15),
       ('KitchenAid Stand Mixer', 'Iconic stand mixer for effortless mixing and baking', 399.99, 30),
       ('Nintendo Switch OLED', 'Enhanced version of the popular gaming console with a vibrant OLED display', 349.99,
        50),
       ('Sony PlayStation 5', 'Next-generation gaming console with ultra-fast SSD and immersive gaming experiences',
        499.99, 30),
       ('Google Pixel 6 Pro', 'Flagship smartphone with advanced camera features and Google Assistant integration',
        899.99, 35),
       ('HP Spectre x360', 'Convertible laptop with a sleek design and powerful performance', 1399.99, 20),
       ('Microsoft Surface Laptop 4', 'Thin and light laptop with a high-resolution touchscreen display', 1299.99, 25),
       ('Corsair K95 RGB Platinum XT', 'Mechanical gaming keyboard with customizable RGB lighting', 179.99, 50),
       ('Logitech G502 HERO', 'High-performance gaming mouse with customizable weight and sensitivity', 69.99, 75),
       ('JBL Flip 5', 'Portable Bluetooth speaker with powerful sound and waterproof design', 119.99, 100),
       ('iRobot Roomba i7+', 'Smart robot vacuum cleaner with self-emptying bin and advanced mapping', 799.99, 10),
       ('Instant Pot Duo Crisp', 'Multi-functional pressure cooker with air frying capabilities', 179.99, 40),
       ('Ninja Foodi Grill', 'Indoor grill with air frying and roasting functions for versatile cooking', 199.99, 30),
       ('Cuisinart Coffee Maker', 'Programmable coffee maker with built-in grinder for freshly brewed coffee', 99.99,
        50),
       ('Sony WH-1000XM4', 'Premium noise-canceling headphones with long battery life and immersive sound', 349.99, 20),
       ('Bose QuietComfort Earbuds',
        'Wireless earbuds with active noise cancellation for immersive listening experience', 279.99, 30),
       ('LG OLED C1 Series', 'High-end OLED TV with stunning picture quality and smart TV features', 1999.99, 15),
       ('Apple Watch Series 7', 'Advanced smartwatch with fitness tracking, ECG, and blood oxygen monitoring', 399.99,
        20),
       ('Fitbit Charge 5', 'Fitness tracker with built-in GPS and heart rate monitoring for active lifestyles', 179.99,
        50),
       ('Apple MacBook Air', 'Ultra-thin and lightweight laptop with Retina display and Touch ID', 999.99, 15),
       ('Samsung Odyssey G7', 'Curved gaming monitor with QLED technology and fast response time', 699.99, 20),
       ('Philips Hue Starter Kit', 'Smart lighting system with color-changing bulbs and voice control', 199.99, 30),
       ('Anker PowerCore 26800', 'High-capacity portable charger with fast charging technology', 59.99, 50),
       ('Bose SoundLink Revolve+', 'Portable Bluetooth speaker with 360-degree sound and water-resistant design',
        299.99, 25),
       ('Nikon D850', 'Professional DSLR camera with high-resolution sensor and 4K video recording', 2999.99, 10),
       ('Sony Alpha A7 III', 'Mirrorless camera with fast autofocus and high-performance image sensor', 1999.99, 15),
       ('DJI Mavic Air 2', 'Compact drone with 4K camera and intelligent flight modes', 799.99, 10);


--
-- INSERT INTO product_categories (product_id, categories_id)
-- VALUES
--
--     ((SELECT * FROM get_id_from_table(0, 'product', 'product_id')), (SELECT * FROM get_id_from_table(0, 'categories', 'categories_id'))),
--     ((SELECT * FROM get_id_from_table(1, 'product', 'product_id')), (SELECT * FROM get_id_from_table(1, 'categories', 'categories_id'))),
--     ((SELECT * FROM get_id_from_table(2, 'product', 'product_id')), (SELECT * FROM get_id_from_table(2, 'categories', 'categories_id'))),
--     ((SELECT * FROM get_id_from_table(3, 'product', 'product_id')), (SELECT * FROM get_id_from_table(3, 'categories', 'categories_id'))),
--     ((SELECT * FROM get_id_from_table(4, 'product', 'product_id')), (SELECT * FROM get_id_from_table(4, 'categories', 'categories_id'))),
--     ((SELECT * FROM get_id_from_table(5, 'product','product_id')), (SELECT * FROM get_id_from_table(3, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(6, 'product','product_id')), (SELECT * FROM get_id_from_table(0, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(7, 'product','product_id')), (SELECT * FROM get_id_from_table(1, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(8, 'product','product_id')), (SELECT * FROM get_id_from_table(2, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(9, 'product','product_id')), (SELECT * FROM get_id_from_table(3, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(10, 'product','product_id')), (SELECT * FROM get_id_from_table(4, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(11, 'product','product_id')), (SELECT * FROM get_id_from_table(3, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(12, 'product','product_id')), (SELECT * FROM get_id_from_table(1, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(13, 'product','product_id')), (SELECT * FROM get_id_from_table(0, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(14, 'product','product_id')), (SELECT * FROM get_id_from_table(2, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(15, 'product','product_id')), (SELECT * FROM get_id_from_table(0, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(16, 'product','product_id')), (SELECT * FROM get_id_from_table(1, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(17, 'product','product_id')), (SELECT * FROM get_id_from_table(2, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(18, 'product','product_id')), (SELECT * FROM get_id_from_table(3, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(19, 'product','product_id')), (SELECT * FROM get_id_from_table(5, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(20, 'product','product_id')), (SELECT * FROM get_id_from_table(6, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(21, 'product','product_id')), (SELECT * FROM get_id_from_table(6, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(22, 'product','product_id')), (SELECT * FROM get_id_from_table(6, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(23, 'product','product_id')), (SELECT * FROM get_id_from_table(6, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(24, 'product','product_id')), (SELECT * FROM get_id_from_table(5, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(25, 'product','product_id')), (SELECT * FROM get_id_from_table(5, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(26, 'product','product_id')), (SELECT * FROM get_id_from_table(5, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(27, 'product','product_id')), (SELECT * FROM get_id_from_table(5, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(28, 'product','product_id')), (SELECT * FROM get_id_from_table(4, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(29, 'product','product_id')), (SELECT * FROM get_id_from_table(3, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(30, 'product','product_id')), (SELECT * FROM get_id_from_table(1, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(31, 'product','product_id')), (SELECT * FROM get_id_from_table(0, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(32, 'product','product_id')), (SELECT * FROM get_id_from_table(2, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(33, 'product','product_id')), (SELECT * FROM get_id_from_table(1, 'categories','categories_id'))),
--     ((SELECT * FROM get_id_from_table(34, 'product','product_id')), (SELECT * FROM get_id_from_table(0, 'categories','categories_id')));
--


--
--
--
--
-- INSERT INTO product_provider ( product_id,provider_id)
-- VALUES
--     ((SELECT * FROM get_id_from_table(0, 'product','product_id')), (SELECT * FROM get_id_from_table(2, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(1, 'product','product_id')), (SELECT * FROM get_id_from_table(1, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(2, 'product','product_id')), (SELECT * FROM get_id_from_table(2, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(3, 'product','product_id')), (SELECT * FROM get_id_from_table(3, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(4, 'product','product_id')), (SELECT * FROM get_id_from_table(4, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(5, 'product','product_id')), (SELECT * FROM get_id_from_table(3, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(4, 'product','product_id')), (SELECT * FROM get_id_from_table(1, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(4, 'product','product_id')), (SELECT * FROM get_id_from_table(0, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(5, 'product','product_id')), (SELECT * FROM get_id_from_table(2, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(6, 'product','product_id')), (SELECT * FROM get_id_from_table(0, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(7, 'product','product_id')), (SELECT * FROM get_id_from_table(1, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(8, 'product','product_id')), (SELECT * FROM get_id_from_table(2, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(9, 'product','product_id')), (SELECT * FROM get_id_from_table(3, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(10, 'product','product_id')), (SELECT * FROM get_id_from_table(4, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(11, 'product','product_id')), (SELECT * FROM get_id_from_table(3, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(12, 'product','product_id')), (SELECT * FROM get_id_from_table(1, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(13, 'product','product_id')), (SELECT * FROM get_id_from_table(0, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(14, 'product','product_id')), (SELECT * FROM get_id_from_table(2, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(15, 'product','product_id')), (SELECT * FROM get_id_from_table(0, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(16, 'product','product_id')), (SELECT * FROM get_id_from_table(1, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(17, 'product','product_id')), (SELECT * FROM get_id_from_table(2, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(18, 'product','product_id')), (SELECT * FROM get_id_from_table(3, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(19, 'product','product_id')), (SELECT * FROM get_id_from_table(5, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(20, 'product','product_id')), (SELECT * FROM get_id_from_table(6, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(21, 'product','product_id')), (SELECT * FROM get_id_from_table(6, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(22, 'product','product_id')), (SELECT * FROM get_id_from_table(6, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(23, 'product','product_id')), (SELECT * FROM get_id_from_table(6, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(24, 'product','product_id')), (SELECT * FROM get_id_from_table(5, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(25, 'product','product_id')), (SELECT * FROM get_id_from_table(5, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(26, 'product','product_id')), (SELECT * FROM get_id_from_table(5, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(27, 'product','product_id')), (SELECT * FROM get_id_from_table(5, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(28, 'product','product_id')), (SELECT * FROM get_id_from_table(4, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(29, 'product','product_id')), (SELECT * FROM get_id_from_table(3, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(30, 'product','product_id')), (SELECT * FROM get_id_from_table(1, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(31, 'product','product_id')), (SELECT * FROM get_id_from_table(0, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(32, 'product','product_id')), (SELECT * FROM get_id_from_table(2, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(33, 'product','product_id')), (SELECT * FROM get_id_from_table(1, 'provider','provider_id'))),
--     ((SELECT * FROM get_id_from_table(34, 'product','product_id')), (SELECT * FROM get_id_from_table(4, 'provider','provider_id')));
--
--
-- --Додавання даних до таблиці Favoritesapp_user
-- INSERT INTO Favorites (product_id,user_id)
-- VALUES      ((SELECT * FROM get_id_from_table(0, 'product','product_id')), (SELECT * FROM get_id_from_table(0, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(1, 'product','product_id')), (SELECT * FROM get_id_from_table(1, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(2, 'product','product_id')), (SELECT * FROM get_id_from_table(2, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(3, 'product','product_id')), (SELECT * FROM get_id_from_table(3, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(4, 'product','product_id')), (SELECT * FROM get_id_from_table(4, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(5, 'product','product_id')), (SELECT * FROM get_id_from_table(8, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(4, 'product','product_id')), (SELECT * FROM get_id_from_table(9, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(4, 'product','product_id')), (SELECT * FROM get_id_from_table(12, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(5, 'product','product_id')), (SELECT * FROM get_id_from_table(12, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(6, 'product','product_id')), (SELECT * FROM get_id_from_table(13, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(7, 'product','product_id')), (SELECT * FROM get_id_from_table(14, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(8, 'product','product_id')), (SELECT * FROM get_id_from_table(15, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(9, 'product','product_id')), (SELECT * FROM get_id_from_table(11, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(10, 'product','product_id')), (SELECT * FROM get_id_from_table(10, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(11, 'product','product_id')), (SELECT * FROM get_id_from_table(3, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(12, 'product','product_id')), (SELECT * FROM get_id_from_table(1, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(13, 'product','product_id')), (SELECT * FROM get_id_from_table(9, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(14, 'product','product_id')), (SELECT * FROM get_id_from_table(2, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(15, 'product','product_id')), (SELECT * FROM get_id_from_table(8, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(16, 'product','product_id')), (SELECT * FROM get_id_from_table(1, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(17, 'product','product_id')), (SELECT * FROM get_id_from_table(7, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(18, 'product','product_id')), (SELECT * FROM get_id_from_table(3, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(19, 'product','product_id')), (SELECT * FROM get_id_from_table(8, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(20, 'product','product_id')), (SELECT * FROM get_id_from_table(6, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(21, 'product','product_id')), (SELECT * FROM get_id_from_table(11, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(22, 'product','product_id')), (SELECT * FROM get_id_from_table(6, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(23, 'product','product_id')), (SELECT * FROM get_id_from_table(10, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(24, 'product','product_id')), (SELECT * FROM get_id_from_table(14, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(25, 'product','product_id')), (SELECT * FROM get_id_from_table(5, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(26, 'product','product_id')), (SELECT * FROM get_id_from_table(12, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(27, 'product','product_id')), (SELECT * FROM get_id_from_table(5, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(28, 'product','product_id')), (SELECT * FROM get_id_from_table(4, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(29, 'product','product_id')), (SELECT * FROM get_id_from_table(13, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(30, 'product','product_id')), (SELECT * FROM get_id_from_table(1, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(31, 'product','product_id')), (SELECT * FROM get_id_from_table(0, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(32, 'product','product_id')), (SELECT * FROM get_id_from_table(15, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(33, 'product','product_id')), (SELECT * FROM get_id_from_table(1, 'app_user','user_id'))),
--             ((SELECT * FROM get_id_from_table(34, 'product','product_id')), (SELECT * FROM get_id_from_table(0, 'app_user','user_id')));
--
--
--
-- -- Додавання даних до таблиці Orders
-- INSERT INTO orders (product_id,user_id,order_status,  order_date)
-- VALUES ((SELECT * FROM get_id_from_table(0, 'product','product_id')),(SELECT * FROM get_id_from_table(1, 'app_user','user_id')),'pending',  '2024-02-09'),
--        ((SELECT * FROM get_id_from_table(2, 'product','product_id')),(SELECT * FROM get_id_from_table(2, 'app_user','user_id')),'completed',  '2024-02-09'),
--        ((SELECT * FROM get_id_from_table(3, 'product','product_id')),(SELECT * FROM get_id_from_table(3, 'app_user','user_id')),'pending',  '2024-02-09'),
--        ((SELECT * FROM get_id_from_table(4, 'product','product_id')),(SELECT * FROM get_id_from_table(4, 'app_user','user_id')),'completed',  '2024-02-09'),
--        ((SELECT * FROM get_id_from_table(6, 'product','product_id')),(SELECT * FROM get_id_from_table(5, 'app_user','user_id')),'pending',  '2024-02-09'),
--        ((SELECT * FROM get_id_from_table(7, 'product','product_id')),(SELECT * FROM get_id_from_table(6, 'app_user','user_id')),'completed',  '2024-02-09'),
--        ((SELECT * FROM get_id_from_table(8, 'product','product_id')),(SELECT * FROM get_id_from_table(7, 'app_user','user_id')),'pending',  '2024-02-09'),
--        ((SELECT * FROM get_id_from_table(9, 'product','product_id')),(SELECT * FROM get_id_from_table(8, 'app_user','user_id')),'completed',  '2024-02-09'),
--        ((SELECT * FROM get_id_from_table(2, 'product','product_id')),(SELECT * FROM get_id_from_table(9, 'app_user','user_id')),'pending',  '2024-02-09'),
--        ((SELECT * FROM get_id_from_table(3, 'product','product_id')),(SELECT * FROM get_id_from_table(10, 'app_user','user_id')),'completed',  '2024-02-09'),
--        ((SELECT * FROM get_id_from_table(6, 'product','product_id')),(SELECT * FROM get_id_from_table(11, 'app_user','user_id')),'pending',  '2024-02-09'),
--        ((SELECT * FROM get_id_from_table(4, 'product','product_id')),(SELECT * FROM get_id_from_table(12, 'app_user','user_id')),'completed',  '2024-02-09'),
--        ((SELECT * FROM get_id_from_table(6, 'product','product_id')),(SELECT * FROM get_id_from_table(14, 'app_user','user_id')),'pending',  '2024-02-09'),
--        ((SELECT * FROM get_id_from_table(7, 'product','product_id')),(SELECT * FROM get_id_from_table(13, 'app_user','user_id')),'completed',  '2024-02-09'),
--        ((SELECT * FROM get_id_from_table(8, 'product','product_id')),(SELECT * FROM get_id_from_table(0, 'app_user','user_id')),'pending',  '2024-02-09'),
--        ((SELECT * FROM get_id_from_table(33, 'product','product_id')),(SELECT * FROM get_id_from_table(2, 'app_user','user_id')),'completed',  '2024-02-09'),
--        ((SELECT * FROM get_id_from_table(31, 'product','product_id')),(SELECT * FROM get_id_from_table(3, 'app_user','user_id')),'pending',  '2024-02-09'),
--        ((SELECT * FROM get_id_from_table(12, 'product','product_id')),(SELECT * FROM get_id_from_table(4, 'app_user','user_id')),'completed',  '2024-02-09');
--
--
-- INSERT INTO reviews (product_id,user_id,rating, comment)
-- VALUES
--     ((SELECT * FROM get_id_from_table(3, 'product','product_id')),(SELECT * FROM get_id_from_table(1, 'app_user','user_id')),4, 'Good value for the price.'),
--     ((SELECT * FROM get_id_from_table(12, 'product','product_id')),(SELECT * FROM get_id_from_table(2, 'app_user','user_id')),3, 'Average product, nothing special.'),
--     ((SELECT * FROM get_id_from_table(11, 'product','product_id')),(SELECT * FROM get_id_from_table(3, 'app_user','user_id')),5, 'Love it! Best purchase ever.'),
--     ((SELECT * FROM get_id_from_table(14, 'product','product_id')),(SELECT * FROM get_id_from_table(4, 'app_user','user_id')),4, 'Good quality, fast delivery.'),
--     ((SELECT * FROM get_id_from_table(15, 'product','product_id')),(SELECT * FROM get_id_from_table(5, 'app_user','user_id')),5, 'Amazing product, highly recommend!'),
--     ((SELECT * FROM get_id_from_table(16, 'product','product_id')),(SELECT * FROM get_id_from_table(6, 'app_user','user_id')),3, 'Not as expected, had some issues.'),
--     ((SELECT * FROM get_id_from_table(17, 'product','product_id')),(SELECT * FROM get_id_from_table(7, 'app_user','user_id')),5, 'Great customer service, very satisfied.'),
--     ((SELECT * FROM get_id_from_table(18, 'product','product_id')),(SELECT * FROM get_id_from_table(8, 'app_user','user_id')),4, 'Nice product, good value for money.'),
--     ((SELECT * FROM get_id_from_table(19, 'product','product_id')),(SELECT * FROM get_id_from_table(9, 'app_user','user_id')),5, 'Absolutely love it! Great purchase.'),
--     ((SELECT * FROM get_id_from_table(2,'product','product_id')),(SELECT * FROM get_id_from_table(10, 'app_user','user_id')),2, 'Disappointed with the quality.'),
--     ((SELECT * FROM get_id_from_table(1, 'product','product_id')),(SELECT * FROM get_id_from_table(11, 'app_user','user_id')),5, 'Excellent product, exceeded expectations.'),
--     ((SELECT * FROM get_id_from_table(4, 'product','product_id')),(SELECT * FROM get_id_from_table(12,'app_user','user_id')),4, 'Good quality, fast shipping.'),
--     ((SELECT * FROM get_id_from_table(5, 'product','product_id')),(SELECT * FROM get_id_from_table(13, 'app_user','user_id')),5, 'Very satisfied with the purchase!'),
--     ((SELECT * FROM get_id_from_table(6, 'product','product_id')),(SELECT * FROM get_id_from_table(14, 'app_user','user_id')),3, 'Not bad, but could be better.'),
--     ((SELECT * FROM get_id_from_table(20, 'product','product_id')),(SELECT * FROM get_id_from_table(15, 'app_user','user_id')),5, 'Amazing product, highly recommend!'),
--     ((SELECT * FROM get_id_from_table(21, 'product','product_id')),(SELECT * FROM get_id_from_table(1, 'app_user','user_id')),4, 'Good quality, fast delivery.'),
--     ((SELECT * FROM get_id_from_table(22, 'product','product_id')),(SELECT * FROM get_id_from_table(2, 'app_user','user_id')),3, 'Average product, nothing special.'),
--     ((SELECT * FROM get_id_from_table(26, 'product','product_id')),(SELECT * FROM get_id_from_table(3, 'app_user','user_id')),5, 'Love it! Best purchase ever.'),
--     ((SELECT * FROM get_id_from_table(29, 'product','product_id')),(SELECT * FROM get_id_from_table(4, 'app_user','user_id')),4, 'Good quality, fast shipping.'),
--     ((SELECT * FROM get_id_from_table(30, 'product','product_id')),(SELECT * FROM get_id_from_table(5, 'app_user','user_id')),5, 'Very satisfied with the purchase!'),
--     ((SELECT * FROM get_id_from_table(8, 'product','product_id')),(SELECT * FROM get_id_from_table(6, 'app_user','user_id')),3, 'Not bad, but could be better.');
--

-- INSERT INTO shopping_cart (user_id,product_id,date_cart, quantity)
-- VALUES ((SELECT get_id_from_table(0, 'app_user','user_id')), (SELECT get_id_from_table(0, 'product','product_id')), NOW()::timestamp, 1),
--        ((SELECT get_id_from_table(1, 'app_user','user_id')), (SELECT get_id_from_table(1, 'product','product_id')), NOW()::timestamp, 2),
--        ((SELECT get_id_from_table(3, 'app_user','user_id')), (SELECT get_id_from_table(2, 'product','product_id')), NOW()::timestamp, 3),
--        ((SELECT get_id_from_table(4, 'app_user','user_id')), (SELECT get_id_from_table(3, 'product','product_id')), NOW()::timestamp, 4),
--        ((SELECT get_id_from_table(3, 'app_user','user_id')), (SELECT get_id_from_table(4, 'product','product_id')), NOW()::timestamp, 5),
--        ((SELECT get_id_from_table(6, 'app_user','user_id')), (SELECT get_id_from_table(5, 'product','product_id')), NOW()::timestamp, 2),
--        ((SELECT get_id_from_table(7, 'app_user','user_id')), (SELECT get_id_from_table(6, 'product','product_id')), NOW()::timestamp, 1),
--        ((SELECT get_id_from_table(8, 'app_user','user_id')), (SELECT get_id_from_table(17, 'product','product_id')), NOW()::timestamp, 2),
--        ((SELECT get_id_from_table(9, 'app_user','user_id')), (SELECT get_id_from_table(7, 'product','product_id')), NOW()::timestamp, 3),
--        ((SELECT get_id_from_table(10, 'app_user','user_id')), (SELECT get_id_from_table(8, 'product','product_id')), NOW()::timestamp, 4),
--        ((SELECT get_id_from_table(11, 'app_user','user_id')), (SELECT get_id_from_table(9, 'product','product_id')), NOW()::timestamp, 5),
--        ((SELECT get_id_from_table(12, 'app_user','user_id')), (SELECT get_id_from_table(10, 'product','product_id')), NOW()::timestamp, 2),
--        ((SELECT get_id_from_table(14, 'app_user','user_id')), (SELECT get_id_from_table(11, 'product','product_id')), NOW()::timestamp, 1),
--        ((SELECT get_id_from_table(13, 'app_user','user_id')), (SELECT get_id_from_table(12, 'product','product_id')), NOW()::timestamp, 2),
--        ((SELECT get_id_from_table(15, 'app_user','user_id')), (SELECT get_id_from_table(13, 'product','product_id')), NOW()::timestamp, 3),
--        ((SELECT get_id_from_table(4, 'app_user','user_id')), (SELECT get_id_from_table(14, 'product','product_id')), NOW()::timestamp, 4),
--        ((SELECT get_id_from_table(3, 'app_user','user_id')), (SELECT get_id_from_table(15, 'product','product_id')), NOW()::timestamp, 5),
--        ((SELECT get_id_from_table(2, 'app_user','user_id')), (SELECT get_id_from_table(16, 'product','product_id')), NOW()::timestamp, 2);
--
