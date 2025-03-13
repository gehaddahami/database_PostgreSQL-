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
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    age numeric,
    distance_from_earth numeric,
    star_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxies_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxies_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxies_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_contents; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_contents (
    galaxy_contents_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer,
    name character varying(20)
);


ALTER TABLE public.galaxy_contents OWNER TO freecodecamp;

--
-- Name: galaxy_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_contents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_contents_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_contents_id_seq OWNED BY public.galaxy_contents.galaxy_contents_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(10) NOT NULL,
    description text,
    has_rings boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moons_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moons_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moons_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(10),
    description text,
    has_life boolean,
    planet_type character varying(10),
    distance_from_earth numeric,
    radius_in_km integer,
    distance_to_nearest_star integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(10) NOT NULL,
    description text,
    is_spherical boolean,
    age numeric,
    star_type character varying(20),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_star_id_seq OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxies_galaxy_id_seq'::regclass);


--
-- Name: galaxy_contents galaxy_contents_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_contents ALTER COLUMN galaxy_contents_id SET DEFAULT nextval('public.galaxy_contents_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moons_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planets_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'this is the galaxy that includes the solar system', true, 150.009, 0.0, 1);
INSERT INTO public.galaxy VALUES (2, 'Needle Galaxy', 'this galaxy is named due its needle-like shape', false, 4399.09, 334.000, 2);
INSERT INTO public.galaxy VALUES (3, 'WolfLundmarkMelotte', 'this galaxy is named after the one how discovered it', false, 43943.0, 5543.0, 3);
INSERT INTO public.galaxy VALUES (4, 'Propoise Galaxy', 'this galaxy is also knows as the penguin galaxy', false, 4394343.0, 5556.0, 5);
INSERT INTO public.galaxy VALUES (5, 'Knife edge Galaxy', 'this galaxy is named due to it thin shape', false, 439443443.0, 36653, 6);
INSERT INTO public.galaxy VALUES (6, 'Blinking Galaxy', 'it has a tendancy to go in and out of view', false, 4454439643.0, 123000, 4);


--
-- Data for Name: galaxy_contents; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_contents VALUES (1, 1, 1, 'this is OG galaxy');
INSERT INTO public.galaxy_contents VALUES (2, 2, 2, 'this is the second');
INSERT INTO public.galaxy_contents VALUES (3, 3, 3, 'this is the third');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 'this is the OG moon that lights up the sky at night', false, 1);
INSERT INTO public.moon VALUES (2, 'Callisto', 'this is taken from google and will be added to planet 2', false, 2);
INSERT INTO public.moon VALUES (3, 'Himalia', 'this is for the fourth planet', false, 4);
INSERT INTO public.moon VALUES (4, 'Europa', 'this is taken from google and will be added to planet 3', false, 3);
INSERT INTO public.moon VALUES (5, 'Carme', 'this is for planet 5 with some rings!', true, 5);
INSERT INTO public.moon VALUES (6, 'Theba', 'this is taken from google and will be added to planet 5', false, 5);
INSERT INTO public.moon VALUES (7, 'Adaretea', 'this is for planet 5 without some rings!', false, 5);
INSERT INTO public.moon VALUES (8, 'Carpe', 'this is taken from google and will be added to planet 5', false, 5);
INSERT INTO public.moon VALUES (9, 'Moon_5', 'this is for planet 5 without some rings!', false, 5);
INSERT INTO public.moon VALUES (10, 'moon_6', 'this is taken from google and will be added to planet 6', false, 6);
INSERT INTO public.moon VALUES (11, 'Moon_8', 'this is for planet 8 without some rings!', false, 8);
INSERT INTO public.moon VALUES (12, 'moon_7', 'this is taken from google and will be added to planet 7', false, 7);
INSERT INTO public.moon VALUES (13, 'Moon_88', 'this is for planet 8 without some rings!', false, 8);
INSERT INTO public.moon VALUES (14, 'moon_87', 'this is taken from google and will be added to planet 7', false, 7);
INSERT INTO public.moon VALUES (15, 'Moo88', 'this is for planet 8 without some rings!', false, 8);
INSERT INTO public.moon VALUES (16, 'moon_67', 'this is taken from google and will be added to planet 67', false, 7);
INSERT INTO public.moon VALUES (17, 'Moon11', 'this is for planet 8 without some rings!', false, 11);
INSERT INTO public.moon VALUES (18, 'moon_10', 'this is taken from google and will be added to planet 67', false, 10);
INSERT INTO public.moon VALUES (19, 'Moon12', 'this is for planet 8 without some rings!', false, 12);
INSERT INTO public.moon VALUES (20, 'moon_100', 'this is taken from google and will be added to planet 67', false, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'this is our home sweet home', true, 'round', 0.0, 143000, 455000, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'this is elon musk dream home', false, 'red', 50, 1430000, 45500000, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'this is a weird planet', false, 'hot', 50, 1430000, 45500000, 1);
INSERT INTO public.planet VALUES (4, 'Mercury', 'this is closest to the sun ', false, 'small', 0.0, 10, 4, 1);
INSERT INTO public.planet VALUES (5, 'Jupyter', 'this is largest after the sun', false, 'BIG!', 0.0, 100000000, 4000, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'has a nice ring to it', false, 'RINGY', 0.0, 100000000, 5000, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'used when joking', false, 'blue', 0.0, 100000000, 5000, 1);
INSERT INTO public.planet VALUES (8, 'pluto', 'always left alone', false, 'lonely', 0.0, 100000000, 5000, 1);
INSERT INTO public.planet VALUES (9, 'Neptune', 'close enough to be valid', false, 'just_there', 0.0, 100000000, 5000, 1);
INSERT INTO public.planet VALUES (10, 'Haumea', 'assumed to be with the second star', false, 'noice', 0.0, 100000000, 5000, 2);
INSERT INTO public.planet VALUES (11, 'Eris', 'assumed to be with the third star', false, 'noice_2', 0.0, 100000000, 5000, 3);
INSERT INTO public.planet VALUES (12, 'Sedena', 'the last one added', false, 'last', 0.0, 100000000, 5000, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 'This is out favorite star!', true, 5000, 'yellow dwarf', 1);
INSERT INTO public.star VALUES (2, 'Alpha_cent', 'This is closest to us', true, 5004420, 'red dwarf', 2);
INSERT INTO public.star VALUES (3, 'WOH 5170', 'This is very far and maybe the name is wrong :P', false, 500442000, 'neutron star', 3);
INSERT INTO public.star VALUES (4, 'c_verlorum', 'This is not actually blue :)', true, 500000, 'blue giant', 4);
INSERT INTO public.star VALUES (5, 'star_5', 'just another star :)', true, 500000, 'blue giant', 5);
INSERT INTO public.star VALUES (6, 'star_6', 'the last one in this list  :)', false, 5000000000, 'pulsar', 6);


--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxies_galaxy_id_seq', 6, true);


--
-- Name: galaxy_contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_contents_id_seq', 3, true);


--
-- Name: moons_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moons_moon_id_seq', 20, true);


--
-- Name: planets_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_planet_id_seq', 12, true);


--
-- Name: stars_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_star_id_seq', 6, true);


--
-- Name: galaxy galaxies_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_name_key UNIQUE (name);


--
-- Name: galaxy galaxies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_contents galaxy_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_contents
    ADD CONSTRAINT galaxy_contents_pkey PRIMARY KEY (galaxy_contents_id);


--
-- Name: moon moons_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_name_key UNIQUE (name);


--
-- Name: moon moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_id);


--
-- Name: star stars_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_name_key UNIQUE (name);


--
-- Name: star stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_contents unique_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_contents
    ADD CONSTRAINT unique_galaxy UNIQUE (galaxy_id);


--
-- Name: planet unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: star follows_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT follows_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon follows_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT follows_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet follows_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT follows_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

