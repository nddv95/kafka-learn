use kafka_test_db;

CREATE TABLE tbl_customer (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  phone_number varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  email varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE tbl_product (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  sku varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  cost double NOT NULL DEFAULT 0,
  price double NOT NULL DEFAULT 0,
  photo_url varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE tbl_orders (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  customer_id bigint(20) unsigned DEFAULT NULL,
  order_code varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY order_code_unique (order_code),
  KEY tbl_orders_customer_id_foreign (customer_id),
  CONSTRAINT tbl_orders_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES tbl_customer (id) ON DELETE SET NULL
);

CREATE TABLE tbl_order_detail (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  order_id bigint(20) unsigned NOT NULL,
  product_id bigint(20) unsigned NOT NULL,
  size varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  quantity int(11) NOT NULL DEFAULT 0,
  price_sale double NOT NULL DEFAULT 0,
  discount double NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  UNIQUE KEY tbl_order_detail_product_id_order_id_size_unique (product_id,order_id,size),
  KEY tbl_order_detail_order_id_foreign (order_id),
  CONSTRAINT tbl_order_detail_order_id_foreign FOREIGN KEY (order_id) REFERENCES tbl_orders (id) ON DELETE CASCADE,
  CONSTRAINT tbl_order_detail_product_id_foreign FOREIGN KEY (product_id) REFERENCES tbl_product (id) ON DELETE CASCADE
);