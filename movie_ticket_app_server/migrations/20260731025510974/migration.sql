BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "order_concessions" (
    "id" bigserial PRIMARY KEY,
    "orderId" bigint NOT NULL,
    "concessionId" bigint NOT NULL,
    "quantity" bigint NOT NULL,
    "price" double precision NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "order_seats" (
    "id" bigserial PRIMARY KEY,
    "orderId" bigint NOT NULL,
    "showtimeSeatId" bigint NOT NULL,
    "price" double precision NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "orders" (
    "id" bigserial PRIMARY KEY,
    "userIdentifier" text NOT NULL,
    "showtimeId" bigint NOT NULL,
    "totalPrice" double precision NOT NULL,
    "status" text NOT NULL,
    "paymentMethod" text NOT NULL,
    "qrCodeData" text,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "order_concessions"
    ADD CONSTRAINT "order_concessions_fk_0"
    FOREIGN KEY("orderId")
    REFERENCES "orders"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "order_seats"
    ADD CONSTRAINT "order_seats_fk_0"
    FOREIGN KEY("orderId")
    REFERENCES "orders"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "orders"
    ADD CONSTRAINT "orders_fk_0"
    FOREIGN KEY("showtimeId")
    REFERENCES "showtimes"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR movie_ticket_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('movie_ticket_app', '20260731025510974', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260731025510974', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260129180959368', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129180959368', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260213194423028', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260213194423028', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260129181112269', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129181112269', "timestamp" = now();


COMMIT;
