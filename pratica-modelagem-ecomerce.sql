CREATE TABLE "public.customers" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL UNIQUE,
	CONSTRAINT "customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"price" FLOAT NOT NULL,
	"image" TEXT NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.clothingCategories" (
	"id" serial NOT NULL,
	"name" serial NOT NULL UNIQUE,
	CONSTRAINT "clothingCategories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.clothingSize" (
	"id" serial NOT NULL,
	"name" serial(2) NOT NULL,
	CONSTRAINT "clothingSize_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.clothes" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"categoryId" integer NOT NULL,
	"sizeId" integer NOT NULL,
	"productId" integer NOT NULL,
	CONSTRAINT "clothes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchaseInformation" (
	"id" serial NOT NULL,
	"date" serial NOT NULL DEFAULT 'now()',
	"address" TEXT NOT NULL,
	"customerId" integer NOT NULL,
	"productId" BINARY NOT NULL,
	"quantity" integer NOT NULL,
	"status" TEXT NOT NULL,
	CONSTRAINT "purchaseInformation_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);







ALTER TABLE "clothes" ADD CONSTRAINT "clothes_fk0" FOREIGN KEY ("categoryId") REFERENCES "clothingCategories"("id");
ALTER TABLE "clothes" ADD CONSTRAINT "clothes_fk1" FOREIGN KEY ("sizeId") REFERENCES "clothingSize"("id");
ALTER TABLE "clothes" ADD CONSTRAINT "clothes_fk2" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "purchaseInformation" ADD CONSTRAINT "purchaseInformation_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");
ALTER TABLE "purchaseInformation" ADD CONSTRAINT "purchaseInformation_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");







