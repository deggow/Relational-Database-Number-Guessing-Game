--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guessing;
--
-- Name: number_guessing; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing OWNER TO freecodecamp;

\connect number_guessing

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    tries integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(60) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (6, 7, 11);
INSERT INTO public.games VALUES (7, 8, 395);
INSERT INTO public.games VALUES (8, 8, 939);
INSERT INTO public.games VALUES (9, 9, 92);
INSERT INTO public.games VALUES (10, 9, 167);
INSERT INTO public.games VALUES (11, 8, 337);
INSERT INTO public.games VALUES (12, 8, 665);
INSERT INTO public.games VALUES (13, 8, 286);
INSERT INTO public.games VALUES (14, 7, 4);
INSERT INTO public.games VALUES (15, 7, 9);
INSERT INTO public.games VALUES (16, 7, 5);
INSERT INTO public.games VALUES (17, 10, 592);
INSERT INTO public.games VALUES (18, 10, 681);
INSERT INTO public.games VALUES (19, 11, 415);
INSERT INTO public.games VALUES (20, 11, 540);
INSERT INTO public.games VALUES (21, 10, 689);
INSERT INTO public.games VALUES (22, 10, 423);
INSERT INTO public.games VALUES (23, 10, 122);
INSERT INTO public.games VALUES (24, 12, 965);
INSERT INTO public.games VALUES (25, 12, 266);
INSERT INTO public.games VALUES (26, 13, 996);
INSERT INTO public.games VALUES (27, 13, 601);
INSERT INTO public.games VALUES (28, 12, 78);
INSERT INTO public.games VALUES (29, 12, 611);
INSERT INTO public.games VALUES (30, 12, 507);
INSERT INTO public.games VALUES (31, 14, 999);
INSERT INTO public.games VALUES (32, 14, 569);
INSERT INTO public.games VALUES (33, 15, 566);
INSERT INTO public.games VALUES (34, 15, 292);
INSERT INTO public.games VALUES (35, 14, 49);
INSERT INTO public.games VALUES (36, 14, 5);
INSERT INTO public.games VALUES (37, 14, 149);
INSERT INTO public.games VALUES (38, 16, 661);
INSERT INTO public.games VALUES (39, 16, 370);
INSERT INTO public.games VALUES (40, 17, 379);
INSERT INTO public.games VALUES (41, 17, 59);
INSERT INTO public.games VALUES (42, 16, 808);
INSERT INTO public.games VALUES (43, 16, 612);
INSERT INTO public.games VALUES (44, 16, 545);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (7, 'Darf');
INSERT INTO public.users VALUES (8, 'user_1708485675618');
INSERT INTO public.users VALUES (9, 'user_1708485675617');
INSERT INTO public.users VALUES (10, 'user_1708486072140');
INSERT INTO public.users VALUES (11, 'user_1708486072139');
INSERT INTO public.users VALUES (12, 'user_1708486104846');
INSERT INTO public.users VALUES (13, 'user_1708486104845');
INSERT INTO public.users VALUES (14, 'user_1708486137795');
INSERT INTO public.users VALUES (15, 'user_1708486137794');
INSERT INTO public.users VALUES (16, 'user_1708486198476');
INSERT INTO public.users VALUES (17, 'user_1708486198475');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 44, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 17, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


