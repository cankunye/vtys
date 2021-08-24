--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
-- Name: check_out; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.check_out (
    id integer NOT NULL,
    order_id integer NOT NULL,
    card_num integer NOT NULL,
    cvv integer NOT NULL
);


ALTER TABLE public.check_out OWNER TO postgres;

--
-- Name: checkOut_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."checkOut_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."checkOut_id_seq" OWNER TO postgres;

--
-- Name: checkOut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."checkOut_id_seq" OWNED BY public.check_out.id;


--
-- Name: description; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.description (
    id integer NOT NULL,
    phone_id integer NOT NULL,
    content text NOT NULL,
    camera_mp integer NOT NULL
);


ALTER TABLE public.description OWNER TO postgres;

--
-- Name: description_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.description_id_seq OWNER TO postgres;

--
-- Name: description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.description_id_seq OWNED BY public.description.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    phone_id integer NOT NULL,
    user_id integer NOT NULL,
    net_total integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_id_seq OWNER TO postgres;

--
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_id_seq OWNED BY public.orders.id;


--
-- Name: phone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phone (
    id integer NOT NULL,
    company_id integer NOT NULL,
    name text NOT NULL,
    price money NOT NULL,
    "publishDate" date,
    "imgAdrs" text
);


ALTER TABLE public.phone OWNER TO postgres;

--
-- Name: phone_company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phone_company (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.phone_company OWNER TO postgres;

--
-- Name: phoneCompany_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."phoneCompany_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."phoneCompany_id_seq" OWNER TO postgres;

--
-- Name: phoneCompany_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."phoneCompany_id_seq" OWNED BY public.phone_company.id;


--
-- Name: phone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.phone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.phone_id_seq OWNER TO postgres;

--
-- Name: phone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.phone_id_seq OWNED BY public.phone.id;


--
-- Name: phone_likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phone_likes (
    id integer NOT NULL,
    phone_id integer NOT NULL,
    likes integer NOT NULL,
    dislikes integer NOT NULL
);


ALTER TABLE public.phone_likes OWNER TO postgres;

--
-- Name: phone_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.phone_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999
    CACHE 1;


ALTER TABLE public.phone_likes_id_seq OWNER TO postgres;

--
-- Name: phone_likes_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.phone_likes_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.phone_likes_id_seq1 OWNER TO postgres;

--
-- Name: phone_likes_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.phone_likes_id_seq1 OWNED BY public.phone_likes.id;


--
-- Name: post_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_comments (
    id integer NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.post_comments OWNER TO postgres;

--
-- Name: post_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_comment_id_seq OWNER TO postgres;

--
-- Name: post_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_comment_id_seq OWNED BY public.post_comments.id;


--
-- Name: post_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_type (
    id integer NOT NULL,
    type text NOT NULL
);


ALTER TABLE public.post_type OWNER TO postgres;

--
-- Name: post_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_type_id_seq OWNER TO postgres;

--
-- Name: post_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_type_id_seq OWNED BY public.post_type.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    type_id integer NOT NULL,
    user_id integer NOT NULL,
    heading text NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: quantity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quantity (
    id integer NOT NULL,
    phone_id integer NOT NULL,
    vendor_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.quantity OWNER TO postgres;

--
-- Name: quantity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quantity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quantity_id_seq OWNER TO postgres;

--
-- Name: quantity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quantity_id_seq OWNED BY public.quantity.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questions (
    id integer NOT NULL,
    "phoneID" integer NOT NULL,
    question_usr_id integer NOT NULL,
    question text NOT NULL,
    answer_usr_id integer,
    answer text
);


ALTER TABLE public.questions OWNER TO postgres;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO postgres;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review (
    id integer NOT NULL,
    phone_id integer NOT NULL,
    stars integer NOT NULL,
    user_id integer NOT NULL,
    review text NOT NULL
);


ALTER TABLE public.review OWNER TO postgres;

--
-- Name: review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_id_seq OWNER TO postgres;

--
-- Name: review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.review_id_seq OWNED BY public.review.id;


--
-- Name: user_advertisments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_advertisments (
    id integer NOT NULL,
    user_id integer NOT NULL,
    advertisment text NOT NULL,
    provider text NOT NULL,
    cost_per_click text NOT NULL,
    redirection_link text NOT NULL
);


ALTER TABLE public.user_advertisments OWNER TO postgres;

--
-- Name: user_advertisments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_advertisments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_advertisments_id_seq OWNER TO postgres;

--
-- Name: user_advertisments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_advertisments_id_seq OWNED BY public.user_advertisments.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "isAdmin" integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public.users.id;


--
-- Name: vendors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendors (
    id integer NOT NULL,
    adress text NOT NULL,
    "shippingTime" integer NOT NULL
);


ALTER TABLE public.vendors OWNER TO postgres;

--
-- Name: vendor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_id_seq OWNER TO postgres;

--
-- Name: vendor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_id_seq OWNED BY public.vendors.id;


--
-- Name: check_out id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.check_out ALTER COLUMN id SET DEFAULT nextval('public."checkOut_id_seq"'::regclass);


--
-- Name: description id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.description ALTER COLUMN id SET DEFAULT nextval('public.description_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);


--
-- Name: phone id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone ALTER COLUMN id SET DEFAULT nextval('public.phone_id_seq'::regclass);


--
-- Name: phone_company id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone_company ALTER COLUMN id SET DEFAULT nextval('public."phoneCompany_id_seq"'::regclass);


--
-- Name: phone_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone_likes ALTER COLUMN id SET DEFAULT nextval('public.phone_likes_id_seq1'::regclass);


--
-- Name: post_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments ALTER COLUMN id SET DEFAULT nextval('public.post_comment_id_seq'::regclass);


--
-- Name: post_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_type ALTER COLUMN id SET DEFAULT nextval('public.post_type_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: quantity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quantity ALTER COLUMN id SET DEFAULT nextval('public.quantity_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: review id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review ALTER COLUMN id SET DEFAULT nextval('public.review_id_seq'::regclass);


--
-- Name: user_advertisments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_advertisments ALTER COLUMN id SET DEFAULT nextval('public.user_advertisments_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: vendors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendors ALTER COLUMN id SET DEFAULT nextval('public.vendor_id_seq'::regclass);


--
-- Data for Name: check_out; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.check_out VALUES
	(1, 1, 123456789, 123);


--
-- Data for Name: description; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.description VALUES
	(1, 1, 'Note 9 is a really great phone for having an all time powerful users. If you want a powerful go for it', 22),
	(2, 2, 'When the 7.6-inch Infinity Flex Display lights up like magic, the front camera disappears — leaving behind nothing but your YouTube videes', 42),
	(3, 3, 'Overall a very good phone.', 36),
	(4, 4, 'Its an iphone', 36),
	(5, 5, 'Its an iphone', 36),
	(6, 6, 'Another stupid Iphone', 36),
	(7, 7, 'Xiaomi phones are good', 32),
	(8, 8, 'This tab is really good for children', 12),
	(9, 9, 'Famous phone my bruddah', 24);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders VALUES
	(1, 1, 1, 7999);


--
-- Data for Name: phone; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.phone VALUES
	(1, 1, 'Note9', '$7,999.00', '2017-03-14', './images/products/sumsung/samsung1.jpeg'),
	(2, 1, 'GalaxyZ', '$10,999.00', '2019-03-14', './images/products/sumsung/samsung2.jpeg'),
	(3, 1, 'A20', '$4,999.00', '2016-03-14', './images/products/sumsung/samsung3.jpeg'),
	(4, 2, 'IPhone 9', '$11,000.00', '2018-03-14', './images/products/iphone/iphone1.jpeg'),
	(5, 2, 'Iphone 11', '$12,000.00', '2019-03-14', './images/products/iphone/iphone2.jpeg'),
	(6, 2, 'Iphone 10', '$13,000.00', '2020-03-14', './images/products/iphone/iphone3.jpeg'),
	(7, 3, 'Redmi9', '$6,999.00', '2018-03-14', './images/products/sumsung/samsung4.jpeg'),
	(8, 3, 'Pad5', '$8,000.00', '2019-03-14', './images/products/sumsung/samsung5.jpeg'),
	(9, 3, 'PocoF3', '$9,999.00', '2020-03-14', './images/products/sumsung/samsung6.jpeg');


--
-- Data for Name: phone_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.phone_company VALUES
	(1, 'Samsung'),
	(2, 'Apple'),
	(3, 'Xiaomi');


--
-- Data for Name: phone_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.phone_likes VALUES
	(1, 1, 56, 12),
	(2, 2, 60, 2),
	(3, 3, 12, 3),
	(4, 4, 78, 12),
	(5, 5, 53, 98),
	(6, 6, 35, 35),
	(7, 7, 12, 2),
	(8, 8, 78, 56),
	(9, 9, 87, 56);


--
-- Data for Name: post_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: post_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.post_type VALUES
	(1, 'Informational'),
	(2, 'Discussion');


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.posts VALUES
	(1, 1, 1, 'Benefits of not owning a phone', 'The benefits of not having a phone is that you can live your life fully instead of being glued to your screen');


--
-- Data for Name: quantity; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.quantity VALUES
	(1, 1, 2, 24000),
	(2, 1, 3, 48000),
	(3, 2, 1, 12000),
	(4, 2, 3, 48000),
	(5, 3, 1, 12000),
	(6, 3, 2, 24000);


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.review VALUES
	(1, 1, 4, 2, 'It is perfect for my personal use'),
	(2, 2, 3, 3, 'Goode enough'),
	(3, 3, 3, 3, 'My daughter loves it'),
	(4, 4, 2, 2, 'Kafami vuruyorum ne aldim lan ben kesinikle almayin');


--
-- Data for Name: user_advertisments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES
	(1, 'Admin', 'admin', 'admin@phonenow.com', 'admin', 1),
	(2, 'user1', 'user1', 'user1@usernow.com', 'user1', 0),
	(3, 'user2', 'user2', 'user2@usernow.com', 'user2', 0);


--
-- Data for Name: vendors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.vendors VALUES
	(1, 'Taiwan', 120),
	(2, 'China', 96),
	(3, 'USA', 48);


--
-- Name: checkOut_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."checkOut_id_seq"', 1, true);


--
-- Name: description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.description_id_seq', 9, false);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_id_seq', 1, true);


--
-- Name: phoneCompany_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."phoneCompany_id_seq"', 3, true);


--
-- Name: phone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.phone_id_seq', 11, true);


--
-- Name: phone_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.phone_likes_id_seq', 9, false);


--
-- Name: phone_likes_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.phone_likes_id_seq1', 13, true);


--
-- Name: post_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_comment_id_seq', 1, false);


--
-- Name: post_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_type_id_seq', 2, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, true);


--
-- Name: quantity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quantity_id_seq', 6, false);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_id_seq', 1, false);


--
-- Name: review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.review_id_seq', 4, true);


--
-- Name: user_advertisments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_advertisments_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 3, true);


--
-- Name: vendor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_id_seq', 3, true);


--
-- Name: check_out checkOut_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.check_out
    ADD CONSTRAINT "checkOut_pkey" PRIMARY KEY (id);


--
-- Name: description description_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (id);


--
-- Name: orders order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: phone_company phoneCompany_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone_company
    ADD CONSTRAINT "phoneCompany_pkey" PRIMARY KEY (id);


--
-- Name: phone_likes phone_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone_likes
    ADD CONSTRAINT phone_likes_pkey PRIMARY KEY (id);


--
-- Name: phone phone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_pkey PRIMARY KEY (id);


--
-- Name: post_comments post_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comment_pkey PRIMARY KEY (id);


--
-- Name: post_type post_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_type
    ADD CONSTRAINT post_type_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: quantity quantity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quantity
    ADD CONSTRAINT quantity_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: review review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (id);


--
-- Name: phone unique_phone_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT unique_phone_id UNIQUE (id);


--
-- Name: user_advertisments user_advertisments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_advertisments
    ADD CONSTRAINT user_advertisments_pkey PRIMARY KEY (id);


--
-- Name: users user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: vendors vendor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendor_pkey PRIMARY KEY (id);


--
-- Name: check_out lnk_order_checkT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.check_out
    ADD CONSTRAINT "lnk_order_checkT" FOREIGN KEY (order_id) REFERENCES public.orders(id) MATCH FULL;


--
-- Name: orders lnk_order_ph; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT lnk_order_ph FOREIGN KEY (phone_id) REFERENCES public.phone(id) MATCH FULL;


--
-- Name: orders lnk_order_usr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT lnk_order_usr FOREIGN KEY (user_id) REFERENCES public.users(id) MATCH FULL;


--
-- Name: phone lnk_ph_comp_ph; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT lnk_ph_comp_ph FOREIGN KEY (company_id) REFERENCES public.phone_company(id) MATCH FULL;


--
-- Name: description lnk_ph_description; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT lnk_ph_description FOREIGN KEY (phone_id) REFERENCES public.phone(id) MATCH FULL;


--
-- Name: phone_likes lnk_ph_ph_likes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone_likes
    ADD CONSTRAINT lnk_ph_ph_likes FOREIGN KEY (phone_id) REFERENCES public.phone(id) MATCH FULL;


--
-- Name: quantity lnk_ph_quant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quantity
    ADD CONSTRAINT lnk_ph_quant FOREIGN KEY (phone_id) REFERENCES public.phone(id) MATCH FULL;


--
-- Name: review lnk_ph_review; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT lnk_ph_review FOREIGN KEY (phone_id) REFERENCES public.phone(id) MATCH FULL;


--
-- Name: post_comments lnk_post_post_cmnt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT lnk_post_post_cmnt FOREIGN KEY (post_id) REFERENCES public.posts(id) MATCH FULL;


--
-- Name: posts lnk_post_type_posts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT lnk_post_type_posts FOREIGN KEY (type_id) REFERENCES public.post_type(id) MATCH FULL;


--
-- Name: questions lnk_questions_ph; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT lnk_questions_ph FOREIGN KEY ("phoneID") REFERENCES public.phone(id) MATCH FULL;


--
-- Name: user_advertisments lnk_usr_ad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_advertisments
    ADD CONSTRAINT lnk_usr_ad FOREIGN KEY (user_id) REFERENCES public.users(id) MATCH FULL;


--
-- Name: questions lnk_usr_answerUsrID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT "lnk_usr_answerUsrID" FOREIGN KEY (question_usr_id) REFERENCES public.users(id) MATCH FULL;


--
-- Name: posts lnk_usr_post; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT lnk_usr_post FOREIGN KEY (user_id) REFERENCES public.users(id) MATCH FULL;


--
-- Name: questions lnk_usr_questionsUsrID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT "lnk_usr_questionsUsrID" FOREIGN KEY (question_usr_id) REFERENCES public.users(id) MATCH FULL;


--
-- Name: review lnk_usr_review; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT lnk_usr_review FOREIGN KEY (user_id) REFERENCES public.users(id) MATCH FULL;


--
-- Name: quantity lnk_vendor_quant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quantity
    ADD CONSTRAINT lnk_vendor_quant FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) MATCH FULL;


--
-- PostgreSQL database dump complete
--

