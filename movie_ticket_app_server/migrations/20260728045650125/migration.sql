BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "cinemas" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "address" text NOT NULL,
    "latitude" double precision NOT NULL,
    "longitude" double precision NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "rooms" (
    "id" bigserial PRIMARY KEY,
    "cinemaId" bigint NOT NULL,
    "name" text NOT NULL,
    "roomType" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "seats" (
    "id" bigserial PRIMARY KEY,
    "roomId" bigint NOT NULL,
    "rowLabel" text NOT NULL,
    "seatNumber" bigint NOT NULL,
    "seatType" text NOT NULL
);


--
-- MIGRATION VERSION FOR movie_ticket_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('movie_ticket_app', '20260728045650125', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260728045650125', "timestamp" = now();

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
