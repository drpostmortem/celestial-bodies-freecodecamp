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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: dwarf_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planet (
    dwarf_planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    habitable boolean,
    radius numeric,
    age_in_million_yrs numeric,
    naked_eye_visible boolean,
    topography text,
    length_of_day_in_hrs integer,
    star_id integer
);


ALTER TABLE public.dwarf_planet OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planet_dwarf_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planet_dwarf_planet_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planet_dwarf_planet_id_seq OWNED BY public.dwarf_planet.dwarf_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    type character varying(60),
    stars_count_approx numeric,
    age_in_million_yrs numeric,
    naked_eye_visible boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    radius numeric,
    age_in_million_yrs numeric,
    naked_eye_visible boolean,
    shape text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    habitable boolean,
    radius numeric,
    age_in_million_yrs numeric,
    naked_eye_visible boolean,
    topography text,
    length_of_day integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    type character varying(60),
    age_in_million_yrs numeric,
    radius numeric,
    naked_eye_visible boolean,
    distance_in_lightyears numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: dwarf_planet dwarf_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet ALTER COLUMN dwarf_planet_id SET DEFAULT nextval('public.dwarf_planet_dwarf_planet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: dwarf_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planet VALUES (0, 'Pluto', false, 1188.3, 4500, false, 'Rocky, Icy', 153, 0);
INSERT INTO public.dwarf_planet VALUES (1, 'Eris', false, 1163, 4500, false, 'Rocky, Icy', 26, 0);
INSERT INTO public.dwarf_planet VALUES (2, 'Haumea', false, 816, 4500, false, 'Elongated, Icy', 4, 0);
INSERT INTO public.dwarf_planet VALUES (3, 'Makemake', false, 715, 4500, false, 'Rocky, Icy', 23, 0);
INSERT INTO public.dwarf_planet VALUES (4, 'Ceres', false, 473, 4500, false, 'Rocky, Craters', 9, 0);
INSERT INTO public.dwarf_planet VALUES (5, 'Proxima Centauri d', true, 700, 4500, false, 'Rocky, Unknown', 12, 3);
INSERT INTO public.dwarf_planet VALUES (6, 'Alpha Centauri C', false, 650, 4500, false, 'Rocky, Unknown', 16, 8);
INSERT INTO public.dwarf_planet VALUES (7, 'TRAPPIST-1h', true, 600, 5000, false, 'Rocky, Unknown', 18, 8);
INSERT INTO public.dwarf_planet VALUES (8, 'Barnards Star c', false, 500, 7000, false, 'Rocky, Unknown', 20, 7);
INSERT INTO public.dwarf_planet VALUES (9, 'Sirius C', false, 450, 300, false, 'Rocky, Unknown', 11, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (0, 'Milky Way', 'Spiral', 100000000000, 13600, true);
INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', 1000000000000, 10000, true);
INSERT INTO public.galaxy VALUES (2, 'Triangulum', 'Spiral', 40000000000, 13000, true);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic', 'Dwarf Irregular', 30000000000, 13600, true);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic', 'Dwarf Irregular', 3000000000, 13600, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 80000000000, 13600, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 100000000000, 13600, false);
INSERT INTO public.galaxy VALUES (7, 'Pinwheel', 'Spiral', 100000000000, 21000, false);
INSERT INTO public.galaxy VALUES (8, 'Centaurus A', 'Elliptical', 1000000000000, 12000, false);
INSERT INTO public.galaxy VALUES (9, 'Messier 81', 'Spiral', 250000000000, 12000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (0, 'Moon', 1737.4, 4500, true, 'Spherical', 2);
INSERT INTO public.moon VALUES (1, 'Phobos', 11.1, 4500, false, 'Irregular', 3);
INSERT INTO public.moon VALUES (2, 'Deimos', 6.2, 4500, false, 'Irregular', 3);
INSERT INTO public.moon VALUES (3, 'Io', 1821.6, 4500, false, 'Spherical', 4);
INSERT INTO public.moon VALUES (4, 'Europa', 1560.8, 4500, false, 'Spherical', 4);
INSERT INTO public.moon VALUES (5, 'Ganymede', 2634.1, 4500, false, 'Spherical', 4);
INSERT INTO public.moon VALUES (6, 'Callisto', 2410.3, 4500, false, 'Spherical', 4);
INSERT INTO public.moon VALUES (7, 'Titan', 2574.7, 4500, false, 'Spherical', 5);
INSERT INTO public.moon VALUES (8, 'Enceladus', 252.1, 4500, false, 'Spherical', 5);
INSERT INTO public.moon VALUES (9, 'Mimas', 198.2, 4500, false, 'Spherical', 5);
INSERT INTO public.moon VALUES (10, 'Miranda', 235.8, 4500, false, 'Spherical', 6);
INSERT INTO public.moon VALUES (11, 'Ariel', 578.9, 4500, false, 'Spherical', 6);
INSERT INTO public.moon VALUES (12, 'Umbriel', 584.7, 4500, false, 'Spherical', 6);
INSERT INTO public.moon VALUES (13, 'Triton', 1353.4, 4500, false, 'Spherical', 7);
INSERT INTO public.moon VALUES (14, 'Nereid', 170, 4500, false, 'Irregular', 7);
INSERT INTO public.moon VALUES (15, 'Proxima Centauri c', 85, 4500, false, 'Irregular', 8);
INSERT INTO public.moon VALUES (16, 'Alpha Centauri Bb', 120, 4500, false, 'Irregular', 9);
INSERT INTO public.moon VALUES (17, 'TRAPPIST-1d Moon', 900, 5000, false, 'Spherical', 10);
INSERT INTO public.moon VALUES (18, 'TRAPPIST-1e Moon', 950, 5000, false, 'Spherical', 11);
INSERT INTO public.moon VALUES (19, 'Barnards Star b Moon', 500, 7000, false, 'Irregular', 15);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (0, 'Mercury', false, 0.382, 4500, true, 'Rocky, Craters', 1408, 0);
INSERT INTO public.planet VALUES (1, 'Venus', false, 0.949, 4500, true, 'Volcanoes, Mountains', 2802, 0);
INSERT INTO public.planet VALUES (2, 'Earth', true, 1, 4500, true, 'Mountains, Oceans', 24, 0);
INSERT INTO public.planet VALUES (3, 'Mars', false, 0.532, 4500, true, 'Deserts, Canyons', 25, 0);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, 11.21, 4500, true, 'Gas Giant', 10, 0);
INSERT INTO public.planet VALUES (5, 'Saturn', false, 9.45, 4500, true, 'Gas Giant', 11, 0);
INSERT INTO public.planet VALUES (6, 'Uranus', false, 4.01, 4500, false, 'Ice Giant', 17, 0);
INSERT INTO public.planet VALUES (7, 'Neptune', false, 3.88, 4500, false, 'Ice Giant', 16, 0);
INSERT INTO public.planet VALUES (8, 'Proxima b', true, 1.17, 4500, false, 'Rocky', 11, 3);
INSERT INTO public.planet VALUES (9, 'Alpha Centauri Bb', false, 1.13, 4500, false, 'Rocky', NULL, 8);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1d', true, 0.77, 5000, false, 'Rocky', 4, 5);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', true, 0.91, 5000, false, 'Rocky', 6, 5);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1f', true, 1.04, 5000, false, 'Rocky', 9, 5);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1g', true, 1.13, 5000, false, 'Rocky', 12, 5);
INSERT INTO public.planet VALUES (14, 'Kepler-22b', false, 2.4, 6000, false, 'null', NULL, 5);
INSERT INTO public.planet VALUES (15, 'Barnards Star b', true, 1.16, 7000, false, 'Rocky', NULL, 5);
INSERT INTO public.planet VALUES (16, 'Sirius b', false, 0.0084, 230, false, 'White Dwarf', NULL, 1);
INSERT INTO public.planet VALUES (17, 'Vega b', false, 1.3, 455, false, 'Rocky', NULL, 5);
INSERT INTO public.planet VALUES (18, 'Rigel b', false, 1.2, 8000, false, 'null', NULL, 4);
INSERT INTO public.planet VALUES (19, 'Canopus b', false, 1.5, 10000, false, 'null', NULL, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (0, 'Sun', 'G-type Main-Sequence', 4600, 1, true, 0, 0);
INSERT INTO public.star VALUES (1, 'Sirius', 'A-type Main-Sequence', 300, 1.71, true, 8.6, 0);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red Supergiant', 10000, 887, true, 642, 0);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'Red Dwarf', 4600, 0.1542, false, 4.24, 0);
INSERT INTO public.star VALUES (4, 'Rigel', 'Blue Supergiant', 8000, 78, true, 860, 0);
INSERT INTO public.star VALUES (5, 'Vega', 'A-type Main-Sequence', 455, 2.362, true, 25, 0);
INSERT INTO public.star VALUES (6, 'Aldebaran', 'Red Giant', 6500, 44.2, true, 65, 0);
INSERT INTO public.star VALUES (7, 'Barnards Star', 'Red Dwarf', 7000, 0.196, false, 5.96, 0);
INSERT INTO public.star VALUES (8, 'Alpha Centauri A', 'G-type Main-Sequence', 5000, 1.2234, true, 4.37, 0);
INSERT INTO public.star VALUES (9, 'Canopus', 'F-type Supergiant', 10000, 71, true, 310, 0);


--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planet_dwarf_planet_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: dwarf_planet dwarf_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_name_key UNIQUE (name);


--
-- Name: dwarf_planet dwarf_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_pkey PRIMARY KEY (dwarf_planet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: dwarf_planet dwarf_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

