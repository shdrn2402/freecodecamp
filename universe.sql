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
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric(20,2),
    galaxy_types character varying(50)
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
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean,
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    star_id integer NOT NULL,
    planet_types character varying(50)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_characteristic; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_characteristic (
    planet_characteristic_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(50),
    characteristic_value text
);


ALTER TABLE public.planet_characteristic OWNER TO freecodecamp;

--
-- Name: planet_characteristic_characteristic_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_characteristic_characteristic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_characteristic_characteristic_id_seq OWNER TO freecodecamp;

--
-- Name: planet_characteristic_characteristic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_characteristic_characteristic_id_seq OWNED BY public.planet_characteristic.planet_characteristic_id;


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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    galaxy_id integer NOT NULL
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_characteristic planet_characteristic_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_characteristic ALTER COLUMN planet_characteristic_id SET DEFAULT nextval('public.planet_characteristic_characteristic_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 'Our home galaxy', 13000, 0.00, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy to the Milky Way', 10000, 3000000.00, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Smallest of the Local Group galaxies', 3000, 3000000.00, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Known for its supermassive black hole', 12000, 53000000.00, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Satellite galaxy of the Milky Way', 1000, 163000.00, 'Irregular');
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'Another satellite galaxy of the Milky Way', 700, 200000.00, 'Irregular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Moon', 'Earth''s only natural satellite, known for its phases and influence on tides.', true, 1);
INSERT INTO public.moon VALUES (22, 'Io', 'The largest moon of Jupiter, known for its volcanically active surface.', true, 2);
INSERT INTO public.moon VALUES (23, 'Europa', 'One of Jupiter''s moons, characterized by its icy surface and potential subsurface ocean.', true, 2);
INSERT INTO public.moon VALUES (24, 'Ganymede', 'The largest moon in the Solar System, with a magnetic field and surface features.', true, 2);
INSERT INTO public.moon VALUES (25, 'Callisto', 'One of Jupiter''s moons, known for its heavily cratered surface.', true, 2);
INSERT INTO public.moon VALUES (26, 'Titan', 'Saturn''s largest moon, with a thick atmosphere and lakes of liquid methane.', true, 3);
INSERT INTO public.moon VALUES (27, 'Enceladus', 'A moon of Saturn, known for its icy surface and geysers.', true, 3);
INSERT INTO public.moon VALUES (28, 'Rhea', 'Saturn''s second-largest moon, with a surface marked by impact craters.', true, 3);
INSERT INTO public.moon VALUES (29, 'Mimas', 'A small moon of Saturn, known for its large impact crater, the Herschel Crater.', true, 3);
INSERT INTO public.moon VALUES (30, 'Phobos', 'The larger of Mars'' two moons, known for its irregular shape and rapid orbit.', true, 4);
INSERT INTO public.moon VALUES (31, 'Deimos', 'Mars'' smaller moon, characterized by its smooth surface and irregular shape.', true, 4);
INSERT INTO public.moon VALUES (32, 'Triton', 'Neptune''s largest moon, known for its retrograde orbit and geysers.', true, 5);
INSERT INTO public.moon VALUES (33, 'Proteus', 'A large, irregularly shaped moon of Neptune, with a heavily cratered surface.', true, 5);
INSERT INTO public.moon VALUES (34, 'Charon', 'The largest moon of Pluto, with a surface marked by large canyons and craters.', true, 6);
INSERT INTO public.moon VALUES (35, 'Nix', 'One of Pluto''s moons, characterized by its irregular shape and low density.', true, 6);
INSERT INTO public.moon VALUES (36, 'Hydra', 'Another moon of Pluto, known for its small size and irregular shape.', true, 6);
INSERT INTO public.moon VALUES (37, 'Ceres', 'The largest object in the asteroid belt, often classified as a dwarf planet.', true, 7);
INSERT INTO public.moon VALUES (38, 'Haumea', 'A dwarf planet with a highly elongated shape, located in the Kuiper Belt.', true, 7);
INSERT INTO public.moon VALUES (39, 'Makemake', 'A dwarf planet in the Kuiper Belt, known for its relatively high surface reflectivity.', true, 7);
INSERT INTO public.moon VALUES (40, 'Eris', 'A dwarf planet in the scattered disk, known for its high reflectivity and large size.', true, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the Sun.', true, true, 1, 'Terrestrial');
INSERT INTO public.planet VALUES (2, 'Mars', 'Known as the Red Planet.', false, true, 1, 'Terrestrial');
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Largest planet in the Solar System.', false, true, 1, 'Gas Giant');
INSERT INTO public.planet VALUES (4, 'Saturn', 'Known for its prominent ring system.', false, true, 1, 'Gas Giant');
INSERT INTO public.planet VALUES (5, 'Neptune', 'Farthest from the Sun.', false, true, 1, 'Ice Giant');
INSERT INTO public.planet VALUES (6, 'Uranus', 'Known for its tilted axis.', false, true, 1, 'Ice Giant');
INSERT INTO public.planet VALUES (7, 'Proxima b', 'Exoplanet in the Proxima Centauri system.', NULL, true, 2, 'Terrestrial');
INSERT INTO public.planet VALUES (8, 'Kepler-22b', 'Exoplanet in the habitable zone of its star.', NULL, true, 3, 'Terrestrial');
INSERT INTO public.planet VALUES (9, 'HD 209458 b', 'Also known as Osiris, a hot Jupiter.', false, true, 4, 'Gas Giant');
INSERT INTO public.planet VALUES (10, 'Gliese 581 g', 'Possibly in the habitable zone.', NULL, true, 5, 'Terrestrial');
INSERT INTO public.planet VALUES (11, '55 Cancri e', 'A rocky exoplanet with extreme temperatures.', false, true, 6, 'Rocky');
INSERT INTO public.planet VALUES (12, 'WASP-12b', 'An exoplanet known for its high temperature and rapid orbit.', false, true, 4, 'Gas Giant');


--
-- Data for Name: planet_characteristic; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_characteristic VALUES (1, 1, 'Atmosphere', 'Nitrogen-Oxygen mix');
INSERT INTO public.planet_characteristic VALUES (2, 1, 'Surface Temperature', '15°C');
INSERT INTO public.planet_characteristic VALUES (3, 1, 'Water Coverage', '71%');
INSERT INTO public.planet_characteristic VALUES (4, 2, 'Atmosphere', 'Thin CO2 atmosphere');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our solar system', 4600, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Closest known star to the Sun', 4500, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'One of the three stars in the Alpha Centauri system', 5000, 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'A red supergiant star in the Orion constellation', 8000, 4);
INSERT INTO public.star VALUES (5, 'Rigel', 'A blue supergiant star in the Orion constellation', 7000, 4);
INSERT INTO public.star VALUES (6, '47 Tucanae', 'A bright star in the constellation Tucana', 12000, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_characteristic_characteristic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_characteristic_characteristic_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: planet_characteristic planet_characteristic_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_characteristic
    ADD CONSTRAINT planet_characteristic_pkey PRIMARY KEY (planet_characteristic_id);


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
-- Name: planet_characteristic unique_characteristic_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_characteristic
    ADD CONSTRAINT unique_characteristic_id UNIQUE (planet_characteristic_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_characteristic planet_characteristic_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_characteristic
    ADD CONSTRAINT planet_characteristic_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

