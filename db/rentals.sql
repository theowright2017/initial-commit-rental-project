DROP TABLE rentals;
DROP TABLE stock_items;
DROP TABLE customers;

CREATE TABLE customers
(
  id SERIAL8 primary key,
  name VARCHAR(255)
  -- item_rented VARCHAR
);

CREATE TABLE stock_items
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  manufacturer VARCHAR(255),
  type VARCHAR(255),
  category_cc INT,
  max_speed_mph INT,
  cost_per_week INT,
  image VARCHAR(255)
);

CREATE TABLE rentals
(
  id SERIAL8 primary key,
  customer_id INT8 references customers(id)  ON DELETE CASCADE,
  stock_item_id INT8 references stock_items(id)  ON DELETE CASCADE
);
