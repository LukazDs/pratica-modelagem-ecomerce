CREATE TABLE "public.customers" (
	"id" SERIAL NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL UNIQUE,
	CONSTRAINT "customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.products" (
	"id" SERIAL NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"price" FLOAT NOT NULL,
	"image" TEXT NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.clothingCategories" (
	"id" SERIAL NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "clothingCategories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.clothingSize" (
	"id" SERIAL NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "clothingSize_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.clothes" (
	"id" SERIAL NOT NULL,
	"name" TEXT NOT NULL,
	"categoryId" integer NOT NULL,
	"sizeId" INTEGER NOT NULL,
	"productId" INTEGER NOT NULL,
	CONSTRAINT "clothes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TYPE "type" AS ENUM ('created', 'pay', 'delivered', 'canceled'));

CREATE TABLE "public.purchaseInformation" (
	"id" SERIAL NOT NULL,
	"date" DATE NOT NULL DEFAULT now(),
	"address" TEXT NOT NULL,
	"customerId" INTEGER NOT NULL,
	"productId" INTEGER NOT NULL,
	"quantity" INTEGER NOT NULL,
	"status" "type" NOT NULL,
	CONSTRAINT "purchaseInformation_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "clothes" ADD CONSTRAINT "clothes_fk0" FOREIGN KEY ("categoryId") REFERENCES "clothingCategories"("id");
ALTER TABLE "clothes" ADD CONSTRAINT "clothes_fk1" FOREIGN KEY ("sizeId") REFERENCES "clothingSize"("id");
ALTER TABLE "clothes" ADD CONSTRAINT "clothes_fk2" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "purchaseInformation" ADD CONSTRAINT "purchaseInformation_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");
ALTER TABLE "purchaseInformation" ADD CONSTRAINT "purchaseInformation_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");
