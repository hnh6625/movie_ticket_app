BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "showtime_seats" (
    "id" bigserial PRIMARY KEY,
    "showtimeId" bigint NOT NULL,
    "seatId" bigint NOT NULL,
    "status" text NOT NULL,
    "heldByUserId" bigint,
    "holdExpiredAt" timestamp without time zone
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "showtimes" (
    "id" bigserial PRIMARY KEY,
    "movieId" bigint NOT NULL,
    "roomId" bigint NOT NULL,
    "startTime" timestamp without time zone NOT NULL,
    "basePrice" double precision NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "showtime_seats"
    ADD CONSTRAINT "showtime_seats_fk_0"
    FOREIGN KEY("showtimeId")
    REFERENCES "showtimes"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "showtime_seats"
    ADD CONSTRAINT "showtime_seats_fk_1"
    FOREIGN KEY("seatId")
    REFERENCES "seats"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "showtimes"
    ADD CONSTRAINT "showtimes_fk_0"
    FOREIGN KEY("movieId")
    REFERENCES "movies"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "showtimes"
    ADD CONSTRAINT "showtimes_fk_1"
    FOREIGN KEY("roomId")
    REFERENCES "rooms"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR movie_ticket_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('movie_ticket_app', '20260728051018398', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260728051018398', "timestamp" = now();

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
