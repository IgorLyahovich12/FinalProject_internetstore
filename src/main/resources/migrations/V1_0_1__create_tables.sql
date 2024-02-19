CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS bonus_points (
                                            bonus_points_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
                                            points INTEGER
);
CREATE TABLE IF NOT EXISTS app_user (
                                        user_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
                                        username VARCHAR NOT NULL,
                                        password VARCHAR NOT NULL,
                                        email VARCHAR NOT NULL,
                                        registration_date DATE,
                                        total_purchase_amount DOUBLE PRECISION,
                                        bonus_points_id UUID REFERENCES bonus_points(bonus_points_id)
);
 CREATE INDEX IF NOT EXISTS user_bonus_points_idx ON app_user (bonus_points_id);
-- Для таблиці Categories
CREATE TABLE IF NOT EXISTS categories (
                                          categories_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
                                          name_categories VARCHAR(255),
                                          description VARCHAR(10000)
);

-- Для таблиці Provider
CREATE TABLE IF NOT EXISTS provider (
                                        provider_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
                                        name_company VARCHAR,
                                        country VARCHAR
);


-- Для таблиці Product
CREATE TABLE IF NOT EXISTS product (
                                       product_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
                                       name_product VARCHAR,
                                       description VARCHAR(10000),
                                       price DOUBLE PRECISION,
                                       stock_quantity INTEGER
);


CREATE TABLE IF NOT EXISTS product_categories (
                                                  categories_id UUID NOT NULL,
                                                  product_id UUID NOT NULL,
                                                  PRIMARY KEY (categories_id, product_id),
                                                  FOREIGN KEY (categories_id) REFERENCES categories(categories_id),
                                                  FOREIGN KEY (product_id) REFERENCES product(product_id)
);
 CREATE INDEX IF NOT EXISTS products_categories_category_idx ON product_categories (categories_id);
 CREATE INDEX IF NOT EXISTS products_categories_product_idx ON product_categories (product_id);




-- Create the table for linking products and providers
CREATE TABLE IF NOT EXISTS product_provider (
                                                provider_id UUID NOT NULL,
                                                product_id UUID NOT NULL,
                                                PRIMARY KEY (provider_id, product_id),
                                                FOREIGN KEY (provider_id) REFERENCES provider(provider_id),
                                                FOREIGN KEY (product_id) REFERENCES product(product_id)
);
 CREATE INDEX IF NOT EXISTS product_provider_product_idx ON product_provider (product_id);
 CREATE INDEX IF NOT EXISTS product_provider_provider_idx ON product_provider (provider_id);

-- Create the table for favorites
CREATE TABLE IF NOT EXISTS favorites (
                                         favorites_id UUID DEFAULT uuid_generate_v4(),

                                         user_id UUID REFERENCES app_user(user_id),
                                         product_id UUID REFERENCES product(product_id),
                                         PRIMARY KEY (favorites_id)
);
 CREATE INDEX IF NOT EXISTS favorites_user_idx ON favorites (user_id);
 CREATE INDEX IF NOT EXISTS favorites_product_idx ON favorites (product_id);


-- Create the table for orders
CREATE TABLE IF NOT EXISTS orders (
                                      order_id UUID DEFAULT uuid_generate_v4(),
                                      order_status VARCHAR,
                                      product_id UUID REFERENCES product(product_id),
                                      order_date DATE,
                                      user_id UUID REFERENCES app_user(user_id),
                                      PRIMARY KEY (order_id)
);
 CREATE INDEX IF NOT EXISTS orders_user_idx ON orders (user_id);
 CREATE INDEX IF NOT EXISTS orders_product_idx ON orders (product_id);



-- Create the table for reviews
CREATE TABLE IF NOT EXISTS reviews (
                                       reviews_id UUID DEFAULT uuid_generate_v4(),
                                       rating INTEGER,
                                       comment TEXT,
                                       user_id UUID REFERENCES app_user(user_id),
                                       product_id UUID REFERENCES product(product_id),
                                       PRIMARY KEY (reviews_id)
);
 CREATE INDEX IF NOT EXISTS reviews_user_idx ON reviews (user_id);
 CREATE INDEX IF NOT EXISTS reviews_product_idx ON reviews (product_id);

-- Create the table for the shopping cart
CREATE TABLE IF NOT EXISTS shopping_cart (
                                             product_id UUID REFERENCES product(product_id),
                                             user_id UUID REFERENCES app_user(user_id),
                                             date_cart DATE,
                                             quantity INTEGER,
                                             PRIMARY KEY (product_id, user_id)
);
 CREATE INDEX IF NOT EXISTS shopping_cart_user_idx ON shopping_cart (user_id);
 CREATE INDEX IF NOT EXISTS shopping_cart_product_idx ON shopping_cart (product_id);