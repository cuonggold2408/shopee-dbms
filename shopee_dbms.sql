--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    address_id integer NOT NULL,
    users_id integer,
    address_line character varying(255),
    phone_receiver character varying(255),
    name_receiver character varying(100),
    provine character varying(100),
    default_address boolean,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- Name: addresses_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.addresses_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.addresses_address_id_seq OWNER TO postgres;

--
-- Name: addresses_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.addresses_address_id_seq OWNED BY public.addresses.address_id;


--
-- Name: blacklists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blacklists (
    id integer NOT NULL,
    token character varying(255),
    expired integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.blacklists OWNER TO postgres;

--
-- Name: blacklists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blacklists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blacklists_id_seq OWNER TO postgres;

--
-- Name: blacklists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blacklists_id_seq OWNED BY public.blacklists.id;


--
-- Name: carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts (
    id integer NOT NULL,
    users_id integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.carts OWNER TO postgres;

--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carts_id_seq OWNER TO postgres;

--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    category_name character varying(100),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: classifyoptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classifyoptions (
    id integer NOT NULL,
    classify_id integer,
    option_name character varying(200),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.classifyoptions OWNER TO postgres;

--
-- Name: classifyoptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classifyoptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.classifyoptions_id_seq OWNER TO postgres;

--
-- Name: classifyoptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classifyoptions_id_seq OWNED BY public.classifyoptions.id;


--
-- Name: productclassifies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productclassifies (
    id integer NOT NULL,
    classify_name character varying(200) NOT NULL,
    product_id integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.productclassifies OWNER TO postgres;

--
-- Name: productclassifies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productclassifies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productclassifies_id_seq OWNER TO postgres;

--
-- Name: productclassifies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productclassifies_id_seq OWNED BY public.productclassifies.id;


--
-- Name: productimages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productimages (
    id integer NOT NULL,
    option_id integer,
    image_link character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.productimages OWNER TO postgres;

--
-- Name: productimages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productimages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productimages_id_seq OWNER TO postgres;

--
-- Name: productimages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productimages_id_seq OWNED BY public.productimages.id;


--
-- Name: productlines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productlines (
    id integer NOT NULL,
    category_id integer,
    productline_name character varying(200),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.productlines OWNER TO postgres;

--
-- Name: productlines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productlines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productlines_id_seq OWNER TO postgres;

--
-- Name: productlines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productlines_id_seq OWNED BY public.productlines.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    productline_id integer,
    product_name character varying(200),
    description text,
    quantity_in_stock integer,
    price numeric,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: user_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_tokens (
    id integer NOT NULL,
    user_id integer,
    device_name character varying(255),
    refresh_token character varying(255),
    otp character varying(4),
    expired_otp timestamp with time zone NOT NULL,
    status boolean,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.user_tokens OWNER TO postgres;

--
-- Name: user_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_tokens_id_seq OWNER TO postgres;

--
-- Name: user_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_tokens_id_seq OWNED BY public.user_tokens.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    users_id integer NOT NULL,
    username character varying(30),
    phone_number character varying(15),
    email character varying(50),
    password character varying(100),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_users_id_seq OWNER TO postgres;

--
-- Name: users_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_users_id_seq OWNED BY public.users.users_id;


--
-- Name: addresses address_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses ALTER COLUMN address_id SET DEFAULT nextval('public.addresses_address_id_seq'::regclass);


--
-- Name: blacklists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blacklists ALTER COLUMN id SET DEFAULT nextval('public.blacklists_id_seq'::regclass);


--
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: classifyoptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifyoptions ALTER COLUMN id SET DEFAULT nextval('public.classifyoptions_id_seq'::regclass);


--
-- Name: productclassifies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productclassifies ALTER COLUMN id SET DEFAULT nextval('public.productclassifies_id_seq'::regclass);


--
-- Name: productimages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productimages ALTER COLUMN id SET DEFAULT nextval('public.productimages_id_seq'::regclass);


--
-- Name: productlines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productlines ALTER COLUMN id SET DEFAULT nextval('public.productlines_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: user_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tokens ALTER COLUMN id SET DEFAULT nextval('public.user_tokens_id_seq'::regclass);


--
-- Name: users users_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN users_id SET DEFAULT nextval('public.users_users_id_seq'::regclass);


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SequelizeMeta" (name) FROM stdin;
20240323155440-create-user.js
20240323162808-create-user-token.js
20240323162909-create-blacklist.js
20240329040131-create-productline.js
20240329040309-create-product.js
20240329041716-create-category.js
20240329042518-add_foreignkey_productline.js
20240331031755-create-address.js
20240402044310-create-cart.js
20240406084345-create-product-classify.js
20240406171503-create-classify-option.js
20240409045013-create-product-image.js
\.


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (address_id, users_id, address_line, phone_receiver, name_receiver, provine, default_address, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: blacklists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blacklists (id, token, expired, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carts (id, users_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, category_name, created_at, updated_at) FROM stdin;
1	Laptop	2024-04-09 12:28:57.255787+07	2024-04-09 12:28:57.255787+07
2	Đồng hồ	2024-04-09 12:29:46.987849+07	2024-04-09 12:29:46.987849+07
3	Điện thoại	2024-04-09 19:42:01.597387+07	2024-04-09 19:42:01.597387+07
4	Thiết bị điện tử	2024-04-09 20:40:13.597051+07	2024-04-09 20:40:13.597051+07
5	Ba lô, túi, ví 	2024-04-10 13:40:18.021224+07	2024-04-10 13:40:18.021224+07
6	Thể thao và du lịch\n	2024-04-10 14:39:08.198257+07	2024-04-10 14:39:08.198257+07
\.


--
-- Data for Name: classifyoptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classifyoptions (id, classify_id, option_name, created_at, updated_at) FROM stdin;
1	1	white	2024-04-09 13:14:53.086149+07	2024-04-09 13:14:53.086149+07
2	2	gold	2024-04-09 13:14:53.086149+07	2024-04-09 13:14:53.086149+07
3	3	white	2024-04-09 13:33:03.173038+07	2024-04-09 13:33:03.173038+07
4	4	black	2024-04-09 13:50:09.643598+07	2024-04-09 13:50:09.643598+07
5	5	black	2024-04-09 13:51:40.305492+07	2024-04-09 13:51:40.305492+07
6	6	black	2024-04-09 13:53:21.924163+07	2024-04-09 13:53:21.924163+07
7	7	black	2024-04-09 13:54:35.864063+07	2024-04-09 13:54:35.864063+07
8	8	black	2024-04-09 13:56:07.655173+07	2024-04-09 13:56:07.655173+07
9	9	black	2024-04-09 13:57:21.455613+07	2024-04-09 13:57:21.455613+07
10	10	black	2024-04-09 14:03:34.256477+07	2024-04-09 14:03:34.256477+07
11	11	black	2024-04-09 14:07:23.956032+07	2024-04-09 14:07:23.956032+07
12	12	White	2024-04-09 14:12:18.999457+07	2024-04-09 14:12:18.999457+07
13	13	black	2024-04-09 14:17:53.72622+07	2024-04-09 14:17:53.72622+07
14	14	gray	2024-04-09 14:22:28.098251+07	2024-04-09 14:22:28.098251+07
15	14	gold	2024-04-09 14:22:52.693585+07	2024-04-09 14:22:52.693585+07
16	15	midnight\n	2024-04-09 14:29:32.326701+07	2024-04-09 14:29:32.326701+07
17	15	starlight	2024-04-09 14:29:32.326701+07	2024-04-09 14:29:32.326701+07
18	15	silver	2024-04-09 14:29:32.326701+07	2024-04-09 14:29:32.326701+07
19	15	gray	2024-04-09 14:29:32.326701+07	2024-04-09 14:29:32.326701+07
20	16	gray	2024-04-09 14:42:32.145084+07	2024-04-09 14:42:32.145084+07
21	17	black	2024-04-09 14:47:05.036142+07	2024-04-09 14:47:05.036142+07
22	18	gray	2024-04-09 15:09:24.646291+07	2024-04-09 15:09:24.646291+07
23	19	black	2024-04-09 15:14:33.920285+07	2024-04-09 15:14:33.920285+07
24	20	black	2024-04-09 15:20:17.079555+07	2024-04-09 15:20:17.079555+07
25	21	white	2024-04-09 15:20:42.169084+07	2024-04-09 15:20:42.169084+07
26	22	white	2024-04-09 15:45:47.017665+07	2024-04-09 15:45:47.017665+07
27	23	gray	2024-04-09 15:45:47.017665+07	2024-04-09 15:45:47.017665+07
28	24	white	2024-04-09 15:48:38.952935+07	2024-04-09 15:48:38.952935+07
29	25	red	2024-04-09 15:59:30.871686+07	2024-04-09 15:59:30.871686+07
30	25	black	2024-04-09 15:59:30.871686+07	2024-04-09 15:59:30.871686+07
31	25	white	2024-04-09 15:59:30.871686+07	2024-04-09 15:59:30.871686+07
32	26	xanh lá	2024-04-09 16:04:55.811479+07	2024-04-09 16:04:55.811479+07
33	26	tím 	2024-04-09 16:04:55.811479+07	2024-04-09 16:04:55.811479+07
34	26	hồng	2024-04-09 16:04:55.811479+07	2024-04-09 16:04:55.811479+07
35	27	bạc	2024-04-09 16:13:49.644758+07	2024-04-09 16:13:49.644758+07
36	27	vàng	2024-04-09 16:13:49.644758+07	2024-04-09 16:13:49.644758+07
37	27	đồng	2024-04-09 16:13:49.644758+07	2024-04-09 16:13:49.644758+07
38	28	Bạc đen 	2024-04-09 16:18:16.981561+07	2024-04-09 16:18:16.981561+07
39	28	Bạc Trắng	2024-04-09 16:18:16.981561+07	2024-04-09 16:18:16.981561+07
40	29	Trắng	2024-04-09 16:28:11.829513+07	2024-04-09 16:28:11.829513+07
41	29	Đỏ	2024-04-09 16:28:53.673052+07	2024-04-09 16:28:53.673052+07
42	30	white	2024-04-09 19:53:13.734766+07	2024-04-09 19:53:13.734766+07
43	30	gray	2024-04-09 19:53:13.734766+07	2024-04-09 19:53:13.734766+07
44	30	black	2024-04-09 19:53:13.734766+07	2024-04-09 19:53:13.734766+07
45	31	red	2024-04-09 19:54:23.497188+07	2024-04-09 19:54:23.497188+07
46	31	black	2024-04-09 19:54:23.497188+07	2024-04-09 19:54:23.497188+07
47	32	Blue	2024-04-09 19:58:23.666924+07	2024-04-09 19:58:23.666924+07
48	32	Gray	2024-04-09 19:58:23.666924+07	2024-04-09 19:58:23.666924+07
49	33	Blue	2024-04-09 20:01:23.222801+07	2024-04-09 20:01:23.222801+07
50	33	Black	2024-04-09 20:01:23.222801+07	2024-04-09 20:01:23.222801+07
51	33	Yellow	2024-04-09 20:01:23.222801+07	2024-04-09 20:01:23.222801+07
52	34	Gray	2024-04-09 20:08:01.323359+07	2024-04-09 20:08:01.323359+07
53	34	Purple	2024-04-09 20:08:01.323359+07	2024-04-09 20:08:01.323359+07
54	35	Yellow	2024-04-09 20:11:47.269444+07	2024-04-09 20:11:47.269444+07
55	35	Blue	2024-04-09 20:11:47.269444+07	2024-04-09 20:11:47.269444+07
56	36	Black	2024-04-09 20:18:22.607762+07	2024-04-09 20:18:22.607762+07
57	36	Green	2024-04-09 20:18:22.607762+07	2024-04-09 20:18:22.607762+07
58	37	Blue	2024-04-09 20:20:39.021721+07	2024-04-09 20:20:39.021721+07
59	37	Black	2024-04-09 20:20:39.021721+07	2024-04-09 20:20:39.021721+07
60	38	Black	2024-04-09 20:22:37.295398+07	2024-04-09 20:22:37.295398+07
61	38	Green	2024-04-09 20:22:37.295398+07	2024-04-09 20:22:37.295398+07
62	39	Midnight	2024-04-09 20:25:04.698777+07	2024-04-09 20:25:04.698777+07
63	39	Starlight	2024-04-09 20:25:04.698777+07	2024-04-09 20:25:04.698777+07
64	39	Pink	2024-04-09 20:25:04.698777+07	2024-04-09 20:25:04.698777+07
65	40	Blue	2024-04-09 20:27:10.575343+07	2024-04-09 20:27:10.575343+07
66	40	Pink	2024-04-09 20:27:10.575343+07	2024-04-09 20:27:10.575343+07
68	41	Midnight	2024-04-09 20:28:54.908676+07	2024-04-09 20:28:54.908676+07
67	41	Starlight	2024-04-09 20:28:54.908676+07	2024-04-09 20:28:54.908676+07
69	42	Blue	2024-04-09 20:32:25.69238+07	2024-04-09 20:32:25.69238+07
70	42	Pink	2024-04-09 20:32:25.69238+07	2024-04-09 20:32:25.69238+07
71	43	Purple	2024-04-09 20:34:23.171185+07	2024-04-09 20:34:23.171185+07
72	43	Green	2024-04-09 20:34:23.171185+07	2024-04-09 20:34:23.171185+07
73	44	Black	2024-04-09 20:36:53.476329+07	2024-04-09 20:36:53.476329+07
74	45	Green	2024-04-09 20:38:26.214354+07	2024-04-09 20:38:26.214354+07
75	46	White	2024-04-09 20:49:26.158746+07	2024-04-09 20:49:26.158746+07
76	47	Black	2024-04-09 20:51:01.777264+07	2024-04-09 20:51:01.777264+07
77	47	White	2024-04-09 20:51:01.777264+07	2024-04-09 20:51:01.777264+07
78	48	65 inch	2024-04-09 20:52:52.341847+07	2024-04-09 20:52:52.341847+07
79	49	Black	2024-04-09 20:55:11.534559+07	2024-04-09 20:55:11.534559+07
80	49	White	2024-04-09 20:55:19.863507+07	2024-04-09 20:55:19.863507+07
81	50	55 inch	2024-04-09 20:57:25.248151+07	2024-04-09 20:57:25.248151+07
82	51	White	2024-04-09 20:59:28.338738+07	2024-04-09 20:59:28.338738+07
83	51	Brown	2024-04-09 20:59:28.338738+07	2024-04-09 20:59:28.338738+07
84	52	9kg	2024-04-09 21:04:05.693615+07	2024-04-09 21:04:05.693615+07
85	53	White	2024-04-09 21:08:20.532627+07	2024-04-09 21:08:20.532627+07
86	54	Black	2024-04-09 21:18:18.265059+07	2024-04-09 21:18:18.265059+07
87	54	Pink	2024-04-09 21:18:18.265059+07	2024-04-09 21:18:18.265059+07
88	55	Black	2024-04-09 21:27:00.399123+07	2024-04-09 21:27:00.399123+07
89	55	White	2024-04-09 21:27:00.399123+07	2024-04-09 21:27:00.399123+07
90	56	Black	2024-04-09 21:28:53.284319+07	2024-04-09 21:28:53.284319+07
91	56	White	2024-04-09 21:28:53.284319+07	2024-04-09 21:28:53.284319+07
92	57	Black	2024-04-09 21:31:18.347204+07	2024-04-09 21:31:18.347204+07
93	58	Purple	2024-04-09 21:32:40.810313+07	2024-04-09 21:32:40.810313+07
94	58	Pink	2024-04-09 21:32:49.753681+07	2024-04-09 21:32:49.753681+07
95	59	Black	2024-04-09 21:35:03.139762+07	2024-04-09 21:35:03.139762+07
96	59	White	2024-04-09 21:35:03.139762+07	2024-04-09 21:35:03.139762+07
97	60	Pink	2024-04-09 21:37:31.537349+07	2024-04-09 21:37:31.537349+07
98	60	Gray	2024-04-09 21:37:31.537349+07	2024-04-09 21:37:31.537349+07
99	61	All Black	2024-04-10 13:53:59.972856+07	2024-04-10 13:53:59.972856+07
100	61	Black&White	2024-04-10 13:53:59.972856+07	2024-04-10 13:53:59.972856+07
101	62	Dark Gray	2024-04-10 13:53:59.972856+07	2024-04-10 13:53:59.972856+07
102	62	Light Gray	2024-04-10 13:53:59.972856+07	2024-04-10 13:53:59.972856+07
103	63	Tan	2024-04-10 13:58:59.971868+07	2024-04-10 13:58:59.971868+07
104	63	White	2024-04-10 13:58:59.971868+07	2024-04-10 13:58:59.971868+07
105	64	All Black	2024-04-10 14:01:02.109708+07	2024-04-10 14:01:02.109708+07
106	64	All Beige\n	2024-04-10 14:01:02.109708+07	2024-04-10 14:01:02.109708+07
107	65	Blue	2024-04-10 14:06:59.57779+07	2024-04-10 14:06:59.57779+07
108	65	Pink	2024-04-10 14:06:59.57779+07	2024-04-10 14:06:59.57779+07
109	66	Black	2024-04-10 14:08:51.668929+07	2024-04-10 14:08:51.668929+07
110	66	Pink	2024-04-10 14:09:13.614945+07	2024-04-10 14:09:13.614945+07
111	67	Black	2024-04-10 14:12:06.562538+07	2024-04-10 14:12:06.562538+07
112	67	Cream	2024-04-10 14:12:06.562538+07	2024-04-10 14:12:06.562538+07
113	68	Black	2024-04-10 14:13:50.809196+07	2024-04-10 14:13:50.809196+07
114	68	Pink	2024-04-10 14:13:50.809196+07	2024-04-10 14:13:50.809196+07
115	69	Cream	2024-04-10 14:17:03.704479+07	2024-04-10 14:17:03.704479+07
116	69	Black	2024-04-10 14:17:03.704479+07	2024-04-10 14:17:03.704479+07
117	70	Black	2024-04-10 14:18:57.097403+07	2024-04-10 14:18:57.097403+07
118	70	Green	2024-04-10 14:18:57.097403+07	2024-04-10 14:18:57.097403+07
119	71	Cream	2024-04-10 14:20:55.095672+07	2024-04-10 14:20:55.095672+07
120	71	Black	2024-04-10 14:20:55.095672+07	2024-04-10 14:20:55.095672+07
121	72	Black	2024-04-10 14:23:30.884697+07	2024-04-10 14:23:30.884697+07
122	72	Pink	2024-04-10 14:23:30.884697+07	2024-04-10 14:23:30.884697+07
123	73	White	2024-04-10 14:25:14.417332+07	2024-04-10 14:25:14.417332+07
124	73	Black	2024-04-10 14:25:14.417332+07	2024-04-10 14:25:14.417332+07
125	74	Blue	2024-04-10 14:34:01.482045+07	2024-04-10 14:34:01.482045+07
126	75	Black	2024-04-10 14:35:34.697627+07	2024-04-10 14:35:34.697627+07
127	76	White Green	2024-04-10 14:55:25.008393+07	2024-04-10 14:55:25.008393+07
128	76	White Black	2024-04-10 14:55:25.008393+07	2024-04-10 14:55:25.008393+07
129	77	5.5	2024-04-10 14:55:25.008393+07	2024-04-10 14:55:25.008393+07
130	77	6	2024-04-10 14:55:25.008393+07	2024-04-10 14:55:25.008393+07
131	77	6.5	2024-04-10 14:55:25.008393+07	2024-04-10 14:55:25.008393+07
132	78	Black White	2024-04-10 14:58:51.225631+07	2024-04-10 14:58:51.225631+07
133	78	White Green	2024-04-10 14:58:51.225631+07	2024-04-10 14:58:51.225631+07
134	79	5.5	2024-04-10 14:58:51.225631+07	2024-04-10 14:58:51.225631+07
135	79	9	2024-04-10 14:58:51.225631+07	2024-04-10 14:58:51.225631+07
136	80	Black White	2024-04-10 15:01:17.262978+07	2024-04-10 15:01:17.262978+07
137	81	7	2024-04-10 15:01:17.262978+07	2024-04-10 15:01:17.262978+07
138	81	8	2024-04-10 15:01:17.262978+07	2024-04-10 15:01:17.262978+07
139	81	9.5	2024-04-10 15:01:17.262978+07	2024-04-10 15:01:17.262978+07
140	82	Black	2024-04-10 15:03:12.830796+07	2024-04-10 15:03:12.830796+07
141	83	5.5	2024-04-10 15:03:12.830796+07	2024-04-10 15:03:12.830796+07
142	83	6	2024-04-10 15:03:12.830796+07	2024-04-10 15:03:12.830796+07
143	83	6.5	2024-04-10 15:03:12.830796+07	2024-04-10 15:03:12.830796+07
144	84	7	2024-04-10 15:07:04.400816+07	2024-04-10 15:07:04.400816+07
145	85	Q1224010	2024-04-10 15:09:57.0809+07	2024-04-10 15:09:57.0809+07
146	85	Q152010	2024-04-10 15:09:57.0809+07	2024-04-10 15:09:57.0809+07
147	86	7	2024-04-10 15:12:57.115464+07	2024-04-10 15:12:57.115464+07
148	87	White	2024-04-10 15:18:29.264052+07	2024-04-10 15:18:29.264052+07
149	87	Pink\n	2024-04-10 15:18:29.264052+07	2024-04-10 15:18:29.264052+07
150	88	35	2024-04-10 15:18:29.264052+07	2024-04-10 15:18:29.264052+07
151	88	36	2024-04-10 15:18:29.264052+07	2024-04-10 15:18:29.264052+07
152	89	PONY Hồng	2024-04-10 22:46:19.893524+07	2024-04-10 22:46:19.893524+07
153	89	PONY Xanh	2024-04-10 22:46:19.893524+07	2024-04-10 22:46:19.893524+07
154	90	MY071	2024-04-10 22:50:12.316982+07	2024-04-10 22:50:12.316982+07
155	91	White	2024-04-10 22:50:12.316982+07	2024-04-10 22:50:12.316982+07
156	91	Black\n	2024-04-10 22:54:20.686748+07	2024-04-10 22:54:20.686748+07
157	91	Green	2024-04-10 22:54:20.686748+07	2024-04-10 22:54:20.686748+07
158	92	Black	2024-04-10 22:56:10.027886+07	2024-04-10 22:56:10.027886+07
159	92	Blue	2024-04-10 22:56:16.947618+07	2024-04-10 22:56:16.947618+07
160	93	Black	2024-04-10 22:58:10.106646+07	2024-04-10 22:58:10.106646+07
161	94	Black	2024-04-10 23:00:07.0735+07	2024-04-10 23:00:07.0735+07
162	95	L	2024-04-10 23:00:07.0735+07	2024-04-10 23:00:07.0735+07
163	95	M	2024-04-10 23:00:07.0735+07	2024-04-10 23:00:07.0735+07
164	95	S	2024-04-10 23:00:07.0735+07	2024-04-10 23:00:07.0735+07
165	96	Green	2024-04-10 23:02:05.96163+07	2024-04-10 23:02:05.96163+07
\.


--
-- Data for Name: productclassifies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productclassifies (id, classify_name, product_id, created_at, updated_at) FROM stdin;
1	color	1	2024-04-09 13:10:05.209393+07	2024-04-09 13:10:05.209393+07
2	color	2	2024-04-09 13:10:05.209393+07	2024-04-09 13:10:05.209393+07
3	color	3	2024-04-09 13:10:05.209393+07	2024-04-09 13:10:05.209393+07
4	color	4	2024-04-09 13:48:22.341718+07	2024-04-09 13:48:22.341718+07
5	color	5	2024-04-09 13:48:22.341718+07	2024-04-09 13:48:22.341718+07
6	color	6	2024-04-09 13:48:22.341718+07	2024-04-09 13:48:22.341718+07
7	color	7	2024-04-09 13:48:22.341718+07	2024-04-09 13:48:22.341718+07
8	color	8	2024-04-09 13:48:22.341718+07	2024-04-09 13:48:22.341718+07
9	color	9	2024-04-09 13:48:22.341718+07	2024-04-09 13:48:22.341718+07
10	color	10	2024-04-09 14:03:12.609436+07	2024-04-09 14:03:12.609436+07
11	color	11	2024-04-09 14:06:59.717556+07	2024-04-09 14:06:59.717556+07
12	color	12	2024-04-09 14:11:06.065109+07	2024-04-09 14:11:06.065109+07
13	color	13	2024-04-09 14:17:27.894868+07	2024-04-09 14:17:27.894868+07
14	color	14	2024-04-09 14:27:44.281167+07	2024-04-09 14:27:44.281167+07
15	color	15	2024-04-09 14:37:41.149467+07	2024-04-09 14:37:41.149467+07
16	color	16	2024-04-09 14:41:51.080717+07	2024-04-09 14:41:51.080717+07
17	color	17	2024-04-09 14:46:25.80775+07	2024-04-09 14:46:25.80775+07
18	color	18	2024-04-09 15:09:01.281257+07	2024-04-09 15:09:01.281257+07
19	color	19	2024-04-09 15:14:03.561595+07	2024-04-09 15:14:03.561595+07
20	color	20	2024-04-09 15:19:20.156109+07	2024-04-09 15:19:20.156109+07
21	color	21	2024-04-09 15:19:42.162475+07	2024-04-09 15:19:42.162475+07
22	color	22	2024-04-09 15:31:36.928471+07	2024-04-09 15:31:36.928471+07
23	color	23	2024-04-09 15:44:19.661965+07	2024-04-09 15:44:19.661965+07
24	color	24	2024-04-09 15:44:19.661965+07	2024-04-09 15:44:19.661965+07
25	color	25	2024-04-09 15:56:21.789142+07	2024-04-09 15:56:21.789142+07
26	color	26	2024-04-09 16:03:27.439155+07	2024-04-09 16:03:27.439155+07
27	color	27	2024-04-09 16:12:44.722318+07	2024-04-09 16:12:44.722318+07
28	color	28	2024-04-09 16:17:13.566668+07	2024-04-09 16:17:13.566668+07
29	color	29	2024-04-09 16:23:38.759443+07	2024-04-09 16:23:38.759443+07
30	color	30	2024-04-09 19:49:57.051+07	2024-04-09 19:49:57.051+07
31	color	31	2024-04-09 19:50:19.219026+07	2024-04-09 19:50:19.219026+07
32	color	32	2024-04-09 19:57:28.962702+07	2024-04-09 19:57:28.962702+07
33	color	33	2024-04-09 20:00:32.277752+07	2024-04-09 20:00:32.277752+07
34	color	34	2024-04-09 20:07:17.644877+07	2024-04-09 20:07:17.644877+07
35	color	35	2024-04-09 20:10:26.174462+07	2024-04-09 20:10:26.174462+07
36	color	36	2024-04-09 20:17:48.722329+07	2024-04-09 20:17:48.722329+07
37	color	37	2024-04-09 20:19:58.734641+07	2024-04-09 20:19:58.734641+07
38	color	38	2024-04-09 20:22:10.083541+07	2024-04-09 20:22:10.083541+07
39	color	39	2024-04-09 20:24:13.916526+07	2024-04-09 20:24:13.916526+07
40	color	40	2024-04-09 20:26:51.648829+07	2024-04-09 20:26:51.648829+07
41	color	41	2024-04-09 20:28:34.44757+07	2024-04-09 20:28:34.44757+07
42	color	42	2024-04-09 20:31:31.206233+07	2024-04-09 20:31:31.206233+07
43	color	43	2024-04-09 20:33:54.395223+07	2024-04-09 20:33:54.395223+07
44	color	44	2024-04-09 20:36:31.007057+07	2024-04-09 20:36:31.007057+07
45	color	45	2024-04-09 20:38:07.014813+07	2024-04-09 20:38:07.014813+07
46	color	46	2024-04-09 20:49:13.444025+07	2024-04-09 20:49:13.444025+07
47	color	47	2024-04-09 20:50:44.789476+07	2024-04-09 20:50:44.789476+07
48	size	48	2024-04-09 20:52:40.606958+07	2024-04-09 20:52:40.606958+07
49	color	49	2024-04-09 20:54:58.373637+07	2024-04-09 20:54:58.373637+07
50	size	50	2024-04-09 20:57:15.350475+07	2024-04-09 20:57:15.350475+07
51	color	51	2024-04-09 20:59:07.941861+07	2024-04-09 20:59:07.941861+07
52	size	52	2024-04-09 21:03:55.683009+07	2024-04-09 21:03:55.683009+07
53	color	53	2024-04-09 21:08:02.14687+07	2024-04-09 21:08:02.14687+07
54	color	54	2024-04-09 21:17:51.574858+07	2024-04-09 21:17:51.574858+07
55	color	55	2024-04-09 21:26:27.468059+07	2024-04-09 21:26:27.468059+07
56	color	56	2024-04-09 21:28:34.35018+07	2024-04-09 21:28:34.35018+07
57	color	57	2024-04-09 21:31:08.021334+07	2024-04-09 21:31:08.021334+07
58	color	58	2024-04-09 21:32:28.559988+07	2024-04-09 21:32:28.559988+07
59	color	59	2024-04-09 21:34:41.267036+07	2024-04-09 21:34:41.267036+07
60	color	60	2024-04-09 21:37:14.088051+07	2024-04-09 21:37:14.088051+07
61	color	61	2024-04-10 13:48:46.724481+07	2024-04-10 13:48:46.724481+07
62	color	62	2024-04-10 13:48:46.724481+07	2024-04-10 13:48:46.724481+07
63	color	63	2024-04-10 13:58:16.80681+07	2024-04-10 13:58:16.80681+07
64	color	64	2024-04-10 14:00:37.745994+07	2024-04-10 14:00:37.745994+07
65	color	65	2024-04-10 14:06:24.030862+07	2024-04-10 14:06:24.030862+07
66	color	66	2024-04-10 14:08:37.860164+07	2024-04-10 14:08:37.860164+07
67	color	67	2024-04-10 14:11:36.753979+07	2024-04-10 14:11:36.753979+07
68	color	68	2024-04-10 14:13:32.254787+07	2024-04-10 14:13:32.254787+07
69	color	69	2024-04-10 14:16:35.092617+07	2024-04-10 14:16:35.092617+07
70	color	70	2024-04-10 14:18:33.554991+07	2024-04-10 14:18:33.554991+07
71	color	71	2024-04-10 14:20:33.241716+07	2024-04-10 14:20:33.241716+07
72	color	72	2024-04-10 14:23:10.091996+07	2024-04-10 14:23:10.091996+07
73	color	73	2024-04-10 14:24:50.4578+07	2024-04-10 14:24:50.4578+07
74	color	74	2024-04-10 14:33:41.226772+07	2024-04-10 14:33:41.226772+07
75	color	75	2024-04-10 14:35:21.949019+07	2024-04-10 14:35:21.949019+07
76	color	76	2024-04-10 14:53:52.208959+07	2024-04-10 14:53:52.208959+07
77	size	76	2024-04-10 14:53:52.208959+07	2024-04-10 14:53:52.208959+07
78	color	77	2024-04-10 14:57:56.936501+07	2024-04-10 14:57:56.936501+07
79	size	77	2024-04-10 14:57:56.936501+07	2024-04-10 14:57:56.936501+07
80	color	78	2024-04-10 15:00:36.490434+07	2024-04-10 15:00:36.490434+07
81	size	78	2024-04-10 15:00:36.490434+07	2024-04-10 15:00:36.490434+07
82	color	79	2024-04-10 15:02:36.586031+07	2024-04-10 15:02:36.586031+07
83	size	79	2024-04-10 15:02:36.586031+07	2024-04-10 15:02:36.586031+07
84	size 	80	2024-04-10 15:06:43.985689+07	2024-04-10 15:06:43.985689+07
85	type	81	2024-04-10 15:09:19.40241+07	2024-04-10 15:09:19.40241+07
86	size	82	2024-04-10 15:12:49.451604+07	2024-04-10 15:12:49.451604+07
87	color	83	2024-04-10 15:15:28.226304+07	2024-04-10 15:15:28.226304+07
88	size	83	2024-04-10 15:15:28.226304+07	2024-04-10 15:15:28.226304+07
89	color	84	2024-04-10 22:45:23.672526+07	2024-04-10 22:45:23.672526+07
90	Mẫu	85	2024-04-10 22:49:48.454924+07	2024-04-10 22:49:48.454924+07
91	color	86	2024-04-10 22:52:18.013283+07	2024-04-10 22:52:18.013283+07
92	color	87	2024-04-10 22:55:56.231229+07	2024-04-10 22:55:56.231229+07
93	color	88	2024-04-10 22:58:02.172659+07	2024-04-10 22:58:02.172659+07
94	color	89	2024-04-10 22:59:30.263077+07	2024-04-10 22:59:30.263077+07
95	size	89	2024-04-10 22:59:30.263077+07	2024-04-10 22:59:30.263077+07
96	color	90	2024-04-10 23:01:42.825299+07	2024-04-10 23:01:42.825299+07
\.


--
-- Data for Name: productimages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productimages (id, option_id, image_link, created_at, updated_at) FROM stdin;
1	1	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsrv0zt6wyhl81	2024-04-09 13:19:44.743508+07	2024-04-09 13:19:44.743508+07
2	2	https://down-vn.img.susercontent.com/file/031b1e57e7932d13598461fa47bed80f	2024-04-09 13:19:44.743508+07	2024-04-09 13:19:44.743508+07
3	3	https://down-vn.img.susercontent.com/file/sg-11134201-22120-979x5oormclv4a	2024-04-09 13:33:42.854061+07	2024-04-09 13:33:42.854061+07
4	4	https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lk0v2sktvwdw35	2024-04-09 13:50:44.830968+07	2024-04-09 13:50:44.830968+07
5	5	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lo6byk7tet1n75	2024-04-09 13:52:17.825633+07	2024-04-09 13:52:17.825633+07
6	6	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltdkkyqge9qc2f	2024-04-09 13:53:40.42171+07	2024-04-09 13:53:40.42171+07
7	7	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lkypphqcre1745	2024-04-09 13:55:06.183005+07	2024-04-09 13:55:06.183005+07
8	8	https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lgf2158gzh4af5	2024-04-09 13:56:28.715637+07	2024-04-09 13:56:28.715637+07
9	9	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lrpaxxjci7yc69	2024-04-09 13:57:49.078916+07	2024-04-09 13:57:49.078916+07
10	10	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lrzceeb8u9p5e9	2024-04-09 14:04:06.177345+07	2024-04-09 14:04:06.177345+07
11	11	https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lheblg07r6k3c3	2024-04-09 14:08:20.541989+07	2024-04-09 14:08:20.541989+07
12	12	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lq1lgoi046aa51	2024-04-09 14:12:57.815673+07	2024-04-09 14:12:57.815673+07
13	13	https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lhzrkzuoiz0h44	2024-04-09 14:18:24.859384+07	2024-04-09 14:18:24.859384+07
14	14	https://down-vn.img.susercontent.com/file/2477942b1ded3ec5ad3108a6e3140f63	2024-04-09 14:32:33.65458+07	2024-04-09 14:32:33.65458+07
15	15	https://down-vn.img.susercontent.com/file/9e9f0f01b5f4fcfe13252fd14edffa6b	2024-04-09 14:32:33.65458+07	2024-04-09 14:32:33.65458+07
16	16	https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lfnyqm2hqwl150	2024-04-09 14:32:33.65458+07	2024-04-09 14:32:33.65458+07
17	17	https://down-vn.img.susercontent.com/file/b2150ea41faeb08312da4bd22b71444c	2024-04-09 14:32:33.65458+07	2024-04-09 14:32:33.65458+07
18	18	https://down-vn.img.susercontent.com/file/4a0fca7e57521958328b84c61333cbc5	2024-04-09 14:32:33.65458+07	2024-04-09 14:32:33.65458+07
19	19	https://down-vn.img.susercontent.com/file/8555f09f4dd94f0640f10a3424897d24	2024-04-09 14:32:33.65458+07	2024-04-09 14:32:33.65458+07
20	20	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lpoybu8o1n7d7d	2024-04-09 14:44:07.070889+07	2024-04-09 14:44:07.070889+07
21	21	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lonme0wjicls34	2024-04-09 14:47:49.155305+07	2024-04-09 14:47:49.155305+07
22	22	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-loxgkgxxe7nye6	2024-04-09 15:10:10.811522+07	2024-04-09 15:10:10.811522+07
23	23	https://down-vn.img.susercontent.com/file/fef2e249c84b210bcf4f32edc765a660	2024-04-09 15:15:06.751199+07	2024-04-09 15:15:06.751199+07
24	24	https://down-vn.img.susercontent.com/file/1899880142b4c276fe29b686453c63d0	2024-04-09 15:21:13.089394+07	2024-04-09 15:21:13.089394+07
25	25	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lrwqbawq843o56	2024-04-09 15:21:51.634216+07	2024-04-09 15:21:51.634216+07
26	26	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lrwqbawq5ays66	2024-04-09 15:50:23.855996+07	2024-04-09 15:50:23.855996+07
27	27	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ln899o6phtmb58	2024-04-09 15:51:15.135612+07	2024-04-09 15:51:15.135612+07
28	28	https://down-vn.img.susercontent.com/file/9132e2b3e1ee18e308a728c7eefeb5df	2024-04-09 15:52:05.319455+07	2024-04-09 15:52:05.319455+07
29	29	https://down-vn.img.susercontent.com/file/vn-11134201-23020-0nvu6dd0tznv3f	2024-04-09 16:01:00.023055+07	2024-04-09 16:01:00.023055+07
30	30	https://down-vn.img.susercontent.com/file/vn-11134201-23020-zyz3l9c0tznv08	2024-04-09 16:01:00.023055+07	2024-04-09 16:01:00.023055+07
31	31	https://down-vn.img.susercontent.com/file/vn-11134207-23020-jep184oauznv9b	2024-04-09 16:01:00.023055+07	2024-04-09 16:01:00.023055+07
32	32	https://down-vn.img.susercontent.com/file/sg-11134201-7rbmt-lmvss8nhbcnkbc	2024-04-09 16:06:56.681896+07	2024-04-09 16:06:56.681896+07
33	33	https://down-vn.img.susercontent.com/file/sg-11134201-7rbni-lmvss8drpkd6c1	2024-04-09 16:06:56.681896+07	2024-04-09 16:06:56.681896+07
34	34	https://down-vn.img.susercontent.com/file/sg-11134201-7rbna-lmvss82y6ss9ab	2024-04-09 16:06:56.681896+07	2024-04-09 16:06:56.681896+07
35	35	https://down-vn.img.susercontent.com/file/9ce1a25391ebc391cefdf849f1d71c13	2024-04-09 16:15:10.695374+07	2024-04-09 16:15:10.695374+07
36	36	https://down-vn.img.susercontent.com/file/b89cb338c8a41cb30384c7bb8c542e13	2024-04-09 16:15:10.695374+07	2024-04-09 16:15:10.695374+07
37	37	https://down-vn.img.susercontent.com/file/2c756b62ae0e549f19779b2c0b7e61a8	2024-04-09 16:15:10.695374+07	2024-04-09 16:15:10.695374+07
38	38	https://down-vn.img.susercontent.com/file/8e70dfd4f4a62f44776da48c20633cde	2024-04-09 16:19:23.169664+07	2024-04-09 16:19:23.169664+07
39	39	https://down-vn.img.susercontent.com/file/b54a3c9b70d91625aa8febcc55506f4d	2024-04-09 16:19:23.169664+07	2024-04-09 16:19:23.169664+07
40	40	https://down-vn.img.susercontent.com/file/sg-11134201-22100-aju9xvub67iv2a	2024-04-09 16:30:18.47648+07	2024-04-09 16:30:18.47648+07
41	41	https://down-vn.img.susercontent.com/file/sg-11134201-22110-bbkz0jm5aikv09	2024-04-09 16:30:18.47648+07	2024-04-09 16:30:18.47648+07
42	42	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lr15xz94mvgkce	2024-04-09 19:53:35.624273+07	2024-04-09 19:53:35.624273+07
43	43	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lr15xz94polg9b	2024-04-09 19:53:35.624273+07	2024-04-09 19:53:35.624273+07
44	44	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lr15xz94r35wac	2024-04-09 19:53:35.624273+07	2024-04-09 19:53:35.624273+07
45	45	https://down-vn.img.susercontent.com/file/vn-11134201-7qukw-lkgj6yur5vvs49	2024-04-09 19:55:01.000946+07	2024-04-09 19:55:01.000946+07
46	46	https://down-vn.img.susercontent.com/file/vn-11134201-7qukw-lkgj6zjg5qy0f8	2024-04-09 19:55:01.000946+07	2024-04-09 19:55:01.000946+07
47	47	https://down-vn.img.susercontent.com/file/vn-11134201-7qukw-lkgj67wqldwoc5	2024-04-09 19:59:11.500911+07	2024-04-09 19:59:11.500911+07
48	48	https://down-vn.img.susercontent.com/file/vn-11134201-7qukw-lkgj68fbu658b0	2024-04-09 19:59:11.500911+07	2024-04-09 19:59:11.500911+07
49	49	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltw8ondfm7f1e7	2024-04-09 20:02:06.339501+07	2024-04-09 20:02:06.339501+07
50	50	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltw8ondfm7f1e7	2024-04-09 20:02:06.339501+07	2024-04-09 20:02:06.339501+07
51	51	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltw8ondfm7f1e7	2024-04-09 20:02:26.798611+07	2024-04-09 20:02:26.798611+07
52	52	https://down-vn.img.susercontent.com/file/4dbaa5cc2a5d160203f441936e694cdd	2024-04-09 20:08:53.624892+07	2024-04-09 20:08:53.624892+07
53	53	https://down-vn.img.susercontent.com/file/456d60aa7781a16b40d5c37805e557d4	2024-04-09 20:08:53.624892+07	2024-04-09 20:08:53.624892+07
54	54	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lkq2q29ifv68d3	2024-04-09 20:13:52.848702+07	2024-04-09 20:13:52.848702+07
55	55	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lkq2q29ih9qo5e	2024-04-09 20:13:52.848702+07	2024-04-09 20:13:52.848702+07
56	56	https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lj3wa0uchwpe68	2024-04-09 20:18:54.732575+07	2024-04-09 20:18:54.732575+07
57	57	https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lj3wa0ucgi4y92	2024-04-09 20:18:54.732575+07	2024-04-09 20:18:54.732575+07
58	58	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lskzx385sibobd	2024-04-09 20:20:58.785926+07	2024-04-09 20:20:58.785926+07
59	59	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lskzx386arpg62	2024-04-09 20:20:58.785926+07	2024-04-09 20:20:58.785926+07
60	60	https://down-vn.img.susercontent.com/file/vn-11134201-23030-vv7qtofli5nvdc	2024-04-09 20:23:05.489159+07	2024-04-09 20:23:05.489159+07
61	61	https://down-vn.img.susercontent.com/file/vn-11134201-23030-zy8sfnfli5nvd9	2024-04-09 20:23:05.489159+07	2024-04-09 20:23:05.489159+07
62	62	https://down-vn.img.susercontent.com/file/242a10dd98cc056cbd73d12fdf280b9b	2024-04-09 20:25:43.31352+07	2024-04-09 20:25:43.31352+07
63	63	https://down-vn.img.susercontent.com/file/376a1782e3fa6f29bf64c5dc2b4593b1	2024-04-09 20:25:43.31352+07	2024-04-09 20:25:43.31352+07
64	64	https://down-vn.img.susercontent.com/file/a5a089cdb8c1dcb5d5217771db5eb2b0	2024-04-09 20:25:43.31352+07	2024-04-09 20:25:43.31352+07
65	65	https://down-vn.img.susercontent.com/file/612e3bbb60fc0e99c5da05429e59a41e	2024-04-09 20:27:42.56971+07	2024-04-09 20:27:42.56971+07
66	66	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-llm05p5nkerg1c	2024-04-09 20:27:42.56971+07	2024-04-09 20:27:42.56971+07
67	67	https://down-vn.img.susercontent.com/file/894abf34e6dd49b78dc6f94393b9d4c7	2024-04-09 20:30:17.637004+07	2024-04-09 20:30:17.637004+07
68	68	https://down-vn.img.susercontent.com/file/a489bd2cce38bbad21d17da921d2a44b	2024-04-09 20:30:17.637004+07	2024-04-09 20:30:17.637004+07
69	69	 https://down-vn.img.susercontent.com/file/612e3bbb60fc0e99c5da05429e59a41e	2024-04-09 20:32:30.480699+07	2024-04-09 20:32:30.480699+07
70	70	https://down-vn.img.susercontent.com/file/76702517db292804c709fec290b42541	2024-04-09 20:32:30.480699+07	2024-04-09 20:32:30.480699+07
71	71	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-llu2uhgdco9r93	2024-04-09 20:34:48.904336+07	2024-04-09 20:34:48.904336+07
72	72	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-llu2uhgde2u712	2024-04-09 20:34:48.904336+07	2024-04-09 20:34:48.904336+07
73	73	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lm41ax6qczq75d	2024-04-09 20:37:04.576453+07	2024-04-09 20:37:04.576453+07
74	74	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lt26y8ebza1l21	2024-04-09 20:38:38.884673+07	2024-04-09 20:38:38.884673+07
75	75	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lnh04gjkeewd20	2024-04-09 20:49:40.684023+07	2024-04-09 20:49:40.684023+07
76	76	https://down-vn.img.susercontent.com/file/29e9aaf20c0d504d295716a7ef198549	2024-04-09 20:51:22.030721+07	2024-04-09 20:51:22.030721+07
77	77	https://down-vn.img.susercontent.com/file/831f7195d5cf8af2ccc18ce8fd160fc3	2024-04-09 20:51:22.030721+07	2024-04-09 20:51:22.030721+07
78	78	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lnh04gjkimlpa8	2024-04-09 20:53:08.422804+07	2024-04-09 20:53:08.422804+07
79	79	https://down-vn.img.susercontent.com/file/f9319a96c3074f851f69a1cb85f3fafc	2024-04-09 20:55:55.201749+07	2024-04-09 20:55:55.201749+07
80	80	https://down-vn.img.susercontent.com/file/5487d26dd7c36945f6a3e4f7a7a7da2b	2024-04-09 20:55:55.201749+07	2024-04-09 20:55:55.201749+07
81	81	https://down-vn.img.susercontent.com/file/vn-11134207-23030-ng84drd6glov2b	2024-04-09 20:57:45.127834+07	2024-04-09 20:57:45.127834+07
82	82	https://down-vn.img.susercontent.com/file/331d38edca4f7e3b2ce69c06fcbeb72a	2024-04-09 21:00:04.366931+07	2024-04-09 21:00:04.366931+07
83	83	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltnt6vjz4r9p74	2024-04-09 21:00:04.366931+07	2024-04-09 21:00:04.366931+07
84	84	https://down-vn.img.susercontent.com/file/vn-11134207-23030-ku3stqpchlovb1	2024-04-09 21:04:22.48644+07	2024-04-09 21:04:22.48644+07
85	85	https://down-vn.img.susercontent.com/file/vn-11134207-23030-bfqsk55golov7a	2024-04-09 21:08:38.942527+07	2024-04-09 21:08:38.942527+07
86	86	https://down-vn.img.susercontent.com/file/sg-11134201-22120-osp9d32eb3kva8	2024-04-09 21:18:51.311611+07	2024-04-09 21:18:51.311611+07
87	87	https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lgk65wctktwq5f	2024-04-09 21:18:51.311611+07	2024-04-09 21:18:51.311611+07
88	88	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-llf6nvla6fnsb8	2024-04-09 21:27:30.215219+07	2024-04-09 21:27:30.215219+07
89	89	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-llf6nvla7u88e4	2024-04-09 21:27:30.215219+07	2024-04-09 21:27:30.215219+07
90	90	https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lhd38f5tdipfdb	2024-04-09 21:29:15.514155+07	2024-04-09 21:29:15.514155+07
91	91	https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lhd38f5tex9v35	2024-04-09 21:29:15.514155+07	2024-04-09 21:29:15.514155+07
92	92	https://down-vn.img.susercontent.com/file/b0bb8cb32db6eac11e8fa0a3bf52bbec	2024-04-09 21:31:31.061738+07	2024-04-09 21:31:31.061738+07
93	93	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltezxawgj216df	2024-04-09 21:33:21.755306+07	2024-04-09 21:33:21.755306+07
94	94	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltezxawgkglm9d	2024-04-09 21:33:21.755306+07	2024-04-09 21:33:21.755306+07
95	95	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmjqq9jdgafzd0	2024-04-09 21:35:56.82877+07	2024-04-09 21:35:56.82877+07
96	96	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmjqq9jdhp0f3b	2024-04-09 21:35:56.82877+07	2024-04-09 21:35:56.82877+07
97	97	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lntgv3c7z3ay58	2024-04-09 21:37:53.855493+07	2024-04-09 21:37:53.855493+07
98	98	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lntgv3c81wfuce	2024-04-09 21:37:53.855493+07	2024-04-09 21:37:53.855493+07
99	99	https://down-vn.img.susercontent.com/file/60ee0eea4552f123b0bb2f8d9b3abdf6	2024-04-10 13:56:20.252688+07	2024-04-10 13:56:20.252688+07
100	100	https://down-vn.img.susercontent.com/file/4bd2d2b878ea19d1591afb6812c0d691	2024-04-10 13:56:20.252688+07	2024-04-10 13:56:20.252688+07
101	101	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lqol2vrmn2z647	2024-04-10 13:56:20.252688+07	2024-04-10 13:56:20.252688+07
102	102	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lqol2vrmohjm76	2024-04-10 13:56:20.252688+07	2024-04-10 13:56:20.252688+07
103	103	https://down-vn.img.susercontent.com/file/vn-11134201-23020-264qffpphynvbe	2024-04-10 13:59:31.580378+07	2024-04-10 13:59:31.580378+07
104	104	https://down-vn.img.susercontent.com/file/vn-11134201-23020-llxzovashynvd3	2024-04-10 13:59:31.580378+07	2024-04-10 13:59:31.580378+07
105	105	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lqomuxfoca4760	2024-04-10 14:01:29.922555+07	2024-04-10 14:01:29.922555+07
106	106	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lqomuxfodoon08	2024-04-10 14:01:29.922555+07	2024-04-10 14:01:29.922555+07
107	107	https://down-vn.img.susercontent.com/file/ced297fb50e05dc29d3baa7fab10e5ba	2024-04-10 14:07:40.590642+07	2024-04-10 14:07:40.590642+07
108	108	https://down-vn.img.susercontent.com/file/4e015c956f34666a756619e4a4f03577	2024-04-10 14:07:40.590642+07	2024-04-10 14:07:40.590642+07
109	109	https://down-vn.img.susercontent.com/file/e8f4b3d19764e4797dd9941d09317937	2024-04-10 14:09:40.742038+07	2024-04-10 14:09:40.742038+07
110	110	https://down-vn.img.susercontent.com/file/17506483070b01d1740256f79768c4af	2024-04-10 14:09:40.742038+07	2024-04-10 14:09:40.742038+07
111	111	https://down-vn.img.susercontent.com/file/be277215fd34c17371ff5ae817edfe36	2024-04-10 14:12:30.789723+07	2024-04-10 14:12:30.789723+07
112	112	https://down-vn.img.susercontent.com/file/eff350ef438c34b1f72716d361b3d9f9	2024-04-10 14:12:30.789723+07	2024-04-10 14:12:30.789723+07
113	113	https://down-vn.img.susercontent.com/file/c739a2c8f50ae7dde56e2337b32cb74e	2024-04-10 14:14:48.256462+07	2024-04-10 14:14:48.256462+07
114	114	https://down-vn.img.susercontent.com/file/9ffc4bb4c17e84c05ce250bbfe4e53f9	2024-04-10 14:14:48.256462+07	2024-04-10 14:14:48.256462+07
115	116	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lthh74q4ruvea7	2024-04-10 14:17:26.524195+07	2024-04-10 14:17:26.524195+07
116	116	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lto3bcwkafpp63	2024-04-10 14:17:26.524195+07	2024-04-10 14:17:26.524195+07
117	117	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lnqyj9v18pyyde	2024-04-10 14:19:22.709447+07	2024-04-10 14:19:22.709447+07
118	118	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltnuxyjpuj9pb5	2024-04-10 14:19:22.709447+07	2024-04-10 14:19:22.709447+07
119	119	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltpcl17vypsd57	2024-04-10 14:21:16.810001+07	2024-04-10 14:21:16.810001+07
120	120	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltpcl185oh719e	2024-04-10 14:21:16.810001+07	2024-04-10 14:21:16.810001+07
121	121	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lntrb0yn8g6le4	2024-04-10 14:23:48.92809+07	2024-04-10 14:23:48.92809+07
122	122	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lpqq4r7kr1le0c	2024-04-10 14:23:48.92809+07	2024-04-10 14:23:48.92809+07
123	123	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-llyh16y4js9red	2024-04-10 14:25:36.484372+07	2024-04-10 14:25:36.484372+07
124	124	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lr49vbfkn061e3	2024-04-10 14:25:36.484372+07	2024-04-10 14:25:36.484372+07
125	125	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lswxtaxph87805	2024-04-10 14:34:15.01553+07	2024-04-10 14:34:15.01553+07
126	126	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lr49vbfkoeqh2a	2024-04-10 14:35:47.151116+07	2024-04-10 14:35:47.151116+07
127	127	https://down-vn.img.susercontent.com/file/9b0e056fe85f83f17437280e97c48d18	2024-04-10 14:56:47.550783+07	2024-04-10 14:56:47.550783+07
128	128	https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-ligz4w659vbm31	2024-04-10 14:56:47.550783+07	2024-04-10 14:56:47.550783+07
129	132	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ln0uwh66oc0o2e	2024-04-10 14:59:18.225931+07	2024-04-10 14:59:18.225931+07
130	133	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmzw7c2b1ty09c	2024-04-10 14:59:18.225931+07	2024-04-10 14:59:18.225931+07
131	136	https://down-vn.img.susercontent.com/file/32e065c74c7d85d8a33ce8e7b42226a1	2024-04-10 15:01:30.083347+07	2024-04-10 15:01:30.083347+07
132	140	https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lfs45hzr7fje4f	2024-04-10 15:03:27.76547+07	2024-04-10 15:03:27.76547+07
133	144	https://down-vn.img.susercontent.com/file/sg-11134201-23010-1po82jyatwlve1	2024-04-10 15:07:27.795087+07	2024-04-10 15:07:27.795087+07
134	145	https://down-vn.img.susercontent.com/file/sg-11134201-22110-u2g0zikkqljv44	2024-04-10 15:10:23.39081+07	2024-04-10 15:10:23.39081+07
135	146	https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lhuahng3h4058b	2024-04-10 15:10:23.39081+07	2024-04-10 15:10:23.39081+07
136	147	https://down-vn.img.susercontent.com/file/d48b1f6e36b968ceb6d274728f2d02b8	2024-04-10 15:13:03.691725+07	2024-04-10 15:13:03.691725+07
137	148	https://down-vn.img.susercontent.com/file/sg-11134201-23020-w9l7su1fz3mvc7	2024-04-10 15:18:53.964471+07	2024-04-10 15:18:53.964471+07
138	149	https://down-vn.img.susercontent.com/file/sg-11134201-23020-gvpehw9fz3mve0	2024-04-10 15:18:53.964471+07	2024-04-10 15:18:53.964471+07
139	152	https://down-vn.img.susercontent.com/file/7bc5b4dcd5a451a802365fef800f74be	2024-04-10 22:46:53.182091+07	2024-04-10 22:46:53.182091+07
140	153	https://down-vn.img.susercontent.com/file/47e64afa846ac443840c36b5fdf9f4bb	2024-04-10 22:46:53.182091+07	2024-04-10 22:46:53.182091+07
141	154	https://down-vn.img.susercontent.com/file/2ff0ac53ed210274a19f55312f07e590	2024-04-10 22:54:52.046382+07	2024-04-10 22:54:52.046382+07
142	155	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lla7mtaynr2g6d	2024-04-10 22:54:52.046382+07	2024-04-10 22:54:52.046382+07
143	156	https://down-vn.img.susercontent.com/file/3a0db9d366f9c3e986e8623b2d0394e9	2024-04-10 22:54:52.046382+07	2024-04-10 22:54:52.046382+07
144	157	https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lla7mtayqk7c9e	2024-04-10 22:54:52.046382+07	2024-04-10 22:54:52.046382+07
145	158	https://down-vn.img.susercontent.com/file/76bbaa3a7405c3f9e302348ae3806b90	2024-04-10 22:56:46.212902+07	2024-04-10 22:56:46.212902+07
146	159	https://down-vn.img.susercontent.com/file/938040002c37cc5b99979a0457b20e5f	2024-04-10 22:56:46.212902+07	2024-04-10 22:56:46.212902+07
147	160	https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-ltwe1h493gtef2	2024-04-10 22:58:22.339974+07	2024-04-10 22:58:22.339974+07
148	161	https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-ltw9rkc5cw5n7e	2024-04-10 23:00:18.91178+07	2024-04-10 23:00:18.91178+07
149	165	https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-ltwd7ydiaion12	2024-04-10 23:02:24.130752+07	2024-04-10 23:02:24.130752+07
\.


--
-- Data for Name: productlines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productlines (id, category_id, productline_name, created_at, updated_at) FROM stdin;
1	1	HP	2024-04-09 12:32:00.772348+07	2024-04-09 12:32:00.772348+07
2	1	Asus	2024-04-09 12:32:00.772348+07	2024-04-09 12:32:00.772348+07
3	1	Dell\n	2024-04-09 12:34:05.108116+07	2024-04-09 12:34:05.108116+07
4	1	Acer\n	2024-04-09 12:34:05.108116+07	2024-04-09 12:34:05.108116+07
5	1	Lenovo	2024-04-09 12:34:05.108116+07	2024-04-09 12:34:05.108116+07
6	1	Apple Macbook	2024-04-09 12:34:05.108116+07	2024-04-09 12:34:05.108116+07
7	2	Casio	2024-04-09 12:37:15.443671+07	2024-04-09 12:37:15.443671+07
8	2	XiaoYa	2024-04-09 12:37:15.443671+07	2024-04-09 12:37:15.443671+07
9	2	TVB Watches	2024-04-09 12:37:15.443671+07	2024-04-09 12:37:15.443671+07
10	2	Julius	2024-04-09 12:37:15.443671+07	2024-04-09 12:37:15.443671+07
11	2	Royal Crown	2024-04-09 12:37:15.443671+07	2024-04-09 12:37:15.443671+07
12	2	Mall	2024-04-09 12:37:15.443671+07	2024-04-09 12:37:15.443671+07
13	2	YouWatch	2024-04-09 12:37:15.443671+07	2024-04-09 12:37:15.443671+07
14	2	Olevs	2024-04-09 12:37:15.443671+07	2024-04-09 12:37:15.443671+07
15	3	Samsung	2024-04-09 19:42:52.6761+07	2024-04-09 19:42:52.6761+07
16	3	Oppo	2024-04-09 19:44:51.554758+07	2024-04-09 19:44:51.554758+07
17	3	Iphone	2024-04-09 19:44:51.554758+07	2024-04-09 19:44:51.554758+07
18	3	Vivo	2024-04-09 19:44:51.554758+07	2024-04-09 19:44:51.554758+07
19	4	Sony	2024-04-09 19:44:51.554758+07	2024-04-09 19:44:51.554758+07
20	4	LG	2024-04-09 20:48:03.827078+07	2024-04-09 20:48:03.827078+07
21	4	Logitech	2024-04-09 20:48:03.827078+07	2024-04-09 20:48:03.827078+07
22	4	Baseus	2024-04-09 20:48:03.827078+07	2024-04-09 20:48:03.827078+07
23	5	Bama	2024-04-10 13:40:52.81677+07	2024-04-10 13:40:52.81677+07
24	5	Glado	2024-04-10 13:41:23.895731+07	2024-04-10 13:41:23.895731+07
25	5	Vachino	2024-04-10 13:42:36.755945+07	2024-04-10 13:42:36.755945+07
26	5	Hapas	2024-04-10 13:42:36.755945+07	2024-04-10 13:42:36.755945+07
27	6	Anta	2024-04-10 14:39:54.085113+07	2024-04-10 14:39:54.085113+07
28	6	Peak	2024-04-10 14:39:54.085113+07	2024-04-10 14:39:54.085113+07
29	6	Popo	2024-04-10 14:41:25.78066+07	2024-04-10 14:41:25.78066+07
30	6	Supersports	2024-04-10 14:41:25.78066+07	2024-04-10 14:41:25.78066+07
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, productline_id, product_name, description, quantity_in_stock, price, created_at, updated_at) FROM stdin;
1	1	Laptop HP 15s-Fq5231TU ( 8U241PA )Silver I3 1215U 8GB 256GB SSD 15.6 Inch FHD 3 Cell Win 11 Home 1Yr	Thông Số Kỹ Thuật\n\nHãng sản xuất HP \n\nModel 15s-fq5231TU\n\nPart Number 8U241PA \n\nMàu sắc Natural Silver\n\nBảo hành 12 tháng\n\nBộ vi xử lý Intel® Core™ i3-1215U (up to 4.4 GHz with Intel® Turbo Boost Technology, 10 MB L3 cache, 6 cores, 8 threads)\n\nRAM 8 GB DDR4-3200 MHz RAM (1 x 8 GB)VGAIntel UHD Graphics\n\nỔ cứng 256GB PCIe® NVMe™ M.2 SSDMàn hình39.6 cm (15.6") diagonal, FHD (1920 x 1080), micro-edge, anti-glare, 250 nits, 45% NTSC\n\nCổng giao tiếp 1 USB Type-C® 5Gbps signaling rate (supports data transfer only and does not support charging or external monitors);\n\n2 USB Type-A 5Gbps signaling rate;\n\n1 AC smart pin;\n\n1 HDMI 1.4b;\n\n1 headphone/microphone combo\n\nKết nối mạng Realtek RTL8822CE 802.11a/b/g/n/ac (2x2) Wi-Fi® and Bluetooth® 5 wireless cardPin3-cell, 41 Wh Li-ion,Up to 7 hours and 30 minutes \n\nKích thước 35.85 x 24.2 x 1.79 cm \n\nCân nặng1.69 kg\n\nHệ điều hành Win 11 Home 	100	9490000	2024-04-09 12:44:14.309358+07	2024-04-09 12:44:14.309358+07
2	1	Laptop HP 240 G9 6L1X7PA (Core i3-1215U | 8GB | 256GB |14 inch FHD| Win11)	Laptop HP 240 G9 6L1X7PA (Intel Core i3-1215U | 8GB | 256GB | Intel Iris Xe | 14 inch FHD | Win 11 | Bạc)\n\n\n\nCPU: Intel Core i3-1215U (upto 4.40 GHz, 10MB)\n\nRAM: 8GB (1 x 8GB) DDR4-3200MHz (2 khe)\n\nỔ cứng: 256GB PCIe NVMe SSD\n\nVGA: Intel UHD Graphics\n\nMàn hình: 14 inch FullHD (1920 x 1080), IPS, narrow bezel, anti-glare, 250 nits, 45% NTSC\n\nPin: 3-cell, 41 Wh Li-ion\n\nCân nặng: 1.47 kg\n\nMàu sắc: Bạc\n\nBảo hành : 12 tháng \n\n\n\n=============\n\n***Sản phẩm có xuất hóa đơn VAT , quý khách hàng xin cung cấp thông tin lấy hóa đơn (email và thông tin MST) trước khi nhận hàng . Shop sẽ gửi hóa đơn VAT qua email trong vòng 3 ngày sau khi đơn hàng nhận thành công. \n\n\n\nAnPhatPC - Hơn 19 năm kinh nghiệm phân phối sản phẩm IT.\n\n\n\nCam kết bảo hành \n\n- Cam kết 100% chính hãng.\n\n- Bảo hành theo chính sách của nhà sản xuất: Tem serial trên sản phẩm + Phiếu bảo hành\n\n- Đổi trả trong vòng 7 ngày: Lỗi nhà sản xuất, hư hỏng trong quá trình vận chuyển, giao sai hoặc thiếu phụ kiện.\n\n- Hotline Chăm sóc Khách hàng: 0902.11.12.13\n\n- Facebook Page: https://www.facebook.com/An-Ph%C3%A1t-Computer-Shopee-112629741455805 \n\n- Youtube : https://www.youtube.com/c/AnPhatComputerpc\n\n\n\nĐịa chỉ shop : \n\n\n\n1. 49 Thái Hà - Đống Đa - Hà Nội\n\n2. 151 Lê Thanh Nghị - Hai Bà Trưng - Hà Nội\n\n3. 63 Trần Thái Tông - Phường Dịch Vọng - Cầu Giấy - Hà Nội\n\n4. 158 - 160 Lý Thường Kiệt P.14 - Q.10 - TPHCM\n\n5. 330-332 Võ Văn Tần, Phường 5, Q.3, TPHCM\n\n6. Số 4 Nguyễn Văn Cừ - Ninh Xá - Thành phố Bắc Ninh	100	9990000	2024-04-09 12:44:14.309358+07	2024-04-09 12:44:14.309358+07
3	1	[Nhập ELHP15 giảm 15%] LapTop HP Pavilion 15 eg2059TU-6K789PA|i5 1240P|8GB | 256GB SSD | 15.6" FHD IPS | Win 11	THÔNG SỐ KỸ THUẬT\n\nCPU\t\t\t12th Generation Intel® Alder Lake Core™ i5 _ 1240P Processor (1.70 GHz, 12MB Cache Up to 4.40 GHz, 12 Cores 16 Threads)\n\nMemory\t\t\t8GB DDr4 Bus 3200Mhz (2 Slot, 4GB x 02, Dual Chanel)\n\nHard Disk\t\t\t256GB PCIe® NVMe™ M.2 SSD\n\nVGA\t\t\tIntegrated Intel® Iris® Xe Graphics\n\nDisplay\t\t\t15.6 inch Diagonal Full HD (1920 x 1080) IPS Micro Edge BrightView 250 Nits 45% NTSC\n\nOther\t\t\tHP Wide Vision 720p HD Camera, Audio B&O Dual Speakers, HP Audio Boost, Multi Format SD Media Card Reader, Headphone / Microphone Combo, HDMI 2.0, SuperSpeed USB Type A 5Gbps Signaling Rate, SuperSpeed USB Type C® 10Gbps Signaling Rate (USB Power Delivery, DisplayPort™ 1.4, HP Sleep and Charge)\n\nWireless\t\t\tWi-Fi 6 MT7921 (2x2) and Bluetooth® 5.2 combo\n\nBattery\t\t\t3 Cells 41 Whrs Battery\n\nWeight\t\t\t1,70 Kg\n\nSoftWare\t\t\tWindows 11 Home SL 64bit\n\nXuất xứ\t\t\tBrand New 100%, Hàng Phân Phối Chính Hãng Tại Việt Nam, Bảo Hành Chính Hãng\n\nMàu sắc\t\t\tAluminum Silver\n\nBảo hành\t\t\t12 tháng\n\nBộ sản phẩm\t\t\tThùng máy, Máy tính, Bộ sạc, Hướng dẫn sử dụng\n\n-----------------------------------------------------------------------------------------------------------------------------------------------\n\nMÔ TẢ TÍNH NĂNG\n\nLaptop HP Pavilion 15-eg2059TU được thiết kế vừa chắc chắn bền bỉ, vừa tạo cảm giác dễ chịu, mát tay cho người dùng nhờ lớp chiếu nghỉ tay bằng kim loại. Máy có trọng lượng nhẹ thuận lợi cho bạn trong quá trình di chuyển, với kích thước này bạn có thể đặt nó nằm gọn trong chiếc balo mang theo bên mình.\n\n\n\nMàn hình 15.6 inch với độ phân giải Full HD IPS (1920 x 1080) đem đến chất lượng hình ảnh hiển thị sắc nét, giúp màn hình có độ sáng cao, màu sắc khá tốt.\n\n\n\nĐi kèm với CPU Intel Core i5-1240P là card đồ họa tích hợp Intel Iris Xe Graphics hỗ trợ đáng kể khả năng xử lý đa tác vụ của máy, cho phép người dùng sử dụng các ứng dụng Photoshop, AI,... một cách mượt mà. Ổ cứng SSD 256GB PCIe NVMe đem đến cho người dùng một không gian lưu trữ rộng rãi, đồng thời đẩy nhanh tốc độ truy xuất dữ liệu, giúp mở máy và khởi động ứng dụng một cách nhanh chóng.\n\n\n\nDọc hai bên thành máy là các cổng kết nối thông dụng giúp bạn kết nối dễ dàng với các thiết bị ngoại vi. Ngoài ra kết nối Wi-Fi và Bluetooth hiện đại cũng được trang bị, đảm bảo các kết nối trực tuyến của bạn luôn được ổn định, mượt mà.\n\n\n\nBàn phím laptop được thiết kế hợp lý, hành trình phím sâu, nút bấm êm, độ nảy tốt và được tích hợp bàn phím số giúp việc nhập liệu trở nên dễ dàng, chính xác.	100	14790000	2024-04-09 12:45:15.368888+07	2024-04-09 12:45:15.368888+07
4	2	Laptop Asus Vivobook 15X A1503ZA-L1422W i5-12500H|Xe Graphics|8GB|512GB|15.6'' OLED\n\n4.5\n\n15\nRatings\n35\nSold	Laptop Asus Vivobook 15X A1503ZA-L1422W i5-12500H|Xe Graphics|8GB|512GB|15.6'' OLED\n\n4.5\n\n15\nRatings\n35\nSold	100	15950000	2024-04-09 12:50:42.837209+07	2024-04-09 12:50:42.837209+07
6	2	Laptop ASUS Expertbook B1 B1402CBA NK1535W| i3-1215U| 8GB DDR4|256GB SSD	Product Description\nThông số kĩ thuật:\n\n\n\nCPU\tIntel® Core™ i3-1215U Processor 1.2 GHz (10M Cache, up to 4.4 GHz, 6 cores)\n\nRam\t8GB DDR4 3200MHz (8GB onboard + 1 slot, nâng cấp tối đa 16GB)\n\nỔ cứng\t256GB PCIE G3 SSD (Còn trống 1 khe 2.5" HDD up to 1TB)\n\nCard đồ họa\tIntel® UHD Graphics\n\nMàn hình\t14.0-inch, FHD (1920 x 1080) 16:9, TN, Màn hình chống chói, Đèn nền LED, 220nits, NTSC: 45%, Tỷ lệ màn hình trên kích thước: 81%\n\nCổng giao tiếp\t1x USB 2.0 Type-A\n\n1x USB 3.2 Thế hệ 1 Type-A\n\n1x USB 3.2 Gen 1 Type-C hỗ trợ sạc chuẩn Power Delivery\n\n1x USB 3.2 thế hệ 2 Type-C hỗ trợ màn hình / sạc nhanh\n\n1x HDMI 1.4, lên đến 1920x1080/60Hz\n\n1 Jack cắm âm thanh combo 3.5mm\n\n1x RJ45 Gigabit Ethernet\n\nBàn phím\tBàn phím dạng Chiclet, Hành trình phím 1,4mm, Bàn phím chống tràn đổ\n\nChuẩn LAN\t100/1000M\n\nChuẩn WIFI\tWi-Fi 6(802.11ax) (Dual band) 2*2\n\nBluetooth\tBluetooth® 5.2 Wireless Card\n\nAudio\tBuilt-in speaker\n\nBuilt-in array microphone\n\nBảo mật\tCảm biến bảo mật vân tay tích hợp phím nguồn\n\nKensington Security Slot™\n\nBảo vệ mật khẩu người dùng BIOS\n\nComputrace ready from BIOS\n\nBảo vệ mật khẩu người dùng trên HDD\n\nTrusted Platform Module (TPM) 2.0\n\nWebcam\tCamera HD 720p\n\nVới tấm che webcam vật lý\n\nHệ điều hành\tWindows 11 Home\n\nPin\t42WHrs, 3S1P, 3-cell Li-ion\n\nTrọng lượng\t1.49 kg\n\nMàu sắc\tĐen Tinh Tú\n\nKích thước\t32.69 x 21.45 x 1.99 ~ 1.99 cm (12.87" x 8.44" x 0.78" ~ 0.78")\n\n——————————————————————————————\n\n\n\nĐIỀU KIỆN BẢO HÀNH SẢN PHẨM:\n\n\n\n• Những sản phẩm đủ điều kiện bảo hành\n\n\n\n- Sản phẩm nếu có tem niêm phong (seal) trên sản phẩm thì tem niêm phong phải còn nguyên vẹn.\n\n\n\n- Đối với sản phẩm bảo hành trên hộp: sản phẩm còn đầy đủ hộp.\n\n\n\n- Sản phẩm không trầy xước, cấn móp, bể, vỡ, biến dạng so với ban đầu.\n\n\n\n• Những sản phẩm không đủ điều kiện bảo hành\n\n\n\n- Hết thời hạn bảo hành.\n\n\n\n- Không có tem niêm phong, hoặc bị tẩy xóa, không còn nguyên dạng ban đầu.\n\n\n\n- Bị tác động vật lý làm trầy xước, cong vênh, rạn nứt, bể vỡ trong quá trình quá trình sử dụng.\n\n\n\n- Bị hư hỏng do tự ý thảo mở, sửa chữa, thay đổi cấu trúc sản phẩm bên trong mà chưa có sự xác nhận đồng ý hoặc giám sát bởi kỹ thuật viên GearVN.\n\n\n\n- Bị hư hỏng, chập, cháy do sử dụng sai mục đích, tự ý tháo, lắp đặt không tuân theo các hướng dẫn sử dụng đính kèm theo sản phẩm.\n\n\n\n- Bị hư hỏng do côn trùng xâm nhập (chuột, gián, kiến, mối…)\n\n\n\n- Bị hư hỏng do thiên tai, hỏa hoạn, lụt lội, sét đánh, rỉ sét, hao mòn do môi trường gây ra.\n\n\n\n***GearVN hỗ trợ tiếp nhận & sửa chữa sản phẩm (Có thu phí đối với khách hàng) với những sản phẩm không đủ điều kiện bảo hành.	100	9990000	2024-04-09 12:53:21.242204+07	2024-04-09 12:53:21.242204+07
17	7	Đồng hồ casio nữ dây nhựa GSHOCK GMA-S2100-1ADR chính hãng	Các tính năng:\n\nDòng này là phiên bản thu nhỏ của chiếc GA-2100 để tạo nên thiết kế đơn giản và thanh mảnh.\nGờ bát giác, mặt đồng hồ phẳng, vạch giờ đơn giản và cấu trúc bảo vệ lõi carbon vốn là những tính năng đặc biệt của GA-2100 hiện đã có trong cấu hình nhỏ gọn.\n\nĐặc điểm kỹ thuật:\n\nVật liệu vỏ / vành bezel: Cacbon / Nhựa\nDây đeo bằng nhựa\nMặt kính khoáng\nNeobrite\nChống va đập\nCấu trúc bảo vệ lõi cacbon\nChống nước ở độ sâu 200 mét\nHai đèn LED\nĐèn LED cho mặt đồng hồ (Chiếu sáng cực mạnh, thời lượng chiếu sáng có thể lựa chọn (1,5 giây hoặc 3 giây), phát sáng sau)\nĐèn LED cực tím cho màn hình số (Chiếu sáng cực mạnh, thời lượng chiếu sáng có thể lựa chọn (1,5 giây hoặc 3 giây), phát sáng sau)\nGiờ thế giới\n31 múi giờ (48 thành phố + giờ phối hợp quốc tế), bật/tắt tiết kiệm ánh sáng ban ngày\nĐồng hồ bấm giờ 1/100 giây\nKhả năng đo:\n00’00”00~59’59”99 (cho 60 phút đầu tiên)\n1:00’00”~23:59’59” (sau 60 phút)\nĐơn vị đo:\n1/100 giây (cho 60 phút đầu tiên)\n1 giây (sau 60 phút)\nChế độ đo: Thời gian đã trôi qua, ngắt giờ, thời gian về đích thứ nhất – thứ hai\nĐồng hồ đếm ngược\nĐơn vị đo: 1 giây\nKhoảng đếm ngược: 24 giờ\nKhoảng cài đặt thời gian bắt đầu đếm ngược: 1 giây đến 24 giờ (khoảng tăng 1 giây, khoảng tăng 1 phút và khoảng tăng 1 giờ)\n5 chế độ báo thức hàng ngày\nTín hiệu thời gian hàng giờ\nTính năng chuyển kim\nLịch hoàn toàn tự động (đến năm 2099)\nĐịnh dạng giờ 12/24\nBật/tắt âm nhấn nút\nGiờ hiện hành thông thường\nĐồng hồ kim: 2 kim (giờ, phút (kim di chuyển 20 giây một lần)), 1 mặt số (ngày)\nĐồng hồ kỹ thuật số: Giờ, phút, giây, giờ chiều/tối, tháng, ngày\nĐộ chính xác: ±15 giây một tháng\nTuổi thọ pin xấp xỉ: 3 năm đối với pin SR726W × 2\nKích thước vỏ / Tổng trọng lượng\nKích thước vỏ : 46,2×42,9×11,2mm\nTổng trọng lượng : 41g\n\n*CHÍNH SÁCH BẢO HÀNH:\n- Bảo hành 05 năm chính hãng Casio toàn quốc\n- Bảo hành pin trọn đời tại shop YouWatch \n\n#casio #casiohuyenthoai #casioanhkhue #casioankhanh #ak #donghonam #donghonu #unisex #ae1200whd #casiochinhhang #casiogiare #g-shock #edifice #babyg #mtp #ltp #mq #lq	100	2901600	2024-04-09 14:45:59.327071+07	2024-04-09 14:45:59.327071+07
18	7	Đồng hồ Casio nam điện tử AE-1200WHD-1AVDF dây kim loại chính hãng	Casio AE-1200WHD-1AVDF là chiếc đồng hồ Casio bán chạy nhất tại Việt Nam. Có tuổi thọ pin lên đến 10 năm, thiết kế đẹp cổ điển vượt năm tháng và cung cấp hàng loạt chức năng đỉnh-của-đỉnh, đồng hồ Casio AE1200WHD hiện đang là tiêu điểm chú ý của toàn thế giới.\n\n\n\nCASIO AE-1200WHD-1AVDF - SIÊU PHẨM GÂY SỐT TRÊN TOÀN THẾ GIỚI\n\n\n\n\n\nTHÔNG SỐ KỸ THUẬT:\n\n♦ Thương Hiệu: Casio\n\n♦ Số Hiệu Sản Phẩm: AE-1200WHD-1AVDF\n\n♦ Xuất Xứ: Nhật Bản\n\n♦ Giới Tính: Nam\n\n♦ Kính: Resin Glass (Kính Nhựa)\n\n♦ Máy: Quartz (Pin)\n\n♦ Bảo Hành Quốc Tế: 1 Năm\n\n♦ Đường Kính Mặt Số: 45 mm x 42.1 mm\n\n♦ Bề Dày Mặt Số: 12.5 mm\n\n♦ Màu Mặt Số: Đen\n\n♦ Chống Nước: 10 ATM\n\n\n\n\n\nTÍNH NĂNG NỔI BẬT:\n\n✔ Đèn LED\n\n✔ Nhiều múi giờ (4 thành phố khác nhau)\n\n✔ Giờ thế giới, có 31 múi giờ của 48 thành phố\n\n✔ Đồng hồ bấm giờ 1/100 giây (Khả năng đo: 23:59’59,99” cùng 4 chế độ đo)\n\n✔ Đồng hồ đếm ngược (Đơn vị đo: 1/10 giây)\n\n✔ 5 chế độ báo hàng ngày hoặc một lần\n\n✔ Tín hiệu thời gian hàng giờ\n\n✔ Lịch hoàn toàn tự động (đến năm 2099)\n\n✔ Định dạng giờ 12/24\n\n✔ Bật/tắt âm nhấn nút\n\n✔ Giờ hiện hành thông thường: Giờ, phút, giây, chiều, tháng, ngày, thứ\n\n\n\n\n\n\n\nBạn còn đang cân nhắc giữa Casio AE-1200WHD-1AVD với những chiếc đồng hồ khác trên thị trường? Thế thì xem ngay 5 ưu điểm nổi bật của sản phẩm này:\n\n\n\n☑ Là sản phẩm đồng hồ Nhật Bản đến từ thương hiệu uy tín Casio.\n\n☑ Được trang bị máy quartz siêu bền, độ chính xác cao và tuổi thọ pin dài lâu.\n\n☑ Là chiếc đồng hồ hot nhất dành cho nam của Casio.\n\n☑ Sản phẩm dùng dây kim loại nên khi sử dụng rất tiện lợi, dễ vệ sinh và không bị hôi tay như những chất liệu khác như dây da, dây vải.\n\n☑ Giá thành rẻ nhất thị trường và không một thương hiệu nổi tiếng nào có thể cạnh tranh lại với sản phẩm Casio AE-1200WHD	100	1189790	2024-04-09 15:08:53.924012+07	2024-04-09 15:08:53.924012+07
19	8	Đồng Hồ Xiaoya 1258 Thiết Kế Tối Giản Thời Trang Cho Nữ	Thời gian giao hàng dự kiến cho sản phẩm này là từ 7-9 ngày\n  \n  Thương hiệu: Xiaoya\n  Mẫu sản phẩm: 1258\n  Dành cho: nữ\n  Không thấm nước: có\n  Cấp độ chống thấm nước: không thấm nước 10M\n  Máy đồng hồ: Quartz\n  Độ dày: 8 mm\n  Đường kính mặt đồng hồ: 32mm\n  Chiều dài dây đeo: 230mm\n  Chiều rộng dây đeo: 16mm\n  Kiểu nút điều chỉnh: đỉnh chóp nón\n  Loại mặt dưới đồng hồ: thông thường\n  Chất liệu kính: gương kính thông thường\n  Kiểu khóa gài: khóa chốt\n  Chất liệu dây đeo: PU\n  Hình dạng mặt đồng hồ: tròn\n  Chất liệu vỏ: kim loại\n  Số hiệu sản phẩm: 1258\n  Gói hàng bao gồm: Đồng hồ * 1 hướng dẫn * 1 hộp đóng gói * 1	100	99000	2024-04-09 15:13:27.288839+07	2024-04-09 15:13:27.288839+07
8	3	Laptop Dell Vostro 3520 i3 1215U/8GB/256GB/OfficeHS/Win11 (V5I3614W1)	Laptop Dell Vostro 3520 i3 1215U/8GB/256GB/OfficeHS/Win11 (V5I3614W1)\n\n➡ CAM KẾT ĐỔI TRẢ HÀNG LỖI \n\n➡ BẢO HÀNH CHÍNH HÃNG 12 THÁNG \n\n➡ TEST KỸ SẢN PHẨM TRƯỚC KHI GIAO \n\n----------------------------------------------------------\n\n✪ Laptop Dell Vostro 3520 i3 1215U (V5I3614W1) là một lựa chọn tuyệt vời cho những bạn đang cần tìm một chiếc laptop học tập - văn phòng sở hữu cấu hình ổn định, có khả năng vận hành trơn tru mọi tác vụ thường ngày.\n\n• Bộ vi xử lý Intel Core i3 1215U với 6 nhân và 8 luồng, tốc độ xung nhịp lên đến 4.40 GHz, kết hợp cùng card tích hợp Intel UHD Graphics có thể vận hành hoàn hảo các tác vụ đơn giản như xem video, lướt web, chơi game cơ bản hay thực hiện các công việc văn phòng như xử lý văn bản và bảng tính một cách trơn tru.\n\n• Laptop được trang bị RAM 8 GB với khả năng nâng cấp lên đến tối đa 16 GB, hỗ trợ việc chạy các ứng dụng đòi hỏi nhiều tài nguyên bộ nhớ và đa nhiệm hiệu quả. Ổ cứng SSD 256 GB cung cấp không gian lưu trữ đủ cho nhiều tệp tin và ứng dụng, rút ngắn thời gian khởi động thiết bị.\n\n• Màn hình 15.6 inch với độ phân giải Full HD (1920 x 1080) có khả năng hiển thị hình ảnh chi tiết và sắc nét. Tấm nền IPS cung cấp góc nhìn rộng, công nghệ chống chói Anti Glare giúp giảm thiểu các ánh sáng phản chiếu và mờ hình ảnh. Tần số quét 120 Hz giảm thiểu hiện tượng giật hình và cải thiện trải nghiệm chơi game.\n\n\n\n✪ • Laptop Dell Vostro được cài đặt hệ điều hành mới nhất của Microsoft - Windows 11, phù hợp để làm việc văn phòng, soạn thảo văn bản, tính toán và quản lý tài liệu. Bộ Office Home & Student cung cấp các ứng dụng như Word, Excel và PowerPoint để giúp người dùng tạo và chỉnh sửa tài liệu thêm dễ dàng hơn.\n\n\n\nTHÔNG SỐ KỸ THUẬT:\n\n•Tên Hãng: Dell\n\nCPU:  core i3 - 1215U 1.2GHz\n\nRAM: 8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)2666 MHz. Hỗ trợ RAM tối đa: 16 GB\n\nỔ cứng: 256 GB SSD NVMe PCIe. Hỗ trợ khe cắm HDD SATA 2.5 inch mở rộng (nâng cấp tối đa 2 TB)\n\n\n\nMàn hình: 15.6"Full HD (1920 x 1080) 120Hz\n\nCông nghệ màn hình:\n\nChống chói Anti Glare\n\nLED Backlit\n\n250 nits\n\nWVA\n\nCard màn hình: Card tích hợp Intel UHD\n\n\n\nCổng kết nối:\n\nHDMI\n\n1 x USB 2.0\n\nJack tai nghe 3.5 mm\n\n2 x USB 3.2\n\nLAN (RJ45)\n\n\n\nHệ điều hành: Windows 11 Home SL + Office Home & Student vĩnh viễn\n\nThiết kế: Vỏ nhựa\n\n------------------------------------------\n\n🏢 ĐỊA CHỈ: BENCOMPUTER – SỐ 7 NGÕ 92, NGUYỄN KHÁNH TOÀN, CẦU GIẤY, HÀ NỘI\n\n☎HOTLINE/ZALO MUA HÀNG: 0966.469.269\n\n-----------------------------------------\n\n#maytinhxachtay #laptopgiare #maytinhdell #laptop #corei3 #corei5 #maytinhvanphong #laptopre #laptopsinhvien #laptopi3 #laptopr5 #ryzen3 #laptopdelli5 #Dellinspiron #ryzen5 #dell #lapdell	100	13000000	2024-04-09 13:00:20.727955+07	2024-04-09 13:00:20.727955+07
9	3	Laptop Dell Inspiron 3530 N5I5791W1 (Core i5-1335U | 16GB | 512GB |15.6 inch FHD 120Hz | Win 11 | Office)	Thông Số Kỹ Thuật\n\nThương hiệu Dell\n\nModel DELL VOS15 3530\n\nPart number 80GG92 \n\nBảo hành 12 tháng\n\nMàu sắc Titan Gray\n\nBộ vi xử lí Intel® Core™ i3-1305U (Bộ nhớ đệm 10M, lên đến 4,50 GHz)\n\nMàn hình 15.6 inch FHD (1920 x 1080) 120Hz 250 nits WVA Anti- Glare LED Backlit Narrow Border DisplayRam16 GB, 2 x 8 GB, DDR4, 3200 MT/s\n\nỔ cứng 256 GB, M.2, PCIe NVMe, SSDVGAIntel Iris Xe Graphics\n\nCổng giao tiếp 1 USB 3.2 Gen 1 port\n\n1 USB 2.0 port\n\n1 USB 3.2 Gen 1 Type-C® port\n\n1 USB 3.2 Gen 1 Type-C® port with DisplayPort Alt Mode 1.4/Power Delivery (only for computers with aluminum chassis or NVIDIA® GeForce MX550 graphics card)\n\n1 Universal audio port\n\n1 HDMI 1.4 port\n\n1 RJ45 Ethernet port\n\n1 Power-adapter port\n\nKết nối mạng 802.11ac 1x1 WiFi and Bluetooth\n\nPin4 Cell, 54 Wh, integrated\n\nKích thướcHeight (Front): 0.67 in. (16.96 mm)\n\nHeight (Rear): 0.75 in. (19.00 mm)\n\nWidth: 14.11 in. (358.50 mm)\n\nDepth: 9.28 in. (235.60 mm)\n\nCân nặng4.19 lb (1.90 kg)\n\nHệ điều hành Win11 Home SL, Microsoft(R)Office Home and Student 2021	100	17990000	2024-04-09 13:00:20.727955+07	2024-04-09 13:00:20.727955+07
20	8	Đồng hồ đeo tay Xiaoya 1300 chất liệu dây đeo bằng nhựa thời trang cho nữ	Thời gian giao hàng dự kiến cho sản phẩm này là từ 7-9 ngày\n \n  Thương hiệu: XIAOYA\n  Model: 1300\n  Dành cho: Nữ\n  Phong cách: Thời trang\n  Chống thấm nước: Không\n  Bộ máy đồng hồ: Thạch anh\n  Thương hiệu: XIAOYA\n  Độ dày: 9mm\n  Đường kính mặt đồng hồ: 31mm\n  Chiều rộng dây đeo: 18mm\n  Chiều dài dây đeo: 230mm\n  Đáy mặt đồng hồ: Bình thường\n  Chất liệu gương: Gương nhựa\n  Kiểu khóa cài: Khóa ghim\n  Chất liệu dây đeo: Nhựa\n  Chất liệu vỏ: Nhựa\n  Bảo hành: Không có\n  Gói hàng bao gồm: 1 x Đồng hồ đeo tay, 1 x Hướng dẫn sử dụng, 1 x Hộp đựng	100	55000	2024-04-09 15:18:59.904312+07	2024-04-09 15:18:59.904312+07
25	11	Đồng hồ nữ chính hãng dây da Royal Crown 6305 mặt nhỏ chống nước, đính đá cao cấp rất đẹp, thời trang, hợp đeo tay nhỏ	Đồng hồ nữ chính hãng dây da Royal Crown 6305 mặt nhỏ chống nước, đính đá cao cấp rất đẹp, thời trang, phù hợp đeo tay nhỏ\n\n\n\nCHÍNH SÁCH BẢO HÀNH VÀ ĐỔI TRẢ CỦA ROYALCROWN VIETNAM \n\n\n\n- Bảo hành 24 tháng\n\n- Thay pin chính hãng miễn phí trọn đời\n\n- Hỗ trợ trọn đời kiểm tra lỗi máy trong quá trình sử dụng\n\n- Chính sách đổi trả: 1 đổi 1 miễn phí trong 30 ngày kể từ ngày nhận hàng nếu lỗi do nhà sản xuất\n\n\n\nRoyal Crown Vietnamn CAM KẾT đảm bảo chất lượng 100% \n\n- Đến tay Quý Khách trọn bộ sản phẩm bao gồm:  \n\n+ Hộp và túi chính hãng, Tag kèm imei, Thẻ bảo hành, Hướng dẫn sử dụng , tem chống hàng giả.\n\n+ Hóa đơn bán hàng có đóng dấu hãng\n\n	100	1195000	2024-04-09 15:55:53.642684+07	2024-04-09 15:55:53.642684+07
26	11	Đồng Hồ Nữ Royal Crown 3628	Đồng hồ nữ Royal Crown 3628 thiết kế tinh tế có mặt đồng hồ được tạo bởi vỏ trai tự nhiên, viền đồng hồ được đính đá CZ tự nhiên cao cấp một cách tỉ mỉ, thủ công, dây đồng hồ được làm từ da bò Ý mang đên sự sang trọng và bền bỉ cho người đeo.\n\n\n\nTHÔNG SỐ KỸ THUẬT:\n\n- Đường kính: 32mm\n\n- Kích thước dây: 16mm\n\n- MVT (Máy): Japan Quartz (Khẳng định chất lượng HÀNG ĐẦU về dòng máy pin)\n\n- Chất liệu vỏ: Brass\n\n- Hợp kim phủ Platinum/ Thép không gỉ\n\nChất liệu dây: Dây da chính hãng\n\n- Chống nước: 3ATM (chỉ số chịu nước 3ATM (30m), đáp ứng được các tiêu chuẩn về chịu nước khi tiếp xúc với không khí ẩm thường ngày, chịu được nước khi rửa tay)\n\n 	100	1099000	2024-04-09 16:03:04.37411+07	2024-04-09 16:03:04.37411+07
27	12	Đồng hồ nữ đính đá dây kim loại thời trang Mall NTD25 mặt tròn cao cấp chính hãng	Đồng hồ nữ đính đá dây kim loại thời trang D-ZINER NTD25 mặt tròn cao cấp chính hãng\n- Tên sản phẩm: Đồng hồ nữ đính đá dây kim loại thời trang D-ZINER NTD25 mặt tròn cao cấp chính hãng\n- Chất liệu: Dây Thép\n- Kích thước: \n + Mặt đường kính: 30mm\n + Dày: 0.9 cm\n + Dây: Thép\n + Chống nước 3ATM\n + Kính: Khoáng \n- Chức năng:\n + Xem giờ giấc hiện hành bằng kim \n- Bảo hành 03 tháng \nĐồng hồ Nữ Đính Đá Dây Kim Loại\nĐồng hồ Nữ Đính Đá Dây Kim Loại, inox, dây thép với thiết kế mặt vuông, mặt tròn siêu hot\nKhi nhắc đến xu hướng thời trang cho nữ giới thì người ta thường nghĩ ngay đến quần áo, giày dép tuy nhiên còn một món phụ kiện nữa mà hiện nay cũng rất được các chị em quan tâm đó chính là đồng hồ đeo tay. Giờ đây, đồng hồ không chỉ đơn thuần là một món đồ dùng để xem giờ mà còn là một món phụ kiện thời trang vô cùng sành điệu giúp các bạn gái tự tin thể hiện phong cách, cá tính riêng của mình.\nĐồng hồ nữ đa dạng về mẫu mã, gồm các loại như: đồng hồ điện tử, đồng hồ dây da, đồng hồ dây nhựa, đồng hồ lắc tay,... Trong đó đồng hồ dây kim loại đang được rất nhiều người yêu thích bởi chúng thể hiện sự trẻ trung, hiện đại, không quá phô trương nhưng đâu đó vẫn tỏa ra nét thanh lịch khi đeo. Chính vì điều đó, LINDO đã cung cấp ra những chiếc đồng hồ nữ dây da, dây kim loại vô cùng thời trang, trẻ trung.\nĐối với phụ nữ thì một chiếc đồng hồ có thiết kế đẹp luôn hấp dẫn hơn những chiếc đồng hồ với công nghệ hiện đại. Bởi với họ thì cái đẹp vẫn luôn đứng hàng đầu chứ không phải những công nghệ hiện đại mà khô cứng của cánh mày râu. Con gái rât thích sử dụng những món phụ kiện để phối đồ giúp cho bộ trang phục của họ trở nên đẹp và hoàn thiện hơn. Chỉ với một chiếc đồng hồ đeo tay là bạn đã có thể dễ dàng tạo được điểm nhấn hoàn hảo cho bộ trang phục của mình. Chiếc đồng hồ nữ dây kim loại, dây da với thiết kế trang nhã, màu sắc bắt mắt, kiểu dáng sang trọng sẽ khiến cho phong cách của bạn trở nên khác biệt và thu hút mọi ánh nhìn xung quanh.\nMỘT SỐ LOẠI Đồng hồ Nữ Đính Đá Dây Kim Loại PHỔ BIẾN TRÊN THỊ TRƯỜNG:\nDây đồng hồ thép không gỉ là loại phổ biến nhất và chiếm hơn 80% số lượng đồng hồ dây kim loại trên thị trường với ưu điểm vượt bật là không bị ăn mòn hoặc hoen gỉ trong quá trình sử dụng. Đây là loại dây đeo khá nhẹ và bền bỉ, giúp người dùng có cảm giác thỏa mái. Đồng hồ sử dụng dây đeo bằng thép không gỉ luôn mang vẻ đẹp trang nhã, thanh lịch và phù hợp với bất kỳ sự kiện quan trọng nào. Đồng hồ dây thép không gỉ không kén chọn đối tượng khách hàng, cho dù bạn là người làm văn phòng, nhân viên kinh doanh, kỹ sư, giáo viên, vận động viên,… vẫn rất phù hợp.\nDây đồng hồ bằng hợp kim Titanium có những ưu điểm vượt bật như có tính trơ với các loại muối và axit thông thường, cứng hơn inox gấp 5 lần, nhẹ hơn 40% so với Inox, trên bề mặt dây đeo Titanium được nén áp lực tạo nên một lớp phủ chắc chắn để chống khả năng trầy xước, luôn sáng bóng,… Bởi vì giá thành khá cao nên dây đeo đồng hồ Titanium chỉ áp dụng cho những chiếc đồng hồ cao cấp.\nDây đồng hồ si làm bằng chất liệu thép thường hoặc bằng đồng, được si bóng. Loại dây này theo thời gian sẽ bị oxy hóa. Thông thường, dây đồng hồ si này chỉ được áp dụng cho những chiếc đồng hồ Fake hoặc các hãng đồng hồ rẻ tiền, chúng chỉ đẹp về ban đầu nhưng sau thời gian sử dụng sẽ bị hỏng.\nĐồng hồ Nữ Đính Đá Dây Kim Loại sử dụng chất liệu hợp kim Titanium với những mẫu đồng hồ cao cấp và dây thép không gỉ với những mẫu đồng hồ có giá thành rẻ hơn\nĐồng hồ Nữ Đính Đá Dây Kim Loại đem đến cho chủ nhân nhiều điểm cộng nổi bật như: Sự sang trọng, bền bỉ theo thời gian, dễ dàng vệ sinh và không bị tác động của các yếu tố môi trường. Chất liệu chính dùng để chế tác nên đồng hồ dây kim loại hiện nay đó là thép không gỉ, với đa dạng các màu sắc và kiểu dáng cho người dùng lựa chọn như vàng, bạc, vàng hồng,…\nĐồng hồ kim loại nữ\nMô tả: Đồng hồ có dây làm bằng chất liệu kim loại màu trắng hoặc vàng sáng bóng. Bạn nữ có thể thoải mái mix cùng với những bộ đồ công sở thanh lịch hoặc chiếc váy điệu đà dạo phố đều rất phù hợp.\nChất liệu: Vỏ đồng hồ và dây đều làm từ chất liệu thép không gỉ và mạ PVD. Mặt Kính làm bằng những chất liệu bền bỉ, chống trầy xước và chất lượng cao như là Sapphire, Mineral Crystal..\nThiết kế: Bề mặt của những chiếc Đồng hồ Nữ Đính Đá Dây Kim Loại này có màu trắng với thiết kế viền vàng, hoặc đính đá.. tạo nên những vẻ đẹp sang trọng cho người sử dụng. Kiểu máy Quartz (đồng hồ chạy pin) rất tiện dụng và mang đến sự bền bỉ về chất lượng.\nĐồng hồ Nữ Đính Đá Dây Kim Loại\n#dong #ho #nu #dinh #da #day #kim #loai #chinh #hang #thoi #trang #gia #re #cao #cap #deo #tay #chong #nuoc #lindo #dziner #dongho #donghonu #donghonudaythep #donghonudaykimloai #donghonuchinhhang #donghonudep #donghonuchongnuoc #donghonugiare #donghonudep #donghodeotaynu #donghochinhhang #donghothoitrang #donghothoitrang #donghodaydanu #donghodayda 	100	195000	2024-04-09 16:12:16.286789+07	2024-04-09 16:12:16.286789+07
28	12	Đồng hồ cặp đôi unisex nam nữ Mall Y530 chính hãng đẹp cao cấp thép không gỉ bền bỉ kèm hộp	Đồng hồ cặp đôi unisex nam nữ Yazole Y530 chính hãng đẹp cao cấp thép không gỉ bền bỉ\n\n- Tên sản phẩm: Đồng hồ cặp đôi unisex nam nữ Yazole Y530 chính hãng đẹp cao cấp thép không gỉ bền bỉ\n\n- Kích thước: \n\n + Mặt đường kính: mẫu nữ 37mm, mẫu nam 43mm\n\n + Dày: 0.8 cm\n\n + Chiều dài dây đeo của nam: 237mm (bao gồm cả vỏ)\n\n + Chiều dài dây đeo của nữ: 226mm (bao gồm cả vỏ)\n\n + Chiều rộng dây: nam (20mm), nữ (14mm)\n\n + Dây: Hợp Kim Thép\n\n + Kính: Khoáng\n\n + Chống nước: 3ATM\n\n- Chức năng:\n\n + Xem giờ giấc hiện hành bằng kim \n\n- Bảo hành 03 tháng \n\nMẪU THIẾT KẾ ĐÔI\n\nHơn 1001+ mẫu thiết kế đôi - Đồng Hồ Cặp Đôi dành cho nam và nữ. Thiết kế thanh lịch tạo nên sự đồng điệu cho các đôi tình nhân cam kết 100% chính hãng, giảm giá cực sốc khi mua đồng hồ cặp (đôi) tại LINDO bảo hành chính hãng, giao hàng trên toàn quốc.\n\nĐồng hồ cặp (đôi) chính hãng giá rẻ ( các chương trình khuyến mãi giảm giá, quà tặng hấp dẫn) đến không ngờ với sự đa dạng về dòng sản phẩm từ dòng đồng hồ nam kết hợp với đồng hồ  nữ đến các dòng đồng hồ .. mang đến những cặp đôi đồng hồ không chỉ bền đẹp mà còn thể hiện được tình cảm ngọt ngào dành cho các cặp đôi.\n\nCác mẫu đồng hồ đôi được thiết kế thanh lịch, trang nhã phù hợp với nhiều lứa tuổi. Bạn sẽ khám phá được từ dòng đồng hồ cá tính với kiểu dáng thể thao đến các mẫu đồng hồ cổ điển, hoài niệm. Những mẫu đồng hồ đôi tạo nên sự đồng điệu cho các cặp tình nhân.\n\nCác mẫu đồng hồ mang thiết kế hoàn toàn giống nhau dành cho các cặp đôi đang yêu nhau phù hợp với mọi lứa tuổi. Mẫu đồng hồ đôi được chia làm nhiều loại như: đồng hồ thể thao, đồng hồ điện tử, đồng hồ dây kim loại và đồng hồ dây da. Mỗi mẫu thiết kế mang vẻ đẹp riêng dành cho độ tuổi tính cách khác nhau. LINDO luôn tìm hiểu sở thích người tiêu dùng cho ra mắt các mẫu thiết kế hoàn hảo nhất.\n\nĐối với các mẫu thiết kế đôi mang phong cách thể thao là sự kết hợp hoàn hảo. Các mẫu này mang vẻ đẹp trẻ trung năng động dành cho các bạn trẻ yêu thích các môn thể thao bơi lội, leo núi hay đi phượt nhiều. Đồng hồ được mệnh danh bền nhất trong tất cả các mẫu đồng hồ giúp cho người đeo thỏa sức thể hiện cá tính.\n\nCác dòng đồng hồ đôi điện tử mang lại vẻ đẹp trẻ trung, cá tính cho người đeo. Đồng hồ điện tử được chia làm hai loại: chỉ hiện số điện tử và vừa kết hợp điện tử vừa kim. Mẫu đồng hồ điện tử ra đời từ rất lâu nhưng năm nay đang là mẫu cặp đôi hót nhất được giới trẻ yêu thích. Không những bền mà còn nhiều kiểu dáng đẹp mắt.\n\nKhác với mẫu đồng hồ thể thao và điện tử mang vẻ đẹp khỏe khoắn thì đồng hồ đôi dây kim loại mang đến sự sang trọng quý phái cho người đeo. Có rất nhiều kiểu thiết kế đa dạng làm hài lòng tất cả mọi người. Đồng hồ dây mạ bạc mang vẻ đẹp trẻ trung phù hợp với người đi làm công sở. Với dây mạ vàng đeo rất sáng da mang vẻ đẹp sang trọng dành cho người trung tuổi.\n\n” Đồng hồ đôi đẹp là sự “chắp cánh” tốt nhất cho tình yêu của hai bạn để bước thêm một nấc thang mới. Đồng hồ đôi (cặp) còn là món quà hết sức ý nghĩa và là vật có thể lưu giữ được những khoảng khắc thời gian lãng mạn trong tình yêu của hai bạn. Vậy thì bạn còn đợi chờ gì nữa, hãy lựa chọn ngay đồng hồ cặp chính hãng đẹp nhất cho một nửa của mình. Bạn sẽ thấy sức mạnh diệu kì đến từ món quà tặng tuyệt vời này, nó không chỉ nằm ở giá trị vật chất mà đồng hồ cặp (đôi) còn mang những giá trị tinh thần hết sức ý nghĩa mà sẽ làm tình yêu đôi lứa bùng cháy dữ dội … “\n\nTình yêu luôn là thứ cảm xúc đặc biệt hơn bao giờ hết. Đó là sự gắn kết hai trái tim nếm trải mọi cung bậc cảm xúc: đau khổ, buồn, vui, hạnh phúc để có một cái kết viên mãn. Đồng hành trên chặng đường yêu không thể thiếu đi đồng hồ đôi - vật chứng tình yêu vừa thiết thực vừa ý nghĩa. Đồng hồ đôi (đồng hồ cặp) với đầy đủ kiểu dáng từ đồng hồ cặp thiết kế mỏng nhẹ, thanh lịch, sang trọng hoặc cá tính, thời trang…sẽ đáp ứng mọi sở thích của đôi tình nhân.\n\nMẫu thiết kế đôi dây da dành cho các bạn trẻ tuổi teen hay sinh viên với dây da nâu và dây da đen. Các mẫu dây da thường hướng tới vẻ đẹp trẻ trung năng động phù hợp với độ tuổi từ 15 - 26. Mặt chống nước thông thường đi mưa rửa tay tắm gội thoải mái không lo nước vào trong. Dây da siêu bền giúp bạn thỏa sức thể hiện cá tính.\n\nSử dụng phụ kiện đôi từ lâu đã trở thành xu hướng thời trang được yêu thích, đặc biệt là những cặp đôi trẻ. Lựa chọn đồ đôi phù hợp với mình và người yêu để làm nổi bật phong cách, gu thời trang sành điệu và đặc biệt thể hiện được tình cảm gắn kết ngọt ngào, ấm áp và sự quý trọng thời gian của cặp đôi dành cho nhau là điều không dễ dàng.\n\n#dong #ho #nu #chinh #hang #day #da #thoi #trang #lindo #dziner #chong #nuoc #khong #gi #gia #re #deo #tay #cao #cap #dep #nam #cap #doi #dongho #donghodoi #donghocap #donghocapdoi #donghonamnu #donghounisex #donghothoitrang #donghochinhhang #donghodaythep #donghodaykimloai #donghonam #donghonu #donghodayda #donghothoitrang #donghogiare #donghocaocap #donghodeotay #donghotinhnhan 	100	299000	2024-04-09 16:16:42.8119+07	2024-04-09 16:16:42.8119+07
29	13	YouWatch 9933 Đồng hồ nữ dây da chính hãng đa chức năng lịch ngày ba mắt sáu kim chronograph dạ quang chống thấm nước	Chào mừng bạn đến với 【OLEVS-Official-Store】\n\nChúng tôi cam kết: 100% đồng hồ nguyên bản! Hàng đã sẵn sàng! Chuyển phát nhanh! Bao bì tốt! \n\n\n\n\n\n✅ Giao hàng: Đơn hàng sẽ được chuyển trong vòng 12 giờ.\n\n✅ Đến: 7-9 ngày làm việc sau khi vận chuyển.\n\n✅ Sau khi bán: Nếu đồng hồ của bạn có vấn đề về chất lượng hoặc bạn không hài lòng. Chúng tôi cung cấp một khoản hoàn lại đầy đủ.\n\n✅Chào mừng người bán buôn và người bán lại\n\n✅ Hy vọng bạn thích mua sắm của bạn.\n\n\n\n【Thông Tin sản phẩm】 ↓\n\nThương hiệu: OLEVS 9933\n\nTrọng lượng đồng hồ: 35g\n\nĐường kính đồng hồ: 34mm\n\nĐộ dày quay số: 10mm\n\nChiều rộng dây đeo: 16mm\n\nChiều dài dây đeo: 220mm\n\n\n\n\n\nCác biện pháp phòng ngừa❌:\n\n- Vui lòng không va đập và để đồng hồ tiếp xúc với các chất ăn mòn, nhiệt độ cao hoặc từ trường mạnh.\n\n- Vui lòng tránh xa dung môi, chất tẩy rửa, chất tẩy rửa công nghiệp, keo, sơn.\n\n- Đeo đồng hồ có vòng đeo tay dễ trầy xước nên các bạn đeo dây đồng hồ đeo đồng hồ nhé.\n\n- Không điều chỉnh nút hẹn giờ khi đồng hồ bị ướt.\n\n- Vui lòng không đặt đồng hồ thay đổi nhiệt độ đột ngột.\n\n- Vui lòng không nhấn nút và đặt nó vào nước.\n\n\n\n【Mục Bao gồm】\n\n1 x Đồng hồ gốc\n\n1 x hộp quà tinh tế (Quà tặng miễn phí)\n\n1 x Hướng dẫn sử dụng \n\n1 x Thẻ olevs gốc\n\n\n\n【100% Hỗ trợ khách hàng】\n\n1. Chúng tôi là nhà sản xuất ban đầu.\n\n2. Tất cả các sản phẩm là 100% mới và nguyên bản.\n\n3. Chúng tôi nỗ lực hết mình để cung cấp các sản phẩm chất lượng cao nhất với giá cả hợp lý.\n\n4. Tận tâm cung cấp một trải nghiệm khách hàng tốt chắc chắn!\n\n5. Sự hài lòng của khách hàng luôn quan trọng đối với chúng tôi.	100	598000	2024-04-09 16:23:10.569733+07	2024-04-09 16:23:10.569733+07
30	14	Đồng hồ nữ Olevs viền đá hiện đại,Đồng hồ nữ dây da thời trang công sở,Đồng hồ nữ thạch anh chống nước chính hãng	Đồng hồ nữ Olevs viền đá hiện đại,Đồng hồ nữ dây da thời trang công sở,Đồng hồ nữ thạch anh chống nước chính hãng\n\nTên sản phẩm: Đồng hồ nữ Olevs,Đồng hồ nữ dây da,Đồng hồ nữ thạch anh chống nước chính hãng\n\nThương hiệu: OLEVS\n\n- Size :38mm\n\n-Độ dày:10mm\n\n- Dây da thoáng khí\n\n- Gương tráng độ cứng cao\n\n-Thép không gỉ, không phai màu\n\n- Chống nước 3ATM\n\nĐồng hồ nữ Olevs,Đồng hồ nữ dây da,Đồng hồ nữ thạch anh chống nước chính hãng\n\nĐồng hồ nữ Olevs,Đồng hồ nữ dây da,Đồng hồ nữ thạch anh chống nước chính hãng\n\n❃ CÁC TRƯỜNG HỢP CHỐNG NƯỚC CHO KHÁCH THAM KHẢO:\n\n- 30M, 3ATM, 3BAR (hoặc chỉ ghi là Water Resistance) : Chỉ chịu nước ở mức rửa tay, đi mưa.\n\n- 50M, 5ATM, 5 BAR : Được sử dụng trong bơi lội, lặn sông nước (không sử dụng được trong lặn biển, chơi thể thao mạnh dưới nước…)\n\n- 100M, 10 ATM, 10BAR : Được sử dụng trong bơi lội, lặn vùng sông nước, lặn biển, không được sử dụng khi chơi thể thao mạnh dưới nước.\n\nĐồng hồ nữ Olevs,Đồng hồ nữ dây da,Đồng hồ nữ thạch anh chống nước chính hãng\n\nĐồng hồ nữ Olevs,Đồng hồ nữ dây da,Đồng hồ nữ thạch anh chống nước chính hãng\n\n\n\n***MỘT SỐ LƯU Ý CHUNG BẢO QUẢN TRONG QUÁ TRÌNH SỬ DỤNG ĐỒNG HỒ:\n\n*Hạn chế để đồng hồ tiếp xúc với hóa chất, xà phòng, chất tẩy rửa,....\n\n*Không điều chỉnh đồng hồ khi đồng hồ đang ướt/đang sử dụng nước.\n\n*Mặc dù chịu lực và chống sốc tốt nhưng bạn chú ý hạn chế những tác động lực mạnh trực tiếp lên đồng hồ. Hạn chế để đồng hồ bị va đập, rơi rớt hoặc va chạm mạnh.\n\n\n\nĐồng hồ nữ Olevs,Đồng hồ nữ dây da,Đồng hồ nữ thạch anh chống nước chính hãng\n\nĐồng hồ nữ Olevs,Đồng hồ nữ dây da,Đồng hồ nữ thạch anh chống nước chính hãng\n\nĐồng hồ nữ Olevs,Đồng hồ nữ dây da,Đồng hồ nữ thạch anh chống nước chính hãng\n\nĐồng hồ nữ Olevs,Đồng hồ nữ dây da,Đồng hồ nữ thạch anh chống nước chính hãng	100	650000	2024-04-09 19:49:49.886008+07	2024-04-09 19:49:49.886008+07
31	15	Điện Thoại Samsung Galaxy A14 5G (4GB + 128GB) - Hàng chính hãng	Thông số kỹ thuật\n\nPin: 5000 mAH\n\nBộ nhớ: 4GB/128GB - Hỗ trợ thẻ nhớ ngoài: MicroSD (Hỗ trợ tối đa 1TB)\n\nCamera Sau: 50.0 MP + 2.0 MP + 2.0MP\n\nCamera trước: 13.0 MP\n\nHiển thị: Kích thước 6.6"\n\nBộ vi xử lý: Mediatek 700 - Octa-core 2.2 GHz	100	3490000	2024-04-09 19:49:49.886008+07	2024-04-09 19:49:49.886008+07
5	2	Laptop ASUS TUF Gaming A15 FA507NV-LP046W R7-7735HS|8GB|512GB|RTX™ 4060 8G	THÔNG TIN SẢN PHẨM\n\nThông số kỹ thuật\n\n•\tCPU\tAMD Ryzen 7 7735HS 3.2GHz up to 4.75GHz 16MB\n\n•\tRAM\t8GB DDR5 4800MHz (2x SO-DIMM socket, up to 32GB SDRAM)\n\n•\tỔ cứng\t512GB PCIe® 4.0 NVMe™ M.2 SSD (2230) (Còn trống 1 khe SSD M.2 PCIE)\n\n•\tCard đồ họa\tNVIDIA® GeForce RTX™ 4060 8GB GDDR6, Up to 2420MHz* at 140W (2370MHz Boost Clock+50MHz OC, 115W+25W Dynamic Boost)\n\n•\tMàn hình\t15.6" FHD (1920 x 1080) IPS, 144Hz, Wide View, 250nits, Narrow Bezel, Non-Glare with 72% NTSC, 100% sRGB, 75.35% Adobe RGB, G-Sync\n\n•\tCổng giao tiếp\t1x Type C USB 4 support DisplayPort™ / G-SYNC\n\n•\t1x USB 3.2 Gen 2 Type-C support DisplayPort™ / power delivery / G-SYNC\n\n•\t2x USB 3.2 Gen 1 Type-A\n\n•\t1x RJ45 LAN port\n\n•\t1x HDMI 2.1 FRL\n\n•\t1x 3.5mm Combo Audio Jack\n\n•\tAudio\t2-speaker system, Dolby Atmos\n\n•\tBàn phím\tBacklit Chiclet Keyboard RGB\n\n•\tChuẩn LAN\t10/100/1000 Mbps\n\n•\tChuẩn WIFI\tWi-Fi 6(802.11ax) (Dual band) (2X2)\n\n•\tBluetooth\tv5.2\n\n•\tWebcam\tHD 720p\n\n•\tHệ điều hành\tWindows 11 Home\n\n•\tPin\t4 Cell 90WHrs\n\n•\tTrọng lượng\t2.2 kg\n\n•\tMàu sắc\tJaeger Gray\n\n•\tKích thước\t35.4 x 25.1 x 2.24 ~ 2.49 cm\n\n\n\n• Bảo hành 24 tháng chính hãng\n\n• Xuất xứ: Trung Quốc\n\n• Bảo hành chính hãng 24 tháng tại TTBH của Asus\n\n• Sản phẩm full box (Sản phẩm + sạc + hướng dẫn sử dụng )\n\n\n\n• Đối với sản phẩm dưới 20 triệu quý khách hàng cung cấp thông tin VAT công ty hoặc cá nhân để xuất hóa đơn bảo hành sản phẩm. Trường hợp không cung cấp shop mặc định xuất theo thông tin tài khoản mua hàng.\n\n\n\n• Đối với sản phẩm trên 20 triệu ( Bao gồm các khoản trợ giá nếu có) . Shop xin miễn trừ trách nhiệm không xuất VAT công ty. Chỉ mặc định xuất hóa đơn cá nhân để bảo hành sản phẩm.\n\n\n\n•  ***Trong quá trình sử dụng nếu cần hỗ trợ về kỹ thuật hãy đến các chi nhánh sau.\n\n•   396 - 398 Nguyễn Kiệm, P. 3, Q. Phú Nhuận, HCM\n\n•   ☞ Thứ 2 – Thứ 6 (9:00 – 20:00)\n\n•   ☞ Thứ 7 – Chủ Nhật (9:00 – 18:00)\n\n\n\n\n\n•   184/41 Nguyễn Xí, Phường 26, Q. Bình Thạnh, HCM\n\n•   ☞ Thứ 2 – Thứ 6 (8:30 – 17:30)\n\n•   ☞ Thứ 7 (8:30 – 12:30)\n\n\n\n•    Điểm giao dịch - Bảo hành tại Hà Nội\n\n•    Tầng 5, 71 Nguyễn Chí Thanh, Láng Hạ, Đống Đa, Hà Nội\n\n•   ☞ Thứ 2 – Thứ 6 (8:30 – 17:30)\n\n•   ☞ Thứ 7 (8:30 – 12:30)\n\n\n\n•    ❖ Thời gian bảo hành\n\n•   ☞ Thứ 2 – Thứ 6 (8:30 – 17:30)\n\n•   ☞ Thứ 7 (8:30 – 12:00)	100	27790000	2024-04-09 12:53:21.242204+07	2024-04-09 12:53:21.242204+07
7	3	Laptop Dell Inspiron 14 7430 i7-1355U, 512GB, 16GB, 14''FHD+, Win 11	Product Description\nThông số kỹ thuật:\n\n- Bộ vi xử lý: Intel Core i7-1355U (12M Cache, up to 5.0GHz, 2 P-cores and 8 E-cores)\n\n- Ổ cứng lưu trữ: 512GB M.2 PCIe NVMe SSD\n\n- Bộ nhớ:\t16GB LPDDR5 4800MHz (RAM onboard không hỗ trợ nâng cấp)\n\n- Đồ hoạ:\tIntel Iris Xe Graphics\n\n- Màn hình: 14.0-inch 16:10 FHD+ (1920 x 1200) Touch 250nits WVA Display with ComfortView Support\n\n- Nhận dạng vân tay: Có\n\n- Cảm ứng: Có\n\n- Bàn phím: Titan Gray English International Backlit Keyboard\n\n- Pin: 4-cell battery, 54 WHr (Pin liền)\n\n- Trọng lượng:\t1.62 Kg\n\n- Hệ điều hành: Win11 Home SL\n\n\n\nThiết kế gọn nhẹ\n\nThiết kế gọn nhẹ và mỏng, Laptop Dell Inspiron 14 7430 (T7430-i7U165W11SLU) tạo nên sự cơ động và phong cách, sẵn sàng theo bạn đi khắp nơi để luôn bắt kịp với nhịp sống hối hả của bạn. Laptop Dell Inspiron 14 7430 (T7430-i7U165W11SLU) thiết kế bản lề 360° để bạn có thể được sử dụng theo nhiều cách khác nhau.\n\n\n\nMàn hình tỷ lệ vàng\n\nLaptop Dell Inspiron 14 7430 (T7430-i7U165W11SLU) trang bị màn hình kích thước 14 inch với độ phân giải FHD+ với tỷ lệ vàng 16:10. Chưa dừng lại ở đó, màn hình cảm ứng hỗ trợ bút cảm ứng giúp cân bằng trải nghiệm hình ảnh với đầu vào trực quan hơn để giải trí và nghệ thuật.\n\n\n\nHiệu suất mạnh mẽ\n\nLaptop Dell Inspiron 14 7430 (T7430-i7U165W11SLU) được trang bị vi xử lý Intel Core Alder Lake thế hệ 13 mang đến hiệu năng xử lý vượt trội để máy trở nên cơ động giúp bạn dễ dàng làm việc một cách hiệu quả nhất.\n\n\n\nÂm thanh và kết nối\n\nLaptop Dell Inspiron 14 7430 (T7430-i7U165W11SLU) mang đến những trải nghiệm âm thanh cá nhân hóa tuyệt đỉnh, khả năng phát âm thanh to và sống động trong từng nhịp đập.\n\n\n\nLaptop Dell Inspiron 14 7430 (T7430-i7U165W11SLU) trang bị các kết nối hiện đại như cổng USB 3.2 Type-A, HDMI, ThunderBolt 4 và khe đọc thẻ nhớ MicroSD giúp sao lưu dữ liệu tốc độ rất cao được thực hiện dễ dàng.\n\n- Bảo hành 12 tháng\n\n- Địa chỉ bảo hành: 69/5A Đường 17, Hiệp Bình Chánh, Thủ Đức, TP. Hồ Chí Minh\n\n- Sđt bảo hành: (028) 73 0808 78 (#1009)\n\n\n\n#dell #dellofficial #dellstore #inspiron #dellinspiron #inspiron14 #intel #maytinh #pc #laptop #maytinhxachtay #maytinh&laptop #docongnghe #dientu #delli7U165W11SLU #laptopi7U165W11SLU #i7U165W11SLU #win11 #vanphong 	100	29690000	2024-04-09 13:00:20.727955+07	2024-04-09 13:00:20.727955+07
10	4	Laptop Acer Nitro 16 Phoenix AN16-41-R5M4 (NH.QKBSV.003) (AMD Ryzen 5-7535HS) (Đen) - Bảo hành 12 tháng	Bạn là một game thủ chuyên nghiệp, luôn muốn có những trải nghiệm chơi game tốt nhất? Bạn cũng là một người có nhiều công việc và học tập, cần một chiếc laptop đa năng và hiệu quả? Bạn còn là một người yêu thích sự đẹp đẽ và thời trang, muốn có một chiếc laptop có thiết kế ấn tượng và tiện lợi? Nếu bạn có tất cả những yêu cầu trên, thì bạn không thể bỏ qua Laptop Gaming ACER NITRO 16 PHOENIX - chiếc laptop gaming quốc dân của ACER, được Phong Vũ giới thiệu với laptop acer giá rẻ hợp lý. Laptop Gaming ACER NITRO 16 PHOENIX sẽ làm hài lòng bạn với những tính năng dưới đây, cùng Phong Vũ tìm hiểu ở bài viết dưới đây nhé!\n\nĐập hộp Acer Nitro 16 Phoenix AN16-41-R5M4 (NH.QKBSV.003)\n\nVideo Đập Hộp Acer Nitro 16 Phoenix - AMD Ryzen 7, RTX 4050\n\nLaptop Gaming Quốc Dân - Cấu Hình Mạnh Mẽ và Thiết Kế Đẹp Mắt\nLaptop Gaming Quốc Dân là một thuật ngữ được sử dụng để chỉ những chiếc laptop chơi game có cấu hình mạnh mẽ và thiết kế đẹp mắt, phù hợp với nhu cầu của người chơi game. Acer Nitro 16 Phoenix là một chiếc laptop Acer gaming ấn tượng với thiết kế cấu trúc gaming từ bên ngoài cho đến vỏ hộp. Thiết kế này tạo nên một phong cách mạnh mẽ, độc đáo và tinh tế. Máy tính còn được điểm xuyết bởi các viền neon tinh tế, tạo sự hòa hợp và thu hút mọi ánh nhìn đến từ góc “setup” của game thủ. \n\n Laptop Gaming ACER NITRO 16 PHOENIX có gì đặc biệt?\n Laptop Gaming ACER NITRO 16 PHOENIX có gì đặc biệt?\nCARD ĐỒ HỌA RỜI CỰC KHỦNG MỚI NHẤT TỪ NVIDIA - Trang bị GPU RTX™ 4050\nVới GPU GeForce RTX™ Series 40 mới nhất, Gaming Nitro 16 Phoenix đem đến sức mạnh đồ họa vô cùng ấn tượng cho cả game thủ và những người sáng tạo. Card đồ họa thế hệ mới này được phát triển dựa trên kiến trúc NVIDIA Ada Lovelace, tối ưu hiệu suất và tiết kiệm năng lượng, mang đến sức mạnh đồ họa vượt trội so với thế hệ trước.\n\nACER NITRO 16 PHOENIX | Card đồ họa rời RTX 4050\nACER NITRO 16 PHOENIX | Card đồ họa rời RTX 4050\nMÀN HÌNH 165HZ CHUẨN GAMING\nMàn hình rộng 16 inch với tỉ lệ 16:10 trên Gaming Nitro 16 Phoenix được thiết kế đặc biệt cho gaming, với tấm nền IPS và độ phân giải WUXGA (1920×1200). Tần số quét cao lên đến 165Hz cùng tính năng NVIDIA Advanced Optimus đảm bảo trải nghiệm chơi game mượt mà và không gặp gián đoạn hay hiện tượng bóng mờ. Điều đáng chú ý là màn hình của Nitro 16 Phoenix còn có độ phủ màu 100% sRGB, một chỉ số hiếm thấy trong dòng Laptop Gaming tầm trung từ 20 đến 40 triệu đồng.\n\nACER NITRO 16 PHOENIX | Màn hình 165HZ chuẩn Gaming\nACER NITRO 16 PHOENIX | Màn hình 165HZ chuẩn Gaming\nCHIẾN GAME KHÔNG GIỚI HẠN VỚI CPU AMD RYZEN™ 7000 SERIES\nNitro 16 Phoenix 2023 sở hữu cấu hình chiến game cực mạnh, cân mọi tựa game từ AAA đến game Esport. Điều này được thực hiện nhờ sự trang bị của CPU AMD Ryzen™ 7000 Series mới nhất, đặc biệt là Ryzen™ 5 7535HS, Laptop Acer ryzen 5 là sự lựa chọn hàng đầu cho những game thủ yêu thích "Đội Đỏ". Với kiến trúc Zen 3+ và công nghệ 6nm, CPU này mang lại hiệu suất ấn tượng với 6 nhân xử lý và 12 luồng, cùng với bộ nhớ đệm lên đến 16MB. Điều này đảm 	100	27990000	2024-04-09 14:00:45.866991+07	2024-04-09 14:00:45.866991+07
11	4	[Nhập ELGAMEFEB giảm 10%] Laptop Acer Aspire 7 A715-76-57CY (i5-12450H | 8GB | 512GB | 15.6' FHD)	THÔNG TIN SẢN PHẨM\n\nThông số kỹ thuật\n\n•\tCPU\tAMD Ryzen 7 7735HS 3.2GHz up to 4.75GHz 16MB\n\n•\tRAM\t8GB DDR5 4800MHz (2x SO-DIMM socket, up to 32GB SDRAM)\n\n•\tỔ cứng\t512GB PCIe® 4.0 NVMe™ M.2 SSD (2230) (Còn trống 1 khe SSD M.2 PCIE)\n\n•\tCard đồ họa\tNVIDIA® GeForce RTX™ 4060 8GB GDDR6, Up to 2420MHz* at 140W (2370MHz Boost Clock+50MHz OC, 115W+25W Dynamic Boost)\n\n•\tMàn hình\t15.6" FHD (1920 x 1080) IPS, 144Hz, Wide View, 250nits, Narrow Bezel, Non-Glare with 72% NTSC, 100% sRGB, 75.35% Adobe RGB, G-Sync\n\n•\tCổng giao tiếp\t1x Type C USB 4 support DisplayPort™ / G-SYNC\n\n•\t1x USB 3.2 Gen 2 Type-C support DisplayPort™ / power delivery / G-SYNC\n\n•\t2x USB 3.2 Gen 1 Type-A\n\n•\t1x RJ45 LAN port\n\n•\t1x HDMI 2.1 FRL\n\n•\t1x 3.5mm Combo Audio Jack\n\n•\tAudio\t2-speaker system, Dolby Atmos\n\n•\tBàn phím\tBacklit Chiclet Keyboard RGB\n\n•\tChuẩn LAN\t10/100/1000 Mbps\n\n•\tChuẩn WIFI\tWi-Fi 6(802.11ax) (Dual band) (2X2)\n\n•\tBluetooth\tv5.2\n\n•\tWebcam\tHD 720p\n\n•\tHệ điều hành\tWindows 11 Home\n\n•\tPin\t4 Cell 90WHrs\n\n•\tTrọng lượng\t2.2 kg\n\n•\tMàu sắc\tJaeger Gray\n\n•\tKích thước\t35.4 x 25.1 x 2.24 ~ 2.49 cm\n\n\n\n• Bảo hành 24 tháng chính hãng\n\n• Xuất xứ: Trung Quốc\n\n• Bảo hành chính hãng 24 tháng tại TTBH của Asus\n\n• Sản phẩm full box (Sản phẩm + sạc + hướng dẫn sử dụng )\n\n\n\n• Đối với sản phẩm dưới 20 triệu quý khách hàng cung cấp thông tin VAT công ty hoặc cá nhân để xuất hóa đơn bảo hành sản phẩm. Trường hợp không cung cấp shop mặc định xuất theo thông tin tài khoản mua hàng.\n\n\n\n• Đối với sản phẩm trên 20 triệu ( Bao gồm các khoản trợ giá nếu có) . Shop xin miễn trừ trách nhiệm không xuất VAT công ty. Chỉ mặc định xuất hóa đơn cá nhân để bảo hành sản phẩm.\n\n\n\n•  ***Trong quá trình sử dụng nếu cần hỗ trợ về kỹ thuật hãy đến các chi nhánh sau.\n\n•   396 - 398 Nguyễn Kiệm, P. 3, Q. Phú Nhuận, HCM\n\n•   ☞ Thứ 2 – Thứ 6 (9:00 – 20:00)\n\n•   ☞ Thứ 7 – Chủ Nhật (9:00 – 18:00)\n\n\n\n\n\n•   184/41 Nguyễn Xí, Phường 26, Q. Bình Thạnh, HCM\n\n•   ☞ Thứ 2 – Thứ 6 (8:30 – 17:30)\n\n•   ☞ Thứ 7 (8:30 – 12:30)\n\n\n\n•    Điểm giao dịch - Bảo hành tại Hà Nội\n\n•    Tầng 5, 71 Nguyễn Chí Thanh, Láng Hạ, Đống Đa, Hà Nội\n\n•   ☞ Thứ 2 – Thứ 6 (8:30 – 17:30)\n\n•   ☞ Thứ 7 (8:30 – 12:30)\n\n\n\n•    ❖ Thời gian bảo hành\n\n•   ☞ Thứ 2 – Thứ 6 (8:30 – 17:30)\n\n•   ☞ Thứ 7 (8:30 – 12:00)	100	12690000	2024-04-09 14:05:26.598883+07	2024-04-09 14:05:26.598883+07
12	5	Laptop Asus Vivobook 15X A1503ZA-L1422W i5-12500H|Xe Graphics|8GB|512GB|15.6'' OLED	THÔNG TIN SẢN PHẨM\n\nThông số kỹ thuật\n\n•\tCPU\tAMD Ryzen 7 7735HS 3.2GHz up to 4.75GHz 16MB\n\n•\tRAM\t8GB DDR5 4800MHz (2x SO-DIMM socket, up to 32GB SDRAM)\n\n•\tỔ cứng\t512GB PCIe® 4.0 NVMe™ M.2 SSD (2230) (Còn trống 1 khe SSD M.2 PCIE)\n\n•\tCard đồ họa\tNVIDIA® GeForce RTX™ 4060 8GB GDDR6, Up to 2420MHz* at 140W (2370MHz Boost Clock+50MHz OC, 115W+25W Dynamic Boost)\n\n•\tMàn hình\t15.6" FHD (1920 x 1080) IPS, 144Hz, Wide View, 250nits, Narrow Bezel, Non-Glare with 72% NTSC, 100% sRGB, 75.35% Adobe RGB, G-Sync\n\n•\tCổng giao tiếp\t1x Type C USB 4 support DisplayPort™ / G-SYNC\n\n•\t1x USB 3.2 Gen 2 Type-C support DisplayPort™ / power delivery / G-SYNC\n\n•\t2x USB 3.2 Gen 1 Type-A\n\n•\t1x RJ45 LAN port\n\n•\t1x HDMI 2.1 FRL\n\n•\t1x 3.5mm Combo Audio Jack\n\n•\tAudio\t2-speaker system, Dolby Atmos\n\n•\tBàn phím\tBacklit Chiclet Keyboard RGB\n\n•\tChuẩn LAN\t10/100/1000 Mbps\n\n•\tChuẩn WIFI\tWi-Fi 6(802.11ax) (Dual band) (2X2)\n\n•\tBluetooth\tv5.2\n\n•\tWebcam\tHD 720p\n\n•\tHệ điều hành\tWindows 11 Home\n\n•\tPin\t4 Cell 90WHrs\n\n•\tTrọng lượng\t2.2 kg\n\n•\tMàu sắc\tJaeger Gray\n\n•\tKích thước\t35.4 x 25.1 x 2.24 ~ 2.49 cm\n\n\n\n• Bảo hành 24 tháng chính hãng\n\n• Xuất xứ: Trung Quốc\n\n• Bảo hành chính hãng 24 tháng tại TTBH của Asus\n\n• Sản phẩm full box (Sản phẩm + sạc + hướng dẫn sử dụng )\n\n\n\n• Đối với sản phẩm dưới 20 triệu quý khách hàng cung cấp thông tin VAT công ty hoặc cá nhân để xuất hóa đơn bảo hành sản phẩm. Trường hợp không cung cấp shop mặc định xuất theo thông tin tài khoản mua hàng.\n\n\n\n• Đối với sản phẩm trên 20 triệu ( Bao gồm các khoản trợ giá nếu có) . Shop xin miễn trừ trách nhiệm không xuất VAT công ty. Chỉ mặc định xuất hóa đơn cá nhân để bảo hành sản phẩm.\n\n\n\n•  ***Trong quá trình sử dụng nếu cần hỗ trợ về kỹ thuật hãy đến các chi nhánh sau.\n\n•   396 - 398 Nguyễn Kiệm, P. 3, Q. Phú Nhuận, HCM\n\n•   ☞ Thứ 2 – Thứ 6 (9:00 – 20:00)\n\n•   ☞ Thứ 7 – Chủ Nhật (9:00 – 18:00)\n\n\n\n\n\n•   184/41 Nguyễn Xí, Phường 26, Q. Bình Thạnh, HCM\n\n•   ☞ Thứ 2 – Thứ 6 (8:30 – 17:30)\n\n•   ☞ Thứ 7 (8:30 – 12:30)\n\n\n\n•    Điểm giao dịch - Bảo hành tại Hà Nội\n\n•    Tầng 5, 71 Nguyễn Chí Thanh, Láng Hạ, Đống Đa, Hà Nội\n\n•   ☞ Thứ 2 – Thứ 6 (8:30 – 17:30)\n\n•   ☞ Thứ 7 (8:30 – 12:30)\n\n\n\n•    ❖ Thời gian bảo hành\n\n•   ☞ Thứ 2 – Thứ 6 (8:30 – 17:30)\n\n•   ☞ Thứ 7 (8:30 – 12:00)	100	15950000	2024-04-09 14:10:23.899529+07	2024-04-09 14:10:23.899529+07
13	5	Laptop Lenovo Ideapad 5 - 15IAL7 -82SF006LVN (i5-1235U) (Xanh) - Bảo hành 36 tháng	Laptop Lenovo Ideapad 5 - 15IAL7 -82SF006LVN là một siêu phẩm được đánh giá cao trong phân khúc tầm giá. Chiếc máy tính này được trang bị màn hình hiển thị kích thước lớn, chất lượng hình ảnh sắc nét cùng hiệu năng hoạt động ổn định đây sẽ là “người bạn” đồng hành với bạn từ công việc đến giải trí, thư giãn.Ngoại hình sang trọng, thiết kế đơn giản, mỏng nhẹ\n\nLenovo Ideapad 5 mang đến cho bạn một thiết kế tinh tế với đường nét khung máy vuông vức. Lựa chọn màu xanh làm tông màu chủ đạo vừa mang đến vẻ đẹp tươi mái vừa toát lên vẻ sang trọng, cuốn hút. Bản lề với thiết kế tỉ mỉ giúp bạn dễ dàng đóng gập máy.Sản phẩm nhà Lenovo có trọng lượng chỉ 1.8kg cùng thông số kích thước 35.667 x 23.313 x 1.69cm dễ dàng để bạn có thể cầm nắm. Bạn cũng có thể dễ dàng bỏ laptop trong balo, túi xách mang đến nhiều nơi khác nhau để làm việc hay học tập hiệu quả.\n\nKích thước màn hình hiển thị lớn, công nghệ chống lóa bảo vệ mắt người dùng\n\nLaptop Ideapad 5 được trang bị một màn hình lớn với kích thước 15.6 inch cùng độ phân giải 1920 x 1080px cho hình ảnh hiển thị sắc nét với không gian hiển thị rộng rãi. Tấm nền IPS hiện đại giúp nâng cao chất lượng khung hình nhờ độ tương phản cao cùng màu sắc chân thực.	100	14090000	2024-04-09 14:17:04.436735+07	2024-04-09 14:17:04.436735+07
14	6	Apple MacBook Air 13" 2020 (M1/8GB/256GB)	MacBook Air (M1, 2020)\n\n\n\nMÔ TẢ SẢN PHẨM\n\nMacBook Air là máy tính xách tay mỏng và nhẹ nhất của Apple – nay thay đổi ngoạn mục với chip Apple M1 mạnh mẽ. \n\nTạo ra một cú nhảy vọt về hiệu năng CPU và đồ họa, cùng thời lượng pin lên đến 18 giờ.\n\n\n\nTính năng nổi bật\n\n• Chip M1 do Apple thiết kế tạo ra một cú nhảy vọt về hiệu năng máy học, CPU và GPU\n\n• Tăng thời gian sử dụng với thời lượng pin lên đến 18 giờ1\n\n• CPU 8 lõi cho tốc độ nhanh hơn đến 3.5x, xử lý công việc nhanh chóng hơn bao giờ hết 2\n\n• GPU lên đến 8 lõi với tốc độ xử lý đồ họa nhanh hơn đến 5x cho các ứng dụng và game đồ họa khủng2\n\n• Neural Engine 16 lõi cho công nghệ máy học hiện đại\n\n• Bộ nhớ thống nhất 8GB giúp bạn làm việc gì cũng nhanh chóng và trôi chảy\n\n• Ổ lưu trữ SSD siêu nhanh giúp mở các ứng dụng và tập tin chỉ trong tích tắc\n\n• Thiết kế không quạt giảm tối đa tiếng ồn khi sử dụng\n\n• Màn hình Retina 13.3 inch với dải màu rộng P3 cho hình ảnh sống động và chi tiết ấn tượng3\n\n• Camera FaceTime HD với bộ xử lý tín hiệu hình ảnh tiên tiến cho các cuộc gọi video đẹp hình, rõ tiếng hơn\n\n• Bộ ba micro phối hợp tập trung thu giọng nói của bạn, không thu tạp âm môi trường\n\n• Wi-Fi 6 thế hệ mới giúp kết nối nhanh hơn\n\n• Hai cổng Thunderbolt / USB 4 để sạc và kết nối phụ kiện\n\n• Bàn phím Magic Keyboard có đèn nền và Touch ID giúp mở khóa và thanh toán an toàn hơn\n\n• macOS Big Sur với thiết kế mới đầy táo bạo cùng nhiều cập nhật quan trọng cho các ứng dụng Safari, Messages\n\nvà Maps\n\n• Hiện có màu vàng kim, xám bạc và bạc\n\n\n\nBộ sản phẩm bao gồm\n\n1. MacBook\n\n2. Dây sạc\n\n3. Củ sạc 30W\n\n4. HDSD bảo hành điện tử 12 tháng\n\n\n\nPháp lý\n\nHiện có sẵn các lựa chọn để nâng cấp.\n\n1. Thời lượng pin khác nhau tùy theo cách sử dụng và cấu hình. Truy cập apple.com/batteries để biết thêm thông tin.\n\n2. So với thế hệ máy trước.\n\n3. Kích thước màn hình tính theo đường chéo.\n\n\n\n#macbook #laptop #macbookair #macbook_air #maytinh #may_tinh #smart #apple #ios #apple #chinhhang #chinh_hang #applevietnam #apple_viet_nam #M1 #macbookM1 #macbookairM1 #maytinhM1 #shopdunk #macbookair2020 #air2020 #i5 #8G #macbook256GB #air256GB #air512GB #macbook13inch #13inch #macbook13"	100	18890000	2024-04-09 14:20:52.38544+07	2024-04-09 14:20:52.38544+07
15	6	MacBook Air M2 13" 2022 8CPU 8GPU 256GB| RAM 8GB - New seal Hàng Chính Hãng	\N	100	28050000	2024-04-09 14:27:25.87518+07	2024-04-09 14:27:25.87518+07
16	7	[Mã FATREND94 giảm đến 50k đơn từ 150k] Đồng hồ Casio Nam Vintage A168WA-1 Chính Hãng	\N	100	968000	2024-04-09 14:35:05.869289+07	2024-04-09 14:35:05.869289+07
21	9	Đồng hồ đeo tay MONO Tif Watches Thép Không Gỉ sáng da phong cách Hàn Quốc thanh lịch bền đẹp giá rẻ size 22mm	A) TẠI SAO BẠN NÊN CHỌN CHÚNG MÌNH?\n\nTif Watches là một thương hiệu đồng hồ - khao khát mang đến cho những bạn trẻ năng động sự chỉn chu, tinh tế trong từng phụ kiện nhỏ; bạn có thể thoải mái phối những chiếc đồng hồ với nhiều bộ trang phục ở nhiều hoàn cảnh.\n\nChúng mình đặc biệt quan tâm đến trải nghiệm khách hàng: mong rằng bạn sẽ luôn tìm được sản phẩm chất lượng với mức giá hợp lý nhất và hài lòng với sự chăm sóc chu đáo trên từng đơn hàng.\n\n\n\n\n\nB) 1 BỘ SẢN PHẨM BAO GỒM:\n\nĐồng hồ chính hãng Tif Watches\n\nHộp đựng sang trọng\n\nTài liệu hướng dẫn sử dụng từ A-Z\n\n\n\nĐặc biệt: Miễn phí thắt nơ gói quà & tặng kèm thiệp viết tay (inbox shop nếu bạn có nhu cầu tặng quà)\n\n\n\n\n\nC) ĐIỀU KIỆN ĐỔI TRẢ\n\n- Sản phẩm bạn nhận không giống như mô tả\n\n- Vận chuyển đơn hàng không còn nguyên vẹn như lúc đầu (nứt, vỡ,....)\n\n- Bảo hành 6 tháng đối với lỗi do máy và pin của nsx (mẫu sẽ không bảo hành lỗi đến từ vấn đề phát sinh trong quá trình sử dụng của người dùng như: ngâm nước, rơi,..)\n\n\n\nLưu ý: KHI BẠN YÊU GẶP BẤT CỨ VẤN ĐỀ GÌ CHƯA HÀI LÒNG VỀ SẢN PHẨM HAY VẬN CHUYỂN - ĐỪNG VỘI ĐÁNH GIÁ HAY BẤM TRẢ HÀNG NGAY - MÀ HÃY NHẮN TIN CHO SHOP ĐỂ CHÚNG MÌNH HỖ TRỢ BẠN LIỀN NHA!	100	455000	2024-04-09 15:18:59.904312+07	2024-04-09 15:18:59.904312+07
22	9	Đồng Hồ Dây Da Nữ NADU Classic Tif Watches Đeo Tay Thon Gọn Tiểu Thư Dễ Thương	A) TẠI SAO BẠN NÊN CHỌN CHÚNG MÌNH?\n\nTif Watches là một thương hiệu đồng hồ - khao khát mang đến cho những bạn trẻ năng động sự chỉn chu, tinh tế trong từng phụ kiện nhỏ; bạn có thể thoải mái phối những chiếc đồng hồ với nhiều bộ trang phục ở nhiều hoàn cảnh.\n\nChúng mình đặc biệt quan tâm đến trải nghiệm khách hàng: mong rằng bạn sẽ luôn tìm được sản phẩm chất lượng với mức giá hợp lý nhất và hài lòng với sự chăm sóc chu đáo trên từng đơn hàng.\n\n\n\n\n\nB) 1 BỘ SẢN PHẨM BAO GỒM:\n\nĐồng hồ chính hãng Tif Watches\n\nHộp đựng sang trọng\n\nTài liệu hướng dẫn sử dụng từ A-Z\n\n\n\nĐặc biệt: Miễn phí thắt nơ gói quà & tặng kèm thiệp viết tay (inbox shop nếu bạn có nhu cầu tặng quà)\n\n\n\n\n\nC) ĐIỀU KIỆN ĐỔI TRẢ\n\n- Sản phẩm bạn nhận không giống như mô tả\n\n- Vận chuyển đơn hàng không còn nguyên vẹn như lúc đầu (nứt, vỡ,....)\n\n- Bảo hành 6 tháng đối với lỗi do máy và pin của nsx (mẫu sẽ không bảo hành lỗi đến từ vấn đề phát sinh trong quá trình sử dụng của người dùng như: ngâm nước, rơi,..)\n\n\n\nLưu ý: KHI BẠN YÊU GẶP BẤT CỨ VẤN ĐỀ GÌ CHƯA HÀI LÒNG VỀ SẢN PHẨM HAY VẬN CHUYỂN - ĐỪNG VỘI ĐÁNH GIÁ HAY BẤM TRẢ HÀNG NGAY - MÀ HÃY NHẮN TIN CHO SHOP ĐỂ CHÚNG MÌNH HỖ TRỢ BẠN LIỀN NHA!	100	217500	2024-04-09 15:24:30.377058+07	2024-04-09 15:24:30.377058+07
23	10	Đồng hồ nữ Julius Hàn Quóc JA-1017D dây da cá tính màu hồng	JULIUS thương hiệu đăng ký đầu tiên tại Seoul Hàn Quốc, công nghệ Nhật Bản với máy Nhật nhập khẩu 100%. Thiết kế bởi chuyên gia thời trang hàng đầu Hàn Quốc, tiêu chuẩn quốc tế, lắp ráp tại Trung Quốc, bảo hành toàn quốc và quốc tế, chế độ hậu mãi tốt nhất.\n\nTHÔNG SỐ SẢN PHẨM\n\nThương hiệu: JULIUS\n\nMã sản phẩm: JA-1017D (Hồng)\n\nDành cho: Nữ, sinh viên, nhân viên văn phòng, doanh nhân…\n\nChất liệu dây: Dây da Genuine Leather bền bỉ\n\nChất liệu mặt kính: Mặt kính khoáng cao cấp trong suốt rõ nét, độ cứng cao (chống va đập tốt ở mức sinh hoạt hàng ngày)\n\nKích thước bề mặt: 3,8cm (Mặt tròn)\n\nĐộ dày: 0,8cm\n\nTổng độ dài đồng hồ: 23cm\n\nĐộ rộng của dây: 1,9cm\n\nKiểu khóa: Khóa gài\n\nChất liệu vỏ máy: Hợp kim mạ ion vàng hồng,sử dụng công nghệ mạ IP chân không tiên tiến giúp đem lại độ sáng bóng và bền màu\n\nMáy: Quartz Nhật MIYOTA 2035 (được sản xuất bởi Citizen Nhật Bản)\n\nKhả năng chịu nước:  Chống thấm nước 3ATM (30m) có thể đi mưa, rửa tay, rửa mặt. Tránh tiếp xúc với môi trường hóa chất như giặt đồ, tấm gội.\n\nBảo hành: 12 tháng, hậu mãi 3 năm chi phí thấp sau bảo hành. Đổi mới nếu bị vô nước hoặc lỗi do nhà sản xuất. Thay dây miễn phí 1 lần, thay pin trọn đời, mua phụ kiện giá ưu đãi khi có thẻ bảo hành\n\n#dongho #donghonu #donghonam #donghogiare #giare #donghothoitrang #donghojulius #julius #juliusnu #trangsuc #vongtay #re #quatang #xuhuong #quatangtet #redep #ja1017 #1017 #ja-1017	100	539000	2024-04-09 15:26:09.571901+07	2024-04-09 15:26:09.571901+07
24	10	Đồng hồ nữ Julius Hàn Quốc Ja-779 dây da (5 màu)	JULIUS thương hiệu đăng ký đầu tiên tại Seoul Hàn Quốc, công nghệ Nhật Bản với máy Nhật nhập khẩu 100% từ Citizen như MIYOTA. Thiết kế bởi chuyên gia thời trang hàng đầu Hàn Quốc, tiêu chuẩn quốc tế, bảo hành toàn quốc và quốc tế.\n\nTHÔNG SỐ SẢN PHẨM\n\nThương hiệu: JULIUS.\n\nMã sản phẩm: JA-779\n\nDành cho: Nữ giới, yêu thích thời trang và phá cách\n\nChất liệu dây: Dây da\n\nChất liệu mặt kính: Mặt kính khoáng cao cấp trong suốt rõ nét, độ cứng cao (chống va đập tốt ở mức sinh hoạt hàng ngày)\n\nKích thước bề mặt: 2,5cm (Mặt tròn)\n\nĐộ dày: 0,9cm\n\nTổng độ dài đồng hồ: 22,5cm\n\nĐộ rộng của dây: 0,8cm\n\nKiểu khóa: Khóa gài\n\nChất liệu vỏ máy: Hợp kim mạ ion, sử dụng công nghệ mạ IP chân không tiên tiến giúp đem lại độ sáng bóng và bền màu\n\nMáy: Quartz Nhật MIYOTA 2035 (thuộc tập đoàn Citizen Nhật Bản)\n\nKhả năng chịu nước: Chống thấm nước 3ATM (30m) có thể đi mưa, rửa tay, rửa mặt. Tránh tiếp xúc với môi trường hóa chất như giặt đồ, tấm gội.\n\nBảo hành: 12 tháng, hậu mãi 3 năm chi phí thấp sau bảo hành. Đổi mới nếu bị vô nước hay hư máy do nhà sản xuất. Thay dây miễn phí 1 lần, thay pin trọn đời, mua phụ kiện giá ưu đãi khi có thẻ bảo hành\n\nBảo Quản: Lau chùi vệ sinh sản phẩm thường xuyên bằng khăn giấy mền khỏi tuyến mồ hôi và hạn chế tiếp xúc hóa chất bảo vệ màu sắc sản phẩm và pin sản phẩm lâu dài.	100	538000	2024-04-09 15:27:53.60495+07	2024-04-09 15:27:53.60495+07
32	15	Điện thoại Samsung Galaxy M14 5G (4GB/128GB)	Thông tin chi tiết và đặc điểm kỹ thuật của sản phẩm chưa được cập nhật cho đến khi có thông báo từ phía nhãn hàng	100	3790000	2024-04-09 19:57:08.664269+07	2024-04-09 19:57:08.664269+07
33	15	Điện thoại Samsung Galaxy A25 5G 6GB/128GB	Thông tin kỹ thuật và đặc điểm chi tiết chưa được cập nhật cho đến khi có thông báo từ phía nhãn hàng	100	6090000	2024-04-09 20:00:08.334454+07	2024-04-09 20:00:08.334454+07
34	15	Điện thoại Samsung Galaxy S23 FE 5G 8GB/128GB - Điện thoại AI - Galaxy AI - Camera Nightography	Thông tin kỹ thuật và đặc điểm chi tiết chưa được cập nhật cho đến khi có thông báo từ phía nhãn hàng	100	12690000	2024-04-09 20:06:55.341954+07	2024-04-09 20:06:55.341954+07
35	16	Điện thoại OPPO A17k - Hàng chính hãng	Điện thoại OPPO A17K 64GB - Hiệu năng mượt mà, giải trí không giới hạn\n\nMang dáng vẻ hiện đại và sang trọng\n\nChiếc điện thoại này được OPPO hoàn thiện khá tỉ mỉ với vẻ ngoài cực sang trọng và hiện đại. Phần khung viền của máy được thiết kế vuông vức cùng các đường bo cạnh tinh tế. Mặt lưng của điện thoại OPPO mang tính thẩm mỹ cao khi kết hợp những đường sọc dọc thời thượng. Máy cực kỳ mỏng nhẹ chỉ 189 gam với kích thước chiều dài 164.2 mm, chiều ngang 75.6 mm và bề dày 8.3 mm. Vì khá nhỏ gọn nên bạn có thể mang đi bất cứ đâu, việc cầm nắm cũng nhẹ tay hơn. \n\n\n\n\n\nOPPO A17K mang dáng vẻ hiện đại sang trọng\n\n\n\nTrải nghiệm lớn với màn hình rộng hơn\n\nSự cải tiến đến từ dòng điện thoại của OPPO chưa bao giờ dừng lại khi mở rộng màn hình lớn lên đến 6.56 inch. Ngoài ra, màn hình còn được phủ tấm nền IPS LCD nên có thể cho ra mọi hình ảnh cực chất lượng trên không gian hiển thị rộng lớn. Người dùng tận hưởng hưởng việc xem phim và chơi game ấn tượng hơn với độ phân giải chi tiết của màn hình HD+ (720 x 1612 Pixels). Với chiếc smartphone nhỏ gọn này bạn có thể thoải mái đắm chìm trong không gian giải trí hàng ngày bằng những hình ảnh sống động cùng những dải sắc màu chân thực hơn bao giờ hết. \n\n\n\n\n\nMàn hình điện thoại OPPO A17K cho trải nghiệm rộng lớn\n\n\n\nCảm biến vân tay tinh tế\n\nĐiện thoại OPPO A17K 64GB được trang bị cảm biến vân tay mở khóa ngay tại nút nguồn phía bên hông của máy. Vì vậy sẽ rất tiện lợi cho bạn khi mở khóa cũng như tăng thêm tính thẩm mỹ cho máy. Chỉ bằng một cái chạm nhẹ đơn giản là bạn có thể mở ra mọi thế giới của mình trong chiếc điện thoại nhỏ bé này rồi. \n\n\n\n\n\nCảm biến vân tay trên điện thoại OPPO A17K \n\n\n\nBộ camera chất lượng cho mọi bức ảnh hoàn hảo\n\nĐiện thoại OPPO A17K 64GB có cụm camera được làm phẳng vào mặt lưng máy tạo sự liền mạch và tinh tế. Camera sau của máy có độ phân giải 8MP và một camera trước 5MP. Tuy chiếc điện thoại này có độ phân giải camera ở mức vừa tầm nhưng nó được OPPO nâng cao thêm khi trang bị những tính năng công nghệ cực hiện đại. \n\n\n\n\n\nCamera của A17K cho mọi bức ảnh hoàn hảo\n\n\n\nKhả năng chụp hình xóa phông hoàn hảo khi chụp ở chế độ chân dung giúp mọi chủ thể được nổi bật hơn trong những bức hình. Bên cạnh đó là công nghệ làm đẹp tự nhiên AI sẽ giúp mọi bức ảnh của bạn trở nên thật tự nhiên và trong trẻo với những màu sắc chân thực. \n\n\n\nHiệu năng mượt mà trong tầm giá\n\nOPPO A17K mang trong mình con chip MediaTek Helio G35 8 nhân, đây là con chip xử lý với mức giá tầm trung nhưng vẫn đảm bảo các thao tác của bạn được xử lý khá mượt mà và ổn định. Chiếc điện thoại này có RAM 3GB nhưng thực tế có thể mở rộng lên 4GB từ việc chuyển đổi một phần ROM thành RAM. Nhờ vậy, có thể tăng thêm phần mạnh mẽ giúp người dùng có những trải nghiệm tốt hơn.	100	2690000	2024-04-09 20:10:10.008262+07	2024-04-09 20:10:10.008262+07
36	16	Điện thoại OPPO A78 - Hàng chính hãng	ĐIỆN THOẠI OPPO A78 (8GB/256GB) - HÀNG CHÍNH HÃNG.\n\nBẢO HÀNH 12 THÁNG TẠI CÁC TTBH OPPO TOÀN QUỐC.\n\n30 NGÀY ĐỔI MỚI 1 - 1 nếu có lỗi từ nhà sản xuất tại các TTBH OPPO Toàn quốc.\n\nHOT LINE HỖ TRỢ MIỄN PHÍ: 1800.5888.41 (. Miễn phí cước gọi )	100	6190000	2024-04-09 20:17:25.287751+07	2024-04-09 20:17:25.287751+07
37	16	Điện Thoại OPPO RENO7 PRO (12GB/256GB) - Hàng Chính Hãng	OPPO RENO7 PRO 5G - trải nghiệm nhiếp ảnh chuyên nghiệp\n\n\n\nReno7 Pro 5G sở hữu hệ thống camera chân dung chuyên nghiệp, bao gồm camera chính 50MP được hỗ trợ bởi cảm biến IMX766 với kích thước lên tới 1/1,56 inch, cùng với camera macro 2MP và cảm biến nhiệt độ màu chuyên dụng, tích hợp các công nghệ tiên tiến bao gồm Lấy nét đa hướng tất cả điểm ảnh PDAF và DOL-HDR, đảm bảo trải nghiệm chụp ảnh chân dung chuyên nghiệp.\n\nCamera selfie 32MP được trang bị cảm biến RGBW cao cấp mới nhất IMX709, cảm biến được thiết kế bởi OPPO và sản xuất bởi Sony. Cảm biến này có thiết kế mảng điểm ảnh hoàn toàn mới, bổ sung các pixel màu trắng không có trong cảm biến RGGB truyền thống. Nhờ vậy, cảm biến hình ảnh trên Reno7 Pro 5G có thể thu được nhiều ánh sáng hơn 60% so với cảm biến RGGB tiêu chuẩn, giảm nhiễu lên tới 35%, hình ảnh chụp rõ nét với độ sáng tốt hơn đáng kể trong điều kiện ánh sáng yếu, cùng với các cải tiến về kết cấu da, chi tiết và độ tương phản. Kết hợp với thuật toán DOL-HDR cùng tính năng Góc rộng thông minh trên camera trước của Reno7 Pro 5G, người dùng dễ dàng quay video selfie chất lượng cao trong nhiều tình huống khác nhau.\n\nBổ trợ cho phần cứng vượt trội nhất trong Reno7 Series, Reno7 Pro 5G còn được trang bị đầy đủ các tính năng chụp ảnh và quay video chuyên nghiệp, như Video Chân dung Bokeh Flare cho những thước phim chân dung cảm xúc với hiệu ứng xoá phông bokeh tự nhiên như trên các máy ảnh DSLR chuyên nghiệp; Video Nổi bật AI sử dụng thuật toán để tối ưu hoá chất lượng hình ảnh trong từng điều kiện sáng khác nhau; Chế độ Chân dung 2.0 cho phép người dùng tuỳ chỉnh chuyên sâu như điều chỉnh khẩu độ, kích cỡ bokeh để tạo ra những bức ảnh chân dung độc nhất. Một loạt các tính năng khác như Chân dung màu AI, Video hiển thị kép, Ảnh siêu nét 108MP, Chụp nhanh siêu nét,... đều mang đến cho người dùng những công cụ sáng tạo để thể hiện bản thân và ghi lại những khoảnh khắc đặc biệt theo phong cách riêng của mình.\n\nThiết kế cao cấp\n\nReno7 Pro 5G kế thừa quy trình sản xuất độc quyền OPPO Glow đặc trưng của dòng Reno với ngôn ngữ thiết kế thời thượng, tinh tế cùng hai phiên bản màu: Xanh Sao Băng và Đen Vô Cực. Đặc biệt, trên phiên bản màu Xanh Sao Băng, OPPO còn sử dụng công nghệ tạo hình bằng laser LDI (Laser Direct Imaging) để khắc 1,2 triệu vệt siêu nhỏ lên mặt lưng kính AG phủ chất cản quang, mô phỏng những vệt sao băng lấp lánh độc đáo. Đây là lần đầu tiên công nghệ LDI được ứng dụng trong thiết kế mặt lưng cho smartphone.\n\nThiết bị được hoàn thiện bằng kính 2,5D ở cả mặt trước và mặt sau, tạo cảm giác cầm nắm chắc tay, thao tác trơn tru liền mạch hơn. Reno7 Pro 5G có kích thước mỏng nhẹ, với độ dày chỉ 7,45mm và tổng trọng lượng chỉ khoảng 180g.\n\nViền đèn quỹ đạo, với một viền đèn 3D mảnh bao quanh khu vực camera sau, tạo nên điểm nhấn đặc biệt cho Reno7 Pro 5G. Điện thoại trang bị màn hình AMOLED 6,5 inch với tốc độ làm mới 90Hz mang lại trải nghiệm thị giác mượt mà và thoải mái. Màn hình được chứng nhận HDR10+ cho trải nghiệm hình ảnh sống động chất lượng cao, đồng thời được chứng nhận Amazon Prime Video HD/HDR cho phép xem các nội dung giải trí với độ phân giải cao.\n\nThiết kế của Reno7 Pro 5G mới đây vinh dự đạt Giải thưởng Thiết kế iF 2022 ở hạng mục Sản phẩm, phân loại Thiết bị viễn thông. Đây là một giải thưởng về thiết kế uy tín trên thế giới, do tổ chức thiết kế quốc tế iF International Forum Design GmbH tổ chức, với sự tham gia của 132 chuyên gia thiết kế toàn thế giới vào hội đồng đánh giá.\n\nHiệu năng vượt trội cùng trải nghiệm kết nối mạnh mẽ\n\nReno7 Pro 5G tích hợp vi xử lý 5G dành riêng cho dòng điện thoại cao cấp - MediaTek Dimensity 1200-MAX, được tuỳ biến riêng dành cho Reno7 Pro 5G dựa trên sự hợp tác giữa OPPO và MediaTek, mang tới trải nghiệm hiệu năng vượt trội, thao tác đa nhiệm mượt mà cùng kết nối 5G mạnh mẽ. Vi xử lý này được xây dựng trên tiến trình 6nm với tám lõi bao gồm lõi ARM Cortex-A78 hoạt động ở tốc độ lên đến 3GHz.\n\nReno7 Pro 5G cung cấp cho người dùng dung lượng bộ nhớ lên tới 12GB RAM và 256GB ROM cùng công nghệ Mở rộng RAM lên đến 7GB, hỗ trợ tối đa cho việc lưu trữ thông tin và đảm bảo độ mượt mà khi thao tác đa nhiệm trên máy.\n\nBên cạnh đó, người dùng không cần lo lắng về thời lượng sử dụng trên Reno7 Pro 5G khi thiết bị sở hữu công nghệ sạc nhanh SUPERVOOC lên đến 65W. Thiết bị chỉ mất khoảng 31 phút để sạc đầy 100% viên; chỉ với 5 phút sạc là người dùng có thể xem phim liên tục trong 4 giờ.	100	9590000	2024-04-09 20:19:43.465133+07	2024-04-09 20:19:43.465133+07
38	16	Điện Thoại OPPO RENO8 Pro (12GB/256GB) - Hàng Chính Hãng - Quà tặng độc quyền	Bên trong hộp: \n\n-OPPO RENO8 Pro\n\n- Cáp USB Type C\n\n- Củ sạc Super VOOC 80W\n\n- Không tai nghe\n\n- Dụng cụ lấy SIM\n\n- Sách hướng dẫn\n\n- Miếng dán màn hình (Đã dán sẵn)\n\n- Vỏ bảo vệ\n\n\n\nThông tin bảo hành:\n\n- Sản phẩm được bảo hành 12 tháng tại các trung tâm bảo hành OPPO\n\n- 1 đổi 1 trong 30 ngày đầu sử dụng (Lỗi phần cứng sản xuất)\n\n- Giao hàng trên toàn quốc\n\n- Hotline: 1800 577 776 (miễn phí).	100	13990000	2024-04-09 20:21:58.385237+07	2024-04-09 20:21:58.385237+07
39	17	Điện thoại Apple iPhone 13 128GB	Thông số kỹ thuật\n\nMàn hình: OLED6.1"Super Retina XDR\n\nHệ điều hành: iOS 15\n\nCamera sau: 2 camera 12 MP\n\nCamera trước: 12 MP\n\nChip: Apple A15 Bionic\n\nRAM: 4 GB\n\nBộ nhớ trong: 128 GB\n\nSIM: 1 Nano SIM & 1 eSIMHỗ trợ 5G\n\nPin, Sạc: 20 W\n\n\n\nBộ sản phẩm bao gồm: thân máy, sách hướng dẫn,...\n\n\n\nThông tin bảo hành\n\nBảo hành: 12 tháng kể từ ngày kích hoạt sản phẩm.\n\nKích hoạt bảo hành tại: https://checkcoverage.apple.com/vn/en/\n\n\n\nHướng dẫn kiểm tra địa điểm bảo hành gần nhất:\n\nBước 1: Truy cập vào đường link https://getsupport.apple.com/?caller=grl&locale=en_VN \n\nBước 2: Chọn sản phẩm.\n\nBước 3: Điền Apple ID, nhập mật khẩu.\n\nSau khi hoàn tất, hệ thống sẽ gợi ý những trung tâm bảo hành gần nhất.\n\n\n\nTại Việt Nam, về chính sách bảo hành và đổi trả của Apple, "sẽ được áp dụng chung" theo các điều khoản được liệt kê dưới đây:\n\n\n\n1) Chính sách chung: https://www.apple.com/legal/warranty/products/warranty-rest-of-apac-vietnamese.html\n\n\n\n2) Chính sách cho phụ kiện: https://www.apple.com/legal/warranty/products/accessory-warranty-vietnam.html\n\n\n\n3) Các trung tâm bảo hành Apple ủy quyền tại Việt Nam: https://getsupport.apple.com/repair-locations?locale=vi_VN\n\n\n\nQúy khách vui lòng đọc kỹ hướng dẫn và quy định trên các trang được Apple công bố công khai, Shop chỉ có thể hỗ trợ theo đúng chính sách được đăng công khai của thương hiệu Apple tại Việt Nam,\n\n\n\nBài viết tham khảo chính sách hỗ trợ của nhà phân phối tiêu biểu:\n\n\n\nhttps://synnexfpt.com/bao-hanh/chinh-sach-bao-hanh/?agency-group=1&agency-slug=san-pham-apple\n\n\n\n Để thuận tiện hơn trong việc xử lý khiếu nại, đơn hàng của Brand Apple thường có giá trị cao, Qúy khách mua hàng vui lòng quay lại Clip khui mở kiện hàng (khách quan nhất có thể, đủ 6 mặt) giúp Shopee có thêm căn cứ để làm việc với các bên và đẩy nhanh tiến độ xử lý giúp Qúy khách mua hàng.	100	14190000	2024-04-09 20:23:58.266697+07	2024-04-09 20:23:58.266697+07
40	17	Điện thoại Apple iPhone 15 128GB	Thông số kỹ thuật\n\n- 6.1″\n\n- Màn hình Super Retina XDR\n\n- Nhôm với mặt sau bằng kính pha màu\n\n- Nút chuyển đổi Chuông/Im Lặng\n\n- Dynamic Island\n\n- Chip A16 Bionic với GPU 5 lõi\n\n- SOS Khẩn Cấp \n\n- Phát Hiện Va Chạm\n\n- Pin: Thời gian xem video lên đến 26 giờ\n\n- USB‑C: Hỗ trợ USB 2\n\n\n\nCamera sau\n\n- Chính 48MP | Ultra Wide\n\n- Ảnh có độ phân giải siêu cao (24MP và 48MP)\n\n- Ảnh chân dung thế hệ mới với Focus và Depth Control\n\n- Phạm vi thu phóng quang học 4x\n\n\n\nBộ sản phẩm bao gồm: \n\n•        Điện thoại \n\n•        Dây sạc\n\n•        HDSD Bảo hành điện tử 12 tháng.\n\n\n\nThông tin bảo hành:\n\nBảo hành: 12 tháng kể từ ngày kích hoạt sản phẩm.\n\nKích hoạt bảo hành tại: https://checkcoverage.apple.com/vn/en/\n\n\n\nHướng dẫn kiểm tra địa điểm bảo hành gần nhất:\n\nBước 1: Truy cập vào đường link https://getsupport.apple.com/?caller=grl&locale=en_VN \n\nBước 2: Chọn sản phẩm.\n\nBước 3: Điền Apple ID, nhập mật khẩu.\n\nSau khi hoàn tất, hệ thống sẽ gợi ý những trung tâm bảo hành gần nhất.\n\n\n\nTại Việt Nam, về chính sách bảo hành và đổi trả của Apple, "sẽ được áp dụng chung" theo các điều khoản được liệt kê dưới đây:\n\n\n\n1) Chính sách chung: https://www.apple.com/legal/warranty/products/warranty-rest-of-apac-vietnamese.html\n\n\n\n2) Chính sách cho phụ kiện: https://www.apple.com/legal/warranty/products/accessory-warranty-vietnam.html\n\n\n\n3) Các trung tâm bảo hành Apple ủy quyền tại Việt Nam: https://getsupport.apple.com/repair-locations?locale=vi_VN\n\n\n\nQúy khách vui lòng đọc kỹ hướng dẫn và quy định trên các trang được Apple công bố công khai, Shop chỉ có thể hỗ trợ theo đúng chính sách được đăng công khai của thương hiệu Apple tại Việt Nam,\n\n\n\nBài viết tham khảo chính sách hỗ trợ của nhà phân phối tiêu biểu:\n\n\n\nhttps://synnexfpt.com/bao-hanh/chinh-sach-bao-hanh/?agency-group=1&agency-slug=san-pham-apple\n\n\n\n Để thuận tiện hơn trong việc xử lý khiếu nại, đơn hàng của Brand Apple thường có giá trị cao, Qúy khách mua hàng vui lòng quay lại Clip khui mở kiện hàng (khách quan nhất có thể, đủ 6 mặt) giúp Shopee có thêm căn cứ để làm việc với các bên và đẩy nhanh tiến độ xử lý giúp Qúy khách mua hàng.	100	20390000	2024-04-09 20:26:38.259312+07	2024-04-09 20:26:38.259312+07
41	17	Điện thoại Apple iPhone 14 128GB	iPhone 14. Với hệ thống camera kép tiên tiến nhất từng có trên iPhone. Chụp những bức ảnh tuyệt đẹp trong điều kiện từ thiếu sáng đến dư sáng. Phát hiện Va Chạm,1 một tính năng an toàn mới, thay bạn gọi trợ giúp khi cần kíp.\n\n\n\nTính năng nổi bật\n\n•        Màn hình Super Retina XDR 6,1 inch2\n\n•        Hệ thống camera tiên tiến cho chất lượng ảnh đẹp hơn trong mọi điều kiện ánh sáng\n\n•        Chế độ Điện Ảnh nay đã hỗ trợ 4K Dolby Vision tốc độ lên đến 30 fps\n\n•        Chế độ Hành Động để quay video cầm tay mượt mà, ổn định\n\n•        Công nghệ an toàn quan trọng - Phát Hiện Va Chạm1 thay bạn gọi trợ giúp khi cần kíp\n\n•        Thời lượng pin cả ngày và thời gian xem video lên đến 20 giờ3\n\n•        Chip A15 Bionic với GPU 5 lõi để đạt hiệu suất siêu nhanh. Mạng di động 5G siêu nhanh4\n\n•        Các tính năng về độ bền dẫn đầu như Ceramic Shield và khả năng chống nước5\n\n•        iOS 16 đem đến thêm nhiều cách để cá nhân hóa, giao tiếp và chia sẻ6\n\n\n\nPháp lý\n\n1SOS Khẩn Cấp sử dụng kết nối mạng di động hoặc Cuộc Gọi Wi-Fi.\n\n2Màn hình có các góc bo tròn. Khi tính theo hình chữ nhật chuẩn, kích thước màn hình theo đường chéo là 6,06 inch. Diện tích hiển thị thực tế nhỏ hơn.\n\n3Thời lượng pin khác nhau tùy theo cách sử dụng và cấu hình; truy cập apple.com/batteries để biết thêm thông tin.\n\n4Cần có gói cước dữ liệu. Mạng 5G chỉ khả dụng ở một số thị trường và được cung cấp qua một số nhà mạng. Tốc độ có thể thay đổi tùy địa điểm và nhà mạng. Để biết thông tin về hỗ trợ mạng 5G, vui lòng liên hệ nhà mạng và truy cập apple.com/iphone/cellular.\n\n5iPhone 14 có khả năng chống tia nước, chống nước và chống bụi. Sản phẩm đã qua kiểm nghiệm trong điều kiện phòng thí nghiệm có kiểm soát đạt mức IP68 theo tiêu chuẩn IEC 60529 (chống nước ở độ sâu tối đa 6 mét trong vòng tối đa 30 phút). Khả năng chống tia nước, chống nước và chống bụi không phải là các điều kiện vĩnh viễn. Khả năng này có thể giảm do hao mòn thông thường. Không sạc pin khi iPhone đang bị ướt. Vui lòng tham khảo hướng dẫn sử dụng để biết cách lau sạch và làm khô máy. Không bảo hành sản phẩm bị hỏng do thấm chất lỏng. \n\n6Một số tính năng không khả dụng tại một số quốc gia hoặc khu vực. \n\n\n\nThông số kỹ thuật\n\nTruy cập apple.com/iphone/compare để xem cấu hình đầy đủ. \n\n\n\n\n\n\n\nBộ sản phẩm bao gồm: \n\n•        Điện thoại \n\n•        Dây sạc\n\n•        HDSD Bảo hành điện tử 12 tháng.\n\n\n\nThông tin bảo hành:\n\nBảo hành: 12 tháng kể từ ngày kích hoạt sản phẩm.\n\nKích hoạt bảo hành tại: https://checkcoverage.apple.com/vn/en/\n\n\n\nHướng dẫn kiểm tra địa điểm bảo hành gần nhất:\n\nBước 1: Truy cập vào đường link https://getsupport.apple.com/?caller=grl&locale=en_VN \n\nBước 2: Chọn sản phẩm.\n\nBước 3: Điền Apple ID, nhập mật khẩu.\n\nSau khi hoàn tất, hệ thống sẽ gợi ý những trung tâm bảo hành gần nhất.\n\n\n\nTại Việt Nam, về chính sách bảo hành và đổi trả của Apple, "sẽ được áp dụng chung" theo các điều khoản được liệt kê dưới đây:\n\n\n\n1) Chính sách chung: https://www.apple.com/legal/warranty/products/warranty-rest-of-apac-vietnamese.html\n\n\n\n2) Chính sách cho phụ kiện: https://www.apple.com/legal/warranty/products/accessory-warranty-vietnam.html\n\n\n\n3) Các trung tâm bảo hành Apple ủy quyền tại Việt Nam: https://getsupport.apple.com/repair-locations?locale=vi_VN\n\n\n\nQúy khách vui lòng đọc kỹ hướng dẫn và quy định trên các trang được Apple công bố công khai, Shop chỉ có thể hỗ trợ theo đúng chính sách được đăng công khai của thương hiệu Apple tại Việt Nam,\n\n\n\nBài viết tham khảo chính sách hỗ trợ của nhà phân phối tiêu biểu:\n\n\n\nhttps://synnexfpt.com/bao-hanh/chinh-sach-bao-hanh/?agency-group=1&agency-slug=san-pham-apple\n\n\n\n Để thuận tiện hơn trong việc xử lý khiếu nại, đơn hàng của Brand Apple thường có giá trị cao, Qúy khách mua hàng vui lòng quay lại Clip khui mở kiện hàng (khách quan nhất có thể, đủ 6 mặt) giúp Shopee có thêm căn cứ để làm việc với các bên và đẩy nhanh tiến độ xử lý giúp Qúy khách mua hàng.	100	17690000	2024-04-09 20:28:26.040082+07	2024-04-09 20:28:26.040082+07
62	23	Balo nam nữ đi học đi làm BAMA Mesh Fabric Backpack MF102 chống nước nhiều ngăn, cặp sách đi học đựng laptop 15 6 inch	MESH FABRIC - là dòng sản phẩm có sử dụng “chất vải lưới” đặc biệt đang được BAMA tập trung phát triển. Đặc điểm nổi bật của bộ sưu tập này là khả năng thoải mái cá nhân hoá bằng việc cài pin trực tiếp lên chất vải lưới, không lo thương tổn bề mặt túi. Điều này thúc đẩy việc truyền bá thông điệp cá nhân, thể hiện bản thân qua những chiếc pin cài ý nghĩa.	100	495000	2024-04-10 13:48:08.065736+07	2024-04-10 13:48:08.065736+07
63	23	Balo nam nữ đi học đi làm BAMA Border Backpack chống nước nhiều ngăn, cặp sách đi học đựng laptop 15 6 inch	Mua hàng CHÍNH HÃNG tại BAMA để nhận được các quyền lợi và chính sách BẢO HÀNH TRỌN ĐỜI!!\n\nBAMA cam kết mức giá hoàn toàn xứng đáng với chất lượng sản phẩm. \n\n\n\nTên thương hiệu:   BAMA.VN\n\nTên sản phẩm:       Balo BAMA - BORDER BACKPACK - Balo nam, nữ Chính Hãng\n\nDanh mục:              Túi ví nữ - Balo - Balo đeo vai\n\n\n\nTHÔNG TIN SẢN PHẨM\n\n- Kích thước: 42 x 29 x 12cm.\n\n- Đựng laptop 15,6 inch, chống nước kèm ngăn đệm chống sốc laptop\n\n- Chất liệu:  vải Polyester kèm ngăn đệm chống sốc laptop, chống thấm nước 1000PU nhập khẩu, khoá kéo YKK chính hãng.\n\n- Màu sắc : Black&White/ All Black/ White/Tan/All Gray/Black Gray.\n\n- Xuất xứ: tại Việt Nam.\n\n- Năm sản xuất: 2022.\n\n\n\n*Được thiết kế và sản xuất ĐỘC QUYỀN tại Việt Nam: BAMA - một thương hiệu Việt Nam mong muốn mang đến cho bạn trải nghiệm tuyệt vời với tiêu chí chất lượng và tính thẩm mỹ cao được đặt lên hàng đầu. Thương hiệu quốc nội – Chất lượng quốc tế.\n\n\n\nChất liệu vải chống thấm: Balo BAMA, túi đeo chéo BAMA được sử dụng chất liệu vải chống thấm, độ bền cao.\n\nThiết kế tinh tế, hợp thời trang: Mỗi dòng sản phẩm của BAMA đều mang trong mình sự khác biệt và thiết kế vô cùng tinh tế, phù hợp với sự trẻ trung, năng động.\n\n\n\nTính năng tiện dụng: Balo đi học, đi chơi - Balo dành cho nam nữ bao gồm nhiều ngăn tiện ích cho việc đựng nhiều đồ dùng khác nhau. Quai đeo và mặt sau Balo được thiết kế với tiêu chí chống gù lưng, nhức mỏi vai khi đeo nhờ miếng đệm mút và thông thoáng cho phía sau lưng của bạn.\n\n\n\n𝐁𝐀̉𝐎 𝐐𝐔𝐀̉𝐍 Đ𝐔́𝐍𝐆 𝐂𝐀́𝐂𝐇:\n\n- Nên tránh các loại xà bông giặt tẩy mạnh.\n\n- Không dùng vật dụng sắc, nhọn cà trực tiếp lên bề mặt Balo. Không giặt máy. Không tiếp xúc với nơi nhiệt độ cao như lửa.\n\n- Sử dụng bàn chải mềm, tránh chải vào các phần vải dạng lưới to để không gây rách. Tuyệt đối không dùng bàn chải cước cứng sẽ gây ra các vết xước trên nền vải Balo BAMA.\n\n\n\nCAM KẾT 💯\n\n🔹 Sản phẩm như mô tả 100%.\n\n🔹 Balo được kiểm tra kỹ trước khi đóng gói cho khách hàng.\n\n🔹 Hàng có sẵn, giao hàng ngay khi nhận được đơn hàng.\n\n🔹 Hỗ trợ đổi trả theo quy định của Shopee.\n\n\n\nQUYỀN LỢI KHÁCH HÀNG:\n\n- Bảo hành miễn phí khóa, kéo, lỗi do nhà sản xuất TRỌN ĐỜI.\n\n- Đổi trả trong trường hợp giao nhầm (sai) sản phẩm cho khách.\n\n- Sản phẩm bị lỗi nhà sản xuất hoặc bị dơ trong vòng 7 ngày kể từ lúc khách hàng nhận được sản phẩm.\n\n\n\n🔁CHÍNH SÁCH ĐỔI TRẢ THEO QUY ĐỊNH CỦA SHOPEE\n\n1. Trường hợp đổi/trả:\n\n- Hàng lỗi do sản xuất, hư hỏng do vận chuyển.\n\n- Sai kiểu/màu, không đúng mã trong đơn hàng.\n\n2. Đơn hàng được chấp nhận:\n\n- Còn nguyên tag sản phẩm.\n\n- Sản phẩm phải được đóng gói lại cẩn thận và chắc chắn.\n\n3. Đơn hàng không chấp nhận:\n\n- Hàng không còn tag chính hãng.\n\n- Hàng đã qua sử dụng, giặt/tẩy.\n\n- Hàng trả lại shop không đúng mẫu của BAMA, sản phẩm nhái.\n\n- Không thích , không hợp, đặt nhầm mã, nhầm màu.	100	449000	2024-04-10 13:58:08.440102+07	2024-04-10 13:58:08.440102+07
42	17	Điện thoại Apple iPhone 15 Plus 128GB	Thông số kỹ thuật\n\n- 6.7″\n\n- Màn hình Super Retina XDR\n\n- Nhôm với mặt sau bằng kính pha màu\n\n- Nút chuyển đổi Chuông/Im Lặng\n\n- Dynamic Island\n\n- Chip A16 Bionic với GPU 5 lõi\n\n- SOS Khẩn Cấp \n\n- Phát Hiện Va Chạm\n\n- Pin: Thời gian xem video lên đến 26 giờ\n\n- USB‑C: Hỗ trợ USB 2\n\n\n\nCamera sau\n\n- Chính 48MP | Ultra Wide\n\n- Ảnh có độ phân giải siêu cao (24MP và 48MP)\n\n- Ảnh chân dung thế hệ mới với Focus và Depth Control\n\n- Phạm vi thu phóng quang học 4x\n\n\n\nBộ sản phẩm bao gồm: \n\n•        Điện thoại \n\n•        Dây sạc\n\n•        HDSD Bảo hành điện tử 12 tháng.\n\n\n\nThông tin bảo hành:\n\nBảo hành: 12 tháng kể từ ngày kích hoạt sản phẩm.\n\nKích hoạt bảo hành tại: https://checkcoverage.apple.com/vn/en/\n\n\n\nHướng dẫn kiểm tra địa điểm bảo hành gần nhất:\n\nBước 1: Truy cập vào đường link https://getsupport.apple.com/?caller=grl&locale=en_VN \n\nBước 2: Chọn sản phẩm.\n\nBước 3: Điền Apple ID, nhập mật khẩu.\n\nSau khi hoàn tất, hệ thống sẽ gợi ý những trung tâm bảo hành gần nhất.\n\n\n\nTại Việt Nam, về chính sách bảo hành và đổi trả của Apple, "sẽ được áp dụng chung" theo các điều khoản được liệt kê dưới đây:\n\n\n\n1) Chính sách chung: https://www.apple.com/legal/warranty/products/warranty-rest-of-apac-vietnamese.html\n\n\n\n2) Chính sách cho phụ kiện: https://www.apple.com/legal/warranty/products/accessory-warranty-vietnam.html\n\n\n\n3) Các trung tâm bảo hành Apple ủy quyền tại Việt Nam: https://getsupport.apple.com/repair-locations?locale=vi_VN\n\n\n\nQúy khách vui lòng đọc kỹ hướng dẫn và quy định trên các trang được Apple công bố công khai, Shop chỉ có thể hỗ trợ theo đúng chính sách được đăng công khai của thương hiệu Apple tại Việt Nam,\n\n\n\nBài viết tham khảo chính sách hỗ trợ của nhà phân phối tiêu biểu:\n\n\n\nhttps://synnexfpt.com/bao-hanh/chinh-sach-bao-hanh/?agency-group=1&agency-slug=san-pham-apple\n\n\n\n Để thuận tiện hơn trong việc xử lý khiếu nại, đơn hàng của Brand Apple thường có giá trị cao, Qúy khách mua hàng vui lòng quay lại Clip khui mở kiện hàng (khách quan nhất có thể, đủ 6 mặt) giúp Shopee có thêm căn cứ để làm việc với các bên và đẩy nhanh tiến độ xử lý giúp Qúy khách mua hàng.	100	23490000	2024-04-09 20:31:18.131757+07	2024-04-09 20:31:18.131757+07
43	18	Điện thoại vivo Y17s (4GB/128GB) - Hàng Chính Hãng - Camera 50MP\n\n5.0\n	Danh Mục\nShopee\nicon arrow right\nĐiện Thoại & Phụ Kiện\nicon arrow right\nĐiện thoại\nicon arrow right\nVivo\nThương hiệu\nVivo\nDung lượng lưu trữ\n128GB\nLoại bảo hành\nBảo hành nhà cung cấp\nHạn bảo hành\n12 tháng\nRAM\n4GB\nSố khe cắm sim\n2\nSố camera chính\n2\nTính năng điện thoại\nMàn hình cảm ứng, chống nước, Wifi\nLoại điện thoại\nĐiện thoại thông minh\nHỗ trợ hệ điều hành\nAndroid\nLoại cáp điện thoại\nType C\nBộ xử lý\nMedia Tek Helio G85\nĐộ phân giải camera chính\n50MP\nTình trạng\nMới\nDung lượng pin\n5000mAh\nKích thước màn hình\n6.51inches\nKho hàng\n4\nGửi từ\nTP. Hồ Chí Minh	100	3790000	2024-04-09 20:33:46.723105+07	2024-04-09 20:33:46.723105+07
44	18	Điện thoại Vivo Y36 (8GB/128GB) - Xanh Sóng Biển - Hàng Chính Hãng	Danh Mục\nShopee\nicon arrow right\nĐiện Thoại & Phụ Kiện\nicon arrow right\nĐiện thoại\nicon arrow right\nVivo\nThương hiệu\nVivo\nDung lượng lưu trữ\n128GB\nLoại bảo hành\nBảo hành nhà sản xuất\nHạn bảo hành\n12 tháng\nRAM\n8GB\nHỗ trợ hệ điều hành\nAndroid\nLoại cáp điện thoại\nType C\nROM\n8GB\nĐộ phân giải camera chính\n50MP\nDung lượng pin\n5000mAh\nKích thước màn hình\n6.64inches\nKho hàng\n5\nGửi từ\nTP. Hồ Chí Minh	100	5190000	2024-04-09 20:36:20.47611+07	2024-04-09 20:36:20.47611+07
45	18	Điện thoại vivo Y03 (4GB+64GB) - Hàng chính hãng	Thông số kỹ thuật:\n\n1. Thân máy:\n\nKích thước: 163.63*75.58*8.39 (mm)\n\nTrọng lượng: 185g\n\nChất liệu: Polymer\n\nPhương thức mở khóa: không hỗ trợ vân tay\n\n2. Thông số cơ bản\n\nMàu sắc: Xanh biển Ngọc, Đen tinh vân\n\nKhách nước, kháng bụi: IP54\n\nPhiên bản Android: Android 14\n\nHệ điều hành: Funtouch Ó 14.0\n\n3. Nền tảng\n\nChip: Helio G85\n\nSố nhân CPU: 8 nhân\n\nTiến trình CPU: 12nm\n\nTốc độ CPU: 2.0GHz*x + 1.8GHz*6\n\n4. Bộ nhớ\n\nRAM & ROM: 4GB + 64GB\n\nRAM mở rộng: 4GB\n\nMở rộng thẻ nhớ: 1TB\n\n5. PIN\n\nDung lượng: 5000mAh\n\nSạc nhanh: 15W\n\nLoại pin: Li-ion\n\n6. Mà hình hiển thị\n\nKích thước: 6.56\n\nĐộ phân giả: 1612x720\n\nTần số quét: 60Hz\n\nChất liệu LCD\n\n7. Kết nối\n\nWifi: 2.4 GHz/5 GHz\n\nBluetooth: 5.0\n\nNFC: không hỗ trợ\n\nKhe cắm sin: 2 nano SIMs + 1 micro SD\n\n8. Camera\n\nĐộ phân giải: trước 5.0 MP/ Sau 13.0 MP + 0.08 MP\n\nĐèn flash: camera sau\n\n------------------------------------------------\n\nChính sách bảo hành: \n\nA. Điều khoản bảo hành\n\nNếu sản phẩm phát sinh lỗi kỹ thuật do vấn đề chất lượng của phụ kiện hoặc sản phẩm, thì khách hàng có thể\n\ndựa vào chứng từ mua hàng hợp lệ để sử dụng dịch vụ đổi hàng hoặc sửa chữa.\n\n1. Trong vòng 30 ngày kể từ ngày mua, nếu phát sinh lỗi kỹ thuật không liên quan đến tác động của khách hàng,\n\nsẽ được đổi máy mới. Bảo hành 1 năm đối với thân máy.\n\n2. Bảo hành 6 tháng đối với phụ kiện đi kèm:bộ sạc, cáp USB, tai nghe, thẻ SD.\n\n3. Bảo hành 12 tháng đối với phụ kiện đi kèm:pin\n\n4. Trong thời hạn bảo hành, khách hàng phải xuất trình chứng từ mua hàng hợp lệ mới được hưởng quyền lợi\n\nbảo hành như: đổi mới hoặc sửa chữa.\n\n5. Công ty vivo không áp dụng bảo hành cho những phụ kiện khác (ví dụ như: sổ tay hướng dẫn sử dụng, thẻ\n\nbảo hành v.v.).\n\n\n\nB. Quy định bảo hành\n\n1. Dịch vụ bảo hành chỉ có hiệu lực khi sản phẩm được sử dụng một cách bình thường. Nếu sản phẩm bị hư\n\nhỏng không phải do lỗi kỹ thuật hoặc thuộc một trong những tình huống sau sẽ không được áp dụng dịch vụ\n\nbảo hành miễn phí, nhưng khách hàng có thể trả phí để sửa chữa sản phẩm:\n\n1.1. Vượt quá thời hạn bảo hành;\n\n1.2. Không có chứng từ mua hàng hợp lệ, ngoại trừ trường hợp khách hàng có thể chứng minh rằng máy vẫn\n\nnằm trong thời hạn bảo hành;\n\n1.3. Nội dung trên chứng từ mua hàng khác với nội dung trên các nhãn của điện thoại hoặc đã bị tẩy xóa, sửa\n\nchữa;\n\n1.4. Sản phẩm bị hư hỏng do khách hàng không sử dụng, bảo quản và bảo dưỡng theo hướng dẫn sử dụng;\n\n1.5. Sản phẩm bị hỏng do đã bị sửa chữa bởi kỹ thuật không thuộc các trung tâm bảo hành ủy quyền của\n\nvivo;\n\n1.6. Sản phẩm bị hư hỏng do trường hợp bất khả kháng; Sản phẩm bị hao mòn tự nhiên (ví dụ: vỏ ngoài, nút\n\nbấm, màn hình hoặc phụ kiện, v.v.).\n\n1.7. Sản phẩm bị lỗi, thiếu sót hoặc khiếm khuyết không phải do Công ty V ivo.\n\n1.8. Sản phẩm bị hỏng do không sử dụng những phụ kiện chính hãng vivo (bộ sạc, cáp USB) sẽ không nằm\n\ntrong phạm vi bảo hành.\n\n2. Để sửa chữa những máy bị hỏng nghiêm trọng do yếu tố con người gây ra chẳng hạn như bị vào nước, bị\n\nthấm nước, bị nứt vỡ, trước tiên khách hàng cần ký thỏa thuận sửa chữa với trung tâm bảo hành của vivo.\n\n3. Khách hàng có thể đến bất kỳ trung tâm bảo hành nào của vivo trên toàn quốc để thực hiện thay mới hoặc\n\nsửa chữa.\n\n4. Tất cả các linh kiện và phụ kiện được thay thế còn trong thời hạn bảo hành đều thuộc về Công ty vivo.	100	2990000	2024-04-09 20:37:58.365281+07	2024-04-09 20:37:58.365281+07
46	19	Máy Chơi Game Sony Playstation 5 - Hàng Chính Hãng	MÔ TẢ SẢN PHẨM \nSony Playstation 5 (PS5)  là cỗ máy chiến game không thể thiếu của mọi game thủ. \nPS5 với thiết kế chữ V độc đáo và đầy đủ cổng kết nối\nPS5 đem lại trải nghiệm cho người dùng tốt hơn khi đồ họa trong các ván game được nâng cấp mạnh mẽ, độ phân giải 8K chân thực và sắc nét. \nPS5 được trang bị ổ cứng SSD 825GB độc quyền. Với nâng cấp này, chiếc máy chơi game thế hệ mới của Sony có khả năng nâng cấp dung lượng lưu trữ, tốc độ tải nhanh hơn, bản đồ hiển thị lớn hơn cũng như quản lý bộ nhớ thẻ game hoàn thiện hơn.\nPS5 có công cụ Tempest dựa trên đơn vị tính toán AMD tùy chỉnh mới, sử dụng bản đồ tùy chỉnh Head-related Transfer Function (HRTF), công nghệ mới này giúp các game thủ trải nghiệm âm thanh 3D trong game chân thực, sống động hơn khi sử dụng tai nghe hay cả với loa ngoài.\n\nTHÔNG TIN CẤU HÌNH \nCPU: \nx86-64-AMD Ryzen™ “Zen 2”\n8 Cores / 16 Threads \nVariable frequency, up to 3.5 GHz\n\nGPU:\nAMD Radeon™ RDNA 2-based graphics engine\nRay Tracing Acceleration \nVariable frequency, up to 2.23 GHz (10.3 TFLOPS)\n\nBộ nhớ hệ thống: \nGDDR6 16GB\n448GB/s Bandwidth\nSSD: \n825GB\n5.5GB/s Read Bandwidth (Raw)\nỔ Quang \nUltra HD Blu-ray (66G/100G) ~10xCAV\nBD-ROM (25G/50G) ~8xCAV\nBD-R/RE (25G/50G) ~8xCAV\nDVD ~3.2xCLV \nĐĩa game PS5: Ultra HD Blu-ray, up to 100GB/disc\n\nĐầu xuất hình ảnh: \nHDMI™ OUT port \nSupport of 4K 120Hz TVs, 8K TVs, VRR (specified by HDMI ver.2.1)\n m Thanh: “Tempest” 3D AudioTec\nKích thước: 390mm x 104mm x 260mm (Dài x Cao x Rộng)(không tính kích thước chiếu lớn nhất và đế)\nTrọng lượng: 4.5 kg \nNguồn điện: 350W\nModel: CFI-1018A 01\nCổng kết nối: \nUSB Type-A port (Hi-Speed USB) \nUSB Type-A port (Super-Speed USB 10Gbps) x2 \nUSB Type-C® port (Super-Speed USB 10Gbps)\nKết nối mạng: \nEthernet (10BASE-T, 100BASE-TX, 1000BASE-T)\nIEEE 802.11 a/b/g/n/ac/ax \nBluetooth® 5.1\n\nTHÔNG TIN BẢO HÀNH\nThông tin bảo hành:\n- Thời gian bảo hành: 12 tháng	100	15488000	2024-04-09 20:49:01.610283+07	2024-04-09 20:49:01.610283+07
47	19	Tai nghe Gaming không dây Inzone H5	Tổng quan\n\n- Công nghệ âm thanh 360 Spatial Sound for Gaming giúp người chơi xác định chính xác vị trí và hướng của âm thanh khi chơi game.\n\n- Thời lượng pin lên đến 28 giờ chơi liên tục khi sạc đầy; vừa chơi game vừa cắm sạc và sạc nhanh 10 phút để sử dụng trong 3 giờ.\n\n- Kết nối không độ trễ qua bộ USB Dongle 2.4 GHz cho PS5/PC hoặc kết nối có dây thông qua cổng 3.5 mm.\n\n- Microphone chất lượng cao lọc tiếng ồn xung quanh chỉ thu giọng nói của người dùng; gạt lên để tắt mic cho trải nghiệm không ngắt quảng.\n\n- Kết nối ứng dụng INZONE Hub (PC) để cá nhân hóa trải nghiệm.	100	3601000	2024-04-09 20:50:37.135256+07	2024-04-09 20:50:37.135256+07
48	19	Google Tivi Sony 4K 65 inch KD-65X75K - Mới 2022 - Miễn Phí Lắp Đặt	Kích Thước Và Trọng Lượng\n\nKÍCH CỠ MÀN HÌNH (INCH, TÍNH THEO ĐƯỜNG CHÉO)\n65 inch (64,5 inch)\n\nKÍCH CỠ MÀN HÌNH (CM, TÍNH THEO ĐƯỜNG CHÉO)\n164 cm\n\nKÍCH THƯỚC TV KHÔNG CÓ CHÂN ĐẾ (R X C X D)\n1463 x 852 x 87 mm\n\nKÍCH THƯỚC TV KÈM CHÂN (BỐ TRÍ KIỂU CHUẨN) (R X C X D)\n1463 x 914 x 337 mm\n\nKÍCH THƯỚC THÙNG ĐỰNG (R X C X D)\nXấp xỉ 1567 x 963 x 186 mm\n\nCHIỀU RỘNG CHÂN ĐẾ (BỐ TRÍ KIỂU CHUẨN)\n1153 mm\n\nKHOẢNG CÁCH GIỮA CÁC LỖ KHOAN THEO TIÊU CHUẨN VESA® (D X C)\n400 x 200 mm\n\nTRỌNG LƯỢNG TV KHÔNG CÓ CHÂN ĐẾ\n21,4 kg\n\nTRỌNG LƯỢNG TV CÓ CHÂN ĐẾ\n22,1 kg\n\nTRỌNG LƯỢNG GỒM THÙNG ĐỰNG (TỔNG)\nXấp xỉ 30 kg\n\nKhả Năng Kết Nối\n\nCHUẨN WI-FI\nWi-Fi 802.11a/b/g/n/ac được chứng nhận\n\nTẦN SỐ WI-FI\n2,4 GHz/5 GHz\n\nHDCP\nHDCP 2.3 (dành cho HDMI™1/2/3)\n\nBRAVIA SYNC (BAO GỒM HDMI-CEC)\nKhông\n\nHDMI TÍCH HỢP KÊNH TRAO ĐỔI ÂM THANH (ARC)\nCó (eARC/ARC)\n\nHình Ảnh (Panel)\nLOẠI MÀN HÌNH\nLCD\n\nĐỘ PHÂN GIẢI MÀN HÌNH (NGANG X DỌC, ĐIỂM ẢNH)\n3840 x 2160\n\nLOẠI ĐÈN NỀN\nLED nền\n\nTỐC ĐỘ LÀM MỚI KHUNG HÌNH\n50 Hz\n\nHình Ảnh (Đang Xử Lý)\nKHẢ NĂNG TƯƠNG THÍCH HDR (MỞ RỘNG DẢI TƯƠNG PHẢN ĐỘNG VÀ KHÔNG GIAN MÀU)\nCó (HDR10, HLG)\n\nBỘ XỬ LÝ HÌNH ẢNH\nBộ xử lý 4K X1™\n\nTĂNG CƯỜNG ĐỘ NÉT\n4K X-Reality™ PRO\n\nTĂNG CƯỜNG MÀU SẮC\nCông nghệ Live Colour™\n\nÂm Thanh (Loa Và Bộ Khuếch Đại)\n\nCÔNG SUẤT ÂM THANH\n10W+10W\n\nLOẠI LOA\nLoa ván hở\n\nCẤU HÌNH LOA\nToàn dải (Bass Reflex Speaker) x 2\n\nTiết Kiệm Điện Và Năng Lượng\nTiết Kiệm Điện Và Năng Lượng\n\nKÍCH CỠ MÀN HÌNH (CM, TÍNH THEO ĐƯỜNG CHÉO)\n164 cm\n\nKÍCH CỠ MÀN HÌNH (INCH, TÍNH THEO ĐƯỜNG CHÉO)\n65 inch (64,5 inch)\n\nMỨC TIÊU THỤ ĐIỆN (Ở CHẾ ĐỘ CHỜ)\n0,5 W\n\nYÊU CẦU VỀ NGUỒN ĐIỆN (ĐIỆN ÁP/TẦN SỐ)\n50/60 Hz, AC 220-240V	100	24900000	2024-04-09 20:52:33.006565+07	2024-04-09 20:52:33.006565+07
49	19	Tai Nghe Không Dây Chụp Tai Chống Ồn Sony WH-1000XM5 - Model 2022	Màu sắc: Đen & Bạc. Khả năng khử tiếng ồn tốt nhất của chúng tôi thậm chí còn tốt hơnHãy xem cách những chiếc tai nghe Sony khử tiếng ồn này kết hợp công nghệ khử tiếng ồn tốt nhất từ ​​trước đến nay của chúng tôi với âm thanh tuyệt vời để mang lại trải nghiệm nghe thực sự ấn tượng.Công nghệ cảm biến đa tiếng ồn Với 4 micrô trên mỗi chụp tai, đây là bước tiến lớn nhất từ ​​trước đến nay của chúng tôi trong việc khử tiếng ồn. Âm thanh xung quanh được thu lại chính xác hơn để giảm đáng kể tiếng ồn tần số cao. Nhờ có Auto NC Optimizer, hiệu suất khử tiếng ồn luôn được tối ưu hóa tự động dựa trên điều kiện đeo và các yếu tố môi trường bên ngoài như áp suất khí quyển.Tính năng chống ồn có một không haiĐược phát triển đặc biệt bởi Sony, Bộ xử lý tích hợp V1 mới khai thác toàn bộ tiềm năng của Bộ xử lý chống ồn HD QN1 của chúng tôi. Sự kết hợp độc đáo của công nghệ này kiểm soát 8 micrô để mang lại chất lượng chống ồn chưa từng có.Bộ trình điều khiển 30mm được thiết kế đặc biệtBộ trình điều khiển 30mm được thiết kế đặc biệt có cạnh mềm giúp tăng khả năng chống ồn, đặc biệt ở dải tần số thấp, giúp bạn thưởng thức âm nhạc chính xác mà không có tiếng ồn xung quanh. Vật liệu composite sợi carbon nhẹ và mái vòm có độ cứng cao, cải thiện độ trong của âm thanh, đặc biệt ở dải tần số cao.Nhiều micrô, tập trung vào giọng nói của bạnĐược trang bị 4 micrô dạng chùm, những tai nghe này được hiệu chỉnh để chỉ thu nhận giọng nói của bạn. Tỷ lệ tín hiệu trên nhiễu được cải thiện cho phép thu nhận được từng từ, ngay cả trong môi trường nhiều tạp âm xung quanh.Cuộc gọi siêu nét, không tiếng ồnNhờ Công nghệ thu giọng nói chính xác với khả năng xử lý âm thanh tiên tiến, người ở đầu dây bên kia sẽ nghe rõ giọng nói của bạn trong môi trường ồn ào. Chúng tôi dùng công nghệ AI để phát triển thuật toán giảm tiếng ồn dựa trên hơn 500 triệu mẫu giọng nói và trích xuất giọng nói của bạn một cách rõ ràng trong nhiều môi trường.Thông số kỹ thuậtLOẠI TAI NGHE: Kín, độngBỘ MÀNG LOA: 30 mmTHỜI GIAN SẠC PIN: Xấp xỉ 3,5 giờPHƯƠNG THỨC SẠC PIN: USBTHỜI GIAN SỬ DỤNG PIN (THỜI GIAN PHÁT NHẠC LIÊN TỤC): Tối đa 30 giờ (BẬT CHỐNG ỒN), Tối đa 40 giờ (TẮT CHỐNG ỒN)THỜI GIAN SỬ DỤNG PIN (THỜI GIAN GIAO TIẾP LIÊN TỤC): Tối đa 24 giờ (BẬT CHỐNG ỒN), Tối đa 32 giờ (TẮT CHỐNG ỒN)PHẠM VI CÓ HIỆU LỰC: 10 mTRÌNH TỐI ƯU HÓA NC CÁ NHÂN: Auto NC OptimizerCHẾ ĐỘ ÂM THANH XUNG QUANH: CóTỐI ƯU HÓA ÁP SUẤT KHÔNG KHÍ: CóCHÚ TÂM NHANH: Có. Giao màu ngẫu nhiên. Màu Bạc - Platinum Silver	100	9490000	2024-04-09 20:54:50.219918+07	2024-04-09 20:54:50.219918+07
50	20	Smart UHD Tivi LG 55 inch 55UQ7550PSF - Miễn phí lắp đặt	Trải nghiệm 4K trong như pha lê\nTV LG UHD nâng cấp trải nghiệm xem của bạn.\nThưởng thức màu sắc sống động và chi tiết ngoạn mục trong Real 4K.\n\nPhù hợp hoàn hảo\ntrong không gian của bạn\nTV LG UHD hiện có thiết kế mỏng hơn và đường viền tối giản bổ sung cho nội thất nhà của bạn.\n\nBộ xử lý AI α5 Thế hệ 5\nNâng cao trải nghiệm xem của bạn\nBộ xử lý AI α5 Thế hệ 5 nâng cao TV LG UHD để mang đến cho bạn trải nghiệm xem ngập tràn.\n\nXác định lại quy mô 4K\nXem nội dung không phải 4K ở chế độ 4K trên màn hình UHD lớn\nđể tận hưởng sự rõ ràng và chính xác trong mọi khoảnh khắc.\n\nThông minh vượt ra khỏi suy nghĩ của bạn\nTừ điều khiển bằng giọng nói đến nội dung cá nhân hóa,\nThinQ AI giúp TV LG UHD trở thành một trải nghiệm thông minh thực sự.\n\nThông số kỹ thuật\nHệ điều hành\twebOS Smart TV\nBộ xử lý (SoC)\tα5 Gen5 AI Processor 4K\nKích thước màn hình\t55\nLoại màn hình hiển thị\t4K UHD\nĐộ phân giải\t3840x2160\nTần số quét\tRefresh Rate 60Hz\nNâng cấp chất lượng hình ảnh với AI\t4K Upscaling\nNguồn cấp\tAC 100 ~ 240V 50-60Hz (Khác nhau theo khu vực)\nKích thước (Rộng x Cao x Sâu) mm\t1244x726x87.1\nKích thước có chân đế (Rộng x Cao x Sâu) mm\t1420x835x190\nTrọng lượng (kg)\t14.3\nTrọng lượng có chân đế (kg)\t14.1\n\nThông tin bảo hành\nThời gian bảo hành: 24 tháng.\nThông tin chi tiết xem tại: https://www.lg.com/vn/tro-giup/bao-hanh.\n\nCông lắp đặt:\n\n- Miễn phí cho nội thành HCM (Quận 1, 2, 3, 4, 5, 6, 7, 8, 10, 11, Tân Bình, Tân Phú, Phú Nhuận, Bình Thạnh, Gò Vấp, Quận 9, 12, Thủ Đức, Bình Tân, Hóc Môn) và nội thành Hà Nội (Quận Ba Đình, Quận Bắc Từ Liêm, Quận Cầu Giấy, Quận Hà Đông, Quận Hai Bà Trưng, Quận Hoàn Kiếm, Quận Hoàng Mai, Quận Long Biên, Quận Nam Từ Liêm, Quận Tây Hồ, Quận Thanh Xuân, Quận Đống Đa)\n- Chi phí vật tư: Nhân viên sẽ thông báo phí vật tư (ống đồng, dây điện v.v...) khi khảo sát lắp đặt (Bảng kê xem tại ảnh 2). Khách hàng sẽ thanh toán trực tiếp cho nhân viên kỹ thuật sau khi việc lắp đặt hoàn thành - chi phí này sẽ không hoàn lại trong bất cứ trường hợp nào.\n- Quý khách hàng có thể trì hoãn việc lắp đặt tối đa là 7 ngày lịch kể từ ngày giao hàng thành công (không tính ngày Lễ). Nếu nhân viên hỗ trợ không thể liên hệ được với Khách hàng quá 3 lần, hoặc Khách hàng trì hoãn việc lắp đặt quá thời hạn trên, Dịch vụ lắp đặt sẽ được hủy bỏ.\n- Đơn vị vận chuyển giao hàng cho bạn KHÔNG có nghiệp vụ lắp đặt sản phẩm. \n- Thời gian bộ phận lắp đặt liên hệ (không bao gồm thời gian lắp đặt): trong vòng 24h kể từ khi nhận hàng (Trừ Chủ nhật/ Ngày Lễ). Trong trường hợp bạn chưa được liên hệ sau thời gian này, vui lòng gọi lên hotline của Shopee (19001221) để được tư vấn.\n- Tìm hiểu thêm về Dịch vụ lắp đặt: \nhelp.shopee.vn/vn/s/article/Làm-thế-nào-để-tôi-có-thể-sử-dụng-dịch-vụ-lắp-đặt-tại-nhà-cho-các-sản-phẩm-tivi-điện-máy-lớn-1542942683961\n- Quy định đổi trả: Chỉ đổi/trả sản phẩm, từ chối nhận hàng tại thời điểm nhận hàng trong trường hợp sản phẩm giao đến không còn nguyên vẹn, thiếu phụ kiện hoặc nhận được sai hàng. Khi sản phẩm đã được cắm điện sử dụng và/hoặc lắp đặt, và gặp lỗi kĩ thuật, sản phẩm sẽ được hưởng chế độ bảo hành theo đúng chính sách của nhà sản xuất	100	8990000	2024-04-09 20:57:04.773659+07	2024-04-09 20:57:04.773659+07
51	20	Máy lọc không khí LG Puricare 360 Hit AS60GHWG0	Làm sạch sâu không khí trong nhà\n\nChế độ chống dị ứng làm giảm vi khuẩn, vi rút, bụi siêu mịn, chất gây dị ứng và thậm chí cả các loại khí độc trong không khí.\n\n\n\nHít thở không khí trong lành với hệ thống lọc đa màng\n\nHệ thống lọc đa màng thu giữ và loại bỏ 99.9%(*) chất có hại - vi khuẩn, vi rút, bụi, chất gây dị ứng và các thành phần gây mùi hôi.\n\n\n\nGiữ không gian sạch bóng vi khuẩn\n\nCông nghệ Ionizer(**) làm giảm vi khuẩn có hại, giúp gia đình bạn luôn khỏe mạnh.\n\n\n\nPhù Hợp Với Mọi Vị Trí, Bao Phủ Được Nhiều Không Gian Hơn\n\nThiết kế nhỏ gọn phù hợp với mọi vị trí và giữ không khí sạch ngay cả trong không gian rộng lớn.\n\n\n\nThanh Lọc Không Khí Xung Quanh Bạn\n\nLG PuriCare™ thanh lọc không khí 360˚ quanh bạn, theo mọi hướng, bất kể bạn đặt nó ở đâu.\n\n\n\nChỉ Rõ Chất Lượng Không Khí\n\nKiểm tra nhanh chất lượng không khí bằng hiển thị được mã hóa màu dựa trên hệ thống phát hiện cảm biến PM 1.0.\n\n\n\nKiểm Soát Không Khí Cùng LG ThinQ™\n\nSử dụng LG ThinQ™ để bật PuriCare™ từ xa giúp không khí trong lành luôn sẵn sàng chờ đón gia đình bạn, đặc biệt là trong những ngày không khí ô nhiễm.\n\n\n\nThông số kỹ thuật\n\nMàu sắc\tTrắng\n\nThông số định mức về điện\t220-240V, 50/60Hz\n\nDiện tích áp dụng [㎡]\t60.0\n\nĐộ ồn [dB]-Tăng cường\t53\n\nĐộ ồn [dB]-Trung bình\t34\n\nĐộ ồn [dB]-Cao\t47\n\nĐộ ồn [dB]-Thấp\t25\n\nKích thước (Chỉ sản phẩm)-Kích thước (RộngxSâuxCao) [mm]\t315 x 315 x 511\n\nKích thước (Chỉ sản phẩm)-Trọng lượng [kg]\t6.75\n\nKích thước (Bao gồm bao bì)-Kích thước (RộngxSâuxCao) [mm]\t411 x 411 x 591\n\nKích thước (Bao gồm bao bì)-Trọng lượng [kg]\t8.05\n\nTốc độ quạt\tTự động - Thấp - Trung bình - Cao - Tăng cường\n\nChế độ ngủ\tCó\n\nKhóa trẻ em\tCó\n\nChẩn đoán thông minh\tCó\n\nBộ tạo ion\tCó\n\nMàn hình\tMàn hình LED\n\nBộ lọc\tBộ lọc sơ cấp X 1ea\n\nBộ lọc Bộ lọc bụi X 1ea\n\nBộ lọc Bộ lọc khí X 1ea\n\nBộ lọc-Cấp độ bộ lọc bụi\tH13\n\nCảm biến-Cảm biến khí\tCó\n\nCảm biến-Cảm biến PM1.0\tCó	100	5290000	2024-04-09 20:58:55.844712+07	2024-04-09 20:58:55.844712+07
52	20	Máy giặt lồng ngang LG Inverter 9kg (Trắng)-FM1209N6W - Miễn phí lắp đặt	Loại máy giặt: Cửa ngang\nLồng giặt: Lồng ngang\nKhối lượng giặt: 9 Kg\nSố người sử dụng: Từ 3 - 5 người\nInverter: Có Inverter\nKiểu động cơ: Truyền động trực tiếp bền & êm\nCông nghệ giặt: Giặt 6 chuyển động\nTiện ích:\nChẩn đoán lỗi Smart Diagnosis\nHẹn giờ giặt\nKhóa trẻ em\nHệ thống lọc xơ vải tự động\nHiệu suất sử dụng điện: 26 Wh/ kg\nTốc độ quay vắt tối đa: 1200 vòng/phút\nChất liệu lồng giặt: Thép không gỉ\nChất liệu vỏ máy: Thép cao cấp\nChất liệu nắp máy: Kính chịu lực\nBảng điều khiển: Song ngữ Anh - Việt, có nút xoay, màn hình hiển thị\nKích thước: Cao 85 cm - Ngang 60 cm - Sâu 58.5 cm\nSản xuất tại: Việt Nam\nThời gian bảo hành động cơ: 10 năm\nDòng sản phẩm: 2019\n\n\nThông tin bảo hành\nThời gian bảo hành: 24 tháng\nXem chi tiết tại: https://www.lg.com/vn/tro-giup/bao-hanh\n\n***Công lắp đặt:\n- Miễn phí cho nội thành HCM (Quận 1, 2, 3, 4, 5, 6, 7, 8, 10, 11, Tân Bình, Tân Phú, Phú Nhuận, Bình Thạnh, Gò Vấp, Quận 9, 12, Thủ Đức, Bình Tân, Hóc Môn) và nội thành Hà Nội (Quận Ba Đình, Quận Bắc Từ Liêm, Quận Cầu Giấy, Quận Hà Đông, Quận Hai Bà Trưng, Quận Hoàn Kiếm, Quận Hoàng Mai, Quận Long Biên, Quận Nam Từ Liêm, Quận Tây Hồ, Quận Thanh Xuân, Quận Đống Đa)\n- Chi phí vật tư: Nhân viên sẽ thông báo phí vật tư (ống đồng, dây điện v.v...) khi khảo sát lắp đặt (Bảng kê xem tại ảnh 2). Khách hàng sẽ thanh toán trực tiếp cho nhân viên kỹ thuật sau khi việc lắp đặt hoàn thành - chi phí này sẽ không hoàn lại trong bất cứ trường hợp nào.\n- Quý khách hàng có thể trì hoãn việc lắp đặt tối đa là 7 ngày lịch kể từ ngày giao hàng thành công (không tính ngày Lễ). Nếu nhân viên hỗ trợ không thể liên hệ được với Khách hàng quá 3 lần, hoặc Khách hàng trì hoãn việc lắp đặt quá thời hạn trên, Dịch vụ lắp đặt sẽ được hủy bỏ.\n- Đơn vị vận chuyển giao hàng cho bạn KHÔNG có nghiệp vụ lắp đặt sản phẩm.\n- Thời gian bộ phận lắp đặt liên hệ (không bao gồm thời gian lắp đặt): trong vòng 24h kể từ khi nhận hàng (Trừ Chủ nhật/ Ngày Lễ). Trong trường hợp bạn chưa được liên hệ sau thời gian này, vui lòng gọi lên hotline của Shopee (19001221) để được tư vấn.\n- Tìm hiểu thêm về Dịch vụ lắp đặt:\nhelp.shopee.vn/vn/s/article/Làm-thế-nào-để-tôi-có-thể-sử-dụng-dịch-vụ-lắp-đặt-tại-nhà-cho-các-sản-phẩm-tivi-điện-máy-lớn-1542942683961\n\n- Quy định đổi trả: Chỉ đổi/trả sản phẩm, từ chối nhận hàng tại thời điểm nhận hàng trong trường hợp sản phẩm giao đến không còn nguyên vẹn, thiếu phụ kiện hoặc nhận được sai hàng. Khi sản phẩm đã được cắm điện sử dụng và/hoặc lắp đặt, và gặp lỗi kĩ thuật, sản phẩm sẽ được hưởng chế độ bảo hành theo đúng chính sách của nhà sản xuất	100	6190000	2024-04-09 21:03:46.1485+07	2024-04-09 21:03:46.1485+07
53	20	Máy lọc không khí LG PuriCare 1 tầng (Safeplus) - AS65GDWH0ABAE	Lọc khí 360˚\nModel: AS65GDWH0\nLG PuriCare™ Lọc sạch không khí xung quanh bạn, từ mọi hướng, dù bạn đặt máy ở đâu\n\nQuạt trực tiếp 360 độ\nCánh quạt được thiết kế hình răng cưa để giảm lực cản không khí cho hiệu quả lọc khí mạnh mẽ hơn\n\nBộ đẩy khí sạch\nBộ đẩy khí sạch Clean Booster đẩy khí sạch đi xa hơn (lên đến 7.5m), lọc khí nhanh hơn 24% và đảm bảo phân bố khí sạch đều khắp căn phòng\n\nHệ thống lọc 6 bước\nHệ thống lọc 6 bước giúp loại bỏ vi khuẩn, vi rút, bụi bẩn, chất gây dị ứng và khí độc hại\n\nBảo vệ sức khỏe gia đình bạn\nBộ phát ion làm giảm các vi khuẩn và vi rút gây hại, bảo vệ sức khỏe gia đình bạn\n\nDễ dàng kiểm soát chất lượng không khí\nDễ dàng theo dõi và nhận biết tình trạng không khí trong nhà với màn hình hiển thị chất lượng không khí theo màu sắc dựa trên hệ thống cảm biến PM 1.0\n\nTự động làm sạch không khí\nChế độ Auto liên tục tự điều chỉnh để bạn luôn được hít thở không khí sạch trong\n\nThông số kỹ thuật\nTấm lọc thô: Có thể thay thế, 1 tấm\nKhử mùi: Có\nHiển thị chất lượng không khí: Xanh lá/ Vàng/ Cam/ Đỏ\nĐiều khiển - Tốc độ quạt: Tự động-Thấp-Trung bình-Cao-Turbo\nĐiều khiển - Hẹn giờ: 2 / 4 / 8/ 12hr\nĐiều khiển - Khóa trẻ em: Có\nCông suất tiêu thụ [W]: 48\nTiếng ồn [dB]: 52(Turbo) / 20(Low)\nKích thước (WxDxH) [mm]: 343 x 343 x 587\nTrọng lượng [kg]: 11.6 kg\n\nThông tin bảo hành\nThời gian bảo hành: 12 tháng.\nThông tin chi tiết xem tại: https://www.lg.com/vn/tro-giup/bao-hanh.	100	15710000	2024-04-09 21:07:51.070821+07	2024-04-09 21:07:51.070821+07
54	21	Chuột không dây bluetooth Logitech Signature M650 - SmartWheel, giảm ồn, tùy chỉnh các nút	Nâng cấp để cuộn thông minh hơn, thoải mái hơn và có hiệu suất cao hơn với Signature M650\n\nCác tính năng linh hoạt của chuột bao gồm cuộn SmartWheel đem lại độ chính xác từng dòng và tự động chuyển sang chế độ lăn tự do siêu nhanh với cú lướt nhẹ của ngón tay. Với nhiều lựa chọn kích cỡ dành cho người có đôi tay nhỏ, hoặc form tay to hay người thuận tay trái có nghĩa là luôn có độ vừa vặn hoàn hảo cho bất kỳ ai. Khả năng kết nối không dây liền mạch, nút bên có thể tùy chỉnh và hình dáng thoải mái giúp bạn làm việc dễ chịu và hiệu quả trong nhiều giờ liền. Công nghệ SilentTouch của Logitech đem lại các cú nhấp yên tĩnh để giúp bạn tập trung - trong khi thời lượng pin 24 tháng** và tính tương thích phổ dụng trên nhiều hệ điều hành đảm bảo hiệu suất cao dễ dàng.\n\n**Thời gian sử dụng pin có thể thay đổi tùy theo người dùng và điều kiện sử dụng máy tính\n\n3.\tĐặc điểm nổi bật:\n\n•\tCUỘN THÔNG MINH HƠN – Cuộn chính xác đến từng dòng để xem tài liệu – và cuộn siêu nhanh cho những trang web dài. Chuyển đổi chế độ với một cú nhấp SmartWheel.\n\n•\tVỪA VẶN HOÀN HẢO CHO ĐÔI TAY BẠN – Được thiết kế cho những đôi tay có kích cỡ từ nhỏ tới trung bình – đem đến độ vừa vặn đến hoàn hảo.\n\n•\tVÔ CÙNG THOẢI MÁI – Làm việc thoải mái trong nhiều giờ với hình dáng uốn lượn, khu vực đặt ngón tay cái êm ái và viền bên bằng cao su giúp bạn giữ chắc chắn.\n\n•\tKẾT NỐI THEO CÁCH BẠN MUỐN – Kết nối ngay lập tức thông qua Bluetooth™ Tiết kiệm Năng lượng hoặc đầu thu USB Logi Bolt.\n\n•\tÍT ỒN HƠN, TẬP TRUNG HƠN – Ít ồn từ cú nhấp hơn 90% với công nghệ SilentTouch.*\n\n•\tCÁC NÚT BÊN CÓ THỂ TÙY CHỈNH – Tùy chỉnh các nút bên với Logitech Options+, khả dụng trên Windows và macOS, thành các lối tắt ưa thích của bạn – như quay lại/tiếp theo hoặc sao chép/dán.\n\n•\tTHỜI LƯỢNG PIN 24 THÁNG – Hoạt động lên tới hai năm trên một quả pin AA đi kèm với chuột của bạn.**\n\n•\tTƯƠNG THÍCH TRÊN NHIỀU NỀN TẢNG – Tương thích liền mạch với các hệ điều hành Windows, macOS, Linux, Chrome OS, ipadOS, và Android.\n\n4.\tTHÔNG SỐ KỸ THUẬT\n\nSignature M650\n\n- Công nghệ SilentTouch giảm ồn\n\n- Hình dáng nhỏ gọn có đường viền\n\n- Điều khiển con trỏ nhạy, êm ái\n\n- Nút bật/tắt nguồn\n\n- 1 pin AA (Pin kiềm)\n\n- Cao x Rộng x Dài: 37,8 x 61,8 x 107,19 mm\n\n- Trọng lượng (kèm pin): 101,2 g\n\nĐầu thu USB Logi Bolt\n\n-Cao x Rộng x Dài: 14,4 x 18,7 x 6,1 mm\n\n-Trọng lượng: 1,8 g\n\nĐầu thu USB Logi Bolt\n\nĐầu thu USB của Logitech (sử dụng logo Logi Bolt)\n\nYêu cầu: Cổng USB có sẵn\n\n•Windows® 10, 11 trở lên\n\n•macOS® 10.10 trở lên\n\n•Linux®\n\n•Chrome OS™\n\nCông nghệ Bluetooth® không dây Tiết kiệm Năng lượng (sử dụng logo Bluetooth®)\n\nYêu cầu: Công nghệ Bluetooth® không dây Tiết kiệm Năng lượng\n\n•Windows® 10, 11 trở lên\n\n•macOS® 10.15 trở lên\n\n•Linux***\n\n•Chrome OS***\n\n•iPadOS 13.4 trở lên***\n\n•Android™ 8.0 trở lên***\n\n***Thiết bị sẽ được hỗ trợ mà không cần thêm trình điều khiển trong Chrome OS và hầu hết các bản phân phối Linux phổ biến.\n\n5.\tKHẢ NĂNG TƯƠNG THÍCH:\n\nWindows, macOS, Linux, Chrome OS, iPadOS, Android\n\n6.\tTHÔNG TIN BẢO HÀNH: Bảo hành phần cứng trong 1 năm	100	639000	2024-04-09 21:11:54.116119+07	2024-04-09 21:11:54.116119+07
55	21	Chuột Bluetooth Logitech M350s Pebble 2 Silent - Mỏng nhẹ, Nút tùy chỉnh, Easy-Switch, 4000DPI	=Thương hiệu Logitech\n\n- Sản xuất tại Trung QUốc\n\n- Bảo hành chính hãng 12 tháng\n\nChú ý: Sản phẩm kết nối thông qua Bluetooth. Theo đóng gói của nhà sản xuất không kèm Receiver, Tuy nhiên có tương thích với Receiver Bolt (Xin vui lòng mua thêm nếu có nhu cầu)\n\n=====================================\n\nThách thức sự nhàm chán: \n\n-    Với thiết kế mỏng, nhiều màu sắc và công nghệ thông minh hơn, con chuột Bluetooth từ Bộ sưu tập Pebble 2 này cho phép bạn thể hiện cá tính và đưa ra tuyên bố của mình\n\n Không bao giờ trở nên tầm thường, Được chế tạo để đi tới những nơi: \n\n-    Thiết kế tròn tối giản của Pebble Mouse 2 M350s được làm từ nhựa tái chế - nó mỏng, nhẹ và di động\n\n Dễ dàng chuyển đổi qua 3 thiết bị:\n\n-     Sử dụng Bluetooth để kết nối tối đa 3 thiết bị không dây trên các hệ điều hành (Windows, macOS, iPadOS, ChromeOS) và chuyển đổi giữa chúng bằng nút Easy-Switch của chuột\n\nTiết kiệm thời gian: \n\n-    Cá nhân hóa nút giữa với ứng dụng Logi Options+ để làm nhiều việc hơn với Pebble Mouse 2; thêm các lối tắt cho các ứng dụng ưa thích của bạn, bao gồm WhatsApp và Spotify\n\n Tạo ấn tượng mạnh mà vẫn yên tĩnh: \n\n-    Hãy để công việc thể hiện nhiều hơn là những cú nhấp chuột; Pebble Mouse 2 M350s là con chuột yên tĩnh với Công nghệ Silent Touch giúp loại bỏ 90% tiếng ồn khi nhấp \n\n Sử dụng lâu hơn: \n\n-    Con chuột không dây cho bạn hàng giờ sử dụng, thời lượng pin 2 năm (4) và chế độ tự động tiết kiệm năng lượng ở chế độ ngủ để sử dụng mà không cần lo lắng; đi kèm pin\n\n Thiết kế lựa chọn mà bạn sẽ cảm thấy hài lòng: \n\n-    Các bộ phận bằng nhựa trong Chuột Bluetooth Pebble Mouse 2 M350s bao gồm ít nhất 58% nhựa tái chế sau tiêu dùng được chứng nhận.\n\n Đóng gói bao bì từ nguồn có trách nhiệm: \n\n-   Bao bì của Logitech Pebble Mouse 2 M350s (bao gồm màng bọc sản phẩm) đến từ các khu rừng được chứng nhận FSC và các nguồn được kiểm soát khác; được chứng nhận trung hòa các-bon\n\n \n\n  TÓM TẮT TÍNH NĂNG \n\n- Chuột không dây Bluetooth Logitech Pebble Mouse 2 M350s\n\n- Con chuột mỏng được làm từ nhựa tái chế\n\n- Ghép cặp với nhiều thiết bị lên tới 3 thiết bị\n\n- Nút giữa có thể tùy chỉnh với Ứng dụng Logi Options+\n\n- Các cú nhấp yên lặng với Công nghệ Silent Touch \n\n- Thiết kế chuột cho người thuận cả hai tay\n\n- Thời lượng pin 24 tháng \n\n- Công nghệ Bluetooth® tiết kiệm năng lượng\n\n- Tương thích với nhiều hệ điều hành (Windows, macOS, iPadOS, ChromeOS, Android, Linux)\n\n\n\n  THÔNG SỐ KỸ THUẬT\n\n- Hình dáng tròn, mỏng, thuận cả hai tay được làm từ nhựa tái chế. \n\n- Kích thước \n\n- Chiều cao: 26,62 mm\n\n- Chiều rộng: 58,7 mm\n\n- Độ dài: 106,7 mm\n\n- Trọng lượng: 76 g bao gồm pin\n\n- Pin:  1 pin AA (Pin Alkaline); Nút bật/tắt nguồn\n\n- Phạm vi DPI: 400-4000 dpi (hoàn toàn có thể tùy chỉnh với các mức tăng 100 dpi)\n\n- Công nghệ cảm biến: Theo dõi quang học có độ chính xác cao\n\n- Hỗ trợ phần mềm: Logi Options+ dành cho Windows 10 trở lên và macOS 11 trở lên\n\n\n\n  YÊU CẦU KĨ THUẬT\n\n- Bluetooth® công nghệ tiết kiệm năng lượng\n\n- Yêu cầu truy cập Internet để tải về ứng dụng tùy chỉnh tùy chọn Logi Options+.\n\n- Bluetooth® Yêu cầu: Bluetooth Low Energy\n\n- Windows 10, 11 trở lên \n\n- macOS 11 trở lên \n\n- iPadOS 14 trở lên \n\n- iOS 14 trở lên \n\n- Android 9.0 trở lên\n\n\n\n  THÔNG TIN BẢO HÀNH\n\n\n\n  Bảo hành phần cứng chính hãng Logitech 1 năm\n\n\n\n  TRONG HỘP BAO GỒM  \n\n\n\n- Pebble Mouse 2 M350s\n\n-  1 pin kiềm AA (có sẵn)	100	489000	2024-04-09 21:26:20.191676+07	2024-04-09 21:26:20.191676+07
56	21	Chuột không dây Logitech MX Anywhere 3S Silent -Cuộn nhanh, 8000DPI, Sạc USB C, Bluetooth	- Thương hiệu Logitech\n\n- Bảo hành chính hãng 12 tháng\n\n====================================\n\nLogitech MX Anywhere 3S - con chuột không dây nhỏ gọn được yêu  thích với độ chính xác và khả năng điều khiển ở cấp độ cao.\n\nGiờ đây với các cú nhấp yên tĩnh đem lại cảm giác trực quan đầy thỏa mãn với ít tiếng ồn khi nhấp hơn (So với MX Anywhere 3). MX Anywhere 3S giờ đây cũng được trang bị cảm biến quang học 8K DPI để đem lại độ nhạy cấp độ mới trên mọi bề mặt - kể cả kính\n\nNút cuộn điện từ MagSpeed đem lại tốc độ, độ chính xác đáng kinh ngạc và sự tĩnh lặng gần như tuyệt đối - với khả năng cuộn 1.000 dòng một giây. Thiết kế kiểu dáng thấp uốn lượn vừa với bàn tay của bạn. MX Anywhere 3S giữ được năng lượng lên tới 70 ngày trong một lần sạc đầy - và đem lại 3 giờ sử dụng sau 1 phút sạc nhanh.\n\nCÁC ĐẶC ĐIỂM NỔI BẬT\n\n- Theo dõi mọi nơi, đi cùng đến mọi nơi: \n\nLàm việc trên mọi bề mặt, ngay cả kính (1), với Chuột Bluetooth MX Anywhere 3S - giờ đây với cảm biến DPI 8K để bạn có thể sử dụng trên nhiều bề mặt hơn với chuyển động tinh tế\n\n- Tập trung sâu hơn với những cú nhấp yên tĩnh: \n\nChuột không dây MX Anywhere 3S được tích hợp Quiet Clicks (Nhấp yên tĩnh) - cảm giác thỏa mãn tương tự nhưng ít tiếng ồn hơn khi nhấp (so với MX Anywhere 3) để ít bị phân tâm và tập trung hơn\n\n- Cuộn 1000 dòng một giây: \n\nVới MagSpeed, bánh xe cuộn nhanh nhất (5) và chính xác nhất của Logitech (4)\n\n- Đa thiết bị, nhiều hệ điều hành: \n\nKết nối với tối đa 3 thiết bị qua Bluetooth trên Windows, macOS, ChromeOS hoặc Linux. Chỉ tương thích với đầu thu USB Logi Bolt (không đi kèm)\n\n- Kết nối liền mạch: \n\nChuột di động MX Anywhere 3S được thiết kế cho Intel Evo, điều đó xác minh rằng nó đáp ứng các thông số kỹ thuật để có kết nối Bluetooth tối ưu: không cần cổng USB, không cần dây, không phức tạp\n\n- Chuột Sạc nhanh qua USB C, pin bền lâu: \n\nGiữ năng lượng lên đến 70 ngày trong một lần sạc đầy và có 3 giờ sử dụng sau một phút sạc ; sạc bằng cáp USB C đi kèm\n\n TÓM TẮT TÍNH NĂNG\n\n- Theo dõi 8K DPI trên mọi bề mặt (1) và Quiet Clicks (2) để bạn có thể làm chủ công việc của mình ở bất cứ đâu,  ngay cả trên kính\n\n- DPI (Giá trị tối đa và tối thiểu): 200 tới 8000 dpi (có thể thiết lập với các mức tăng là 50 dpi)\n\n- Tương thích với các hệ điều hành Windows, macOS, Linux, ChromeOS, iPadOS, Android\n\n- Pin bền lâu: Pin sạc Li-Po (500 mAh); có ba giờ sử dụng chỉ với một phút sạc nhanh. Có thể sạc lại bằng USB-C\n\n- Công nghệ cảm biến: Darkfield có độ chính xác cao\n\n- 6 nút (Nhấp chuột Trái/Phải, Tiếp theo/Quay lại, Chuyển chế độ nút cuộn, Nhấp chuột giữa)\n\n- Nút cuộn: Có, với chế độ chuyển tự động. Cuộn MagSpeed - 1.000 dòng một giây\n\n- Có thể tùy chỉnh với phần mềm Logi Options+\n\n- Làm việc liền mạch trên các thiết bị và hệ điều hành và dễ dàng chuyển văn bản, tệp giữa chúng \n\nTHÔNG SỐ KỸ THUẬT\n\n- Kích thước\n\nChiều cao: 100,5 mm\n\nChiều rộng: 65 mm\n\nChiều dày: 34,4 mm\n\nTrọng lượng: 99g\n\n- DPI (Giá trị tối đa và tối thiểu): 200 tới 8000 dpi (có thể thiết lập với các mức tăng là 50 dpi) Pin sạc Li-Po (500 mAh)\n\n- Bao bì bằng giấy: Được chứng nhận FSC Được chứng nhận trung hòa carbon\n\nYÊU CẦU KĨ THUẬT\n\n- Bluetooth® công nghệ tiết kiệm năng lượng\n\n- Yêu cầu công nghệ Bluetooth tiết kiệm năng lượng\n\n- Windows® 10, 11 trở lên\n\n- macOS 10.15 trở lên\n\n- Linux® (9)\n\n- ChromeOS™ (9)\n\n- iPadOS 14 trở lên (9)\n\n- AndroidTM 8.0 trở lên (9)\n\n* Tương thích với đầu thu USB Logi Bolt (không đi kèm), Không tương thích với các đầu thu USB khác của Logitech.\n\nTHÔNG TIN BẢO HÀNH \n\nBảo hành phần cứng chính hãng Logitech trong 1 năm\n\nTRONG HỘP BAO GỒM \n\nChuột không dây nhỏ gọn Logitech MX Anywhere 3S\n\nDây sạc USB-C (USB-A tới USB-C)\n\nTài liệu hướng dẫn sử dụng	100	1529000	2024-04-09 21:28:27.186909+07	2024-04-09 21:28:27.186909+07
57	21	Chuột không dây Logitech M330 Silent Plus - Giảm ồn, USB, thuận tay phải, PC/ Laptop	Lưu ý: Sản phẩm không có bluetooth, sử dụng kết nối usb Type A trực tiếp (không dùng cổng chuyển đổi)\n\nChuột không dây Logitech M330 Silent Plus giảm ồn 90% - không dây USB 2.4GHz, pin 2 năm, thiết kế công thái học phù hợp người thuận tay phải, PC/ Laptop\n\n- Giảm 90% tiếng ồn: Không gây tiếng kêu khi nhấn, cuộn hay di chuột. Tận hưởng sự yên tĩnh cho bản thân và những người xung quanh. Mức độ âm thanh được đo bởi tổ chức thí nghiệm độc lập và chứng nhận bởi Quiet Mark.\n\n- Thiết kế cho người thuận tay phải: Thiết kế cong thái học với đường viền tay mềm tạo sự thoải mái và chắc chắn khi cầm.\n\n- Thời lượng pin 24 tháng và Chế độ Auto Sleep: Chuột M330 sẽ tự động tắt khi không sử dụng. Tính năng hữu ích đối với người sử dụng internet và làm việc thời gian dài trên máy tính.\n\n- Mắt đọc quang học tiên tiến của Logitech: Giúp di chuyển con trỏ chính xác gần như trên mọi bề mặt,phạm vi kết nối không dây 10m giữa chuột và đầu thu.\n\n- Cắm vào và sử dụng ngay: hoạt động tốt với Windows hayLinux.\n\n- Bảo hành chính hãng 1 năm\n\n- Thương hiệu Logitech, Sản xuất tại Trung Quốc\n\n=======================================\n\nTẬN HƯỞNG SỰ YÊN LẶNG\n\nHoàn thành tất cả công việc mà không bỏ lỡ một nhịp nào hoặc làm phiền những người xung quanh. Chuột yên lặng (Silent Mice) cho cảm giác nhấp chuột tương tự mà không có tiếng nhấp chuột - giảm hơn 90% tiếng ồn. Chân chuột bền bỉ, hiệu suất cao lướt êm trên bàn làm việc. Bánh xe cuộn êm ái bổ sung trọn vẹn cho trải nghiệm yên lặng. Chuột yên lặng (Silent Mice) loại bỏ tiếng ồn quá mức trong khi vẫn bảo vệ sức khỏe và hiệu suất của mọi người. Hãy biến đây thành cú nhấp chuột gây khó chịu cuối cùng của bạn. Gia đình và bạn bè sẽ cảm ơn bạn. \n\nTẬN HƯỞNG SỰ YÊN LẶNG\n\nVới cùng cảm giác nhấp chuột nhưng giảm hơn 90% tiếng nhấp chuột, hãy tận hưởng trải nghiệm yên lặng cho bạn và người xung quanh. Thêm vào đó, sản phẩm có chân được làm từ vật liệu hiệu suất cao và bánh xe cao su để lướt nhẹ và cuộn êm\n\nĐƯỢC THIẾT KẾ CHO TAY PHẢI CỦA BẠN.\n\nThiết kế với những đường cong đem lại chỗ nghỉ ngơi cho ngón tay cái và nâng cao khả năng điều khiển\n\nTUỔI THỌ PIN 24 THÁNG\n\nSử dụng lâu hơn giữa các lần thay pin nhờ công nghệ tiết kiệm năng lượng. M330 SILENT PLUS tự động đưa vào chế độ ngủ khi không sử dụng\n\nĐƠN GIẢN. ĐÁNG TIN CẬY. MẠNH MẼ.\n\nTận hưởng kết nối không dây từ khoảng cách lên tới 10 m nhờ đầu thu nano chỉ cần cắm vào và sử dụng.  M330 SILENT PLUS có tính năng Theo dõi quang học tiên tiến của Logitech® để có chuyển động siêu chính xác gần như trên mọi bề mặt. Không phức tạp, không cần phần mềm. Hoạt động với máy tính chạy Windows®, hoặc Linux®.\n\nCHỨNG NHẬN QUIET MARK\n\nLogitech là công ty sản xuất chuột đầu tiên trên thế giới nhận được chứng nhận Quiet Mark certification. Đóng dấu phê duyệt quốc tế do Hiệp hội Giảm Tiếng ồn của Vương quốc Anh (UK Noise Abatement Society) công nhận công nghệ được thiết kế để giảm ồn\n\nChú ý : \n\n- Mổi sản phẩm Logitech có 2 cấp độ số Serial khác nhau. 1 số trên bao bì (ngoài vỏ hộp) và 1 số bên trên sản phẩm. Hai số Serial này hoàn toàn khác nhau. Do chính sách quản lí riêng của - Logitech nên đây là vấn đề hoàn toàn bình thường.\n\nLogitech bảo hành điện tử theo mã số đơn hàng (Ngoài ra còn bảo hành theo mã số seri từng sản phẩm) nên sẽ không có phiếu bảo hành đi kèm\n\n- Tất cả sản phẩm Logitech đều có thể còn hoặc không còn niêm phong của nhà sản xuất tùy vào từng đợt hàng, chính sách của các đơn vị nhập khẩu, phân phối và quá trình kiểm tra sản phẩm.	100	345000	2024-04-09 21:30:58.91536+07	2024-04-09 21:30:58.91536+07
58	22	Chuột máy tính không dây hiệu Baseus F01B Tri-Mode - Hai màu | Hàng chính hãng - Full cao cấp	~ Chào mừng bạn đến với Baseus Việt Nam ~\n\n             🔥 Cam kết hàng chính hãng 100% 🔥\n\n\n\n--------------------------------\n\nSẢN PHẨM:Chuột máy tính không dây hiệu Baseus F01B Tri-Mode - Hai màu\n\n*Thương hiệu: Baseus\n\n*Đại lý ủy quyền Baseus & Nhà phân phối chính thức\n\n\n\n--------------------------------\n\nĐẶC ĐIỂM NỔI BẬT:\n\n1.Kết nối Tri-Mode\n\n2.Nút im lặng\n\n3.Thiết kế gọn nhẹ\n\n4.Ba mức DPI có thể điều chỉnh\n\n5.Tương thích nhiều hệ thống\n\n\n\n--------------------------------\n\nTHÔNG SỐ KỸ THUẬT:\n\nMẫu số: F01B\n\nKhoảng cách truyền: 20m, 10m\n\nLoại kết nối: Chế độ 2.4G + chế độ không dây kép\n\nPhiên bản không dây: BT5.0, BT3.0\n\nĐộ nhạy: 800/1200/1600DPI\n\nTần số đáp ứng: 250Hz\n\nHệ thống tương thích: Windows, HarmonyOS,\n\nHệ điều hành Apple, Linux, Vista, v.v.	100	179000	2024-04-09 21:32:21.431457+07	2024-04-09 21:32:21.431457+07
59	22	Tai nghe không dây Baseus Bowie H1i | chống ồn Bisa 3D ANC -48dB | Hàng chính hãng | Full cao cấp	~ Chào mừng bạn đến với Baseus Việt Nam ~\n\n🔥 Cam kết hàng chính hãng 100% 🔥\n\n\n\n--------------------------------\n\nSẢN PHẨM: Tai nghe không dây chống ồn hiệu Baseus Bowie H1i\n\n*Thương hiệu: Baseus\n\n*Đại lý ủy quyền Baseus & Nhà phân phối chính thức\n\n\n\n-------------------------\n\nTHÔNG TIN SẢN PHẨM:\n\n*Màu sắc: Cluster.Black, Stellar.White\n\n*Chất liệu: ABS + PC + Kim loại\n\n*Trọng lượng: 226g\n\n*Phiên bản Bluetooth: 5.3\n\n*Khoảng cách liên lạc: Khoảng 10m\n\n*Thích hợp cho: Tương thích với tất cả các thiết bị không dây\n\n*Giờ âm nhạc: Khoảng 100 giờ (tắt ANC), Khoảng 70 giờ (bật ANC)\n\n*Giao diện sạc: Type-C\n\n*Thời gian sạc: Khoảng 2 giờ\n\n*Dung lượng pin: 600mAh/2.22Wh\n\n*Phụ kiện: Cáp Type-C dòng đơn giản 3A 0,3m*1\n\n*Cáp chuyển đổi: 3,5 mm\n\n*Dải đáp ứng tần số: 20Hz-40kHz\n\n\n\nBaseus Bowie H1i Noise Tai nghe ling tái tạo những chi tiết tinh tế chỉ nghe thấy trong phòng thu âm với tần số đáp ứng có thể lên tới 40kHz. Bộ giải mã LHDC cung cấp khả năng truyền phát âm thanh có độ phân giải cao với độ trễ thấp và thuật toán AI tiên tiến tăng cường âm trầm, mang đến cho bạn chất lượng âm thanh đẳng cấp nghe nhạc chất lượng cao.\n\n\n\nGiảm tiếng ồn xung quanh tới 95%\n\nTích hợp 2 chức năng chống ồn chủ động micrô và công nghệ khử tiếng ồn kỹ thuật số, có thể phát hiện và loại bỏ nhiều loại tiếng ồn tần số thấp và trung bình như ô tô và động cơ máy bay. Nút bịt tai mềm mang lại sự bịt kín tốt hơn để tạo ra một không gian riêng tư yên tĩnh cho bạn.\n\n\n\nÂm thanh không gian 3D sống động\n\nVới thuật toán âm thanh theo dõi chuyển động của đầu bạn, tai nghe bluetooth Baseus Bowie H1i giúp bạn luôn là trung tâm của âm thanh , tạo cho bạn cảm giác đắm chìm trong không gian giống như một buổi hòa nhạc.\n\n\n\nKhông còn cần sạc hàng ngày\n\nPin lithium-ion 600mAh đã được thử nghiệm cho thời gian phát lại lên đến 100 giờ, sạc nhanh 2 giờ là đủ cho bạn nghe hơn 3 giờ 000 bài hát mà không phải lo hết pin, kể cả khi nghe nhạc lâu chuyến đi. Với tai nghe không dây Baseus Bowie H1i, Bạn sẽ không bao giờ bỏ lỡ những cuộc gọi quan trọng nhờ kết nối đa điểm.\n\n\n\nĐộ trễ thấp 0,038 giây và MIC ENC\n\nBộ chip Bluetooth 5.3 mới nhất và công nghệ độ trễ thấp giúp đồng bộ hóa hoàn toàn âm thanh và video trong chế độ chơi trò chơi - trải nghiệm không thể chấp nhận được 0,038 giây độ trễ thấp. Mic ENC chỉ phát ra giọng nói của bạn chứ không phát ra tiếng ồn khi gọi điện thoại hoặc giao tiếp trong trò chơi trực tuyến.	100	680000	2024-04-09 21:34:34.250228+07	2024-04-09 21:34:34.250228+07
60	22	Bàn phím không dây hiệu Baseus K01A/K01B Tri-Mode	~ Chào mừng bạn đến với cửa hàng Baseus Việt Nam chính hãng ~\n\n               🔥 Cam kết hàng chính hãng 100% 🔥\n\n\n\n------------------------------\n\nSẢN PHẨM: Bàn phím không dây hiệu Baseus K01A Tri-Mode\n\n*Thương hiệu: Baseus\n\n*Đại lý ủy quyền Baseus & Nhà phân phối chính thức\n\n\n\n-----------------------------\n\nTHÔNG SỐ KỸ THUẬT:\n\nĐiện áp hoạt động: 3 V\n\nDòng điện hoạt động: 2 mA\n\nKhả năng tương thích: Windows, iOS, Linux, Harmony OS, Android\n\nKích thước: 313,79 x 123,84 x 21,99 mm ± 10 mm\n\nTrọng lượng: 375 g ± 10 g (bao gồm đầu thu USB mini, không có pin)\n\nNguồn điện: x2 pin AAA\n\nKết nối 2.4G, Bluetooth 3.0/5.0\n\nPhạm vi: 2.4G 20 m\n\nTuổi thọ phím khoảng: 10.000.000 lần nhấn\n\n\n\n-----------------------------\n\nTận hưởng công việc thoải mái trước máy tính của bạn với Baseus K01A. Bàn phím không dây kết nối đồng thời với 3 thiết bị và mang lại khả năng hoạt động êm ái, mượt mà. Nó mang lại sự thoải mái vô song nhờ thiết kế tiện dụng và 12 phím chức năng sẽ cho phép bạn nhanh chóng điều chỉnh âm lượng, độ sáng màn hình, v.v. Hơn nữa, nó được cung cấp năng lượng bởi 2 pin AAA và chuyển sang chế độ chờ sau 30 phút để tiết kiệm điện .\n\n\n\nKết nối không dây tiện lợi\n\nGhép nối bàn phím với 3 thiết bị cùng lúc và chuyển đổi giữa chúng một cách thuận tiện. Baseus K01A kết nối với các thiết bị tương thích qua Bluetooth 3.0/5.0 và ở băng tần 2.4G, cung cấp tín hiệu ổn định lên đến 20m. Bàn phím hỗ trợ các hệ điều hành Windows, iOS, Linux, Harmony OS và Android nên sẽ hoạt động tốt với các thiết bị như laptop, điện thoại thông minh, máy tính bảng hay máy tính. Bạn có thể thuận tiện chuyển đổi giữa các hệ thống với sự kết hợp của các nút.\n\n\n\nTinh tế đến từng chi tiết\n\nBàn phím Baseus nổi bật bởi thiết kế được cân nhắc kỹ lưỡng. Miếng đệm silicon mang lại sự ổn định và ngăn bàn phím di chuyển. Hơn nữa, các dấu phím có khả năng chống mài mòn và không bị bong tróc quá nhanh, đồng thời thiết kế nhẹ và nhỏ gọn không chiếm nhiều diện tích. Bàn phím sẽ hoàn hảo cho một chiếc bàn nhỏ hơn và việc vận chuyển nó sẽ không thành vấn đề.\n\n\n\nLàm việc thoải mái trước máy tính\n\nBạn làm việc trước máy tính và cần thiết bị phù hợp? Baseus K01A chắc chắn sẽ hấp dẫn bạn. Bàn phím nổi bật nhờ thiết kế cong 6,4° tiện dụng nên việc sử dụng trong thời gian dài không gây khó chịu và đau cổ tay. Hơn nữa, nó không tạo ra nhiều tiếng ồn nên bạn không phải lo lắng về tiếng ồn khó chịu và độ trễ thấp đảm bảo hoạt động trơn tru. Đổi lại, các phím được phân biệt bằng độ bền 10 triệu lần nhấp và dễ dàng chạm vào ngón tay của bạn.\n\n\n\n—---------------------------- \n\nCHÍNH SÁCH ĐỔI TRẢ\n\n1. Do đặc thù về sản phẩm, Baseus sẽ hỗ trợ đổi trả trong các trường hợp:\n\n*Sản phẩm chưa qua sử dụng, còn nguyên tem nhãn và hộp đi kèm.\n\n*Sản phẩm được giao sai với sản phẩm đặt mua trên đơn.\n\n*Sản phẩm  được giao không đủ số lượng so với đơn đặt hàng.\n\n*Sản phẩm bị lỗi từ nhà sản xuất (về bao bì, đóng gói…).\n\n*Tình trạng bên ngoài bị ảnh hưởng như bong tróc, rách bao bì, bể vỡ do vận chuyển.\n\n\n\nThời gian bảo hành tiêu chuẩn: 01 năm miễn phí\n\n\n\nCác hình thức bảo hành: \n\nTất cả sản phẩm mua tại cửa hàng Baseus_Official được áp dụng chính sách bảo hành theo thời gian tiêu chuẩn.\n\n\n\nĐổi mới sản phẩm bị lỗi:\n\nTrong thời gian 12 tháng tính từ ngày bán ra (căn cứ trên tem bảo hành), nếu sản phẩm bị lỗi kỹ thuật do nhà sản xuất, khách hàng sẽ được đổi hàng mới 100% miễn phí.\n\n\n\n2. Quy cách đổi trả\n\nKhi phát hiện hàng bị hư hỏng, bạn hãy chụp lại tình trạng và nhắn tin vào khung chat của Baseus_Official để được hỗ trợ nhanh nhất. Liên hệ phòng bảo hành:\n\n\n\nHotline: tiếp nhận thông tin bảo hành toàn quốc. Vui lòng cung cấp thông tin chi tiết về sản phẩm để được hỗ trợ nhanh nhất.\n\nTrường hợp thời gian khắc phục lâu hơn dự kiến, chúng tôi sẽ hỗ trợ khách hàng mượn một sản phẩm cùng loại tương đương để sử dụng. \n\n\n\nSản phẩm cần thỏa mãn yêu cầu hoàn trả:\n\n*Sản phẩm lỗi: Cần giữ nguyên hộp, nhãn dán in trên mẫu còn nguyên vẹn.\n\n*Sản phẩm giao sai: chưa bị bóc tem, hộp không bị biến dạng, còn nguyên vỏ hộp.\n\n\n\n3. Các trường hợp từ chối đổi trả\n\n*Sản phẩm đã bị tháo dỡ, sửa chữa, tem bảo hành bị rách, bóc ra dán lại\n\n*Các lỗi về phần mềm chỉ được hỗ trợ khắc phục, không thuộc phạm vi bảo hành\n\n*Sản phẩm đã hết hạn bảo hành không được bảo hành miễn phí\n\n\n\n—-------------------------------\n\nCẢM ƠN QUÝ KHÁCH ĐÃ GHÉ THĂM GIAN HÀNG\n\n\n\nHiện nay có rất nhiều sản phẩm Baseus nguồn gốc không rõ hàng mong quý khách hàng cân nhắc trước khi mua hàng tránh phải hàng nhái kém chất lượng\n\n\n\nSản phẩm chính hãng tất cả đều được dán tem bảo hành chính hãng Baseus_Official\n\n\n\n==============================\n\nCHÚC QUÝ KHÁCH MUA SẮM VUI VẺ💌	100	549000	2024-04-09 21:37:02.960619+07	2024-04-09 21:37:02.960619+07
61	23	Balo du lịch làm BAMA Urban Backpack chống nước nhiều ngăn, cặp sách đi học đựng laptop 15 6 inch	*Được thiết kế và sản xuất ĐỘC QUYỀN tại Việt Nam: BAMA - một thương hiệu Việt Nam mong muốn mang đến cho bạn trải nghiệm tuyệt vời với tiêu chí chất lượng và tính thẩm mỹ cao được đặt lên hàng đầu. Thương hiệu quốc nội – Chất lượng quốc tế.\n\n\n\nChất liệu vải chống thấm: Balo BAMA, túi đeo chéo BAMA được sử dụng chất liệu vải chống thấm, độ bền cao.\n\nThiết kế tinh tế, hợp thời trang: Mỗi dòng sản phẩm của BAMA đều mang trong mình sự khác biệt và thiết kế vô cùng tinh tế, phù hợp với sự trẻ trung, năng động.\n\n\n\nTính năng tiện dụng: Balo đi học - Balo dành cho nam nữ bao gồm nhiều ngăn tiện ích cho việc đựng nhiều đồ dùng khác nhau. Quai đeo và mặt sau #balo được thiết kế với tiêu chí chống gù lưng, nhức mỏi vai khi đeo nhờ miếng đệm mút và thông thoáng cho phía sau lưng của bạn.\n\n\n\n𝐁𝐀̉𝐎 𝐐𝐔𝐀̉𝐍 Đ𝐔́𝐍𝐆 𝐂𝐀́𝐂𝐇:\n\n- Nên tránh các loại xà bông giặt tẩy mạnh.\n\n- Không dùng vật dụng sắc, nhọn cà trực tiếp lên bề mặt Balo. Không giặt máy. Không tiếp xúc với nơi nhiệt độ cao như lửa.\n\n- Sử dụng bàn chải mềm, tránh chải vào các phần vải dạng lưới to để không gây rách. Tuyệt đối không dùng bàn chải cước cứng sẽ gây ra các vết xước trên nền vải Balo BAMA.\n\n\n\n𝐂𝐀𝐌 𝐊𝐄̂́𝐓 💯\n\n🔹 Sản phẩm như mô tả 100%.\n\n🔹 Balo được kiểm tra kỹ trước khi đóng gói cho khách hàng.\n\n🔹 Hàng có sẵn, giao hàng ngay khi nhận được đơn hàng.\n\n🔹 Hỗ trợ đổi trả theo quy định của Shopee.\n\n\n\n𝐐𝐔𝐘𝐄̂̀𝐍 𝐋𝐎̛̣𝐈 𝐊𝐇𝐀́𝐂𝐇 𝐇𝐀̀𝐍𝐆:\n\n- Bảo hành miễn phí khóa, kéo, lỗi do nhà sản xuất TRỌN ĐỜI.\n\n- Đổi trả trong trường hợp giao nhầm (sai) sản phẩm cho khách.\n\n- Sản phẩm bị lỗi nhà sản xuất hoặc bị dơ trong vòng 7 ngày kể từ lúc khách hàng nhận được sản phẩm.\n\n\n\n🔁𝐂𝐇𝐈́𝐍𝐇 𝐒𝐀́𝐂𝐇 Đ𝐎̂̉𝐈 𝐓𝐑𝐀̉ 𝐓𝐇𝐄𝐎 𝐐𝐔𝐘 Đ𝐈̣𝐍𝐇 𝐒𝐇𝐎𝐏𝐄𝐄:\n\n1. Trường hợp đổi/trả:\n\n- Hàng lỗi do sản xuất, hư hỏng do vận chuyển.\n\n- Sai kiểu/màu, không đúng mã trong đơn hàng.\n\n2. Đơn hàng được chấp nhận:\n\n- Còn nguyên tag sản phẩm.\n\n- Sản phẩm phải được đóng gói lại cẩn thận và chắc chắn.\n\n3. Đơn hàng không chấp nhận:\n\n- Hàng không còn tag chính hãng.\n\n- Hàng đã qua sử dụng, giặt/tẩy.\n\n- Hàng trả lại shop không đúng mẫu của BAMA, sản phẩm nhái\n\n- Không thích , không hợp, đặt nhầm mã, nhầm màu\n\n\n\n🔁THÔNG TIN SHOW ROOM:\n\n-\tĐịa chỉ: 391/5 Trần Hưng Đạo, P. Cầu Kho, Quận 1, HCM\n\n-\tNgười đại diện: BAMA\n\n-\tSố điện thoại: 0705777760\n\n\n\nBAMA CẢM ƠN KHÁCH HÀNG ĐÃ TIN TƯỞNG VÀ MUA SẢN PHẨM CỦA SHOP!	100	459000	2024-04-10 13:48:08.065736+07	2024-04-10 13:48:08.065736+07
64	23	Balo nam nữ đi học đi làm BAMA New Basic Backpack NB104 chống nước nhiều ngăn, cặp sách đi học đựng laptop 14 inch	Không chỉ là một chiếc balo, NB104 đến từ nhà BAMA chính là một món phụ kiện tô điểm cho outfit của bạn trở nên thật hoàn hảo. Thiết kế tinh giản nhưng không gian giữa các ngăn cực kỳ thông minh, đựng đồ cá nhân gọn gàng. Ấn tượng hơn với quai đeo và lưng lót đệm êm, thoát mồ hôi không gây nóng lưng cho người đeo.	100	351000	2024-04-10 14:00:29.73991+07	2024-04-10 14:00:29.73991+07
65	24	Balo nữ thời trang Glado tặng kèm ví mini màu bò nhạt - GB007	THÔNG TIN SẢN PHẨM: \nBalo nữ thời trang Glado tặng kèm ví mini màu bò nhạt - GB007\n\n1. KÍCH THƯỚC: 18 x 22 x 8 (cm): Kích thước sản phẩm rộng rãi, được chia làm nhiều ngăn tiện lợi. Có các ngăn lớn để đựng các vật dụng cần thiết và nhiều ngăn nhỏ để đựng giấy tờ, tiền, ví… tiện dùng khi đi học, làm việc hay các hoạt động dã ngoại,...\n\n2. CHẤT LIỆU DA TỔNG HỢP CAO CẤP: Chất liệu da cao cấp, với 6 màu cơ bản, giúp bạn có nhiều sự lựa chọn (Hồng, Kem, Bò đậm, Bò nhạt, Xanh, Đen). Đặc biệt loại da hạn chế nếp nhăn khi bạn sử dụng và không bong tróc.\n\n3. ĐƯỜNG MAY TỈ MỈ, CHẮC CHẮN:  Sản phẩm được chế tác bằng những đường may tỉ mỉ và chắc chắn, không chỉ mang đến độ bền mà còn mang đến tính thẩm mỹ, tinh tế cao. Phần dây đeo có thể điều chỉnh độ ngắn dài, được may bằng kỹ thuật gấp mép dây viền, thiết kế ôm rất sát hai vai, vững chắc.\n\nHướng dẫn sử dụng: \nĐể sản phẩm được lâu bền, khách hàng cần chú ý một số điều:\n- Không đựng vật quá nặng\n- Ba lô được thiết kế riêng cho việc đựng các vật dụng vừa và nhỏ. Vì vậy việc sử dụng ba lô chứa các vật nặng hay nhồi nhét quá chật sẽ dẫn đến tình trạng balo bị bung chỉ, rách, tét balo. Trong trường hợp đựng vật quá cỡ sẽ gây ra tét đường dây kéo\n- Giặt định kỳ và phơi khô\n- Ba lô sử dụng một thời gian sẽ kẹt, ngoài việc ba lô bị dơ thì đường dây kéo không còn mượt nữa do kết bụi bẩn. Từ đó dẫn đến dây kéo sẽ dễ bị hư. Bạn nên giặt balo theo định kỳ để đảm bảo balo sạch sẽ và phơi khô trước khi sử dụng để tránh nấm mốc.\nTHÔNG TIN:\nChịu trách nhiệm sản phẩm: Cty TNHH Thời Trang TVTCorp\nĐịa chỉ: 464/21/17 Nguyễn Văn Quá, Đông Hưng Thuận, Q12, Tp Hồ Chí Minh\nXuất xứ: Việt Nam\nNăm sản xuất: 2021	100	370000	2024-04-10 14:06:11.127154+07	2024-04-10 14:06:11.127154+07
66	24	Balo nữ năng động trẻ trung phong cách Hàn Quốc thời trang Glado màu đen - GB005	THÔNG TIN SẢN PHẨM: \n\nBalo nữ năng động trẻ trung phong cách Hàn Quốc thời trang Glado màu đen - GB005\n\n\n\n1. KÍCH THƯỚC: 21 x 25 x 8 (cm)\n\nKích thước sản phẩm rộng rãi, được chia làm nhiều ngăn tiện lợi. Có các ngăn lớn để đựng các vật dụng cần thiết và nhiều ngăn nhỏ để đựng giấy tờ, tiền, ví… tiện dùng khi đi học, làm việc hay các hoạt động dã ngoại,......\n\n\n\n2. CHẤT LIỆU DA TỔNG HỢP CAO CẤP: Chất liệu da cao cấp, với 4 màu cơ bản, giúp bạn có nhiều sự lựa chọn (Xám, Hồng, Nude, Đen). Đặc biệt loại da hạn chế nếp nhăn khi bạn sử dụng và không bong tróc.\n\n\n\n3. ĐƯỜNG MAY TỈ MỈ, CHẮC CHẮN:  Sản phẩm được chế tác bằng những đường may tỉ mỉ và chắc chắn, không chỉ mang đến độ bền mà còn mang đến tính thẩm mỹ, tinh tế cao. Phần dây đeo có thể điều chỉnh độ ngắn dài, được may bằng kỹ thuật gấp mép dây viền, thiết kế ôm rất sát hai vai, vững chắc.\n\n\n\nHướng dẫn sử dụng: \n\nĐể sản phẩm được lâu bền, khách hàng cần chú ý một số điều:\n\n- Không đựng vật quá nặng\n\n- Ba lô được thiết kế riêng cho việc đựng các vật dụng vừa và nhỏ. Vì vậy việc sử dụng ba lô chứa các vật nặng hay nhồi nhét quá chật sẽ dẫn đến tình trạng balo bị bung chỉ, rách, tét balo. Trong trường hợp đựng vật quá cỡ sẽ gây ra tét đường dây kéo\n\n- Giặt định kỳ và phơi khô\n\n- Ba lô sử dụng một thời gian sẽ kẹt, ngoài việc ba lô bị dơ thì đường dây kéo không còn mượt nữa do kết bụi bẩn. Từ đó dẫn đến dây kéo sẽ dễ bị hư. Bạn nên giặt balo theo định kỳ để đảm bảo balo sạch sẽ và phơi khô trước khi sử dụng để tránh nấm mốc.\n\n- Chất liệu của sản phẩm không chống thấm tuyệt đối nên bạn cần chú ý bảo vệ balo của mình khi đi trong thời tiết mưa gió.\n\nTHÔNG TIN:\n\nChịu trách nhiệm sản phẩm: Cty TNHH Thời Trang TVTCorp\n\nĐịa chỉ: 464/21/17 Nguyễn Văn Quá, Đông Hưng Thuận, Q12, Tp Hồ Chí Minh\n\nXuất xứ: Việt Nam\n\nNăm sản xuất: 2021	100	350000	2024-04-10 14:08:31.201063+07	2024-04-10 14:08:31.201063+07
67	24	Túi xách nữ phong cách Hàn Quốc trẻ trung thời trang Glado màu xám - TG007	THÔNG TIN SẢN PHẨM: \n\nTúi xách nữ phong cách Hàn Quốc trẻ trung thời trang Glado màu xám - TG007\n\n1. Kích thước: \nKích thước sản phẩm rộng rãi, được chia làm nhiều ngăn tiện lợi. Có các ngăn lớn để đựng các vật dụng cần thiết và nhiều ngăn nhỏ để đựng giấy tờ, tiền, ví… tiện dùng khi đi học, làm việc hay các hoạt động dã ngoại,...\n\n2. CHẤT LIỆU DA TỔNG DỢP CAO CẤP: Chất liệu da cao cấp, với 4 màu cơ bản, giúp bạn có nhiều sự lựa chọn (Hồng, Kem, Đen, Xám). Đặc biệt loại da hạn chế nếp nhăn khi bạn sử dụng và không bong tróc.\n\n3. ĐƯỜNG MAY TỈ MỈ, CHẮC CHẮN:  Sản phẩm được chế tác bằng những đường may tỉ mỉ và chắc chắn, không chỉ mang đến độ bền mà còn mang đến tính thẩm mỹ, tinh tế cao. Phần dây đeo có thể điều chỉnh độ ngắn dài, được may bằng kỹ thuật gấp mép dây viền, thiết kế ôm rất sát hai vai, vững chắc.\n\nHướng dẫn sử dụng: \nĐể sản phẩm được lâu bền, khách hàng cần chú ý một số điều:\n- Không đựng vật quá nặng\n- Túi xách được thiết kế riêng cho việc đựng các vật dụng vừa và nhỏ. Vì vậy việc sử dụng túi chứa các vật nặng hay nhồi nhét quá chật sẽ dẫn đến tình trạng túi bị bung chỉ, rách, tét. Trong trường hợp đựng vật quá cỡ sẽ gây ra tét đường dây kéo\n- Giặt định kỳ và phơi khô\n- Túi xách sử dụng một thời gian sẽ kẹt, ngoài việc bị dơ thì đường dây kéo không còn mượt nữa do kết bụi bẩn. Từ đó dẫn đến dây kéo sẽ dễ bị hư. Bạn nên giặt túi theo định kỳ để đảm bảo balo sạch sẽ và phơi khô trước khi sử dụng để tránh nấm mốc.\n- Chất liệu của sản phẩm không chống thấm tuyệt đối nên bạn cần chú ý bảo vệ túi của mình khi đi trong thời tiết mưa gió.\nTHÔNG TIN:\nChịu trách nhiệm sản phẩm: Cty TNHH Thời Trang TVTCorp\nĐịa chỉ: 464/21/17 Nguyễn Văn Quá, Đông Hưng Thuận, Q12, Tp Hồ Chí Minh\nXuất xứ: Việt Nam\nNăm sản xuất: 2021	100	220000	2024-04-10 14:11:28.624187+07	2024-04-10 14:11:28.624187+07
68	24	Túi xách nữ phong cách Hàn Quốc sành điệu thời trang Glado màu đen - TG006	THÔNG TIN SẢN PHẨM: \n\nTúi xách nữ phong cách Hàn Quốc sành điệu thời trang Glado màu đen - TG006\n\n1. Kích thước: \nKích thước sản phẩm rộng rãi, được chia làm nhiều ngăn tiện lợi. Có các ngăn lớn để đựng các vật dụng cần thiết và nhiều ngăn nhỏ để đựng giấy tờ, tiền, ví… tiện dùng khi đi học, làm việc hay các hoạt động dã ngoại,...\n\n2. CHẤT LIỆU DA TỔNG DỢP CAO CẤP: Chất liệu da cao cấp, với 4 màu cơ bản, giúp bạn có nhiều sự lựa chọn (Hồng, Nude, Đen, Xám). Đặc biệt loại da hạn chế nếp nhăn khi bạn sử dụng và không bong tróc.\n\n3. ĐƯỜNG MAY TỈ MỈ, CHẮC CHẮN:  Sản phẩm được chế tác bằng những đường may tỉ mỉ và chắc chắn, không chỉ mang đến độ bền mà còn mang đến tính thẩm mỹ, tinh tế cao. Phần dây đeo có thể điều chỉnh độ ngắn dài, được may bằng kỹ thuật gấp mép dây viền, thiết kế ôm rất sát hai vai, vững chắc.\n\nHướng dẫn sử dụng: \nĐể sản phẩm được lâu bền, khách hàng cần chú ý một số điều:\n- Không đựng vật quá nặng\n- Túi xách được thiết kế riêng cho việc đựng các vật dụng vừa và nhỏ. Vì vậy việc sử dụng túi chứa các vật nặng hay nhồi nhét quá chật sẽ dẫn đến tình trạng túi bị bung chỉ, rách, tét. Trong trường hợp đựng vật quá cỡ sẽ gây ra tét đường dây kéo\n- Giặt định kỳ và phơi khô\n- Túi xách sử dụng một thời gian sẽ kẹt, ngoài việc bị dơ thì đường dây kéo không còn mượt nữa do kết bụi bẩn. Từ đó dẫn đến dây kéo sẽ dễ bị hư. Bạn nên giặt túi theo định kỳ để đảm bảo balo sạch sẽ và phơi khô trước khi sử dụng để tránh nấm mốc.\n- Chất liệu của sản phẩm không chống thấm tuyệt đối nên bạn cần chú ý bảo vệ túi của mình khi đi trong thời tiết mưa gió.\nTHÔNG TIN:\nChịu trách nhiệm sản phẩm: Cty TNHH Thời Trang TVTCorp\nĐịa chỉ: 464/21/17 Nguyễn Văn Quá, Đông Hưng Thuận, Q12, Tp Hồ Chí Minh\nXuất xứ: Việt Nam\nNăm sản xuất: 2021	100	220000	2024-04-10 14:13:20.164107+07	2024-04-10 14:13:20.164107+07
77	27	Giày sneaker thể thao nam nữ X-Game Shoes-Ivory Anta 812328012 822328012	Giày sneaker thể thao nam nữ X-Game Shoes-Ivory Anta 812328012 822328012\n\n- Đế chống trơn trượt, kết hợp cùng kiểu dáng thể thao và màu sắc nổi bật, chắc chắn sẽ là phụ kiện được nhiều bạn lựa chọn để thể hiện phong cách thể thao khỏe khoắn, năng động.\n\n- Bên cạnh đó, chất liệu nhẹ, êm ái giúp bạn luôn cảm thấy thoải mái trong suốt quá trình vận động.\n\n- Xuất xứ: Trung Quốc	100	1190000	2024-04-10 14:57:37.694315+07	2024-04-10 14:57:37.694315+07
69	25	Balo nữ cao cấp Grace Bag VACHINO-BG006	- Chất liệu: Da tổng hợp cao cấp nhập khẩu ( Chất da dày dặn,mềm mại, không bong tróc, không thấm nước ) \n\n- Kích thước: ngang 21 cm x rộng 10cm x cao 27cm.\n\n- Số ngăn : có 3 ngăn ( 1 ngăn chính và 2 ngăn phụ,ngăn phụ bên trong có khóa kéo)\n\n- Đựng vừa tối đa: sổ tay, điện thoại, ví tiền, son phấn, đồ dùng cá nhân....\n\n\n\n- Balo nữ BG006 là mẫu balo đầu tiên được VACHINO  thiết kế và sản xuất dành riêng cho phái nữ ,với thiết kế hiện đại, trẻ trung, mới mẻ, tiện lợi và phù hợp với mọi nhu cầu sử dụng như: đi làm, đi chơi, công sở, du lịch,đi dạy ...Mang lại vẻ bề ngoài cho phái nữ thêm phần nổi bật,sành điệu,sang trọng, đẳng cấp và quý phái hơn.\n\n\n\n***** VACHINO CAM KẾT VÀ BẢO HÀNH *****\n\n- 100% hình ảnh,video do đội ngũ tự setup và sản xuất thực tế . \n\n- Sản phẩm chính hãng được gắn tem mác đầy đủ,khóa kéo có logo thương hiệu VACHINO.\n\n- Hỗ trợ đổi trả theo quy định của Shopee nếu sản phẩm bị lỗi kỹ thuật, hoặc gửi sai mẫu, sai màu .\n\n- Bảo hành 12 tháng lỗi NSX như dây khóa kéo,các đường chỉ may.\n\n\n\n***** SỨ MẠNH CỦA VACHINO *****\n\nHiện tại  VACHINO đã và đang tạo ra thêm nhiều BST sản phẩm mới để phục vụ nhu cầu mua sắm của các bạn. Và để làm được điều đó, chắc chắn không thể thiếu sự ủng hộ của tất cả các bạn - một trong những điều cần thiết cho sự thành công của thương hiệu VACHINO. Cảm ơn các bạn vì luôn đồng hành cùng VACHINO - hãy cùng nhau góp ý, bổ sung để VACHINO ngày một càng được hoàn thiện,tỏa sáng cùng các bạn hơn nữa nhé !\n\n==> Các bạn nhớ ấn Follow shop để nhận thông báo khi shop có tặng voucher và sản phẩm mới nhé.	100	219000	2024-04-10 14:16:17.692577+07	2024-04-10 14:16:17.692577+07
70	25	Balo nữ cao cấp Dolie Bag VACHINO-BG020	- Chất liệu: Da tổng hợp cao cấp nhập khẩu ( Chất da dày dặn,mềm mại, không bong tróc, không thấm nước )\n\n- Kích thước: ngang 23cm x rộng 12cm x cao 24cm.\n\n- Số ngăn : có 5 ngăn ( 1 ngăn chính và 4 ngăn phụ,ngăn phụ bên trong có khóa kéo)\n\n- Đựng vừa tối đa: sổ tay, điện thoại, ví tiền, son phấn, đồ dùng cá nhân....\n\n- Balo nữ BG020 là mẫu balo đầu tiên được VACHINO thiết kế và sản xuất dành riêng cho phái nữ ,với thiết kế hiện đại, trẻ trung, mới mẻ, tiện lợi và phù hợp với mọi nhu cầu sử dụng như: đi làm, đi chơi, công sở, du lịch,đi dạy ...Mang lại vẻ bề ngoài cho phái nữ thêm phần nổi bật,sành điệu,sang trọng, đẳng cấp và quý phái hơn.\n\n***** VACHINO CAM KẾT VÀ BẢO HÀNH *****\n\n- 100% hình ảnh,video do đội ngũ tự setup và sản xuất thực tế .\n\n- Sản phẩm chính hãng được gắn tem mác đầy đủ,khóa kéo có logo thương hiệu VACHINO.	100	199000	2024-04-10 14:18:24.57237+07	2024-04-10 14:18:24.57237+07
71	25	Túi xách nữ thời trang Cheslia cao cấp VACHINO-TX037	Chất liệu: Da tổng hợp cao cấp nhập khẩu ( mềm mại, chất da dày dặn, không bong tróc, không thấm nước )\n\n- Kích thước: Dài 26cm x Rộng 6 x Cao 19cm\n\n- Số ngăn : có 3 ngăn ( 1 ngăn chính có khóa kéo và 2 ngăn phụ tiện lợi ,ngăn phụ bên trong có khóa kéo)\n\n- Đựng vừa tối đa: Sổ tay, điện thoại, ví tiền, son phấn,đồ dùng cá nhân.\n\n-Túi xách công sở nữ TX037 là mẫu túi đầu tiên được VACHINO thiết kế và sản xuất dành riêng cho phái nữ ,với thiết kế hiện đại, trẻ trung, sang trọng, tối giản, phù hợp với mọi nhu cầu sử dụng như: công sở hay đi chơi, đi học, đi làm...Mang lại vẻ bề ngoài cho phái nữ thêm phần nổi bật,sành điệu,sang trọng,quý phái hơn\n\n***** VACHINO CAM KẾT VÀ BẢO HÀNH *****\n\n- 100% hình ảnh, video do đội ngũ tự setup và sản xuất thực tế .\n\n- Sản phẩm chính hãng được gắn tem mác đầy đủ, khóa kéo có logo thương hiệu VACHINO.\n\n- Hỗ trợ đổi trả theo quy định của Shopee nếu sản phẩm bị lỗi kỹ thuật, hoặc gửi sai mẫu, sai màu .\n\n- Bảo hành 12 tháng lỗi NSX như dây khóa kéo,các đường chỉ may.\n\n***** SỨ MẠNH CỦA VACHINO *****\n\nHiện tại  VACHINO đã và đang tạo ra thêm nhiều BST sản phẩm mới để phục vụ nhu cầu mua sắm của các bạn. Và để làm được điều đó, chắc chắn không thể thiếu sự ủng hộ của tất cả các bạn - một trong những điều cần thiết cho sự thành công của thương hiệu VACHINO. Cảm ơn các bạn vì luôn đồng hành cùng VACHINO - hãy cùng nhau góp ý, bổ sung để VACHINO ngày một càng được hoàn thiện,tỏa sáng cùng các bạn hơn nữa nhé.	100	169000	2024-04-10 14:20:20.634238+07	2024-04-10 14:20:20.634238+07
78	27	Giày đế bằng thể thao nam nữ X-Game Shoes Anta 112228065S 122228065S	Giày đế bằng thể thao nam nữ X-Game Shoes Anta 112228065S 122228065S\n\n- Đế chống trơn trượt, kết hợp cùng kiểu dáng thể thao và màu sắc nổi bật, chắc chắn sẽ là phụ kiện được nhiều bạn lựa chọn để thể hiện phong cách thể thao khỏe khoắn, năng động.\n\n- Bên cạnh đó, chất liệu nhẹ, êm ái giúp bạn luôn cảm thấy thoải mái trong suốt quá trình vận động.\n\n- Chất liệu: 100% da tổng hợp\n\n- Xuất xứ: Trung Quốc 	100	600000	2024-04-10 15:00:17.763334+07	2024-04-10 15:00:17.763334+07
72	25	Balo nữ thời trang Carina cao cấp thương hiệu VACHINO-BG022	- Chất liệu: Da tổng hợp cao cấp nhập khẩu ( Chất da dày dặn,mềm mại, không bong tróc, không thấm nước )\n\n- Kích thước: ngang 27cm x rộng 12cm x cao 33cm\n\n- Số ngăn : có 4 ngăn ( 10ngăn chính và 3 ngăn phụ)\n\n- Đựng vừa tối đa: sổ tay, điện thoại, ví tiền, son phấn, đồ dùng cá nhân,....\n\n- Balo nữ BG022 là mẫu balo đầu tiên được VACHINO thiết kế và sản xuất dành riêng cho phái nữ ,với thiết kế hiện đại, trẻ trung, mới mẻ, tiện lợi và phù hợp với mọi nhu cầu sử dụng như: đi làm, đi chơi, công sở, du lịch, đi dạy ...Mang lại vẻ bề ngoài cho phái nữ thêm phần nổi bật,sành điệu,sang trọng, đẳng cấp và quý phái hơn.\n\n***** VACHINO CAM KẾT VÀ BẢO HÀNH *****\n\n- 100% hình ảnh,video do đội ngũ tự setup và sản xuất thực tế .\n\n- Sản phẩm chính hãng được gắn tem mác đầy đủ,khóa kéo có logo thương hiệu VACHINO\n\n- Hỗ trợ đổi trả theo quy định của Shopee nếu sản phẩm bị lỗi kỹ thuật, hoặc gửi sai mẫu, sai màu .\n\n- Bảo hành 12 tháng lỗi NSX như dây khóa kéo,các đường chỉ may.\n\n\n\n***** SỨ MẠNH CỦA VACHINO *****\n\nHiện tại  VACHINO đã và đang tạo ra thêm nhiều BST sản phẩm mới để phục vụ nhu cầu mua sắm của các bạn. Và để làm được điều đó, chắc chắn không thể thiếu sự ủng hộ của tất cả các bạn - một trong những điều cần thiết cho sự thành công của thương hiệu VACHINO. Cảm ơn các bạn vì luôn đồng hành cùng VACHINO - hãy cùng nhau góp ý, bổ sung để VACHINO ngày một càng được hoàn thiện,tỏa sáng cùng các bạn hơn nữa nhé !	100	295000	2024-04-10 14:22:58.46263+07	2024-04-10 14:22:58.46263+07
73	26	Túi Xách Nữ Quai Xách Đeo Chéo La Muse Phủ Màu Tag Vuông Sz 21 HAPAS - TXT221226	HAPAS  Túi Xách – Giày Dép – Phụ Kiện Thời Trang\n\n\n\nMột trong những sản phẩm bán siêu chạy trên toàn hệ thống cửa hàng của Hapas. Bên cạnh đó, gam màu Basic được kết hợp hài hòa với kiểu dáng thu hút, tạo nên một siêu phẩm gây ấn tượng trong thời gian gần đây. \n\n\n\n THÔNG TIN SẢN PHẨM: Túi xách đeo chéo\n\nTúi xách nữ cầm tay cao cấp thời trang siêu hot \n\n- Kích thước: 21 x 8 x 13 cm\n\n- Chất liệu : Da PU\n\n- Trẻ trung, cá tính\n\n- Phù hợp với mọi lứa tuổi\n\n- Màu sắc basic dễ phối đồ\n\n- Phù hợp với đi chơi, đi du lịch                 \t\n\n- Bảo Hành : 6 tháng ( Về da )\n\n \n\nHƯỚNG DẪN SỬ DỤNG\n\n- Không giặt tẩy bằng các chất tẩy rửa mạnh, có thể dùng ( vỏ chuối, sữa tươi , giấm... )\n\n- Không ngâm nước quá lâu\n\n- Với các sàn phẩm sáng màu, nên vệ sinh thường xuyên\n\n- Tránh cất giữ giày khi còn ướt, ẩm..\n\n \n\nBẢO HÀNH VÀ CHĂM SÓC KHÁCH HÀNG\n\n-  Nếu sản phẩm sai mẫu mã, bị lỗi..., quý khách sẽ được miễn phí hoàn toàn cước đổi trả sản phẩm khác.\n\n- Bảo hành 6 tháng về da\n\n-  1 sản phẩm, chỉ được đổi trả 1 lần \n\n ------------------------------\n\nCÔNG TY THƯƠNG MẠI VÀ CHỊU TRÁCH NHIỆM:\n\nCÔNG TY TNHH KINH DOANH THƯƠNG MẠI HTC VIỆT NAM\n\nSố 23 Tô Vĩnh Diện, Khương Trung, Thanh Xuân, HN\n\nSĐT: 18009245 - Phím 2\n\n\n\nCảm ơn quý khách đã ghé thăm và ủng hộ HAPAS.	100	883000	2024-04-10 14:24:42.373549+07	2024-04-10 14:24:42.373549+07
74	26	Túi Xách Nữ Đeo Vai Khoá C C'Chic Of Denim In You HAPAS - TDV23056	HAPAS  Túi Xách – Giày Dép – Phụ Kiện Thời Trang\n\n\n\n\n\n\n\nDiện túi gì đi chơi để đơn giản mà trẻ trung, sành điệu?\n\n\n\n\n\n\n\nĐó là câu hỏi của rất nhiều nàng. Thấu hiểu nhu cầu của các nàng, Hapas đem đến mẫu túi "nhìn phát mê luôn" với chất da mềm mịn và form dáng nhỏ xinh.  Dưới đây là các thông tin mô tả về mẫu túi đeo chéo nữ .....\n\n\n\n\n\n\n\n THÔNG TIN SẢN PHẨM: Túi xách đeo chéo\n\n\n\n\n\n\n\nTúi xách nữ cầm tay cao cấp thời trang siêu hot \n\n\n\n\n\n\n\n- Kích thước: 25 x 9 x 13 cm\n\n\n\n- Trẻ trung, cá tính\n\n\n\n- Phù hợp với mọi lứa tuổi\n\n\n\n- Màu sắc basic dễ phối đồ\n\n\n\n- Phù hợp với đi chơi, đi du lịch                 \t\n\n\n\n- Bảo Hành : 6 tháng ( Về da )\n\n\n\n\n\n\n\n HƯỚNG DẪN SỬ DỤNG\n\n\n\n- Không giặt tẩy bằng các chất tẩy rửa mạnh, có thể dùng ( vỏ chuối, sữa tươi , giấm... )\n\n\n\n- Không ngâm nước quá lâu\n\n\n\n- Với các sàn phẩm sáng màu, nên vệ sinh thường xuyên\n\n\n\n- Tránh cất giữ giày khi còn ướt, ẩm..\n\n\n\n\n\n\n\n BẢO HÀNH VÀ CHĂM SÓC KHÁCH HÀNG\n\n\n\n-  Nếu sản phẩm sai mẫu mã, bị lỗi..., quý khách sẽ được miễn phí hoàn toàn cước đổi trả sản phẩm khác.\n\n\n\n-  Quý khách được đổi với sản phẩm mới ngang hoặc cao giá hơn\n\n\n\n-  1 sản phẩm, chỉ được đổi trả 1 lần duy nhất.\n\n\n\n\n\n\n\nCảm ơn quý khách đã ghé thăm và ủng hộ HAPAS.\n\n\n\nVui lòng ấn "Theo dõi" để cập nhật những sản phẩm chính hãng, mới nhất nhé!	100	873000	2024-04-10 14:26:32.477908+07	2024-04-10 14:26:32.477908+07
75	26	Túi Xách Nữ Cầm Tay La Muse Black HAPAS - TXT221226	HAPAS  Túi Xách – Giày Dép – Phụ Kiện Thời Trang\n\n\n\nMột trong những sản phẩm bán siêu chạy trên toàn hệ thống cửa hàng của Hapas. Bên cạnh đó, gam màu Basic được kết hợp hài hòa với kiểu dáng thu hút, tạo nên một siêu phẩm gây ấn tượng trong thời gian gần đây. \n\n\n\n THÔNG TIN SẢN PHẨM: Túi xách đeo chéo\n\nTúi xách nữ cầm tay cao cấp thời trang siêu hot \n\n- Kích thước: 21 x 8 x 13 cm\n\n- Chất liệu : Da PU\n\n- Trẻ trung, cá tính\n\n- Phù hợp với mọi lứa tuổi\n\n- Màu sắc basic dễ phối đồ\n\n- Phù hợp với đi chơi, đi du lịch                 \t\n\n- Bảo Hành : 6 tháng ( Về da )\n\n \n\nHƯỚNG DẪN SỬ DỤNG\n\n- Không giặt tẩy bằng các chất tẩy rửa mạnh, có thể dùng ( vỏ chuối, sữa tươi , giấm... )\n\n- Không ngâm nước quá lâu\n\n- Với các sàn phẩm sáng màu, nên vệ sinh thường xuyên\n\n- Tránh cất giữ giày khi còn ướt, ẩm..\n\n \n\nBẢO HÀNH VÀ CHĂM SÓC KHÁCH HÀNG\n\n-  Nếu sản phẩm sai mẫu mã, bị lỗi..., quý khách sẽ được miễn phí hoàn toàn cước đổi trả sản phẩm khác.\n\n- Bảo hành 6 tháng về da\n\n-  1 sản phẩm, chỉ được đổi trả 1 lần \n\n ------------------------------\n\nCÔNG TY THƯƠNG MẠI VÀ CHỊU TRÁCH NHIỆM:\n\nCÔNG TY TNHH KINH DOANH THƯƠNG MẠI HTC VIỆT NAM\n\nSố 23 Tô Vĩnh Diện, Khương Trung, Thanh Xuân, HN\n\nSĐT: 18009245 - Phím 2\n\n\n\nCảm ơn quý khách đã ghé thăm và ủng hộ HAPAS.	100	883000	2024-04-10 14:35:14.504356+07	2024-04-10 14:35:14.504356+07
76	27	Giày thể thao nam nữ Lifestyle Anta 812328063 822328063	Giày thể thao nam Lifestyle Anta 812328063\n\nĐế chống trơn trượt, kết hợp cùng kiểu dáng thể thao và màu sắc nổi bật, chắc chắn sẽ là phụ kiện được nhiều bạn lựa chọn để thể hiện phong cách thể thao khỏe khoắn, năng động.\n\n- Bên cạnh đó, chất liệu nhẹ, êm ái giúp bạn luôn cảm thấy thoải mái trong suốt quá trình vận động.\n\n- Chất liệu: SYNTHE PU/Mesh 	100	700000	2024-04-10 14:50:46.961207+07	2024-04-10 14:50:46.961207+07
79	27	Giày thể thao nữ dòng tập Training Shoes Super Flexi Anta 822237701-4	Giày tập thể thao nữ Super Flexi Anta 822237701-4\n\n- Công nghệ đế giày Super Flexi 360 cải tiến từ công nghệ Super Flexi 2020\n\n - Đường cắt uốn lượn và song song, khắc sâu trên bề mặt đế ngoài . Hỗ trợ chuyển động linh hoạt và giảm mức tiêu thụ năng lượng. \n\n- Cấu tạo đế dày và phẳng: Phần gót và giữa bàn chân có độ dày tương đương, phần bàn chân trước mỏng hơn và vát nhẹ. Phù hợp với bước chân khi tiến về phía trước, hỗ trợ vận động và tiêu thụ năng lượng. \n\n- Bề mặt vải lưới thoáng khí, thiết kể mỏng gọn, ôm sát bàn chân, lên form dáng trẻ trung năng động. \n\n- Chất liệu: 100% vải lưới \n\n- Xuất xứ: Trung Quốc\n\nAnta được thành lập bởi Ding Shi Zhong vào năm 1994, hoạt động chủ yếu là thiết kế, phát triển, sáng tạo và tiêu thụ các loại sản phẩm thể dục thể thao. Thương Anta bao gồm giày dép thể thao, quần áo thể thao và phụ kiện. Với slogan "Keep Moving...." thể hiện sự vận động, phấn đấu không ngừng và phát triển đi lên, Anta được vinh danh là “Thương nổi tiếng Trung Quốc”, “Nhãn nổi bật Trung Quốc”, và là “Sản phẩm miễn kiểm tra chất lượng”. Anta chiếm vị trí “Thương thời trang thể thao bậc nhất trong bảng giá trị thương" (do tạp chí Forbes công bố), xếp thứ 5 trong bảng xếp hạng các thương thể thao thế giới.	100	1100000	2024-04-10 15:02:18.110599+07	2024-04-10 15:02:18.110599+07
80	28	Bóng rổ da pu size 7 PEAK Q1231990 - Quả bóng rổ da outdoor, banh bóng rổ tặng kèm bộ phụ kiện	 Thông tin sản phẩm:\n\nThương hiệu: PEAK\n\nSân chơi banh bóng rổ: Indoor/Outdoor\n\nSize quả bóng rổ da: 7\n\nChất liệu: banh bóng rổ da PU cao cấp, được làm bằng chất liệu cao cấp chịu lực\n\n\n\nLưu ý khi sử dụng:\n\n- Không bơm quá căng, nên test hơi bóng theo hướng dẫn trên ảnh mô tả.\n\n- Không sử dụng bóng trên bề mặt sân ướt hoặc ngoài trời nắng, có thể dẫn đến nứt bề mặt bóng.\n\n- Không ngồi hoặc đặt các vật nặng lên trên bóng, có thể dẫn đến méo bóng\n\n- Tránh đập vào các vật hoặc góc nhọn, có thể dẫn đến bóng bị lồi.\n\nTrong quá trình nhận hàng và sử dụng quả bóng rổ da, nếu bạn gặp phải bất cứ vấn đề gì, xin hãy liên hệ với chúng tôi để được hỗ trợ sớm nhất.	100	249000	2024-04-10 15:06:25.435139+07	2024-04-10 15:06:25.435139+07
81	28	Bóng rổ da pu size 7 PEAK Q1224010 - Quả bóng rổ da outdoor, banh bóng rổ tặng kèm bộ phụ kiện	Bóng rổ da pu size 7 PEAK Q1224010 - Quả bóng rổ da outdoor, banh bóng rổ tặng kèm bộ phụ kiện\n\n Thông tin sản phẩm:\n\nThương hiệu: PEAK\n\nSân chơi banh bóng rổ: Indoor/Outdoor\n\nSize quả bóng rổ da: 7\n\nChất liệu: banh bóng rổ da PU cao cấp, được làm bằng chất liệu cao cấp chịu lực\n\nLưu ý khi sử dụng:\n\n- Không bơm quá căng, nên test hơi bóng theo hướng dẫn trên ảnh mô tả.\n\n- Không sử dụng bóng trên bề mặt sân ướt hoặc ngoài trời nắng, có thể dẫn đến nứt bề mặt bóng.\n\n- Không ngồi hoặc đặt các vật nặng lên trên bóng, có thể dẫn đến méo bóng\n\n- Tránh đập vào các vật hoặc góc nhọn, có thể dẫn đến bóng bị lồi.\n\nTrong quá trình nhận hàng và sử dụng quả bóng rổ da, nếu bạn gặp phải bất cứ vấn đề gì, xin hãy liên hệ với chúng tôi để được hỗ trợ sớm nhất.	100	400000	2024-04-10 15:09:01.69273+07	2024-04-10 15:09:01.69273+07
82	28	Quả Bóng Rổ PEAK Clutch Shot QW09014 - Size 7 Q102110	"- Bóng được làm bằng chất liệu da Pu cao cấp, có độ bền cao, có khả năng chịu lực tốt và rất dễ nắm bắt, cho phép người chơi điều khiển bóng tốt hơn với các cú truyền bóng, ném bóng hoặc các đường bóng khéo léo. \n\nSử dụng bóng để tập luyện và thi đấu sẽ đem lại cho người chơi sự hứng khởi mới\n\n- Đường kính bóng là 24.5 cm phù hợp với thanh niên và người lớn- Trên thân quả bóng rổ được thiết kế với các đường kẻ sâu giúp tăng độ bám khi chơi.\n\n- BÓNG RỔ PEAK được sản xuất theo tiêu chuẩn phù hợp với tất cả các giải đấu bóng rổ chuyên nghiệp chắc chắn sẽ làm bạn hài lòng ngay từ lần đầu tiên chạm bóng. "\n\n✨ PEAK Sport Việt Nam - Nhà phân phối độc quyền chính hãng PEAK tại Việt Nam \n\n✨- Thông tin bảo hành: Bảo Hành trong vòng 14 ngày nếu lỗi từ nhà sản xuất\n\n- Xuất xứ: Trung Quốc\n\nPEAK Sport là thương hiệu thời trang thể thao hàng đầu tại Trung Quốc, được thành lập từ năm 1989. \n\nHiện PEAK đã có mặt trại trên 100 quốc gia trên thế giới.Giày bóng rổ PEAK là nhà tài trợ của rất nhiều đội tuyển Olympic. \n\nĐặc biệt các cầu thủ bóng rổ chuyên nghiệp đang chơi tại NBA như Dwight Howard, Tony Parker... đang là đại diện thương hiệu của PEAK.\n\nPEAK có mặt tại Việt Nam và nhanh chóng trở thành sự lựa chọn số 1 về giày bóng rổ. \n\nPEAK Sport Việt Nam cũng là nhà tài trợ của 2 CLB Bóng rổ chuyên nghiệp: Hanoi Buffaloes và HCM City Wings\n\n.#PEAK #GIAYBONGRO #GIAYCHINHHANG #GIAYCAOCAP	100	441000	2024-04-10 15:12:24.937546+07	2024-04-10 15:12:24.937546+07
83	28	Giày chạy bộ Nữ PEAK Com4ever Running E223108H	Giày chạy bộ Nữ PEAK Com4ever Running  E223108H\n\nThương hiệu: PEAK\n\n Chức năng: chống trượt, chống mài mòn, thoáng khí, bao bọc, hỗ trợ\n\n Cỡ giày: 35 36 37 38 39 40 41 42 43 44 45\n\n Công nghệ giày thể thao: Com4ever\n\n Thiết kế: cổ thấp\n\n Đế ngoài: cao su chống mài mòn\n\nMột sản phẩm giày chạy bộ với công nghệ đệm đế Com4ever mới nhất\n\n– Thiết kế ba chiều với upper kết hợp giữa lưới jacquard cổ điển, thoáng khí siêu nhẹ và thoải mái. Đường vân kẻ sọc đầy tinh tế, đem lại cảm giác tốc độ cho một đôi giày chạy.\n\n– Đế giữa công nghệ Com4ever: giảm trọng lượng của giày, đem lại cảm giác mềm mại, nhẹ nhàng cho những người sử dụng trong thời gian dài. Đặc biệt hỗ trợ thúc đẩy quá trình phục hồi sau chấn thương hoặc khi luyện tập cường độ cao.\n\n– Đế ngoài chống trơn trượt, chống mài mòn\n\n	100	799000	2024-04-10 15:15:11.763965+07	2024-04-10 15:15:11.763965+07
84	29	Nón bơi trẻ em POPO CA43 cho bé từ 3 tuổi ngộ nghĩnh chất liệu silicon an toàn, cảm giác mềm mại khi đội	1. Điều kiện áp dụng (trong vòng 07 ngày kể từ khi nhận sản phẩm):\n\n- Hàng hoá vẫn còn mới, chưa qua sử dụng\n\n- Hàng hóa hư hỏng do vận chuyển hoặc do nhà sản xuất.\n\n2. Trường hợp được chấp nhận:\n\n- Hàng không đúng chủng loại, mẫu mã như quý khách đặt hàng\n\n- Không đủ số lượng, không đủ bộ như trong đơn hàng\n\n- Tình trạng bên ngoài bị ảnh hưởng như rách bao bì, bong tróc, bể vỡ…\n\n3. Trường hợp không đủ điều kiện áp dụng chính sách:\n\n- Quá 03 ngày kể từ khi Quý khách nhận hàng\n\n- Gửi lại hàng không đúng mẫu mã, không phải hàng của POPO\n\n- Đặt nhầm sản phẩm, chủng loại, không thích, không hợp,...	100	69000	2024-04-10 22:45:05.290253+07	2024-04-10 22:45:05.290253+07
85	29	Bộ đồ lặn nữ liền thân cộc tay dày 2mm POPO giữ nhiệt trong bộ sư tập cho thợ lặn	Bộ đồ lặn nữ liền thân cộc tay dày 2mm POPO quần áo lặn nữ giữ nhiệt trong bộ sư tập bộ đồ lặn biển cho thợ lặn\n\n\n\nBộ đồ lặn nữ liền thân với độ dày của vải là 2.0mm phù hợp cho lặn biển, lặn ngắm san hô cung cấp bởi POPO với chất liệu cao cấp. Sản phẩm phù hợp cho cả nam và nữ. Bộ quần áo lặn biển với công nghệ giữ nhiệt đảm bảo an toàn cho bạn khi lặn dưới biển sâu.\n\n\n\nBộ đồ lặn nữ với đặc điểm vượt trội của bộ đồ lặn biển của POPO Collection\n\n- Vải chuyên dùng dày 2.0mm\n\n- Giữ ấm cho cơ thể khi lặn sâu\n\n- Thoáng khí, mang lại cảm giác thoải mái khi lặn biển \n\n- Đường may chắc chắn, ôm sát cơ thể  \n\n-100% chất liệu cao cấp\n\n\n\nBộ đồ lặn nữ đảm bảo 100% chất lượng được kiểm soát chất lượng chặt chẽ theo tiêu chuẩn châu Âu với chứng nhận CE.\n\n- Với chứng nhậ chất lượng EU, sản phẩm đã đươc sử dụng bởi nhiều thợ lặn, người lặn chuyên nghiệp cũng như nghiệp dư.\n\n- Sản phẩm bộ đồ lặn biển được sử dụng kết hợp với các thiết bị lặn khác như: bình dưỡng khĩ, mũ trùm lặn biển, găng tay lặn biển, tất lặn biển, giầy lặn biển.\n\n- Xuất xứ: Việt Nam	100	699000	2024-04-10 22:49:29.150143+07	2024-04-10 22:49:29.150143+07
86	29	Nút bịt tai chống ồn khi ngủ, bộ 2 cái ba tầng lọc âm bảo vệ tai POPO chất liệu silicone êm ái dễ chịu	Nút bịt tai chống ồn khi ngủ, Bộ 2 cái ba tầng lọc âm bảo vệ tai POPO chất liệu silicone êm ái dễ chịu\n\n\n\nBộ 2 nút bịt tai chống ồn ba tầng lọc âm bảo vệ tai POPO chất liệu silicone êm ái dễ chịu khi sử dụng với độ bền cao\n\nNút tai silicon chống ồn ngủ ngủ bịt tai học sinh giảm tiếng ồn nút tai cách âm chống thấm nước đi bơi nút tai silicone\n\nNút tai chống ồn silicon an toàn có thể tái sử dụng với hộp lưu trữ Giảm tiếng ồn Giảm tiếng ồn Nút tai Bảo vệ thính giác\n\n\n\nTHÔNG TIN SẢN PHẨM\n\n- Tên sản phẩm: Bộ 2 nút bịt tai chống ồn ba tầng lọc âm bảo vệ tai\n\n- Chất liệu: Silicone\n\n- Màu sắc: Đỏ, Đen, Xám, Xanh Lá, Trắng\n\n- Cân nặng: <100gram\n\n\n\nTÍNH NĂNG SẢN PHẨM:\n\n- Giảm tiếng ồn: Với cấu trúc 3 lớp, NRR có thể lên đến 40dB, cao gấp đôi so với các loại nút bịt tai thông thường; Đó là sự lựa chọn tuyệt vời để học tập, ngủ, làm việc, hòa nhạc và bảo vệ thính giác chung trong môi trường ồn ào\n\n- Thiết kế thoải mái và có thể tái sử dụng: nút bịt tai giảm tiếng ồn được làm từ chất liệu silicone chất lượng mang lại sự thoải mái khi sử dụng trong thời gian dài, chúng phù hợp với mọi dáng người; Ngoài ra, chúng có thể được tái sử dụng, chỉ cần rửa sạch trong nước ấm và sau đó có thể áp dụng lại nhiều lần\n\n- Giảm tiếng ồn hiệu quả: nút bịt tai chống ồn có thể giảm tiếng ồn hiệu quả để bảo vệ thính giác của bạn trong mọi tình huống, thích hợp để ngủ, xây dựng, hòa nhạc, lái xe mô tô, gầm máy, vật nuôi, cắm trại nơi hoang dã, v.v.\n\n- Mang lại cảm giác thoải mái hơn: nút bịt tai bảo vệ thính giác bằng silicon phù hợp với mọi loại da, sẽ không gây khó chịu, đè ép, đau hay kích ứng da của bạn mà mang lại cho bạn cảm giác đeo thoải mái và trải nghiệm sử dụng tốt\n\n\n\nGIAN HÀNG THỂ THAO CHÍNH HÃNG POPO OFFICIAL CAM KẾT:\n\n- Tại POPO OFFICIAL chỉ bán hàng chính hãng, hàng có thương hiệu\n\n- Hoàn lại tiền nếu sản phẩm không giống mô tả, hình ảnh\n\n- Sản phẩm lỗi được đổi trả trong 7 ngày đầu\n\n- 100% sản phẩm đều có bảo hành chính hãng \n\n- Chính sách giá bán tại POPO theo giá niêm yết toàn hệ thống	100	39000	2024-04-10 22:52:06.304786+07	2024-04-10 22:52:06.304786+07
87	29	Mũ bơi người lớn POPO CA31 chất liệu silicone trơn cao cấp ngăn ướt tóc	Điểm nổi bật:\n\n- Bộ Kính bơi thời trang cao cấp của PopoCollection được làm từ kính cường lực nhựa Polucarbonate có độ trong cao và viền mặt nạ bằng silicone, cho phép bạn thở và quan sát xung quanh khi lặn xuống nước mà không phải chịu tác động của môi trường xung quanh. \n\n- Viền silicon là loại chống vào nước bằng chất liệu cao cấp , gắn liền với mắt kính bơi.\n\n- Kính bới tầm nhìn rộng thiết kế theo kiểu hai khoang nhìn, được làm từa nhựa PVC chịu lực tốt, miếng đệm silicon mềm mại ôm sát khuôn mặt và khoang mũi giúp bạn thở dễ hơn đồng thời không gây kích ứng cho da khi sử dụng trong thời gian dài.\n\n- Ngoài ra, dây đeo sau đầu có thể dễ dàng điều chỉnh cho phù hợp với kích thước đầu.\n\n\n\nThông tin sản phẩm:\n\n- Hãng sản xuất: PoPoCollection.\n\n- Kích cỡ: 170mmm x 40mm giúp có tầm nhìn rộng khi bơi.\n\n- Trọng lượng: 50g.\n\n- Chất liệu: nhựa PVC, silicon.\n\n- Đóng gói: Hộp nhưa cao cấp.\n\n-  Màu sắc: Mũ bơi có nhiều màu sắc khác nhau: Xanh nước biển, đen, hồng.\n\n-  Tính năng: bơi, lặn.       \n\n\n\nĐặc biệt với kiểu dáng thể thao năng động do các chuyên gia thiết kế. Sản phẩm mũ bơi của PoPo Sports là sự lựa chọn tuyệt vời và mang đến cho bạn một kiểu đồ bơi rất chuyên nghiệp. Mũ bơi ôm sát đầu, không thấm nước chắc chắn là kiểu dáng thể thao nhất hiện nay.	100	79000	2024-04-10 22:55:46.605609+07	2024-04-10 22:55:46.605609+07
88	30	[Nhập SSP150K4 giảm 150k đơn 1tr] Kính bơi unisex Speedo Aquapulse Pro - 8-12266D640	Kính bơi unisex Speedo Aquapulse Pro - 8-12266D640\n\nĐặc điểm nổi bật: KÍNH BƠI NGƯỜI LỚN SPEEDO AQUAPULSE PRO (ASIA FIT)\n\nAquapulse Pro là chiếc kính biểu tượng của Speedo dành cho vận động viên bơi lội chuyên nghiệp và thể dục ba môn phối hợp. Bắt nguồn từ sự thành công của Aquapulse Max 2 Mirror, phần kính mắt đã được nâng cấp tiêu chuẩn để đạt chất lượng cao hơn. Sử dụng công nghệ tầm nhìn IQfit™ giúp hạn chế tình trạng rò rì nước khi đeo cũng như hạn chế tạo vết hằn trên mặt. Chất liệu silicone cao cấp mềm mại ôm sát đầu nhưng không gây khó chịu, ống kính tầm nhìn rộng chống mờ, bảo vệ bạn 100% khỏi tia cực tím và hạn chế tác động của ánh nắng mặt trời, cung cấp tầm nhìn ngoại vi vượt trội giúp nhìn rõ dưới nước và thoải mái bơi lội\n\nTHÔNG SỐ\n\n\n\nChất liệu: LENS: PC, vỏ: TPE, viền: Silicone, dây đeo: Silicone\n\nMã sản phẩm: 8-12266D640	100	745000	2024-04-10 22:57:48.556974+07	2024-04-10 22:57:48.556974+07
89	30	[Nhập SSP150K4 giảm 150k đơn 1tr] Áo bra thể thao nữ Under Armour Rush Low - 1361027-001	Áo bra thể thao nữ Under Armour Rush Low - 1361027-001\n\nĐặc điểm nổi bật: ÁO NGỰC THỂ THAO NỮ UNDER ARMOUR RUSH™ LOWUA RUSH ™ là bộ sưu tập mà bạn nhất định phải khoác lên người khi đến những dịp thử thách quan trọng nhất — những buổi tập luyện khó khăn nhất, những trận đấu lớn nhất, buổi tập cường độ cao nhất của bạn. Tuyệt đối vừa vặn, giữ cho bạn khô ráo và khiến bạn cảm thấy thoải mái tối ưu để vượt qua những thử thách của bản thân.THÔNG SỐ\n\nĐược cung cấp bởi Celliant\n\n77% Polyester  23% Elastane\n\nPhù hợp với các hoạt động như đạp xe, tập tạ &amp; boxing\n\nKhi cơ thể bạn hoạt động và tạo ra năng lượng, chất liệu vải được thiết kế đặc biệt của UA RUSH ™ sẽ hấp thụ và phản xạ lại nguồn năng lượng vào cơ bắp, cải thiện độ bền và sức mạnh cho cơ thể\n\nCúp ngực mềm mại, khô nhanh, thoáng khí và hỗ trợ che phủ vượt trội\n\nCúp ngực có thể tháo rời với tag Phải &amp; Trái riêng biệt\n\nThiết kế đục lỗ tại những vùng cần tăng cường khả năng thoáng khí, hỗ trợ vận động thoải mái khi tập luyện cường độ cao\n\nThiết kế lưng sau với dây đai vải Freecut mượt mà có thể điều chỉnh linh hoạt\n\nGấu áo co giãn linh hoạt theo chuyển động cơ thể\n\nDây đai áo có thể điều chỉnh mang lại sự vừa vặn, an toàn\n\nCông nghệ kháng khuẩn ngăn chặn sự phát triển của vi khuẩn gây mùi\n\nMã sản phẩm: 1361027-001\n\n\n\n\n\nNơi sản xuất: Hàng sản xuất ở nước thứ 3 tùy từng lô hàng (Việt Nam, Trung Quốc, Ấn Độ, Campuchia...)\n\n\n\nHướng dẫn bảo quản:\n\n• Hạn chế không nên để sản phẩm tiếp xúc nhiều với chất bẩn, đặc biệt là các chất bẩn cứng đầu như máu, cà phê, nhựa trái cây…\n\n• Bảo quản sản phẩm ở nơi khô ráo, thoáng mát… để tránh các loại nấm mốc. (Nếu không sử dụng thường xuyên thì nên bỏ vào bao ni lông bịt kín hoặc hộp đựng.)\n\n• Nên sử dụng khuôn hoặc nhét giấy báo cũ vào bên trong để luôn giữ được hình dạng ban đầu (đối với sản phẩm giày dép)\n\n• Không nên phơi sản phẩm dưới nắng quá gắt. \n\n\n\nChính sách đổi trả: Áp dụng theo chính sách của sàn\n\n\n\nChính sách bảo hành: Không bảo hành\n\n\n\nXuất xứ thương hiệu: Mỹ\n\n\n\nThông Tin Thương Hiệu:\n\nUnder Amour là một công ty của Mỹ chuyên về các sản phẩm giày dép, quần áo, đồ dùng thể thao, đang phát triển cực kỳ mạnh mẽ tại thị trường Mỹ hiện nay. Được sáng lập năm 1996 bới cựu cầu thủ bóng đá trường đại học Maryland Kevin Plank, Under Armour® là nguyên mẫu khời nguồn của hàng loạt quần áo hàng hiệu – giúp cho người chơi thể thao luôn thoáng mát, khô và nhẹ mặc dù mang đến hết trận đấu.\n\nThông Tin Nhà Phân Phối:\n\nSupersports là hệ thống bán lẻ hàng đầu và chuyên phân phối các mặt hàng về thể thao tại Thái Lan và là hệ thống thuộc tập đoàn Central Retail. Supersports mang đến rất nhiều lựa chọn về giày dép và quần áo, máy tập thể dục và phụ kiện thể thao từ các thương hiệu nổi tiếng thế giới. Supersports tự hào mang đến sản phẩm chất lượng tốt và dịch vụ đặc biệt cho Việt Nam.	100	842000	2024-04-10 22:59:13.330021+07	2024-04-10 22:59:13.330021+07
90	30	[Nhập SSP150K4 giảm 150k đơn 1tr] Kính bơi unisex Speedo Jet V2 - 8-09297B988	Kính bơi unisex Speedo Jet V2 - 8-09297B988\n\nĐặc điểm nổi bật: KÍNH BƠI NGƯỜI LỚN SPEEDO JET V2 GOG AU GREENCLEAR \n\nPhụ kiện tuyệt vời cho các buổi bơi lội đầy năng lượng, chiếc kính bảo hộ có tính năng nổi bật ở phần phần sống mũi có thể điều chỉnh để khớp với dây đeo đầu trở nên vừa vặn, thoải mái hơn khi sử dụng.\n\nTHÔNG SỐ \n\n\n\nChất liệu: Polycarbonate  Silicone\n\nMã sản phẩm: 8-09297B988 \n\n\n\n\n\nNơi sản xuất: Hàng sản xuất ở nước thứ 3 tùy từng lô hàng (Việt Nam, Trung Quốc, Ấn Độ, Campuchia...)\n\n\n\nHướng dẫn bảo quản:\n\n• Hạn chế không nên để sản phẩm tiếp xúc nhiều với chất bẩn, đặc biệt là các chất bẩn cứng đầu như máu, cà phê, nhựa trái cây…\n\n• Bảo quản sản phẩm ở nơi khô ráo, thoáng mát… để tránh các loại nấm mốc. (Nếu không sử dụng thường xuyên thì nên bỏ vào bao ni lông bịt kín hoặc hộp đựng.)\n\n• Nên sử dụng khuôn hoặc nhét giấy báo cũ vào bên trong để luôn giữ được hình dạng ban đầu (đối với sản phẩm giày dép)\n\n• Không nên phơi sản phẩm dưới nắng quá gắt. \n\n\n\nChính sách đổi trả: Áp dụng theo chính sách của sàn\n\n\n\nChính sách bảo hành: Không bảo hành\n\n\n\nXuất xứ thương hiệu: Mỹ\n\n\n\nThông Tin Thương Hiệu:\n\nSpeedo ra đời vào năm 1914,là nhà sản xuất và phân phối nổi tiếng về trang phục và phụ kiện bơi lội với khẩu hiệu “ Speed on in your Speedo’s”. Chuyên cung cấp đồ bơi nam, đồ bơi nữ, bikini, kính bơi, phụ kiện bơi lội với chất lượng tốt, mang lại cảm giác thoải mái, tự tin, linh hoạt cho người sử dụng.\n\nThông Tin Nhà Phân Phối:\n\nSupersports là hệ thống bán lẻ hàng đầu và chuyên phân phối các mặt hàng về thể thao tại Thái Lan và là hệ thống thuộc tập đoàn Central Retail. Supersports mang đến rất nhiều lựa chọn về giày dép và quần áo, máy tập thể dục và phụ kiện thể thao từ các thương hiệu nổi tiếng thế giới. Supersports tự hào mang đến sản phẩm chất lượng tốt và dịch vụ đặc biệt cho Việt Nam.	100	215000	2024-04-10 23:01:20.404128+07	2024-04-10 23:01:20.404128+07
\.


--
-- Data for Name: user_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_tokens (id, user_id, refresh_token, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (users_id, username, phone_number, email, password, created_at, updated_at) FROM stdin;
\.


--
-- Name: addresses_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addresses_address_id_seq', 1, false);


--
-- Name: blacklists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blacklists_id_seq', 1, false);


--
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carts_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 2, true);


--
-- Name: classifyoptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classifyoptions_id_seq', 6, true);


--
-- Name: productclassifies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productclassifies_id_seq', 9, true);


--
-- Name: productimages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productimages_id_seq', 10, true);


--
-- Name: productlines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productlines_id_seq', 16, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 14, true);


--
-- Name: user_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_tokens_id_seq', 1, false);


--
-- Name: users_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_users_id_seq', 1, false);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (address_id);


--
-- Name: blacklists blacklists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blacklists
    ADD CONSTRAINT blacklists_pkey PRIMARY KEY (id);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: classifyoptions classifyoptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifyoptions
    ADD CONSTRAINT classifyoptions_pkey PRIMARY KEY (id);


--
-- Name: productclassifies productclassifies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productclassifies
    ADD CONSTRAINT productclassifies_pkey PRIMARY KEY (id);


--
-- Name: productimages productimages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productimages
    ADD CONSTRAINT productimages_pkey PRIMARY KEY (id);


--
-- Name: productlines productlines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productlines
    ADD CONSTRAINT productlines_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: user_tokens user_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tokens
    ADD CONSTRAINT user_tokens_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (users_id);


--
-- Name: addresses addresses_users_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_users_id_fkey FOREIGN KEY (users_id) REFERENCES public.users(users_id);


--
-- Name: carts carts_users_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_users_id_fkey FOREIGN KEY (users_id) REFERENCES public.users(users_id);


--
-- Name: classifyoptions classifyoptions_classify_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classifyoptions
    ADD CONSTRAINT classifyoptions_classify_id_fkey FOREIGN KEY (classify_id) REFERENCES public.productclassifies(id);


--
-- Name: productclassifies productclassifies_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productclassifies
    ADD CONSTRAINT productclassifies_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: productimages productimages_option_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productimages
    ADD CONSTRAINT productimages_option_id_fkey FOREIGN KEY (option_id) REFERENCES public.classifyoptions(id);


--
-- Name: productlines productline_category_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productlines
    ADD CONSTRAINT productline_category_fk FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: products products_productline_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_productline_id_fkey FOREIGN KEY (productline_id) REFERENCES public.productlines(id);


--
-- Name: user_tokens user_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tokens
    ADD CONSTRAINT user_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(users_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

