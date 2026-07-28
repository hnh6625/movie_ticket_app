BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "reviews" (
    "id" bigserial PRIMARY KEY,
    "movieId" bigint NOT NULL,
    "userIdentifier" text NOT NULL,
    "rating" bigint NOT NULL,
    "comment" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "review_movie_user_unique_idx" ON "reviews" USING btree ("movieId", "userIdentifier");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "reviews"
    ADD CONSTRAINT "reviews_fk_0"
    FOREIGN KEY("movieId")
    REFERENCES "movies"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR movie_ticket_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('movie_ticket_app', '20260728063213608', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260728063213608', "timestamp" = now();

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
