CREATE TABLE "songplays (Fact Table)"(
    "songplay_id" INTEGER NOT NULL,
    "start_time" BIGINT NOT NULL,
    "user_id" INTEGER NOT NULL,
    "level" VARCHAR(255) NOT NULL,
    "song_id" VARCHAR(255) NOT NULL,
    "artist_id" VARCHAR(255) NOT NULL,
    "session_id" INTEGER NOT NULL,
    "location" TEXT NOT NULL,
    "user_agent" TEXT NOT NULL
);
ALTER TABLE
    "songplays (Fact Table)" ADD PRIMARY KEY("songplay_id");
COMMENT
ON COLUMN
    "songplays (Fact Table)"."songplay_id" IS 'Serial';
CREATE TABLE "users (Dimensions Table)"(
    "user_id" INTEGER NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "gender" VARCHAR(255) NOT NULL,
    "level" TEXT NOT NULL
);
ALTER TABLE
    "users (Dimensions Table)" ADD PRIMARY KEY("user_id");
CREATE TABLE "songs (Dimension table)"(
    "song_id" VARCHAR(255) NOT NULL,
    "title" TEXT NOT NULL,
    "artist_id" VARCHAR(255) NOT NULL,
    "year" INTEGER NOT NULL,
    "duration" BIGINT NOT NULL
);
ALTER TABLE
    "songs (Dimension table)" ADD PRIMARY KEY("song_id");
CREATE TABLE "artists"(
    "artist_id" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "location" TEXT NOT NULL,
    "latitude" NUMERIC NOT NULL,
    "longitude" NUMERIC NOT NULL
);
ALTER TABLE
    "artists" ADD PRIMARY KEY("artist_id");
CREATE TABLE "time"(
    "start_time" DATE NOT NULL,
    "hour" INTEGER NOT NULL,
    "day" INTEGER NOT NULL,
    "week" INTEGER NOT NULL,
    "month" INTEGER NOT NULL,
    "year" INTEGER NOT NULL,
    "weekday" INTEGER NOT NULL
);
ALTER TABLE
    "time" ADD PRIMARY KEY("start_time");
ALTER TABLE
    "songplays (Fact Table)" ADD CONSTRAINT "songplays (fact table)_artist_id_foreign" FOREIGN KEY("artist_id") REFERENCES "artists"("artist_id");
ALTER TABLE
    "songs (Dimension table)" ADD CONSTRAINT "songs (dimension table)_artist_id_foreign" FOREIGN KEY("artist_id") REFERENCES "artists"("artist_id");
ALTER TABLE
    "songplays (Fact Table)" ADD CONSTRAINT "songplays (fact table)_start_time_foreign" FOREIGN KEY("start_time") REFERENCES "time"("start_time");
ALTER TABLE
    "songplays (Fact Table)" ADD CONSTRAINT "songplays (fact table)_song_id_foreign" FOREIGN KEY("song_id") REFERENCES "songs (Dimension table)"("song_id");
ALTER TABLE
    "songplays (Fact Table)" ADD CONSTRAINT "songplays (fact table)_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users (Dimensions Table)"("user_id");