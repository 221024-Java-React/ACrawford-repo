-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Customer" (
    "customer_id" int   NOT NULL,
    "name" string   NOT NULL,
    "email" string   NOT NULL,
    "password" string   NOT NULL,
    "address" string   NOT NULL,
    "phone_number" string   NOT NULL,
    CONSTRAINT "pk_Customer" PRIMARY KEY (
        "customer_id"
     )
);

CREATE TABLE "Address" (
    "address_id" int   NOT NULL,
    "street" string   NOT NULL,
    "city" string   NOT NULL,
    "country" string   NOT NULL,
    "zipcode" int   NOT NULL,
    CONSTRAINT "pk_Address" PRIMARY KEY (
        "address_id"
     )
);

CREATE TABLE "Customer_Address_Junction" (
    "customer_id" int   NOT NULL,
    "address_id" int   NOT NULL
);

-- Products and Customers need a many to many relationship
CREATE TABLE "Product" (
    "product_id" int   NOT NULL,
    "title" varchar(200)   NOT NULL,
    "price" money   NOT NULL,
    "image" image   NOT NULL,
    "quantity" int   NOT NULL,
    "description" string   NOT NULL,
    "modified_date" date   NOT NULL,
    "category_id" int   NOT NULL,
    "flexible_price" money   NOT NULL,
    CONSTRAINT "pk_Product" PRIMARY KEY (
        "product_id"
     )
);

CREATE TABLE "Product_Category_Junction" (
    "product_id" int   NOT NULL,
    "category_id" int   NOT NULL,
    "flexible_price" money   NOT NULL
);

CREATE TABLE "Order" (
    "order_id" int   NOT NULL,
    "product_id" int   NOT NULL,
    "customer_id" int   NOT NULL,
    "order_status_id" int   NOT NULL,
    "created_date" date   NOT NULL,
    "total_price" money   NOT NULL,
    "total_items" int   NOT NULL,
    "tax" money   NOT NULL,
    "shipping_price" money   NOT NULL,
    CONSTRAINT "pk_Order" PRIMARY KEY (
        "order_id"
     )
);

CREATE TABLE "OrderStatus" (
    "order_status_id" int   NOT NULL,
    "name" string   NOT NULL,
    "description" string   NOT NULL,
    CONSTRAINT "pk_OrderStatus" PRIMARY KEY (
        "order_status_id"
     ),
    CONSTRAINT "uc_OrderStatus_name" UNIQUE (
        "name"
    )
);

CREATE TABLE "Payments" (
    "payment_id" int   NOT NULL,
    "customer_id" int   NOT NULL,
    "credit_card_num" string   NOT NULL,
    "expire_date" date   NOT NULL,
    "cvv" int   NOT NULL,
    CONSTRAINT "pk_Payments" PRIMARY KEY (
        "payment_id"
     )
);

ALTER TABLE "Customer" ADD CONSTRAINT "fk_Customer_address" FOREIGN KEY("address")
REFERENCES "Address" ("address_id");

ALTER TABLE "Customer_Address_Junction" ADD CONSTRAINT "fk_Customer_Address_Junction_customer_id" FOREIGN KEY("customer_id")
REFERENCES "Customer" ("customer_id");

ALTER TABLE "Customer_Address_Junction" ADD CONSTRAINT "fk_Customer_Address_Junction_address_id" FOREIGN KEY("address_id")
REFERENCES "Address" ("address_id");

ALTER TABLE "Product_Category_Junction" ADD CONSTRAINT "fk_Product_Category_Junction_product_id" FOREIGN KEY("product_id")
REFERENCES "Product" ("product_id");

ALTER TABLE "Order" ADD CONSTRAINT "fk_Order_product_id" FOREIGN KEY("product_id")
REFERENCES "Product" ("product_id");

ALTER TABLE "Order" ADD CONSTRAINT "fk_Order_customer_id" FOREIGN KEY("customer_id")
REFERENCES "Customer" ("customer_id");

ALTER TABLE "Order" ADD CONSTRAINT "fk_Order_order_status_id" FOREIGN KEY("order_status_id")
REFERENCES "OrderStatus" ("order_status_id");

ALTER TABLE "Payments" ADD CONSTRAINT "fk_Payments_customer_id" FOREIGN KEY("customer_id")
REFERENCES "Customer" ("customer_id");

