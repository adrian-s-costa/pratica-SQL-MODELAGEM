CREATE DATABASE bank;

CREATE TABLE "states" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT UNIQUE NOT NULL
);

CREATE TABLE "cities" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"stateId" INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE "customers" (
	"id" SERIAL PRIMARY KEY,
	"fullName" TEXT NOT NULL,
	"cpf" TEXT NOT NULL UNIQUE,
	"email" TEXT NOT NULL,
	"password" TEXT NOT NULL
);

CREATE TABLE "customerAddresses" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"street" TEXT NOT NULL,
	"number" INTEGER NOT NULL,
	"complement" TEXT,
	"postalCode" TEXT NOT NULL,
	"cityId" INTEGER NOT NULL REFERENCES "cities" ("id")
);

CREATE TABLE "customerPhones" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES customers("id"),
	"number" TEXT NOT NULL,
	 "type" TEXT NOT NULL
);

CREATE TABLE "bankAccount" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers" ("id"),
	"accountNumber" TEXT NOT NULL UNIQUE,
	"agency" TEXT NOT NULL,
	"openDate" DATE NOT NULL,
	"closeDate" DATE
);

CREATE TABLE "transactions" (
	"id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount" ("id"),
	"amount" INTEGER NOT NULL,
	"type" TEXT NOT NULL,
	"time" TIME NOT NULL,
	"description" TEXT,
	"cancelled" BOOLEAN
);

CREATE TABLE "creditCards" (
	"id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount" ("id"),
	"name" TEXT NOT NULL,
	"number" TEXT UNIQUE NOT NULL,
	"securityCode" INTEGER NOT NULL,
	"expirationMonth" INTEGER NOT NULL,
	"expirationYear" INTEGER NOT NULL,
	"password" TEXT NOT NULL,
	"limit" DOUBLE PRECISION NOT NULL
);
