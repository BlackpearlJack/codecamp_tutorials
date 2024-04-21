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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size integer NOT NULL,
    age numeric NOT NULL,
    has_black_hole boolean NOT NULL
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
    name character varying(100) NOT NULL,
    radius integer NOT NULL,
    orbital_period numeric NOT NULL,
    is_tidal_locked boolean NOT NULL,
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
-- Name: moon_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_type (
    moon_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    average_radius numeric(10,2)
);


ALTER TABLE public.moon_type OWNER TO freecodecamp;

--
-- Name: moon_type_moon_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_type_moon_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_type_moon_type_id_seq OWNER TO freecodecamp;

--
-- Name: moon_type_moon_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_type_moon_type_id_seq OWNED BY public.moon_type.moon_type_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter integer NOT NULL,
    mass numeric NOT NULL,
    has_atmosphere boolean NOT NULL,
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
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    description text NOT NULL,
    luminosity numeric(4,1) NOT NULL,
    is_main_sequence boolean NOT NULL,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_type moon_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type ALTER COLUMN moon_type_id SET DEFAULT nextval('public.moon_type_moon_type_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 13000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120000, 11000, false);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 90000, 15000, true);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 80000, 12000, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 110000, 14000, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 95000, 12500, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, 27.3, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 11, 0.3, true, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 6, 1.3, true, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1822, 1.8, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1561, 3.6, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634, 7.2, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410, 16.7, true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 2575, 15.9, true, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 252, 1.4, true, 6);
INSERT INTO public.moon VALUES (10, 'Rhea', 765, 4.5, true, 6);
INSERT INTO public.moon VALUES (11, 'Mimas', 198, 0.9, true, 6);
INSERT INTO public.moon VALUES (12, 'Triton', 1353, 5.9, true, 8);
INSERT INTO public.moon VALUES (13, 'Charon', 606, 6.4, true, 9);
INSERT INTO public.moon VALUES (14, 'Dione', 563, 2.7, true, 10);
INSERT INTO public.moon VALUES (15, 'Iapetus', 735, 79, true, 10);
INSERT INTO public.moon VALUES (16, 'Titania', 789, 8.7, true, 13);
INSERT INTO public.moon VALUES (17, 'Oberon', 761, 13.5, true, 13);
INSERT INTO public.moon VALUES (18, 'Ariel', 579, 2.5, true, 13);
INSERT INTO public.moon VALUES (19, 'Umbriel', 585, 4.1, true, 13);
INSERT INTO public.moon VALUES (20, 'Miranda', 236, 1.4, true, 13);


--
-- Data for Name: moon_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_type VALUES (1, 'Terrestrial', 1737.00);
INSERT INTO public.moon_type VALUES (2, 'Giant', 2523.20);
INSERT INTO public.moon_type VALUES (3, 'Ice', 666.00);
INSERT INTO public.moon_type VALUES (4, 'Dwarf', 350.00);
INSERT INTO public.moon_type VALUES (5, 'Regular', 340.00);
INSERT INTO public.moon_type VALUES (6, 'Irregular', 75.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4879, 0.330, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 4.87, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12742, 5.97, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6779, 0.642, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139822, 1898, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 116464, 568, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 50724, 86.8, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 49244, 102, true, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 11430, 1.17, true, 5);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 24065, 5, true, 5);
INSERT INTO public.planet VALUES (11, 'Gliese 581c', 19800, 5.03, true, 5);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 155000, 0.69, true, 5);
INSERT INTO public.planet VALUES (13, '55 Cancri e', 20000, 8.63, true, 5);
INSERT INTO public.planet VALUES (14, 'TRAPPIST-1d', 7700, 0.41, true, 5);
INSERT INTO public.planet VALUES (15, 'GJ 1214 b', 25300, 6.55, true, 5);
INSERT INTO public.planet VALUES (16, 'WASP-12b', 155000, 1.41, true, 5);
INSERT INTO public.planet VALUES (17, 'KELT-9b', 132790, 2.88, true, 5);
INSERT INTO public.planet VALUES (18, 'HD 189733 b', 155000, 1.14, true, 5);
INSERT INTO public.planet VALUES (19, 'Tau Ceti e', 11300, 0.2, true, 5);
INSERT INTO public.planet VALUES (20, 'HR 8799 c', 74860, 7, true, 5);
INSERT INTO public.planet VALUES (21, 'COROT-7b', 12000, 5.63, true, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type', 'The Sun is the star at the center of the Solar System, comprising about 99.86% of its total mass.', 1.0, true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red Supergiant', 'Betelgeuse is a red supergiant star in the constellation of Orion, approximately 643 light-years from Earth.', 100.0, false, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'Main Sequence', 'Sirius is a binary star system and the brightest star in the night sky, located in the constellation Canis Major.', 25.0, true, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 'Binary Star', 'Alpha Centauri is a binary star system consisting of Alpha Centauri A and Alpha Centauri B, located about 4.37 light-years from Earth.', 2.8, true, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'Red Dwarf', 'Proxima Centauri is a small, low-mass star located about 4.24 light-years from the Sun in the constellation of Centaurus.', 0.1, true, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'Main Sequence', 'Vega is the brightest star in the constellation of Lyra, approximately 25 light-years from Earth.', 37.0, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: moon_type_moon_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_type_moon_type_id_seq', 6, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: moon_type moon_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type
    ADD CONSTRAINT moon_type_name_key UNIQUE (name);


--
-- Name: moon_type moon_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type
    ADD CONSTRAINT moon_type_pkey PRIMARY KEY (moon_type_id);


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

