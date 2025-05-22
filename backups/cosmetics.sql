--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-22 11:39:15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 218 (class 1259 OID 17137)
-- Name: categorys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorys (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    description character varying(300)
);


ALTER TABLE public.categorys OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17136)
-- Name: categorys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categorys_id_seq OWNER TO postgres;

--
-- TOC entry 4807 (class 0 OID 0)
-- Dependencies: 217
-- Name: categorys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorys_id_seq OWNED BY public.categorys.id;


--
-- TOC entry 220 (class 1259 OID 17146)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    category_id integer,
    name character varying(250) NOT NULL,
    photo text,
    price_product numeric(10,2)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17145)
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
-- TOC entry 4808 (class 0 OID 0)
-- Dependencies: 219
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 4646 (class 2604 OID 17140)
-- Name: categorys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorys ALTER COLUMN id SET DEFAULT nextval('public.categorys_id_seq'::regclass);


--
-- TOC entry 4647 (class 2604 OID 17149)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 4799 (class 0 OID 17137)
-- Dependencies: 218
-- Data for Name: categorys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorys (id, name, description) FROM stdin;
1	Produtos para cabelo	Shampoos, condicionadores, m scaras e ¢leos capilares.
2	Produtos para maquiagem	Bases, sombras, batons e acess¢rios.
3	Produtos para hidrata‡Æo	Cremes e lo‡äes hidratantes.
4	Produtos para limpeza facial	Sabonetes, lo‡äes e g‚is de limpeza.
5	Protetores solares	Cremes e sprays para prote‡Æo solar.
6	Perfumes e fragrƒncias	Col“nias, perfumes e  guas de cheiro.
7	S‚runs e tratamentos	Produtos concentrados para cuidados espec¡ficos.
8	Cosm‚ticos naturais	Produtos com ingredientes orgƒnicos e naturais.
9	Kits e presentes	Conjuntos de produtos para presentear.
10	Acess¢rios de beleza	Pinc‚is, esponjas, espelhos e organizadores.
\.


--
-- TOC entry 4801 (class 0 OID 17146)
-- Dependencies: 220
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, category_id, name, photo, price_product) FROM stdin;
1	1	Shampoo Nutritivo Argan	1747912357324-cosmmetics4.jpg	29.90
2	1	Condicionador Hidratante Coco	1747912378678-cosmmetics8.jpg	27.50
3	1	Máscara Capilar Reconstrutora	1747912412882-cosmmetics68.jpg	39.90
4	1	Óleo Capilar de Jojoba	1747912430569-cosmmetics60.jpg	39.90
5	1	Shampoo Detox Carvão Ativado	1747912451112-cosmmetics23.jpg	26.00
6	2	Base Líquida Matte Bege Claro	1747912483328-cosmmetics47.jpg	45.90
7	2	Paleta de Sombras Nude	1747912513339-cosmmetics32.jpg	45.90
8	2	Batom Vermelho Intenso	1747912531953-cosmmetics5.jpg	22.50
9	2	Delineador Líquido Preto	1747912545783-cosmmetics11.jpg	22.50
10	2	Esponja para Maquiagem 3D	1747912564074-cosmmetics40.jpg	22.50
11	2	Loção Hidratante de Amêndoas	1747912579623-cosmmetics7.jpg	22.50
12	2	Creme Corporal Manteiga de Karité	1747912593852-cosmmetics22.jpg	22.50
13	2	Hidratante Facial com Ácido Hialurônico	1747912610398-cosmmetics28.jpg	22.50
14	2	Creme Hidratante para Mãos	1747912633165-cosmmetics38.jpg	18.50
15	2	Hidratante Corporal Lavanda	1747912647320-cosmmetics62.jpg	18.50
16	2	Sabonete Facial em Gel	1747912675101-cosmmetics89.jpg	23.50
17	2	Espuma de Limpeza Suave	1747912696265-cosmmetics87.jpg	28.50
18	2	Tônico Facial Refrescante	1747912722117-cosmmetics90.jpg	31.00
19	2	Gel de Limpeza Profunda	1747912738392-cosmmetics63.jpg	31.00
20	9	Kit Cuidados com a Pele	1747912814209-cosmmetics65.jpg	31.00
21	9	Kit Presente Maquiagem Essencial	1747912830250-cosmmetics14.jpg	99.00
22	9	Kit Capilar Nutritivo	1747912855430-cosmmetics22.jpg	99.00
23	2	Kit Maquiagem	1747912879297-cosmmetics15.jpg	99.00
24	2	Kit Gloss	1747912894984-cosmmetics6.jpg	99.00
25	2	Kit Gloss Franciny	1747912912482-cosmmetics12.jpg	99.00
26	3	Kit Perfume	1747912940506-cosmmetics18.jpg	99.00
27	3	Kit Batom	1747912973549-cosmmetics27.jpg	99.00
28	3	Kit Iluminador	1747912993750-cosmmetics72.jpg	99.00
29	3	Kit ICorretivo	1747913012166-cosmmetics71.jpg	99.00
30	3	Kit Marrom	1747913041858-cosmmetics44.jpg	99.00
\.


--
-- TOC entry 4809 (class 0 OID 0)
-- Dependencies: 217
-- Name: categorys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorys_id_seq', 10, true);


--
-- TOC entry 4810 (class 0 OID 0)
-- Dependencies: 219
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 30, true);


--
-- TOC entry 4649 (class 2606 OID 17144)
-- Name: categorys categorys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorys
    ADD CONSTRAINT categorys_pkey PRIMARY KEY (id);


--
-- TOC entry 4651 (class 2606 OID 17153)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 4652 (class 2606 OID 17154)
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categorys(id) ON DELETE CASCADE;


-- Completed on 2025-05-22 11:39:15

--
-- PostgreSQL database dump complete
--

