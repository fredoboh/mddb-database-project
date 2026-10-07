BEGIN;


ALTER TABLE IF EXISTS public.sales_table DROP CONSTRAINT IF EXISTS None;

ALTER TABLE IF EXISTS public.user_reviews_table DROP CONSTRAINT IF EXISTS None;

ALTER TABLE IF EXISTS public.user_reviews_table DROP CONSTRAINT IF EXISTS None;

ALTER TABLE IF EXISTS public.expert_reviews_table DROP CONSTRAINT IF EXISTS None;

ALTER TABLE IF EXISTS public.expert_reviews_table DROP CONSTRAINT IF EXISTS None;

ALTER TABLE IF EXISTS public.actor_table_movie_table DROP CONSTRAINT IF EXISTS None;

ALTER TABLE IF EXISTS public.actor_table_movie_table DROP CONSTRAINT IF EXISTS None;

ALTER TABLE IF EXISTS public.genre_table_movie_table DROP CONSTRAINT IF EXISTS None;

ALTER TABLE IF EXISTS public.genre_table_movie_table DROP CONSTRAINT IF EXISTS None;

ALTER TABLE IF EXISTS public.studio_table_movie_table DROP CONSTRAINT IF EXISTS None;

ALTER TABLE IF EXISTS public.studio_table_movie_table DROP CONSTRAINT IF EXISTS None;

ALTER TABLE IF EXISTS public.director_table_movie_table DROP CONSTRAINT IF EXISTS None;

ALTER TABLE IF EXISTS public.award_table_movie_table DROP CONSTRAINT IF EXISTS None;



DROP TABLE IF EXISTS public.movie_table CASCADE;

CREATE TABLE IF NOT EXISTS public.movie_table
(
    movie_id serial NOT NULL,
    movie_name text,
    run_time double precision,
    rating text,
    summary text,
    release_date date,
    user_score double precision,
    meta_score double precision,
    url text,
    PRIMARY KEY (movie_id)
);

DROP TABLE IF EXISTS public.sales_table CASCADE;

CREATE TABLE IF NOT EXISTS public.sales_table
(
    sales_id serial NOT NULL,
    movie_id serial,
    international_box_office double precision,
    domestic_box_office double precision,
    worldwide_box_office double precision,
    production_budget double precision,
    theatre_count double precision,
    avg_run_per_theatre double precision,
    PRIMARY KEY (sales_id),
    UNIQUE (movie_id)
);

DROP TABLE IF EXISTS public.genre_table CASCADE;

CREATE TABLE IF NOT EXISTS public.genre_table
(
    genre_id serial NOT NULL,
    genre text,
    PRIMARY KEY (genre_id)
);

DROP TABLE IF EXISTS public.award_table CASCADE;

CREATE TABLE IF NOT EXISTS public.award_table
(
    award_id serial NOT NULL,
    award_name text,
    PRIMARY KEY (award_id)
);

DROP TABLE IF EXISTS public.actor_table CASCADE;

CREATE TABLE IF NOT EXISTS public.actor_table
(
    actor_id serial NOT NULL,
    actor_name text,
    PRIMARY KEY (actor_id)
);

DROP TABLE IF EXISTS public.studio_table CASCADE;

CREATE TABLE IF NOT EXISTS public.studio_table
(
    studio_id serial NOT NULL,
    studio_name text,
    PRIMARY KEY (studio_id)
);

DROP TABLE IF EXISTS public.director_table CASCADE;

CREATE TABLE IF NOT EXISTS public.director_table
(
    director_id serial NOT NULL,
    director_name text,
    PRIMARY KEY (director_id)
);

DROP TABLE IF EXISTS public.user_reviews_table;

CREATE TABLE IF NOT EXISTS public.user_reviews_table
(
    review_id serial NOT NULL,
    reviewer_id serial,
    indv_score double precision,
    date_posted date,
    likes numeric,
    dislikes numeric,
    review text,
    tone double precision,
    url text,
    movie_id serial,
    PRIMARY KEY (review_id)
);

DROP TABLE IF EXISTS public.expert_reviews_table CASCADE;

CREATE TABLE IF NOT EXISTS public.expert_reviews_table
(
    review_id serial NOT NULL,
    reviewer_id serial,
    score double precision,
    date_posted date,
    review text,
    tone double precision,
    url text,
    movie_id serial,
    PRIMARY KEY (review_id)
);

DROP TABLE IF EXISTS public.actor_table_movie_table CASCADE;

CREATE TABLE IF NOT EXISTS public.actor_table_movie_table
(
    actor_id bigint,
    movie_id bigint,
    movie_actor_id serial NOT NULL,
    PRIMARY KEY (movie_actor_id)
);

DROP TABLE IF EXISTS public.genre_table_movie_table CASCADE;

CREATE TABLE IF NOT EXISTS public.genre_table_movie_table
(
    gen_movie_id serial,
    genre_id bigint,
    movie_id bigint,
    PRIMARY KEY (gen_movie_id)
);

DROP TABLE IF EXISTS public.studio_table_movie_table CASCADE;

CREATE TABLE IF NOT EXISTS public.studio_table_movie_table
(
    studio_id bigint,
    movie_id bigint,
    movie_studio_id serial NOT NULL,
    PRIMARY KEY (movie_studio_id)
);

DROP TABLE IF EXISTS public.director_table_movie_table CASCADE;

CREATE TABLE IF NOT EXISTS public.director_table_movie_table
(
    director_id bigint,
    movie_id bigint,
    movie_director_id serial NOT NULL,
    PRIMARY KEY (movie_director_id)
);

DROP TABLE IF EXISTS public.award_table_movie_table CASCADE;

CREATE TABLE IF NOT EXISTS public.award_table_movie_table
(
    award_id bigint,
    movie_id bigint,
    movie_award_id serial NOT NULL,
    PRIMARY KEY (movie_award_id)
);

DROP TABLE IF EXISTS public.user_reviewer_table CASCADE;

CREATE TABLE IF NOT EXISTS public.user_reviewer_table
(
    reviewer_id serial NOT NULL,
    reviewer_name text,
    PRIMARY KEY (reviewer_id)
);

DROP TABLE IF EXISTS public.expert_reviewer_table CASCADE;

CREATE TABLE IF NOT EXISTS public.expert_reviewer_table
(
    reviewer_id serial NOT NULL,
    reviewer_name text,
    PRIMARY KEY (reviewer_id)
);

ALTER TABLE IF EXISTS public.sales_table
    ADD FOREIGN KEY (movie_id)
    REFERENCES public.movie_table (movie_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.user_reviews_table
    ADD FOREIGN KEY (movie_id)
    REFERENCES public.movie_table (movie_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.user_reviews_table
    ADD FOREIGN KEY (reviewer_id)
    REFERENCES public.user_reviewer_table (reviewer_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.expert_reviews_table
    ADD FOREIGN KEY (movie_id)
    REFERENCES public.movie_table (movie_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.expert_reviews_table
    ADD FOREIGN KEY (reviewer_id)
    REFERENCES public.expert_reviewer_table (reviewer_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.actor_table_movie_table
    ADD FOREIGN KEY (actor_id)
    REFERENCES public.actor_table (actor_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.actor_table_movie_table
    ADD FOREIGN KEY (movie_id)
    REFERENCES public.movie_table (movie_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.genre_table_movie_table
    ADD FOREIGN KEY (genre_id)
    REFERENCES public.genre_table (genre_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.genre_table_movie_table
    ADD FOREIGN KEY (movie_id)
    REFERENCES public.movie_table (movie_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.studio_table_movie_table
    ADD FOREIGN KEY (studio_id)
    REFERENCES public.studio_table (studio_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.studio_table_movie_table
    ADD FOREIGN KEY (movie_id)
    REFERENCES public.movie_table (movie_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.director_table_movie_table
    ADD FOREIGN KEY (movie_id)
    REFERENCES public.movie_table (movie_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.award_table_movie_table
    ADD FOREIGN KEY (movie_id)
    REFERENCES public.movie_table (movie_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.expert_reviews_table 
    ALTER COLUMN reviewer_id 
    DROP NOT NULL;


ALTER TABLE IF EXISTS public.user_reviews_table 
    ALTER COLUMN reviewer_id 
    DROP NOT NULL;

END;