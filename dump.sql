--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: coke
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO coke;

--
-- Name: available_shifts; Type: TABLE; Schema: public; Owner: coke
--

CREATE TABLE public.available_shifts (
    id bigint NOT NULL,
    store_id bigint,
    num integer,
    name character varying,
    month integer,
    week integer,
    day character varying,
    nine boolean DEFAULT false NOT NULL,
    ten boolean,
    eleven boolean,
    twelve boolean,
    thirteen boolean,
    fourteen boolean,
    fifteen boolean,
    sixteen boolean,
    seventeen boolean,
    eighteen boolean,
    nineteen boolean,
    twenty boolean,
    twenty_one boolean,
    twenty_two boolean,
    twenty_three boolean,
    twenty_four boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.available_shifts OWNER TO coke;

--
-- Name: available_shifts_id_seq; Type: SEQUENCE; Schema: public; Owner: coke
--

CREATE SEQUENCE public.available_shifts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.available_shifts_id_seq OWNER TO coke;

--
-- Name: available_shifts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: coke
--

ALTER SEQUENCE public.available_shifts_id_seq OWNED BY public.available_shifts.id;


--
-- Name: clusters; Type: TABLE; Schema: public; Owner: Magnius
--

CREATE TABLE public.clusters (
    id bigint NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.clusters OWNER TO "Magnius";

--
-- Name: clusters_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.clusters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clusters_id_seq OWNER TO "Magnius";

--
-- Name: clusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
--

ALTER SEQUENCE public.clusters_id_seq OWNED BY public.clusters.id;


--
-- Name: data_cases; Type: TABLE; Schema: public; Owner: Magnius
--

CREATE TABLE public.data_cases (
    id bigint NOT NULL,
    id_case integer,
    turn_num integer,
    dep_num integer,
    day_num integer,
    hour_day integer,
    hp_val double precision,
    prod_obj double precision,
    vhp character varying,
    pov character varying,
    lunch_in character varying,
    lunch_hours character varying,
    hour_min integer,
    turns_matrix character varying,
    real_dot character varying,
    sale_plan character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    month integer,
    year integer
);


ALTER TABLE public.data_cases OWNER TO "Magnius";

--
-- Name: data_cases_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.data_cases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_cases_id_seq OWNER TO "Magnius";

--
-- Name: data_cases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
--

ALTER SEQUENCE public.data_cases_id_seq OWNED BY public.data_cases.id;


--
-- Name: departments; Type: TABLE; Schema: public; Owner: coke
--

CREATE TABLE public.departments (
    id bigint NOT NULL,
    origin_id integer,
    name character varying,
    store_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    productivity_obj double precision,
    master_id integer
);


ALTER TABLE public.departments OWNER TO coke;

--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: coke
--

CREATE SEQUENCE public.departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_id_seq OWNER TO coke;

--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: coke
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- Name: historic_sales; Type: TABLE; Schema: public; Owner: coke
--

CREATE TABLE public.historic_sales (
    id bigint NOT NULL,
    department_id bigint,
    nine bigint DEFAULT 0,
    ten bigint DEFAULT 0,
    eleven bigint DEFAULT 0,
    twelve bigint DEFAULT 0,
    thirteen bigint DEFAULT 0,
    fourteen bigint DEFAULT 0,
    fifteen bigint DEFAULT 0,
    sixteen bigint DEFAULT 0,
    seventeen bigint DEFAULT 0,
    eighteen bigint DEFAULT 0,
    nineteen bigint DEFAULT 0,
    twenty bigint DEFAULT 0,
    twenty_one bigint DEFAULT 0,
    twenty_two bigint DEFAULT 0,
    twenty_three bigint DEFAULT 0,
    twenty_four bigint DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    historic_date date,
    store_id bigint,
    week integer,
    month integer,
    year integer,
    day_number integer
);


ALTER TABLE public.historic_sales OWNER TO coke;

--
-- Name: historic_sales_id_seq; Type: SEQUENCE; Schema: public; Owner: coke
--

CREATE SEQUENCE public.historic_sales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historic_sales_id_seq OWNER TO coke;

--
-- Name: historic_sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: coke
--

ALTER SEQUENCE public.historic_sales_id_seq OWNED BY public.historic_sales.id;


--
-- Name: hs; Type: TABLE; Schema: public; Owner: coke
--

CREATE TABLE public.hs (
    id bigint NOT NULL,
    store_id bigint,
    department_id bigint,
    date date,
    year integer,
    month integer,
    week integer,
    dow integer,
    nine bigint,
    ten bigint,
    eleven bigint,
    twelve bigint,
    thirteen bigint,
    fourteen bigint,
    fifteen bigint,
    sixteen bigint,
    seventeen bigint,
    eighteen bigint,
    nineteen bigint,
    twenty bigint,
    twenty_one bigint,
    twenty_two bigint,
    twenty_three bigint,
    total_day bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.hs OWNER TO coke;

--
-- Name: hs_id_seq; Type: SEQUENCE; Schema: public; Owner: coke
--

CREATE SEQUENCE public.hs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hs_id_seq OWNER TO coke;

--
-- Name: hs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: coke
--

ALTER SEQUENCE public.hs_id_seq OWNED BY public.hs.id;


--
-- Name: master_departments; Type: TABLE; Schema: public; Owner: Magnius
--

CREATE TABLE public.master_departments (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.master_departments OWNER TO "Magnius";

--
-- Name: master_departments_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.master_departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.master_departments_id_seq OWNER TO "Magnius";

--
-- Name: master_departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
--

ALTER SEQUENCE public.master_departments_id_seq OWNED BY public.master_departments.id;


--
-- Name: return_cases; Type: TABLE; Schema: public; Owner: Magnius
--

CREATE TABLE public.return_cases (
    id bigint NOT NULL,
    id_case integer,
    eff_margin character varying,
    total_surplus integer,
    compensation_cost character varying,
    "integer" character varying,
    status character varying,
    "user" character varying,
    message character varying,
    deficit_total integer,
    tolerance character varying,
    version character varying,
    format_result character varying,
    max_time character varying,
    lunchs character varying,
    turns character varying,
    delta character varying,
    epsilon character varying,
    support character varying,
    model character varying,
    sales_plan integer,
    obj_function integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.return_cases OWNER TO "Magnius";

--
-- Name: return_cases_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.return_cases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.return_cases_id_seq OWNER TO "Magnius";

--
-- Name: return_cases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
--

ALTER SEQUENCE public.return_cases_id_seq OWNED BY public.return_cases.id;


--
-- Name: rs; Type: TABLE; Schema: public; Owner: coke
--

CREATE TABLE public.rs (
    id bigint NOT NULL,
    store_id bigint,
    department_id bigint,
    date date,
    year integer,
    month integer,
    week integer,
    dow integer,
    nine bigint,
    ten bigint,
    eleven bigint,
    twelve bigint,
    thirteen bigint,
    fourteen bigint,
    fifteen bigint,
    sixteen bigint,
    seventeen bigint,
    eighteen bigint,
    nineteen bigint,
    twenty bigint,
    twenty_one bigint,
    twenty_two bigint,
    twenty_three bigint,
    total_day bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.rs OWNER TO coke;

--
-- Name: rs_id_seq; Type: SEQUENCE; Schema: public; Owner: coke
--

CREATE SEQUENCE public.rs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rs_id_seq OWNER TO coke;

--
-- Name: rs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: coke
--

ALTER SEQUENCE public.rs_id_seq OWNED BY public.rs.id;


--
-- Name: sale_by_sellers; Type: TABLE; Schema: public; Owner: Magnius
--

CREATE TABLE public.sale_by_sellers (
    id bigint NOT NULL,
    seller integer,
    month integer,
    week integer,
    day integer,
    hour integer,
    department integer,
    sale double precision,
    turn integer,
    year integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sale_by_sellers OWNER TO "Magnius";

--
-- Name: sale_by_sellers_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.sale_by_sellers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sale_by_sellers_id_seq OWNER TO "Magnius";

--
-- Name: sale_by_sellers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
--

ALTER SEQUENCE public.sale_by_sellers_id_seq OWNED BY public.sale_by_sellers.id;


--
-- Name: sale_plans; Type: TABLE; Schema: public; Owner: coke
--

CREATE TABLE public.sale_plans (
    id bigint NOT NULL,
    department_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    sale_date date,
    nine bigint,
    ten bigint,
    eleven bigint,
    twelve bigint,
    thirteen bigint,
    fourteen bigint,
    fifteen bigint,
    sixteen bigint,
    seventeen bigint,
    eighteen bigint,
    nineteen bigint,
    twenty bigint,
    twenty_one bigint,
    twenty_two bigint,
    twenty_three bigint,
    twenty_four bigint,
    store_id bigint,
    week integer,
    month integer,
    year integer,
    day_number integer
);


ALTER TABLE public.sale_plans OWNER TO coke;

--
-- Name: sale_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: coke
--

CREATE SEQUENCE public.sale_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sale_plans_id_seq OWNER TO coke;

--
-- Name: sale_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: coke
--

ALTER SEQUENCE public.sale_plans_id_seq OWNED BY public.sale_plans.id;


--
-- Name: sale_reals; Type: TABLE; Schema: public; Owner: coke
--

CREATE TABLE public.sale_reals (
    id bigint NOT NULL,
    store_id bigint,
    department_id bigint,
    sale_date date,
    nine bigint,
    ten bigint,
    eleven bigint,
    twelve bigint,
    thirteen bigint,
    fourteen bigint,
    fifteen bigint,
    sixteen bigint,
    seventeen bigint,
    eighteen bigint,
    nineteen bigint,
    twenty bigint,
    twenty_one bigint,
    twenty_two bigint,
    twenty_three bigint,
    twenty_four bigint,
    week integer,
    month integer,
    year integer,
    day_number integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sale_reals OWNER TO coke;

--
-- Name: sale_reals_id_seq; Type: SEQUENCE; Schema: public; Owner: coke
--

CREATE SEQUENCE public.sale_reals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sale_reals_id_seq OWNER TO coke;

--
-- Name: sale_reals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: coke
--

ALTER SEQUENCE public.sale_reals_id_seq OWNED BY public.sale_reals.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: coke
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO coke;

--
-- Name: sellers; Type: TABLE; Schema: public; Owner: coke
--

CREATE TABLE public.sellers (
    id bigint NOT NULL,
    rut character varying,
    name character varying,
    lastname character varying,
    email character varying,
    phone character varying,
    street character varying,
    number character varying,
    city character varying,
    district character varying,
    county character varying,
    country character varying,
    department_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    store_id bigint,
    assigned_shift integer,
    begin_shift date
);


ALTER TABLE public.sellers OWNER TO coke;

--
-- Name: sellers_id_seq; Type: SEQUENCE; Schema: public; Owner: coke
--

CREATE SEQUENCE public.sellers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sellers_id_seq OWNER TO coke;

--
-- Name: sellers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: coke
--

ALTER SEQUENCE public.sellers_id_seq OWNED BY public.sellers.id;


--
-- Name: shift_breaks; Type: TABLE; Schema: public; Owner: coke
--

CREATE TABLE public.shift_breaks (
    id bigint NOT NULL,
    seller_id bigint,
    date date,
    "time" time without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.shift_breaks OWNER TO coke;

--
-- Name: shift_breaks_id_seq; Type: SEQUENCE; Schema: public; Owner: coke
--

CREATE SEQUENCE public.shift_breaks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shift_breaks_id_seq OWNER TO coke;

--
-- Name: shift_breaks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: coke
--

ALTER SEQUENCE public.shift_breaks_id_seq OWNED BY public.shift_breaks.id;


--
-- Name: sps; Type: TABLE; Schema: public; Owner: coke
--

CREATE TABLE public.sps (
    id bigint NOT NULL,
    store_id bigint,
    department_id bigint,
    date date,
    year integer,
    month integer,
    week integer,
    dow integer,
    sale integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sps OWNER TO coke;

--
-- Name: sps_id_seq; Type: SEQUENCE; Schema: public; Owner: coke
--

CREATE SEQUENCE public.sps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sps_id_seq OWNER TO coke;

--
-- Name: sps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: coke
--

ALTER SEQUENCE public.sps_id_seq OWNED BY public.sps.id;


--
-- Name: staffing_cases; Type: TABLE; Schema: public; Owner: Magnius
--

CREATE TABLE public.staffing_cases (
    id bigint NOT NULL,
    id_case integer,
    tolerance integer,
    actual_staffing_eval integer,
    max_time integer,
    "user" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.staffing_cases OWNER TO "Magnius";

--
-- Name: staffing_cases_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.staffing_cases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staffing_cases_id_seq OWNER TO "Magnius";

--
-- Name: staffing_cases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
--

ALTER SEQUENCE public.staffing_cases_id_seq OWNED BY public.staffing_cases.id;


--
-- Name: store_categories; Type: TABLE; Schema: public; Owner: coke
--

CREATE TABLE public.store_categories (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.store_categories OWNER TO coke;

--
-- Name: store_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: coke
--

CREATE SEQUENCE public.store_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_categories_id_seq OWNER TO coke;

--
-- Name: store_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: coke
--

ALTER SEQUENCE public.store_categories_id_seq OWNED BY public.store_categories.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: coke
--

CREATE TABLE public.stores (
    id bigint NOT NULL,
    name character varying,
    street character varying,
    number character varying,
    city character varying,
    district character varying,
    country character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    origin_id integer,
    county character varying,
    size character varying,
    economic_segment character varying,
    cluster_id bigint
);


ALTER TABLE public.stores OWNER TO coke;

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: coke
--

CREATE SEQUENCE public.stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_id_seq OWNER TO coke;

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: coke
--

ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;


--
-- Name: summary_cases; Type: TABLE; Schema: public; Owner: Magnius
--

CREATE TABLE public.summary_cases (
    id bigint NOT NULL,
    id_case integer,
    sale_plan character varying,
    coverange_deficit character varying,
    surplus_coverange character varying,
    total_deviation character varying,
    cost_of_remunerations character varying,
    margin_adjustment character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type_io character varying,
    real_dot character varying
);


ALTER TABLE public.summary_cases OWNER TO "Magnius";

--
-- Name: summary_cases_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.summary_cases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.summary_cases_id_seq OWNER TO "Magnius";

--
-- Name: summary_cases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
--

ALTER SEQUENCE public.summary_cases_id_seq OWNED BY public.summary_cases.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: coke
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    lastname character varying,
    surname character varying,
    role integer,
    picture character varying,
    status integer,
    "position" character varying,
    rut integer
);


ALTER TABLE public.users OWNER TO coke;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: coke
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO coke;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: coke
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: available_shifts id; Type: DEFAULT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.available_shifts ALTER COLUMN id SET DEFAULT nextval('public.available_shifts_id_seq'::regclass);


--
-- Name: clusters id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.clusters ALTER COLUMN id SET DEFAULT nextval('public.clusters_id_seq'::regclass);


--
-- Name: data_cases id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.data_cases ALTER COLUMN id SET DEFAULT nextval('public.data_cases_id_seq'::regclass);


--
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- Name: historic_sales id; Type: DEFAULT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.historic_sales ALTER COLUMN id SET DEFAULT nextval('public.historic_sales_id_seq'::regclass);


--
-- Name: hs id; Type: DEFAULT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.hs ALTER COLUMN id SET DEFAULT nextval('public.hs_id_seq'::regclass);


--
-- Name: master_departments id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.master_departments ALTER COLUMN id SET DEFAULT nextval('public.master_departments_id_seq'::regclass);


--
-- Name: return_cases id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.return_cases ALTER COLUMN id SET DEFAULT nextval('public.return_cases_id_seq'::regclass);


--
-- Name: rs id; Type: DEFAULT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.rs ALTER COLUMN id SET DEFAULT nextval('public.rs_id_seq'::regclass);


--
-- Name: sale_by_sellers id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sale_by_sellers ALTER COLUMN id SET DEFAULT nextval('public.sale_by_sellers_id_seq'::regclass);


--
-- Name: sale_plans id; Type: DEFAULT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.sale_plans ALTER COLUMN id SET DEFAULT nextval('public.sale_plans_id_seq'::regclass);


--
-- Name: sale_reals id; Type: DEFAULT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.sale_reals ALTER COLUMN id SET DEFAULT nextval('public.sale_reals_id_seq'::regclass);


--
-- Name: sellers id; Type: DEFAULT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.sellers ALTER COLUMN id SET DEFAULT nextval('public.sellers_id_seq'::regclass);


--
-- Name: shift_breaks id; Type: DEFAULT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.shift_breaks ALTER COLUMN id SET DEFAULT nextval('public.shift_breaks_id_seq'::regclass);


--
-- Name: sps id; Type: DEFAULT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.sps ALTER COLUMN id SET DEFAULT nextval('public.sps_id_seq'::regclass);


--
-- Name: staffing_cases id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.staffing_cases ALTER COLUMN id SET DEFAULT nextval('public.staffing_cases_id_seq'::regclass);


--
-- Name: store_categories id; Type: DEFAULT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.store_categories ALTER COLUMN id SET DEFAULT nextval('public.store_categories_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);


--
-- Name: summary_cases id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.summary_cases ALTER COLUMN id SET DEFAULT nextval('public.summary_cases_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: coke
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-08-22 13:53:16.762627	2017-08-22 13:53:16.762627
\.


--
-- Data for Name: available_shifts; Type: TABLE DATA; Schema: public; Owner: coke
--

COPY public.available_shifts (id, store_id, num, name, month, week, day, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty, twenty_one, twenty_two, twenty_three, twenty_four, created_at, updated_at) FROM stdin;
1658	1	1	TURNO 1 DE 45 HORAS	10	1	1	f	f	f	t	t	t	t	t	t	f	f	f	f	f	f	f	2017-10-11 21:04:58.877192	2017-10-11 21:04:58.877192
1659	1	1	TURNO 1 DE 45 HORAS	10	1	2	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:58.885117	2017-10-11 21:04:58.885117
1660	1	1	TURNO 1 DE 45 HORAS	10	1	3	f	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:58.892284	2017-10-11 21:04:58.892284
1661	1	1	TURNO 1 DE 45 HORAS	10	1	4	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:58.899337	2017-10-11 21:04:58.899337
1662	1	1	TURNO 1 DE 45 HORAS	10	1	5	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:58.905948	2017-10-11 21:04:58.905948
1663	1	1	TURNO 1 DE 45 HORAS	10	1	6	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:58.912478	2017-10-11 21:04:58.912478
1664	1	1	TURNO 1 DE 45 HORAS	10	1	7	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:58.919854	2017-10-11 21:04:58.919854
1665	1	1	TURNO 1 DE 45 HORAS	10	2	1	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:58.926987	2017-10-11 21:04:58.926987
1666	1	1	TURNO 1 DE 45 HORAS	10	2	2	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:58.933756	2017-10-11 21:04:58.933756
1667	1	1	TURNO 1 DE 45 HORAS	10	2	3	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:58.940718	2017-10-11 21:04:58.940718
1668	1	1	TURNO 1 DE 45 HORAS	10	2	4	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:58.947775	2017-10-11 21:04:58.947775
1669	1	1	TURNO 1 DE 45 HORAS	10	2	5	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:58.954951	2017-10-11 21:04:58.954951
1670	1	1	TURNO 1 DE 45 HORAS	10	2	6	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:58.9622	2017-10-11 21:04:58.9622
1671	1	1	TURNO 1 DE 45 HORAS	10	2	7	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:58.971322	2017-10-11 21:04:58.971322
1672	1	1	TURNO 1 DE 45 HORAS	10	3	1	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:58.978595	2017-10-11 21:04:58.978595
1673	1	1	TURNO 1 DE 45 HORAS	10	3	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:58.985059	2017-10-11 21:04:58.985059
1674	1	1	TURNO 1 DE 45 HORAS	10	3	3	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:58.992002	2017-10-11 21:04:58.992002
1675	1	1	TURNO 1 DE 45 HORAS	10	3	4	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:58.999018	2017-10-11 21:04:58.999018
1676	1	1	TURNO 1 DE 45 HORAS	10	3	5	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.006197	2017-10-11 21:04:59.006197
1677	1	1	TURNO 1 DE 45 HORAS	10	3	6	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.014915	2017-10-11 21:04:59.014915
1678	1	1	TURNO 1 DE 45 HORAS	10	3	7	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.022072	2017-10-11 21:04:59.022072
1679	1	1	TURNO 1 DE 45 HORAS	10	4	1	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.030524	2017-10-11 21:04:59.030524
1680	1	1	TURNO 1 DE 45 HORAS	10	4	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.039826	2017-10-11 21:04:59.039826
1681	1	1	TURNO 1 DE 45 HORAS	10	4	3	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.046969	2017-10-11 21:04:59.046969
1682	1	1	TURNO 1 DE 45 HORAS	10	4	4	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.053701	2017-10-11 21:04:59.053701
1683	1	1	TURNO 1 DE 45 HORAS	10	4	5	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.060963	2017-10-11 21:04:59.060963
1684	1	1	TURNO 1 DE 45 HORAS	10	4	6	f	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.070504	2017-10-11 21:04:59.070504
1685	1	1	TURNO 1 DE 45 HORAS	10	4	7	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.078432	2017-10-11 21:04:59.078432
1686	1	2	TURNO 2 DE 45 HORAS	10	1	1	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.089066	2017-10-11 21:04:59.089066
1687	1	2	TURNO 2 DE 45 HORAS	10	1	2	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.097468	2017-10-11 21:04:59.097468
1688	1	2	TURNO 2 DE 45 HORAS	10	1	3	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.107232	2017-10-11 21:04:59.107232
1689	1	2	TURNO 2 DE 45 HORAS	10	1	4	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.116551	2017-10-11 21:04:59.116551
1690	1	2	TURNO 2 DE 45 HORAS	10	1	5	f	f	f	t	t	t	t	t	t	f	f	t	f	f	f	f	2017-10-11 21:04:59.125121	2017-10-11 21:04:59.125121
1691	1	2	TURNO 2 DE 45 HORAS	10	1	6	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.13258	2017-10-11 21:04:59.13258
1692	1	2	TURNO 2 DE 45 HORAS	10	1	7	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.14207	2017-10-11 21:04:59.14207
1693	1	2	TURNO 2 DE 45 HORAS	10	2	1	f	f	f	t	t	t	t	t	t	f	f	f	f	f	f	f	2017-10-11 21:04:59.152468	2017-10-11 21:04:59.152468
1694	1	2	TURNO 2 DE 45 HORAS	10	2	2	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.161756	2017-10-11 21:04:59.161756
1695	1	2	TURNO 2 DE 45 HORAS	10	2	3	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.171737	2017-10-11 21:04:59.171737
1696	1	2	TURNO 2 DE 45 HORAS	10	2	4	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.18005	2017-10-11 21:04:59.18005
1697	1	2	TURNO 2 DE 45 HORAS	10	2	5	f	f	t	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.188686	2017-10-11 21:04:59.188686
1698	1	2	TURNO 2 DE 45 HORAS	10	2	6	f	f	t	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.198067	2017-10-11 21:04:59.198067
1699	1	2	TURNO 2 DE 45 HORAS	10	2	7	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.207669	2017-10-11 21:04:59.207669
1700	1	2	TURNO 2 DE 45 HORAS	10	3	1	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.217078	2017-10-11 21:04:59.217078
1701	1	2	TURNO 2 DE 45 HORAS	10	3	2	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.225649	2017-10-11 21:04:59.225649
1702	1	2	TURNO 2 DE 45 HORAS	10	3	3	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.234006	2017-10-11 21:04:59.234006
1703	1	2	TURNO 2 DE 45 HORAS	10	3	4	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.241941	2017-10-11 21:04:59.241941
1704	1	2	TURNO 2 DE 45 HORAS	10	3	5	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.249181	2017-10-11 21:04:59.249181
1705	1	2	TURNO 2 DE 45 HORAS	10	3	6	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.257307	2017-10-11 21:04:59.257307
1706	1	2	TURNO 2 DE 45 HORAS	10	3	7	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.286655	2017-10-11 21:04:59.286655
1707	1	2	TURNO 2 DE 45 HORAS	10	4	1	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.294496	2017-10-11 21:04:59.294496
1708	1	2	TURNO 2 DE 45 HORAS	10	4	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.302167	2017-10-11 21:04:59.302167
1709	1	2	TURNO 2 DE 45 HORAS	10	4	3	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.312389	2017-10-11 21:04:59.312389
1710	1	2	TURNO 2 DE 45 HORAS	10	4	4	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.322577	2017-10-11 21:04:59.322577
1711	1	2	TURNO 2 DE 45 HORAS	10	4	5	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.333635	2017-10-11 21:04:59.333635
1712	1	2	TURNO 2 DE 45 HORAS	10	4	6	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.341184	2017-10-11 21:04:59.341184
1713	1	2	TURNO 2 DE 45 HORAS	10	4	7	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.348234	2017-10-11 21:04:59.348234
1714	1	3	TURNO 3 DE 45 HORAS	10	1	1	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.355163	2017-10-11 21:04:59.355163
1715	1	3	TURNO 3 DE 45 HORAS	10	1	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.361959	2017-10-11 21:04:59.361959
1716	1	3	TURNO 3 DE 45 HORAS	10	1	3	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.368668	2017-10-11 21:04:59.368668
1717	1	3	TURNO 3 DE 45 HORAS	10	1	4	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.377199	2017-10-11 21:04:59.377199
1718	1	3	TURNO 3 DE 45 HORAS	10	1	5	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.384922	2017-10-11 21:04:59.384922
1719	1	3	TURNO 3 DE 45 HORAS	10	1	6	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.392166	2017-10-11 21:04:59.392166
1720	1	3	TURNO 3 DE 45 HORAS	10	1	7	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.399058	2017-10-11 21:04:59.399058
1721	1	3	TURNO 3 DE 45 HORAS	10	2	1	f	f	t	t	t	t	t	t	t	f	f	f	f	f	f	f	2017-10-11 21:04:59.405981	2017-10-11 21:04:59.405981
1722	1	3	TURNO 3 DE 45 HORAS	10	2	2	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.413029	2017-10-11 21:04:59.413029
1723	1	3	TURNO 3 DE 45 HORAS	10	2	3	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.420498	2017-10-11 21:04:59.420498
1724	1	3	TURNO 3 DE 45 HORAS	10	2	4	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.428374	2017-10-11 21:04:59.428374
1725	1	3	TURNO 3 DE 45 HORAS	10	2	5	f	f	t	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.435389	2017-10-11 21:04:59.435389
1726	1	3	TURNO 3 DE 45 HORAS	10	2	6	f	f	t	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.443107	2017-10-11 21:04:59.443107
1727	1	3	TURNO 3 DE 45 HORAS	10	2	7	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.450947	2017-10-11 21:04:59.450947
1728	1	3	TURNO 3 DE 45 HORAS	10	3	1	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.458546	2017-10-11 21:04:59.458546
1729	1	3	TURNO 3 DE 45 HORAS	10	3	2	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.465945	2017-10-11 21:04:59.465945
1730	1	3	TURNO 3 DE 45 HORAS	10	3	3	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.473513	2017-10-11 21:04:59.473513
1731	1	3	TURNO 3 DE 45 HORAS	10	3	4	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.481451	2017-10-11 21:04:59.481451
1732	1	3	TURNO 3 DE 45 HORAS	10	3	5	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.488759	2017-10-11 21:04:59.488759
1733	1	3	TURNO 3 DE 45 HORAS	10	3	6	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.496545	2017-10-11 21:04:59.496545
1734	1	3	TURNO 3 DE 45 HORAS	10	3	7	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.504929	2017-10-11 21:04:59.504929
1735	1	3	TURNO 3 DE 45 HORAS	10	4	1	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.512652	2017-10-11 21:04:59.512652
1736	1	3	TURNO 3 DE 45 HORAS	10	4	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.521312	2017-10-11 21:04:59.521312
1737	1	3	TURNO 3 DE 45 HORAS	10	4	3	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.52871	2017-10-11 21:04:59.52871
1738	1	3	TURNO 3 DE 45 HORAS	10	4	4	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.536812	2017-10-11 21:04:59.536812
1739	1	3	TURNO 3 DE 45 HORAS	10	4	5	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.54528	2017-10-11 21:04:59.54528
1740	1	3	TURNO 3 DE 45 HORAS	10	4	6	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.55287	2017-10-11 21:04:59.55287
1741	1	3	TURNO 3 DE 45 HORAS	10	4	7	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.560646	2017-10-11 21:04:59.560646
1742	1	4	TURNO 4 DE 45 HORAS	10	1	1	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.569737	2017-10-11 21:04:59.569737
1743	1	4	TURNO 4 DE 45 HORAS	10	1	2	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.577667	2017-10-11 21:04:59.577667
1744	1	4	TURNO 4 DE 45 HORAS	10	1	3	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.584624	2017-10-11 21:04:59.584624
1745	1	4	TURNO 4 DE 45 HORAS	10	1	4	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.591256	2017-10-11 21:04:59.591256
1746	1	4	TURNO 4 DE 45 HORAS	10	1	5	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.59774	2017-10-11 21:04:59.59774
1747	1	4	TURNO 4 DE 45 HORAS	10	1	6	f	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.60465	2017-10-11 21:04:59.60465
1748	1	4	TURNO 4 DE 45 HORAS	10	1	7	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.611723	2017-10-11 21:04:59.611723
1749	1	4	TURNO 4 DE 45 HORAS	10	2	1	f	f	t	t	t	t	t	t	t	t	f	f	f	f	f	f	2017-10-11 21:04:59.622118	2017-10-11 21:04:59.622118
1750	1	4	TURNO 4 DE 45 HORAS	10	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.629587	2017-10-11 21:04:59.629587
1751	1	4	TURNO 4 DE 45 HORAS	10	2	3	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.637471	2017-10-11 21:04:59.637471
1752	1	4	TURNO 4 DE 45 HORAS	10	2	4	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.644674	2017-10-11 21:04:59.644674
1753	1	4	TURNO 4 DE 45 HORAS	10	2	5	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.653529	2017-10-11 21:04:59.653529
1754	1	4	TURNO 4 DE 45 HORAS	10	2	6	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.661167	2017-10-11 21:04:59.661167
1755	1	4	TURNO 4 DE 45 HORAS	10	2	7	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.669733	2017-10-11 21:04:59.669733
1756	1	4	TURNO 4 DE 45 HORAS	10	3	1	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.677158	2017-10-11 21:04:59.677158
1757	1	4	TURNO 4 DE 45 HORAS	10	3	2	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.684527	2017-10-11 21:04:59.684527
1758	1	4	TURNO 4 DE 45 HORAS	10	3	3	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.697144	2017-10-11 21:04:59.697144
1759	1	4	TURNO 4 DE 45 HORAS	10	3	4	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.704986	2017-10-11 21:04:59.704986
1760	1	4	TURNO 4 DE 45 HORAS	10	3	5	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.712976	2017-10-11 21:04:59.712976
1761	1	4	TURNO 4 DE 45 HORAS	10	3	6	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.720742	2017-10-11 21:04:59.720742
1762	1	4	TURNO 4 DE 45 HORAS	10	3	7	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.728015	2017-10-11 21:04:59.728015
1763	1	4	TURNO 4 DE 45 HORAS	10	4	1	f	f	t	t	t	t	t	t	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.735211	2017-10-11 21:04:59.735211
1764	1	4	TURNO 4 DE 45 HORAS	10	4	2	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.744243	2017-10-11 21:04:59.744243
1765	1	4	TURNO 4 DE 45 HORAS	10	4	3	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.752506	2017-10-11 21:04:59.752506
1766	1	4	TURNO 4 DE 45 HORAS	10	4	4	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.760788	2017-10-11 21:04:59.760788
1767	1	4	TURNO 4 DE 45 HORAS	10	4	5	f	f	t	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.768552	2017-10-11 21:04:59.768552
1768	1	4	TURNO 4 DE 45 HORAS	10	4	6	f	f	t	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.775951	2017-10-11 21:04:59.775951
1769	1	4	TURNO 4 DE 45 HORAS	10	4	7	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.783125	2017-10-11 21:04:59.783125
1770	1	5	TURNO 1 DE 36 HORAS	10	1	1	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.790313	2017-10-11 21:04:59.790313
1771	1	5	TURNO 1 DE 36 HORAS	10	1	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.798161	2017-10-11 21:04:59.798161
1772	1	5	TURNO 1 DE 36 HORAS	10	1	3	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.805604	2017-10-11 21:04:59.805604
1773	1	5	TURNO 1 DE 36 HORAS	10	1	4	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.812548	2017-10-11 21:04:59.812548
1774	1	5	TURNO 1 DE 36 HORAS	10	1	5	f	f	f	f	f	f	f	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.819779	2017-10-11 21:04:59.819779
1775	1	5	TURNO 1 DE 36 HORAS	10	1	6	f	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.827041	2017-10-11 21:04:59.827041
1776	1	5	TURNO 1 DE 36 HORAS	10	1	7	f	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.834321	2017-10-11 21:04:59.834321
1777	1	5	TURNO 1 DE 36 HORAS	10	2	1	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.84239	2017-10-11 21:04:59.84239
1778	1	5	TURNO 1 DE 36 HORAS	10	2	2	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.850128	2017-10-11 21:04:59.850128
1779	1	5	TURNO 1 DE 36 HORAS	10	2	3	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.857638	2017-10-11 21:04:59.857638
1780	1	5	TURNO 1 DE 36 HORAS	10	2	4	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.864949	2017-10-11 21:04:59.864949
1781	1	5	TURNO 1 DE 36 HORAS	10	2	5	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.872152	2017-10-11 21:04:59.872152
1782	1	5	TURNO 1 DE 36 HORAS	10	2	6	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.881448	2017-10-11 21:04:59.881448
1783	1	5	TURNO 1 DE 36 HORAS	10	2	7	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.889182	2017-10-11 21:04:59.889182
1784	1	5	TURNO 1 DE 36 HORAS	10	3	1	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.897857	2017-10-11 21:04:59.897857
1785	1	5	TURNO 1 DE 36 HORAS	10	3	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.905469	2017-10-11 21:04:59.905469
1786	1	5	TURNO 1 DE 36 HORAS	10	3	3	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.91329	2017-10-11 21:04:59.91329
1787	1	5	TURNO 1 DE 36 HORAS	10	3	4	f	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.923843	2017-10-11 21:04:59.923843
1788	1	5	TURNO 1 DE 36 HORAS	10	3	5	f	f	f	f	f	f	f	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.931918	2017-10-11 21:04:59.931918
1789	1	5	TURNO 1 DE 36 HORAS	10	3	6	f	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.941259	2017-10-11 21:04:59.941259
1790	1	5	TURNO 1 DE 36 HORAS	10	3	7	f	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.948971	2017-10-11 21:04:59.948971
1791	1	5	TURNO 1 DE 36 HORAS	10	4	1	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.956431	2017-10-11 21:04:59.956431
1792	1	5	TURNO 1 DE 36 HORAS	10	4	2	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.963767	2017-10-11 21:04:59.963767
1793	1	5	TURNO 1 DE 36 HORAS	10	4	3	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:04:59.971483	2017-10-11 21:04:59.971483
1794	1	5	TURNO 1 DE 36 HORAS	10	4	4	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.979714	2017-10-11 21:04:59.979714
1795	1	5	TURNO 1 DE 36 HORAS	10	4	5	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:04:59.989939	2017-10-11 21:04:59.989939
1796	1	5	TURNO 1 DE 36 HORAS	10	4	6	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:04:59.999622	2017-10-11 21:04:59.999622
1797	1	5	TURNO 1 DE 36 HORAS	10	4	7	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:05:00.009249	2017-10-11 21:05:00.009249
1798	1	6	TURNO 2 DE 36 HORAS	10	1	1	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.019157	2017-10-11 21:05:00.019157
1799	1	6	TURNO 2 DE 36 HORAS	10	1	2	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:05:00.029024	2017-10-11 21:05:00.029024
1800	1	6	TURNO 2 DE 36 HORAS	10	1	3	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:05:00.038258	2017-10-11 21:05:00.038258
1801	1	6	TURNO 2 DE 36 HORAS	10	1	4	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.047517	2017-10-11 21:05:00.047517
1802	1	6	TURNO 2 DE 36 HORAS	10	1	5	f	f	f	t	t	t	t	t	t	f	f	t	f	f	f	f	2017-10-11 21:05:00.056811	2017-10-11 21:05:00.056811
1803	1	6	TURNO 2 DE 36 HORAS	10	1	6	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	f	2017-10-11 21:05:00.066567	2017-10-11 21:05:00.066567
1804	1	6	TURNO 2 DE 36 HORAS	10	1	7	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.076689	2017-10-11 21:05:00.076689
1805	1	6	TURNO 2 DE 36 HORAS	10	2	1	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.085956	2017-10-11 21:05:00.085956
1806	1	6	TURNO 2 DE 36 HORAS	10	2	2	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.095336	2017-10-11 21:05:00.095336
1807	1	6	TURNO 2 DE 36 HORAS	10	2	3	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.104872	2017-10-11 21:05:00.104872
1808	1	6	TURNO 2 DE 36 HORAS	10	2	4	f	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.114545	2017-10-11 21:05:00.114545
1809	1	6	TURNO 2 DE 36 HORAS	10	2	5	f	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.124582	2017-10-11 21:05:00.124582
1810	1	6	TURNO 2 DE 36 HORAS	10	2	6	f	f	f	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.133977	2017-10-11 21:05:00.133977
1811	1	6	TURNO 2 DE 36 HORAS	10	2	7	f	f	f	f	f	f	f	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.144386	2017-10-11 21:05:00.144386
1812	1	6	TURNO 2 DE 36 HORAS	10	3	1	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.155042	2017-10-11 21:05:00.155042
1813	1	6	TURNO 2 DE 36 HORAS	10	3	2	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:05:00.181435	2017-10-11 21:05:00.181435
1814	1	6	TURNO 2 DE 36 HORAS	10	3	3	f	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.191564	2017-10-11 21:05:00.191564
1815	1	6	TURNO 2 DE 36 HORAS	10	3	4	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.201601	2017-10-11 21:05:00.201601
1816	1	6	TURNO 2 DE 36 HORAS	10	3	5	f	f	f	t	t	t	t	t	t	f	f	t	f	f	f	f	2017-10-11 21:05:00.211103	2017-10-11 21:05:00.211103
1817	1	6	TURNO 2 DE 36 HORAS	10	3	6	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	f	2017-10-11 21:05:00.221372	2017-10-11 21:05:00.221372
1818	1	6	TURNO 2 DE 36 HORAS	10	3	7	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.231414	2017-10-11 21:05:00.231414
1819	1	6	TURNO 2 DE 36 HORAS	10	4	1	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.241424	2017-10-11 21:05:00.241424
1820	1	6	TURNO 2 DE 36 HORAS	10	4	2	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.250693	2017-10-11 21:05:00.250693
1821	1	6	TURNO 2 DE 36 HORAS	10	4	3	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.25979	2017-10-11 21:05:00.25979
1822	1	6	TURNO 2 DE 36 HORAS	10	4	4	f	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.269118	2017-10-11 21:05:00.269118
1823	1	6	TURNO 2 DE 36 HORAS	10	4	5	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.279043	2017-10-11 21:05:00.279043
1824	1	6	TURNO 2 DE 36 HORAS	10	4	6	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.288969	2017-10-11 21:05:00.288969
1825	1	6	TURNO 2 DE 36 HORAS	10	4	7	f	f	f	f	f	f	f	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.298628	2017-10-11 21:05:00.298628
1826	1	7	TURNO 3 DE 36 HORAS	10	1	1	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:05:00.308855	2017-10-11 21:05:00.308855
1827	1	7	TURNO 3 DE 36 HORAS	10	1	2	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:05:00.322401	2017-10-11 21:05:00.322401
1828	1	7	TURNO 3 DE 36 HORAS	10	1	3	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.333653	2017-10-11 21:05:00.333653
1829	1	7	TURNO 3 DE 36 HORAS	10	1	4	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.347939	2017-10-11 21:05:00.347939
1830	1	7	TURNO 3 DE 36 HORAS	10	1	5	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.357824	2017-10-11 21:05:00.357824
1831	1	7	TURNO 3 DE 36 HORAS	10	1	6	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:05:00.369238	2017-10-11 21:05:00.369238
1832	1	7	TURNO 3 DE 36 HORAS	10	1	7	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:05:00.382094	2017-10-11 21:05:00.382094
1833	1	7	TURNO 3 DE 36 HORAS	10	2	1	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.392987	2017-10-11 21:05:00.392987
1834	1	7	TURNO 3 DE 36 HORAS	10	2	2	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:05:00.4054	2017-10-11 21:05:00.4054
1835	1	7	TURNO 3 DE 36 HORAS	10	2	3	f	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.415357	2017-10-11 21:05:00.415357
1836	1	7	TURNO 3 DE 36 HORAS	10	2	4	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.423766	2017-10-11 21:05:00.423766
1837	1	7	TURNO 3 DE 36 HORAS	10	2	5	f	f	f	t	t	t	t	t	t	f	f	t	f	f	f	f	2017-10-11 21:05:00.43075	2017-10-11 21:05:00.43075
1838	1	7	TURNO 3 DE 36 HORAS	10	2	6	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	f	2017-10-11 21:05:00.437903	2017-10-11 21:05:00.437903
1839	1	7	TURNO 3 DE 36 HORAS	10	2	7	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.446031	2017-10-11 21:05:00.446031
1840	1	7	TURNO 3 DE 36 HORAS	10	3	1	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.453423	2017-10-11 21:05:00.453423
1841	1	7	TURNO 3 DE 36 HORAS	10	3	2	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:05:00.460691	2017-10-11 21:05:00.460691
1842	1	7	TURNO 3 DE 36 HORAS	10	3	3	f	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.468386	2017-10-11 21:05:00.468386
1843	1	7	TURNO 3 DE 36 HORAS	10	3	4	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.475421	2017-10-11 21:05:00.475421
1844	1	7	TURNO 3 DE 36 HORAS	10	3	5	f	f	f	t	t	t	t	t	t	f	f	t	f	f	f	f	2017-10-11 21:05:00.48239	2017-10-11 21:05:00.48239
1845	1	7	TURNO 3 DE 36 HORAS	10	3	6	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	f	2017-10-11 21:05:00.489431	2017-10-11 21:05:00.489431
1846	1	7	TURNO 3 DE 36 HORAS	10	3	7	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.49648	2017-10-11 21:05:00.49648
1847	1	7	TURNO 3 DE 36 HORAS	10	4	1	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:05:00.5037	2017-10-11 21:05:00.5037
1848	1	7	TURNO 3 DE 36 HORAS	10	4	2	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:05:00.511081	2017-10-11 21:05:00.511081
1849	1	7	TURNO 3 DE 36 HORAS	10	4	3	f	f	f	f	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.518693	2017-10-11 21:05:00.518693
1850	1	7	TURNO 3 DE 36 HORAS	10	4	4	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.525924	2017-10-11 21:05:00.525924
1851	1	7	TURNO 3 DE 36 HORAS	10	4	5	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.532799	2017-10-11 21:05:00.532799
1852	1	7	TURNO 3 DE 36 HORAS	10	4	6	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:05:00.539687	2017-10-11 21:05:00.539687
1853	1	7	TURNO 3 DE 36 HORAS	10	4	7	f	f	f	f	t	t	t	t	t	t	t	f	f	f	f	f	2017-10-11 21:05:00.546512	2017-10-11 21:05:00.546512
1854	1	8	TURNO 4 DE 36 HORAS	10	1	1	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.553695	2017-10-11 21:05:00.553695
1855	1	8	TURNO 4 DE 36 HORAS	10	1	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.560421	2017-10-11 21:05:00.560421
1856	1	8	TURNO 4 DE 36 HORAS	10	1	3	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.567755	2017-10-11 21:05:00.567755
1857	1	8	TURNO 4 DE 36 HORAS	10	1	4	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.57463	2017-10-11 21:05:00.57463
1858	1	8	TURNO 4 DE 36 HORAS	10	1	5	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.582091	2017-10-11 21:05:00.582091
1859	1	8	TURNO 4 DE 36 HORAS	10	1	6	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.590859	2017-10-11 21:05:00.590859
1860	1	8	TURNO 4 DE 36 HORAS	10	1	7	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.598363	2017-10-11 21:05:00.598363
1861	1	8	TURNO 4 DE 36 HORAS	10	2	1	f	f	t	t	t	t	t	t	t	t	f	f	f	f	f	f	2017-10-11 21:05:00.606175	2017-10-11 21:05:00.606175
1862	1	8	TURNO 4 DE 36 HORAS	10	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.613145	2017-10-11 21:05:00.613145
1863	1	8	TURNO 4 DE 36 HORAS	10	2	3	f	f	f	f	t	t	t	t	t	t	f	f	f	f	f	f	2017-10-11 21:05:00.620905	2017-10-11 21:05:00.620905
1864	1	8	TURNO 4 DE 36 HORAS	10	2	4	f	f	f	f	t	t	t	t	t	t	f	f	f	f	f	f	2017-10-11 21:05:00.627466	2017-10-11 21:05:00.627466
1865	1	8	TURNO 4 DE 36 HORAS	10	2	5	f	f	f	f	t	t	t	t	t	t	f	f	f	f	f	f	2017-10-11 21:05:00.634332	2017-10-11 21:05:00.634332
1866	1	8	TURNO 4 DE 36 HORAS	10	2	6	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.642328	2017-10-11 21:05:00.642328
1867	1	8	TURNO 4 DE 36 HORAS	10	2	7	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.651783	2017-10-11 21:05:00.651783
1868	1	8	TURNO 4 DE 36 HORAS	10	3	1	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.659495	2017-10-11 21:05:00.659495
1869	1	8	TURNO 4 DE 36 HORAS	10	3	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.666401	2017-10-11 21:05:00.666401
1870	1	8	TURNO 4 DE 36 HORAS	10	3	3	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.673322	2017-10-11 21:05:00.673322
1871	1	8	TURNO 4 DE 36 HORAS	10	3	4	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.680365	2017-10-11 21:05:00.680365
1872	1	8	TURNO 4 DE 36 HORAS	10	3	5	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.687523	2017-10-11 21:05:00.687523
1873	1	8	TURNO 4 DE 36 HORAS	10	3	6	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.694834	2017-10-11 21:05:00.694834
1874	1	8	TURNO 4 DE 36 HORAS	10	3	7	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.703261	2017-10-11 21:05:00.703261
1875	1	8	TURNO 4 DE 36 HORAS	10	4	1	f	f	t	t	t	t	t	t	t	t	f	f	f	f	f	f	2017-10-11 21:05:00.710589	2017-10-11 21:05:00.710589
1876	1	8	TURNO 4 DE 36 HORAS	10	4	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.717764	2017-10-11 21:05:00.717764
1877	1	8	TURNO 4 DE 36 HORAS	10	4	3	f	f	f	f	t	t	t	t	t	t	f	f	f	f	f	f	2017-10-11 21:05:00.725037	2017-10-11 21:05:00.725037
1878	1	8	TURNO 4 DE 36 HORAS	10	4	4	f	f	f	f	t	t	t	t	t	t	f	f	f	f	f	f	2017-10-11 21:05:00.732145	2017-10-11 21:05:00.732145
1879	1	8	TURNO 4 DE 36 HORAS	10	4	5	f	f	f	f	t	t	t	t	t	t	f	f	f	f	f	f	2017-10-11 21:05:00.739104	2017-10-11 21:05:00.739104
1880	1	8	TURNO 4 DE 36 HORAS	10	4	6	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.747095	2017-10-11 21:05:00.747095
1881	1	8	TURNO 4 DE 36 HORAS	10	4	7	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.75491	2017-10-11 21:05:00.75491
1882	1	9	TURNO 1 DE 24 HORAS	10	1	1	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.762511	2017-10-11 21:05:00.762511
1883	1	9	TURNO 1 DE 24 HORAS	10	1	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.769811	2017-10-11 21:05:00.769811
1884	1	9	TURNO 1 DE 24 HORAS	10	1	3	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.776974	2017-10-11 21:05:00.776974
1885	1	9	TURNO 1 DE 24 HORAS	10	1	4	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.785162	2017-10-11 21:05:00.785162
1886	1	9	TURNO 1 DE 24 HORAS	10	1	5	f	f	f	f	f	f	f	f	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.792134	2017-10-11 21:05:00.792134
1887	1	9	TURNO 1 DE 24 HORAS	10	1	6	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.7997	2017-10-11 21:05:00.7997
1888	1	9	TURNO 1 DE 24 HORAS	10	1	7	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.807866	2017-10-11 21:05:00.807866
1889	1	9	TURNO 1 DE 24 HORAS	10	2	1	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.817495	2017-10-11 21:05:00.817495
1890	1	9	TURNO 1 DE 24 HORAS	10	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.825882	2017-10-11 21:05:00.825882
1891	1	9	TURNO 1 DE 24 HORAS	10	2	3	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.833047	2017-10-11 21:05:00.833047
1892	1	9	TURNO 1 DE 24 HORAS	10	2	4	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.840379	2017-10-11 21:05:00.840379
1893	1	9	TURNO 1 DE 24 HORAS	10	2	5	f	f	f	f	f	f	f	f	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.847779	2017-10-11 21:05:00.847779
1894	1	9	TURNO 1 DE 24 HORAS	10	2	6	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.855501	2017-10-11 21:05:00.855501
1895	1	9	TURNO 1 DE 24 HORAS	10	2	7	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.862384	2017-10-11 21:05:00.862384
1896	1	9	TURNO 1 DE 24 HORAS	10	3	1	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.869524	2017-10-11 21:05:00.869524
1897	1	9	TURNO 1 DE 24 HORAS	10	3	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.877147	2017-10-11 21:05:00.877147
1898	1	9	TURNO 1 DE 24 HORAS	10	3	3	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.88385	2017-10-11 21:05:00.88385
1899	1	9	TURNO 1 DE 24 HORAS	10	3	4	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.89048	2017-10-11 21:05:00.89048
1900	1	9	TURNO 1 DE 24 HORAS	10	3	5	f	f	f	f	f	f	f	f	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.897493	2017-10-11 21:05:00.897493
1901	1	9	TURNO 1 DE 24 HORAS	10	3	6	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.90514	2017-10-11 21:05:00.90514
1902	1	9	TURNO 1 DE 24 HORAS	10	3	7	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.913182	2017-10-11 21:05:00.913182
1903	1	9	TURNO 1 DE 24 HORAS	10	4	1	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.920118	2017-10-11 21:05:00.920118
1904	1	9	TURNO 1 DE 24 HORAS	10	4	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.927607	2017-10-11 21:05:00.927607
1905	1	9	TURNO 1 DE 24 HORAS	10	4	3	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.934852	2017-10-11 21:05:00.934852
1906	1	9	TURNO 1 DE 24 HORAS	10	4	4	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.941591	2017-10-11 21:05:00.941591
1907	1	9	TURNO 1 DE 24 HORAS	10	4	5	f	f	f	f	f	f	f	f	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.950085	2017-10-11 21:05:00.950085
1908	1	9	TURNO 1 DE 24 HORAS	10	4	6	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.959248	2017-10-11 21:05:00.959248
1909	1	9	TURNO 1 DE 24 HORAS	10	4	7	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:00.967066	2017-10-11 21:05:00.967066
1910	1	10	TURNO SABADO - DOMINGO	10	1	1	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.974821	2017-10-11 21:05:00.974821
1911	1	10	TURNO SABADO - DOMINGO	10	1	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.981951	2017-10-11 21:05:00.981951
1912	1	10	TURNO SABADO - DOMINGO	10	1	3	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.98887	2017-10-11 21:05:00.98887
1913	1	10	TURNO SABADO - DOMINGO	10	1	4	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:00.995642	2017-10-11 21:05:00.995642
1914	1	10	TURNO SABADO - DOMINGO	10	1	5	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.003831	2017-10-11 21:05:01.003831
1915	1	10	TURNO SABADO - DOMINGO	10	1	6	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.011742	2017-10-11 21:05:01.011742
1916	1	10	TURNO SABADO - DOMINGO	10	1	7	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.019229	2017-10-11 21:05:01.019229
1917	1	10	TURNO SABADO - DOMINGO	10	2	1	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.026396	2017-10-11 21:05:01.026396
1918	1	10	TURNO SABADO - DOMINGO	10	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.033827	2017-10-11 21:05:01.033827
1919	1	10	TURNO SABADO - DOMINGO	10	2	3	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.044313	2017-10-11 21:05:01.044313
1920	1	10	TURNO SABADO - DOMINGO	10	2	4	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.067977	2017-10-11 21:05:01.067977
1921	1	10	TURNO SABADO - DOMINGO	10	2	5	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.075566	2017-10-11 21:05:01.075566
1922	1	10	TURNO SABADO - DOMINGO	10	2	6	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.083252	2017-10-11 21:05:01.083252
1923	1	10	TURNO SABADO - DOMINGO	10	2	7	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.090416	2017-10-11 21:05:01.090416
1924	1	10	TURNO SABADO - DOMINGO	10	3	1	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.097357	2017-10-11 21:05:01.097357
1925	1	10	TURNO SABADO - DOMINGO	10	3	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.104481	2017-10-11 21:05:01.104481
1926	1	10	TURNO SABADO - DOMINGO	10	3	3	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.111635	2017-10-11 21:05:01.111635
1927	1	10	TURNO SABADO - DOMINGO	10	3	4	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.118919	2017-10-11 21:05:01.118919
1928	1	10	TURNO SABADO - DOMINGO	10	3	5	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.126066	2017-10-11 21:05:01.126066
1929	1	10	TURNO SABADO - DOMINGO	10	3	6	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.132652	2017-10-11 21:05:01.132652
1930	1	10	TURNO SABADO - DOMINGO	10	3	7	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.139155	2017-10-11 21:05:01.139155
1931	1	10	TURNO SABADO - DOMINGO	10	4	1	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.145561	2017-10-11 21:05:01.145561
1932	1	10	TURNO SABADO - DOMINGO	10	4	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.151866	2017-10-11 21:05:01.151866
1933	1	10	TURNO SABADO - DOMINGO	10	4	3	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.158514	2017-10-11 21:05:01.158514
1934	1	10	TURNO SABADO - DOMINGO	10	4	4	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.166009	2017-10-11 21:05:01.166009
1935	1	10	TURNO SABADO - DOMINGO	10	4	5	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.17392	2017-10-11 21:05:01.17392
1936	1	10	TURNO SABADO - DOMINGO	10	4	6	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.180954	2017-10-11 21:05:01.180954
1937	1	10	TURNO SABADO - DOMINGO	10	4	7	f	f	t	t	t	t	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.187817	2017-10-11 21:05:01.187817
1938	1	11	TURNO 1 TARDE	10	1	1	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.194474	2017-10-11 21:05:01.194474
1939	1	11	TURNO 1 TARDE	10	1	2	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.201881	2017-10-11 21:05:01.201881
1940	1	11	TURNO 1 TARDE	10	1	3	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.209053	2017-10-11 21:05:01.209053
1941	1	11	TURNO 1 TARDE	10	1	4	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.217235	2017-10-11 21:05:01.217235
1942	1	11	TURNO 1 TARDE	10	1	5	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.224847	2017-10-11 21:05:01.224847
1943	1	11	TURNO 1 TARDE	10	1	6	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.23235	2017-10-11 21:05:01.23235
1944	1	11	TURNO 1 TARDE	10	1	7	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.239844	2017-10-11 21:05:01.239844
1945	1	11	TURNO 1 TARDE	10	2	1	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.248663	2017-10-11 21:05:01.248663
1946	1	11	TURNO 1 TARDE	10	2	2	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.256158	2017-10-11 21:05:01.256158
1947	1	11	TURNO 1 TARDE	10	2	3	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.26422	2017-10-11 21:05:01.26422
1948	1	11	TURNO 1 TARDE	10	2	4	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.274195	2017-10-11 21:05:01.274195
1949	1	11	TURNO 1 TARDE	10	2	5	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.281681	2017-10-11 21:05:01.281681
1950	1	11	TURNO 1 TARDE	10	2	6	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.28871	2017-10-11 21:05:01.28871
1951	1	11	TURNO 1 TARDE	10	2	7	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.296875	2017-10-11 21:05:01.296875
1952	1	11	TURNO 1 TARDE	10	3	1	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.304303	2017-10-11 21:05:01.304303
1953	1	11	TURNO 1 TARDE	10	3	2	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.311799	2017-10-11 21:05:01.311799
1954	1	11	TURNO 1 TARDE	10	3	3	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.319221	2017-10-11 21:05:01.319221
1955	1	11	TURNO 1 TARDE	10	3	4	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.326709	2017-10-11 21:05:01.326709
1956	1	11	TURNO 1 TARDE	10	3	5	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.334034	2017-10-11 21:05:01.334034
1957	1	11	TURNO 1 TARDE	10	3	6	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.341686	2017-10-11 21:05:01.341686
1958	1	11	TURNO 1 TARDE	10	3	7	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.349103	2017-10-11 21:05:01.349103
1959	1	11	TURNO 1 TARDE	10	4	1	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.356208	2017-10-11 21:05:01.356208
1960	1	11	TURNO 1 TARDE	10	4	2	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.362975	2017-10-11 21:05:01.362975
1961	1	11	TURNO 1 TARDE	10	4	3	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.370117	2017-10-11 21:05:01.370117
1962	1	11	TURNO 1 TARDE	10	4	4	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.377465	2017-10-11 21:05:01.377465
1963	1	11	TURNO 1 TARDE	10	4	5	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.384627	2017-10-11 21:05:01.384627
1964	1	11	TURNO 1 TARDE	10	4	6	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.392199	2017-10-11 21:05:01.392199
1965	1	11	TURNO 1 TARDE	10	4	7	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.399105	2017-10-11 21:05:01.399105
1966	1	12	TURNO 2 TARDE	10	1	1	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.406461	2017-10-11 21:05:01.406461
1967	1	12	TURNO 2 TARDE	10	1	2	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.4135	2017-10-11 21:05:01.4135
1968	1	12	TURNO 2 TARDE	10	1	3	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.421195	2017-10-11 21:05:01.421195
1969	1	12	TURNO 2 TARDE	10	1	4	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.428795	2017-10-11 21:05:01.428795
1970	1	12	TURNO 2 TARDE	10	1	5	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.43676	2017-10-11 21:05:01.43676
1971	1	12	TURNO 2 TARDE	10	1	6	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.444143	2017-10-11 21:05:01.444143
1972	1	12	TURNO 2 TARDE	10	1	7	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.451096	2017-10-11 21:05:01.451096
1973	1	12	TURNO 2 TARDE	10	2	1	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.457803	2017-10-11 21:05:01.457803
1974	1	12	TURNO 2 TARDE	10	2	2	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.46481	2017-10-11 21:05:01.46481
1975	1	12	TURNO 2 TARDE	10	2	3	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.472213	2017-10-11 21:05:01.472213
1976	1	12	TURNO 2 TARDE	10	2	4	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.480188	2017-10-11 21:05:01.480188
1977	1	12	TURNO 2 TARDE	10	2	5	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.487851	2017-10-11 21:05:01.487851
1978	1	12	TURNO 2 TARDE	10	2	6	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.497352	2017-10-11 21:05:01.497352
1979	1	12	TURNO 2 TARDE	10	2	7	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.505718	2017-10-11 21:05:01.505718
1980	1	12	TURNO 2 TARDE	10	3	1	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.51287	2017-10-11 21:05:01.51287
1981	1	12	TURNO 2 TARDE	10	3	2	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.521903	2017-10-11 21:05:01.521903
1982	1	12	TURNO 2 TARDE	10	3	3	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.530268	2017-10-11 21:05:01.530268
1983	1	12	TURNO 2 TARDE	10	3	4	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.537947	2017-10-11 21:05:01.537947
1984	1	12	TURNO 2 TARDE	10	3	5	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.544916	2017-10-11 21:05:01.544916
1985	1	12	TURNO 2 TARDE	10	3	6	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.551831	2017-10-11 21:05:01.551831
1986	1	12	TURNO 2 TARDE	10	3	7	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.558634	2017-10-11 21:05:01.558634
1987	1	12	TURNO 2 TARDE	10	4	1	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.56586	2017-10-11 21:05:01.56586
1988	1	12	TURNO 2 TARDE	10	4	2	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.575594	2017-10-11 21:05:01.575594
1989	1	12	TURNO 2 TARDE	10	4	3	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.583922	2017-10-11 21:05:01.583922
1990	1	12	TURNO 2 TARDE	10	4	4	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.5914	2017-10-11 21:05:01.5914
1991	1	12	TURNO 2 TARDE	10	4	5	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.598686	2017-10-11 21:05:01.598686
1992	1	12	TURNO 2 TARDE	10	4	6	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2017-10-11 21:05:01.605458	2017-10-11 21:05:01.605458
1993	1	12	TURNO 2 TARDE	10	4	7	f	f	f	f	f	f	t	t	t	t	t	t	f	f	f	f	2017-10-11 21:05:01.612256	2017-10-11 21:05:01.612256
\.


--
-- Name: available_shifts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: coke
--

SELECT pg_catalog.setval('public.available_shifts_id_seq', 1993, true);


--
-- Data for Name: clusters; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.clusters (id, name, description, created_at, updated_at) FROM stdin;
1	ABC1	\N	2018-05-19 19:17:59.804687	2018-05-19 19:17:59.804687
2	C2	\N	2018-05-19 19:17:59.836689	2018-05-19 19:17:59.836689
3	C3	\N	2018-05-19 19:17:59.839689	2018-05-19 19:17:59.839689
4	D	\N	2018-05-19 19:17:59.842689	2018-05-19 19:17:59.842689
5	E	\N	2018-05-19 19:17:59.845689	2018-05-19 19:17:59.845689
\.


--
-- Name: clusters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.clusters_id_seq', 50, true);


--
-- Data for Name: data_cases; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.data_cases (id, id_case, turn_num, dep_num, day_num, hour_day, hp_val, prod_obj, vhp, pov, lunch_in, lunch_hours, hour_min, turns_matrix, real_dot, sale_plan, created_at, updated_at, month, year) FROM stdin;
32	29	12	1	28	10	2500	85000		[1,6] 95000,[2,6] 95000,[3,6] 95000,[4,6] 95000,[5,6] 95000,[6,6] 95000,[7,6] 95000,[8,6] 95000,[9,6] 95000,[10,6] 95000,[1,7] 95000,[2,7] 95000,[3,7] 95000,[4,7] 95000,[5,7] 95000,[6,7] 95000,[7,7] 95000,[8,7] 95000,[9,7] 95000,[10,7] 95000,[1,13] 95000,[2,13] 95000,[3,13] 95000,[4,13] 95000,[5,13] 95000,[6,13] 95000,[7,13] 95000,[8,13] 95000,[9,13] 95000,[10,13] 95000,[1,14] 95000,[2,14] 95000,[3,14] 95000,[4,14] 95000,[5,14] 95000,[6,14] 95000,[7,14] 95000,[8,14] 95000,[9,14] 95000,[10,14] 95000,[1,20] 95000,[2,20] 95000,[3,20] 95000,[4,20] 95000,[5,20] 95000,[6,20] 95000,[7,20] 95000,[8,20] 95000,[9,20] 95000,[10,20] 95000,[1,21] 95000,[2,21] 95000,[3,21] 95000,[4,21] 95000,[5,21] 95000,[6,21] 95000,[7,21] 95000,[8,21] 95000,[9,21] 95000,[10,21] 95000,[1,27] 95000,[2,27] 95000,[3,27] 95000,[4,27] 95000,[5,27] 95000,[6,27] 95000,[7,27] 95000,[8,27] 95000,[9,27] 95000,[10,27] 95000,[1,28] 95000,[2,28] 95000,[3,28] 95000,[4,28] 95000,[5,28] 95000,[6,28] 95000,[7,28] 95000,[8,28] 95000,[9,28] 95000,[10,28] 95000	[1] 1, [2] 1	[2] 1, [3] 1, [4] 1, [5] 1	2	[6,3,2] 1, [6,4,2] 1, [6,5,2] 1, [6,6,2] 1, [6,7,2] 1, [6,8,2] 1, [6,9,2] 1, [6,4,3] 1, [6,5,3] 1, [6,6,3] 1, [6,7,3] 1, [6,8,3] 1, [6,9,3] 1, [6,3,4] 1, [6,4,4] 1, [6,5,4] 1, [6,6,4] 1, [6,7,4] 1, [6,8,4] 1, [6,9,4] 1, [6,10,4] 1, [6,2,5] 1, [6,3,5] 1, [6,4,5] 1, [6,5,5] 1, [6,6,5] 1, [6,7,5] 1, [6,10,5] 1, [6,2,6] 1, [6,3,6] 1, [6,4,6] 1, [6,5,6] 1, [6,6,6] 1, [6,7,6] 1, [6,8,6] 1, [6,3,9] 1, [6,4,9] 1, [6,5,9] 1, [6,6,9] 1, [6,7,9] 1, [6,8,9] 1, [6,9,9] 1, [6,10,9] 1, [6,4,11] 1, [6,5,11] 1, [6,6,11] 1, [6,7,11] 1, [6,8,11] 1, [6,9,11] 1, [6,10,11] 1, [6,2,12] 1, [6,3,12] 1, [6,4,12] 1, [6,5,12] 1, [6,6,12] 1, [6,7,12] 1, [6,8,12] 1, [6,9,12] 1, [6,10,12] 1, [6,2,13] 1, [6,3,13] 1, [6,4,13] 1, [6,5,13] 1, [6,6,13] 1, [6,7,13] 1, [6,8,13] 1, [6,9,13] 1, [6,10,13] 1, [6,6,14] 1, [6,7,14] 1, [6,8,14] 1, [6,9,14] 1, [6,10,14] 1, [6,3,16] 1, [6,4,16] 1, [6,5,16] 1, [6,6,16] 1, [6,7,16] 1, [6,8,16] 1, [6,9,16] 1, [6,4,17] 1, [6,5,17] 1, [6,6,17] 1, [6,7,17] 1, [6,8,17] 1, [6,9,17] 1, [6,10,17] 1, [6,3,18] 1, [6,4,18] 1, [6,5,18] 1, [6,6,18] 1, [6,7,18] 1, [6,8,18] 1, [6,9,18] 1, [6,10,18] 1, [6,2,19] 1, [6,3,19] 1, [6,4,19] 1, [6,5,19] 1, [6,6,19] 1, [6,7,19] 1, [6,10,19] 1, [6,2,20] 1, [6,3,20] 1, [6,4,20] 1, [6,5,20] 1, [6,6,20] 1, [6,7,20] 1, [6,8,20] 1, [6,3,23] 1, [6,4,23] 1, [6,5,23] 1, [6,6,23] 1, [6,7,23] 1, [6,8,23] 1, [6,9,23] 1, [6,10,23] 1, [6,4,25] 1, [6,5,25] 1, [6,6,25] 1, [6,7,25] 1, [6,8,25] 1, [6,9,25] 1, [6,10,25] 1, [6,3,26] 1, [6,4,26] 1, [6,5,26] 1, [6,6,26] 1, [6,7,26] 1, [6,8,26] 1, [6,9,26] 1, [6,10,26] 1, [6,3,27] 1, [6,4,27] 1, [6,5,27] 1, [6,6,27] 1, [6,7,27] 1, [6,8,27] 1, [6,9,27] 1, [6,10,27] 1, [6,6,28] 1, [6,7,28] 1, [6,8,28] 1, [6,9,28] 1, [6,10,28] 1, [8,1,1] 1, [8,2,1] 1, [8,3,1] 1, [8,4,1] 1, [8,5,1] 1, [8,6,1] 1, [8,7,1] 1, [8,8,1] 1, [8,9,1] 1, [8,10,1] 1, [8,5,5] 1, [8,6,5] 1, [8,7,5] 1, [8,8,5] 1, [8,9,5] 1, [8,10,5] 1, [8,1,6] 1, [8,2,6] 1, [8,3,6] 1, [8,4,6] 1, [8,5,6] 1, [8,6,6] 1, [8,7,6] 1, [8,8,6] 1, [8,9,6] 1, [8,10,6] 1, [8,1,7] 1, [8,2,7] 1, [8,3,7] 1, [8,4,7] 1, [8,5,7] 1, [8,6,7] 1, [8,7,7] 1, [8,8,7] 1, [8,9,7] 1, [8,10,7] 1, [8,1,8] 1, [8,2,8] 1, [8,3,8] 1, [8,4,8] 1, [8,5,8] 1, [8,6,8] 1, [8,7,8] 1, [8,8,8] 1, [8,3,10] 1, [8,4,10] 1, [8,5,10] 1, [8,6,10] 1, [8,7,10] 1, [8,8,10] 1, [8,3,11] 1, [8,4,11] 1, [8,5,11] 1, [8,6,11] 1, [8,7,11] 1, [8,8,11] 1, [8,3,12] 1, [8,4,12] 1, [8,5,12] 1, [8,6,12] 1, [8,7,12] 1, [8,8,12] 1, [8,1,14] 1, [8,2,14] 1, [8,3,14] 1, [8,4,14] 1, [8,5,14] 1, [8,6,14] 1, [8,7,14] 1, [8,8,14] 1, [8,9,14] 1, [8,10,14] 1, [8,1,15] 1, [8,2,15] 1, [8,3,15] 1, [8,4,15] 1, [8,5,15] 1, [8,6,15] 1, [8,7,15] 1, [8,8,15] 1, [8,9,15] 1, [8,10,15] 1, [8,5,19] 1, [8,6,19] 1, [8,7,19] 1, [8,8,19] 1, [8,9,19] 1, [8,10,19] 1, [8,1,20] 1, [8,2,20] 1, [8,3,20] 1, [8,4,20] 1, [8,5,20] 1, [8,6,20] 1, [8,7,20] 1, [8,8,20] 1, [8,9,20] 1, [8,10,20] 1, [8,1,21] 1, [8,2,21] 1, [8,3,21] 1, [8,4,21] 1, [8,5,21] 1, [8,6,21] 1, [8,7,21] 1, [8,8,21] 1, [8,9,21] 1, [8,10,21] 1, [8,1,22] 1, [8,2,22] 1, [8,3,22] 1, [8,4,22] 1, [8,5,22] 1, [8,6,22] 1, [8,7,22] 1, [8,8,22] 1, [8,3,24] 1, [8,4,24] 1, [8,5,24] 1, [8,6,24] 1, [8,7,24] 1, [8,8,24] 1, [8,3,25] 1, [8,4,25] 1, [8,5,25] 1, [8,6,25] 1, [8,7,25] 1, [8,8,25] 1, [8,3,26] 1, [8,4,26] 1, [8,5,26] 1, [8,6,26] 1, [8,7,26] 1, [8,8,26] 1, [8,1,28] 1, [8,2,28] 1, [8,3,28] 1, [8,4,28] 1, [8,5,28] 1, [8,6,28] 1, [8,7,28] 1, [8,8,28] 1, [8,9,28] 1, [8,10,28] 1, [12,5,1] 1, [12,6,1] 1, [12,7,1] 1, [12,8,1] 1, [12,9,1] 1, [12,10,1] 1, [12,5,2] 1, [12,6,2] 1, [12,7,2] 1, [12,8,2] 1, [12,9,2] 1, [12,10,2] 1, [12,5,3] 1, [12,6,3] 1, [12,7,3] 1, [12,8,3] 1, [12,9,3] 1, [12,10,3] 1, [12,5,4] 1, [12,6,4] 1, [12,7,4] 1, [12,8,4] 1, [12,9,4] 1, [12,10,4] 1, [12,5,5] 1, [12,6,5] 1, [12,7,5] 1, [12,8,5] 1, [12,9,5] 1, [12,10,5] 1, [12,5,7] 1, [12,6,7] 1, [12,7,7] 1, [12,8,7] 1, [12,9,7] 1, [12,10,7] 1, [12,5,8] 1, [12,6,8] 1, [12,7,8] 1, [12,8,8] 1, [12,9,8] 1, [12,10,8] 1, [12,5,9] 1, [12,6,9] 1, [12,7,9] 1, [12,8,9] 1, [12,9,9] 1, [12,10,9] 1, [12,5,10] 1, [12,6,10] 1, [12,7,10] 1, [12,8,10] 1, [12,9,10] 1, [12,10,10] 1, [12,5,11] 1, [12,6,11] 1, [12,7,11] 1, [12,8,11] 1, [12,9,11] 1, [12,10,11] 1, [12,5,12] 1, [12,6,12] 1, [12,7,12] 1, [12,8,12] 1, [12,9,12] 1, [12,10,12] 1, [12,5,14] 1, [12,6,14] 1, [12,7,14] 1, [12,8,14] 1, [12,9,14] 1, [12,10,14] 1, [12,5,15] 1, [12,6,15] 1, [12,7,15] 1, [12,8,15] 1, [12,9,15] 1, [12,10,15] 1, [12,5,16] 1, [12,6,16] 1, [12,7,16] 1, [12,8,16] 1, [12,9,16] 1, [12,10,16] 1, [12,5,17] 1, [12,6,17] 1, [12,7,17] 1, [12,8,17] 1, [12,9,17] 1, [12,10,17] 1, [12,5,18] 1, [12,6,18] 1, [12,7,18] 1, [12,8,18] 1, [12,9,18] 1, [12,10,18] 1, [12,5,19] 1, [12,6,19] 1, [12,7,19] 1, [12,8,19] 1, [12,9,19] 1, [12,10,19] 1, [12,5,21] 1, [12,6,21] 1, [12,7,21] 1, [12,8,21] 1, [12,9,21] 1, [12,10,21] 1, [12,5,22] 1, [12,6,22] 1, [12,7,22] 1, [12,8,22] 1, [12,9,22] 1, [12,10,22] 1, [12,5,23] 1, [12,6,23] 1, [12,7,23] 1, [12,8,23] 1, [12,9,23] 1, [12,10,23] 1, [12,5,24] 1, [12,6,24] 1, [12,7,24] 1, [12,8,24] 1, [12,9,24] 1, [12,10,24] 1, [12,5,25] 1, [12,6,25] 1, [12,7,25] 1, [12,8,25] 1, [12,9,25] 1, [12,10,25] 1, [12,5,26] 1, [12,6,26] 1, [12,7,26] 1, [12,8,26] 1, [12,9,26] 1, [12,10,26] 1, [12,5,28] 1, [12,6,28] 1, [12,7,28] 1, [12,8,28] 1, [12,9,28] 1, [12,10,28] 1, [1,2,1] 1, [1,3,1] 1, [1,4,1] 1, [1,5,1] 1, [1,6,1] 1, [1,7,1] 1, [1,1,2] 1, [1,2,2] 1, [1,3,2] 1, [1,4,2] 1, [1,5,2] 1, [1,6,2] 1, [1,7,2] 1, [1,8,2] 1, [1,9,2] 1, [1,10,2] 1, [1,2,3] 1, [1,3,3] 1, [1,4,3] 1, [1,5,3] 1, [1,6,3] 1, [1,7,3] 1, [1,8,3] 1, [1,9,3] 1, [1,10,3] 1, [1,1,4] 1, [1,2,4] 1, [1,3,4] 1, [1,4,4] 1, [1,5,4] 1, [1,6,4] 1, [1,7,4] 1, [1,8,4] 1, [1,9,4] 1, [1,10,4] 1, [1,1,5] 1, [1,2,5] 1, [1,3,5] 1, [1,4,5] 1, [1,5,5] 1, [1,6,5] 1, [1,7,5] 1, [1,8,5] 1, [1,9,5] 1, [1,10,5] 1, [1,3,8] 1, [1,4,8] 1, [1,5,8] 1, [1,6,8] 1, [1,7,8] 1, [1,8,8] 1, [1,9,8] 1, [1,3,9] 1, [1,4,9] 1, [1,5,9] 1, [1,6,9] 1, [1,7,9] 1, [1,8,9] 1, [1,9,9] 1, [1,3,11] 1, [1,4,11] 1, [1,5,11] 1, [1,6,11] 1, [1,7,11] 1, [1,8,11] 1, [1,9,11] 1, [1,2,12] 1, [1,3,12] 1, [1,4,12] 1, [1,5,12] 1, [1,6,12] 1, [1,7,12] 1, [1,8,12] 1, [1,9,12] 1, [1,2,13] 1, [1,3,13] 1, [1,4,13] 1, [1,5,13] 1, [1,6,13] 1, [1,7,13] 1, [1,8,13] 1, [1,9,13] 1, [1,2,14] 1, [1,3,14] 1, [1,4,14] 1, [1,5,14] 1, [1,6,14] 1, [1,7,14] 1, [1,8,14] 1, [1,9,14] 1, [1,1,15] 1, [1,2,15] 1, [1,3,15] 1, [1,4,15] 1, [1,5,15] 1, [1,6,15] 1, [1,7,15] 1, [1,8,15] 1, [1,9,15] 1, [1,10,15] 1, [1,1,17] 1, [1,2,17] 1, [1,3,17] 1, [1,4,17] 1, [1,5,17] 1, [1,6,17] 1, [1,7,17] 1, [1,8,17] 1, [1,9,17] 1, [1,10,17] 1, [1,1,18] 1, [1,2,18] 1, [1,3,18] 1, [1,4,18] 1, [1,5,18] 1, [1,6,18] 1, [1,7,18] 1, [1,8,18] 1, [1,9,18] 1, [1,1,19] 1, [1,2,19] 1, [1,3,19] 1, [1,4,19] 1, [1,5,19] 1, [1,6,19] 1, [1,7,19] 1, [1,8,19] 1, [1,9,19] 1, [1,1,20] 1, [1,2,20] 1, [1,3,20] 1, [1,4,20] 1, [1,5,20] 1, [1,6,20] 1, [1,7,20] 1, [1,8,20] 1, [1,9,20] 1, [1,1,24] 1, [1,2,24] 1, [1,3,24] 1, [1,4,24] 1, [1,5,24] 1, [1,6,24] 1, [1,7,24] 1, [1,8,24] 1, [1,9,24] 1, [1,10,24] 1, [1,3,26] 1, [1,4,26] 1, [1,5,26] 1, [1,6,26] 1, [1,7,26] 1, [1,8,26] 1, [1,9,26] 1, [1,10,26] 1, [1,2,27] 1, [1,3,27] 1, [1,4,27] 1, [1,5,27] 1, [1,6,27] 1, [1,7,27] 1, [1,8,27] 1, [1,9,27] 1, [1,10,27] 1, [1,3,28] 1, [1,4,28] 1, [1,5,28] 1, [1,6,28] 1, [1,7,28] 1, [1,8,28] 1, [1,9,28] 1, [1,10,28] 1, [2,3,2] 1, [2,4,2] 1, [2,5,2] 1, [2,6,2] 1, [2,7,2] 1, [2,8,2] 1, [2,9,2] 1, [2,1,3] 1, [2,2,3] 1, [2,3,3] 1, [2,4,3] 1, [2,5,3] 1, [2,6,3] 1, [2,7,3] 1, [2,8,3] 1, [2,9,3] 1, [2,10,3] 1, [2,3,4] 1, [2,4,4] 1, [2,5,4] 1, [2,6,4] 1, [2,7,4] 1, [2,8,4] 1, [2,9,4] 1, [2,10,4] 1, [2,2,5] 1, [2,3,5] 1, [2,4,5] 1, [2,5,5] 1, [2,6,5] 1, [2,7,5] 1, [2,10,5] 1, [2,2,6] 1, [2,3,6] 1, [2,4,6] 1, [2,5,6] 1, [2,6,6] 1, [2,7,6] 1, [2,8,6] 1, [2,9,6] 1, [2,1,7] 1, [2,2,7] 1, [2,3,7] 1, [2,4,7] 1, [2,5,7] 1, [2,6,7] 1, [2,7,7] 1, [2,8,7] 1, [2,9,7] 1, [2,2,8] 1, [2,3,8] 1, [2,4,8] 1, [2,5,8] 1, [2,6,8] 1, [2,7,8] 1, [2,1,9] 1, [2,2,9] 1, [2,3,9] 1, [2,4,9] 1, [2,5,9] 1, [2,6,9] 1, [2,7,9] 1, [2,8,9] 1, [2,9,9] 1, [2,10,9] 1, [2,1,11] 1, [2,2,11] 1, [2,3,11] 1, [2,4,11] 1, [2,5,11] 1, [2,6,11] 1, [2,7,11] 1, [2,8,11] 1, [2,9,11] 1, [2,10,11] 1, [2,1,12] 1, [2,3,12] 1, [2,4,12] 1, [2,5,12] 1, [2,6,12] 1, [2,7,12] 1, [2,8,12] 1, [2,9,12] 1, [2,10,12] 1, [2,1,13] 1, [2,3,13] 1, [2,4,13] 1, [2,5,13] 1, [2,6,13] 1, [2,7,13] 1, [2,8,13] 1, [2,9,13] 1, [2,10,13] 1, [2,1,15] 1, [2,2,15] 1, [2,3,15] 1, [2,4,15] 1, [2,5,15] 1, [2,6,15] 1, [2,7,15] 1, [2,8,15] 1, [2,9,15] 1, [2,10,15] 1, [2,1,16] 1, [2,2,16] 1, [2,3,16] 1, [2,4,16] 1, [2,5,16] 1, [2,6,16] 1, [2,7,16] 1, [2,8,16] 1, [2,9,16] 1, [2,10,16] 1, [2,1,17] 1, [2,2,17] 1, [2,3,17] 1, [2,4,17] 1, [2,5,17] 1, [2,6,17] 1, [2,7,17] 1, [2,8,17] 1, [2,9,17] 1, [2,10,17] 1, [2,3,20] 1, [2,4,20] 1, [2,5,20] 1, [2,6,20] 1, [2,7,20] 1, [2,8,20] 1, [2,9,20] 1, [2,10,20] 1, [2,3,21] 1, [2,4,21] 1, [2,5,21] 1, [2,6,21] 1, [2,7,21] 1, [2,8,21] 1, [2,9,21] 1, [2,10,21] 1, [2,1,22] 1, [2,2,22] 1, [2,3,22] 1, [2,4,22] 1, [2,5,22] 1, [2,6,22] 1, [2,7,22] 1, [2,8,22] 1, [2,9,22] 1, [2,10,22] 1, [2,1,24] 1, [2,2,24] 1, [2,3,24] 1, [2,4,24] 1, [2,5,24] 1, [2,6,24] 1, [2,7,24] 1, [2,8,24] 1, [2,9,24] 1, [2,10,24] 1, [2,1,25] 1, [2,2,25] 1, [2,3,25] 1, [2,4,25] 1, [2,5,25] 1, [2,6,25] 1, [2,7,25] 1, [2,8,25] 1, [2,9,25] 1, [2,1,26] 1, [2,2,26] 1, [2,3,26] 1, [2,4,26] 1, [2,5,26] 1, [2,6,26] 1, [2,7,26] 1, [2,8,26] 1, [2,9,26] 1, [2,1,27] 1, [2,2,27] 1, [2,3,27] 1, [2,4,27] 1, [2,5,27] 1, [2,6,27] 1, [2,7,27] 1, [2,8,27] 1, [2,9,27] 1, [3,1,1] 1, [3,2,1] 1, [3,3,1] 1, [3,4,1] 1, [3,5,1] 1, [3,6,1] 1, [3,7,1] 1, [3,8,1] 1, [3,9,1] 1, [3,1,3] 1, [3,2,3] 1, [3,3,3] 1, [3,4,3] 1, [3,5,3] 1, [3,6,3] 1, [3,7,3] 1, [3,8,3] 1, [3,9,3] 1, [3,10,3] 1, [3,1,4] 1, [3,2,4] 1, [3,3,4] 1, [3,4,4] 1, [3,5,4] 1, [3,6,4] 1, [3,7,4] 1, [3,8,4] 1, [3,9,4] 1, [3,10,4] 1, [3,1,5] 1, [3,2,5] 1, [3,3,5] 1, [3,4,5] 1, [3,5,5] 1, [3,6,5] 1, [3,7,5] 1, [3,8,5] 1, [3,9,5] 1, [3,1,6] 1, [3,2,6] 1, [3,3,6] 1, [3,4,6] 1, [3,5,6] 1, [3,6,6] 1, [3,7,6] 1, [3,8,6] 1, [3,9,6] 1, [3,1,8] 1, [3,2,8] 1, [3,3,8] 1, [3,4,8] 1, [3,5,8] 1, [3,6,8] 1, [3,7,8] 1, [3,1,9] 1, [3,2,9] 1, [3,3,9] 1, [3,4,9] 1, [3,5,9] 1, [3,6,9] 1, [3,7,9] 1, [3,8,9] 1, [3,9,9] 1, [3,10,9] 1, [3,1,11] 1, [3,2,11] 1, [3,3,11] 1, [3,4,11] 1, [3,5,11] 1, [3,6,11] 1, [3,7,11] 1, [3,8,11] 1, [3,9,11] 1, [3,10,11] 1, [3,1,12] 1, [3,3,12] 1, [3,4,12] 1, [3,5,12] 1, [3,6,12] 1, [3,7,12] 1, [3,8,12] 1, [3,9,12] 1, [3,10,12] 1, [3,1,13] 1, [3,3,13] 1, [3,4,13] 1, [3,5,13] 1, [3,6,13] 1, [3,7,13] 1, [3,8,13] 1, [3,9,13] 1, [3,10,13] 1, [3,1,15] 1, [3,2,15] 1, [3,3,15] 1, [3,4,15] 1, [3,5,15] 1, [3,6,15] 1, [3,7,15] 1, [3,8,15] 1, [3,9,15] 1, [3,10,15] 1, [3,1,16] 1, [3,2,16] 1, [3,3,16] 1, [3,4,16] 1, [3,5,16] 1, [3,6,16] 1, [3,7,16] 1, [3,8,16] 1, [3,9,16] 1, [3,10,16] 1, [3,1,17] 1, [3,2,17] 1, [3,3,17] 1, [3,4,17] 1, [3,5,17] 1, [3,6,17] 1, [3,7,17] 1, [3,8,17] 1, [3,9,17] 1, [3,10,17] 1, [3,3,20] 1, [3,4,20] 1, [3,5,20] 1, [3,6,20] 1, [3,7,20] 1, [3,8,20] 1, [3,9,20] 1, [3,10,20] 1, [3,3,21] 1, [3,4,21] 1, [3,5,21] 1, [3,6,21] 1, [3,7,21] 1, [3,8,21] 1, [3,9,21] 1, [3,10,21] 1, [3,1,22] 1, [3,2,22] 1, [3,3,22] 1, [3,4,22] 1, [3,5,22] 1, [3,6,22] 1, [3,7,22] 1, [3,8,22] 1, [3,9,22] 1, [3,10,22] 1, [3,1,24] 1, [3,2,24] 1, [3,3,24] 1, [3,4,24] 1, [3,5,24] 1, [3,6,24] 1, [3,7,24] 1, [3,8,24] 1, [3,9,24] 1, [3,10,24] 1, [3,1,25] 1, [3,2,25] 1, [3,3,25] 1, [3,4,25] 1, [3,5,25] 1, [3,6,25] 1, [3,7,25] 1, [3,8,25] 1, [3,9,25] 1, [3,1,26] 1, [3,2,26] 1, [3,3,26] 1, [3,4,26] 1, [3,5,26] 1, [3,6,26] 1, [3,7,26] 1, [3,8,26] 1, [3,9,26] 1, [3,1,27] 1, [3,2,27] 1, [3,3,27] 1, [3,4,27] 1, [3,5,27] 1, [3,6,27] 1, [3,7,27] 1, [3,8,27] 1, [3,9,27] 1, [10,1,6] 1, [10,2,6] 1, [10,3,6] 1, [10,4,6] 1, [10,5,6] 1, [10,6,6] 1, [10,7,6] 1, [10,8,6] 1, [10,9,6] 1, [10,10,6] 1, [10,1,7] 1, [10,2,7] 1, [10,3,7] 1, [10,4,7] 1, [10,5,7] 1, [10,6,7] 1, [10,7,7] 1, [10,8,7] 1, [10,9,7] 1, [10,10,7] 1, [10,1,13] 1, [10,2,13] 1, [10,3,13] 1, [10,4,13] 1, [10,5,13] 1, [10,6,13] 1, [10,7,13] 1, [10,8,13] 1, [10,9,13] 1, [10,10,13] 1, [10,1,14] 1, [10,2,14] 1, [10,3,14] 1, [10,4,14] 1, [10,5,14] 1, [10,6,14] 1, [10,7,14] 1, [10,8,14] 1, [10,9,14] 1, [10,10,14] 1, [10,1,20] 1, [10,2,20] 1, [10,3,20] 1, [10,4,20] 1, [10,5,20] 1, [10,6,20] 1, [10,7,20] 1, [10,8,20] 1, [10,9,20] 1, [10,10,20] 1, [10,1,21] 1, [10,2,21] 1, [10,3,21] 1, [10,4,21] 1, [10,5,21] 1, [10,6,21] 1, [10,7,21] 1, [10,8,21] 1, [10,9,21] 1, [10,10,21] 1, [10,1,27] 1, [10,2,27] 1, [10,3,27] 1, [10,4,27] 1, [10,5,27] 1, [10,6,27] 1, [10,7,27] 1, [10,8,27] 1, [10,9,27] 1, [10,10,27] 1, [10,1,28] 1, [10,2,28] 1, [10,3,28] 1, [10,4,28] 1, [10,5,28] 1, [10,6,28] 1, [10,7,28] 1, [10,8,28] 1, [10,9,28] 1, [10,10,28] 1, [11,5,1] 1, [11,6,1] 1, [11,7,1] 1, [11,8,1] 1, [11,9,1] 1, [11,10,1] 1, [11,5,2] 1, [11,6,2] 1, [11,7,2] 1, [11,8,2] 1, [11,9,2] 1, [11,10,2] 1, [11,5,3] 1, [11,6,3] 1, [11,7,3] 1, [11,8,3] 1, [11,9,3] 1, [11,10,3] 1, [11,5,4] 1, [11,6,4] 1, [11,7,4] 1, [11,8,4] 1, [11,9,4] 1, [11,10,4] 1, [11,5,5] 1, [11,6,5] 1, [11,7,5] 1, [11,8,5] 1, [11,9,5] 1, [11,10,5] 1, [11,5,6] 1, [11,6,6] 1, [11,7,6] 1, [11,8,6] 1, [11,9,6] 1, [11,10,6] 1, [11,5,8] 1, [11,6,8] 1, [11,7,8] 1, [11,8,8] 1, [11,9,8] 1, [11,10,8] 1, [11,5,9] 1, [11,6,9] 1, [11,7,9] 1, [11,8,9] 1, [11,9,9] 1, [11,10,9] 1, [11,5,10] 1, [11,6,10] 1, [11,7,10] 1, [11,8,10] 1, [11,9,10] 1, [11,10,10] 1, [11,5,11] 1, [11,6,11] 1, [11,7,11] 1, [11,8,11] 1, [11,9,11] 1, [11,10,11] 1, [11,5,12] 1, [11,6,12] 1, [11,7,12] 1, [11,8,12] 1, [11,9,12] 1, [11,10,12] 1, [11,5,13] 1, [11,6,13] 1, [11,7,13] 1, [11,8,13] 1, [11,9,13] 1, [11,10,13] 1, [11,5,15] 1, [11,6,15] 1, [11,7,15] 1, [11,8,15] 1, [11,9,15] 1, [11,10,15] 1, [11,5,16] 1, [11,6,16] 1, [11,7,16] 1, [11,8,16] 1, [11,9,16] 1, [11,10,16] 1, [11,5,17] 1, [11,6,17] 1, [11,7,17] 1, [11,8,17] 1, [11,9,17] 1, [11,10,17] 1, [11,5,18] 1, [11,6,18] 1, [11,7,18] 1, [11,8,18] 1, [11,9,18] 1, [11,10,18] 1, [11,5,19] 1, [11,6,19] 1, [11,7,19] 1, [11,8,19] 1, [11,9,19] 1, [11,10,19] 1, [11,5,20] 1, [11,6,20] 1, [11,7,20] 1, [11,8,20] 1, [11,9,20] 1, [11,10,20] 1, [11,5,22] 1, [11,6,22] 1, [11,7,22] 1, [11,8,22] 1, [11,9,22] 1, [11,10,22] 1, [11,5,23] 1, [11,6,23] 1, [11,7,23] 1, [11,8,23] 1, [11,9,23] 1, [11,10,23] 1, [11,5,24] 1, [11,6,24] 1, [11,7,24] 1, [11,8,24] 1, [11,9,24] 1, [11,10,24] 1, [11,5,25] 1, [11,6,25] 1, [11,7,25] 1, [11,8,25] 1, [11,9,25] 1, [11,10,25] 1, [11,5,26] 1, [11,6,26] 1, [11,7,26] 1, [11,8,26] 1, [11,9,26] 1, [11,10,26] 1, [11,5,27] 1, [11,6,27] 1, [11,7,27] 1, [11,8,27] 1, [11,9,27] 1, [11,10,27] 1, [4,1,1] 1, [4,2,1] 1, [4,3,1] 1, [4,4,1] 1, [4,5,1] 1, [4,6,1] 1, [4,7,1] 1, [4,8,1] 1, [4,9,1] 1, [4,10,1] 1, [4,1,2] 1, [4,2,2] 1, [4,3,2] 1, [4,4,2] 1, [4,5,2] 1, [4,6,2] 1, [4,7,2] 1, [4,8,2] 1, [4,9,2] 1, [4,10,2] 1, [4,3,5] 1, [4,4,5] 1, [4,5,5] 1, [4,6,5] 1, [4,7,5] 1, [4,8,5] 1, [4,9,5] 1, [4,10,5] 1, [4,2,6] 1, [4,3,6] 1, [4,4,6] 1, [4,5,6] 1, [4,6,6] 1, [4,7,6] 1, [4,8,6] 1, [4,9,6] 1, [4,10,6] 1, [4,1,7] 1, [4,2,7] 1, [4,3,7] 1, [4,4,7] 1, [4,5,7] 1, [4,6,7] 1, [4,7,7] 1, [4,8,7] 1, [4,9,7] 1, [4,10,7] 1, [4,1,8] 1, [4,2,8] 1, [4,3,8] 1, [4,4,8] 1, [4,5,8] 1, [4,6,8] 1, [4,7,8] 1, [4,8,8] 1, [4,1,10] 1, [4,2,10] 1, [4,3,10] 1, [4,4,10] 1, [4,5,10] 1, [4,6,10] 1, [4,7,10] 1, [4,8,10] 1, [4,9,10] 1, [4,10,10] 1, [4,1,11] 1, [4,2,11] 1, [4,3,11] 1, [4,4,11] 1, [4,5,11] 1, [4,6,11] 1, [4,7,11] 1, [4,8,11] 1, [4,9,11] 1, [4,1,12] 1, [4,2,12] 1, [4,3,12] 1, [4,4,12] 1, [4,5,12] 1, [4,6,12] 1, [4,7,12] 1, [4,8,12] 1, [4,9,12] 1, [4,1,13] 1, [4,2,13] 1, [4,3,13] 1, [4,4,13] 1, [4,5,13] 1, [4,6,13] 1, [4,7,13] 1, [4,8,13] 1, [4,9,13] 1, [4,3,15] 1, [4,4,15] 1, [4,5,15] 1, [4,6,15] 1, [4,7,15] 1, [4,8,15] 1, [4,9,15] 1, [4,3,16] 1, [4,4,16] 1, [4,5,16] 1, [4,6,16] 1, [4,7,16] 1, [4,8,16] 1, [4,9,16] 1, [4,3,18] 1, [4,4,18] 1, [4,5,18] 1, [4,6,18] 1, [4,7,18] 1, [4,8,18] 1, [4,9,18] 1, [4,2,19] 1, [4,3,19] 1, [4,4,19] 1, [4,5,19] 1, [4,6,19] 1, [4,7,19] 1, [4,8,19] 1, [4,9,19] 1, [4,2,20] 1, [4,3,20] 1, [4,4,20] 1, [4,5,20] 1, [4,6,20] 1, [4,7,20] 1, [4,8,20] 1, [4,9,20] 1, [4,1,21] 1, [4,2,21] 1, [4,3,21] 1, [4,4,21] 1, [4,5,21] 1, [4,6,21] 1, [4,7,21] 1, [4,8,21] 1, [4,9,21] 1, [4,1,22] 1, [4,2,22] 1, [4,3,22] 1, [4,4,22] 1, [4,5,22] 1, [4,6,22] 1, [4,1,23] 1, [4,2,23] 1, [4,3,23] 1, [4,4,23] 1, [4,5,23] 1, [4,6,23] 1, [4,7,23] 1, [4,8,23] 1, [4,9,23] 1, [4,10,23] 1, [4,1,25] 1, [4,2,25] 1, [4,3,25] 1, [4,4,25] 1, [4,5,25] 1, [4,6,25] 1, [4,7,25] 1, [4,8,25] 1, [4,9,25] 1, [4,10,25] 1, [4,1,26] 1, [4,3,26] 1, [4,4,26] 1, [4,5,26] 1, [4,6,26] 1, [4,7,26] 1, [4,8,26] 1, [4,9,26] 1, [4,10,26] 1, [4,1,27] 1, [4,3,27] 1, [4,4,27] 1, [4,5,27] 1, [4,6,27] 1, [4,7,27] 1, [4,8,27] 1, [4,9,27] 1, [4,10,27] 1, [5,3,3] 1, [5,4,3] 1, [5,5,3] 1, [5,6,3] 1, [5,7,3] 1, [5,8,3] 1, [5,9,3] 1, [5,3,4] 1, [5,4,4] 1, [5,5,4] 1, [5,6,4] 1, [5,7,4] 1, [5,8,4] 1, [5,9,4] 1, [5,10,4] 1, [5,6,5] 1, [5,7,5] 1, [5,8,5] 1, [5,9,5] 1, [5,10,5] 1, [5,4,6] 1, [5,5,6] 1, [5,6,6] 1, [5,7,6] 1, [5,8,6] 1, [5,9,6] 1, [5,10,6] 1, [5,4,7] 1, [5,5,7] 1, [5,6,7] 1, [5,7,7] 1, [5,8,7] 1, [5,9,7] 1, [5,10,7] 1, [5,3,8] 1, [5,4,8] 1, [5,5,8] 1, [5,6,8] 1, [5,7,8] 1, [5,8,8] 1, [5,9,8] 1, [5,3,9] 1, [5,4,9] 1, [5,5,9] 1, [5,6,9] 1, [5,7,9] 1, [5,8,9] 1, [5,9,9] 1, [5,3,10] 1, [5,4,10] 1, [5,5,10] 1, [5,6,10] 1, [5,7,10] 1, [5,8,10] 1, [5,9,10] 1, [5,10,10] 1, [5,3,13] 1, [5,4,13] 1, [5,5,13] 1, [5,6,13] 1, [5,7,13] 1, [5,8,13] 1, [5,9,13] 1, [5,3,14] 1, [5,4,14] 1, [5,5,14] 1, [5,6,14] 1, [5,7,14] 1, [5,8,14] 1, [5,9,14] 1, [5,2,17] 1, [5,3,17] 1, [5,4,17] 1, [5,5,17] 1, [5,6,17] 1, [5,7,17] 1, [5,8,17] 1, [5,9,17] 1, [5,2,18] 1, [5,3,18] 1, [5,4,18] 1, [5,5,18] 1, [5,6,18] 1, [5,7,18] 1, [5,8,18] 1, [5,9,18] 1, [5,10,18] 1, [5,6,19] 1, [5,7,19] 1, [5,8,19] 1, [5,9,19] 1, [5,10,19] 1, [5,4,20] 1, [5,5,20] 1, [5,6,20] 1, [5,7,20] 1, [5,8,20] 1, [5,9,20] 1, [5,10,20] 1, [5,4,21] 1, [5,5,21] 1, [5,6,21] 1, [5,7,21] 1, [5,8,21] 1, [5,9,21] 1, [5,10,21] 1, [5,3,22] 1, [5,4,22] 1, [5,5,22] 1, [5,6,22] 1, [5,7,22] 1, [5,8,22] 1, [5,9,22] 1, [5,3,23] 1, [5,4,23] 1, [5,5,23] 1, [5,6,23] 1, [5,7,23] 1, [5,8,23] 1, [5,9,23] 1, [5,3,24] 1, [5,4,24] 1, [5,5,24] 1, [5,6,24] 1, [5,7,24] 1, [5,8,24] 1, [5,9,24] 1, [5,10,24] 1, [5,3,27] 1, [5,4,27] 1, [5,5,27] 1, [5,6,27] 1, [5,7,27] 1, [5,8,27] 1, [5,9,27] 1, [5,3,28] 1, [5,4,28] 1, [5,5,28] 1, [5,6,28] 1, [5,7,28] 1, [5,8,28] 1, [5,9,28] 1, [9,7,5] 1, [9,8,5] 1, [9,9,5] 1, [9,10,5] 1, [9,7,12] 1, [9,8,12] 1, [9,9,12] 1, [9,10,12] 1, [9,1,13] 1, [9,2,13] 1, [9,3,13] 1, [9,4,13] 1, [9,5,13] 1, [9,6,13] 1, [9,7,13] 1, [9,8,13] 1, [9,9,13] 1, [9,10,13] 1, [9,1,14] 1, [9,2,14] 1, [9,3,14] 1, [9,4,14] 1, [9,5,14] 1, [9,6,14] 1, [9,7,14] 1, [9,8,14] 1, [9,9,14] 1, [9,10,14] 1, [9,7,19] 1, [9,8,19] 1, [9,9,19] 1, [9,10,19] 1, [9,1,20] 1, [9,2,20] 1, [9,3,20] 1, [9,4,20] 1, [9,5,20] 1, [9,6,20] 1, [9,7,20] 1, [9,8,20] 1, [9,9,20] 1, [9,10,20] 1, [9,1,21] 1, [9,2,21] 1, [9,3,21] 1, [9,4,21] 1, [9,5,21] 1, [9,6,21] 1, [9,7,21] 1, [9,8,21] 1, [9,9,21] 1, [9,10,21] 1, [9,7,26] 1, [9,8,26] 1, [9,9,26] 1, [9,10,26] 1, [9,1,27] 1, [9,2,27] 1, [9,3,27] 1, [9,4,27] 1, [9,5,27] 1, [9,6,27] 1, [9,7,27] 1, [9,8,27] 1, [9,9,27] 1, [9,10,27] 1, [9,1,28] 1, [9,2,28] 1, [9,3,28] 1, [9,4,28] 1, [9,5,28] 1, [9,6,28] 1, [9,7,28] 1, [9,8,28] 1, [9,9,28] 1, [9,10,28] 1, [7,3,1] 1, [7,4,1] 1, [7,5,1] 1, [7,6,1] 1, [7,7,1] 1, [7,8,1] 1, [7,9,1] 1, [7,3,2] 1, [7,4,2] 1, [7,5,2] 1, [7,6,2] 1, [7,7,2] 1, [7,8,2] 1, [7,9,2] 1, [7,3,3] 1, [7,4,3] 1, [7,5,3] 1, [7,6,3] 1, [7,7,3] 1, [7,8,3] 1, [7,9,3] 1, [7,10,3] 1, [7,3,6] 1, [7,4,6] 1, [7,5,6] 1, [7,6,6] 1, [7,7,6] 1, [7,8,6] 1, [7,9,6] 1, [7,3,7] 1, [7,4,7] 1, [7,5,7] 1, [7,6,7] 1, [7,7,7] 1, [7,8,7] 1, [7,9,7] 1, [7,3,9] 1, [7,4,9] 1, [7,5,9] 1, [7,6,9] 1, [7,7,9] 1, [7,8,9] 1, [7,9,9] 1, [7,4,10] 1, [7,5,10] 1, [7,6,10] 1, [7,7,10] 1, [7,8,10] 1, [7,9,10] 1, [7,10,10] 1, [7,3,11] 1, [7,4,11] 1, [7,5,11] 1, [7,6,11] 1, [7,7,11] 1, [7,8,11] 1, [7,9,11] 1, [7,10,11] 1, [7,2,12] 1, [7,3,12] 1, [7,4,12] 1, [7,5,12] 1, [7,6,12] 1, [7,7,12] 1, [7,10,12] 1, [7,2,13] 1, [7,3,13] 1, [7,4,13] 1, [7,5,13] 1, [7,6,13] 1, [7,7,13] 1, [7,8,13] 1, [7,3,16] 1, [7,4,16] 1, [7,5,16] 1, [7,6,16] 1, [7,7,16] 1, [7,8,16] 1, [7,9,16] 1, [7,4,17] 1, [7,5,17] 1, [7,6,17] 1, [7,7,17] 1, [7,8,17] 1, [7,9,17] 1, [7,10,17] 1, [7,3,18] 1, [7,4,18] 1, [7,5,18] 1, [7,6,18] 1, [7,7,18] 1, [7,8,18] 1, [7,9,18] 1, [7,10,18] 1, [7,2,19] 1, [7,3,19] 1, [7,4,19] 1, [7,5,19] 1, [7,6,19] 1, [7,7,19] 1, [7,10,19] 1, [7,2,20] 1, [7,3,20] 1, [7,4,20] 1, [7,5,20] 1, [7,6,20] 1, [7,7,20] 1, [7,8,20] 1, [7,3,22] 1, [7,4,22] 1, [7,5,22] 1, [7,6,22] 1, [7,7,22] 1, [7,8,22] 1, [7,9,22] 1, [7,3,23] 1, [7,4,23] 1, [7,5,23] 1, [7,6,23] 1, [7,7,23] 1, [7,8,23] 1, [7,9,23] 1, [7,3,24] 1, [7,4,24] 1, [7,5,24] 1, [7,6,24] 1, [7,7,24] 1, [7,8,24] 1, [7,9,24] 1, [7,10,24] 1, [7,3,27] 1, [7,4,27] 1, [7,5,27] 1, [7,6,27] 1, [7,7,27] 1, [7,8,27] 1, [7,9,27] 1, [7,3,28] 1, [7,4,28] 1, [7,5,28] 1, [7,6,28] 1, [7,7,28] 1, [7,8,28] 1, [7,9,28] 1	[1,1,1] 1, [2,1,1] 1, [3,1,1] 1, [4,1,1] 2, [5,1,1] 2, [6,1,1] 2, [7,1,1] 2,[8,1,1] 1,[9,1,1] 0, [10,1,1] 0, [11,1,1] 0, [12,1,1] 0	[1,1,1,1] 179693, [1,2,1,1] 179693, [1,3,1,1] 179693, [1,4,1,1] 179693, [1,5,1,1] 179693, [1,6,1,1] 179693, [1,7,1,1] 179693, [1,8,1,1] 179693, [1,9,1,1] 179693, [1,10,1,1] 179693, [1,1,2,1] 235679, [1,2,2,1] 235679, [1,3,2,1] 235679, [1,4,2,1] 235679, [1,5,2,1] 235679, [1,6,2,1] 235679, [1,7,2,1] 235679, [1,8,2,1] 235679, [1,9,2,1] 235679, [1,10,2,1] 235679, [1,1,3,1] 369141, [1,2,3,1] 369141, [1,3,3,1] 369141, [1,4,3,1] 369141, [1,5,3,1] 369141, [1,6,3,1] 369141, [1,7,3,1] 369141, [1,8,3,1] 369141, [1,9,3,1] 369141, [1,10,3,1] 369141, [1,1,4,1] 194682, [1,2,4,1] 194682, [1,3,4,1] 194682, [1,4,4,1] 194682, [1,5,4,1] 194682, [1,6,4,1] 194682, [1,7,4,1] 194682, [1,8,4,1] 194682, [1,9,4,1] 194682, [1,10,4,1] 194682, [1,1,5,1] 262670, [1,2,5,1] 262670, [1,3,5,1] 262670, [1,4,5,1] 262670, [1,5,5,1] 262670, [1,6,5,1] 262670, [1,7,5,1] 262670, [1,8,5,1] 262670, [1,9,5,1] 262670, [1,10,5,1] 262670, [1,1,6,1] 522992, [1,2,6,1] 522992, [1,3,6,1] 522992, [1,4,6,1] 522992, [1,5,6,1] 522992, [1,6,6,1] 522992, [1,7,6,1] 522992, [1,8,6,1] 522992, [1,9,6,1] 522992, [1,10,6,1] 522992, [1,1,7,1] 719789, [1,2,7,1] 719789, [1,3,7,1] 719789, [1,4,7,1] 719789, [1,5,7,1] 719789, [1,6,7,1] 719789, [1,7,7,1] 719789, [1,8,7,1] 719789, [1,9,7,1] 719789, [1,10,7,1] 719789, [1,1,8,1] 196384, [1,2,8,1] 196384, [1,3,8,1] 196384, [1,4,8,1] 196384, [1,5,8,1] 196384, [1,6,8,1] 196384, [1,7,8,1] 196384, [1,8,8,1] 196384, [1,9,8,1] 196384, [1,10,8,1] 196384, [1,1,9,1] 278886, [1,2,9,1] 278886, [1,3,9,1] 278886, [1,4,9,1] 278886, [1,5,9,1] 278886, [1,6,9,1] 278886, [1,7,9,1] 278886, [1,8,9,1] 278886, [1,9,9,1] 278886, [1,10,9,1] 278886, [1,1,10,1] 133167, [1,2,10,1] 133167, [1,3,10,1] 133167, [1,4,10,1] 133167, [1,5,10,1] 133167, [1,6,10,1] 133167, [1,7,10,1] 133167, [1,8,10,1] 133167, [1,9,10,1] 133167, [1,10,10,1] 133167, [1,1,11,1] 507217, [1,2,11,1] 507217, [1,3,11,1] 507217, [1,4,11,1] 507217, [1,5,11,1] 507217, [1,6,11,1] 507217, [1,7,11,1] 507217, [1,8,11,1] 507217, [1,9,11,1] 507217, [1,10,11,1] 507217, [1,1,12,1] 271698, [1,2,12,1] 271698, [1,3,12,1] 271698, [1,4,12,1] 271698, [1,5,12,1] 271698, [1,6,12,1] 271698, [1,7,12,1] 271698, [1,8,12,1] 271698, [1,9,12,1] 271698, [1,10,12,1] 271698, [1,1,13,1] 320731, [1,2,13,1] 320731, [1,3,13,1] 320731, [1,4,13,1] 320731, [1,5,13,1] 320731, [1,6,13,1] 320731, [1,7,13,1] 320731, [1,8,13,1] 320731, [1,9,13,1] 320731, [1,10,13,1] 320731, [1,1,14,1] 440268, [1,2,14,1] 440268, [1,3,14,1] 440268, [1,4,14,1] 440268, [1,5,14,1] 440268, [1,6,14,1] 440268, [1,7,14,1] 440268, [1,8,14,1] 440268, [1,9,14,1] 440268, [1,10,14,1] 440268, [1,1,15,1] 219037, [1,2,15,1] 219037, [1,3,15,1] 219037, [1,4,15,1] 219037, [1,5,15,1] 219037, [1,6,15,1] 219037, [1,7,15,1] 219037, [1,8,15,1] 219037, [1,9,15,1] 219037, [1,10,15,1] 219037, [1,1,16,1] 471763, [1,2,16,1] 471763, [1,3,16,1] 471763, [1,4,16,1] 471763, [1,5,16,1] 471763, [1,6,16,1] 471763, [1,7,16,1] 471763, [1,8,16,1] 471763, [1,9,16,1] 471763, [1,10,16,1] 471763, [1,1,17,1] 144976, [1,2,17,1] 144976, [1,3,17,1] 144976, [1,4,17,1] 144976, [1,5,17,1] 144976, [1,6,17,1] 144976, [1,7,17,1] 144976, [1,8,17,1] 144976, [1,9,17,1] 144976, [1,10,17,1] 144976, [1,1,18,1] 214807, [1,2,18,1] 214807, [1,3,18,1] 214807, [1,4,18,1] 214807, [1,5,18,1] 214807, [1,6,18,1] 214807, [1,7,18,1] 214807, [1,8,18,1] 214807, [1,9,18,1] 214807, [1,10,18,1] 214807, [1,1,19,1] 188316, [1,2,19,1] 188316, [1,3,19,1] 188316, [1,4,19,1] 188316, [1,5,19,1] 188316, [1,6,19,1] 188316, [1,7,19,1] 188316, [1,8,19,1] 188316, [1,9,19,1] 188316, [1,10,19,1] 188316, [1,1,20,1] 359374, [1,2,20,1] 359374, [1,3,20,1] 359374, [1,4,20,1] 359374, [1,5,20,1] 359374, [1,6,20,1] 359374, [1,7,20,1] 359374, [1,8,20,1] 359374, [1,9,20,1] 359374, [1,10,20,1] 359374, [1,1,21,1] 519884, [1,2,21,1] 519884, [1,3,21,1] 519884, [1,4,21,1] 519884, [1,5,21,1] 519884, [1,6,21,1] 519884, [1,7,21,1] 519884, [1,8,21,1] 519884, [1,9,21,1] 519884, [1,10,21,1] 519884, [1,1,22,1] 248997, [1,2,22,1] 248997, [1,3,22,1] 248997, [1,4,22,1] 248997, [1,5,22,1] 248997, [1,6,22,1] 248997, [1,7,22,1] 248997, [1,8,22,1] 248997, [1,9,22,1] 248997, [1,10,22,1] 248997, [1,1,23,1] 202435, [1,2,23,1] 202435, [1,3,23,1] 202435, [1,4,23,1] 202435, [1,5,23,1] 202435, [1,6,23,1] 202435, [1,7,23,1] 202435, [1,8,23,1] 202435, [1,9,23,1] 202435, [1,10,23,1] 202435, [1,1,24,1] 196126, [1,2,24,1] 196126, [1,3,24,1] 196126, [1,4,24,1] 196126, [1,5,24,1] 196126, [1,6,24,1] 196126, [1,7,24,1] 196126, [1,8,24,1] 196126, [1,9,24,1] 196126, [1,10,24,1] 196126, [1,1,25,1] 229901, [1,2,25,1] 229901, [1,3,25,1] 229901, [1,4,25,1] 229901, [1,5,25,1] 229901, [1,6,25,1] 229901, [1,7,25,1] 229901, [1,8,25,1] 229901, [1,9,25,1] 229901, [1,10,25,1] 229901, [1,1,26,1] 189983, [1,2,26,1] 189983, [1,3,26,1] 189983, [1,4,26,1] 189983, [1,5,26,1] 189983, [1,6,26,1] 189983, [1,7,26,1] 189983, [1,8,26,1] 189983, [1,9,26,1] 189983, [1,10,26,1] 189983, [1,1,27,1] 408877, [1,2,27,1] 408877, [1,3,27,1] 408877, [1,4,27,1] 408877, [1,5,27,1] 408877, [1,6,27,1] 408877, [1,7,27,1] 408877, [1,8,27,1] 408877, [1,9,27,1] 408877, [1,10,27,1] 408877, [1,1,28,1] 404133, [1,2,28,1] 404133, [1,3,28,1] 404133, [1,4,28,1] 404133, [1,5,28,1] 404133, [1,6,28,1] 404133, [1,7,28,1] 404133, [1,8,28,1] 404133, [1,9,28,1] 404133, [1,10,28,1] 404133	2018-05-16 19:59:43.577779	2018-05-16 19:59:43.577779	1	2018
33	30	12	1	28	10	2500	65000		[1,6] 95000,[2,6] 95000,[3,6] 95000,[4,6] 95000,[5,6] 95000,[6,6] 95000,[7,6] 95000,[8,6] 95000,[9,6] 95000,[10,6] 95000,[1,7] 95000,[2,7] 95000,[3,7] 95000,[4,7] 95000,[5,7] 95000,[6,7] 95000,[7,7] 95000,[8,7] 95000,[9,7] 95000,[10,7] 95000,[1,13] 95000,[2,13] 95000,[3,13] 95000,[4,13] 95000,[5,13] 95000,[6,13] 95000,[7,13] 95000,[8,13] 95000,[9,13] 95000,[10,13] 95000,[1,14] 95000,[2,14] 95000,[3,14] 95000,[4,14] 95000,[5,14] 95000,[6,14] 95000,[7,14] 95000,[8,14] 95000,[9,14] 95000,[10,14] 95000,[1,20] 95000,[2,20] 95000,[3,20] 95000,[4,20] 95000,[5,20] 95000,[6,20] 95000,[7,20] 95000,[8,20] 95000,[9,20] 95000,[10,20] 95000,[1,21] 95000,[2,21] 95000,[3,21] 95000,[4,21] 95000,[5,21] 95000,[6,21] 95000,[7,21] 95000,[8,21] 95000,[9,21] 95000,[10,21] 95000,[1,27] 95000,[2,27] 95000,[3,27] 95000,[4,27] 95000,[5,27] 95000,[6,27] 95000,[7,27] 95000,[8,27] 95000,[9,27] 95000,[10,27] 95000,[1,28] 95000,[2,28] 95000,[3,28] 95000,[4,28] 95000,[5,28] 95000,[6,28] 95000,[7,28] 95000,[8,28] 95000,[9,28] 95000,[10,28] 95000	[1] 1, [2] 1	[2] 1, [3] 1, [4] 1, [5] 1	2	[6,3,2] 1, [6,4,2] 1, [6,5,2] 1, [6,6,2] 1, [6,7,2] 1, [6,8,2] 1, [6,9,2] 1, [6,4,3] 1, [6,5,3] 1, [6,6,3] 1, [6,7,3] 1, [6,8,3] 1, [6,9,3] 1, [6,3,4] 1, [6,4,4] 1, [6,5,4] 1, [6,6,4] 1, [6,7,4] 1, [6,8,4] 1, [6,9,4] 1, [6,10,4] 1, [6,2,5] 1, [6,3,5] 1, [6,4,5] 1, [6,5,5] 1, [6,6,5] 1, [6,7,5] 1, [6,10,5] 1, [6,2,6] 1, [6,3,6] 1, [6,4,6] 1, [6,5,6] 1, [6,6,6] 1, [6,7,6] 1, [6,8,6] 1, [6,3,9] 1, [6,4,9] 1, [6,5,9] 1, [6,6,9] 1, [6,7,9] 1, [6,8,9] 1, [6,9,9] 1, [6,10,9] 1, [6,4,11] 1, [6,5,11] 1, [6,6,11] 1, [6,7,11] 1, [6,8,11] 1, [6,9,11] 1, [6,10,11] 1, [6,2,12] 1, [6,3,12] 1, [6,4,12] 1, [6,5,12] 1, [6,6,12] 1, [6,7,12] 1, [6,8,12] 1, [6,9,12] 1, [6,10,12] 1, [6,2,13] 1, [6,3,13] 1, [6,4,13] 1, [6,5,13] 1, [6,6,13] 1, [6,7,13] 1, [6,8,13] 1, [6,9,13] 1, [6,10,13] 1, [6,6,14] 1, [6,7,14] 1, [6,8,14] 1, [6,9,14] 1, [6,10,14] 1, [6,3,16] 1, [6,4,16] 1, [6,5,16] 1, [6,6,16] 1, [6,7,16] 1, [6,8,16] 1, [6,9,16] 1, [6,4,17] 1, [6,5,17] 1, [6,6,17] 1, [6,7,17] 1, [6,8,17] 1, [6,9,17] 1, [6,10,17] 1, [6,3,18] 1, [6,4,18] 1, [6,5,18] 1, [6,6,18] 1, [6,7,18] 1, [6,8,18] 1, [6,9,18] 1, [6,10,18] 1, [6,2,19] 1, [6,3,19] 1, [6,4,19] 1, [6,5,19] 1, [6,6,19] 1, [6,7,19] 1, [6,10,19] 1, [6,2,20] 1, [6,3,20] 1, [6,4,20] 1, [6,5,20] 1, [6,6,20] 1, [6,7,20] 1, [6,8,20] 1, [6,3,23] 1, [6,4,23] 1, [6,5,23] 1, [6,6,23] 1, [6,7,23] 1, [6,8,23] 1, [6,9,23] 1, [6,10,23] 1, [6,4,25] 1, [6,5,25] 1, [6,6,25] 1, [6,7,25] 1, [6,8,25] 1, [6,9,25] 1, [6,10,25] 1, [6,3,26] 1, [6,4,26] 1, [6,5,26] 1, [6,6,26] 1, [6,7,26] 1, [6,8,26] 1, [6,9,26] 1, [6,10,26] 1, [6,3,27] 1, [6,4,27] 1, [6,5,27] 1, [6,6,27] 1, [6,7,27] 1, [6,8,27] 1, [6,9,27] 1, [6,10,27] 1, [6,6,28] 1, [6,7,28] 1, [6,8,28] 1, [6,9,28] 1, [6,10,28] 1, [8,1,1] 1, [8,2,1] 1, [8,3,1] 1, [8,4,1] 1, [8,5,1] 1, [8,6,1] 1, [8,7,1] 1, [8,8,1] 1, [8,9,1] 1, [8,10,1] 1, [8,5,5] 1, [8,6,5] 1, [8,7,5] 1, [8,8,5] 1, [8,9,5] 1, [8,10,5] 1, [8,1,6] 1, [8,2,6] 1, [8,3,6] 1, [8,4,6] 1, [8,5,6] 1, [8,6,6] 1, [8,7,6] 1, [8,8,6] 1, [8,9,6] 1, [8,10,6] 1, [8,1,7] 1, [8,2,7] 1, [8,3,7] 1, [8,4,7] 1, [8,5,7] 1, [8,6,7] 1, [8,7,7] 1, [8,8,7] 1, [8,9,7] 1, [8,10,7] 1, [8,1,8] 1, [8,2,8] 1, [8,3,8] 1, [8,4,8] 1, [8,5,8] 1, [8,6,8] 1, [8,7,8] 1, [8,8,8] 1, [8,3,10] 1, [8,4,10] 1, [8,5,10] 1, [8,6,10] 1, [8,7,10] 1, [8,8,10] 1, [8,3,11] 1, [8,4,11] 1, [8,5,11] 1, [8,6,11] 1, [8,7,11] 1, [8,8,11] 1, [8,3,12] 1, [8,4,12] 1, [8,5,12] 1, [8,6,12] 1, [8,7,12] 1, [8,8,12] 1, [8,1,14] 1, [8,2,14] 1, [8,3,14] 1, [8,4,14] 1, [8,5,14] 1, [8,6,14] 1, [8,7,14] 1, [8,8,14] 1, [8,9,14] 1, [8,10,14] 1, [8,1,15] 1, [8,2,15] 1, [8,3,15] 1, [8,4,15] 1, [8,5,15] 1, [8,6,15] 1, [8,7,15] 1, [8,8,15] 1, [8,9,15] 1, [8,10,15] 1, [8,5,19] 1, [8,6,19] 1, [8,7,19] 1, [8,8,19] 1, [8,9,19] 1, [8,10,19] 1, [8,1,20] 1, [8,2,20] 1, [8,3,20] 1, [8,4,20] 1, [8,5,20] 1, [8,6,20] 1, [8,7,20] 1, [8,8,20] 1, [8,9,20] 1, [8,10,20] 1, [8,1,21] 1, [8,2,21] 1, [8,3,21] 1, [8,4,21] 1, [8,5,21] 1, [8,6,21] 1, [8,7,21] 1, [8,8,21] 1, [8,9,21] 1, [8,10,21] 1, [8,1,22] 1, [8,2,22] 1, [8,3,22] 1, [8,4,22] 1, [8,5,22] 1, [8,6,22] 1, [8,7,22] 1, [8,8,22] 1, [8,3,24] 1, [8,4,24] 1, [8,5,24] 1, [8,6,24] 1, [8,7,24] 1, [8,8,24] 1, [8,3,25] 1, [8,4,25] 1, [8,5,25] 1, [8,6,25] 1, [8,7,25] 1, [8,8,25] 1, [8,3,26] 1, [8,4,26] 1, [8,5,26] 1, [8,6,26] 1, [8,7,26] 1, [8,8,26] 1, [8,1,28] 1, [8,2,28] 1, [8,3,28] 1, [8,4,28] 1, [8,5,28] 1, [8,6,28] 1, [8,7,28] 1, [8,8,28] 1, [8,9,28] 1, [8,10,28] 1, [12,5,1] 1, [12,6,1] 1, [12,7,1] 1, [12,8,1] 1, [12,9,1] 1, [12,10,1] 1, [12,5,2] 1, [12,6,2] 1, [12,7,2] 1, [12,8,2] 1, [12,9,2] 1, [12,10,2] 1, [12,5,3] 1, [12,6,3] 1, [12,7,3] 1, [12,8,3] 1, [12,9,3] 1, [12,10,3] 1, [12,5,4] 1, [12,6,4] 1, [12,7,4] 1, [12,8,4] 1, [12,9,4] 1, [12,10,4] 1, [12,5,5] 1, [12,6,5] 1, [12,7,5] 1, [12,8,5] 1, [12,9,5] 1, [12,10,5] 1, [12,5,7] 1, [12,6,7] 1, [12,7,7] 1, [12,8,7] 1, [12,9,7] 1, [12,10,7] 1, [12,5,8] 1, [12,6,8] 1, [12,7,8] 1, [12,8,8] 1, [12,9,8] 1, [12,10,8] 1, [12,5,9] 1, [12,6,9] 1, [12,7,9] 1, [12,8,9] 1, [12,9,9] 1, [12,10,9] 1, [12,5,10] 1, [12,6,10] 1, [12,7,10] 1, [12,8,10] 1, [12,9,10] 1, [12,10,10] 1, [12,5,11] 1, [12,6,11] 1, [12,7,11] 1, [12,8,11] 1, [12,9,11] 1, [12,10,11] 1, [12,5,12] 1, [12,6,12] 1, [12,7,12] 1, [12,8,12] 1, [12,9,12] 1, [12,10,12] 1, [12,5,14] 1, [12,6,14] 1, [12,7,14] 1, [12,8,14] 1, [12,9,14] 1, [12,10,14] 1, [12,5,15] 1, [12,6,15] 1, [12,7,15] 1, [12,8,15] 1, [12,9,15] 1, [12,10,15] 1, [12,5,16] 1, [12,6,16] 1, [12,7,16] 1, [12,8,16] 1, [12,9,16] 1, [12,10,16] 1, [12,5,17] 1, [12,6,17] 1, [12,7,17] 1, [12,8,17] 1, [12,9,17] 1, [12,10,17] 1, [12,5,18] 1, [12,6,18] 1, [12,7,18] 1, [12,8,18] 1, [12,9,18] 1, [12,10,18] 1, [12,5,19] 1, [12,6,19] 1, [12,7,19] 1, [12,8,19] 1, [12,9,19] 1, [12,10,19] 1, [12,5,21] 1, [12,6,21] 1, [12,7,21] 1, [12,8,21] 1, [12,9,21] 1, [12,10,21] 1, [12,5,22] 1, [12,6,22] 1, [12,7,22] 1, [12,8,22] 1, [12,9,22] 1, [12,10,22] 1, [12,5,23] 1, [12,6,23] 1, [12,7,23] 1, [12,8,23] 1, [12,9,23] 1, [12,10,23] 1, [12,5,24] 1, [12,6,24] 1, [12,7,24] 1, [12,8,24] 1, [12,9,24] 1, [12,10,24] 1, [12,5,25] 1, [12,6,25] 1, [12,7,25] 1, [12,8,25] 1, [12,9,25] 1, [12,10,25] 1, [12,5,26] 1, [12,6,26] 1, [12,7,26] 1, [12,8,26] 1, [12,9,26] 1, [12,10,26] 1, [12,5,28] 1, [12,6,28] 1, [12,7,28] 1, [12,8,28] 1, [12,9,28] 1, [12,10,28] 1, [1,2,1] 1, [1,3,1] 1, [1,4,1] 1, [1,5,1] 1, [1,6,1] 1, [1,7,1] 1, [1,1,2] 1, [1,2,2] 1, [1,3,2] 1, [1,4,2] 1, [1,5,2] 1, [1,6,2] 1, [1,7,2] 1, [1,8,2] 1, [1,9,2] 1, [1,10,2] 1, [1,2,3] 1, [1,3,3] 1, [1,4,3] 1, [1,5,3] 1, [1,6,3] 1, [1,7,3] 1, [1,8,3] 1, [1,9,3] 1, [1,10,3] 1, [1,1,4] 1, [1,2,4] 1, [1,3,4] 1, [1,4,4] 1, [1,5,4] 1, [1,6,4] 1, [1,7,4] 1, [1,8,4] 1, [1,9,4] 1, [1,10,4] 1, [1,1,5] 1, [1,2,5] 1, [1,3,5] 1, [1,4,5] 1, [1,5,5] 1, [1,6,5] 1, [1,7,5] 1, [1,8,5] 1, [1,9,5] 1, [1,10,5] 1, [1,3,8] 1, [1,4,8] 1, [1,5,8] 1, [1,6,8] 1, [1,7,8] 1, [1,8,8] 1, [1,9,8] 1, [1,3,9] 1, [1,4,9] 1, [1,5,9] 1, [1,6,9] 1, [1,7,9] 1, [1,8,9] 1, [1,9,9] 1, [1,3,11] 1, [1,4,11] 1, [1,5,11] 1, [1,6,11] 1, [1,7,11] 1, [1,8,11] 1, [1,9,11] 1, [1,2,12] 1, [1,3,12] 1, [1,4,12] 1, [1,5,12] 1, [1,6,12] 1, [1,7,12] 1, [1,8,12] 1, [1,9,12] 1, [1,2,13] 1, [1,3,13] 1, [1,4,13] 1, [1,5,13] 1, [1,6,13] 1, [1,7,13] 1, [1,8,13] 1, [1,9,13] 1, [1,2,14] 1, [1,3,14] 1, [1,4,14] 1, [1,5,14] 1, [1,6,14] 1, [1,7,14] 1, [1,8,14] 1, [1,9,14] 1, [1,1,15] 1, [1,2,15] 1, [1,3,15] 1, [1,4,15] 1, [1,5,15] 1, [1,6,15] 1, [1,7,15] 1, [1,8,15] 1, [1,9,15] 1, [1,10,15] 1, [1,1,17] 1, [1,2,17] 1, [1,3,17] 1, [1,4,17] 1, [1,5,17] 1, [1,6,17] 1, [1,7,17] 1, [1,8,17] 1, [1,9,17] 1, [1,10,17] 1, [1,1,18] 1, [1,2,18] 1, [1,3,18] 1, [1,4,18] 1, [1,5,18] 1, [1,6,18] 1, [1,7,18] 1, [1,8,18] 1, [1,9,18] 1, [1,1,19] 1, [1,2,19] 1, [1,3,19] 1, [1,4,19] 1, [1,5,19] 1, [1,6,19] 1, [1,7,19] 1, [1,8,19] 1, [1,9,19] 1, [1,1,20] 1, [1,2,20] 1, [1,3,20] 1, [1,4,20] 1, [1,5,20] 1, [1,6,20] 1, [1,7,20] 1, [1,8,20] 1, [1,9,20] 1, [1,1,24] 1, [1,2,24] 1, [1,3,24] 1, [1,4,24] 1, [1,5,24] 1, [1,6,24] 1, [1,7,24] 1, [1,8,24] 1, [1,9,24] 1, [1,10,24] 1, [1,3,26] 1, [1,4,26] 1, [1,5,26] 1, [1,6,26] 1, [1,7,26] 1, [1,8,26] 1, [1,9,26] 1, [1,10,26] 1, [1,2,27] 1, [1,3,27] 1, [1,4,27] 1, [1,5,27] 1, [1,6,27] 1, [1,7,27] 1, [1,8,27] 1, [1,9,27] 1, [1,10,27] 1, [1,3,28] 1, [1,4,28] 1, [1,5,28] 1, [1,6,28] 1, [1,7,28] 1, [1,8,28] 1, [1,9,28] 1, [1,10,28] 1, [2,3,2] 1, [2,4,2] 1, [2,5,2] 1, [2,6,2] 1, [2,7,2] 1, [2,8,2] 1, [2,9,2] 1, [2,1,3] 1, [2,2,3] 1, [2,3,3] 1, [2,4,3] 1, [2,5,3] 1, [2,6,3] 1, [2,7,3] 1, [2,8,3] 1, [2,9,3] 1, [2,10,3] 1, [2,3,4] 1, [2,4,4] 1, [2,5,4] 1, [2,6,4] 1, [2,7,4] 1, [2,8,4] 1, [2,9,4] 1, [2,10,4] 1, [2,2,5] 1, [2,3,5] 1, [2,4,5] 1, [2,5,5] 1, [2,6,5] 1, [2,7,5] 1, [2,10,5] 1, [2,2,6] 1, [2,3,6] 1, [2,4,6] 1, [2,5,6] 1, [2,6,6] 1, [2,7,6] 1, [2,8,6] 1, [2,9,6] 1, [2,1,7] 1, [2,2,7] 1, [2,3,7] 1, [2,4,7] 1, [2,5,7] 1, [2,6,7] 1, [2,7,7] 1, [2,8,7] 1, [2,9,7] 1, [2,2,8] 1, [2,3,8] 1, [2,4,8] 1, [2,5,8] 1, [2,6,8] 1, [2,7,8] 1, [2,1,9] 1, [2,2,9] 1, [2,3,9] 1, [2,4,9] 1, [2,5,9] 1, [2,6,9] 1, [2,7,9] 1, [2,8,9] 1, [2,9,9] 1, [2,10,9] 1, [2,1,11] 1, [2,2,11] 1, [2,3,11] 1, [2,4,11] 1, [2,5,11] 1, [2,6,11] 1, [2,7,11] 1, [2,8,11] 1, [2,9,11] 1, [2,10,11] 1, [2,1,12] 1, [2,3,12] 1, [2,4,12] 1, [2,5,12] 1, [2,6,12] 1, [2,7,12] 1, [2,8,12] 1, [2,9,12] 1, [2,10,12] 1, [2,1,13] 1, [2,3,13] 1, [2,4,13] 1, [2,5,13] 1, [2,6,13] 1, [2,7,13] 1, [2,8,13] 1, [2,9,13] 1, [2,10,13] 1, [2,1,15] 1, [2,2,15] 1, [2,3,15] 1, [2,4,15] 1, [2,5,15] 1, [2,6,15] 1, [2,7,15] 1, [2,8,15] 1, [2,9,15] 1, [2,10,15] 1, [2,1,16] 1, [2,2,16] 1, [2,3,16] 1, [2,4,16] 1, [2,5,16] 1, [2,6,16] 1, [2,7,16] 1, [2,8,16] 1, [2,9,16] 1, [2,10,16] 1, [2,1,17] 1, [2,2,17] 1, [2,3,17] 1, [2,4,17] 1, [2,5,17] 1, [2,6,17] 1, [2,7,17] 1, [2,8,17] 1, [2,9,17] 1, [2,10,17] 1, [2,3,20] 1, [2,4,20] 1, [2,5,20] 1, [2,6,20] 1, [2,7,20] 1, [2,8,20] 1, [2,9,20] 1, [2,10,20] 1, [2,3,21] 1, [2,4,21] 1, [2,5,21] 1, [2,6,21] 1, [2,7,21] 1, [2,8,21] 1, [2,9,21] 1, [2,10,21] 1, [2,1,22] 1, [2,2,22] 1, [2,3,22] 1, [2,4,22] 1, [2,5,22] 1, [2,6,22] 1, [2,7,22] 1, [2,8,22] 1, [2,9,22] 1, [2,10,22] 1, [2,1,24] 1, [2,2,24] 1, [2,3,24] 1, [2,4,24] 1, [2,5,24] 1, [2,6,24] 1, [2,7,24] 1, [2,8,24] 1, [2,9,24] 1, [2,10,24] 1, [2,1,25] 1, [2,2,25] 1, [2,3,25] 1, [2,4,25] 1, [2,5,25] 1, [2,6,25] 1, [2,7,25] 1, [2,8,25] 1, [2,9,25] 1, [2,1,26] 1, [2,2,26] 1, [2,3,26] 1, [2,4,26] 1, [2,5,26] 1, [2,6,26] 1, [2,7,26] 1, [2,8,26] 1, [2,9,26] 1, [2,1,27] 1, [2,2,27] 1, [2,3,27] 1, [2,4,27] 1, [2,5,27] 1, [2,6,27] 1, [2,7,27] 1, [2,8,27] 1, [2,9,27] 1, [3,1,1] 1, [3,2,1] 1, [3,3,1] 1, [3,4,1] 1, [3,5,1] 1, [3,6,1] 1, [3,7,1] 1, [3,8,1] 1, [3,9,1] 1, [3,1,3] 1, [3,2,3] 1, [3,3,3] 1, [3,4,3] 1, [3,5,3] 1, [3,6,3] 1, [3,7,3] 1, [3,8,3] 1, [3,9,3] 1, [3,10,3] 1, [3,1,4] 1, [3,2,4] 1, [3,3,4] 1, [3,4,4] 1, [3,5,4] 1, [3,6,4] 1, [3,7,4] 1, [3,8,4] 1, [3,9,4] 1, [3,10,4] 1, [3,1,5] 1, [3,2,5] 1, [3,3,5] 1, [3,4,5] 1, [3,5,5] 1, [3,6,5] 1, [3,7,5] 1, [3,8,5] 1, [3,9,5] 1, [3,1,6] 1, [3,2,6] 1, [3,3,6] 1, [3,4,6] 1, [3,5,6] 1, [3,6,6] 1, [3,7,6] 1, [3,8,6] 1, [3,9,6] 1, [3,1,8] 1, [3,2,8] 1, [3,3,8] 1, [3,4,8] 1, [3,5,8] 1, [3,6,8] 1, [3,7,8] 1, [3,1,9] 1, [3,2,9] 1, [3,3,9] 1, [3,4,9] 1, [3,5,9] 1, [3,6,9] 1, [3,7,9] 1, [3,8,9] 1, [3,9,9] 1, [3,10,9] 1, [3,1,11] 1, [3,2,11] 1, [3,3,11] 1, [3,4,11] 1, [3,5,11] 1, [3,6,11] 1, [3,7,11] 1, [3,8,11] 1, [3,9,11] 1, [3,10,11] 1, [3,1,12] 1, [3,3,12] 1, [3,4,12] 1, [3,5,12] 1, [3,6,12] 1, [3,7,12] 1, [3,8,12] 1, [3,9,12] 1, [3,10,12] 1, [3,1,13] 1, [3,3,13] 1, [3,4,13] 1, [3,5,13] 1, [3,6,13] 1, [3,7,13] 1, [3,8,13] 1, [3,9,13] 1, [3,10,13] 1, [3,1,15] 1, [3,2,15] 1, [3,3,15] 1, [3,4,15] 1, [3,5,15] 1, [3,6,15] 1, [3,7,15] 1, [3,8,15] 1, [3,9,15] 1, [3,10,15] 1, [3,1,16] 1, [3,2,16] 1, [3,3,16] 1, [3,4,16] 1, [3,5,16] 1, [3,6,16] 1, [3,7,16] 1, [3,8,16] 1, [3,9,16] 1, [3,10,16] 1, [3,1,17] 1, [3,2,17] 1, [3,3,17] 1, [3,4,17] 1, [3,5,17] 1, [3,6,17] 1, [3,7,17] 1, [3,8,17] 1, [3,9,17] 1, [3,10,17] 1, [3,3,20] 1, [3,4,20] 1, [3,5,20] 1, [3,6,20] 1, [3,7,20] 1, [3,8,20] 1, [3,9,20] 1, [3,10,20] 1, [3,3,21] 1, [3,4,21] 1, [3,5,21] 1, [3,6,21] 1, [3,7,21] 1, [3,8,21] 1, [3,9,21] 1, [3,10,21] 1, [3,1,22] 1, [3,2,22] 1, [3,3,22] 1, [3,4,22] 1, [3,5,22] 1, [3,6,22] 1, [3,7,22] 1, [3,8,22] 1, [3,9,22] 1, [3,10,22] 1, [3,1,24] 1, [3,2,24] 1, [3,3,24] 1, [3,4,24] 1, [3,5,24] 1, [3,6,24] 1, [3,7,24] 1, [3,8,24] 1, [3,9,24] 1, [3,10,24] 1, [3,1,25] 1, [3,2,25] 1, [3,3,25] 1, [3,4,25] 1, [3,5,25] 1, [3,6,25] 1, [3,7,25] 1, [3,8,25] 1, [3,9,25] 1, [3,1,26] 1, [3,2,26] 1, [3,3,26] 1, [3,4,26] 1, [3,5,26] 1, [3,6,26] 1, [3,7,26] 1, [3,8,26] 1, [3,9,26] 1, [3,1,27] 1, [3,2,27] 1, [3,3,27] 1, [3,4,27] 1, [3,5,27] 1, [3,6,27] 1, [3,7,27] 1, [3,8,27] 1, [3,9,27] 1, [10,1,6] 1, [10,2,6] 1, [10,3,6] 1, [10,4,6] 1, [10,5,6] 1, [10,6,6] 1, [10,7,6] 1, [10,8,6] 1, [10,9,6] 1, [10,10,6] 1, [10,1,7] 1, [10,2,7] 1, [10,3,7] 1, [10,4,7] 1, [10,5,7] 1, [10,6,7] 1, [10,7,7] 1, [10,8,7] 1, [10,9,7] 1, [10,10,7] 1, [10,1,13] 1, [10,2,13] 1, [10,3,13] 1, [10,4,13] 1, [10,5,13] 1, [10,6,13] 1, [10,7,13] 1, [10,8,13] 1, [10,9,13] 1, [10,10,13] 1, [10,1,14] 1, [10,2,14] 1, [10,3,14] 1, [10,4,14] 1, [10,5,14] 1, [10,6,14] 1, [10,7,14] 1, [10,8,14] 1, [10,9,14] 1, [10,10,14] 1, [10,1,20] 1, [10,2,20] 1, [10,3,20] 1, [10,4,20] 1, [10,5,20] 1, [10,6,20] 1, [10,7,20] 1, [10,8,20] 1, [10,9,20] 1, [10,10,20] 1, [10,1,21] 1, [10,2,21] 1, [10,3,21] 1, [10,4,21] 1, [10,5,21] 1, [10,6,21] 1, [10,7,21] 1, [10,8,21] 1, [10,9,21] 1, [10,10,21] 1, [10,1,27] 1, [10,2,27] 1, [10,3,27] 1, [10,4,27] 1, [10,5,27] 1, [10,6,27] 1, [10,7,27] 1, [10,8,27] 1, [10,9,27] 1, [10,10,27] 1, [10,1,28] 1, [10,2,28] 1, [10,3,28] 1, [10,4,28] 1, [10,5,28] 1, [10,6,28] 1, [10,7,28] 1, [10,8,28] 1, [10,9,28] 1, [10,10,28] 1, [11,5,1] 1, [11,6,1] 1, [11,7,1] 1, [11,8,1] 1, [11,9,1] 1, [11,10,1] 1, [11,5,2] 1, [11,6,2] 1, [11,7,2] 1, [11,8,2] 1, [11,9,2] 1, [11,10,2] 1, [11,5,3] 1, [11,6,3] 1, [11,7,3] 1, [11,8,3] 1, [11,9,3] 1, [11,10,3] 1, [11,5,4] 1, [11,6,4] 1, [11,7,4] 1, [11,8,4] 1, [11,9,4] 1, [11,10,4] 1, [11,5,5] 1, [11,6,5] 1, [11,7,5] 1, [11,8,5] 1, [11,9,5] 1, [11,10,5] 1, [11,5,6] 1, [11,6,6] 1, [11,7,6] 1, [11,8,6] 1, [11,9,6] 1, [11,10,6] 1, [11,5,8] 1, [11,6,8] 1, [11,7,8] 1, [11,8,8] 1, [11,9,8] 1, [11,10,8] 1, [11,5,9] 1, [11,6,9] 1, [11,7,9] 1, [11,8,9] 1, [11,9,9] 1, [11,10,9] 1, [11,5,10] 1, [11,6,10] 1, [11,7,10] 1, [11,8,10] 1, [11,9,10] 1, [11,10,10] 1, [11,5,11] 1, [11,6,11] 1, [11,7,11] 1, [11,8,11] 1, [11,9,11] 1, [11,10,11] 1, [11,5,12] 1, [11,6,12] 1, [11,7,12] 1, [11,8,12] 1, [11,9,12] 1, [11,10,12] 1, [11,5,13] 1, [11,6,13] 1, [11,7,13] 1, [11,8,13] 1, [11,9,13] 1, [11,10,13] 1, [11,5,15] 1, [11,6,15] 1, [11,7,15] 1, [11,8,15] 1, [11,9,15] 1, [11,10,15] 1, [11,5,16] 1, [11,6,16] 1, [11,7,16] 1, [11,8,16] 1, [11,9,16] 1, [11,10,16] 1, [11,5,17] 1, [11,6,17] 1, [11,7,17] 1, [11,8,17] 1, [11,9,17] 1, [11,10,17] 1, [11,5,18] 1, [11,6,18] 1, [11,7,18] 1, [11,8,18] 1, [11,9,18] 1, [11,10,18] 1, [11,5,19] 1, [11,6,19] 1, [11,7,19] 1, [11,8,19] 1, [11,9,19] 1, [11,10,19] 1, [11,5,20] 1, [11,6,20] 1, [11,7,20] 1, [11,8,20] 1, [11,9,20] 1, [11,10,20] 1, [11,5,22] 1, [11,6,22] 1, [11,7,22] 1, [11,8,22] 1, [11,9,22] 1, [11,10,22] 1, [11,5,23] 1, [11,6,23] 1, [11,7,23] 1, [11,8,23] 1, [11,9,23] 1, [11,10,23] 1, [11,5,24] 1, [11,6,24] 1, [11,7,24] 1, [11,8,24] 1, [11,9,24] 1, [11,10,24] 1, [11,5,25] 1, [11,6,25] 1, [11,7,25] 1, [11,8,25] 1, [11,9,25] 1, [11,10,25] 1, [11,5,26] 1, [11,6,26] 1, [11,7,26] 1, [11,8,26] 1, [11,9,26] 1, [11,10,26] 1, [11,5,27] 1, [11,6,27] 1, [11,7,27] 1, [11,8,27] 1, [11,9,27] 1, [11,10,27] 1, [4,1,1] 1, [4,2,1] 1, [4,3,1] 1, [4,4,1] 1, [4,5,1] 1, [4,6,1] 1, [4,7,1] 1, [4,8,1] 1, [4,9,1] 1, [4,10,1] 1, [4,1,2] 1, [4,2,2] 1, [4,3,2] 1, [4,4,2] 1, [4,5,2] 1, [4,6,2] 1, [4,7,2] 1, [4,8,2] 1, [4,9,2] 1, [4,10,2] 1, [4,3,5] 1, [4,4,5] 1, [4,5,5] 1, [4,6,5] 1, [4,7,5] 1, [4,8,5] 1, [4,9,5] 1, [4,10,5] 1, [4,2,6] 1, [4,3,6] 1, [4,4,6] 1, [4,5,6] 1, [4,6,6] 1, [4,7,6] 1, [4,8,6] 1, [4,9,6] 1, [4,10,6] 1, [4,1,7] 1, [4,2,7] 1, [4,3,7] 1, [4,4,7] 1, [4,5,7] 1, [4,6,7] 1, [4,7,7] 1, [4,8,7] 1, [4,9,7] 1, [4,10,7] 1, [4,1,8] 1, [4,2,8] 1, [4,3,8] 1, [4,4,8] 1, [4,5,8] 1, [4,6,8] 1, [4,7,8] 1, [4,8,8] 1, [4,1,10] 1, [4,2,10] 1, [4,3,10] 1, [4,4,10] 1, [4,5,10] 1, [4,6,10] 1, [4,7,10] 1, [4,8,10] 1, [4,9,10] 1, [4,10,10] 1, [4,1,11] 1, [4,2,11] 1, [4,3,11] 1, [4,4,11] 1, [4,5,11] 1, [4,6,11] 1, [4,7,11] 1, [4,8,11] 1, [4,9,11] 1, [4,1,12] 1, [4,2,12] 1, [4,3,12] 1, [4,4,12] 1, [4,5,12] 1, [4,6,12] 1, [4,7,12] 1, [4,8,12] 1, [4,9,12] 1, [4,1,13] 1, [4,2,13] 1, [4,3,13] 1, [4,4,13] 1, [4,5,13] 1, [4,6,13] 1, [4,7,13] 1, [4,8,13] 1, [4,9,13] 1, [4,3,15] 1, [4,4,15] 1, [4,5,15] 1, [4,6,15] 1, [4,7,15] 1, [4,8,15] 1, [4,9,15] 1, [4,3,16] 1, [4,4,16] 1, [4,5,16] 1, [4,6,16] 1, [4,7,16] 1, [4,8,16] 1, [4,9,16] 1, [4,3,18] 1, [4,4,18] 1, [4,5,18] 1, [4,6,18] 1, [4,7,18] 1, [4,8,18] 1, [4,9,18] 1, [4,2,19] 1, [4,3,19] 1, [4,4,19] 1, [4,5,19] 1, [4,6,19] 1, [4,7,19] 1, [4,8,19] 1, [4,9,19] 1, [4,2,20] 1, [4,3,20] 1, [4,4,20] 1, [4,5,20] 1, [4,6,20] 1, [4,7,20] 1, [4,8,20] 1, [4,9,20] 1, [4,1,21] 1, [4,2,21] 1, [4,3,21] 1, [4,4,21] 1, [4,5,21] 1, [4,6,21] 1, [4,7,21] 1, [4,8,21] 1, [4,9,21] 1, [4,1,22] 1, [4,2,22] 1, [4,3,22] 1, [4,4,22] 1, [4,5,22] 1, [4,6,22] 1, [4,1,23] 1, [4,2,23] 1, [4,3,23] 1, [4,4,23] 1, [4,5,23] 1, [4,6,23] 1, [4,7,23] 1, [4,8,23] 1, [4,9,23] 1, [4,10,23] 1, [4,1,25] 1, [4,2,25] 1, [4,3,25] 1, [4,4,25] 1, [4,5,25] 1, [4,6,25] 1, [4,7,25] 1, [4,8,25] 1, [4,9,25] 1, [4,10,25] 1, [4,1,26] 1, [4,3,26] 1, [4,4,26] 1, [4,5,26] 1, [4,6,26] 1, [4,7,26] 1, [4,8,26] 1, [4,9,26] 1, [4,10,26] 1, [4,1,27] 1, [4,3,27] 1, [4,4,27] 1, [4,5,27] 1, [4,6,27] 1, [4,7,27] 1, [4,8,27] 1, [4,9,27] 1, [4,10,27] 1, [5,3,3] 1, [5,4,3] 1, [5,5,3] 1, [5,6,3] 1, [5,7,3] 1, [5,8,3] 1, [5,9,3] 1, [5,3,4] 1, [5,4,4] 1, [5,5,4] 1, [5,6,4] 1, [5,7,4] 1, [5,8,4] 1, [5,9,4] 1, [5,10,4] 1, [5,6,5] 1, [5,7,5] 1, [5,8,5] 1, [5,9,5] 1, [5,10,5] 1, [5,4,6] 1, [5,5,6] 1, [5,6,6] 1, [5,7,6] 1, [5,8,6] 1, [5,9,6] 1, [5,10,6] 1, [5,4,7] 1, [5,5,7] 1, [5,6,7] 1, [5,7,7] 1, [5,8,7] 1, [5,9,7] 1, [5,10,7] 1, [5,3,8] 1, [5,4,8] 1, [5,5,8] 1, [5,6,8] 1, [5,7,8] 1, [5,8,8] 1, [5,9,8] 1, [5,3,9] 1, [5,4,9] 1, [5,5,9] 1, [5,6,9] 1, [5,7,9] 1, [5,8,9] 1, [5,9,9] 1, [5,3,10] 1, [5,4,10] 1, [5,5,10] 1, [5,6,10] 1, [5,7,10] 1, [5,8,10] 1, [5,9,10] 1, [5,10,10] 1, [5,3,13] 1, [5,4,13] 1, [5,5,13] 1, [5,6,13] 1, [5,7,13] 1, [5,8,13] 1, [5,9,13] 1, [5,3,14] 1, [5,4,14] 1, [5,5,14] 1, [5,6,14] 1, [5,7,14] 1, [5,8,14] 1, [5,9,14] 1, [5,2,17] 1, [5,3,17] 1, [5,4,17] 1, [5,5,17] 1, [5,6,17] 1, [5,7,17] 1, [5,8,17] 1, [5,9,17] 1, [5,2,18] 1, [5,3,18] 1, [5,4,18] 1, [5,5,18] 1, [5,6,18] 1, [5,7,18] 1, [5,8,18] 1, [5,9,18] 1, [5,10,18] 1, [5,6,19] 1, [5,7,19] 1, [5,8,19] 1, [5,9,19] 1, [5,10,19] 1, [5,4,20] 1, [5,5,20] 1, [5,6,20] 1, [5,7,20] 1, [5,8,20] 1, [5,9,20] 1, [5,10,20] 1, [5,4,21] 1, [5,5,21] 1, [5,6,21] 1, [5,7,21] 1, [5,8,21] 1, [5,9,21] 1, [5,10,21] 1, [5,3,22] 1, [5,4,22] 1, [5,5,22] 1, [5,6,22] 1, [5,7,22] 1, [5,8,22] 1, [5,9,22] 1, [5,3,23] 1, [5,4,23] 1, [5,5,23] 1, [5,6,23] 1, [5,7,23] 1, [5,8,23] 1, [5,9,23] 1, [5,3,24] 1, [5,4,24] 1, [5,5,24] 1, [5,6,24] 1, [5,7,24] 1, [5,8,24] 1, [5,9,24] 1, [5,10,24] 1, [5,3,27] 1, [5,4,27] 1, [5,5,27] 1, [5,6,27] 1, [5,7,27] 1, [5,8,27] 1, [5,9,27] 1, [5,3,28] 1, [5,4,28] 1, [5,5,28] 1, [5,6,28] 1, [5,7,28] 1, [5,8,28] 1, [5,9,28] 1, [9,7,5] 1, [9,8,5] 1, [9,9,5] 1, [9,10,5] 1, [9,7,12] 1, [9,8,12] 1, [9,9,12] 1, [9,10,12] 1, [9,1,13] 1, [9,2,13] 1, [9,3,13] 1, [9,4,13] 1, [9,5,13] 1, [9,6,13] 1, [9,7,13] 1, [9,8,13] 1, [9,9,13] 1, [9,10,13] 1, [9,1,14] 1, [9,2,14] 1, [9,3,14] 1, [9,4,14] 1, [9,5,14] 1, [9,6,14] 1, [9,7,14] 1, [9,8,14] 1, [9,9,14] 1, [9,10,14] 1, [9,7,19] 1, [9,8,19] 1, [9,9,19] 1, [9,10,19] 1, [9,1,20] 1, [9,2,20] 1, [9,3,20] 1, [9,4,20] 1, [9,5,20] 1, [9,6,20] 1, [9,7,20] 1, [9,8,20] 1, [9,9,20] 1, [9,10,20] 1, [9,1,21] 1, [9,2,21] 1, [9,3,21] 1, [9,4,21] 1, [9,5,21] 1, [9,6,21] 1, [9,7,21] 1, [9,8,21] 1, [9,9,21] 1, [9,10,21] 1, [9,7,26] 1, [9,8,26] 1, [9,9,26] 1, [9,10,26] 1, [9,1,27] 1, [9,2,27] 1, [9,3,27] 1, [9,4,27] 1, [9,5,27] 1, [9,6,27] 1, [9,7,27] 1, [9,8,27] 1, [9,9,27] 1, [9,10,27] 1, [9,1,28] 1, [9,2,28] 1, [9,3,28] 1, [9,4,28] 1, [9,5,28] 1, [9,6,28] 1, [9,7,28] 1, [9,8,28] 1, [9,9,28] 1, [9,10,28] 1, [7,3,1] 1, [7,4,1] 1, [7,5,1] 1, [7,6,1] 1, [7,7,1] 1, [7,8,1] 1, [7,9,1] 1, [7,3,2] 1, [7,4,2] 1, [7,5,2] 1, [7,6,2] 1, [7,7,2] 1, [7,8,2] 1, [7,9,2] 1, [7,3,3] 1, [7,4,3] 1, [7,5,3] 1, [7,6,3] 1, [7,7,3] 1, [7,8,3] 1, [7,9,3] 1, [7,10,3] 1, [7,3,6] 1, [7,4,6] 1, [7,5,6] 1, [7,6,6] 1, [7,7,6] 1, [7,8,6] 1, [7,9,6] 1, [7,3,7] 1, [7,4,7] 1, [7,5,7] 1, [7,6,7] 1, [7,7,7] 1, [7,8,7] 1, [7,9,7] 1, [7,3,9] 1, [7,4,9] 1, [7,5,9] 1, [7,6,9] 1, [7,7,9] 1, [7,8,9] 1, [7,9,9] 1, [7,4,10] 1, [7,5,10] 1, [7,6,10] 1, [7,7,10] 1, [7,8,10] 1, [7,9,10] 1, [7,10,10] 1, [7,3,11] 1, [7,4,11] 1, [7,5,11] 1, [7,6,11] 1, [7,7,11] 1, [7,8,11] 1, [7,9,11] 1, [7,10,11] 1, [7,2,12] 1, [7,3,12] 1, [7,4,12] 1, [7,5,12] 1, [7,6,12] 1, [7,7,12] 1, [7,10,12] 1, [7,2,13] 1, [7,3,13] 1, [7,4,13] 1, [7,5,13] 1, [7,6,13] 1, [7,7,13] 1, [7,8,13] 1, [7,3,16] 1, [7,4,16] 1, [7,5,16] 1, [7,6,16] 1, [7,7,16] 1, [7,8,16] 1, [7,9,16] 1, [7,4,17] 1, [7,5,17] 1, [7,6,17] 1, [7,7,17] 1, [7,8,17] 1, [7,9,17] 1, [7,10,17] 1, [7,3,18] 1, [7,4,18] 1, [7,5,18] 1, [7,6,18] 1, [7,7,18] 1, [7,8,18] 1, [7,9,18] 1, [7,10,18] 1, [7,2,19] 1, [7,3,19] 1, [7,4,19] 1, [7,5,19] 1, [7,6,19] 1, [7,7,19] 1, [7,10,19] 1, [7,2,20] 1, [7,3,20] 1, [7,4,20] 1, [7,5,20] 1, [7,6,20] 1, [7,7,20] 1, [7,8,20] 1, [7,3,22] 1, [7,4,22] 1, [7,5,22] 1, [7,6,22] 1, [7,7,22] 1, [7,8,22] 1, [7,9,22] 1, [7,3,23] 1, [7,4,23] 1, [7,5,23] 1, [7,6,23] 1, [7,7,23] 1, [7,8,23] 1, [7,9,23] 1, [7,3,24] 1, [7,4,24] 1, [7,5,24] 1, [7,6,24] 1, [7,7,24] 1, [7,8,24] 1, [7,9,24] 1, [7,10,24] 1, [7,3,27] 1, [7,4,27] 1, [7,5,27] 1, [7,6,27] 1, [7,7,27] 1, [7,8,27] 1, [7,9,27] 1, [7,3,28] 1, [7,4,28] 1, [7,5,28] 1, [7,6,28] 1, [7,7,28] 1, [7,8,28] 1, [7,9,28] 1	[1,1,1] 1, [2,1,1] 1, [3,1,1] 1, [4,1,1] 2, [5,1,1] 2, [6,1,1] 2, [7,1,1] 2,[8,1,1] 1,[9,1,1] 0, [10,1,1] 0, [11,1,1] 0, [12,1,1] 0	[1,1,1,1] 338533, [1,2,1,1] 338533, [1,3,1,1] 338533, [1,4,1,1] 338533, [1,5,1,1] 338533, [1,6,1,1] 338533, [1,7,1,1] 338533, [1,8,1,1] 338533, [1,9,1,1] 338533, [1,10,1,1] 338533, [1,1,2,1] 292713, [1,2,2,1] 292713, [1,3,2,1] 292713, [1,4,2,1] 292713, [1,5,2,1] 292713, [1,6,2,1] 292713, [1,7,2,1] 292713, [1,8,2,1] 292713, [1,9,2,1] 292713, [1,10,2,1] 292713, [1,1,3,1] 477615, [1,2,3,1] 477615, [1,3,3,1] 477615, [1,4,3,1] 477615, [1,5,3,1] 477615, [1,6,3,1] 477615, [1,7,3,1] 477615, [1,8,3,1] 477615, [1,9,3,1] 477615, [1,10,3,1] 477615, [1,1,4,1] 237100, [1,2,4,1] 237100, [1,3,4,1] 237100, [1,4,4,1] 237100, [1,5,4,1] 237100, [1,6,4,1] 237100, [1,7,4,1] 237100, [1,8,4,1] 237100, [1,9,4,1] 237100, [1,10,4,1] 237100, [1,1,5,1] 365173, [1,2,5,1] 365173, [1,3,5,1] 365173, [1,4,5,1] 365173, [1,5,5,1] 365173, [1,6,5,1] 365173, [1,7,5,1] 365173, [1,8,5,1] 365173, [1,9,5,1] 365173, [1,10,5,1] 365173, [1,1,6,1] 473747, [1,2,6,1] 473747, [1,3,6,1] 473747, [1,4,6,1] 473747, [1,5,6,1] 473747, [1,6,6,1] 473747, [1,7,6,1] 473747, [1,8,6,1] 473747, [1,9,6,1] 473747, [1,10,6,1] 473747, [1,1,7,1] 571729, [1,2,7,1] 571729, [1,3,7,1] 571729, [1,4,7,1] 571729, [1,5,7,1] 571729, [1,6,7,1] 571729, [1,7,7,1] 571729, [1,8,7,1] 571729, [1,9,7,1] 571729, [1,10,7,1] 571729, [1,1,8,1] 589468, [1,2,8,1] 589468, [1,3,8,1] 589468, [1,4,8,1] 589468, [1,5,8,1] 589468, [1,6,8,1] 589468, [1,7,8,1] 589468, [1,8,8,1] 589468, [1,9,8,1] 589468, [1,10,8,1] 589468, [1,1,9,1] 827026, [1,2,9,1] 827026, [1,3,9,1] 827026, [1,4,9,1] 827026, [1,5,9,1] 827026, [1,6,9,1] 827026, [1,7,9,1] 827026, [1,8,9,1] 827026, [1,9,9,1] 827026, [1,10,9,1] 827026, [1,1,10,1] 241932, [1,2,10,1] 241932, [1,3,10,1] 241932, [1,4,10,1] 241932, [1,5,10,1] 241932, [1,6,10,1] 241932, [1,7,10,1] 241932, [1,8,10,1] 241932, [1,9,10,1] 241932, [1,10,10,1] 241932, [1,1,11,1] 567931, [1,2,11,1] 567931, [1,3,11,1] 567931, [1,4,11,1] 567931, [1,5,11,1] 567931, [1,6,11,1] 567931, [1,7,11,1] 567931, [1,8,11,1] 567931, [1,9,11,1] 567931, [1,10,11,1] 567931, [1,1,12,1] 420206, [1,2,12,1] 420206, [1,3,12,1] 420206, [1,4,12,1] 420206, [1,5,12,1] 420206, [1,6,12,1] 420206, [1,7,12,1] 420206, [1,8,12,1] 420206, [1,9,12,1] 420206, [1,10,12,1] 420206, [1,1,13,1] 242712, [1,2,13,1] 242712, [1,3,13,1] 242712, [1,4,13,1] 242712, [1,5,13,1] 242712, [1,6,13,1] 242712, [1,7,13,1] 242712, [1,8,13,1] 242712, [1,9,13,1] 242712, [1,10,13,1] 242712, [1,1,14,1] 364573, [1,2,14,1] 364573, [1,3,14,1] 364573, [1,4,14,1] 364573, [1,5,14,1] 364573, [1,6,14,1] 364573, [1,7,14,1] 364573, [1,8,14,1] 364573, [1,9,14,1] 364573, [1,10,14,1] 364573, [1,1,15,1] 720245, [1,2,15,1] 720245, [1,3,15,1] 720245, [1,4,15,1] 720245, [1,5,15,1] 720245, [1,6,15,1] 720245, [1,7,15,1] 720245, [1,8,15,1] 720245, [1,9,15,1] 720245, [1,10,15,1] 720245, [1,1,16,1] 2373291, [1,2,16,1] 2373291, [1,3,16,1] 2373291, [1,4,16,1] 2373291, [1,5,16,1] 2373291, [1,6,16,1] 2373291, [1,7,16,1] 2373291, [1,8,16,1] 2373291, [1,9,16,1] 2373291, [1,10,16,1] 2373291, [1,1,17,1] 186357, [1,2,17,1] 186357, [1,3,17,1] 186357, [1,4,17,1] 186357, [1,5,17,1] 186357, [1,6,17,1] 186357, [1,7,17,1] 186357, [1,8,17,1] 186357, [1,9,17,1] 186357, [1,10,17,1] 186357, [1,1,18,1] 318546, [1,2,18,1] 318546, [1,3,18,1] 318546, [1,4,18,1] 318546, [1,5,18,1] 318546, [1,6,18,1] 318546, [1,7,18,1] 318546, [1,8,18,1] 318546, [1,9,18,1] 318546, [1,10,18,1] 318546, [1,1,19,1] 258489, [1,2,19,1] 258489, [1,3,19,1] 258489, [1,4,19,1] 258489, [1,5,19,1] 258489, [1,6,19,1] 258489, [1,7,19,1] 258489, [1,8,19,1] 258489, [1,9,19,1] 258489, [1,10,19,1] 258489, [1,1,20,1] 272480, [1,2,20,1] 272480, [1,3,20,1] 272480, [1,4,20,1] 272480, [1,5,20,1] 272480, [1,6,20,1] 272480, [1,7,20,1] 272480, [1,8,20,1] 272480, [1,9,20,1] 272480, [1,10,20,1] 272480, [1,1,21,1] 463794, [1,2,21,1] 463794, [1,3,21,1] 463794, [1,4,21,1] 463794, [1,5,21,1] 463794, [1,6,21,1] 463794, [1,7,21,1] 463794, [1,8,21,1] 463794, [1,9,21,1] 463794, [1,10,21,1] 463794, [1,1,22,1] 838044, [1,2,22,1] 838044, [1,3,22,1] 838044, [1,4,22,1] 838044, [1,5,22,1] 838044, [1,6,22,1] 838044, [1,7,22,1] 838044, [1,8,22,1] 838044, [1,9,22,1] 838044, [1,10,22,1] 838044, [1,1,23,1] 583207, [1,2,23,1] 583207, [1,3,23,1] 583207, [1,4,23,1] 583207, [1,5,23,1] 583207, [1,6,23,1] 583207, [1,7,23,1] 583207, [1,8,23,1] 583207, [1,9,23,1] 583207, [1,10,23,1] 583207, [1,1,24,1] 238425, [1,2,24,1] 238425, [1,3,24,1] 238425, [1,4,24,1] 238425, [1,5,24,1] 238425, [1,6,24,1] 238425, [1,7,24,1] 238425, [1,8,24,1] 238425, [1,9,24,1] 238425, [1,10,24,1] 238425, [1,1,25,1] 323896, [1,2,25,1] 323896, [1,3,25,1] 323896, [1,4,25,1] 323896, [1,5,25,1] 323896, [1,6,25,1] 323896, [1,7,25,1] 323896, [1,8,25,1] 323896, [1,9,25,1] 323896, [1,10,25,1] 323896, [1,1,26,1] 292221, [1,2,26,1] 292221, [1,3,26,1] 292221, [1,4,26,1] 292221, [1,5,26,1] 292221, [1,6,26,1] 292221, [1,7,26,1] 292221, [1,8,26,1] 292221, [1,9,26,1] 292221, [1,10,26,1] 292221, [1,1,27,1] 257843, [1,2,27,1] 257843, [1,3,27,1] 257843, [1,4,27,1] 257843, [1,5,27,1] 257843, [1,6,27,1] 257843, [1,7,27,1] 257843, [1,8,27,1] 257843, [1,9,27,1] 257843, [1,10,27,1] 257843, [1,1,28,1] 326830, [1,2,28,1] 326830, [1,3,28,1] 326830, [1,4,28,1] 326830, [1,5,28,1] 326830, [1,6,28,1] 326830, [1,7,28,1] 326830, [1,8,28,1] 326830, [1,9,28,1] 326830, [1,10,28,1] 326830	2018-05-16 19:59:43.58178	2018-05-16 19:59:43.58178	2	2018
34	31	12	1	28	10	2500	75000		[1,6] 95000,[2,6] 95000,[3,6] 95000,[4,6] 95000,[5,6] 95000,[6,6] 95000,[7,6] 95000,[8,6] 95000,[9,6] 95000,[10,6] 95000,[1,7] 95000,[2,7] 95000,[3,7] 95000,[4,7] 95000,[5,7] 95000,[6,7] 95000,[7,7] 95000,[8,7] 95000,[9,7] 95000,[10,7] 95000,[1,13] 95000,[2,13] 95000,[3,13] 95000,[4,13] 95000,[5,13] 95000,[6,13] 95000,[7,13] 95000,[8,13] 95000,[9,13] 95000,[10,13] 95000,[1,14] 95000,[2,14] 95000,[3,14] 95000,[4,14] 95000,[5,14] 95000,[6,14] 95000,[7,14] 95000,[8,14] 95000,[9,14] 95000,[10,14] 95000,[1,20] 95000,[2,20] 95000,[3,20] 95000,[4,20] 95000,[5,20] 95000,[6,20] 95000,[7,20] 95000,[8,20] 95000,[9,20] 95000,[10,20] 95000,[1,21] 95000,[2,21] 95000,[3,21] 95000,[4,21] 95000,[5,21] 95000,[6,21] 95000,[7,21] 95000,[8,21] 95000,[9,21] 95000,[10,21] 95000,[1,27] 95000,[2,27] 95000,[3,27] 95000,[4,27] 95000,[5,27] 95000,[6,27] 95000,[7,27] 95000,[8,27] 95000,[9,27] 95000,[10,27] 95000,[1,28] 95000,[2,28] 95000,[3,28] 95000,[4,28] 95000,[5,28] 95000,[6,28] 95000,[7,28] 95000,[8,28] 95000,[9,28] 95000,[10,28] 95000	[1] 1, [2] 1	[2] 1, [3] 1, [4] 1, [5] 1	2	[6,3,2] 1, [6,4,2] 1, [6,5,2] 1, [6,6,2] 1, [6,7,2] 1, [6,8,2] 1, [6,9,2] 1, [6,4,3] 1, [6,5,3] 1, [6,6,3] 1, [6,7,3] 1, [6,8,3] 1, [6,9,3] 1, [6,3,4] 1, [6,4,4] 1, [6,5,4] 1, [6,6,4] 1, [6,7,4] 1, [6,8,4] 1, [6,9,4] 1, [6,10,4] 1, [6,2,5] 1, [6,3,5] 1, [6,4,5] 1, [6,5,5] 1, [6,6,5] 1, [6,7,5] 1, [6,10,5] 1, [6,2,6] 1, [6,3,6] 1, [6,4,6] 1, [6,5,6] 1, [6,6,6] 1, [6,7,6] 1, [6,8,6] 1, [6,3,9] 1, [6,4,9] 1, [6,5,9] 1, [6,6,9] 1, [6,7,9] 1, [6,8,9] 1, [6,9,9] 1, [6,10,9] 1, [6,4,11] 1, [6,5,11] 1, [6,6,11] 1, [6,7,11] 1, [6,8,11] 1, [6,9,11] 1, [6,10,11] 1, [6,2,12] 1, [6,3,12] 1, [6,4,12] 1, [6,5,12] 1, [6,6,12] 1, [6,7,12] 1, [6,8,12] 1, [6,9,12] 1, [6,10,12] 1, [6,2,13] 1, [6,3,13] 1, [6,4,13] 1, [6,5,13] 1, [6,6,13] 1, [6,7,13] 1, [6,8,13] 1, [6,9,13] 1, [6,10,13] 1, [6,6,14] 1, [6,7,14] 1, [6,8,14] 1, [6,9,14] 1, [6,10,14] 1, [6,3,16] 1, [6,4,16] 1, [6,5,16] 1, [6,6,16] 1, [6,7,16] 1, [6,8,16] 1, [6,9,16] 1, [6,4,17] 1, [6,5,17] 1, [6,6,17] 1, [6,7,17] 1, [6,8,17] 1, [6,9,17] 1, [6,10,17] 1, [6,3,18] 1, [6,4,18] 1, [6,5,18] 1, [6,6,18] 1, [6,7,18] 1, [6,8,18] 1, [6,9,18] 1, [6,10,18] 1, [6,2,19] 1, [6,3,19] 1, [6,4,19] 1, [6,5,19] 1, [6,6,19] 1, [6,7,19] 1, [6,10,19] 1, [6,2,20] 1, [6,3,20] 1, [6,4,20] 1, [6,5,20] 1, [6,6,20] 1, [6,7,20] 1, [6,8,20] 1, [6,3,23] 1, [6,4,23] 1, [6,5,23] 1, [6,6,23] 1, [6,7,23] 1, [6,8,23] 1, [6,9,23] 1, [6,10,23] 1, [6,4,25] 1, [6,5,25] 1, [6,6,25] 1, [6,7,25] 1, [6,8,25] 1, [6,9,25] 1, [6,10,25] 1, [6,3,26] 1, [6,4,26] 1, [6,5,26] 1, [6,6,26] 1, [6,7,26] 1, [6,8,26] 1, [6,9,26] 1, [6,10,26] 1, [6,3,27] 1, [6,4,27] 1, [6,5,27] 1, [6,6,27] 1, [6,7,27] 1, [6,8,27] 1, [6,9,27] 1, [6,10,27] 1, [6,6,28] 1, [6,7,28] 1, [6,8,28] 1, [6,9,28] 1, [6,10,28] 1, [8,1,1] 1, [8,2,1] 1, [8,3,1] 1, [8,4,1] 1, [8,5,1] 1, [8,6,1] 1, [8,7,1] 1, [8,8,1] 1, [8,9,1] 1, [8,10,1] 1, [8,5,5] 1, [8,6,5] 1, [8,7,5] 1, [8,8,5] 1, [8,9,5] 1, [8,10,5] 1, [8,1,6] 1, [8,2,6] 1, [8,3,6] 1, [8,4,6] 1, [8,5,6] 1, [8,6,6] 1, [8,7,6] 1, [8,8,6] 1, [8,9,6] 1, [8,10,6] 1, [8,1,7] 1, [8,2,7] 1, [8,3,7] 1, [8,4,7] 1, [8,5,7] 1, [8,6,7] 1, [8,7,7] 1, [8,8,7] 1, [8,9,7] 1, [8,10,7] 1, [8,1,8] 1, [8,2,8] 1, [8,3,8] 1, [8,4,8] 1, [8,5,8] 1, [8,6,8] 1, [8,7,8] 1, [8,8,8] 1, [8,3,10] 1, [8,4,10] 1, [8,5,10] 1, [8,6,10] 1, [8,7,10] 1, [8,8,10] 1, [8,3,11] 1, [8,4,11] 1, [8,5,11] 1, [8,6,11] 1, [8,7,11] 1, [8,8,11] 1, [8,3,12] 1, [8,4,12] 1, [8,5,12] 1, [8,6,12] 1, [8,7,12] 1, [8,8,12] 1, [8,1,14] 1, [8,2,14] 1, [8,3,14] 1, [8,4,14] 1, [8,5,14] 1, [8,6,14] 1, [8,7,14] 1, [8,8,14] 1, [8,9,14] 1, [8,10,14] 1, [8,1,15] 1, [8,2,15] 1, [8,3,15] 1, [8,4,15] 1, [8,5,15] 1, [8,6,15] 1, [8,7,15] 1, [8,8,15] 1, [8,9,15] 1, [8,10,15] 1, [8,5,19] 1, [8,6,19] 1, [8,7,19] 1, [8,8,19] 1, [8,9,19] 1, [8,10,19] 1, [8,1,20] 1, [8,2,20] 1, [8,3,20] 1, [8,4,20] 1, [8,5,20] 1, [8,6,20] 1, [8,7,20] 1, [8,8,20] 1, [8,9,20] 1, [8,10,20] 1, [8,1,21] 1, [8,2,21] 1, [8,3,21] 1, [8,4,21] 1, [8,5,21] 1, [8,6,21] 1, [8,7,21] 1, [8,8,21] 1, [8,9,21] 1, [8,10,21] 1, [8,1,22] 1, [8,2,22] 1, [8,3,22] 1, [8,4,22] 1, [8,5,22] 1, [8,6,22] 1, [8,7,22] 1, [8,8,22] 1, [8,3,24] 1, [8,4,24] 1, [8,5,24] 1, [8,6,24] 1, [8,7,24] 1, [8,8,24] 1, [8,3,25] 1, [8,4,25] 1, [8,5,25] 1, [8,6,25] 1, [8,7,25] 1, [8,8,25] 1, [8,3,26] 1, [8,4,26] 1, [8,5,26] 1, [8,6,26] 1, [8,7,26] 1, [8,8,26] 1, [8,1,28] 1, [8,2,28] 1, [8,3,28] 1, [8,4,28] 1, [8,5,28] 1, [8,6,28] 1, [8,7,28] 1, [8,8,28] 1, [8,9,28] 1, [8,10,28] 1, [12,5,1] 1, [12,6,1] 1, [12,7,1] 1, [12,8,1] 1, [12,9,1] 1, [12,10,1] 1, [12,5,2] 1, [12,6,2] 1, [12,7,2] 1, [12,8,2] 1, [12,9,2] 1, [12,10,2] 1, [12,5,3] 1, [12,6,3] 1, [12,7,3] 1, [12,8,3] 1, [12,9,3] 1, [12,10,3] 1, [12,5,4] 1, [12,6,4] 1, [12,7,4] 1, [12,8,4] 1, [12,9,4] 1, [12,10,4] 1, [12,5,5] 1, [12,6,5] 1, [12,7,5] 1, [12,8,5] 1, [12,9,5] 1, [12,10,5] 1, [12,5,7] 1, [12,6,7] 1, [12,7,7] 1, [12,8,7] 1, [12,9,7] 1, [12,10,7] 1, [12,5,8] 1, [12,6,8] 1, [12,7,8] 1, [12,8,8] 1, [12,9,8] 1, [12,10,8] 1, [12,5,9] 1, [12,6,9] 1, [12,7,9] 1, [12,8,9] 1, [12,9,9] 1, [12,10,9] 1, [12,5,10] 1, [12,6,10] 1, [12,7,10] 1, [12,8,10] 1, [12,9,10] 1, [12,10,10] 1, [12,5,11] 1, [12,6,11] 1, [12,7,11] 1, [12,8,11] 1, [12,9,11] 1, [12,10,11] 1, [12,5,12] 1, [12,6,12] 1, [12,7,12] 1, [12,8,12] 1, [12,9,12] 1, [12,10,12] 1, [12,5,14] 1, [12,6,14] 1, [12,7,14] 1, [12,8,14] 1, [12,9,14] 1, [12,10,14] 1, [12,5,15] 1, [12,6,15] 1, [12,7,15] 1, [12,8,15] 1, [12,9,15] 1, [12,10,15] 1, [12,5,16] 1, [12,6,16] 1, [12,7,16] 1, [12,8,16] 1, [12,9,16] 1, [12,10,16] 1, [12,5,17] 1, [12,6,17] 1, [12,7,17] 1, [12,8,17] 1, [12,9,17] 1, [12,10,17] 1, [12,5,18] 1, [12,6,18] 1, [12,7,18] 1, [12,8,18] 1, [12,9,18] 1, [12,10,18] 1, [12,5,19] 1, [12,6,19] 1, [12,7,19] 1, [12,8,19] 1, [12,9,19] 1, [12,10,19] 1, [12,5,21] 1, [12,6,21] 1, [12,7,21] 1, [12,8,21] 1, [12,9,21] 1, [12,10,21] 1, [12,5,22] 1, [12,6,22] 1, [12,7,22] 1, [12,8,22] 1, [12,9,22] 1, [12,10,22] 1, [12,5,23] 1, [12,6,23] 1, [12,7,23] 1, [12,8,23] 1, [12,9,23] 1, [12,10,23] 1, [12,5,24] 1, [12,6,24] 1, [12,7,24] 1, [12,8,24] 1, [12,9,24] 1, [12,10,24] 1, [12,5,25] 1, [12,6,25] 1, [12,7,25] 1, [12,8,25] 1, [12,9,25] 1, [12,10,25] 1, [12,5,26] 1, [12,6,26] 1, [12,7,26] 1, [12,8,26] 1, [12,9,26] 1, [12,10,26] 1, [12,5,28] 1, [12,6,28] 1, [12,7,28] 1, [12,8,28] 1, [12,9,28] 1, [12,10,28] 1, [1,2,1] 1, [1,3,1] 1, [1,4,1] 1, [1,5,1] 1, [1,6,1] 1, [1,7,1] 1, [1,1,2] 1, [1,2,2] 1, [1,3,2] 1, [1,4,2] 1, [1,5,2] 1, [1,6,2] 1, [1,7,2] 1, [1,8,2] 1, [1,9,2] 1, [1,10,2] 1, [1,2,3] 1, [1,3,3] 1, [1,4,3] 1, [1,5,3] 1, [1,6,3] 1, [1,7,3] 1, [1,8,3] 1, [1,9,3] 1, [1,10,3] 1, [1,1,4] 1, [1,2,4] 1, [1,3,4] 1, [1,4,4] 1, [1,5,4] 1, [1,6,4] 1, [1,7,4] 1, [1,8,4] 1, [1,9,4] 1, [1,10,4] 1, [1,1,5] 1, [1,2,5] 1, [1,3,5] 1, [1,4,5] 1, [1,5,5] 1, [1,6,5] 1, [1,7,5] 1, [1,8,5] 1, [1,9,5] 1, [1,10,5] 1, [1,3,8] 1, [1,4,8] 1, [1,5,8] 1, [1,6,8] 1, [1,7,8] 1, [1,8,8] 1, [1,9,8] 1, [1,3,9] 1, [1,4,9] 1, [1,5,9] 1, [1,6,9] 1, [1,7,9] 1, [1,8,9] 1, [1,9,9] 1, [1,3,11] 1, [1,4,11] 1, [1,5,11] 1, [1,6,11] 1, [1,7,11] 1, [1,8,11] 1, [1,9,11] 1, [1,2,12] 1, [1,3,12] 1, [1,4,12] 1, [1,5,12] 1, [1,6,12] 1, [1,7,12] 1, [1,8,12] 1, [1,9,12] 1, [1,2,13] 1, [1,3,13] 1, [1,4,13] 1, [1,5,13] 1, [1,6,13] 1, [1,7,13] 1, [1,8,13] 1, [1,9,13] 1, [1,2,14] 1, [1,3,14] 1, [1,4,14] 1, [1,5,14] 1, [1,6,14] 1, [1,7,14] 1, [1,8,14] 1, [1,9,14] 1, [1,1,15] 1, [1,2,15] 1, [1,3,15] 1, [1,4,15] 1, [1,5,15] 1, [1,6,15] 1, [1,7,15] 1, [1,8,15] 1, [1,9,15] 1, [1,10,15] 1, [1,1,17] 1, [1,2,17] 1, [1,3,17] 1, [1,4,17] 1, [1,5,17] 1, [1,6,17] 1, [1,7,17] 1, [1,8,17] 1, [1,9,17] 1, [1,10,17] 1, [1,1,18] 1, [1,2,18] 1, [1,3,18] 1, [1,4,18] 1, [1,5,18] 1, [1,6,18] 1, [1,7,18] 1, [1,8,18] 1, [1,9,18] 1, [1,1,19] 1, [1,2,19] 1, [1,3,19] 1, [1,4,19] 1, [1,5,19] 1, [1,6,19] 1, [1,7,19] 1, [1,8,19] 1, [1,9,19] 1, [1,1,20] 1, [1,2,20] 1, [1,3,20] 1, [1,4,20] 1, [1,5,20] 1, [1,6,20] 1, [1,7,20] 1, [1,8,20] 1, [1,9,20] 1, [1,1,24] 1, [1,2,24] 1, [1,3,24] 1, [1,4,24] 1, [1,5,24] 1, [1,6,24] 1, [1,7,24] 1, [1,8,24] 1, [1,9,24] 1, [1,10,24] 1, [1,3,26] 1, [1,4,26] 1, [1,5,26] 1, [1,6,26] 1, [1,7,26] 1, [1,8,26] 1, [1,9,26] 1, [1,10,26] 1, [1,2,27] 1, [1,3,27] 1, [1,4,27] 1, [1,5,27] 1, [1,6,27] 1, [1,7,27] 1, [1,8,27] 1, [1,9,27] 1, [1,10,27] 1, [1,3,28] 1, [1,4,28] 1, [1,5,28] 1, [1,6,28] 1, [1,7,28] 1, [1,8,28] 1, [1,9,28] 1, [1,10,28] 1, [2,3,2] 1, [2,4,2] 1, [2,5,2] 1, [2,6,2] 1, [2,7,2] 1, [2,8,2] 1, [2,9,2] 1, [2,1,3] 1, [2,2,3] 1, [2,3,3] 1, [2,4,3] 1, [2,5,3] 1, [2,6,3] 1, [2,7,3] 1, [2,8,3] 1, [2,9,3] 1, [2,10,3] 1, [2,3,4] 1, [2,4,4] 1, [2,5,4] 1, [2,6,4] 1, [2,7,4] 1, [2,8,4] 1, [2,9,4] 1, [2,10,4] 1, [2,2,5] 1, [2,3,5] 1, [2,4,5] 1, [2,5,5] 1, [2,6,5] 1, [2,7,5] 1, [2,10,5] 1, [2,2,6] 1, [2,3,6] 1, [2,4,6] 1, [2,5,6] 1, [2,6,6] 1, [2,7,6] 1, [2,8,6] 1, [2,9,6] 1, [2,1,7] 1, [2,2,7] 1, [2,3,7] 1, [2,4,7] 1, [2,5,7] 1, [2,6,7] 1, [2,7,7] 1, [2,8,7] 1, [2,9,7] 1, [2,2,8] 1, [2,3,8] 1, [2,4,8] 1, [2,5,8] 1, [2,6,8] 1, [2,7,8] 1, [2,1,9] 1, [2,2,9] 1, [2,3,9] 1, [2,4,9] 1, [2,5,9] 1, [2,6,9] 1, [2,7,9] 1, [2,8,9] 1, [2,9,9] 1, [2,10,9] 1, [2,1,11] 1, [2,2,11] 1, [2,3,11] 1, [2,4,11] 1, [2,5,11] 1, [2,6,11] 1, [2,7,11] 1, [2,8,11] 1, [2,9,11] 1, [2,10,11] 1, [2,1,12] 1, [2,3,12] 1, [2,4,12] 1, [2,5,12] 1, [2,6,12] 1, [2,7,12] 1, [2,8,12] 1, [2,9,12] 1, [2,10,12] 1, [2,1,13] 1, [2,3,13] 1, [2,4,13] 1, [2,5,13] 1, [2,6,13] 1, [2,7,13] 1, [2,8,13] 1, [2,9,13] 1, [2,10,13] 1, [2,1,15] 1, [2,2,15] 1, [2,3,15] 1, [2,4,15] 1, [2,5,15] 1, [2,6,15] 1, [2,7,15] 1, [2,8,15] 1, [2,9,15] 1, [2,10,15] 1, [2,1,16] 1, [2,2,16] 1, [2,3,16] 1, [2,4,16] 1, [2,5,16] 1, [2,6,16] 1, [2,7,16] 1, [2,8,16] 1, [2,9,16] 1, [2,10,16] 1, [2,1,17] 1, [2,2,17] 1, [2,3,17] 1, [2,4,17] 1, [2,5,17] 1, [2,6,17] 1, [2,7,17] 1, [2,8,17] 1, [2,9,17] 1, [2,10,17] 1, [2,3,20] 1, [2,4,20] 1, [2,5,20] 1, [2,6,20] 1, [2,7,20] 1, [2,8,20] 1, [2,9,20] 1, [2,10,20] 1, [2,3,21] 1, [2,4,21] 1, [2,5,21] 1, [2,6,21] 1, [2,7,21] 1, [2,8,21] 1, [2,9,21] 1, [2,10,21] 1, [2,1,22] 1, [2,2,22] 1, [2,3,22] 1, [2,4,22] 1, [2,5,22] 1, [2,6,22] 1, [2,7,22] 1, [2,8,22] 1, [2,9,22] 1, [2,10,22] 1, [2,1,24] 1, [2,2,24] 1, [2,3,24] 1, [2,4,24] 1, [2,5,24] 1, [2,6,24] 1, [2,7,24] 1, [2,8,24] 1, [2,9,24] 1, [2,10,24] 1, [2,1,25] 1, [2,2,25] 1, [2,3,25] 1, [2,4,25] 1, [2,5,25] 1, [2,6,25] 1, [2,7,25] 1, [2,8,25] 1, [2,9,25] 1, [2,1,26] 1, [2,2,26] 1, [2,3,26] 1, [2,4,26] 1, [2,5,26] 1, [2,6,26] 1, [2,7,26] 1, [2,8,26] 1, [2,9,26] 1, [2,1,27] 1, [2,2,27] 1, [2,3,27] 1, [2,4,27] 1, [2,5,27] 1, [2,6,27] 1, [2,7,27] 1, [2,8,27] 1, [2,9,27] 1, [3,1,1] 1, [3,2,1] 1, [3,3,1] 1, [3,4,1] 1, [3,5,1] 1, [3,6,1] 1, [3,7,1] 1, [3,8,1] 1, [3,9,1] 1, [3,1,3] 1, [3,2,3] 1, [3,3,3] 1, [3,4,3] 1, [3,5,3] 1, [3,6,3] 1, [3,7,3] 1, [3,8,3] 1, [3,9,3] 1, [3,10,3] 1, [3,1,4] 1, [3,2,4] 1, [3,3,4] 1, [3,4,4] 1, [3,5,4] 1, [3,6,4] 1, [3,7,4] 1, [3,8,4] 1, [3,9,4] 1, [3,10,4] 1, [3,1,5] 1, [3,2,5] 1, [3,3,5] 1, [3,4,5] 1, [3,5,5] 1, [3,6,5] 1, [3,7,5] 1, [3,8,5] 1, [3,9,5] 1, [3,1,6] 1, [3,2,6] 1, [3,3,6] 1, [3,4,6] 1, [3,5,6] 1, [3,6,6] 1, [3,7,6] 1, [3,8,6] 1, [3,9,6] 1, [3,1,8] 1, [3,2,8] 1, [3,3,8] 1, [3,4,8] 1, [3,5,8] 1, [3,6,8] 1, [3,7,8] 1, [3,1,9] 1, [3,2,9] 1, [3,3,9] 1, [3,4,9] 1, [3,5,9] 1, [3,6,9] 1, [3,7,9] 1, [3,8,9] 1, [3,9,9] 1, [3,10,9] 1, [3,1,11] 1, [3,2,11] 1, [3,3,11] 1, [3,4,11] 1, [3,5,11] 1, [3,6,11] 1, [3,7,11] 1, [3,8,11] 1, [3,9,11] 1, [3,10,11] 1, [3,1,12] 1, [3,3,12] 1, [3,4,12] 1, [3,5,12] 1, [3,6,12] 1, [3,7,12] 1, [3,8,12] 1, [3,9,12] 1, [3,10,12] 1, [3,1,13] 1, [3,3,13] 1, [3,4,13] 1, [3,5,13] 1, [3,6,13] 1, [3,7,13] 1, [3,8,13] 1, [3,9,13] 1, [3,10,13] 1, [3,1,15] 1, [3,2,15] 1, [3,3,15] 1, [3,4,15] 1, [3,5,15] 1, [3,6,15] 1, [3,7,15] 1, [3,8,15] 1, [3,9,15] 1, [3,10,15] 1, [3,1,16] 1, [3,2,16] 1, [3,3,16] 1, [3,4,16] 1, [3,5,16] 1, [3,6,16] 1, [3,7,16] 1, [3,8,16] 1, [3,9,16] 1, [3,10,16] 1, [3,1,17] 1, [3,2,17] 1, [3,3,17] 1, [3,4,17] 1, [3,5,17] 1, [3,6,17] 1, [3,7,17] 1, [3,8,17] 1, [3,9,17] 1, [3,10,17] 1, [3,3,20] 1, [3,4,20] 1, [3,5,20] 1, [3,6,20] 1, [3,7,20] 1, [3,8,20] 1, [3,9,20] 1, [3,10,20] 1, [3,3,21] 1, [3,4,21] 1, [3,5,21] 1, [3,6,21] 1, [3,7,21] 1, [3,8,21] 1, [3,9,21] 1, [3,10,21] 1, [3,1,22] 1, [3,2,22] 1, [3,3,22] 1, [3,4,22] 1, [3,5,22] 1, [3,6,22] 1, [3,7,22] 1, [3,8,22] 1, [3,9,22] 1, [3,10,22] 1, [3,1,24] 1, [3,2,24] 1, [3,3,24] 1, [3,4,24] 1, [3,5,24] 1, [3,6,24] 1, [3,7,24] 1, [3,8,24] 1, [3,9,24] 1, [3,10,24] 1, [3,1,25] 1, [3,2,25] 1, [3,3,25] 1, [3,4,25] 1, [3,5,25] 1, [3,6,25] 1, [3,7,25] 1, [3,8,25] 1, [3,9,25] 1, [3,1,26] 1, [3,2,26] 1, [3,3,26] 1, [3,4,26] 1, [3,5,26] 1, [3,6,26] 1, [3,7,26] 1, [3,8,26] 1, [3,9,26] 1, [3,1,27] 1, [3,2,27] 1, [3,3,27] 1, [3,4,27] 1, [3,5,27] 1, [3,6,27] 1, [3,7,27] 1, [3,8,27] 1, [3,9,27] 1, [10,1,6] 1, [10,2,6] 1, [10,3,6] 1, [10,4,6] 1, [10,5,6] 1, [10,6,6] 1, [10,7,6] 1, [10,8,6] 1, [10,9,6] 1, [10,10,6] 1, [10,1,7] 1, [10,2,7] 1, [10,3,7] 1, [10,4,7] 1, [10,5,7] 1, [10,6,7] 1, [10,7,7] 1, [10,8,7] 1, [10,9,7] 1, [10,10,7] 1, [10,1,13] 1, [10,2,13] 1, [10,3,13] 1, [10,4,13] 1, [10,5,13] 1, [10,6,13] 1, [10,7,13] 1, [10,8,13] 1, [10,9,13] 1, [10,10,13] 1, [10,1,14] 1, [10,2,14] 1, [10,3,14] 1, [10,4,14] 1, [10,5,14] 1, [10,6,14] 1, [10,7,14] 1, [10,8,14] 1, [10,9,14] 1, [10,10,14] 1, [10,1,20] 1, [10,2,20] 1, [10,3,20] 1, [10,4,20] 1, [10,5,20] 1, [10,6,20] 1, [10,7,20] 1, [10,8,20] 1, [10,9,20] 1, [10,10,20] 1, [10,1,21] 1, [10,2,21] 1, [10,3,21] 1, [10,4,21] 1, [10,5,21] 1, [10,6,21] 1, [10,7,21] 1, [10,8,21] 1, [10,9,21] 1, [10,10,21] 1, [10,1,27] 1, [10,2,27] 1, [10,3,27] 1, [10,4,27] 1, [10,5,27] 1, [10,6,27] 1, [10,7,27] 1, [10,8,27] 1, [10,9,27] 1, [10,10,27] 1, [10,1,28] 1, [10,2,28] 1, [10,3,28] 1, [10,4,28] 1, [10,5,28] 1, [10,6,28] 1, [10,7,28] 1, [10,8,28] 1, [10,9,28] 1, [10,10,28] 1, [11,5,1] 1, [11,6,1] 1, [11,7,1] 1, [11,8,1] 1, [11,9,1] 1, [11,10,1] 1, [11,5,2] 1, [11,6,2] 1, [11,7,2] 1, [11,8,2] 1, [11,9,2] 1, [11,10,2] 1, [11,5,3] 1, [11,6,3] 1, [11,7,3] 1, [11,8,3] 1, [11,9,3] 1, [11,10,3] 1, [11,5,4] 1, [11,6,4] 1, [11,7,4] 1, [11,8,4] 1, [11,9,4] 1, [11,10,4] 1, [11,5,5] 1, [11,6,5] 1, [11,7,5] 1, [11,8,5] 1, [11,9,5] 1, [11,10,5] 1, [11,5,6] 1, [11,6,6] 1, [11,7,6] 1, [11,8,6] 1, [11,9,6] 1, [11,10,6] 1, [11,5,8] 1, [11,6,8] 1, [11,7,8] 1, [11,8,8] 1, [11,9,8] 1, [11,10,8] 1, [11,5,9] 1, [11,6,9] 1, [11,7,9] 1, [11,8,9] 1, [11,9,9] 1, [11,10,9] 1, [11,5,10] 1, [11,6,10] 1, [11,7,10] 1, [11,8,10] 1, [11,9,10] 1, [11,10,10] 1, [11,5,11] 1, [11,6,11] 1, [11,7,11] 1, [11,8,11] 1, [11,9,11] 1, [11,10,11] 1, [11,5,12] 1, [11,6,12] 1, [11,7,12] 1, [11,8,12] 1, [11,9,12] 1, [11,10,12] 1, [11,5,13] 1, [11,6,13] 1, [11,7,13] 1, [11,8,13] 1, [11,9,13] 1, [11,10,13] 1, [11,5,15] 1, [11,6,15] 1, [11,7,15] 1, [11,8,15] 1, [11,9,15] 1, [11,10,15] 1, [11,5,16] 1, [11,6,16] 1, [11,7,16] 1, [11,8,16] 1, [11,9,16] 1, [11,10,16] 1, [11,5,17] 1, [11,6,17] 1, [11,7,17] 1, [11,8,17] 1, [11,9,17] 1, [11,10,17] 1, [11,5,18] 1, [11,6,18] 1, [11,7,18] 1, [11,8,18] 1, [11,9,18] 1, [11,10,18] 1, [11,5,19] 1, [11,6,19] 1, [11,7,19] 1, [11,8,19] 1, [11,9,19] 1, [11,10,19] 1, [11,5,20] 1, [11,6,20] 1, [11,7,20] 1, [11,8,20] 1, [11,9,20] 1, [11,10,20] 1, [11,5,22] 1, [11,6,22] 1, [11,7,22] 1, [11,8,22] 1, [11,9,22] 1, [11,10,22] 1, [11,5,23] 1, [11,6,23] 1, [11,7,23] 1, [11,8,23] 1, [11,9,23] 1, [11,10,23] 1, [11,5,24] 1, [11,6,24] 1, [11,7,24] 1, [11,8,24] 1, [11,9,24] 1, [11,10,24] 1, [11,5,25] 1, [11,6,25] 1, [11,7,25] 1, [11,8,25] 1, [11,9,25] 1, [11,10,25] 1, [11,5,26] 1, [11,6,26] 1, [11,7,26] 1, [11,8,26] 1, [11,9,26] 1, [11,10,26] 1, [11,5,27] 1, [11,6,27] 1, [11,7,27] 1, [11,8,27] 1, [11,9,27] 1, [11,10,27] 1, [4,1,1] 1, [4,2,1] 1, [4,3,1] 1, [4,4,1] 1, [4,5,1] 1, [4,6,1] 1, [4,7,1] 1, [4,8,1] 1, [4,9,1] 1, [4,10,1] 1, [4,1,2] 1, [4,2,2] 1, [4,3,2] 1, [4,4,2] 1, [4,5,2] 1, [4,6,2] 1, [4,7,2] 1, [4,8,2] 1, [4,9,2] 1, [4,10,2] 1, [4,3,5] 1, [4,4,5] 1, [4,5,5] 1, [4,6,5] 1, [4,7,5] 1, [4,8,5] 1, [4,9,5] 1, [4,10,5] 1, [4,2,6] 1, [4,3,6] 1, [4,4,6] 1, [4,5,6] 1, [4,6,6] 1, [4,7,6] 1, [4,8,6] 1, [4,9,6] 1, [4,10,6] 1, [4,1,7] 1, [4,2,7] 1, [4,3,7] 1, [4,4,7] 1, [4,5,7] 1, [4,6,7] 1, [4,7,7] 1, [4,8,7] 1, [4,9,7] 1, [4,10,7] 1, [4,1,8] 1, [4,2,8] 1, [4,3,8] 1, [4,4,8] 1, [4,5,8] 1, [4,6,8] 1, [4,7,8] 1, [4,8,8] 1, [4,1,10] 1, [4,2,10] 1, [4,3,10] 1, [4,4,10] 1, [4,5,10] 1, [4,6,10] 1, [4,7,10] 1, [4,8,10] 1, [4,9,10] 1, [4,10,10] 1, [4,1,11] 1, [4,2,11] 1, [4,3,11] 1, [4,4,11] 1, [4,5,11] 1, [4,6,11] 1, [4,7,11] 1, [4,8,11] 1, [4,9,11] 1, [4,1,12] 1, [4,2,12] 1, [4,3,12] 1, [4,4,12] 1, [4,5,12] 1, [4,6,12] 1, [4,7,12] 1, [4,8,12] 1, [4,9,12] 1, [4,1,13] 1, [4,2,13] 1, [4,3,13] 1, [4,4,13] 1, [4,5,13] 1, [4,6,13] 1, [4,7,13] 1, [4,8,13] 1, [4,9,13] 1, [4,3,15] 1, [4,4,15] 1, [4,5,15] 1, [4,6,15] 1, [4,7,15] 1, [4,8,15] 1, [4,9,15] 1, [4,3,16] 1, [4,4,16] 1, [4,5,16] 1, [4,6,16] 1, [4,7,16] 1, [4,8,16] 1, [4,9,16] 1, [4,3,18] 1, [4,4,18] 1, [4,5,18] 1, [4,6,18] 1, [4,7,18] 1, [4,8,18] 1, [4,9,18] 1, [4,2,19] 1, [4,3,19] 1, [4,4,19] 1, [4,5,19] 1, [4,6,19] 1, [4,7,19] 1, [4,8,19] 1, [4,9,19] 1, [4,2,20] 1, [4,3,20] 1, [4,4,20] 1, [4,5,20] 1, [4,6,20] 1, [4,7,20] 1, [4,8,20] 1, [4,9,20] 1, [4,1,21] 1, [4,2,21] 1, [4,3,21] 1, [4,4,21] 1, [4,5,21] 1, [4,6,21] 1, [4,7,21] 1, [4,8,21] 1, [4,9,21] 1, [4,1,22] 1, [4,2,22] 1, [4,3,22] 1, [4,4,22] 1, [4,5,22] 1, [4,6,22] 1, [4,1,23] 1, [4,2,23] 1, [4,3,23] 1, [4,4,23] 1, [4,5,23] 1, [4,6,23] 1, [4,7,23] 1, [4,8,23] 1, [4,9,23] 1, [4,10,23] 1, [4,1,25] 1, [4,2,25] 1, [4,3,25] 1, [4,4,25] 1, [4,5,25] 1, [4,6,25] 1, [4,7,25] 1, [4,8,25] 1, [4,9,25] 1, [4,10,25] 1, [4,1,26] 1, [4,3,26] 1, [4,4,26] 1, [4,5,26] 1, [4,6,26] 1, [4,7,26] 1, [4,8,26] 1, [4,9,26] 1, [4,10,26] 1, [4,1,27] 1, [4,3,27] 1, [4,4,27] 1, [4,5,27] 1, [4,6,27] 1, [4,7,27] 1, [4,8,27] 1, [4,9,27] 1, [4,10,27] 1, [5,3,3] 1, [5,4,3] 1, [5,5,3] 1, [5,6,3] 1, [5,7,3] 1, [5,8,3] 1, [5,9,3] 1, [5,3,4] 1, [5,4,4] 1, [5,5,4] 1, [5,6,4] 1, [5,7,4] 1, [5,8,4] 1, [5,9,4] 1, [5,10,4] 1, [5,6,5] 1, [5,7,5] 1, [5,8,5] 1, [5,9,5] 1, [5,10,5] 1, [5,4,6] 1, [5,5,6] 1, [5,6,6] 1, [5,7,6] 1, [5,8,6] 1, [5,9,6] 1, [5,10,6] 1, [5,4,7] 1, [5,5,7] 1, [5,6,7] 1, [5,7,7] 1, [5,8,7] 1, [5,9,7] 1, [5,10,7] 1, [5,3,8] 1, [5,4,8] 1, [5,5,8] 1, [5,6,8] 1, [5,7,8] 1, [5,8,8] 1, [5,9,8] 1, [5,3,9] 1, [5,4,9] 1, [5,5,9] 1, [5,6,9] 1, [5,7,9] 1, [5,8,9] 1, [5,9,9] 1, [5,3,10] 1, [5,4,10] 1, [5,5,10] 1, [5,6,10] 1, [5,7,10] 1, [5,8,10] 1, [5,9,10] 1, [5,10,10] 1, [5,3,13] 1, [5,4,13] 1, [5,5,13] 1, [5,6,13] 1, [5,7,13] 1, [5,8,13] 1, [5,9,13] 1, [5,3,14] 1, [5,4,14] 1, [5,5,14] 1, [5,6,14] 1, [5,7,14] 1, [5,8,14] 1, [5,9,14] 1, [5,2,17] 1, [5,3,17] 1, [5,4,17] 1, [5,5,17] 1, [5,6,17] 1, [5,7,17] 1, [5,8,17] 1, [5,9,17] 1, [5,2,18] 1, [5,3,18] 1, [5,4,18] 1, [5,5,18] 1, [5,6,18] 1, [5,7,18] 1, [5,8,18] 1, [5,9,18] 1, [5,10,18] 1, [5,6,19] 1, [5,7,19] 1, [5,8,19] 1, [5,9,19] 1, [5,10,19] 1, [5,4,20] 1, [5,5,20] 1, [5,6,20] 1, [5,7,20] 1, [5,8,20] 1, [5,9,20] 1, [5,10,20] 1, [5,4,21] 1, [5,5,21] 1, [5,6,21] 1, [5,7,21] 1, [5,8,21] 1, [5,9,21] 1, [5,10,21] 1, [5,3,22] 1, [5,4,22] 1, [5,5,22] 1, [5,6,22] 1, [5,7,22] 1, [5,8,22] 1, [5,9,22] 1, [5,3,23] 1, [5,4,23] 1, [5,5,23] 1, [5,6,23] 1, [5,7,23] 1, [5,8,23] 1, [5,9,23] 1, [5,3,24] 1, [5,4,24] 1, [5,5,24] 1, [5,6,24] 1, [5,7,24] 1, [5,8,24] 1, [5,9,24] 1, [5,10,24] 1, [5,3,27] 1, [5,4,27] 1, [5,5,27] 1, [5,6,27] 1, [5,7,27] 1, [5,8,27] 1, [5,9,27] 1, [5,3,28] 1, [5,4,28] 1, [5,5,28] 1, [5,6,28] 1, [5,7,28] 1, [5,8,28] 1, [5,9,28] 1, [9,7,5] 1, [9,8,5] 1, [9,9,5] 1, [9,10,5] 1, [9,7,12] 1, [9,8,12] 1, [9,9,12] 1, [9,10,12] 1, [9,1,13] 1, [9,2,13] 1, [9,3,13] 1, [9,4,13] 1, [9,5,13] 1, [9,6,13] 1, [9,7,13] 1, [9,8,13] 1, [9,9,13] 1, [9,10,13] 1, [9,1,14] 1, [9,2,14] 1, [9,3,14] 1, [9,4,14] 1, [9,5,14] 1, [9,6,14] 1, [9,7,14] 1, [9,8,14] 1, [9,9,14] 1, [9,10,14] 1, [9,7,19] 1, [9,8,19] 1, [9,9,19] 1, [9,10,19] 1, [9,1,20] 1, [9,2,20] 1, [9,3,20] 1, [9,4,20] 1, [9,5,20] 1, [9,6,20] 1, [9,7,20] 1, [9,8,20] 1, [9,9,20] 1, [9,10,20] 1, [9,1,21] 1, [9,2,21] 1, [9,3,21] 1, [9,4,21] 1, [9,5,21] 1, [9,6,21] 1, [9,7,21] 1, [9,8,21] 1, [9,9,21] 1, [9,10,21] 1, [9,7,26] 1, [9,8,26] 1, [9,9,26] 1, [9,10,26] 1, [9,1,27] 1, [9,2,27] 1, [9,3,27] 1, [9,4,27] 1, [9,5,27] 1, [9,6,27] 1, [9,7,27] 1, [9,8,27] 1, [9,9,27] 1, [9,10,27] 1, [9,1,28] 1, [9,2,28] 1, [9,3,28] 1, [9,4,28] 1, [9,5,28] 1, [9,6,28] 1, [9,7,28] 1, [9,8,28] 1, [9,9,28] 1, [9,10,28] 1, [7,3,1] 1, [7,4,1] 1, [7,5,1] 1, [7,6,1] 1, [7,7,1] 1, [7,8,1] 1, [7,9,1] 1, [7,3,2] 1, [7,4,2] 1, [7,5,2] 1, [7,6,2] 1, [7,7,2] 1, [7,8,2] 1, [7,9,2] 1, [7,3,3] 1, [7,4,3] 1, [7,5,3] 1, [7,6,3] 1, [7,7,3] 1, [7,8,3] 1, [7,9,3] 1, [7,10,3] 1, [7,3,6] 1, [7,4,6] 1, [7,5,6] 1, [7,6,6] 1, [7,7,6] 1, [7,8,6] 1, [7,9,6] 1, [7,3,7] 1, [7,4,7] 1, [7,5,7] 1, [7,6,7] 1, [7,7,7] 1, [7,8,7] 1, [7,9,7] 1, [7,3,9] 1, [7,4,9] 1, [7,5,9] 1, [7,6,9] 1, [7,7,9] 1, [7,8,9] 1, [7,9,9] 1, [7,4,10] 1, [7,5,10] 1, [7,6,10] 1, [7,7,10] 1, [7,8,10] 1, [7,9,10] 1, [7,10,10] 1, [7,3,11] 1, [7,4,11] 1, [7,5,11] 1, [7,6,11] 1, [7,7,11] 1, [7,8,11] 1, [7,9,11] 1, [7,10,11] 1, [7,2,12] 1, [7,3,12] 1, [7,4,12] 1, [7,5,12] 1, [7,6,12] 1, [7,7,12] 1, [7,10,12] 1, [7,2,13] 1, [7,3,13] 1, [7,4,13] 1, [7,5,13] 1, [7,6,13] 1, [7,7,13] 1, [7,8,13] 1, [7,3,16] 1, [7,4,16] 1, [7,5,16] 1, [7,6,16] 1, [7,7,16] 1, [7,8,16] 1, [7,9,16] 1, [7,4,17] 1, [7,5,17] 1, [7,6,17] 1, [7,7,17] 1, [7,8,17] 1, [7,9,17] 1, [7,10,17] 1, [7,3,18] 1, [7,4,18] 1, [7,5,18] 1, [7,6,18] 1, [7,7,18] 1, [7,8,18] 1, [7,9,18] 1, [7,10,18] 1, [7,2,19] 1, [7,3,19] 1, [7,4,19] 1, [7,5,19] 1, [7,6,19] 1, [7,7,19] 1, [7,10,19] 1, [7,2,20] 1, [7,3,20] 1, [7,4,20] 1, [7,5,20] 1, [7,6,20] 1, [7,7,20] 1, [7,8,20] 1, [7,3,22] 1, [7,4,22] 1, [7,5,22] 1, [7,6,22] 1, [7,7,22] 1, [7,8,22] 1, [7,9,22] 1, [7,3,23] 1, [7,4,23] 1, [7,5,23] 1, [7,6,23] 1, [7,7,23] 1, [7,8,23] 1, [7,9,23] 1, [7,3,24] 1, [7,4,24] 1, [7,5,24] 1, [7,6,24] 1, [7,7,24] 1, [7,8,24] 1, [7,9,24] 1, [7,10,24] 1, [7,3,27] 1, [7,4,27] 1, [7,5,27] 1, [7,6,27] 1, [7,7,27] 1, [7,8,27] 1, [7,9,27] 1, [7,3,28] 1, [7,4,28] 1, [7,5,28] 1, [7,6,28] 1, [7,7,28] 1, [7,8,28] 1, [7,9,28] 1	[1,1,1] 1, [2,1,1] 1, [3,1,1] 1, [4,1,1] 2, [5,1,1] 2, [6,1,1] 2, [7,1,1] 2,[8,1,1] 1,[9,1,1] 0, [10,1,1] 0, [11,1,1] 0, [12,1,1] 0	[1,1,1,1] 685442, [1,2,1,1] 685442, [1,3,1,1] 685442, [1,4,1,1] 685442, [1,5,1,1] 685442, [1,6,1,1] 685442, [1,7,1,1] 685442, [1,8,1,1] 685442, [1,9,1,1] 685442, [1,10,1,1] 685442, [1,1,2,1] 623475, [1,2,2,1] 623475, [1,3,2,1] 623475, [1,4,2,1] 623475, [1,5,2,1] 623475, [1,6,2,1] 623475, [1,7,2,1] 623475, [1,8,2,1] 623475, [1,9,2,1] 623475, [1,10,2,1] 623475, [1,1,3,1] 479796, [1,2,3,1] 479796, [1,3,3,1] 479796, [1,4,3,1] 479796, [1,5,3,1] 479796, [1,6,3,1] 479796, [1,7,3,1] 479796, [1,8,3,1] 479796, [1,9,3,1] 479796, [1,10,3,1] 479796, [1,1,4,1] 228089, [1,2,4,1] 228089, [1,3,4,1] 228089, [1,4,4,1] 228089, [1,5,4,1] 228089, [1,6,4,1] 228089, [1,7,4,1] 228089, [1,8,4,1] 228089, [1,9,4,1] 228089, [1,10,4,1] 228089, [1,1,5,1] 299813, [1,2,5,1] 299813, [1,3,5,1] 299813, [1,4,5,1] 299813, [1,5,5,1] 299813, [1,6,5,1] 299813, [1,7,5,1] 299813, [1,8,5,1] 299813, [1,9,5,1] 299813, [1,10,5,1] 299813, [1,1,6,1] 253185, [1,2,6,1] 253185, [1,3,6,1] 253185, [1,4,6,1] 253185, [1,5,6,1] 253185, [1,6,6,1] 253185, [1,7,6,1] 253185, [1,8,6,1] 253185, [1,9,6,1] 253185, [1,10,6,1] 253185, [1,1,7,1] 446040, [1,2,7,1] 446040, [1,3,7,1] 446040, [1,4,7,1] 446040, [1,5,7,1] 446040, [1,6,7,1] 446040, [1,7,7,1] 446040, [1,8,7,1] 446040, [1,9,7,1] 446040, [1,10,7,1] 446040, [1,1,8,1] 193032, [1,2,8,1] 193032, [1,3,8,1] 193032, [1,4,8,1] 193032, [1,5,8,1] 193032, [1,6,8,1] 193032, [1,7,8,1] 193032, [1,8,8,1] 193032, [1,9,8,1] 193032, [1,10,8,1] 193032, [1,1,9,1] 312012, [1,2,9,1] 312012, [1,3,9,1] 312012, [1,4,9,1] 312012, [1,5,9,1] 312012, [1,6,9,1] 312012, [1,7,9,1] 312012, [1,8,9,1] 312012, [1,9,9,1] 312012, [1,10,9,1] 312012, [1,1,10,1] 81414, [1,2,10,1] 81414, [1,3,10,1] 81414, [1,4,10,1] 81414, [1,5,10,1] 81414, [1,6,10,1] 81414, [1,7,10,1] 81414, [1,8,10,1] 81414, [1,9,10,1] 81414, [1,10,10,1] 81414, [1,1,11,1] 225402, [1,2,11,1] 225402, [1,3,11,1] 225402, [1,4,11,1] 225402, [1,5,11,1] 225402, [1,6,11,1] 225402, [1,7,11,1] 225402, [1,8,11,1] 225402, [1,9,11,1] 225402, [1,10,11,1] 225402, [1,1,12,1] 358316, [1,2,12,1] 358316, [1,3,12,1] 358316, [1,4,12,1] 358316, [1,5,12,1] 358316, [1,6,12,1] 358316, [1,7,12,1] 358316, [1,8,12,1] 358316, [1,9,12,1] 358316, [1,10,12,1] 358316, [1,1,13,1] 187467, [1,2,13,1] 187467, [1,3,13,1] 187467, [1,4,13,1] 187467, [1,5,13,1] 187467, [1,6,13,1] 187467, [1,7,13,1] 187467, [1,8,13,1] 187467, [1,9,13,1] 187467, [1,10,13,1] 187467, [1,1,14,1] 291876, [1,2,14,1] 291876, [1,3,14,1] 291876, [1,4,14,1] 291876, [1,5,14,1] 291876, [1,6,14,1] 291876, [1,7,14,1] 291876, [1,8,14,1] 291876, [1,9,14,1] 291876, [1,10,14,1] 291876, [1,1,15,1] 219974, [1,2,15,1] 219974, [1,3,15,1] 219974, [1,4,15,1] 219974, [1,5,15,1] 219974, [1,6,15,1] 219974, [1,7,15,1] 219974, [1,8,15,1] 219974, [1,9,15,1] 219974, [1,10,15,1] 219974, [1,1,16,1] 802449, [1,2,16,1] 802449, [1,3,16,1] 802449, [1,4,16,1] 802449, [1,5,16,1] 802449, [1,6,16,1] 802449, [1,7,16,1] 802449, [1,8,16,1] 802449, [1,9,16,1] 802449, [1,10,16,1] 802449, [1,1,17,1] 73977, [1,2,17,1] 73977, [1,3,17,1] 73977, [1,4,17,1] 73977, [1,5,17,1] 73977, [1,6,17,1] 73977, [1,7,17,1] 73977, [1,8,17,1] 73977, [1,9,17,1] 73977, [1,10,17,1] 73977, [1,1,18,1] 102762, [1,2,18,1] 102762, [1,3,18,1] 102762, [1,4,18,1] 102762, [1,5,18,1] 102762, [1,6,18,1] 102762, [1,7,18,1] 102762, [1,8,18,1] 102762, [1,9,18,1] 102762, [1,10,18,1] 102762, [1,1,19,1] 177820, [1,2,19,1] 177820, [1,3,19,1] 177820, [1,4,19,1] 177820, [1,5,19,1] 177820, [1,6,19,1] 177820, [1,7,19,1] 177820, [1,8,19,1] 177820, [1,9,19,1] 177820, [1,10,19,1] 177820, [1,1,20,1] 236335, [1,2,20,1] 236335, [1,3,20,1] 236335, [1,4,20,1] 236335, [1,5,20,1] 236335, [1,6,20,1] 236335, [1,7,20,1] 236335, [1,8,20,1] 236335, [1,9,20,1] 236335, [1,10,20,1] 236335, [1,1,21,1] 316324, [1,2,21,1] 316324, [1,3,21,1] 316324, [1,4,21,1] 316324, [1,5,21,1] 316324, [1,6,21,1] 316324, [1,7,21,1] 316324, [1,8,21,1] 316324, [1,9,21,1] 316324, [1,10,21,1] 316324, [1,1,22,1] 200218, [1,2,22,1] 200218, [1,3,22,1] 200218, [1,4,22,1] 200218, [1,5,22,1] 200218, [1,6,22,1] 200218, [1,7,22,1] 200218, [1,8,22,1] 200218, [1,9,22,1] 200218, [1,10,22,1] 200218, [1,1,23,1] 218724, [1,2,23,1] 218724, [1,3,23,1] 218724, [1,4,23,1] 218724, [1,5,23,1] 218724, [1,6,23,1] 218724, [1,7,23,1] 218724, [1,8,23,1] 218724, [1,9,23,1] 218724, [1,10,23,1] 218724, [1,1,24,1] 105543, [1,2,24,1] 105543, [1,3,24,1] 105543, [1,4,24,1] 105543, [1,5,24,1] 105543, [1,6,24,1] 105543, [1,7,24,1] 105543, [1,8,24,1] 105543, [1,9,24,1] 105543, [1,10,24,1] 105543, [1,1,25,1] 138240, [1,2,25,1] 138240, [1,3,25,1] 138240, [1,4,25,1] 138240, [1,5,25,1] 138240, [1,6,25,1] 138240, [1,7,25,1] 138240, [1,8,25,1] 138240, [1,9,25,1] 138240, [1,10,25,1] 138240, [1,1,26,1] 283995, [1,2,26,1] 283995, [1,3,26,1] 283995, [1,4,26,1] 283995, [1,5,26,1] 283995, [1,6,26,1] 283995, [1,7,26,1] 283995, [1,8,26,1] 283995, [1,9,26,1] 283995, [1,10,26,1] 283995, [1,1,27,1] 174404, [1,2,27,1] 174404, [1,3,27,1] 174404, [1,4,27,1] 174404, [1,5,27,1] 174404, [1,6,27,1] 174404, [1,7,27,1] 174404, [1,8,27,1] 174404, [1,9,27,1] 174404, [1,10,27,1] 174404, [1,1,28,1] 287671, [1,2,28,1] 287671, [1,3,28,1] 287671, [1,4,28,1] 287671, [1,5,28,1] 287671, [1,6,28,1] 287671, [1,7,28,1] 287671, [1,8,28,1] 287671, [1,9,28,1] 287671, [1,10,28,1] 287671	2018-05-16 19:59:43.58578	2018-05-16 19:59:43.58578	3	2018
35	32	12	1	28	10	2500	65000		[1,6] 95000,[2,6] 95000,[3,6] 95000,[4,6] 95000,[5,6] 95000,[6,6] 95000,[7,6] 95000,[8,6] 95000,[9,6] 95000,[10,6] 95000,[1,7] 95000,[2,7] 95000,[3,7] 95000,[4,7] 95000,[5,7] 95000,[6,7] 95000,[7,7] 95000,[8,7] 95000,[9,7] 95000,[10,7] 95000,[1,13] 95000,[2,13] 95000,[3,13] 95000,[4,13] 95000,[5,13] 95000,[6,13] 95000,[7,13] 95000,[8,13] 95000,[9,13] 95000,[10,13] 95000,[1,14] 95000,[2,14] 95000,[3,14] 95000,[4,14] 95000,[5,14] 95000,[6,14] 95000,[7,14] 95000,[8,14] 95000,[9,14] 95000,[10,14] 95000,[1,20] 95000,[2,20] 95000,[3,20] 95000,[4,20] 95000,[5,20] 95000,[6,20] 95000,[7,20] 95000,[8,20] 95000,[9,20] 95000,[10,20] 95000,[1,21] 95000,[2,21] 95000,[3,21] 95000,[4,21] 95000,[5,21] 95000,[6,21] 95000,[7,21] 95000,[8,21] 95000,[9,21] 95000,[10,21] 95000,[1,27] 95000,[2,27] 95000,[3,27] 95000,[4,27] 95000,[5,27] 95000,[6,27] 95000,[7,27] 95000,[8,27] 95000,[9,27] 95000,[10,27] 95000,[1,28] 95000,[2,28] 95000,[3,28] 95000,[4,28] 95000,[5,28] 95000,[6,28] 95000,[7,28] 95000,[8,28] 95000,[9,28] 95000,[10,28] 95000	[1] 1, [2] 1	[2] 1, [3] 1, [4] 1, [5] 1	2	[6,3,2] 1, [6,4,2] 1, [6,5,2] 1, [6,6,2] 1, [6,7,2] 1, [6,8,2] 1, [6,9,2] 1, [6,4,3] 1, [6,5,3] 1, [6,6,3] 1, [6,7,3] 1, [6,8,3] 1, [6,9,3] 1, [6,3,4] 1, [6,4,4] 1, [6,5,4] 1, [6,6,4] 1, [6,7,4] 1, [6,8,4] 1, [6,9,4] 1, [6,10,4] 1, [6,2,5] 1, [6,3,5] 1, [6,4,5] 1, [6,5,5] 1, [6,6,5] 1, [6,7,5] 1, [6,10,5] 1, [6,2,6] 1, [6,3,6] 1, [6,4,6] 1, [6,5,6] 1, [6,6,6] 1, [6,7,6] 1, [6,8,6] 1, [6,3,9] 1, [6,4,9] 1, [6,5,9] 1, [6,6,9] 1, [6,7,9] 1, [6,8,9] 1, [6,9,9] 1, [6,10,9] 1, [6,4,11] 1, [6,5,11] 1, [6,6,11] 1, [6,7,11] 1, [6,8,11] 1, [6,9,11] 1, [6,10,11] 1, [6,2,12] 1, [6,3,12] 1, [6,4,12] 1, [6,5,12] 1, [6,6,12] 1, [6,7,12] 1, [6,8,12] 1, [6,9,12] 1, [6,10,12] 1, [6,2,13] 1, [6,3,13] 1, [6,4,13] 1, [6,5,13] 1, [6,6,13] 1, [6,7,13] 1, [6,8,13] 1, [6,9,13] 1, [6,10,13] 1, [6,6,14] 1, [6,7,14] 1, [6,8,14] 1, [6,9,14] 1, [6,10,14] 1, [6,3,16] 1, [6,4,16] 1, [6,5,16] 1, [6,6,16] 1, [6,7,16] 1, [6,8,16] 1, [6,9,16] 1, [6,4,17] 1, [6,5,17] 1, [6,6,17] 1, [6,7,17] 1, [6,8,17] 1, [6,9,17] 1, [6,10,17] 1, [6,3,18] 1, [6,4,18] 1, [6,5,18] 1, [6,6,18] 1, [6,7,18] 1, [6,8,18] 1, [6,9,18] 1, [6,10,18] 1, [6,2,19] 1, [6,3,19] 1, [6,4,19] 1, [6,5,19] 1, [6,6,19] 1, [6,7,19] 1, [6,10,19] 1, [6,2,20] 1, [6,3,20] 1, [6,4,20] 1, [6,5,20] 1, [6,6,20] 1, [6,7,20] 1, [6,8,20] 1, [6,3,23] 1, [6,4,23] 1, [6,5,23] 1, [6,6,23] 1, [6,7,23] 1, [6,8,23] 1, [6,9,23] 1, [6,10,23] 1, [6,4,25] 1, [6,5,25] 1, [6,6,25] 1, [6,7,25] 1, [6,8,25] 1, [6,9,25] 1, [6,10,25] 1, [6,3,26] 1, [6,4,26] 1, [6,5,26] 1, [6,6,26] 1, [6,7,26] 1, [6,8,26] 1, [6,9,26] 1, [6,10,26] 1, [6,3,27] 1, [6,4,27] 1, [6,5,27] 1, [6,6,27] 1, [6,7,27] 1, [6,8,27] 1, [6,9,27] 1, [6,10,27] 1, [6,6,28] 1, [6,7,28] 1, [6,8,28] 1, [6,9,28] 1, [6,10,28] 1, [8,1,1] 1, [8,2,1] 1, [8,3,1] 1, [8,4,1] 1, [8,5,1] 1, [8,6,1] 1, [8,7,1] 1, [8,8,1] 1, [8,9,1] 1, [8,10,1] 1, [8,5,5] 1, [8,6,5] 1, [8,7,5] 1, [8,8,5] 1, [8,9,5] 1, [8,10,5] 1, [8,1,6] 1, [8,2,6] 1, [8,3,6] 1, [8,4,6] 1, [8,5,6] 1, [8,6,6] 1, [8,7,6] 1, [8,8,6] 1, [8,9,6] 1, [8,10,6] 1, [8,1,7] 1, [8,2,7] 1, [8,3,7] 1, [8,4,7] 1, [8,5,7] 1, [8,6,7] 1, [8,7,7] 1, [8,8,7] 1, [8,9,7] 1, [8,10,7] 1, [8,1,8] 1, [8,2,8] 1, [8,3,8] 1, [8,4,8] 1, [8,5,8] 1, [8,6,8] 1, [8,7,8] 1, [8,8,8] 1, [8,3,10] 1, [8,4,10] 1, [8,5,10] 1, [8,6,10] 1, [8,7,10] 1, [8,8,10] 1, [8,3,11] 1, [8,4,11] 1, [8,5,11] 1, [8,6,11] 1, [8,7,11] 1, [8,8,11] 1, [8,3,12] 1, [8,4,12] 1, [8,5,12] 1, [8,6,12] 1, [8,7,12] 1, [8,8,12] 1, [8,1,14] 1, [8,2,14] 1, [8,3,14] 1, [8,4,14] 1, [8,5,14] 1, [8,6,14] 1, [8,7,14] 1, [8,8,14] 1, [8,9,14] 1, [8,10,14] 1, [8,1,15] 1, [8,2,15] 1, [8,3,15] 1, [8,4,15] 1, [8,5,15] 1, [8,6,15] 1, [8,7,15] 1, [8,8,15] 1, [8,9,15] 1, [8,10,15] 1, [8,5,19] 1, [8,6,19] 1, [8,7,19] 1, [8,8,19] 1, [8,9,19] 1, [8,10,19] 1, [8,1,20] 1, [8,2,20] 1, [8,3,20] 1, [8,4,20] 1, [8,5,20] 1, [8,6,20] 1, [8,7,20] 1, [8,8,20] 1, [8,9,20] 1, [8,10,20] 1, [8,1,21] 1, [8,2,21] 1, [8,3,21] 1, [8,4,21] 1, [8,5,21] 1, [8,6,21] 1, [8,7,21] 1, [8,8,21] 1, [8,9,21] 1, [8,10,21] 1, [8,1,22] 1, [8,2,22] 1, [8,3,22] 1, [8,4,22] 1, [8,5,22] 1, [8,6,22] 1, [8,7,22] 1, [8,8,22] 1, [8,3,24] 1, [8,4,24] 1, [8,5,24] 1, [8,6,24] 1, [8,7,24] 1, [8,8,24] 1, [8,3,25] 1, [8,4,25] 1, [8,5,25] 1, [8,6,25] 1, [8,7,25] 1, [8,8,25] 1, [8,3,26] 1, [8,4,26] 1, [8,5,26] 1, [8,6,26] 1, [8,7,26] 1, [8,8,26] 1, [8,1,28] 1, [8,2,28] 1, [8,3,28] 1, [8,4,28] 1, [8,5,28] 1, [8,6,28] 1, [8,7,28] 1, [8,8,28] 1, [8,9,28] 1, [8,10,28] 1, [12,5,1] 1, [12,6,1] 1, [12,7,1] 1, [12,8,1] 1, [12,9,1] 1, [12,10,1] 1, [12,5,2] 1, [12,6,2] 1, [12,7,2] 1, [12,8,2] 1, [12,9,2] 1, [12,10,2] 1, [12,5,3] 1, [12,6,3] 1, [12,7,3] 1, [12,8,3] 1, [12,9,3] 1, [12,10,3] 1, [12,5,4] 1, [12,6,4] 1, [12,7,4] 1, [12,8,4] 1, [12,9,4] 1, [12,10,4] 1, [12,5,5] 1, [12,6,5] 1, [12,7,5] 1, [12,8,5] 1, [12,9,5] 1, [12,10,5] 1, [12,5,7] 1, [12,6,7] 1, [12,7,7] 1, [12,8,7] 1, [12,9,7] 1, [12,10,7] 1, [12,5,8] 1, [12,6,8] 1, [12,7,8] 1, [12,8,8] 1, [12,9,8] 1, [12,10,8] 1, [12,5,9] 1, [12,6,9] 1, [12,7,9] 1, [12,8,9] 1, [12,9,9] 1, [12,10,9] 1, [12,5,10] 1, [12,6,10] 1, [12,7,10] 1, [12,8,10] 1, [12,9,10] 1, [12,10,10] 1, [12,5,11] 1, [12,6,11] 1, [12,7,11] 1, [12,8,11] 1, [12,9,11] 1, [12,10,11] 1, [12,5,12] 1, [12,6,12] 1, [12,7,12] 1, [12,8,12] 1, [12,9,12] 1, [12,10,12] 1, [12,5,14] 1, [12,6,14] 1, [12,7,14] 1, [12,8,14] 1, [12,9,14] 1, [12,10,14] 1, [12,5,15] 1, [12,6,15] 1, [12,7,15] 1, [12,8,15] 1, [12,9,15] 1, [12,10,15] 1, [12,5,16] 1, [12,6,16] 1, [12,7,16] 1, [12,8,16] 1, [12,9,16] 1, [12,10,16] 1, [12,5,17] 1, [12,6,17] 1, [12,7,17] 1, [12,8,17] 1, [12,9,17] 1, [12,10,17] 1, [12,5,18] 1, [12,6,18] 1, [12,7,18] 1, [12,8,18] 1, [12,9,18] 1, [12,10,18] 1, [12,5,19] 1, [12,6,19] 1, [12,7,19] 1, [12,8,19] 1, [12,9,19] 1, [12,10,19] 1, [12,5,21] 1, [12,6,21] 1, [12,7,21] 1, [12,8,21] 1, [12,9,21] 1, [12,10,21] 1, [12,5,22] 1, [12,6,22] 1, [12,7,22] 1, [12,8,22] 1, [12,9,22] 1, [12,10,22] 1, [12,5,23] 1, [12,6,23] 1, [12,7,23] 1, [12,8,23] 1, [12,9,23] 1, [12,10,23] 1, [12,5,24] 1, [12,6,24] 1, [12,7,24] 1, [12,8,24] 1, [12,9,24] 1, [12,10,24] 1, [12,5,25] 1, [12,6,25] 1, [12,7,25] 1, [12,8,25] 1, [12,9,25] 1, [12,10,25] 1, [12,5,26] 1, [12,6,26] 1, [12,7,26] 1, [12,8,26] 1, [12,9,26] 1, [12,10,26] 1, [12,5,28] 1, [12,6,28] 1, [12,7,28] 1, [12,8,28] 1, [12,9,28] 1, [12,10,28] 1, [1,2,1] 1, [1,3,1] 1, [1,4,1] 1, [1,5,1] 1, [1,6,1] 1, [1,7,1] 1, [1,1,2] 1, [1,2,2] 1, [1,3,2] 1, [1,4,2] 1, [1,5,2] 1, [1,6,2] 1, [1,7,2] 1, [1,8,2] 1, [1,9,2] 1, [1,10,2] 1, [1,2,3] 1, [1,3,3] 1, [1,4,3] 1, [1,5,3] 1, [1,6,3] 1, [1,7,3] 1, [1,8,3] 1, [1,9,3] 1, [1,10,3] 1, [1,1,4] 1, [1,2,4] 1, [1,3,4] 1, [1,4,4] 1, [1,5,4] 1, [1,6,4] 1, [1,7,4] 1, [1,8,4] 1, [1,9,4] 1, [1,10,4] 1, [1,1,5] 1, [1,2,5] 1, [1,3,5] 1, [1,4,5] 1, [1,5,5] 1, [1,6,5] 1, [1,7,5] 1, [1,8,5] 1, [1,9,5] 1, [1,10,5] 1, [1,3,8] 1, [1,4,8] 1, [1,5,8] 1, [1,6,8] 1, [1,7,8] 1, [1,8,8] 1, [1,9,8] 1, [1,3,9] 1, [1,4,9] 1, [1,5,9] 1, [1,6,9] 1, [1,7,9] 1, [1,8,9] 1, [1,9,9] 1, [1,3,11] 1, [1,4,11] 1, [1,5,11] 1, [1,6,11] 1, [1,7,11] 1, [1,8,11] 1, [1,9,11] 1, [1,2,12] 1, [1,3,12] 1, [1,4,12] 1, [1,5,12] 1, [1,6,12] 1, [1,7,12] 1, [1,8,12] 1, [1,9,12] 1, [1,2,13] 1, [1,3,13] 1, [1,4,13] 1, [1,5,13] 1, [1,6,13] 1, [1,7,13] 1, [1,8,13] 1, [1,9,13] 1, [1,2,14] 1, [1,3,14] 1, [1,4,14] 1, [1,5,14] 1, [1,6,14] 1, [1,7,14] 1, [1,8,14] 1, [1,9,14] 1, [1,1,15] 1, [1,2,15] 1, [1,3,15] 1, [1,4,15] 1, [1,5,15] 1, [1,6,15] 1, [1,7,15] 1, [1,8,15] 1, [1,9,15] 1, [1,10,15] 1, [1,1,17] 1, [1,2,17] 1, [1,3,17] 1, [1,4,17] 1, [1,5,17] 1, [1,6,17] 1, [1,7,17] 1, [1,8,17] 1, [1,9,17] 1, [1,10,17] 1, [1,1,18] 1, [1,2,18] 1, [1,3,18] 1, [1,4,18] 1, [1,5,18] 1, [1,6,18] 1, [1,7,18] 1, [1,8,18] 1, [1,9,18] 1, [1,1,19] 1, [1,2,19] 1, [1,3,19] 1, [1,4,19] 1, [1,5,19] 1, [1,6,19] 1, [1,7,19] 1, [1,8,19] 1, [1,9,19] 1, [1,1,20] 1, [1,2,20] 1, [1,3,20] 1, [1,4,20] 1, [1,5,20] 1, [1,6,20] 1, [1,7,20] 1, [1,8,20] 1, [1,9,20] 1, [1,1,24] 1, [1,2,24] 1, [1,3,24] 1, [1,4,24] 1, [1,5,24] 1, [1,6,24] 1, [1,7,24] 1, [1,8,24] 1, [1,9,24] 1, [1,10,24] 1, [1,3,26] 1, [1,4,26] 1, [1,5,26] 1, [1,6,26] 1, [1,7,26] 1, [1,8,26] 1, [1,9,26] 1, [1,10,26] 1, [1,2,27] 1, [1,3,27] 1, [1,4,27] 1, [1,5,27] 1, [1,6,27] 1, [1,7,27] 1, [1,8,27] 1, [1,9,27] 1, [1,10,27] 1, [1,3,28] 1, [1,4,28] 1, [1,5,28] 1, [1,6,28] 1, [1,7,28] 1, [1,8,28] 1, [1,9,28] 1, [1,10,28] 1, [2,3,2] 1, [2,4,2] 1, [2,5,2] 1, [2,6,2] 1, [2,7,2] 1, [2,8,2] 1, [2,9,2] 1, [2,1,3] 1, [2,2,3] 1, [2,3,3] 1, [2,4,3] 1, [2,5,3] 1, [2,6,3] 1, [2,7,3] 1, [2,8,3] 1, [2,9,3] 1, [2,10,3] 1, [2,3,4] 1, [2,4,4] 1, [2,5,4] 1, [2,6,4] 1, [2,7,4] 1, [2,8,4] 1, [2,9,4] 1, [2,10,4] 1, [2,2,5] 1, [2,3,5] 1, [2,4,5] 1, [2,5,5] 1, [2,6,5] 1, [2,7,5] 1, [2,10,5] 1, [2,2,6] 1, [2,3,6] 1, [2,4,6] 1, [2,5,6] 1, [2,6,6] 1, [2,7,6] 1, [2,8,6] 1, [2,9,6] 1, [2,1,7] 1, [2,2,7] 1, [2,3,7] 1, [2,4,7] 1, [2,5,7] 1, [2,6,7] 1, [2,7,7] 1, [2,8,7] 1, [2,9,7] 1, [2,2,8] 1, [2,3,8] 1, [2,4,8] 1, [2,5,8] 1, [2,6,8] 1, [2,7,8] 1, [2,1,9] 1, [2,2,9] 1, [2,3,9] 1, [2,4,9] 1, [2,5,9] 1, [2,6,9] 1, [2,7,9] 1, [2,8,9] 1, [2,9,9] 1, [2,10,9] 1, [2,1,11] 1, [2,2,11] 1, [2,3,11] 1, [2,4,11] 1, [2,5,11] 1, [2,6,11] 1, [2,7,11] 1, [2,8,11] 1, [2,9,11] 1, [2,10,11] 1, [2,1,12] 1, [2,3,12] 1, [2,4,12] 1, [2,5,12] 1, [2,6,12] 1, [2,7,12] 1, [2,8,12] 1, [2,9,12] 1, [2,10,12] 1, [2,1,13] 1, [2,3,13] 1, [2,4,13] 1, [2,5,13] 1, [2,6,13] 1, [2,7,13] 1, [2,8,13] 1, [2,9,13] 1, [2,10,13] 1, [2,1,15] 1, [2,2,15] 1, [2,3,15] 1, [2,4,15] 1, [2,5,15] 1, [2,6,15] 1, [2,7,15] 1, [2,8,15] 1, [2,9,15] 1, [2,10,15] 1, [2,1,16] 1, [2,2,16] 1, [2,3,16] 1, [2,4,16] 1, [2,5,16] 1, [2,6,16] 1, [2,7,16] 1, [2,8,16] 1, [2,9,16] 1, [2,10,16] 1, [2,1,17] 1, [2,2,17] 1, [2,3,17] 1, [2,4,17] 1, [2,5,17] 1, [2,6,17] 1, [2,7,17] 1, [2,8,17] 1, [2,9,17] 1, [2,10,17] 1, [2,3,20] 1, [2,4,20] 1, [2,5,20] 1, [2,6,20] 1, [2,7,20] 1, [2,8,20] 1, [2,9,20] 1, [2,10,20] 1, [2,3,21] 1, [2,4,21] 1, [2,5,21] 1, [2,6,21] 1, [2,7,21] 1, [2,8,21] 1, [2,9,21] 1, [2,10,21] 1, [2,1,22] 1, [2,2,22] 1, [2,3,22] 1, [2,4,22] 1, [2,5,22] 1, [2,6,22] 1, [2,7,22] 1, [2,8,22] 1, [2,9,22] 1, [2,10,22] 1, [2,1,24] 1, [2,2,24] 1, [2,3,24] 1, [2,4,24] 1, [2,5,24] 1, [2,6,24] 1, [2,7,24] 1, [2,8,24] 1, [2,9,24] 1, [2,10,24] 1, [2,1,25] 1, [2,2,25] 1, [2,3,25] 1, [2,4,25] 1, [2,5,25] 1, [2,6,25] 1, [2,7,25] 1, [2,8,25] 1, [2,9,25] 1, [2,1,26] 1, [2,2,26] 1, [2,3,26] 1, [2,4,26] 1, [2,5,26] 1, [2,6,26] 1, [2,7,26] 1, [2,8,26] 1, [2,9,26] 1, [2,1,27] 1, [2,2,27] 1, [2,3,27] 1, [2,4,27] 1, [2,5,27] 1, [2,6,27] 1, [2,7,27] 1, [2,8,27] 1, [2,9,27] 1, [3,1,1] 1, [3,2,1] 1, [3,3,1] 1, [3,4,1] 1, [3,5,1] 1, [3,6,1] 1, [3,7,1] 1, [3,8,1] 1, [3,9,1] 1, [3,1,3] 1, [3,2,3] 1, [3,3,3] 1, [3,4,3] 1, [3,5,3] 1, [3,6,3] 1, [3,7,3] 1, [3,8,3] 1, [3,9,3] 1, [3,10,3] 1, [3,1,4] 1, [3,2,4] 1, [3,3,4] 1, [3,4,4] 1, [3,5,4] 1, [3,6,4] 1, [3,7,4] 1, [3,8,4] 1, [3,9,4] 1, [3,10,4] 1, [3,1,5] 1, [3,2,5] 1, [3,3,5] 1, [3,4,5] 1, [3,5,5] 1, [3,6,5] 1, [3,7,5] 1, [3,8,5] 1, [3,9,5] 1, [3,1,6] 1, [3,2,6] 1, [3,3,6] 1, [3,4,6] 1, [3,5,6] 1, [3,6,6] 1, [3,7,6] 1, [3,8,6] 1, [3,9,6] 1, [3,1,8] 1, [3,2,8] 1, [3,3,8] 1, [3,4,8] 1, [3,5,8] 1, [3,6,8] 1, [3,7,8] 1, [3,1,9] 1, [3,2,9] 1, [3,3,9] 1, [3,4,9] 1, [3,5,9] 1, [3,6,9] 1, [3,7,9] 1, [3,8,9] 1, [3,9,9] 1, [3,10,9] 1, [3,1,11] 1, [3,2,11] 1, [3,3,11] 1, [3,4,11] 1, [3,5,11] 1, [3,6,11] 1, [3,7,11] 1, [3,8,11] 1, [3,9,11] 1, [3,10,11] 1, [3,1,12] 1, [3,3,12] 1, [3,4,12] 1, [3,5,12] 1, [3,6,12] 1, [3,7,12] 1, [3,8,12] 1, [3,9,12] 1, [3,10,12] 1, [3,1,13] 1, [3,3,13] 1, [3,4,13] 1, [3,5,13] 1, [3,6,13] 1, [3,7,13] 1, [3,8,13] 1, [3,9,13] 1, [3,10,13] 1, [3,1,15] 1, [3,2,15] 1, [3,3,15] 1, [3,4,15] 1, [3,5,15] 1, [3,6,15] 1, [3,7,15] 1, [3,8,15] 1, [3,9,15] 1, [3,10,15] 1, [3,1,16] 1, [3,2,16] 1, [3,3,16] 1, [3,4,16] 1, [3,5,16] 1, [3,6,16] 1, [3,7,16] 1, [3,8,16] 1, [3,9,16] 1, [3,10,16] 1, [3,1,17] 1, [3,2,17] 1, [3,3,17] 1, [3,4,17] 1, [3,5,17] 1, [3,6,17] 1, [3,7,17] 1, [3,8,17] 1, [3,9,17] 1, [3,10,17] 1, [3,3,20] 1, [3,4,20] 1, [3,5,20] 1, [3,6,20] 1, [3,7,20] 1, [3,8,20] 1, [3,9,20] 1, [3,10,20] 1, [3,3,21] 1, [3,4,21] 1, [3,5,21] 1, [3,6,21] 1, [3,7,21] 1, [3,8,21] 1, [3,9,21] 1, [3,10,21] 1, [3,1,22] 1, [3,2,22] 1, [3,3,22] 1, [3,4,22] 1, [3,5,22] 1, [3,6,22] 1, [3,7,22] 1, [3,8,22] 1, [3,9,22] 1, [3,10,22] 1, [3,1,24] 1, [3,2,24] 1, [3,3,24] 1, [3,4,24] 1, [3,5,24] 1, [3,6,24] 1, [3,7,24] 1, [3,8,24] 1, [3,9,24] 1, [3,10,24] 1, [3,1,25] 1, [3,2,25] 1, [3,3,25] 1, [3,4,25] 1, [3,5,25] 1, [3,6,25] 1, [3,7,25] 1, [3,8,25] 1, [3,9,25] 1, [3,1,26] 1, [3,2,26] 1, [3,3,26] 1, [3,4,26] 1, [3,5,26] 1, [3,6,26] 1, [3,7,26] 1, [3,8,26] 1, [3,9,26] 1, [3,1,27] 1, [3,2,27] 1, [3,3,27] 1, [3,4,27] 1, [3,5,27] 1, [3,6,27] 1, [3,7,27] 1, [3,8,27] 1, [3,9,27] 1, [10,1,6] 1, [10,2,6] 1, [10,3,6] 1, [10,4,6] 1, [10,5,6] 1, [10,6,6] 1, [10,7,6] 1, [10,8,6] 1, [10,9,6] 1, [10,10,6] 1, [10,1,7] 1, [10,2,7] 1, [10,3,7] 1, [10,4,7] 1, [10,5,7] 1, [10,6,7] 1, [10,7,7] 1, [10,8,7] 1, [10,9,7] 1, [10,10,7] 1, [10,1,13] 1, [10,2,13] 1, [10,3,13] 1, [10,4,13] 1, [10,5,13] 1, [10,6,13] 1, [10,7,13] 1, [10,8,13] 1, [10,9,13] 1, [10,10,13] 1, [10,1,14] 1, [10,2,14] 1, [10,3,14] 1, [10,4,14] 1, [10,5,14] 1, [10,6,14] 1, [10,7,14] 1, [10,8,14] 1, [10,9,14] 1, [10,10,14] 1, [10,1,20] 1, [10,2,20] 1, [10,3,20] 1, [10,4,20] 1, [10,5,20] 1, [10,6,20] 1, [10,7,20] 1, [10,8,20] 1, [10,9,20] 1, [10,10,20] 1, [10,1,21] 1, [10,2,21] 1, [10,3,21] 1, [10,4,21] 1, [10,5,21] 1, [10,6,21] 1, [10,7,21] 1, [10,8,21] 1, [10,9,21] 1, [10,10,21] 1, [10,1,27] 1, [10,2,27] 1, [10,3,27] 1, [10,4,27] 1, [10,5,27] 1, [10,6,27] 1, [10,7,27] 1, [10,8,27] 1, [10,9,27] 1, [10,10,27] 1, [10,1,28] 1, [10,2,28] 1, [10,3,28] 1, [10,4,28] 1, [10,5,28] 1, [10,6,28] 1, [10,7,28] 1, [10,8,28] 1, [10,9,28] 1, [10,10,28] 1, [11,5,1] 1, [11,6,1] 1, [11,7,1] 1, [11,8,1] 1, [11,9,1] 1, [11,10,1] 1, [11,5,2] 1, [11,6,2] 1, [11,7,2] 1, [11,8,2] 1, [11,9,2] 1, [11,10,2] 1, [11,5,3] 1, [11,6,3] 1, [11,7,3] 1, [11,8,3] 1, [11,9,3] 1, [11,10,3] 1, [11,5,4] 1, [11,6,4] 1, [11,7,4] 1, [11,8,4] 1, [11,9,4] 1, [11,10,4] 1, [11,5,5] 1, [11,6,5] 1, [11,7,5] 1, [11,8,5] 1, [11,9,5] 1, [11,10,5] 1, [11,5,6] 1, [11,6,6] 1, [11,7,6] 1, [11,8,6] 1, [11,9,6] 1, [11,10,6] 1, [11,5,8] 1, [11,6,8] 1, [11,7,8] 1, [11,8,8] 1, [11,9,8] 1, [11,10,8] 1, [11,5,9] 1, [11,6,9] 1, [11,7,9] 1, [11,8,9] 1, [11,9,9] 1, [11,10,9] 1, [11,5,10] 1, [11,6,10] 1, [11,7,10] 1, [11,8,10] 1, [11,9,10] 1, [11,10,10] 1, [11,5,11] 1, [11,6,11] 1, [11,7,11] 1, [11,8,11] 1, [11,9,11] 1, [11,10,11] 1, [11,5,12] 1, [11,6,12] 1, [11,7,12] 1, [11,8,12] 1, [11,9,12] 1, [11,10,12] 1, [11,5,13] 1, [11,6,13] 1, [11,7,13] 1, [11,8,13] 1, [11,9,13] 1, [11,10,13] 1, [11,5,15] 1, [11,6,15] 1, [11,7,15] 1, [11,8,15] 1, [11,9,15] 1, [11,10,15] 1, [11,5,16] 1, [11,6,16] 1, [11,7,16] 1, [11,8,16] 1, [11,9,16] 1, [11,10,16] 1, [11,5,17] 1, [11,6,17] 1, [11,7,17] 1, [11,8,17] 1, [11,9,17] 1, [11,10,17] 1, [11,5,18] 1, [11,6,18] 1, [11,7,18] 1, [11,8,18] 1, [11,9,18] 1, [11,10,18] 1, [11,5,19] 1, [11,6,19] 1, [11,7,19] 1, [11,8,19] 1, [11,9,19] 1, [11,10,19] 1, [11,5,20] 1, [11,6,20] 1, [11,7,20] 1, [11,8,20] 1, [11,9,20] 1, [11,10,20] 1, [11,5,22] 1, [11,6,22] 1, [11,7,22] 1, [11,8,22] 1, [11,9,22] 1, [11,10,22] 1, [11,5,23] 1, [11,6,23] 1, [11,7,23] 1, [11,8,23] 1, [11,9,23] 1, [11,10,23] 1, [11,5,24] 1, [11,6,24] 1, [11,7,24] 1, [11,8,24] 1, [11,9,24] 1, [11,10,24] 1, [11,5,25] 1, [11,6,25] 1, [11,7,25] 1, [11,8,25] 1, [11,9,25] 1, [11,10,25] 1, [11,5,26] 1, [11,6,26] 1, [11,7,26] 1, [11,8,26] 1, [11,9,26] 1, [11,10,26] 1, [11,5,27] 1, [11,6,27] 1, [11,7,27] 1, [11,8,27] 1, [11,9,27] 1, [11,10,27] 1, [4,1,1] 1, [4,2,1] 1, [4,3,1] 1, [4,4,1] 1, [4,5,1] 1, [4,6,1] 1, [4,7,1] 1, [4,8,1] 1, [4,9,1] 1, [4,10,1] 1, [4,1,2] 1, [4,2,2] 1, [4,3,2] 1, [4,4,2] 1, [4,5,2] 1, [4,6,2] 1, [4,7,2] 1, [4,8,2] 1, [4,9,2] 1, [4,10,2] 1, [4,3,5] 1, [4,4,5] 1, [4,5,5] 1, [4,6,5] 1, [4,7,5] 1, [4,8,5] 1, [4,9,5] 1, [4,10,5] 1, [4,2,6] 1, [4,3,6] 1, [4,4,6] 1, [4,5,6] 1, [4,6,6] 1, [4,7,6] 1, [4,8,6] 1, [4,9,6] 1, [4,10,6] 1, [4,1,7] 1, [4,2,7] 1, [4,3,7] 1, [4,4,7] 1, [4,5,7] 1, [4,6,7] 1, [4,7,7] 1, [4,8,7] 1, [4,9,7] 1, [4,10,7] 1, [4,1,8] 1, [4,2,8] 1, [4,3,8] 1, [4,4,8] 1, [4,5,8] 1, [4,6,8] 1, [4,7,8] 1, [4,8,8] 1, [4,1,10] 1, [4,2,10] 1, [4,3,10] 1, [4,4,10] 1, [4,5,10] 1, [4,6,10] 1, [4,7,10] 1, [4,8,10] 1, [4,9,10] 1, [4,10,10] 1, [4,1,11] 1, [4,2,11] 1, [4,3,11] 1, [4,4,11] 1, [4,5,11] 1, [4,6,11] 1, [4,7,11] 1, [4,8,11] 1, [4,9,11] 1, [4,1,12] 1, [4,2,12] 1, [4,3,12] 1, [4,4,12] 1, [4,5,12] 1, [4,6,12] 1, [4,7,12] 1, [4,8,12] 1, [4,9,12] 1, [4,1,13] 1, [4,2,13] 1, [4,3,13] 1, [4,4,13] 1, [4,5,13] 1, [4,6,13] 1, [4,7,13] 1, [4,8,13] 1, [4,9,13] 1, [4,3,15] 1, [4,4,15] 1, [4,5,15] 1, [4,6,15] 1, [4,7,15] 1, [4,8,15] 1, [4,9,15] 1, [4,3,16] 1, [4,4,16] 1, [4,5,16] 1, [4,6,16] 1, [4,7,16] 1, [4,8,16] 1, [4,9,16] 1, [4,3,18] 1, [4,4,18] 1, [4,5,18] 1, [4,6,18] 1, [4,7,18] 1, [4,8,18] 1, [4,9,18] 1, [4,2,19] 1, [4,3,19] 1, [4,4,19] 1, [4,5,19] 1, [4,6,19] 1, [4,7,19] 1, [4,8,19] 1, [4,9,19] 1, [4,2,20] 1, [4,3,20] 1, [4,4,20] 1, [4,5,20] 1, [4,6,20] 1, [4,7,20] 1, [4,8,20] 1, [4,9,20] 1, [4,1,21] 1, [4,2,21] 1, [4,3,21] 1, [4,4,21] 1, [4,5,21] 1, [4,6,21] 1, [4,7,21] 1, [4,8,21] 1, [4,9,21] 1, [4,1,22] 1, [4,2,22] 1, [4,3,22] 1, [4,4,22] 1, [4,5,22] 1, [4,6,22] 1, [4,1,23] 1, [4,2,23] 1, [4,3,23] 1, [4,4,23] 1, [4,5,23] 1, [4,6,23] 1, [4,7,23] 1, [4,8,23] 1, [4,9,23] 1, [4,10,23] 1, [4,1,25] 1, [4,2,25] 1, [4,3,25] 1, [4,4,25] 1, [4,5,25] 1, [4,6,25] 1, [4,7,25] 1, [4,8,25] 1, [4,9,25] 1, [4,10,25] 1, [4,1,26] 1, [4,3,26] 1, [4,4,26] 1, [4,5,26] 1, [4,6,26] 1, [4,7,26] 1, [4,8,26] 1, [4,9,26] 1, [4,10,26] 1, [4,1,27] 1, [4,3,27] 1, [4,4,27] 1, [4,5,27] 1, [4,6,27] 1, [4,7,27] 1, [4,8,27] 1, [4,9,27] 1, [4,10,27] 1, [5,3,3] 1, [5,4,3] 1, [5,5,3] 1, [5,6,3] 1, [5,7,3] 1, [5,8,3] 1, [5,9,3] 1, [5,3,4] 1, [5,4,4] 1, [5,5,4] 1, [5,6,4] 1, [5,7,4] 1, [5,8,4] 1, [5,9,4] 1, [5,10,4] 1, [5,6,5] 1, [5,7,5] 1, [5,8,5] 1, [5,9,5] 1, [5,10,5] 1, [5,4,6] 1, [5,5,6] 1, [5,6,6] 1, [5,7,6] 1, [5,8,6] 1, [5,9,6] 1, [5,10,6] 1, [5,4,7] 1, [5,5,7] 1, [5,6,7] 1, [5,7,7] 1, [5,8,7] 1, [5,9,7] 1, [5,10,7] 1, [5,3,8] 1, [5,4,8] 1, [5,5,8] 1, [5,6,8] 1, [5,7,8] 1, [5,8,8] 1, [5,9,8] 1, [5,3,9] 1, [5,4,9] 1, [5,5,9] 1, [5,6,9] 1, [5,7,9] 1, [5,8,9] 1, [5,9,9] 1, [5,3,10] 1, [5,4,10] 1, [5,5,10] 1, [5,6,10] 1, [5,7,10] 1, [5,8,10] 1, [5,9,10] 1, [5,10,10] 1, [5,3,13] 1, [5,4,13] 1, [5,5,13] 1, [5,6,13] 1, [5,7,13] 1, [5,8,13] 1, [5,9,13] 1, [5,3,14] 1, [5,4,14] 1, [5,5,14] 1, [5,6,14] 1, [5,7,14] 1, [5,8,14] 1, [5,9,14] 1, [5,2,17] 1, [5,3,17] 1, [5,4,17] 1, [5,5,17] 1, [5,6,17] 1, [5,7,17] 1, [5,8,17] 1, [5,9,17] 1, [5,2,18] 1, [5,3,18] 1, [5,4,18] 1, [5,5,18] 1, [5,6,18] 1, [5,7,18] 1, [5,8,18] 1, [5,9,18] 1, [5,10,18] 1, [5,6,19] 1, [5,7,19] 1, [5,8,19] 1, [5,9,19] 1, [5,10,19] 1, [5,4,20] 1, [5,5,20] 1, [5,6,20] 1, [5,7,20] 1, [5,8,20] 1, [5,9,20] 1, [5,10,20] 1, [5,4,21] 1, [5,5,21] 1, [5,6,21] 1, [5,7,21] 1, [5,8,21] 1, [5,9,21] 1, [5,10,21] 1, [5,3,22] 1, [5,4,22] 1, [5,5,22] 1, [5,6,22] 1, [5,7,22] 1, [5,8,22] 1, [5,9,22] 1, [5,3,23] 1, [5,4,23] 1, [5,5,23] 1, [5,6,23] 1, [5,7,23] 1, [5,8,23] 1, [5,9,23] 1, [5,3,24] 1, [5,4,24] 1, [5,5,24] 1, [5,6,24] 1, [5,7,24] 1, [5,8,24] 1, [5,9,24] 1, [5,10,24] 1, [5,3,27] 1, [5,4,27] 1, [5,5,27] 1, [5,6,27] 1, [5,7,27] 1, [5,8,27] 1, [5,9,27] 1, [5,3,28] 1, [5,4,28] 1, [5,5,28] 1, [5,6,28] 1, [5,7,28] 1, [5,8,28] 1, [5,9,28] 1, [9,7,5] 1, [9,8,5] 1, [9,9,5] 1, [9,10,5] 1, [9,7,12] 1, [9,8,12] 1, [9,9,12] 1, [9,10,12] 1, [9,1,13] 1, [9,2,13] 1, [9,3,13] 1, [9,4,13] 1, [9,5,13] 1, [9,6,13] 1, [9,7,13] 1, [9,8,13] 1, [9,9,13] 1, [9,10,13] 1, [9,1,14] 1, [9,2,14] 1, [9,3,14] 1, [9,4,14] 1, [9,5,14] 1, [9,6,14] 1, [9,7,14] 1, [9,8,14] 1, [9,9,14] 1, [9,10,14] 1, [9,7,19] 1, [9,8,19] 1, [9,9,19] 1, [9,10,19] 1, [9,1,20] 1, [9,2,20] 1, [9,3,20] 1, [9,4,20] 1, [9,5,20] 1, [9,6,20] 1, [9,7,20] 1, [9,8,20] 1, [9,9,20] 1, [9,10,20] 1, [9,1,21] 1, [9,2,21] 1, [9,3,21] 1, [9,4,21] 1, [9,5,21] 1, [9,6,21] 1, [9,7,21] 1, [9,8,21] 1, [9,9,21] 1, [9,10,21] 1, [9,7,26] 1, [9,8,26] 1, [9,9,26] 1, [9,10,26] 1, [9,1,27] 1, [9,2,27] 1, [9,3,27] 1, [9,4,27] 1, [9,5,27] 1, [9,6,27] 1, [9,7,27] 1, [9,8,27] 1, [9,9,27] 1, [9,10,27] 1, [9,1,28] 1, [9,2,28] 1, [9,3,28] 1, [9,4,28] 1, [9,5,28] 1, [9,6,28] 1, [9,7,28] 1, [9,8,28] 1, [9,9,28] 1, [9,10,28] 1, [7,3,1] 1, [7,4,1] 1, [7,5,1] 1, [7,6,1] 1, [7,7,1] 1, [7,8,1] 1, [7,9,1] 1, [7,3,2] 1, [7,4,2] 1, [7,5,2] 1, [7,6,2] 1, [7,7,2] 1, [7,8,2] 1, [7,9,2] 1, [7,3,3] 1, [7,4,3] 1, [7,5,3] 1, [7,6,3] 1, [7,7,3] 1, [7,8,3] 1, [7,9,3] 1, [7,10,3] 1, [7,3,6] 1, [7,4,6] 1, [7,5,6] 1, [7,6,6] 1, [7,7,6] 1, [7,8,6] 1, [7,9,6] 1, [7,3,7] 1, [7,4,7] 1, [7,5,7] 1, [7,6,7] 1, [7,7,7] 1, [7,8,7] 1, [7,9,7] 1, [7,3,9] 1, [7,4,9] 1, [7,5,9] 1, [7,6,9] 1, [7,7,9] 1, [7,8,9] 1, [7,9,9] 1, [7,4,10] 1, [7,5,10] 1, [7,6,10] 1, [7,7,10] 1, [7,8,10] 1, [7,9,10] 1, [7,10,10] 1, [7,3,11] 1, [7,4,11] 1, [7,5,11] 1, [7,6,11] 1, [7,7,11] 1, [7,8,11] 1, [7,9,11] 1, [7,10,11] 1, [7,2,12] 1, [7,3,12] 1, [7,4,12] 1, [7,5,12] 1, [7,6,12] 1, [7,7,12] 1, [7,10,12] 1, [7,2,13] 1, [7,3,13] 1, [7,4,13] 1, [7,5,13] 1, [7,6,13] 1, [7,7,13] 1, [7,8,13] 1, [7,3,16] 1, [7,4,16] 1, [7,5,16] 1, [7,6,16] 1, [7,7,16] 1, [7,8,16] 1, [7,9,16] 1, [7,4,17] 1, [7,5,17] 1, [7,6,17] 1, [7,7,17] 1, [7,8,17] 1, [7,9,17] 1, [7,10,17] 1, [7,3,18] 1, [7,4,18] 1, [7,5,18] 1, [7,6,18] 1, [7,7,18] 1, [7,8,18] 1, [7,9,18] 1, [7,10,18] 1, [7,2,19] 1, [7,3,19] 1, [7,4,19] 1, [7,5,19] 1, [7,6,19] 1, [7,7,19] 1, [7,10,19] 1, [7,2,20] 1, [7,3,20] 1, [7,4,20] 1, [7,5,20] 1, [7,6,20] 1, [7,7,20] 1, [7,8,20] 1, [7,3,22] 1, [7,4,22] 1, [7,5,22] 1, [7,6,22] 1, [7,7,22] 1, [7,8,22] 1, [7,9,22] 1, [7,3,23] 1, [7,4,23] 1, [7,5,23] 1, [7,6,23] 1, [7,7,23] 1, [7,8,23] 1, [7,9,23] 1, [7,3,24] 1, [7,4,24] 1, [7,5,24] 1, [7,6,24] 1, [7,7,24] 1, [7,8,24] 1, [7,9,24] 1, [7,10,24] 1, [7,3,27] 1, [7,4,27] 1, [7,5,27] 1, [7,6,27] 1, [7,7,27] 1, [7,8,27] 1, [7,9,27] 1, [7,3,28] 1, [7,4,28] 1, [7,5,28] 1, [7,6,28] 1, [7,7,28] 1, [7,8,28] 1, [7,9,28] 1	[1,1,1] 1, [2,1,1] 1, [3,1,1] 1, [4,1,1] 2, [5,1,1] 2, [6,1,1] 2, [7,1,1] 2,[8,1,1] 1,[9,1,1] 0, [10,1,1] 0, [11,1,1] 0, [12,1,1] 0	[1,1,1,1] 290479, [1,2,1,1] 290479, [1,3,1,1] 290479, [1,4,1,1] 290479, [1,5,1,1] 290479, [1,6,1,1] 290479, [1,7,1,1] 290479, [1,8,1,1] 290479, [1,9,1,1] 290479, [1,10,1,1] 290479, [1,1,2,1] 436796, [1,2,2,1] 436796, [1,3,2,1] 436796, [1,4,2,1] 436796, [1,5,2,1] 436796, [1,6,2,1] 436796, [1,7,2,1] 436796, [1,8,2,1] 436796, [1,9,2,1] 436796, [1,10,2,1] 436796, [1,1,3,1] 235549, [1,2,3,1] 235549, [1,3,3,1] 235549, [1,4,3,1] 235549, [1,5,3,1] 235549, [1,6,3,1] 235549, [1,7,3,1] 235549, [1,8,3,1] 235549, [1,9,3,1] 235549, [1,10,3,1] 235549, [1,1,4,1] 548089, [1,2,4,1] 548089, [1,3,4,1] 548089, [1,4,4,1] 548089, [1,5,4,1] 548089, [1,6,4,1] 548089, [1,7,4,1] 548089, [1,8,4,1] 548089, [1,9,4,1] 548089, [1,10,4,1] 548089, [1,1,5,1] 258750, [1,2,5,1] 258750, [1,3,5,1] 258750, [1,4,5,1] 258750, [1,5,5,1] 258750, [1,6,5,1] 258750, [1,7,5,1] 258750, [1,8,5,1] 258750, [1,9,5,1] 258750, [1,10,5,1] 258750, [1,1,6,1] 124738, [1,2,6,1] 124738, [1,3,6,1] 124738, [1,4,6,1] 124738, [1,5,6,1] 124738, [1,6,6,1] 124738, [1,7,6,1] 124738, [1,8,6,1] 124738, [1,9,6,1] 124738, [1,10,6,1] 124738, [1,1,7,1] 389732, [1,2,7,1] 389732, [1,3,7,1] 389732, [1,4,7,1] 389732, [1,5,7,1] 389732, [1,6,7,1] 389732, [1,7,7,1] 389732, [1,8,7,1] 389732, [1,9,7,1] 389732, [1,10,7,1] 389732, [1,1,8,1] 444968, [1,2,8,1] 444968, [1,3,8,1] 444968, [1,4,8,1] 444968, [1,5,8,1] 444968, [1,6,8,1] 444968, [1,7,8,1] 444968, [1,8,8,1] 444968, [1,9,8,1] 444968, [1,10,8,1] 444968, [1,1,9,1] 1352123, [1,2,9,1] 1352123, [1,3,9,1] 1352123, [1,4,9,1] 1352123, [1,5,9,1] 1352123, [1,6,9,1] 1352123, [1,7,9,1] 1352123, [1,8,9,1] 1352123, [1,9,9,1] 1352123, [1,10,9,1] 1352123, [1,1,10,1] 218180, [1,2,10,1] 218180, [1,3,10,1] 218180, [1,4,10,1] 218180, [1,5,10,1] 218180, [1,6,10,1] 218180, [1,7,10,1] 218180, [1,8,10,1] 218180, [1,9,10,1] 218180, [1,10,10,1] 218180, [1,1,11,1] 290566, [1,2,11,1] 290566, [1,3,11,1] 290566, [1,4,11,1] 290566, [1,5,11,1] 290566, [1,6,11,1] 290566, [1,7,11,1] 290566, [1,8,11,1] 290566, [1,9,11,1] 290566, [1,10,11,1] 290566, [1,1,12,1] 158010, [1,2,12,1] 158010, [1,3,12,1] 158010, [1,4,12,1] 158010, [1,5,12,1] 158010, [1,6,12,1] 158010, [1,7,12,1] 158010, [1,8,12,1] 158010, [1,9,12,1] 158010, [1,10,12,1] 158010, [1,1,13,1] 111858, [1,2,13,1] 111858, [1,3,13,1] 111858, [1,4,13,1] 111858, [1,5,13,1] 111858, [1,6,13,1] 111858, [1,7,13,1] 111858, [1,8,13,1] 111858, [1,9,13,1] 111858, [1,10,13,1] 111858, [1,1,14,1] 508273, [1,2,14,1] 508273, [1,3,14,1] 508273, [1,4,14,1] 508273, [1,5,14,1] 508273, [1,6,14,1] 508273, [1,7,14,1] 508273, [1,8,14,1] 508273, [1,9,14,1] 508273, [1,10,14,1] 508273, [1,1,15,1] 393818, [1,2,15,1] 393818, [1,3,15,1] 393818, [1,4,15,1] 393818, [1,5,15,1] 393818, [1,6,15,1] 393818, [1,7,15,1] 393818, [1,8,15,1] 393818, [1,9,15,1] 393818, [1,10,15,1] 393818, [1,1,16,1] 351903, [1,2,16,1] 351903, [1,3,16,1] 351903, [1,4,16,1] 351903, [1,5,16,1] 351903, [1,6,16,1] 351903, [1,7,16,1] 351903, [1,8,16,1] 351903, [1,9,16,1] 351903, [1,10,16,1] 351903, [1,1,17,1] 259505, [1,2,17,1] 259505, [1,3,17,1] 259505, [1,4,17,1] 259505, [1,5,17,1] 259505, [1,6,17,1] 259505, [1,7,17,1] 259505, [1,8,17,1] 259505, [1,9,17,1] 259505, [1,10,17,1] 259505, [1,1,18,1] 385669, [1,2,18,1] 385669, [1,3,18,1] 385669, [1,4,18,1] 385669, [1,5,18,1] 385669, [1,6,18,1] 385669, [1,7,18,1] 385669, [1,8,18,1] 385669, [1,9,18,1] 385669, [1,10,18,1] 385669, [1,1,19,1] 149108, [1,2,19,1] 149108, [1,3,19,1] 149108, [1,4,19,1] 149108, [1,5,19,1] 149108, [1,6,19,1] 149108, [1,7,19,1] 149108, [1,8,19,1] 149108, [1,9,19,1] 149108, [1,10,19,1] 149108, [1,1,20,1] 196916, [1,2,20,1] 196916, [1,3,20,1] 196916, [1,4,20,1] 196916, [1,5,20,1] 196916, [1,6,20,1] 196916, [1,7,20,1] 196916, [1,8,20,1] 196916, [1,9,20,1] 196916, [1,10,20,1] 196916, [1,1,21,1] 394701, [1,2,21,1] 394701, [1,3,21,1] 394701, [1,4,21,1] 394701, [1,5,21,1] 394701, [1,6,21,1] 394701, [1,7,21,1] 394701, [1,8,21,1] 394701, [1,9,21,1] 394701, [1,10,21,1] 394701, [1,1,22,1] 344497, [1,2,22,1] 344497, [1,3,22,1] 344497, [1,4,22,1] 344497, [1,5,22,1] 344497, [1,6,22,1] 344497, [1,7,22,1] 344497, [1,8,22,1] 344497, [1,9,22,1] 344497, [1,10,22,1] 344497, [1,1,23,1] 410817, [1,2,23,1] 410817, [1,3,23,1] 410817, [1,4,23,1] 410817, [1,5,23,1] 410817, [1,6,23,1] 410817, [1,7,23,1] 410817, [1,8,23,1] 410817, [1,9,23,1] 410817, [1,10,23,1] 410817, [1,1,24,1] 727085, [1,2,24,1] 727085, [1,3,24,1] 727085, [1,4,24,1] 727085, [1,5,24,1] 727085, [1,6,24,1] 727085, [1,7,24,1] 727085, [1,8,24,1] 727085, [1,9,24,1] 727085, [1,10,24,1] 727085, [1,1,25,1] 276545, [1,2,25,1] 276545, [1,3,25,1] 276545, [1,4,25,1] 276545, [1,5,25,1] 276545, [1,6,25,1] 276545, [1,7,25,1] 276545, [1,8,25,1] 276545, [1,9,25,1] 276545, [1,10,25,1] 276545, [1,1,26,1] 265374, [1,2,26,1] 265374, [1,3,26,1] 265374, [1,4,26,1] 265374, [1,5,26,1] 265374, [1,6,26,1] 265374, [1,7,26,1] 265374, [1,8,26,1] 265374, [1,9,26,1] 265374, [1,10,26,1] 265374, [1,1,27,1] 262604, [1,2,27,1] 262604, [1,3,27,1] 262604, [1,4,27,1] 262604, [1,5,27,1] 262604, [1,6,27,1] 262604, [1,7,27,1] 262604, [1,8,27,1] 262604, [1,9,27,1] 262604, [1,10,27,1] 262604, [1,1,28,1] 480240, [1,2,28,1] 480240, [1,3,28,1] 480240, [1,4,28,1] 480240, [1,5,28,1] 480240, [1,6,28,1] 480240, [1,7,28,1] 480240, [1,8,28,1] 480240, [1,9,28,1] 480240, [1,10,28,1] 480240	2018-05-16 19:59:43.58978	2018-05-16 19:59:43.58978	4	2018
\.


--
-- Name: data_cases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.data_cases_id_seq', 35, true);


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: coke
--

COPY public.departments (id, origin_id, name, store_id, created_at, updated_at, productivity_obj, master_id) FROM stdin;
1	1	Rincon juvenil Mujer	1	2017-08-22 16:00:12.545102	2017-08-22 16:00:12.545102	85000	1
2	7	Moda Hombre	2	2017-08-22 16:00:12.554203	2017-08-22 16:00:12.554203	75000	2
4	4	Deportes	6	2017-08-22 16:00:12.567375	2017-08-22 16:00:12.579717	75000	4
3	6	Tecnología	3	2017-08-22 16:00:12.561272	2017-08-22 16:00:12.561272	75000	3
6	3	Infantil	1	2017-08-22 16:00:12.586491	2017-08-22 16:00:12.586491	75000	6
5	2	Moda Mujer	5	2017-08-22 16:00:12.573733	2017-08-22 16:00:12.573733	75000	5
7	8	Rincon juvenil Mujer	2	2017-08-22 16:00:12.586491	2017-08-22 16:00:12.586491	65000	1
\.


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: coke
--

SELECT pg_catalog.setval('public.departments_id_seq', 7, true);


--
-- Data for Name: historic_sales; Type: TABLE DATA; Schema: public; Owner: coke
--

COPY public.historic_sales (id, department_id, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty, twenty_one, twenty_two, twenty_three, twenty_four, created_at, updated_at, historic_date, store_id, week, month, year, day_number) FROM stdin;
1722	5	0	0	0	264600	620439	991321	1126890	847833	1195260	1784051	1307062	1639494	605047	0	0	0	2017-10-12 19:12:41.56046	2017-10-12 19:12:41.56046	2015-01-01	1	1	1	2015	4
1723	5	0	0	0	264600	441251	1501939	884073	1011784	1025951	1451805	2147288	931084	1053913	0	0	0	2017-10-12 19:12:41.575775	2017-10-12 19:12:41.575775	2015-01-02	1	1	1	2015	5
1724	5	0	0	0	242550	299692	355362	1169306	712983	1296528	1673250	1221646	1169593	2099426	0	0	0	2017-10-12 19:12:41.585088	2017-10-12 19:12:41.585088	2015-01-03	1	1	1	2015	6
1725	5	0	0	0	352800	710849	640456	646663	562830	1354867	2164962	1514772	2142517	1215911	0	0	0	2017-10-12 19:12:41.59463	2017-10-12 19:12:41.59463	2015-01-04	1	1	1	2015	0
1726	5	0	0	0	352800	489022	282767	682110	806187	1787918	1908888	2189125	971039	1694131	0	0	0	2017-10-12 19:12:41.604339	2017-10-12 19:12:41.604339	2015-01-05	1	2	1	2015	1
1727	5	0	0	0	529200	572294	1637423	1403923	1709153	2153362	3229829	4250694	5266898	1521452	0	0	0	2017-10-12 19:12:41.618564	2017-10-12 19:12:41.618564	2015-01-06	1	2	1	2015	2
1728	5	0	0	0	423360	1628804	1158454	1478030	2005641	1791965	1855183	3890472	3696690	3431666	0	0	0	2017-10-12 19:12:41.632066	2017-10-12 19:12:41.632066	2015-01-07	1	2	1	2015	3
1729	5	0	0	0	264600	726566	761275	671113	943051	1165262	2206921	3850740	1756569	1400453	0	0	0	2017-10-12 19:12:41.642682	2017-10-12 19:12:41.642682	2015-01-08	1	2	1	2015	4
1730	5	0	0	0	264600	344556	1706078	461846	367291	1510994	2841270	2249583	1182022	892420	0	0	0	2017-10-12 19:12:41.651804	2017-10-12 19:12:41.651804	2015-01-09	1	2	1	2015	5
1731	5	0	0	0	441000	381699	622517	879036	974490	924490	1423980	2051274	1351736	1450826	0	0	0	2017-10-12 19:12:41.661983	2017-10-12 19:12:41.661983	2015-01-10	1	2	1	2015	6
1732	5	0	0	0	286650	671262	709103	408812	843283	1981870	2301572	1582108	952260	1053069	0	0	0	2017-10-12 19:12:41.673258	2017-10-12 19:12:41.673258	2015-01-11	1	2	1	2015	0
1733	5	0	0	0	286650	444963	575733	1104020	901379	993626	2228065	1213385	1050287	787163	0	0	0	2017-10-12 19:12:41.6846	2017-10-12 19:12:41.6846	2015-01-12	1	3	1	2015	1
1734	5	0	0	0	441000	851739	1636268	2023052	1611910	2466890	3448473	3303618	5247018	4523385	0	0	0	2017-10-12 19:12:41.702244	2017-10-12 19:12:41.702244	2015-01-13	1	3	1	2015	2
1735	5	0	0	0	564480	322153	696704	1608634	2011860	1070285	2556575	3044860	2605073	2070551	0	0	0	2017-10-12 19:12:41.715718	2017-10-12 19:12:41.715718	2015-01-14	1	3	1	2015	3
1736	5	0	0	0	441000	367417	898251	503663	943912	1463353	1801418	2202526	1742313	1007640	0	0	0	2017-10-12 19:12:41.730236	2017-10-12 19:12:41.730236	2015-01-15	1	3	1	2015	4
1737	5	0	0	0	264600	487819	786705	437670	877794	877973	2574035	1754628	761987	1935925	0	0	0	2017-10-12 19:12:41.742268	2017-10-12 19:12:41.742268	2015-01-16	1	3	1	2015	5
1738	5	0	0	0	286650	365505	1269562	1111026	436400	773725	2919926	1955405	1913013	1548106	0	0	0	2017-10-12 19:12:41.755188	2017-10-12 19:12:41.755188	2015-01-17	1	3	1	2015	6
1739	5	0	0	0	396900	418094	408490	493622	1251701	1098301	2407511	3122060	1907681	1080300	0	0	0	2017-10-12 19:12:41.770953	2017-10-12 19:12:41.770953	2015-01-18	1	3	1	2015	0
1740	5	0	0	0	374850	902799	761829	742195	1134908	987197	2118587	1599847	1233956	1596492	0	0	0	2017-10-12 19:12:41.785646	2017-10-12 19:12:41.785646	2015-01-19	1	4	1	2015	1
1741	5	0	0	0	661500	1016991	2149371	1226155	1676732	2652493	3296545	3200426	3735718	2894718	0	0	0	2017-10-12 19:12:41.801646	2017-10-12 19:12:41.801646	2015-01-20	1	4	1	2015	2
1742	5	0	0	0	423360	592639	1089650	1043708	1742061	2439484	2940852	3242212	2708414	2718224	0	0	0	2017-10-12 19:12:41.815668	2017-10-12 19:12:41.815668	2015-01-21	1	4	1	2015	3
1743	5	0	0	0	374850	402557	506334	806028	752309	1594490	1962344	992552	1202283	1129784	0	0	0	2017-10-12 19:12:41.829476	2017-10-12 19:12:41.829476	2015-01-22	1	4	1	2015	4
1744	5	0	0	0	441000	1026740	1071349	755632	953313	1595566	2248396	1626637	920085	868375	0	0	0	2017-10-12 19:12:41.842654	2017-10-12 19:12:41.842654	2015-01-23	1	4	1	2015	5
1745	5	0	0	0	220500	1085588	1167970	911497	819664	693450	1888192	1547756	1742218	955676	0	0	0	2017-10-12 19:12:41.856557	2017-10-12 19:12:41.856557	2015-01-24	1	4	1	2015	6
1746	5	0	0	0	396900	856978	917072	923440	821453	700546	1897489	2287817	1673862	1072457	0	0	0	2017-10-12 19:12:41.869189	2017-10-12 19:12:41.869189	2015-01-25	1	4	1	2015	0
1747	5	0	0	0	308700	524197	516296	877055	527222	1589778	2197546	1658957	1682604	1064120	0	0	0	2017-10-12 19:12:41.881297	2017-10-12 19:12:41.881297	2015-01-26	1	5	1	2015	1
1748	5	0	0	0	837900	1313320	1500166	2640428	792125	1786653	4483697	3409754	5392806	1187904	0	0	0	2017-10-12 19:12:41.891754	2017-10-12 19:12:41.891754	2015-01-27	1	5	1	2015	2
1749	5	0	0	0	705600	888399	1991354	2376205	1123662	2436543	5854286	2472733	4462600	2017093	0	0	0	2017-10-12 19:12:41.90568	2017-10-12 19:12:41.90568	2015-01-28	1	5	1	2015	3
1750	5	0	0	0	562275	1035954	833952	733209	1489854	1676720	1989162	4029458	2099393	2898050	0	0	0	2017-10-12 19:12:41.918896	2017-10-12 19:12:41.918896	2015-01-29	1	5	1	2015	4
1751	5	0	0	0	661500	1011608	1494582	1400777	1004592	1026691	1949111	3054487	3962120	1882815	0	0	0	2017-10-12 19:12:41.931575	2017-10-12 19:12:41.931575	2015-01-30	1	5	1	2015	5
1752	5	0	0	0	396900	537017	595816	1415042	995485	1730958	2609917	2197351	1880142	1216853	0	0	0	2017-10-12 19:12:41.946705	2017-10-12 19:12:41.946705	2015-01-31	1	5	1	2015	6
1753	5	0	0	0	661500	1024022	1153948	781877	1670080	1866817	1897624	3633883	3046346	770816	0	0	0	2017-10-12 19:12:41.961713	2017-10-12 19:12:41.961713	2015-02-01	1	5	2	2015	0
1754	5	0	0	0	363825	1223640	535260	1383260	1444971	1913508	1762346	2360250	1519472	1513922	0	0	0	2017-10-12 19:12:41.975043	2017-10-12 19:12:41.975043	2015-02-02	1	6	2	2015	1
1755	5	0	0	0	463050	1098768	659651	817856	1745348	2095675	1515684	4463547	1934198	1375446	0	0	0	2017-10-12 19:12:41.987285	2017-10-12 19:12:41.987285	2015-02-03	1	6	2	2015	2
1756	5	0	0	0	529200	1647397	1385216	1671029	619519	2039561	3881501	1876307	4705210	1657991	0	0	0	2017-10-12 19:12:42.003933	2017-10-12 19:12:42.003933	2015-02-04	1	6	2	2015	3
1757	5	0	0	0	1256850	689482	1341237	2915320	1911397	2872429	3606153	9322710	4407716	2466235	0	0	0	2017-10-12 19:12:42.01838	2017-10-12 19:12:42.01838	2015-02-05	1	6	2	2015	4
1758	5	0	0	0	952560	1881608	1622416	3495462	2275714	2695943	3649996	5502385	8444029	3235642	0	0	0	2017-10-12 19:12:42.031239	2017-10-12 19:12:42.031239	2015-02-06	1	6	2	2015	5
1759	5	0	0	0	661500	1047393	529326	1157528	1562099	997675	3353680	3841695	2238563	1488570	0	0	0	2017-10-12 19:12:42.049509	2017-10-12 19:12:42.049509	2015-02-07	1	6	2	2015	6
1760	5	0	0	0	363825	1468031	682569	530844	1014013	2151335	2736876	4255170	4349422	1102501	0	0	0	2017-10-12 19:12:42.072858	2017-10-12 19:12:42.072858	2015-02-08	1	6	2	2015	0
1761	5	0	0	0	330750	1587193	1187320	1928920	815051	1876524	1517100	4964814	2744630	2648012	0	0	0	2017-10-12 19:12:42.089362	2017-10-12 19:12:42.089362	2015-02-09	1	7	2	2015	1
1762	5	0	0	0	628425	413838	1024535	1036153	1297794	1400937	1836950	3398722	3206765	1846776	0	0	0	2017-10-12 19:12:42.102164	2017-10-12 19:12:42.102164	2015-02-10	1	7	2	2015	2
1763	5	0	0	0	496125	809665	1205681	1043657	1305188	2826395	4217003	3932568	2221663	2870564	0	0	0	2017-10-12 19:12:42.118308	2017-10-12 19:12:42.118308	2015-02-11	1	7	2	2015	3
1764	5	0	0	0	926100	1466281	5133006	2813723	1171686	4048400	4917968	3766036	3487022	6475943	0	0	0	2017-10-12 19:12:42.134796	2017-10-12 19:12:42.134796	2015-02-12	1	7	2	2015	4
1765	5	0	0	0	476280	2702979	3368958	2549240	1613804	1864172	5596240	7047393	7858959	2901895	0	0	0	2017-10-12 19:12:42.149897	2017-10-12 19:12:42.149897	2015-02-13	1	7	2	2015	5
1766	5	0	0	0	363825	674176	1374221	1472117	1357287	1272600	3540964	2248016	1712976	1068260	0	0	0	2017-10-12 19:12:42.165403	2017-10-12 19:12:42.165403	2015-02-14	1	7	2	2015	6
1767	5	0	0	0	463050	1326478	1291229	1180185	1070711	2321678	3194212	3354409	2854568	1295280	0	0	0	2017-10-12 19:12:42.188051	2017-10-12 19:12:42.188051	2015-02-15	1	7	2	2015	0
1768	5	0	0	0	396900	437930	1279977	1991542	979296	2442224	1814458	1846757	2612539	1828003	0	0	0	2017-10-12 19:12:42.207478	2017-10-12 19:12:42.207478	2015-02-16	1	8	2	2015	1
1769	5	0	0	0	529200	784730	1019233	989809	985349	1956253	2322380	1735272	4611148	985559	0	0	0	2017-10-12 19:12:42.22241	2017-10-12 19:12:42.22241	2015-02-17	1	8	2	2015	2
1770	5	0	0	0	363825	890638	1858926	708840	1438219	2012469	3969877	3357669	2027142	1888296	0	0	0	2017-10-12 19:12:42.237026	2017-10-12 19:12:42.237026	2015-02-18	1	8	2	2015	3
1771	5	0	0	0	595350	2754133	1255102	1555898	2195288	4288271	5964877	7884741	6645170	3449619	0	0	0	2017-10-12 19:12:42.251661	2017-10-12 19:12:42.251661	2015-02-19	1	8	2	2015	4
1772	5	0	0	0	529200	1851050	1609786	2930471	1430833	2507392	3706269	6679421	8021546	3082796	0	0	0	2017-10-12 19:12:42.264209	2017-10-12 19:12:42.264209	2015-02-20	1	8	2	2015	5
1773	5	0	0	0	463050	1288614	1994092	1434968	1547828	1620788	3030889	1477976	1895802	797685	0	0	0	2017-10-12 19:12:42.27775	2017-10-12 19:12:42.27775	2015-02-21	1	8	2	2015	6
1774	5	0	0	0	595350	1460912	785806	1230122	1642972	1598476	1950424	4360746	2969793	1411638	0	0	0	2017-10-12 19:12:42.29254	2017-10-12 19:12:42.29254	2015-02-22	1	8	2	2015	0
1775	5	0	0	0	297675	1351365	1791589	1447971	1256648	2482844	2598545	3530156	1702992	2027272	0	0	0	2017-10-12 19:12:42.305777	2017-10-12 19:12:42.305777	2015-02-23	1	9	2	2015	1
1776	5	0	0	0	529200	882237	1343362	1474702	1310709	1114728	1561364	3322598	2085883	1297596	0	0	0	2017-10-12 19:12:42.318356	2017-10-12 19:12:42.318356	2015-02-24	1	9	2	2015	2
1777	5	0	0	0	529200	1050908	1707356	1175938	751320	2285741	2392940	2753673	2600280	2579303	0	0	0	2017-10-12 19:12:42.330784	2017-10-12 19:12:42.330784	2015-02-25	1	9	2	2015	3
1778	5	0	0	0	926100	2096855	2219020	2019207	3271469	3582275	8055858	7000037	8605352	4070078	0	0	0	2017-10-12 19:12:42.345481	2017-10-12 19:12:42.345481	2015-02-26	1	9	2	2015	4
1779	5	0	0	0	740880	1241399	971225	3273767	1866358	3584857	3460496	7676547	10044399	2382677	0	0	0	2017-10-12 19:12:42.359965	2017-10-12 19:12:42.359965	2015-02-27	1	9	2	2015	5
1780	5	0	0	0	496125	1229677	1037751	1450744	1076545	2326578	2460884	2573037	2308413	1705819	0	0	0	2017-10-12 19:12:42.373177	2017-10-12 19:12:42.373177	2015-02-28	1	9	2	2015	6
1781	5	0	0	0	363825	553057	1559705	1310245	1158949	1114143	1685411	2268804	3691995	1476786	0	0	0	2017-10-12 19:12:42.387216	2017-10-12 19:12:42.387216	2015-03-01	1	9	3	2015	0
1782	5	0	0	0	429975	926456	905768	1647400	532268	1493624	2156875	3110694	2295695	2325834	0	0	0	2017-10-12 19:12:42.406126	2017-10-12 19:12:42.406126	2015-03-02	1	10	3	2015	1
1783	5	0	536363	767846	1280497	1752519	1123716	1621652	698808	1496322	1061830	735335	0	0	0	0	0	2017-10-12 19:12:42.420501	2017-10-12 19:12:42.420501	2015-03-03	1	10	3	2015	2
1784	5	0	423444	406507	711387	1478023	2448839	1508167	653912	2200550	1043034	1082071	0	0	0	0	0	2017-10-12 19:12:42.431632	2017-10-12 19:12:42.431632	2015-03-04	1	10	3	2015	3
1785	5	0	564593	542009	1138219	941598	3413411	739719	802481	846858	1931853	1064200	0	0	0	0	0	2017-10-12 19:12:42.470975	2017-10-12 19:12:42.470975	2015-03-05	1	10	3	2015	4
1786	5	0	451674	767846	853664	1371863	2529776	1432906	1001400	1456209	1220635	1567730	0	0	0	0	0	2017-10-12 19:12:42.480179	2017-10-12 19:12:42.480179	2015-03-06	1	10	3	2015	5
1787	5	0	239952	203253	640247	1292467	992708	669888	604967	643175	745167	295305	0	0	0	0	0	2017-10-12 19:12:42.488859	2017-10-12 19:12:42.488859	2015-03-07	1	10	3	2015	6
1788	5	0	155263	203253	533540	480945	2426932	1006052	348659	560288	754616	371480	0	0	0	0	0	2017-10-12 19:12:42.49771	2017-10-12 19:12:42.49771	2015-03-08	1	10	3	2015	0
1789	5	0	508133	903348	711387	2920254	3615381	1030640	499274	780907	1738289	550773	0	0	0	0	0	2017-10-12 19:12:42.508397	2017-10-12 19:12:42.508397	2015-03-09	1	11	3	2015	1
1790	5	0	508133	903348	1209358	1801640	2919363	2028434	840001	1390615	1182107	1472674	0	0	0	0	0	2017-10-12 19:12:42.519146	2017-10-12 19:12:42.519146	2015-03-10	1	11	3	2015	2
1791	5	0	310526	858181	1209358	1831311	2106894	1881540	467385	1030148	1068332	850976	0	0	0	0	0	2017-10-12 19:12:42.528816	2017-10-12 19:12:42.528816	2015-03-11	1	11	3	2015	3
1792	5	0	366985	722678	782526	1458499	2915798	1513070	917013	1206097	2063314	1252182	0	0	0	0	0	2017-10-12 19:12:42.537886	2017-10-12 19:12:42.537886	2015-03-12	1	11	3	2015	4
1793	5	0	395215	451674	1138219	2591303	2457088	819346	1483737	998086	1040520	1363604	0	0	0	0	0	2017-10-12 19:12:42.545918	2017-10-12 19:12:42.545918	2015-03-13	1	11	3	2015	5
1794	5	0	169378	225837	426832	1564416	896936	440894	490309	625858	453285	608008	0	0	0	0	0	2017-10-12 19:12:42.554235	2017-10-12 19:12:42.554235	2015-03-14	1	11	3	2015	6
1795	5	0	239952	451674	604678	972806	1050800	318767	451462	552437	914145	419666	0	0	0	0	0	2017-10-12 19:12:42.562603	2017-10-12 19:12:42.562603	2015-03-15	1	11	3	2015	0
1796	5	0	564593	677511	1138219	2671884	1202912	1618112	889840	1604504	2577064	1092837	0	0	0	0	0	2017-10-12 19:12:42.571687	2017-10-12 19:12:42.571687	2015-03-16	1	12	3	2015	1
1797	5	0	536363	587176	1067081	1702337	1965648	1620617	613652	1072036	665237	737083	0	0	0	0	0	2017-10-12 19:12:42.58058	2017-10-12 19:12:42.58058	2015-03-17	1	12	3	2015	2
1798	5	0	479904	903348	711387	1538508	1742003	817906	534167	1230180	2146432	1050904	0	0	0	0	0	2017-10-12 19:12:42.588688	2017-10-12 19:12:42.588688	2015-03-18	1	12	3	2015	3
1799	5	0	366985	722678	1422774	1246871	1744448	1805249	1168149	1415058	1531413	1494104	0	0	0	0	0	2017-10-12 19:12:42.596729	2017-10-12 19:12:42.596729	2015-03-19	1	12	3	2015	4
1800	5	0	338756	451674	711387	3008882	2942815	1472710	830943	841476	2610692	930845	0	0	0	0	0	2017-10-12 19:12:42.605039	2017-10-12 19:12:42.605039	2015-03-20	1	12	3	2015	5
1801	5	0	239952	225837	426832	1359337	2600768	382868	352489	634326	430852	330220	0	0	0	0	0	2017-10-12 19:12:42.614898	2017-10-12 19:12:42.614898	2015-03-21	1	12	3	2015	6
1802	5	0	282296	316172	320124	1344344	1052492	923162	306440	894593	868596	336389	0	0	0	0	0	2017-10-12 19:12:42.624343	2017-10-12 19:12:42.624343	2015-03-22	1	12	3	2015	0
1803	5	0	338756	677511	782526	1925173	5008695	831646	805720	1075898	1543344	1067334	0	0	0	0	0	2017-10-12 19:12:42.633427	2017-10-12 19:12:42.633427	2015-03-23	1	13	3	2015	1
1804	5	0	423444	587176	1280497	1665635	1783964	1435271	704648	779439	1470130	559763	0	0	0	0	0	2017-10-12 19:12:42.641569	2017-10-12 19:12:42.641569	2015-03-24	1	13	3	2015	2
1805	5	0	479904	542009	1351635	1218182	3640080	1119051	1169568	1137230	2550192	1134248	0	0	0	0	0	2017-10-12 19:12:42.649951	2017-10-12 19:12:42.649951	2015-03-25	1	13	3	2015	3
1806	5	0	310526	677511	853664	3269542	1830529	1190701	665410	811725	1933286	985086	0	0	0	0	0	2017-10-12 19:12:42.658414	2017-10-12 19:12:42.658414	2015-03-26	1	13	3	2015	4
1807	5	0	479904	813013	924803	2371235	2579389	961747	1014408	1091909	1534411	1139860	0	0	0	0	0	2017-10-12 19:12:42.667861	2017-10-12 19:12:42.667861	2015-03-27	1	13	3	2015	5
1808	5	0	155263	429090	497970	1314827	634981	459346	353749	495308	705880	209053	0	0	0	0	0	2017-10-12 19:12:42.676519	2017-10-12 19:12:42.676519	2015-03-28	1	13	3	2015	6
1809	5	0	282296	406507	640247	1255318	1612332	772975	230082	595777	536051	250133	0	0	0	0	0	2017-10-12 19:12:42.685211	2017-10-12 19:12:42.685211	2015-03-29	1	13	3	2015	0
1810	5	0	366985	451674	1280497	2216162	2727618	888110	900065	1775852	1228882	727934	0	0	0	0	0	2017-10-12 19:12:42.693768	2017-10-12 19:12:42.693768	2015-03-30	1	14	3	2015	1
1811	5	0	479904	767846	640248	1120683	3925257	1196465	758718	1243299	2234630	1013922	0	0	0	0	0	2017-10-12 19:12:42.703161	2017-10-12 19:12:42.703161	2015-03-31	1	14	3	2015	2
1812	5	0	423444	632344	1422774	3388197	2216531	940553	555458	1654621	1854649	636467	0	0	0	0	0	2017-10-12 19:12:42.711621	2017-10-12 19:12:42.711621	2015-04-01	1	14	4	2015	3
1813	5	0	719855	1151769	1173788	3083637	3963214	970817	842916	2181462	3577582	864989	0	0	0	0	0	2017-10-12 19:12:42.720076	2017-10-12 19:12:42.720076	2015-04-02	1	14	4	2015	4
1814	5	0	635167	948515	2027452	1587347	5555886	1281545	751487	1266787	3967508	1253156	0	0	0	0	0	2017-10-12 19:12:42.72967	2017-10-12 19:12:42.72967	2015-04-03	1	14	4	2015	5
1815	5	0	381100	948515	1067080	4159761	4350254	2506184	1957288	2318220	2926118	806583	0	0	0	0	0	2017-10-12 19:12:42.738406	2017-10-12 19:12:42.738406	2015-04-04	1	14	4	2015	6
1816	5	0	677511	1355022	2027452	2802132	5269192	1237858	1932374	2022959	1619694	2076640	0	0	0	0	0	2017-10-12 19:12:42.746649	2017-10-12 19:12:42.746649	2015-04-05	1	14	4	2015	0
1817	5	0	232894	338756	533540	1049991	2447362	644428	742656	1705708	530676	545036	0	0	0	0	0	2017-10-12 19:12:42.754764	2017-10-12 19:12:42.754764	2015-04-06	1	15	4	2015	1
1818	5	0	381100	474258	1013726	2206005	1025934	918597	477048	986068	868860	355592	0	0	0	0	0	2017-10-12 19:12:42.762938	2017-10-12 19:12:42.762938	2015-04-07	1	15	4	2015	2
1819	5	0	804544	609760	1493912	1832381	4658717	1329901	1401541	3081060	4177090	1325043	0	0	0	0	0	2017-10-12 19:12:42.771387	2017-10-12 19:12:42.771387	2015-04-08	1	15	4	2015	3
1820	5	0	846889	609760	1280496	5235721	3482525	1726752	1235125	1523130	1722462	2524929	0	0	0	0	0	2017-10-12 19:12:42.780218	2017-10-12 19:12:42.780218	2015-04-09	1	15	4	2015	4
1821	5	0	635167	880764	1600620	5704524	5227382	1996298	1739634	1318251	2935149	1824868	0	0	0	0	0	2017-10-12 19:12:42.788518	2017-10-12 19:12:42.788518	2015-04-10	1	15	4	2015	5
1822	5	0	423444	1355022	1067080	2375082	1811526	1114610	1555426	2773868	1494617	1449079	0	0	0	0	0	2017-10-12 19:12:42.796574	2017-10-12 19:12:42.796574	2015-04-11	1	15	4	2015	6
1823	5	0	550478	1084018	1493912	2292560	2736950	1688862	631460	1100086	1466686	2120144	0	0	0	0	0	2017-10-12 19:12:42.804367	2017-10-12 19:12:42.804367	2015-04-12	1	15	4	2015	0
1824	5	0	423444	508133	533540	1034250	3353422	919068	891110	915378	855710	846196	0	0	0	0	0	2017-10-12 19:12:42.813069	2017-10-12 19:12:42.813069	2015-04-13	1	16	4	2015	1
1825	5	0	296411	304880	746956	667764	1889368	684219	578834	1242960	827893	389520	0	0	0	0	0	2017-10-12 19:12:42.822744	2017-10-12 19:12:42.822744	2015-04-14	1	16	4	2015	2
1826	5	0	381100	1084018	1173788	2224282	6125826	1996333	1836686	2761191	1459638	2038722	0	0	0	0	0	2017-10-12 19:12:42.83165	2017-10-12 19:12:42.83165	2015-04-15	1	16	4	2015	3
1827	5	0	846889	609760	1920744	4016561	2126418	3152497	1243878	1732769	2887762	1325800	0	0	0	0	0	2017-10-12 19:12:42.842016	2017-10-12 19:12:42.842016	2015-04-16	1	16	4	2015	4
1828	5	0	508133	948515	960372	1484412	1916892	2475298	886209	1290335	3127466	1535514	0	0	0	0	0	2017-10-12 19:12:42.850909	2017-10-12 19:12:42.850909	2015-04-17	1	16	4	2015	5
1829	5	0	762200	1016267	1280496	2332282	5397918	1889083	1119586	2031150	2472512	1612776	0	0	0	0	0	2017-10-12 19:12:42.860441	2017-10-12 19:12:42.860441	2015-04-18	1	16	4	2015	6
1830	5	0	508133	1151769	1920744	3590819	6741561	2114131	1078135	1788040	3136866	1008801	0	0	0	0	0	2017-10-12 19:12:42.870442	2017-10-12 19:12:42.870442	2015-04-19	1	16	4	2015	0
1831	5	0	338756	542009	533540	1596941	677799	832897	326539	683810	622506	457241	0	0	0	0	0	2017-10-12 19:12:42.879744	2017-10-12 19:12:42.879744	2015-04-20	1	17	4	2015	1
1832	5	0	317583	542009	853664	1159648	3206605	1379228	323123	1255192	945303	622283	0	0	0	0	0	2017-10-12 19:12:42.888135	2017-10-12 19:12:42.888135	2015-04-21	1	17	4	2015	2
1833	5	0	465789	677511	2027452	4097752	6449134	2245566	894039	3106228	2459318	1533090	0	0	0	0	0	2017-10-12 19:12:42.89659	2017-10-12 19:12:42.89659	2015-04-22	1	17	4	2015	3
1834	5	0	846889	677511	1387204	2231773	3380732	2083141	1801586	1363327	1106543	1072409	0	0	0	0	0	2017-10-12 19:12:42.907357	2017-10-12 19:12:42.907357	2015-04-23	1	17	4	2015	4
1835	5	0	381100	1355022	1387204	3214292	2671382	2369396	1346168	2173912	2270546	1753424	0	0	0	0	0	2017-10-12 19:12:42.918472	2017-10-12 19:12:42.918472	2015-04-24	1	17	4	2015	5
1836	5	0	846889	880764	1814036	3041134	4466119	2463932	767956	1452692	1929414	1272032	0	0	0	0	0	2017-10-12 19:12:42.927313	2017-10-12 19:12:42.927313	2015-04-25	1	17	4	2015	6
1837	5	0	423444	1151769	1814036	2214867	3773952	1117204	896843	2280620	2113997	1988664	0	0	0	0	0	2017-10-12 19:12:42.936188	2017-10-12 19:12:42.936188	2015-04-26	1	17	4	2015	0
1838	5	0	359928	609760	960372	2727401	3824088	563125	527203	467738	783229	539033	0	0	0	0	0	2017-10-12 19:12:42.944452	2017-10-12 19:12:42.944452	2015-04-27	1	18	4	2015	1
1839	5	0	232894	406507	586894	1191137	3578013	1371938	552160	1158500	1327749	493144	0	0	0	0	0	2017-10-12 19:12:42.954326	2017-10-12 19:12:42.954326	2015-04-28	1	18	4	2015	2
1840	5	0	423444	1016267	1493912	5381334	2466584	3387506	778842	1673534	1722113	1222752	0	0	0	0	0	2017-10-12 19:12:42.965431	2017-10-12 19:12:42.965431	2015-04-29	1	18	4	2015	3
1841	5	0	423444	1287271	1600620	1871129	2294622	1280555	1357996	1160366	1714371	2103699	0	0	0	0	0	2017-10-12 19:12:42.97442	2017-10-12 19:12:42.97442	2015-04-30	1	18	4	2015	4
1842	5	0	804544	1355022	1173788	3902787	4316164	1894223	1292871	1178096	1900767	1432851	0	0	0	0	0	2017-10-12 19:12:42.983344	2017-10-12 19:12:42.983344	2015-05-01	1	18	5	2015	5
1843	5	0	0	0	308700	668165	1101468	652410	648343	1195260	1877948	2178436	1261149	968075	0	0	0	2017-10-12 19:12:42.991872	2017-10-12 19:12:42.991872	2015-05-02	1	18	5	2015	6
1844	5	0	0	0	396900	678848	1264790	820925	958532	1025951	1281005	3399873	1354304	887506	0	0	0	2017-10-12 19:12:43.001035	2017-10-12 19:12:43.001035	2015-05-03	1	18	5	2015	0
1845	5	0	0	0	198450	544894	671240	1096224	760515	1215495	2091563	1665881	2599096	1049713	0	0	0	2017-10-12 19:12:43.012094	2017-10-12 19:12:43.012094	2015-05-04	1	19	5	2015	1
1846	5	0	0	0	330750	434408	1138589	923804	865892	1016150	2742285	1081980	2754664	1317237	0	0	0	2017-10-12 19:12:43.022123	2017-10-12 19:12:43.022123	2015-05-05	1	19	5	2015	2
1847	5	0	0	0	374850	844674	439859	787050	859933	893959	1908888	2052305	794487	1505894	0	0	0	2017-10-12 19:12:43.031523	2017-10-12 19:12:43.031523	2015-05-06	1	19	5	2015	3
1848	5	0	0	0	485100	572294	1773875	2105885	1367322	2936403	4697933	3250530	7022530	2130033	0	0	0	2017-10-12 19:12:43.041159	2017-10-12 19:12:43.041159	2015-05-07	1	19	5	2015	4
1849	5	0	0	0	458640	1371624	1790338	1794751	1297768	1686555	2411738	3591205	5853093	3088499	0	0	0	2017-10-12 19:12:43.051514	2017-10-12 19:12:43.051514	2015-05-08	1	19	5	2015	5
1850	5	0	0	0	220500	470131	837403	950744	530466	1792710	2452134	3273129	2107883	1235694	0	0	0	2017-10-12 19:12:43.060734	2017-10-12 19:12:43.060734	2015-05-09	1	19	5	2015	6
1851	5	0	0	0	308700	727396	1279559	615795	816202	1913925	1420635	1649694	2245842	755125	0	0	0	2017-10-12 19:12:43.069545	2017-10-12 19:12:43.069545	2015-05-10	1	19	5	2015	0
1852	5	0	0	0	418950	314341	456512	952289	1218112	1232653	1898640	1206632	1622083	932674	0	0	0	2017-10-12 19:12:43.079078	2017-10-12 19:12:43.079078	2015-05-11	1	20	5	2015	1
1853	5	0	0	0	242550	671262	850924	772201	754516	1981870	1662246	3515796	1428390	775946	0	0	0	2017-10-12 19:12:43.087701	2017-10-12 19:12:43.087701	2015-05-12	1	20	5	2015	2
1854	5	0	0	0	441000	650330	498969	809614	507026	1419466	1524466	2206154	1527690	787163	0	0	0	2017-10-12 19:12:43.09639	2017-10-12 19:12:43.09639	2015-05-13	1	20	5	2015	3
1855	5	0	0	0	396900	1022087	1338764	1734044	1611910	2466890	4597964	5506030	4497444	4047239	0	0	0	2017-10-12 19:12:43.104775	2017-10-12 19:12:43.104775	2015-05-14	1	20	5	2015	4
1856	5	0	0	0	599760	572717	633367	2068243	2011860	1902728	3834862	1791094	2894525	2070551	0	0	0	2017-10-12 19:12:43.114185	2017-10-12 19:12:43.114185	2015-05-15	1	20	5	2015	5
1857	5	0	0	0	220500	501023	1122814	348690	1078757	1382056	1463652	2340184	1617862	1223563	0	0	0	2017-10-12 19:12:43.124024	2017-10-12 19:12:43.124024	2015-05-16	1	20	5	2015	6
1858	5	0	0	0	418950	609774	524470	486300	643716	877973	2574035	1135347	1608639	1222690	0	0	0	2017-10-12 19:12:43.133076	2017-10-12 19:12:43.133076	2015-05-17	1	20	5	2015	0
1859	5	0	0	0	374850	621359	1110866	962889	436400	1461480	1751956	2077618	1434760	1204083	0	0	0	2017-10-12 19:12:43.142064	2017-10-12 19:12:43.142064	2015-05-18	1	21	5	2015	1
1860	5	0	0	0	308700	321611	471335	937882	724669	976267	1140400	1561030	1907681	756210	0	0	0	2017-10-12 19:12:43.150728	2017-10-12 19:12:43.150728	2015-05-19	1	21	5	2015	2
1861	5	0	0	0	352800	955904	1015772	1113293	680945	1198740	1530091	1745287	1803474	957895	0	0	0	2017-10-12 19:12:43.159976	2017-10-12 19:12:43.159976	2015-05-20	1	21	5	2015	3
1862	5	0	0	0	837900	1355988	1583747	1603433	1816460	3599812	3684374	4431359	3160992	3473662	0	0	0	2017-10-12 19:12:43.167974	2017-10-12 19:12:43.167974	2015-05-21	1	21	5	2015	4
1863	5	0	0	0	352800	829695	599308	1525419	1277511	1463690	5881704	3473799	2708414	2002902	0	0	0	2017-10-12 19:12:43.177172	2017-10-12 19:12:43.177172	2015-05-22	1	21	5	2015	5
1864	5	0	0	0	308700	626199	569626	879304	877694	1195868	2077776	1764536	1335870	924368	0	0	0	2017-10-12 19:12:43.185552	2017-10-12 19:12:43.185552	2015-05-23	1	21	5	2015	6
1865	5	0	0	0	264600	462033	870471	377816	817126	1220138	2645172	3253273	1124549	601183	0	0	0	2017-10-12 19:12:43.193936	2017-10-12 19:12:43.193936	2015-05-24	1	21	5	2015	0
1866	5	0	0	0	308700	868470	1038195	846390	936758	693450	2242228	1031837	1742218	1529082	0	0	0	2017-10-12 19:12:43.202964	2017-10-12 19:12:43.202964	2015-05-25	1	22	5	2015	1
1867	5	0	0	0	242550	734552	504390	1096585	821453	1120874	1605568	2287817	1673862	877465	0	0	0	2017-10-12 19:12:43.211354	2017-10-12 19:12:43.211354	2015-05-26	1	22	5	2015	2
1868	5	0	0	0	198450	733876	357436	535978	489563	993611	1373466	2156644	2523906	760086	0	0	0	2017-10-12 19:12:43.220373	2017-10-12 19:12:43.220373	2015-05-27	1	22	5	2015	3
1869	5	0	0	0	529200	1036832	1312646	1716278	1584250	1786653	2241849	5114631	5392806	1451882	0	0	0	2017-10-12 19:12:43.231642	2017-10-12 19:12:43.231642	2015-05-28	1	22	5	2015	4
1870	5	0	0	0	458640	1015314	3063622	1848160	1797859	1786798	3081203	2472733	4462600	1186525	0	0	0	2017-10-12 19:12:43.242288	2017-10-12 19:12:43.242288	2015-05-29	1	22	5	2015	5
1871	5	0	0	0	463050	897827	1213021	733209	1266376	1788501	1989162	2590366	3244516	1738830	0	0	0	2017-10-12 19:12:43.251706	2017-10-12 19:12:43.251706	2015-05-30	1	22	5	2015	6
1872	5	0	0	0	628425	1213929	2490970	1253327	690657	1140768	2548837	2206018	2773484	1329046	0	0	0	2017-10-12 19:12:43.260153	2017-10-12 19:12:43.260153	2015-05-31	1	22	5	2015	0
1873	5	0	0	0	529200	413090	728220	1266090	842334	1038575	2609917	2873459	3076596	1926684	0	0	0	2017-10-12 19:12:43.269779	2017-10-12 19:12:43.269779	2015-06-01	1	23	6	2015	1
1874	5	0	0	0	628425	970126	923158	1216253	884160	884282	2108471	1816942	3655615	1627278	0	0	0	2017-10-12 19:12:43.279593	2017-10-12 19:12:43.279593	2015-06-02	1	23	6	2015	2
1875	5	0	0	0	529200	1040094	729900	1064046	2064244	2041075	2153978	2596275	1367525	1797782	0	0	0	2017-10-12 19:12:43.28831	2017-10-12 19:12:43.28831	2015-06-03	1	23	6	2015	3
1876	5	0	0	0	562275	686730	1392597	701020	1745348	2488614	2189321	3068689	3165052	2292410	0	0	0	2017-10-12 19:12:43.29701	2017-10-12 19:12:43.29701	2015-06-04	1	23	6	2015	4
1877	5	0	0	0	463050	1938114	831130	1448225	1239038	1631648	5175334	1705734	3528908	1657991	0	0	0	2017-10-12 19:12:43.305236	2017-10-12 19:12:43.305236	2015-06-05	1	23	6	2015	5
1878	5	0	0	0	793800	1103171	1097375	2753357	3398038	3829906	4407521	9871105	3390551	2845656	0	0	0	2017-10-12 19:12:43.315095	2017-10-12 19:12:43.315095	2015-06-06	1	23	6	2015	6
1879	5	0	0	0	1005480	1328194	1622416	1850539	1625510	1947070	2737497	7336514	7974916	3235642	0	0	0	2017-10-12 19:12:43.324895	2017-10-12 19:12:43.324895	2015-06-07	1	23	6	2015	0
1880	5	0	0	0	595350	1117219	962410	520888	954616	1813954	2515260	3585582	2611657	1217921	0	0	0	2017-10-12 19:12:43.334323	2017-10-12 19:12:43.334323	2015-06-08	1	24	6	2015	1
1881	5	0	0	0	429975	1390766	630064	766775	1014013	1898237	1440461	3504257	4131951	1102501	0	0	0	2017-10-12 19:12:43.34306	2017-10-12 19:12:43.34306	2015-06-09	1	24	6	2015	2
1882	5	0	0	0	429975	881774	1780979	1543136	582179	1732176	1379182	4703508	2311267	2492246	0	0	0	2017-10-12 19:12:43.352396	2017-10-12 19:12:43.352396	2015-06-10	1	24	6	2015	3
1883	5	0	0	0	562275	344865	569186	1208845	1019696	1501004	2204340	4531629	1856548	1154235	0	0	0	2017-10-12 19:12:43.361864	2017-10-12 19:12:43.361864	2015-06-11	1	24	6	2015	4
1884	5	0	0	0	529200	809665	1377922	939291	1211960	2473096	3689878	2840188	2962218	2152923	0	0	0	2017-10-12 19:12:43.371326	2017-10-12 19:12:43.371326	2015-06-12	1	24	6	2015	5
1885	5	0	0	0	859950	1199685	2971740	3564049	1301873	2343811	6885155	7532071	4649363	5756394	0	0	0	2017-10-12 19:12:43.380347	2017-10-12 19:12:43.380347	2015-06-13	1	24	6	2015	6
1886	5	0	0	0	899640	2853145	1852927	2549240	3406920	2174868	3621097	7047393	9068030	3731008	0	0	0	2017-10-12 19:12:43.389847	2017-10-12 19:12:43.389847	2015-06-14	1	24	6	2015	0
1887	5	0	0	0	429975	433399	1455057	1766540	1252880	795375	1947530	2248016	2371813	1691412	0	0	0	2017-10-12 19:12:43.399741	2017-10-12 19:12:43.399741	2015-06-15	1	25	6	2015	1
1888	5	0	0	0	463050	1515974	860819	1242300	1213472	2902098	3371668	2959773	3044872	1413032	0	0	0	2017-10-12 19:12:43.410039	2017-10-12 19:12:43.410039	2015-06-16	1	25	6	2015	2
1889	5	0	0	0	496125	613102	1023982	2102183	550854	1156843	1134036	2616239	2813503	1265540	0	0	0	2017-10-12 19:12:43.421216	2017-10-12 19:12:43.421216	2015-06-17	1	25	6	2015	3
1890	5	0	0	0	330750	889360	934297	1088790	927387	2071327	1741785	1735272	2075017	1314079	0	0	0	2017-10-12 19:12:43.430476	2017-10-12 19:12:43.430476	2015-06-18	1	25	6	2015	4
1891	5	0	0	0	661500	841158	1663249	1417680	1951868	2156217	4962346	3357669	2027142	3398933	0	0	0	2017-10-12 19:12:43.439094	2017-10-12 19:12:43.439094	2015-06-19	1	25	6	2015	5
1892	5	0	0	0	727650	1683081	1380612	2938919	1756230	5607739	6423714	4730845	4799289	3449619	0	0	0	2017-10-12 19:12:43.447992	2017-10-12 19:12:43.447992	2015-06-20	1	25	6	2015	6
1893	5	0	0	0	476280	1041215	2575658	3711929	3179628	3875060	3011343	9542030	7404504	1849677	0	0	0	2017-10-12 19:12:43.458254	2017-10-12 19:12:43.458254	2015-06-21	1	25	6	2015	0
1894	5	0	0	0	297675	644307	2215658	1742461	773914	2368844	3565752	1477976	1895802	974949	0	0	0	2017-10-12 19:12:43.466736	2017-10-12 19:12:43.466736	2015-06-22	1	26	6	2015	1
1895	5	0	0	0	529200	1307132	416015	2050204	1551695	1598476	2600566	4942179	2309839	1146956	0	0	0	2017-10-12 19:12:43.47513	2017-10-12 19:12:43.47513	2015-06-23	1	26	6	2015	2
1896	5	0	0	0	396900	810819	895794	930839	1077127	1117280	2815090	4000843	1702992	1066985	0	0	0	2017-10-12 19:12:43.515516	2017-10-12 19:12:43.515516	2015-06-24	1	26	6	2015	3
1897	5	0	0	0	463050	835803	1343362	737351	1714005	1714966	2161888	2284286	2246335	2465432	0	0	0	2017-10-12 19:12:43.524078	2017-10-12 19:12:43.524078	2015-06-25	1	26	6	2015	4
1898	5	0	0	0	595350	1751514	1104760	1058344	751320	3102077	2563865	3177315	4680504	1862830	0	0	0	2017-10-12 19:12:43.53215	2017-10-12 19:12:43.53215	2015-06-26	1	26	6	2015	5
1899	5	0	0	0	793800	1850166	2017291	2202772	2754922	2388183	6359888	4375023	6074366	3443912	0	0	0	2017-10-12 19:12:43.539859	2017-10-12 19:12:43.539859	2015-06-27	1	26	6	2015	6
1900	5	0	0	0	952560	827599	882932	2584553	1999670	2304551	6228893	7676547	10044399	1949463	0	0	0	2017-10-12 19:12:43.548211	2017-10-12 19:12:43.548211	2015-06-28	1	26	6	2015	0
1901	5	0	0	0	363825	1024731	1141526	938717	1704530	1046960	3028781	2875747	1765257	1827663	0	0	0	2017-10-12 19:12:43.556671	2017-10-12 19:12:43.556671	2015-06-29	1	27	6	2015	1
1902	5	0	0	0	595350	955280	2159591	1411033	792965	2228287	3183554	2495684	3886310	1722917	0	0	0	2017-10-12 19:12:43.566622	2017-10-12 19:12:43.566622	2015-06-30	1	27	6	2015	2
1903	5	0	0	0	529200	772047	543461	1065965	1005395	1095324	2156875	1866416	1530463	1395500	0	0	0	2017-10-12 19:12:43.57519	2017-10-12 19:12:43.57519	2015-07-01	1	27	7	2015	3
1904	5	0	479904	767846	1280497	2979282	1460831	2162202	436755	897793	1486562	1103003	0	0	0	0	0	2017-10-12 19:12:43.5839	2017-10-12 19:12:43.5839	2015-07-02	1	27	7	2015	4
1905	5	0	536363	406507	1209358	2512639	2448839	2046798	566723	1980495	2086069	626462	0	0	0	0	0	2017-10-12 19:12:43.593545	2017-10-12 19:12:43.593545	2015-07-03	1	27	7	2015	5
1906	5	0	479904	632344	853664	1626396	3212622	887663	909478	1787811	2189433	798150	0	0	0	0	0	2017-10-12 19:12:43.602233	2017-10-12 19:12:43.602233	2015-07-04	1	27	7	2015	6
1907	5	0	479904	542009	995942	1448077	3035731	788098	1335200	970806	2319207	1659949	0	0	0	0	0	2017-10-12 19:12:43.610755	2017-10-12 19:12:43.610755	2015-07-05	1	27	7	2015	0
1908	5	0	141148	316172	355693	1220663	1323611	401933	462622	459411	844523	383897	0	0	0	0	0	2017-10-12 19:12:43.621925	2017-10-12 19:12:43.621925	2015-07-06	1	28	7	2015	1
1909	5	0	155263	293588	569109	517941	2062892	476551	302171	603387	955846	257179	0	0	0	0	0	2017-10-12 19:12:43.632019	2017-10-12 19:12:43.632019	2015-07-07	1	28	7	2015	2
1910	5	0	338756	632344	924803	1946836	3873623	666885	554749	901047	2359107	795561	0	0	0	0	0	2017-10-12 19:12:43.641077	2017-10-12 19:12:43.641077	2015-07-08	1	28	7	2015	3
1911	5	0	536363	767846	1422774	1801640	2919363	1318482	960002	736208	1063896	1656758	0	0	0	0	0	2017-10-12 19:12:43.6496	2017-10-12 19:12:43.6496	2015-07-09	1	28	7	2015	4
1912	5	0	254067	903348	1422774	1997794	3511490	1223001	382406	1030148	1643588	1276464	0	0	0	0	0	2017-10-12 19:12:43.658169	2017-10-12 19:12:43.658169	2015-07-10	1	28	7	2015	5
1913	5	0	423444	542009	1280497	1346306	2105854	1691078	720510	1277044	2427428	724947	0	0	0	0	0	2017-10-12 19:12:43.668631	2017-10-12 19:12:43.668631	2015-07-11	1	28	7	2015	6
1914	5	0	451674	496841	1138219	2245796	3480874	1340748	1405645	1451762	1040520	886343	0	0	0	0	0	2017-10-12 19:12:43.678502	2017-10-12 19:12:43.678502	2015-07-12	1	28	7	2015	0
1915	5	0	169378	203253	569109	1662192	747447	636847	398376	552228	705110	608008	0	0	0	0	0	2017-10-12 19:12:43.688195	2017-10-12 19:12:43.688195	2015-07-13	1	29	7	2015	1
1916	5	0	254067	271004	355693	843098	1050800	521618	386968	310746	673581	188850	0	0	0	0	0	2017-10-12 19:12:43.696855	2017-10-12 19:12:43.696855	2015-07-14	1	29	7	2015	2
1917	5	0	338756	677511	924803	2466354	1904611	1132678	711872	1069669	1932798	1561196	0	0	0	0	0	2017-10-12 19:12:43.705199	2017-10-12 19:12:43.705199	2015-07-15	1	29	7	2015	3
1918	5	0	366985	767846	640248	3404673	1684841	1188452	1090936	1319429	1256558	737083	0	0	0	0	0	2017-10-12 19:12:43.714551	2017-10-12 19:12:43.714551	2015-07-16	1	29	7	2015	4
1919	5	0	564593	496841	1138219	1538508	3135605	1390440	534167	2050300	1743976	985223	0	0	0	0	0	2017-10-12 19:12:43.724907	2017-10-12 19:12:43.724907	2015-07-17	1	29	7	2015	5
1920	5	0	564593	722678	1422774	1413120	969138	1303791	1323902	1088506	1531413	1411099	0	0	0	0	0	2017-10-12 19:12:43.734129	2017-10-12 19:12:43.734129	2015-07-18	1	29	7	2015	6
1921	5	0	451674	677511	711387	3008882	2452346	1126190	553962	1178066	1435881	930845	0	0	0	0	0	2017-10-12 19:12:43.742602	2017-10-12 19:12:43.742602	2015-07-19	1	29	7	2015	0
1922	5	0	282296	338756	533540	1208299	1950576	574302	503556	559700	509189	330220	0	0	0	0	0	2017-10-12 19:12:43.751621	2017-10-12 19:12:43.751621	2015-07-20	1	30	7	2015	1
1923	5	0	254067	271004	355693	2068222	720126	461581	680978	894593	390868	476551	0	0	0	0	0	2017-10-12 19:12:43.760136	2017-10-12 19:12:43.760136	2015-07-21	1	30	7	2015	2
1924	5	0	423444	406507	711387	2887760	2899771	907250	537146	896582	1543344	747134	0	0	0	0	0	2017-10-12 19:12:43.768679	2017-10-12 19:12:43.768679	2015-07-22	1	30	7	2015	3
1925	5	0	310526	903348	1067081	1665635	1387527	1052532	542037	1212460	882078	559763	0	0	0	0	0	2017-10-12 19:12:43.7808	2017-10-12 19:12:43.7808	2015-07-23	1	30	7	2015	4
1926	5	0	254067	722678	1280497	1771901	2957565	2238102	1046455	1023507	1657625	819179	0	0	0	0	0	2017-10-12 19:12:43.790639	2017-10-12 19:12:43.790639	2015-07-24	1	30	7	2015	5
1927	5	0	310526	632344	995942	3077216	1184460	893026	831762	737932	869979	773996	0	0	0	0	0	2017-10-12 19:12:43.799879	2017-10-12 19:12:43.799879	2015-07-25	1	30	7	2015	6
1928	5	0	508133	632344	640248	2371235	1785731	824354	1014408	1091909	1150808	871658	0	0	0	0	0	2017-10-12 19:12:43.807894	2017-10-12 19:12:43.807894	2015-07-26	1	30	7	2015	0
1929	5	0	239952	406507	569109	1502659	846642	918691	672123	627390	957980	380096	0	0	0	0	0	2017-10-12 19:12:43.815878	2017-10-12 19:12:43.815878	2015-07-27	1	31	7	2015	1
1930	5	0	211722	293588	640247	1062192	1048016	610244	253090	397184	423198	300160	0	0	0	0	0	2017-10-12 19:12:43.82434	2017-10-12 19:12:43.82434	2015-07-28	1	31	7	2015	2
1931	5	0	366985	813013	1280497	3165946	1704761	1406175	975070	1308523	1667769	467958	0	0	0	0	0	2017-10-12 19:12:43.834146	2017-10-12 19:12:43.834146	2015-07-29	1	31	7	2015	3
1932	5	0	564593	542009	1280497	1018803	5046759	633423	1050532	1657732	1862192	912530	0	0	0	0	0	2017-10-12 19:12:43.842368	2017-10-12 19:12:43.842368	2015-07-30	1	31	7	2015	4
1933	5	0	536363	587176	1138219	2117623	1705024	1567588	925763	783768	1171357	795584	0	0	0	0	0	2017-10-12 19:12:43.850532	2017-10-12 19:12:43.850532	2015-07-31	1	31	7	2015	5
1934	5	0	423444	1355022	1493912	1632514	4359535	970817	702430	2648918	2259526	961099	0	0	0	0	0	2017-10-12 19:12:43.858975	2017-10-12 19:12:43.858975	2015-08-01	1	31	8	2015	6
1935	5	0	719855	1355022	1707328	2319968	4074316	2330082	1586473	995333	4176324	1629103	0	0	0	0	0	2017-10-12 19:12:43.867127	2017-10-12 19:12:43.867127	2015-08-02	1	31	8	2015	0
1936	5	0	762200	880764	1280496	4404452	3582562	2801029	2324280	2318220	1316753	1451849	0	0	0	0	0	2017-10-12 19:12:43.877089	2017-10-12 19:12:43.877089	2015-08-03	1	32	8	2015	1
1937	5	0	804544	880764	1814036	2662025	5269192	1462923	1830670	2022959	1041232	1710174	0	0	0	0	0	2017-10-12 19:12:43.885575	2017-10-12 19:12:43.885575	2015-08-04	1	32	8	2015	2
1938	5	0	275239	406507	533540	1622713	2141441	644428	835488	1108710	1061352	286861	0	0	0	0	0	2017-10-12 19:12:43.89383	2017-10-12 19:12:43.89383	2015-08-05	1	32	8	2015	3
1939	5	0	402272	643635	746956	2206005	1139927	540351	437294	682663	1055044	323265	0	0	0	0	0	2017-10-12 19:12:43.902329	2017-10-12 19:12:43.902329	2015-08-06	1	32	8	2015	4
1940	5	0	381100	1219520	1280496	1985079	3882264	1728871	1001101	1386477	3968236	1987565	0	0	0	0	0	2017-10-12 19:12:43.9121	2017-10-12 19:12:43.9121	2015-08-07	1	32	8	2015	5
1941	5	0	719855	1219520	1600620	5851688	3134273	1181462	1543906	2411623	1952124	1993365	0	0	0	0	0	2017-10-12 19:12:43.921146	2017-10-12 19:12:43.921146	2015-08-08	1	32	8	2015	6
1942	5	0	762200	1016267	1387204	5704524	5575874	1644010	1841965	1464723	3118596	1920914	0	0	0	0	0	2017-10-12 19:12:43.930398	2017-10-12 19:12:43.930398	2015-08-09	1	32	8	2015	0
1943	5	0	423444	1151769	1280496	2884028	3019211	2229221	1069355	1248241	2184440	1086809	0	0	0	0	0	2017-10-12 19:12:43.939923	2017-10-12 19:12:43.939923	2015-08-10	1	33	8	2015	1
1944	5	0	508133	677511	1387204	2547289	1872650	1266647	631460	1955709	2133362	2002359	0	0	0	0	0	2017-10-12 19:12:43.948786	2017-10-12 19:12:43.948786	2015-08-11	1	33	8	2015	2
1945	5	0	275239	575884	480186	875135	2421916	551441	891110	1414675	385070	564131	0	0	0	0	0	2017-10-12 19:12:43.957681	2017-10-12 19:12:43.957681	2015-08-12	1	33	8	2015	3
1946	5	0	275239	609760	1067080	1038744	994404	836267	723543	1169845	709622	708218	0	0	0	0	0	2017-10-12 19:12:43.966419	2017-10-12 19:12:43.966419	2015-08-13	1	33	8	2015	4
1947	5	0	381100	880764	1493912	2085264	3675496	998167	1714240	2761191	1621820	2038722	0	0	0	0	0	2017-10-12 19:12:43.975812	2017-10-12 19:12:43.975812	2015-08-14	1	33	8	2015	5
1948	5	0	719855	745262	1387204	3544025	2598956	2820655	995102	1936624	2310210	1215316	0	0	0	0	0	2017-10-12 19:12:43.984466	2017-10-12 19:12:43.984466	2015-08-15	1	33	8	2015	6
1949	5	0	719855	948515	2134160	1814282	2076633	2011179	749869	1720446	4169954	1247605	0	0	0	0	0	2017-10-12 19:12:43.993001	2017-10-12 19:12:43.993001	2015-08-16	1	33	8	2015	0
1950	5	0	381100	1084018	1067080	2040746	6072658	1789657	1049612	1624920	2317980	1488716	0	0	0	0	0	2017-10-12 19:12:44.001397	2017-10-12 19:12:44.001397	2015-08-17	1	34	8	2015	1
1951	5	0	677511	1287271	1387204	3590819	4612647	1321332	2156270	3576080	2300368	2129691	0	0	0	0	0	2017-10-12 19:12:44.009644	2017-10-12 19:12:44.009644	2015-08-18	1	34	8	2015	2
1952	5	0	275239	677511	533540	1796558	1430909	1249346	457155	1056797	456504	868758	0	0	0	0	0	2017-10-12 19:12:44.019401	2017-10-12 19:12:44.019401	2015-08-19	1	34	8	2015	3
1953	5	0	423444	372631	853664	892037	2404954	896498	502636	812183	945303	577834	0	0	0	0	0	2017-10-12 19:12:44.028333	2017-10-12 19:12:44.028333	2015-08-20	1	34	8	2015	4
1954	5	0	550478	745262	1493912	2817205	6449134	1603976	1625526	2779257	2107987	1886880	0	0	0	0	0	2017-10-12 19:12:44.036412	2017-10-12 19:12:44.036412	2015-08-21	1	34	8	2015	5
1955	5	0	846889	609760	1280496	1611836	1690366	1487958	1611945	1850230	1991777	1549036	0	0	0	0	0	2017-10-12 19:12:44.044399	2017-10-12 19:12:44.044399	2015-08-22	1	34	8	2015	6
1956	5	0	465789	745262	1067080	5844168	3434634	2369396	1553271	2046035	1314526	1643835	0	0	0	0	0	2017-10-12 19:12:44.052993	2017-10-12 19:12:44.052993	2015-08-23	1	34	8	2015	0
1957	5	0	592822	1219520	1280496	3041134	3509094	1642621	1365254	2905384	2342860	2312786	0	0	0	0	0	2017-10-12 19:12:44.061901	2017-10-12 19:12:44.061901	2015-08-24	1	35	8	2015	1
1958	5	0	423444	948515	1814036	3164096	2830464	1452365	986527	1207387	4016594	1988664	0	0	0	0	0	2017-10-12 19:12:44.071215	2017-10-12 19:12:44.071215	2015-08-25	1	35	8	2015	2
1959	5	0	423444	575884	586894	2296758	3622820	1188819	623058	935476	783229	787818	0	0	0	0	0	2017-10-12 19:12:44.080166	2017-10-12 19:12:44.080166	2015-08-26	1	35	8	2015	3
1960	5	0	232894	542009	1013726	1488921	3578013	1629176	828240	1235733	1048223	669267	0	0	0	0	0	2017-10-12 19:12:44.08849	2017-10-12 19:12:44.08849	2015-08-27	1	35	8	2015	4
1961	5	0	719855	1219520	1600620	3115509	2620746	3387506	843746	1338827	2678843	1366605	0	0	0	0	0	2017-10-12 19:12:44.096611	2017-10-12 19:12:44.096611	2015-08-28	1	35	8	2015	5
1962	5	0	508133	948515	960372	2338911	3278032	1814119	1648995	1805014	964334	2214420	0	0	0	0	0	2017-10-12 19:12:44.108268	2017-10-12 19:12:44.108268	2015-08-29	1	35	8	2015	6
1963	5	0	423444	1355022	1814036	4423159	6278056	3157038	1034297	1767144	1006288	1873728	0	0	0	0	0	2017-10-12 19:12:44.1171	2017-10-12 19:12:44.1171	2015-08-30	1	35	8	2015	0
1964	5	0	0	0	220500	572713	991321	1186200	997450	1195260	1596256	1415983	2017838	1149589	0	0	0	2017-10-12 19:12:44.126643	2017-10-12 19:12:44.126643	2015-08-31	1	36	8	2015	1
1965	5	0	0	0	308700	543078	869543	1136666	958532	732822	1110204	1789407	846440	942975	0	0	0	2017-10-12 19:12:44.135585	2017-10-12 19:12:44.135585	2015-09-01	1	36	9	2015	2
1966	5	0	0	0	264600	408671	710725	1388550	475322	1458594	2788750	999528	1949322	2099426	0	0	0	2017-10-12 19:12:44.144128	2017-10-12 19:12:44.144128	2015-09-02	1	36	9	2015	3
1967	5	0	0	0	308700	355424	853942	831424	779303	931471	2453624	1081980	1683406	1519889	0	0	0	2017-10-12 19:12:44.154062	2017-10-12 19:12:44.154062	2015-09-03	1	36	9	2015	4
1968	5	0	0	0	220500	666848	314185	577170	859933	1589261	1240777	2052305	1235868	1129421	0	0	0	2017-10-12 19:12:44.163939	2017-10-12 19:12:44.163939	2015-09-04	1	36	9	2015	5
1969	5	0	0	0	617400	629523	1500971	1052942	2278870	1957602	5285174	2750449	6320277	2890759	0	0	0	2017-10-12 19:12:44.172666	2017-10-12 19:12:44.172666	2015-09-05	1	36	9	2015	6
1970	5	0	0	0	670320	1285898	1369082	2111472	1061810	1264916	2597256	3591205	2772518	3088499	0	0	0	2017-10-12 19:12:44.181732	2017-10-12 19:12:44.181732	2015-09-06	1	36	9	2015	0
1971	5	0	0	0	308700	812045	1294168	894818	1060933	1434168	1471280	1732833	1171046	1318074	0	0	0	2017-10-12 19:12:44.190123	2017-10-12 19:12:44.190123	2015-09-07	1	37	9	2015	1
1972	5	0	0	0	441000	344556	938343	538821	775392	906596	1988889	2549527	2009437	1029716	0	0	0	2017-10-12 19:12:44.199626	2017-10-12 19:12:44.199626	2015-09-08	1	37	9	2015	2
1973	5	0	0	0	264600	269435	373510	1025542	1157206	1001530	1044252	1327295	1531967	1968978	0	0	0	2017-10-12 19:12:44.209162	2017-10-12 19:12:44.209162	2015-09-09	1	37	9	2015	3
1974	5	0	0	0	396900	629309	780013	590507	887666	1684590	1278651	1757898	714195	942220	0	0	0	2017-10-12 19:12:44.217434	2017-10-12 19:12:44.217434	2015-09-10	1	37	9	2015	4
1975	5	0	0	0	264600	376507	614115	1324823	507026	1135573	1172666	1434000	859325	1224475	0	0	0	2017-10-12 19:12:44.225704	2017-10-12 19:12:44.225704	2015-09-11	1	37	9	2015	5
1976	5	0	0	0	529200	851739	1933771	2456563	1511166	1298363	2528880	4129523	4872231	3809166	0	0	0	2017-10-12 19:12:44.234209	2017-10-12 19:12:44.234209	2015-09-12	1	37	9	2015	6
1977	5	0	0	0	635040	715896	760040	1723536	1408302	1545967	2769623	1611985	5789050	1552913	0	0	0	2017-10-12 19:12:44.242893	2017-10-12 19:12:44.242893	2015-09-13	1	37	9	2015	0
1978	5	0	0	0	396900	567826	954392	697379	1011335	1056866	1351063	1376579	2364567	791717	0	0	0	2017-10-12 19:12:44.25217	2017-10-12 19:12:44.25217	2015-09-14	1	38	9	2015	1
1979	5	0	0	0	374850	365864	839152	680820	1053353	1170630	2574035	1754628	1354643	917017	0	0	0	2017-10-12 19:12:44.261875	2017-10-12 19:12:44.261875	2015-09-15	1	38	9	2015	2
1980	5	0	0	0	374850	402056	1348909	1481368	581867	1375510	1751956	1588766	1793450	1290089	0	0	0	2017-10-12 19:12:44.270492	2017-10-12 19:12:44.270492	2015-09-16	1	38	9	2015	3
1981	5	0	0	0	418950	353772	439912	789795	592911	1220334	2280800	2428269	2725258	648180	0	0	0	2017-10-12 19:12:44.279047	2017-10-12 19:12:44.279047	2015-09-17	1	38	9	2015	4
1982	5	0	0	0	198450	637270	457097	927744	1021417	1339768	1176993	2327050	1803474	798246	0	0	0	2017-10-12 19:12:44.288027	2017-10-12 19:12:44.288027	2015-09-18	1	38	9	2015	5
1983	5	0	0	0	837900	2259980	1809997	1697753	1397277	2463029	2714802	2954239	5747258	2508756	0	0	0	2017-10-12 19:12:44.298027	2017-10-12 19:12:44.298027	2015-09-19	1	38	9	2015	6
1984	5	0	0	0	529200	770431	980685	1605704	1625924	1341716	4999448	4168559	3310284	1573708	0	0	0	2017-10-12 19:12:44.307017	2017-10-12 19:12:44.307017	2015-09-20	1	38	9	2015	0
1985	5	0	0	0	330750	670928	569626	1172405	1065771	1275592	1500616	1213119	1870218	1027076	0	0	0	2017-10-12 19:12:44.316369	2017-10-12 19:12:44.316369	2015-09-21	1	39	9	2015	1
1986	5	0	0	0	220500	616044	1138308	717850	1225688	1032425	1587103	2891798	1431244	1068770	0	0	0	2017-10-12 19:12:44.32553	2017-10-12 19:12:44.32553	2015-09-22	1	39	9	2015	2
1987	5	0	0	0	374850	651353	973308	976604	526927	1386900	2242228	1238204	2758511	1242379	0	0	0	2017-10-12 19:12:44.335281	2017-10-12 19:12:44.335281	2015-09-23	1	39	9	2015	3
1988	5	0	0	0	396900	795765	917072	1038870	762778	910710	1313646	1324525	2789770	1462442	0	0	0	2017-10-12 19:12:44.343766	2017-10-12 19:12:44.343766	2015-09-24	1	39	9	2015	4
1989	5	0	0	0	418950	629036	357436	535978	338928	1192333	1373466	1824853	1963038	1064120	0	0	0	2017-10-12 19:12:44.352376	2017-10-12 19:12:44.352376	2015-09-25	1	39	9	2015	5
1990	5	0	0	0	837900	1382442	1218885	1848300	1232195	3215975	2490943	3750729	5392806	1979840	0	0	0	2017-10-12 19:12:44.36117	2017-10-12 19:12:44.36117	2015-09-26	1	39	9	2015	6
1991	5	0	0	0	599760	1269142	2757260	2244194	2134958	3248724	4929925	2060611	2789125	1898440	0	0	0	2017-10-12 19:12:44.371579	2017-10-12 19:12:44.371579	2015-09-27	1	39	9	2015	0
1992	5	0	0	0	429975	1035954	1288835	666554	1042898	1676720	3182659	2590366	2481101	1304123	0	0	0	2017-10-12 19:12:44.380561	2017-10-12 19:12:44.380561	2015-09-28	1	40	9	2015	1
1993	5	0	0	0	628425	944167	1619131	810976	627870	1254845	1649248	1866631	3169696	2104322	0	0	0	2017-10-12 19:12:44.389085	2017-10-12 19:12:44.389085	2015-09-29	1	40	9	2015	2
1994	5	0	0	0	429975	660944	860623	1191614	842334	1298219	2319926	3042486	2221986	912640	0	0	0	2017-10-12 19:12:44.398427	2017-10-12 19:12:44.398427	2015-09-30	1	40	9	2015	3
1995	5	0	0	0	463050	970126	865461	781877	1277120	1965070	2530165	2826354	4061794	1712924	0	0	0	2017-10-12 19:12:44.407662	2017-10-12 19:12:44.407662	2015-10-01	1	40	10	2015	4
1996	5	0	0	0	429975	550638	778560	2128092	2064244	1530806	2937243	2832300	2735050	1419302	0	0	0	2017-10-12 19:12:44.417213	2017-10-12 19:12:44.417213	2015-10-02	1	40	10	2015	5
1997	5	0	0	0	562275	686730	732946	817856	1194185	1702736	2694549	5300462	3340888	1031585	0	0	0	2017-10-12 19:12:44.427152	2017-10-12 19:12:44.427152	2015-10-03	1	40	10	2015	6
1998	5	0	0	0	628425	1841208	1246694	2116636	681471	1359707	5175334	2729174	2587866	2072489	0	0	0	2017-10-12 19:12:44.436142	2017-10-12 19:12:44.436142	2015-10-04	1	40	10	2015	0
1999	5	0	0	0	992250	1103171	2072820	1781584	3398038	4787382	8013674	10419499	3729606	3414787	0	0	0	2017-10-12 19:12:44.446532	2017-10-12 19:12:44.446532	2015-10-05	1	41	10	2015	1
2000	5	0	0	0	582120	1438876	1622416	3084231	2113163	2246619	4258328	4126789	7505803	4729015	0	0	0	2017-10-12 19:12:44.455305	2017-10-12 19:12:44.455305	2015-10-06	1	41	10	2015	2
2001	5	0	0	0	595350	907741	481205	1041775	954616	1179070	2724865	4866147	2052016	1759219	0	0	0	2017-10-12 19:12:44.466868	2017-10-12 19:12:44.466868	2015-10-07	1	41	10	2015	3
2002	5	0	0	0	661500	1081707	735074	1061689	823885	1898237	1584507	5006082	2609653	1715001	0	0	0	2017-10-12 19:12:44.476622	2017-10-12 19:12:44.476622	2015-10-08	1	41	10	2015	4
2003	5	0	0	0	330750	1234484	1484150	868014	698615	2165220	2620446	4442202	1877905	2024950	0	0	0	2017-10-12 19:12:44.486665	2017-10-12 19:12:44.486665	2015-10-09	1	41	10	2015	5
2004	5	0	0	0	297675	551784	626105	949807	926996	1801204	2755425	2832268	3375542	1269659	0	0	0	2017-10-12 19:12:44.495901	2017-10-12 19:12:44.495901	2015-10-10	1	41	10	2015	6
2005	5	0	0	0	595350	520499	1377922	1148023	1118732	2119796	3162752	1966284	2406802	1435282	0	0	0	2017-10-12 19:12:44.504753	2017-10-12 19:12:44.504753	2015-10-11	1	41	10	2015	0
2006	5	0	0	0	926100	2266071	2971740	3376467	1562248	2343811	4426171	4184484	5424257	6475943	0	0	0	2017-10-12 19:12:44.513756	2017-10-12 19:12:44.513756	2015-10-12	1	42	10	2015	1
2007	5	0	0	0	635040	1501655	2695166	2999106	2868986	2951606	5925431	7517219	7858959	3938286	0	0	0	2017-10-12 19:12:44.523349	2017-10-12 19:12:44.523349	2015-10-13	1	42	10	2015	2
2008	5	0	0	0	496125	433399	1616730	1668399	1879321	1272600	3009819	1605726	1581209	890217	0	0	0	2017-10-12 19:12:44.562967	2017-10-12 19:12:44.562967	2015-10-14	1	42	10	2015	3
2009	5	0	0	0	396900	1326478	1635556	993840	1284853	2176574	2129474	2367818	2283654	1059774	0	0	0	2017-10-12 19:12:44.570921	2017-10-12 19:12:44.570921	2015-10-15	1	42	10	2015	4
2010	5	0	0	0	297675	481723	1023982	1438336	856884	2313686	1814458	1846757	4019290	2671696	0	0	0	2017-10-12 19:12:44.578878	2017-10-12 19:12:44.578878	2015-10-16	1	42	10	2015	5
2011	5	0	0	0	396900	575468	1358978	1682675	811464	1380884	2322380	2602908	4380591	1752106	0	0	0	2017-10-12 19:12:44.586767	2017-10-12 19:12:44.586767	2015-10-17	1	42	10	2015	6
2012	5	0	0	0	363825	791678	1271897	866360	1951868	2156217	2481173	3805358	2477618	2265955	0	0	0	2017-10-12 19:12:44.594718	2017-10-12 19:12:44.594718	2015-10-18	1	42	10	2015	0
2013	5	0	0	0	595350	2142104	1506122	3457552	1609878	5277872	7800224	10512988	6645170	5307106	0	0	0	2017-10-12 19:12:44.603505	2017-10-12 19:12:44.603505	2015-10-19	1	43	10	2015	1
2014	5	0	0	0	529200	1272597	1770765	2735106	2384721	3875060	3242985	8587827	11723798	1849677	0	0	0	2017-10-12 19:12:44.611964	2017-10-12 19:12:44.611964	2015-10-20	1	43	10	2015	2
2015	5	0	0	0	562275	579876	1218612	1127475	1006088	2119492	3387464	2463294	2654123	1329476	0	0	0	2017-10-12 19:12:44.620984	2017-10-12 19:12:44.620984	2015-10-21	1	43	10	2015	3
2016	5	0	0	0	529200	1537802	462239	1537653	1825524	1465269	2167138	3197880	1979862	882274	0	0	0	2017-10-12 19:12:44.629467	2017-10-12 19:12:44.629467	2015-10-22	1	43	10	2015	4
2017	5	0	0	0	363825	1261274	1990654	1241118	1166888	2358702	3897817	3294812	1459708	1707176	0	0	0	2017-10-12 19:12:44.637678	2017-10-12 19:12:44.637678	2015-10-23	1	43	10	2015	5
2018	5	0	0	0	429975	603636	1511282	1253497	1310709	1200476	2161888	3945586	2085883	2465432	0	0	0	2017-10-12 19:12:44.646866	2017-10-12 19:12:44.646866	2015-10-24	1	43	10	2015	6
2019	5	0	0	0	429975	1138484	903894	764360	887923	2612275	1880167	2753673	3120336	2292714	0	0	0	2017-10-12 19:12:44.655691	2017-10-12 19:12:44.655691	2015-10-25	1	43	10	2015	0
2020	5	0	0	0	595350	2220199	4034582	2753465	2410556	2388183	8479850	7000037	9111550	2817746	0	0	0	2017-10-12 19:12:44.664541	2017-10-12 19:12:44.664541	2015-10-26	1	44	10	2015	1
2021	5	0	0	0	635040	827599	971225	1723035	2532915	3072734	6574942	4064054	9515747	3032498	0	0	0	2017-10-12 19:12:44.673138	2017-10-12 19:12:44.673138	2015-10-27	1	44	10	2015	2
2022	5	0	0	0	330750	819785	1867952	768041	986833	1744934	3407378	2270327	1901046	1462130	0	0	0	2017-10-12 19:12:44.682568	2017-10-12 19:12:44.682568	2015-10-28	1	44	10	2015	3
2023	5	0	0	0	429975	603335	2039614	1713398	1158949	2104493	2809019	3856967	1943155	1230655	0	0	0	2017-10-12 19:12:44.69132	2017-10-12 19:12:44.69132	2015-10-29	1	44	10	2015	4
2024	5	0	0	0	363825	1389685	905768	1162871	1182818	1394049	1386563	2281176	1658002	1395500	0	0	0	2017-10-12 19:12:44.700024	2017-10-12 19:12:44.700024	2015-10-30	1	44	10	2015	5
2025	5	0	254067	903348	1067081	3329786	1123716	1729762	611457	748161	1486562	882402	0	0	0	0	0	2017-10-12 19:12:44.708601	2017-10-12 19:12:44.708601	2015-10-31	1	44	10	2015	6
2026	5	0	395215	767846	1351635	1478023	2072094	1939072	523129	1760440	2086069	569511	0	0	0	0	0	2017-10-12 19:12:44.717771	2017-10-12 19:12:44.717771	2015-11-01	1	44	11	2015	0
2027	5	0	395215	722678	1067081	1626396	2208678	887663	1069974	1599620	2060643	997688	0	0	0	0	0	2017-10-12 19:12:44.7274	2017-10-12 19:12:44.7274	2015-11-02	1	45	11	2015	1
2028	5	0	536363	496841	853664	1524292	3035731	716453	1201680	1456209	1098572	1014413	0	0	0	0	0	2017-10-12 19:12:44.735836	2017-10-12 19:12:44.735836	2015-11-03	1	45	11	2015	2
2029	5	0	127033	271004	640247	1436074	1654514	535910	498208	826940	894200	531549	0	0	0	0	0	2017-10-12 19:12:44.743983	2017-10-12 19:12:44.743983	2015-11-04	1	45	11	2015	3
2030	5	0	282296	361339	320124	517941	2426932	741301	348659	689586	754616	371480	0	0	0	0	0	2017-10-12 19:12:44.752329	2017-10-12 19:12:44.752329	2015-11-05	1	45	11	2015	4
2031	5	0	564593	767846	995942	2530887	3873623	1030640	554749	540628	1738289	673167	0	0	0	0	0	2017-10-12 19:12:44.761664	2017-10-12 19:12:44.761664	2015-11-06	1	45	11	2015	5
2032	5	0	536363	542009	1067081	1801640	1946242	1419904	1020002	899810	1182107	1472674	0	0	0	0	0	2017-10-12 19:12:44.771288	2017-10-12 19:12:44.771288	2015-11-07	1	45	11	2015	6
2033	5	0	536363	542009	640248	3163173	2282469	1128924	807301	1259070	1397050	1021171	0	0	0	0	0	2017-10-12 19:12:44.779353	2017-10-12 19:12:44.779353	2015-11-08	1	45	11	2015	0
2034	5	0	536363	496841	1138219	2019460	1619888	1513070	917013	1064204	1577828	1318086	0	0	0	0	0	2017-10-12 19:12:44.787195	2017-10-12 19:12:44.787195	2015-11-09	1	46	11	2015	1
2035	5	0	479904	542009	1067081	3455070	2661845	1266262	1483737	1814702	1474070	1227244	0	0	0	0	0	2017-10-12 19:12:44.795266	2017-10-12 19:12:44.795266	2015-11-10	1	46	11	2015	2
2036	5	0	155263	271004	640247	1955520	448468	685835	337087	552228	453285	384005	0	0	0	0	0	2017-10-12 19:12:44.803631	2017-10-12 19:12:44.803631	2015-11-11	1	46	11	2015	3
1357	1	0	0	0	286650	715892	771028	652410	598470	1838862	1877948	1198140	1891724	786561	0	0	0	2017-10-11 15:09:42.377464	2017-10-11 15:09:42.377464	2015-01-01	1	1	1	2015	4
1358	1	0	0	0	418950	577021	1027642	1262962	1011784	1172515	1708006	2147288	761796	499222	0	0	0	2017-10-11 15:09:42.391472	2017-10-11 15:09:42.391472	2015-01-02	1	1	1	2015	5
1359	1	0	0	0	441000	354181	671240	730816	570386	1539627	2509875	999528	1299548	1784512	0	0	0	2017-10-11 15:09:42.405159	2017-10-11 15:09:42.405159	2015-01-03	1	1	1	2015	6
1360	1	0	0	0	308700	631866	782780	461902	389651	1693584	1298977	1190178	2907701	1823866	0	0	0	2017-10-11 15:09:42.418579	2017-10-11 15:09:42.418579	2015-01-04	1	1	1	2015	0
1361	1	0	0	0	352800	889130	471278	734580	644950	1986576	1240777	1641844	1059316	1411776	0	0	0	2017-10-11 15:09:42.432249	2017-10-11 15:09:42.432249	2015-01-05	1	2	1	2015	1
1362	1	0	0	0	749700	1144588	2456134	2339872	2050983	3523684	4110691	5000816	7022530	2586468	0	0	0	2017-10-11 15:09:42.445867	2017-10-11 15:09:42.445867	2015-01-06	1	2	1	2015	2
1363	1	0	0	0	670320	1285898	1474396	1055736	1651705	1054097	2597256	4788274	2772518	1887416	0	0	0	2017-10-11 15:09:42.457174	2017-10-11 15:09:42.457174	2015-01-07	1	2	1	2015	3
1364	1	0	0	0	286650	512870	761275	1006670	1178814	1703075	2206921	3273129	2342092	906176	0	0	0	2017-10-11 15:09:42.470019	2017-10-11 15:09:42.470019	2015-01-08	1	2	1	2015	4
1365	1	0	0	0	441000	459408	767735	500334	530531	1208795	2557143	2249583	1654831	961068	0	0	0	2017-10-11 15:09:42.480339	2017-10-11 15:09:42.480339	2015-01-09	1	2	1	2015	5
1366	1	0	0	0	286650	426605	788521	805783	1218112	1155612	949320	1327295	1531967	1761717	0	0	0	2017-10-11 15:09:42.489872	2017-10-11 15:09:42.489872	2015-01-10	1	2	1	2015	6
1367	1	0	0	0	441000	587355	1347296	908472	887666	1882777	1534381	2812637	1190325	1108494	0	0	0	2017-10-11 15:09:42.499918	2017-10-11 15:09:42.499918	2015-01-11	1	2	1	2015	0
1368	1	0	0	0	396900	547646	690880	1030418	563362	638760	1172666	1213385	1623170	1486863	0	0	0	2017-10-11 15:09:42.510074	2017-10-11 15:09:42.510074	2015-01-12	1	3	1	2015	1
1369	1	0	0	0	396900	1078869	1785019	2890074	1914144	1168527	2069084	5230729	3373083	2856875	0	0	0	2017-10-11 15:09:42.519356	2017-10-11 15:09:42.519356	2015-01-13	1	3	1	2015	2
1370	1	0	0	0	564480	680101	1203397	1378829	1710081	2378410	1917431	2686641	2894525	2415643	0	0	0	2017-10-11 15:09:42.529665	2017-10-11 15:09:42.529665	2015-01-14	1	3	1	2015	3
1371	1	0	0	0	220500	300614	1066673	619893	943912	1463353	1125886	2202526	2489018	1295537	0	0	0	2017-10-11 15:09:42.539424	2017-10-11 15:09:42.539424	2015-01-15	1	3	1	2015	4
1372	1	0	0	0	286650	772380	681811	875340	877794	995036	2303084	1238561	1100648	1324580	0	0	0	2017-10-11 15:09:42.550216	2017-10-11 15:09:42.550216	2015-01-16	1	3	1	2015	5
1373	1	0	0	0	418950	438606	1507604	1333231	509134	1203572	2335941	1466554	1076070	860059	0	0	0	2017-10-11 15:09:42.55926	2017-10-11 15:09:42.55926	2015-01-17	1	3	1	2015	6
1374	1	0	0	0	264600	643222	471335	789795	1054064	610167	2280800	3122060	1362629	972270	0	0	0	2017-10-11 15:09:42.568597	2017-10-11 15:09:42.568597	2015-01-18	1	3	1	2015	0
1375	1	0	0	0	242550	1062116	964983	742195	567454	775655	2353986	2181609	1044117	1037720	0	0	0	2017-10-11 15:09:42.579578	2017-10-11 15:09:42.579578	2015-01-19	1	4	1	2015	1
1376	1	0	0	0	705600	2146981	1583747	1131835	1397277	1705174	3878288	2954239	4310444	2122793	0	0	0	2017-10-11 15:09:42.589511	2017-10-11 15:09:42.589511	2015-01-20	1	4	1	2015	2
1377	1	0	0	0	352800	651903	926203	1605704	1742061	1707639	4117193	2315866	3912154	2289030	0	0	0	2017-10-11 15:09:42.602388	2017-10-11 15:09:42.602388	2015-01-21	1	4	1	2015	3
1378	1	0	0	0	286650	670928	474689	1392231	752309	1514766	1731480	992552	2538153	1951444	0	0	0	2017-10-11 15:09:42.618712	2017-10-11 15:09:42.618712	2015-01-22	1	4	1	2015	4
1379	1	0	0	0	308700	975403	1138308	680069	1361876	1220138	1322586	2530324	1329012	734779	0	0	0	2017-10-11 15:09:42.634458	2017-10-11 15:09:42.634458	2015-01-23	1	4	1	2015	5
1380	1	0	0	0	418950	868470	1167970	651069	761116	1541000	1180120	1650939	2613326	1337946	0	0	0	2017-10-11 15:09:42.646337	2017-10-11 15:09:42.646337	2015-01-24	1	4	1	2015	6
1381	1	0	0	0	330750	1101829	733658	519435	704102	1331037	2627293	1685760	1534374	1657434	0	0	0	2017-10-11 15:09:42.65762	2017-10-11 15:09:42.65762	2015-01-25	1	4	1	2015	0
1382	1	0	0	0	352800	733876	714872	925781	338928	1689139	1236119	2654331	1402170	1216138	0	0	0	2017-10-11 15:09:42.669673	2017-10-11 15:09:42.669673	2015-01-26	1	5	1	2015	1
1383	1	0	0	0	661500	1382442	1875208	2244364	1408222	3573306	4981886	6137557	4237204	1979840	0	0	0	2017-10-11 15:09:42.683352	2017-10-11 15:09:42.683352	2015-01-27	1	5	1	2015	2
1384	1	0	0	0	352800	1142228	1684992	2508217	1236028	3248724	3697444	1854550	4183688	1186525	0	0	0	2017-10-11 15:09:42.697781	2017-10-11 15:09:42.697781	2015-01-28	1	5	1	2015	3
1385	1	0	0	0	396900	1381272	1137207	599899	1415361	2235626	2585911	5468550	3435370	2898050	0	0	0	2017-10-11 15:09:42.712473	2017-10-11 15:09:42.712473	2015-01-29	1	5	1	2015	4
1386	1	0	0	0	396900	944167	1494582	810976	627870	2053382	2548837	2375712	1782954	1439799	0	0	0	2017-10-11 15:09:42.725182	2017-10-11 15:09:42.725182	2015-01-30	1	5	1	2015	5
1387	1	0	0	0	396900	495708	1125431	670283	995485	1730958	2899908	2704432	1880142	1521066	0	0	0	2017-10-11 15:09:42.737358	2017-10-11 15:09:42.737358	2015-01-31	1	5	1	2015	6
1388	1	0	0	0	330750	862334	1096251	781877	1375360	1473803	3373554	3028236	2233987	1541632	0	0	0	2017-10-11 15:09:42.747755	2017-10-11 15:09:42.747755	2015-02-01	1	5	2	2015	0
1389	1	0	0	0	463050	611820	535260	1489664	2064244	1658374	3133059	2124225	2431155	1040821	0	0	0	2017-10-11 15:09:42.759047	2017-10-11 15:09:42.759047	2015-02-02	1	6	2	2015	1
1390	1	0	0	0	396900	1236114	659651	1051529	1377906	1309797	3368186	2789717	2285871	1833928	0	0	0	2017-10-11 15:09:42.768932	2017-10-11 15:09:42.768932	2015-02-03	1	6	2	2015	2
1391	1	0	0	0	595350	1550491	1177434	1671029	557567	1223736	4140267	2899748	2823126	2486986	0	0	0	2017-10-11 15:09:42.780468	2017-10-11 15:09:42.780468	2015-02-04	1	6	2	2015	3
1392	1	0	0	0	1323000	1310016	1341237	1781584	2123774	2872429	6811623	8774315	6442047	2466235	0	0	0	2017-10-11 15:09:42.793072	2017-10-11 15:09:42.793072	2015-02-05	1	6	2	2015	4
1393	1	0	0	0	582120	1106828	1487214	1850539	2600816	2546168	4866661	5960917	4222014	2240060	0	0	0	2017-10-11 15:09:42.806449	2017-10-11 15:09:42.806449	2015-02-06	1	6	2	2015	5
1394	1	0	0	0	330750	977567	769928	520888	954616	1451163	1886445	4097808	3357844	1217921	0	0	0	2017-10-11 15:09:42.820631	2017-10-11 15:09:42.820631	2015-02-07	1	6	2	2015	6
1395	1	0	0	0	330750	1313502	577558	943723	697134	1518589	1872599	2753345	3044595	1470001	0	0	0	2017-10-11 15:09:42.832646	2017-10-11 15:09:42.832646	2015-02-08	1	6	2	2015	0
1396	1	0	0	0	363825	1146306	1385206	1832474	640397	1876524	1930855	2613060	1588996	2024950	0	0	0	2017-10-11 15:09:42.843799	2017-10-11 15:09:42.843799	2015-02-09	1	7	2	2015	1
1397	1	0	0	0	330750	586271	739942	777115	1761292	1200803	2571730	3115495	2362879	1962200	0	0	0	2017-10-11 15:09:42.857164	2017-10-11 15:09:42.857164	2015-02-10	1	7	2	2015	2
1398	1	0	0	0	595350	867498	1033441	1982948	1211960	3356344	2899190	3495616	2962218	2727036	0	0	0	2017-10-11 15:09:42.869477	2017-10-11 15:09:42.869477	2015-02-11	1	7	2	2015	3
1399	1	0	0	0	661500	2532668	2431424	1688234	2343371	3409179	5901562	5021381	4649363	3957521	0	0	0	2017-10-11 15:09:42.880634	2017-10-11 15:09:42.880634	2015-02-12	1	7	2	2015	4
1400	1	0	0	0	740880	2102317	1516031	2699195	3048297	2485563	6583812	4228436	5440818	1865504	0	0	0	2017-10-11 15:09:42.896317	2017-10-11 15:09:42.896317	2015-02-13	1	7	2	2015	5
1401	1	0	0	0	529200	481554	727529	1668399	1044067	1113525	2832771	1766299	2371813	801195	0	0	0	2017-10-11 15:09:42.908664	2017-10-11 15:09:42.908664	2015-02-14	1	7	2	2015	6
1402	1	0	0	0	661500	1705471	946901	745380	1213472	2321678	2484387	3551728	2473959	2355054	0	0	0	2017-10-11 15:09:42.917951	2017-10-11 15:09:42.917951	2015-02-15	1	7	2	2015	0
1403	1	0	0	0	396900	744481	1621304	1880900	1101708	2313686	2268072	2000653	3818326	1828003	0	0	0	2017-10-11 15:09:42.926705	2017-10-11 15:09:42.926705	2015-02-16	1	8	2	2015	1
1404	1	0	0	0	396900	1046306	1358978	1088790	1101272	1726106	1277309	3123490	4611148	1971119	0	0	0	2017-10-11 15:09:42.943651	2017-10-11 15:09:42.943651	2015-02-17	1	8	2	2015	2
1405	1	0	0	0	529200	544279	880544	1575200	1335489	2731208	4466111	2686135	3153332	3210103	0	0	0	2017-10-11 15:09:42.953313	2017-10-11 15:09:42.953313	2015-02-18	1	8	2	2015	3
1406	1	0	0	0	793800	1530074	2133673	3111797	1317173	5277872	5964877	7359092	5168465	3980330	0	0	0	2017-10-11 15:09:42.963012	2017-10-11 15:09:42.963012	2015-02-19	1	8	2	2015	4
1407	1	0	0	0	476280	1156906	3219572	2344376	2702684	2507392	2084776	8587827	6787462	1849677	0	0	0	2017-10-11 15:09:42.973827	2017-10-11 15:09:42.973827	2015-02-20	1	8	2	2015	5
1408	1	0	0	0	496125	966461	1107829	2049954	1393045	1870140	3387464	1642196	1706222	886317	0	0	0	2017-10-11 15:09:42.983248	2017-10-11 15:09:42.983248	2015-02-21	1	8	2	2015	6
1409	1	0	0	0	463050	1460912	739582	1640163	1825524	2530920	2167138	4942179	1484897	1323411	0	0	0	2017-10-11 15:09:42.992504	2017-10-11 15:09:42.992504	2015-02-22	1	8	2	2015	0
1410	1	0	0	0	396900	1801820	1891121	2068530	807845	2110417	2165454	4236187	2432846	1387081	0	0	0	2017-10-11 15:09:43.004297	2017-10-11 15:09:43.004297	2015-02-23	1	9	2	2015	1
1411	1	0	0	0	496125	835803	1595242	811086	1512357	1629218	1921678	3114936	2085883	2335673	0	0	0	2017-10-11 15:09:43.015294	2017-10-11 15:09:43.015294	2015-02-24	1	9	2	2015	2
1412	1	0	0	0	496125	1576363	1807789	646766	819622	2122474	1538319	2541852	4680504	2722597	0	0	0	2017-10-11 15:09:43.0236	2017-10-11 15:09:43.0236	2015-02-25	1	9	2	2015	3
1413	1	0	0	0	1190700	1356788	2219020	1652079	1549643	2149365	5087910	6562535	8099155	4070078	0	0	0	2017-10-11 15:09:43.031666	2017-10-11 15:09:43.031666	2015-02-26	1	9	2	2015	4
1414	1	0	0	0	582120	1034499	1236105	3273767	1866358	3072734	6920992	9031232	7929789	3032498	0	0	0	2017-10-11 15:09:43.040408	2017-10-11 15:09:43.040408	2015-02-27	1	9	2	2015	5
1415	1	0	0	0	330750	956416	1141526	1280069	1255969	2210249	3218080	2573037	1901046	2315040	0	0	0	2017-10-11 15:09:43.050617	2017-10-11 15:09:43.050617	2015-02-28	1	9	2	2015	6
1416	1	0	0	0	628425	502779	1919637	1814186	609973	1485524	2059947	2041924	1943155	1107590	0	0	0	2017-10-11 15:09:43.060829	2017-10-11 15:09:43.060829	2015-03-01	1	9	3	2015	0
1417	1	0	0	0	529200	1544094	603845	1259777	591409	1394049	2619063	3525453	2040618	1046625	0	0	0	2017-10-11 15:09:43.070211	2017-10-11 15:09:43.070211	2015-03-02	1	10	3	2015	1
1418	1	0	310526	677511	640248	3329786	1236088	972991	393080	673345	1592745	1323603	0	0	0	0	0	2017-10-11 15:09:43.079169	2017-10-11 15:09:43.079169	2015-03-03	1	10	3	2015	2
1419	1	0	366985	406507	924803	2217035	3013955	1077262	784694	2200550	2317854	740364	0	0	0	0	0	2017-10-11 15:09:43.088448	2017-10-11 15:09:43.088448	2015-03-04	1	10	3	2015	3
1420	1	0	254067	722678	782526	1112797	1807100	1479438	481488	1787811	2447014	864663	0	0	0	0	0	2017-10-11 15:09:43.098101	2017-10-11 15:09:43.098101	2015-03-05	1	10	3	2015	4
1421	1	0	282296	451674	1209358	1295648	3541686	1432906	1068160	873725	1830953	1106633	0	0	0	0	0	2017-10-11 15:09:43.107002	2017-10-11 15:09:43.107002	2015-03-06	1	10	3	2015	5
1422	1	0	169378	361339	355693	933448	744531	401933	711726	826940	993556	413427	0	0	0	0	0	2017-10-11 15:09:43.118998	2017-10-11 15:09:43.118998	2015-03-07	1	10	3	2015	6
1423	1	0	127033	383923	640247	480945	1820199	794252	348659	517189	804923	285754	0	0	0	0	0	2017-10-11 15:09:43.132409	2017-10-11 15:09:43.132409	2015-03-08	1	10	3	2015	0
1424	1	0	479904	767846	995942	3309621	4131864	970014	554749	780907	1489962	550773	0	0	0	0	0	2017-10-11 15:09:43.141583	2017-10-11 15:09:43.141583	2015-03-09	1	11	3	2015	1
1425	1	0	395215	542009	924803	1801640	3308611	912795	600001	736208	2246003	1748800	0	0	0	0	0	2017-10-11 15:09:43.151316	2017-10-11 15:09:43.151316	2015-03-10	1	11	3	2015	2
1426	1	0	536363	632344	995942	1831311	1580171	1599309	424895	1602453	739615	1276464	0	0	0	0	0	2017-10-11 15:09:43.160685	2017-10-11 15:09:43.160685	2015-03-11	1	11	3	2015	3
1427	1	0	508133	632344	1280497	1234114	2915798	1246057	589508	1206097	1699200	1186277	0	0	0	0	0	2017-10-11 15:09:43.169651	2017-10-11 15:09:43.169651	2015-03-12	1	11	3	2015	4
1428	1	0	254067	587176	782526	2073042	2252330	1489720	1561828	1723967	1387360	613622	0	0	0	0	0	2017-10-11 15:09:43.178192	2017-10-11 15:09:43.178192	2015-03-13	1	11	3	2015	5
1429	1	0	197607	225837	533540	977760	946766	685835	612886	699489	604380	352004	0	0	0	0	0	2017-10-11 15:09:43.18715	2017-10-11 15:09:43.18715	2015-03-14	1	11	3	2015	6
1430	1	0	211722	248421	391262	907952	1313500	376724	290226	586964	817919	314750	0	0	0	0	0	2017-10-11 15:09:43.195747	2017-10-11 15:09:43.195747	2015-03-15	1	11	3	2015	0
1431	1	0	310526	587176	853664	3905061	1403398	970867	400428	1390570	2577064	702538	0	0	0	0	0	2017-10-11 15:09:43.204391	2017-10-11 15:09:43.204391	2015-03-16	1	12	3	2015	1
1432	1	0	451674	903348	924803	3782970	2667665	1296493	613652	1072036	1404389	793782	0	0	0	0	0	2017-10-11 15:09:43.219553	2017-10-11 15:09:43.219553	2015-03-17	1	12	3	2015	2
1433	1	0	564593	496841	1280497	769254	3309806	1226859	949630	1025150	1609824	1313630	0	0	0	0	0	2017-10-11 15:09:43.229336	2017-10-11 15:09:43.229336	2015-03-18	1	12	3	2015	3
1434	1	0	423444	767846	1280497	1329995	969138	1404082	1323902	1959311	1627126	1245087	0	0	0	0	0	2017-10-11 15:09:43.238132	2017-10-11 15:09:43.238132	2015-03-19	1	12	3	2015	4
1435	1	0	254067	767846	640248	3410066	2615835	1126190	553962	1514657	1174811	682619	0	0	0	0	0	2017-10-11 15:09:43.247368	2017-10-11 15:09:43.247368	2015-03-20	1	12	3	2015	5
1436	1	0	141148	361339	391262	1434855	2600768	536015	428023	410446	783368	297198	0	0	0	0	0	2017-10-11 15:09:43.255641	2017-10-11 15:09:43.255641	2015-03-21	1	12	3	2015	6
1437	1	0	239952	225837	640247	1034111	997097	512868	646929	993992	825166	560648	0	0	0	0	0	2017-10-11 15:09:43.264224	2017-10-11 15:09:43.264224	2015-03-22	1	12	3	2015	0
1438	1	0	338756	451674	1351635	2117690	4745079	1512084	537146	1165557	868131	693767	0	0	0	0	0	2017-10-11 15:09:43.27275	2017-10-11 15:09:43.27275	2015-03-23	1	13	3	2015	1
1439	1	0	282296	542009	995942	832818	891982	1913694	1029870	1039252	1470130	1063550	0	0	0	0	0	2017-10-11 15:09:43.281141	2017-10-11 15:09:43.281141	2015-03-24	1	13	3	2015	2
1440	1	0	282296	451674	640248	1550413	3867585	1342861	984899	1933291	2550192	819179	0	0	0	0	0	2017-10-11 15:09:43.289694	2017-10-11 15:09:43.289694	2015-03-25	1	13	3	2015	3
1441	1	0	423444	587176	1422774	2884890	1722851	1116282	776311	1033105	1739957	1266539	0	0	0	0	0	2017-10-11 15:09:43.297753	2017-10-11 15:09:43.297753	2015-03-26	1	13	3	2015	4
1442	1	0	310526	542009	711387	2223033	3769876	1099139	1070764	755937	2173749	938708	0	0	0	0	0	2017-10-11 15:09:43.305817	2017-10-11 15:09:43.305817	2015-03-27	1	13	3	2015	5
1443	1	0	282296	225837	426832	1033078	846642	867653	672123	627390	857140	380096	0	0	0	0	0	2017-10-11 15:09:43.315294	2017-10-11 15:09:43.315294	2015-03-28	1	13	3	2015	6
1444	1	0	127033	383923	391262	965629	967399	772975	460164	595777	423198	400213	0	0	0	0	0	2017-10-11 15:09:43.323667	2017-10-11 15:09:43.323667	2015-03-29	1	13	3	2015	0
1445	1	0	451674	451674	1280497	2532757	3239046	1110138	750054	841193	1755546	883920	0	0	0	0	0	2017-10-11 15:09:43.331617	2017-10-11 15:09:43.331617	2015-03-30	1	14	3	2015	1
1446	1	0	338756	677511	1280497	1018803	5046759	633423	933806	745979	1241461	912530	0	0	0	0	0	2017-10-11 15:09:43.339501	2017-10-11 15:09:43.339501	2015-03-31	1	14	3	2015	2
1447	1	0	536363	406507	640248	3176435	2728038	940553	617175	1741706	1268970	583428	0	0	0	0	0	2017-10-11 15:09:43.347777	2017-10-11 15:09:43.347777	2015-04-01	1	14	4	2015	3
1448	1	0	804544	813013	1707328	3083637	6737464	1294422	913159	2493099	3577582	864989	0	0	0	0	0	2017-10-11 15:09:43.356662	2017-10-11 15:09:43.356662	2015-04-02	1	14	4	2015	4
1449	1	0	846889	1151769	1493912	1098932	6667063	1165041	834986	1809696	3758692	1879734	0	0	0	0	0	2017-10-11 15:09:43.364806	2017-10-11 15:09:43.364806	2015-04-03	1	14	4	2015	5
1450	1	0	592822	948515	2027452	3670377	3838460	2358762	2079619	2318220	1901977	1613166	0	0	0	0	0	2017-10-11 15:09:43.373243	2017-10-11 15:09:43.373243	2015-04-04	1	14	4	2015	6
1451	1	0	592822	677511	2027452	2521919	5546518	1687988	1627262	1753231	1156924	2076640	0	0	0	0	0	2017-10-11 15:09:43.381253	2017-10-11 15:09:43.381253	2015-04-05	1	14	4	2015	0
1452	1	0	402272	304880	640248	859083	3059202	1171688	789072	1705708	825496	458978	0	0	0	0	0	2017-10-11 15:09:43.388997	2017-10-11 15:09:43.388997	2015-04-06	1	15	4	2015	1
1453	1	0	402272	440382	853664	2048433	1367912	540351	437294	1213622	930921	387918	0	0	0	0	0	2017-10-11 15:09:43.39708	2017-10-11 15:09:43.39708	2015-04-07	1	15	4	2015	2
1454	1	0	635167	1219520	1600620	2748571	3364629	1196911	2002202	2618901	2506254	1325043	0	0	0	0	0	2017-10-11 15:09:43.405802	2017-10-11 15:09:43.405802	2015-04-08	1	15	4	2015	3
1455	1	0	762200	948515	960372	5543705	6965050	1181462	1080734	1650058	1148308	1594692	0	0	0	0	0	2017-10-11 15:09:43.414146	2017-10-11 15:09:43.414146	2015-04-09	1	15	4	2015	4
1456	1	0	423444	1016267	1067080	3169180	5227382	2113727	1637302	1904140	3302042	1056503	0	0	0	0	0	2017-10-11 15:09:43.422901	2017-10-11 15:09:43.422901	2015-04-10	1	15	4	2015	5
1457	1	0	465789	1084018	1814036	2714379	3824333	1486147	1069355	2357788	2069469	1086809	0	0	0	0	0	2017-10-11 15:09:43.431079	2017-10-11 15:09:43.431079	2015-04-11	1	15	4	2015	6
1458	1	0	719855	1355022	1920744	2292560	1872650	1161093	1136628	2444636	1733356	1413430	0	0	0	0	0	2017-10-11 15:09:43.438811	2017-10-11 15:09:43.438811	2015-04-12	1	15	4	2015	0
1459	1	0	402272	406507	800310	716019	3167120	873115	779722	1081811	385070	940218	0	0	0	0	0	2017-10-11 15:09:43.446968	2017-10-11 15:09:43.446968	2015-04-13	1	16	4	2015	1
1460	1	0	423444	575884	1013726	816156	1889368	760243	434126	1389191	1005298	708218	0	0	0	0	0	2017-10-11 15:09:43.455586	2017-10-11 15:09:43.455586	2015-04-14	1	16	4	2015	2
1461	1	0	635167	1287271	1493912	1946246	5717438	1219981	1346903	3248460	1946184	1439098	0	0	0	0	0	2017-10-11 15:09:43.465166	2017-10-11 15:09:43.465166	2015-04-15	1	16	4	2015	3
1462	1	0	846889	745262	1280496	3071488	3071493	3152497	1492654	1834697	2454598	1436283	0	0	0	0	0	2017-10-11 15:09:43.473065	2017-10-11 15:09:43.473065	2015-04-16	1	16	4	2015	4
1463	1	0	719855	1355022	1173788	3133759	1916892	3094122	749869	1720446	4169954	1343574	0	0	0	0	0	2017-10-11 15:09:43.481493	2017-10-11 15:09:43.481493	2015-04-17	1	16	4	2015	5
1464	1	0	677511	880764	1280496	2040746	5735288	1789657	629767	1828035	2472512	1116537	0	0	0	0	0	2017-10-11 15:09:43.49046	2017-10-11 15:09:43.49046	2015-04-18	1	16	4	2015	6
1465	1	0	635167	1219520	1814036	5086993	6031923	1585598	1832830	2145648	2091244	1120890	0	0	0	0	0	2017-10-11 15:09:43.512664	2017-10-11 15:09:43.512664	2015-04-19	1	16	4	2015	0
1466	1	0	275239	474258	640248	1796558	1280287	1318754	391847	870303	747007	731586	0	0	0	0	0	2017-10-11 15:09:43.521189	2017-10-11 15:09:43.521189	2015-04-20	1	17	4	2015	1
1467	1	0	359928	677511	640248	1248852	2805779	827537	502636	812183	646786	844527	0	0	0	0	0	2017-10-11 15:09:43.529451	2017-10-11 15:09:43.529451	2015-04-21	1	17	4	2015	2
1468	1	0	465789	609760	1920744	4353862	6807419	2566362	1381697	2942743	2810650	2358600	0	0	0	0	0	2017-10-11 15:09:43.53738	2017-10-11 15:09:43.53738	2015-04-22	1	17	4	2015	3
1469	1	0	465789	677511	1707328	1983798	2366512	1934345	1706765	1460708	2102432	1668192	0	0	0	0	0	2017-10-11 15:09:43.545789	2017-10-11 15:09:43.545789	2015-04-23	1	17	4	2015	4
1470	1	0	381100	1016267	1493912	4967543	2480569	2211436	2071028	2301790	1792536	986301	0	0	0	0	0	2017-10-11 15:09:43.554184	2017-10-11 15:09:43.554184	2015-04-24	1	17	4	2015	5
1471	1	0	762200	1084018	1067080	2721015	4466119	1642621	1194598	3066794	1240338	1503311	0	0	0	0	0	2017-10-11 15:09:43.562365	2017-10-11 15:09:43.562365	2015-04-25	1	17	4	2015	6
1472	1	0	804544	1151769	960372	2214867	4481568	1899247	1255580	1207387	2536796	1458354	0	0	0	0	0	2017-10-11 15:09:43.570926	2017-10-11 15:09:43.570926	2015-04-26	1	17	4	2015	0
1473	1	0	190550	677511	1067080	2153211	2616481	875972	958550	467738	996836	414641	0	0	0	0	0	2017-10-11 15:09:43.579648	2017-10-11 15:09:43.579648	2015-04-27	1	18	4	2015	1
1474	1	0	232894	338756	586894	1687444	2782899	1286192	938672	1312966	698815	317021	0	0	0	0	0	2017-10-11 15:09:43.588875	2017-10-11 15:09:43.588875	2015-04-28	1	18	4	2015	2
1475	1	0	677511	609760	1707328	4814878	2466584	2032504	1168263	1896671	2296151	863119	0	0	0	0	0	2017-10-11 15:09:43.597575	2017-10-11 15:09:43.597575	2015-04-29	1	18	4	2015	3
1476	1	0	592822	745262	1280496	2494838	1966819	1920832	872997	1676085	1285778	996489	0	0	0	0	0	2017-10-11 15:09:43.605977	2017-10-11 15:09:43.605977	2015-04-30	1	18	4	2015	4
1477	1	0	508133	1287271	960372	3382415	4708542	1894223	1379062	2356192	1341718	1322632	0	0	0	0	0	2017-10-11 15:09:43.614306	2017-10-11 15:09:43.614306	2015-05-01	1	18	5	2015	5
1478	1	0	0	0	242550	715892	495661	711720	548598	1011374	1314564	980296	1765609	605047	0	0	0	2017-10-11 15:09:43.622509	2017-10-11 15:09:43.622509	2015-05-02	1	18	5	2015	6
1479	1	0	0	0	330750	509136	1106692	1262962	798777	1025951	1708006	2147288	1692880	721098	0	0	0	2017-10-11 15:09:43.631009	2017-10-11 15:09:43.631009	2015-05-03	1	18	5	2015	0
1480	1	0	0	0	308700	381426	710725	657734	712983	810330	1394375	2221174	1689412	1574570	0	0	0	2017-10-11 15:09:43.639771	2017-10-11 15:09:43.639771	2015-05-04	1	19	5	2015	1
1481	1	0	0	0	396900	473899	996265	877614	606124	1439546	1731970	1731168	2295554	1013259	0	0	0	2017-10-11 15:09:43.648552	2017-10-11 15:09:43.648552	2015-05-05	1	19	5	2015	2
1482	1	0	0	0	374850	577935	408441	472230	967424	1489932	1908888	1231383	1412421	941184	0	0	0	2017-10-11 15:09:43.657218	2017-10-11 15:09:43.657218	2015-05-06	1	19	5	2015	3
1483	1	0	0	0	529200	572294	1364519	1286930	1481266	2740643	3523450	3000490	3160139	1369307	0	0	0	2017-10-11 15:09:43.675189	2017-10-11 15:09:43.675189	2015-05-07	1	19	5	2015	4
1484	1	0	0	0	564480	857265	1895652	2111472	1887662	1791965	1669665	3291938	4004748	2402166	0	0	0	2017-10-11 15:09:43.684711	2017-10-11 15:09:43.684711	2015-05-08	1	19	5	2015	5
1485	1	0	0	0	286650	598349	1141913	559261	1060933	1075626	1961707	1732833	2342092	1235694	0	0	0	2017-10-11 15:09:43.694239	2017-10-11 15:09:43.694239	2015-05-09	1	19	5	2015	6
1486	1	0	0	0	418950	765680	1450166	654282	734582	1813192	1278572	1499722	2009437	1304306	0	0	0	2017-10-11 15:09:43.702677	2017-10-11 15:09:43.702677	2015-05-10	1	19	5	2015	0
1487	1	0	0	0	352800	246982	581015	1391807	1096301	924490	1613844	1447958	1622083	1347195	0	0	0	2017-10-11 15:09:43.710765	2017-10-11 15:09:43.710765	2015-05-11	1	20	5	2015	1
1488	1	0	0	0	374850	377585	992744	545083	798899	990935	2045842	1757898	872905	942220	0	0	0	2017-10-11 15:09:43.719368	2017-10-11 15:09:43.719368	2015-05-12	1	20	5	2015	2
1489	1	0	0	0	441000	308051	729262	1398425	845043	993626	1993532	1544308	1050287	1049550	0	0	0	2017-10-11 15:09:43.728401	2017-10-11 15:09:43.728401	2015-05-13	1	20	5	2015	3
1490	1	0	0	0	396900	738174	1785019	2023052	1712655	2596726	3448473	3578920	4122657	3333021	0	0	0	2017-10-11 15:09:43.737633	2017-10-11 15:09:43.737633	2015-05-14	1	20	5	2015	4
1491	1	0	0	0	317520	536922	633367	1953341	1005930	2021649	2769623	3582188	3183978	1725459	0	0	0	2017-10-11 15:09:43.745939	2017-10-11 15:09:43.745939	2015-05-15	1	20	5	2015	5
1492	1	0	0	0	418950	567826	561407	464920	809068	1056866	1914006	2477842	1120058	791717	0	0	0	2017-10-11 15:09:43.754218	2017-10-11 15:09:43.754218	2015-05-16	1	20	5	2015	6
1493	1	0	0	0	418950	365864	786705	729450	877794	877973	2303084	1032134	1608639	1222690	0	0	0	2017-10-11 15:09:43.762624	2017-10-11 15:09:43.762624	2015-05-17	1	20	5	2015	0
1494	1	0	0	0	374850	475157	1190214	814752	727334	1375510	1605959	1466554	1673886	1118077	0	0	0	2017-10-11 15:09:43.77137	2017-10-11 15:09:43.77137	2015-05-18	1	21	5	2015	1
1495	1	0	0	0	396900	546739	314223	888520	922306	549150	1267111	2081374	2180206	1026285	0	0	0	2017-10-11 15:09:43.780602	2017-10-11 15:09:43.780602	2015-05-19	1	21	5	2015	2
1496	1	0	0	0	352800	477952	863406	1051443	794436	634627	1176993	2181609	1803474	1197369	0	0	0	2017-10-11 15:09:43.789692	2017-10-11 15:09:43.789692	2015-05-20	1	21	5	2015	3
1497	1	0	0	0	529200	1355988	1470622	1320474	2095916	3599812	3296545	4923732	2873629	3473662	0	0	0	2017-10-11 15:09:43.798223	2017-10-11 15:09:43.798223	2015-05-21	1	21	5	2015	4
1498	1	0	0	0	705600	592639	544825	963422	1509786	1097768	3234937	2315866	3611219	1573708	0	0	0	2017-10-11 15:09:43.80677	2017-10-11 15:09:43.80677	2015-05-22	1	21	5	2015	5
1499	1	0	0	0	264600	447285	443043	1465506	752309	1355317	2193208	1985103	2137392	1951444	0	0	0	2017-10-11 15:09:43.815381	2017-10-11 15:09:43.815381	2015-05-23	1	21	5	2015	6
1500	1	0	0	0	242550	770055	870471	528942	680938	844711	1190327	2711061	2044634	667981	0	0	0	2017-10-11 15:09:43.824625	2017-10-11 15:09:43.824625	2015-05-24	1	21	5	2015	0
1501	1	0	0	0	352800	651353	973308	976604	1170948	1463950	2360240	1754123	2322957	1911352	0	0	0	2017-10-11 15:09:43.833642	2017-10-11 15:09:43.833642	2015-05-25	1	22	5	2015	1
1502	1	0	0	0	330750	918191	917072	750295	1056154	1120874	2919214	2287817	1673862	1949922	0	0	0	2017-10-11 15:09:43.841886	2017-10-11 15:09:43.841886	2015-05-26	1	22	5	2015	2
1503	1	0	0	0	330750	733876	397151	633429	414246	1291694	1785506	2820227	2383689	1216138	0	0	0	2017-10-11 15:09:43.849965	2017-10-11 15:09:43.849965	2015-05-27	1	22	5	2015	3
1504	1	0	0	0	882000	760343	843844	2640428	1056167	1607988	2740037	4773656	6548407	1847850	0	0	0	2017-10-11 15:09:43.858213	2017-10-11 15:09:43.858213	2015-05-28	1	22	5	2015	4
1505	1	0	0	0	388080	1078771	1838173	2244194	1573127	2111671	2773083	3503039	2789125	1661135	0	0	0	2017-10-11 15:09:43.8669	2017-10-11 15:09:43.8669	2015-05-29	1	22	5	2015	5
1506	1	0	0	0	396900	1174081	682324	799865	1191883	1117813	2188078	5468550	3053662	2463343	0	0	0	2017-10-11 15:09:43.875703	2017-10-11 15:09:43.875703	2015-05-30	1	22	5	2015	6
1507	1	0	0	0	496125	741846	1245485	1474502	816231	2167459	2698769	2715099	3367802	1772061	0	0	0	2017-10-11 15:09:43.884533	2017-10-11 15:09:43.884533	2015-05-31	1	22	5	2015	0
1508	1	0	0	0	363825	743562	662018	1489518	995485	1384766	1449954	3380540	2221986	1115448	0	0	0	2017-10-11 15:09:43.892905	2017-10-11 15:09:43.892905	2015-06-01	1	23	6	2015	1
1509	1	0	0	0	661500	1024022	1153948	955627	1768320	1080789	4216942	4037648	3046346	1455985	0	0	0	2017-10-11 15:09:43.901427	2017-10-11 15:09:43.901427	2015-06-02	1	23	6	2015	2
1510	1	0	0	0	595350	734184	924540	1064046	1548183	1658374	2741427	4012425	2735050	1040821	0	0	0	2017-10-11 15:09:43.91017	2017-10-11 15:09:43.91017	2015-06-03	1	23	6	2015	3
1511	1	0	0	0	529200	824076	1392597	525765	826744	1833716	3368186	4184576	3340888	1490067	0	0	0	2017-10-11 15:09:43.919983	2017-10-11 15:09:43.919983	2015-06-04	1	23	6	2015	4
1512	1	0	0	0	628425	1938114	831130	1225421	1177086	1767619	3881501	1535161	2352605	1934323	0	0	0	2017-10-11 15:09:43.928911	2017-10-11 15:09:43.928911	2015-06-05	1	23	6	2015	5
1513	1	0	0	0	859950	1103171	2316681	2915320	2548529	3111798	6811623	8225921	4407716	2086814	0	0	0	2017-10-11 15:09:43.937489	2017-10-11 15:09:43.937489	2015-06-06	1	23	6	2015	6
1514	1	0	0	0	1058400	1992290	1216812	3084231	3251020	1347971	2737497	5960917	6567578	3484537	0	0	0	2017-10-11 15:09:43.946169	2017-10-11 15:09:43.946169	2015-06-07	1	23	6	2015	0
1515	1	0	0	0	595350	907741	769928	1157528	1214966	1179070	1886445	4866147	2798204	1894543	0	0	0	2017-10-11 15:09:43.954867	2017-10-11 15:09:43.954867	2015-06-08	1	24	6	2015	1
1516	1	0	0	0	562275	927178	787580	648810	1077389	1392040	1872599	3504257	1957240	1347501	0	0	0	2017-10-11 15:09:43.964323	2017-10-11 15:09:43.964323	2015-06-09	1	24	6	2015	2
1517	1	0	0	0	297675	1763548	1484150	1060906	698615	1443480	1930855	2613060	1588996	1713419	0	0	0	2017-10-11 15:09:43.972748	2017-10-11 15:09:43.972748	2015-06-10	1	24	6	2015	3
1518	1	0	0	0	429975	586271	967616	1295192	1483194	1601070	1836950	4814856	2194102	2077623	0	0	0	2017-10-11 15:09:43.981386	2017-10-11 15:09:43.981386	2015-06-11	1	24	6	2015	4
1519	1	0	0	0	529200	636165	1377922	2087314	1305188	3532994	2372064	2840188	3517633	2439979	0	0	0	2017-10-11 15:09:43.989527	2017-10-11 15:09:43.989527	2015-06-12	1	24	6	2015	5
1520	1	0	0	0	1058400	2266071	4052373	3188886	1822622	2130737	8360546	6695174	4649363	4317295	0	0	0	2017-10-11 15:09:43.997791	2017-10-11 15:09:43.997791	2015-06-13	1	24	6	2015	6
1521	1	0	0	0	582120	1952152	1852927	2699195	1613804	1708825	4937859	7987045	6045353	2072782	0	0	0	2017-10-11 15:09:44.005878	2017-10-11 15:09:44.005878	2015-06-14	1	24	6	2015	0
1522	1	0	0	0	330750	674176	1616730	1079552	1983727	1113525	2301627	1766299	1581209	1335326	0	0	0	2017-10-11 15:09:44.015029	2017-10-11 15:09:44.015029	2015-06-15	1	25	6	2015	1
1523	1	0	0	0	562275	1231729	946901	993840	1142091	2756993	1774562	2367818	2854568	1530785	0	0	0	2017-10-11 15:09:44.023144	2017-10-11 15:09:44.023144	2015-06-16	1	25	6	2015	2
1524	1	0	0	0	562275	613102	853318	1659618	550854	1285381	1247440	2000653	2210610	1265540	0	0	0	2017-10-11 15:09:44.03107	2017-10-11 15:09:44.03107	2015-06-17	1	25	6	2015	3
1525	1	0	0	0	628425	993991	1104169	1979618	985349	1380884	1974023	2602908	4611148	2190132	0	0	0	2017-10-11 15:09:44.038979	2017-10-11 15:09:44.038979	2015-06-18	1	25	6	2015	4
1526	1	0	0	0	529200	643239	1565411	1260160	1438219	1437478	4466111	3133824	2702856	1888296	0	0	0	2017-10-11 15:09:44.047053	2017-10-11 15:09:44.047053	2015-06-19	1	25	6	2015	5
1527	1	0	0	0	859950	1683081	1129592	2420286	2487993	3958404	5047204	7359092	5537642	3714974	0	0	0	2017-10-11 15:09:44.05634	2017-10-11 15:09:44.05634	2015-06-20	1	25	6	2015	6
1528	1	0	0	0	529200	2313812	3058593	3516565	1430833	2507392	2548060	8587827	6787462	2671756	0	0	0	2017-10-11 15:09:44.064813	2017-10-11 15:09:44.064813	2015-06-21	1	25	6	2015	0
1529	1	0	0	0	396900	708738	1550961	1537466	851305	2493520	1961164	3120172	3412444	1684002	0	0	0	2017-10-11 15:09:44.072765	2017-10-11 15:09:44.072765	2015-06-22	1	26	6	2015	1
1530	1	0	0	0	429975	768901	693359	1025102	1825524	1998095	2600566	3488597	2309839	1499866	0	0	0	2017-10-11 15:09:44.080963	2017-10-11 15:09:44.080963	2015-06-23	1	26	6	2015	2
1531	1	0	0	0	429975	1261274	1791589	1654824	1256648	2482844	3464726	3059468	1946277	1920573	0	0	0	2017-10-11 15:09:44.089419	2017-10-11 15:09:44.089419	2015-06-24	1	26	6	2015	3
1532	1	0	0	0	595350	603636	1091481	1032291	1814828	1200476	1921678	3530261	1444073	1427356	0	0	0	2017-10-11 15:09:44.098418	2017-10-11 15:09:44.098418	2015-06-25	1	26	6	2015	4
1533	1	0	0	0	562275	1313636	2008654	587969	1092829	1469405	1538319	3812778	5200560	2722597	0	0	0	2017-10-11 15:09:44.107408	2017-10-11 15:09:44.107408	2015-06-26	1	26	6	2015	5
1534	1	0	0	0	793800	1973510	2017291	2386336	1549643	2149365	7207873	4812525	8605352	4696244	0	0	0	2017-10-11 15:09:44.115947	2017-10-11 15:09:44.115947	2015-06-27	1	26	6	2015	6
1535	1	0	0	0	1005480	1103466	1236105	1895339	1333113	3072734	6920992	4967178	5815179	2166070	0	0	0	2017-10-11 15:09:44.124057	2017-10-11 15:09:44.124057	2015-06-28	1	26	6	2015	0
1536	1	0	0	0	496125	1093046	1037751	768041	1794242	1395947	2271586	2270327	2036835	1218442	0	0	0	2017-10-11 15:09:44.132102	2017-10-11 15:09:44.132102	2015-06-29	1	27	6	2015	1
1537	1	0	0	0	330750	754169	2039614	1713398	609973	1609318	2996286	3403206	2137471	1353721	0	0	0	2017-10-11 15:09:44.140978	2017-10-11 15:09:44.140978	2015-06-30	1	27	6	2015	2
1538	1	0	0	0	463050	1544094	664230	1647400	768832	1095324	2156875	2488555	1402925	2209542	0	0	0	2017-10-11 15:09:44.150455	2017-10-11 15:09:44.150455	2015-07-01	1	27	7	2015	3
1539	1	0	254067	496841	1422774	2278275	1573202	1297321	480431	822977	1698928	1176536	0	0	0	0	0	2017-10-11 15:09:44.159872	2017-10-11 15:09:44.159872	2015-07-02	1	27	7	2015	4
1540	1	0	338756	587176	853664	1330221	2637211	1939072	523129	2200550	1274820	1082071	0	0	0	0	0	2017-10-11 15:09:44.168395	2017-10-11 15:09:44.168395	2015-07-03	1	27	7	2015	5
1541	1	0	564593	496841	1280497	1112797	2610256	813691	481488	940953	2189433	931175	0	0	0	0	0	2017-10-11 15:09:44.176533	2017-10-11 15:09:44.176533	2015-07-04	1	27	7	2015	6
1542	1	0	310526	451674	924803	1448077	4300619	1217970	734360	1456209	1953016	829975	0	0	0	0	0	2017-10-11 15:09:44.184676	2017-10-11 15:09:44.184676	2015-07-05	1	27	7	2015	0
1543	1	0	254067	248421	391262	1292467	1406337	569405	320277	459411	447100	472488	0	0	0	0	0	2017-10-11 15:09:44.192894	2017-10-11 15:09:44.192894	2015-07-06	1	28	7	2015	1
1544	1	0	254067	248421	426832	369958	2062892	847202	441634	689586	553385	514357	0	0	0	0	0	2017-10-11 15:09:44.201178	2017-10-11 15:09:44.201178	2015-07-07	1	28	7	2015	2
1545	1	0	282296	858181	1067081	3309621	4906589	909389	665699	1201396	2234943	1101546	0	0	0	0	0	2017-10-11 15:09:44.210376	2017-10-11 15:09:44.210376	2015-07-08	1	28	7	2015	3
1546	1	0	310526	542009	711387	1651504	2530115	2028434	900002	736208	2364214	1656758	0	0	0	0	0	2017-10-11 15:09:44.218924	2017-10-11 15:09:44.218924	2015-07-09	1	28	7	2015	4
1547	1	0	423444	722678	1351635	3329656	2458043	1034847	509874	2289218	821794	1616854	0	0	0	0	0	2017-10-11 15:09:44.227121	2017-10-11 15:09:44.227121	2015-07-10	1	28	7	2015	5
1548	1	0	310526	813013	924803	1121922	2915798	1424066	1244517	638522	2427428	1054469	0	0	0	0	0	2017-10-11 15:09:44.235432	2017-10-11 15:09:44.235432	2015-07-11	1	28	7	2015	6
1549	1	0	395215	677511	1280497	3109563	3480874	670374	702823	1270291	1300650	1295424	0	0	0	0	0	2017-10-11 15:09:44.244057	2017-10-11 15:09:44.244057	2015-07-12	1	28	7	2015	0
1550	1	0	211722	293588	640247	1075536	498298	734823	398376	368152	554015	544007	0	0	0	0	0	2017-10-11 15:09:44.252868	2017-10-11 15:09:44.252868	2015-07-13	1	29	7	2015	1
1551	1	0	155263	271004	569109	1102513	1247825	289788	515957	414328	673581	377699	0	0	0	0	0	2017-10-11 15:09:44.261841	2017-10-11 15:09:44.261841	2015-07-14	1	29	7	2015	2
1552	1	0	395215	406507	1067081	2260825	1804369	970867	622888	2032371	2577064	1561196	0	0	0	0	0	2017-10-11 15:09:44.270756	2017-10-11 15:09:44.270756	2015-07-15	1	29	7	2015	3
1553	1	0	564593	677511	1280497	3404673	2246454	972370	1227303	824643	960898	1077275	0	0	0	0	0	2017-10-11 15:09:44.279642	2017-10-11 15:09:44.279642	2015-07-16	1	29	7	2015	4
1554	1	0	366985	632344	995942	769254	2961405	1226859	712223	1742755	1475672	656815	0	0	0	0	0	2017-10-11 15:09:44.28807	2017-10-11 15:09:44.28807	2015-07-17	1	29	7	2015	5
1555	1	0	536363	496841	1138219	1246871	1744448	1704957	1557532	979655	1435700	830058	0	0	0	0	0	2017-10-11 15:09:44.297058	2017-10-11 15:09:44.297058	2015-07-18	1	29	7	2015	6
1556	1	0	338756	903348	640248	3410066	2779325	1039560	738616	1598804	2088554	744676	0	0	0	0	0	2017-10-11 15:09:44.305363	2017-10-11 15:09:44.305363	2015-07-19	1	29	7	2015	0
1557	1	0	239952	429090	675817	981743	1950576	689162	226600	522386	391684	363242	0	0	0	0	0	2017-10-11 15:09:44.314087	2017-10-11 15:09:44.314087	2015-07-20	1	30	7	2015	1
1558	1	0	169378	451674	497970	1447755	997097	769302	442636	646095	694877	420486	0	0	0	0	0	2017-10-11 15:09:44.322226	2017-10-11 15:09:44.322226	2015-07-21	1	30	7	2015	2
1559	1	0	479904	632344	1280497	3080277	3163386	1436480	537146	1075898	1061049	853867	0	0	0	0	0	2017-10-11 15:09:44.330523	2017-10-11 15:09:44.330523	2015-07-22	1	30	7	2015	3
1560	1	0	536363	722678	1209358	925353	1288418	956847	596241	866043	1029091	727692	0	0	0	0	0	2017-10-11 15:09:44.33911	2017-10-11 15:09:44.33911	2015-07-23	1	30	7	2015	4
1561	1	0	536363	677511	1280497	1328926	4095090	2238102	554006	2274460	1275096	945207	0	0	0	0	0	2017-10-11 15:09:44.347913	2017-10-11 15:09:44.347913	2015-07-24	1	30	7	2015	5
1562	1	0	423444	587176	853664	3846520	1399817	1116282	998114	664139	1159972	1125813	0	0	0	0	0	2017-10-11 15:09:44.357081	2017-10-11 15:09:44.357081	2015-07-25	1	30	7	2015	6
1563	1	0	536363	722678	1422774	1333820	3769876	1236532	1127120	839930	1150808	804607	0	0	0	0	0	2017-10-11 15:09:44.374635	2017-10-11 15:09:44.374635	2015-07-26	1	30	7	2015	0
1564	1	0	211722	316172	569109	1784408	529151	663499	353749	363226	857140	247062	0	0	0	0	0	2017-10-11 15:09:44.383074	2017-10-11 15:09:44.383074	2015-07-27	1	31	7	2015	1
1565	1	0	282296	225837	462401	1834695	1370482	650926	230082	661974	310345	425226	0	0	0	0	0	2017-10-11 15:09:44.391494	2017-10-11 15:09:44.391494	2015-07-28	1	31	7	2015	2
1566	1	0	479904	632344	853664	1741270	2216189	1036129	825059	1121591	1141105	883920	0	0	0	0	0	2017-10-11 15:09:44.400031	2017-10-11 15:09:44.400031	2015-07-29	1	31	7	2015	3
1567	1	0	338756	813013	1209358	1833845	5046759	1055705	875444	745979	2482922	760442	0	0	0	0	0	2017-10-11 15:09:44.408603	2017-10-11 15:09:44.408603	2015-07-30	1	31	7	2015	4
1568	1	0	536363	677511	1138219	4235246	1534522	1410829	864045	1654621	1757036	795584	0	0	0	0	0	2017-10-11 15:09:44.417189	2017-10-11 15:09:44.417189	2015-07-31	1	31	7	2015	5
1569	1	0	804544	677511	1280496	3265027	7530107	1078685	1334617	2648918	1694644	1153319	0	0	0	0	0	2017-10-11 15:09:44.426062	2017-10-11 15:09:44.426062	2015-08-01	1	31	8	2015	6
1570	1	0	465789	745262	2027452	1343140	6667063	1398049	1168980	1085818	2505794	1378472	0	0	0	0	0	2017-10-11 15:09:44.43534	2017-10-11 15:09:44.43534	2015-08-02	1	31	8	2015	0
1571	1	0	508133	1084018	1920744	2691610	2814870	2653607	1345636	1708162	2926118	967900	0	0	0	0	0	2017-10-11 15:09:44.443217	2017-10-11 15:09:44.443217	2015-08-03	1	32	8	2015	1
1572	1	0	635167	1287271	2027452	2241706	3882563	2138118	1118743	1213775	1041232	1343708	0	0	0	0	0	2017-10-11 15:09:44.451471	2017-10-11 15:09:44.451471	2015-08-04	1	32	8	2015	2
1573	1	0	381100	542009	800310	954537	2294402	1054519	696240	1108710	707568	344233	0	0	0	0	0	2017-10-11 15:09:44.459771	2017-10-11 15:09:44.459771	2015-08-05	1	32	8	2015	3
1574	1	0	232894	304880	853664	2678721	1139927	594386	636064	1289474	1117105	323265	0	0	0	0	0	2017-10-11 15:09:44.468851	2017-10-11 15:09:44.468851	2015-08-06	1	32	8	2015	4
1575	1	0	381100	1219520	1920744	1679682	4917534	2127842	1201321	1694583	3341672	1457547	0	0	0	0	0	2017-10-11 15:09:44.478172	2017-10-11 15:09:44.478172	2015-08-07	1	32	8	2015	5
1576	1	0	550478	813013	1173788	3079836	6268545	1817634	849148	1269275	2296616	2126256	0	0	0	0	0	2017-10-11 15:09:44.486531	2017-10-11 15:09:44.486531	2015-08-08	1	32	8	2015	6
1577	1	0	762200	813013	1493912	4436852	3484921	2231157	1534971	1611195	2017915	1152548	0	0	0	0	0	2017-10-11 15:09:44.495009	2017-10-11 15:09:44.495009	2015-08-09	1	32	8	2015	0
1578	1	0	423444	1355022	1600620	2375082	2012807	1733838	874927	1248241	1954499	1690592	0	0	0	0	0	2017-10-11 15:09:44.503061	2017-10-11 15:09:44.503061	2015-08-10	1	33	8	2015	1
1579	1	0	719855	1219520	1173788	2802018	2304800	2111078	1073482	2444636	2400032	2237930	0	0	0	0	0	2017-10-11 15:09:44.511504	2017-10-11 15:09:44.511504	2015-08-11	1	33	8	2015	2
1580	1	0	338756	338756	800310	795577	1676711	781208	779722	1331459	855710	611142	0	0	0	0	0	2017-10-11 15:09:44.521458	2017-10-11 15:09:44.521458	2015-08-12	1	33	8	2015	3
1581	1	0	232894	677511	960372	1335528	1889368	988316	578834	950499	827893	460342	0	0	0	0	0	2017-10-11 15:09:44.530401	2017-10-11 15:09:44.530401	2015-08-13	1	33	8	2015	4
1582	1	0	550478	1084018	1387204	1946246	3675496	1885426	1346903	2273922	1784002	1559022	0	0	0	0	0	2017-10-11 15:09:44.539051	2017-10-11 15:09:44.539051	2015-08-14	1	33	8	2015	5
1583	1	0	719855	677511	1280496	4252829	4489105	1659209	912177	1223131	1877045	1767733	0	0	0	0	0	2017-10-11 15:09:44.547793	2017-10-11 15:09:44.547793	2015-08-15	1	33	8	2015	6
1584	1	0	677511	880764	960372	2144151	2076633	1856473	613529	2437299	4169954	1055666	0	0	0	0	0	2017-10-11 15:09:44.556868	2017-10-11 15:09:44.556868	2015-08-16	1	33	8	2015	0
1585	1	0	592822	1355022	2027452	2040746	4048439	1789657	629767	1015575	2627044	2109015	0	0	0	0	0	2017-10-11 15:09:44.565571	2017-10-11 15:09:44.565571	2015-08-17	1	34	8	2015	1
1586	1	0	846889	1355022	1707328	3590819	4257828	2114131	1293762	2503256	3764239	1681335	0	0	0	0	0	2017-10-11 15:09:44.574367	2017-10-11 15:09:44.574367	2015-08-18	1	34	8	2015	2
1587	1	0	359928	474258	1067080	1497132	1054354	902305	391847	870303	788508	548689	0	0	0	0	0	2017-10-11 15:09:44.582641	2017-10-11 15:09:44.582641	2015-08-19	1	34	8	2015	3
1588	1	0	232894	338756	480186	1338056	3206605	1310267	682149	664513	746292	577834	0	0	0	0	0	2017-10-11 15:09:44.590822	2017-10-11 15:09:44.590822	2015-08-20	1	34	8	2015	4
1589	1	0	381100	1151769	1707328	2561095	6090848	2887157	975316	2942743	1580990	1533090	0	0	0	0	0	2017-10-11 15:09:44.599103	2017-10-11 15:09:44.599103	2015-08-21	1	34	8	2015	5
1590	1	0	677511	1151769	1280496	2107786	1521329	2827120	853383	1265947	995889	1668192	0	0	0	0	0	2017-10-11 15:09:44.607845	2017-10-11 15:09:44.607845	2015-08-22	1	34	8	2015	6
1591	1	0	592822	1287271	960372	4675334	3434634	2211436	1967477	2557544	1075522	2191780	0	0	0	0	0	2017-10-11 15:09:44.617037	2017-10-11 15:09:44.617037	2015-08-23	1	34	8	2015	0
1592	1	0	804544	1084018	2134160	3201194	5742153	1806883	1535911	3228204	2618491	2081507	0	0	0	0	0	2017-10-11 15:09:44.625571	2017-10-11 15:09:44.625571	2015-08-24	1	35	8	2015	1
1593	1	0	677511	609760	1493912	2373072	2122848	2234408	1345265	2146466	4227994	1458354	0	0	0	0	0	2017-10-11 15:09:44.634206	2017-10-11 15:09:44.634206	2015-08-25	1	35	8	2015	2
1594	1	0	338756	609760	1013726	1866116	2012678	938541	431348	748381	783229	414641	0	0	0	0	0	2017-10-11 15:09:44.64231	2017-10-11 15:09:44.64231	2015-08-26	1	35	8	2015	3
1595	1	0	402272	338756	586894	1191137	2782899	1200445	773024	1390199	1327749	422695	0	0	0	0	0	2017-10-11 15:09:44.650777	2017-10-11 15:09:44.650777	2015-08-27	1	35	8	2015	4
1596	1	0	635167	1219520	1600620	2832281	1387454	1524378	1233167	1896671	3826918	1366605	0	0	0	0	0	2017-10-11 15:09:44.659691	2017-10-11 15:09:44.659691	2015-08-28	1	35	8	2015	5
1597	1	0	508133	1287271	1173788	2806693	2458524	1920832	1939994	2578592	1821519	1107210	0	0	0	0	0	2017-10-11 15:09:44.669184	2017-10-11 15:09:44.669184	2015-08-29	1	35	8	2015	6
1598	1	0	381100	1219520	1387204	4683344	3923785	1578519	948105	2238382	2236196	1322632	0	0	0	0	0	2017-10-11 15:09:44.677903	2017-10-11 15:09:44.677903	2015-08-30	1	35	8	2015	0
1599	1	0	0	0	352800	668165	715954	533790	947578	827488	1502358	1851671	2270068	605047	0	0	0	2017-10-11 15:09:44.686254	2017-10-11 15:09:44.686254	2015-08-31	1	36	8	2015	1
1600	1	0	0	0	242550	339424	1580988	947222	532518	1245797	1366405	2863051	1015728	554691	0	0	0	2017-10-11 15:09:44.695248	2017-10-11 15:09:44.695248	2015-09-01	1	36	9	2015	2
1601	1	0	0	0	396900	517649	513301	1023142	712983	1458594	2649313	2221174	1429503	1574570	0	0	0	2017-10-11 15:09:44.704061	2017-10-11 15:09:44.704061	2015-09-02	1	36	9	2015	3
1602	1	0	0	0	198450	473899	1067427	461902	389651	1439546	2597954	1406574	1683406	1215911	0	0	0	2017-10-11 15:09:44.712781	2017-10-11 15:09:44.712781	2015-09-03	1	36	9	2015	4
1603	1	0	0	0	441000	711304	345604	629640	967424	1887247	1049888	2599586	1147592	1694131	0	0	0	2017-10-11 15:09:44.720967	2017-10-11 15:09:44.720967	2015-09-04	1	36	9	2015	5
1604	1	0	0	0	882000	915670	1228067	1169936	1481266	2349122	3229829	3750612	6671404	1673597	0	0	0	2017-10-11 15:09:44.72961	2017-10-11 15:09:44.72961	2015-09-05	1	36	9	2015	6
1605	1	0	0	0	423360	1114445	947826	2005898	1887662	1475736	1669665	4189739	4312805	2230583	0	0	0	2017-10-11 15:09:44.737878	2017-10-11 15:09:44.737878	2015-09-06	1	36	9	2015	0
1606	1	0	0	0	418950	769306	1446423	838892	825170	1254897	1103460	1925370	1756569	1482833	0	0	0	2017-10-11 15:09:44.746301	2017-10-11 15:09:44.746301	2015-09-07	1	37	9	2015	1
1607	1	0	0	0	308700	382840	938343	615795	571341	1813192	1278572	1349750	1891235	961068	0	0	0	2017-10-11 15:09:44.755058	2017-10-11 15:09:44.755058	2015-09-08	1	37	9	2015	2
1608	1	0	0	0	198450	381699	373510	1318554	974490	924490	1139184	1085969	1531967	932674	0	0	0	2017-10-11 15:09:44.763302	2017-10-11 15:09:44.763302	2015-09-09	1	37	9	2015	3
1609	1	0	0	0	264600	545401	780013	454236	576983	1981870	1406516	2988427	872905	1053069	0	0	0	2017-10-11 15:09:44.771847	2017-10-11 15:09:44.771847	2015-09-10	1	37	9	2015	4
1610	1	0	0	0	330750	513419	422204	956817	676034	1348493	2110799	1434000	1623170	962088	0	0	0	2017-10-11 15:09:44.780566	2017-10-11 15:09:44.780566	2015-09-11	1	37	9	2015	5
1611	1	0	0	0	441000	1078869	2231274	2745570	1813399	1428199	2069084	5230729	4872231	3333021	0	0	0	2017-10-11 15:09:44.789546	2017-10-11 15:09:44.789546	2015-09-12	1	37	9	2015	6
1612	1	0	0	0	529200	680101	760040	1493731	1508895	1783808	3195719	1970203	3473430	1552913	0	0	0	2017-10-11 15:09:44.798481	2017-10-11 15:09:44.798481	2015-09-13	1	37	9	2015	0
1613	1	0	0	0	242550	334015	729829	736123	1011335	1382056	2026595	2753158	1617862	1367512	0	0	0	2017-10-11 15:09:44.807151	2017-10-11 15:09:44.807151	2015-09-14	1	38	9	2015	1
1614	1	0	0	0	396900	487819	472023	632190	585196	819441	2709510	1961055	1100648	917017	0	0	0	2017-10-11 15:09:44.815403	2017-10-11 15:09:44.815403	2015-09-15	1	38	9	2015	2
1615	1	0	0	0	418950	584808	1586952	1185094	400034	1117602	2481937	1344341	2271703	1462100	0	0	0	2017-10-11 15:09:44.823377	2017-10-11 15:09:44.823377	2015-09-16	1	38	9	2015	3
1616	1	0	0	0	220500	418094	502757	444260	1317580	854234	1900667	2081374	1226366	1026285	0	0	0	2017-10-11 15:09:44.831583	2017-10-11 15:09:44.831583	2015-09-17	1	38	9	2015	4
1617	1	0	0	0	418950	690375	1015772	680346	1078163	1410282	1883189	2617931	949197	1037720	0	0	0	2017-10-11 15:09:44.840476	2017-10-11 15:09:44.840476	2015-09-18	1	38	9	2015	5
1618	1	0	0	0	441000	1920983	1131248	1414794	1816460	2652493	3490459	4431359	5172532	1929812	0	0	0	2017-10-11 15:09:44.849029	2017-10-11 15:09:44.849029	2015-09-19	1	38	9	2015	6
1619	1	0	0	0	423360	711167	871720	883137	1393649	1341716	3234937	3936972	4814958	2002902	0	0	0	2017-10-11 15:09:44.858102	2017-10-11 15:09:44.858102	2015-09-20	1	38	9	2015	0
1620	1	0	0	0	264600	894570	632918	732753	1065771	1594490	2077776	1323402	1870218	1848737	0	0	0	2017-10-11 15:09:44.866588	2017-10-11 15:09:44.866588	2015-09-21	1	39	9	2015	1
1621	1	0	0	0	242550	616044	1004390	528942	1021407	1313995	1587103	3614748	1124549	1335962	0	0	0	2017-10-11 15:09:44.87508	2017-10-11 15:09:44.87508	2015-09-22	1	39	9	2015	2
1622	1	0	0	0	441000	922750	843534	1237031	585474	1155750	1888192	1341388	2468142	1911352	0	0	0	2017-10-11 15:09:44.883691	2017-10-11 15:09:44.883691	2015-09-23	1	39	9	2015	3
1623	1	0	0	0	220500	673340	917072	577150	704102	770601	1605568	2408228	2231816	974961	0	0	0	2017-10-11 15:09:44.892345	2017-10-11 15:09:44.892345	2015-09-24	1	39	9	2015	4
1624	1	0	0	0	198450	733876	476581	730880	527222	993611	2609585	1493061	1682604	1140129	0	0	0	2017-10-11 15:09:44.901532	2017-10-11 15:09:44.901532	2015-09-25	1	39	9	2015	5
1625	1	0	0	0	837900	1313320	1312646	1848300	1672264	3394641	3238226	3409754	4622405	2375807	0	0	0	2017-10-11 15:09:44.910141	2017-10-11 15:09:44.910141	2015-09-26	1	39	9	2015	6
1626	1	0	0	0	599760	1269142	1838173	1188103	2022592	2761415	2773083	3915161	3904775	1423830	0	0	0	2017-10-11 15:09:44.91886	2017-10-11 15:09:44.91886	2015-09-27	1	39	9	2015	0
1627	1	0	0	0	562275	897827	682324	933176	1340869	1676720	2188078	2590366	3435370	2173538	0	0	0	2017-10-11 15:09:44.927891	2017-10-11 15:09:44.927891	2015-09-28	1	40	9	2015	1
1628	1	0	0	0	297675	674405	1120937	1474502	816231	2281536	2248974	2715099	3962120	1882815	0	0	0	2017-10-11 15:09:44.936994	2017-10-11 15:09:44.936994	2015-09-29	1	40	9	2015	2
1629	1	0	0	0	529200	413090	926825	1340566	765758	1644410	2319926	2873459	2563830	1723875	0	0	0	2017-10-11 15:09:44.945527	2017-10-11 15:09:44.945527	2015-09-30	1	40	9	2015	3
1630	1	0	0	0	562275	970126	1153948	1476878	1768320	1965070	2108471	2624471	2233987	942108	0	0	0	2017-10-11 15:09:44.954654	2017-10-11 15:09:44.954654	2015-10-01	1	40	10	2015	4
1631	1	0	0	0	363825	550638	583920	1808878	1135334	1658374	2937243	4012425	2431155	1703162	0	0	0	2017-10-11 15:09:44.962888	2017-10-11 15:09:44.962888	2015-10-02	1	40	10	2015	5
1632	1	0	0	0	595350	824076	1465892	642601	1102325	1309797	1852502	4742519	2813379	2177790	0	0	0	2017-10-11 15:09:44.971307	2017-10-11 15:09:44.971307	2015-10-03	1	40	10	2015	6
1633	1	0	0	0	396900	1744303	900390	2116636	1115134	2719414	3881501	3240895	4469950	1796157	0	0	0	2017-10-11 15:09:44.981097	2017-10-11 15:09:44.981097	2015-10-04	1	40	10	2015	0
1634	1	0	0	0	595350	1172119	1707028	1457660	2973284	2633060	4407521	10419499	4068661	3225077	0	0	0	2017-10-11 15:09:44.990986	2017-10-11 15:09:44.990986	2015-10-05	1	41	10	2015	1
1635	1	0	0	0	476280	1992290	2298422	2878616	3088469	1797295	5170827	8253578	5629352	2488955	0	0	0	2017-10-11 15:09:44.99982	2017-10-11 15:09:44.99982	2015-10-06	1	41	10	2015	2
1636	1	0	0	0	661500	1117219	962410	868146	1562099	1632559	3563285	3329469	3357844	1488570	0	0	0	2017-10-11 15:09:45.008671	2017-10-11 15:09:45.008671	2015-10-07	1	41	10	2015	3
1637	1	0	0	0	562275	772648	472548	530844	950637	2404433	1872599	4755778	3262067	2327502	0	0	0	2017-10-11 15:09:45.018132	2017-10-11 15:09:45.018132	2015-10-08	1	41	10	2015	4
1638	1	0	0	0	595350	793597	1879923	1157352	1164358	1443480	1792937	3919590	2166813	1713419	0	0	0	2017-10-11 15:09:45.028431	2017-10-11 15:09:45.028431	2015-10-09	1	41	10	2015	5
1639	1	0	0	0	661500	413838	1081453	1208845	1483194	1200803	2755425	2832268	2025325	1615929	0	0	0	2017-10-11 15:09:45.037229	2017-10-11 15:09:45.037229	2015-10-10	1	41	10	2015	6
1640	1	0	0	0	396900	983164	1722402	1461120	1025505	3179695	5271254	4151044	3147356	1435282	0	0	0	2017-10-11 15:09:45.046557	2017-10-11 15:09:45.046557	2015-10-11	1	41	10	2015	0
1641	1	0	0	0	661500	2399369	2971740	3001304	1822622	2769958	5901562	5439829	4261916	4317295	0	0	0	2017-10-11 15:09:45.055567	2017-10-11 15:09:45.055567	2015-10-12	1	42	10	2015	1
1642	1	0	0	0	582120	2702979	2526719	2999106	2868986	2174868	3621097	6577567	9672565	4145564	0	0	0	2017-10-11 15:09:45.073057	2017-10-11 15:09:45.073057	2015-10-13	1	42	10	2015	2
1643	1	0	0	0	429975	481554	727529	981411	1357287	715838	2124578	1926871	2635348	1335326	0	0	0	2017-10-11 15:09:45.082287	2017-10-11 15:09:45.082287	2015-10-14	1	42	10	2015	3
1644	1	0	0	0	529200	1515974	1032983	1242300	927949	2756993	2839299	3354409	2473959	1177527	0	0	0	2017-10-11 15:09:45.091711	2017-10-11 15:09:45.091711	2015-10-15	1	42	10	2015	4
1645	1	0	0	0	429975	744481	1194645	1106412	673266	1928072	1474247	2000653	1808681	2249850	0	0	0	2017-10-11 15:09:45.10077	2017-10-11 15:09:45.10077	2015-10-16	1	42	10	2015	5
1646	1	0	0	0	396900	1046306	1443914	890828	637579	2301474	1393428	2255854	4150033	985559	0	0	0	2017-10-11 15:09:45.109106	2017-10-11 15:09:45.109106	2015-10-17	1	42	10	2015	6
1647	1	0	0	0	496125	890638	1369735	1417680	1130029	2587460	4217994	2014601	2702856	2265955	0	0	0	2017-10-11 15:09:45.117739	2017-10-11 15:09:45.117739	2015-10-18	1	42	10	2015	0
1648	1	0	0	0	859950	2142104	2008163	2247409	1463525	5607739	5506040	5256494	6645170	3714974	0	0	0	2017-10-11 15:09:45.126917	2017-10-11 15:09:45.126917	2015-10-19	1	43	10	2015	1
1649	1	0	0	0	952560	2198121	3219572	2735106	2702684	2279447	3011343	4771015	8021546	1849677	0	0	0	2017-10-11 15:09:45.136095	2017-10-11 15:09:45.136095	2015-10-20	1	43	10	2015	2
1650	1	0	0	0	363825	1224183	997046	1844959	1547828	1620788	2496026	2955953	3791604	886317	0	0	0	2017-10-11 15:09:45.144601	2017-10-11 15:09:45.144601	2015-10-21	1	43	10	2015	3
1651	1	0	0	0	562275	1153352	739582	1742673	1734248	1465269	4117562	2616448	3299770	1058729	0	0	0	2017-10-11 15:09:45.153427	2017-10-11 15:09:45.153427	2015-10-22	1	43	10	2015	4
1652	1	0	0	0	595350	1441456	1194392	1241118	1256648	2234560	2598545	4000843	1216423	1173684	0	0	0	2017-10-11 15:09:45.161662	2017-10-11 15:09:45.161662	2015-10-23	1	43	10	2015	5
1653	1	0	0	0	363825	882237	755641	884821	1411533	1286225	2041783	3322598	2567240	1297596	0	0	0	2017-10-11 15:09:45.170276	2017-10-11 15:09:45.170276	2015-10-24	1	43	10	2015	6
1654	1	0	0	0	529200	963333	2008654	1058344	819622	2285741	1880167	4236420	2860308	2579303	0	0	0	2017-10-11 15:09:45.179211	2017-10-11 15:09:45.179211	2015-10-25	1	43	10	2015	0
1655	1	0	0	0	1058400	2343544	2017291	2202772	1894009	4776366	8479850	7437539	6074366	4070078	0	0	0	2017-10-11 15:09:45.187813	2017-10-11 15:09:45.187813	2015-10-26	1	44	10	2015	1
1656	1	0	0	0	1005480	689666	1059518	3273767	2666226	3584857	5882843	8128109	5815179	1949463	0	0	0	2017-10-11 15:09:45.196557	2017-10-11 15:09:45.196557	2015-10-27	1	44	10	2015	2
1657	1	0	0	0	363825	1024731	1037751	1280069	1166257	2326578	1892988	2573037	2172624	1462130	0	0	0	2017-10-11 15:09:45.204732	2017-10-11 15:09:45.204732	2015-10-28	1	44	10	2015	3
1658	1	0	0	0	628425	703891	1679682	907093	1097951	1361731	3558090	2495684	2331786	1476786	0	0	0	2017-10-11 15:09:45.213444	2017-10-11 15:09:45.213444	2015-10-29	1	44	10	2015	4
1659	1	0	0	0	529200	1389685	784999	1162871	1123677	1593198	2310938	3940212	1402925	2325834	0	0	0	2017-10-11 15:09:45.222662	2017-10-11 15:09:45.222662	2015-10-30	1	44	10	2015	5
1660	1	0	366985	451674	924803	1752519	1011344	1621652	698808	1122242	1380379	661802	0	0	0	0	0	2017-10-11 15:09:45.230875	2017-10-11 15:09:45.230875	2015-10-31	1	44	10	2015	6
1661	1	0	479904	406507	640248	1625825	2637211	1831345	610317	1100275	1738391	1082071	0	0	0	0	0	2017-10-11 15:09:45.239383	2017-10-11 15:09:45.239383	2015-11-01	1	44	11	2015	0
1662	1	0	366985	767846	924803	1112797	3814989	1183550	695483	1787811	2447014	731638	0	0	0	0	0	2017-10-11 15:09:45.247403	2017-10-11 15:09:45.247403	2015-11-02	1	45	11	2015	1
1663	1	0	282296	496841	782526	1295648	2529776	1074680	934640	1456209	1830953	829975	0	0	0	0	0	2017-10-11 15:09:45.255395	2017-10-11 15:09:45.255395	2015-11-03	1	45	11	2015	2
1664	1	0	225837	429090	675817	1077056	1571788	301450	533795	689117	943878	354366	0	0	0	0	0	2017-10-11 15:09:45.263943	2017-10-11 15:09:45.263943	2015-11-04	1	45	11	2015	3
1665	1	0	282296	451674	320124	554937	1820199	582451	441634	689586	1006154	457206	0	0	0	0	0	2017-10-11 15:09:45.27256	2017-10-11 15:09:45.27256	2015-11-05	1	45	11	2015	4
1666	1	0	508133	767846	924803	3504305	3357140	1091266	832124	1141326	2234943	1223940	0	0	0	0	0	2017-10-11 15:09:45.28129	2017-10-11 15:09:45.28129	2015-11-06	1	45	11	2015	5
1667	1	0	536363	451674	1067081	3002734	3503236	1927012	780001	1472416	1418528	1840842	0	0	0	0	0	2017-10-11 15:09:45.289985	2017-10-11 15:09:45.289985	2015-11-07	1	45	11	2015	6
1668	1	0	423444	722678	853664	2996690	2458043	1787463	552364	2060296	986153	1446659	0	0	0	0	0	2017-10-11 15:09:45.298306	2017-10-11 15:09:45.298306	2015-11-08	1	45	11	2015	0
1669	1	0	536363	406507	1351635	1458499	1619888	1780082	786011	851363	1941942	1252182	0	0	0	0	0	2017-10-11 15:09:45.30769	2017-10-11 15:09:45.30769	2015-11-09	1	46	11	2015	1
1670	1	0	338756	451674	924803	1900289	1842816	819346	780914	1633232	1387360	613622	0	0	0	0	0	2017-10-11 15:09:45.316451	2017-10-11 15:09:45.316451	2015-11-10	1	46	11	2015	2
1671	1	0	197607	203253	569109	879984	697617	489882	551597	515413	654745	352004	0	0	0	0	0	2017-10-11 15:09:45.324888	2017-10-11 15:09:45.324888	2015-11-11	1	46	11	2015	3
1672	1	0	197607	203253	533540	1232220	1313500	260809	483710	483382	769806	419666	0	0	0	0	0	2017-10-11 15:09:45.333538	2017-10-11 15:09:45.333538	2015-11-12	1	46	11	2015	4
1673	1	0	451674	451674	1422774	3082943	1002427	1213584	400428	1497537	1546238	1327017	0	0	0	0	0	2017-10-11 15:09:45.342275	2017-10-11 15:09:45.342275	2015-11-13	1	46	11	2015	5
1674	1	0	423444	451674	782526	1702337	2246454	1728658	818202	1484357	665237	566987	0	0	0	0	0	2017-10-11 15:09:45.351352	2017-10-11 15:09:45.351352	2015-11-14	1	46	11	2015	6
1675	1	0	254067	587176	853664	923105	1916203	1145068	1068334	1947785	2280584	656815	0	0	0	0	0	2017-10-11 15:09:45.360493	2017-10-11 15:09:45.360493	2015-11-15	1	46	11	2015	0
1676	1	0	479904	632344	1067081	831247	969138	1002916	1090272	2068161	861420	1660116	0	0	0	0	0	2017-10-11 15:09:45.369275	2017-10-11 15:09:45.369275	2015-11-16	1	47	11	2015	1
1677	1	0	338756	632344	1209358	2607697	3106304	1386080	553962	1598804	2480157	620563	0	0	0	0	0	2017-10-11 15:09:45.377982	2017-10-11 15:09:45.377982	2015-11-17	1	47	11	2015	2
1678	1	0	268181	451674	355693	755187	1950576	612589	226600	485073	352516	297198	0	0	0	0	0	2017-10-11 15:09:45.386285	2017-10-11 15:09:45.386285	2015-11-18	1	47	11	2015	3
1679	1	0	211722	383923	462401	1757989	830915	666728	680978	795194	434298	504583	0	0	0	0	0	2017-10-11 15:09:45.394858	2017-10-11 15:09:45.394858	2015-11-19	1	47	11	2015	4
1680	1	0	395215	722678	995942	3272794	4217848	1285271	402860	986240	1061049	853867	0	0	0	0	0	2017-10-11 15:09:45.40342	2017-10-11 15:09:45.40342	2015-11-20	1	47	11	2015	5
1681	1	0	282296	406507	1422774	1480565	1684855	1722325	650444	866043	735065	1007573	0	0	0	0	0	2017-10-11 15:09:45.412258	2017-10-11 15:09:45.412258	2015-11-21	1	47	11	2015	6
1682	1	0	310526	767846	1138219	1661157	2957565	2126197	1169568	1250953	1147586	693152	0	0	0	0	0	2017-10-11 15:09:45.420699	2017-10-11 15:09:45.420699	2015-11-22	1	47	11	2015	0
1683	1	0	395215	632344	853664	2692564	1615173	1190701	998114	1475864	1159972	703633	0	0	0	0	0	2017-10-11 15:09:45.429518	2017-10-11 15:09:45.429518	2015-11-23	1	48	11	2015	1
1684	1	0	536363	767846	1209358	1778426	2579389	1030443	1014408	1511874	2557352	804607	0	0	0	0	0	2017-10-11 15:09:45.437922	2017-10-11 15:09:45.437922	2015-11-24	1	48	11	2015	2
1685	1	0	211722	429090	462401	1314827	899557	765576	530624	396246	655460	247062	0	0	0	0	0	2017-10-11 15:09:45.446962	2017-10-11 15:09:45.446962	2015-11-25	1	48	11	2015	3
1686	1	0	211722	293588	604678	1641569	725549	406829	460164	297888	479624	300160	0	0	0	0	0	2017-10-11 15:09:45.45601	2017-10-11 15:09:45.45601	2015-11-26	1	48	11	2015	4
1687	1	0	451674	767846	1422774	1582973	3068570	1332166	975070	841193	1667769	987911	0	0	0	0	0	2017-10-11 15:09:45.464532	2017-10-11 15:09:45.464532	2015-11-27	1	48	11	2015	5
1688	1	0	508133	722678	1422774	1324444	4766384	914944	817081	1409072	1862192	557657	0	0	0	0	0	2017-10-11 15:09:45.472901	2017-10-11 15:09:45.472901	2015-11-28	1	48	11	2015	6
1689	1	0	564593	903348	1422774	1905861	1534522	1410829	802328	1480450	976131	901661	0	0	0	0	0	2017-10-11 15:09:45.481054	2017-10-11 15:09:45.481054	2015-11-29	1	48	11	2015	0
1690	1	0	762200	1084018	1280496	2176685	3963214	1941633	1123888	1714006	3200995	1729978	0	0	0	0	0	2017-10-11 15:09:45.489804	2017-10-11 15:09:45.489804	2015-11-30	1	49	11	2015	1
1691	1	0	762200	745262	960372	2442072	5926278	1864066	1001983	1176302	4176324	1127840	0	0	0	0	0	2017-10-11 15:09:45.498704	2017-10-11 15:09:45.498704	2015-12-01	1	49	12	2015	2
1692	1	0	635167	745262	2027452	3180993	3838460	1474226	2324280	1952186	1316753	1451849	0	0	0	0	0	2017-10-11 15:09:45.507871	2017-10-11 15:09:45.507871	2015-12-02	1	49	12	2015	3
1693	1	0	423444	1084018	1280496	1681279	4991866	1125325	1322151	2157822	1619694	2076640	0	0	0	0	0	2017-10-11 15:09:45.516384	2017-10-11 15:09:45.516384	2015-12-03	1	49	12	2015	4
1694	1	0	296411	440382	960372	1718167	2600322	820182	742656	1705708	1179280	401605	0	0	0	0	0	2017-10-11 15:09:45.524818	2017-10-11 15:09:45.524818	2015-12-04	1	49	12	2015	5
1695	1	0	296411	643635	533540	2048433	2165861	486316	556556	758514	868860	549551	0	0	0	0	0	2017-10-11 15:09:45.533522	2017-10-11 15:09:45.533522	2015-12-05	1	49	12	2015	6
1696	1	0	550478	880764	1173788	1832381	4658717	2659802	1201321	1848636	3550527	1325043	0	0	0	0	0	2017-10-11 15:09:45.54301	2017-10-11 15:09:45.54301	2015-12-06	1	49	12	2015	0
1697	1	0	804544	1219520	1387204	2771852	5572040	1272344	926344	1142348	1837293	1328910	0	0	0	0	0	2017-10-11 15:09:45.55131	2017-10-11 15:09:45.55131	2015-12-07	1	50	12	2015	1
1698	1	0	381100	948515	1600620	4119934	4181905	2348586	1227977	2490029	2017915	1920914	0	0	0	0	0	2017-10-11 15:09:45.560176	2017-10-11 15:09:45.560176	2015-12-08	1	50	12	2015	2
1699	1	0	508133	1016267	2134160	2035784	2012807	1609993	1166569	1386934	1609587	1207566	0	0	0	0	0	2017-10-11 15:09:45.568588	2017-10-11 15:09:45.568588	2015-12-09	1	50	12	2015	3
1700	1	0	677511	880764	1173788	4330391	2881000	1794416	757752	1711245	1733356	1413430	0	0	0	0	0	2017-10-11 15:09:45.577157	2017-10-11 15:09:45.577157	2015-12-10	1	50	12	2015	4
1701	1	0	402272	406507	586894	716019	2980819	919068	556944	832162	684568	846196	0	0	0	0	0	2017-10-11 15:09:45.586077	2017-10-11 15:09:45.586077	2015-12-11	1	50	12	2015	5
1702	1	0	381100	609760	800310	1038744	894964	1064340	434126	1389191	650487	424931	0	0	0	0	0	2017-10-11 15:09:45.595574	2017-10-11 15:09:45.595574	2015-12-12	1	50	12	2015	6
1703	1	0	592822	1355022	1067080	1946246	6942603	1885426	2081577	2111499	1459638	2278571	0	0	0	0	0	2017-10-11 15:09:45.604252	2017-10-11 15:09:45.604252	2015-12-13	1	50	12	2015	0
1704	1	0	508133	1151769	1707328	3071488	2835224	1493288	1326803	2038552	1588269	1878216	0	0	0	0	0	2017-10-11 15:09:45.612967	2017-10-11 15:09:45.612967	2015-12-14	1	51	12	2015	1
1705	1	0	550478	880764	1387204	2474021	3194820	2475298	1363398	2437299	3961456	863726	0	0	0	0	0	2017-10-11 15:09:45.621341	2017-10-11 15:09:45.621341	2015-12-15	1	51	12	2015	2
1706	1	0	465789	948515	2134160	1311908	4723179	1690232	1119586	1624920	3090640	1860896	0	0	0	0	0	2017-10-11 15:09:45.630058	2017-10-11 15:09:45.630058	2015-12-16	1	51	12	2015	3
2037	5	0	282296	429090	320124	907952	853775	405703	548204	586964	625468	209833	0	0	0	0	0	2017-10-12 19:12:44.815058	2017-10-12 19:12:44.815058	2015-11-12	1	46	11	2015	4
2038	5	0	254067	903348	1351635	2055295	2004854	1294490	667380	2032371	1932798	1014777	0	0	0	0	0	2017-10-12 19:12:44.823388	2017-10-12 19:12:44.823388	2015-11-13	1	46	11	2015	5
2039	5	0	395215	632344	853664	3782970	2808068	1080411	613652	907107	1256558	793782	0	0	0	0	0	2017-10-12 19:12:44.832844	2017-10-12 19:12:44.832844	2015-11-14	1	46	11	2015	6
2040	5	0	310526	451674	924803	1461583	1916203	817906	890279	1230180	2280584	919541	0	0	0	0	0	2017-10-12 19:12:44.842079	2017-10-12 19:12:44.842079	2015-11-15	1	46	11	2015	0
2041	5	0	423444	677511	1351635	997496	1066052	902624	1557532	1741610	957133	1411099	0	0	0	0	0	2017-10-12 19:12:44.851258	2017-10-12 19:12:44.851258	2015-11-16	1	47	11	2015	1
2042	5	0	310526	451674	1067081	2005921	2452346	1645970	646289	1178066	2219088	1241126	0	0	0	0	0	2017-10-12 19:12:44.860156	2017-10-12 19:12:44.860156	2015-11-17	1	47	11	2015	2
2043	5	0	239952	316172	533540	1132781	2080614	459442	327311	671639	744200	363242	0	0	0	0	0	2017-10-12 19:12:44.869147	2017-10-12 19:12:44.869147	2015-11-18	1	47	11	2015	3
2044	5	0	254067	451674	711386	1757989	830915	1025736	374538	596395	825166	448518	0	0	0	0	0	2017-10-12 19:12:44.877261	2017-10-12 19:12:44.877261	2015-11-19	1	47	11	2015	4
2045	5	0	564593	632344	1138219	2310208	4745079	907250	402860	896582	964590	960601	0	0	0	0	0	2017-10-12 19:12:44.88529	2017-10-12 19:12:44.88529	2015-11-20	1	47	11	2015	5
2046	5	0	395215	542009	853664	1388030	1783964	1435271	921463	1212460	1249611	951597	0	0	0	0	0	2017-10-12 19:12:44.89364	2017-10-12 19:12:44.89364	2015-11-21	1	47	11	2015	6
2047	5	0	338756	542009	1067081	1882645	3640080	1678577	677118	1705845	1147586	1134248	0	0	0	0	0	2017-10-12 19:12:44.903308	2017-10-12 19:12:44.903308	2015-11-22	1	47	11	2015	0
2048	5	0	423444	587176	1351635	3461868	1830529	1190701	720860	664139	1933286	773996	0	0	0	0	0	2017-10-12 19:12:44.914259	2017-10-12 19:12:44.914259	2015-11-23	1	48	11	2015	1
2049	5	0	423444	767846	1209358	2964044	3174632	755658	563560	1679860	1918014	1072810	0	0	0	0	0	2017-10-12 19:12:44.922778	2017-10-12 19:12:44.922778	2015-11-24	1	48	11	2015	2
2050	5	0	197607	338756	711386	845246	899557	969730	530624	330205	605040	209053	0	0	0	0	0	2017-10-12 19:12:44.930996	2017-10-12 19:12:44.930996	2015-11-25	1	48	11	2015	3
2051	5	0	141148	271004	675817	1545006	1370482	406829	414148	364086	536051	475253	0	0	0	0	0	2017-10-12 19:12:44.93924	2017-10-12 19:12:44.93924	2015-11-26	1	48	11	2015	4
2052	5	0	282296	587176	1422774	1741270	3068570	962120	1500108	1028125	1141105	831925	0	0	0	0	0	2017-10-12 19:12:44.948593	2017-10-12 19:12:44.948593	2015-11-27	1	48	11	2015	5
2053	5	0	395215	451674	711387	1222564	4205633	1337226	1050532	1409072	1241461	861834	0	0	0	0	0	2017-10-12 19:12:44.957921	2017-10-12 19:12:44.957921	2015-11-28	1	48	11	2015	6
2054	5	0	338756	406507	853664	4235246	2216531	1410829	1049198	1741706	1268970	795584	0	0	0	0	0	2017-10-12 19:12:44.96643	2017-10-12 19:12:44.96643	2015-11-29	1	48	11	2015	0
2055	5	0	592822	1219520	1173788	3627808	5152178	1725896	1404860	2648918	2636113	1826088	0	0	0	0	0	2017-10-12 19:12:44.974807	2017-10-12 19:12:44.974807	2015-11-30	1	49	11	2015	1
2056	5	0	635167	609760	1707328	1221036	6296671	1631057	918485	1719211	3132243	1127840	0	0	0	0	0	2017-10-12 19:12:44.983351	2017-10-12 19:12:44.983351	2015-12-01	1	49	12	2015	2
2057	5	0	762200	1219520	1173788	2202226	3838460	2211339	2446610	1952186	1609365	1371191	0	0	0	0	0	2017-10-12 19:12:44.993276	2017-10-12 19:12:44.993276	2015-12-02	1	49	12	2015	3
2058	5	0	804544	948515	1814036	2521919	4159889	2250650	1932374	1888095	1156924	1588019	0	0	0	0	0	2017-10-12 19:12:45.002288	2017-10-12 19:12:45.002288	2015-12-03	1	49	12	2015	4
2059	5	0	275239	372631	1013726	954537	3059202	937350	417744	1108710	943424	315547	0	0	0	0	0	2017-10-12 19:12:45.012802	2017-10-12 19:12:45.012802	2015-12-04	1	49	12	2015	5
2060	5	0	381100	304880	1067080	3151436	1595898	594386	556556	986068	1241228	452571	0	0	0	0	0	2017-10-12 19:12:45.021804	2017-10-12 19:12:45.021804	2015-12-05	1	49	12	2015	6
2061	5	0	804544	677511	1814036	1832381	3882264	1728871	1401541	1386477	3341672	2252573	0	0	0	0	0	2017-10-12 19:12:45.031954	2017-10-12 19:12:45.031954	2015-12-06	1	49	12	2015	0
2062	5	0	550478	1287271	1280496	4311770	5223788	1090580	849148	1650058	1148308	1860474	0	0	0	0	0	2017-10-12 19:12:45.044018	2017-10-12 19:12:45.044018	2015-12-07	1	50	12	2015	1
2063	5	0	677511	880764	1493912	3803016	5575874	1878869	1125645	2343557	1834468	960457	0	0	0	0	0	2017-10-12 19:12:45.053067	2017-10-12 19:12:45.053067	2015-12-08	1	50	12	2015	2
2064	5	0	719855	880764	1920744	1696487	3824333	1981530	1263783	1664321	1494617	1086809	0	0	0	0	0	2017-10-12 19:12:45.062731	2017-10-12 19:12:45.062731	2015-12-09	1	50	12	2015	3
2065	5	0	465789	677511	2027452	2802018	2304800	2111078	1010336	2444636	1866691	1649001	0	0	0	0	0	2017-10-12 19:12:45.071623	2017-10-12 19:12:45.071623	2015-12-10	1	50	12	2015	4
2066	5	0	254067	542009	480186	875135	3726024	551441	556944	1331459	812925	893207	0	0	0	0	0	2017-10-12 19:12:45.080136	2017-10-12 19:12:45.080136	2015-12-11	1	50	12	2015	5
2067	5	0	423444	542009	800310	667764	1889368	684219	723543	1316075	768758	424931	0	0	0	0	0	2017-10-12 19:12:45.088607	2017-10-12 19:12:45.088607	2015-12-12	1	50	12	2015	6
2068	5	0	423444	1355022	2134160	2363299	3675496	1552704	1591794	2761191	3081458	1918797	0	0	0	0	0	2017-10-12 19:12:45.098433	2017-10-12 19:12:45.098433	2015-12-13	1	50	12	2015	0
2069	5	0	550478	1084018	2027452	3071488	4489105	3318418	1326803	1426986	1877045	1215316	0	0	0	0	0	2017-10-12 19:12:45.106761	2017-10-12 19:12:45.106761	2015-12-14	1	51	12	2015	1
2070	5	0	550478	677511	2027452	3298694	2875338	1701767	1090718	1290335	1876479	1727453	0	0	0	0	0	2017-10-12 19:12:45.115175	2017-10-12 19:12:45.115175	2015-12-15	1	51	12	2015	2
2071	5	0	508133	609760	1280496	2186514	3711069	1491381	1329508	2031150	2472512	1116537	0	0	0	0	0	2017-10-12 19:12:45.123491	2017-10-12 19:12:45.123491	2015-12-16	1	51	12	2015	3
2072	5	0	804544	745262	1920744	4787758	3548190	2642664	1617203	1609236	3136866	2129691	0	0	0	0	0	2017-10-12 19:12:45.131505	2017-10-12 19:12:45.131505	2015-12-17	1	51	12	2015	4
2073	5	0	317583	372631	746956	998088	979043	694081	293885	870303	705507	777310	0	0	0	0	0	2017-10-12 19:12:45.141253	2017-10-12 19:12:45.141253	2015-12-18	1	51	12	2015	5
2074	5	0	423444	508133	1013726	892037	3807843	1310267	430831	1255192	696539	533386	0	0	0	0	0	2017-10-12 19:12:45.149723	2017-10-12 19:12:45.149723	2015-12-19	1	51	12	2015	6
2075	5	0	677511	677511	1920744	3329424	5732563	3047554	1381697	1961828	2459318	1768950	0	0	0	0	0	2017-10-12 19:12:45.159074	2017-10-12 19:12:45.159074	2015-12-20	1	51	12	2015	0
2076	5	0	635167	1151769	1067080	1611836	1690366	1934345	853383	1558088	2102432	1787349	0	0	0	0	0	2017-10-12 19:12:45.167708	2017-10-12 19:12:45.167708	2015-12-21	1	52	12	2015	1
2077	5	0	550478	1219520	1067080	4967543	3243821	2053476	931963	1406649	1314526	986301	0	0	0	0	0	2017-10-12 19:12:45.176436	2017-10-12 19:12:45.176436	2015-12-22	1	52	12	2015	2
2078	5	0	804544	948515	1387204	1440537	3509094	2299669	1621240	3066794	1929414	1503311	0	0	0	0	0	2017-10-12 19:12:45.187329	2017-10-12 19:12:45.187329	2015-12-23	1	52	12	2015	3
2079	5	0	381100	677511	2134160	1740253	4481568	1005484	1255580	2280620	3805195	2386397	0	0	0	0	0	2017-10-12 19:12:45.196607	2017-10-12 19:12:45.196607	2015-12-24	1	52	12	2015	4
2080	5	0	423444	508133	960372	2296758	2415214	1001110	479275	514512	1210444	663426	0	0	0	0	0	2017-10-12 19:12:45.206749	2017-10-12 19:12:45.206749	2015-12-25	1	52	12	2015	5
2081	5	0	275239	677511	640248	893353	3975570	1028953	773024	1544666	1257867	563594	0	0	0	0	0	2017-10-12 19:12:45.218845	2017-10-12 19:12:45.218845	2015-12-26	1	52	12	2015	6
2082	5	0	423444	948515	2027452	5098106	2312423	1693753	713939	2231378	3252880	1150826	0	0	0	0	0	2017-10-12 19:12:45.230644	2017-10-12 19:12:45.230644	2015-12-27	1	52	12	2015	0
2083	5	0	423444	1287271	1920744	2962621	1475114	2134258	969997	1805014	1071482	1217931	0	0	0	0	0	2017-10-12 19:12:45.241933	2017-10-12 19:12:45.241933	2015-12-28	1	53	12	2015	1
2084	5	0	762200	677511	1493912	3122230	5493299	1736371	948105	1884954	2124386	1322632	0	0	0	0	0	2017-10-12 19:12:45.253924	2017-10-12 19:12:45.253924	2015-12-29	1	53	12	2015	2
2085	5	0	592822	948515	1173788	2689482	4481568	2234408	1704002	2683082	2113997	1458354	0	0	0	0	0	2017-10-12 19:12:45.266809	2017-10-12 19:12:45.266809	2015-12-30	1	53	12	2015	3
2086	5	0	317583	575884	1067080	2583853	2817749	1001110	431348	514512	1068039	414641	0	0	0	0	0	2017-10-12 19:12:45.278363	2017-10-12 19:12:45.278363	2015-12-31	1	53	12	2015	4
1707	1	0	381100	1084018	1493912	5984698	3903009	2510531	2048457	1788040	2300368	1681335	0	0	0	0	0	2017-10-11 15:09:45.639555	2017-10-11 15:09:45.639555	2015-12-17	1	51	12	2015	4
1708	1	0	254067	643635	1013726	1696750	903732	832897	653078	994632	456504	868758	0	0	0	0	0	2017-10-11 15:09:45.648517	2017-10-11 15:09:45.648517	2015-12-18	1	51	12	2015	5
1709	1	0	359928	440382	800310	892037	2204541	896498	359026	1329026	845798	533386	0	0	0	0	0	2017-10-11 15:09:45.657071	2017-10-11 15:09:45.657071	2015-12-19	1	51	12	2015	6
1710	1	0	465789	1287271	1067080	4866081	3582852	1443578	812763	2942743	2634984	2004810	0	0	0	0	0	2017-10-11 15:09:45.66528	2017-10-11 15:09:45.66528	2015-12-20	1	51	12	2015	0
1711	1	0	804544	1219520	1173788	1735824	2366512	1339162	1517125	1558088	1106543	1310723	0	0	0	0	0	2017-10-11 15:09:45.673394	2017-10-11 15:09:45.673394	2015-12-21	1	52	12	2015	1
1712	1	0	381100	1219520	1067080	4383126	3243821	2053476	1656822	1150895	1553531	986301	0	0	0	0	0	2017-10-11 15:09:45.682769	2017-10-11 15:09:45.682769	2015-12-22	1	52	12	2015	2
1713	1	0	719855	1287271	1280496	1600597	3828102	2956718	1109269	2098333	1515968	1040754	0	0	0	0	0	2017-10-11 15:09:45.692366	2017-10-11 15:09:45.692366	2015-12-23	1	52	12	2015	3
1714	1	0	719855	745262	1600620	2531277	3066336	1005484	1793686	2280620	3382395	1458354	0	0	0	0	0	2017-10-11 15:09:45.701089	2017-10-11 15:09:45.701089	2015-12-24	1	52	12	2015	4
1715	1	0	381100	677511	693602	1866116	3824088	750833	958550	514512	1281647	580497	0	0	0	0	0	2017-10-11 15:09:45.70994	2017-10-11 15:09:45.70994	2015-12-25	1	52	12	2015	5
1716	1	0	232894	372631	586894	992614	3180456	1028953	938672	1235733	698815	493144	0	0	0	0	0	2017-10-11 15:09:45.718493	2017-10-11 15:09:45.718493	2015-12-26	1	52	12	2015	6
1717	1	0	381100	1016267	1067080	4248422	2158261	2540630	973553	1227258	3826918	1222752	0	0	0	0	0	2017-10-11 15:09:45.727465	2017-10-11 15:09:45.727465	2015-12-27	1	52	12	2015	0
1718	1	0	719855	1287271	1707328	1871129	1639016	1920832	1551995	1805014	1821519	1439373	0	0	0	0	0	2017-10-11 15:09:45.736681	2017-10-11 15:09:45.736681	2015-12-28	1	53	12	2015	1
1719	1	0	550478	1084018	1600620	4423159	7455192	1894223	1206680	2356192	2236196	1102193	0	0	0	0	0	2017-10-11 15:09:45.745465	2017-10-11 15:09:45.745465	2015-12-29	1	53	12	2015	2
1720	1	0	635167	1151769	1493912	1582048	2830464	1787526	1345265	2548928	2748196	2651552	0	0	0	0	0	2017-10-11 15:09:45.754058	2017-10-11 15:09:45.754058	2015-12-30	1	53	12	2015	3
1721	1	0	254067	542009	746956	1435474	3421553	750833	814768	467738	640823	497569	0	0	0	0	0	2017-10-11 15:09:45.771095	2017-10-11 15:09:45.771095	2015-12-31	1	53	12	2015	4
2087	1	0	0	0	418950	572713	550734	771030	847833	1654976	938974	1960592	2143953	544542	0	0	0	2017-10-12 19:13:48.868788	2017-10-12 19:13:48.868788	2015-01-01	2	1	1	2015	4
2088	1	0	0	0	418950	577021	1501939	694629	1065036	659540	1110204	3220933	761796	721098	0	0	0	2017-10-12 19:13:48.878495	2017-10-12 19:13:48.878495	2015-01-02	2	1	1	2015	5
2089	1	0	0	0	308700	245202	671240	1242387	427790	891363	2091563	2221174	2209232	1994455	0	0	0	2017-10-12 19:13:48.887331	2017-10-12 19:13:48.887331	2015-01-03	2	1	1	2015	6
2090	1	0	0	0	308700	552882	711618	600473	692714	1693584	2164962	1839366	1377332	1013259	0	0	0	2017-10-12 19:13:48.896096	2017-10-12 19:13:48.896096	2015-01-04	2	1	1	2015	0
2091	1	0	0	0	286650	533478	408441	1049400	537458	1092617	1908888	2052305	1147592	1223539	0	0	0	2017-10-12 19:13:48.904936	2017-10-12 19:13:48.904936	2015-01-05	2	2	1	2015	1
2092	1	0	0	0	573300	686753	2319682	2222878	1595209	3915204	2936208	3250530	3862392	1369307	0	0	0	2017-10-12 19:13:48.916246	2017-10-12 19:13:48.916246	2015-01-06	2	2	1	2015	2
2093	1	0	0	0	423360	1371624	1474396	1689178	1651705	1264916	1669665	2693404	6161150	2059000	0	0	0	2017-10-12 19:13:48.928489	2017-10-12 19:13:48.928489	2015-01-07	2	2	1	2015	3
2094	1	0	0	0	286650	427392	761275	782965	1060933	1792710	2329527	2502981	1171046	1400453	0	0	0	2017-10-12 19:13:48.938772	2017-10-12 19:13:48.938772	2015-01-08	2	2	1	2015	4
2095	1	0	0	0	418950	765680	1450166	461846	693772	1410261	2130953	1349750	2009437	1029716	0	0	0	2017-10-12 19:13:48.949305	2017-10-12 19:13:48.949305	2015-01-09	2	2	1	2015	5
2096	1	0	0	0	396900	202076	581015	659277	852678	1309694	1898640	1447958	1171504	2072608	0	0	0	2017-10-12 19:13:48.958843	2017-10-12 19:13:48.958843	2015-01-10	2	2	1	2015	6
2097	1	0	0	0	286650	629309	921834	408812	710133	1486403	1662246	2461057	872905	886795	0	0	0	2017-10-12 19:13:48.968649	2017-10-12 19:13:48.968649	2015-01-11	2	2	1	2015	0
2098	1	0	0	0	330750	650330	422204	1472026	563362	780706	2345332	1985539	1623170	1224475	0	0	0	2017-10-12 19:13:48.977788	2017-10-12 19:13:48.977788	2015-01-12	2	3	1	2015	1
2099	1	0	0	0	705600	738174	2975032	1734044	1309677	1428199	3678371	3578920	5996592	3809166	0	0	0	2017-10-12 19:13:48.985841	2017-10-12 19:13:48.985841	2015-01-13	2	3	1	2015	2
2100	1	0	0	0	564480	608512	886714	2068243	1408302	2378410	2982671	1970203	2605073	1725459	0	0	0	2017-10-12 19:13:48.994898	2017-10-12 19:13:48.994898	2015-01-14	2	3	1	2015	3
2101	1	0	0	0	220500	567826	1066673	658636	809068	1382056	1801418	1238921	2240116	647769	0	0	0	2017-10-12 19:13:49.003378	2017-10-12 19:13:49.003378	2015-01-15	2	3	1	2015	4
2102	1	0	0	0	441000	569122	944046	680820	994833	936504	1354755	928921	1439308	1120799	0	0	0	2017-10-12 19:13:49.013025	2017-10-12 19:13:49.013025	2015-01-16	2	3	1	2015	5
2103	1	0	0	0	396900	621359	1507604	666616	690967	1547449	2627933	2444256	2032576	946065	0	0	0	2017-10-12 19:13:49.0217	2017-10-12 19:13:49.0217	2015-01-17	2	3	1	2015	6
2104	1	0	0	0	286650	450255	534179	444260	592911	1159317	2027378	2948613	1498892	702195	0	0	0	2017-10-12 19:13:49.031268	2017-10-12 19:13:49.031268	2015-01-18	2	3	1	2015	0
2105	1	0	0	0	352800	531058	812618	1175142	1021417	1057712	1530091	2181609	1613635	718421	0	0	0	2017-10-12 19:13:49.040639	2017-10-12 19:13:49.040639	2015-01-19	2	4	1	2015	1
2106	1	0	0	0	617400	1694985	1470622	943196	2654826	2652493	3102630	2461866	3160992	2508756	0	0	0	2017-10-12 19:13:49.049809	2017-10-12 19:13:49.049809	2015-01-20	2	4	1	2015	2
2107	1	0	0	0	635040	888959	1035168	1204278	1974336	1585665	4117193	3473799	4213089	2575159	0	0	0	2017-10-12 19:13:49.058904	2017-10-12 19:13:49.058904	2015-01-21	2	4	1	2015	3
2108	1	0	0	0	374850	760385	537980	732753	1003078	956694	1500616	2095387	1870218	1951444	0	0	0	2017-10-12 19:13:49.067295	2017-10-12 19:13:49.067295	2015-01-22	2	4	1	2015	4
2109	1	0	0	0	396900	975403	1272227	415598	680938	938568	2116138	2530324	1533476	801577	0	0	0	2017-10-12 19:13:49.077302	2017-10-12 19:13:49.077302	2015-01-23	2	4	1	2015	5
2110	1	0	0	0	198450	814191	713759	1171924	1170948	1386900	2360240	1857307	2613326	1624649	0	0	0	2017-10-12 19:13:49.086321	2017-10-12 19:13:49.086321	2015-01-24	2	4	1	2015	6
2111	1	0	0	0	198450	795765	733658	808010	997478	630491	1897489	1926582	2371305	1657434	0	0	0	2017-10-12 19:13:49.096773	2017-10-12 19:13:49.096773	2015-01-25	2	4	1	2015	0
2112	1	0	0	0	308700	786296	556011	779605	338928	1689139	1510813	2488436	1542387	760086	0	0	0	2017-10-12 19:13:49.106383	2017-10-12 19:13:49.106383	2015-01-26	2	5	1	2015	1
2113	1	0	0	0	793800	1175076	1875208	2112342	1672264	2858645	4483697	6137557	5007605	1583872	0	0	0	2017-10-12 19:13:49.115432	2017-10-12 19:13:49.115432	2015-01-27	2	5	1	2015	2
2114	1	0	0	0	317520	761485	1378630	1584137	2022592	3086288	4929925	3709100	3346950	1423830	0	0	0	2017-10-12 19:13:49.127264	2017-10-12 19:13:49.127264	2015-01-28	2	5	1	2015	3
2115	1	0	0	0	330750	690636	833952	1133142	1117391	1006032	1790246	4892913	1717685	2028635	0	0	0	2017-10-12 19:13:49.13576	2017-10-12 19:13:49.13576	2015-01-29	2	5	1	2015	4
2116	1	0	0	0	463050	1011608	1992776	1032151	1004592	1711152	1949111	3054487	2971590	1439799	0	0	0	2017-10-12 19:13:49.145574	2017-10-12 19:13:49.145574	2015-01-30	2	5	1	2015	5
2117	1	0	0	0	297675	660944	860623	1340566	689182	1384766	2174931	2197351	2221986	1926684	0	0	0	2017-10-12 19:13:49.1569	2017-10-12 19:13:49.1569	2015-01-31	2	5	1	2015	6
2118	1	0	0	0	297675	700647	692369	868752	1178880	1768563	2319318	3028236	3655615	1199047	0	0	0	2017-10-12 19:13:49.165663	2017-10-12 19:13:49.165663	2015-02-01	2	5	2	2015	0
2119	1	0	0	0	396900	673002	729900	1702474	1651395	2041075	3524692	3540375	2279208	1703162	0	0	0	2017-10-12 19:13:49.175258	2017-10-12 19:13:49.175258	2015-02-02	2	6	2	2015	1
2120	1	0	0	0	463050	1167441	732946	817856	918604	2488614	1515684	3347660	1582526	2063169	0	0	0	2017-10-12 19:13:49.183372	2017-10-12 19:13:49.183372	2015-02-03	2	6	2	2015	2
2121	1	0	0	0	463050	1841208	969651	1671029	1177086	2311502	4657801	1876307	4234689	2210654	0	0	0	2017-10-12 19:13:49.193468	2017-10-12 19:13:49.193468	2015-02-04	2	6	2	2015	3
2122	1	0	0	0	1058400	1034223	2438612	2591395	3610416	4548013	6811623	4935552	6781102	2086814	0	0	0	2017-10-12 19:13:49.204879	2017-10-12 19:13:49.204879	2015-02-05	2	6	2	2015	4
2123	1	0	0	0	952560	2213656	2433623	2673000	2600816	2695943	3345829	7795046	5160240	4480119	0	0	0	2017-10-12 19:13:49.214609	2017-10-12 19:13:49.214609	2015-02-06	2	6	2	2015	5
2124	1	0	0	0	562275	977567	914290	578764	1128183	816279	3772890	3073356	3357844	2571166	0	0	0	2017-10-12 19:13:49.225988	2017-10-12 19:13:49.225988	2015-02-07	2	6	2	2015	6
2125	1	0	0	0	297675	1313502	472548	530844	950637	2277884	2304738	3253953	1957240	2327502	0	0	0	2017-10-12 19:13:49.23702	2017-10-12 19:13:49.23702	2015-02-08	2	6	2	2015	0
2126	1	0	0	0	562275	1675371	1484150	1639582	698615	1587828	2344609	4703508	2889084	2024950	0	0	0	2017-10-12 19:13:49.248373	2017-10-12 19:13:49.248373	2015-02-09	2	7	2	2015	1
2127	1	0	0	0	496125	517298	739942	863461	1668593	1701137	3306510	4248402	1687771	2193047	0	0	0	2017-10-12 19:13:49.259926	2017-10-12 19:13:49.259926	2015-02-10	2	7	2	2015	2
2128	1	0	0	0	429975	693998	1205681	1043657	932277	2296446	5271254	4151044	2221663	2152923	0	0	0	2017-10-12 19:13:49.275583	2017-10-12 19:13:49.275583	2015-02-11	2	7	2	2015	3
2129	1	0	0	0	793800	2399369	4862848	3188886	1822622	2983032	8360546	6276726	6586597	6835717	0	0	0	2017-10-12 19:13:49.285377	2017-10-12 19:13:49.285377	2015-02-12	2	7	2	2015	4
2130	1	0	0	0	582120	3003310	2021375	2099374	1793116	2951606	4279478	9396524	10881635	2901895	0	0	0	2017-10-12 19:13:49.294114	2017-10-12 19:13:49.294114	2015-02-13	2	7	2	2015	5
2131	1	0	0	0	661500	433399	1535894	1864681	1566101	954450	2478675	1445153	1581209	1424347	0	0	0	2017-10-12 19:13:49.302823	2017-10-12 19:13:49.302823	2015-02-14	2	7	2	2015	6
2132	1	0	0	0	429975	1326478	1377310	807495	1213472	1451049	2306931	3157091	2664263	2237301	0	0	0	2017-10-12 19:13:49.312236	2017-10-12 19:13:49.312236	2015-02-15	2	7	2	2015	0
2133	1	0	0	0	330750	569309	767986	2102183	1162914	1799533	1701054	3077928	2813503	2249850	0	0	0	2017-10-12 19:13:49.320977	2017-10-12 19:13:49.320977	2015-02-16	2	8	2	2015	1
2134	1	0	0	0	595350	889360	1443914	1880637	811464	1150737	1277309	1561745	2075017	1971119	0	0	0	2017-10-12 19:13:49.332929	2017-10-12 19:13:49.332929	2015-02-17	2	8	2	2015	2
2135	1	0	0	0	562275	940118	1174058	1023880	1849138	1293730	4962346	2909980	3829046	2265955	0	0	0	2017-10-12 19:13:49.34175	2017-10-12 19:13:49.34175	2015-02-18	2	8	2	2015	3
2136	1	0	0	0	1124550	2142104	2008163	3111797	2487993	6597340	8717897	7359092	4060937	4511040	0	0	0	2017-10-12 19:13:49.374521	2017-10-12 19:13:49.374521	2015-02-19	2	8	2	2015	4
2137	1	0	0	0	635040	1388287	1609786	3907294	2066758	3419171	4401194	5248117	6787462	2055197	0	0	0	2017-10-12 19:13:49.383156	2017-10-12 19:13:49.383156	2015-02-20	2	8	2	2015	5
2138	1	0	0	0	496125	837599	1218612	1947456	1083480	1745464	2496026	3120172	1895802	886317	0	0	0	2017-10-12 19:13:49.393024	2017-10-12 19:13:49.393024	2015-02-21	2	8	2	2015	6
2139	1	0	0	0	429975	768901	554687	1947694	1095314	1598476	2383852	3779313	2804805	1323411	0	0	0	2017-10-12 19:13:49.402821	2017-10-12 19:13:49.402821	2015-02-22	2	8	2	2015	0
2140	1	0	0	0	330750	991001	1990654	1137692	1256648	1986275	3031636	4000843	2189561	1493779	0	0	0	2017-10-12 19:13:49.411316	2017-10-12 19:13:49.411316	2015-02-23	2	9	2	2015	1
2141	1	0	0	0	529200	882237	1091481	1179762	1411533	943231	1561364	3530261	3048598	2335673	0	0	0	2017-10-12 19:13:49.419791	2017-10-12 19:13:49.419791	2015-02-24	2	9	2	2015	2
2142	1	0	0	0	463050	1313636	2008654	705563	614716	1959206	2734789	1906389	3380364	1719535	0	0	0	2017-10-12 19:13:49.429639	2017-10-12 19:13:49.429639	2015-02-25	2	9	2	2015	3
2143	1	0	0	0	992250	2096855	2824207	3487722	2582739	3104638	7207873	5250028	4555775	4696244	0	0	0	2017-10-12 19:13:49.438253	2017-10-12 19:13:49.438253	2015-02-26	2	9	2	2015	4
2144	1	0	0	0	687960	1103466	1059518	1895339	1733047	4865163	3806546	6321862	6343831	1949463	0	0	0	2017-10-12 19:13:49.446843	2017-10-12 19:13:49.446843	2015-02-27	2	9	2	2015	5
2145	1	0	0	0	463050	1229677	2075502	1280069	1614818	1279618	2082287	2724392	2308413	1827663	0	0	0	2017-10-12 19:13:49.454975	2017-10-12 19:13:49.454975	2015-02-28	2	9	2	2015	6
2146	1	0	0	0	562275	905002	1919637	1511822	548976	1733112	3183554	4537608	1748840	2461310	0	0	0	2017-10-12 19:13:49.464177	2017-10-12 19:13:49.464177	2015-03-01	2	9	3	2015	0
2147	1	0	0	0	595350	772047	1207690	1647400	1182818	1394049	2465000	2281176	2295695	1628084	0	0	0	2017-10-12 19:13:49.473676	2017-10-12 19:13:49.473676	2015-03-02	2	10	3	2015	1
2148	1	0	310526	496841	1067081	2453527	1460831	1405431	829835	1346690	1911294	808869	0	0	0	0	0	2017-10-12 19:13:49.483125	2017-10-12 19:13:49.483125	2015-03-03	2	10	3	2015	2
2149	1	0	254067	496841	1209358	1625825	3767444	1831345	523129	1320330	2317854	797315	0	0	0	0	0	2017-10-12 19:13:49.492285	2017-10-12 19:13:49.492285	2015-03-04	2	10	3	2015	3
2150	1	0	395215	632344	640248	1112797	2811045	887663	802481	846858	1674273	1197225	0	0	0	0	0	2017-10-12 19:13:49.501128	2017-10-12 19:13:49.501128	2015-03-05	2	10	3	2015	4
2151	1	0	451674	632344	640248	762146	3541686	1361261	1335200	1553290	2319207	1383291	0	0	0	0	0	2017-10-12 19:13:49.510117	2017-10-12 19:13:49.510117	2015-03-06	2	10	3	2015	5
2152	1	0	197607	203253	391262	718037	1075434	368438	391449	918822	844523	502019	0	0	0	0	0	2017-10-12 19:13:49.520178	2017-10-12 19:13:49.520178	2015-03-07	2	10	3	2015	6
2153	1	0	254067	271004	604678	739916	1577506	1059002	278927	818883	503077	542933	0	0	0	0	0	2017-10-12 19:13:49.528591	2017-10-12 19:13:49.528591	2015-03-08	2	10	3	2015	0
2154	1	0	254067	451674	1351635	1946836	3098898	666885	832124	840977	1117472	673167	0	0	0	0	0	2017-10-12 19:13:49.536548	2017-10-12 19:13:49.536548	2015-03-09	2	11	3	2015	1
2155	1	0	282296	903348	1422774	2402187	2140866	1217060	900002	736208	1654950	1840842	0	0	0	0	0	2017-10-12 19:13:49.546337	2017-10-12 19:13:49.546337	2015-03-10	2	11	3	2015	2
2156	1	0	536363	903348	1209358	2830208	2458043	846693	764811	1945835	1397050	936074	0	0	0	0	0	2017-10-12 19:13:49.554802	2017-10-12 19:13:49.554802	2015-03-11	2	11	3	2015	3
2157	1	0	423444	451674	1067081	2243844	2915798	1780082	1179016	1206097	2063314	593139	0	0	0	0	0	2017-10-12 19:13:49.56452	2017-10-12 19:13:49.56452	2015-03-12	2	11	3	2015	4
2158	1	0	282296	677511	995942	1727535	3071360	1042804	1015188	1633232	953810	1022703	0	0	0	0	0	2017-10-12 19:13:49.572944	2017-10-12 19:13:49.572944	2015-03-13	2	11	3	2015	5
2159	1	0	141148	429090	320124	1955520	946766	489882	612886	331337	856205	320004	0	0	0	0	0	2017-10-12 19:13:49.628727	2017-10-12 19:13:49.628727	2015-03-14	2	11	3	2015	6
2160	1	0	211722	271004	675817	1102513	985125	463661	386968	379800	673581	314750	0	0	0	0	0	2017-10-12 19:13:49.63776	2017-10-12 19:13:49.63776	2015-03-15	2	11	3	2015	0
2161	1	0	366985	858181	1138219	1849766	1904611	1618112	667380	1711470	2061651	1092837	0	0	0	0	0	2017-10-12 19:13:49.646848	2017-10-12 19:13:49.646848	2015-03-16	2	12	3	2015	1
2162	1	0	310526	903348	640248	1702337	2386858	2160822	954569	989572	739152	623686	0	0	0	0	0	2017-10-12 19:13:49.654977	2017-10-12 19:13:49.654977	2015-03-17	2	12	3	2015	2
2163	1	0	536363	722678	782526	846179	1916203	1635812	534167	1230180	2414736	722497	0	0	0	0	0	2017-10-12 19:13:49.663235	2017-10-12 19:13:49.663235	2015-03-18	2	12	3	2015	3
2164	1	0	451674	632344	1280497	1080621	1841362	1805249	1012396	1088506	957133	1079075	0	0	0	0	0	2017-10-12 19:13:49.671226	2017-10-12 19:13:49.671226	2015-03-19	2	12	3	2015	4
2165	1	0	366985	632344	1351635	3610658	2288856	1645970	923270	1093919	1696950	682619	0	0	0	0	0	2017-10-12 19:13:49.680487	2017-10-12 19:13:49.680487	2015-03-20	2	12	3	2015	5
2166	1	0	197607	203253	675817	679668	1820538	497728	453200	485073	705031	495330	0	0	0	0	0	2017-10-12 19:13:49.689577	2017-10-12 19:13:49.689577	2015-03-21	2	12	3	2015	6
2167	1	0	127033	248421	497970	1861400	775520	820589	340489	496996	390868	532616	0	0	0	0	0	2017-10-12 19:13:49.698528	2017-10-12 19:13:49.698528	2015-03-22	2	12	3	2015	0
2168	1	0	479904	632344	782526	1732656	4217848	1436480	537146	1703506	1061049	747134	0	0	0	0	0	2017-10-12 19:13:49.706817	2017-10-12 19:13:49.706817	2015-03-23	2	13	3	2015	1
2169	1	0	338756	406507	995942	1295494	1684855	1148216	650444	1558877	808572	783668	0	0	0	0	0	2017-10-12 19:13:49.715574	2017-10-12 19:13:49.715574	2015-03-24	2	13	3	2015	2
2170	1	0	508133	451674	1351635	2214876	4095090	1566671	800231	1592122	1530115	693152	0	0	0	0	0	2017-10-12 19:13:49.724369	2017-10-12 19:13:49.724369	2015-03-25	2	13	3	2015	3
2171	1	0	338756	722678	924803	2115586	1722851	669769	998114	1106898	1643293	703633	0	0	0	0	0	2017-10-12 19:13:49.7333	2017-10-12 19:13:49.7333	2015-03-26	2	13	3	2015	4
2172	1	0	508133	858181	640248	1926629	1785731	1305228	958052	1679860	2045882	737557	0	0	0	0	0	2017-10-12 19:13:49.741984	2017-10-12 19:13:49.741984	2015-03-27	2	13	3	2015	5
2173	1	0	169378	338756	426832	1408743	952472	918691	459874	594369	1008400	209053	0	0	0	0	0	2017-10-12 19:13:49.751919	2017-10-12 19:13:49.751919	2015-03-28	2	13	3	2015	6
2174	1	0	141148	383923	675817	1931258	725549	772975	299107	661974	366772	350186	0	0	0	0	0	2017-10-12 19:13:49.75999	2017-10-12 19:13:49.75999	2015-03-29	2	13	3	2015	0
2175	1	0	366985	767846	924803	3165946	2216189	740092	750054	1775852	1667769	831925	0	0	0	0	0	2017-10-12 19:13:49.767814	2017-10-12 19:13:49.767814	2015-03-30	2	14	3	2015	1
2176	1	0	451674	903348	1280497	1324444	5046759	914944	641992	1657732	1365607	456265	0	0	0	0	0	2017-10-12 19:13:49.776156	2017-10-12 19:13:49.776156	2015-03-31	2	14	3	2015	2
2177	1	0	366985	451674	1138219	3811721	2898541	1097312	802328	1132109	976131	742545	0	0	0	0	0	2017-10-12 19:13:49.785122	2017-10-12 19:13:49.785122	2015-04-01	2	14	4	2015	3
2178	1	0	550478	677511	1067080	1813904	4755857	2049502	632187	1869824	2636113	1826088	0	0	0	0	0	2017-10-12 19:13:49.794984	2017-10-12 19:13:49.794984	2015-04-02	2	14	4	2015	4
2179	1	0	762200	677511	1387204	2197865	3703924	1980570	751487	1628726	4176324	1503787	0	0	0	0	0	2017-10-12 19:13:49.804336	2017-10-12 19:13:49.804336	2015-04-03	2	14	4	2015	5
2180	1	0	592822	880764	1280496	2202226	4350254	1474226	2079619	1952186	1316753	1613166	0	0	0	0	0	2017-10-12 19:13:49.813232	2017-10-12 19:13:49.813232	2015-04-04	2	14	4	2015	6
2181	1	0	762200	1016267	1173788	2101599	4714540	1237858	1627262	1753231	2198156	1954485	0	0	0	0	0	2017-10-12 19:13:49.822785	2017-10-12 19:13:49.822785	2015-04-05	2	14	4	2015	0
2182	1	0	275239	542009	693602	1909074	2447362	878766	928320	1193996	1061352	516350	0	0	0	0	0	2017-10-12 19:13:49.833333	2017-10-12 19:13:49.833333	2015-04-06	2	15	4	2015	1
2183	1	0	423444	440382	746956	1575718	1139927	702456	795080	1213622	1117105	517224	0	0	0	0	0	2017-10-12 19:13:49.842523	2017-10-12 19:13:49.842523	2015-04-07	2	15	4	2015	2
2184	1	0	677511	1219520	2027452	2137778	2588176	1329901	1902092	1694583	1879691	1855060	0	0	0	0	0	2017-10-12 19:13:49.851231	2017-10-12 19:13:49.851231	2015-04-08	2	15	4	2015	3
2185	1	0	550478	1151769	1280496	2771852	6616798	1635871	1157930	2411623	2066954	1196019	0	0	0	0	0	2017-10-12 19:13:49.860066	2017-10-12 19:13:49.860066	2015-04-09	2	15	4	2015	4
2186	1	0	381100	880764	1387204	5387606	4181905	1996298	1432640	2343557	2017915	1440686	0	0	0	0	0	2017-10-12 19:13:49.868459	2017-10-12 19:13:49.868459	2015-04-10	2	15	4	2015	5
2187	1	0	592822	1151769	1600620	1866136	3019211	1238456	1652640	2773868	2069469	2052862	0	0	0	0	0	2017-10-12 19:13:49.877635	2017-10-12 19:13:49.877635	2015-04-11	2	15	4	2015	6
2188	1	0	846889	1219520	1920744	2292560	2304800	1794416	820898	1955709	2000027	1060072	0	0	0	0	0	2017-10-12 19:13:49.88785	2017-10-12 19:13:49.88785	2015-04-12	2	15	4	2015	0
2189	1	0	211722	677511	960372	1432039	3539723	459534	1058194	1081811	598997	423098	0	0	0	0	0	2017-10-12 19:13:49.89603	2017-10-12 19:13:49.89603	2015-04-13	2	16	4	2015	1
2190	1	0	338756	542009	853664	816156	1392166	912292	771779	1462306	827893	637396	0	0	0	0	0	2017-10-12 19:13:49.904225	2017-10-12 19:13:49.904225	2015-04-14	2	16	4	2015	2
2191	1	0	592822	677511	1814036	2363299	4492272	1330889	1959131	2923614	3243640	1918797	0	0	0	0	0	2017-10-12 19:13:49.916114	2017-10-12 19:13:49.916114	2015-04-15	2	16	4	2015	3
2192	1	0	635167	1219520	1493912	4489098	4016568	1659209	1078028	917348	1443881	1657250	0	0	0	0	0	2017-10-12 19:13:49.926275	2017-10-12 19:13:49.926275	2015-04-16	2	16	4	2015	4
2193	1	0	762200	1016267	1814036	1814282	1757151	1856473	613529	1577076	3335963	1919392	0	0	0	0	0	2017-10-12 19:13:49.93501	2017-10-12 19:13:49.93501	2015-04-17	2	16	4	2015	5
2194	1	0	508133	1151769	2027452	2769584	4385809	1193105	1119586	1015575	2781576	2357134	0	0	0	0	0	2017-10-12 19:13:49.943913	2017-10-12 19:13:49.943913	2015-04-18	2	16	4	2015	6
2195	1	0	423444	813013	1173788	3291584	5677104	2642664	1940643	1966844	2300368	2129691	0	0	0	0	0	2017-10-12 19:13:49.952545	2017-10-12 19:13:49.952545	2015-04-19	2	16	4	2015	0
2196	1	0	211722	677511	853664	1996176	1204976	763489	293885	994632	830008	502965	0	0	0	0	0	2017-10-12 19:13:49.961208	2017-10-12 19:13:49.961208	2015-04-20	2	17	4	2015	1
2197	1	0	359928	575884	960372	1784074	3807843	1103382	502636	1033687	746292	622283	0	0	0	0	0	2017-10-12 19:13:49.969916	2017-10-12 19:13:49.969916	2015-04-21	2	17	4	2015	2
2198	1	0	465789	1016267	1814036	2304986	3582852	2405964	1544250	2125314	2107987	2004810	0	0	0	0	0	2017-10-12 19:13:49.97787	2017-10-12 19:13:49.97787	2015-04-22	2	17	4	2015	3
2199	1	0	804544	948515	1920744	1115887	2028439	1339162	1232664	1363327	1217197	2025662	0	0	0	0	0	2017-10-12 19:13:49.985675	2017-10-12 19:13:49.985675	2015-04-23	2	17	4	2015	4
2200	1	0	381100	1219520	1173788	4090918	2862195	3001234	1863925	1534526	2151043	2082191	0	0	0	0	0	2017-10-12 19:13:49.994673	2017-10-12 19:13:49.994673	2015-04-24	2	17	4	2015	5
2201	1	0	846889	1151769	1600620	1440537	6380170	3285242	1023941	2905384	2205045	2312786	0	0	0	0	0	2017-10-12 19:13:50.005437	2017-10-12 19:13:50.005437	2015-04-25	2	17	4	2015	6
2202	1	0	423444	677511	1067080	1898458	4481568	1117204	986527	1207387	4016594	2518974	0	0	0	0	0	2017-10-12 19:13:50.014762	2017-10-12 19:13:50.014762	2015-04-26	2	17	4	2015	0
2203	1	0	381100	542009	640248	2583853	3220285	1126249	670985	561286	996836	373177	0	0	0	0	0	2017-10-12 19:13:50.025166	2017-10-12 19:13:50.025166	2015-04-27	2	18	4	2015	1
2204	1	0	254067	372631	1013726	1488921	3379235	1543430	883456	1235733	1048223	387471	0	0	0	0	0	2017-10-12 19:13:50.034748	2017-10-12 19:13:50.034748	2015-04-28	2	18	4	2015	2
2205	1	0	508133	1287271	960372	3115509	3083230	3387506	973553	2231378	2296151	863119	0	0	0	0	0	2017-10-12 19:13:50.043938	2017-10-12 19:13:50.043938	2015-04-29	2	18	4	2015	3
2206	1	0	465789	880764	1707328	2806693	3278032	2134258	1551995	1289296	1285778	1882257	0	0	0	0	0	2017-10-12 19:13:50.052018	2017-10-12 19:13:50.052018	2015-04-30	2	18	4	2015	4
2207	1	0	804544	745262	1814036	5203716	5885678	1578519	1637637	1884954	2012576	1322632	0	0	0	0	0	2017-10-12 19:13:50.059772	2017-10-12 19:13:50.059772	2015-05-01	2	18	5	2015	5
2208	1	0	0	0	352800	954522	881174	830340	947578	1195260	1314564	1960592	1261149	847066	0	0	0	2017-10-12 19:13:50.068544	2017-10-12 19:13:50.068544	2015-05-02	2	18	5	2015	6
2209	1	0	0	0	396900	678848	869543	1199814	852029	1025951	1537205	2684111	1692880	832037	0	0	0	2017-10-12 19:13:50.077809	2017-10-12 19:13:50.077809	2015-05-03	2	18	5	2015	0
2210	1	0	0	0	198450	463160	671240	1315469	950644	1053429	2370438	1665881	2599096	2099426	0	0	0	2017-10-12 19:13:50.086319	2017-10-12 19:13:50.086319	2015-05-04	2	19	5	2015	1
2211	1	0	0	0	418950	789832	925103	739043	692714	1693584	2164962	1839366	2907701	1114585	0	0	0	2017-10-12 19:13:50.094632	2017-10-12 19:13:50.094632	2015-05-05	2	19	5	2015	2
2212	1	0	0	0	441000	622391	628370	472230	591204	1787918	1622555	1505023	1500697	1600013	0	0	0	2017-10-12 19:13:50.102985	2017-10-12 19:13:50.102985	2015-05-06	2	19	5	2015	3
2213	1	0	0	0	617400	972900	1637423	1520917	2278870	3523684	4404312	3250530	7022530	2434323	0	0	0	2017-10-12 19:13:50.112891	2017-10-12 19:13:50.112891	2015-05-07	2	19	5	2015	4
2214	1	0	0	0	423360	857265	1474396	2111472	1769684	1686555	2226220	3591205	3696690	3431666	0	0	0	2017-10-12 19:13:50.122767	2017-10-12 19:13:50.122767	2015-05-08	2	19	5	2015	5
2215	1	0	0	0	418950	854784	685148	615187	589407	806720	2084314	3080592	1990778	988555	0	0	0	2017-10-12 19:13:50.131029	2017-10-12 19:13:50.131029	2015-05-09	2	19	5	2015	6
2216	1	0	0	0	374850	689112	853039	423359	571341	1712459	1846826	1949639	1418426	823772	0	0	0	2017-10-12 19:13:50.139232	2017-10-12 19:13:50.139232	2015-05-10	2	19	5	2015	0
2217	1	0	0	0	374850	426605	747020	1172048	548150	847449	1423980	2292601	811041	1658086	0	0	0	2017-10-12 19:13:50.147492	2017-10-12 19:13:50.147492	2015-05-11	2	20	5	2015	1
2218	1	0	0	0	308700	419539	1134565	590507	798899	1981870	1917977	2285267	872905	609672	0	0	0	2017-10-12 19:13:50.155806	2017-10-12 19:13:50.155806	2015-05-12	2	20	5	2015	2
2219	1	0	0	0	330750	616102	690880	1398425	1014052	922653	2228065	1544308	1909612	1137013	0	0	0	2017-10-12 19:13:50.166006	2017-10-12 19:13:50.166006	2015-05-13	2	20	5	2015	3
2220	1	0	0	0	617400	965304	2528777	2601067	1914144	2077381	4597964	5506030	4872231	4761458	0	0	0	2017-10-12 19:13:50.174836	2017-10-12 19:13:50.174836	2015-05-14	2	20	5	2015	4
2221	1	0	0	0	352800	429538	570030	1838438	1307709	2259490	1917431	1970203	3473430	3450918	0	0	0	2017-10-12 19:13:50.18367	2017-10-12 19:13:50.18367	2015-05-15	2	20	5	2015	5
2222	1	0	0	0	242550	501023	1122814	426176	943912	812974	2139183	1238921	1991214	1295537	0	0	0	2017-10-12 19:13:50.192916	2017-10-12 19:13:50.192916	2015-05-16	2	20	5	2015	6
2223	1	0	0	0	441000	609774	734258	923970	702235	995036	1219280	1444988	1693304	1528362	0	0	0	2017-10-12 19:13:50.202312	2017-10-12 19:13:50.202312	2015-05-17	2	20	5	2015	0
2224	1	0	0	0	396900	548258	872824	1481368	509134	859694	2335941	1344341	1434760	946065	0	0	0	2017-10-12 19:13:50.21097	2017-10-12 19:13:50.21097	2015-05-18	2	21	5	2015	1
2225	1	0	0	0	220500	450255	377068	740433	658790	732200	2154089	3468956	2588995	702195	0	0	0	2017-10-12 19:13:50.219204	2017-10-12 19:13:50.219204	2015-05-19	2	21	5	2015	2
2226	1	0	0	0	242550	902799	457097	1113293	510709	1339768	1412392	1745287	1328876	718421	0	0	0	2017-10-12 19:13:50.22823	2017-10-12 19:13:50.22823	2015-05-20	2	21	5	2015	3
2227	1	0	0	0	573300	1694985	2149371	943196	1956188	3220885	2908716	3446612	3448355	3087699	0	0	0	2017-10-12 19:13:50.23761	2017-10-12 19:13:50.23761	2015-05-21	2	21	5	2015	4
2228	1	0	0	0	670320	770431	599308	883137	1742061	2195536	3234937	3010626	3611219	2002902	0	0	0	2017-10-12 19:13:50.245953	2017-10-12 19:13:50.245953	2015-05-22	2	21	5	2015	5
2229	1	0	0	0	418950	805113	316459	879304	1253848	876970	1846912	992552	2671740	1027076	0	0	0	2017-10-12 19:13:50.254107	2017-10-12 19:13:50.254107	2015-05-23	2	21	5	2015	6
2230	1	0	0	0	220500	770055	736552	377816	1225688	938568	2248396	1807374	1431244	1001972	0	0	0	2017-10-12 19:13:50.262189	2017-10-12 19:13:50.262189	2015-05-24	2	21	5	2015	0
2231	1	0	0	0	220500	977029	1103082	585962	761116	693450	1062108	1238204	1451848	1051244	0	0	0	2017-10-12 19:13:50.272087	2017-10-12 19:13:50.272087	2015-05-25	2	22	5	2015	1
2232	1	0	0	0	308700	1101829	412682	692580	645427	630491	1751528	2408228	1394885	1267449	0	0	0	2017-10-12 19:13:50.281589	2017-10-12 19:13:50.281589	2015-05-26	2	22	5	2015	2
2233	1	0	0	0	264600	943555	357436	584704	753174	1092972	2197546	1493061	2243472	912103	0	0	0	2017-10-12 19:13:50.29055	2017-10-12 19:13:50.29055	2015-05-27	2	22	5	2015	3
2234	1	0	0	0	573300	1105954	1125125	2508407	1672264	2143984	3487320	4432680	4237204	1583872	0	0	0	2017-10-12 19:13:50.299007	2017-10-12 19:13:50.299007	2015-05-28	2	22	5	2015	4
2235	1	0	0	0	423360	824942	2757260	1188103	2134958	2761415	5854286	2060611	3904775	2373050	0	0	0	2017-10-12 19:13:50.309205	2017-10-12 19:13:50.309205	2015-05-29	2	22	5	2015	5
2236	1	0	0	0	396900	1381272	1516276	799865	1117391	1229594	3779408	3453821	3435370	1883733	0	0	0	2017-10-12 19:13:50.319267	2017-10-12 19:13:50.319267	2015-05-30	2	22	5	2015	6
2237	1	0	0	0	297675	876727	1370034	1400777	879018	1597075	2548837	1527243	3764014	2104322	0	0	0	2017-10-12 19:13:50.328066	2017-10-12 19:13:50.328066	2015-05-31	2	22	5	2015	0
2238	1	0	0	0	297675	495708	860623	819235	1301789	1038575	2319926	2197351	2563830	1622470	0	0	0	2017-10-12 19:13:50.336655	2017-10-12 19:13:50.336655	2015-06-01	2	23	6	2015	1
2239	1	0	0	0	628425	1077918	923158	1476878	1277120	1473803	2741012	2018824	3858704	1541632	0	0	0	2017-10-12 19:13:50.345906	2017-10-12 19:13:50.345906	2015-06-02	2	23	6	2015	2
2240	1	0	0	0	595350	795366	681240	1808878	928910	2423777	2741427	3776400	2735050	1230061	0	0	0	2017-10-12 19:13:50.355103	2017-10-12 19:13:50.355103	2015-06-03	2	23	6	2015	3
2241	1	0	0	0	330750	618057	659651	1168366	1561627	2095675	2189321	5300462	2637543	1833928	0	0	0	2017-10-12 19:13:50.365141	2017-10-12 19:13:50.365141	2015-06-04	2	23	6	2015	4
2242	1	0	0	0	595350	1938114	623347	1336823	1239038	2039561	4916567	3070321	4234689	2763318	0	0	0	2017-10-12 19:13:50.374155	2017-10-12 19:13:50.374155	2015-06-05	2	23	6	2015	5
2243	1	0	0	0	1190700	1241068	1585098	2915320	2548529	4069275	4006837	9871105	5085827	1897104	0	0	0	2017-10-12 19:13:50.382729	2017-10-12 19:13:50.382729	2015-06-06	2	23	6	2015	6
2244	1	0	0	0	846720	1992290	1622416	2673000	2600816	2096844	5779160	5043853	6567578	2737851	0	0	0	2017-10-12 19:13:50.392085	2017-10-12 19:13:50.392085	2015-06-07	2	23	6	2015	0
2245	1	0	0	0	330750	628436	673687	694517	1214966	906977	2305655	2305017	1678922	2571166	0	0	0	2017-10-12 19:13:50.40118	2017-10-12 19:13:50.40118	2015-06-08	2	24	6	2015	1
2246	1	0	0	0	529200	1390766	682569	1179654	823885	2151335	2736876	3504257	2609653	1715001	0	0	0	2017-10-12 19:13:50.410451	2017-10-12 19:13:50.410451	2015-06-09	2	24	6	2015	2
2247	1	0	0	0	396900	1322661	1385206	1446690	523961	1443480	1655018	4180896	2600176	2180716	0	0	0	2017-10-12 19:13:50.419435	2017-10-12 19:13:50.419435	2015-06-10	2	24	6	2015	3
2248	1	0	0	0	595350	689730	626105	1640576	1390494	1300870	3122815	5664536	1518994	1731353	0	0	0	2017-10-12 19:13:50.429603	2017-10-12 19:13:50.429603	2015-06-11	2	24	6	2015	4
2249	1	0	0	0	330750	1098831	775081	1252388	932277	2826395	3426315	4151044	2591940	2439979	0	0	0	2017-10-12 19:13:50.43993	2017-10-12 19:13:50.43993	2015-06-12	2	24	6	2015	5
2250	1	0	0	0	1256850	1599580	2971740	2626141	2473559	2983032	4917968	3766036	6586597	6475943	0	0	0	2017-10-12 19:13:50.451218	2017-10-12 19:13:50.451218	2015-06-13	2	24	6	2015	6
2251	1	0	0	0	635040	2402648	3200510	2549240	2331051	3106954	5596240	8926698	7858959	2901895	0	0	0	2017-10-12 19:13:50.460045	2017-10-12 19:13:50.460045	2015-06-14	2	24	6	2015	0
2252	1	0	0	0	363825	529709	727529	1962822	1461694	1193063	2478675	1445153	2240046	1424347	0	0	0	2017-10-12 19:13:50.469269	2017-10-12 19:13:50.469269	2015-06-15	2	25	6	2015	1
2253	1	0	0	0	330750	1800220	946901	993840	856568	2321678	1597106	1973182	2473959	1884043	0	0	0	2017-10-12 19:13:50.478228	2017-10-12 19:13:50.478228	2015-06-16	2	25	6	2015	2
2254	1	0	0	0	363825	437930	1109313	1659618	1040502	2056610	2041265	1846757	2612539	1265540	0	0	0	2017-10-12 19:13:50.487418	2017-10-12 19:13:50.487418	2015-06-17	2	25	6	2015	3
2255	1	0	0	0	297675	889360	1019233	1880637	1101272	1841179	1045071	1908799	2075017	2080625	0	0	0	2017-10-12 19:13:50.498106	2017-10-12 19:13:50.498106	2015-06-18	2	25	6	2015	4
2256	1	0	0	0	363825	593759	1467573	866360	1335489	2874956	4217994	2014601	2477618	1699466	0	0	0	2017-10-12 19:13:50.5071	2017-10-12 19:13:50.5071	2015-06-19	2	25	6	2015	5
2257	1	0	0	0	859950	2907141	1631633	2247409	2487993	4948005	4588367	7884741	6645170	2653553	0	0	0	2017-10-12 19:13:50.517016	2017-10-12 19:13:50.517016	2015-06-20	2	25	6	2015	6
2258	1	0	0	0	687960	1272597	1770765	3907294	2066758	2735336	3474627	7633624	7404504	3082796	0	0	0	2017-10-12 19:13:50.525893	2017-10-12 19:13:50.525893	2015-06-21	2	25	6	2015	0
2259	1	0	0	0	330750	1095322	1883309	1332470	1547828	2119492	3565752	2299074	2843703	1329476	0	0	0	2017-10-12 19:13:50.534371	2017-10-12 19:13:50.534371	2015-06-22	2	26	6	2015	1
2260	1	0	0	0	363825	1230242	693359	1742673	1460419	2397713	3684135	4360746	2804805	970501	0	0	0	2017-10-12 19:13:50.545703	2017-10-12 19:13:50.545703	2015-06-23	2	26	6	2015	2
2261	1	0	0	0	496125	1621638	1293925	1034265	987367	1737991	2598545	4236187	2189561	960287	0	0	0	2017-10-12 19:13:50.555479	2017-10-12 19:13:50.555479	2015-06-24	2	26	6	2015	3
2262	1	0	0	0	363825	650069	1091481	1032291	1209886	1543469	2402098	3530261	2567240	2205913	0	0	0	2017-10-12 19:13:50.563941	2017-10-12 19:13:50.563941	2015-06-25	2	26	6	2015	4
2263	1	0	0	0	562275	1226060	1506491	1175938	1297734	3102077	1538319	3177315	4940532	2149419	0	0	0	2017-10-12 19:13:50.572758	2017-10-12 19:13:50.572758	2015-06-26	2	26	6	2015	5
2264	1	0	0	0	1190700	1973510	2824207	2386336	1894009	3821093	8055858	7875041	7086761	4070078	0	0	0	2017-10-12 19:13:50.581132	2017-10-12 19:13:50.581132	2015-06-27	2	26	6	2015	6
2265	1	0	0	0	846720	689666	1500984	2067642	1333113	2560612	4844694	4064054	10044399	1949463	0	0	0	2017-10-12 19:13:50.589951	2017-10-12 19:13:50.589951	2015-06-28	2	26	6	2015	0
2266	1	0	0	0	297675	1297993	1349076	768041	1525106	1744934	3596677	2421682	1629468	1827663	0	0	0	2017-10-12 19:13:50.59929	2017-10-12 19:13:50.59929	2015-06-29	2	27	6	2015	1
2267	1	0	0	0	330750	804446	1679682	1612610	1036954	2352080	3370822	2268804	2137471	2092114	0	0	0	2017-10-12 19:13:50.608143	2017-10-12 19:13:50.608143	2015-06-30	2	27	6	2015	2
2268	1	0	0	0	529200	1158071	1207690	1065965	887114	1493624	1540625	2073796	2168156	2209542	0	0	0	2017-10-12 19:13:50.616056	2017-10-12 19:13:50.616056	2015-07-01	2	27	7	2015	3
2269	1	0	366985	813013	640248	1927771	1910317	1189211	611457	1346690	1486562	1470670	0	0	0	0	0	2017-10-12 19:13:50.624983	2017-10-12 19:13:50.624983	2015-07-02	2	27	7	2015	4
2270	1	0	366985	722678	640248	2217035	1883722	1400441	435941	1540385	1158927	626462	0	0	0	0	0	2017-10-12 19:13:50.636347	2017-10-12 19:13:50.636347	2015-07-03	2	27	7	2015	5
2271	1	0	451674	858181	995942	1626396	2610256	1479438	802481	1317334	2060643	1130713	0	0	0	0	0	2017-10-12 19:13:50.646831	2017-10-12 19:13:50.646831	2015-07-04	2	27	7	2015	6
2272	1	0	310526	451674	782526	838361	4300619	788098	667600	1359128	2197143	1752169	0	0	0	0	0	2017-10-12 19:13:50.656975	2017-10-12 19:13:50.656975	2015-07-05	2	27	7	2015	0
2273	1	0	183493	225837	640247	1077056	827257	569405	355863	918822	447100	590610	0	0	0	0	0	2017-10-12 19:13:50.666109	2017-10-12 19:13:50.666109	2015-07-06	2	28	7	2015	1
2274	1	0	197607	293588	426832	628929	2062892	900152	441634	430991	905539	428631	0	0	0	0	0	2017-10-12 19:13:50.675175	2017-10-12 19:13:50.675175	2015-07-07	2	28	7	2015	2
2275	1	0	282296	632344	1280497	1752152	2324174	909389	943073	1141326	2110780	611970	0	0	0	0	0	2017-10-12 19:13:50.684247	2017-10-12 19:13:50.684247	2015-07-08	2	28	7	2015	3
2276	1	0	423444	632344	1422774	2402187	2919363	2028434	960002	818009	1418528	828379	0	0	0	0	0	2017-10-12 19:13:50.694651	2017-10-12 19:13:50.694651	2015-07-09	2	28	7	2015	4
2277	1	0	338756	722678	1422774	2330759	1755745	1599309	467385	2060296	1397050	765878	0	0	0	0	0	2017-10-12 19:13:50.70401	2017-10-12 19:13:50.70401	2015-07-10	2	28	7	2015	5
2278	1	0	395215	632344	711387	1682883	2429832	890041	1179016	638522	2427428	1120373	0	0	0	0	0	2017-10-12 19:13:50.712873	2017-10-12 19:13:50.712873	2015-07-11	2	28	7	2015	6
2279	1	0	508133	858181	1209358	2591303	3685631	1415234	780914	1270291	1734200	1363604	0	0	0	0	0	2017-10-12 19:13:50.723548	2017-10-12 19:13:50.723548	2015-07-12	2	28	7	2015	0
2280	1	0	225837	316172	320124	1173312	498298	979764	367732	515413	503650	608008	0	0	0	0	0	2017-10-12 19:13:50.739506	2017-10-12 19:13:50.739506	2015-07-13	2	29	7	2015	1
2281	1	0	155263	203253	711386	1232220	1182150	434682	515957	517910	481129	377699	0	0	0	0	0	2017-10-12 19:13:50.750065	2017-10-12 19:13:50.750065	2015-07-14	2	29	7	2015	2
2282	1	0	366985	677511	1422774	2055295	1704126	1213584	667380	1497537	2190504	1405076	0	0	0	0	0	2017-10-12 19:13:50.76135	2017-10-12 19:13:50.76135	2015-07-15	2	29	7	2015	3
2283	1	0	254067	542009	853664	2837228	1544437	2160822	1227303	1649286	1108728	1077275	0	0	0	0	0	2017-10-12 19:13:50.770692	2017-10-12 19:13:50.770692	2015-07-16	2	29	7	2015	4
2284	1	0	479904	542009	711387	1384657	3484006	899697	1127686	1127665	1341520	1247949	0	0	0	0	0	2017-10-12 19:13:50.779392	2017-10-12 19:13:50.779392	2015-07-17	2	29	7	2015	5
2285	1	0	508133	451674	711387	914372	872224	902624	856643	979655	1339986	830058	0	0	0	0	0	2017-10-12 19:13:50.788609	2017-10-12 19:13:50.788609	2015-07-18	2	29	7	2015	6
2286	1	0	338756	813013	853664	2407105	2452346	1559340	784780	1262214	1958019	620563	0	0	0	0	0	2017-10-12 19:13:50.798564	2017-10-12 19:13:50.798564	2015-07-19	2	29	7	2015	0
2287	1	0	197607	451674	426832	679668	1950576	497728	276956	373133	744200	660440	0	0	0	0	0	2017-10-12 19:13:50.808129	2017-10-12 19:13:50.808129	2015-07-20	2	30	7	2015	1
2288	1	0	155263	451674	533540	1034111	775520	718015	646929	795194	651447	448518	0	0	0	0	0	2017-10-12 19:13:50.818115	2017-10-12 19:13:50.818115	2015-07-21	2	30	7	2015	2
2289	1	0	423444	813013	1138219	2887760	4745079	1360876	402860	1613848	964590	907234	0	0	0	0	0	2017-10-12 19:13:50.827017	2017-10-12 19:13:50.827017	2015-07-22	2	30	7	2015	3
2290	1	0	564593	813013	995942	1573100	1090200	1626640	542037	1645482	1323117	727692	0	0	0	0	0	2017-10-12 19:13:50.835943	2017-10-12 19:13:50.835943	2015-07-23	2	30	7	2015	4
2291	1	0	508133	722678	1280497	1882645	4550100	1119051	923343	1478399	1530115	693152	0	0	0	0	0	2017-10-12 19:13:50.845376	2017-10-12 19:13:50.845376	2015-07-24	2	30	7	2015	5
2292	1	0	479904	903348	782526	2307912	1184460	1488376	665410	811725	1256636	985086	0	0	0	0	0	2017-10-12 19:13:50.85415	2017-10-12 19:13:50.85415	2015-07-25	2	30	7	2015	6
2293	1	0	395215	722678	1209358	1630224	3174632	686962	788984	1343888	2301617	670506	0	0	0	0	0	2017-10-12 19:13:50.864281	2017-10-12 19:13:50.864281	2015-07-26	2	30	7	2015	0
2294	1	0	197607	406507	497970	1033078	793727	510384	459874	363226	605040	342086	0	0	0	0	0	2017-10-12 19:13:50.873308	2017-10-12 19:13:50.873308	2015-07-27	2	31	7	2015	1
2295	1	0	268181	293588	711386	1834695	1289866	528878	345123	628875	338558	300160	0	0	0	0	0	2017-10-12 19:13:50.884819	2017-10-12 19:13:50.884819	2015-07-28	2	31	7	2015	2
2296	1	0	479904	903348	853664	1899568	2045713	1036129	1125081	1588920	1053328	571948	0	0	0	0	0	2017-10-12 19:13:50.895267	2017-10-12 19:13:50.895267	2015-07-29	2	31	7	2015	3
2297	1	0	423444	722678	995942	916923	5327135	703803	583629	1491959	1241461	659049	0	0	0	0	0	2017-10-12 19:13:50.904464	2017-10-12 19:13:50.904464	2015-07-30	2	31	7	2015	4
2298	1	0	366985	813013	711387	2964672	1705024	705415	678893	1480450	878518	689506	0	0	0	0	0	2017-10-12 19:13:50.917611	2017-10-12 19:13:50.917611	2015-07-31	2	31	7	2015	5
2299	1	0	846889	880764	2134160	3265027	4755857	1833765	632187	1869824	2447819	1153319	0	0	0	0	0	2017-10-12 19:13:50.930142	2017-10-12 19:13:50.930142	2015-08-01	2	31	8	2015	6
2300	1	0	804544	948515	1600620	1343140	5555886	1514553	1252479	1447757	3341059	1629103	0	0	0	0	0	2017-10-12 19:13:50.942696	2017-10-12 19:13:50.942696	2015-08-02	2	31	8	2015	0
2301	1	0	719855	948515	1067080	2202226	2814870	1916494	1590297	1342128	1609365	1209875	0	0	0	0	0	2017-10-12 19:13:50.953065	2017-10-12 19:13:50.953065	2015-08-03	2	32	8	2015	1
2302	1	0	635167	813013	1493912	2241706	4437214	1800520	1627262	2292686	1041232	2443106	0	0	0	0	0	2017-10-12 19:13:50.963982	2017-10-12 19:13:50.963982	2015-08-04	2	32	8	2015	2
2303	1	0	211722	508133	907018	1336352	1835521	878766	742656	767569	825496	315547	0	0	0	0	0	2017-10-12 19:13:50.974713	2017-10-12 19:13:50.974713	2015-08-05	2	32	8	2015	3
2304	1	0	211722	508133	1067080	2363577	1481905	486316	556556	758514	744737	484898	0	0	0	0	0	2017-10-12 19:13:50.984458	2017-10-12 19:13:50.984458	2015-08-06	2	32	8	2015	4
2305	1	0	381100	1084018	1814036	1985079	3364629	1595881	1401541	2927007	3968236	1987565	0	0	0	0	0	2017-10-12 19:13:50.99378	2017-10-12 19:13:50.99378	2015-08-07	2	32	8	2015	5
2306	1	0	465789	1355022	1600620	4311770	4527283	908817	1003539	2538550	1148308	1727583	0	0	0	0	0	2017-10-12 19:13:51.002081	2017-10-12 19:13:51.002081	2015-08-08	2	32	8	2015	6
2307	1	0	677511	1355022	2027452	3486098	6969842	2348586	920983	1757668	2751702	1440686	0	0	0	0	0	2017-10-12 19:13:51.010414	2017-10-12 19:13:51.010414	2015-08-09	2	32	8	2015	0
2308	1	0	550478	813013	1707328	3053677	2817930	2476912	1555426	2219094	1839528	1811349	0	0	0	0	0	2017-10-12 19:13:51.018354	2017-10-12 19:13:51.018354	2015-08-10	2	33	8	2015	1
2309	1	0	677511	948515	1707328	2292560	2736950	1161093	631460	2444636	1333351	1060072	0	0	0	0	0	2017-10-12 19:13:51.028941	2017-10-12 19:13:51.028941	2015-08-11	2	33	8	2015	2
2310	1	0	296411	643635	853664	1352481	3167120	827161	556944	1414675	641783	705164	0	0	0	0	0	2017-10-12 19:13:51.040073	2017-10-12 19:13:51.040073	2015-08-12	2	33	8	2015	3
2311	1	0	190550	575884	907018	667764	1591046	1520486	964724	731153	1005298	460342	0	0	0	0	0	2017-10-12 19:13:51.049094	2017-10-12 19:13:51.049094	2015-08-13	2	33	8	2015	4
2312	1	0	762200	1016267	1600620	2780352	6534214	1885426	2081577	2436345	1784002	2278571	0	0	0	0	0	2017-10-12 19:13:51.057852	2017-10-12 19:13:51.057852	2015-08-14	2	33	8	2015	5
2313	1	0	762200	880764	1600620	4489098	3307762	2156972	1326803	1019276	1588269	1436283	0	0	0	0	0	2017-10-12 19:13:51.066442	2017-10-12 19:13:51.066442	2015-08-15	2	33	8	2015	6
2314	1	0	381100	609760	2134160	2638955	2875338	2939416	1158888	1290335	2501972	1151635	0	0	0	0	0	2017-10-12 19:13:51.077991	2017-10-12 19:13:51.077991	2015-08-16	2	33	8	2015	0
2315	1	0	635167	1287271	1814036	2478049	5397918	1988508	1119586	1726478	2008916	2109015	0	0	0	0	0	2017-10-12 19:13:51.087756	2017-10-12 19:13:51.087756	2015-08-17	2	34	8	2015	1
2316	1	0	635167	948515	1814036	2992349	5322285	1849865	1940643	1966844	3345990	1569246	0	0	0	0	0	2017-10-12 19:13:51.097308	2017-10-12 19:13:51.097308	2015-08-18	2	34	8	2015	2
2317	1	0	254067	609760	586894	1896367	979043	1179938	457155	932468	788508	594413	0	0	0	0	0	2017-10-12 19:13:51.106658	2017-10-12 19:13:51.106658	2015-08-19	2	34	8	2015	3
2318	1	0	423444	609760	480186	1516463	2004128	827537	646247	1402861	597034	755630	0	0	0	0	0	2017-10-12 19:13:51.115266	2017-10-12 19:13:51.115266	2015-08-20	2	34	8	2015	4
2319	1	0	762200	948515	1280496	2817205	7165704	3047554	1381697	3106228	1932322	1179300	0	0	0	0	0	2017-10-12 19:13:51.124227	2017-10-12 19:13:51.124227	2015-08-21	2	34	8	2015	5
2320	1	0	804544	1084018	2027452	1611836	1690366	2231937	1327484	1265947	2213086	1072409	0	0	0	0	0	2017-10-12 19:13:51.133088	2017-10-12 19:13:51.133088	2015-08-22	2	34	8	2015	6
2321	1	0	846889	1084018	1493912	4090918	2289756	3159194	2071028	2173912	1195024	1095890	0	0	0	0	0	2017-10-12 19:13:51.141981	2017-10-12 19:13:51.141981	2015-08-23	2	34	8	2015	0
2322	1	0	635167	609760	960372	3041134	6380170	3285242	1023941	1775512	1929414	1503311	0	0	0	0	0	2017-10-12 19:13:51.150952	2017-10-12 19:13:51.150952	2015-08-24	2	35	8	2015	1
2323	1	0	635167	1016267	960372	2531277	2830464	1564086	1614317	2146466	2748196	1988664	0	0	0	0	0	2017-10-12 19:13:51.159337	2017-10-12 19:13:51.159337	2015-08-25	2	35	8	2015	2
2324	1	0	296411	372631	533540	2296758	3824088	625694	623058	608059	1352849	456105	0	0	0	0	0	2017-10-12 19:13:51.167624	2017-10-12 19:13:51.167624	2015-08-26	2	35	8	2015	3
2325	1	0	423444	643635	800310	992614	2782899	771715	883456	1081266	1257867	352246	0	0	0	0	0	2017-10-12 19:13:51.176151	2017-10-12 19:13:51.176151	2015-08-27	2	35	8	2015	4
2326	1	0	592822	1287271	960372	4248422	3083230	3218131	778842	1561965	3061534	1294679	0	0	0	0	0	2017-10-12 19:13:51.185718	2017-10-12 19:13:51.185718	2015-08-28	2	35	8	2015	5
2327	1	0	465789	745262	1493912	2962621	1802918	1707406	1939994	1289296	1071482	1550094	0	0	0	0	0	2017-10-12 19:13:51.195063	2017-10-12 19:13:51.195063	2015-08-29	2	35	8	2015	6
2328	1	0	635167	1016267	2134160	2601858	5100921	1736371	1551445	1295906	2124386	1543070	0	0	0	0	0	2017-10-12 19:13:51.203886	2017-10-12 19:13:51.203886	2015-08-30	2	35	8	2015	0
2329	1	0	0	0	220500	954522	495661	1126890	748088	1011374	1502358	1198140	1639494	907571	0	0	0	2017-10-12 19:13:51.212811	2017-10-12 19:13:51.212811	2015-08-31	2	36	8	2015	1
2330	1	0	0	0	286650	577021	1106692	757777	479266	1025951	1281005	3041992	1185016	832037	0	0	0	2017-10-12 19:13:51.223406	2017-10-12 19:13:51.223406	2015-09-01	2	36	9	2015	2
2331	1	0	0	0	330750	354181	750209	1096224	570386	1458594	2091563	2110115	2209232	2099426	0	0	0	2017-10-12 19:13:51.23398	2017-10-12 19:13:51.23398	2015-09-02	2	36	9	2015	3
2332	1	0	0	0	264600	355424	853942	508092	822597	1100830	2742285	1947564	2601627	1722540	0	0	0	2017-10-12 19:13:51.242811	2017-10-12 19:13:51.242811	2015-09-03	2	36	9	2015	4
2333	1	0	0	0	396900	577935	314185	996930	859933	1092617	1527110	2325945	1500697	1788250	0	0	0	2017-10-12 19:13:51.250862	2017-10-12 19:13:51.250862	2015-09-04	2	36	9	2015	5
2334	1	0	0	0	529200	1030129	1500971	1169936	2278870	3719444	5872416	2500408	4564645	2890759	0	0	0	2017-10-12 19:13:51.258772	2017-10-12 19:13:51.258772	2015-09-05	2	36	9	2015	6
2335	1	0	0	0	388080	1285898	1685024	1266883	1415747	1581146	1855183	3591205	6161150	2402166	0	0	0	2017-10-12 19:13:51.268532	2017-10-12 19:13:51.268532	2015-09-06	2	36	9	2015	0
2336	1	0	0	0	308700	726566	1065785	615187	589407	806720	1839101	2117907	2342092	1318074	0	0	0	2017-10-12 19:13:51.277429	2017-10-12 19:13:51.277429	2015-09-07	2	37	9	2015	1
2337	1	0	0	0	396900	421124	1279559	423359	530531	1813192	1420635	2099611	2127640	1235659	0	0	0	2017-10-12 19:13:51.286829	2017-10-12 19:13:51.286829	2015-09-08	2	37	9	2015	2
2338	1	0	0	0	220500	404152	622517	805783	730867	1463775	1613844	2292601	901157	1554456	0	0	0	2017-10-12 19:13:51.296293	2017-10-12 19:13:51.296293	2015-09-09	2	37	9	2015	3
2339	1	0	0	0	220500	587355	1347296	499660	798899	1684590	1278651	2988427	1110970	609672	0	0	0	2017-10-12 19:13:51.308273	2017-10-12 19:13:51.308273	2015-09-10	2	37	9	2015	4
2340	1	0	0	0	286650	410735	498969	1030418	788707	1277519	1289933	1654616	1814131	874625	0	0	0	2017-10-12 19:13:51.31805	2017-10-12 19:13:51.31805	2015-09-11	2	37	9	2015	5
2341	1	0	0	0	749700	794956	1785019	1300533	1410422	1947545	2528880	3854221	4122657	3333021	0	0	0	2017-10-12 19:13:51.326553	2017-10-12 19:13:51.326553	2015-09-12	2	37	9	2015	6
2342	1	0	0	0	635040	536922	886714	1149024	1810674	2140569	4047910	1791094	5210145	2415643	0	0	0	2017-10-12 19:13:51.335515	2017-10-12 19:13:51.335515	2015-09-13	2	37	9	2015	0
2343	1	0	0	0	441000	367417	505266	387433	741645	975569	1576240	1789553	1493411	1151589	0	0	0	2017-10-12 19:13:51.344569	2017-10-12 19:13:51.344569	2015-09-14	2	38	9	2015	1
2344	1	0	0	0	264600	487819	944046	632190	585196	995036	1761182	1857841	1354643	1935925	0	0	0	2017-10-12 19:13:51.353361	2017-10-12 19:13:51.353361	2015-09-15	2	38	9	2015	2
2345	1	0	0	0	396900	365505	952171	666616	509134	1633419	1605959	1588766	2032576	1720118	0	0	0	2017-10-12 19:13:51.362122	2017-10-12 19:13:51.362122	2015-09-16	2	38	9	2015	3
2346	1	0	0	0	352800	611061	502757	493622	1185822	549150	2407511	1734478	1907681	1026285	0	0	0	2017-10-12 19:13:51.370397	2017-10-12 19:13:51.370397	2015-09-17	2	38	9	2015	4
2347	1	0	0	0	198450	690375	609463	1175142	1134908	1410282	1059294	1745287	1613635	1357018	0	0	0	2017-10-12 19:13:51.378863	2017-10-12 19:13:51.378863	2015-09-18	2	38	9	2015	5
2348	1	0	0	0	882000	2259980	1809997	1697753	2654826	2463029	1745230	4185172	2873629	2894718	0	0	0	2017-10-12 19:13:51.387471	2017-10-12 19:13:51.387471	2015-09-19	2	38	9	2015	6
2349	1	0	0	0	599760	948222	980685	1043708	1858198	2317510	2940852	4168559	4814958	1287580	0	0	0	2017-10-12 19:13:51.396353	2017-10-12 19:13:51.396353	2015-09-20	2	38	9	2015	0
2350	1	0	0	0	264600	715656	379751	1245680	1003078	1435041	1385184	1433686	1736631	1129784	0	0	0	2017-10-12 19:13:51.404289	2017-10-12 19:13:51.404289	2015-09-21	2	39	9	2015	1
2351	1	0	0	0	396900	667381	1138308	453379	885219	1689422	2645172	3253273	1329012	1068770	0	0	0	2017-10-12 19:13:51.412963	2017-10-12 19:13:51.412963	2015-09-22	2	39	9	2015	2
2352	1	0	0	0	220500	488515	583985	846390	936758	1232800	1298132	2063674	1742218	1433514	0	0	0	2017-10-12 19:13:51.421045	2017-10-12 19:13:51.421045	2015-09-23	2	39	9	2015	3
2353	1	0	0	0	286650	918191	504390	981155	1114829	630491	2627293	2046994	1673862	1462442	0	0	0	2017-10-12 19:13:51.429961	2017-10-12 19:13:51.429961	2015-09-24	2	39	9	2015	4
2354	1	0	0	0	418950	471777	357436	877055	414246	1291694	1785506	2156644	1682604	1064120	0	0	0	2017-10-12 19:13:51.439004	2017-10-12 19:13:51.439004	2015-09-25	2	39	9	2015	5
2355	1	0	0	0	529200	1105954	1875208	1980321	792125	3573306	2490943	3750729	3852004	1187904	0	0	0	2017-10-12 19:13:51.447392	2017-10-12 19:13:51.447392	2015-09-26	2	39	9	2015	6
2356	1	0	0	0	670320	1015314	2604079	2244194	1685493	2274107	4621805	3709100	3346950	1542483	0	0	0	2017-10-12 19:13:51.456676	2017-10-12 19:13:51.456676	2015-09-27	2	39	9	2015	0
2357	1	0	0	0	628425	1035954	1516276	1133142	1042898	2123845	3978324	3166002	2290247	1738830	0	0	0	2017-10-12 19:13:51.465206	2017-10-12 19:13:51.465206	2015-09-28	2	40	9	2015	1
2358	1	0	0	0	562275	1011608	1370034	737251	1255740	1140768	1799179	2715099	3764014	1772061	0	0	0	2017-10-12 19:13:51.473781	2017-10-12 19:13:51.473781	2015-09-29	2	40	9	2015	2
2359	1	0	0	0	628425	702253	595816	1489518	918910	1471314	2029936	2028324	3076596	1014044	0	0	0	2017-10-12 19:13:51.482335	2017-10-12 19:13:51.482335	2015-09-30	2	40	9	2015	3
2360	1	0	0	0	661500	808439	519277	1303128	1964800	884282	3162707	2624471	3249435	1541632	0	0	0	2017-10-12 19:13:51.491297	2017-10-12 19:13:51.491297	2015-10-01	2	40	10	2015	4
2361	1	0	0	0	330750	673002	827220	1383260	2064244	1913508	3720508	2832300	1975314	946201	0	0	0	2017-10-12 19:13:51.500332	2017-10-12 19:13:51.500332	2015-10-02	2	40	10	2015	5
2362	1	0	0	0	429975	686730	1465892	876275	1469766	1833716	3368186	2789717	2637543	1146205	0	0	0	2017-10-12 19:13:51.508867	2017-10-12 19:13:51.508867	2015-10-03	2	40	10	2015	6
2363	1	0	0	0	363825	1453586	900390	1893832	1115134	1903590	3622734	1705734	3058387	2072489	0	0	0	2017-10-12 19:13:51.516776	2017-10-12 19:13:51.516776	2015-10-04	2	40	10	2015	0
2364	1	0	0	0	1256850	1103171	2194751	1781584	3398038	4069275	6010256	10967894	3051496	3794208	0	0	0	2017-10-12 19:13:51.524766	2017-10-12 19:13:51.524766	2015-10-05	2	41	10	2015	1
2365	1	0	0	0	899640	2102973	1352013	3289846	2438265	1797295	6083326	5043853	8913141	2240060	0	0	0	2017-10-12 19:13:51.532739	2017-10-12 19:13:51.532739	2015-10-06	2	41	10	2015	2
2366	1	0	0	0	463050	698262	962410	1157528	867833	816279	3144075	3585582	2425110	2706490	0	0	0	2017-10-12 19:13:51.54117	2017-10-12 19:13:51.54117	2015-10-07	2	41	10	2015	3
2367	1	0	0	0	429975	927178	577558	766775	1140764	2277884	1296415	2503041	1957240	1837502	0	0	0	2017-10-12 19:13:51.549862	2017-10-12 19:13:51.549862	2015-10-08	2	41	10	2015	4
2368	1	0	0	0	463050	881774	1682036	1736028	1106140	1443480	1241264	4180896	2455721	2803777	0	0	0	2017-10-12 19:13:51.558622	2017-10-12 19:13:51.558622	2015-10-09	2	41	10	2015	5
2369	1	0	0	0	529200	655244	853779	949807	1297794	1901271	2020645	3398722	2362879	1731353	0	0	0	2017-10-12 19:13:51.567068	2017-10-12 19:13:51.567068	2015-10-10	2	41	10	2015	6
2370	1	0	0	0	496125	1040998	861201	1669851	1491643	2473096	2899190	4151044	2591940	2583508	0	0	0	2017-10-12 19:13:51.575231	2017-10-12 19:13:51.575231	2015-10-11	2	41	10	2015	0
2371	1	0	0	0	1256850	1732878	2431424	2063397	1692435	4048400	5901562	4184484	5811704	7195492	0	0	0	2017-10-12 19:13:51.584903	2017-10-12 19:13:51.584903	2015-10-12	2	42	10	2015	1
2372	1	0	0	0	687960	1952152	3200510	1799464	3406920	2174868	4608668	8456872	10277100	1865504	0	0	0	2017-10-12 19:13:51.593892	2017-10-12 19:13:51.593892	2015-10-13	2	42	10	2015	2
2373	1	0	0	0	429975	577865	1293384	1668399	1357287	954450	1770482	1445153	1581209	1068260	0	0	0	2017-10-12 19:13:51.602428	2017-10-12 19:13:51.602428	2015-10-14	2	42	10	2015	3
2374	1	0	0	0	628425	1515974	860819	807495	1142091	1596154	3016755	2762455	3615786	1766291	0	0	0	2017-10-12 19:13:51.611009	2017-10-12 19:13:51.611009	2015-10-15	2	42	10	2015	4
2375	1	0	0	0	529200	700688	1450641	1880900	1224120	1413919	2154668	2308446	2411574	2671696	0	0	0	2017-10-12 19:13:51.619179	2017-10-12 19:13:51.619179	2015-10-16	2	42	10	2015	5
2376	1	0	0	0	330750	732414	1613786	1781656	1101272	1150737	1509547	2255854	4611148	1204573	0	0	0	2017-10-12 19:13:51.628633	2017-10-12 19:13:51.628633	2015-10-17	2	42	10	2015	6
2377	1	0	0	0	496125	742199	1761088	1181400	1335489	1581226	3969877	3357669	2928094	2643614	0	0	0	2017-10-12 19:13:51.638164	2017-10-12 19:13:51.638164	2015-10-18	2	42	10	2015	0
2378	1	0	0	0	1124550	1377067	1129592	2593164	2780698	3298670	8717897	9461689	3322585	4245685	0	0	0	2017-10-12 19:13:51.646699	2017-10-12 19:13:51.646699	2015-10-19	2	43	10	2015	1
2379	1	0	0	0	529200	1619668	2253700	3125835	2861665	3419171	3011343	4771015	5553378	3493835	0	0	0	2017-10-12 19:13:51.655517	2017-10-12 19:13:51.655517	2015-10-20	2	43	10	2015	2
2380	1	0	0	0	363825	644307	1661744	1947456	696523	1122084	3030889	2134855	1706222	1240844	0	0	0	2017-10-12 19:13:51.663978	2017-10-12 19:13:51.663978	2015-10-21	2	43	10	2015	3
2381	1	0	0	0	661500	1230242	600911	1230122	1369143	2664126	2383852	2907164	2144851	1676321	0	0	0	2017-10-12 19:13:51.672828	2017-10-12 19:13:51.672828	2015-10-22	2	43	10	2015	4
2382	1	0	0	0	661500	1621638	1094860	1965104	987367	1489706	2815090	4471530	1702992	1387081	0	0	0	2017-10-12 19:13:51.681414	2017-10-12 19:13:51.681414	2015-10-23	2	43	10	2015	5
2383	1	0	0	0	396900	464335	1343362	884821	1613181	1457721	2402098	2491949	1925430	2595192	0	0	0	2017-10-12 19:13:51.690848	2017-10-12 19:13:51.690848	2015-10-24	2	43	10	2015	6
2384	1	0	0	0	396900	875757	1606923	1175938	956225	3265344	3418486	4024599	4420476	2006124	0	0	0	2017-10-12 19:13:51.698905	2017-10-12 19:13:51.698905	2015-10-25	2	43	10	2015	0
2385	1	0	0	0	1190700	2220199	2420749	3120593	2238374	3821093	7207873	4812525	8605352	5635492	0	0	0	2017-10-12 19:13:51.706978	2017-10-12 19:13:51.706978	2015-10-26	2	44	10	2015	1
2386	1	0	0	0	846720	1241399	1324398	3101463	2132981	4096979	3460496	6321862	6872484	1949463	0	0	0	2017-10-12 19:13:51.715521	2017-10-12 19:13:51.715521	2015-10-27	2	44	10	2015	2
2387	1	0	0	0	363825	1161362	1245301	1450744	1794242	1512276	2839482	2421682	1222101	2193196	0	0	0	2017-10-12 19:13:51.724902	2017-10-12 19:13:51.724902	2015-10-28	2	44	10	2015	3
2388	1	0	0	0	529200	603335	1439728	1310245	1158949	1856906	2996286	2949445	1748840	1230655	0	0	0	2017-10-12 19:13:51.733451	2017-10-12 19:13:51.733451	2015-10-29	2	44	10	2015	4
2389	1	0	0	0	396900	926456	1086921	1841212	887114	1792348	2002813	1866416	1530463	1860667	0	0	0	2017-10-12 19:13:51.742146	2017-10-12 19:13:51.742146	2015-10-30	2	44	10	2015	5
2390	1	0	395215	496841	640248	2453527	1460831	1729762	524106	673345	955647	1470670	0	0	0	0	0	2017-10-12 19:13:51.750967	2017-10-12 19:13:51.750967	2015-10-31	2	44	10	2015	6
2391	1	0	451674	813013	1138219	2808244	2260466	2154524	784694	1650413	1274820	1025120	0	0	0	0	0	2017-10-12 19:13:51.75991	2017-10-12 19:13:51.75991	2015-11-01	2	44	11	2015	0
2392	1	0	564593	677511	924803	1283997	2811045	813691	802481	1129144	1545482	864663	0	0	0	0	0	2017-10-12 19:13:51.768675	2017-10-12 19:13:51.768675	2015-11-02	2	45	11	2015	1
2393	1	0	508133	677511	924803	1143219	3035731	716453	1268440	1456209	1098572	829975	0	0	0	0	0	2017-10-12 19:13:51.777321	2017-10-12 19:13:51.777321	2015-11-03	2	45	11	2015	2
2394	1	0	169378	248421	675817	933448	1406337	535910	569381	413470	794845	561080	0	0	0	0	0	2017-10-12 19:13:51.785455	2017-10-12 19:13:51.785455	2015-11-04	2	45	11	2015	3
2395	1	0	127033	248421	426832	369958	1456159	741301	255683	387892	905539	342905	0	0	0	0	0	2017-10-12 19:13:51.793423	2017-10-12 19:13:51.793423	2015-11-05	2	45	11	2015	4
2396	1	0	451674	542009	711387	2725570	3357140	1030640	776649	1141326	2483270	673167	0	0	0	0	0	2017-10-12 19:13:51.801306	2017-10-12 19:13:51.801306	2015-11-06	2	45	11	2015	5
2397	1	0	451674	542009	924803	2252051	3308611	1622747	1080002	818009	1300318	1104505	0	0	0	0	0	2017-10-12 19:13:51.81033	2017-10-12 19:13:51.81033	2015-11-07	2	45	11	2015	6
2398	1	0	564593	587176	1209358	2330759	2458043	1787463	849790	2060296	1561409	1191366	0	0	0	0	0	2017-10-12 19:13:51.819892	2017-10-12 19:13:51.819892	2015-11-08	2	45	11	2015	0
2399	1	0	282296	677511	1067081	1682883	1619888	1335062	851512	1418938	1092343	1252182	0	0	0	0	0	2017-10-12 19:13:51.830258	2017-10-12 19:13:51.830258	2015-11-09	2	46	11	2015	1
2400	1	0	338756	496841	1422774	2245796	2457088	1415234	859005	816616	1213940	1090883	0	0	0	0	0	2017-10-12 19:13:51.840378	2017-10-12 19:13:51.840378	2015-11-10	2	46	11	2015	2
2401	1	0	282296	316172	391262	1075536	797277	685835	459665	441782	503650	416005	0	0	0	0	0	2017-10-12 19:13:51.849211	2017-10-12 19:13:51.849211	2015-11-11	2	46	11	2015	3
2402	1	0	127033	361339	497970	1297074	656750	521618	548204	656019	577355	419666	0	0	0	0	0	2017-10-12 19:13:51.858098	2017-10-12 19:13:51.858098	2015-11-12	2	46	11	2015	4
2403	1	0	451674	813013	853664	3494002	1002427	889962	400428	1604504	2448211	1014777	0	0	0	0	0	2017-10-12 19:13:51.866509	2017-10-12 19:13:51.866509	2015-11-13	2	46	11	2015	5
2404	1	0	310526	406507	1138219	2648079	1544437	1188452	1295487	1236965	886982	737083	0	0	0	0	0	2017-10-12 19:13:51.875772	2017-10-12 19:13:51.875772	2015-11-14	2	46	11	2015	6
2405	1	0	254067	451674	853664	1153881	2090404	899697	712223	922635	1207368	919541	0	0	0	0	0	2017-10-12 19:13:51.884345	2017-10-12 19:13:51.884345	2015-11-15	2	46	11	2015	0
2406	1	0	423444	542009	1422774	1080621	1841362	1905540	700889	1850460	1627126	1660116	0	0	0	0	0	2017-10-12 19:13:51.893105	2017-10-12 19:13:51.893105	2015-11-16	2	47	11	2015	1
2407	1	0	451674	542009	1209358	3811250	1471407	779670	830943	1430509	2088554	1117013	0	0	0	0	0	2017-10-12 19:13:51.901939	2017-10-12 19:13:51.901939	2015-11-17	2	47	11	2015	2
2408	1	0	268181	429090	640247	755187	1170346	650876	428023	410446	626694	297198	0	0	0	0	0	2017-10-12 19:13:51.911779	2017-10-12 19:13:51.911779	2015-11-18	2	47	11	2015	3
2409	1	0	197607	293588	569109	1344344	1052492	718015	680978	944292	694877	504583	0	0	0	0	0	2017-10-12 19:13:51.921271	2017-10-12 19:13:51.921271	2015-11-19	2	47	11	2015	4
2410	1	0	395215	858181	1351635	2310208	3954233	1209667	671433	986240	868131	1013967	0	0	0	0	0	2017-10-12 19:13:51.930278	2017-10-12 19:13:51.930278	2015-11-20	2	47	11	2015	5
2411	1	0	338756	767846	1422774	1017888	1486637	1530955	921463	1039252	882078	727692	0	0	0	0	0	2017-10-12 19:13:51.939372	2017-10-12 19:13:51.939372	2015-11-21	2	47	11	2015	6
2412	1	0	310526	587176	1138219	996694	2502555	1902387	861787	2047014	2422682	1260276	0	0	0	0	0	2017-10-12 19:13:51.949142	2017-10-12 19:13:51.949142	2015-11-22	2	47	11	2015	0
2413	1	0	451674	677511	1280497	1923260	1938208	1116282	942664	1033105	1256636	1196176	0	0	0	0	0	2017-10-12 19:13:51.957587	2017-10-12 19:13:51.957587	2015-11-23	2	48	11	2015	1
2414	1	0	366985	496841	853664	1926629	2182560	1305228	676272	1679860	1534411	1139860	0	0	0	0	0	2017-10-12 19:13:51.965771	2017-10-12 19:13:51.965771	2015-11-24	2	48	11	2015	2
2415	1	0	183493	316172	711386	1033078	952472	816614	672123	561349	957980	342086	0	0	0	0	0	2017-10-12 19:13:51.973806	2017-10-12 19:13:51.973806	2015-11-25	2	48	11	2015	3
2416	1	0	239952	361339	569109	1834695	725549	488195	207074	330987	282132	500266	0	0	0	0	0	2017-10-12 19:13:51.981878	2017-10-12 19:13:51.981878	2015-11-26	2	48	11	2015	4
2417	1	0	451674	813013	1351635	1582973	3068570	1258156	1425103	1495454	1141105	571948	0	0	0	0	0	2017-10-12 19:13:51.991223	2017-10-12 19:13:51.991223	2015-11-27	2	48	11	2015	5
2418	1	0	564593	542009	711387	1935726	2803755	914944	1108895	828866	1613899	709745	0	0	0	0	0	2017-10-12 19:13:52.000469	2017-10-12 19:13:52.000469	2015-11-28	2	48	11	2015	6
2419	1	0	282296	542009	853664	2329385	2046029	1254070	1234350	1393365	1757036	636467	0	0	0	0	0	2017-10-12 19:13:52.009687	2017-10-12 19:13:52.009687	2015-11-29	2	48	11	2015	0
2420	1	0	465789	948515	1173788	2539466	5944821	1618028	983402	2025643	3200995	1057209	0	0	0	0	0	2017-10-12 19:13:52.01819	2017-10-12 19:13:52.01819	2015-11-30	2	49	11	2015	1
2421	1	0	550478	1016267	1067080	1587347	5185494	2330082	834986	904848	2714611	1629103	0	0	0	0	0	2017-10-12 19:13:52.027115	2017-10-12 19:13:52.027115	2015-12-01	2	49	12	2015	2
2422	1	0	719855	609760	2027452	2202226	4094357	2358762	2079619	1342128	1316753	725925	0	0	0	0	0	2017-10-12 19:13:52.037941	2017-10-12 19:13:52.037941	2015-12-02	2	49	12	2015	3
2423	1	0	423444	1355022	1707328	2802132	2495933	2025585	915335	2292686	1041232	1832330	0	0	0	0	0	2017-10-12 19:13:52.049727	2017-10-12 19:13:52.049727	2015-12-03	2	49	12	2015	4
2424	1	0	232894	338756	800310	1909074	2600322	585844	928320	1449852	825496	401605	0	0	0	0	0	2017-10-12 19:13:52.061182	2017-10-12 19:13:52.061182	2015-12-04	2	49	12	2015	5
2425	1	0	423444	372631	960372	2206005	1367912	594386	516802	910217	1055044	646530	0	0	0	0	0	2017-10-12 19:13:52.072537	2017-10-12 19:13:52.072537	2015-12-05	2	49	12	2015	6
2426	1	0	465789	677511	2027452	1526984	3105811	1595881	1101211	2772954	3759381	2517582	0	0	0	0	0	2017-10-12 19:13:52.084775	2017-10-12 19:13:52.084775	2015-12-06	2	49	12	2015	0
2427	1	0	762200	880764	1707328	4003787	3482525	1726752	1003539	2030840	1492800	2126256	0	0	0	0	0	2017-10-12 19:13:52.096304	2017-10-12 19:13:52.096304	2015-12-07	2	50	12	2015	1
2428	1	0	677511	1016267	1067080	6338360	6969842	2231157	1125645	2050612	3485489	1152548	0	0	0	0	0	2017-10-12 19:13:52.107742	2017-10-12 19:13:52.107742	2015-12-08	2	50	12	2015	2
2429	1	0	423444	1016267	1707328	2544731	3623053	1238456	972141	2219094	1954499	1569836	0	0	0	0	0	2017-10-12 19:13:52.119842	2017-10-12 19:13:52.119842	2015-12-09	2	50	12	2015	3
2430	1	0	804544	1287271	1173788	5094578	1584550	1477755	1073482	1833477	1733356	1766787	0	0	0	0	0	2017-10-12 19:13:52.132194	2017-10-12 19:13:52.132194	2015-12-10	2	50	12	2015	4
2431	1	0	423444	609760	533540	1034250	2049313	827161	724027	1165027	556212	940218	0	0	0	0	0	2017-10-12 19:13:52.143848	2017-10-12 19:13:52.143848	2015-12-11	2	50	12	2015	5
2432	1	0	211722	677511	960372	1261332	1392166	1216389	820015	1389191	1123569	601985	0	0	0	0	0	2017-10-12 19:13:52.155236	2017-10-12 19:13:52.155236	2015-12-12	2	50	12	2015	6
2433	1	0	804544	1016267	1814036	2780352	5309049	1219981	1714240	2273922	2757094	1798872	0	0	0	0	0	2017-10-12 19:13:52.167743	2017-10-12 19:13:52.167743	2015-12-13	2	50	12	2015	0
2434	1	0	677511	1016267	1493912	2126415	3071493	3318418	1160953	2038552	1732657	1436283	0	0	0	0	0	2017-10-12 19:13:52.181023	2017-10-12 19:13:52.181023	2015-12-14	2	51	12	2015	1
2435	1	0	550478	609760	1493912	1814282	2555856	2784710	1090718	2007187	2084977	959696	0	0	0	0	0	2017-10-12 19:13:52.193876	2017-10-12 19:13:52.193876	2015-12-15	2	51	12	2015	2
2436	1	0	846889	1151769	2134160	2186514	5735288	1391956	1259534	1421805	2627044	2481194	0	0	0	0	0	2017-10-12 19:13:52.206171	2017-10-12 19:13:52.206171	2015-12-16	2	51	12	2015	3
2437	1	0	423444	1287271	1387204	4189289	4257828	2510531	1509389	2860864	1882120	1345068	0	0	0	0	0	2017-10-12 19:13:52.218569	2017-10-12 19:13:52.218569	2015-12-17	2	51	12	2015	4
2438	1	0	423444	406507	533540	998088	1280287	1318754	424501	621645	747007	868758	0	0	0	0	0	2017-10-12 19:13:52.231101	2017-10-12 19:13:52.231101	2015-12-18	2	51	12	2015	5
2439	1	0	381100	508133	960372	1427259	3407018	689614	502636	1181357	597034	400039	0	0	0	0	0	2017-10-12 19:13:52.242884	2017-10-12 19:13:52.242884	2015-12-19	2	51	12	2015	6
2440	1	0	635167	813013	960372	4866081	3582852	2085169	1137868	2288800	2986315	1061370	0	0	0	0	0	2017-10-12 19:13:52.254742	2017-10-12 19:13:52.254742	2015-12-20	2	51	12	2015	0
2441	1	0	550478	745262	2134160	1735824	2028439	2083141	1801586	1265947	1991777	2025662	0	0	0	0	0	2017-10-12 19:13:52.267707	2017-10-12 19:13:52.267707	2015-12-21	2	52	12	2015	1
2442	1	0	423444	745262	1920744	5259751	2289756	2843275	1139065	2557544	1912038	1534246	0	0	0	0	0	2017-10-12 19:13:52.279636	2017-10-12 19:13:52.279636	2015-12-22	2	52	12	2015	2
2443	1	0	762200	1151769	1707328	3041134	4147111	1642621	1621240	1936922	2067230	2312786	0	0	0	0	0	2017-10-12 19:13:52.291519	2017-10-12 19:13:52.291519	2015-12-23	2	52	12	2015	3
2444	1	0	846889	1151769	1920744	2373072	2122848	2234408	1434949	2414774	2325397	1856086	0	0	0	0	0	2017-10-12 19:13:52.303734	2017-10-12 19:13:52.303734	2015-12-24	2	52	12	2015	4
2445	1	0	296411	474258	480186	1579021	2817749	1001110	670985	888702	1352849	456105	0	0	0	0	0	2017-10-12 19:13:52.316511	2017-10-12 19:13:52.316511	2015-12-25	2	52	12	2015	5
2446	1	0	232894	338756	853664	893353	2186564	1543430	993888	1544666	908460	634043	0	0	0	0	0	2017-10-12 19:13:52.328559	2017-10-12 19:13:52.328559	2015-12-26	2	52	12	2015	6
2447	1	0	677511	880764	1387204	3965193	1541615	1863128	1103360	2231378	2296151	935046	0	0	0	0	0	2017-10-12 19:13:52.340635	2017-10-12 19:13:52.340635	2015-12-27	2	52	12	2015	0
2448	1	0	423444	745262	2134160	1871129	1966819	1280555	1260996	1805014	1178630	1439373	0	0	0	0	0	2017-10-12 19:13:52.35378	2017-10-12 19:13:52.35378	2015-12-28	2	53	12	2015	1
2449	1	0	423444	880764	1814036	5203716	5100921	1578519	1465254	1060286	1900767	1212412	0	0	0	0	0	2017-10-12 19:13:52.367031	2017-10-12 19:13:52.367031	2015-12-29	2	53	12	2015	2
2450	1	0	762200	1084018	1707328	2531277	3302208	2122688	1434949	2146466	2113997	2253819	0	0	0	0	0	2017-10-12 19:13:52.429813	2017-10-12 19:13:52.429813	2015-12-30	2	53	12	2015	3
2451	1	0	254067	575884	586894	2440306	3622820	1188819	910623	888702	1424052	663426	0	0	0	0	0	2017-10-12 19:13:52.441286	2017-10-12 19:13:52.441286	2015-12-31	2	53	12	2015	4
2452	5	0	0	0	264600	620439	991321	1126890	847833	1195260	1784051	1307062	1639494	605047	0	0	0	2018-05-02 11:11:30.170861	2018-05-02 11:11:30.170861	2018-05-01	1	1	5	2018	1
2453	5	0	0	0	264600	441251	1501939	884073	1011784	1025951	1451805	2147288	931084	1053913	0	0	0	2018-05-02 11:11:30.253866	2018-05-02 11:11:30.253866	2018-05-02	1	1	5	2018	2
\.


--
-- Name: historic_sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: coke
--

SELECT pg_catalog.setval('public.historic_sales_id_seq', 2453, true);


--
-- Data for Name: hs; Type: TABLE DATA; Schema: public; Owner: coke
--

COPY public.hs (id, store_id, department_id, date, year, month, week, dow, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty, twenty_one, twenty_two, twenty_three, total_day, created_at, updated_at) FROM stdin;
365	1	1	2017-01-02	2017	1	1	1	0	0	264600	620439	991321	1126890	847833	1195260	1784051	1307062	1639494	605047	0	0	0	10381998	2018-02-28 07:37:35.08384	2018-02-28 07:37:35.08384
366	1	1	2017-01-03	2017	1	1	2	0	0	264600	441251	1501939	884073	1011784	1025951	1451805	2147288	931084	1053913	0	0	0	10713690	2018-02-28 07:37:35.090558	2018-02-28 07:37:35.090558
367	1	1	2017-01-04	2017	1	1	3	0	0	242550	299692	355362	1169306	712983	1296528	1673250	1221646	1169593	2099426	0	0	0	10240339	2018-02-28 07:37:35.097046	2018-02-28 07:37:35.097046
368	1	1	2017-01-05	2017	1	1	4	0	0	352800	710849	640456	646663	562830	1354867	2164962	1514772	2142517	1215911	0	0	0	11306631	2018-02-28 07:37:35.103247	2018-02-28 07:37:35.103247
369	1	1	2017-01-06	2017	1	1	5	0	0	352800	489022	282767	682110	806187	1787918	1908888	2189125	971039	1694131	0	0	0	11163992	2018-02-28 07:37:35.109466	2018-02-28 07:37:35.109466
370	1	1	2017-01-07	2017	1	1	6	0	0	529200	572294	1637423	1403923	1709153	2153362	3229829	4250694	5266898	1521452	0	0	0	22274234	2018-02-28 07:37:35.115689	2018-02-28 07:37:35.115689
371	1	1	2017-01-08	2017	1	1	7	0	0	423360	1628804	1158454	1478030	2005641	1791965	1855183	3890472	3696690	3431666	0	0	0	21360272	2018-02-28 07:37:35.122772	2018-02-28 07:37:35.122772
372	1	1	2017-01-09	2017	1	2	1	0	0	264600	726566	761275	671113	943051	1165262	2206921	3850740	1756569	1400453	0	0	0	13746551	2018-02-28 07:37:35.130922	2018-02-28 07:37:35.130922
373	1	1	2017-01-10	2017	1	2	2	0	0	264600	344556	1706078	461846	367291	1510994	2841270	2249583	1182022	892420	0	0	0	11820662	2018-02-28 07:37:35.138026	2018-02-28 07:37:35.138026
374	1	1	2017-01-11	2017	1	2	3	0	0	441000	381699	622517	879036	974490	924490	1423980	2051274	1351736	1450826	0	0	0	10501051	2018-02-28 07:37:35.144692	2018-02-28 07:37:35.144692
375	1	1	2017-01-12	2017	1	2	4	0	0	286650	671262	709103	408812	843283	1981870	2301572	1582108	952260	1053069	0	0	0	10789993	2018-02-28 07:37:35.150863	2018-02-28 07:37:35.150863
376	1	1	2017-01-13	2017	1	2	5	0	0	286650	444963	575733	1104020	901379	993626	2228065	1213385	1050287	787163	0	0	0	9585276	2018-02-28 07:37:35.157047	2018-02-28 07:37:35.157047
377	1	1	2017-01-14	2017	1	2	6	0	0	441000	851739	1636268	2023052	1611910	2466890	3448473	3303618	5247018	4523385	0	0	0	25553359	2018-02-28 07:37:35.162924	2018-02-28 07:37:35.162924
378	1	1	2017-01-15	2017	1	2	7	0	0	564480	322153	696704	1608634	2011860	1070285	2556575	3044860	2605073	2070551	0	0	0	16551182	2018-02-28 07:37:35.168634	2018-02-28 07:37:35.168634
379	1	1	2017-01-16	2017	1	3	1	0	0	441000	367417	898251	503663	943912	1463353	1801418	2202526	1742313	1007640	0	0	0	11371494	2018-02-28 07:37:35.174871	2018-02-28 07:37:35.174871
380	1	1	2017-01-17	2017	1	3	2	0	0	264600	487819	786705	437670	877794	877973	2574035	1754628	761987	1935925	0	0	0	10759138	2018-02-28 07:37:35.181451	2018-02-28 07:37:35.181451
381	1	1	2017-01-18	2017	1	3	3	0	0	286650	365505	1269562	1111026	436400	773725	2919926	1955405	1913013	1548106	0	0	0	12579321	2018-02-28 07:37:35.188057	2018-02-28 07:37:35.188057
382	1	1	2017-01-19	2017	1	3	4	0	0	396900	418094	408490	493622	1251701	1098301	2407511	3122060	1907681	1080300	0	0	0	12584664	2018-02-28 07:37:35.19363	2018-02-28 07:37:35.19363
383	1	1	2017-01-20	2017	1	3	5	0	0	374850	902799	761829	742195	1134908	987197	2118587	1599847	1233956	1596492	0	0	0	11452665	2018-02-28 07:37:35.199681	2018-02-28 07:37:35.199681
384	1	1	2017-01-21	2017	1	3	6	0	0	661500	1016991	2149371	1226155	1676732	2652493	3296545	3200426	3735718	2894718	0	0	0	22510655	2018-02-28 07:37:35.205706	2018-02-28 07:37:35.205706
385	1	1	2017-01-22	2017	1	3	7	0	0	423360	592639	1089650	1043708	1742061	2439484	2940852	3242212	2708414	2718224	0	0	0	18940611	2018-02-28 07:37:35.212041	2018-02-28 07:37:35.212041
386	1	1	2017-01-23	2017	1	4	1	0	0	374850	402557	506334	806028	752309	1594490	1962344	992552	1202283	1129784	0	0	0	9723532	2018-02-28 07:37:35.219762	2018-02-28 07:37:35.219762
387	1	1	2017-01-24	2017	1	4	2	0	0	441000	1026740	1071349	755632	953313	1595566	2248396	1626637	920085	868375	0	0	0	11507095	2018-02-28 07:37:35.226388	2018-02-28 07:37:35.226388
388	1	1	2017-01-25	2017	1	4	3	0	0	220500	1085588	1167970	911497	819664	693450	1888192	1547756	1742218	955676	0	0	0	11032514	2018-02-28 07:37:35.233084	2018-02-28 07:37:35.233084
389	1	1	2017-01-26	2017	1	4	4	0	0	396900	856978	917072	923440	821453	700546	1897489	2287817	1673862	1072457	0	0	0	11548018	2018-02-28 07:37:35.240136	2018-02-28 07:37:35.240136
390	1	1	2017-01-27	2017	1	4	5	0	0	308700	524197	516296	877055	527222	1589778	2197546	1658957	1682604	1064120	0	0	0	10946480	2018-02-28 07:37:35.245949	2018-02-28 07:37:35.245949
391	1	1	2017-01-28	2017	1	4	6	0	0	837900	1313320	1500166	2640428	792125	1786653	4483697	3409754	5392806	1187904	0	0	0	23344759	2018-02-28 07:37:35.252149	2018-02-28 07:37:35.252149
392	1	1	2017-01-29	2017	1	4	7	0	0	705600	888399	1991354	2376205	1123662	2436543	5854286	2472733	4462600	2017093	0	0	0	24328482	2018-02-28 07:37:35.257993	2018-02-28 07:37:35.257993
393	1	1	2017-01-30	2017	2	1	1	0	0	562275	1035954	833952	733209	1489854	1676720	1989162	4029458	2099393	2898050	0	0	0	17348028	2018-02-28 07:37:35.263805	2018-02-28 07:37:35.263805
394	1	1	2017-01-31	2017	2	1	2	0	0	661500	1011608	1494582	1400777	1004592	1026691	1949111	3054487	3962120	1882815	0	0	0	17448285	2018-02-28 07:37:35.269828	2018-02-28 07:37:35.269828
395	1	1	2017-02-01	2017	2	1	3	0	0	396900	537017	595816	1415042	995485	1730958	2609917	2197351	1880142	1216853	0	0	0	13575484	2018-02-28 07:37:35.27601	2018-02-28 07:37:35.27601
396	1	1	2017-02-02	2017	2	1	4	0	0	661500	1024022	1153948	781877	1670080	1866817	1897624	3633883	3046346	770816	0	0	0	16506917	2018-02-28 07:37:35.283229	2018-02-28 07:37:35.283229
397	1	1	2017-02-03	2017	2	1	5	0	0	363825	1223640	535260	1383260	1444971	1913508	1762346	2360250	1519472	1513922	0	0	0	14020459	2018-02-28 07:37:35.291875	2018-02-28 07:37:35.291875
398	1	1	2017-02-04	2017	2	1	6	0	0	463050	1098768	659651	817856	1745348	2095675	1515684	4463547	1934198	1375446	0	0	0	16169229	2018-02-28 07:37:35.300636	2018-02-28 07:37:35.300636
399	1	1	2017-02-05	2017	2	1	7	0	0	529200	1647397	1385216	1671029	619519	2039561	3881501	1876307	4705210	1657991	0	0	0	20012938	2018-02-28 07:37:35.308902	2018-02-28 07:37:35.308902
400	1	1	2017-02-06	2017	2	2	1	0	0	1256850	689482	1341237	2915320	1911397	2872429	3606153	9322710	4407716	2466235	0	0	0	30789530	2018-02-28 07:37:35.315706	2018-02-28 07:37:35.315706
401	1	1	2017-02-07	2017	2	2	2	0	0	952560	1881608	1622416	3495462	2275714	2695943	3649996	5502385	8444029	3235642	0	0	0	33755757	2018-02-28 07:37:35.321701	2018-02-28 07:37:35.321701
402	1	1	2017-02-08	2017	2	2	3	0	0	661500	1047393	529326	1157528	1562099	997675	3353680	3841695	2238563	1488570	0	0	0	16878032	2018-02-28 07:37:35.328252	2018-02-28 07:37:35.328252
403	1	1	2017-02-09	2017	2	2	4	0	0	363825	1468031	682569	530844	1014013	2151335	2736876	4255170	4349422	1102501	0	0	0	18654590	2018-02-28 07:37:35.334285	2018-02-28 07:37:35.334285
404	1	1	2017-02-10	2017	2	2	5	0	0	330750	1587193	1187320	1928920	815051	1876524	1517100	4964814	2744630	2648012	0	0	0	19600319	2018-02-28 07:37:35.340144	2018-02-28 07:37:35.340144
405	1	1	2017-02-11	2017	2	2	6	0	0	628425	413838	1024535	1036153	1297794	1400937	1836950	3398722	3206765	1846776	0	0	0	16090901	2018-02-28 07:37:35.345786	2018-02-28 07:37:35.345786
406	1	1	2017-02-12	2017	2	2	7	0	0	496125	809665	1205681	1043657	1305188	2826395	4217003	3932568	2221663	2870564	0	0	0	20928516	2018-02-28 07:37:35.351485	2018-02-28 07:37:35.351485
407	1	1	2017-02-13	2017	2	3	1	0	0	926100	1466281	5133006	2813723	1171686	4048400	4917968	3766036	3487022	6475943	0	0	0	34206166	2018-02-28 07:37:35.357353	2018-02-28 07:37:35.357353
408	1	1	2017-02-14	2017	2	3	2	0	0	476280	2702979	3368958	2549240	1613804	1864172	5596240	7047393	7858959	2901895	0	0	0	35979922	2018-02-28 07:37:35.364101	2018-02-28 07:37:35.364101
409	1	1	2017-02-15	2017	2	3	3	0	0	363825	674176	1374221	1472117	1357287	1272600	3540964	2248016	1712976	1068260	0	0	0	15084445	2018-02-28 07:37:35.370631	2018-02-28 07:37:35.370631
410	1	1	2017-02-16	2017	2	3	4	0	0	463050	1326478	1291229	1180185	1070711	2321678	3194212	3354409	2854568	1295280	0	0	0	18351804	2018-02-28 07:37:35.37692	2018-02-28 07:37:35.37692
411	1	1	2017-02-17	2017	2	3	5	0	0	396900	437930	1279977	1991542	979296	2442224	1814458	1846757	2612539	1828003	0	0	0	15629631	2018-02-28 07:37:35.382908	2018-02-28 07:37:35.382908
412	1	1	2017-02-18	2017	2	3	6	0	0	529200	784730	1019233	989809	985349	1956253	2322380	1735272	4611148	985559	0	0	0	15918939	2018-02-28 07:37:35.389082	2018-02-28 07:37:35.389082
413	1	1	2017-02-19	2017	2	3	7	0	0	363825	890638	1858926	708840	1438219	2012469	3969877	3357669	2027142	1888296	0	0	0	18515908	2018-02-28 07:37:35.395249	2018-02-28 07:37:35.395249
414	1	1	2017-02-20	2017	2	4	1	0	0	595350	2754133	1255102	1555898	2195288	4288271	5964877	7884741	6645170	3449619	0	0	0	36588450	2018-02-28 07:37:35.40154	2018-02-28 07:37:35.40154
415	1	1	2017-02-21	2017	2	4	2	0	0	529200	1851050	1609786	2930471	1430833	2507392	3706269	6679421	8021546	3082796	0	0	0	32348766	2018-02-28 07:37:35.40831	2018-02-28 07:37:35.40831
416	1	1	2017-02-22	2017	2	4	3	0	0	463050	1288614	1994092	1434968	1547828	1620788	3030889	1477976	1895802	797685	0	0	0	15551695	2018-02-28 07:37:35.415047	2018-02-28 07:37:35.415047
417	1	1	2017-02-23	2017	2	4	4	0	0	595350	1460912	785806	1230122	1642972	1598476	1950424	4360746	2969793	1411638	0	0	0	18006243	2018-02-28 07:37:35.423953	2018-02-28 07:37:35.423953
418	1	1	2017-02-24	2017	2	4	5	0	0	297675	1351365	1791589	1447971	1256648	2482844	2598545	3530156	1702992	2027272	0	0	0	18487062	2018-02-28 07:37:35.429822	2018-02-28 07:37:35.429822
419	1	1	2017-02-25	2017	2	4	6	0	0	529200	882237	1343362	1474702	1310709	1114728	1561364	3322598	2085883	1297596	0	0	0	14922385	2018-02-28 07:37:35.435771	2018-02-28 07:37:35.435771
420	1	1	2017-02-26	2017	2	4	7	0	0	529200	1050908	1707356	1175938	751320	2285741	2392940	2753673	2600280	2579303	0	0	0	17826666	2018-02-28 07:37:35.441452	2018-02-28 07:37:35.441452
421	1	1	2017-02-27	2017	3	1	1	0	0	926100	2096855	2219020	2019207	3271469	3582275	8055858	7000037	8605352	4070078	0	0	0	41846252	2018-02-28 07:37:35.447618	2018-02-28 07:37:35.447618
422	1	1	2017-02-28	2017	3	1	2	0	0	740880	1241399	971225	3273767	1866358	3584857	3460496	7676547	10044399	2382677	0	0	0	35242607	2018-02-28 07:37:35.454333	2018-02-28 07:37:35.454333
423	1	1	2017-03-01	2017	3	1	3	0	0	496125	1229677	1037751	1450744	1076545	2326578	2460884	2573037	2308413	1705819	0	0	0	16665576	2018-02-28 07:37:35.460553	2018-02-28 07:37:35.460553
424	1	1	2017-03-02	2017	3	1	4	0	0	363825	553057	1559705	1310245	1158949	1114143	1685411	2268804	3691995	1476786	0	0	0	15182924	2018-02-28 07:37:35.466914	2018-02-28 07:37:35.466914
425	1	1	2017-03-03	2017	3	1	5	0	0	429975	926456	905768	1647400	532268	1493624	2156875	3110694	2295695	2325834	0	0	0	15824594	2018-02-28 07:37:35.473925	2018-02-28 07:37:35.473925
426	1	1	2017-03-04	2017	3	1	6	0	0	536363	767846	1280497	1752519	1123716	1621652	698808	1496322	1061830	735335	0	0	0	11074894	2018-02-28 07:37:35.479951	2018-02-28 07:37:35.479951
427	1	1	2017-03-05	2017	3	1	7	0	0	423444	406507	711387	1478023	2448839	1508167	653912	2200550	1043034	1082071	0	0	0	11955941	2018-02-28 07:37:35.48554	2018-02-28 07:37:35.48554
428	1	1	2017-03-06	2017	3	2	1	0	0	564593	542009	1138219	941598	3413411	739719	802481	846858	1931853	1064200	0	0	0	11984942	2018-02-28 07:37:35.491601	2018-02-28 07:37:35.491601
429	1	1	2017-03-07	2017	3	2	2	0	0	451674	767846	853664	1371863	2529776	1432906	1001400	1456209	1220635	1567730	0	0	0	12653705	2018-02-28 07:37:35.498355	2018-02-28 07:37:35.498355
430	1	1	2017-03-08	2017	3	2	3	0	0	239952	203253	640247	1292467	992708	669888	604967	643175	745167	295305	0	0	0	6327132	2018-02-28 07:37:35.505182	2018-02-28 07:37:35.505182
431	1	1	2017-03-09	2017	3	2	4	0	0	155263	203253	533540	480945	2426932	1006052	348659	560288	754616	371480	0	0	0	6841032	2018-02-28 07:37:35.511303	2018-02-28 07:37:35.511303
432	1	1	2017-03-10	2017	3	2	5	0	0	508133	903348	711387	2920254	3615381	1030640	499274	780907	1738289	550773	0	0	0	13258391	2018-02-28 07:37:35.517002	2018-02-28 07:37:35.517002
433	1	1	2017-03-11	2017	3	2	6	0	0	508133	903348	1209358	1801640	2919363	2028434	840001	1390615	1182107	1472674	0	0	0	14255679	2018-02-28 07:37:35.522568	2018-02-28 07:37:35.522568
434	1	1	2017-03-12	2017	3	2	7	0	0	310526	858181	1209358	1831311	2106894	1881540	467385	1030148	1068332	850976	0	0	0	11614658	2018-02-28 07:37:35.528192	2018-02-28 07:37:35.528192
435	1	1	2017-03-13	2017	3	3	1	0	0	366985	722678	782526	1458499	2915798	1513070	917013	1206097	2063314	1252182	0	0	0	13198163	2018-02-28 07:37:35.533709	2018-02-28 07:37:35.533709
436	1	1	2017-03-14	2017	3	3	2	0	0	395215	451674	1138219	2591303	2457088	819346	1483737	998086	1040520	1363604	0	0	0	12738794	2018-02-28 07:37:35.539473	2018-02-28 07:37:35.539473
437	1	1	2017-03-15	2017	3	3	3	0	0	169378	225837	426832	1564416	896936	440894	490309	625858	453285	608008	0	0	0	5901756	2018-02-28 07:37:35.545622	2018-02-28 07:37:35.545622
438	1	1	2017-03-16	2017	3	3	4	0	0	239952	451674	604678	972806	1050800	318767	451462	552437	914145	419666	0	0	0	5976391	2018-02-28 07:37:35.552199	2018-02-28 07:37:35.552199
439	1	1	2017-03-17	2017	3	3	5	0	0	564593	677511	1138219	2671884	1202912	1618112	889840	1604504	2577064	1092837	0	0	0	14037481	2018-02-28 07:37:35.558129	2018-02-28 07:37:35.558129
440	1	1	2017-03-18	2017	3	3	6	0	0	536363	587176	1067081	1702337	1965648	1620617	613652	1072036	665237	737083	0	0	0	10567236	2018-02-28 07:37:35.564256	2018-02-28 07:37:35.564256
441	1	1	2017-03-19	2017	3	3	7	0	0	479904	903348	711387	1538508	1742003	817906	534167	1230180	2146432	1050904	0	0	0	11154746	2018-02-28 07:37:35.570165	2018-02-28 07:37:35.570165
442	1	1	2017-03-20	2017	3	4	1	0	0	366985	722678	1422774	1246871	1744448	1805249	1168149	1415058	1531413	1494104	0	0	0	12917730	2018-02-28 07:37:35.576387	2018-02-28 07:37:35.576387
443	1	1	2017-03-21	2017	3	4	2	0	0	338756	451674	711387	3008882	2942815	1472710	830943	841476	2610692	930845	0	0	0	14140182	2018-02-28 07:37:35.582408	2018-02-28 07:37:35.582408
444	1	1	2017-03-22	2017	3	4	3	0	0	239952	225837	426832	1359337	2600768	382868	352489	634326	430852	330220	0	0	0	6983484	2018-02-28 07:37:35.58927	2018-02-28 07:37:35.58927
445	1	1	2017-03-23	2017	3	4	4	0	0	282296	316172	320124	1344344	1052492	923162	306440	894593	868596	336389	0	0	0	6644612	2018-02-28 07:37:35.596454	2018-02-28 07:37:35.596454
446	1	1	2017-03-24	2017	3	4	5	0	0	338756	677511	782526	1925173	5008695	831646	805720	1075898	1543344	1067334	0	0	0	14056608	2018-02-28 07:37:35.602884	2018-02-28 07:37:35.602884
447	1	1	2017-03-25	2017	3	4	6	0	0	423444	587176	1280497	1665635	1783964	1435271	704648	779439	1470130	559763	0	0	0	10689973	2018-02-28 07:37:35.609176	2018-02-28 07:37:35.609176
448	1	1	2017-03-26	2017	3	4	7	0	0	479904	542009	1351635	1218182	3640080	1119051	1169568	1137230	2550192	1134248	0	0	0	14342106	2018-02-28 07:37:35.615707	2018-02-28 07:37:35.615707
449	1	1	2017-03-27	2017	3	5	1	0	0	310526	677511	853664	3269542	1830529	1190701	665410	811725	1933286	985086	0	0	0	12527981	2018-02-28 07:37:35.622237	2018-02-28 07:37:35.622237
450	1	1	2017-03-28	2017	3	5	2	0	0	479904	813013	924803	2371235	2579389	961747	1014408	1091909	1534411	1139860	0	0	0	12910681	2018-02-28 07:37:35.629336	2018-02-28 07:37:35.629336
451	1	1	2017-03-29	2017	3	5	3	0	0	155263	429090	497970	1314827	634981	459346	353749	495308	705880	209053	0	0	0	5255470	2018-02-28 07:37:35.637007	2018-02-28 07:37:35.637007
452	1	1	2017-03-30	2017	3	5	4	0	0	282296	406507	640247	1255318	1612332	772975	230082	595777	536051	250133	0	0	0	6581722	2018-02-28 07:37:35.643292	2018-02-28 07:37:35.643292
453	1	1	2017-03-31	2017	3	5	5	0	0	366985	451674	1280497	2216162	2727618	888110	900065	1775852	1228882	727934	0	0	0	12563784	2018-02-28 07:37:35.650118	2018-02-28 07:37:35.650118
454	1	1	2017-04-01	2017	3	5	6	0	0	479904	767846	640248	1120683	3925257	1196465	758718	1243299	2234630	1013922	0	0	0	13380978	2018-02-28 07:37:35.658618	2018-02-28 07:37:35.658618
455	1	1	2017-04-02	2017	3	5	7	0	0	423444	632344	1422774	3388197	2216531	940553	555458	1654621	1854649	636467	0	0	0	13725045	2018-02-28 07:37:35.666321	2018-02-28 07:37:35.666321
456	1	1	2017-04-03	2017	4	1	1	0	0	719855	1151769	1173788	3083637	3963214	970817	842916	2181462	3577582	864989	0	0	0	18530030	2018-02-28 07:37:35.672283	2018-02-28 07:37:35.672283
457	1	1	2017-04-04	2017	4	1	2	0	0	635167	948515	2027452	1587347	5555886	1281545	751487	1266787	3967508	1253156	0	0	0	19274852	2018-02-28 07:37:35.678566	2018-02-28 07:37:35.678566
458	1	1	2017-04-05	2017	4	1	3	0	0	381100	948515	1067080	4159761	4350254	2506184	1957288	2318220	2926118	806583	0	0	0	21421106	2018-02-28 07:37:35.684939	2018-02-28 07:37:35.684939
459	1	1	2017-04-06	2017	4	1	4	0	0	677511	1355022	2027452	2802132	5269192	1237858	1932374	2022959	1619694	2076640	0	0	0	21020838	2018-02-28 07:37:35.690766	2018-02-28 07:37:35.690766
460	1	1	2017-04-07	2017	4	1	5	0	0	232894	338756	533540	1049991	2447362	644428	742656	1705708	530676	545036	0	0	0	8771052	2018-02-28 07:37:35.697095	2018-02-28 07:37:35.697095
461	1	1	2017-04-08	2017	4	1	6	0	0	381100	474258	1013726	2206005	1025934	918597	477048	986068	868860	355592	0	0	0	8707194	2018-02-28 07:37:35.703463	2018-02-28 07:37:35.703463
462	1	1	2017-04-09	2017	4	1	7	0	0	804544	609760	1493912	1832381	4658717	1329901	1401541	3081060	4177090	1325043	0	0	0	20713956	2018-02-28 07:37:35.709271	2018-02-28 07:37:35.709271
463	1	1	2017-04-10	2017	4	2	1	0	0	846889	609760	1280496	5235721	3482525	1726752	1235125	1523130	1722462	2524929	0	0	0	20187790	2018-02-28 07:37:35.715318	2018-02-28 07:37:35.715318
464	1	1	2017-04-11	2017	4	2	2	0	0	635167	880764	1600620	5704524	5227382	1996298	1739634	1318251	2935149	1824868	0	0	0	23862659	2018-02-28 07:37:35.721677	2018-02-28 07:37:35.721677
465	1	1	2017-04-12	2017	4	2	3	0	0	423444	1355022	1067080	2375082	1811526	1114610	1555426	2773868	1494617	1449079	0	0	0	15419757	2018-02-28 07:37:35.727974	2018-02-28 07:37:35.727974
466	1	1	2017-04-13	2017	4	2	4	0	0	550478	1084018	1493912	2292560	2736950	1688862	631460	1100086	1466686	2120144	0	0	0	15165160	2018-02-28 07:37:35.734684	2018-02-28 07:37:35.734684
467	1	1	2017-04-14	2017	4	2	5	0	0	423444	508133	533540	1034250	3353422	919068	891110	915378	855710	846196	0	0	0	10280256	2018-02-28 07:37:35.74077	2018-02-28 07:37:35.74077
468	1	1	2017-04-15	2017	4	2	6	0	0	296411	304880	746956	667764	1889368	684219	578834	1242960	827893	389520	0	0	0	7628811	2018-02-28 07:37:35.747059	2018-02-28 07:37:35.747059
469	1	1	2017-04-16	2017	4	2	7	0	0	381100	1084018	1173788	2224282	6125826	1996333	1836686	2761191	1459638	2038722	0	0	0	21081591	2018-02-28 07:37:35.753093	2018-02-28 07:37:35.753093
470	1	1	2017-04-17	2017	4	3	1	0	0	846889	609760	1920744	4016561	2126418	3152497	1243878	1732769	2887762	1325800	0	0	0	19863079	2018-02-28 07:37:35.758902	2018-02-28 07:37:35.758902
471	1	1	2017-04-18	2017	4	3	2	0	0	508133	948515	960372	1484412	1916892	2475298	886209	1290335	3127466	1535514	0	0	0	15133148	2018-02-28 07:37:35.764724	2018-02-28 07:37:35.764724
472	1	1	2017-04-19	2017	4	3	3	0	0	762200	1016267	1280496	2332282	5397918	1889083	1119586	2031150	2472512	1612776	0	0	0	19914273	2018-02-28 07:37:35.771019	2018-02-28 07:37:35.771019
473	1	1	2017-04-20	2017	4	3	4	0	0	508133	1151769	1920744	3590819	6741561	2114131	1078135	1788040	3136866	1008801	0	0	0	23039003	2018-02-28 07:37:35.777318	2018-02-28 07:37:35.777318
474	1	1	2017-04-21	2017	4	3	5	0	0	338756	542009	533540	1596941	677799	832897	326539	683810	622506	457241	0	0	0	6612043	2018-02-28 07:37:35.784193	2018-02-28 07:37:35.784193
475	1	1	2017-04-22	2017	4	3	6	0	0	317583	542009	853664	1159648	3206605	1379228	323123	1255192	945303	622283	0	0	0	10604644	2018-02-28 07:37:35.790061	2018-02-28 07:37:35.790061
476	1	1	2017-04-23	2017	4	3	7	0	0	465789	677511	2027452	4097752	6449134	2245566	894039	3106228	2459318	1533090	0	0	0	23955886	2018-02-28 07:37:35.795769	2018-02-28 07:37:35.795769
477	1	1	2017-04-24	2017	4	4	1	0	0	846889	677511	1387204	2231773	3380732	2083141	1801586	1363327	1106543	1072409	0	0	0	15951116	2018-02-28 07:37:35.801648	2018-02-28 07:37:35.801648
478	1	1	2017-04-25	2017	4	4	2	0	0	381100	1355022	1387204	3214292	2671382	2369396	1346168	2173912	2270546	1753424	0	0	0	18922448	2018-02-28 07:37:35.807367	2018-02-28 07:37:35.807367
479	1	1	2017-04-26	2017	4	4	3	0	0	846889	880764	1814036	3041134	4466119	2463932	767956	1452692	1929414	1272032	0	0	0	18934971	2018-02-28 07:37:35.813378	2018-02-28 07:37:35.813378
480	1	1	2017-04-27	2017	4	4	4	0	0	423444	1151769	1814036	2214867	3773952	1117204	896843	2280620	2113997	1988664	0	0	0	17775400	2018-02-28 07:37:35.819634	2018-02-28 07:37:35.819634
481	1	1	2017-04-28	2017	4	4	5	0	0	359928	609760	960372	2727401	3824088	563125	527203	467738	783229	539033	0	0	0	11361882	2018-02-28 07:37:35.825823	2018-02-28 07:37:35.825823
482	1	1	2017-04-29	2017	4	4	6	0	0	232894	406507	586894	1191137	3578013	1371938	552160	1158500	1327749	493144	0	0	0	10898942	2018-02-28 07:37:35.831963	2018-02-28 07:37:35.831963
483	1	1	2017-04-30	2017	4	4	7	0	0	423444	1016267	1493912	5381334	2466584	3387506	778842	1673534	1722113	1222752	0	0	0	19566295	2018-02-28 07:37:35.839806	2018-02-28 07:37:35.839806
484	1	1	2017-05-01	2017	4	5	1	0	0	423444	1287271	1600620	1871129	2294622	1280555	1357996	1160366	1714371	2103699	0	0	0	15094074	2018-02-28 07:37:35.846719	2018-02-28 07:37:35.846719
485	1	1	2017-05-02	2017	4	5	2	0	0	804544	1355022	1173788	3902787	4316164	1894223	1292871	1178096	1900767	1432851	0	0	0	19251115	2018-02-28 07:37:35.852333	2018-02-28 07:37:35.852333
486	1	1	2017-05-03	2017	4	5	3	0	0	308700	668165	1101468	652410	648343	1195260	1877948	2178436	1261149	968075	0	0	0	10859957	2018-02-28 07:37:35.857855	2018-02-28 07:37:35.857855
487	1	1	2017-05-04	2017	4	5	4	0	0	396900	678848	1264790	820925	958532	1025951	1281005	3399873	1354304	887506	0	0	0	12068638	2018-02-28 07:37:35.863523	2018-02-28 07:37:35.863523
488	1	1	2017-05-05	2017	4	5	5	0	0	198450	544894	671240	1096224	760515	1215495	2091563	1665881	2599096	1049713	0	0	0	11893076	2018-02-28 07:37:35.869676	2018-02-28 07:37:35.869676
489	1	1	2017-05-06	2017	4	5	6	0	0	330750	434408	1138589	923804	865892	1016150	2742285	1081980	2754664	1317237	0	0	0	12605765	2018-02-28 07:37:35.876417	2018-02-28 07:37:35.876417
490	1	1	2017-05-07	2017	4	5	7	0	0	374850	844674	439859	787050	859933	893959	1908888	2052305	794487	1505894	0	0	0	10461906	2018-02-28 07:37:35.883227	2018-02-28 07:37:35.883227
491	1	1	2017-05-08	2017	5	1	1	0	0	485100	572294	1773875	2105885	1367322	2936403	4697933	3250530	7022530	2130033	0	0	0	26341906	2018-02-28 07:37:35.88888	2018-02-28 07:37:35.88888
492	1	1	2017-05-09	2017	5	1	2	0	0	458640	1371624	1790338	1794751	1297768	1686555	2411738	3591205	5853093	3088499	0	0	0	23344213	2018-02-28 07:37:35.89464	2018-02-28 07:37:35.89464
493	1	1	2017-05-10	2017	5	1	3	0	0	220500	470131	837403	950744	530466	1792710	2452134	3273129	2107883	1235694	0	0	0	13870797	2018-02-28 07:37:35.900737	2018-02-28 07:37:35.900737
494	1	1	2017-05-11	2017	5	1	4	0	0	308700	727396	1279559	615795	816202	1913925	1420635	1649694	2245842	755125	0	0	0	11732877	2018-02-28 07:37:35.908944	2018-02-28 07:37:35.908944
495	1	1	2017-05-12	2017	5	1	5	0	0	418950	314341	456512	952289	1218112	1232653	1898640	1206632	1622083	932674	0	0	0	10252891	2018-02-28 07:37:35.916327	2018-02-28 07:37:35.916327
496	1	1	2017-05-13	2017	5	1	6	0	0	242550	671262	850924	772201	754516	1981870	1662246	3515796	1428390	775946	0	0	0	12655707	2018-02-28 07:37:35.922816	2018-02-28 07:37:35.922816
497	1	1	2017-05-14	2017	5	1	7	0	0	441000	650330	498969	809614	507026	1419466	1524466	2206154	1527690	787163	0	0	0	10371885	2018-02-28 07:37:35.929431	2018-02-28 07:37:35.929431
498	1	1	2017-05-15	2017	5	2	1	0	0	396900	1022087	1338764	1734044	1611910	2466890	4597964	5506030	4497444	4047239	0	0	0	27219273	2018-02-28 07:37:35.93547	2018-02-28 07:37:35.93547
499	1	1	2017-05-16	2017	5	2	2	0	0	599760	572717	633367	2068243	2011860	1902728	3834862	1791094	2894525	2070551	0	0	0	18379709	2018-02-28 07:37:35.941426	2018-02-28 07:37:35.941426
500	1	1	2017-05-17	2017	5	2	3	0	0	220500	501023	1122814	348690	1078757	1382056	1463652	2340184	1617862	1223563	0	0	0	11299104	2018-02-28 07:37:35.947304	2018-02-28 07:37:35.947304
501	1	1	2017-05-18	2017	5	2	4	0	0	418950	609774	524470	486300	643716	877973	2574035	1135347	1608639	1222690	0	0	0	10101898	2018-02-28 07:37:35.953141	2018-02-28 07:37:35.953141
502	1	1	2017-05-19	2017	5	2	5	0	0	374850	621359	1110866	962889	436400	1461480	1751956	2077618	1434760	1204083	0	0	0	11436266	2018-02-28 07:37:35.960587	2018-02-28 07:37:35.960587
503	1	1	2017-05-20	2017	5	2	6	0	0	308700	321611	471335	937882	724669	976267	1140400	1561030	1907681	756210	0	0	0	9105791	2018-02-28 07:37:35.967831	2018-02-28 07:37:35.967831
504	1	1	2017-05-21	2017	5	2	7	0	0	352800	955904	1015772	1113293	680945	1198740	1530091	1745287	1803474	957895	0	0	0	11354208	2018-02-28 07:37:35.976281	2018-02-28 07:37:35.976281
505	1	1	2017-05-22	2017	5	3	1	0	0	837900	1355988	1583747	1603433	1816460	3599812	3684374	4431359	3160992	3473662	0	0	0	25547728	2018-02-28 07:37:35.984492	2018-02-28 07:37:35.984492
506	1	1	2017-05-23	2017	5	3	2	0	0	352800	829695	599308	1525419	1277511	1463690	5881704	3473799	2708414	2002902	0	0	0	20115244	2018-02-28 07:37:35.992577	2018-02-28 07:37:35.992577
507	1	1	2017-05-24	2017	5	3	3	0	0	308700	626199	569626	879304	877694	1195868	2077776	1764536	1335870	924368	0	0	0	10559944	2018-02-28 07:37:36.000905	2018-02-28 07:37:36.000905
508	1	1	2017-05-25	2017	5	3	4	0	0	264600	462033	870471	377816	817126	1220138	2645172	3253273	1124549	601183	0	0	0	11636365	2018-02-28 07:37:36.009312	2018-02-28 07:37:36.009312
509	1	1	2017-05-26	2017	5	3	5	0	0	308700	868470	1038195	846390	936758	693450	2242228	1031837	1742218	1529082	0	0	0	11237333	2018-02-28 07:37:36.017252	2018-02-28 07:37:36.017252
510	1	1	2017-05-27	2017	5	3	6	0	0	242550	734552	504390	1096585	821453	1120874	1605568	2287817	1673862	877465	0	0	0	10965122	2018-02-28 07:37:36.02557	2018-02-28 07:37:36.02557
511	1	1	2017-05-28	2017	5	3	7	0	0	198450	733876	357436	535978	489563	993611	1373466	2156644	2523906	760086	0	0	0	10123023	2018-02-28 07:37:36.03459	2018-02-28 07:37:36.03459
512	1	1	2017-05-29	2017	5	4	1	0	0	529200	1036832	1312646	1716278	1584250	1786653	2241849	5114631	5392806	1451882	0	0	0	22167028	2018-02-28 07:37:36.04193	2018-02-28 07:37:36.04193
513	1	1	2017-05-30	2017	5	4	2	0	0	458640	1015314	3063622	1848160	1797859	1786798	3081203	2472733	4462600	1186525	0	0	0	21173456	2018-02-28 07:37:36.047796	2018-02-28 07:37:36.047796
514	1	1	2017-05-31	2017	5	4	3	0	0	463050	897827	1213021	733209	1266376	1788501	1989162	2590366	3244516	1738830	0	0	0	15924861	2018-02-28 07:37:36.053936	2018-02-28 07:37:36.053936
515	1	1	2017-06-01	2017	5	4	4	0	0	628425	1213929	2490970	1253327	690657	1140768	2548837	2206018	2773484	1329046	0	0	0	16275465	2018-02-28 07:37:36.059949	2018-02-28 07:37:36.059949
516	1	1	2017-06-02	2017	5	4	5	0	0	529200	413090	728220	1266090	842334	1038575	2609917	2873459	3076596	1926684	0	0	0	15304170	2018-02-28 07:37:36.066122	2018-02-28 07:37:36.066122
517	1	1	2017-06-03	2017	5	4	6	0	0	628425	970126	923158	1216253	884160	884282	2108471	1816942	3655615	1627278	0	0	0	14714716	2018-02-28 07:37:36.073704	2018-02-28 07:37:36.073704
518	1	1	2017-06-04	2017	5	4	7	0	0	529200	1040094	729900	1064046	2064244	2041075	2153978	2596275	1367525	1797782	0	0	0	15384126	2018-02-28 07:37:36.079781	2018-02-28 07:37:36.079781
519	1	1	2017-06-05	2017	6	1	1	0	0	562275	686730	1392597	701020	1745348	2488614	2189321	3068689	3165052	2292410	0	0	0	18292057	2018-02-28 07:37:36.085521	2018-02-28 07:37:36.085521
520	1	1	2017-06-06	2017	6	1	2	0	0	463050	1938114	831130	1448225	1239038	1631648	5175334	1705734	3528908	1657991	0	0	0	19619174	2018-02-28 07:37:36.091222	2018-02-28 07:37:36.091222
521	1	1	2017-06-07	2017	6	1	3	0	0	793800	1103171	1097375	2753357	3398038	3829906	4407521	9871105	3390551	2845656	0	0	0	33490483	2018-02-28 07:37:36.09707	2018-02-28 07:37:36.09707
522	1	1	2017-06-08	2017	6	1	4	0	0	1005480	1328194	1622416	1850539	1625510	1947070	2737497	7336514	7974916	3235642	0	0	0	30663782	2018-02-28 07:37:36.102962	2018-02-28 07:37:36.102962
523	1	1	2017-06-09	2017	6	1	5	0	0	595350	1117219	962410	520888	954616	1813954	2515260	3585582	2611657	1217921	0	0	0	15894862	2018-02-28 07:37:36.108736	2018-02-28 07:37:36.108736
524	1	1	2017-06-10	2017	6	1	6	0	0	429975	1390766	630064	766775	1014013	1898237	1440461	3504257	4131951	1102501	0	0	0	16309006	2018-02-28 07:37:36.115156	2018-02-28 07:37:36.115156
525	1	1	2017-06-11	2017	6	1	7	0	0	429975	881774	1780979	1543136	582179	1732176	1379182	4703508	2311267	2492246	0	0	0	17836429	2018-02-28 07:37:36.122432	2018-02-28 07:37:36.122432
526	1	1	2017-06-12	2017	6	2	1	0	0	562275	344865	569186	1208845	1019696	1501004	2204340	4531629	1856548	1154235	0	0	0	14952624	2018-02-28 07:37:36.128819	2018-02-28 07:37:36.128819
527	1	1	2017-06-13	2017	6	2	2	0	0	529200	809665	1377922	939291	1211960	2473096	3689878	2840188	2962218	2152923	0	0	0	18986343	2018-02-28 07:37:36.135458	2018-02-28 07:37:36.135458
528	1	1	2017-06-14	2017	6	2	3	0	0	859950	1199685	2971740	3564049	1301873	2343811	6885155	7532071	4649363	5756394	0	0	0	37064094	2018-02-28 07:37:36.141688	2018-02-28 07:37:36.141688
529	1	1	2017-06-15	2017	6	2	4	0	0	899640	2853145	1852927	2549240	3406920	2174868	3621097	7047393	9068030	3731008	0	0	0	37204272	2018-02-28 07:37:36.147824	2018-02-28 07:37:36.147824
530	1	1	2017-06-16	2017	6	2	5	0	0	429975	433399	1455057	1766540	1252880	795375	1947530	2248016	2371813	1691412	0	0	0	14392002	2018-02-28 07:37:36.15389	2018-02-28 07:37:36.15389
531	1	1	2017-06-17	2017	6	2	6	0	0	463050	1515974	860819	1242300	1213472	2902098	3371668	2959773	3044872	1413032	0	0	0	18987064	2018-02-28 07:37:36.160002	2018-02-28 07:37:36.160002
532	1	1	2017-06-18	2017	6	2	7	0	0	496125	613102	1023982	2102183	550854	1156843	1134036	2616239	2813503	1265540	0	0	0	13772414	2018-02-28 07:37:36.165994	2018-02-28 07:37:36.165994
533	1	1	2017-06-19	2017	6	3	1	0	0	330750	889360	934297	1088790	927387	2071327	1741785	1735272	2075017	1314079	0	0	0	13108065	2018-02-28 07:37:36.172383	2018-02-28 07:37:36.172383
534	1	1	2017-06-20	2017	6	3	2	0	0	661500	841158	1663249	1417680	1951868	2156217	4962346	3357669	2027142	3398933	0	0	0	22437764	2018-02-28 07:37:36.178496	2018-02-28 07:37:36.178496
535	1	1	2017-06-21	2017	6	3	3	0	0	727650	1683081	1380612	2938919	1756230	5607739	6423714	4730845	4799289	3449619	0	0	0	33497701	2018-02-28 07:37:36.185019	2018-02-28 07:37:36.185019
536	1	1	2017-06-22	2017	6	3	4	0	0	476280	1041215	2575658	3711929	3179628	3875060	3011343	9542030	7404504	1849677	0	0	0	36667328	2018-02-28 07:37:36.190993	2018-02-28 07:37:36.190993
537	1	1	2017-06-23	2017	6	3	5	0	0	297675	644307	2215658	1742461	773914	2368844	3565752	1477976	1895802	974949	0	0	0	15957343	2018-02-28 07:37:36.196938	2018-02-28 07:37:36.196938
538	1	1	2017-06-24	2017	6	3	6	0	0	529200	1307132	416015	2050204	1551695	1598476	2600566	4942179	2309839	1146956	0	0	0	18452268	2018-02-28 07:37:36.202775	2018-02-28 07:37:36.202775
539	1	1	2017-06-25	2017	6	3	7	0	0	396900	810819	895794	930839	1077127	1117280	2815090	4000843	1702992	1066985	0	0	0	14814676	2018-02-28 07:37:36.208841	2018-02-28 07:37:36.208841
540	1	1	2017-06-26	2017	6	4	1	0	0	463050	835803	1343362	737351	1714005	1714966	2161888	2284286	2246335	2465432	0	0	0	15966479	2018-02-28 07:37:36.214796	2018-02-28 07:37:36.214796
541	1	1	2017-06-27	2017	6	4	2	0	0	595350	1751514	1104760	1058344	751320	3102077	2563865	3177315	4680504	1862830	0	0	0	20647881	2018-02-28 07:37:36.221104	2018-02-28 07:37:36.221104
542	1	1	2017-06-28	2017	6	4	3	0	0	793800	1850166	2017291	2202772	2754922	2388183	6359888	4375023	6074366	3443912	0	0	0	32260326	2018-02-28 07:37:36.227503	2018-02-28 07:37:36.227503
543	1	1	2017-06-29	2017	6	4	4	0	0	952560	827599	882932	2584553	1999670	2304551	6228893	7676547	10044399	1949463	0	0	0	35451171	2018-02-28 07:37:36.233772	2018-02-28 07:37:36.233772
544	1	1	2017-06-30	2017	6	4	5	0	0	363825	1024731	1141526	938717	1704530	1046960	3028781	2875747	1765257	1827663	0	0	0	15717742	2018-02-28 07:37:36.241734	2018-02-28 07:37:36.241734
545	1	1	2017-07-01	2017	6	4	6	0	0	595350	955280	2159591	1411033	792965	2228287	3183554	2495684	3886310	1722917	0	0	0	19430977	2018-02-28 07:37:36.248757	2018-02-28 07:37:36.248757
546	1	1	2017-07-02	2017	6	4	7	0	0	529200	772047	543461	1065965	1005395	1095324	2156875	1866416	1530463	1395500	0	0	0	11960653	2018-02-28 07:37:36.254463	2018-02-28 07:37:36.254463
547	1	1	2017-07-03	2017	7	1	1	0	0	479904	767846	1280497	2979282	1460831	2162202	436755	897793	1486562	1103003	0	0	0	13054676	2018-02-28 07:37:36.26046	2018-02-28 07:37:36.26046
548	1	1	2017-07-04	2017	7	1	2	0	0	536363	406507	1209358	2512639	2448839	2046798	566723	1980495	2086069	626462	0	0	0	14420255	2018-02-28 07:37:36.266421	2018-02-28 07:37:36.266421
549	1	1	2017-07-05	2017	7	1	3	0	0	479904	632344	853664	1626396	3212622	887663	909478	1787811	2189433	798150	0	0	0	13377468	2018-02-28 07:37:36.273674	2018-02-28 07:37:36.273674
550	1	1	2017-07-06	2017	7	1	4	0	0	479904	542009	995942	1448077	3035731	788098	1335200	970806	2319207	1659949	0	0	0	13574927	2018-02-28 07:37:36.279792	2018-02-28 07:37:36.279792
551	1	1	2017-07-07	2017	7	1	5	0	0	141148	316172	355693	1220663	1323611	401933	462622	459411	844523	383897	0	0	0	5909678	2018-02-28 07:37:36.285607	2018-02-28 07:37:36.285607
552	1	1	2017-07-08	2017	7	1	6	0	0	155263	293588	569109	517941	2062892	476551	302171	603387	955846	257179	0	0	0	6193933	2018-02-28 07:37:36.291415	2018-02-28 07:37:36.291415
553	1	1	2017-07-09	2017	7	1	7	0	0	338756	632344	924803	1946836	3873623	666885	554749	901047	2359107	795561	0	0	0	12993718	2018-02-28 07:37:36.297085	2018-02-28 07:37:36.297085
554	1	1	2017-07-10	2017	7	2	1	0	0	536363	767846	1422774	1801640	2919363	1318482	960002	736208	1063896	1656758	0	0	0	13183333	2018-02-28 07:37:36.303167	2018-02-28 07:37:36.303167
555	1	1	2017-07-11	2017	7	2	2	0	0	254067	903348	1422774	1997794	3511490	1223001	382406	1030148	1643588	1276464	0	0	0	13645082	2018-02-28 07:37:36.309543	2018-02-28 07:37:36.309543
556	1	1	2017-07-12	2017	7	2	3	0	0	423444	542009	1280497	1346306	2105854	1691078	720510	1277044	2427428	724947	0	0	0	12539120	2018-02-28 07:37:36.316299	2018-02-28 07:37:36.316299
557	1	1	2017-07-13	2017	7	2	4	0	0	451674	496841	1138219	2245796	3480874	1340748	1405645	1451762	1040520	886343	0	0	0	13938426	2018-02-28 07:37:36.32242	2018-02-28 07:37:36.32242
558	1	1	2017-07-14	2017	7	2	5	0	0	169378	203253	569109	1662192	747447	636847	398376	552228	705110	608008	0	0	0	6251953	2018-02-28 07:37:36.328377	2018-02-28 07:37:36.328377
559	1	1	2017-07-15	2017	7	2	6	0	0	254067	271004	355693	843098	1050800	521618	386968	310746	673581	188850	0	0	0	4856431	2018-02-28 07:37:36.334168	2018-02-28 07:37:36.334168
560	1	1	2017-07-16	2017	7	2	7	0	0	338756	677511	924803	2466354	1904611	1132678	711872	1069669	1932798	1561196	0	0	0	12720255	2018-02-28 07:37:36.340187	2018-02-28 07:37:36.340187
561	1	1	2017-07-17	2017	7	3	1	0	0	366985	767846	640248	3404673	1684841	1188452	1090936	1319429	1256558	737083	0	0	0	12457052	2018-02-28 07:37:36.34646	2018-02-28 07:37:36.34646
562	1	1	2017-07-18	2017	7	3	2	0	0	564593	496841	1138219	1538508	3135605	1390440	534167	2050300	1743976	985223	0	0	0	13577874	2018-02-28 07:37:36.352946	2018-02-28 07:37:36.352946
563	1	1	2017-07-19	2017	7	3	3	0	0	564593	722678	1422774	1413120	969138	1303791	1323902	1088506	1531413	1411099	0	0	0	11751017	2018-02-28 07:37:36.359313	2018-02-28 07:37:36.359313
564	1	1	2017-07-20	2017	7	3	4	0	0	451674	677511	711387	3008882	2452346	1126190	553962	1178066	1435881	930845	0	0	0	12526748	2018-02-28 07:37:36.36528	2018-02-28 07:37:36.36528
565	1	1	2017-07-21	2017	7	3	5	0	0	282296	338756	533540	1208299	1950576	574302	503556	559700	509189	330220	0	0	0	6790439	2018-02-28 07:37:36.371279	2018-02-28 07:37:36.371279
566	1	1	2017-07-22	2017	7	3	6	0	0	254067	271004	355693	2068222	720126	461581	680978	894593	390868	476551	0	0	0	6573689	2018-02-28 07:37:36.377914	2018-02-28 07:37:36.377914
567	1	1	2017-07-23	2017	7	3	7	0	0	423444	406507	711387	2887760	2899771	907250	537146	896582	1543344	747134	0	0	0	11960332	2018-02-28 07:37:36.383933	2018-02-28 07:37:36.383933
568	1	1	2017-07-24	2017	7	4	1	0	0	310526	903348	1067081	1665635	1387527	1052532	542037	1212460	882078	559763	0	0	0	9582988	2018-02-28 07:37:36.389836	2018-02-28 07:37:36.389836
569	1	1	2017-07-25	2017	7	4	2	0	0	254067	722678	1280497	1771901	2957565	2238102	1046455	1023507	1657625	819179	0	0	0	13771578	2018-02-28 07:37:36.395964	2018-02-28 07:37:36.395964
570	1	1	2017-07-26	2017	7	4	3	0	0	310526	632344	995942	3077216	1184460	893026	831762	737932	869979	773996	0	0	0	10307186	2018-02-28 07:37:36.402417	2018-02-28 07:37:36.402417
571	1	1	2017-07-27	2017	7	4	4	0	0	508133	632344	640248	2371235	1785731	824354	1014408	1091909	1150808	871658	0	0	0	10890832	2018-02-28 07:37:36.411319	2018-02-28 07:37:36.411319
572	1	1	2017-07-28	2017	7	4	5	0	0	239952	406507	569109	1502659	846642	918691	672123	627390	957980	380096	0	0	0	7121154	2018-02-28 07:37:36.417418	2018-02-28 07:37:36.417418
573	1	1	2017-07-29	2017	7	4	6	0	0	211722	293588	640247	1062192	1048016	610244	253090	397184	423198	300160	0	0	0	5239647	2018-02-28 07:37:36.423044	2018-02-28 07:37:36.423044
574	1	1	2017-07-30	2017	7	4	7	0	0	366985	813013	1280497	3165946	1704761	1406175	975070	1308523	1667769	467958	0	0	0	13156704	2018-02-28 07:37:36.428809	2018-02-28 07:37:36.428809
575	1	1	2017-07-31	2017	8	1	1	0	0	564593	542009	1280497	1018803	5046759	633423	1050532	1657732	1862192	912530	0	0	0	14569071	2018-02-28 07:37:36.434553	2018-02-28 07:37:36.434553
576	1	1	2017-08-01	2017	8	1	2	0	0	536363	587176	1138219	2117623	1705024	1567588	925763	783768	1171357	795584	0	0	0	11328467	2018-02-28 07:37:36.440417	2018-02-28 07:37:36.440417
577	1	1	2017-08-02	2017	8	1	3	0	0	423444	1355022	1493912	1632514	4359535	970817	702430	2648918	2259526	961099	0	0	0	16807220	2018-02-28 07:37:36.446967	2018-02-28 07:37:36.446967
578	1	1	2017-08-03	2017	8	1	4	0	0	719855	1355022	1707328	2319968	4074316	2330082	1586473	995333	4176324	1629103	0	0	0	20893808	2018-02-28 07:37:36.453604	2018-02-28 07:37:36.453604
579	1	1	2017-08-04	2017	8	1	5	0	0	762200	880764	1280496	4404452	3582562	2801029	2324280	2318220	1316753	1451849	0	0	0	21122610	2018-02-28 07:37:36.459662	2018-02-28 07:37:36.459662
580	1	1	2017-08-05	2017	8	1	6	0	0	804544	880764	1814036	2662025	5269192	1462923	1830670	2022959	1041232	1710174	0	0	0	19498525	2018-02-28 07:37:36.465531	2018-02-28 07:37:36.465531
581	1	1	2017-08-06	2017	8	1	7	0	0	275239	406507	533540	1622713	2141441	644428	835488	1108710	1061352	286861	0	0	0	8916286	2018-02-28 07:37:36.471249	2018-02-28 07:37:36.471249
582	1	1	2017-08-07	2017	8	2	1	0	0	402272	643635	746956	2206005	1139927	540351	437294	682663	1055044	323265	0	0	0	8177413	2018-02-28 07:37:36.477651	2018-02-28 07:37:36.477651
583	1	1	2017-08-08	2017	8	2	2	0	0	381100	1219520	1280496	1985079	3882264	1728871	1001101	1386477	3968236	1987565	0	0	0	18820711	2018-02-28 07:37:36.483522	2018-02-28 07:37:36.483522
584	1	1	2017-08-09	2017	8	2	3	0	0	719855	1219520	1600620	5851688	3134273	1181462	1543906	2411623	1952124	1993365	0	0	0	21608439	2018-02-28 07:37:36.489687	2018-02-28 07:37:36.489687
585	1	1	2017-08-10	2017	8	2	4	0	0	762200	1016267	1387204	5704524	5575874	1644010	1841965	1464723	3118596	1920914	0	0	0	24436281	2018-02-28 07:37:36.496061	2018-02-28 07:37:36.496061
586	1	1	2017-08-11	2017	8	2	5	0	0	423444	1151769	1280496	2884028	3019211	2229221	1069355	1248241	2184440	1086809	0	0	0	16577019	2018-02-28 07:37:36.502768	2018-02-28 07:37:36.502768
587	1	1	2017-08-12	2017	8	2	6	0	0	508133	677511	1387204	2547289	1872650	1266647	631460	1955709	2133362	2002359	0	0	0	14982330	2018-02-28 07:37:36.508768	2018-02-28 07:37:36.508768
588	1	1	2017-08-13	2017	8	2	7	0	0	275239	575884	480186	875135	2421916	551441	891110	1414675	385070	564131	0	0	0	8434794	2018-02-28 07:37:36.514721	2018-02-28 07:37:36.514721
589	1	1	2017-08-14	2017	8	3	1	0	0	275239	609760	1067080	1038744	994404	836267	723543	1169845	709622	708218	0	0	0	8132723	2018-02-28 07:37:36.520769	2018-02-28 07:37:36.520769
590	1	1	2017-08-15	2017	8	3	2	0	0	381100	880764	1493912	2085264	3675496	998167	1714240	2761191	1621820	2038722	0	0	0	17650678	2018-02-28 07:37:36.526298	2018-02-28 07:37:36.526298
591	1	1	2017-08-16	2017	8	3	3	0	0	719855	745262	1387204	3544025	2598956	2820655	995102	1936624	2310210	1215316	0	0	0	18273212	2018-02-28 07:37:36.532034	2018-02-28 07:37:36.532034
592	1	1	2017-08-17	2017	8	3	4	0	0	719855	948515	2134160	1814282	2076633	2011179	749869	1720446	4169954	1247605	0	0	0	17592502	2018-02-28 07:37:36.538438	2018-02-28 07:37:36.538438
593	1	1	2017-08-18	2017	8	3	5	0	0	381100	1084018	1067080	2040746	6072658	1789657	1049612	1624920	2317980	1488716	0	0	0	18916492	2018-02-28 07:37:36.544434	2018-02-28 07:37:36.544434
594	1	1	2017-08-19	2017	8	3	6	0	0	677511	1287271	1387204	3590819	4612647	1321332	2156270	3576080	2300368	2129691	0	0	0	23039199	2018-02-28 07:37:36.550577	2018-02-28 07:37:36.550577
595	1	1	2017-08-20	2017	8	3	7	0	0	275239	677511	533540	1796558	1430909	1249346	457155	1056797	456504	868758	0	0	0	8802324	2018-02-28 07:37:36.556826	2018-02-28 07:37:36.556826
596	1	1	2017-08-21	2017	8	4	1	0	0	423444	372631	853664	892037	2404954	896498	502636	812183	945303	577834	0	0	0	8681185	2018-02-28 07:37:36.563811	2018-02-28 07:37:36.563811
597	1	1	2017-08-22	2017	8	4	2	0	0	550478	745262	1493912	2817205	6449134	1603976	1625526	2779257	2107987	1886880	0	0	0	22059619	2018-02-28 07:37:36.570762	2018-02-28 07:37:36.570762
598	1	1	2017-08-23	2017	8	4	3	0	0	846889	609760	1280496	1611836	1690366	1487958	1611945	1850230	1991777	1549036	0	0	0	14530296	2018-02-28 07:37:36.577045	2018-02-28 07:37:36.577045
599	1	1	2017-08-24	2017	8	4	4	0	0	465789	745262	1067080	5844168	3434634	2369396	1553271	2046035	1314526	1643835	0	0	0	20484000	2018-02-28 07:37:36.58273	2018-02-28 07:37:36.58273
600	1	1	2017-08-25	2017	8	4	5	0	0	592822	1219520	1280496	3041134	3509094	1642621	1365254	2905384	2342860	2312786	0	0	0	20211976	2018-02-28 07:37:36.588782	2018-02-28 07:37:36.588782
601	1	1	2017-08-26	2017	8	4	6	0	0	423444	948515	1814036	3164096	2830464	1452365	986527	1207387	4016594	1988664	0	0	0	18832098	2018-02-28 07:37:36.594417	2018-02-28 07:37:36.594417
602	1	1	2017-08-27	2017	8	4	7	0	0	423444	575884	586894	2296758	3622820	1188819	623058	935476	783229	787818	0	0	0	11824207	2018-02-28 07:37:36.601089	2018-02-28 07:37:36.601089
603	1	1	2017-08-28	2017	9	1	1	0	0	232894	542009	1013726	1488921	3578013	1629176	828240	1235733	1048223	669267	0	0	0	12266203	2018-02-28 07:37:36.608424	2018-02-28 07:37:36.608424
604	1	1	2017-08-29	2017	9	1	2	0	0	719855	1219520	1600620	3115509	2620746	3387506	843746	1338827	2678843	1366605	0	0	0	18891779	2018-02-28 07:37:36.615326	2018-02-28 07:37:36.615326
605	1	1	2017-08-30	2017	9	1	3	0	0	508133	948515	960372	2338911	3278032	1814119	1648995	1805014	964334	2214420	0	0	0	16480848	2018-02-28 07:37:36.621542	2018-02-28 07:37:36.621542
606	1	1	2017-08-31	2017	9	1	4	0	0	423444	1355022	1814036	4423159	6278056	3157038	1034297	1767144	1006288	1873728	0	0	0	23132216	2018-02-28 07:37:36.627565	2018-02-28 07:37:36.627565
607	1	1	2017-09-01	2017	9	1	5	0	0	220500	572713	991321	1186200	997450	1195260	1596256	1415983	2017838	1149589	0	0	0	11343115	2018-02-28 07:37:36.633654	2018-02-28 07:37:36.633654
608	1	1	2017-09-02	2017	9	1	6	0	0	308700	543078	869543	1136666	958532	732822	1110204	1789407	846440	942975	0	0	0	9238373	2018-02-28 07:37:36.639436	2018-02-28 07:37:36.639436
609	1	1	2017-09-03	2017	9	1	7	0	0	264600	408671	710725	1388550	475322	1458594	2788750	999528	1949322	2099426	0	0	0	12543495	2018-02-28 07:37:36.64539	2018-02-28 07:37:36.64539
610	1	1	2017-09-04	2017	9	2	1	0	0	308700	355424	853942	831424	779303	931471	2453624	1081980	1683406	1519889	0	0	0	10799164	2018-02-28 07:37:36.651961	2018-02-28 07:37:36.651961
611	1	1	2017-09-05	2017	9	2	2	0	0	220500	666848	314185	577170	859933	1589261	1240777	2052305	1235868	1129421	0	0	0	9886270	2018-02-28 07:37:36.65836	2018-02-28 07:37:36.65836
612	1	1	2017-09-06	2017	9	2	3	0	0	617400	629523	1500971	1052942	2278870	1957602	5285174	2750449	6320277	2890759	0	0	0	25283970	2018-02-28 07:37:36.665219	2018-02-28 07:37:36.665219
613	1	1	2017-09-07	2017	9	2	4	0	0	670320	1285898	1369082	2111472	1061810	1264916	2597256	3591205	2772518	3088499	0	0	0	19812980	2018-02-28 07:37:36.671013	2018-02-28 07:37:36.671013
614	1	1	2017-09-08	2017	9	2	5	0	0	308700	812045	1294168	894818	1060933	1434168	1471280	1732833	1171046	1318074	0	0	0	11498070	2018-02-28 07:37:36.676906	2018-02-28 07:37:36.676906
615	1	1	2017-09-09	2017	9	2	6	0	0	441000	344556	938343	538821	775392	906596	1988889	2549527	2009437	1029716	0	0	0	11522283	2018-02-28 07:37:36.682498	2018-02-28 07:37:36.682498
616	1	1	2017-09-10	2017	9	2	7	0	0	264600	269435	373510	1025542	1157206	1001530	1044252	1327295	1531967	1968978	0	0	0	9964322	2018-02-28 07:37:36.688578	2018-02-28 07:37:36.688578
617	1	1	2017-09-11	2017	9	3	1	0	0	396900	629309	780013	590507	887666	1684590	1278651	1757898	714195	942220	0	0	0	9661950	2018-02-28 07:37:36.694326	2018-02-28 07:37:36.694326
618	1	1	2017-09-12	2017	9	3	2	0	0	264600	376507	614115	1324823	507026	1135573	1172666	1434000	859325	1224475	0	0	0	8913112	2018-02-28 07:37:36.700592	2018-02-28 07:37:36.700592
619	1	1	2017-09-13	2017	9	3	3	0	0	529200	851739	1933771	2456563	1511166	1298363	2528880	4129523	4872231	3809166	0	0	0	23920605	2018-02-28 07:37:36.706246	2018-02-28 07:37:36.706246
620	1	1	2017-09-14	2017	9	3	4	0	0	635040	715896	760040	1723536	1408302	1545967	2769623	1611985	5789050	1552913	0	0	0	18512356	2018-02-28 07:37:36.71173	2018-02-28 07:37:36.71173
621	1	1	2017-09-15	2017	9	3	5	0	0	396900	567826	954392	697379	1011335	1056866	1351063	1376579	2364567	791717	0	0	0	10568629	2018-02-28 07:37:36.717882	2018-02-28 07:37:36.717882
622	1	1	2017-09-16	2017	9	3	6	0	0	374850	365864	839152	680820	1053353	1170630	2574035	1754628	1354643	917017	0	0	0	11084998	2018-02-28 07:37:36.724714	2018-02-28 07:37:36.724714
623	1	1	2017-09-17	2017	9	3	7	0	0	374850	402056	1348909	1481368	581867	1375510	1751956	1588766	1793450	1290089	0	0	0	11988828	2018-02-28 07:37:36.730487	2018-02-28 07:37:36.730487
624	1	1	2017-09-18	2017	9	4	1	0	0	418950	353772	439912	789795	592911	1220334	2280800	2428269	2725258	648180	0	0	0	11898182	2018-02-28 07:37:36.736103	2018-02-28 07:37:36.736103
625	1	1	2017-09-19	2017	9	4	2	0	0	198450	637270	457097	927744	1021417	1339768	1176993	2327050	1803474	798246	0	0	0	10687511	2018-02-28 07:37:36.741863	2018-02-28 07:37:36.741863
626	1	1	2017-09-20	2017	9	4	3	0	0	837900	2259980	1809997	1697753	1397277	2463029	2714802	2954239	5747258	2508756	0	0	0	24390994	2018-02-28 07:37:36.747819	2018-02-28 07:37:36.747819
627	1	1	2017-09-21	2017	9	4	4	0	0	529200	770431	980685	1605704	1625924	1341716	4999448	4168559	3310284	1573708	0	0	0	20905663	2018-02-28 07:37:36.75424	2018-02-28 07:37:36.75424
628	1	1	2017-09-22	2017	9	4	5	0	0	330750	670928	569626	1172405	1065771	1275592	1500616	1213119	1870218	1027076	0	0	0	10696106	2018-02-28 07:37:36.761047	2018-02-28 07:37:36.761047
629	1	1	2017-09-23	2017	9	4	6	0	0	220500	616044	1138308	717850	1225688	1032425	1587103	2891798	1431244	1068770	0	0	0	11929736	2018-02-28 07:37:36.767309	2018-02-28 07:37:36.767309
630	1	1	2017-09-24	2017	9	4	7	0	0	374850	651353	973308	976604	526927	1386900	2242228	1238204	2758511	1242379	0	0	0	12371271	2018-02-28 07:37:36.773046	2018-02-28 07:37:36.773046
631	1	1	2017-09-25	2017	10	1	1	0	0	396900	795765	917072	1038870	762778	910710	1313646	1324525	2789770	1462442	0	0	0	11712479	2018-02-28 07:37:36.778944	2018-02-28 07:37:36.778944
632	1	1	2017-09-26	2017	10	1	2	0	0	418950	629036	357436	535978	338928	1192333	1373466	1824853	1963038	1064120	0	0	0	9698140	2018-02-28 07:37:36.784608	2018-02-28 07:37:36.784608
633	1	1	2017-09-27	2017	10	1	3	0	0	837900	1382442	1218885	1848300	1232195	3215975	2490943	3750729	5392806	1979840	0	0	0	23350018	2018-02-28 07:37:36.790297	2018-02-28 07:37:36.790297
634	1	1	2017-09-28	2017	10	1	4	0	0	599760	1269142	2757260	2244194	2134958	3248724	4929925	2060611	2789125	1898440	0	0	0	23932143	2018-02-28 07:37:36.795855	2018-02-28 07:37:36.795855
635	1	1	2017-09-29	2017	10	1	5	0	0	429975	1035954	1288835	666554	1042898	1676720	3182659	2590366	2481101	1304123	0	0	0	15699190	2018-02-28 07:37:36.802192	2018-02-28 07:37:36.802192
636	1	1	2017-09-30	2017	10	1	6	0	0	628425	944167	1619131	810976	627870	1254845	1649248	1866631	3169696	2104322	0	0	0	14675317	2018-02-28 07:37:36.809253	2018-02-28 07:37:36.809253
637	1	1	2017-10-01	2017	10	1	7	0	0	429975	660944	860623	1191614	842334	1298219	2319926	3042486	2221986	912640	0	0	0	13780754	2018-02-28 07:37:36.815764	2018-02-28 07:37:36.815764
638	1	1	2017-10-02	2017	10	2	1	0	0	463050	970126	865461	781877	1277120	1965070	2530165	2826354	4061794	1712924	0	0	0	17453942	2018-02-28 07:37:36.821672	2018-02-28 07:37:36.821672
639	1	1	2017-10-03	2017	10	2	2	0	0	429975	550638	778560	2128092	2064244	1530806	2937243	2832300	2735050	1419302	0	0	0	17406212	2018-02-28 07:37:36.82758	2018-02-28 07:37:36.82758
640	1	1	2017-10-04	2017	10	2	3	0	0	562275	686730	732946	817856	1194185	1702736	2694549	5300462	3340888	1031585	0	0	0	18064215	2018-02-28 07:37:36.833501	2018-02-28 07:37:36.833501
641	1	1	2017-10-05	2017	10	2	4	0	0	628425	1841208	1246694	2116636	681471	1359707	5175334	2729174	2587866	2072489	0	0	0	20439008	2018-02-28 07:37:36.839379	2018-02-28 07:37:36.839379
642	1	1	2017-10-06	2017	10	2	5	0	0	992250	1103171	2072820	1781584	3398038	4787382	8013674	10419499	3729606	3414787	0	0	0	39712816	2018-02-28 07:37:36.846234	2018-02-28 07:37:36.846234
643	1	1	2017-10-07	2017	10	2	6	0	0	582120	1438876	1622416	3084231	2113163	2246619	4258328	4126789	7505803	4729015	0	0	0	31707366	2018-02-28 07:37:36.853442	2018-02-28 07:37:36.853442
644	1	1	2017-10-08	2017	10	2	7	0	0	595350	907741	481205	1041775	954616	1179070	2724865	4866147	2052016	1759219	0	0	0	16562011	2018-02-28 07:37:36.860465	2018-02-28 07:37:36.860465
645	1	1	2017-10-09	2017	10	3	1	0	0	661500	1081707	735074	1061689	823885	1898237	1584507	5006082	2609653	1715001	0	0	0	17177336	2018-02-28 07:37:36.867399	2018-02-28 07:37:36.867399
646	1	1	2017-10-10	2017	10	3	2	0	0	330750	1234484	1484150	868014	698615	2165220	2620446	4442202	1877905	2024950	0	0	0	17746738	2018-02-28 07:37:36.874006	2018-02-28 07:37:36.874006
647	1	1	2017-10-11	2017	10	3	3	0	0	297675	551784	626105	949807	926996	1801204	2755425	2832268	3375542	1269659	0	0	0	15386468	2018-02-28 07:37:36.880727	2018-02-28 07:37:36.880727
648	1	1	2017-10-12	2017	10	3	4	0	0	595350	520499	1377922	1148023	1118732	2119796	3162752	1966284	2406802	1435282	0	0	0	15851446	2018-02-28 07:37:36.889712	2018-02-28 07:37:36.889712
649	1	1	2017-10-13	2017	10	3	5	0	0	926100	2266071	2971740	3376467	1562248	2343811	4426171	4184484	5424257	6475943	0	0	0	33957297	2018-02-28 07:37:36.897877	2018-02-28 07:37:36.897877
650	1	1	2017-10-14	2017	10	3	6	0	0	635040	1501655	2695166	2999106	2868986	2951606	5925431	7517219	7858959	3938286	0	0	0	38891460	2018-02-28 07:37:36.904791	2018-02-28 07:37:36.904791
651	1	1	2017-10-15	2017	10	3	7	0	0	496125	433399	1616730	1668399	1879321	1272600	3009819	1605726	1581209	890217	0	0	0	14453552	2018-02-28 07:37:36.911246	2018-02-28 07:37:36.911246
652	1	1	2017-10-16	2017	10	4	1	0	0	396900	1326478	1635556	993840	1284853	2176574	2129474	2367818	2283654	1059774	0	0	0	15654922	2018-02-28 07:37:36.918326	2018-02-28 07:37:36.918326
653	1	1	2017-10-17	2017	10	4	2	0	0	297675	481723	1023982	1438336	856884	2313686	1814458	1846757	4019290	2671696	0	0	0	16764489	2018-02-28 07:37:36.924622	2018-02-28 07:37:36.924622
654	1	1	2017-10-18	2017	10	4	3	0	0	396900	575468	1358978	1682675	811464	1380884	2322380	2602908	4380591	1752106	0	0	0	17264357	2018-02-28 07:37:36.93094	2018-02-28 07:37:36.93094
655	1	1	2017-10-19	2017	10	4	4	0	0	363825	791678	1271897	866360	1951868	2156217	2481173	3805358	2477618	2265955	0	0	0	18431953	2018-02-28 07:37:36.937237	2018-02-28 07:37:36.937237
656	1	1	2017-10-20	2017	10	4	5	0	0	595350	2142104	1506122	3457552	1609878	5277872	7800224	10512988	6645170	5307106	0	0	0	44854371	2018-02-28 07:37:36.962903	2018-02-28 07:37:36.962903
657	1	1	2017-10-21	2017	10	4	6	0	0	529200	1272597	1770765	2735106	2384721	3875060	3242985	8587827	11723798	1849677	0	0	0	37971742	2018-02-28 07:37:36.97568	2018-02-28 07:37:36.97568
658	1	1	2017-10-22	2017	10	4	7	0	0	562275	579876	1218612	1127475	1006088	2119492	3387464	2463294	2654123	1329476	0	0	0	16448182	2018-02-28 07:37:36.982152	2018-02-28 07:37:36.982152
659	1	1	2017-10-23	2017	10	5	1	0	0	529200	1537802	462239	1537653	1825524	1465269	2167138	3197880	1979862	882274	0	0	0	15584842	2018-02-28 07:37:36.987975	2018-02-28 07:37:36.987975
660	1	1	2017-10-24	2017	10	5	2	0	0	363825	1261274	1990654	1241118	1166888	2358702	3897817	3294812	1459708	1707176	0	0	0	18741976	2018-02-28 07:37:36.993867	2018-02-28 07:37:36.993867
661	1	1	2017-10-25	2017	10	5	3	0	0	429975	603636	1511282	1253497	1310709	1200476	2161888	3945586	2085883	2465432	0	0	0	16968367	2018-02-28 07:37:36.999788	2018-02-28 07:37:36.999788
662	1	1	2017-10-26	2017	10	5	4	0	0	429975	1138484	903894	764360	887923	2612275	1880167	2753673	3120336	2292714	0	0	0	16783805	2018-02-28 07:37:37.00763	2018-02-28 07:37:37.00763
663	1	1	2017-10-27	2017	10	5	5	0	0	595350	2220199	4034582	2753465	2410556	2388183	8479850	7000037	9111550	2817746	0	0	0	41811523	2018-02-28 07:37:37.014102	2018-02-28 07:37:37.014102
664	1	1	2017-10-28	2017	10	5	6	0	0	635040	827599	971225	1723035	2532915	3072734	6574942	4064054	9515747	3032498	0	0	0	32949795	2018-02-28 07:37:37.021152	2018-02-28 07:37:37.021152
665	1	1	2017-10-29	2017	10	5	7	0	0	330750	819785	1867952	768041	986833	1744934	3407378	2270327	1901046	1462130	0	0	0	15559183	2018-02-28 07:37:37.027399	2018-02-28 07:37:37.027399
666	1	1	2017-10-30	2017	11	1	1	0	0	429975	603335	2039614	1713398	1158949	2104493	2809019	3856967	1943155	1230655	0	0	0	17889561	2018-02-28 07:37:37.03359	2018-02-28 07:37:37.03359
667	1	1	2017-10-31	2017	11	1	2	0	0	363825	1389685	905768	1162871	1182818	1394049	1386563	2281176	1658002	1395500	0	0	0	13120259	2018-02-28 07:37:37.039807	2018-02-28 07:37:37.039807
668	1	1	2017-11-01	2017	11	1	3	0	0	254067	903348	1067081	3329786	1123716	1729762	611457	748161	1486562	882402	0	0	0	12136345	2018-02-28 07:37:37.04606	2018-02-28 07:37:37.04606
669	1	1	2017-11-02	2017	11	1	4	0	0	395215	767846	1351635	1478023	2072094	1939072	523129	1760440	2086069	569511	0	0	0	12943038	2018-02-28 07:37:37.053115	2018-02-28 07:37:37.053115
670	1	1	2017-11-03	2017	11	1	5	0	0	395215	722678	1067081	1626396	2208678	887663	1069974	1599620	2060643	997688	0	0	0	12635641	2018-02-28 07:37:37.059509	2018-02-28 07:37:37.059509
671	1	1	2017-11-04	2017	11	1	6	0	0	536363	496841	853664	1524292	3035731	716453	1201680	1456209	1098572	1014413	0	0	0	11934224	2018-02-28 07:37:37.065687	2018-02-28 07:37:37.065687
672	1	1	2017-11-05	2017	11	1	7	0	0	127033	271004	640247	1436074	1654514	535910	498208	826940	894200	531549	0	0	0	7415686	2018-02-28 07:37:37.072189	2018-02-28 07:37:37.072189
673	1	1	2017-11-06	2017	11	2	1	0	0	282296	361339	320124	517941	2426932	741301	348659	689586	754616	371480	0	0	0	6814275	2018-02-28 07:37:37.079296	2018-02-28 07:37:37.079296
674	1	1	2017-11-07	2017	11	2	2	0	0	564593	767846	995942	2530887	3873623	1030640	554749	540628	1738289	673167	0	0	0	13270366	2018-02-28 07:37:37.086366	2018-02-28 07:37:37.086366
675	1	1	2017-11-08	2017	11	2	3	0	0	536363	542009	1067081	1801640	1946242	1419904	1020002	899810	1182107	1472674	0	0	0	11887835	2018-02-28 07:37:37.093082	2018-02-28 07:37:37.093082
676	1	1	2017-11-09	2017	11	2	4	0	0	536363	542009	640248	3163173	2282469	1128924	807301	1259070	1397050	1021171	0	0	0	12777782	2018-02-28 07:37:37.099614	2018-02-28 07:37:37.099614
677	1	1	2017-11-10	2017	11	2	5	0	0	536363	496841	1138219	2019460	1619888	1513070	917013	1064204	1577828	1318086	0	0	0	12200977	2018-02-28 07:37:37.106118	2018-02-28 07:37:37.106118
678	1	1	2017-11-11	2017	11	2	6	0	0	479904	542009	1067081	3455070	2661845	1266262	1483737	1814702	1474070	1227244	0	0	0	15471930	2018-02-28 07:37:37.113444	2018-02-28 07:37:37.113444
679	1	1	2017-11-12	2017	11	2	7	0	0	155263	271004	640247	1955520	448468	685835	337087	552228	453285	384005	0	0	0	5882949	2018-02-28 07:37:37.121121	2018-02-28 07:37:37.121121
680	1	1	2017-11-13	2017	11	3	1	0	0	282296	429090	320124	907952	853775	405703	548204	586964	625468	209833	0	0	0	5169410	2018-02-28 07:37:37.12805	2018-02-28 07:37:37.12805
681	1	1	2017-11-14	2017	11	3	2	0	0	254067	903348	1351635	2055295	2004854	1294490	667380	2032371	1932798	1014777	0	0	0	13511017	2018-02-28 07:37:37.134849	2018-02-28 07:37:37.134849
682	1	1	2017-11-15	2017	11	3	3	0	0	395215	632344	853664	3782970	2808068	1080411	613652	907107	1256558	793782	0	0	0	13123774	2018-02-28 07:37:37.141045	2018-02-28 07:37:37.141045
683	1	1	2017-11-16	2017	11	3	4	0	0	310526	451674	924803	1461583	1916203	817906	890279	1230180	2280584	919541	0	0	0	11203283	2018-02-28 07:37:37.146889	2018-02-28 07:37:37.146889
684	1	1	2017-11-17	2017	11	3	5	0	0	423444	677511	1351635	997496	1066052	902624	1557532	1741610	957133	1411099	0	0	0	11086141	2018-02-28 07:37:37.153174	2018-02-28 07:37:37.153174
685	1	1	2017-11-18	2017	11	3	6	0	0	310526	451674	1067081	2005921	2452346	1645970	646289	1178066	2219088	1241126	0	0	0	13218093	2018-02-28 07:37:37.15959	2018-02-28 07:37:37.15959
686	1	1	2017-11-19	2017	11	3	7	0	0	239952	316172	533540	1132781	2080614	459442	327311	671639	744200	363242	0	0	0	6868900	2018-02-28 07:37:37.167301	2018-02-28 07:37:37.167301
687	1	1	2017-11-20	2017	11	4	1	0	0	254067	451674	711386	1757989	830915	1025736	374538	596395	825166	448518	0	0	0	7276385	2018-02-28 07:37:37.174418	2018-02-28 07:37:37.174418
688	1	1	2017-11-21	2017	11	4	2	0	0	564593	632344	1138219	2310208	4745079	907250	402860	896582	964590	960601	0	0	0	13522328	2018-02-28 07:37:37.181367	2018-02-28 07:37:37.181367
689	1	1	2017-11-22	2017	11	4	3	0	0	395215	542009	853664	1388030	1783964	1435271	921463	1212460	1249611	951597	0	0	0	10733287	2018-02-28 07:37:37.187303	2018-02-28 07:37:37.187303
690	1	1	2017-11-23	2017	11	4	4	0	0	338756	542009	1067081	1882645	3640080	1678577	677118	1705845	1147586	1134248	0	0	0	13813949	2018-02-28 07:37:37.193819	2018-02-28 07:37:37.193819
691	1	1	2017-11-24	2017	11	4	5	0	0	423444	587176	1351635	3461868	1830529	1190701	720860	664139	1933286	773996	0	0	0	12937639	2018-02-28 07:37:37.199777	2018-02-28 07:37:37.199777
692	1	1	2017-11-25	2017	11	4	6	0	0	423444	767846	1209358	2964044	3174632	755658	563560	1679860	1918014	1072810	0	0	0	14529232	2018-02-28 07:37:37.205789	2018-02-28 07:37:37.205789
693	1	1	2017-11-26	2017	11	4	7	0	0	197607	338756	711386	845246	899557	969730	530624	330205	605040	209053	0	0	0	5637211	2018-02-28 07:37:37.212705	2018-02-28 07:37:37.212705
694	1	1	2017-11-27	2017	12	1	1	0	0	141148	271004	675817	1545006	1370482	406829	414148	364086	536051	475253	0	0	0	6199825	2018-02-28 07:37:37.219382	2018-02-28 07:37:37.219382
695	1	1	2017-11-28	2017	12	1	2	0	0	282296	587176	1422774	1741270	3068570	962120	1500108	1028125	1141105	831925	0	0	0	12565471	2018-02-28 07:37:37.227567	2018-02-28 07:37:37.227567
696	1	1	2017-11-29	2017	12	1	3	0	0	395215	451674	711387	1222564	4205633	1337226	1050532	1409072	1241461	861834	0	0	0	12886601	2018-02-28 07:37:37.235823	2018-02-28 07:37:37.235823
697	1	1	2017-11-30	2017	12	1	4	0	0	338756	406507	853664	4235246	2216531	1410829	1049198	1741706	1268970	795584	0	0	0	14316995	2018-02-28 07:37:37.244037	2018-02-28 07:37:37.244037
698	1	1	2017-12-01	2017	12	1	5	0	0	592822	1219520	1173788	3627808	5152178	1725896	1404860	2648918	2636113	1826088	0	0	0	22007996	2018-02-28 07:37:37.252553	2018-02-28 07:37:37.252553
699	1	1	2017-12-02	2017	12	1	6	0	0	635167	609760	1707328	1221036	6296671	1631057	918485	1719211	3132243	1127840	0	0	0	18998804	2018-02-28 07:37:37.261211	2018-02-28 07:37:37.261211
700	1	1	2017-12-03	2017	12	1	7	0	0	762200	1219520	1173788	2202226	3838460	2211339	2446610	1952186	1609365	1371191	0	0	0	18786892	2018-02-28 07:37:37.269608	2018-02-28 07:37:37.269608
701	1	1	2017-12-04	2017	12	2	1	0	0	804544	948515	1814036	2521919	4159889	2250650	1932374	1888095	1156924	1588019	0	0	0	19064966	2018-02-28 07:37:37.278041	2018-02-28 07:37:37.278041
702	1	1	2017-12-05	2017	12	2	2	0	0	275239	372631	1013726	954537	3059202	937350	417744	1108710	943424	315547	0	0	0	9398112	2018-02-28 07:37:37.286733	2018-02-28 07:37:37.286733
703	1	1	2017-12-06	2017	12	2	3	0	0	381100	304880	1067080	3151436	1595898	594386	556556	986068	1241228	452571	0	0	0	10331206	2018-02-28 07:37:37.295672	2018-02-28 07:37:37.295672
704	1	1	2017-12-07	2017	12	2	4	0	0	804544	677511	1814036	1832381	3882264	1728871	1401541	1386477	3341672	2252573	0	0	0	19121874	2018-02-28 07:37:37.304145	2018-02-28 07:37:37.304145
705	1	1	2017-12-08	2017	12	2	5	0	0	550478	1287271	1280496	4311770	5223788	1090580	849148	1650058	1148308	1860474	0	0	0	19252376	2018-02-28 07:37:37.310677	2018-02-28 07:37:37.310677
706	1	1	2017-12-09	2017	12	2	6	0	0	677511	880764	1493912	3803016	5575874	1878869	1125645	2343557	1834468	960457	0	0	0	20574079	2018-02-28 07:37:37.316833	2018-02-28 07:37:37.316833
707	1	1	2017-12-10	2017	12	2	7	0	0	719855	880764	1920744	1696487	3824333	1981530	1263783	1664321	1494617	1086809	0	0	0	16533250	2018-02-28 07:37:37.323187	2018-02-28 07:37:37.323187
708	1	1	2017-12-11	2017	12	3	1	0	0	465789	677511	2027452	2802018	2304800	2111078	1010336	2444636	1866691	1649001	0	0	0	17359313	2018-02-28 07:37:37.330111	2018-02-28 07:37:37.330111
709	1	1	2017-12-12	2017	12	3	2	0	0	254067	542009	480186	875135	3726024	551441	556944	1331459	812925	893207	0	0	0	10023399	2018-02-28 07:37:37.336316	2018-02-28 07:37:37.336316
710	1	1	2017-12-13	2017	12	3	3	0	0	423444	542009	800310	667764	1889368	684219	723543	1316075	768758	424931	0	0	0	8240424	2018-02-28 07:37:37.342367	2018-02-28 07:37:37.342367
711	1	1	2017-12-14	2017	12	3	4	0	0	423444	1355022	2134160	2363299	3675496	1552704	1591794	2761191	3081458	1918797	0	0	0	20857369	2018-02-28 07:37:37.348682	2018-02-28 07:37:37.348682
712	1	1	2017-12-15	2017	12	3	5	0	0	550478	1084018	2027452	3071488	4489105	3318418	1326803	1426986	1877045	1215316	0	0	0	20387114	2018-02-28 07:37:37.35466	2018-02-28 07:37:37.35466
713	1	1	2017-12-16	2017	12	3	6	0	0	550478	677511	2027452	3298694	2875338	1701767	1090718	1290335	1876479	1727453	0	0	0	17116231	2018-02-28 07:37:37.360628	2018-02-28 07:37:37.360628
714	1	1	2017-12-17	2017	12	3	7	0	0	508133	609760	1280496	2186514	3711069	1491381	1329508	2031150	2472512	1116537	0	0	0	16737067	2018-02-28 07:37:37.367137	2018-02-28 07:37:37.367137
715	1	1	2017-12-18	2017	12	4	1	0	0	804544	745262	1920744	4787758	3548190	2642664	1617203	1609236	3136866	2129691	0	0	0	22942159	2018-02-28 07:37:37.374323	2018-02-28 07:37:37.374323
716	1	1	2017-12-19	2017	12	4	2	0	0	317583	372631	746956	998088	979043	694081	293885	870303	705507	777310	0	0	0	6755389	2018-02-28 07:37:37.380425	2018-02-28 07:37:37.380425
717	1	1	2017-12-20	2017	12	4	3	0	0	423444	508133	1013726	892037	3807843	1310267	430831	1255192	696539	533386	0	0	0	10871401	2018-02-28 07:37:37.386268	2018-02-28 07:37:37.386268
718	1	1	2017-12-21	2017	12	4	4	0	0	677511	677511	1920744	3329424	5732563	3047554	1381697	1961828	2459318	1768950	0	0	0	22957104	2018-02-28 07:37:37.392049	2018-02-28 07:37:37.392049
719	1	1	2017-12-22	2017	12	4	5	0	0	635167	1151769	1067080	1611836	1690366	1934345	853383	1558088	2102432	1787349	0	0	0	14391820	2018-02-28 07:37:37.397756	2018-02-28 07:37:37.397756
720	1	1	2017-12-23	2017	12	4	6	0	0	550478	1219520	1067080	4967543	3243821	2053476	931963	1406649	1314526	986301	0	0	0	17741363	2018-02-28 07:37:37.404739	2018-02-28 07:37:37.404739
721	1	1	2017-12-24	2017	12	4	7	0	0	804544	948515	1387204	1440537	3509094	2299669	1621240	3066794	1929414	1503311	0	0	0	18510329	2018-02-28 07:37:37.413477	2018-02-28 07:37:37.413477
722	1	1	2017-12-25	2017	12	5	1	0	0	381100	677511	2134160	1740253	4481568	1005484	1255580	2280620	3805195	2386397	0	0	0	20147869	2018-02-28 07:37:37.421927	2018-02-28 07:37:37.421927
723	1	1	2017-12-26	2017	12	5	2	0	0	423444	508133	960372	2296758	2415214	1001110	479275	514512	1210444	663426	0	0	0	10472690	2018-02-28 07:37:37.430419	2018-02-28 07:37:37.430419
724	1	1	2017-12-27	2017	12	5	3	0	0	275239	677511	640248	893353	3975570	1028953	773024	1544666	1257867	563594	0	0	0	11630028	2018-02-28 07:37:37.439633	2018-02-28 07:37:37.439633
725	1	1	2017-12-28	2017	12	5	4	0	0	423444	948515	2027452	5098106	2312423	1693753	713939	2231378	3252880	1150826	0	0	0	19852720	2018-02-28 07:37:37.449671	2018-02-28 07:37:37.449671
726	1	1	2017-12-29	2017	12	5	5	0	0	423444	1287271	1920744	2962621	1475114	2134258	969997	1805014	1071482	1217931	0	0	0	15267881	2018-02-28 07:37:37.455704	2018-02-28 07:37:37.455704
727	1	1	2017-12-30	2017	12	5	6	0	0	762200	677511	1493912	3122230	5493299	1736371	948105	1884954	2124386	1322632	0	0	0	19565606	2018-02-28 07:37:37.461765	2018-02-28 07:37:37.461765
728	1	1	2017-12-31	2017	12	5	7	0	0	592822	948515	1173788	2689482	4481568	2234408	1704002	2683082	2113997	1458354	0	0	0	20080025	2018-02-28 07:37:37.467922	2018-02-28 07:37:37.467922
\.


--
-- Name: hs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: coke
--

SELECT pg_catalog.setval('public.hs_id_seq', 728, true);


--
-- Data for Name: master_departments; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.master_departments (id, name, created_at, updated_at) FROM stdin;
1	Rincon juvenil Mujer	2018-05-19 22:38:19.990202	2018-05-19 22:38:19.990202
2	Moda Hombre	2018-05-19 22:38:20.025204	2018-05-19 22:38:20.025204
3	Tecnologa	2018-05-19 22:38:20.028204	2018-05-19 22:38:20.028204
4	Deportes	2018-05-19 22:38:20.032205	2018-05-19 22:38:20.032205
5	Moda Mujer	2018-05-19 22:38:20.037205	2018-05-19 22:38:20.037205
6	Infantil	2018-05-19 22:38:20.039205	2018-05-19 22:38:20.039205
\.


--
-- Name: master_departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.master_departments_id_seq', 1, false);


--
-- Data for Name: return_cases; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.return_cases (id, id_case, eff_margin, total_surplus, compensation_cost, "integer", status, "user", message, deficit_total, tolerance, version, format_result, max_time, lunchs, turns, delta, epsilon, support, model, sales_plan, obj_function, created_at, updated_at) FROM stdin;
\.


--
-- Name: return_cases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.return_cases_id_seq', 1, false);


--
-- Data for Name: rs; Type: TABLE DATA; Schema: public; Owner: coke
--

COPY public.rs (id, store_id, department_id, date, year, month, week, dow, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty, twenty_one, twenty_two, twenty_three, total_day, created_at, updated_at) FROM stdin;
1	1	1	2018-01-01	2018	1	1	1	0	0	198450	763618	771028	830340	797960	919431	845077	980296	1639494	665552	0	0	0	8411246	2018-02-28 07:38:44.748798	2018-02-28 07:38:44.748798
2	1	1	2018-01-02	2018	1	1	2	0	0	242550	610963	790494	884073	692273	879386	939403	3399873	1692880	554691	0	0	0	10686586	2018-02-28 07:38:44.755496	2018-02-28 07:38:44.755496
3	1	1	2018-01-03	2018	1	1	3	0	0	308700	463160	513301	1242387	522854	729297	1812688	2110115	2209232	1364627	0	0	0	11276361	2018-02-28 07:38:44.761659	2018-02-28 07:38:44.761659
4	1	1	2018-01-04	2018	1	1	4	0	0	242550	394916	1280912	692853	519535	931471	1587639	1514772	1683406	1722540	0	0	0	10570594	2018-02-28 07:38:44.767517	2018-02-28 07:38:44.767517
5	1	1	2018-01-05	2018	1	1	5	0	0	308700	800217	314185	524700	859933	1291274	1240777	2325945	1588973	1411776	0	0	0	10666480	2018-02-28 07:38:44.773336	2018-02-28 07:38:44.773336
6	1	1	2018-01-06	2018	1	1	6	0	0	396900	858441	2456134	2339872	1139435	3523684	4110691	5000816	3511265	2586468	0	0	0	25923706	2018-02-28 07:38:44.779522	2018-02-28 07:38:44.779522
7	1	1	2018-01-07	2018	1	1	7	0	0	529200	1285898	1579710	1583604	1415747	1897375	2597256	4489007	2772518	2745333	0	0	0	20895648	2018-02-28 07:38:44.785644	2018-02-28 07:38:44.785644
8	1	1	2018-01-08	2018	1	2	1	0	0	242550	470131	837403	1006670	1060933	1254897	1471280	1925370	2342092	1647592	0	0	0	12258918	2018-02-28 07:38:44.7921	2018-02-28 07:38:44.7921
9	1	1	2018-01-09	2018	1	2	2	0	0	198450	574260	938343	384872	612152	1813192	2273016	1349750	2245842	1235659	0	0	0	11625536	2018-02-28 07:38:44.798813	2018-02-28 07:38:44.798813
10	1	1	2018-01-10	2018	1	2	3	0	0	220500	202076	747020	805783	974490	1078571	949320	1689285	1622083	2072608	0	0	0	10361736	2018-02-28 07:38:44.805095	2018-02-28 07:38:44.805095
11	1	1	2018-01-11	2018	1	2	4	0	0	242550	671262	921834	499660	754516	1090029	1278651	2461057	872905	886795	0	0	0	9679259	2018-02-28 07:38:44.810994	2018-02-28 07:38:44.810994
12	1	1	2018-01-12	2018	1	2	5	0	0	286650	308051	498969	809614	957715	1064600	1407199	2095846	954806	1224475	0	0	0	9607925	2018-02-28 07:38:44.816847	2018-02-28 07:38:44.816847
13	1	1	2018-01-13	2018	1	2	6	0	0	485100	511043	1338764	2456563	1611910	1298363	3448473	3578920	6746166	3809166	0	0	0	25284468	2018-02-28 07:38:44.822431	2018-02-28 07:38:44.822431
14	1	1	2018-01-14	2018	1	2	7	0	0	529200	536922	696704	1034122	1005930	2378410	2769623	1611985	2894525	2588189	0	0	0	16045610	2018-02-28 07:38:44.828093	2018-02-28 07:38:44.828093
15	1	1	2018-01-15	2018	1	3	1	0	0	198450	501023	1010533	581150	1213601	1056866	1351063	1789553	1617862	1079615	0	0	0	10399716	2018-02-28 07:38:44.834077	2018-02-28 07:38:44.834077
16	1	1	2018-01-16	2018	1	3	2	0	0	418950	650426	576917	437670	1053353	1053567	1761182	1444988	931317	1732144	0	0	0	10060514	2018-02-28 07:38:44.841779	2018-02-28 07:38:44.841779
17	1	1	2018-01-17	2018	1	3	3	0	0	242550	694460	1031519	1333231	400034	859694	2919926	1588766	2032576	1720118	0	0	0	12822874	2018-02-28 07:38:44.848329	2018-02-28 07:38:44.848329
18	1	1	2018-01-18	2018	1	3	4	0	0	374850	418094	534179	987244	1185822	915251	2154089	3468956	2725258	486135	0	0	0	13249878	2018-02-28 07:38:44.854231	2018-02-28 07:38:44.854231
19	1	1	2018-01-19	2018	1	3	5	0	0	198450	690375	711040	618496	624199	1057712	1412392	2617931	1708555	1596492	0	0	0	11235642	2018-02-28 07:38:44.860024	2018-02-28 07:38:44.860024
20	1	1	2018-01-20	2018	1	3	6	0	0	882000	1694985	2262496	1697753	1956188	3031421	3878288	2215679	5172532	3087699	0	0	0	25879041	2018-02-28 07:38:44.865649	2018-02-28 07:38:44.865649
21	1	1	2018-01-21	2018	1	3	7	0	0	458640	1066750	980685	1043708	1161374	1463690	5587619	2315866	3310284	2718224	0	0	0	20106840	2018-02-28 07:38:44.871388	2018-02-28 07:38:44.871388
22	1	1	2018-01-22	2018	1	4	1	0	0	352800	402557	506334	1318955	1065771	1116143	1269752	1985103	1603044	1335199	0	0	0	10955658	2018-02-28 07:38:44.878161	2018-02-28 07:38:44.878161
23	1	1	2018-01-23	2018	1	4	2	0	0	198450	975403	1004390	415598	1361876	1032425	1851620	2711061	1533476	935173	0	0	0	12019472	2018-02-28 07:38:44.884372	2018-02-28 07:38:44.884372
24	1	1	2018-01-24	2018	1	4	3	0	0	418950	977029	583985	651069	1170948	1001650	2124216	1857307	2758511	1624649	0	0	0	13168314	2018-02-28 07:38:44.890812	2018-02-28 07:38:44.890812
25	1	1	2018-01-25	2018	1	4	4	0	0	330750	673340	779511	519435	880128	1050819	1897489	1204114	1813351	1267449	0	0	0	10416386	2018-02-28 07:38:44.89753	2018-02-28 07:38:44.89753
26	1	1	2018-01-26	2018	1	4	5	0	0	264600	576617	635442	487253	753174	1291694	1373466	3152018	2383689	1216138	0	0	0	12134091	2018-02-28 07:38:44.90343	2018-02-28 07:38:44.90343
27	1	1	2018-01-27	2018	1	4	6	0	0	837900	1175076	937604	1320214	1496236	1607988	4732792	5114631	6933607	1979840	0	0	0	26135888	2018-02-28 07:38:44.910649	2018-02-28 07:38:44.910649
28	1	1	2018-01-28	2018	1	4	7	0	0	529200	951857	1531811	2244194	1236028	1624362	4005564	2678794	4741513	2017093	0	0	0	21560416	2018-02-28 07:38:44.919144	2018-02-28 07:38:44.919144
29	1	1	2018-01-29	2018	2	1	1	0	0	661500	690636	1364648	599899	1117391	1229594	1989162	5756368	2671955	2028635	0	0	0	18109788	2018-02-28 07:38:44.927411	2018-02-28 07:38:44.927411
30	1	1	2018-01-30	2018	2	1	2	0	0	496125	1011608	2117325	1179602	627870	1482998	2099042	2206018	2377272	1107538	0	0	0	14705398	2018-02-28 07:38:44.93566	2018-02-28 07:38:44.93566
31	1	1	2018-01-31	2018	2	1	3	0	0	363825	702253	1257834	1191614	689182	778931	1594949	2535405	1538298	1622470	0	0	0	12274761	2018-02-28 07:38:44.944057	2018-02-28 07:38:44.944057
32	1	1	2018-02-01	2018	2	1	4	0	0	297675	970126	634671	1303128	982400	1277296	2108471	4037648	3655615	1455985	0	0	0	16723015	2018-02-28 07:38:44.951947	2018-02-28 07:38:44.951947
33	1	1	2018-02-02	2018	2	1	5	0	0	595350	734184	924540	1064046	1548183	2168642	3133059	2832300	1823366	1135441	0	0	0	15959111	2018-02-28 07:38:44.959089	2018-02-28 07:38:44.959089
34	1	1	2018-02-03	2018	2	1	6	0	0	529200	961422	806241	701020	1010464	1178817	2526140	3905604	3165052	1031585	0	0	0	15815545	2018-02-28 07:38:44.965249	2018-02-28 07:38:44.965249
35	1	1	2018-02-04	2018	2	1	7	0	0	396900	1841208	1385216	1002617	867327	2039561	3105200	2217454	2117345	1796157	0	0	0	16768985	2018-02-28 07:38:44.97075	2018-02-28 07:38:44.97075
36	1	1	2018-02-05	2018	2	2	1	0	0	727650	689482	2438612	1943546	2123774	2393691	8013674	10967894	3051496	3414787	0	0	0	35764606	2018-02-28 07:38:44.976786	2018-02-28 07:38:44.976786
37	1	1	2018-02-06	2018	2	2	2	0	0	846720	2213656	2704026	2467385	2113163	2845717	6083326	6419449	8913141	4231224	0	0	0	38837807	2018-02-28 07:38:44.982504	2018-02-28 07:38:44.982504
38	1	1	2018-02-07	2018	2	2	3	0	0	595350	977567	721808	926022	1475316	1088372	3772890	5122260	1865469	2706490	0	0	0	19251544	2018-02-28 07:38:44.988421	2018-02-28 07:38:44.988421
39	1	1	2018-02-08	2018	2	2	4	0	0	463050	927178	577558	530844	1267516	1898237	1728553	2252737	4349422	2205002	0	0	0	16200097	2018-02-28 07:38:44.994762	2018-02-28 07:38:44.994762
40	1	1	2018-02-09	2018	2	2	5	0	0	529200	1322661	1088376	1253798	1164358	2453916	2068773	3658284	2455721	2336481	0	0	0	18331568	2018-02-28 07:38:45.001768	2018-02-28 07:38:45.001768
41	1	1	2018-02-10	2018	2	2	6	0	0	661500	482811	683023	1554230	1205095	1801204	3490205	3965175	3375542	2193047	0	0	0	19411832	2018-02-28 07:38:45.011678	2018-02-28 07:38:45.011678
42	1	1	2018-02-11	2018	2	2	7	0	0	529200	1156664	1377922	1252388	1584871	3179695	3426315	3277140	2036525	2009395	0	0	0	19830115	2018-02-28 07:38:45.018032	2018-02-28 07:38:45.018032
43	1	1	2018-02-12	2018	2	3	1	0	0	595350	2132773	4322531	2813723	2082997	2343811	8852342	5021381	7361491	3237971	0	0	0	38764370	2018-02-28 07:38:45.024202	2018-02-28 07:38:45.024202
44	1	1	2018-02-13	2018	2	3	2	0	0	582120	2102317	2189823	2099374	1613804	2951606	4608668	8926698	10881635	2901895	0	0	0	38857940	2018-02-28 07:38:45.030328	2018-02-28 07:38:45.030328
45	1	1	2018-02-14	2018	2	3	3	0	0	363825	674176	1455057	1177693	1983727	1352138	3009819	2569162	1712976	1780434	0	0	0	16079007	2018-02-28 07:38:45.036447	2018-02-28 07:38:45.036447
46	1	1	2018-02-15	2018	2	3	4	0	0	297675	947484	1119065	621150	999330	2321678	1774562	3354409	2093350	1766291	0	0	0	15294994	2018-02-28 07:38:45.043366	2018-02-28 07:38:45.043366
47	1	1	2018-02-16	2018	2	3	5	0	0	330750	437930	1279977	1659618	1101708	2185148	2154668	1846757	4019290	1546772	0	0	0	16562618	2018-02-28 07:38:45.050441	2018-02-28 07:38:45.050441
48	1	1	2018-02-17	2018	2	3	6	0	0	463050	680099	934297	989809	521655	2186400	1974023	3470544	2075017	2190132	0	0	0	15485026	2018-02-28 07:38:45.057216	2018-02-28 07:38:45.057216
49	1	1	2018-02-18	2018	2	3	7	0	0	595350	742199	978382	708840	1130029	1437478	4714229	3805358	2477618	2832444	0	0	0	19421927	2018-02-28 07:38:45.063045	2018-02-28 07:38:45.063045
50	1	1	2018-02-19	2018	2	4	1	0	0	727650	2295111	2510204	2766042	1317173	3628537	5047204	4730845	6645170	2653553	0	0	0	32321489	2018-02-28 07:38:45.068752	2018-02-28 07:38:45.068752
51	1	1	2018-02-20	2018	2	4	2	0	0	687960	2198121	1609786	3711929	2225740	3191226	3706269	4293914	11723798	3082796	0	0	0	36431539	2018-02-28 07:38:45.074359	2018-02-28 07:38:45.074359
52	1	1	2018-02-21	2018	2	4	3	0	0	363825	773168	2104875	1434968	1006088	1620788	3030889	2955953	2464543	1240844	0	0	0	16995941	2018-02-28 07:38:45.080279	2018-02-28 07:38:45.080279
53	1	1	2018-02-22	2018	2	4	4	0	0	595350	1230242	693359	1435143	1642972	2264507	2817279	5523612	1649885	1323411	0	0	0	19175760	2018-02-28 07:38:45.086233	2018-02-28 07:38:45.086233
54	1	1	2018-02-23	2018	2	4	5	0	0	463050	1531547	1592523	930839	1256648	1986275	1948909	3765499	1702992	2133970	0	0	0	17312252	2018-02-28 07:38:45.093049	2018-02-28 07:38:45.093049
55	1	1	2018-02-24	2018	2	4	6	0	0	330750	464335	1679202	1179762	1209886	1543469	1801574	3322598	1764978	1297596	0	0	0	14594150	2018-02-28 07:38:45.101024	2018-02-28 07:38:45.101024
56	1	1	2018-02-25	2018	2	4	7	0	0	396900	1576363	1205192	823157	819622	1959206	2905713	4236420	3640392	2865892	0	0	0	20428857	2018-02-28 07:38:45.109083	2018-02-28 07:38:45.109083
57	1	1	2018-02-26	2018	3	1	1	0	0	1190700	2343544	2420749	2019207	2238374	4776366	4239925	6125032	5061972	5009326	0	0	0	35425195	2018-02-28 07:38:45.117068	2018-02-28 07:38:45.117068
58	1	1	2018-02-27	2018	3	1	2	0	0	1058400	1310365	882932	2929160	1199802	4865163	4498645	4515616	4757873	3682319	0	0	0	29700275	2018-02-28 07:38:45.125041	2018-02-28 07:38:45.125041
59	1	1	2018-02-28	2018	3	1	3	0	0	595350	888100	1452851	853379	1345682	1512276	1892988	1967616	1493679	1949507	0	0	0	13951428	2018-02-28 07:38:45.132507	2018-02-28 07:38:45.132507
60	1	1	2018-03-01	2018	3	1	4	0	0	562275	452501	1079796	1209457	1158949	1361731	2247215	3176326	3109048	1107590	0	0	0	15464888	2018-02-28 07:38:45.139301	2018-02-28 07:38:45.139301
61	1	1	2018-03-02	2018	3	1	5	0	0	463050	1003661	1147306	1259777	650550	1095324	2927188	3110694	1530463	2209542	0	0	0	15397555	2018-02-28 07:38:45.145612	2018-02-28 07:38:45.145612
62	1	1	2018-03-03	2018	3	1	6	0	0	254067	858181	640248	1752519	1348459	1945982	698808	1047425	1380379	1470670	0	0	0	11396738	2018-02-28 07:38:45.151577	2018-02-28 07:38:45.151577
63	1	1	2018-03-04	2018	3	1	7	0	0	508133	903348	1280497	2808244	2072094	1939072	392347	1650413	1622498	740364	0	0	0	13917010	2018-02-28 07:38:45.158167	2018-02-28 07:38:45.158167
64	1	1	2018-03-05	2018	3	2	1	0	0	310526	451674	782526	1455197	3413411	1035607	909478	1881906	1931853	1197225	0	0	0	13369403	2018-02-28 07:38:45.164387	2018-02-28 07:38:45.164387
65	1	1	2018-03-06	2018	3	2	2	0	0	479904	496841	1138219	1219434	3794664	716453	1201680	1456209	2319207	1198852	0	0	0	14021463	2018-02-28 07:38:45.170582	2018-02-28 07:38:45.170582
66	1	1	2018-03-07	2018	3	2	3	0	0	268181	203253	320124	1220663	909983	602899	533795	413470	894200	531549	0	0	0	5898117	2018-02-28 07:38:45.176857	2018-02-28 07:38:45.176857
67	1	1	2018-03-08	2018	3	2	4	0	0	141148	316172	497970	665924	1941546	900152	441634	387892	754616	485782	0	0	0	6532836	2018-02-28 07:38:45.183102	2018-02-28 07:38:45.183102
68	1	1	2018-03-09	2018	3	2	5	0	0	310526	722678	782526	2920254	3615381	788137	610224	840977	2359107	1101546	0	0	0	14051356	2018-02-28 07:38:45.190074	2018-02-28 07:38:45.190074
69	1	1	2018-03-10	2018	3	2	6	0	0	338756	406507	1351635	1501367	3308611	1419904	720001	1063412	1773161	1656758	0	0	0	13540112	2018-02-28 07:38:45.196121	2018-02-28 07:38:45.196121
70	1	1	2018-03-11	2018	3	2	7	0	0	254067	542009	1422774	1498345	3160341	1599309	807301	1831374	1479229	1531757	0	0	0	14126506	2018-02-28 07:38:45.201983	2018-02-28 07:38:45.201983
71	1	1	2018-03-12	2018	3	3	1	0	0	536363	542009	1351635	1121922	2753810	1513070	655009	709469	1577828	724947	0	0	0	11486062	2018-02-28 07:38:45.20796	2018-02-28 07:38:45.20796
72	1	1	2018-03-13	2018	3	3	2	0	0	564593	858181	1280497	2764056	1842816	819346	1327554	907351	1213940	749982	0	0	0	12328316	2018-02-28 07:38:45.213772	2018-02-28 07:38:45.213772
73	1	1	2018-03-14	2018	3	3	3	0	0	169378	225837	533540	1955520	647787	440894	459665	515413	554015	416005	0	0	0	5918054	2018-02-28 07:38:45.220045	2018-02-28 07:38:45.220045
74	1	1	2018-03-15	2018	3	3	4	0	0	141148	293588	711386	1102513	788100	347746	580451	414328	529242	314750	0	0	0	5223252	2018-02-28 07:38:45.226326	2018-02-28 07:38:45.226326
75	1	1	2018-03-16	2018	3	3	5	0	0	338756	406507	640248	2055295	1303155	1375395	756364	962702	2448211	702538	0	0	0	10989171	2018-02-28 07:38:45.23293	2018-02-28 07:38:45.23293
76	1	1	2018-03-17	2018	3	3	6	0	0	536363	722678	1209358	2648079	1544437	1296493	886386	907107	1404389	1133974	0	0	0	12289264	2018-02-28 07:38:45.239189	2018-02-28 07:38:45.239189
77	1	1	2018-03-18	2018	3	3	7	0	0	366985	542009	640248	1461583	2961405	1063278	652871	1947785	1743976	722497	0	0	0	12102637	2018-02-28 07:38:45.245294	2018-02-28 07:38:45.245294
78	1	1	2018-03-19	2018	3	4	1	0	0	564593	542009	711387	914372	1841362	1103208	1168149	1850460	1722839	996070	0	0	0	11414449	2018-02-28 07:38:45.251281	2018-02-28 07:38:45.251281
79	1	1	2018-03-20	2018	3	4	2	0	0	508133	722678	711387	3610658	2125366	1212820	646289	757328	2088554	1241126	0	0	0	13624339	2018-02-28 07:38:45.257167	2018-02-28 07:38:45.257167
80	1	1	2018-03-21	2018	3	4	3	0	0	239952	271004	640247	981743	2340691	536015	352489	335820	430852	627418	0	0	0	6756231	2018-02-28 07:38:45.262851	2018-02-28 07:38:45.262851
81	1	1	2018-03-22	2018	3	4	4	0	0	141148	383923	426832	1757989	1052492	974449	544782	944292	868596	364421	0	0	0	7458924	2018-02-28 07:38:45.26904	2018-02-28 07:38:45.26904
82	1	1	2018-03-23	2018	3	4	5	0	0	395215	858181	1067081	3080277	3690617	982855	895244	1255215	1061049	1067334	0	0	0	14353068	2018-02-28 07:38:45.275115	2018-02-28 07:38:45.275115
83	1	1	2018-03-24	2018	3	4	6	0	0	479904	406507	1422774	1573100	1684855	1818009	975667	1212460	1470130	951597	0	0	0	11995003	2018-02-28 07:38:45.281485	2018-02-28 07:38:45.281485
84	1	1	2018-03-25	2018	3	4	7	0	0	479904	587176	711387	1439669	3185070	1342861	800231	1819568	1657625	693152	0	0	0	12716643	2018-02-28 07:38:45.287792	2018-02-28 07:38:45.287792
85	1	1	2018-03-26	2018	3	5	1	0	0	310526	632344	640248	2307912	1076782	1041863	720860	737932	1159972	1055450	0	0	0	9683889	2018-02-28 07:38:45.29339	2018-02-28 07:38:45.29339
86	1	1	2018-03-27	2018	3	5	2	0	0	479904	632344	711387	2815842	3174632	961747	563560	923923	1790146	871658	0	0	0	12925143	2018-02-28 07:38:45.298859	2018-02-28 07:38:45.298859
87	1	1	2018-03-28	2018	3	5	3	0	0	282296	338756	462401	939162	952472	918691	565998	627390	504200	209053	0	0	0	5800419	2018-02-28 07:38:45.304433	2018-02-28 07:38:45.304433
88	1	1	2018-03-29	2018	3	5	4	0	0	254067	248421	640247	1062192	1048016	650926	391139	330987	366772	225120	0	0	0	5217887	2018-02-28 07:38:45.310284	2018-02-28 07:38:45.310284
89	1	1	2018-03-30	2018	3	5	5	0	0	338756	903348	640248	2691054	2898094	814101	750054	841193	1667769	727934	0	0	0	12272551	2018-02-28 07:38:45.317111	2018-02-28 07:38:45.317111
90	1	1	2018-03-31	2018	3	5	6	0	0	395215	496841	782526	1528205	3084131	1407606	641992	994639	1489753	760442	0	0	0	11581350	2018-02-28 07:38:45.322833	2018-02-28 07:38:45.322833
91	1	1	2018-04-01	2018	3	5	7	0	0	310526	406507	1067081	2541148	2216531	1489209	987480	1132109	1659423	742545	0	0	0	12552559	2018-02-28 07:38:45.328522	2018-02-28 07:38:45.328522
92	1	1	2018-04-02	2018	4	1	1	0	0	508133	745262	1600620	1632514	5944821	1618028	842916	1869824	3200995	1922198	0	0	0	19885311	2018-02-28 07:38:45.333834	2018-02-28 07:38:45.333834
93	1	1	2018-04-03	2018	4	1	2	0	0	592822	609760	1173788	1953658	5555886	1980570	1502975	1538242	3341059	1754418	0	0	0	20003178	2018-02-28 07:38:45.339487	2018-02-28 07:38:45.339487
94	1	1	2018-04-04	2018	4	1	3	0	0	846889	609760	1280496	2446918	4094357	2506184	2079619	2318220	1463059	1532508	0	0	0	19178010	2018-02-28 07:38:45.345205	2018-02-28 07:38:45.345205
95	1	1	2018-04-05	2018	4	1	4	0	0	635167	880764	1920744	2381812	3050585	2250650	915335	1483503	1272616	2198795	0	0	0	16989971	2018-02-28 07:38:45.350712	2018-02-28 07:38:45.350712
96	1	1	2018-04-06	2018	4	1	5	0	0	232894	406507	960372	1049991	1376641	1113104	742656	938139	825496	545036	0	0	0	8190836	2018-02-28 07:38:45.357099	2018-02-28 07:38:45.357099
97	1	1	2018-04-07	2018	4	1	6	0	0	381100	338756	693602	2993864	2165861	756491	437294	1517028	1179167	517224	0	0	0	10980387	2018-02-28 07:38:45.363946	2018-02-28 07:38:45.363946
98	1	1	2018-04-08	2018	4	1	7	0	0	677511	1219520	1280496	2137778	4917534	2260832	2002202	1848636	3550527	1855060	0	0	0	21750096	2018-02-28 07:38:45.370181	2018-02-28 07:38:45.370181
99	1	1	2018-04-09	2018	4	2	1	0	0	550478	1287271	960372	5543705	5223788	999699	1389515	2030840	1377970	2126256	0	0	0	21489894	2018-02-28 07:38:45.376259	2018-02-28 07:38:45.376259
100	1	1	2018-04-10	2018	4	2	2	0	0	423444	677511	1173788	2852262	5227382	2348586	1534971	1904140	2568255	1248594	0	0	0	19958933	2018-02-28 07:38:45.381827	2018-02-28 07:38:45.381827
101	1	1	2018-04-11	2018	4	2	3	0	0	677511	609760	1173788	2544731	3220491	1733838	1847068	2773868	1724558	1449079	0	0	0	17754692	2018-02-28 07:38:45.387364	2018-02-28 07:38:45.387364
102	1	1	2018-04-12	2018	4	2	4	0	0	508133	745262	2134160	4839849	1584550	2111078	1262920	2200172	2266697	2237930	0	0	0	19890751	2018-02-28 07:38:45.392865	2018-02-28 07:38:45.392865
103	1	1	2018-04-13	2018	4	2	5	0	0	190550	677511	480186	1272923	2980819	459534	612638	1248243	812925	752174	0	0	0	9487503	2018-02-28 07:38:45.398401	2018-02-28 07:38:45.398401
104	1	1	2018-04-14	2018	4	2	6	0	0	423444	372631	960372	1112940	894964	1064340	627071	950499	1005298	566574	0	0	0	7978133	2018-02-28 07:38:45.404702	2018-02-28 07:38:45.404702
105	1	1	2018-04-15	2018	4	2	7	0	0	550478	1016267	2027452	2224282	6125826	1219981	2204023	1461807	3243640	1678947	0	0	0	21752703	2018-02-28 07:38:45.411071	2018-02-28 07:38:45.411071
106	1	1	2018-04-16	2018	4	3	1	0	0	508133	609760	960372	4016561	2126418	3152497	1575579	1528914	2598986	1767733	0	0	0	18844953	2018-02-28 07:38:45.417131	2018-02-28 07:38:45.417131
107	1	1	2018-04-17	2018	4	3	2	0	0	804544	1219520	1600620	3298694	1757151	2784710	1227058	2150558	3335963	1535514	0	0	0	19714332	2018-02-28 07:38:45.423377	2018-02-28 07:38:45.423377
108	1	1	2018-04-18	2018	4	3	3	0	0	762200	1287271	2027452	2040746	3711069	1491381	1399482	2031150	2008916	1984955	0	0	0	18744622	2018-02-28 07:38:45.429449	2018-02-28 07:38:45.429449
109	1	1	2018-04-19	2018	4	3	4	0	0	465789	880764	1173788	5984698	7096380	1321332	1509389	2145648	3136866	2241780	0	0	0	25956434	2018-02-28 07:38:45.435308	2018-02-28 07:38:45.435308
110	1	1	2018-04-20	2018	4	3	5	0	0	359928	474258	907018	1796558	1204976	763489	391847	932468	456504	685862	0	0	0	7972908	2018-02-28 07:38:45.441094	2018-02-28 07:38:45.441094
111	1	1	2018-04-21	2018	4	3	6	0	0	317583	338756	907018	1694870	4008256	620653	502636	664513	746292	666732	0	0	0	10467309	2018-02-28 07:38:45.446978	2018-02-28 07:38:45.446978
112	1	1	2018-04-22	2018	4	3	7	0	0	550478	609760	1600620	4353862	6449134	3207952	731487	1798343	2634984	1533090	0	0	0	23469710	2018-02-28 07:38:45.453237	2018-02-28 07:38:45.453237
113	1	1	2018-04-23	2018	4	4	1	0	0	465789	880764	1173788	1611836	1521329	2231937	1043023	876425	1438506	1787349	0	0	0	13030746	2018-02-28 07:38:45.459342	2018-02-28 07:38:45.459342
114	1	1	2018-04-24	2018	4	4	2	0	0	508133	745262	1814036	4675334	3053008	3001234	1139065	1790281	1792536	1315068	0	0	0	19833957	2018-02-28 07:38:45.46583	2018-02-28 07:38:45.46583
115	1	1	2018-04-25	2018	4	4	3	0	0	381100	948515	1707328	1440537	3828102	1971145	1194598	2905384	2618491	1850229	0	0	0	18845429	2018-02-28 07:38:45.472433	2018-02-28 07:38:45.472433
116	1	1	2018-04-26	2018	4	4	4	0	0	550478	1219520	1280496	2689482	2594592	2234408	1434949	1475695	3382395	1325776	0	0	0	18187791	2018-02-28 07:38:45.481416	2018-02-28 07:38:45.481416
117	1	1	2018-04-27	2018	4	4	5	0	0	423444	542009	960372	2009664	2415214	813402	623058	748381	1424052	663426	0	0	0	10623022	2018-02-28 07:38:45.488017	2018-02-28 07:38:45.488017
118	1	1	2018-04-28	2018	4	4	6	0	0	190550	677511	1067080	1091875	1789007	771715	552160	1235733	1397630	634043	0	0	0	9407304	2018-02-28 07:38:45.4941	2018-02-28 07:38:45.4941
121	1	1	2018-05-01	2018	5	1	2	0	0	592822	745262	1173788	4423159	4708542	3157038	1034297	2238382	1229908	1432851	0	0	0	20736049	2018-02-28 07:38:45.514014	2018-05-13 22:49:36.05792
122	1	1	2018-05-02	2018	5	1	3	0	0	330750	524987	1101468	830340	448853	1563033	1596256	1851671	1639494	1149589	0	0	0	11036441	2018-02-28 07:38:45.519938	2018-05-13 22:49:36.064921
123	1	1	2018-05-03	2018	5	1	4	0	0	308700	373366	1185741	568333	958532	1465644	1281005	1789407	1100372	554691	0	0	0	9585791	2018-02-28 07:38:45.525767	2018-05-13 22:49:36.071921
124	1	1	2018-05-04	2018	5	1	5	0	0	308700	354181	750209	1242387	475322	1296528	2509875	2110115	2339186	1469598	0	0	0	12856101	2018-02-28 07:38:45.531416	2018-05-13 22:49:36.077921
125	1	1	2018-05-05	2018	5	1	6	0	0	418950	513391	1138589	461902	736008	1354867	2742285	1622970	1377332	2026518	0	0	0	12392812	2018-02-28 07:38:45.537296	2018-05-13 22:49:36.082922
126	1	1	2018-05-06	2018	5	1	7	0	0	242550	844674	565533	472230	967424	1092617	1717999	2599586	1677250	847066	0	0	0	11026929	2018-02-28 07:38:45.543548	2018-05-13 22:49:36.088922
128	1	1	2018-05-08	2018	5	2	2	0	0	388080	942992	1474396	1689178	2359578	1686555	3339329	3291938	3388633	1715833	0	0	0	20276512	2018-02-28 07:38:45.55633	2018-05-13 22:49:36.113923
129	1	1	2018-05-09	2018	5	2	3	0	0	330750	555610	1218040	950744	1060933	1254897	1716494	2502981	2342092	1647592	0	0	0	13580133	2018-02-28 07:38:45.561939	2018-05-13 22:49:36.119924
130	1	1	2018-05-10	2018	5	2	4	0	0	264600	497692	1194255	692770	612152	1510994	2273016	2099611	2364044	1029716	0	0	0	12538850	2018-02-28 07:38:45.567565	2018-05-13 22:49:36.125924
131	1	1	2018-05-11	2018	5	2	5	0	0	308700	246982	373510	1098795	852678	693367	1044252	1930611	1802314	1347195	0	0	0	9698404	2018-02-28 07:38:45.573718	2018-05-13 22:49:36.131924
132	1	1	2018-05-12	2018	5	2	6	0	0	396900	797124	850924	499660	710133	1387309	2557302	2988427	1190325	831371	0	0	0	12209475	2018-02-28 07:38:45.580045	2018-05-13 22:49:36.137925
133	1	1	2018-05-13	2018	5	2	7	0	0	242550	410735	652497	1251222	845043	851680	1524466	1323692	1432209	1574325	0	0	0	10108419	2018-02-28 07:38:45.58662	2018-05-13 22:49:36.142925
134	1	1	2018-05-14	2018	5	3	1	0	0	617400	1078869	2380026	2456563	1611910	1947545	2298982	3028317	4497444	3333021	0	0	0	23250077	2018-02-28 07:38:45.59341	2018-05-13 22:49:36.148925
135	1	1	2018-05-15	2018	5	3	2	0	0	529200	465332	760040	1838438	905337	2140569	3621814	2149313	2605073	2243097	0	0	0	17258213	2018-02-28 07:38:45.599353	2018-05-13 22:49:36.154926
136	1	1	2018-05-16	2018	5	3	3	0	0	220500	668030	617548	774866	809068	1056866	1351063	2477842	2115665	1223563	0	0	0	11315011	2018-02-28 07:38:45.605235	2018-05-13 22:49:36.161926
137	1	1	2018-05-17	2018	5	3	4	0	0	330750	609774	839152	729450	877794	585315	2574035	1961055	1693304	917017	0	0	0	11117646	2018-02-28 07:38:45.611167	2018-05-13 22:49:36.166926
138	1	1	2018-05-18	2018	5	3	5	0	0	198450	475157	1190214	1036958	690967	1117602	1751956	2444256	1913013	1032071	0	0	0	11850644	2018-02-28 07:38:45.617214	2018-05-13 22:49:36.172927
139	1	1	2018-05-19	2018	5	3	6	0	0	198450	450255	408490	740433	790548	793217	2027378	2254821	2316469	972270	0	0	0	10952331	2018-02-28 07:38:45.623426	2018-05-13 22:49:36.178927
140	1	1	2018-05-20	2018	5	3	7	0	0	374850	796587	812618	1051443	510709	916683	1647790	2763371	1803474	878071	0	0	0	11555596	2018-02-28 07:38:45.62939	2018-05-13 22:49:36.184927
141	1	1	2018-05-21	2018	5	4	1	0	0	749700	1129990	1131248	1509114	1537005	3789276	2714802	3692799	3735718	2315774	0	0	0	22305426	2018-02-28 07:38:45.635616	2018-05-13 22:49:36.189928
142	1	1	2018-05-22	2018	5	4	2	0	0	599760	711167	708273	1204278	1974336	1585665	3234937	4631732	4814958	2145966	0	0	0	21611072	2018-02-28 07:38:45.641761	2018-05-13 22:49:36.195928
143	1	1	2018-05-23	2018	5	4	3	0	0	242550	536742	411397	1172405	564232	1195868	2308640	1213119	2671740	1027076	0	0	0	11343769	2018-02-28 07:38:45.64768	2018-05-13 22:49:36.202929
144	1	1	2018-05-24	2018	5	4	4	0	0	441000	770055	736552	415598	885219	1877136	2380655	1626637	1226780	1269164	0	0	0	11628796	2018-02-28 07:38:45.653665	2018-05-13 22:49:36.209929
145	1	1	2018-05-25	2018	5	4	5	0	0	308700	1085588	583985	846390	1170948	1463950	2006204	1238204	2903696	1433514	0	0	0	13041179	2018-02-28 07:38:45.659724	2018-05-13 22:49:36.215929
146	1	1	2018-05-26	2018	5	4	6	0	0	396900	734552	779511	1096585	821453	910710	2627293	2167405	1534374	1267449	0	0	0	12336232	2018-02-28 07:38:45.665921	2018-05-13 22:49:36.22093
147	1	1	2018-05-27	2018	5	4	7	0	0	242550	629036	516296	535978	338928	1092972	1785506	1824853	2383689	760086	0	0	0	10109894	2018-02-28 07:38:45.671649	2018-05-13 22:49:36.22793
148	1	1	2018-05-28	2018	5	5	1	0	0	485100	898587	1125125	2244364	1056167	2501314	4234603	6819508	6933607	2375807	0	0	0	28674182	2018-02-28 07:38:45.678598	2018-05-13 22:49:36.23293
120	1	1	2018-04-30	2018	5	1	1	0	0	465789	1016267	2027452	1559274	3278032	1600694	1357996	2191803	1928668	1107210	0	0	0	16533185	2018-02-28 07:38:45.507545	2018-05-13 22:49:36.05092
155	1	1	2018-06-04	2018	6	1	1	0	0	463050	1098768	1465892	876275	1837208	1833716	3031367	5300462	2813379	1490067	0	0	0	20210184	2018-02-28 07:38:45.722744	2018-02-28 07:38:45.722744
156	1	1	2018-06-05	2018	6	1	2	0	0	562275	1744303	1038912	1448225	619519	2719414	2328900	2729174	2587866	1796157	0	0	0	17574745	2018-02-28 07:38:45.728413	2018-02-28 07:38:45.728413
157	1	1	2018-06-06	2018	6	1	3	0	0	1124550	1034223	1950890	1943546	2760906	2872429	7212307	4935552	5085827	2086814	0	0	0	31007044	2018-02-28 07:38:45.733932	2018-02-28 07:38:45.733932
158	1	1	2018-06-07	2018	6	1	4	0	0	899640	1217511	2568825	2056154	2763367	1947070	2737497	7795046	7036691	3235642	0	0	0	32257443	2018-02-28 07:38:45.739946	2018-02-28 07:38:45.739946
159	1	1	2018-06-08	2018	6	1	5	0	0	628425	628436	433085	520888	781050	1451163	3772890	4610034	2425110	2029868	0	0	0	17280949	2018-02-28 07:38:45.746223	2018-02-28 07:38:45.746223
160	1	1	2018-06-09	2018	6	1	6	0	0	363825	1545296	577558	530844	697134	2151335	1728553	3253953	3044595	1347501	0	0	0	15240594	2018-02-28 07:38:45.753079	2018-02-28 07:38:45.753079
161	1	1	2018-06-10	2018	6	1	7	0	0	297675	1410838	1187320	1832474	640397	2742612	2344609	2613060	2022359	2959543	0	0	0	18050887	2018-02-28 07:38:45.759987	2018-02-28 07:38:45.759987
162	1	1	2018-06-11	2018	6	2	1	0	0	429975	413838	512267	1381538	1390494	1601070	1653255	3681948	2194102	2193047	0	0	0	15451534	2018-02-28 07:38:45.765935	2018-02-28 07:38:45.765935
163	1	1	2018-06-12	2018	6	2	2	0	0	661500	1040998	1291802	1148023	1678099	1943147	3162752	2184760	1666247	2583508	0	0	0	17360836	2018-02-28 07:38:45.771633	2018-02-28 07:38:45.771633
164	1	1	2018-06-13	2018	6	2	3	0	0	727650	2665966	2431424	3001304	2343371	2130737	4426171	5439829	3487022	5756394	0	0	0	32409868	2018-02-28 07:38:45.777736	2018-02-28 07:38:45.777736
165	1	1	2018-06-14	2018	6	2	4	0	0	952560	1501655	2863614	1799464	1793116	1708825	3621097	7517219	9672565	2694617	0	0	0	34124732	2018-02-28 07:38:45.783723	2018-02-28 07:38:45.783723
166	1	1	2018-06-15	2018	6	2	5	0	0	496125	529709	1535894	1864681	1983727	1590750	3540964	2087444	1185907	890217	0	0	0	15705418	2018-02-28 07:38:45.789581	2018-02-28 07:38:45.789581
167	1	1	2018-06-16	2018	6	2	6	0	0	429975	1800220	946901	931725	642426	2176574	2129474	1973182	3425481	1530785	0	0	0	15986743	2018-02-28 07:38:45.795614	2018-02-28 07:38:45.795614
168	1	1	2018-06-17	2018	6	2	7	0	0	429975	744481	1109313	2102183	1040502	1542457	1134036	2154550	3215432	1828003	0	0	0	15300932	2018-02-28 07:38:45.801979	2018-02-28 07:38:45.801979
169	1	1	2018-06-18	2018	6	3	1	0	0	529200	837045	1104169	1187771	1043311	1495958	1277309	2255854	3919476	1423586	0	0	0	15073679	2018-02-28 07:38:45.809523	2018-02-28 07:38:45.809523
170	1	1	2018-06-19	2018	6	3	2	0	0	429975	643239	1565411	708840	1335489	2731208	4962346	3357669	3153332	1888296	0	0	0	20775805	2018-02-28 07:38:45.815736	2018-02-28 07:38:45.815736
171	1	1	2018-06-20	2018	6	3	3	0	0	595350	1683081	2510204	2593164	2487993	5607739	6882551	6307793	5168465	4245685	0	0	0	38082025	2018-02-28 07:38:45.821627	2018-02-28 07:38:45.821627
172	1	1	2018-06-21	2018	6	3	4	0	0	635040	1966740	2414679	3907294	3179628	2735336	3706269	9064929	5553378	3288315	0	0	0	36451608	2018-02-28 07:38:45.827682	2018-02-28 07:38:45.827682
173	1	1	2018-06-22	2018	6	3	5	0	0	297675	1095322	2215658	1537466	773914	1496112	1782876	2463294	1895802	1418107	0	0	0	14976226	2018-02-28 07:38:45.833602	2018-02-28 07:38:45.833602
174	1	1	2018-06-23	2018	6	3	6	0	0	396900	1153352	600911	1127612	1642972	1598476	3033993	4360746	2309839	1588093	0	0	0	17812894	2018-02-28 07:38:45.839467	2018-02-28 07:38:45.839467
175	1	1	2018-06-24	2018	6	3	7	0	0	396900	1081092	1692056	1137692	1166888	1489706	2815090	4706874	1459708	1600478	0	0	0	17546484	2018-02-28 07:38:45.845655	2018-02-28 07:38:45.845655
176	1	1	2018-06-25	2018	6	4	1	0	0	463050	742936	1679202	1474702	1008238	857483	2281993	3737923	1444073	1427356	0	0	0	15116956	2018-02-28 07:38:45.852126	2018-02-28 07:38:45.852126
177	1	1	2018-06-26	2018	6	4	2	0	0	330750	1576363	1004327	529172	819622	2612275	2051092	2753673	4160448	1432946	0	0	0	17270668	2018-02-28 07:38:45.858749	2018-02-28 07:38:45.858749
178	1	1	2018-06-27	2018	6	4	3	0	0	992250	1850166	2017291	2386336	2238374	3343456	7631865	4375023	10123944	5009326	0	0	0	39968031	2018-02-28 07:38:45.864859	2018-02-28 07:38:45.864859
179	1	1	2018-06-28	2018	6	4	4	0	0	899640	1379332	1059518	2756856	1866358	3840918	5190744	7676547	10044399	4332140	0	0	0	39046452	2018-02-28 07:38:45.870855	2018-02-28 07:38:45.870855
180	1	1	2018-06-29	2018	6	4	5	0	0	661500	888100	1971727	1706758	1704530	1861262	1703689	3027102	2308413	2315040	0	0	0	18148121	2018-02-28 07:38:45.876973	2018-02-28 07:38:45.876973
181	1	1	2018-06-30	2018	6	4	6	0	0	595350	854724	1079796	1007881	1097951	1114143	2059947	3403206	3497679	1476786	0	0	0	16187463	2018-02-28 07:38:45.882881	2018-02-28 07:38:45.882881
182	1	1	2018-07-01	2018	6	4	7	0	0	595350	1080866	905768	1841212	650550	1692773	1386563	3732833	1275386	1046625	0	0	0	14207926	2018-02-28 07:38:45.888925	2018-02-28 07:38:45.888925
183	1	1	2018-07-02	2018	7	1	1	0	0	423444	903348	1422774	2804030	2247432	1945982	742484	1047425	955647	661802	0	0	0	13154368	2018-02-28 07:38:45.895265	2018-02-28 07:38:45.895265
184	1	1	2018-07-03	2018	7	1	2	0	0	508133	677511	1067081	1625825	1695350	1400441	479535	1430358	1506605	911218	0	0	0	11302057	2018-02-28 07:38:45.901723	2018-02-28 07:38:45.901723
185	1	1	2018-07-04	2018	7	1	3	0	0	338756	677511	853664	855998	2610256	813691	962977	1693715	1159112	1330250	0	0	0	11295930	2018-02-28 07:38:45.908714	2018-02-28 07:38:45.908714
151	1	1	2018-05-31	2018	5	5	4	0	0	297675	944167	1494582	884701	1130166	1140768	2099042	1527243	2377272	996784	0	0	0	12892400	2018-02-28 07:38:45.697145	2018-05-13 22:49:36.251931
152	1	1	2018-06-01	2018	5	5	5	0	0	297675	495708	595816	1415042	1454940	1644410	2899908	1521243	3076596	2028088	0	0	0	15429426	2018-02-28 07:38:45.703435	2018-05-13 22:49:36.257932
153	1	1	2018-06-02	2018	5	5	6	0	0	595350	754543	1153948	955627	1277120	1179042	2108471	1816942	2030897	1199047	0	0	0	13070987	2018-02-28 07:38:45.71024	2018-05-13 22:49:36.262932
154	1	1	2018-06-03	2018	5	5	7	0	0	463050	978912	875880	1276855	1548183	1275672	1762346	2360250	2431155	946201	0	0	0	13918504	2018-02-28 07:38:45.716621	2018-05-13 22:49:36.269932
150	1	1	2018-05-30	2018	5	5	3	0	0	396900	759700	1516276	1199797	968405	1788501	2784827	3741639	3435370	2318440	0	0	0	18909855	2018-02-28 07:38:45.691304	2018-05-13 22:49:36.244931
186	1	1	2018-07-05	2018	7	1	4	0	0	310526	722678	924803	914575	4806574	931389	1134920	1941612	2197143	1844388	0	0	0	15728608	2018-02-28 07:38:45.914305	2018-02-28 07:38:45.914305
187	1	1	2018-07-06	2018	7	1	5	0	0	127033	293588	426832	646233	1323611	569405	427036	597234	645811	324836	0	0	0	5381619	2018-02-28 07:38:45.920129	2018-02-28 07:38:45.920129
188	1	1	2018-07-07	2018	7	1	6	0	0	268181	429090	711386	591933	2426932	794252	255683	387892	955846	571508	0	0	0	7392703	2018-02-28 07:38:45.925678	2018-02-28 07:38:45.925678
189	1	1	2018-07-08	2018	7	1	7	0	0	564593	813013	711387	2920254	4390106	909389	776649	780907	2359107	979152	0	0	0	15204557	2018-02-28 07:38:45.931499	2018-02-28 07:38:45.931499
190	1	1	2018-07-09	2018	7	2	1	0	0	395215	632344	782526	1351230	3113987	1825591	780001	736208	1300318	828379	0	0	0	11745799	2018-02-28 07:38:45.940719	2018-02-28 07:38:45.940719
191	1	1	2018-07-10	2018	7	2	2	0	0	282296	406507	782526	2497242	1931320	1505232	552364	2060296	821794	1106269	0	0	0	11945846	2018-02-28 07:38:45.947864	2018-02-28 07:38:45.947864
192	1	1	2018-07-11	2018	7	2	3	0	0	310526	632344	711387	1234114	1457899	1157053	1113515	780416	1820571	1120373	0	0	0	10338198	2018-02-28 07:38:45.953981	2018-02-28 07:38:45.953981
193	1	1	2018-07-12	2018	7	2	4	0	0	254067	903348	1067081	2245796	3480874	968318	1483737	1451762	1040520	954523	0	0	0	13850026	2018-02-28 07:38:45.959764	2018-02-28 07:38:45.959764
194	1	1	2018-07-13	2018	7	2	5	0	0	225837	271004	391262	1271088	896936	930776	337087	331337	654745	448006	0	0	0	5758078	2018-02-28 07:38:45.967718	2018-02-28 07:38:45.967718
195	1	1	2018-07-14	2018	7	2	6	0	0	169378	383923	462401	648537	591075	579576	451462	448855	721694	209833	0	0	0	4666734	2018-02-28 07:38:45.975904	2018-02-28 07:38:45.975904
196	1	1	2018-07-15	2018	7	2	7	0	0	564593	813013	853664	2877413	1403398	1375395	889840	2032371	1803945	702538	0	0	0	13316170	2018-02-28 07:38:45.984213	2018-02-28 07:38:45.984213
197	1	1	2018-07-16	2018	7	3	1	0	0	366985	722678	1209358	3026376	2246454	1836699	613652	742179	886982	1077275	0	0	0	12728638	2018-02-28 07:38:45.992659	2018-02-28 07:38:45.992659
198	1	1	2018-07-17	2018	7	3	2	0	0	451674	406507	1209358	692329	2090404	1226859	890279	1947785	2548888	788178	0	0	0	12252261	2018-02-28 07:38:46.000318	2018-02-28 07:38:46.000318
199	1	1	2018-07-18	2018	7	3	3	0	0	366985	451674	1138219	831247	1841362	1604666	1323902	1197357	1435700	1245087	0	0	0	11436199	2018-02-28 07:38:46.006405	2018-02-28 07:38:46.006405
200	1	1	2018-07-19	2018	7	3	4	0	0	338756	406507	853664	2407105	1471407	779670	830943	1093919	1827484	744676	0	0	0	10754131	2018-02-28 07:38:46.01303	2018-02-28 07:38:46.01303
201	1	1	2018-07-20	2018	7	3	5	0	0	282296	316172	320124	1057262	2470730	574302	478378	671639	744200	627418	0	0	0	7542521	2018-02-28 07:38:46.018882	2018-02-28 07:38:46.018882
202	1	1	2018-07-21	2018	7	3	6	0	0	225837	248421	604678	1344344	1052492	564155	442636	993992	434298	532616	0	0	0	6443469	2018-02-28 07:38:46.026531	2018-02-28 07:38:46.026531
203	1	1	2018-07-22	2018	7	3	7	0	0	282296	813013	1138219	3850346	3954233	680438	760957	1434531	868131	533667	0	0	0	14315831	2018-02-28 07:38:46.033721	2018-02-28 07:38:46.033721
204	1	1	2018-07-23	2018	7	4	1	0	0	564593	406507	711387	925353	1783964	956847	487833	779439	1470130	727692	0	0	0	8813745	2018-02-28 07:38:46.039968	2018-02-28 07:38:46.039968
205	1	1	2018-07-24	2018	7	4	2	0	0	254067	451674	640248	2104132	2502555	1454766	615562	1250953	2040154	819179	0	0	0	12133290	2018-02-28 07:38:46.045936	2018-02-28 07:38:46.045936
206	1	1	2018-07-25	2018	7	4	3	0	0	564593	587176	1351635	2307912	1292138	818607	499057	1402071	1353300	633270	0	0	0	10809759	2018-02-28 07:38:46.052877	2018-02-28 07:38:46.052877
207	1	1	2018-07-26	2018	7	4	4	0	0	508133	903348	1138219	2519437	3571461	618266	563560	839930	2429484	737557	0	0	0	13829395	2018-02-28 07:38:46.058969	2018-02-28 07:38:46.058969
208	1	1	2018-07-27	2018	7	4	5	0	0	239952	293588	355693	1596575	634981	663499	495249	594369	1008400	323082	0	0	0	6205388	2018-02-28 07:38:46.06448	2018-02-28 07:38:46.06448
209	1	1	2018-07-28	2018	7	4	6	0	0	141148	361339	497970	1738132	1048016	610244	322115	430283	310345	275146	0	0	0	5734738	2018-02-28 07:38:46.070191	2018-02-28 07:38:46.070191
210	1	1	2018-07-29	2018	7	4	7	0	0	423444	767846	924803	2532757	1704761	1184147	1125081	1588920	1228882	1039906	0	0	0	12520547	2018-02-28 07:38:46.076093	2018-02-28 07:38:46.076093
211	1	1	2018-07-30	2018	8	1	1	0	0	423444	903348	640248	916923	2803755	914944	700355	1160412	2482922	861834	0	0	0	11808185	2018-02-28 07:38:46.081905	2018-02-28 07:38:46.081905
212	1	1	2018-07-31	2018	8	1	2	0	0	564593	632344	782526	3176435	2387034	1332450	678893	1219194	1366583	901661	0	0	0	13041713	2018-02-28 07:38:46.087817	2018-02-28 07:38:46.087817
213	1	1	2018-08-01	2018	8	1	3	0	0	508133	609760	1067080	1813904	6341142	1618028	1194131	2181462	2636113	1633868	0	0	0	19603621	2018-02-28 07:38:46.094449	2018-02-28 07:38:46.094449
214	1	1	2018-08-02	2018	8	1	4	0	0	423444	1287271	960372	2075761	3333532	1165041	751487	1809696	1879346	2130365	0	0	0	15816315	2018-02-28 07:38:46.10113	2018-02-28 07:38:46.10113
215	1	1	2018-08-03	2018	8	1	5	0	0	762200	1355022	1920744	4159761	3582562	1326803	1590297	2318220	2633506	967900	0	0	0	20617015	2018-02-28 07:38:46.107797	2018-02-28 07:38:46.107797
216	1	1	2018-08-04	2018	8	1	6	0	0	677511	1016267	1387204	1541173	2495933	2025585	1525559	1618367	1735386	2076640	0	0	0	16099625	2018-02-28 07:38:46.113632	2018-02-28 07:38:46.113632
217	1	1	2018-08-05	2018	8	1	7	0	0	275239	508133	746956	1909074	3059202	878766	835488	1620423	1120316	458978	0	0	0	11412575	2018-02-28 07:38:46.119275	2018-02-28 07:38:46.119275
218	1	1	2018-08-06	2018	8	2	1	0	0	381100	440382	480186	2836292	1025934	972632	675818	910217	682675	484898	0	0	0	8890134	2018-02-28 07:38:46.125043	2018-02-28 07:38:46.125043
219	1	1	2018-08-07	2018	8	2	2	0	0	592822	880764	1387204	2901270	2329358	1728871	1701872	2002689	2715109	2252573	0	0	0	18492532	2018-02-28 07:38:46.130806	2018-02-28 07:38:46.130806
220	1	1	2018-08-08	2018	8	2	3	0	0	508133	880764	1600620	4619754	5572040	817935	849148	1523130	1952124	1461801	0	0	0	19785449	2018-02-28 07:38:46.137405	2018-02-28 07:38:46.137405
221	1	1	2018-08-09	2018	8	2	4	0	0	508133	1287271	1173788	6021442	5924366	1761440	920983	1757668	2568255	1440686	0	0	0	23364032	2018-02-28 07:38:46.145509	2018-02-28 07:38:46.145509
222	1	1	2018-08-10	2018	8	2	5	0	0	635167	948515	1707328	2205433	2415368	2476912	874927	1525627	1609587	1207566	0	0	0	15606430	2018-02-28 07:38:46.152234	2018-02-28 07:38:46.152234
223	1	1	2018-08-11	2018	8	2	6	0	0	635167	1219520	1814036	4330391	2448850	1477755	1199774	1711245	1600021	2355716	0	0	0	18792475	2018-02-28 07:38:46.158396	2018-02-28 07:38:46.158396
224	1	1	2018-08-12	2018	8	2	7	0	0	275239	609760	907018	875135	2421916	919068	1058194	1664324	770139	423098	0	0	0	9923891	2018-02-28 07:38:46.164353	2018-02-28 07:38:46.164353
225	1	1	2018-08-13	2018	8	3	1	0	0	232894	575884	960372	1335528	894964	1368437	530598	804268	1123569	531164	0	0	0	8357678	2018-02-28 07:38:46.170336	2018-02-28 07:38:46.170336
226	1	1	2018-08-14	2018	8	3	2	0	0	804544	948515	960372	2641334	7350991	1552704	1469348	3086037	3081458	1079323	0	0	0	22974626	2018-02-28 07:38:46.176613	2018-02-28 07:38:46.176613
227	1	1	2018-08-15	2018	8	3	3	0	0	508133	1084018	960372	3780293	4489105	2654734	1575579	1834697	1588269	994350	0	0	0	19469550	2018-02-28 07:38:46.182516	2018-02-28 07:38:46.182516
228	1	1	2018-08-16	2018	8	3	4	0	0	635167	880764	1600620	2309086	2715597	2320592	818039	1577076	2084977	1343574	0	0	0	16285492	2018-02-28 07:38:46.1885	2018-02-28 07:38:46.1885
229	1	1	2018-08-17	2018	8	3	5	0	0	635167	1016267	1920744	2915352	3036329	1988508	1329508	1726478	2627044	1488716	0	0	0	18684113	2018-02-28 07:38:46.194235	2018-02-28 07:38:46.194235
230	1	1	2018-08-18	2018	8	3	6	0	0	719855	1151769	1814036	5386228	6031923	1453465	1617203	1609236	3764239	1793424	0	0	0	25341378	2018-02-28 07:38:46.200021	2018-02-28 07:38:46.200021
231	1	1	2018-08-19	2018	8	3	7	0	0	402272	440382	960372	1696750	1280287	1110530	293885	932468	622506	777310	0	0	0	8516762	2018-02-28 07:38:46.20618	2018-02-28 07:38:46.20618
232	1	1	2018-08-20	2018	8	4	1	0	0	296411	304880	960372	1159648	3807843	1034421	646247	1107522	746292	444488	0	0	0	10508124	2018-02-28 07:38:46.213684	2018-02-28 07:38:46.213684
233	1	1	2018-08-21	2018	8	4	2	0	0	550478	1287271	1387204	2817205	5374278	2085169	1625526	3269714	3513312	1651020	0	0	0	23561177	2018-02-28 07:38:46.21995	2018-02-28 07:38:46.21995
234	1	1	2018-08-22	2018	8	4	3	0	0	381100	745262	1493912	2107786	2028439	2380733	1706765	1071186	1770469	2263975	0	0	0	15949627	2018-02-28 07:38:46.225739	2018-02-28 07:38:46.225739
235	1	1	2018-08-23	2018	8	4	4	0	0	592822	609760	2134160	4090918	3243821	2527355	1863925	1918158	1792536	1643835	0	0	0	20417290	2018-02-28 07:38:46.231571	2018-02-28 07:38:46.231571
236	1	1	2018-08-24	2018	8	4	5	0	0	592822	609760	1387204	1440537	5742153	2956718	853284	1614102	2067230	2081507	0	0	0	19345317	2018-02-28 07:38:46.237365	2018-02-28 07:38:46.237365
237	1	1	2018-08-25	2018	8	4	6	0	0	846889	1016267	1387204	3164096	3538080	2122688	1704002	1341541	1902597	2651552	0	0	0	19674916	2018-02-28 07:38:46.243237	2018-02-28 07:38:46.243237
238	1	1	2018-08-26	2018	8	4	7	0	0	254067	677511	853664	1435474	3019017	1001110	910623	795155	996836	704890	0	0	0	10648347	2018-02-28 07:38:46.250095	2018-02-28 07:38:46.250095
239	1	1	2018-08-27	2018	9	1	1	0	0	211722	474258	800310	1786705	1987785	857461	828240	1544666	978341	528369	0	0	0	9997857	2018-02-28 07:38:46.256584	2018-02-28 07:38:46.256584
240	1	1	2018-08-28	2018	9	1	2	0	0	423444	745262	1920744	4814878	2929069	2371254	843746	1673534	2296151	719266	0	0	0	18737348	2018-02-28 07:38:46.262192	2018-02-28 07:38:46.262192
241	1	1	2018-08-29	2018	9	1	3	0	0	762200	1151769	2134160	2806693	2622426	1280555	1260996	1805014	2035816	1771536	0	0	0	17631165	2018-02-28 07:38:46.2677	2018-02-28 07:38:46.2677
242	1	1	2018-08-30	2018	9	1	4	0	0	719855	880764	1707328	4943530	4708542	2367779	1637637	1531525	1565337	1322632	0	0	0	21384929	2018-02-28 07:38:46.273527	2018-02-28 07:38:46.273527
243	1	1	2018-08-31	2018	9	1	5	0	0	441000	572713	715954	593100	748088	1838862	1596256	2069514	1135034	726056	0	0	0	10436577	2018-02-28 07:38:46.279083	2018-02-28 07:38:46.279083
244	1	1	2018-09-01	2018	9	1	6	0	0	220500	678848	948593	1199814	532518	1465644	1110204	2326229	1608236	998444	0	0	0	11089030	2018-02-28 07:38:46.284637	2018-02-28 07:38:46.284637
245	1	1	2018-09-02	2018	9	1	7	0	0	352800	408671	513301	1169306	903112	972396	1952125	2221174	1299548	944742	0	0	0	10737175	2018-02-28 07:38:46.290215	2018-02-28 07:38:46.290215
246	1	1	2018-09-03	2018	9	2	1	0	0	374850	789832	1280912	461902	865892	1608905	2020631	1190178	2448590	1925192	0	0	0	12966884	2018-02-28 07:38:46.296638	2018-02-28 07:38:46.296638
247	1	1	2018-09-04	2018	9	2	2	0	0	308700	444565	408441	891990	859933	1092617	1813444	1231383	1235868	1411776	0	0	0	9698717	2018-02-28 07:38:46.303152	2018-02-28 07:38:46.303152
248	1	1	2018-09-05	2018	9	2	3	0	0	396900	858441	1637423	1286930	1823096	2153362	3817070	4000653	3862392	2738614	0	0	0	22574881	2018-02-28 07:38:46.309334	2018-02-28 07:38:46.309334
249	1	1	2018-09-06	2018	9	2	4	0	0	599760	1543077	2000966	2111472	1887662	1054097	3153811	5087541	3696690	2573750	0	0	0	23708826	2018-02-28 07:38:46.31542	2018-02-28 07:38:46.31542
250	1	1	2018-09-07	2018	9	2	5	0	0	418950	854784	1065785	503335	707288	1344533	1471280	3465666	1288151	1400453	0	0	0	12520225	2018-02-28 07:38:46.32166	2018-02-28 07:38:46.32166
251	1	1	2018-09-08	2018	9	2	6	0	0	352800	382840	1706078	461846	734582	1410261	1278572	2849472	1182022	686477	0	0	0	11044950	2018-02-28 07:38:46.329519	2018-02-28 07:38:46.329519
252	1	1	2018-09-09	2018	9	2	7	0	0	418950	359246	622517	1098795	1035395	1001530	949320	1447958	1261620	1968978	0	0	0	10164309	2018-02-28 07:38:46.337628	2018-02-28 07:38:46.337628
253	1	1	2018-09-10	2018	9	3	1	0	0	308700	545401	1205475	908472	576983	1783683	2301572	3340006	1428390	775946	0	0	0	13174628	2018-02-28 07:38:46.346473	2018-02-28 07:38:46.346473
254	1	1	2018-09-11	2018	9	3	2	0	0	264600	616102	614115	1251222	957715	1419466	1524466	1985539	1050287	1749250	0	0	0	11432762	2018-02-28 07:38:46.354991	2018-02-28 07:38:46.354991
255	1	1	2018-09-12	2018	9	3	3	0	0	705600	1022087	2975032	2023052	1611910	1558036	4368066	3303618	5247018	3809166	0	0	0	26623585	2018-02-28 07:38:46.363759	2018-02-28 07:38:46.363759
256	1	1	2018-09-13	2018	9	3	4	0	0	388080	393743	1140061	2068243	1508895	2378410	3408766	2507532	3183978	2760734	0	0	0	19738442	2018-02-28 07:38:46.372655	2018-02-28 07:38:46.372655
257	1	1	2018-09-14	2018	9	3	5	0	0	286650	534424	785970	426176	606801	1463353	1238475	2477842	1991214	1439486	0	0	0	11250391	2018-02-28 07:38:46.37963	2018-02-28 07:38:46.37963
258	1	1	2018-09-15	2018	9	3	6	0	0	352800	569122	996493	437670	819274	585315	1354755	1341774	1608639	1120799	0	0	0	9186641	2018-02-28 07:38:46.385765	2018-02-28 07:38:46.385765
259	1	1	2018-09-16	2018	9	3	7	0	0	396900	584808	1190214	962889	690967	945663	2627933	2322043	1913013	946065	0	0	0	12580495	2018-02-28 07:38:46.391695	2018-02-28 07:38:46.391695
260	1	1	2018-09-17	2018	9	4	1	0	0	220500	482417	439912	493622	1251701	915251	2534222	1734478	1362629	756210	0	0	0	10190942	2018-02-28 07:38:46.397846	2018-02-28 07:38:46.397846
261	1	1	2018-09-18	2018	9	4	2	0	0	264600	584164	761829	742195	510709	705141	2353986	2908812	1233956	1596492	0	0	0	11661884	2018-02-28 07:38:46.404753	2018-02-28 07:38:46.404753
262	1	1	2018-09-19	2018	9	4	3	0	0	661500	1355988	1244373	1886392	2654826	3220885	2520887	3938986	4310444	3087699	0	0	0	24881980	2018-02-28 07:38:46.410542	2018-02-28 07:38:46.410542
263	1	1	2018-09-20	2018	9	4	4	0	0	705600	1126014	708273	1364848	1858198	1097768	4411278	2547453	3310284	2289030	0	0	0	19418746	2018-02-28 07:38:46.416312	2018-02-28 07:38:46.416312
264	1	1	2018-09-21	2018	9	4	5	0	0	374850	626199	316459	1245680	564232	797245	2193208	1433686	1870218	1540614	0	0	0	10962391	2018-02-28 07:38:46.424824	2018-02-28 07:38:46.424824
265	1	1	2018-09-22	2018	9	4	6	0	0	441000	1026740	1004390	604506	1157595	1877136	2645172	2711061	1022317	1001972	0	0	0	13491889	2018-02-28 07:38:46.430641	2018-02-28 07:38:46.430641
266	1	1	2018-09-23	2018	9	4	7	0	0	441000	705632	648872	781283	761116	1232800	1180120	1754123	2903696	860108	0	0	0	11268750	2018-02-28 07:38:46.436254	2018-02-28 07:38:46.436254
267	1	1	2018-09-24	2018	10	1	1	0	0	220500	918191	871218	808010	586752	840655	2043450	1324525	1952839	1754930	0	0	0	11321070	2018-02-28 07:38:46.442311	2018-02-28 07:38:46.442311
268	1	1	2018-09-25	2018	10	1	2	0	0	286650	1048394	357436	730880	602539	894250	1236119	2322540	2243472	1064120	0	0	0	10786400	2018-02-28 07:38:46.448573	2018-02-28 07:38:46.448573
269	1	1	2018-09-26	2018	10	1	3	0	0	661500	1036832	1500166	2640428	968153	2143984	3736415	4773656	5392806	2507797	0	0	0	25361737	2018-02-28 07:38:46.455274	2018-02-28 07:38:46.455274
270	1	1	2018-09-27	2018	10	1	4	0	0	599760	761485	3063622	2112182	1910225	1786798	6162406	3709100	3068038	2135745	0	0	0	25309361	2018-02-28 07:38:46.460897	2018-02-28 07:38:46.460897
271	1	1	2018-09-28	2018	10	1	5	0	0	330750	1174081	1516276	1333108	1489854	1676720	2386994	4605094	3817078	2753148	0	0	0	21083103	2018-02-28 07:38:46.4667	2018-02-28 07:38:46.4667
272	1	1	2018-09-29	2018	10	1	6	0	0	496125	809286	1494582	810976	1004592	1939306	1949111	1696937	3169696	1107538	0	0	0	14478149	2018-02-28 07:38:46.472609	2018-02-28 07:38:46.472609
273	1	1	2018-09-30	2018	10	1	7	0	0	396900	454399	728220	744759	1148637	1384766	1884940	1521243	2221986	1318257	0	0	0	11804107	2018-02-28 07:38:46.479175	2018-02-28 07:38:46.479175
274	1	1	2018-10-01	2018	10	2	1	0	0	297675	1077918	692369	868752	1473600	1473803	4216942	2826354	1827807	942108	0	0	0	15697328	2018-02-28 07:38:46.485676	2018-02-28 07:38:46.485676
275	1	1	2018-10-02	2018	10	2	2	0	0	529200	673002	778560	1064046	1754607	2168642	3524692	3540375	2279208	1892402	0	0	0	18204734	2018-02-28 07:38:46.491958	2018-02-28 07:38:46.491958
276	1	1	2018-10-03	2018	10	2	3	0	0	628425	1236114	1172714	1051529	1194185	2619594	3199777	2510745	2461707	1490067	0	0	0	17564857	2018-02-28 07:38:46.497901	2018-02-28 07:38:46.497901
277	1	1	2018-10-04	2018	10	2	4	0	0	562275	1938114	692608	1225421	867327	1903590	3622734	2729174	3999429	1381659	0	0	0	18922331	2018-02-28 07:38:46.505247	2018-02-28 07:38:46.505247
278	1	1	2018-10-05	2018	10	2	5	0	0	595350	896327	2438612	2915320	2760906	4548013	6410939	8774315	6781102	2845656	0	0	0	38966540	2018-02-28 07:38:46.514224	2018-02-28 07:38:46.514224
279	1	1	2018-10-06	2018	10	2	6	0	0	1058400	1328194	2568825	1850539	1462959	1497746	3345829	7795046	7974916	2488955	0	0	0	31371409	2018-02-28 07:38:46.524022	2018-02-28 07:38:46.524022
280	1	1	2018-10-07	2018	10	2	7	0	0	463050	1187045	962410	636640	867833	1360466	2096050	3329469	1678922	2165192	0	0	0	14747077	2018-02-28 07:38:46.533135	2018-02-28 07:38:46.533135
281	1	1	2018-10-08	2018	10	3	1	0	0	661500	1004442	682569	1061689	1014013	1771687	2880922	3253953	2392182	1347501	0	0	0	16070458	2018-02-28 07:38:46.542324	2018-02-28 07:38:46.542324
282	1	1	2018-10-09	2018	10	3	2	0	0	529200	1146306	1879923	1157352	1106140	2309568	1655018	3919590	2600176	1713419	0	0	0	18016692	2018-02-28 07:38:46.550444	2018-02-28 07:38:46.550444
283	1	1	2018-10-10	2018	10	3	3	0	0	429975	413838	853779	1467884	1761292	2001338	2020645	4531629	2531657	1615929	0	0	0	17627966	2018-02-28 07:38:46.55706	2018-02-28 07:38:46.55706
284	1	1	2018-10-11	2018	10	3	4	0	0	429975	983164	861201	1878583	839049	1943147	4744129	2403236	1666247	2439979	0	0	0	18188710	2018-02-28 07:38:46.56324	2018-02-28 07:38:46.56324
285	1	1	2018-10-12	2018	10	3	5	0	0	1323000	1466281	4052373	3751630	1952810	3409179	7868749	5439829	3487022	3957521	0	0	0	36708394	2018-02-28 07:38:46.569921	2018-02-28 07:38:46.569921
286	1	1	2018-10-13	2018	10	3	6	0	0	1058400	1501655	2526719	1499553	2510362	1864172	3291906	9396524	12090706	2072782	0	0	0	37812779	2018-02-28 07:38:46.576092	2018-02-28 07:38:46.576092
287	1	1	2018-10-14	2018	10	3	7	0	0	529200	914953	1616730	1570258	1566101	874913	2478675	2569162	1581209	1068260	0	0	0	14769461	2018-02-28 07:38:46.582175	2018-02-28 07:38:46.582175
288	1	1	2018-10-15	2018	10	4	1	0	0	396900	1800220	1721638	621150	1070711	1886364	3371668	2170500	3235177	1177527	0	0	0	17451855	2018-02-28 07:38:46.587866	2018-02-28 07:38:46.587866
289	1	1	2018-10-16	2018	10	4	2	0	0	529200	656895	1109313	1217053	1224120	1670995	1247440	1846757	3617361	1687387	0	0	0	14806521	2018-02-28 07:38:46.593735	2018-02-28 07:38:46.593735
290	1	1	2018-10-17	2018	10	4	3	0	0	429975	784730	1189105	1979618	753502	1495958	1277309	2602908	4380591	1642599	0	0	0	16536295	2018-02-28 07:38:46.600166	2018-02-28 07:38:46.600166
291	1	1	2018-10-18	2018	10	4	4	0	0	463050	643239	1271897	945120	1438219	2731208	4714229	2686135	4279522	3021274	0	0	0	22193893	2018-02-28 07:38:46.606904	2018-02-28 07:38:46.606904
292	1	1	2018-10-19	2018	10	4	5	0	0	1323000	2754133	2384694	2593164	1317173	4948005	5047204	5782143	4060937	2918908	0	0	0	33129361	2018-02-28 07:38:46.613123	2018-02-28 07:38:46.613123
293	1	1	2018-10-20	2018	10	4	6	0	0	1058400	2198121	2736636	3907294	1907777	2279447	3474627	5248117	8638588	2260717	0	0	0	33709724	2018-02-28 07:38:46.619414	2018-02-28 07:38:46.619414
294	1	1	2018-10-21	2018	10	4	7	0	0	429975	773168	1994092	2049954	696523	2493520	2317739	2463294	1706222	974949	0	0	0	15899436	2018-02-28 07:38:46.625673	2018-02-28 07:38:46.625673
295	1	1	2018-10-22	2018	10	5	1	0	0	529200	922681	924478	1127612	821486	2264507	1950424	4651462	2639816	1588093	0	0	0	17419759	2018-02-28 07:38:46.63162	2018-02-28 07:38:46.63162
296	1	1	2018-10-23	2018	10	5	2	0	0	661500	1711729	1094860	1654824	807845	1117280	3248181	4000843	1824635	1920573	0	0	0	18042270	2018-02-28 07:38:46.637882	2018-02-28 07:38:46.637882
297	1	1	2018-10-24	2018	10	5	3	0	0	396900	742936	1595242	884821	1411533	1286225	1681469	2491949	3209050	1427356	0	0	0	15127481	2018-02-28 07:38:46.64454	2018-02-28 07:38:46.64454
298	1	1	2018-10-25	2018	10	5	4	0	0	595350	1576363	1908221	999547	751320	3265344	2563865	4024599	2600280	2292714	0	0	0	20577603	2018-02-28 07:38:46.650824	2018-02-28 07:38:46.650824
299	1	1	2018-10-26	2018	10	5	5	0	0	793800	2220199	2219020	1835643	2754922	2149365	6783880	4812525	5061972	3443912	0	0	0	32075238	2018-02-28 07:38:46.657631	2018-02-28 07:38:46.657631
300	1	1	2018-10-27	2018	10	5	6	0	0	1005480	689666	1236105	1895339	2266292	4609102	3114446	7676547	7401136	2166070	0	0	0	32060183	2018-02-28 07:38:46.663794	2018-02-28 07:38:46.663794
301	1	1	2018-10-28	2018	10	5	7	0	0	463050	683154	1867952	1109393	1704530	1279618	2650183	2421682	1765257	1583975	0	0	0	15528794	2018-02-28 07:38:46.669588	2018-02-28 07:38:46.669588
302	1	1	2018-10-29	2018	11	1	1	0	0	429975	703891	1199773	1007881	914960	1980699	3558090	4083847	1943155	1230655	0	0	0	17052926	2018-02-28 07:38:46.675594	2018-02-28 07:38:46.675594
303	1	1	2018-10-30	2018	11	1	2	0	0	429975	1080866	1086921	1356683	709691	1493624	2156875	3732833	1275386	1279209	0	0	0	14602063	2018-02-28 07:38:46.681566	2018-02-28 07:38:46.681566
304	1	1	2018-10-31	2018	11	1	3	0	0	366985	767846	1280497	2103023	1011344	1513541	567782	1346690	2017477	1250070	0	0	0	12225255	2018-02-28 07:38:46.687688	2018-02-28 07:38:46.687688
305	1	1	2018-11-01	2018	11	1	4	0	0	254067	496841	995942	1921430	2637211	1184988	435941	1210303	2201961	683413	0	0	0	12022097	2018-02-28 07:38:46.69357	2018-02-28 07:38:46.69357
306	1	1	2018-11-02	2018	11	1	5	0	0	338756	451674	1422774	1455197	2610256	1183550	481488	1035048	1416692	864663	0	0	0	11260098	2018-02-28 07:38:46.699535	2018-02-28 07:38:46.699535
307	1	1	2018-11-03	2018	11	1	6	0	0	254067	677511	1209358	685931	4300619	859744	1201680	1650370	2075080	1567730	0	0	0	14482090	2018-02-28 07:38:46.705468	2018-02-28 07:38:46.705468
308	1	1	2018-11-04	2018	11	1	7	0	0	169378	203253	391262	933448	1240886	468922	533795	735058	596134	561080	0	0	0	5833216	2018-02-28 07:38:46.711618	2018-02-28 07:38:46.711618
309	1	1	2018-11-05	2018	11	2	1	0	0	197607	203253	320124	369958	1577506	688351	302171	430991	955846	571508	0	0	0	5617315	2018-02-28 07:38:46.718625	2018-02-28 07:38:46.718625
310	1	1	2018-11-06	2018	11	2	2	0	0	536363	451674	1138219	2530887	3873623	727511	998548	1141326	2483270	856758	0	0	0	14738179	2018-02-28 07:38:46.724738	2018-02-28 07:38:46.724738
311	1	1	2018-11-07	2018	11	2	3	0	0	310526	767846	1209358	1351230	2724739	1622747	1020002	899810	1654950	1104505	0	0	0	12665713	2018-02-28 07:38:46.730624	2018-02-28 07:38:46.730624
312	1	1	2018-11-08	2018	11	2	4	0	0	479904	722678	640248	2330759	3160341	1034847	382406	1716914	1479229	1021171	0	0	0	12968497	2018-02-28 07:38:46.736607	2018-02-28 07:38:46.736607
313	1	1	2018-11-09	2018	11	2	5	0	0	310526	813013	853664	2019460	2267843	1335062	1048014	1064204	1456457	1318086	0	0	0	12486329	2018-02-28 07:38:46.742315	2018-02-28 07:38:46.742315
314	1	1	2018-11-10	2018	11	2	6	0	0	564593	496841	640248	2245796	1842816	893832	1249462	907351	1474070	1363604	0	0	0	11678613	2018-02-28 07:38:46.74914	2018-02-28 07:38:46.74914
315	1	1	2018-11-11	2018	11	2	7	0	0	239952	316172	462401	977760	946766	440894	275799	662674	755475	448006	0	0	0	5525899	2018-02-28 07:38:46.755636	2018-02-28 07:38:46.755636
316	1	1	2018-11-12	2018	11	3	1	0	0	211722	293588	391262	1297074	1313500	434682	354720	345273	962258	272783	0	0	0	5876862	2018-02-28 07:38:46.7626	2018-02-28 07:38:46.7626
317	1	1	2018-11-13	2018	11	3	2	0	0	564593	496841	1422774	2877413	1503641	1132678	400428	1390570	2319358	1561196	0	0	0	13669492	2018-02-28 07:38:46.768444	2018-02-28 07:38:46.768444
318	1	1	2018-11-14	2018	11	3	3	0	0	451674	542009	640248	1702337	2667665	1728658	1090936	1649286	1478304	510288	0	0	0	12461405	2018-02-28 07:38:46.77461	2018-02-28 07:38:46.77461
319	1	1	2018-11-15	2018	11	3	4	0	0	508133	587176	1067081	1384657	3309806	1308650	1008982	1435210	2548888	985223	0	0	0	14143806	2018-02-28 07:38:46.78076	2018-02-28 07:38:46.78076
320	1	1	2018-11-16	2018	11	3	5	0	0	395215	632344	1138219	748122	1841362	1604666	1557532	1959311	861420	913064	0	0	0	11651255	2018-02-28 07:38:46.786224	2018-02-28 07:38:46.786224
321	1	1	2018-11-17	2018	11	3	6	0	0	536363	632344	995942	3209474	1961876	1386080	415472	1009771	1435881	992901	0	0	0	12576104	2018-02-28 07:38:46.791745	2018-02-28 07:38:46.791745
322	1	1	2018-11-18	2018	11	3	7	0	0	183493	248421	711386	830706	1560461	765736	276956	485073	665863	627418	0	0	0	6355513	2018-02-28 07:38:46.797607	2018-02-28 07:38:46.797607
323	1	1	2018-11-19	2018	11	4	1	0	0	155263	361339	533540	1964811	997097	512868	306440	646095	477728	392454	0	0	0	6347635	2018-02-28 07:38:46.804061	2018-02-28 07:38:46.804061
324	1	1	2018-11-20	2018	11	4	2	0	0	423444	542009	924803	2695242	2372540	1134063	581909	1165557	1736262	960601	0	0	0	12536430	2018-02-28 07:38:46.810971	2018-02-28 07:38:46.810971
325	1	1	2018-11-21	2018	11	4	3	0	0	508133	451674	853664	1295494	891982	1913694	596241	1039252	661559	727692	0	0	0	8939385	2018-02-28 07:38:46.817147	2018-02-28 07:38:46.817147
326	1	1	2018-11-22	2018	11	4	4	0	0	423444	677511	782526	1107438	4095090	1454766	554006	1023507	1402606	630138	0	0	0	12151032	2018-02-28 07:38:46.823066	2018-02-28 07:38:46.823066
327	1	1	2018-11-23	2018	11	4	5	0	0	395215	406507	924803	2307912	1184460	818607	720860	1033105	1159972	985086	0	0	0	9936527	2018-02-28 07:38:46.829224	2018-02-28 07:38:46.829224
328	1	1	2018-11-24	2018	11	4	6	0	0	423444	903348	1138219	1482022	3968290	824354	901696	1595867	1918014	1139860	0	0	0	14295114	2018-02-28 07:38:46.835037	2018-02-28 07:38:46.835037
329	1	1	2018-11-25	2018	11	4	7	0	0	254067	271004	711386	1784408	846642	459346	389124	297185	907560	380096	0	0	0	6300818	2018-02-28 07:38:46.841048	2018-02-28 07:38:46.841048
330	1	1	2018-11-26	2018	12	1	1	0	0	254067	271004	569109	869066	1048016	488195	207074	496481	536051	400213	0	0	0	5139276	2018-02-28 07:38:46.848328	2018-02-28 07:38:46.848328
331	1	1	2018-11-27	2018	12	1	2	0	0	564593	858181	1067081	1899568	2216189	1110138	900065	1495454	1316660	675939	0	0	0	12103868	2018-02-28 07:38:46.855346	2018-02-28 07:38:46.855346
332	1	1	2018-11-28	2018	12	1	3	0	0	338756	587176	995942	2037606	3925257	914944	583629	911753	1365607	760442	0	0	0	12421112	2018-02-28 07:38:46.861243	2018-02-28 07:38:46.861243
333	1	1	2018-11-29	2018	12	1	4	0	0	366985	496841	640248	3176435	2557536	1097312	987480	870853	1757036	689506	0	0	0	12640232	2018-02-28 07:38:46.867492	2018-02-28 07:38:46.867492
334	1	1	2018-11-30	2018	12	1	5	0	0	762200	948515	2134160	3265027	4359535	2157370	1123888	1714006	3765876	1057209	0	0	0	21287786	2018-02-28 07:38:46.873502	2018-02-28 07:38:46.873502
335	1	1	2018-12-01	2018	12	1	6	0	0	677511	677511	1173788	1465243	5555886	2213578	1252479	1809696	1879346	1503787	0	0	0	18208825	2018-02-28 07:38:46.879363	2018-02-28 07:38:46.879363
336	1	1	2018-12-02	2018	12	1	7	0	0	592822	880764	1600620	4893836	2303076	2358762	2079619	1586151	2487200	1290533	0	0	0	20073383	2018-02-28 07:38:46.885544	2018-02-28 07:38:46.885544
337	1	1	2018-12-03	2018	12	2	1	0	0	381100	1084018	2027452	1961492	4159889	1800520	1627262	1888095	1272616	1832330	0	0	0	18034774	2018-02-28 07:38:46.891844	2018-02-28 07:38:46.891844
338	1	1	2018-12-04	2018	12	2	2	0	0	359928	542009	1013726	1145444	1682561	585844	556992	1449852	1061352	573722	0	0	0	8971430	2018-02-28 07:38:46.901229	2018-02-28 07:38:46.901229
339	1	1	2018-12-05	2018	12	2	3	0	0	381100	440382	907018	1890862	1709891	486316	477048	1517028	1241228	484898	0	0	0	9535771	2018-02-28 07:38:46.908019	2018-02-28 07:38:46.908019
340	1	1	2018-12-06	2018	12	2	4	0	0	635167	1084018	2134160	2290476	5176352	2659802	900991	2464848	1879691	1855060	0	0	0	21080565	2018-02-28 07:38:46.914094	2018-02-28 07:38:46.914094
341	1	1	2018-12-07	2018	12	2	5	0	0	635167	1219520	1600620	4927738	6268545	1181462	771953	1903913	2066954	1727583	0	0	0	22303455	2018-02-28 07:38:46.919927	2018-02-28 07:38:46.919927
342	1	1	2018-12-08	2018	12	2	6	0	0	381100	677511	1493912	4119934	3136429	1878869	920983	1464723	2568255	1824868	0	0	0	18466584	2018-02-28 07:38:46.92565	2018-02-28 07:38:46.92565
343	1	1	2018-12-09	2018	12	2	7	0	0	508133	745262	2134160	3392974	3421772	1362302	874927	1386934	2069469	2173619	0	0	0	18069552	2018-02-28 07:38:46.931334	2018-02-28 07:38:46.931334
344	1	1	2018-12-10	2018	12	3	1	0	0	762200	1084018	1920744	3566205	1584550	2111078	1136628	1100086	1200016	1531215	0	0	0	15996740	2018-02-28 07:38:46.936945	2018-02-28 07:38:46.936945
345	1	1	2018-12-11	2018	12	3	2	0	0	423444	440382	746956	1352481	1676711	919068	891110	998594	427855	893207	0	0	0	8769808	2018-02-28 07:38:46.944157	2018-02-28 07:38:46.944157
346	1	1	2018-12-12	2018	12	3	3	0	0	190550	575884	693602	741960	1591046	836267	482362	1462306	768758	389520	0	0	0	7732255	2018-02-28 07:38:46.951012	2018-02-28 07:38:46.951012
347	1	1	2018-12-13	2018	12	3	4	0	0	508133	609760	960372	1807229	4492272	1552704	2448914	1786653	1459638	2038722	0	0	0	17664397	2018-02-28 07:38:46.956987	2018-02-28 07:38:46.956987
348	1	1	2018-12-14	2018	12	3	5	0	0	846889	1084018	1493912	2598951	3780299	2156972	1409728	1630842	2743374	1988699	0	0	0	19733684	2018-02-28 07:38:46.962886	2018-02-28 07:38:46.962886
349	1	1	2018-12-15	2018	12	3	6	0	0	677511	1355022	1493912	1814282	2236374	2939416	1158888	2724040	2710470	1151635	0	0	0	18261550	2018-02-28 07:38:46.968694	2018-02-28 07:38:46.968694
350	1	1	2018-12-16	2018	12	3	7	0	0	423444	880764	1600620	1603444	3036329	994254	1189560	1624920	2936108	1488716	0	0	0	15778159	2018-02-28 07:38:46.974945	2018-02-28 07:38:46.974945
351	1	1	2018-12-17	2018	12	4	1	0	0	592822	609760	960372	3590819	5322285	2642664	1725016	2503256	3973364	2241780	0	0	0	24162138	2018-02-28 07:38:46.980914	2018-02-28 07:38:46.980914
352	1	1	2018-12-18	2018	12	4	2	0	0	317583	440382	1013726	1796558	1355598	971713	587770	683810	622506	868758	0	0	0	8658404	2018-02-28 07:38:46.987319	2018-02-28 07:38:46.987319
353	1	1	2018-12-19	2018	12	4	3	0	0	296411	542009	746956	1159648	2605366	620653	682149	664513	746292	488937	0	0	0	8552934	2018-02-28 07:38:46.994068	2018-02-28 07:38:46.994068
354	1	1	2018-12-20	2018	12	4	4	0	0	719855	1084018	1600620	2561095	4299422	1603976	1381697	3106228	1580990	1651020	0	0	0	19588921	2018-02-28 07:38:47.000351	2018-02-28 07:38:47.000351
355	1	1	2018-12-21	2018	12	4	5	0	0	381100	1151769	1280496	1363861	3042659	1339162	948203	1558088	1327852	1906506	0	0	0	14299696	2018-02-28 07:38:47.006301	2018-02-28 07:38:47.006301
356	1	1	2018-12-22	2018	12	4	6	0	0	465789	1151769	1920744	5551960	2671382	1421637	1035514	1662404	1912038	1753424	0	0	0	19546661	2018-02-28 07:38:47.012358	2018-02-28 07:38:47.012358
357	1	1	2018-12-23	2018	12	4	7	0	0	465789	745262	1814036	1920716	3190085	2299669	1450583	3066794	1653784	1734590	0	0	0	18341308	2018-02-28 07:38:47.01808	2018-02-28 07:38:47.01808
358	1	1	2018-12-24	2018	12	5	1	0	0	635167	1151769	1707328	2373072	4717440	1228924	1345265	1207387	3382395	1325776	0	0	0	19074523	2018-02-28 07:38:47.023671	2018-02-28 07:38:47.023671
359	1	1	2018-12-25	2018	12	5	2	0	0	381100	575884	746956	1291927	2616481	750833	862695	514512	712026	497569	0	0	0	8949983	2018-02-28 07:38:47.029693	2018-02-28 07:38:47.029693
360	1	1	2018-12-26	2018	12	5	3	0	0	190550	508133	907018	992614	3379235	1200445	1104320	1544666	628934	528369	0	0	0	10984284	2018-02-28 07:38:47.036081	2018-02-28 07:38:47.036081
361	1	1	2018-12-27	2018	12	5	4	0	0	508133	609760	1280496	4531650	2004100	2540630	973553	1673534	2870189	1222752	0	0	0	18214797	2018-02-28 07:38:47.042575	2018-02-28 07:38:47.042575
362	1	1	2018-12-28	2018	12	5	5	0	0	762200	1016267	2134160	1871129	2950229	1920832	969997	2449662	1821519	1882257	0	0	0	17778252	2018-02-28 07:38:47.04876	2018-02-28 07:38:47.04876
363	1	1	2018-12-29	2018	12	5	6	0	0	508133	1355022	1067080	2601858	4316164	2999186	775723	1178096	1341718	1102193	0	0	0	17245173	2018-02-28 07:38:47.054877	2018-02-28 07:38:47.054877
364	1	1	2018-12-30	2018	12	5	7	0	0	677511	813013	1387204	1582048	4717440	2234408	896843	2146466	2748196	1325776	0	0	0	18528905	2018-02-28 07:38:47.061223	2018-02-28 07:38:47.061223
127	1	1	2018-05-07	2018	5	2	1	0	0	529200	915670	2729038	1754904	1937040	3719444	3523450	4500734	7022530	3042904	0	0	0	29674914	2018-02-28 07:38:45.549695	2018-05-13 22:49:36.094922
149	1	1	2018-05-29	2018	5	5	2	0	0	635040	951857	2757260	2508217	1797859	3248724	5546165	3296978	2510213	2017093	0	0	0	25269406	2018-02-28 07:38:45.685409	2018-05-13 22:49:36.238931
119	1	1	2018-04-29	2018	4	4	7	0	0	465789	609760	960372	5664562	2312423	2710005	843746	1450396	1722113	791193	0	0	0	17530359	2018-02-28 07:38:45.50068	2018-05-13 22:47:58.513341
\.


--
-- Name: rs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: coke
--

SELECT pg_catalog.setval('public.rs_id_seq', 364, true);


--
-- Data for Name: sale_by_sellers; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.sale_by_sellers (id, seller, month, week, day, hour, department, sale, turn, year, created_at, updated_at) FROM stdin;
1951	25	5	1	4	9	1	79013	1	2018	2018-05-16 19:59:43.326768	2018-05-16 19:59:43.326768
1952	25	5	1	4	8	1	68002	1	2018	2018-05-16 19:59:43.328768	2018-05-16 19:59:43.328768
1953	25	5	1	3	5	1	25081	1	2018	2018-05-16 19:59:43.328768	2018-05-16 19:59:43.328768
1954	25	5	1	4	5	1	91424	1	2018	2018-05-16 19:59:43.328768	2018-05-16 19:59:43.328768
1955	25	5	1	4	8	1	85356	1	2018	2018-05-16 19:59:43.328768	2018-05-16 19:59:43.328768
1956	25	5	1	2	8	1	84935	1	2018	2018-05-16 19:59:43.328768	2018-05-16 19:59:43.328768
1957	25	5	1	1	6	1	23538	1	2018	2018-05-16 19:59:43.328768	2018-05-16 19:59:43.328768
1958	25	5	1	1	7	1	48990	1	2018	2018-05-16 19:59:43.338768	2018-05-16 19:59:43.338768
1959	25	5	1	1	8	1	91919	1	2018	2018-05-16 19:59:43.341769	2018-05-16 19:59:43.341769
1960	25	5	1	3	4	1	57241	1	2018	2018-05-16 19:59:43.342769	2018-05-16 19:59:43.342769
1961	25	5	1	3	6	1	99174	1	2018	2018-05-16 19:59:43.344769	2018-05-16 19:59:43.344769
1962	25	5	1	4	9	1	18852	1	2018	2018-05-16 19:59:43.346769	2018-05-16 19:59:43.346769
1963	25	5	1	4	5	1	52305	1	2018	2018-05-16 19:59:43.349769	2018-05-16 19:59:43.349769
1964	25	5	1	2	4	1	18553	1	2018	2018-05-16 19:59:43.350769	2018-05-16 19:59:43.350769
1965	25	5	1	5	5	1	20997	1	2018	2018-05-16 19:59:43.352769	2018-05-16 19:59:43.352769
1966	25	5	1	4	8	1	53001	1	2018	2018-05-16 19:59:43.354769	2018-05-16 19:59:43.354769
1967	25	5	1	5	6	1	75576	1	2018	2018-05-16 19:59:43.355769	2018-05-16 19:59:43.355769
1968	25	5	1	3	4	1	84129	1	2018	2018-05-16 19:59:43.357769	2018-05-16 19:59:43.357769
1969	25	5	1	1	8	1	96381	1	2018	2018-05-16 19:59:43.35977	2018-05-16 19:59:43.35977
1970	25	5	1	2	5	1	80410	1	2018	2018-05-16 19:59:43.35977	2018-05-16 19:59:43.35977
1971	25	5	1	4	8	1	61851	1	2018	2018-05-16 19:59:43.35977	2018-05-16 19:59:43.35977
1972	25	5	1	1	7	1	61190	1	2018	2018-05-16 19:59:43.35977	2018-05-16 19:59:43.35977
1973	25	5	1	3	7	1	11815	1	2018	2018-05-16 19:59:43.35977	2018-05-16 19:59:43.35977
1974	25	5	1	5	8	1	55903	1	2018	2018-05-16 19:59:43.35977	2018-05-16 19:59:43.35977
1975	25	5	1	3	9	1	12362	1	2018	2018-05-16 19:59:43.36977	2018-05-16 19:59:43.36977
1976	25	5	1	1	9	1	73913	1	2018	2018-05-16 19:59:43.37177	2018-05-16 19:59:43.37177
1977	25	5	1	1	9	1	84501	1	2018	2018-05-16 19:59:43.37277	2018-05-16 19:59:43.37277
1978	25	5	1	2	4	1	61985	1	2018	2018-05-16 19:59:43.37477	2018-05-16 19:59:43.37477
1979	25	5	1	3	7	1	55378	1	2018	2018-05-16 19:59:43.37677	2018-05-16 19:59:43.37677
1980	25	5	1	5	5	1	63520	1	2018	2018-05-16 19:59:43.37777	2018-05-16 19:59:43.37777
1981	25	5	1	4	4	1	13702	1	2018	2018-05-16 19:59:43.37977	2018-05-16 19:59:43.37977
1982	25	5	1	5	7	1	80113	1	2018	2018-05-16 19:59:43.38077	2018-05-16 19:59:43.38077
1983	25	5	1	5	4	1	70474	1	2018	2018-05-16 19:59:43.38077	2018-05-16 19:59:43.38077
1984	25	5	1	5	7	1	66819	1	2018	2018-05-16 19:59:43.38077	2018-05-16 19:59:43.38077
1985	25	5	1	5	5	1	65742	1	2018	2018-05-16 19:59:43.38077	2018-05-16 19:59:43.38077
1986	25	5	1	3	6	1	34374	1	2018	2018-05-16 19:59:43.38077	2018-05-16 19:59:43.38077
1987	25	5	1	5	4	1	75391	1	2018	2018-05-16 19:59:43.39077	2018-05-16 19:59:43.39077
1988	25	5	1	5	5	1	66535	1	2018	2018-05-16 19:59:43.39277	2018-05-16 19:59:43.39277
1989	25	5	1	1	8	1	15896	1	2018	2018-05-16 19:59:43.39477	2018-05-16 19:59:43.39477
1990	25	5	1	1	8	1	68030	1	2018	2018-05-16 19:59:43.395771	2018-05-16 19:59:43.395771
1991	25	5	1	4	8	1	58324	1	2018	2018-05-16 19:59:43.397771	2018-05-16 19:59:43.397771
1992	25	5	1	2	4	1	21752	1	2018	2018-05-16 19:59:43.399771	2018-05-16 19:59:43.399771
1993	25	5	1	1	8	1	23669	1	2018	2018-05-16 19:59:43.401771	2018-05-16 19:59:43.401771
1994	25	5	1	4	9	1	95011	1	2018	2018-05-16 19:59:43.402771	2018-05-16 19:59:43.402771
1995	25	5	1	4	9	1	11220	1	2018	2018-05-16 19:59:43.404771	2018-05-16 19:59:43.404771
1996	25	5	1	4	4	1	23789	1	2018	2018-05-16 19:59:43.406771	2018-05-16 19:59:43.406771
1997	25	5	1	1	4	1	92391	1	2018	2018-05-16 19:59:43.408771	2018-05-16 19:59:43.408771
1998	25	5	1	2	9	1	61445	1	2018	2018-05-16 19:59:43.409771	2018-05-16 19:59:43.409771
1999	25	5	1	4	4	1	27521	1	2018	2018-05-16 19:59:43.411771	2018-05-16 19:59:43.411771
2000	25	5	1	4	4	1	34873	1	2018	2018-05-16 19:59:43.413772	2018-05-16 19:59:43.413772
2001	25	5	1	1	8	1	42066	1	2018	2018-05-16 19:59:43.416772	2018-05-16 19:59:43.416772
2002	25	5	1	2	4	1	18980	1	2018	2018-05-16 19:59:43.416772	2018-05-16 19:59:43.416772
2003	25	5	1	4	5	1	98556	1	2018	2018-05-16 19:59:43.416772	2018-05-16 19:59:43.416772
2004	25	5	1	2	7	1	70307	1	2018	2018-05-16 19:59:43.416772	2018-05-16 19:59:43.416772
2005	25	5	1	2	6	1	30188	1	2018	2018-05-16 19:59:43.416772	2018-05-16 19:59:43.416772
2006	25	5	1	4	6	1	38003	1	2018	2018-05-16 19:59:43.416772	2018-05-16 19:59:43.416772
2007	25	5	1	1	9	1	85754	1	2018	2018-05-16 19:59:43.427772	2018-05-16 19:59:43.427772
2008	25	5	1	1	9	1	66724	1	2018	2018-05-16 19:59:43.428772	2018-05-16 19:59:43.428772
2009	25	5	1	2	7	1	41294	1	2018	2018-05-16 19:59:43.430772	2018-05-16 19:59:43.430772
2010	25	5	1	3	6	1	71581	1	2018	2018-05-16 19:59:43.432772	2018-05-16 19:59:43.432772
2011	25	5	2	2	5	1	67385	1	2018	2018-05-16 19:59:43.434772	2018-05-16 19:59:43.434772
2012	25	5	2	2	5	1	61796	1	2018	2018-05-16 19:59:43.436772	2018-05-16 19:59:43.436772
2013	25	5	2	1	5	1	33098	1	2018	2018-05-16 19:59:43.437772	2018-05-16 19:59:43.437772
2014	25	5	2	2	5	1	23967	1	2018	2018-05-16 19:59:43.437772	2018-05-16 19:59:43.437772
2015	25	5	2	2	8	1	73563	1	2018	2018-05-16 19:59:43.437772	2018-05-16 19:59:43.437772
2016	25	5	2	2	9	1	20704	1	2018	2018-05-16 19:59:43.437772	2018-05-16 19:59:43.437772
2017	25	5	2	1	9	1	34904	1	2018	2018-05-16 19:59:43.437772	2018-05-16 19:59:43.437772
2018	25	5	2	1	8	1	48637	1	2018	2018-05-16 19:59:43.447772	2018-05-16 19:59:43.447772
2019	25	5	2	1	9	1	16857	1	2018	2018-05-16 19:59:43.449773	2018-05-16 19:59:43.449773
2020	25	5	2	1	9	1	11497	1	2018	2018-05-16 19:59:43.451773	2018-05-16 19:59:43.451773
2021	25	5	2	1	7	1	85835	1	2018	2018-05-16 19:59:43.453773	2018-05-16 19:59:43.453773
2022	25	5	2	2	6	1	49175	1	2018	2018-05-16 19:59:43.455773	2018-05-16 19:59:43.455773
2023	25	5	2	2	8	1	72461	1	2018	2018-05-16 19:59:43.457773	2018-05-16 19:59:43.457773
2024	25	5	2	2	5	1	93074	1	2018	2018-05-16 19:59:43.459773	2018-05-16 19:59:43.459773
2025	25	5	2	1	9	1	70419	1	2018	2018-05-16 19:59:43.461773	2018-05-16 19:59:43.461773
2026	25	5	2	2	6	1	52590	1	2018	2018-05-16 19:59:43.463773	2018-05-16 19:59:43.463773
2027	25	5	2	1	7	1	27137	1	2018	2018-05-16 19:59:43.464773	2018-05-16 19:59:43.464773
2028	25	5	2	1	4	1	21659	1	2018	2018-05-16 19:59:43.466774	2018-05-16 19:59:43.466774
2029	25	5	2	1	9	1	90591	1	2018	2018-05-16 19:59:43.468774	2018-05-16 19:59:43.468774
2030	25	5	2	2	5	1	67415	1	2018	2018-05-16 19:59:43.470774	2018-05-16 19:59:43.470774
2031	25	5	2	2	6	1	50949	1	2018	2018-05-16 19:59:43.472774	2018-05-16 19:59:43.472774
2032	25	5	2	1	6	1	29835	1	2018	2018-05-16 19:59:43.474774	2018-05-16 19:59:43.474774
2033	25	5	2	2	5	1	43467	1	2018	2018-05-16 19:59:43.475774	2018-05-16 19:59:43.475774
2034	25	5	2	1	4	1	64378	1	2018	2018-05-16 19:59:43.477774	2018-05-16 19:59:43.477774
2035	25	5	2	2	5	1	62337	1	2018	2018-05-16 19:59:43.479774	2018-05-16 19:59:43.479774
2036	25	5	2	1	7	1	91237	1	2018	2018-05-16 19:59:43.481774	2018-05-16 19:59:43.481774
2037	25	5	2	2	5	1	51805	1	2018	2018-05-16 19:59:43.483774	2018-05-16 19:59:43.483774
2038	25	5	2	2	9	1	32780	1	2018	2018-05-16 19:59:43.485775	2018-05-16 19:59:43.485775
2039	25	5	2	2	6	1	46591	1	2018	2018-05-16 19:59:43.486775	2018-05-16 19:59:43.486775
2040	25	5	2	1	4	1	58284	1	2018	2018-05-16 19:59:43.488775	2018-05-16 19:59:43.488775
2041	25	5	2	5	7	1	41981	1	2018	2018-05-16 19:59:43.491775	2018-05-16 19:59:43.491775
2042	25	5	2	6	7	1	54228	1	2018	2018-05-16 19:59:43.493775	2018-05-16 19:59:43.493775
2043	25	5	2	7	7	1	66587	1	2018	2018-05-16 19:59:43.495775	2018-05-16 19:59:43.495775
2044	25	5	2	5	8	1	44147	1	2018	2018-05-16 19:59:43.497775	2018-05-16 19:59:43.497775
2045	25	5	2	5	8	1	73368	1	2018	2018-05-16 19:59:43.499775	2018-05-16 19:59:43.499775
2046	25	5	2	5	7	1	24132	1	2018	2018-05-16 19:59:43.501776	2018-05-16 19:59:43.501776
2047	25	5	2	4	6	1	18617	1	2018	2018-05-16 19:59:43.503776	2018-05-16 19:59:43.503776
2048	25	5	2	6	9	1	51350	1	2018	2018-05-16 19:59:43.504776	2018-05-16 19:59:43.504776
2049	25	5	2	4	6	1	28340	1	2018	2018-05-16 19:59:43.506776	2018-05-16 19:59:43.506776
2050	25	5	2	6	4	1	66774	1	2018	2018-05-16 19:59:43.508776	2018-05-16 19:59:43.508776
2051	25	5	2	6	5	1	60807	1	2018	2018-05-16 19:59:43.510776	2018-05-16 19:59:43.510776
2052	25	5	2	5	8	1	20914	1	2018	2018-05-16 19:59:43.512776	2018-05-16 19:59:43.512776
2053	25	5	2	4	8	1	39385	1	2018	2018-05-16 19:59:43.515776	2018-05-16 19:59:43.515776
2054	25	5	2	5	8	1	10454	1	2018	2018-05-16 19:59:43.516776	2018-05-16 19:59:43.516776
2055	25	5	2	6	5	1	91106	1	2018	2018-05-16 19:59:43.516776	2018-05-16 19:59:43.516776
2056	25	5	2	5	5	1	76698	1	2018	2018-05-16 19:59:43.516776	2018-05-16 19:59:43.516776
2057	25	5	2	5	5	1	11913	1	2018	2018-05-16 19:59:43.516776	2018-05-16 19:59:43.516776
2058	25	5	2	4	9	1	80140	1	2018	2018-05-16 19:59:43.516776	2018-05-16 19:59:43.516776
2059	25	5	2	5	6	1	98258	1	2018	2018-05-16 19:59:43.516776	2018-05-16 19:59:43.516776
2060	25	5	2	5	7	1	79320	1	2018	2018-05-16 19:59:43.527776	2018-05-16 19:59:43.527776
2061	25	5	2	7	7	1	16461	1	2018	2018-05-16 19:59:43.529777	2018-05-16 19:59:43.529777
2062	25	5	2	5	5	1	17761	1	2018	2018-05-16 19:59:43.532777	2018-05-16 19:59:43.532777
2063	25	5	2	6	8	1	20637	1	2018	2018-05-16 19:59:43.533777	2018-05-16 19:59:43.533777
2064	25	5	2	5	6	1	15366	1	2018	2018-05-16 19:59:43.535777	2018-05-16 19:59:43.535777
2065	25	5	2	7	8	1	77865	1	2018	2018-05-16 19:59:43.537777	2018-05-16 19:59:43.537777
2066	25	5	2	6	6	1	88721	1	2018	2018-05-16 19:59:43.539777	2018-05-16 19:59:43.539777
2067	25	5	2	6	9	1	95896	1	2018	2018-05-16 19:59:43.541777	2018-05-16 19:59:43.541777
2068	25	5	2	6	8	1	97793	1	2018	2018-05-16 19:59:43.543777	2018-05-16 19:59:43.543777
2069	25	5	2	4	5	1	20536	1	2018	2018-05-16 19:59:43.545777	2018-05-16 19:59:43.545777
2070	25	5	2	4	6	1	89592	1	2018	2018-05-16 19:59:43.547778	2018-05-16 19:59:43.547778
2071	25	5	2	7	6	1	60211	1	2018	2018-05-16 19:59:43.549778	2018-05-16 19:59:43.549778
2072	25	5	2	7	5	1	75787	1	2018	2018-05-16 19:59:43.551778	2018-05-16 19:59:43.551778
2073	25	5	2	7	5	1	99779	1	2018	2018-05-16 19:59:43.553778	2018-05-16 19:59:43.553778
2074	25	5	2	7	7	1	39909	1	2018	2018-05-16 19:59:43.554778	2018-05-16 19:59:43.554778
2075	25	5	2	6	6	1	25242	1	2018	2018-05-16 19:59:43.558778	2018-05-16 19:59:43.558778
2076	25	5	2	7	9	1	60083	1	2018	2018-05-16 19:59:43.560778	2018-05-16 19:59:43.560778
2077	25	5	2	6	5	1	93261	1	2018	2018-05-16 19:59:43.561778	2018-05-16 19:59:43.561778
2078	25	5	2	4	9	1	47636	1	2018	2018-05-16 19:59:43.563778	2018-05-16 19:59:43.563778
2079	25	5	2	4	6	1	29164	1	2018	2018-05-16 19:59:43.566779	2018-05-16 19:59:43.566779
2080	25	5	2	7	5	1	35143	1	2018	2018-05-16 19:59:43.568779	2018-05-16 19:59:43.568779
\.


--
-- Name: sale_by_sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.sale_by_sellers_id_seq', 2080, true);


--
-- Data for Name: sale_plans; Type: TABLE DATA; Schema: public; Owner: coke
--

COPY public.sale_plans (id, department_id, created_at, updated_at, sale_date, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty, twenty_one, twenty_two, twenty_three, twenty_four, store_id, week, month, year, day_number) FROM stdin;
650	1	2017-10-11 14:25:44.447142	2017-10-11 14:25:44.447142	2016-01-01	0	0	0	352800	954522	1101468	1008270	947578	1838862	1408461	1633827	1639494	1210094	0	0	0	1	0	1	2016	5
651	1	2017-10-11 14:25:44.458251	2017-10-11 14:25:44.458251	2016-01-02	0	0	0	418950	305482	1027642	1010370	479266	659540	1708006	2147288	1015728	832037	0	0	0	1	0	1	2016	6
652	1	2017-10-11 14:25:44.467089	2017-10-11 14:25:44.467089	2016-01-03	0	0	0	242550	326936	355362	730816	617919	1134462	2370438	1887998	1949322	1049713	0	0	0	1	0	1	2016	0
653	1	2017-10-11 14:25:44.476398	2017-10-11 14:25:44.476398	2016-01-04	0	0	0	441000	789832	640456	461902	519535	1016150	1443308	1839366	2142517	1722540	0	0	0	1	1	1	2016	1
654	1	2017-10-11 14:25:44.486454	2017-10-11 14:25:44.486454	2016-01-05	0	0	0	330750	400109	345604	891990	967424	1688590	954444	2189125	1147592	1694131	0	0	0	1	1	1	2016	2
655	1	2017-10-11 14:25:44.496721	2017-10-11 14:25:44.496721	2016-01-06	0	0	0	793800	801212	1228067	1871898	1481266	2349122	4404312	3000490	5266898	2738614	0	0	0	1	1	1	2016	3
656	1	2017-10-11 14:25:44.506009	2017-10-11 14:25:44.506009	2016-01-07	0	0	0	493920	942992	1685024	1794751	1769684	2108194	2782775	2693404	5236978	2230583	0	0	0	1	1	1	2016	4
657	1	2017-10-11 14:25:44.514649	2017-10-11 14:25:44.514649	2016-01-08	0	0	0	330750	598349	913530	503335	648348	1344533	1348674	2888055	1171046	741416	0	0	0	1	1	1	2016	5
658	1	2017-10-11 14:25:44.523147	2017-10-11 14:25:44.523147	2016-01-09	0	0	0	198450	421124	1620774	769744	693772	1813192	1704762	1349750	2009437	961068	0	0	0	1	1	1	2016	6
659	1	2017-10-11 14:25:44.531717	2017-10-11 14:25:44.531717	2016-01-10	0	0	0	352800	336794	498013	1318554	548150	1540816	1044252	2171938	1261620	1761717	0	0	0	1	1	1	2016	0
660	1	2017-10-11 14:25:44.54019	2017-10-11 14:25:44.54019	2016-01-11	0	0	0	418950	839078	1134565	681354	576983	1486403	2173707	2285267	1349035	775946	0	0	0	1	2	1	2016	1
661	1	2017-10-11 14:25:44.548485	2017-10-11 14:25:44.548485	2016-01-12	0	0	0	330750	342279	345440	883216	957715	993626	2110799	1654616	1241248	874625	0	0	0	1	2	1	2016	2
662	1	2017-10-11 14:25:44.557028	2017-10-11 14:25:44.557028	2016-01-13	0	0	0	793800	908522	2528777	1878548	1611910	1298363	2069084	3028317	4497444	4285312	0	0	0	1	2	1	2016	3
663	1	2017-10-11 14:25:44.566192	2017-10-11 14:25:44.566192	2016-01-14	0	0	0	670320	357948	760040	2183146	1106523	1189205	2130479	2149313	3183978	3278372	0	0	0	1	2	1	2016	4
664	1	2017-10-11 14:25:44.575254	2017-10-11 14:25:44.575254	2016-01-15	0	0	0	396900	668030	561407	736123	606801	975569	1801418	2753158	2115665	935666	0	0	0	1	2	1	2016	5
665	1	2017-10-11 14:25:44.583518	2017-10-11 14:25:44.583518	2016-01-16	0	0	0	441000	772380	629364	875340	877794	877973	2574035	1341774	761987	1324580	0	0	0	1	2	1	2016	6
666	1	2017-10-11 14:25:44.592698	2017-10-11 14:25:44.592698	2016-01-17	0	0	0	220500	731010	1428257	1481368	545501	1289541	2919926	1588766	1793450	1634112	0	0	0	1	2	1	2016	0
667	1	2017-10-11 14:25:44.600844	2017-10-11 14:25:44.600844	2016-01-18	0	0	0	374850	578900	628446	888520	988185	793217	1900667	2948613	2588995	540150	0	0	0	1	3	1	2016	1
668	1	2017-10-11 14:25:44.60947	2017-10-11 14:25:44.60947	2016-01-19	0	0	0	242550	955904	711040	556646	964672	705141	1176993	2617931	1044117	1436843	0	0	0	1	3	1	2016	2
669	1	2017-10-11 14:25:44.619064	2017-10-11 14:25:44.619064	2016-01-20	0	0	0	529200	1129990	1696872	1414794	2515099	3599812	3684374	2954239	2586266	2122793	0	0	0	1	3	1	2016	3
670	1	2017-10-11 14:25:44.628137	2017-10-11 14:25:44.628137	2016-01-21	0	0	0	388080	888959	599308	883137	2206611	1341716	4411278	4168559	3310284	2145966	0	0	0	1	3	1	2016	4
671	1	2017-10-11 14:25:44.636045	2017-10-11 14:25:44.636045	2016-01-22	0	0	0	330750	805113	632918	952579	752309	876970	1269752	1433686	2003805	1335199	0	0	0	1	3	1	2016	5
672	1	2017-10-11 14:25:44.643872	2017-10-11 14:25:44.643872	2016-01-23	0	0	0	396900	821392	870471	377816	1225688	1313995	2512913	3434011	1431244	1269164	0	0	0	1	3	1	2016	6
673	1	2017-10-11 14:25:44.65161	2017-10-11 14:25:44.65161	2016-01-24	0	0	0	396900	597073	778646	976604	878211	770500	1180120	928653	2468142	1337946	0	0	0	1	3	1	2016	0
674	1	2017-10-11 14:25:44.659947	2017-10-11 14:25:44.659947	2016-01-25	0	0	0	352800	918191	504390	981155	880128	1260983	1313646	2046994	1673862	1949922	0	0	0	1	4	1	2016	1
675	1	2017-10-11 14:25:44.668711	2017-10-11 14:25:44.668711	2016-01-26	0	0	0	242550	1048394	794302	779605	715515	1391055	2609585	2986123	2804340	760086	0	0	0	1	4	1	2016	2
676	1	2017-10-11 14:25:44.677341	2017-10-11 14:25:44.677341	2016-01-27	0	0	0	529200	1313320	1406406	2508407	1584250	1607988	3736415	6137557	7318808	1451882	0	0	0	1	4	1	2016	3
677	1	2017-10-11 14:25:44.685741	2017-10-11 14:25:44.685741	2016-01-28	0	0	0	670320	761485	1378630	1188103	1011296	2111671	4621805	4121222	3346950	1779788	0	0	0	1	4	1	2016	4
678	1	2017-10-11 14:25:44.694925	2017-10-11 14:25:44.694925	2016-01-29	0	0	0	661500	1035954	833952	1133142	1117391	1676720	1790246	4605094	3053662	2173538	0	0	0	1	4	1	2016	5
679	1	2017-10-11 14:25:44.703814	2017-10-11 14:25:44.703814	2016-01-30	0	0	0	529200	876727	2490970	1253327	1004592	1026691	2099042	3224180	3565908	1993568	0	0	0	1	4	1	2016	6
680	1	2017-10-11 14:25:44.712749	2017-10-11 14:25:44.712749	2016-01-31	0	0	0	628425	454399	1125431	1042663	995485	1125123	1884940	2028324	2221986	1216853	0	0	0	1	4	1	2016	0
681	1	2017-10-11 14:25:44.722037	2017-10-11 14:25:44.722037	2016-02-01	0	0	0	396900	1077918	865461	868752	1768320	1080789	2108471	3633883	2640166	770816	0	0	0	1	5	2	2016	1
682	1	2017-10-11 14:25:44.73114	2017-10-11 14:25:44.73114	2016-02-02	0	0	0	429975	917730	827220	2021687	928910	2041075	3720508	3776400	2735050	1324681	0	0	0	1	5	2	2016	2
683	1	2017-10-11 14:25:44.740057	2017-10-11 14:25:44.740057	2016-02-03	0	0	0	463050	618057	1319303	934693	1837208	2357635	2020912	5021491	3165052	1146205	0	0	0	1	5	2	2016	3
684	1	2017-10-11 14:25:44.748459	2017-10-11 14:25:44.748459	2016-02-04	0	0	0	529200	1259774	1177434	1893832	1115134	2583443	5175334	3411468	3293647	1657991	0	0	0	1	5	2	2016	4
685	1	2017-10-11 14:25:44.756717	2017-10-11 14:25:44.756717	2016-02-05	0	0	0	1124550	896327	1463167	3239244	2973284	2154322	8013674	9322710	3390551	3035366	0	0	0	1	5	2	2016	5
686	1	2017-10-11 14:25:44.765644	2017-10-11 14:25:44.765644	2016-02-06	0	0	0	582120	1770925	2298422	3084231	2600816	2995492	2737497	8712110	4691127	4729015	0	0	0	1	5	2	2016	6
687	1	2017-10-11 14:25:44.774686	2017-10-11 14:25:44.774686	2016-02-07	0	0	0	330750	837914	481205	752393	1562099	1813954	3563285	4866147	3730938	2435841	0	0	0	1	5	2	2016	0
688	1	2017-10-11 14:25:44.783695	2017-10-11 14:25:44.783695	2016-02-08	0	0	0	562275	772648	945095	1179654	1204140	2404433	1872599	5006082	2174711	1592501	0	0	0	1	6	2	2016	1
689	1	2017-10-11 14:25:44.792363	2017-10-11 14:25:44.792363	2016-02-09	0	0	0	595350	1763548	1088376	1928920	873269	1299132	2344609	2351754	1877905	2024950	0	0	0	1	6	2	2016	2
690	1	2017-10-11 14:25:44.80066	2017-10-11 14:25:44.80066	2016-02-10	0	0	0	330750	620757	626105	1381538	1668593	1901271	1836950	4531629	2194102	1154235	0	0	0	1	6	2	2016	3
691	1	2017-10-11 14:25:44.809352	2017-10-11 14:25:44.809352	2016-02-11	0	0	0	529200	983164	1464042	1356754	1771326	2296446	4744129	2840188	2406802	2009395	0	0	0	1	6	2	2016	4
692	1	2017-10-11 14:25:44.818209	2017-10-11 14:25:44.818209	2016-02-12	0	0	0	727650	1332983	5133006	2813723	1171686	4261474	7868749	7950520	4649363	6116168	0	0	0	1	6	2	2016	5
693	1	2017-10-11 14:25:44.826778	2017-10-11 14:25:44.826778	2016-02-13	0	0	0	635040	2853145	2021375	1499553	2689674	2019520	4608668	6107741	7254424	2072782	0	0	0	1	6	2	2016	6
694	1	2017-10-11 14:25:44.835558	2017-10-11 14:25:44.835558	2016-02-14	0	0	0	463050	674176	1535894	1570258	1044067	1590750	1947530	1605726	2108278	1691412	0	0	0	1	6	2	2016	0
695	1	2017-10-11 14:25:44.844033	2017-10-11 14:25:44.844033	2016-02-15	0	0	0	429975	1421226	1291229	993840	1284853	1596154	3194212	1775864	3615786	1648538	0	0	0	1	7	2	2016	1
696	1	2017-10-11 14:25:44.852519	2017-10-11 14:25:44.852519	2016-02-16	0	0	0	595350	832067	853318	1327694	1224120	1799533	1927861	2154550	1808681	2249850	0	0	0	1	7	2	2016	2
697	1	2017-10-11 14:25:44.861499	2017-10-11 14:25:44.861499	2016-02-17	0	0	0	429975	993991	1274042	1187771	579617	2186400	1625666	3123490	2305574	1095066	0	0	0	1	7	2	2016	3
698	1	2017-10-11 14:25:44.870908	2017-10-11 14:25:44.870908	2016-02-18	0	0	0	529200	643239	1565411	1023880	1438219	2156217	3473642	3805358	4504760	1888296	0	0	0	1	7	2	2016	4
699	1	2017-10-11 14:25:44.892315	2017-10-11 14:25:44.892315	2016-02-19	0	0	0	926100	2754133	1255102	2938919	2780698	2968803	8717897	8936040	5906818	4245685	0	0	0	1	7	2	2016	5
700	1	2017-10-11 14:25:44.900822	2017-10-11 14:25:44.900822	2016-02-20	0	0	0	582120	1041215	1448807	2930471	3179628	4558894	3242985	7633624	12340840	2055197	0	0	0	1	7	2	2016	6
701	1	2017-10-11 14:25:44.909418	2017-10-11 14:25:44.909418	2016-02-21	0	0	0	363825	579876	1329395	1639963	1160871	2244168	3030889	2955953	3033283	1329476	0	0	0	1	7	2	2016	0
702	1	2017-10-11 14:25:44.917645	2017-10-11 14:25:44.917645	2016-02-22	0	0	0	628425	1153352	924478	1742673	1551695	2664126	3250707	3488597	2144851	1499866	0	0	0	1	8	2	2016	1
703	1	2017-10-11 14:25:44.925503	2017-10-11 14:25:44.925503	2016-02-23	0	0	0	529200	991001	1990654	1654824	897606	1241422	2815090	3294812	1459708	2133970	0	0	0	1	8	2	2016	2
704	1	2017-10-11 14:25:44.933366	2017-10-11 14:25:44.933366	2016-02-24	0	0	0	463050	417902	1511282	958556	1613181	1200476	1801574	2076624	2085883	1557115	0	0	0	1	8	2	2016	3
705	1	2017-10-11 14:25:44.941154	2017-10-11 14:25:44.941154	2016-02-25	0	0	0	396900	1401211	1807789	881954	956225	1632672	2905713	4024599	2600280	1432946	0	0	0	1	8	2	2016	4
706	1	2017-10-11 14:25:44.949271	2017-10-11 14:25:44.949271	2016-02-26	0	0	0	595350	1356788	3429395	2753465	1721826	3343456	5087910	3937521	5568169	5322409	0	0	0	1	8	2	2016	5
707	1	2017-10-11 14:25:44.95812	2017-10-11 14:25:44.95812	2016-02-27	0	0	0	529200	689666	1412691	3101463	2532915	4609102	4152595	5870301	9515747	2599284	0	0	0	1	8	2	2016	6
708	1	2017-10-11 14:25:44.968933	2017-10-11 14:25:44.968933	2016-02-28	0	0	0	661500	1297993	1037751	1365406	807409	1628605	1703689	2875747	1629468	2436884	0	0	0	1	8	2	2016	0
709	1	2017-10-11 14:25:44.978602	2017-10-11 14:25:44.978602	2016-02-29	0	0	0	562275	653613	1199773	1209457	853962	2228287	2809019	2041924	3303364	2215179	0	0	0	1	9	2	2016	1
710	1	2017-10-11 14:25:44.987244	2017-10-11 14:25:44.987244	2016-03-01	0	0	0	297675	694842	724614	1356683	827973	896174	2002813	2281176	1530463	1628084	0	0	0	1	9	3	2016	2
711	1	2017-10-11 14:25:44.995385	2017-10-11 14:25:44.995385	2016-03-02	0	536363	722678	924803	3505038	1573202	1513541	698808	1197058	2017477	1323603	0	0	0	0	0	1	9	3	2016	3
712	1	2017-10-11 14:25:45.003852	2017-10-11 14:25:45.003852	2016-03-03	0	395215	677511	1351635	1478023	3767444	1508167	435941	1760440	1738391	1025120	0	0	0	0	0	1	9	3	2016	4
713	1	2017-10-11 14:25:45.013316	2017-10-11 14:25:45.013316	2016-03-04	0	451674	406507	1351635	1626396	3814989	1035607	855979	1411430	1416692	1330250	0	0	0	0	0	1	9	3	2016	5
714	1	2017-10-11 14:25:45.023005	2017-10-11 14:25:45.023005	2016-03-05	0	282296	813013	1280497	914575	3035731	1146325	1001400	1553290	1464762	1014413	0	0	0	0	0	1	9	3	2016	6
715	1	2017-10-11 14:25:45.032238	2017-10-11 14:25:45.032238	2016-03-06	0	127033	316172	569109	1220663	1571788	368438	533795	780999	943878	265775	0	0	0	0	0	1	9	3	2016	0
716	1	2017-10-11 14:25:45.040873	2017-10-11 14:25:45.040873	2016-03-07	0	282296	361339	426832	628929	1941546	476551	464878	861982	804923	542933	0	0	0	0	0	1	10	3	2016	1
717	1	2017-10-11 14:25:45.04918	2017-10-11 14:25:45.04918	2016-03-08	0	536363	542009	782526	2141520	4390106	848763	1109498	961117	1738289	1223940	0	0	0	0	0	1	10	3	2016	2
718	1	2017-10-11 14:25:45.057835	2017-10-11 14:25:45.057835	2016-03-09	0	282296	767846	782526	2852597	3113987	1419904	600001	1308814	2246003	1196547	0	0	0	0	0	1	10	3	2016	3
719	1	2017-10-11 14:25:45.067071	2017-10-11 14:25:45.067071	2016-03-10	0	508133	677511	995942	3329656	2106894	1128924	382406	1602453	1643588	1361562	0	0	0	0	0	1	10	3	2016	4
720	1	2017-10-11 14:25:45.075596	2017-10-11 14:25:45.075596	2016-03-11	0	423444	767846	711387	1458499	3239776	890041	1113515	1206097	2306057	724947	0	0	0	0	0	1	10	3	2016	5
721	1	2017-10-11 14:25:45.084189	2017-10-11 14:25:45.084189	2016-03-12	0	395215	451674	1351635	3109563	4095146	670374	1405645	1179556	1560780	749982	0	0	0	0	0	1	10	3	2016	6
722	1	2017-10-11 14:25:45.093297	2017-10-11 14:25:45.093297	2016-03-13	0	239952	361339	711386	1955520	847107	930776	306443	736304	906570	576007	0	0	0	0	0	1	10	3	2016	0
723	1	2017-10-11 14:25:45.101837	2017-10-11 14:25:45.101837	2016-03-14	0	155263	203253	320124	972806	1182150	347746	612699	483382	625468	356716	0	0	0	0	0	1	11	3	2016	1
724	1	2017-10-11 14:25:45.110597	2017-10-11 14:25:45.110597	2016-03-15	0	564593	722678	1209358	2466354	1603883	1618112	533904	1390570	2319358	858658	0	0	0	0	0	1	11	3	2016	2
725	1	2017-10-11 14:25:45.118626	2017-10-11 14:25:45.118626	2016-03-16	0	479904	406507	853664	1891485	1965648	1404534	681835	907107	960898	793782	0	0	0	0	0	1	11	3	2016	3
726	1	2017-10-11 14:25:45.126528	2017-10-11 14:25:45.126528	2016-03-17	0	479904	858181	995942	1307732	3484006	1554021	1008982	1537725	1609824	1313630	0	0	0	0	0	1	11	3	2016	4
727	1	2017-10-11 14:25:45.134371	2017-10-11 14:25:45.134371	2016-03-18	0	395215	813013	1138219	748122	1744448	1002916	1246026	2177012	1818553	1411099	0	0	0	0	0	1	11	3	2016	5
728	1	2017-10-11 14:25:45.14236	2017-10-11 14:25:45.14236	2016-03-19	0	536363	587176	924803	3610658	1798387	1732600	738616	757328	2088554	806732	0	0	0	0	0	1	11	3	2016	6
729	1	2017-10-11 14:25:45.150551	2017-10-11 14:25:45.150551	2016-03-20	0	239952	225837	426832	1434855	1560461	382868	226600	335820	665863	330220	0	0	0	0	0	1	11	3	2016	0
730	1	2017-10-11 14:25:45.158898	2017-10-11 14:25:45.158898	2016-03-21	0	141148	406507	355693	1861400	886309	1025736	646929	795194	608017	280324	0	0	0	0	0	1	12	3	2016	1
731	1	2017-10-11 14:25:45.166995	2017-10-11 14:25:45.166995	2016-03-22	0	338756	722678	995942	2502725	3954233	1436480	581909	806924	868131	747134	0	0	0	0	0	1	12	3	2016	2
732	1	2017-10-11 14:25:45.175534	2017-10-11 14:25:45.175534	2016-03-23	0	395215	677511	1138219	1110424	1783964	1339586	596241	779439	882078	615739	0	0	0	0	0	1	12	3	2016	3
733	1	2017-10-11 14:25:45.183824	2017-10-11 14:25:45.183824	2016-03-24	0	564593	632344	1351635	1661157	3185070	1119051	1108012	2047014	1785134	630138	0	0	0	0	0	1	12	3	2016	4
734	1	2017-10-11 14:25:45.192046	2017-10-11 14:25:45.192046	2016-03-25	0	338756	542009	995942	3846520	2153564	1116282	887213	1180691	1933286	1407266	0	0	0	0	0	1	12	3	2016	5
735	1	2017-10-11 14:25:45.200262	2017-10-11 14:25:45.200262	2016-03-26	0	366985	722678	782526	1630224	3373047	893051	1014408	839930	2429484	1341012	0	0	0	0	0	1	12	3	2016	6
736	1	2017-10-11 14:25:45.208914	2017-10-11 14:25:45.208914	2016-03-27	0	268181	383923	320124	1784408	1058302	867653	707498	396246	504200	380096	0	0	0	0	0	1	12	3	2016	0
737	1	2017-10-11 14:25:45.217265	2017-10-11 14:25:45.217265	2016-03-28	0	169378	383923	355693	869066	1289866	772975	460164	297888	423198	375200	0	0	0	0	0	1	13	3	2016	1
738	1	2017-10-11 14:25:45.225425	2017-10-11 14:25:45.225425	2016-03-29	0	508133	858181	853664	3165946	1704761	888110	1350097	1775852	1141105	779930	0	0	0	0	0	1	13	3	2016	2
739	1	2017-10-11 14:25:45.233727	2017-10-11 14:25:45.233727	2016-03-30	0	536363	451674	995942	1120683	3084131	633423	933806	828866	1489753	760442	0	0	0	0	0	1	13	3	2016	3
740	1	2017-10-11 14:25:45.24224	2017-10-11 14:25:45.24224	2016-03-31	0	508133	451674	640248	2117623	2046029	1254070	1049198	783768	1952262	530389	0	0	0	0	0	1	13	3	2016	4
741	1	2017-10-11 14:25:45.250452	2017-10-11 14:25:45.250452	2016-04-01	0	381100	813013	1067080	2358075	5548500	1078685	702430	1714006	2824407	1441649	0	0	0	0	0	1	13	4	2016	5
742	1	2017-10-11 14:25:45.260471	2017-10-11 14:25:45.260471	2016-04-02	0	381100	1287271	1387204	1343140	7037456	1398049	1001983	995333	2296978	2255681	0	0	0	0	0	1	13	4	2016	6
743	1	2017-10-11 14:25:45.269251	2017-10-11 14:25:45.269251	2016-04-03	0	508133	1355022	2027452	2202226	3582562	2801029	1590297	1586151	2926118	1613166	0	0	0	0	0	1	13	4	2016	0
744	1	2017-10-11 14:25:45.277501	2017-10-11 14:25:45.277501	2016-04-04	0	592822	1287271	1173788	1260959	4437214	1350390	1830670	2427550	1619694	2198795	0	0	0	0	0	1	14	4	2016	1
745	1	2017-10-11 14:25:45.28597	2017-10-11 14:25:45.28597	2016-04-05	0	381100	643635	640248	1813620	3059202	1054519	928320	1705708	766532	487664	0	0	0	0	0	1	14	4	2016	2
746	1	2017-10-11 14:25:45.293862	2017-10-11 14:25:45.293862	2016-04-06	0	338756	372631	480186	2678721	1253920	756491	675818	910217	806798	290939	0	0	0	0	0	1	14	4	2016	3
747	1	2017-10-11 14:25:45.30193	2017-10-11 14:25:45.30193	2016-04-07	0	423444	609760	1814036	1374286	3882264	1728871	1601762	1386477	2297400	2517582	0	0	0	0	0	1	14	4	2016	4
748	1	2017-10-11 14:25:45.310828	2017-10-11 14:25:45.310828	2016-04-08	0	508133	677511	1814036	2771852	3134273	908817	1312320	2538550	2296616	2126256	0	0	0	0	0	1	14	4	2016	5
749	1	2017-10-11 14:25:45.319838	2017-10-11 14:25:45.319838	2016-04-09	0	762200	813013	1600620	6338360	6621350	1291722	1125645	1757668	2568255	1440686	0	0	0	0	0	1	14	4	2016	6
750	1	2017-10-11 14:25:45.328609	2017-10-11 14:25:45.328609	2016-04-10	0	550478	1084018	1493912	1696487	3824333	1486147	1555426	2357788	1494617	1569836	0	0	0	0	0	1	14	4	2016	0
751	1	2017-10-11 14:25:45.336791	2017-10-11 14:25:45.336791	2016-04-11	0	719855	745262	1067080	4330391	2736950	1477755	631460	2200172	1466686	1060072	0	0	0	0	0	1	15	4	2016	1
752	1	2017-10-11 14:25:45.345089	2017-10-11 14:25:45.345089	2016-04-12	0	211722	440382	800310	1352481	2235614	781208	835416	1414675	770139	940218	0	0	0	0	0	1	15	4	2016	2
753	1	2017-10-11 14:25:45.353087	2017-10-11 14:25:45.353087	2016-04-13	0	317583	338756	640248	816156	994404	1368437	771779	1169845	1064434	424931	0	0	0	0	0	1	15	4	2016	3
754	1	2017-10-11 14:25:45.361109	2017-10-11 14:25:45.361109	2016-04-14	0	846889	609760	1600620	1529194	7350991	1441796	1102011	1624230	2919276	1559022	0	0	0	0	0	1	15	4	2016	4
1016	5	2017-10-12 19:10:15.197663	2017-10-12 19:10:15.197663	2016-01-01	0	0	0	396900	668165	605807	948960	498725	919431	1220666	980296	2017838	907571	0	0	0	1	53	1	2016	5
1017	5	2017-10-12 19:10:15.210362	2017-10-12 19:10:15.210362	2016-01-02	0	0	0	374850	441251	1185741	1199814	905281	1392362	1110204	3220933	1523592	665629	0	0	0	1	53	1	2016	6
1018	5	2017-10-12 19:10:15.219272	2017-10-12 19:10:15.219272	2016-01-03	0	0	0	308700	299692	552786	1315469	427790	1134462	2370438	1665881	1949322	1049713	0	0	0	1	53	1	2016	0
1019	5	2017-10-12 19:10:15.228174	2017-10-12 19:10:15.228174	2016-01-04	0	0	0	286650	750340	640456	877614	822597	1439546	2742285	2055762	3060738	1925192	0	0	0	1	1	1	2016	1
1020	5	2017-10-12 19:10:15.236784	2017-10-12 19:10:15.236784	2016-01-05	0	0	0	330750	711304	596952	577170	1074916	1390603	1908888	2052305	1765526	1411776	0	0	0	1	1	1	2016	2
1021	5	2017-10-12 19:10:15.24522	2017-10-12 19:10:15.24522	2016-01-06	0	0	0	441000	743982	1228067	1052942	1025492	2740643	4991554	3000490	4915771	1825742	0	0	0	1	1	1	2016	3
1022	5	2017-10-12 19:10:15.253634	2017-10-12 19:10:15.253634	2016-01-07	0	0	0	352800	1457351	1369082	1372457	1769684	1581146	3339329	5386808	5236978	1887416	0	0	0	1	1	1	2016	4
1023	5	2017-10-12 19:10:15.262077	2017-10-12 19:10:15.262077	2016-01-08	0	0	0	396900	726566	1370295	615187	766229	1613439	1471280	3465666	1990778	741416	0	0	0	1	1	1	2016	5
1024	5	2017-10-12 19:10:15.270312	2017-10-12 19:10:15.270312	2016-01-09	0	0	0	198450	727396	938343	692770	367291	2014658	2699207	1799666	2009437	823772	0	0	0	1	1	1	2016	6
1025	5	2017-10-12 19:10:15.278446	2017-10-12 19:10:15.278446	2016-01-10	0	0	0	198450	449058	622517	1318554	913584	693367	1234116	1327295	1261620	1968978	0	0	0	1	1	1	2016	0
1026	5	2017-10-12 19:10:15.287077	2017-10-12 19:10:15.287077	2016-01-11	0	0	0	374850	755170	1276385	499660	665750	1783683	2429437	3515796	1110970	775946	0	0	0	1	2	1	2016	1
1027	5	2017-10-12 19:10:15.295711	2017-10-12 19:10:15.295711	2016-01-12	0	0	0	396900	444963	575733	1472026	845043	1135573	1876266	992769	1623170	962088	0	0	0	1	2	1	2016	2
1028	5	2017-10-12 19:10:15.304316	2017-10-12 19:10:15.304316	2016-01-13	0	0	0	705600	851739	2975032	2167556	1511166	2207217	3218575	3028317	5247018	2142656	0	0	0	1	2	1	2016	3
1029	5	2017-10-12 19:10:15.312459	2017-10-12 19:10:15.312459	2016-01-14	0	0	0	458640	715896	760040	1149024	1408302	1783808	4047910	3044860	5789050	2415643	0	0	0	1	2	1	2016	4
1030	5	2017-10-12 19:10:15.320251	2017-10-12 19:10:15.320251	2016-01-15	0	0	0	352800	534424	954392	503663	809068	975569	1125886	2202526	2489018	1223563	0	0	0	1	2	1	2016	5
1031	5	2017-10-12 19:10:15.328157	2017-10-12 19:10:15.328157	2016-01-16	0	0	0	441000	447168	681811	437670	819274	585315	1219280	1032134	1439308	917017	0	0	0	1	2	1	2016	6
1032	5	2017-10-12 19:10:15.336172	2017-10-12 19:10:15.336172	2016-01-17	0	0	0	242550	731010	1031519	666616	581867	859694	2043948	1833192	2032576	1720118	0	0	0	1	2	1	2016	0
1033	5	2017-10-12 19:10:15.344818	2017-10-12 19:10:15.344818	2016-01-18	0	0	0	396900	643222	282801	987244	856427	732200	1520533	2081374	2588995	1080300	0	0	0	1	3	1	2016	1
1034	5	2017-10-12 19:10:15.352998	2017-10-12 19:10:15.352998	2016-01-19	0	0	0	220500	743481	660252	1113293	737690	1410282	1412392	2908812	1328876	1516667	0	0	0	1	3	1	2016	2
1035	5	2017-10-12 19:10:15.361292	2017-10-12 19:10:15.361292	2016-01-20	0	0	0	485100	1694985	1470622	1509114	1537005	1705174	2133058	3938986	3448355	3280680	0	0	0	1	3	1	2016	3
1036	5	2017-10-12 19:10:15.369898	2017-10-12 19:10:15.369898	2016-01-21	0	0	0	564480	1126014	871720	1123993	1393649	1585665	3234937	2315866	5717763	2861288	0	0	0	1	3	1	2016	4
1037	5	2017-10-12 19:10:15.378383	2017-10-12 19:10:15.378383	2016-01-22	0	0	0	330750	715656	506334	1392231	1003078	1435041	1846912	1433686	2538153	1746029	0	0	0	1	3	1	2016	5
1038	5	2017-10-12 19:10:15.387376	2017-10-12 19:10:15.387376	2016-01-23	0	0	0	242550	513370	870471	377816	612844	1313995	1983879	2349586	1533476	1335962	0	0	0	1	3	1	2016	6
1039	5	2017-10-12 19:10:15.395901	2017-10-12 19:10:15.395901	2016-01-24	0	0	0	330750	759912	1232857	716176	526927	1463950	1770180	1031837	2903696	1815784	0	0	0	1	3	1	2016	0
1040	5	2017-10-12 19:10:15.404546	2017-10-12 19:10:15.404546	2016-01-25	0	0	0	374850	673340	550243	519435	645427	1331037	2773253	2167405	1394885	1754930	0	0	0	1	4	1	2016	1
1041	5	2017-10-12 19:10:15.412557	2017-10-12 19:10:15.412557	2016-01-26	0	0	0	286650	576617	794302	438528	451904	1092972	1510813	1493061	2664123	1140129	0	0	0	1	4	1	2016	2
1042	5	2017-10-12 19:10:15.420575	2017-10-12 19:10:15.420575	2016-01-27	0	0	0	705600	1382442	1031364	1716278	1056167	2143984	2740037	6819508	3466804	2243818	0	0	0	1	4	1	2016	3
1043	5	2017-10-12 19:10:15.428593	2017-10-12 19:10:15.428593	2016-01-28	0	0	0	705600	634571	2297717	1320114	1011296	2923852	3389323	2678794	3346950	1898440	0	0	0	1	4	1	2016	4
1044	5	2017-10-12 19:10:15.43691	2017-10-12 19:10:15.43691	2016-01-29	0	0	0	529200	828763	1061393	733209	893912	1564938	2784827	4892913	2671955	1304123	0	0	0	1	4	1	2016	5
1045	5	2017-10-12 19:10:15.444718	2017-10-12 19:10:15.444718	2016-01-30	0	0	0	463050	1011608	1120937	1327052	753444	1482998	2398906	1696937	3565908	1107538	0	0	0	1	4	1	2016	6
1046	5	2017-10-12 19:10:15.453191	2017-10-12 19:10:15.453191	2016-01-31	0	0	0	396900	702253	993027	893711	1148637	1644410	1594949	3211513	2221986	1521066	0	0	0	1	4	1	2016	0
1047	5	2017-10-12 19:10:15.461696	2017-10-12 19:10:15.461696	2016-02-01	0	0	0	463050	970126	980856	1563754	1375360	1473803	4006095	3633883	2030897	1284693	0	0	0	1	5	2	2016	1
1048	5	2017-10-12 19:10:15.470369	2017-10-12 19:10:15.470369	2016-02-02	0	0	0	363825	1162458	729900	1808878	928910	1530806	1762346	4484475	2431155	1230061	0	0	0	1	5	2	2016	2
1049	5	2017-10-12 19:10:15.478684	2017-10-12 19:10:15.478684	2016-02-03	0	0	0	562275	1373460	1465892	584183	1469766	1702736	3368186	3905604	3516724	1948549	0	0	0	1	5	2	2016	3
1050	5	2017-10-12 19:10:15.487158	2017-10-12 19:10:15.487158	2016-02-04	0	0	0	628425	1550491	1177434	1893832	805375	1631648	4399034	2729174	2117345	1934323	0	0	0	1	5	2	2016	4
1051	5	2017-10-12 19:10:15.495186	2017-10-12 19:10:15.495186	2016-02-05	0	0	0	1124550	1034223	1707028	3239244	4247548	4308644	8013674	7129131	5085827	3604498	0	0	0	1	5	2	2016	5
1052	5	2017-10-12 19:10:15.507648	2017-10-12 19:10:15.507648	2016-02-06	0	0	0	1005480	1438876	2704026	2056154	2600816	2845717	4866661	7795046	6098465	4977910	0	0	0	1	5	2	2016	6
1053	5	2017-10-12 19:10:15.518746	2017-10-12 19:10:15.518746	2016-02-07	0	0	0	661500	907741	481205	520888	1648883	1723256	3144075	3585582	3171297	2300517	0	0	0	1	5	2	2016	0
1054	5	2017-10-12 19:10:15.53137	2017-10-12 19:10:15.53137	2016-02-08	0	0	0	496125	849913	630064	589827	760510	1898237	1728553	2753345	2609653	2450002	0	0	0	1	6	2	2016	1
1055	5	2017-10-12 19:10:15.540564	2017-10-12 19:10:15.540564	2016-02-09	0	0	0	628425	1058129	1088376	1928920	931486	2598264	2068773	2351754	1444542	1869185	0	0	0	1	6	2	2016	2
1056	5	2017-10-12 19:10:15.554296	2017-10-12 19:10:15.554296	2016-02-10	0	0	0	297675	448325	910698	1554230	1297794	1901271	3673900	4531629	1856548	1731353	0	0	0	1	6	2	2016	3
1057	5	2017-10-12 19:10:15.56522	2017-10-12 19:10:15.56522	2016-02-11	0	0	0	363825	1156664	775081	1356754	1678099	2296446	2635627	2403236	3332495	1865867	0	0	0	1	6	2	2016	4
1058	5	2017-10-12 19:10:15.574211	2017-10-12 19:10:15.574211	2016-02-12	0	0	0	1124550	2266071	4592689	3564049	1301873	2769958	4917968	4184484	6974044	5036844	0	0	0	1	6	2	2016	5
1059	5	2017-10-12 19:10:15.583257	2017-10-12 19:10:15.583257	2016-02-13	0	0	0	899640	2853145	2526719	1799464	3586232	2485563	4279478	8926698	9672565	3316451	0	0	0	1	6	2	2016	6
1060	5	2017-10-12 19:10:15.592894	2017-10-12 19:10:15.592894	2016-02-14	0	0	0	496125	914953	970038	1373975	1252880	1511213	1593434	3050879	2240046	1691412	0	0	0	1	6	2	2016	0
1061	5	2017-10-12 19:10:15.603372	2017-10-12 19:10:15.603372	2016-02-15	0	0	0	396900	1136981	1119065	745380	927949	2321678	1952018	3551728	3235177	1177527	0	0	0	1	7	2	2016	1
1062	5	2017-10-12 19:10:15.615037	2017-10-12 19:10:15.615037	2016-02-16	0	0	0	562275	437930	1706636	1327694	795678	2185148	1587650	3077928	2612539	2249850	0	0	0	1	7	2	2016	2
1063	5	2017-10-12 19:10:15.627142	2017-10-12 19:10:15.627142	2016-02-17	0	0	0	595350	993991	1443914	1484714	1159234	1035663	1625666	2429381	3227804	2080625	0	0	0	1	7	2	2016	3
1064	5	2017-10-12 19:10:15.638311	2017-10-12 19:10:15.638311	2016-02-18	0	0	0	330750	544279	1271897	866360	1849138	2874956	3721760	2014601	3378570	1699466	0	0	0	1	7	2	2016	4
1065	5	2017-10-12 19:10:15.648418	2017-10-12 19:10:15.648418	2016-02-19	0	0	0	1190700	2448118	1506122	1728776	2487993	5277872	7800224	10512988	6645170	3980330	0	0	0	1	7	2	2016	5
1066	5	2017-10-12 19:10:15.662267	2017-10-12 19:10:15.662267	2016-02-20	0	0	0	476280	1619668	1609786	2149012	1748795	2051502	3937911	4293914	11106756	3082796	0	0	0	1	7	2	2016	6
1067	5	2017-10-12 19:10:15.675032	2017-10-12 19:10:15.675032	2016-02-21	0	0	0	595350	579876	997046	1742461	773914	1496112	3030889	1806416	2464543	1772634	0	0	0	1	7	2	2016	0
1068	5	2017-10-12 19:10:15.687279	2017-10-12 19:10:15.687279	2016-02-22	0	0	0	429975	922681	924478	2050204	1186591	1864888	2600566	3488597	2639816	1058729	0	0	0	1	8	2	2016	1
1069	5	2017-10-12 19:10:15.697979	2017-10-12 19:10:15.697979	2016-02-23	0	0	0	396900	1351365	1393458	1241118	987367	1862133	2598545	3059468	1581350	1600478	0	0	0	1	8	2	2016	2
1070	5	2017-10-12 19:10:15.708948	2017-10-12 19:10:15.708948	2016-02-24	0	0	0	429975	696503	1679202	1474702	1109062	943231	1321154	2491949	2085883	2465432	0	0	0	1	8	2	2016	3
1071	5	2017-10-12 19:10:15.718088	2017-10-12 19:10:15.718088	2016-02-25	0	0	0	297675	1226060	1104760	529172	1092829	2122474	1880167	2118210	4680504	1289651	0	0	0	1	8	2	2016	4
1072	5	2017-10-12 19:10:15.728085	2017-10-12 19:10:15.728085	2016-02-26	0	0	0	1058400	2220199	2824207	2202772	2582739	4059911	5935895	5687530	5568169	2817746	0	0	0	1	8	2	2016	5
1073	5	2017-10-12 19:10:15.738741	2017-10-12 19:10:15.738741	2016-02-27	0	0	0	1058400	1034499	882932	2239946	1866358	3584857	4844694	5418739	7401136	3465712	0	0	0	1	8	2	2016	6
1074	5	2017-10-12 19:10:15.750389	2017-10-12 19:10:15.750389	2016-02-28	0	0	0	297675	1024731	1867952	853379	1435394	1163289	2460884	2118971	1222101	1949507	0	0	0	1	8	2	2016	0
1075	5	2017-10-12 19:10:15.760718	2017-10-12 19:10:15.760718	2016-02-29	0	0	0	396900	452501	2279569	1411033	1097951	1237937	3745358	2268804	3109048	1107590	0	0	0	1	9	2	2016	1
1076	5	2017-10-12 19:10:15.770023	2017-10-12 19:10:15.770023	2016-03-01	0	0	0	463050	694842	664230	969059	1064536	1891923	1540625	2695935	1530463	1976959	0	0	0	1	9	3	2016	2
1077	5	2017-10-12 19:10:15.779741	2017-10-12 19:10:15.779741	2016-03-02	0	508133	542009	853664	2103023	1348459	1513541	436755	673345	1698928	955936	0	0	0	0	0	1	9	3	2016	3
1078	5	2017-10-12 19:10:15.790098	2017-10-12 19:10:15.790098	2016-03-03	0	310526	451674	1280497	2808244	3013955	1292714	523129	1870468	2086069	1082071	0	0	0	0	0	1	9	3	2016	4
1079	5	2017-10-12 19:10:15.8384	2017-10-12 19:10:15.8384	2016-03-04	0	366985	813013	1138219	1711996	3413411	1405466	962977	1035048	1287902	798150	0	0	0	0	0	1	9	3	2016	5
1080	5	2017-10-12 19:10:15.846947	2017-10-12 19:10:15.846947	2016-03-05	0	479904	677511	1422774	914575	3035731	1146325	1201680	1359128	1830953	1659949	0	0	0	0	0	1	9	3	2016	6
1081	5	2017-10-12 19:10:15.855935	2017-10-12 19:10:15.855935	2016-03-06	0	254067	361339	569109	1005252	1075434	669888	569381	413470	745167	442958	0	0	0	0	0	1	9	3	2016	0
1082	5	2017-10-12 19:10:15.865591	2017-10-12 19:10:15.865591	2016-03-07	0	254067	225837	426832	517941	1213466	953102	418390	861982	503077	485782	0	0	0	0	0	1	10	3	2016	1
1083	5	2017-10-12 19:10:15.875012	2017-10-12 19:10:15.875012	2016-03-08	0	451674	587176	1351635	3309621	3098898	1091266	721174	720838	1365799	917955	0	0	0	0	0	1	10	3	2016	2
1084	5	2017-10-12 19:10:15.886147	2017-10-12 19:10:15.886147	2016-03-09	0	395215	677511	1138219	2852597	2724739	912795	900002	1554217	1063896	1840842	0	0	0	0	0	1	10	3	2016	3
1085	5	2017-10-12 19:10:15.895314	2017-10-12 19:10:15.895314	2016-03-10	0	479904	858181	1351635	2663725	2282469	1881540	382406	1716914	1068332	1616854	0	0	0	0	0	1	10	3	2016	4
1086	5	2017-10-12 19:10:15.904615	2017-10-12 19:10:15.904615	2016-03-11	0	395215	406507	1280497	1009730	2267843	1513070	589508	638522	2063314	1054469	0	0	0	0	0	1	10	3	2016	5
1087	5	2017-10-12 19:10:15.914573	2017-10-12 19:10:15.914573	2016-03-12	0	254067	767846	1138219	2073042	2047573	1340748	1561828	1633232	1734200	1090883	0	0	0	0	0	1	10	3	2016	6
1088	5	2017-10-12 19:10:15.923599	2017-10-12 19:10:15.923599	2016-03-13	0	211722	248421	320124	1564416	697617	587858	582242	736304	755475	288004	0	0	0	0	0	1	10	3	2016	0
1089	5	2017-10-12 19:10:15.933292	2017-10-12 19:10:15.933292	2016-03-14	0	197607	316172	497970	1102513	656750	463661	354720	483382	914145	356716	0	0	0	0	0	1	11	3	2016	1
1090	5	2017-10-12 19:10:15.948924	2017-10-12 19:10:15.948924	2016-03-15	0	310526	451674	924803	2260825	1704126	809056	889840	1390570	1546238	1092837	0	0	0	0	0	1	11	3	2016	2
1091	5	2017-10-12 19:10:15.958183	2017-10-12 19:10:15.958183	2016-03-16	0	508133	496841	1138219	2837228	2527261	1944740	681835	1566822	1108728	1133974	0	0	0	0	0	1	11	3	2016	3
1092	5	2017-10-12 19:10:15.96731	2017-10-12 19:10:15.96731	2016-03-17	0	564593	903348	1280497	1538508	2613005	1554021	949630	922635	1341520	985223	0	0	0	0	0	1	11	3	2016	4
1093	5	2017-10-12 19:10:15.976343	2017-10-12 19:10:15.976343	2016-03-18	0	366985	722678	640248	997496	1550621	1404082	934519	1088506	1627126	1079075	0	0	0	0	0	1	11	3	2016	5
1094	5	2017-10-12 19:10:15.98464	2017-10-12 19:10:15.98464	2016-03-19	0	423444	632344	995942	2607697	2288856	1039560	461635	1598804	1174811	806732	0	0	0	0	0	1	11	3	2016	6
1095	5	2017-10-12 19:10:15.994325	2017-10-12 19:10:15.994325	2016-03-20	0	225837	293588	711386	755187	2600768	382868	327311	335820	626694	495330	0	0	0	0	0	1	11	3	2016	0
1096	5	2017-10-12 19:10:16.002865	2017-10-12 19:10:16.002865	2016-03-21	0	225837	383923	675817	2068222	1107886	769302	306440	844893	608017	336389	0	0	0	0	0	1	12	3	2016	1
1097	5	2017-10-12 19:10:16.011841	2017-10-12 19:10:16.011841	2016-03-22	0	451674	858181	995942	3465311	3954233	1134063	537146	1793164	1736262	693767	0	0	0	0	0	1	12	3	2016	2
1098	5	2017-10-12 19:10:16.019892	2017-10-12 19:10:16.019892	2016-03-23	0	395215	858181	1209358	1017888	891982	1722325	813056	1125856	955585	951597	0	0	0	0	0	1	12	3	2016	3
1099	5	2017-10-12 19:10:16.028134	2017-10-12 19:10:16.028134	2016-03-24	0	254067	767846	853664	1218182	4322595	1678577	861787	1250953	2167663	1008221	0	0	0	0	0	1	12	3	2016	4
1100	5	2017-10-12 19:10:16.036406	2017-10-12 19:10:16.036406	2016-03-25	0	282296	632344	1280497	2500238	2153564	1339538	776311	1033105	869979	1266539	0	0	0	0	0	1	12	3	2016	5
1101	5	2017-10-12 19:10:16.046174	2017-10-12 19:10:16.046174	2016-03-26	0	395215	767846	640248	2667640	3968290	1236532	958052	1259895	2045882	603455	0	0	0	0	0	1	12	3	2016	6
1102	5	2017-10-12 19:10:16.055294	2017-10-12 19:10:16.055294	2016-03-27	0	282296	225837	462401	1502659	529151	765576	318374	495308	957980	323082	0	0	0	0	0	1	12	3	2016	0
1103	5	2017-10-12 19:10:16.063872	2017-10-12 19:10:16.063872	2016-03-28	0	268181	248421	497970	965629	1048016	406829	207074	364086	394985	275146	0	0	0	0	0	1	13	3	2016	1
1104	5	2017-10-12 19:10:16.0722	2017-10-12 19:10:16.0722	2016-03-29	0	310526	722678	640248	1899568	1704761	740092	750054	1869318	877773	623944	0	0	0	0	0	1	13	3	2016	2
1105	5	2017-10-12 19:10:16.080951	2017-10-12 19:10:16.080951	2016-03-30	0	338756	406507	924803	1120683	5327135	1196465	992169	1409072	1489753	557657	0	0	0	0	0	1	13	3	2016	3
1106	5	2017-10-12 19:10:16.089335	2017-10-12 19:10:16.089335	2016-03-31	0	508133	406507	1209358	2329385	2046029	1175691	1110915	1045024	1268970	636467	0	0	0	0	0	1	13	3	2016	4
1107	5	2017-10-12 19:10:16.097325	2017-10-12 19:10:16.097325	2016-04-01	0	677511	813013	1600620	2358075	4755857	1186554	1404860	2960555	2071232	1633868	0	0	0	0	0	1	13	4	2016	5
1108	5	2017-10-12 19:10:16.106034	2017-10-12 19:10:16.106034	2016-04-02	0	381100	880764	1707328	1831554	4074316	1281545	1586473	1628726	3967508	1879734	0	0	0	0	0	1	13	4	2016	6
1109	5	2017-10-12 19:10:16.114966	2017-10-12 19:10:16.114966	2016-04-03	0	381100	745262	1600620	2202226	5117946	2801029	1223305	1098104	1609365	887241	0	0	0	0	0	1	13	4	2016	0
1110	5	2017-10-12 19:10:16.123703	2017-10-12 19:10:16.123703	2016-04-04	0	381100	609760	1067080	1681279	2495933	1125325	1728966	1213775	1504001	2443106	0	0	0	0	0	1	14	4	2016	1
1111	5	2017-10-12 19:10:16.132261	2017-10-12 19:10:16.132261	2016-04-05	0	381100	643635	853664	1813620	2294402	1054519	742656	938139	766532	344233	0	0	0	0	0	1	14	4	2016	2
1112	5	2017-10-12 19:10:16.140384	2017-10-12 19:10:16.140384	2016-04-06	0	381100	643635	533540	2363577	1367912	1026667	675818	758514	1055044	549551	0	0	0	0	0	1	14	4	2016	3
1113	5	2017-10-12 19:10:16.148848	2017-10-12 19:10:16.148848	2016-04-07	0	762200	677511	1493912	2748571	2846994	2526812	1401541	1386477	3132818	2120069	0	0	0	0	0	1	14	4	2016	4
1114	5	2017-10-12 19:10:16.157015	2017-10-12 19:10:16.157015	2016-04-08	0	592822	813013	1600620	4619754	6268545	1363226	1543906	1776985	1722462	2392038	0	0	0	0	0	1	14	4	2016	5
1115	5	2017-10-12 19:10:16.165627	2017-10-12 19:10:16.165627	2016-04-09	0	465789	880764	1814036	4119934	6272858	2231157	1227977	1318251	3118596	1536731	0	0	0	0	0	1	14	4	2016	6
1116	5	2017-10-12 19:10:16.173639	2017-10-12 19:10:16.173639	2016-04-10	0	592822	609760	1280496	2205433	3220491	2229221	1458212	2080401	2184440	1811349	0	0	0	0	0	1	14	4	2016	0
1117	5	2017-10-12 19:10:16.181606	2017-10-12 19:10:16.181606	2016-04-11	0	804544	813013	1280496	3820934	1728600	1266647	568314	1711245	1466686	1649001	0	0	0	0	0	1	15	4	2016	1
1118	5	2017-10-12 19:10:16.190517	2017-10-12 19:10:16.190517	2016-04-12	0	254067	304880	693602	1272923	3539723	735254	612638	1497892	684568	517120	0	0	0	0	0	1	15	4	2016	2
1119	5	2017-10-12 19:10:16.199742	2017-10-12 19:10:16.199742	2016-04-13	0	190550	406507	693602	667764	894964	760243	627071	1023614	768758	566574	0	0	0	0	0	1	15	4	2016	3
1120	5	2017-10-12 19:10:16.208039	2017-10-12 19:10:16.208039	2016-04-14	0	550478	1219520	1814036	1668211	5717438	2107241	1346903	3086037	1621820	1199248	0	0	0	0	0	1	15	4	2016	4
755	1	2017-10-11 14:25:45.369099	2017-10-11 14:25:45.369099	2016-04-15	0	550478	1355022	2027452	2835220	3307762	2820655	746327	1223131	2021433	2209666	0	0	0	0	0	1	15	4	2016	5
756	1	2017-10-11 14:25:45.377129	2017-10-11 14:25:45.377129	2016-04-16	0	804544	1084018	2134160	2803890	1757151	1547061	1227058	1863817	3961456	959696	0	0	0	0	0	1	15	4	2016	6
757	1	2017-10-11 14:25:45.385911	2017-10-11 14:25:45.385911	2016-04-17	0	846889	609760	960372	1457676	5060549	1889083	839689	1015575	2472512	2233075	0	0	0	0	0	1	15	4	2016	0
758	1	2017-10-11 14:25:45.395423	2017-10-11 14:25:45.395423	2016-04-18	0	592822	1287271	1920744	3291584	7096380	1981998	1401576	3218472	3764239	2129691	0	0	0	0	0	1	16	4	2016	1
759	1	2017-10-11 14:25:45.403822	2017-10-11 14:25:45.403822	2016-04-19	0	381100	542009	480186	1896367	677799	763489	555116	994632	788508	457241	0	0	0	0	0	1	16	4	2016	2
760	1	2017-10-11 14:25:45.412191	2017-10-11 14:25:45.412191	2016-04-20	0	359928	440382	533540	981241	3206605	620653	323123	1107522	447775	800078	0	0	0	0	0	1	16	4	2016	3
761	1	2017-10-11 14:25:45.420563	2017-10-11 14:25:45.420563	2016-04-21	0	550478	1151769	1814036	2304986	6807419	2887157	975316	3106228	2459318	2122740	0	0	0	0	0	1	16	4	2016	4
762	1	2017-10-11 14:25:45.429192	2017-10-11 14:25:45.429192	2016-04-22	0	846889	813013	1067080	2355761	1521329	2678324	1137844	1655469	1991777	1549036	0	0	0	0	0	1	16	4	2016	5
763	1	2017-10-11 14:25:45.438148	2017-10-11 14:25:45.438148	2016-04-23	0	846889	948515	1067080	5259751	1908130	1895516	1346168	1278772	1553531	1205479	0	0	0	0	0	1	16	4	2016	6
764	1	2017-10-11 14:25:45.447675	2017-10-11 14:25:45.447675	2016-04-24	0	465789	1016267	960372	2560955	3828102	2956718	1194598	2905384	2756306	1503311	0	0	0	0	0	1	16	4	2016	0
765	1	2017-10-11 14:25:45.456245	2017-10-11 14:25:45.456245	2016-04-25	0	465789	1219520	2027452	2056662	3773952	1564086	1793686	1878157	3593795	1856086	0	0	0	0	0	1	17	4	2016	1
766	1	2017-10-11 14:25:45.465534	2017-10-11 14:25:45.465534	2016-04-26	0	402272	677511	853664	2583853	3622820	750833	431348	888702	712026	746354	0	0	0	0	0	1	17	4	2016	2
767	1	2017-10-11 14:25:45.474994	2017-10-11 14:25:45.474994	2016-04-27	0	317583	542009	640248	1985228	3379235	857461	717808	1390199	628934	317021	0	0	0	0	0	1	17	4	2016	3
768	1	2017-10-11 14:25:45.483972	2017-10-11 14:25:45.483972	2016-04-28	0	635167	677511	1600620	4248422	1387454	2201879	1298070	2231378	3635572	863119	0	0	0	0	0	1	17	4	2016	4
769	1	2017-10-11 14:25:45.493605	2017-10-11 14:25:45.493605	2016-04-29	0	762200	880764	2134160	2650766	1802918	1067129	1454996	2191803	1285778	1992978	0	0	0	0	0	1	17	4	2016	5
770	1	2017-10-11 14:25:45.504716	2017-10-11 14:25:45.504716	2016-04-30	0	719855	1287271	1173788	4162973	3923785	2841334	1637637	1884954	1565337	1983947	0	0	0	0	0	1	17	4	2016	6
771	1	2017-10-11 14:25:45.513594	2017-10-11 14:25:45.513594	2016-05-01	0	0	0	220500	572713	605807	1186200	897705	1287203	1126769	1307062	1891724	544542	0	0	0	1	17	5	2016	0
772	1	2017-10-11 14:25:45.523936	2017-10-11 14:25:45.523936	2016-05-02	0	0	0	396900	543078	1580988	694629	692273	1099233	854003	3041992	1438948	721098	0	0	0	1	18	5	2016	1
773	1	2017-10-11 14:25:45.534192	2017-10-11 14:25:45.534192	2016-05-03	0	0	0	242550	544894	552786	1242387	903112	1377561	1254938	1221646	2339186	1574570	0	0	0	1	18	5	2016	2
774	1	2017-10-11 14:25:45.54494	2017-10-11 14:25:45.54494	2016-05-04	0	0	0	396900	750340	1209751	554282	562830	846792	2597954	2163960	1377332	1925192	0	0	0	1	18	5	2016	3
775	1	2017-10-11 14:25:45.553891	2017-10-11 14:25:45.553891	2016-05-05	0	0	0	308700	666848	408441	944460	537458	1191946	1336222	2599586	1235868	1223539	0	0	0	1	18	5	2016	4
776	1	2017-10-11 14:25:45.563093	2017-10-11 14:25:45.563093	2016-05-06	0	0	0	485100	743982	1364519	1169936	1367322	1761842	5578795	2250367	6671404	1521452	0	0	0	1	18	5	2016	5
777	1	2017-10-11 14:25:45.571981	2017-10-11 14:25:45.571981	2016-05-07	0	0	0	352800	1114445	2000966	1689178	1415747	1370326	2597256	2693404	6161150	1544250	0	0	0	1	18	5	2016	6
778	1	2017-10-11 14:25:45.581024	2017-10-11 14:25:45.581024	2016-05-08	0	0	0	418950	470131	913530	503335	943051	1613439	2329527	2502981	2107883	988555	0	0	0	1	18	5	2016	0
779	1	2017-10-11 14:25:45.591509	2017-10-11 14:25:45.591509	2016-05-09	0	0	0	264600	727396	1023647	461846	367291	1813192	1846826	1649694	1418426	961068	0	0	0	1	19	5	2016	1
780	1	2017-10-11 14:25:45.601081	2017-10-11 14:25:45.601081	2016-05-10	0	0	0	286650	314341	622517	1025542	1218112	1155612	1329048	1085969	1712198	1139934	0	0	0	1	19	5	2016	2
781	1	2017-10-11 14:25:45.610184	2017-10-11 14:25:45.610184	2016-05-11	0	0	0	220500	461493	1134565	499660	443833	1882777	2557302	2812637	1349035	886795	0	0	0	1	19	5	2016	3
782	1	2017-10-11 14:25:45.619372	2017-10-11 14:25:45.619372	2016-05-12	0	0	0	198450	342279	614115	1398425	563362	993626	1407199	1323692	1814131	1486863	0	0	0	1	19	5	2016	4
783	1	2017-10-11 14:25:45.628321	2017-10-11 14:25:45.628321	2016-05-13	0	0	0	441000	1135652	1785019	2023052	2014888	2077381	4368066	4680126	5996592	4285312	0	0	0	1	19	5	2016	5
784	1	2017-10-11 14:25:45.637152	2017-10-11 14:25:45.637152	2016-05-14	0	0	0	352800	501127	570030	1378829	1106523	1545967	3834862	1611985	5789050	2933280	0	0	0	1	19	5	2016	6
785	1	2017-10-11 14:25:45.645764	2017-10-11 14:25:45.645764	2016-05-15	0	0	0	330750	334015	898251	736123	1348446	975569	1801418	1238921	2364567	1007640	0	0	0	1	19	5	2016	0
786	1	2017-10-11 14:25:45.654576	2017-10-11 14:25:45.654576	2016-05-16	0	0	0	352800	365864	1048940	972600	936314	1112099	2438559	2064268	931317	1834034	0	0	0	1	20	5	2016	1
787	1	2017-10-11 14:25:45.663854	2017-10-11 14:25:45.663854	2016-05-17	0	0	0	418950	694460	1031519	1407300	545501	773725	2043948	2322043	2032576	1204083	0	0	0	1	20	5	2016	2
788	1	2017-10-11 14:25:45.67249	2017-10-11 14:25:45.67249	2016-05-18	0	0	0	396900	289450	534179	937882	1185822	1098301	2027378	3295508	1498892	1080300	0	0	0	1	20	5	2016	3
789	1	2017-10-11 14:25:45.681229	2017-10-11 14:25:45.681229	2016-05-19	0	0	0	396900	584164	1015772	1175142	510709	634627	1530091	1745287	1898394	1197369	0	0	0	1	20	5	2016	4
790	1	2017-10-11 14:25:45.6902	2017-10-11 14:25:45.6902	2016-05-20	0	0	0	661500	1129990	2262496	1697753	2654826	3220885	3878288	4431359	4310444	2315774	0	0	0	1	20	5	2016	5
791	1	2017-10-11 14:25:45.702059	2017-10-11 14:25:45.702059	2016-05-21	0	0	0	529200	1185278	1035168	1043708	2090473	1463690	4117193	2779039	5115893	1430644	0	0	0	1	20	5	2016	6
792	1	2017-10-11 14:25:45.715219	2017-10-11 14:25:45.715219	2016-05-22	0	0	0	308700	849842	506334	1025854	940386	717521	2193208	1433686	1335870	1848737	0	0	0	1	20	5	2016	0
793	1	2017-10-11 14:25:45.728798	2017-10-11 14:25:45.728798	2016-05-23	0	0	0	220500	872729	937430	377816	817126	1220138	1719362	1807374	1737939	801577	0	0	0	1	21	5	2016	1
794	1	2017-10-11 14:25:45.738892	2017-10-11 14:25:45.738892	2016-05-24	0	0	0	396900	1031309	1297744	1041710	585474	1001650	1180120	1341388	2903696	1337946	0	0	0	1	21	5	2016	2
795	1	2017-10-11 14:25:45.747215	2017-10-11 14:25:45.747215	2016-05-25	0	0	0	220500	1163041	733658	1038870	1173504	630491	2919214	2046994	1534374	1267449	0	0	0	1	21	5	2016	3
796	1	2017-10-11 14:25:45.756715	2017-10-11 14:25:45.756715	2016-05-26	0	0	0	308700	471777	556011	974506	640198	1291694	1510813	2986123	2383689	912103	0	0	0	1	21	5	2016	4
797	1	2017-10-11 14:25:45.767064	2017-10-11 14:25:45.767064	2016-05-27	0	0	0	749700	1244198	1218885	2508407	1232195	1607988	4732792	4773656	5778006	2639786	0	0	0	1	21	5	2016	5
798	1	2017-10-11 14:25:45.776521	2017-10-11 14:25:45.776521	2016-05-28	0	0	0	529200	761485	1378630	2508217	2247324	2436543	2773083	1854550	3068038	1067873	0	0	0	1	21	5	2016	6
799	1	2017-10-11 14:25:45.785099	2017-10-11 14:25:45.785099	2016-05-29	0	0	0	529200	621572	758138	999831	670434	1900282	2188078	4317276	2481101	1883733	0	0	0	1	21	5	2016	0
800	1	2017-10-11 14:25:45.794161	2017-10-11 14:25:45.794161	2016-05-30	0	0	0	429975	741846	2241873	663526	879018	2281536	2848700	2884793	1782954	1329046	0	0	0	1	22	5	2016	1
801	1	2017-10-11 14:25:45.804175	2017-10-11 14:25:45.804175	2016-05-31	0	0	0	330750	578326	1125431	893711	765758	865479	2754913	3380540	3418440	1825279	0	0	0	1	22	5	2016	2
802	1	2017-10-11 14:25:45.812914	2017-10-11 14:25:45.812914	2016-06-01	0	0	0	661500	592855	750066	868752	1768320	1670310	3795248	4037648	3249435	1027754	0	0	0	1	22	6	2016	3
803	1	2017-10-11 14:25:45.821892	2017-10-11 14:25:45.821892	2016-06-02	0	0	0	529200	1223640	729900	1489664	1961032	2423777	2937243	3540375	2431155	1324681	0	0	0	1	22	6	2016	4
804	1	2017-10-11 14:25:45.830845	2017-10-11 14:25:45.830845	2016-06-03	0	0	0	529200	755403	1099419	642601	1745348	2357635	1684093	4742519	3516724	1146205	0	0	0	1	22	6	2016	5
805	1	2017-10-11 14:25:45.840735	2017-10-11 14:25:45.840735	2016-06-04	0	0	0	529200	1453586	1108173	1671029	867327	2175531	4916567	2729174	3058387	2625152	0	0	0	1	22	6	2016	6
806	1	2017-10-11 14:25:45.849551	2017-10-11 14:25:45.849551	2016-06-05	0	0	0	1190700	758430	2194751	1619622	3822793	2633060	4407521	10419499	4407716	1897104	0	0	0	1	22	6	2016	0
807	1	2017-10-11 14:25:45.858269	2017-10-11 14:25:45.858269	2016-06-06	0	0	0	1005480	1992290	1622416	3289846	2275714	2096844	5170827	5043853	5629352	2986746	0	0	0	1	23	6	2016	1
808	1	2017-10-11 14:25:45.867915	2017-10-11 14:25:45.867915	2016-06-07	0	0	0	529200	977567	769928	694517	954616	1632559	3353680	4610034	1865469	2165192	0	0	0	1	23	6	2016	2
809	1	2017-10-11 14:25:45.877075	2017-10-11 14:25:45.877075	2016-06-08	0	0	0	297675	1004442	630064	884741	823885	2151335	1296415	4505474	1957240	2082502	0	0	0	1	23	6	2016	3
810	1	2017-10-11 14:25:45.895313	2017-10-11 14:25:45.895313	2016-06-09	0	0	0	297675	969951	1187320	1446690	815051	2598264	1655018	2351754	2889084	2492246	0	0	0	1	23	6	2016	4
811	1	2017-10-11 14:25:45.904096	2017-10-11 14:25:45.904096	2016-06-10	0	0	0	463050	689730	796860	863461	1575893	1300870	1836950	2832268	2531657	1500506	0	0	0	1	23	6	2016	5
812	1	2017-10-11 14:25:45.912767	2017-10-11 14:25:45.912767	2016-06-11	0	0	0	496125	693998	1550162	1669851	1771326	2649746	5271254	2184760	3517633	1722338	0	0	0	1	23	6	2016	6
813	1	2017-10-11 14:25:45.921011	2017-10-11 14:25:45.921011	2016-06-12	0	0	0	661500	1466281	3512057	3001304	1952810	3835327	9344139	4602932	7361491	4317295	0	0	0	1	23	6	2016	0
814	1	2017-10-11 14:25:45.929861	2017-10-11 14:25:45.929861	2016-06-13	0	0	0	1005480	1501655	2863614	2999106	3586232	1708825	4279478	8456872	7858959	4145564	0	0	0	1	24	6	2016	1
815	1	2017-10-11 14:25:45.938523	2017-10-11 14:25:45.938523	2016-06-14	0	0	0	595350	674176	727529	981411	1983727	954450	2478675	2569162	1185907	1157282	0	0	0	1	24	6	2016	2
816	1	2017-10-11 14:25:45.94684	2017-10-11 14:25:45.94684	2016-06-15	0	0	0	363825	1421226	1463392	1055955	713807	1741259	2839299	1775864	2854568	1177527	0	0	0	1	24	6	2016	3
817	1	2017-10-11 14:25:45.954952	2017-10-11 14:25:45.954952	2016-06-16	0	0	0	595350	437930	1535972	995771	550854	1156843	1134036	2770135	1808681	2390465	0	0	0	1	24	6	2016	4
818	1	2017-10-11 14:25:45.963914	2017-10-11 14:25:45.963914	2016-06-17	0	0	0	562275	523153	1358978	1583694	579617	1726106	1161190	2949962	4380591	1752106	0	0	0	1	24	6	2016	5
819	1	2017-10-11 14:25:45.973511	2017-10-11 14:25:45.973511	2016-06-18	0	0	0	463050	445319	1271897	1023880	1643678	2587460	4962346	3581514	3829046	3776592	0	0	0	1	24	6	2016	6
820	1	2017-10-11 14:25:45.982237	2017-10-11 14:25:45.982237	2016-06-19	0	0	0	661500	3060148	1757143	2593164	2927050	2968803	5964877	10512988	7383522	5307106	0	0	0	1	24	6	2016	0
821	1	2017-10-11 14:25:45.991158	2017-10-11 14:25:45.991158	2016-06-20	0	0	0	635040	2313812	3058593	2344376	1589814	2963281	4401194	4293914	6787462	3904874	0	0	0	1	25	6	2016	1
822	1	2017-10-11 14:25:45.999408	2017-10-11 14:25:45.999408	2016-06-21	0	0	0	429975	1159753	1107829	1434968	773914	2244168	1604588	2299074	2274962	1772634	0	0	0	1	25	6	2016	2
823	1	2017-10-11 14:25:46.008306	2017-10-11 14:25:46.008306	2016-06-22	0	0	0	396900	1384022	416015	1742673	1551695	2397713	3467421	3779313	2474828	882274	0	0	0	1	25	6	2016	3
824	1	2017-10-11 14:25:46.016372	2017-10-11 14:25:46.016372	2016-06-23	0	0	0	363825	1531547	1891121	1344545	807845	2234560	4330908	4471530	2067919	1920573	0	0	0	1	25	6	2016	4
825	1	2017-10-11 14:25:46.025119	2017-10-11 14:25:46.025119	2016-06-24	0	0	0	661500	510769	1343362	811086	2016476	1371973	2161888	2699611	1764978	1816634	0	0	0	1	25	6	2016	5
826	1	2017-10-11 14:25:46.033345	2017-10-11 14:25:46.033345	2016-06-25	0	0	0	463050	788181	1406058	764360	614716	3102077	2392940	3600957	4940532	1289651	0	0	0	1	25	6	2016	6
827	1	2017-10-11 14:25:46.042068	2017-10-11 14:25:46.042068	2016-06-26	0	0	0	1256850	1973510	3025937	2386336	3443652	4298729	5935895	8312544	5061972	4696244	0	0	0	1	25	6	2016	0
828	1	2017-10-11 14:25:46.050742	2017-10-11 14:25:46.050742	2016-06-27	0	0	0	529200	1379332	1236105	2239946	1599736	5121224	5536794	5870301	5815179	2815891	0	0	0	1	26	6	2016	1
829	1	2017-10-11 14:25:46.059115	2017-10-11 14:25:46.059115	2016-06-28	0	0	0	595350	1366308	1556627	1194731	1525106	1046960	2839482	2118971	1493679	1218442	0	0	0	1	26	6	2016	2
830	1	2017-10-11 14:25:46.066878	2017-10-11 14:25:46.066878	2016-06-29	0	0	0	661500	905002	1439728	1007881	731968	1980699	3558090	2495684	1748840	2461310	0	0	0	1	26	6	2016	3
831	1	2017-10-11 14:25:46.075311	2017-10-11 14:25:46.075311	2016-06-30	0	0	0	595350	1466889	1147306	1938118	1064536	1294474	2156875	3940212	2423233	1744376	0	0	0	1	26	6	2016	4
832	1	2017-10-11 14:25:46.083337	2017-10-11 14:25:46.083337	2016-07-01	0	366985	767846	1422774	3505038	1123716	1729762	873510	1346690	2017477	1176536	0	0	0	0	0	1	26	7	2016	5
833	1	2017-10-11 14:25:46.09221	2017-10-11 14:25:46.09221	2016-07-02	0	338756	813013	1209358	2660441	2260466	1184988	479535	1210303	2201961	569511	0	0	0	0	0	1	26	7	2016	6
834	1	2017-10-11 14:25:46.10107	2017-10-11 14:25:46.10107	2016-07-03	0	423444	767846	924803	1455197	2007889	665747	962977	1223239	1674273	931175	0	0	0	0	0	1	26	7	2016	0
835	1	2017-10-11 14:25:46.109829	2017-10-11 14:25:46.109829	2016-07-04	0	338756	858181	711387	1524292	3035731	1361261	667600	1844531	2075080	1659949	0	0	0	0	0	1	27	7	2016	1
836	1	2017-10-11 14:25:46.118392	2017-10-11 14:25:46.118392	2016-07-05	0	268181	451674	497970	933448	1240886	669888	320277	597234	447100	383897	0	0	0	0	0	1	27	7	2016	2
837	1	2017-10-11 14:25:46.127066	2017-10-11 14:25:46.127066	2016-07-06	0	211722	248421	675817	517941	2062892	847202	232439	732685	452769	514357	0	0	0	0	0	1	27	7	2016	3
838	1	2017-10-11 14:25:46.13546	2017-10-11 14:25:46.13546	2016-07-07	0	310526	632344	711387	2336203	3098898	909389	1109498	600698	1117472	795561	0	0	0	0	0	1	27	7	2016	4
839	1	2017-10-11 14:25:46.14383	2017-10-11 14:25:46.14383	2016-07-08	0	564593	722678	1138219	1651504	2140866	1115639	660001	1227014	1536739	1380632	0	0	0	0	0	1	27	7	2016	5
840	1	2017-10-11 14:25:46.152172	2017-10-11 14:25:46.152172	2016-07-09	0	338756	813013	1351635	2996690	2458043	1599309	552364	2289218	903973	1616854	0	0	0	0	0	1	27	7	2016	6
841	1	2017-10-11 14:25:46.164052	2017-10-11 14:25:46.164052	2016-07-10	0	338756	406507	1422774	1682883	1781877	1246057	851512	780416	1335085	988565	0	0	0	0	0	1	27	7	2016	0
842	1	2017-10-11 14:25:46.17693	2017-10-11 14:25:46.17693	2016-07-11	0	310526	451674	1209358	2073042	2047573	893832	780914	1270291	1560780	749982	0	0	0	0	0	1	28	7	2016	1
843	1	2017-10-11 14:25:46.190001	2017-10-11 14:25:46.190001	2016-07-12	0	155263	406507	675817	1271088	797277	979764	612886	515413	554015	480006	0	0	0	0	0	1	28	7	2016	2
844	1	2017-10-11 14:25:46.201386	2017-10-11 14:25:46.201386	2016-07-13	0	282296	225837	711386	907952	919450	318767	419215	621491	481129	209833	0	0	0	0	0	1	28	7	2016	3
845	1	2017-10-11 14:25:46.211836	2017-10-11 14:25:46.211836	2016-07-14	0	536363	451674	1351635	1849766	1804369	970867	578396	1390570	1417385	1014777	0	0	0	0	0	1	28	7	2016	4
846	1	2017-10-11 14:25:46.221313	2017-10-11 14:25:46.221313	2016-07-15	0	508133	496841	640248	1891485	1965648	1296493	681835	1154500	1330474	793782	0	0	0	0	0	1	28	7	2016	5
847	1	2017-10-11 14:25:46.230448	2017-10-11 14:25:46.230448	2016-07-16	0	479904	722678	640248	1153881	2613005	1635812	830927	1435210	1475672	656815	0	0	0	0	0	1	28	7	2016	6
848	1	2017-10-11 14:25:46.239811	2017-10-11 14:25:46.239811	2016-07-17	0	395215	722678	1351635	914372	1259879	1103208	1479655	1632759	957133	913064	0	0	0	0	0	1	28	7	2016	0
849	1	2017-10-11 14:25:46.249732	2017-10-11 14:25:46.249732	2016-07-18	0	508133	496841	1351635	2005921	1961876	952930	692453	1346362	1566415	930845	0	0	0	0	0	1	29	7	2016	1
850	1	2017-10-11 14:25:46.259139	2017-10-11 14:25:46.259139	2016-07-19	0	282296	429090	497970	830706	1300384	650876	251778	373133	705031	528352	0	0	0	0	0	1	29	7	2016	2
851	1	2017-10-11 14:25:46.270506	2017-10-11 14:25:46.270506	2016-07-20	0	239952	248421	675817	2068222	553943	718015	340489	496996	781736	252292	0	0	0	0	0	1	29	7	2016	3
852	1	2017-10-11 14:25:46.280812	2017-10-11 14:25:46.280812	2016-07-21	0	451674	542009	1422774	3080277	3427002	1058459	895244	1075898	1832721	800501	0	0	0	0	0	1	29	7	2016	4
853	1	2017-10-11 14:25:46.289983	2017-10-11 14:25:46.289983	2016-07-22	0	564593	858181	1067081	832818	1486637	1148216	596241	779439	1102598	727692	0	0	0	0	0	1	29	7	2016	5
854	1	2017-10-11 14:25:46.300134	2017-10-11 14:25:46.300134	2016-07-23	0	423444	632344	1422774	1328926	4550100	1790482	615562	1364676	1402606	693152	0	0	0	0	0	1	29	7	2016	6
855	1	2017-10-11 14:25:46.314105	2017-10-11 14:25:46.314105	2016-07-24	0	451674	813013	711387	2500238	2045886	1413957	720860	1106898	1643293	914723	0	0	0	0	0	1	29	7	2016	0
856	1	2017-10-11 14:25:46.327189	2017-10-11 14:25:46.327189	2016-07-25	0	564593	451674	711387	2519437	2976218	1236532	507204	923923	2301617	1072810	0	0	0	0	0	1	30	7	2016	1
857	1	2017-10-11 14:25:46.336837	2017-10-11 14:25:46.336837	2016-07-26	0	254067	406507	320124	1878324	1005387	969730	318374	528328	1008400	209053	0	0	0	0	0	1	30	7	2016	2
858	1	2017-10-11 14:25:46.346365	2017-10-11 14:25:46.346365	2016-07-27	0	155263	406507	391262	1062192	1612332	732292	368131	628875	282132	350186	0	0	0	0	0	1	30	7	2016	3
859	1	2017-10-11 14:25:46.354661	2017-10-11 14:25:46.354661	2016-07-28	0	423444	406507	640248	2849351	1704761	1110138	1050076	1401989	789996	831925	0	0	0	0	0	1	30	7	2016	4
860	1	2017-10-11 14:25:46.363074	2017-10-11 14:25:46.363074	2016-07-29	0	423444	677511	924803	1426324	3925257	914944	1167258	1574845	1489753	608353	0	0	0	0	0	1	30	7	2016	5
861	1	2017-10-11 14:25:46.37143	2017-10-11 14:25:46.37143	2016-07-30	0	282296	451674	640248	4023484	2046029	1567588	1049198	783768	1366583	477350	0	0	0	0	0	1	30	7	2016	6
862	1	2017-10-11 14:25:46.379754	2017-10-11 14:25:46.379754	2016-07-31	0	423444	677511	1600620	1813904	4359535	1294422	1123888	2804737	3765876	1441649	0	0	0	0	0	1	30	7	2016	0
863	1	2017-10-11 14:25:46.38863	2017-10-11 14:25:46.38863	2016-08-01	0	550478	813013	1814036	1098932	3703924	1631057	1669972	1538242	2923427	1754418	0	0	0	0	0	1	31	8	2016	1
864	1	2017-10-11 14:25:46.397919	2017-10-11 14:25:46.397919	2016-08-02	0	465789	1219520	2134160	2446918	3326665	1326803	1467966	1464139	2487200	725925	0	0	0	0	0	1	31	8	2016	2
865	1	2017-10-11 14:25:46.40669	2017-10-11 14:25:46.40669	2016-08-03	0	635167	1355022	1280496	2802132	4991866	1350390	1830670	1618367	1851078	2443106	0	0	0	0	0	1	31	8	2016	3
866	1	2017-10-11 14:25:46.415059	2017-10-11 14:25:46.415059	2016-08-04	0	190550	406507	693602	1813620	2600322	820182	928320	1023425	766532	401605	0	0	0	0	0	1	31	8	2016	4
867	1	2017-10-11 14:25:46.423584	2017-10-11 14:25:46.423584	2016-08-05	0	296411	508133	1067080	3151436	1025934	918597	755326	1365325	930921	517224	0	0	0	0	0	1	31	8	2016	5
868	1	2017-10-11 14:25:46.432234	2017-10-11 14:25:46.432234	2016-08-06	0	762200	1219520	1067080	2137778	4141082	2526812	1101211	2618901	2088545	1987565	0	0	0	0	0	1	31	8	2016	6
869	1	2017-10-11 14:25:46.440644	2017-10-11 14:25:46.440644	2016-08-07	0	550478	1219520	1067080	5851688	5920293	817935	1235125	1650058	1607631	1196019	0	0	0	0	0	1	31	8	2016	0
870	1	2017-10-11 14:25:46.44881	2017-10-11 14:25:46.44881	2016-08-08	0	719855	1219520	1707328	6338360	6621350	1644010	1739634	2636501	3668936	1536731	0	0	0	0	0	1	32	8	2016	1
871	1	2017-10-11 14:25:46.456759	2017-10-11 14:25:46.456759	2016-08-09	0	592822	1287271	1707328	3223325	3623053	1238456	1263783	2773868	1264676	1569836	0	0	0	0	0	1	32	8	2016	2
872	1	2017-10-11 14:25:46.464869	2017-10-11 14:25:46.464869	2016-08-10	0	550478	1151769	1280496	2547289	1872650	949985	1136628	2077941	2266697	1649001	0	0	0	0	0	1	32	8	2016	3
873	1	2017-10-11 14:25:46.472966	2017-10-11 14:25:46.472966	2016-08-11	0	254067	406507	800310	1432039	3539723	551441	891110	832162	812925	940218	0	0	0	0	0	1	32	8	2016	4
874	1	2017-10-11 14:25:46.481043	2017-10-11 14:25:46.481043	2016-08-12	0	275239	440382	853664	741960	1093844	684219	578834	731153	709622	566574	0	0	0	0	0	1	32	8	2016	5
875	1	2017-10-11 14:25:46.489392	2017-10-11 14:25:46.489392	2016-08-13	0	550478	880764	2134160	2363299	7350991	1330889	1346903	1949076	2594912	1079323	0	0	0	0	0	1	32	8	2016	6
876	1	2017-10-11 14:25:46.499005	2017-10-11 14:25:46.499005	2016-08-14	0	508133	1355022	1920744	4489098	3544031	2820655	1326803	1834697	1299493	1436283	0	0	0	0	0	1	32	8	2016	0
877	1	2017-10-11 14:25:46.507483	2017-10-11 14:25:46.507483	2016-08-15	0	550478	745262	1067080	2474021	1437669	2165885	818039	2724040	2293475	1439544	0	0	0	0	0	1	33	8	2016	1
878	1	2017-10-11 14:25:46.516217	2017-10-11 14:25:46.516217	2016-08-16	0	381100	1355022	1387204	2623817	4048439	1590806	1119586	1726478	1390788	1736836	0	0	0	0	0	1	33	8	2016	2
879	1	2017-10-11 14:25:46.524659	2017-10-11 14:25:46.524659	2016-08-17	0	762200	948515	1920744	5386228	7096380	1717732	1185949	1788040	3973364	2017602	0	0	0	0	0	1	33	8	2016	3
880	1	2017-10-11 14:25:46.533253	2017-10-11 14:25:46.533253	2016-08-18	0	423444	575884	480186	1297514	1430909	1249346	620424	1243290	830008	640137	0	0	0	0	0	1	33	8	2016	4
881	1	2017-10-11 14:25:46.541968	2017-10-11 14:25:46.541968	2016-08-19	0	211722	609760	693602	1784074	2204541	896498	502636	812183	497528	711181	0	0	0	0	0	1	33	8	2016	5
882	1	2017-10-11 14:25:46.551293	2017-10-11 14:25:46.551293	2016-08-20	0	381100	1287271	1173788	4866081	4657708	1924771	731487	2615771	2107987	2004810	0	0	0	0	0	1	33	8	2016	6
883	1	2017-10-11 14:25:46.560043	2017-10-11 14:25:46.560043	2016-08-21	0	465789	948515	1387204	1239874	2704586	1934345	1232664	1850230	1770469	1072409	0	0	0	0	0	1	33	8	2016	0
884	1	2017-10-11 14:25:46.568866	2017-10-11 14:25:46.568866	2016-08-22	0	635167	1084018	1173788	4383126	3243821	1421637	1760374	2301790	1553531	1753424	0	0	0	0	0	1	34	8	2016	1
885	1	2017-10-11 14:25:46.577183	2017-10-11 14:25:46.577183	2016-08-23	0	423444	1355022	1493912	2560955	3509094	3120980	1279926	1614102	2342860	1850229	0	0	0	0	0	1	34	8	2016	2
886	1	2017-10-11 14:25:46.585978	2017-10-11 14:25:46.585978	2016-08-24	0	804544	1016267	1814036	2847686	3302208	1899247	1793686	1341541	3382395	1856086	0	0	0	0	0	1	34	8	2016	3
887	1	2017-10-11 14:25:46.594724	2017-10-11 14:25:46.594724	2016-08-25	0	254067	542009	1067080	2296758	4025356	1063680	814768	935476	996836	621962	0	0	0	0	0	1	34	8	2016	4
888	1	2017-10-11 14:25:46.603271	2017-10-11 14:25:46.603271	2016-08-26	0	402272	440382	586894	1985228	3379235	1457684	938672	772333	838578	598818	0	0	0	0	0	1	34	8	2016	5
889	1	2017-10-11 14:25:46.61239	2017-10-11 14:25:46.61239	2016-08-27	0	719855	1355022	1600620	3681965	1541615	3218131	908649	2008240	2678843	1438532	0	0	0	0	0	1	34	8	2016	6
890	1	2017-10-11 14:25:46.620723	2017-10-11 14:25:46.620723	2016-08-28	0	423444	948515	1814036	1559274	2130721	2134258	1551995	2191803	2035816	1992978	0	0	0	0	0	1	34	8	2016	0
891	1	2017-10-11 14:25:46.629796	2017-10-11 14:25:46.629796	2016-08-29	0	550478	1287271	2134160	4423159	7455192	2052075	1292871	1884954	1900767	1322632	0	0	0	0	0	1	35	8	2016	1
892	1	2017-10-11 14:25:46.638758	2017-10-11 14:25:46.638758	2016-08-30	0	0	0	286650	429535	771028	889650	548598	919431	845077	1415983	1891724	605047	0	0	0	1	35	8	2016	2
893	1	2017-10-11 14:25:46.647612	2017-10-11 14:25:46.647612	2016-08-31	0	0	0	198450	373366	1343840	820925	585770	1025951	1110204	2147288	1185016	776567	0	0	0	1	35	8	2016	3
894	1	2017-10-11 14:25:46.656096	2017-10-11 14:25:46.656096	2016-09-01	0	0	0	396900	326936	750209	950061	903112	1539627	2509875	1110587	1169593	1154684	0	0	0	1	35	9	2016	4
895	1	2017-10-11 14:25:46.664958	2017-10-11 14:25:46.664958	2016-09-02	0	0	0	220500	710849	1209751	831424	779303	1270188	1587639	1839366	1377332	1114585	0	0	0	1	35	9	2016	5
896	1	2017-10-11 14:25:46.673665	2017-10-11 14:25:46.673665	2016-09-03	0	0	0	418950	444565	345604	524700	1074916	1390603	1527110	1368203	1500697	847066	0	0	0	1	35	9	2016	6
897	1	2017-10-11 14:25:46.683439	2017-10-11 14:25:46.683439	2016-09-04	0	0	0	661500	1144588	1637423	1403923	2050983	1761842	3817070	2500408	6320277	1825742	0	0	0	1	35	9	2016	0
898	1	2017-10-11 14:25:46.69346	2017-10-11 14:25:46.69346	2016-09-05	0	0	0	599760	1200171	1790338	1583604	2005641	1686555	2968293	4189739	5853093	2573750	0	0	0	1	36	9	2016	1
899	1	2017-10-11 14:25:46.702816	2017-10-11 14:25:46.702816	2016-09-06	0	0	0	330750	769306	1065785	950744	1178814	1254897	1348674	1732833	1522360	741416	0	0	0	1	36	9	2016	2
900	1	2017-10-11 14:25:46.713252	2017-10-11 14:25:46.713252	2016-09-07	0	0	0	198450	344556	1620774	769744	612152	1913925	1420635	2549527	1654831	1029716	0	0	0	1	36	9	2016	3
901	1	2017-10-11 14:25:46.723931	2017-10-11 14:25:46.723931	2016-09-08	0	0	0	308700	449058	456512	732530	791773	1540816	1329048	1206632	1351736	1450826	0	0	0	1	36	9	2016	4
902	1	2017-10-11 14:25:46.733338	2017-10-11 14:25:46.733338	2016-09-09	0	0	0	264600	629309	1063655	726778	843283	1585496	1662246	2988427	1110970	609672	0	0	0	1	36	9	2016	5
903	1	2017-10-11 14:25:46.743612	2017-10-11 14:25:46.743612	2016-09-10	0	0	0	308700	513419	652497	1251222	1126724	638760	1641732	992769	1432209	1137013	0	0	0	1	36	9	2016	6
904	1	2017-10-11 14:25:46.752311	2017-10-11 14:25:46.752311	2016-09-11	0	0	0	529200	1022087	2082522	1300533	906700	1558036	2528880	2753015	4497444	3809166	0	0	0	1	36	9	2016	0
905	1	2017-10-11 14:25:46.762209	2017-10-11 14:25:46.762209	2016-09-12	0	0	0	388080	357948	1266734	1953341	1911267	1070285	3621814	2686641	4052335	2933280	0	0	0	1	37	9	2016	1
906	1	2017-10-11 14:25:46.771991	2017-10-11 14:25:46.771991	2016-09-13	0	0	0	220500	668030	785970	426176	1213601	1382056	2139183	1238921	2489018	863692	0	0	0	1	37	9	2016	2
907	1	2017-10-11 14:25:46.782018	2017-10-11 14:25:46.782018	2016-09-14	0	0	0	220500	813032	944046	437670	819274	819441	2438559	1238561	1693304	1018908	0	0	0	1	37	9	2016	3
908	1	2017-10-11 14:25:46.791442	2017-10-11 14:25:46.791442	2016-09-15	0	0	0	242550	475157	1348909	1185094	472767	1203572	2481937	2077618	1673886	1634112	0	0	0	1	37	9	2016	4
909	1	2017-10-11 14:25:46.800696	2017-10-11 14:25:46.800696	2016-09-16	0	0	0	308700	418094	502757	987244	724669	549150	2154089	1907926	2725258	810225	0	0	0	1	37	9	2016	5
910	1	2017-10-11 14:25:46.810768	2017-10-11 14:25:46.810768	2016-09-17	0	0	0	418950	849693	761829	1051443	737690	775655	1883189	1454406	1328876	798246	0	0	0	1	37	9	2016	6
911	1	2017-10-11 14:25:46.82052	2017-10-11 14:25:46.82052	2016-09-18	0	0	0	661500	1581986	1131248	1697753	1397277	1705174	2133058	3200426	3735718	3473662	0	0	0	1	37	9	2016	0
912	1	2017-10-11 14:25:46.8295	2017-10-11 14:25:46.8295	2016-09-19	0	0	0	388080	829695	762755	1605704	1974336	1219742	4999448	2084279	5115893	2145966	0	0	0	1	38	9	2016	1
913	1	2017-10-11 14:25:46.838344	2017-10-11 14:25:46.838344	2016-09-20	0	0	0	396900	894570	348105	806028	689616	956694	2308640	1213119	2137392	1027076	0	0	0	1	38	9	2016	2
914	1	2017-10-11 14:25:46.847396	2017-10-11 14:25:46.847396	2016-09-21	0	0	0	418950	462033	602634	604506	1021407	1595566	1719362	1988111	920085	601183	0	0	0	1	38	9	2016	3
915	1	2017-10-11 14:25:46.856755	2017-10-11 14:25:46.856755	2016-09-22	0	0	0	330750	597073	1103082	1237031	878211	1001650	1062108	1444572	2758511	1720217	0	0	0	1	38	9	2016	4
916	1	2017-10-11 14:25:46.865955	2017-10-11 14:25:46.865955	2016-09-23	0	0	0	308700	673340	917072	981155	821453	910710	2919214	2046994	2371305	1852426	0	0	0	1	38	9	2016	5
917	1	2017-10-11 14:25:46.875658	2017-10-11 14:25:46.875658	2016-09-24	0	0	0	220500	943555	675157	535978	715515	1391055	2197546	1493061	2523906	684077	0	0	0	1	38	9	2016	6
918	1	2017-10-11 14:25:46.885918	2017-10-11 14:25:46.885918	2016-09-25	0	0	0	529200	691221	1781448	2640428	1496236	2501314	4234603	6819508	3466804	1451882	0	0	0	1	38	9	2016	0
919	1	2017-10-11 14:25:46.894783	2017-10-11 14:25:46.894783	2016-09-26	0	0	0	599760	1269142	3063622	1716148	1797859	3086288	3389323	2472733	3346950	1067873	0	0	0	1	39	9	2016	1
920	1	2017-10-11 14:25:46.903885	2017-10-11 14:25:46.903885	2016-09-27	0	0	0	396900	828763	1061393	599899	670434	1900282	1989162	2590366	3244516	1593928	0	0	0	1	39	9	2016	2
921	1	2017-10-11 14:25:46.913274	2017-10-11 14:25:46.913274	2016-09-28	0	0	0	396900	674405	1370034	1179602	565083	1711152	2698769	2884793	1782954	1661307	0	0	0	1	39	9	2016	3
922	1	2017-10-11 14:25:46.933101	2017-10-11 14:25:46.933101	2016-09-29	0	0	0	496125	702253	860623	1042663	1301789	1125123	1739945	1521243	2392908	1014044	0	0	0	1	39	9	2016	4
923	1	2017-10-11 14:25:46.942628	2017-10-11 14:25:46.942628	2016-09-30	0	0	0	496125	1077918	750066	955627	1768320	884282	3795248	1816942	3858704	1284693	0	0	0	1	39	9	2016	5
924	1	2017-10-11 14:25:46.951241	2017-10-11 14:25:46.951241	2016-10-01	0	0	0	595350	856548	875880	1064046	1341759	1530806	2153978	4484475	1519472	1324681	0	0	0	1	39	10	2016	6
925	1	2017-10-11 14:25:46.960011	2017-10-11 14:25:46.960011	2016-10-02	0	0	0	330750	1373460	952830	993111	826744	1178817	2862958	3626632	1934198	1146205	0	0	0	1	39	10	2016	0
926	1	2017-10-11 14:25:46.968602	2017-10-11 14:25:46.968602	2016-10-03	0	0	0	429975	1259774	1385216	1671029	557567	2311502	2846434	2388028	4234689	1657991	0	0	0	1	40	10	2016	1
927	1	2017-10-11 14:25:46.977201	2017-10-11 14:25:46.977201	2016-10-04	0	0	0	926100	1378964	1707028	2915320	3822793	2154322	5208888	6580736	5424882	1707394	0	0	0	1	40	10	2016	2
928	1	2017-10-11 14:25:46.985341	2017-10-11 14:25:46.985341	2016-10-05	0	0	0	635040	1881608	2298422	2261769	2925918	1497746	2737497	6419449	7036691	4729015	0	0	0	1	40	10	2016	3
929	1	2017-10-11 14:25:46.993561	2017-10-11 14:25:46.993561	2016-10-06	0	0	0	661500	768088	721808	636640	1128183	1541861	4192100	3585582	1678922	2435841	0	0	0	1	40	10	2016	4
930	1	2017-10-11 14:25:47.001676	2017-10-11 14:25:47.001676	2016-10-07	0	0	0	529200	1236237	735074	1179654	1140764	2404433	1296415	4755778	2392182	2082502	0	0	0	1	40	10	2016	5
931	1	2017-10-11 14:25:47.009802	2017-10-11 14:25:47.009802	2016-10-08	0	0	0	363825	1234484	1978866	1157352	698615	1443480	1655018	3135672	1877905	2648012	0	0	0	1	40	10	2016	6
932	1	2017-10-11 14:25:47.017674	2017-10-11 14:25:47.017674	2016-10-09	0	0	0	496125	344865	512267	1381538	1112395	900602	2755425	5381309	2194102	1500506	0	0	0	1	40	10	2016	0
933	1	2017-10-11 14:25:47.025961	2017-10-11 14:25:47.025961	2016-10-10	0	0	0	562275	751832	1377922	1669851	1211960	3532994	2372064	3714092	2777079	1435282	0	0	0	1	41	10	2016	1
934	1	2017-10-11 14:25:47.034393	2017-10-11 14:25:47.034393	2016-10-11	0	0	0	1256850	1332983	3512057	3376467	2473559	1917663	5409765	5858278	5424257	6835717	0	0	0	1	41	10	2016	2
935	1	2017-10-11 14:25:47.043994	2017-10-11 14:25:47.043994	2016-10-12	0	0	0	1058400	3003310	3200510	2399285	1793116	2640911	4608668	5168088	12090706	3523729	0	0	0	1	41	10	2016	3
936	1	2017-10-11 14:25:47.053483	2017-10-11 14:25:47.053483	2016-10-13	0	0	0	661500	866797	970038	1079552	1252880	1431675	2301627	2729734	2635348	1780434	0	0	0	1	41	10	2016	4
937	1	2017-10-11 14:25:47.062556	2017-10-11 14:25:47.062556	2016-10-14	0	0	0	330750	1136981	1119065	1242300	1356233	2466783	2129474	2367818	2854568	1530785	0	0	0	1	41	10	2016	5
938	1	2017-10-11 14:25:47.070874	2017-10-11 14:25:47.070874	2016-10-15	0	0	0	330750	700688	767986	1217053	734472	2570762	1020632	2924032	2210610	1546772	0	0	0	1	41	10	2016	6
939	1	2017-10-11 14:25:47.079207	2017-10-11 14:25:47.079207	2016-10-16	0	0	0	330750	941675	1528850	1187771	869426	2301474	2206261	1561745	3458361	2190132	0	0	0	1	41	10	2016	0
940	1	2017-10-11 14:25:47.087906	2017-10-11 14:25:47.087906	2016-10-17	0	0	0	496125	841158	1369735	1338920	1540949	1868721	3225525	2909980	3153332	2265955	0	0	0	1	42	10	2016	1
941	1	2017-10-11 14:25:47.096393	2017-10-11 14:25:47.096393	2016-10-18	0	0	0	793800	2448118	1129592	3457552	1609878	2968803	6423714	5256494	6645170	3714974	0	0	0	1	42	10	2016	2
942	1	2017-10-11 14:25:47.104833	2017-10-11 14:25:47.104833	2016-10-19	0	0	0	582120	2082431	2092722	2930471	2384721	2963281	4632836	9542030	12340840	3493835	0	0	0	1	42	10	2016	3
943	1	2017-10-11 14:25:47.11334	2017-10-11 14:25:47.11334	2016-10-20	0	0	0	297675	966461	1440178	1127475	1393045	1371436	3387464	2463294	2085382	1772634	0	0	0	1	42	10	2016	4
944	1	2017-10-11 14:25:47.121798	2017-10-11 14:25:47.121798	2016-10-21	0	0	0	562275	768901	878254	1230122	1277867	2397713	2383852	5232895	2639816	1058729	0	0	0	1	42	10	2016	5
945	1	2017-10-11 14:25:47.130125	2017-10-11 14:25:47.130125	2016-10-22	0	0	0	496125	1801820	1393458	1861677	987367	1117280	3464726	2588781	1338065	1173684	0	0	0	1	42	10	2016	6
946	1	2017-10-11 14:25:47.138993	2017-10-11 14:25:47.138993	2016-10-23	0	0	0	661500	650069	923561	1327232	1008238	1457721	2402098	2491949	2567240	2076154	0	0	0	1	42	10	2016	0
947	1	2017-10-11 14:25:47.148068	2017-10-11 14:25:47.148068	2016-10-24	0	0	0	562275	1050908	1807789	705563	1024527	2449008	2905713	2330031	3640392	2579303	0	0	0	1	43	10	2016	1
948	1	2017-10-11 14:25:47.157119	2017-10-11 14:25:47.157119	2016-10-25	0	0	0	661500	1603477	3631124	1652079	2410556	4537548	4663918	7437539	10123944	3756995	0	0	0	1	43	10	2016	2
949	1	2017-10-11 14:25:47.166024	2017-10-11 14:25:47.166024	2016-10-26	0	0	0	687960	1172432	1147812	2584553	1333113	3840918	4152595	6321862	9515747	2382677	0	0	0	1	43	10	2016	3
950	1	2017-10-11 14:25:47.175401	2017-10-11 14:25:47.175401	2016-10-27	0	0	0	463050	683154	1452851	1706758	1345682	1046960	2082287	2118971	2036835	1218442	0	0	0	1	43	10	2016	4
951	1	2017-10-11 14:25:47.184564	2017-10-11 14:25:47.184564	2016-10-28	0	0	0	463050	703891	1199773	1411033	914960	1237937	3745358	2722565	2526102	2215179	0	0	0	1	43	10	2016	5
952	1	2017-10-11 14:25:47.193443	2017-10-11 14:25:47.193443	2016-10-29	0	0	0	562275	849252	845383	1162871	1182818	1095324	2773125	2903314	1402925	1511792	0	0	0	1	43	10	2016	6
953	1	2017-10-11 14:25:47.201629	2017-10-11 14:25:47.201629	2016-10-30	0	310526	903348	853664	2979282	1011344	972991	742484	1197058	1805111	882402	0	0	0	0	0	1	43	10	2016	0
954	1	2017-10-11 14:25:47.210736	2017-10-11 14:25:47.210736	2016-10-31	0	564593	903348	924803	1330221	3579072	1831345	392347	2200550	1043034	1025120	0	0	0	0	0	1	44	10	2016	1
955	1	2017-10-11 14:25:47.218974	2017-10-11 14:25:47.218974	2016-11-01	0	508133	903348	1209358	1027198	2610256	1035607	748982	1881906	1159112	731638	0	0	0	0	0	1	44	11	2016	2
956	1	2017-10-11 14:25:47.226762	2017-10-11 14:25:47.226762	2016-11-02	0	564593	767846	640248	1448077	2529776	1432906	1068160	1844531	1220635	1475510	0	0	0	0	0	1	44	11	2016	3
957	1	2017-10-11 14:25:47.234652	2017-10-11 14:25:47.234652	2016-11-03	0	254067	429090	569109	1436074	1406337	669888	355863	459411	794845	354366	0	0	0	0	0	1	44	11	2016	4
958	1	2017-10-11 14:25:47.242965	2017-10-11 14:25:47.242965	2016-11-04	0	254067	203253	569109	517941	1213466	635401	325415	818883	905539	571508	0	0	0	0	0	1	44	11	2016	5
959	1	2017-10-11 14:25:47.251329	2017-10-11 14:25:47.251329	2016-11-05	0	536363	451674	924803	1752152	4906589	545633	943073	540628	1986616	1101546	0	0	0	0	0	1	44	11	2016	6
960	1	2017-10-11 14:25:47.259752	2017-10-11 14:25:47.259752	2016-11-06	0	254067	813013	1280497	3002734	3892484	1622747	720001	1145213	1063896	920421	0	0	0	0	0	1	44	11	2016	0
961	1	2017-10-11 14:25:47.268053	2017-10-11 14:25:47.268053	2016-11-07	0	423444	813013	1280497	1498345	3511490	1599309	467385	1831374	1314870	1616854	0	0	0	0	0	1	45	11	2016	1
962	1	2017-10-11 14:25:47.27625	2017-10-11 14:25:47.27625	2016-11-08	0	254067	542009	782526	1682883	2429832	979045	851512	709469	1335085	1318086	0	0	0	0	0	1	45	11	2016	2
963	1	2017-10-11 14:25:47.284457	2017-10-11 14:25:47.284457	2016-11-09	0	395215	677511	1422774	1900289	2866602	1266262	1561828	1633232	1387360	613622	0	0	0	0	0	1	45	11	2016	3
964	1	2017-10-11 14:25:47.292558	2017-10-11 14:25:47.292558	2016-11-10	0	225837	293588	675817	1368864	548128	881788	612886	736304	1007300	512006	0	0	0	0	0	1	45	11	2016	4
965	1	2017-10-11 14:25:47.30098	2017-10-11 14:25:47.30098	2016-11-11	0	282296	383923	640247	713391	853775	318767	612699	586964	577355	419666	0	0	0	0	0	1	45	11	2016	5
966	1	2017-10-11 14:25:47.310739	2017-10-11 14:25:47.310739	2016-11-12	0	254067	903348	1422774	1849766	1804369	1375395	711872	2032371	2448211	780598	0	0	0	0	0	1	45	11	2016	6
967	1	2017-10-11 14:25:47.31989	2017-10-11 14:25:47.31989	2016-11-13	0	366985	903348	1280497	3593822	2386858	1728658	886386	824643	960898	963878	0	0	0	0	0	1	45	11	2016	0
968	1	2017-10-11 14:25:47.328586	2017-10-11 14:25:47.328586	2016-11-14	0	282296	677511	640248	846179	2090404	1635812	890279	1947785	1341520	1313630	0	0	0	0	0	1	46	11	2016	1
969	1	2017-10-11 14:25:47.336959	2017-10-11 14:25:47.336959	2016-11-15	0	282296	677511	1351635	1329995	1841362	1504374	856643	2068161	1244273	1328093	0	0	0	0	0	1	46	11	2016	2
970	1	2017-10-11 14:25:47.345185	2017-10-11 14:25:47.345185	2016-11-16	0	508133	722678	853664	1805329	1634897	1039560	415472	1682952	2349623	1179070	0	0	0	0	0	1	46	11	2016	3
971	1	2017-10-11 14:25:47.353074	2017-10-11 14:25:47.353074	2016-11-17	0	197607	248421	391262	679668	1170346	382868	352489	671639	470021	627418	0	0	0	0	0	1	46	11	2016	4
972	1	2017-10-11 14:25:47.360986	2017-10-11 14:25:47.360986	2016-11-18	0	127033	271004	675817	1861400	664732	512868	544782	447296	781736	532616	0	0	0	0	0	1	46	11	2016	5
973	1	2017-10-11 14:25:47.368875	2017-10-11 14:25:47.368875	2016-11-19	0	254067	451674	1280497	3272794	2899771	831646	402860	1344873	1253967	587034	0	0	0	0	0	1	46	11	2016	6
974	1	2017-10-11 14:25:47.377112	2017-10-11 14:25:47.377112	2016-11-20	0	536363	722678	924803	1388030	1585746	1626640	1084074	1212460	1176104	1119526	0	0	0	0	0	1	46	11	2016	0
975	1	2017-10-11 14:25:47.38504	2017-10-11 14:25:47.38504	2016-11-21	0	564593	813013	640248	1328926	4322595	1007146	1046455	1478399	1912644	819179	0	0	0	0	0	1	47	11	2016	1
976	1	2017-10-11 14:25:47.394233	2017-10-11 14:25:47.394233	2016-11-22	0	366985	858181	924803	3461868	1184460	1339538	942664	1402071	1933286	1125813	0	0	0	0	0	1	47	11	2016	2
977	1	2017-10-11 14:25:47.402689	2017-10-11 14:25:47.402689	2016-11-23	0	451674	632344	1422774	2371235	2579389	1167835	619916	1091909	1790146	670506	0	0	0	0	0	1	47	11	2016	3
978	1	2017-10-11 14:25:47.411171	2017-10-11 14:25:47.411171	2016-11-24	0	155263	406507	675817	1314827	529151	459346	530624	462287	857140	228058	0	0	0	0	0	1	47	11	2016	4
979	1	2017-10-11 14:25:47.419313	2017-10-11 14:25:47.419313	2016-11-25	0	254067	451674	320124	1351881	1531715	528878	230082	430283	394985	500266	0	0	0	0	0	1	47	11	2016	5
980	1	2017-10-11 14:25:47.427441	2017-10-11 14:25:47.427441	2016-11-26	0	395215	496841	1209358	1741270	2727618	1480184	1350097	1682386	1492214	519953	0	0	0	0	0	1	47	11	2016	6
981	1	2017-10-11 14:25:47.436774	2017-10-11 14:25:47.436774	2016-11-27	0	254067	406507	924803	1120683	2803755	1407606	758718	1160412	2234630	912530	0	0	0	0	0	1	47	11	2016	0
982	1	2017-10-11 14:25:47.445738	2017-10-11 14:25:47.445738	2016-11-28	0	508133	813013	711387	2541148	2046029	1332450	864045	1306280	878518	689506	0	0	0	0	0	1	48	11	2016	1
983	1	2017-10-11 14:25:47.454495	2017-10-11 14:25:47.454495	2016-11-29	0	762200	1355022	1493912	3265027	7926428	1833765	1264374	2648918	2447819	1057209	0	0	0	0	0	1	48	11	2016	2
984	1	2017-10-11 14:25:47.463704	2017-10-11 14:25:47.463704	2016-11-30	0	677511	609760	1600620	2319968	4444709	1631057	751487	1538242	2088162	2506312	0	0	0	0	0	1	48	11	2016	3
985	1	2017-10-11 14:25:47.473537	2017-10-11 14:25:47.473537	2016-12-01	0	381100	609760	1173788	4893836	2303076	2063916	2446610	1830174	2194589	1209875	0	0	0	0	0	1	48	12	2016	4
986	1	2017-10-11 14:25:47.481902	2017-10-11 14:25:47.481902	2016-12-02	0	762200	1016267	1387204	1401066	2495933	2025585	1322151	2697278	1272616	2198795	0	0	0	0	0	1	48	12	2016	5
987	1	2017-10-11 14:25:47.49066	2017-10-11 14:25:47.49066	2016-12-03	0	423444	406507	746956	954537	2600322	644428	742656	938139	766532	458978	0	0	0	0	0	1	48	12	2016	6
988	1	2017-10-11 14:25:47.499086	2017-10-11 14:25:47.499086	2016-12-04	0	296411	338756	800310	1733290	1139927	648421	795080	1441177	1117105	484898	0	0	0	0	0	1	48	12	2016	0
989	1	2017-10-11 14:25:47.507606	2017-10-11 14:25:47.507606	2016-12-05	0	381100	1219520	960372	1832381	3364629	1196911	1501652	1540530	2715109	2650086	0	0	0	0	0	1	49	12	2016	1
990	1	2017-10-11 14:25:47.517786	2017-10-11 14:25:47.517786	2016-12-06	0	592822	677511	1600620	2771852	4527283	908817	771953	2284695	1952124	1860474	0	0	0	0	0	1	49	12	2016	2
991	1	2017-10-11 14:25:47.527241	2017-10-11 14:25:47.527241	2016-12-07	0	508133	1219520	1493912	2852262	3833413	1644010	1125645	2343557	2935149	1440686	0	0	0	0	0	1	49	12	2016	3
992	1	2017-10-11 14:25:47.536066	2017-10-11 14:25:47.536066	2016-12-08	0	804544	948515	1600620	2375082	4025614	1486147	1847068	2635175	1839528	1086809	0	0	0	0	0	1	49	12	2016	4
993	1	2017-10-11 14:25:47.544403	2017-10-11 14:25:47.544403	2016-12-09	0	508133	609760	1067080	2292560	2304800	1055539	694606	1344550	1866691	1413430	0	0	0	0	0	1	49	12	2016	5
994	1	2017-10-11 14:25:47.554788	2017-10-11 14:25:47.554788	2016-12-10	0	359928	542009	533540	1511596	3726024	827161	1002499	1581108	598997	799185	0	0	0	0	0	1	49	12	2016	6
995	1	2017-10-11 14:25:47.563547	2017-10-11 14:25:47.563547	2016-12-11	0	232894	508133	960372	816156	1292725	836267	675307	1316075	591352	318698	0	0	0	0	0	1	49	12	2016	0
996	1	2017-10-11 14:25:47.572437	2017-10-11 14:25:47.572437	2016-12-12	0	592822	1084018	1067080	1390176	4083884	1109074	2204023	1786653	2757094	1079323	0	0	0	0	0	1	50	12	2016	1
997	1	2017-10-11 14:25:47.580712	2017-10-11 14:25:47.580712	2016-12-13	0	719855	1219520	1387204	3780293	2598956	1493288	1492654	917348	2598986	2099183	0	0	0	0	0	1	50	12	2016	2
998	1	2017-10-11 14:25:47.589156	2017-10-11 14:25:47.589156	2016-12-14	0	804544	745262	2134160	1979216	2236374	1856473	818039	1863817	3544461	1247605	0	0	0	0	0	1	50	12	2016	3
999	1	2017-10-11 14:25:47.597535	2017-10-11 14:25:47.597535	2016-12-15	0	381100	813013	1067080	2478049	5397918	1491381	1119586	1421805	2936108	1240597	0	0	0	0	0	1	50	12	2016	4
1000	1	2017-10-11 14:25:47.606215	2017-10-11 14:25:47.606215	2016-12-16	0	465789	1355022	2027452	3291584	5322285	2378398	2048457	1609236	2509493	1569246	0	0	0	0	0	1	50	12	2016	5
1001	1	2017-10-11 14:25:47.615325	2017-10-11 14:25:47.615325	2016-12-17	0	275239	643635	960372	1497132	1129665	1318754	587770	1118961	664006	594413	0	0	0	0	0	1	50	12	2016	6
1002	1	2017-10-11 14:25:47.624416	2017-10-11 14:25:47.624416	2016-12-18	0	381100	440382	1067080	802833	2204541	1172344	502636	959852	796045	800078	0	0	0	0	0	1	50	12	2016	0
1003	1	2017-10-11 14:25:47.633568	2017-10-11 14:25:47.633568	2016-12-19	0	635167	1287271	1814036	3329424	3941137	1924771	1056592	2125314	2986315	1533090	0	0	0	0	0	1	51	12	2016	1
1004	1	2017-10-11 14:25:47.642068	2017-10-11 14:25:47.642068	2016-12-20	0	465789	1355022	2134160	1735824	1859403	1636754	1611945	1168566	1549160	1072409	0	0	0	0	0	1	51	12	2016	2
1005	1	2017-10-11 14:25:47.651922	2017-10-11 14:25:47.651922	2016-12-21	0	762200	1355022	960372	2629876	3816260	2053476	2071028	2173912	1434029	1972602	0	0	0	0	0	1	51	12	2016	3
1006	1	2017-10-11 14:25:47.660488	2017-10-11 14:25:47.660488	2016-12-22	0	592822	609760	1067080	3201194	3509094	2792456	853284	1936922	2067230	2197147	0	0	0	0	0	1	51	12	2016	4
1007	1	2017-10-11 14:25:47.668861	2017-10-11 14:25:47.668861	2016-12-23	0	635167	948515	1280496	2214867	3066336	2234408	1345265	1744003	3805195	1590931	0	0	0	0	0	1	51	12	2016	5
1008	1	2017-10-11 14:25:47.677399	2017-10-11 14:25:47.677399	2016-12-24	0	402272	474258	960372	2583853	3220285	688263	910623	467738	854431	663426	0	0	0	0	0	1	51	12	2016	6
1009	1	2017-10-11 14:25:47.685458	2017-10-11 14:25:47.685458	2016-12-25	0	190550	304880	1013726	1290398	2981678	1543430	828240	1390199	978341	457920	0	0	0	0	0	1	51	12	2016	0
1010	1	2017-10-11 14:25:47.694965	2017-10-11 14:25:47.694965	2016-12-26	0	719855	677511	1387204	3115509	1541615	1693753	1298070	1673534	3061534	647339	0	0	0	0	0	1	52	12	2016	1
1011	1	2017-10-11 14:25:47.705496	2017-10-11 14:25:47.705496	2016-12-27	0	719855	1151769	2027452	2650766	2786327	1920832	1842994	2449662	964334	2103699	0	0	0	0	0	1	52	12	2016	2
1012	1	2017-10-11 14:25:47.714795	2017-10-11 14:25:47.714795	2016-12-28	0	550478	745262	1493912	3382415	3531407	2525630	1723828	2356192	2236196	1322632	0	0	0	0	0	1	52	12	2016	3
1013	1	2017-10-11 14:25:47.723497	2017-10-11 14:25:47.723497	2016-12-29	0	846889	1287271	1173788	2689482	2122848	2122688	1434949	1341541	1902597	2518974	0	0	0	0	0	1	52	12	2016	4
1014	1	2017-10-11 14:25:47.73213	2017-10-11 14:25:47.73213	2016-12-30	0	402272	677511	907018	1866116	3622820	1188819	479275	841928	1352849	580497	0	0	0	0	0	1	52	12	2016	5
1015	1	2017-10-11 14:25:47.741832	2017-10-11 14:25:47.741832	2016-12-31	0	232894	643635	853664	992614	2186564	1629176	552160	1081266	1048223	317021	0	0	0	0	0	1	52	12	2016	6
1121	5	2017-10-12 19:10:16.215813	2017-10-12 19:10:16.215813	2016-04-15	0	592822	677511	1920744	4252829	3544031	2986576	829252	1019276	2887762	1767733	0	0	0	0	0	1	15	4	2016	5
1122	5	2017-10-12 19:10:16.223652	2017-10-12 19:10:16.223652	2016-04-16	0	804544	948515	960372	2474021	2875338	2939416	1022549	1720446	4169954	1439544	0	0	0	0	0	1	15	4	2016	6
1123	5	2017-10-12 19:10:16.231595	2017-10-12 19:10:16.231595	2016-04-17	0	550478	1151769	1600620	1603444	3036329	1690232	1259534	2031150	1699852	1984955	0	0	0	0	0	1	15	4	2016	0
1124	5	2017-10-12 19:10:16.240357	2017-10-12 19:10:16.240357	2016-04-18	0	804544	1219520	2027452	2992349	3903009	1453465	1509389	1966844	3555115	1008801	0	0	0	0	0	1	16	4	2016	1
1125	5	2017-10-12 19:10:16.249357	2017-10-12 19:10:16.249357	2016-04-19	0	275239	677511	746956	1896367	903732	763489	555116	683810	830008	868758	0	0	0	0	0	1	16	4	2016	2
1126	5	2017-10-12 19:10:16.257601	2017-10-12 19:10:16.257601	2016-04-20	0	423444	338756	746956	1159648	4008256	1241305	394929	1476696	945303	488937	0	0	0	0	0	1	16	4	2016	3
1127	5	2017-10-12 19:10:16.265835	2017-10-12 19:10:16.265835	2016-04-21	0	592822	1016267	1814036	2304986	3582852	2726759	1137868	3269714	1756656	1533090	0	0	0	0	0	1	16	4	2016	4
1128	5	2017-10-12 19:10:16.274079	2017-10-12 19:10:16.274079	2016-04-22	0	381100	1219520	2134160	1983798	3042659	2529529	1896406	1071186	1881123	1429879	0	0	0	0	0	1	16	4	2016	5
1129	5	2017-10-12 19:10:16.282697	2017-10-12 19:10:16.282697	2016-04-23	0	592822	1355022	1173788	4675334	3816260	2527355	1760374	1534526	1434029	2082191	0	0	0	0	0	1	16	4	2016	6
1130	5	2017-10-12 19:10:16.291325	2017-10-12 19:10:16.291325	2016-04-24	0	635167	745262	2134160	1920716	6380170	1806883	1621240	1775512	2480675	2312786	0	0	0	0	0	1	16	4	2016	0
1131	5	2017-10-12 19:10:16.300219	2017-10-12 19:10:16.300219	2016-04-25	0	465789	813013	1920744	3164096	4245696	1675806	1255580	2280620	3593795	1325776	0	0	0	0	0	1	17	4	2016	1
1132	5	2017-10-12 19:10:16.308233	2017-10-12 19:10:16.308233	2016-04-26	0	402272	542009	640248	1866116	4025356	813402	623058	888702	1352849	787818	0	0	0	0	0	1	17	4	2016	2
1133	5	2017-10-12 19:10:16.316054	2017-10-12 19:10:16.316054	2016-04-27	0	296411	440382	693602	1985228	1789007	1543430	1104320	1390199	1187986	598818	0	0	0	0	0	1	17	4	2016	3
1134	5	2017-10-12 19:10:16.32395	2017-10-12 19:10:16.32395	2016-04-28	0	423444	1016267	1173788	2832281	1695777	2710005	908649	2119809	2104805	863119	0	0	0	0	0	1	17	4	2016	4
1135	5	2017-10-12 19:10:16.334475	2017-10-12 19:10:16.334475	2016-04-29	0	381100	813013	1387204	2494838	1475114	1493981	1454996	2449662	2142964	1217931	0	0	0	0	0	1	17	4	2016	5
1136	5	2017-10-12 19:10:16.344336	2017-10-12 19:10:16.344336	2016-04-30	0	719855	880764	1814036	2601858	7847570	2367779	1379062	1649334	2236196	2094167	0	0	0	0	0	1	17	4	2016	6
1137	5	2017-10-12 19:10:16.35242	2017-10-12 19:10:16.35242	2016-05-01	0	0	0	441000	572713	771028	652410	598470	1011374	1502358	1742749	2396183	1028580	0	0	0	1	17	5	2016	0
1138	5	2017-10-12 19:10:16.360291	2017-10-12 19:10:16.360291	2016-05-02	0	0	0	418950	305482	1027642	1073518	745525	1245797	939403	3399873	1608236	1109382	0	0	0	1	18	5	2016	1
1139	5	2017-10-12 19:10:16.367958	2017-10-12 19:10:16.367958	2016-05-03	0	0	0	286650	463160	394847	1242387	665451	891363	2509875	1443763	2079277	1679541	0	0	0	1	18	5	2016	2
1140	5	2017-10-12 19:10:16.376376	2017-10-12 19:10:16.376376	2016-05-04	0	0	0	308700	473899	925103	415712	562830	931471	2742285	1947564	1836443	1317237	0	0	0	1	18	5	2016	3
1141	5	2017-10-12 19:10:16.385029	2017-10-12 19:10:16.385029	2016-05-05	0	0	0	198450	533478	408441	944460	537458	1787918	1527110	2599586	971039	1788250	0	0	0	1	18	5	2016	4
1142	5	2017-10-12 19:10:16.393895	2017-10-12 19:10:16.393895	2016-05-06	0	0	0	882000	858441	2319682	1754904	1025492	2544883	2936208	4000653	5266898	2738614	0	0	0	1	18	5	2016	5
1143	5	2017-10-12 19:10:16.402094	2017-10-12 19:10:16.402094	2016-05-07	0	0	0	529200	1543077	1790338	2005898	1179789	1370326	2782775	4189739	4928920	1715833	0	0	0	1	18	5	2016	6
1144	5	2017-10-12 19:10:16.410243	2017-10-12 19:10:16.410243	2016-05-08	0	0	0	308700	427392	1141913	950744	943051	1613439	1226067	2695518	2342092	1482833	0	0	0	1	18	5	2016	0
1145	5	2017-10-12 19:10:16.41869	2017-10-12 19:10:16.41869	2016-05-09	0	0	0	308700	382840	1279559	384872	367291	1913925	2415080	2099611	1418426	1235659	0	0	0	1	19	5	2016	1
1146	5	2017-10-12 19:10:16.427778	2017-10-12 19:10:16.427778	2016-05-10	0	0	0	264600	246982	581015	1245301	791773	1001530	1044252	1206632	1171504	1658086	0	0	0	1	19	5	2016	2
1147	5	2017-10-12 19:10:16.436749	2017-10-12 19:10:16.436749	2016-05-11	0	0	0	396900	629309	709103	681354	443833	1189122	1150786	1582108	1110970	831371	0	0	0	1	19	5	2016	3
1148	5	2017-10-12 19:10:16.445093	2017-10-12 19:10:16.445093	2016-05-12	0	0	0	374850	581874	690880	956817	507026	851680	2228065	2095846	1814131	1749250	0	0	0	1	19	5	2016	4
1149	5	2017-10-12 19:10:16.454207	2017-10-12 19:10:16.454207	2016-05-13	0	0	0	749700	1022087	1785019	1878548	1511166	1298363	4368066	3578920	3373083	3094948	0	0	0	1	19	5	2016	5
1150	5	2017-10-12 19:10:16.462563	2017-10-12 19:10:16.462563	2016-05-14	0	0	0	388080	536922	696704	1953341	1508895	2140569	2769623	2865750	4341788	2588189	0	0	0	1	19	5	2016	6
1151	5	2017-10-12 19:10:16.47105	2017-10-12 19:10:16.47105	2016-05-15	0	0	0	308700	668030	673688	426176	809068	894271	1013297	1238921	1244509	1151589	0	0	0	1	19	5	2016	0
1152	5	2017-10-12 19:10:16.47939	2017-10-12 19:10:16.47939	2016-05-16	0	0	0	308700	650426	996493	486300	994833	702378	2438559	928921	846652	917017	0	0	0	1	20	5	2016	1
1153	5	2017-10-12 19:10:16.487889	2017-10-12 19:10:16.487889	2016-05-17	0	0	0	242550	328955	714128	1111026	363667	859694	1897952	1222128	2152139	1462100	0	0	0	1	20	5	2016	2
1154	5	2017-10-12 19:10:16.496482	2017-10-12 19:10:16.496482	2016-05-18	0	0	0	441000	353772	377068	987244	592911	671184	1520533	2948613	2316469	540150	0	0	0	1	20	5	2016	3
1155	5	2017-10-12 19:10:16.505361	2017-10-12 19:10:16.505361	2016-05-19	0	0	0	264600	955904	457097	804045	567454	1057712	1647790	1308965	854277	957895	0	0	0	1	20	5	2016	4
1156	5	2017-10-12 19:10:16.513669	2017-10-12 19:10:16.513669	2016-05-20	0	0	0	749700	2146981	1357498	1697753	2515099	2463029	2326973	2215679	4885169	3473662	0	0	0	1	20	5	2016	5
1157	5	2017-10-12 19:10:16.521892	2017-10-12 19:10:16.521892	2016-05-21	0	0	0	493920	888959	653790	1364848	1393649	1341716	2940852	4631732	3310284	1859837	0	0	0	1	20	5	2016	6
1158	5	2017-10-12 19:10:16.530084	2017-10-12 19:10:16.530084	2016-05-22	0	0	0	198450	849842	348105	659478	1003078	1116143	1846912	1433686	2003805	1643322	0	0	0	1	20	5	2016	0
1159	5	2017-10-12 19:10:16.538624	2017-10-12 19:10:16.538624	2016-05-23	0	0	0	374850	770055	669593	566724	1157595	1407852	1190327	2349586	1022317	868375	0	0	0	1	21	5	2016	1
1160	5	2017-10-12 19:10:16.547487	2017-10-12 19:10:16.547487	2016-05-24	0	0	0	352800	542794	778646	846390	1170948	1155750	1534156	1857307	2758511	1337946	0	0	0	1	21	5	2016	2
1161	5	2017-10-12 19:10:16.555672	2017-10-12 19:10:16.555672	2016-05-25	0	0	0	198450	612127	504390	692580	880128	1190928	1897489	1444937	1952839	1267449	0	0	0	1	21	5	2016	3
1162	5	2017-10-12 19:10:16.564062	2017-10-12 19:10:16.564062	2016-05-26	0	0	0	308700	786296	754587	487253	376587	1092972	2334892	2322540	1682604	1520172	0	0	0	1	21	5	2016	4
1163	5	2017-10-12 19:10:16.57227	2017-10-12 19:10:16.57227	2016-05-27	0	0	0	882000	1036832	1031364	2376385	1144181	2322649	2989132	5796582	4622405	1451882	0	0	0	1	21	5	2016	5
1164	5	2017-10-12 19:10:16.580597	2017-10-12 19:10:16.580597	2016-05-28	0	0	0	458640	571114	1838173	1320114	1573127	2274107	3081203	4121222	3625863	1898440	0	0	0	1	21	5	2016	6
1165	5	2017-10-12 19:10:16.589052	2017-10-12 19:10:16.589052	2016-05-29	0	0	0	529200	1105018	682324	1133142	1117391	1006032	3978324	5180731	2862809	2318440	0	0	0	1	21	5	2016	0
1166	5	2017-10-12 19:10:16.597448	2017-10-12 19:10:16.597448	2016-05-30	0	0	0	396900	741846	1494582	884701	1192953	1254845	1799179	3393874	3367802	1218292	0	0	0	1	22	5	2016	1
1167	5	2017-10-12 19:10:16.606301	2017-10-12 19:10:16.606301	2016-05-31	0	0	0	297675	454399	728220	1191614	689182	1644410	1304959	3211513	2392908	2028088	0	0	0	1	22	5	2016	2
1168	5	2017-10-12 19:10:16.614758	2017-10-12 19:10:16.614758	2016-06-01	0	0	0	496125	1024022	865461	1737504	1866560	1080789	3373554	2624471	2843256	1027754	0	0	0	1	22	6	2016	3
1169	5	2017-10-12 19:10:16.623394	2017-10-12 19:10:16.623394	2016-06-02	0	0	0	330750	673002	827220	2128092	1341759	2551344	2937243	4484475	2431155	946201	0	0	0	1	22	6	2016	4
1170	5	2017-10-12 19:10:16.632011	2017-10-12 19:10:16.632011	2016-06-03	0	0	0	429975	1304787	952830	759438	1377906	1309797	3199777	3068689	1758362	1833928	0	0	0	1	22	6	2016	5
1171	5	2017-10-12 19:10:16.640099	2017-10-12 19:10:16.640099	2016-06-04	0	0	0	297675	969057	1385216	2228038	681471	1903590	3622734	1876307	4234689	2348820	0	0	0	1	22	6	2016	6
1172	5	2017-10-12 19:10:16.648549	2017-10-12 19:10:16.648549	2016-06-05	0	0	0	661500	1034223	1097375	2915320	3185661	4069275	4006837	9322710	6102992	1707394	0	0	0	1	22	6	2016	0
1173	5	2017-10-12 19:10:16.656756	2017-10-12 19:10:16.656756	2016-06-06	0	0	0	687960	1549559	1216812	3906693	2600816	2246619	2737497	8712110	7974916	3484537	0	0	0	1	23	6	2016	1
1174	5	2017-10-12 19:10:16.664772	2017-10-12 19:10:16.664772	2016-06-07	0	0	0	496125	1396524	769928	1099652	1041400	1632559	4192100	4097808	2425110	2435841	0	0	0	1	23	6	2016	2
1175	5	2017-10-12 19:10:16.673028	2017-10-12 19:10:16.673028	2016-06-08	0	0	0	529200	1236237	840085	884741	633758	1771687	1728553	2753345	3697009	2205002	0	0	0	1	23	6	2016	3
1176	5	2017-10-12 19:10:16.682325	2017-10-12 19:10:16.682325	2016-06-09	0	0	0	595350	1322661	1484150	1928920	989704	1876524	2344609	3135672	2889084	1869185	0	0	0	1	23	6	2016	4
1177	5	2017-10-12 19:10:16.690333	2017-10-12 19:10:16.690333	2016-06-10	0	0	0	628425	344865	512267	1381538	1483194	1100736	2020645	5098082	3037988	1500506	0	0	0	1	23	6	2016	5
1178	5	2017-10-12 19:10:16.698463	2017-10-12 19:10:16.698463	2016-06-11	0	0	0	463050	578332	1464042	939291	1118732	3179695	3162752	2403236	2036525	1722338	0	0	0	1	23	6	2016	6
1179	5	2017-10-12 19:10:16.706503	2017-10-12 19:10:16.706503	2016-06-12	0	0	0	992250	1599580	3512057	2250978	2343371	3622253	7868749	4602932	7361491	3957521	0	0	0	1	23	6	2016	0
1180	5	2017-10-12 19:10:16.714828	2017-10-12 19:10:16.714828	2016-06-13	0	0	0	793800	3003310	2189823	1349598	1972428	1864172	3291906	4698262	10881635	3731008	0	0	0	1	24	6	2016	1
1181	5	2017-10-12 19:10:16.723693	2017-10-12 19:10:16.723693	2016-06-14	0	0	0	529200	770486	1616730	1668399	1879321	1272600	3009819	2890307	2240046	1602391	0	0	0	1	24	6	2016	2
1182	5	2017-10-12 19:10:16.732475	2017-10-12 19:10:16.732475	2016-06-15	0	0	0	297675	1042232	1463392	931725	642426	2902098	2839299	2367818	1712741	2119549	0	0	0	1	24	6	2016	3
1183	5	2017-10-12 19:10:16.740458	2017-10-12 19:10:16.740458	2016-06-16	0	0	0	297675	656895	1023982	1217053	1162914	1928072	2268072	1538964	4019290	2671696	0	0	0	1	24	6	2016	4
1184	5	2017-10-12 19:10:16.748433	2017-10-12 19:10:16.748433	2016-06-17	0	0	0	628425	889360	1698722	1187771	1159234	1956253	1045071	3470544	3458361	1533092	0	0	0	1	24	6	2016	5
1185	5	2017-10-12 19:10:16.75637	2017-10-12 19:10:16.75637	2016-06-18	0	0	0	297675	643239	1956764	1102640	1027299	1437478	4714229	2014601	4054284	3776592	0	0	0	1	24	6	2016	6
1186	5	2017-10-12 19:10:16.764252	2017-10-12 19:10:16.764252	2016-06-19	0	0	0	793800	1989096	1506122	2593164	1317173	2968803	6423714	5256494	7383522	2653553	0	0	0	1	24	6	2016	0
1187	5	2017-10-12 19:10:16.77262	2017-10-12 19:10:16.77262	2016-06-20	0	0	0	793800	1851050	1770765	1953647	2702684	2051502	2779702	4293914	6787462	2466236	0	0	0	1	25	6	2016	1
1188	5	2017-10-12 19:10:16.781035	2017-10-12 19:10:16.781035	2016-06-21	0	0	0	463050	1288614	1329395	1127475	1006088	1620788	1604588	3284392	3791604	1063580	0	0	0	1	25	6	2016	2
1189	5	2017-10-12 19:10:16.789871	2017-10-12 19:10:16.789871	2016-06-22	0	0	0	429975	845791	693359	1640163	1460419	1998095	1950424	4360746	2474828	1588093	0	0	0	1	25	6	2016	3
1190	5	2017-10-12 19:10:16.798159	2017-10-12 19:10:16.798159	2016-06-23	0	0	0	396900	991001	1194392	1758251	1256648	1862133	2598545	3059468	1581350	1813875	0	0	0	1	25	6	2016	4
1191	5	2017-10-12 19:10:16.806475	2017-10-12 19:10:16.806475	2016-06-24	0	0	0	330750	464335	1259402	1106027	1310709	1629218	1681469	3530261	2888145	2335673	0	0	0	1	25	6	2016	5
1192	5	2017-10-12 19:10:16.815403	2017-10-12 19:10:16.815403	2016-06-25	0	0	0	429975	1138484	1707356	1117141	683018	1795939	2392940	4024599	5200560	1576241	0	0	0	1	25	6	2016	6
1193	5	2017-10-12 19:10:16.824664	2017-10-12 19:10:16.824664	2016-06-26	0	0	0	1190700	2096855	2219020	3304157	2582739	4298729	3815933	8312544	8605352	5009326	0	0	0	1	25	6	2016	0
1194	5	2017-10-12 19:10:16.833577	2017-10-12 19:10:16.833577	2016-06-27	0	0	0	476280	1103466	1589278	2067642	2399603	2816673	6228893	6321862	5286526	4332140	0	0	0	1	26	6	2016	1
1195	5	2017-10-12 19:10:16.842244	2017-10-12 19:10:16.842244	2016-06-28	0	0	0	562275	956416	2075502	768041	1435394	1861262	2839482	2875747	1765257	2193196	0	0	0	1	26	6	2016	2
1196	5	2017-10-12 19:10:16.850846	2017-10-12 19:10:16.850846	2016-06-29	0	0	0	429975	653613	1319750	1411033	609973	2352080	1685411	3856967	2331786	1353721	0	0	0	1	26	6	2016	3
1197	5	2017-10-12 19:10:16.859075	2017-10-12 19:10:16.859075	2016-06-30	0	0	0	396900	1466889	603845	1453589	1005395	1394049	1386563	2903314	2423233	1279209	0	0	0	1	26	6	2016	4
1198	5	2017-10-12 19:10:16.867903	2017-10-12 19:10:16.867903	2016-07-01	0	564593	903348	1280497	2804030	1123716	1729762	742484	1122242	1698928	1250070	0	0	0	0	0	1	26	7	2016	5
1199	5	2017-10-12 19:10:16.875996	2017-10-12 19:10:16.875996	2016-07-02	0	395215	406507	1422774	1625825	3390700	1400441	392347	1100275	1970176	512560	0	0	0	0	0	1	26	7	2016	6
1200	5	2017-10-12 19:10:16.884486	2017-10-12 19:10:16.884486	2016-07-03	0	254067	858181	995942	770398	3614200	1109579	481488	1223239	1931853	798150	0	0	0	0	0	1	26	7	2016	0
1201	5	2017-10-12 19:10:16.892697	2017-10-12 19:10:16.892697	2016-07-04	0	395215	496841	711387	1143219	3794664	1432906	734360	1650370	1708889	1752169	0	0	0	0	0	1	27	7	2016	1
1202	5	2017-10-12 19:10:16.900796	2017-10-12 19:10:16.900796	2016-07-05	0	141148	316172	711386	933448	1489063	435427	391449	735058	496778	324836	0	0	0	0	0	1	27	7	2016	2
1203	5	2017-10-12 19:10:16.909427	2017-10-12 19:10:16.909427	2016-07-06	0	183493	383923	569109	554937	2305585	688351	348659	387892	855231	257179	0	0	0	0	0	1	27	7	2016	3
1204	5	2017-10-12 19:10:16.91869	2017-10-12 19:10:16.91869	2016-07-07	0	423444	451674	1067081	1752152	3873623	1151892	1054023	720838	1862453	1040349	0	0	0	0	0	1	27	7	2016	4
1205	5	2017-10-12 19:10:16.927434	2017-10-12 19:10:16.927434	2016-07-08	0	423444	677511	1067081	1801640	2530115	1217060	840001	1063412	1182107	1748800	0	0	0	0	0	1	27	7	2016	5
1206	5	2017-10-12 19:10:16.936477	2017-10-12 19:10:16.936477	2016-07-09	0	310526	542009	782526	1831311	2458043	1787463	722322	1716914	1643588	936074	0	0	0	0	0	1	27	7	2016	6
1207	5	2017-10-12 19:10:16.944726	2017-10-12 19:10:16.944726	2016-07-10	0	423444	903348	853664	1795075	1619888	1602074	982514	1135150	1335085	593139	0	0	0	0	0	1	27	7	2016	0
1208	5	2017-10-12 19:10:16.953713	2017-10-12 19:10:16.953713	2016-07-11	0	564593	677511	995942	2245796	2866602	1415234	780914	1361027	1127230	1090883	0	0	0	0	0	1	28	7	2016	1
1209	5	2017-10-12 19:10:16.999107	2017-10-12 19:10:16.999107	2016-07-12	0	127033	383923	569109	1271088	548128	979764	612886	441782	554015	448006	0	0	0	0	0	1	28	7	2016	2
1210	5	2017-10-12 19:10:17.008011	2017-10-12 19:10:17.008011	2016-07-13	0	183493	203253	675817	1232220	919450	289788	386968	448855	866032	230816	0	0	0	0	0	1	28	7	2016	3
1211	5	2017-10-12 19:10:17.01647	2017-10-12 19:10:17.01647	2016-07-14	0	479904	722678	640248	2466354	1904611	1618112	533904	2032371	1803945	1405076	0	0	0	0	0	1	28	7	2016	4
1212	5	2017-10-12 19:10:17.025839	2017-10-12 19:10:17.025839	2016-07-15	0	536363	451674	853664	1702337	1404034	1836699	1227303	1566822	1404389	680384	0	0	0	0	0	1	28	7	2016	5
1213	5	2017-10-12 19:10:17.03416	2017-10-12 19:10:17.03416	2016-07-16	0	366985	406507	1422774	769254	1916203	1308650	771575	1230180	1878128	985223	0	0	0	0	0	1	28	7	2016	6
1214	5	2017-10-12 19:10:17.043219	2017-10-12 19:10:17.043219	2016-07-17	0	338756	903348	640248	1579369	969138	1002916	856643	1523908	1339986	1577110	0	0	0	0	0	1	28	7	2016	0
1215	5	2017-10-12 19:10:17.051562	2017-10-12 19:10:17.051562	2016-07-18	0	451674	451674	711387	3410066	1471407	1732600	784780	1346362	2610692	682619	0	0	0	0	0	1	29	7	2016	1
1216	5	2017-10-12 19:10:17.060214	2017-10-12 19:10:17.060214	2016-07-19	0	268181	429090	711386	1057262	1300384	382868	377667	522386	509189	495330	0	0	0	0	0	1	29	7	2016	2
1217	5	2017-10-12 19:10:17.068169	2017-10-12 19:10:17.068169	2016-07-20	0	211722	225837	462401	1137522	775520	871876	374538	745494	825166	252292	0	0	0	0	0	1	29	7	2016	3
1218	5	2017-10-12 19:10:17.076127	2017-10-12 19:10:17.076127	2016-07-21	0	479904	767846	1209358	2310208	2899771	756042	626671	1434531	1157508	640400	0	0	0	0	0	1	29	7	2016	4
1219	5	2017-10-12 19:10:17.084606	2017-10-12 19:10:17.084606	2016-07-22	0	508133	677511	924803	1295494	1387527	1148216	1029870	1558877	955585	783668	0	0	0	0	0	1	29	7	2016	5
1220	5	2017-10-12 19:10:17.094509	2017-10-12 19:10:17.094509	2016-07-23	0	564593	858181	1209358	1550413	4550100	1342861	1169568	1137230	2550192	945207	0	0	0	0	0	1	29	7	2016	6
1221	5	2017-10-12 19:10:17.10309	2017-10-12 19:10:17.10309	2016-07-24	0	310526	632344	1422774	2884890	1615173	1339538	1053565	811725	1449965	1125813	0	0	0	0	0	1	29	7	2016	0
1222	5	2017-10-12 19:10:17.111377	2017-10-12 19:10:17.111377	2016-07-25	0	451674	903348	995942	2223033	1785731	1305228	676272	1343888	2429484	737557	0	0	0	0	0	1	30	7	2016	1
1223	5	2017-10-12 19:10:17.119489	2017-10-12 19:10:17.119489	2016-07-26	0	127033	271004	355693	1784408	846642	561422	707498	396246	655460	247062	0	0	0	0	0	1	30	7	2016	2
1224	5	2017-10-12 19:10:17.127774	2017-10-12 19:10:17.127774	2016-07-27	0	169378	406507	604678	1062192	1370482	610244	322115	297888	451411	375200	0	0	0	0	0	1	30	7	2016	3
1225	5	2017-10-12 19:10:17.136717	2017-10-12 19:10:17.136717	2016-07-28	0	310526	858181	1067081	1741270	3068570	740092	750054	1775852	1404437	883920	0	0	0	0	0	1	30	7	2016	4
1226	5	2017-10-12 19:10:17.14528	2017-10-12 19:10:17.14528	2016-07-29	0	310526	813013	1280497	1222564	4486008	774183	875444	1657732	2482922	608353	0	0	0	0	0	1	30	7	2016	5
1227	5	2017-10-12 19:10:17.154563	2017-10-12 19:10:17.154563	2016-07-30	0	254067	451674	711387	3176435	3410048	705415	987480	1654621	1659423	583428	0	0	0	0	0	1	30	7	2016	6
1228	5	2017-10-12 19:10:17.16313	2017-10-12 19:10:17.16313	2016-07-31	0	719855	948515	2027452	1632514	7926428	1833765	1264374	2025643	3012701	961099	0	0	0	0	0	1	30	7	2016	0
1229	5	2017-10-12 19:10:17.171738	2017-10-12 19:10:17.171738	2016-08-01	0	423444	1151769	1600620	2442072	6296671	2213578	918485	1357272	3132243	2506312	0	0	0	0	0	1	31	8	2016	1
1230	5	2017-10-12 19:10:17.180442	2017-10-12 19:10:17.180442	2016-08-02	0	635167	677511	1067080	4404452	4350254	2063916	1957288	2440232	1901977	967900	0	0	0	0	0	1	31	8	2016	2
1231	5	2017-10-12 19:10:17.189029	2017-10-12 19:10:17.189029	2016-08-03	0	762200	880764	1280496	1401066	4714540	1237858	1830670	2292686	1272616	1588019	0	0	0	0	0	1	31	8	2016	3
1232	5	2017-10-12 19:10:17.198411	2017-10-12 19:10:17.198411	2016-08-04	0	338756	677511	907018	1431806	1682561	1054519	649824	938139	530676	516350	0	0	0	0	0	1	31	8	2016	4
1233	5	2017-10-12 19:10:17.206417	2017-10-12 19:10:17.206417	2016-08-05	0	338756	542009	533540	1733290	1709891	1026667	715572	1213622	868860	484898	0	0	0	0	0	1	31	8	2016	5
1234	5	2017-10-12 19:10:17.214229	2017-10-12 19:10:17.214229	2016-08-06	0	423444	609760	2027452	2443174	3882264	2127842	1301431	2772954	3968236	1855060	0	0	0	0	0	1	31	8	2016	6
1235	5	2017-10-12 19:10:17.222109	2017-10-12 19:10:17.222109	2016-08-07	0	423444	677511	1173788	4619754	6268545	1454107	926344	1776985	1722462	1993365	0	0	0	0	0	1	31	8	2016	0
1236	5	2017-10-12 19:10:17.230097	2017-10-12 19:10:17.230097	2016-08-08	0	423444	677511	1707328	4436852	6969842	1174293	1227977	1318251	2935149	1248594	0	0	0	0	0	1	32	8	2016	1
1237	5	2017-10-12 19:10:17.238707	2017-10-12 19:10:17.238707	2016-08-09	0	550478	880764	1067080	3223325	1811526	1733838	972141	1664321	2069469	2052862	0	0	0	0	0	1	32	8	2016	2
1238	5	2017-10-12 19:10:17.247383	2017-10-12 19:10:17.247383	2016-08-10	0	719855	609760	1600620	2547289	2736950	1477755	1199774	1222318	2400032	1766787	0	0	0	0	0	1	32	8	2016	3
1239	5	2017-10-12 19:10:17.257187	2017-10-12 19:10:17.257187	2016-08-11	0	190550	575884	533540	1511596	2608217	413581	779722	1248243	855710	423098	0	0	0	0	0	1	32	8	2016	4
1240	5	2017-10-12 19:10:17.26519	2017-10-12 19:10:17.26519	2016-08-12	0	275239	338756	960372	816156	1093844	1064340	434126	1096730	532217	354109	0	0	0	0	0	1	32	8	2016	5
1241	5	2017-10-12 19:10:17.272864	2017-10-12 19:10:17.272864	2016-08-13	0	423444	609760	1493912	2780352	5309049	1774518	1346903	2436345	2594912	2158646	0	0	0	0	0	1	32	8	2016	6
1242	5	2017-10-12 19:10:17.281088	2017-10-12 19:10:17.281088	2016-08-14	0	762200	880764	1067080	2598951	2835224	1493288	1492654	1426986	2021433	1988699	0	0	0	0	0	1	32	8	2016	0
1243	5	2017-10-12 19:10:17.29	2017-10-12 19:10:17.29	2016-08-15	0	465789	745262	960372	1814282	1916892	1547061	1295228	2007187	4169954	1247605	0	0	0	0	0	1	33	8	2016	1
1244	5	2017-10-12 19:10:17.298125	2017-10-12 19:10:17.298125	2016-08-16	0	635167	677511	1387204	1311908	5060549	1193105	1119586	1828035	1390788	1488716	0	0	0	0	0	1	33	8	2016	2
1245	5	2017-10-12 19:10:17.306023	2017-10-12 19:10:17.306023	2016-08-17	0	381100	813013	1173788	2992349	4967466	1321332	2156270	3576080	4182488	1905513	0	0	0	0	0	1	33	8	2016	3
1246	5	2017-10-12 19:10:17.314114	2017-10-12 19:10:17.314114	2016-08-18	0	402272	440382	586894	1996176	903732	694081	522462	621645	788508	731586	0	0	0	0	0	1	33	8	2016	4
1247	5	2017-10-12 19:10:17.322745	2017-10-12 19:10:17.322745	2016-08-19	0	275239	677511	693602	1338056	3407018	896498	359026	886018	646786	844527	0	0	0	0	0	1	33	8	2016	5
1248	5	2017-10-12 19:10:17.331639	2017-10-12 19:10:17.331639	2016-08-20	0	677511	948515	1600620	3329424	6807419	2887157	894039	2288800	3337646	2122740	0	0	0	0	0	1	33	8	2016	6
1249	5	2017-10-12 19:10:17.341046	2017-10-12 19:10:17.341046	2016-08-21	0	677511	609760	2027452	1363861	2535549	1636754	853383	1655469	1106543	2263975	0	0	0	0	0	1	33	8	2016	0
1250	5	2017-10-12 19:10:17.349505	2017-10-12 19:10:17.349505	2016-08-22	0	423444	1016267	1814036	2629876	2098943	2685315	931963	1150895	2151043	1315068	0	0	0	0	0	1	34	8	2016	1
1251	5	2017-10-12 19:10:17.358176	2017-10-12 19:10:17.358176	2016-08-23	0	677511	813013	1280496	2881075	6061162	1642621	767956	2421153	2480675	1387672	0	0	0	0	0	1	34	8	2016	2
1252	5	2017-10-12 19:10:17.366411	2017-10-12 19:10:17.366411	2016-08-24	0	804544	1016267	2027452	2847686	2122848	1005484	1793686	2683082	3593795	1988664	0	0	0	0	0	1	34	8	2016	3
1253	5	2017-10-12 19:10:17.375021	2017-10-12 19:10:17.375021	2016-08-25	0	381100	474258	586894	2296758	2213946	938541	575130	795155	1139242	580497	0	0	0	0	0	1	34	8	2016	4
1254	5	2017-10-12 19:10:17.384265	2017-10-12 19:10:17.384265	2016-08-26	0	338756	508133	693602	1687444	2981678	1028953	496944	1467433	698815	598818	0	0	0	0	0	1	34	8	2016	5
1255	5	2017-10-12 19:10:17.392591	2017-10-12 19:10:17.392591	2016-08-27	0	423444	813013	1707328	5664562	2774907	2710005	843746	2231378	2487497	719266	0	0	0	0	0	1	34	8	2016	6
1256	5	2017-10-12 19:10:17.400982	2017-10-12 19:10:17.400982	2016-08-28	0	381100	880764	1920744	2806693	1475114	1814119	1260996	2062874	1285778	1107210	0	0	0	0	0	1	34	8	2016	0
1257	5	2017-10-12 19:10:17.409042	2017-10-12 19:10:17.409042	2016-08-29	0	762200	813013	1173788	5203716	3923785	2367779	1292871	2238382	1118098	2204386	0	0	0	0	0	1	35	8	2016	1
1258	5	2017-10-12 19:10:17.417158	2017-10-12 19:10:17.417158	2016-08-30	0	0	0	374850	715892	936248	1008270	448853	1746919	845077	1307062	1387264	968075	0	0	0	1	35	8	2016	2
1259	5	2017-10-12 19:10:17.426599	2017-10-12 19:10:17.426599	2016-08-31	0	0	0	352800	644906	1580988	820925	585770	1465644	1622606	1968348	1438948	554691	0	0	0	1	35	8	2016	3
1260	5	2017-10-12 19:10:17.435376	2017-10-12 19:10:17.435376	2016-09-01	0	0	0	396900	544894	710725	950061	855580	1053429	2370438	2221174	1429503	1049713	0	0	0	1	35	9	2016	4
1261	5	2017-10-12 19:10:17.444697	2017-10-12 19:10:17.444697	2016-09-02	0	0	0	418950	513391	996265	461902	692714	1608905	2020631	1731168	3060738	1722540	0	0	0	1	35	9	2016	5
1262	5	2017-10-12 19:10:17.453321	2017-10-12 19:10:17.453321	2016-09-03	0	0	0	418950	889130	502696	839520	1074916	1688590	859000	2189125	1059316	1694131	0	0	0	1	35	9	2016	6
1263	5	2017-10-12 19:10:17.461388	2017-10-12 19:10:17.461388	2016-09-04	0	0	0	661500	801212	1228067	1169936	1367322	3132163	4991554	4500734	3862392	1825742	0	0	0	1	35	9	2016	0
1264	5	2017-10-12 19:10:17.470594	2017-10-12 19:10:17.470594	2016-09-05	0	0	0	705600	1285898	2106280	2111472	1651705	1475736	3524848	2992671	3080575	3260083	0	0	0	1	36	9	2016	1
1265	5	2017-10-12 19:10:17.479261	2017-10-12 19:10:17.479261	2016-09-06	0	0	0	396900	641088	837403	671113	766229	1254897	2452134	1925370	1171046	1482833	0	0	0	1	36	9	2016	2
1266	5	2017-10-12 19:10:17.487481	2017-10-12 19:10:17.487481	2016-09-07	0	0	0	396900	765680	1620774	692770	652962	1007329	1704762	1799666	2245842	823772	0	0	0	1	36	9	2016	3
1267	5	2017-10-12 19:10:17.49542	2017-10-12 19:10:17.49542	2016-09-08	0	0	0	352800	202076	788521	732530	1096301	1078571	1423980	1809948	991273	1036304	0	0	0	1	36	9	2016	4
1268	5	2017-10-12 19:10:17.505172	2017-10-12 19:10:17.505172	2016-09-09	0	0	0	441000	587355	780013	817625	621366	1684590	2173707	3164216	1507745	1053069	0	0	0	1	36	9	2016	5
1269	5	2017-10-12 19:10:17.516074	2017-10-12 19:10:17.516074	2016-09-10	0	0	0	264600	308051	652497	883216	788707	851680	1172666	2095846	1050287	1137013	0	0	0	1	36	9	2016	6
1270	5	2017-10-12 19:10:17.525165	2017-10-12 19:10:17.525165	2016-09-11	0	0	0	749700	1135652	1785019	1589541	1108188	1168527	3448473	4129523	6746166	4047239	0	0	0	1	36	9	2016	0
1271	5	2017-10-12 19:10:17.534207	2017-10-12 19:10:17.534207	2016-09-12	0	0	0	599760	572717	886714	1263926	1508895	1427046	3621814	3403079	5499598	2243097	0	0	0	1	37	9	2016	1
1272	5	2017-10-12 19:10:17.543198	2017-10-12 19:10:17.543198	2016-09-13	0	0	0	396900	300614	561407	736123	1146179	1463353	1914006	2340184	1244509	1295537	0	0	0	1	37	9	2016	2
1273	5	2017-10-12 19:10:17.551574	2017-10-12 19:10:17.551574	2016-09-14	0	0	0	396900	447168	839152	534930	1170392	819441	1219280	1341774	1523974	1528362	0	0	0	1	37	9	2016	3
1274	5	2017-10-12 19:10:17.561296	2017-10-12 19:10:17.561296	2016-09-15	0	0	0	396900	694460	1348909	888821	509134	1547449	2481937	1466554	2271703	774053	0	0	0	1	37	9	2016	4
1275	5	2017-10-12 19:10:17.569775	2017-10-12 19:10:17.569775	2016-09-16	0	0	0	242550	321611	534179	493622	790548	976267	2154089	1561030	2180206	594165	0	0	0	1	37	9	2016	5
1276	5	2017-10-12 19:10:17.578244	2017-10-12 19:10:17.578244	2016-09-17	0	0	0	198450	637270	457097	742195	1134908	987197	2353986	1454406	949197	1117544	0	0	0	1	37	9	2016	6
1277	5	2017-10-12 19:10:17.587018	2017-10-12 19:10:17.587018	2016-09-18	0	0	0	882000	2033982	1018123	1320474	1257549	3599812	2908716	4923732	3735718	2508756	0	0	0	1	37	9	2016	0
1278	5	2017-10-12 19:10:17.595675	2017-10-12 19:10:17.595675	2016-09-19	0	0	0	529200	1007486	708273	1204278	1509786	2317510	2940852	4400145	4514024	2289030	0	0	0	1	38	9	2016	1
1279	5	2017-10-12 19:10:17.604084	2017-10-12 19:10:17.604084	2016-09-20	0	0	0	330750	715656	632918	732753	626924	1514766	2077776	2095387	2270979	1540614	0	0	0	1	38	9	2016	2
1280	5	2017-10-12 19:10:17.614648	2017-10-12 19:10:17.614648	2016-09-21	0	0	0	396900	462033	1004390	642287	680938	1501709	2248396	3434011	1635707	1135568	0	0	0	1	38	9	2016	3
1281	5	2017-10-12 19:10:17.623635	2017-10-12 19:10:17.623635	2016-09-22	0	0	0	242550	922750	973308	716176	761116	1541000	2360240	1031837	2613326	1242379	0	0	0	1	38	9	2016	4
1282	5	2017-10-12 19:10:17.63188	2017-10-12 19:10:17.63188	2016-09-23	0	0	0	418950	856978	825365	692580	645427	980764	2189411	1324525	1255397	1657434	0	0	0	1	38	9	2016	5
1283	5	2017-10-12 19:10:17.640538	2017-10-12 19:10:17.640538	2016-09-24	0	0	0	352800	943555	635442	828330	338928	1490417	1785506	2156644	2664123	1140129	0	0	0	1	38	9	2016	6
1284	5	2017-10-12 19:10:17.64841	2017-10-12 19:10:17.64841	2016-09-25	0	0	0	617400	829465	1687687	2244364	1496236	3037310	3985509	5455606	4237204	1451882	0	0	0	1	38	9	2016	0
1285	5	2017-10-12 19:10:17.656382	2017-10-12 19:10:17.656382	2016-09-26	0	0	0	388080	634571	1838173	1980171	1236028	2111671	5238045	4121222	2789125	1067873	0	0	0	1	39	9	2016	1
1286	5	2017-10-12 19:10:17.665049	2017-10-12 19:10:17.665049	2016-09-27	0	0	0	363825	1243145	985579	866520	1042898	1676720	3580492	4317276	1717685	2463343	0	0	0	1	39	9	2016	2
1287	5	2017-10-12 19:10:17.674295	2017-10-12 19:10:17.674295	2016-09-28	0	0	0	363825	674405	2241873	1032151	627870	1368922	2848700	2884793	3565908	1107538	0	0	0	1	39	9	2016	3
1288	5	2017-10-12 19:10:17.68288	2017-10-12 19:10:17.68288	2016-09-29	0	0	0	463050	413090	860623	670283	1378364	952027	2754913	3211513	2221986	1419662	0	0	0	1	39	9	2016	4
1289	5	2017-10-12 19:10:17.692293	2017-10-12 19:10:17.692293	2016-09-30	0	0	0	661500	700647	576974	781877	1375360	1375549	3795248	3835766	2437076	1113401	0	0	0	1	39	9	2016	5
1290	5	2017-10-12 19:10:17.701044	2017-10-12 19:10:17.701044	2016-10-01	0	0	0	628425	1223640	827220	2021687	1238546	1530806	3524692	4720500	2279208	1135441	0	0	0	1	39	10	2016	6
1291	5	2017-10-12 19:10:17.710417	2017-10-12 19:10:17.710417	2016-10-02	0	0	0	363825	618057	806241	759438	1377906	2095675	2526140	5300462	2813379	1719308	0	0	0	1	39	10	2016	0
1292	5	2017-10-12 19:10:17.719419	2017-10-12 19:10:17.719419	2016-10-03	0	0	0	595350	1647397	1038912	1225421	557567	1631648	2846434	2388028	2587866	1381659	0	0	0	1	40	10	2016	1
1293	5	2017-10-12 19:10:17.728242	2017-10-12 19:10:17.728242	2016-10-04	0	0	0	1124550	1310016	1585098	2267471	2548529	4787382	7612990	8774315	6442047	1707394	0	0	0	1	40	10	2016	2
1294	5	2017-10-12 19:10:17.736324	2017-10-12 19:10:17.736324	2016-10-05	0	0	0	952560	1549559	1622416	3084231	3088469	1797295	3649996	7336514	8913141	4729015	0	0	0	1	40	10	2016	3
1295	5	2017-10-12 19:10:17.74449	2017-10-12 19:10:17.74449	2016-10-06	0	0	0	562275	837914	721808	636640	1301750	1541861	2096050	3841695	2425110	1217921	0	0	0	1	40	10	2016	4
1296	5	2017-10-12 19:10:17.752701	2017-10-12 19:10:17.752701	2016-10-07	0	0	0	496125	1081707	840085	1002706	1077389	1645138	2592830	4255170	4349422	2205002	0	0	0	1	40	10	2016	5
1297	5	2017-10-12 19:10:17.761033	2017-10-12 19:10:17.761033	2016-10-08	0	0	0	496125	1234484	989433	1253798	815051	2020872	2206691	5226120	2600176	1713419	0	0	0	1	40	10	2016	6
1298	5	2017-10-12 19:10:17.769588	2017-10-12 19:10:17.769588	2016-10-09	0	0	0	396900	448325	796860	1036153	1112395	1100736	3122815	2832268	2531657	1154235	0	0	0	1	40	10	2016	0
1299	5	2017-10-12 19:10:17.778184	2017-10-12 19:10:17.778184	2016-10-10	0	0	0	463050	1098831	1636282	1461120	932277	1766497	3689878	3277140	3332495	2296451	0	0	0	1	41	10	2016	1
1300	5	2017-10-12 19:10:17.786059	2017-10-12 19:10:17.786059	2016-10-11	0	0	0	1256850	1866176	5133006	3001304	2603746	3622253	8360546	7532071	7748938	5756394	0	0	0	1	41	10	2016	2
1301	5	2017-10-12 19:10:17.793963	2017-10-12 19:10:17.793963	2016-10-12	0	0	0	476280	1801986	2863614	2099374	2689674	1708825	3621097	7987045	7858959	3938286	0	0	0	1	41	10	2016	3
1302	5	2017-10-12 19:10:17.8018	2017-10-12 19:10:17.8018	2016-10-13	0	0	0	363825	722331	970038	1668399	1774914	1113525	1947530	2087444	2240046	1780434	0	0	0	1	41	10	2016	4
1303	5	2017-10-12 19:10:17.810249	2017-10-12 19:10:17.810249	2016-10-14	0	0	0	529200	1421226	1721638	931725	1142091	2176574	2306931	2762455	1712741	1530785	0	0	0	1	41	10	2016	5
1304	5	2017-10-12 19:10:17.818978	2017-10-12 19:10:17.818978	2016-10-15	0	0	0	628425	613102	1109313	1770259	918090	2185148	1360843	1385068	2210610	1968618	0	0	0	1	41	10	2016	6
1305	5	2017-10-12 19:10:17.827004	2017-10-12 19:10:17.827004	2016-10-16	0	0	0	661500	680099	764425	890828	579617	1265811	2206261	2949962	3688918	985559	0	0	0	1	41	10	2016	0
1306	5	2017-10-12 19:10:17.835017	2017-10-12 19:10:17.835017	2016-10-17	0	0	0	595350	791678	1663249	1338920	1951868	1437478	2481173	3357669	3829046	3021274	0	0	0	1	42	10	2016	1
1307	5	2017-10-12 19:10:17.843004	2017-10-12 19:10:17.843004	2016-10-18	0	0	0	1256850	2754133	1757143	3457552	2048935	3298670	5047204	5782143	4430113	5041751	0	0	0	1	42	10	2016	2
1308	5	2017-10-12 19:10:17.851234	2017-10-12 19:10:17.851234	2016-10-19	0	0	0	1005480	1272597	1448807	2735106	1748795	2279447	3242985	7633624	12340840	2671756	0	0	0	1	42	10	2016	3
1309	5	2017-10-12 19:10:17.859984	2017-10-12 19:10:17.859984	2016-10-20	0	0	0	396900	837599	997046	1127475	928697	1122084	2139451	2134855	2085382	974949	0	0	0	1	42	10	2016	4
1310	5	2017-10-12 19:10:17.868795	2017-10-12 19:10:17.868795	2016-10-21	0	0	0	463050	999571	600911	1025102	1460419	1198857	1950424	2616448	1484897	1235184	0	0	0	1	42	10	2016	5
1311	5	2017-10-12 19:10:17.877281	2017-10-12 19:10:17.877281	2016-10-22	0	0	0	562275	991001	1592523	1034265	1077127	2110417	2165454	3294812	1824635	960287	0	0	0	1	42	10	2016	6
1312	5	2017-10-12 19:10:17.885358	2017-10-12 19:10:17.885358	2016-10-23	0	0	0	496125	417902	1343362	958556	1714005	1714966	1321154	2907274	3209050	2076154	0	0	0	1	42	10	2016	0
1313	5	2017-10-12 19:10:17.893725	2017-10-12 19:10:17.893725	2016-10-24	0	0	0	396900	1663938	1104760	764360	1229432	2449008	2734789	2541852	2340252	1432946	0	0	0	1	43	10	2016	1
1314	5	2017-10-12 19:10:17.903049	2017-10-12 19:10:17.903049	2016-10-25	0	0	0	859950	1110100	2219020	3487722	2238374	2865820	5935895	8312544	7086761	5009326	0	0	0	1	43	10	2016	2
1315	5	2017-10-12 19:10:17.912603	2017-10-12 19:10:17.912603	2016-10-26	0	0	0	476280	896566	1147812	1723035	1733047	4353040	6574942	4064054	5286526	4115533	0	0	0	1	43	10	2016	3
1316	5	2017-10-12 19:10:17.922447	2017-10-12 19:10:17.922447	2016-10-27	0	0	0	496125	614839	1556627	1621420	1794242	2210249	2460884	1664906	1493679	1340286	0	0	0	1	43	10	2016	4
1317	5	2017-10-12 19:10:17.930957	2017-10-12 19:10:17.930957	2016-10-28	0	0	0	496125	905002	1919637	1108669	1097951	2352080	2247215	2949445	2914733	1599852	0	0	0	1	43	10	2016	5
1318	5	2017-10-12 19:10:17.939212	2017-10-12 19:10:17.939212	2016-10-29	0	0	0	396900	1080866	603845	1453589	887114	896174	2619063	3732833	2550772	2325834	0	0	0	1	43	10	2016	6
1319	5	2017-10-12 19:10:17.947563	2017-10-12 19:10:17.947563	2016-10-30	0	338756	677511	1422774	1752519	2247432	2162202	742484	673345	1168013	735335	0	0	0	0	0	1	43	10	2016	0
1320	5	2017-10-12 19:10:17.956452	2017-10-12 19:10:17.956452	2016-10-31	0	310526	903348	1067081	1478023	3202327	1292714	479535	1320330	1043034	683413	0	0	0	0	0	1	44	10	2016	1
1321	5	2017-10-12 19:10:17.966116	2017-10-12 19:10:17.966116	2016-11-01	0	366985	677511	711387	1112797	3814989	961635	962977	1129144	1803063	1130713	0	0	0	0	0	1	44	11	2016	2
1322	5	2017-10-12 19:10:17.974367	2017-10-12 19:10:17.974367	2016-11-02	0	282296	813013	782526	838361	2782754	931389	801120	1650370	2197143	1844388	0	0	0	0	0	1	44	11	2016	3
1323	5	2017-10-12 19:10:17.982655	2017-10-12 19:10:17.982655	2016-11-03	0	155263	293588	426832	1364270	992708	468922	427036	689117	596134	502019	0	0	0	0	0	1	44	11	2016	4
1324	5	2017-10-12 19:10:17.990737	2017-10-12 19:10:17.990737	2016-11-04	0	282296	225837	640247	406954	1334813	1006052	209195	474090	603692	371480	0	0	0	0	0	1	44	11	2016	5
1325	5	2017-10-12 19:10:17.999315	2017-10-12 19:10:17.999315	2016-11-05	0	395215	451674	1422774	3309621	3615381	1212518	610224	1201396	1117472	917955	0	0	0	0	0	1	44	11	2016	6
1326	5	2017-10-12 19:10:18.007782	2017-10-12 19:10:18.007782	2016-11-06	0	451674	451674	640248	1501367	3503236	1622747	1080002	981611	1654950	1104505	0	0	0	0	0	1	44	11	2016	0
1327	5	2017-10-12 19:10:18.01653	2017-10-12 19:10:18.01653	2016-11-07	0	282296	903348	924803	2663725	3160341	1505232	722322	1831374	821794	850976	0	0	0	0	0	1	45	11	2016	1
1328	5	2017-10-12 19:10:18.024463	2017-10-12 19:10:18.024463	2016-11-08	0	395215	677511	1067081	1121922	2591821	1157053	1048014	922310	1941942	922660	0	0	0	0	0	1	45	11	2016	2
1329	5	2017-10-12 19:10:18.032403	2017-10-12 19:10:18.032403	2016-11-09	0	366985	451674	924803	2418549	2252330	1415234	780914	1270291	867100	886343	0	0	0	0	0	1	45	11	2016	3
1330	5	2017-10-12 19:10:18.04047	2017-10-12 19:10:18.04047	2016-11-10	0	169378	316172	675817	1466640	847107	489882	582242	662674	755475	512006	0	0	0	0	0	1	45	11	2016	4
1331	5	2017-10-12 19:10:18.049232	2017-10-12 19:10:18.049232	2016-11-11	0	254067	225837	462401	1037659	919450	260809	483710	345273	625468	251800	0	0	0	0	0	1	45	11	2016	5
1332	5	2017-10-12 19:10:18.057968	2017-10-12 19:10:18.057968	2016-11-12	0	451674	496841	995942	3699531	2004854	1051773	756364	1818437	1675092	702538	0	0	0	0	0	1	45	11	2016	6
1333	5	2017-10-12 19:10:18.067071	2017-10-12 19:10:18.067071	2016-11-13	0	536363	722678	640248	1702337	2808068	1944740	1090936	907107	1330474	510288	0	0	0	0	0	1	45	11	2016	0
1334	5	2017-10-12 19:10:18.075595	2017-10-12 19:10:18.075595	2016-11-14	0	423444	903348	1422774	769254	2438804	1226859	593519	1640240	2280584	1182267	0	0	0	0	0	1	46	11	2016	1
1335	5	2017-10-12 19:10:18.084353	2017-10-12 19:10:18.084353	2016-11-15	0	282296	722678	853664	997496	1162966	2005832	856643	1523908	1531413	830058	0	0	0	0	0	1	46	11	2016	2
1336	5	2017-10-12 19:10:18.093673	2017-10-12 19:10:18.093673	2016-11-16	0	564593	813013	640248	2808289	3269794	1559340	784780	1178066	2088554	1054957	0	0	0	0	0	1	46	11	2016	3
1337	5	2017-10-12 19:10:18.10437	2017-10-12 19:10:18.10437	2016-11-17	0	183493	203253	640247	1359337	1430422	421155	226600	634326	705031	396264	0	0	0	0	0	1	46	11	2016	4
1338	5	2017-10-12 19:10:18.114375	2017-10-12 19:10:18.114375	2016-11-18	0	268181	383923	355693	930700	997097	1025736	578831	745494	825166	364421	0	0	0	0	0	1	46	11	2016	5
1339	5	2017-10-12 19:10:18.148904	2017-10-12 19:10:18.148904	2016-11-19	0	423444	496841	1351635	3272794	2372540	831646	895244	1344873	964590	640400	0	0	0	0	0	1	46	11	2016	6
1340	5	2017-10-12 19:10:18.156788	2017-10-12 19:10:18.156788	2016-11-20	0	423444	587176	640248	1017888	1090200	1243901	704648	1472273	661559	895621	0	0	0	0	0	1	46	11	2016	0
1341	5	2017-10-12 19:10:18.164714	2017-10-12 19:10:18.164714	2016-11-21	0	451674	858181	1067081	1550413	2502555	1007146	800231	1819568	2550192	882193	0	0	0	0	0	1	47	11	2016	1
1342	5	2017-10-12 19:10:18.172699	2017-10-12 19:10:18.172699	2016-11-22	0	338756	451674	1138219	3654194	1722851	967444	609959	811725	1063307	1266539	0	0	0	0	0	1	47	11	2016	2
1343	5	2017-10-12 19:10:18.180888	2017-10-12 19:10:18.180888	2016-11-23	0	310526	722678	1138219	1778426	3769876	1236532	507204	1427881	1534411	670506	0	0	0	0	0	1	47	11	2016	3
1344	5	2017-10-12 19:10:18.191047	2017-10-12 19:10:18.191047	2016-11-24	0	268181	271004	675817	1220911	740811	663499	353749	330205	756300	323082	0	0	0	0	0	1	47	11	2016	4
1345	5	2017-10-12 19:10:18.200939	2017-10-12 19:10:18.200939	2016-11-25	0	127033	451674	711386	1834695	1531715	447512	345123	496481	479624	400213	0	0	0	0	0	1	47	11	2016	5
1346	5	2017-10-12 19:10:18.210011	2017-10-12 19:10:18.210011	2016-11-26	0	310526	451674	1138219	2532757	2045713	1406175	1050076	1215057	877773	519953	0	0	0	0	0	1	47	11	2016	6
1347	5	2017-10-12 19:10:18.218634	2017-10-12 19:10:18.218634	2016-11-27	0	310526	722678	924803	1324444	5607510	844564	583629	1657732	2482922	963226	0	0	0	0	0	1	47	11	2016	0
1348	5	2017-10-12 19:10:18.22743	2017-10-12 19:10:18.22743	2016-11-28	0	536363	451674	1067081	3599959	2387034	1097312	740610	1132109	1952262	477350	0	0	0	0	0	1	48	11	2016	1
1349	5	2017-10-12 19:10:18.236713	2017-10-12 19:10:18.236713	2016-11-29	0	592822	745262	2134160	1813904	5152178	1510159	1404860	2025643	3389288	1922198	0	0	0	0	0	1	48	11	2016	2
1350	5	2017-10-12 19:10:18.246088	2017-10-12 19:10:18.246088	2016-11-30	0	635167	745262	1387204	1831554	7407848	1398049	1586473	814363	2296978	2506312	0	0	0	0	0	1	48	11	2016	3
1351	5	2017-10-12 19:10:18.25584	2017-10-12 19:10:18.25584	2016-12-01	0	381100	677511	960372	4649144	2814870	2506184	1834958	1952186	1316753	967900	0	0	0	0	0	1	48	12	2016	4
1352	5	2017-10-12 19:10:18.265349	2017-10-12 19:10:18.265349	2016-12-02	0	762200	1151769	960372	1961492	3327911	2025585	1728966	2292686	1388309	2076640	0	0	0	0	0	1	48	12	2016	5
1353	5	2017-10-12 19:10:18.273539	2017-10-12 19:10:18.273539	2016-12-03	0	359928	304880	853664	1718167	1529601	937350	510576	1449852	1179280	545036	0	0	0	0	0	1	48	12	2016	6
1354	5	2017-10-12 19:10:18.282733	2017-10-12 19:10:18.282733	2016-12-04	0	254067	508133	693602	2678721	1595898	540351	715572	758514	806798	290939	0	0	0	0	0	1	48	12	2016	0
1355	5	2017-10-12 19:10:18.291181	2017-10-12 19:10:18.291181	2016-12-05	0	762200	1287271	2027452	2595873	3623446	2260832	1801982	3081060	3341672	1192539	0	0	0	0	0	1	49	12	2016	1
1356	5	2017-10-12 19:10:18.299221	2017-10-12 19:10:18.299221	2016-12-06	0	423444	677511	1707328	4311770	5572040	1454107	1003539	2157768	1033477	1860474	0	0	0	0	0	1	49	12	2016	2
1357	5	2017-10-12 19:10:18.308446	2017-10-12 19:10:18.308446	2016-12-07	0	804544	1084018	1493912	6021442	4181905	2113727	1637302	2050612	3302042	1152548	0	0	0	0	0	1	49	12	2016	3
1358	5	2017-10-12 19:10:18.31721	2017-10-12 19:10:18.31721	2016-12-08	0	804544	1287271	1173788	2205433	2415368	1486147	1458212	2219094	1954499	1207566	0	0	0	0	0	1	49	12	2016	4
1359	5	2017-10-12 19:10:18.325677	2017-10-12 19:10:18.325677	2016-12-09	0	635167	1151769	1067080	3820934	1584550	2111078	1262920	1100086	2266697	2355716	0	0	0	0	0	1	49	12	2016	5
1360	5	2017-10-12 19:10:18.333574	2017-10-12 19:10:18.333574	2016-12-10	0	254067	575884	960372	954692	2608217	735254	1002499	1664324	855710	799185	0	0	0	0	0	1	49	12	2016	6
1361	5	2017-10-12 19:10:18.341749	2017-10-12 19:10:18.341749	2016-12-11	0	232894	406507	480186	1409724	1988808	988316	627071	950499	709622	637396	0	0	0	0	0	1	49	12	2016	0
1362	5	2017-10-12 19:10:18.350255	2017-10-12 19:10:18.350255	2016-12-12	0	508133	1287271	1600620	1529194	6942603	2218148	1714240	1624230	1459638	1319173	0	0	0	0	0	1	50	12	2016	1
1363	5	2017-10-12 19:10:18.360015	2017-10-12 19:10:18.360015	2016-12-13	0	804544	1355022	1280496	2362683	3071493	3318418	1160953	1630842	1877045	1988699	0	0	0	0	0	1	50	12	2016	2
1364	5	2017-10-12 19:10:18.368704	2017-10-12 19:10:18.368704	2016-12-14	0	381100	1287271	1067080	3298694	3194820	1547061	1363398	2150558	2084977	1727453	0	0	0	0	0	1	50	12	2016	3
1365	5	2017-10-12 19:10:18.376608	2017-10-12 19:10:18.376608	2016-12-15	0	804544	1219520	1493912	1894979	3711069	1491381	1119586	1726478	2781576	2481194	0	0	0	0	0	1	50	12	2016	4
1366	5	2017-10-12 19:10:18.384571	2017-10-12 19:10:18.384571	2016-12-16	0	846889	1084018	1600620	3890054	6031923	2642664	1832830	1609236	1882120	2241780	0	0	0	0	0	1	50	12	2016	5
1367	5	2017-10-12 19:10:18.392953	2017-10-12 19:10:18.392953	2016-12-17	0	190550	542009	533540	1397323	1506220	1388162	555116	559481	747007	640137	0	0	0	0	0	1	50	12	2016	6
1368	5	2017-10-12 19:10:18.402099	2017-10-12 19:10:18.402099	2016-12-18	0	254067	609760	586894	892037	2605366	1172344	610344	1033687	746292	533386	0	0	0	0	0	1	50	12	2016	0
1369	5	2017-10-12 19:10:18.41146	2017-10-12 19:10:18.41146	2016-12-19	0	804544	813013	1814036	3585533	5374278	3047554	1137868	2615771	3337646	1415160	0	0	0	0	0	1	51	12	2016	1
1370	5	2017-10-12 19:10:18.420171	2017-10-12 19:10:18.420171	2016-12-20	0	677511	1287271	960372	1239874	3380732	1636754	1517125	1460708	2102432	2144819	0	0	0	0	0	1	51	12	2016	2
1371	5	2017-10-12 19:10:18.428776	2017-10-12 19:10:18.428776	2016-12-21	0	804544	745262	1280496	3798709	3053008	1579597	931963	1406649	1912038	2082191	0	0	0	0	0	1	51	12	2016	3
1372	5	2017-10-12 19:10:18.437332	2017-10-12 19:10:18.437332	2016-12-22	0	592822	677511	1280496	3201194	5423145	3285242	1535911	1775512	2618491	1965868	0	0	0	0	0	1	51	12	2016	4
1373	5	2017-10-12 19:10:18.446587	2017-10-12 19:10:18.446587	2016-12-23	0	846889	609760	1707328	1423843	3538080	1675806	1704002	2414774	1902597	1988664	0	0	0	0	0	1	51	12	2016	5
1374	5	2017-10-12 19:10:18.455408	2017-10-12 19:10:18.455408	2016-12-24	0	211722	609760	1067080	2296758	2817749	1188819	431348	888702	1352849	829282	0	0	0	0	0	1	51	12	2016	6
1375	5	2017-10-12 19:10:18.464765	2017-10-12 19:10:18.464765	2016-12-25	0	254067	474258	533540	1191137	1987785	1028953	1049104	926800	978341	457920	0	0	0	0	0	1	51	12	2016	0
1376	5	2017-10-12 19:10:18.472773	2017-10-12 19:10:18.472773	2016-12-26	0	846889	1355022	1600620	5664562	2158261	3048755	908649	1338827	3252880	791193	0	0	0	0	0	1	52	12	2016	1
1377	5	2017-10-12 19:10:18.480501	2017-10-12 19:10:18.480501	2016-12-27	0	508133	1287271	1707328	1715201	2950229	1920832	1357996	1547155	964334	1107210	0	0	0	0	0	1	52	12	2016	2
1378	5	2017-10-12 19:10:18.488413	2017-10-12 19:10:18.488413	2016-12-28	0	635167	677511	1600620	4423159	3923785	2367779	775723	1413715	1453527	1322632	0	0	0	0	0	1	52	12	2016	3
1379	5	2017-10-12 19:10:18.497045	2017-10-12 19:10:18.497045	2016-12-29	0	804544	677511	960372	2531277	4717440	1340645	1614317	2146466	3593795	1590931	0	0	0	0	0	1	52	12	2016	4
1380	5	2017-10-12 19:10:18.506229	2017-10-12 19:10:18.506229	2016-12-30	0	381100	338756	800310	1722569	2012678	688263	670985	795155	1281647	373177	0	0	0	0	0	1	52	12	2016	5
1381	5	2017-10-12 19:10:18.514932	2017-10-12 19:10:18.514932	2016-12-31	0	211722	406507	1067080	1091875	1789007	1543430	1049104	926800	1048223	387471	0	0	0	0	0	1	52	12	2016	6
1382	1	2017-10-12 19:10:42.275588	2017-10-12 19:10:42.275588	2016-01-01	0	0	0	418950	954522	715954	652410	797960	1471090	1502358	1851671	2017838	605047	0	0	0	2	53	1	2016	5
1383	1	2017-10-12 19:10:42.285025	2017-10-12 19:10:42.285025	2016-01-02	0	0	0	308700	441251	1580988	820925	798777	806104	1195604	3399873	931084	665629	0	0	0	2	53	1	2016	6
1384	1	2017-10-12 19:10:42.293726	2017-10-12 19:10:42.293726	2016-01-03	0	0	0	418950	299692	592271	876979	712983	972396	1533813	1443763	1299548	1784512	0	0	0	2	53	1	2016	0
1385	1	2017-10-12 19:10:42.302463	2017-10-12 19:10:42.302463	2016-01-04	0	0	0	330750	750340	996265	692853	562830	1608905	1443308	1622970	2142517	1013259	0	0	0	2	1	1	2016	1
1386	1	2017-10-12 19:10:42.311777	2017-10-12 19:10:42.311777	2016-01-05	0	0	0	352800	666848	628370	682110	591204	1291274	954444	2189125	971039	1505894	0	0	0	2	1	1	2016	2
1387	1	2017-10-12 19:10:42.322635	2017-10-12 19:10:42.322635	2016-01-06	0	0	0	617400	972900	2592586	2339872	1253379	3523684	4404312	2500408	3160139	2738614	0	0	0	2	1	1	2016	3
1388	1	2017-10-12 19:10:42.331572	2017-10-12 19:10:42.331572	2016-01-07	0	0	0	458640	1285898	1685024	1266883	1769684	1897375	2968293	5087541	4928920	2230583	0	0	0	2	1	1	2016	4
1389	1	2017-10-12 19:10:42.340258	2017-10-12 19:10:42.340258	2016-01-08	0	0	0	242550	512870	1065785	503335	648348	985991	1471280	1732833	1639464	1070935	0	0	0	2	1	1	2016	5
1390	1	2017-10-12 19:10:42.34887	2017-10-12 19:10:42.34887	2016-01-09	0	0	0	220500	574260	1706078	423359	367291	1108062	2273016	2849472	2127640	1098363	0	0	0	2	1	1	2016	6
1391	1	2017-10-12 19:10:42.35744	2017-10-12 19:10:42.35744	2016-01-10	0	0	0	352800	381699	373510	1025542	730867	693367	854388	2171938	1171504	932674	0	0	0	2	1	1	2016	0
1392	1	2017-10-12 19:10:42.368009	2017-10-12 19:10:42.368009	2016-01-11	0	0	0	330750	755170	638193	681354	798899	1981870	1534381	3515796	1110970	1053069	0	0	0	2	2	1	2016	1
1393	1	2017-10-12 19:10:42.377456	2017-10-12 19:10:42.377456	2016-01-12	0	0	0	308700	479191	460586	809614	676034	1064600	1641732	1764923	1814131	1661788	0	0	0	2	2	1	2016	2
1394	1	2017-10-12 19:10:42.385957	2017-10-12 19:10:42.385957	2016-01-13	0	0	0	485100	908522	2528777	1445037	1914144	1168527	4597964	3028317	7495740	3571094	0	0	0	2	2	1	2016	3
1395	1	2017-10-12 19:10:42.394491	2017-10-12 19:10:42.394491	2016-01-14	0	0	0	493920	357948	886714	1493731	1408302	2021649	2982671	3223969	5789050	2588189	0	0	0	2	2	1	2016	4
1396	1	2017-10-12 19:10:42.402964	2017-10-12 19:10:42.402964	2016-01-15	0	0	0	264600	467621	842111	736123	674223	1138164	1576240	2615500	2364567	719743	0	0	0	2	2	1	2016	5
1397	1	2017-10-12 19:10:42.4112	2017-10-12 19:10:42.4112	2016-01-16	0	0	0	198450	365864	524470	826710	760755	1053567	2438559	1238561	1100648	1528362	0	0	0	2	2	1	2016	6
1398	1	2017-10-12 19:10:42.419662	2017-10-12 19:10:42.419662	2016-01-17	0	0	0	220500	584808	1110866	740684	363667	1289541	2335941	2322043	1315196	946065	0	0	0	2	2	1	2016	0
1399	1	2017-10-12 19:10:42.428712	2017-10-12 19:10:42.428712	2016-01-18	0	0	0	286650	611061	502757	839157	1185822	671184	2027378	1907926	1226366	486135	0	0	0	2	3	1	2016	1
1400	1	2017-10-12 19:10:42.437283	2017-10-12 19:10:42.437283	2016-01-19	0	0	0	330750	955904	964983	742195	510709	846169	1647790	2617931	1803474	957895	0	0	0	2	3	1	2016	2
1401	1	2017-10-12 19:10:42.446118	2017-10-12 19:10:42.446118	2016-01-20	0	0	0	573300	1355988	1131248	1037516	2235643	3031421	2520887	2954239	5747258	2894718	0	0	0	2	3	1	2016	3
1402	1	2017-10-12 19:10:42.454618	2017-10-12 19:10:42.454618	2016-01-21	0	0	0	705600	1185278	871720	1525419	2322748	1463690	4411278	2084279	6018698	1716773	0	0	0	2	3	1	2016	4
1403	1	2017-10-12 19:10:42.465711	2017-10-12 19:10:42.465711	2016-01-22	0	0	0	220500	492014	569626	879304	1253848	1594490	2193208	2095387	2137392	1746029	0	0	0	2	3	1	2016	5
1404	1	2017-10-12 19:10:42.47539	2017-10-12 19:10:42.47539	2016-01-23	0	0	0	286650	770055	1272227	415598	953313	1501709	1190327	1626637	1840171	868375	0	0	0	2	3	1	2016	6
1405	1	2017-10-12 19:10:42.484532	2017-10-12 19:10:42.484532	2016-01-24	0	0	0	352800	488515	1038195	716176	526927	1001650	1652168	1754123	2032587	1815784	0	0	0	2	3	1	2016	0
1406	1	2017-10-12 19:10:42.493489	2017-10-12 19:10:42.493489	2016-01-25	0	0	0	418950	612127	458536	865725	1173504	840655	2773253	2167405	1813351	1072457	0	0	0	2	4	1	2016	1
1407	1	2017-10-12 19:10:42.502129	2017-10-12 19:10:42.502129	2016-01-26	0	0	0	198450	733876	754587	974506	677857	1490417	2746932	2156644	1402170	760086	0	0	0	2	4	1	2016	2
1408	1	2017-10-12 19:10:42.512888	2017-10-12 19:10:42.512888	2016-01-27	0	0	0	882000	622099	1031364	2508407	1760278	2679980	4732792	5796582	7704008	1451882	0	0	0	2	4	1	2016	3
1409	1	2017-10-12 19:10:42.522653	2017-10-12 19:10:42.522653	2016-01-28	0	0	0	388080	1078771	2757260	1320114	1685493	3248724	3081203	2472733	3904775	1067873	0	0	0	2	4	1	2016	4
1410	1	2017-10-12 19:10:42.531406	2017-10-12 19:10:42.531406	2016-01-29	0	0	0	595350	621572	909766	1266453	893912	2235626	2983743	3453821	3435370	1883733	0	0	0	2	4	1	2016	5
1411	1	2017-10-12 19:10:42.539973	2017-10-12 19:10:42.539973	2016-01-30	0	0	0	463050	674405	1245485	958426	1004592	2053382	2698769	2715099	3962120	1882815	0	0	0	2	4	1	2016	6
1412	1	2017-10-12 19:10:42.548391	2017-10-12 19:10:42.548391	2016-01-31	0	0	0	661500	660944	728220	1191614	995485	778931	2899908	1859297	2563830	1723875	0	0	0	2	4	1	2016	0
1413	1	2017-10-12 19:10:42.556483	2017-10-12 19:10:42.556483	2016-02-01	0	0	0	529200	485063	923158	868752	1964800	1572056	2108471	1816942	2843256	1284693	0	0	0	2	5	2	2016	1
1414	1	2017-10-12 19:10:42.565053	2017-10-12 19:10:42.565053	2016-02-02	0	0	0	628425	917730	486600	1808878	1135334	1148105	2153978	3304350	1671419	1892402	0	0	0	2	5	2	2016	2
1415	1	2017-10-12 19:10:42.573255	2017-10-12 19:10:42.573255	2016-02-03	0	0	0	628425	1304787	1319303	1109948	1837208	1702736	1852502	4463547	2989215	1604687	0	0	0	2	5	2	2016	3
1416	1	2017-10-12 19:10:42.581253	2017-10-12 19:10:42.581253	2016-02-04	0	0	0	363825	1841208	692608	1782430	743423	1903590	3105200	2558601	4469950	2210654	0	0	0	2	5	2	2016	4
1417	1	2017-10-12 19:10:42.589554	2017-10-12 19:10:42.589554	2016-02-05	0	0	0	926100	620534	1219306	1619622	2760906	3111798	5208888	5483947	4407716	2845656	0	0	0	2	5	2	2016	5
1418	1	2017-10-12 19:10:42.59756	2017-10-12 19:10:42.59756	2016-02-06	0	0	0	687960	1660242	2298422	3906693	1788061	1647521	5474993	7795046	8444029	2986746	0	0	0	2	5	2	2016	6
1419	1	2017-10-12 19:10:42.606639	2017-10-12 19:10:42.606639	2016-02-07	0	0	0	496125	977567	866169	1099652	1648883	1088372	3982495	2817243	2611657	1217921	0	0	0	2	5	2	2016	0
1420	1	2017-10-12 19:10:42.616575	2017-10-12 19:10:42.616575	2016-02-08	0	0	0	562275	927178	840085	648810	1014013	2024786	2448784	2753345	4131951	2450002	0	0	0	2	6	2	2016	1
1421	1	2017-10-12 19:10:42.628633	2017-10-12 19:10:42.628633	2016-02-09	0	0	0	463050	881774	1583093	964460	640397	1876524	1792937	3919590	2311267	2959543	0	0	0	2	6	2	2016	2
1422	1	2017-10-12 19:10:42.641097	2017-10-12 19:10:42.641097	2016-02-10	0	0	0	363825	344865	1081453	1122499	926996	1300870	3673900	5664536	3037988	1038812	0	0	0	2	6	2	2016	3
1423	1	2017-10-12 19:10:42.649935	2017-10-12 19:10:42.649935	2016-02-11	0	0	0	363825	520499	1377922	1878583	1211960	2826395	2372064	2184760	2221663	2727036	0	0	0	2	6	2	2016	4
1424	1	2017-10-12 19:10:42.658545	2017-10-12 19:10:42.658545	2016-02-12	0	0	0	1323000	1999475	5133006	2438560	1952810	4261474	9344139	4602932	5424257	6475943	0	0	0	2	6	2	2016	5
1425	1	2017-10-12 19:10:42.666927	2017-10-12 19:10:42.666927	2016-02-13	0	0	0	687960	2702979	2526719	2249330	3586232	2019520	6254621	4698262	10277100	3316451	0	0	0	2	6	2	2016	6
1426	1	2017-10-12 19:10:42.675183	2017-10-12 19:10:42.675183	2016-02-14	0	0	0	562275	529709	727529	981411	1879321	954450	2655723	3211452	1581209	1157282	0	0	0	2	6	2	2016	0
1427	1	2017-10-12 19:10:42.683819	2017-10-12 19:10:42.683819	2016-02-15	0	0	0	363825	1894968	1205147	683265	1213472	2031469	2129474	1973182	2283654	2237301	0	0	0	2	7	2	2016	1
1428	1	2017-10-12 19:10:42.691927	2017-10-12 19:10:42.691927	2016-02-16	0	0	0	463050	832067	1450641	1327694	795678	1413919	1814458	2154550	1808681	1546772	0	0	0	2	7	2	2016	2
1429	1	2017-10-12 19:10:42.70096	2017-10-12 19:10:42.70096	2016-02-17	0	0	0	595350	941675	1189105	1187771	1101272	2186400	1161190	3123490	3458361	1642599	0	0	0	2	7	2	2016	3
1430	1	2017-10-12 19:10:42.715332	2017-10-12 19:10:42.715332	2016-02-18	0	0	0	529200	940118	978382	1575200	1540949	2299965	4962346	2909980	2928094	3776592	0	0	0	2	7	2	2016	4
1431	1	2017-10-12 19:10:42.724238	2017-10-12 19:10:42.724238	2016-02-19	0	0	0	1323000	2448118	2008163	2593164	2048935	4948005	4588367	5782143	7383522	3714974	0	0	0	2	7	2	2016	5
1432	1	2017-10-12 19:10:42.733015	2017-10-12 19:10:42.733015	2016-02-20	0	0	0	582120	1156906	2575658	2735106	2384721	3191226	3242985	4293914	8638588	2055197	0	0	0	2	7	2	2016	6
1433	1	2017-10-12 19:10:42.741321	2017-10-12 19:10:42.741321	2016-02-21	0	0	0	496125	1159753	1994092	1947456	1083480	2493520	2496026	2134855	2464543	974949	0	0	0	2	7	2	2016	0
1434	1	2017-10-12 19:10:42.749825	2017-10-12 19:10:42.749825	2016-02-22	0	0	0	330750	1460912	600911	1947694	1186591	1864888	1950424	2907164	2474828	970501	0	0	0	2	8	2	2016	1
1435	1	2017-10-12 19:10:42.758106	2017-10-12 19:10:42.758106	2016-02-23	0	0	0	496125	1531547	1393458	1654824	807845	1241422	3248181	2118093	1338065	1600478	0	0	0	2	8	2	2016	2
1436	1	2017-10-12 19:10:42.768948	2017-10-12 19:10:42.768948	2016-02-24	0	0	0	330750	882237	1091481	663616	1411533	1028980	2281993	1868962	3048598	1297596	0	0	0	2	8	2	2016	3
1437	1	2017-10-12 19:10:42.779096	2017-10-12 19:10:42.779096	2016-02-25	0	0	0	661500	788181	1506491	764360	887923	2938810	3418486	4024599	5200560	1862830	0	0	0	2	8	2	2016	4
1438	1	2017-10-12 19:10:42.791942	2017-10-12 19:10:42.791942	2016-02-26	0	0	0	992250	1356788	2622478	2937029	3099287	3821093	5935895	5687530	6074366	5009326	0	0	0	2	8	2	2016	5
1439	1	2017-10-12 19:10:42.804551	2017-10-12 19:10:42.804551	2016-02-27	0	0	0	529200	1310365	1412691	3273767	1866358	4609102	5882843	8128109	9515747	2599284	0	0	0	2	8	2	2016	6
1440	1	2017-10-12 19:10:42.818197	2017-10-12 19:10:42.818197	2016-02-28	0	0	0	363825	1161362	1245301	1280069	1794242	1977591	1703689	1513551	1765257	1705819	0	0	0	2	8	2	2016	0
1441	1	2017-10-12 19:10:42.828815	2017-10-12 19:10:42.828815	2016-02-29	0	0	0	429975	603335	1919637	1411033	609973	1980699	3745358	3856967	1943155	1107590	0	0	0	2	9	2	2016	1
1442	1	2017-10-12 19:10:42.837583	2017-10-12 19:10:42.837583	2016-03-01	0	0	0	496125	694842	1026537	1162871	532268	1593198	2310938	2695935	2295695	1046625	0	0	0	2	9	3	2016	2
1443	1	2017-10-12 19:10:42.845998	2017-10-12 19:10:42.845998	2016-03-02	0	479904	767846	711387	2278275	1685574	1081101	567782	1346690	955647	955936	0	0	0	0	0	2	9	3	2016	3
1444	1	2017-10-12 19:10:42.854201	2017-10-12 19:10:42.854201	2016-03-03	0	423444	542009	640248	1773628	2260466	1615893	435941	1210303	1158927	968169	0	0	0	0	0	2	9	3	2016	4
1445	1	2017-10-12 19:10:42.862209	2017-10-12 19:10:42.862209	2016-03-04	0	564593	677511	924803	1283997	3814989	1479438	588486	1599620	2318224	1263738	0	0	0	0	0	2	9	3	2016	5
1446	1	2017-10-12 19:10:42.871117	2017-10-12 19:10:42.871117	2016-03-05	0	508133	858181	640248	838361	3288709	644808	867880	1067887	1342699	829975	0	0	0	0	0	2	9	3	2016	6
1447	1	2017-10-12 19:10:42.880596	2017-10-12 19:10:42.880596	2016-03-06	0	282296	271004	391262	789841	1158160	368438	462622	780999	645811	354366	0	0	0	0	0	2	9	3	2016	0
1448	1	2017-10-12 19:10:42.889288	2017-10-12 19:10:42.889288	2016-03-07	0	141148	203253	675817	554937	2426932	529501	371902	430991	503077	257179	0	0	0	0	0	2	10	3	2016	1
1449	1	2017-10-12 19:10:42.897709	2017-10-12 19:10:42.897709	2016-03-08	0	282296	587176	924803	3504305	2324174	1151892	832124	780907	2483270	1040349	0	0	0	0	0	2	10	3	2016	2
1450	1	2017-10-12 19:10:42.906004	2017-10-12 19:10:42.906004	2016-03-09	0	395215	496841	1280497	2402187	2335490	912795	660001	1636018	1418528	1288589	0	0	0	0	0	2	10	3	2016	3
1451	1	2017-10-12 19:10:42.915292	2017-10-12 19:10:42.915292	2016-03-10	0	395215	858181	1138219	3163173	2633618	1223001	467385	1945835	1561409	936074	0	0	0	0	0	2	10	3	2016	4
1452	1	2017-10-12 19:10:42.924813	2017-10-12 19:10:42.924813	2016-03-11	0	564593	722678	1351635	2131652	2753810	801037	1113515	1277044	1577828	790852	0	0	0	0	0	2	10	3	2016	5
1453	1	2017-10-12 19:10:42.933031	2017-10-12 19:10:42.933031	2016-03-12	0	479904	677511	1422774	3109563	2047573	1042804	1015188	1088821	953810	954523	0	0	0	0	0	2	10	3	2016	6
1454	1	2017-10-12 19:10:42.941217	2017-10-12 19:10:42.941217	2016-03-13	0	225837	271004	675817	1955520	498298	489882	459665	441782	956935	416005	0	0	0	0	0	2	10	3	2016	0
1455	1	2017-10-12 19:10:42.949267	2017-10-12 19:10:42.949267	2016-03-14	0	155263	203253	640247	843098	1050800	376724	354720	586964	577355	314750	0	0	0	0	0	2	11	3	2016	1
1456	1	2017-10-12 19:10:42.957514	2017-10-12 19:10:42.957514	2016-03-15	0	479904	722678	924803	3082943	1603883	1618112	578396	1818437	1159679	1248957	0	0	0	0	0	2	11	3	2016	2
1457	1	2017-10-12 19:10:42.966478	2017-10-12 19:10:42.966478	2016-03-16	0	310526	722678	1067081	1891485	1544437	1296493	818202	1319429	960898	680384	0	0	0	0	0	2	11	3	2016	3
1458	1	2017-10-12 19:10:42.974887	2017-10-12 19:10:42.974887	2016-03-17	0	536363	406507	640248	1000030	1742003	1226859	1187038	1025150	2146432	1050904	0	0	0	0	0	2	11	3	2016	4
1459	1	2017-10-12 19:10:42.983866	2017-10-12 19:10:42.983866	2016-03-18	0	395215	451674	1280497	1163746	1259879	1103208	1401779	2177012	1627126	830058	0	0	0	0	0	2	11	3	2016	5
1460	1	2017-10-12 19:10:42.992165	2017-10-12 19:10:42.992165	2016-03-19	0	254067	858181	924803	4011842	2615835	1386080	507799	1178066	1958019	620563	0	0	0	0	0	2	11	3	2016	6
1461	1	2017-10-12 19:10:43.000662	2017-10-12 19:10:43.000662	2016-03-20	0	127033	203253	569109	830706	1430422	574302	352489	671639	587526	660440	0	0	0	0	0	2	11	3	2016	0
1462	1	2017-10-12 19:10:43.008848	2017-10-12 19:10:43.008848	2016-03-21	0	268181	293588	640247	930700	1107886	923162	408587	695794	825166	336389	0	0	0	0	0	2	12	3	2016	1
1463	1	2017-10-12 19:10:43.016906	2017-10-12 19:10:43.016906	2016-03-22	0	254067	406507	1067081	1925173	2899771	756042	760957	1703506	868131	533667	0	0	0	0	0	2	12	3	2016	2
1464	1	2017-10-12 19:10:43.025069	2017-10-12 19:10:43.025069	2016-03-23	0	366985	858181	711387	832818	891982	1243901	1084074	1472273	661559	727692	0	0	0	0	0	2	12	3	2016	3
1465	1	2017-10-12 19:10:43.033887	2017-10-12 19:10:43.033887	2016-03-24	0	479904	767846	1422774	2104132	2957565	1790482	984899	2274460	2422682	882193	0	0	0	0	0	2	12	3	2016	4
1466	1	2017-10-12 19:10:43.04213	2017-10-12 19:10:43.04213	2016-03-25	0	479904	451674	640248	3461868	1830529	1339538	942664	1475864	1449965	773996	0	0	0	0	0	2	12	3	2016	5
1467	1	2017-10-12 19:10:43.050938	2017-10-12 19:10:43.050938	2016-03-26	0	282296	542009	853664	2815842	2579389	961747	732628	755937	2429484	871658	0	0	0	0	0	2	12	3	2016	6
1468	1	2017-10-12 19:10:43.059131	2017-10-12 19:10:43.059131	2016-03-27	0	282296	338756	711386	1784408	1005387	459346	318374	561349	907560	247062	0	0	0	0	0	2	12	3	2016	0
1469	1	2017-10-12 19:10:43.067025	2017-10-12 19:10:43.067025	2016-03-28	0	127033	406507	569109	869066	725549	528878	345123	529579	564264	400213	0	0	0	0	0	2	13	3	2016	1
1470	1	2017-10-12 19:10:43.075892	2017-10-12 19:10:43.075892	2016-03-29	0	366985	903348	924803	2849351	3409522	962120	1425103	1682386	1404437	519953	0	0	0	0	0	2	13	3	2016	2
1471	1	2017-10-12 19:10:43.084289	2017-10-12 19:10:43.084289	2016-03-30	0	423444	587176	711387	1630085	3084131	1055705	1167258	1160412	2358776	760442	0	0	0	0	0	2	13	3	2016	3
1472	1	2017-10-12 19:10:43.092338	2017-10-12 19:10:43.092338	2016-03-31	0	282296	858181	1422774	2541148	2898541	1489209	987480	1045024	1952262	636467	0	0	0	0	0	2	13	3	2016	4
1473	1	2017-10-12 19:10:43.100327	2017-10-12 19:10:43.100327	2016-04-01	0	804544	745262	2134160	3265027	6737464	1725896	1334617	2181462	1882938	1441649	0	0	0	0	0	2	13	4	2016	5
1474	1	2017-10-12 19:10:43.10846	2017-10-12 19:10:43.10846	2016-04-02	0	508133	609760	1280496	1098932	6667063	1864066	1001983	1085818	4176324	2380996	0	0	0	0	0	2	13	4	2016	6
1475	1	2017-10-12 19:10:43.117062	2017-10-12 19:10:43.117062	2016-04-03	0	719855	745262	960372	3670377	2303076	2063916	2079619	1830174	1463059	725925	0	0	0	0	0	2	13	4	2016	0
1476	1	2017-10-12 19:10:43.125797	2017-10-12 19:10:43.125797	2016-04-04	0	804544	1219520	1387204	1821386	4159889	1800520	1017039	1348639	2198156	1710174	0	0	0	0	0	2	14	4	2016	1
1477	1	2017-10-12 19:10:43.134171	2017-10-12 19:10:43.134171	2016-04-05	0	190550	677511	640248	1049991	1529601	995935	742656	1193996	648604	573722	0	0	0	0	0	2	14	4	2016	2
1478	1	2017-10-12 19:10:43.142471	2017-10-12 19:10:43.142471	2016-04-06	0	338756	474258	586894	2678721	1709891	864562	397540	834365	868860	420245	0	0	0	0	0	2	14	4	2016	3
1479	1	2017-10-12 19:10:43.15239	2017-10-12 19:10:43.15239	2016-04-07	0	846889	1219520	1280496	3053968	3882264	2393822	1701872	1694583	1879691	1855060	0	0	0	0	0	2	14	4	2016	4
1480	1	2017-10-12 19:10:43.162305	2017-10-12 19:10:43.162305	2016-04-08	0	423444	813013	1707328	6159672	3830778	1363226	849148	2284695	1148308	2126256	0	0	0	0	0	2	14	4	2016	5
1481	1	2017-10-12 19:10:43.172007	2017-10-12 19:10:43.172007	2016-04-09	0	423444	1151769	960372	3803016	6272858	1996298	1330308	1611195	3118596	1728823	0	0	0	0	0	2	14	4	2016	6
1482	1	2017-10-12 19:10:43.181179	2017-10-12 19:10:43.181179	2016-04-10	0	550478	1084018	2027452	3053677	2012807	1238456	1847068	2773868	2184440	2052862	0	0	0	0	0	2	14	4	2016	0
1483	1	2017-10-12 19:10:43.190582	2017-10-12 19:10:43.190582	2016-04-11	0	423444	1355022	1493912	4585120	2881000	1583309	1199774	1833477	2000027	2355716	0	0	0	0	0	2	15	4	2016	1
1484	1	2017-10-12 19:10:43.199428	2017-10-12 19:10:43.199428	2016-04-12	0	381100	372631	480186	795577	3539723	459534	1002499	1248243	812925	564131	0	0	0	0	0	2	15	4	2016	2
1485	1	2017-10-12 19:10:43.208445	2017-10-12 19:10:43.208445	2016-04-13	0	423444	677511	960372	1335528	1093844	912292	675307	804268	1064434	318698	0	0	0	0	0	2	15	4	2016	3
1486	1	2017-10-12 19:10:43.217029	2017-10-12 19:10:43.217029	2016-04-14	0	550478	1355022	1280496	1529194	6534214	2218148	1224457	1949076	3081458	1798872	0	0	0	0	0	2	15	4	2016	4
1487	1	2017-10-12 19:10:43.263636	2017-10-12 19:10:43.263636	2016-04-15	0	635167	1287271	1387204	4016561	3544031	1659209	912177	1223131	2887762	2209666	0	0	0	0	0	2	15	4	2016	5
1488	1	2017-10-12 19:10:43.27227	2017-10-12 19:10:43.27227	2016-04-16	0	465789	1084018	1387204	3133759	2076633	2320592	1227058	2580669	2293475	1247605	0	0	0	0	0	2	15	4	2016	6
1489	1	2017-10-12 19:10:43.280322	2017-10-12 19:10:43.280322	2016-04-17	0	465789	609760	1280496	2186514	5735288	1391956	699741	1421805	2163448	1240597	0	0	0	0	0	2	15	4	2016	0
1490	1	2017-10-12 19:10:43.288095	2017-10-12 19:10:43.288095	2016-04-18	0	846889	1355022	1173788	2992349	6741561	1717732	2156270	1966844	3555115	1008801	0	0	0	0	0	2	16	4	2016	1
1491	1	2017-10-12 19:10:43.295875	2017-10-12 19:10:43.295875	2016-04-19	0	232894	508133	907018	1796558	677799	763489	293885	745974	705507	640137	0	0	0	0	0	2	16	4	2016	2
1492	1	2017-10-12 19:10:43.304026	2017-10-12 19:10:43.304026	2016-04-20	0	232894	304880	1067080	1605667	4008256	620653	538539	812183	995056	444488	0	0	0	0	0	2	16	4	2016	3
1493	1	2017-10-12 19:10:43.312796	2017-10-12 19:10:43.312796	2016-04-21	0	804544	880764	960372	2561095	6807419	1603976	894039	2779257	2634984	1415160	0	0	0	0	0	2	16	4	2016	4
1494	1	2017-10-12 19:10:43.320945	2017-10-12 19:10:43.320945	2016-04-22	0	465789	1016267	1173788	2355761	2028439	1785550	1611945	973805	1881123	1787349	0	0	0	0	0	2	16	4	2016	5
1495	1	2017-10-12 19:10:43.329956	2017-10-12 19:10:43.329956	2016-04-23	0	677511	1287271	1067080	5259751	3816260	2211436	1449720	2557544	2390048	1534246	0	0	0	0	0	2	16	4	2016	6
1496	1	2017-10-12 19:10:43.338295	2017-10-12 19:10:43.338295	2016-04-24	0	635167	609760	2134160	1440537	3509094	2956718	1621240	2582563	1929414	2081507	0	0	0	0	0	2	16	4	2016	0
1497	1	2017-10-12 19:10:43.346468	2017-10-12 19:10:43.346468	2016-04-25	0	846889	1151769	1280496	2689482	4717440	1117204	1255580	1341541	2536796	2386397	0	0	0	0	0	2	17	4	2016	1
1498	1	2017-10-12 19:10:43.355297	2017-10-12 19:10:43.355297	2016-04-26	0	359928	372631	746956	2440306	2415214	1188819	910623	935476	1352849	787818	0	0	0	0	0	2	17	4	2016	2
1499	1	2017-10-12 19:10:43.363641	2017-10-12 19:10:43.363641	2016-04-27	0	317583	508133	1013726	1985228	1987785	1543430	1104320	1004033	838578	352246	0	0	0	0	0	2	17	4	2016	3
1500	1	2017-10-12 19:10:43.371794	2017-10-12 19:10:43.371794	2016-04-28	0	846889	948515	2134160	4814878	1387454	2371254	1298070	2008240	2104805	935046	0	0	0	0	0	2	17	4	2016	4
1501	1	2017-10-12 19:10:43.379758	2017-10-12 19:10:43.379758	2016-04-29	0	381100	677511	2027452	2338911	1966819	1173842	1648995	2320733	1607223	996489	0	0	0	0	0	2	17	4	2016	5
1502	1	2017-10-12 19:10:43.387592	2017-10-12 19:10:43.387592	2016-04-30	0	423444	1355022	960372	4162973	4708542	1894223	1637637	2120573	1118098	1763509	0	0	0	0	0	2	17	4	2016	6
1503	1	2017-10-12 19:10:43.395258	2017-10-12 19:10:43.395258	2016-05-01	0	0	0	441000	954522	991321	711720	797960	919431	1032871	1851671	2270068	544542	0	0	0	2	17	5	2016	0
1504	1	2017-10-12 19:10:43.403071	2017-10-12 19:10:43.403071	2016-05-02	0	0	0	396900	407309	711445	1136666	852029	879386	1451805	2863051	761796	1109382	0	0	0	2	18	5	2016	1
1505	1	2017-10-12 19:10:43.411935	2017-10-12 19:10:43.411935	2016-05-03	0	0	0	264600	435915	355362	1461632	522854	810330	1254938	1665881	1689412	1889483	0	0	0	2	18	5	2016	2
1506	1	2017-10-12 19:10:43.420887	2017-10-12 19:10:43.420887	2016-05-04	0	0	0	441000	592374	1352074	831424	562830	1354867	1731970	1947564	2754664	1114585	0	0	0	2	18	5	2016	3
1507	1	2017-10-12 19:10:43.429607	2017-10-12 19:10:43.429607	2016-05-05	0	0	0	220500	755761	502696	682110	913679	1291274	1527110	1231383	882763	941184	0	0	0	2	18	5	2016	4
1508	1	2017-10-12 19:10:43.437987	2017-10-12 19:10:43.437987	2016-05-06	0	0	0	705600	1030129	1500971	1871898	2164927	2936403	3523450	3500571	3511265	1521452	0	0	0	2	18	5	2016	5
1509	1	2017-10-12 19:10:43.446292	2017-10-12 19:10:43.446292	2016-05-07	0	0	0	388080	942992	1369082	1372457	1769684	1897375	3339329	2992671	3080575	2402166	0	0	0	2	18	5	2016	6
1510	1	2017-10-12 19:10:43.454749	2017-10-12 19:10:43.454749	2016-05-08	0	0	0	308700	683827	761275	559261	825170	1434168	2084314	2888055	1873674	1482833	0	0	0	2	18	5	2016	0
1511	1	2017-10-12 19:10:43.463652	2017-10-12 19:10:43.463652	2016-05-09	0	0	0	264600	689112	1194255	423359	367291	1208795	1988889	1499722	1418426	823772	0	0	0	2	19	5	2016	1
1512	1	2017-10-12 19:10:43.472118	2017-10-12 19:10:43.472118	2016-05-10	0	0	0	242550	336794	415011	732530	1218112	693367	1329048	2413264	991273	1865347	0	0	0	2	19	5	2016	2
1513	1	2017-10-12 19:10:43.48051	2017-10-12 19:10:43.48051	2016-05-11	0	0	0	264600	587355	780013	545083	576983	1486403	1917977	1933688	952260	498822	0	0	0	2	19	5	2016	3
1514	1	2017-10-12 19:10:43.489006	2017-10-12 19:10:43.489006	2016-05-12	0	0	0	396900	513419	498969	1324823	1126724	1348493	2345332	1103077	1336728	1049550	0	0	0	2	19	5	2016	4
1515	1	2017-10-12 19:10:43.49751	2017-10-12 19:10:43.49751	2016-05-13	0	0	0	529200	965304	1338764	1734044	1712655	1947545	2988677	3028317	7495740	3094948	0	0	0	2	19	5	2016	5
1516	1	2017-10-12 19:10:43.506781	2017-10-12 19:10:43.506781	2016-05-14	0	0	0	352800	393743	886714	1723536	1810674	2140569	2556575	2149313	4631240	2760734	0	0	0	2	19	5	2016	6
1517	1	2017-10-12 19:10:43.516175	2017-10-12 19:10:43.516175	2016-05-15	0	0	0	198450	601227	1122814	658636	674223	812974	2026595	2202526	1244509	1223563	0	0	0	2	19	5	2016	0
1518	1	2017-10-12 19:10:43.524982	2017-10-12 19:10:43.524982	2016-05-16	0	0	0	374850	528471	786705	632190	1111872	1053567	1761182	1032134	1693304	1834034	0	0	0	2	20	5	2016	1
1519	1	2017-10-12 19:10:43.5335	2017-10-12 19:10:43.5335	2016-05-17	0	0	0	308700	328955	1507604	740684	581867	1375510	2043948	1955405	1913013	1720118	0	0	0	2	20	5	2016	2
1520	1	2017-10-12 19:10:43.542258	2017-10-12 19:10:43.542258	2016-05-18	0	0	0	286650	385933	534179	542984	724669	915251	1520533	3122060	2043944	864240	0	0	0	2	20	5	2016	3
1521	1	2017-10-12 19:10:43.55044	2017-10-12 19:10:43.55044	2016-05-19	0	0	0	418950	743481	711040	1051443	1078163	634627	1176993	1599847	1139036	798246	0	0	0	2	20	5	2016	4
1522	1	2017-10-12 19:10:43.559453	2017-10-12 19:10:43.559453	2016-05-20	0	0	0	485100	2146981	2149371	1226155	2235643	3599812	2133058	2215679	2586266	3087699	0	0	0	2	20	5	2016	5
1523	1	2017-10-12 19:10:43.567858	2017-10-12 19:10:43.567858	2016-05-21	0	0	0	458640	533375	871720	883137	2090473	2195536	3234937	4631732	3310284	2861288	0	0	0	2	20	5	2016	6
1524	1	2017-10-12 19:10:43.576156	2017-10-12 19:10:43.576156	2016-05-22	0	0	0	418950	715656	411397	1392231	564232	1355317	1846912	1543969	2671740	1951444	0	0	0	2	20	5	2016	0
1525	1	2017-10-12 19:10:43.584412	2017-10-12 19:10:43.584412	2016-05-23	0	0	0	308700	924066	669593	642287	885219	844711	2512913	2891798	1124549	1068770	0	0	0	2	21	5	2016	1
1526	1	2017-10-12 19:10:43.592701	2017-10-12 19:10:43.592701	2016-05-24	0	0	0	308700	1031309	1038195	1041710	644021	1309850	1298132	1444572	2032587	1911352	0	0	0	2	21	5	2016	2
1527	1	2017-10-12 19:10:43.603399	2017-10-12 19:10:43.603399	2016-05-25	0	0	0	396900	1040616	733658	923440	1173504	910710	1459607	1444937	1813351	1267449	0	0	0	2	21	5	2016	3
1528	1	2017-10-12 19:10:43.613441	2017-10-12 19:10:43.613441	2016-05-26	0	0	0	374850	733876	397151	877055	677857	1092972	1510813	2322540	1682604	1140129	0	0	0	2	21	5	2016	4
1529	1	2017-10-12 19:10:43.622079	2017-10-12 19:10:43.622079	2016-05-27	0	0	0	882000	1105954	1781448	1980321	792125	2858645	2490943	4091705	4237204	2243818	0	0	0	2	21	5	2016	5
1530	1	2017-10-12 19:10:43.630484	2017-10-12 19:10:43.630484	2016-05-28	0	0	0	599760	1015314	2604079	1716148	2134958	2923852	4005564	2678794	4462600	2373050	0	0	0	2	21	5	2016	6
1531	1	2017-10-12 19:10:43.638496	2017-10-12 19:10:43.638496	2016-05-29	0	0	0	529200	759700	833952	733209	1340869	1006032	2784827	5180731	3244516	1304123	0	0	0	2	21	5	2016	0
1532	1	2017-10-12 19:10:43.646679	2017-10-12 19:10:43.646679	2016-05-30	0	0	0	595350	674405	1370034	1253327	1130166	1597075	2548837	2206018	1981060	1661307	0	0	0	2	22	5	2016	1
1533	1	2017-10-12 19:10:43.655171	2017-10-12 19:10:43.655171	2016-05-31	0	0	0	562275	454399	1324036	1266090	1378364	1384766	2029936	3380540	3418440	1014044	0	0	0	2	22	5	2016	2
1534	1	2017-10-12 19:10:43.663468	2017-10-12 19:10:43.663468	2016-06-01	0	0	0	529200	592855	1153948	1303128	1375360	982535	3373554	3028236	2843256	856462	0	0	0	2	22	6	2016	3
1535	1	2017-10-12 19:10:43.671439	2017-10-12 19:10:43.671439	2016-06-02	0	0	0	496125	856548	535260	1596069	1341759	2168642	2545611	4720500	1671419	1419302	0	0	0	2	22	6	2016	4
1536	1	2017-10-12 19:10:43.67992	2017-10-12 19:10:43.67992	2016-06-03	0	0	0	297675	1304787	659651	993111	826744	2226655	2526140	4184576	2110034	2292410	0	0	0	2	22	6	2016	5
1537	1	2017-10-12 19:10:43.688917	2017-10-12 19:10:43.688917	2016-06-04	0	0	0	496125	1647397	1246694	1336823	1115134	2311502	5175334	2046881	2823126	1657991	0	0	0	2	22	6	2016	6
1538	1	2017-10-12 19:10:43.697861	2017-10-12 19:10:43.697861	2016-06-05	0	0	0	1124550	689482	2316681	3239244	1911397	2393691	3606153	4935552	4407716	3035366	0	0	0	2	22	6	2016	0
1539	1	2017-10-12 19:10:43.707434	2017-10-12 19:10:43.707434	2016-06-06	0	0	0	846720	1770925	1487214	2467385	3251020	1647521	5474993	4126789	6567578	2240060	0	0	0	2	23	6	2016	1
1540	1	2017-10-12 19:10:43.716457	2017-10-12 19:10:43.716457	2016-06-07	0	0	0	562275	1396524	529326	983899	1128183	1360466	3563285	3329469	2425110	2300517	0	0	0	2	23	6	2016	2
1541	1	2017-10-12 19:10:43.724951	2017-10-12 19:10:43.724951	2016-06-08	0	0	0	330750	1390766	472548	589827	950637	2277884	2448784	3754562	4349422	1715001	0	0	0	2	23	6	2016	3
1542	1	2017-10-12 19:10:43.733296	2017-10-12 19:10:43.733296	2016-06-09	0	0	0	661500	1146306	1682036	1446690	523961	2020872	1517100	2613060	2455721	2024950	0	0	0	2	23	6	2016	4
1543	1	2017-10-12 19:10:43.741672	2017-10-12 19:10:43.741672	2016-06-10	0	0	0	661500	517298	683023	1554230	1112395	1501004	2020645	3681948	2531657	1731353	0	0	0	2	23	6	2016	5
1544	1	2017-10-12 19:10:43.749994	2017-10-12 19:10:43.749994	2016-06-11	0	0	0	463050	636165	947321	1356754	1771326	2296446	2899190	3932568	2221663	2009395	0	0	0	2	23	6	2016	6
1545	1	2017-10-12 19:10:43.758421	2017-10-12 19:10:43.758421	2016-06-12	0	0	0	1124550	2665966	2431424	2250978	2603746	2556884	5409765	4602932	3874469	5756394	0	0	0	2	23	6	2016	0
1546	1	2017-10-12 19:10:43.767391	2017-10-12 19:10:43.767391	2016-06-13	0	0	0	582120	1651821	2189823	1499553	1613804	1553477	5267050	7047393	9068030	4145564	0	0	0	2	24	6	2016	1
1547	1	2017-10-12 19:10:43.775588	2017-10-12 19:10:43.775588	2016-06-14	0	0	0	496125	626020	1374221	1962822	1670507	795375	2655723	1605726	2503581	801195	0	0	0	2	24	6	2016	2
1548	1	2017-10-12 19:10:43.783719	2017-10-12 19:10:43.783719	2016-06-15	0	0	0	595350	1610723	774737	559035	713807	2031469	1597106	3749046	2093350	1530785	0	0	0	2	24	6	2016	3
1549	1	2017-10-12 19:10:43.792048	2017-10-12 19:10:43.792048	2016-06-16	0	0	0	628425	656895	1621304	1548977	1162914	2570762	1020632	2616239	2813503	2390465	0	0	0	2	24	6	2016	4
1550	1	2017-10-12 19:10:43.800219	2017-10-12 19:10:43.800219	2016-06-17	0	0	0	297675	732414	1274042	890828	637579	1956253	1045071	2949962	3458361	985559	0	0	0	2	24	6	2016	5
1551	1	2017-10-12 19:10:43.808678	2017-10-12 19:10:43.808678	2016-06-18	0	0	0	363825	445319	1761088	866360	1335489	2874956	2977408	3581514	4054284	1699466	0	0	0	2	24	6	2016	6
1552	1	2017-10-12 19:10:43.817372	2017-10-12 19:10:43.817372	2016-06-19	0	0	0	1124550	1377067	1631633	1901654	2634345	6597340	4588367	9987339	6645170	4776395	0	0	0	2	24	6	2016	0
1553	1	2017-10-12 19:10:43.825921	2017-10-12 19:10:43.825921	2016-06-20	0	0	0	582120	1503978	2253700	2735106	3020647	3647115	2779702	8587827	9255630	3288315	0	0	0	2	25	6	2016	1
1554	1	2017-10-12 19:10:43.834518	2017-10-12 19:10:43.834518	2016-06-21	0	0	0	529200	644307	1440178	1434968	773914	2119492	2674314	2627514	1706222	1772634	0	0	0	2	25	6	2016	2
1555	1	2017-10-12 19:10:43.843135	2017-10-12 19:10:43.843135	2016-06-22	0	0	0	529200	1230242	832030	922592	1734248	2264507	3900848	3779313	2969793	1499866	0	0	0	2	25	6	2016	3
1556	1	2017-10-12 19:10:43.85168	2017-10-12 19:10:43.85168	2016-06-23	0	0	0	529200	991001	1592523	1034265	987367	1986275	2381999	3294812	2189561	1280382	0	0	0	2	25	6	2016	4
1557	1	2017-10-12 19:10:43.860416	2017-10-12 19:10:43.860416	2016-06-24	0	0	0	297675	928670	1679202	737351	1209886	1200476	2161888	1868962	2246335	2465432	0	0	0	2	25	6	2016	5
1558	1	2017-10-12 19:10:43.870253	2017-10-12 19:10:43.870253	2016-06-25	0	0	0	463050	1050908	1305625	999547	1229432	1632672	3247562	3389136	2860308	1432946	0	0	0	2	25	6	2016	6
1559	1	2017-10-12 19:10:43.879439	2017-10-12 19:10:43.879439	2016-06-26	0	0	0	859950	2096855	3429395	3487722	3443652	4298729	5511903	8312544	4555775	5635492	0	0	0	2	25	6	2016	0
1560	1	2017-10-12 19:10:43.889106	2017-10-12 19:10:43.889106	2016-06-27	0	0	0	476280	1034499	1677571	2756856	1733047	2560612	6574942	5870301	8458442	3465712	0	0	0	2	26	6	2016	1
1561	1	2017-10-12 19:10:43.898621	2017-10-12 19:10:43.898621	2016-06-28	0	0	0	363825	1366308	933976	768041	1525106	2210249	2271586	1362196	2444202	1218442	0	0	0	2	26	6	2016	2
1562	1	2017-10-12 19:10:43.907744	2017-10-12 19:10:43.907744	2016-06-29	0	0	0	297675	955280	2279569	1007881	1097951	2352080	3370822	3856967	3303364	2338245	0	0	0	2	26	6	2016	3
1563	1	2017-10-12 19:10:43.918335	2017-10-12 19:10:43.918335	2016-06-30	0	0	0	595350	1312480	603845	1259777	591409	1493624	2310938	3525453	2295695	1279209	0	0	0	2	26	6	2016	4
1564	1	2017-10-12 19:10:43.927021	2017-10-12 19:10:43.927021	2016-07-01	0	338756	406507	1351635	1927771	2247432	1945982	611457	1047425	1805111	661802	0	0	0	0	0	2	26	7	2016	5
1565	1	2017-10-12 19:10:43.935565	2017-10-12 19:10:43.935565	2016-07-02	0	423444	542009	1138219	1330221	3390700	1723619	479535	2200550	1622498	626462	0	0	0	0	0	2	26	7	2016	6
1566	1	2017-10-12 19:10:43.94399	2017-10-12 19:10:43.94399	2016-07-03	0	395215	903348	924803	855998	2610256	1405466	802481	1035048	2575804	1130713	0	0	0	0	0	2	26	7	2016	0
1567	1	2017-10-12 19:10:43.952366	2017-10-12 19:10:43.952366	2016-07-04	0	395215	813013	1422774	685931	2276798	1003034	1001400	970806	1464762	1383291	0	0	0	0	0	2	27	7	2016	1
1568	1	2017-10-12 19:10:43.961171	2017-10-12 19:10:43.961171	2016-07-05	0	254067	383923	355693	1292467	1323611	669888	320277	780999	645811	442958	0	0	0	0	0	2	27	7	2016	2
1569	1	2017-10-12 19:10:43.969763	2017-10-12 19:10:43.969763	2016-07-06	0	282296	429090	320124	406954	1334813	953102	371902	560288	1006154	485782	0	0	0	0	0	2	27	7	2016	3
1570	1	2017-10-12 19:10:43.977785	2017-10-12 19:10:43.977785	2016-07-07	0	564593	632344	1138219	3309621	2840657	1091266	776649	720838	1241635	917955	0	0	0	0	0	2	27	7	2016	4
1571	1	2017-10-12 19:10:43.986201	2017-10-12 19:10:43.986201	2016-07-08	0	395215	496841	1351635	2702461	3503236	1724169	780001	899810	1182107	1748800	0	0	0	0	0	2	27	7	2016	5
1572	1	2017-10-12 19:10:43.994446	2017-10-12 19:10:43.994446	2016-07-09	0	282296	813013	782526	3329656	1931320	1787463	424895	1144609	1314870	1021171	0	0	0	0	0	2	27	7	2016	6
1573	1	2017-10-12 19:10:44.003308	2017-10-12 19:10:44.003308	2016-07-10	0	254067	542009	1067081	1121922	3077787	1068049	917013	1277044	1577828	1120373	0	0	0	0	0	2	27	7	2016	0
1574	1	2017-10-12 19:10:44.011994	2017-10-12 19:10:44.011994	2016-07-11	0	423444	632344	1280497	2073042	2047573	1117290	1249462	1633232	1040520	749982	0	0	0	0	0	2	28	7	2016	1
1575	1	2017-10-12 19:10:44.020908	2017-10-12 19:10:44.020908	2016-07-12	0	197607	271004	569109	1075536	697617	587858	612886	515413	956935	320004	0	0	0	0	0	2	28	7	2016	2
1576	1	2017-10-12 19:10:44.029533	2017-10-12 19:10:44.029533	2016-07-13	0	239952	271004	426832	583683	1313500	463661	451462	345273	769806	419666	0	0	0	0	0	2	28	7	2016	3
1577	1	2017-10-12 19:10:44.037684	2017-10-12 19:10:44.037684	2016-07-14	0	536363	813013	1422774	2877413	1403398	1294490	711872	2032371	2577064	1405076	0	0	0	0	0	2	28	7	2016	4
1578	1	2017-10-12 19:10:44.045952	2017-10-12 19:10:44.045952	2016-07-15	0	508133	542009	782526	3026376	1404034	1188452	1090936	1236965	1034813	623686	0	0	0	0	0	2	28	7	2016	5
1579	1	2017-10-12 19:10:44.056155	2017-10-12 19:10:44.056155	2016-07-16	0	395215	587176	711387	1384657	1567803	1308650	890279	1537725	2146432	1182267	0	0	0	0	0	2	28	7	2016	6
1580	1	2017-10-12 19:10:44.065082	2017-10-12 19:10:44.065082	2016-07-17	0	564593	903348	1351635	748122	1259879	1002916	1168149	1959311	1914266	1245087	0	0	0	0	0	2	28	7	2016	0
1581	1	2017-10-12 19:10:44.074353	2017-10-12 19:10:44.074353	2016-07-18	0	366985	677511	853664	2005921	2779325	1039560	877107	1009771	1958019	1241126	0	0	0	0	0	2	29	7	2016	1
1582	1	2017-10-12 19:10:44.083589	2017-10-12 19:10:44.083589	2016-07-19	0	169378	361339	426832	1359337	2340691	727449	478378	559700	783368	462308	0	0	0	0	0	2	29	7	2016	2
1583	1	2017-10-12 19:10:44.09249	2017-10-12 19:10:44.09249	2016-07-20	0	268181	451674	569109	930700	997097	615442	408587	894593	434298	364421	0	0	0	0	0	2	29	7	2016	3
1584	1	2017-10-12 19:10:44.100861	2017-10-12 19:10:44.100861	2016-07-21	0	395215	632344	1067081	2695242	2636155	1285271	760957	1703506	1736262	907234	0	0	0	0	0	2	29	7	2016	4
1585	1	2017-10-12 19:10:44.108987	2017-10-12 19:10:44.108987	2016-07-22	0	423444	406507	1351635	1850706	1090200	1243901	487833	1039252	1029091	503787	0	0	0	0	0	2	29	7	2016	5
1586	1	2017-10-12 19:10:44.117661	2017-10-12 19:10:44.117661	2016-07-23	0	366985	496841	782526	1771901	3412575	1454766	677118	1592122	2550192	1134248	0	0	0	0	0	2	29	7	2016	6
1587	1	2017-10-12 19:10:44.126849	2017-10-12 19:10:44.126849	2016-07-24	0	338756	722678	782526	3077216	1830529	1339538	1053565	1106898	869979	703633	0	0	0	0	0	2	29	7	2016	0
1588	1	2017-10-12 19:10:44.135094	2017-10-12 19:10:44.135094	2016-07-25	0	536363	722678	1422774	2964044	2182560	1030443	676272	1427881	1406544	603455	0	0	0	0	0	2	30	7	2016	1
1589	1	2017-10-12 19:10:44.143567	2017-10-12 19:10:44.143567	2016-07-26	0	141148	361339	604678	1878324	1005387	459346	707498	495308	907560	266067	0	0	0	0	0	2	30	7	2016	2
1590	1	2017-10-12 19:10:44.151766	2017-10-12 19:10:44.151766	2016-07-27	0	225837	383923	569109	1158755	1128632	650926	437156	430283	366772	500266	0	0	0	0	0	2	30	7	2016	3
1591	1	2017-10-12 19:10:44.160036	2017-10-12 19:10:44.160036	2016-07-28	0	508133	587176	1422774	2374460	1534285	814101	1275092	1682386	877773	675939	0	0	0	0	0	2	30	7	2016	4
1592	1	2017-10-12 19:10:44.168595	2017-10-12 19:10:44.168595	2016-07-29	0	423444	903348	1351635	1935726	5327135	703803	992169	1160412	1117315	709745	0	0	0	0	0	2	30	7	2016	5
1593	1	2017-10-12 19:10:44.177098	2017-10-12 19:10:44.177098	2016-07-30	0	423444	451674	1138219	2329385	2046029	1410829	987480	957938	976131	901661	0	0	0	0	0	2	30	7	2016	6
1594	1	2017-10-12 19:10:44.185277	2017-10-12 19:10:44.185277	2016-07-31	0	677511	1016267	1920744	1995294	3963214	1618028	1334617	2025643	3200995	961099	0	0	0	0	0	2	30	7	2016	0
1595	1	2017-10-12 19:10:44.193275	2017-10-12 19:10:44.193275	2016-08-01	0	804544	609760	1920744	1098932	7037456	2213578	918485	1719211	3758692	1754418	0	0	0	0	0	2	31	8	2016	1
1596	1	2017-10-12 19:10:44.201898	2017-10-12 19:10:44.201898	2016-08-02	0	381100	948515	1280496	2936302	2558973	2063916	2201949	1220116	2194589	1532508	0	0	0	0	0	2	31	8	2016	2
1597	1	2017-10-12 19:10:44.211173	2017-10-12 19:10:44.211173	2016-08-03	0	381100	1016267	1067080	1681279	3882563	1575455	1322151	2157822	1851078	2198795	0	0	0	0	0	2	31	8	2016	3
1598	1	2017-10-12 19:10:44.220619	2017-10-12 19:10:44.220619	2016-08-04	0	254067	643635	907018	954537	2906242	703013	789072	767569	589640	258175	0	0	0	0	0	2	31	8	2016	4
1599	1	2017-10-12 19:10:44.229753	2017-10-12 19:10:44.229753	2016-08-05	0	402272	338756	693602	1418146	1937876	702456	715572	1365325	1241228	420245	0	0	0	0	0	2	31	8	2016	5
1600	1	2017-10-12 19:10:44.23839	2017-10-12 19:10:44.23839	2016-08-06	0	381100	880764	1067080	2290476	4399899	1595881	900991	3081060	3341672	1987565	0	0	0	0	0	2	31	8	2016	6
1601	1	2017-10-12 19:10:44.24715	2017-10-12 19:10:44.24715	2016-08-07	0	508133	813013	1280496	5543705	3482525	908817	771953	1650058	1377970	1993365	0	0	0	0	0	2	31	8	2016	0
1602	1	2017-10-12 19:10:44.255742	2017-10-12 19:10:44.255742	2016-08-08	0	550478	880764	1280496	5704524	5227382	1174293	1125645	1318251	1651021	1152548	0	0	0	0	0	2	32	8	2016	1
1603	1	2017-10-12 19:10:44.26482	2017-10-12 19:10:44.26482	2016-08-09	0	465789	745262	1387204	2375082	3824333	1362302	972141	1386934	1379646	2294375	0	0	0	0	0	2	32	8	2016	2
1604	1	2017-10-12 19:10:44.273778	2017-10-12 19:10:44.273778	2016-08-10	0	550478	1084018	1920744	4839849	1296450	1372201	947190	1222318	2266697	1413430	0	0	0	0	0	2	32	8	2016	3
1605	1	2017-10-12 19:10:44.282222	2017-10-12 19:10:44.282222	2016-08-11	0	402272	643635	480186	795577	2980819	735254	1002499	1497892	556212	705164	0	0	0	0	0	2	32	8	2016	4
1606	1	2017-10-12 19:10:44.290424	2017-10-12 19:10:44.290424	2016-08-12	0	338756	474258	1067080	1261332	1193285	1064340	434126	1096730	591352	708218	0	0	0	0	0	2	32	8	2016	5
1607	1	2017-10-12 19:10:44.298616	2017-10-12 19:10:44.298616	2016-08-13	0	423444	1287271	960372	2641334	3675496	998167	1102011	1949076	1946184	1319173	0	0	0	0	0	2	32	8	2016	6
1608	1	2017-10-12 19:10:44.307119	2017-10-12 19:10:44.307119	2016-08-14	0	719855	1084018	960372	3544025	2362687	1991051	1160953	1732769	1732657	1325800	0	0	0	0	0	2	32	8	2016	0
1609	1	2017-10-12 19:10:44.316353	2017-10-12 19:10:44.316353	2016-08-15	0	592822	1151769	1173788	1979216	2236374	2630004	1090718	1433705	3335963	1055666	0	0	0	0	0	2	33	8	2016	1
1610	1	2017-10-12 19:10:44.325522	2017-10-12 19:10:44.325522	2016-08-16	0	635167	813013	1067080	2478049	3036329	1690232	1049612	1929593	3090640	2481194	0	0	0	0	0	2	33	8	2016	2
1611	1	2017-10-12 19:10:44.334025	2017-10-12 19:10:44.334025	2016-08-17	0	719855	1016267	2134160	4787758	4967466	1717732	970322	2682060	2300368	2129691	0	0	0	0	0	2	33	8	2016	3
1612	1	2017-10-12 19:10:44.342348	2017-10-12 19:10:44.342348	2016-08-18	0	381100	406507	800310	1297514	753110	1388162	457155	870303	456504	457241	0	0	0	0	0	2	33	8	2016	4
1613	1	2017-10-12 19:10:44.350491	2017-10-12 19:10:44.350491	2016-08-19	0	381100	677511	746956	1338056	3807843	1103382	502636	959852	945303	577834	0	0	0	0	0	2	33	8	2016	5
1614	1	2017-10-12 19:10:44.359173	2017-10-12 19:10:44.359173	2016-08-20	0	635167	948515	1600620	4097752	4299422	2726759	1056592	2125314	2283653	1297230	0	0	0	0	0	2	33	8	2016	6
1615	1	2017-10-12 19:10:44.36788	2017-10-12 19:10:44.36788	2016-08-21	0	508133	1151769	960372	2355761	2028439	2529529	1043023	1265947	995889	2263975	0	0	0	0	0	2	33	8	2016	0
1616	1	2017-10-12 19:10:44.376006	2017-10-12 19:10:44.376006	2016-08-22	0	550478	609760	1387204	4090918	1717317	3159194	1449720	2173912	1553531	1424657	0	0	0	0	0	2	34	8	2016	1
1617	1	2017-10-12 19:10:44.384488	2017-10-12 19:10:44.384488	2016-08-23	0	804544	1084018	1814036	1760657	5742153	1478359	1279926	2905384	1653784	1040754	0	0	0	0	0	2	34	8	2016	2
1618	1	2017-10-12 19:10:44.393009	2017-10-12 19:10:44.393009	2016-08-24	0	635167	813013	1280496	2373072	2122848	1675806	807159	2548928	1902597	2651552	0	0	0	0	0	2	34	8	2016	3
1619	1	2017-10-12 19:10:44.40171	2017-10-12 19:10:44.40171	2016-08-25	0	254067	542009	640248	1866116	2213946	938541	862695	654833	1068039	580497	0	0	0	0	0	2	34	8	2016	4
1620	1	2017-10-12 19:10:44.412074	2017-10-12 19:10:44.412074	2016-08-26	0	423444	406507	746956	1091875	3180456	857461	773024	1004033	698815	493144	0	0	0	0	0	2	34	8	2016	5
1621	1	2017-10-12 19:10:44.422222	2017-10-12 19:10:44.422222	2016-08-27	0	465789	1355022	2027452	5381334	2158261	1863128	1233167	1227258	2487497	1438532	0	0	0	0	0	2	34	8	2016	6
1622	1	2017-10-12 19:10:44.432208	2017-10-12 19:10:44.432208	2016-08-28	0	381100	1355022	1280496	3118548	1966819	1814119	1454996	1418226	1821519	1992978	0	0	0	0	0	2	34	8	2016	0
1623	1	2017-10-12 19:10:44.441701	2017-10-12 19:10:44.441701	2016-08-29	0	635167	813013	1280496	2341672	5885678	1736371	948105	2120573	1229908	2094167	0	0	0	0	0	2	35	8	2016	1
1624	1	2017-10-12 19:10:44.453064	2017-10-12 19:10:44.453064	2016-08-30	0	0	0	308700	429535	936248	1186200	748088	1195260	1408461	1742749	1135034	726056	0	0	0	2	35	8	2016	2
1625	1	2017-10-12 19:10:44.463095	2017-10-12 19:10:44.463095	2016-08-31	0	0	0	198450	339424	1106692	757777	692273	1172515	1110204	3578814	1523592	610160	0	0	0	2	35	8	2016	3
1626	1	2017-10-12 19:10:44.472266	2017-10-12 19:10:44.472266	2016-09-01	0	0	0	198450	272447	552786	730816	617919	1377561	1254938	1332704	1299548	1364627	0	0	0	2	35	9	2016	4
1627	1	2017-10-12 19:10:44.481228	2017-10-12 19:10:44.481228	2016-09-02	0	0	0	374850	473899	1352074	600473	562830	1270188	1443308	1622970	1836443	1114585	0	0	0	2	35	9	2016	5
1628	1	2017-10-12 19:10:44.517059	2017-10-12 19:10:44.517059	2016-09-03	0	0	0	220500	577935	628370	891990	967424	1092617	859000	2325945	882763	1035302	0	0	0	2	35	9	2016	6
1629	1	2017-10-12 19:10:44.525542	2017-10-12 19:10:44.525542	2016-09-04	0	0	0	749700	629523	1773875	1637910	1025492	3327923	2936208	3000490	3160139	2586468	0	0	0	2	35	9	2016	0
1630	1	2017-10-12 19:10:44.534072	2017-10-12 19:10:44.534072	2016-09-05	0	0	0	352800	1114445	1685024	1900325	1179789	1370326	1855183	5686075	2772518	2402166	0	0	0	2	36	9	2016	1
1631	1	2017-10-12 19:10:44.542607	2017-10-12 19:10:44.542607	2016-09-06	0	0	0	264600	812045	1218040	1118522	1060933	985991	1961707	2310444	2107883	1318074	0	0	0	2	36	9	2016	2
1632	1	2017-10-12 19:10:44.550877	2017-10-12 19:10:44.550877	2016-09-07	0	0	0	441000	765680	1279559	577308	408101	906596	1988889	2849472	1773033	823772	0	0	0	2	36	9	2016	3
1633	1	2017-10-12 19:10:44.561886	2017-10-12 19:10:44.561886	2016-09-08	0	0	0	286650	246982	415011	1391807	791773	1001530	949320	1327295	1441851	1761717	0	0	0	2	36	9	2016	4
1634	1	2017-10-12 19:10:44.573419	2017-10-12 19:10:44.573419	2016-09-09	0	0	0	352800	545401	992744	454236	843283	1189122	2429437	1757898	1428390	1053069	0	0	0	2	36	9	2016	5
1635	1	2017-10-12 19:10:44.584815	2017-10-12 19:10:44.584815	2016-09-10	0	0	0	396900	616102	614115	1472026	957715	780706	1172666	1103077	954806	1224475	0	0	0	2	36	9	2016	6
1636	1	2017-10-12 19:10:44.597144	2017-10-12 19:10:44.597144	2016-09-11	0	0	0	617400	681391	2677529	2167556	1007444	1428199	3218575	4680126	5996592	3571094	0	0	0	2	36	9	2016	0
1637	1	2017-10-12 19:10:44.609458	2017-10-12 19:10:44.609458	2016-09-12	0	0	0	564480	322153	1076724	1838438	2011860	2259490	1917431	1791094	3762883	2070551	0	0	0	2	37	9	2016	1
1638	1	2017-10-12 19:10:44.621186	2017-10-12 19:10:44.621186	2016-09-13	0	0	0	418950	567826	898251	774866	1213601	1138164	1576240	1651895	1244509	1295537	0	0	0	2	37	9	2016	2
1639	1	2017-10-12 19:10:44.632237	2017-10-12 19:10:44.632237	2016-09-14	0	0	0	330750	772380	1048940	875340	936314	1170630	2303084	928921	1354643	2037816	0	0	0	2	37	9	2016	3
1640	1	2017-10-12 19:10:44.643398	2017-10-12 19:10:44.643398	2016-09-15	0	0	0	418950	475157	793476	888821	581867	773725	2335941	1466554	1554323	774053	0	0	0	2	37	9	2016	4
1641	1	2017-10-12 19:10:44.654699	2017-10-12 19:10:44.654699	2016-09-16	0	0	0	198450	450255	534179	839157	790548	732200	1647244	2081374	2180206	972270	0	0	0	2	37	9	2016	5
1642	1	2017-10-12 19:10:44.666373	2017-10-12 19:10:44.666373	2016-09-17	0	0	0	308700	743481	660252	680346	907926	1057712	2353986	2763371	854277	1197369	0	0	0	2	37	9	2016	6
1643	1	2017-10-12 19:10:44.677619	2017-10-12 19:10:44.677619	2016-09-18	0	0	0	573300	1920983	1357498	1131835	1397277	2652493	3490459	3446612	3448355	1929812	0	0	0	2	37	9	2016	0
1644	1	2017-10-12 19:10:44.689016	2017-10-12 19:10:44.689016	2016-09-19	0	0	0	493920	1185278	817238	963422	2090473	2073561	3529022	3936972	4213089	2002902	0	0	0	2	38	9	2016	1
1645	1	2017-10-12 19:10:44.700423	2017-10-12 19:10:44.700423	2016-09-20	0	0	0	198450	402557	537980	1392231	1253848	1514766	1500616	992552	2270979	1027076	0	0	0	2	38	9	2016	2
1646	1	2017-10-12 19:10:44.712468	2017-10-12 19:10:44.712468	2016-09-21	0	0	0	308700	770055	1004390	340034	817126	1689422	2380655	2168849	1737939	667981	0	0	0	2	38	9	2016	3
1647	1	2017-10-12 19:10:44.723882	2017-10-12 19:10:44.723882	2016-09-22	0	0	0	396900	759912	1038195	781283	702569	1001650	1888192	1031837	2322957	1529082	0	0	0	2	38	9	2016	4
1648	1	2017-10-12 19:10:44.73487	2017-10-12 19:10:44.73487	2016-09-23	0	0	0	374850	734552	641950	1154300	880128	1190928	2335371	1204114	2092328	1462442	0	0	0	2	38	9	2016	5
1649	1	2017-10-12 19:10:44.746217	2017-10-12 19:10:44.746217	2016-09-24	0	0	0	374850	524197	595727	730880	451904	1689139	2609585	1990748	1822821	1064120	0	0	0	2	38	9	2016	6
1650	1	2017-10-12 19:10:44.758151	2017-10-12 19:10:44.758151	2016-09-25	0	0	0	441000	1244198	1687687	2376385	792125	3215975	2740037	5114631	6548407	1715861	0	0	0	2	38	9	2016	0
1651	1	2017-10-12 19:10:44.770252	2017-10-12 19:10:44.770252	2016-09-26	0	0	0	388080	888399	1531811	1188103	2247324	1461926	5238045	3090917	4462600	2135745	0	0	0	2	39	9	2016	1
1652	1	2017-10-12 19:10:44.782018	2017-10-12 19:10:44.782018	2016-09-27	0	0	0	496125	1381272	1516276	1133142	819420	2123845	2386994	3453821	2481101	2608245	0	0	0	2	39	9	2016	2
1653	1	2017-10-12 19:10:44.794106	2017-10-12 19:10:44.794106	2016-09-28	0	0	0	463050	1146489	1245485	1105877	941805	1026691	2848700	2206018	2179166	1329046	0	0	0	2	39	9	2016	3
1654	1	2017-10-12 19:10:44.806126	2017-10-12 19:10:44.806126	2016-09-29	0	0	0	463050	619635	1125431	893711	842334	1644410	2754913	2197351	3247518	2028088	0	0	0	2	39	9	2016	4
1655	1	2017-10-12 19:10:44.817751	2017-10-12 19:10:44.817751	2016-09-30	0	0	0	661500	1077918	980856	1390003	1768320	1179042	3795248	4037648	2640166	856462	0	0	0	2	39	9	2016	5
1656	1	2017-10-12 19:10:44.828968	2017-10-12 19:10:44.828968	2016-10-01	0	0	0	496125	1162458	729900	1915283	2064244	2168642	2349794	2832300	1367525	1324681	0	0	0	2	39	10	2016	6
1657	1	2017-10-12 19:10:44.840249	2017-10-12 19:10:44.840249	2016-10-02	0	0	0	496125	1098768	732946	759438	1377906	2095675	3199777	4742519	3516724	1490067	0	0	0	2	39	10	2016	0
1658	1	2017-10-12 19:10:44.851957	2017-10-12 19:10:44.851957	2016-10-03	0	0	0	562275	1162868	1038912	1002617	619519	2447473	5175334	2388028	3764168	1657991	0	0	0	2	40	10	2016	1
1659	1	2017-10-12 19:10:44.863228	2017-10-12 19:10:44.863228	2016-10-04	0	0	0	1058400	758430	1707028	2267471	3610416	4548013	4808204	10967894	3729606	3225077	0	0	0	2	40	10	2016	2
1660	1	2017-10-12 19:10:44.874303	2017-10-12 19:10:44.874303	2016-10-05	0	0	0	635040	2102973	1892818	3701077	2438265	1947070	2737497	4126789	4222014	2488955	0	0	0	2	40	10	2016	3
1661	1	2017-10-12 19:10:44.885225	2017-10-12 19:10:44.885225	2016-10-06	0	0	0	595350	1187045	481205	1041775	1041400	906977	1886445	3329469	3171297	2435841	0	0	0	2	40	10	2016	4
1662	1	2017-10-12 19:10:44.89694	2017-10-12 19:10:44.89694	2016-10-07	0	0	0	661500	772648	472548	825758	887261	1265491	2736876	3003649	1957240	1592501	0	0	0	2	40	10	2016	5
1663	1	2017-10-12 19:10:44.908275	2017-10-12 19:10:44.908275	2016-10-08	0	0	0	396900	1587193	890490	1253798	989704	1876524	1930855	5226120	2311267	2180716	0	0	0	2	40	10	2016	6
1664	1	2017-10-12 19:10:44.920577	2017-10-12 19:10:44.920577	2016-10-09	0	0	0	363825	655244	683023	1467884	1483194	1501004	2020645	4248402	2025325	1615929	0	0	0	2	40	10	2016	0
1665	1	2017-10-12 19:10:44.932123	2017-10-12 19:10:44.932123	2016-10-10	0	0	0	529200	867498	1291802	1669851	1211960	2296446	4744129	2840188	3332495	1578810	0	0	0	2	41	10	2016	1
1666	1	2017-10-12 19:10:44.944064	2017-10-12 19:10:44.944064	2016-10-11	0	0	0	595350	2132773	4322531	2250978	1822622	3409179	7868749	3766036	6586597	6835717	0	0	0	2	41	10	2016	2
1667	1	2017-10-12 19:10:44.956324	2017-10-12 19:10:44.956324	2016-10-12	0	0	0	899640	1651821	1516031	1799464	3227609	2796259	5267050	5168088	12090706	1865504	0	0	0	2	41	10	2016	3
1668	1	2017-10-12 19:10:44.968317	2017-10-12 19:10:44.968317	2016-10-13	0	0	0	363825	722331	970038	1079552	1357287	954450	3186868	2248016	1449441	1246304	0	0	0	2	41	10	2016	4
1669	1	2017-10-12 19:10:44.980043	2017-10-12 19:10:44.980043	2016-10-14	0	0	0	628425	1231729	946901	745380	785188	1305944	1597106	2565137	3425481	1884043	0	0	0	2	41	10	2016	5
1670	1	2017-10-12 19:10:44.992262	2017-10-12 19:10:44.992262	2016-10-15	0	0	0	396900	394137	767986	1106412	795678	2313686	1474247	1692860	3014468	2812312	0	0	0	2	41	10	2016	6
1671	1	2017-10-12 19:10:45.003664	2017-10-12 19:10:45.003664	2016-10-16	0	0	0	297675	993991	1104169	1484714	1159234	1380884	1625666	3123490	3458361	1533092	0	0	0	2	41	10	2016	0
1672	1	2017-10-12 19:10:45.014816	2017-10-12 19:10:45.014816	2016-10-17	0	0	0	628425	890638	1956764	708840	1540949	1868721	3225525	3581514	2928094	2643614	0	0	0	2	42	10	2016	1
1673	1	2017-10-12 19:10:45.025982	2017-10-12 19:10:45.025982	2016-10-18	0	0	0	1190700	2142104	1631633	2074531	2927050	3958404	5964877	4730845	5537642	3714974	0	0	0	2	42	10	2016	2
1674	1	2017-10-12 19:10:45.037791	2017-10-12 19:10:45.037791	2016-10-19	0	0	0	740880	1851050	2736636	3711929	1430833	4103005	2779702	5725218	11723798	3082796	0	0	0	2	42	10	2016	3
1675	1	2017-10-12 19:10:45.04926	2017-10-12 19:10:45.04926	2016-10-20	0	0	0	429975	1159753	1550961	1229972	928697	1246760	3030889	1970635	3602024	1684002	0	0	0	2	42	10	2016	4
1676	1	2017-10-12 19:10:45.060446	2017-10-12 19:10:45.060446	2016-10-21	0	0	0	595350	1153352	416015	1025102	1825524	1332063	3684135	2907164	1979862	1411638	0	0	0	2	42	10	2016	5
1677	1	2017-10-12 19:10:45.0716	2017-10-12 19:10:45.0716	2016-10-22	0	0	0	628425	991001	1094860	1965104	1077127	1986275	2165454	3530156	1824635	1813875	0	0	0	2	42	10	2016	6
1678	1	2017-10-12 19:10:45.083289	2017-10-12 19:10:45.083289	2016-10-23	0	0	0	363825	510769	839601	1179762	1512357	1200476	1441259	2907274	2246335	1946394	0	0	0	2	42	10	2016	0
1679	1	2017-10-12 19:10:45.094816	2017-10-12 19:10:45.094816	2016-10-24	0	0	0	496125	1663938	1506491	529172	956225	2938810	2051092	2330031	4940532	1432946	0	0	0	2	43	10	2016	1
1680	1	2017-10-12 19:10:45.105978	2017-10-12 19:10:45.105978	2016-10-25	0	0	0	992250	1480133	3631124	2569900	2754922	3104638	8479850	8312544	10123944	3443912	0	0	0	2	43	10	2016	2
1681	1	2017-10-12 19:10:45.117658	2017-10-12 19:10:45.117658	2016-10-26	0	0	0	687960	1379332	1765864	2412249	2132981	3072734	4844694	9031232	5286526	4332140	0	0	0	2	43	10	2016	3
1682	1	2017-10-12 19:10:45.130262	2017-10-12 19:10:45.130262	2016-10-27	0	0	0	562275	819785	1660402	768041	1255969	2210249	1703689	2724392	1901046	2315040	0	0	0	2	43	10	2016	4
1683	1	2017-10-12 19:10:45.142223	2017-10-12 19:10:45.142223	2016-10-28	0	0	0	297675	553057	2159591	1007881	1158949	1361731	2059947	2268804	2331786	2461310	0	0	0	2	43	10	2016	5
1684	1	2017-10-12 19:10:45.154507	2017-10-12 19:10:45.154507	2016-10-29	0	0	0	595350	1312480	543461	1938118	591409	1294474	2002813	2488555	1658002	1395500	0	0	0	2	43	10	2016	6
1685	1	2017-10-12 19:10:45.166248	2017-10-12 19:10:45.166248	2016-10-30	0	508133	722678	782526	3329786	1348459	1297321	698808	1271874	2123660	808869	0	0	0	0	0	2	43	10	2016	0
1686	1	2017-10-12 19:10:45.178272	2017-10-12 19:10:45.178272	2016-10-31	0	395215	542009	640248	1625825	2637211	1939072	697506	1650413	1043034	512560	0	0	0	0	0	2	44	10	2016	1
1687	1	2017-10-12 19:10:45.189796	2017-10-12 19:10:45.189796	2016-11-01	0	423444	722678	924803	1283997	3212622	1331494	481488	940953	2060643	1064200	0	0	0	0	0	2	44	11	2016	2
1688	1	2017-10-12 19:10:45.201091	2017-10-12 19:10:45.201091	2016-11-02	0	395215	722678	1209358	1067004	3541686	1217970	667600	1262048	2319207	1752169	0	0	0	0	0	2	44	11	2016	3
1689	1	2017-10-12 19:10:45.212789	2017-10-12 19:10:45.212789	2016-11-03	0	268181	225837	604678	1005252	1654514	636394	640553	551293	447100	442958	0	0	0	0	0	2	44	11	2016	4
1690	1	2017-10-12 19:10:45.224843	2017-10-12 19:10:45.224843	2016-11-04	0	225837	383923	320124	665924	1092119	635401	418390	387892	1006154	457206	0	0	0	0	0	2	44	11	2016	5
1691	1	2017-10-12 19:10:45.236203	2017-10-12 19:10:45.236203	2016-11-05	0	564593	813013	1422774	2530887	5164830	909389	943073	1021187	2359107	1223940	0	0	0	0	0	2	44	11	2016	6
1692	1	2017-10-12 19:10:45.247502	2017-10-12 19:10:45.247502	2016-11-06	0	254067	677511	1067081	1651504	1946242	1622747	540001	1145213	1182107	1748800	0	0	0	0	0	2	44	11	2016	0
1693	1	2017-10-12 19:10:45.258839	2017-10-12 19:10:45.258839	2016-11-07	0	395215	542009	1422774	3329656	1755745	1599309	509874	1144609	1561409	1616854	0	0	0	0	0	2	45	11	2016	1
1694	1	2017-10-12 19:10:45.270567	2017-10-12 19:10:45.270567	2016-11-08	0	423444	632344	782526	1121922	3239776	1691078	851512	709469	1577828	1252182	0	0	0	0	0	2	45	11	2016	2
1695	1	2017-10-12 19:10:45.281913	2017-10-12 19:10:45.281913	2016-11-09	0	310526	406507	1280497	1554782	2661845	968318	1249462	816616	1040520	886343	0	0	0	0	0	2	45	11	2016	3
1696	1	2017-10-12 19:10:45.293421	2017-10-12 19:10:45.293421	2016-11-10	0	155263	316172	533540	1368864	797277	587858	490309	552228	805840	352004	0	0	0	0	0	2	45	11	2016	4
1697	1	2017-10-12 19:10:45.304784	2017-10-12 19:10:45.304784	2016-11-11	0	211722	203253	426832	1167367	985125	318767	580451	586964	962258	398683	0	0	0	0	0	2	45	11	2016	5
1698	1	2017-10-12 19:10:45.31742	2017-10-12 19:10:45.31742	2016-11-12	0	338756	632344	995942	2260825	1403398	1294490	578396	1925404	2577064	1248957	0	0	0	0	0	2	45	11	2016	6
1699	1	2017-10-12 19:10:45.330111	2017-10-12 19:10:45.330111	2016-11-13	0	395215	722678	1280497	1702337	2667665	1620617	1363670	1484357	1034813	963878	0	0	0	0	0	2	45	11	2016	0
1700	1	2017-10-12 19:10:45.342138	2017-10-12 19:10:45.342138	2016-11-14	0	254067	722678	711387	846179	2961405	1226859	534167	1845270	1207368	788178	0	0	0	0	0	2	46	11	2016	1
1701	1	2017-10-12 19:10:45.354038	2017-10-12 19:10:45.354038	2016-11-15	0	564593	587176	1280497	997496	1356793	1704957	1323902	1632759	1148560	1494104	0	0	0	0	0	2	46	11	2016	2
1702	1	2017-10-12 19:10:45.366076	2017-10-12 19:10:45.366076	2016-11-16	0	508133	722678	1280497	4011842	1961876	866300	923270	841476	2610692	930845	0	0	0	0	0	2	46	11	2016	3
1703	1	2017-10-12 19:10:45.378098	2017-10-12 19:10:45.378098	2016-11-17	0	239952	316172	320124	679668	2210653	574302	377667	373133	548358	660440	0	0	0	0	0	2	46	11	2016	4
1704	1	2017-10-12 19:10:45.389563	2017-10-12 19:10:45.389563	2016-11-18	0	127033	271004	533540	1861400	1052492	461581	578831	944292	738307	532616	0	0	0	0	0	2	46	11	2016	5
1705	1	2017-10-12 19:10:45.400897	2017-10-12 19:10:45.400897	2016-11-19	0	536363	767846	782526	2887760	5272310	1512084	402860	1793164	1061049	960601	0	0	0	0	0	2	46	11	2016	6
1706	1	2017-10-12 19:10:45.412593	2017-10-12 19:10:45.412593	2016-11-20	0	338756	587176	995942	1665635	1090200	1818009	975667	952647	735065	615739	0	0	0	0	0	2	46	11	2016	0
1707	1	2017-10-12 19:10:45.424904	2017-10-12 19:10:45.424904	2016-11-21	0	254067	722678	853664	1328926	4550100	1119051	1046455	2274460	1657625	567124	0	0	0	0	0	2	47	11	2016	1
1708	1	2017-10-12 19:10:45.43631	2017-10-12 19:10:45.43631	2016-11-22	0	254067	722678	711387	3269542	1184460	1413957	665410	1180691	1256636	914723	0	0	0	0	0	2	47	11	2016	2
1709	1	2017-10-12 19:10:45.447845	2017-10-12 19:10:45.447845	2016-11-23	0	338756	587176	1138219	2964044	2380974	961747	732628	1427881	1790146	1072810	0	0	0	0	0	2	47	11	2016	3
1710	1	2017-10-12 19:10:45.459638	2017-10-12 19:10:45.459638	2016-11-24	0	239952	225837	640247	939162	740811	510384	389124	561349	857140	228058	0	0	0	0	0	2	47	11	2016	4
1711	1	2017-10-12 19:10:45.471012	2017-10-12 19:10:45.471012	2016-11-25	0	282296	361339	569109	869066	1612332	488195	460164	661974	366772	275146	0	0	0	0	0	2	47	11	2016	5
1712	1	2017-10-12 19:10:45.482018	2017-10-12 19:10:45.482018	2016-11-26	0	508133	496841	640248	3165946	1875237	1480184	1500108	841193	1667769	831925	0	0	0	0	0	2	47	11	2016	6
1713	1	2017-10-12 19:10:45.494042	2017-10-12 19:10:45.494042	2016-11-27	0	310526	406507	995942	1426324	2803755	774183	992169	1243299	2110484	456265	0	0	0	0	0	2	47	11	2016	0
1714	1	2017-10-12 19:10:45.506551	2017-10-12 19:10:45.506551	2016-11-28	0	479904	767846	1138219	2329385	3069043	1097312	1172633	957938	1464197	689506	0	0	0	0	0	2	48	11	2016	1
1715	1	2017-10-12 19:10:45.519133	2017-10-12 19:10:45.519133	2016-11-29	0	381100	1084018	2027452	3083637	4755857	2049502	702430	2181462	2259526	1922198	0	0	0	0	0	2	48	11	2016	2
1716	1	2017-10-12 19:10:45.530993	2017-10-12 19:10:45.530993	2016-11-30	0	846889	1151769	1707328	1465243	5185494	1747562	1001983	1085818	3341059	1378472	0	0	0	0	0	2	48	11	2016	3
1717	1	2017-10-12 19:10:45.542238	2017-10-12 19:10:45.542238	2016-12-01	0	423444	609760	1814036	3425685	2814870	1621649	1712627	2074197	2340894	1129216	0	0	0	0	0	2	48	12	2016	4
1718	1	2017-10-12 19:10:45.553369	2017-10-12 19:10:45.553369	2016-12-02	0	677511	745262	1173788	1681279	5269192	1913053	1017039	2022959	2313848	1832330	0	0	0	0	0	2	48	12	2016	5
1719	1	2017-10-12 19:10:45.565645	2017-10-12 19:10:45.565645	2016-12-03	0	296411	440382	693602	1718167	2906242	644428	649824	1364566	825496	286861	0	0	0	0	0	2	48	12	2016	6
1720	1	2017-10-12 19:10:45.577235	2017-10-12 19:10:45.577235	2016-12-04	0	423444	338756	693602	3151436	1253920	540351	437294	682663	1055044	646530	0	0	0	0	0	2	48	12	2016	0
1721	1	2017-10-12 19:10:45.588679	2017-10-12 19:10:45.588679	2016-12-05	0	508133	1355022	1173788	1374286	4917534	2659802	1902092	2310795	3968236	1325043	0	0	0	0	0	2	49	12	2016	1
1722	1	2017-10-12 19:10:45.600105	2017-10-12 19:10:45.600105	2016-12-06	0	592822	677511	1280496	3079836	6268545	1544989	771953	1523130	1492800	1196019	0	0	0	0	0	2	49	12	2016	2
1723	1	2017-10-12 19:10:45.612211	2017-10-12 19:10:45.612211	2016-12-07	0	846889	1151769	2134160	3169180	4530397	1996298	1227977	2050612	3302042	1728823	0	0	0	0	0	2	49	12	2016	3
1724	1	2017-10-12 19:10:45.623689	2017-10-12 19:10:45.623689	2016-12-08	0	719855	745262	1173788	1526838	1811526	1981530	972141	2219094	2069469	1086809	0	0	0	0	0	2	49	12	2016	4
1725	1	2017-10-12 19:10:45.635011	2017-10-12 19:10:45.635011	2016-12-09	0	846889	1084018	1600620	3056747	2448850	1688862	947190	1589013	2400032	2237930	0	0	0	0	0	2	49	12	2016	5
1726	1	2017-10-12 19:10:45.646399	2017-10-12 19:10:45.646399	2016-12-10	0	232894	609760	907018	875135	3167120	459534	1058194	1248243	427855	470109	0	0	0	0	0	2	49	12	2016	6
1727	1	2017-10-12 19:10:45.658299	2017-10-12 19:10:45.658299	2016-12-11	0	423444	542009	907018	1038744	1591046	1520486	868252	804268	827893	424931	0	0	0	0	0	2	49	12	2016	0
1728	1	2017-10-12 19:10:45.669827	2017-10-12 19:10:45.669827	2016-12-12	0	592822	1151769	1920744	1390176	4492272	1996333	1591794	1461807	2757094	2158646	0	0	0	0	0	2	50	12	2016	1
1729	1	2017-10-12 19:10:45.682255	2017-10-12 19:10:45.682255	2016-12-13	0	592822	745262	1067080	3071488	2598956	2986576	995102	1325059	1443881	1988699	0	0	0	0	0	2	50	12	2016	2
1730	1	2017-10-12 19:10:45.69465	2017-10-12 19:10:45.69465	2016-12-14	0	592822	813013	1600620	2474021	2396115	2320592	1227058	1290335	3961456	1919392	0	0	0	0	0	2	50	12	2016	3
1731	1	2017-10-12 19:10:45.706943	2017-10-12 19:10:45.706943	2016-12-15	0	635167	813013	2134160	1749211	6747398	1193105	909663	1828035	2781576	1116537	0	0	0	0	0	2	50	12	2016	4
1732	1	2017-10-12 19:10:45.718859	2017-10-12 19:10:45.718859	2016-12-16	0	592822	1084018	2027452	5086993	6031923	1981998	970322	3576080	2927742	1681335	0	0	0	0	0	2	50	12	2016	5
1733	1	2017-10-12 19:10:45.730221	2017-10-12 19:10:45.730221	2016-12-17	0	232894	677511	640248	1397323	1355598	1179938	587770	621645	788508	685862	0	0	0	0	0	2	50	12	2016	6
1734	1	2017-10-12 19:10:45.741624	2017-10-12 19:10:45.741624	2016-12-18	0	232894	609760	1067080	1070444	3407018	1241305	682149	1476696	547281	888976	0	0	0	0	0	2	50	12	2016	0
1735	1	2017-10-12 19:10:45.753714	2017-10-12 19:10:45.753714	2016-12-19	0	592822	1287271	1493912	3585533	5374278	2405964	1462973	2942743	1756656	1651020	0	0	0	0	0	2	51	12	2016	1
1736	1	2017-10-12 19:10:45.7653	2017-10-12 19:10:45.7653	2016-12-20	0	381100	1151769	1600620	2479748	3042659	2380733	1706765	973805	995889	1429879	0	0	0	0	0	2	51	12	2016	2
1737	1	2017-10-12 19:10:45.776347	2017-10-12 19:10:45.776347	2016-12-21	0	635167	677511	1493912	2629876	3625447	2685315	1760374	1406649	1553531	1205479	0	0	0	0	0	2	51	12	2016	3
1738	1	2017-10-12 19:10:45.787475	2017-10-12 19:10:45.787475	2016-12-22	0	635167	948515	1814036	2721015	4785128	2792456	1194598	2743973	1929414	1618950	0	0	0	0	0	2	51	12	2016	4
1739	1	2017-10-12 19:10:45.7992	2017-10-12 19:10:45.7992	2016-12-23	0	381100	813013	1707328	2689482	2122848	1675806	896843	2280620	2748196	2253819	0	0	0	0	0	2	51	12	2016	5
1740	1	2017-10-12 19:10:45.810862	2017-10-12 19:10:45.810862	2016-12-24	0	402272	508133	533540	1291927	2012678	625694	479275	888702	1281647	787818	0	0	0	0	0	2	51	12	2016	6
1741	1	2017-10-12 19:10:45.822687	2017-10-12 19:10:45.822687	2016-12-25	0	254067	542009	746956	1885967	1789007	1629176	883456	1081266	698815	634043	0	0	0	0	0	2	51	12	2016	0
1742	1	2017-10-12 19:10:45.834261	2017-10-12 19:10:45.834261	2016-12-26	0	846889	1355022	1280496	4814878	1387454	3218131	584132	1896671	3252880	1366605	0	0	0	0	0	2	52	12	2016	1
1743	1	2017-10-12 19:10:45.846713	2017-10-12 19:10:45.846713	2016-12-27	0	719855	1151769	1067080	3118548	2130721	960416	872997	2578592	1821519	1660815	0	0	0	0	0	2	52	12	2016	2
1744	1	2017-10-12 19:10:45.859648	2017-10-12 19:10:45.859648	2016-12-28	0	592822	1151769	2134160	3382415	4316164	1420667	1120488	2356192	2124386	1983947	0	0	0	0	0	2	52	12	2016	3
1745	1	2017-10-12 19:10:45.871963	2017-10-12 19:10:45.871963	2016-12-29	0	719855	1151769	2027452	3164096	4245696	1340645	1704002	2548928	2536796	1590931	0	0	0	0	0	2	52	12	2016	4
1746	1	2017-10-12 19:10:45.884634	2017-10-12 19:10:45.884634	2016-12-30	0	359928	406507	1067080	2296758	3220285	1251388	479275	608059	1424052	580497	0	0	0	0	0	2	52	12	2016	5
1747	1	2017-10-12 19:10:45.897414	2017-10-12 19:10:45.897414	2016-12-31	0	296411	440382	800310	1588182	3180456	1371938	883456	849566	978341	317021	0	0	0	0	0	2	52	12	2016	6
1748	1	2018-05-03 21:29:04.104467	2018-05-03 21:29:04.104467	2018-04-30	2018	5	1	1	12184805	0	0	0	0	0	0	0	0	0	0	0	1	18	4	2018	1
1749	1	2018-05-03 21:29:04.191472	2018-05-03 21:29:04.191472	2018-05-01	2018	5	1	2	10449099	0	0	0	0	0	0	0	0	0	0	0	1	18	5	2018	2
1750	1	2018-05-03 21:29:04.201473	2018-05-03 21:29:04.201473	2018-05-02	2018	5	1	3	23306002	0	0	0	0	0	0	0	0	0	0	0	1	18	5	2018	3
1751	1	2018-05-03 21:29:04.211474	2018-05-03 21:29:04.211474	2018-05-03	2018	5	1	4	20206657	0	0	0	0	0	0	0	0	0	0	0	1	18	5	2018	4
1752	1	2018-05-03 21:29:04.221474	2018-05-03 21:29:04.221474	2018-05-04	2018	5	1	5	17265233	0	0	0	0	0	0	0	0	0	0	0	1	18	5	2018	5
1753	1	2018-05-03 21:29:04.232475	2018-05-03 21:29:04.232475	2018-05-05	2018	5	1	6	14928378	0	0	0	0	0	0	0	0	0	0	0	1	18	5	2018	6
1754	1	2018-05-03 21:29:04.242475	2018-05-03 21:29:04.242475	2018-05-06	2018	5	1	7	14328452	0	0	0	0	0	0	0	0	0	0	0	1	18	5	2018	0
1755	1	2018-05-03 21:29:04.252476	2018-05-03 21:29:04.252476	2018-05-07	2018	5	2	1	17782517	0	0	0	0	0	0	0	0	0	0	0	1	19	5	2018	1
1756	1	2018-05-03 21:29:04.268477	2018-05-03 21:29:04.268477	2018-05-08	2018	5	2	2	16432814	0	0	0	0	0	0	0	0	0	0	0	1	19	5	2018	2
1757	1	2018-05-03 21:29:04.279477	2018-05-03 21:29:04.279477	2018-05-09	2018	5	2	3	12184805	0	0	0	0	0	0	0	0	0	0	0	1	19	5	2018	3
1758	1	2018-05-03 21:29:04.288478	2018-05-03 21:29:04.288478	2018-05-10	2018	5	2	4	10449099	0	0	0	0	0	0	0	0	0	0	0	1	19	5	2018	4
1759	1	2018-05-03 21:29:04.298479	2018-05-03 21:29:04.298479	2018-05-11	2018	5	2	5	23306002	0	0	0	0	0	0	0	0	0	0	0	1	19	5	2018	5
1760	1	2018-05-03 21:29:04.307479	2018-05-03 21:29:04.307479	2018-05-12	2018	5	2	6	20206657	0	0	0	0	0	0	0	0	0	0	0	1	19	5	2018	6
1761	1	2018-05-03 21:29:04.31648	2018-05-03 21:29:04.31648	2018-05-13	2018	5	2	7	17265233	0	0	0	0	0	0	0	0	0	0	0	1	19	5	2018	0
1762	1	2018-05-03 21:29:04.32548	2018-05-03 21:29:04.32548	2018-05-14	2018	5	3	1	14928378	0	0	0	0	0	0	0	0	0	0	0	1	20	5	2018	1
1763	1	2018-05-03 21:29:04.334481	2018-05-03 21:29:04.334481	2018-05-15	2018	5	3	2	14328452	0	0	0	0	0	0	0	0	0	0	0	1	20	5	2018	2
1764	1	2018-05-03 21:29:04.357482	2018-05-03 21:29:04.357482	2018-05-16	2018	5	3	3	17782517	0	0	0	0	0	0	0	0	0	0	0	1	20	5	2018	3
1765	1	2018-05-03 21:29:04.366482	2018-05-03 21:29:04.366482	2018-05-17	2018	5	3	4	16432814	0	0	0	0	0	0	0	0	0	0	0	1	20	5	2018	4
1766	1	2018-05-03 21:29:04.376483	2018-05-03 21:29:04.376483	2018-05-18	2018	5	3	5	12184805	0	0	0	0	0	0	0	0	0	0	0	1	20	5	2018	5
1767	1	2018-05-03 21:29:04.385483	2018-05-03 21:29:04.385483	2018-05-19	2018	5	3	6	10449099	0	0	0	0	0	0	0	0	0	0	0	1	20	5	2018	6
1768	1	2018-05-03 21:29:04.394484	2018-05-03 21:29:04.394484	2018-05-20	2018	5	3	7	23306002	0	0	0	0	0	0	0	0	0	0	0	1	20	5	2018	0
1769	1	2018-05-03 21:29:04.403485	2018-05-03 21:29:04.403485	2018-05-21	2018	5	4	1	20206657	0	0	0	0	0	0	0	0	0	0	0	1	21	5	2018	1
1770	1	2018-05-03 21:29:04.412485	2018-05-03 21:29:04.412485	2018-05-22	2018	5	4	2	17265233	0	0	0	0	0	0	0	0	0	0	0	1	21	5	2018	2
1771	1	2018-05-03 21:29:04.421486	2018-05-03 21:29:04.421486	2018-05-23	2018	5	4	3	14928378	0	0	0	0	0	0	0	0	0	0	0	1	21	5	2018	3
1772	1	2018-05-03 21:29:04.431486	2018-05-03 21:29:04.431486	2018-05-24	2018	5	4	4	14328452	0	0	0	0	0	0	0	0	0	0	0	1	21	5	2018	4
1773	1	2018-05-03 21:29:04.440487	2018-05-03 21:29:04.440487	2018-05-25	2018	5	4	5	17782517	0	0	0	0	0	0	0	0	0	0	0	1	21	5	2018	5
1774	1	2018-05-03 21:29:04.449487	2018-05-03 21:29:04.449487	2018-05-26	2018	5	4	6	16432814	0	0	0	0	0	0	0	0	0	0	0	1	21	5	2018	6
1775	1	2018-05-03 21:29:04.458488	2018-05-03 21:29:04.458488	2018-05-27	2018	5	4	7	9164359	0	0	0	0	0	0	0	0	0	0	0	1	21	5	2018	0
\.


--
-- Name: sale_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: coke
--

SELECT pg_catalog.setval('public.sale_plans_id_seq', 1775, true);


--
-- Data for Name: sale_reals; Type: TABLE DATA; Schema: public; Owner: coke
--

COPY public.sale_reals (id, store_id, department_id, sale_date, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty, twenty_one, twenty_two, twenty_three, twenty_four, week, month, year, day_number, created_at, updated_at) FROM stdin;
992	2	7	2018-09-16	0	0	0	352800	289450	282801	888520	1185822	610167	2534222	2775165	2725258	756210	0	0	0	37	9	2018	5	2017-10-12 18:47:46.368323	2018-05-20 15:17:42.73057
991	2	7	2018-09-15	0	0	0	242550	328955	1190214	1185094	363667	859694	1313967	2199830	1076070	1204083	0	0	0	37	9	2018	4	2017-10-12 18:47:46.358319	2018-05-20 15:17:42.73857
990	2	7	2018-09-14	0	0	0	441000	813032	944046	875340	819274	819441	2438559	1857841	1693304	1018908	0	0	0	37	9	2018	3	2017-10-12 18:47:46.348853	2018-05-20 15:17:42.747571
989	2	7	2018-09-13	0	0	0	352800	634629	617548	697379	1146179	1463353	2251772	1238921	1617862	1295537	0	0	0	37	9	2018	2	2017-10-12 18:47:46.339528	2018-05-20 15:17:42.756571
988	2	7	2018-09-12	0	0	0	352800	536922	950051	1149024	1508895	1783808	2556575	1611985	4631240	2070551	0	0	0	37	9	2018	1	2017-10-12 18:47:46.330273	2018-05-20 15:17:42.764572
987	2	7	2018-09-11	0	0	0	661500	1078869	2677529	1445037	1511166	1817708	2069084	3854221	5621805	4523385	0	0	0	36	9	2018	0	2017-10-12 18:47:46.321091	2018-05-20 15:17:42.772572
986	2	7	2018-09-10	0	0	0	352800	479191	614115	662412	1070388	638760	1172666	1875231	1718651	1224475	0	0	0	36	9	2018	6	2017-10-12 18:47:46.311591	2018-05-20 15:17:42.774572
984	2	7	2018-09-08	0	0	0	220500	291888	539514	1391807	669962	1463775	1423980	1327295	1802314	1243565	0	0	0	36	9	2018	4	2017-10-12 18:47:46.288842	2018-05-20 15:17:42.804573
983	2	7	2018-09-07	0	0	0	396900	382840	1364862	346385	571341	1913925	1420635	1799666	1418426	617829	0	0	0	36	9	2018	3	2017-10-12 18:47:46.278951	2018-05-20 15:17:42.807573
982	2	7	2018-09-06	0	0	0	374850	769306	1141913	1118522	766229	1165262	1716494	2310444	1873674	1318074	0	0	0	36	9	2018	2	2017-10-12 18:47:46.269804	2018-05-20 15:17:42.822573
981	2	7	2018-09-05	0	0	0	529200	1114445	947826	950162	2359578	1054097	2226220	5386808	4312805	2916916	0	0	0	36	9	2018	1	2017-10-12 18:47:46.25936	2018-05-20 15:17:42.828574
980	2	7	2018-09-04	0	0	0	441000	1087359	1228067	1286930	1025492	2544883	5285174	3500571	6320277	3042904	0	0	0	35	9	2018	0	2017-10-12 18:47:46.248773	2018-05-20 15:17:42.828574
979	2	7	2018-09-03	0	0	0	286650	622391	596952	577170	1074916	1887247	1336222	1778664	882763	847066	0	0	0	35	9	2018	6	2017-10-12 18:47:46.237845	2018-05-20 15:17:42.845574
978	2	7	2018-09-02	0	0	0	220500	789832	853942	600473	519535	1608905	2742285	2163960	1683406	911933	0	0	0	35	9	2018	5	2017-10-12 18:47:46.228514	2018-05-20 15:17:42.852575
977	2	7	2018-09-01	0	0	0	308700	245202	710725	657734	570386	1296528	1952125	1332704	1819367	1574570	0	0	0	35	9	2018	4	2017-10-12 18:47:46.218891	2018-05-20 15:17:42.859575
976	2	7	2018-08-31	0	0	0	308700	509136	1580988	1262962	905281	879386	1195604	2326229	1523592	554691	0	0	0	35	8	2018	3	2017-10-12 18:47:46.208275	2018-05-20 15:17:42.859575
975	2	7	2018-08-30	0	0	0	374850	859070	826101	1008270	797960	1379147	1408461	1851671	1261149	726056	0	0	0	35	8	2018	2	2017-10-12 18:47:46.198866	2018-05-20 15:17:42.873575
974	2	7	2018-08-29	0	677511	880764	1814036	3122230	5100921	2841334	861914	1060286	1118098	1212412	0	0	0	0	0	35	8	2018	1	2017-10-12 18:47:46.190255	2018-05-20 15:17:42.881576
973	2	7	2018-08-28	0	592822	1219520	1600620	1715201	2622426	2027545	1842994	1160366	2035816	1771536	0	0	0	0	0	34	8	2018	0	2017-10-12 18:47:46.181739	2018-05-20 15:17:42.888576
972	2	7	2018-08-27	0	465789	1355022	2134160	2549053	1849938	1863128	778842	1338827	3444226	1006972	0	0	0	0	0	34	8	2018	6	2017-10-12 18:47:46.172926	2018-05-20 15:17:43.035583
971	2	7	2018-08-26	0	211722	338756	746956	1985228	1987785	943207	662592	926800	838578	493144	0	0	0	0	0	34	8	2018	5	2017-10-12 18:47:46.161688	2018-05-20 15:17:43.062584
970	2	7	2018-08-25	0	254067	677511	800310	1291927	1811410	875972	670985	467738	1210444	539033	0	0	0	0	0	34	8	2018	4	2017-10-12 18:47:46.152629	2018-05-20 15:17:43.069585
969	2	7	2018-08-24	0	550478	813013	1493912	2373072	2830464	1787526	1255580	1341541	3593795	2651552	0	0	0	0	0	34	8	2018	3	2017-10-12 18:47:46.144348	2018-05-20 15:17:43.077585
968	2	7	2018-08-23	0	423444	1287271	1814036	3201194	4466119	2299669	1535911	3228204	2067230	1734590	0	0	0	0	0	34	8	2018	2	2017-10-12 18:47:46.135984	2018-05-20 15:17:43.084586
967	2	7	2018-08-22	0	592822	1016267	1814036	5844168	3434634	2685315	1553271	1790281	1792536	1643835	0	0	0	0	0	34	8	2018	1	2017-10-12 18:47:46.127373	2018-05-20 15:17:43.090586
966	2	7	2018-08-21	0	508133	609760	1173788	1611836	3380732	1339162	1043023	973805	1438506	1072409	0	0	0	0	0	33	8	2018	0	2017-10-12 18:47:46.117496	2018-05-20 15:17:43.096586
965	2	7	2018-08-20	0	677511	1084018	1814036	2817205	6090848	3207952	1219145	2125314	1580990	2004810	0	0	0	0	0	33	8	2018	6	2017-10-12 18:47:46.108402	2018-05-20 15:17:43.096586
964	2	7	2018-08-19	0	338756	677511	693602	1070444	2805779	827537	574442	1033687	945303	622283	0	0	0	0	0	33	8	2018	5	2017-10-12 18:47:46.0999	2018-05-20 15:17:43.107586
963	2	7	2018-08-18	0	317583	338756	533540	1696750	1054354	902305	489809	1056797	788508	411517	0	0	0	0	0	33	8	2018	4	2017-10-12 18:47:46.091424	2018-05-20 15:17:43.113587
962	2	7	2018-08-17	0	635167	609760	2134160	5685463	5322285	1189199	970322	1788040	3973364	1232979	0	0	0	0	0	33	8	2018	3	2017-10-12 18:47:46.082723	2018-05-20 15:17:43.117587
961	2	7	2018-08-16	0	508133	745262	960372	1603444	6410028	894829	699741	1320248	1390788	1984955	0	0	0	0	0	33	8	2018	2	2017-10-12 18:47:46.073963	2018-05-20 15:17:43.117587
960	2	7	2018-08-15	0	550478	948515	960372	2309086	1437669	2165885	1022549	2150558	3752959	1727453	0	0	0	0	0	33	8	2018	1	2017-10-12 18:47:46.063883	2018-05-20 15:17:43.131587
959	2	7	2018-08-14	0	719855	813013	1493912	2362683	2126418	2654734	1658504	917348	2598986	1325800	0	0	0	0	0	32	8	2018	0	2017-10-12 18:47:46.05441	2018-05-20 15:17:43.137588
958	2	7	2018-08-13	0	423444	1151769	960372	1946246	6125826	1885426	2204023	2761191	2919276	1439098	0	0	0	0	0	32	8	2018	6	2017-10-12 18:47:46.045634	2018-05-20 15:17:43.146588
957	2	7	2018-08-12	0	317583	609760	800310	1187136	1093844	912292	530598	877384	1123569	460342	0	0	0	0	0	32	8	2018	5	2017-10-12 18:47:46.036668	2018-05-20 15:17:43.148588
955	2	7	2018-08-10	0	635167	609760	1920744	3056747	2881000	949985	884044	1222318	1200016	1649001	0	0	0	0	0	32	8	2018	3	2017-10-12 18:47:46.015893	2018-05-20 15:17:43.165589
954	2	7	2018-08-09	0	508133	948515	1920744	1696487	3623053	2353066	874927	2496481	2184440	1449079	0	0	0	0	0	32	8	2018	2	2017-10-12 18:47:45.990027	2018-05-20 15:17:43.169589
953	2	7	2018-08-08	0	677511	1287271	1600620	6338360	4181905	2113727	1227977	2636501	2017915	1344640	0	0	0	0	0	32	8	2018	1	2017-10-12 18:47:45.979499	2018-05-20 15:17:43.169589
952	2	7	2018-08-07	0	846889	1151769	1814036	3387820	5572040	1635871	1003539	1903913	1377970	2524929	0	0	0	0	0	31	8	2018	0	2017-10-12 18:47:45.969845	2018-05-20 15:17:43.182589
951	2	7	2018-08-06	0	423444	880764	1387204	1985079	4399899	2260832	1401541	2156742	4177090	2517582	0	0	0	0	0	31	8	2018	6	2017-10-12 18:47:45.960969	2018-05-20 15:17:43.188589
950	2	7	2018-08-05	0	359928	609760	746956	2048433	2051869	864562	675818	910217	868860	581877	0	0	0	0	0	31	8	2018	5	2017-10-12 18:47:45.952702	2018-05-20 15:17:43.19459
949	2	7	2018-08-04	0	296411	677511	907018	1718167	1835521	644428	835488	1449852	766532	286861	0	0	0	0	0	31	8	2018	4	2017-10-12 18:47:45.944215	2018-05-20 15:17:43.20059
947	2	7	2018-08-02	0	719855	948515	1493912	2691610	4606151	2506184	1957288	1464139	1755671	887241	0	0	0	0	0	31	8	2018	2	2017-10-12 18:47:45.925975	2018-05-20 15:17:43.212591
946	2	7	2018-08-01	0	762200	1084018	1814036	2197865	5185494	1281545	834986	1447757	2505794	1127840	0	0	0	0	0	31	8	2018	1	2017-10-12 18:47:45.916924	2018-05-20 15:17:43.218591
945	2	7	2018-07-31	0	762200	948515	2134160	2176685	4755857	1078685	1264374	1714006	2824407	1729978	0	0	0	0	0	30	7	2018	0	2017-10-12 18:47:45.907557	2018-05-20 15:17:43.220591
944	2	7	2018-07-30	0	310526	813013	1209358	3599959	2046029	1175691	740610	1045024	1757036	583428	0	0	0	0	0	30	7	2018	6	2017-10-12 18:47:45.899458	2018-05-20 15:17:43.220591
943	2	7	2018-07-29	0	423444	542009	853664	1324444	3084131	1126085	1050532	1409072	2358776	912530	0	0	0	0	0	30	7	2018	5	2017-10-12 18:47:45.89116	2018-05-20 15:17:43.235591
942	2	7	2018-07-28	0	282296	813013	1422774	1741270	2557142	1036129	975070	1869318	877773	623944	0	0	0	0	0	30	7	2018	4	2017-10-12 18:47:45.882541	2018-05-20 15:17:43.241592
941	2	7	2018-07-27	0	254067	383923	533540	1351881	725549	610244	437156	364086	253919	350186	0	0	0	0	0	30	7	2018	3	2017-10-12 18:47:45.872685	2018-05-20 15:17:43.246592
940	2	7	2018-07-26	0	127033	271004	604678	1878324	846642	918691	530624	396246	907560	361091	0	0	0	0	0	30	7	2018	2	2017-10-12 18:47:45.863216	2018-05-20 15:17:43.252592
939	2	7	2018-07-25	0	536363	632344	1351635	1333820	2182560	1236532	1127120	1343888	1278676	1206911	0	0	0	0	0	30	7	2018	1	2017-10-12 18:47:45.853881	2018-05-20 15:17:43.258593
938	2	7	2018-07-24	0	282296	496841	782526	1923260	1292138	1116282	665410	664139	1256636	1407266	0	0	0	0	0	29	7	2018	0	2017-10-12 18:47:45.845362	2018-05-20 15:17:43.263593
937	2	7	2018-07-23	0	395215	542009	640248	1993388	4095090	1566671	677118	1819568	1912644	1197262	0	0	0	0	0	29	7	2018	6	2017-10-12 18:47:45.836937	2018-05-20 15:17:43.269593
936	2	7	2018-07-22	0	508133	677511	853664	1573100	1288418	1339586	1029870	779439	1249611	559763	0	0	0	0	0	29	7	2018	5	2017-10-12 18:47:45.828724	2018-05-20 15:17:43.274594
935	2	7	2018-07-21	0	479904	903348	711387	3272794	3954233	1285271	716195	1255215	1350426	480300	0	0	0	0	0	29	7	2018	4	2017-10-12 18:47:45.820249	2018-05-20 15:17:43.280594
934	2	7	2018-07-20	0	141148	338756	604678	1240933	553943	1025736	510734	596395	434298	392454	0	0	0	0	0	29	7	2018	3	2017-10-12 18:47:45.809873	2018-05-20 15:17:43.286594
933	2	7	2018-07-19	0	183493	406507	462401	755187	2080614	421155	352489	335820	705031	627418	0	0	0	0	0	29	7	2018	2	2017-10-12 18:47:45.800839	2018-05-20 15:17:43.292595
932	2	7	2018-07-18	0	310526	722678	640248	2206513	2288856	1645970	923270	841476	1305346	682619	0	0	0	0	0	29	7	2018	1	2017-10-12 18:47:45.792913	2018-05-20 15:17:43.294595
931	2	7	2018-07-17	0	508133	813013	1067081	1496245	1356793	1303791	700889	1088506	957133	1660116	0	0	0	0	0	28	7	2018	0	2017-10-12 18:47:45.784872	2018-05-20 15:17:43.294595
930	2	7	2018-07-16	0	310526	677511	1422774	1307732	2090404	1063278	771575	1742755	1475672	788178	0	0	0	0	0	28	7	2018	6	2017-10-12 18:47:45.776577	2018-05-20 15:17:43.309595
929	2	7	2018-07-15	0	508133	767846	1067081	3593822	2527261	1188452	818202	989572	1404389	793782	0	0	0	0	0	28	7	2018	5	2017-10-12 18:47:45.768426	2018-05-20 15:17:43.315596
928	2	7	2018-07-14	0	479904	632344	1422774	3288472	1603883	1051773	711872	1497537	1417385	702538	0	0	0	0	0	28	7	2018	4	2017-10-12 18:47:45.758698	2018-05-20 15:17:43.321596
927	2	7	2018-07-13	0	211722	383923	391262	648537	985125	463661	419215	552437	866032	377699	0	0	0	0	0	28	7	2018	3	2017-10-12 18:47:45.750675	2018-05-20 15:17:43.327596
926	2	7	2018-07-12	0	169378	293588	640247	1368864	647787	636847	337087	515413	1007300	288004	0	0	0	0	0	28	7	2018	2	2017-10-12 18:47:45.74232	2018-05-20 15:17:43.332596
925	2	7	2018-07-11	0	366985	858181	1351635	2591303	2047573	1042804	702823	1633232	1040520	1295424	0	0	0	0	0	28	7	2018	1	2017-10-12 18:47:45.733871	2018-05-20 15:17:43.335597
924	2	7	2018-07-10	0	423444	542009	711387	1009730	2105854	979045	589508	1064204	2063314	1054469	0	0	0	0	0	27	7	2018	0	2017-10-12 18:47:45.724911	2018-05-20 15:17:43.335597
923	2	7	2018-07-09	0	282296	406507	995942	2830208	1755745	1034847	637343	1487992	1561409	1106269	0	0	0	0	0	27	7	2018	6	2017-10-12 18:47:45.716823	2018-05-20 15:17:43.350597
922	2	7	2018-07-08	0	536363	451674	711387	2252051	2919363	1115639	960002	1145213	2127793	1472674	0	0	0	0	0	27	7	2018	5	2017-10-12 18:47:45.707776	2018-05-20 15:17:43.355597
921	2	7	2018-07-07	0	423444	813013	1422774	2725570	3357140	970014	887598	1141326	2359107	1040349	0	0	0	0	0	27	7	2018	4	2017-10-12 18:47:45.699372	2018-05-20 15:17:43.361598
920	2	7	2018-07-06	0	225837	451674	497970	517941	2062892	688351	255683	818883	1006154	571508	0	0	0	0	0	27	7	2018	3	2017-10-12 18:47:45.691204	2018-05-20 15:17:43.366598
918	2	7	2018-07-04	0	479904	542009	1422774	685931	4553597	1432906	1068160	970806	1220635	829975	0	0	0	0	0	27	7	2018	1	2017-10-12 18:47:45.673348	2018-05-20 15:17:43.379598
917	2	7	2018-07-03	0	479904	858181	1351635	1455197	3212622	813691	748982	1317334	1803063	731638	0	0	0	0	0	26	7	2018	0	2017-10-12 18:47:45.664185	2018-05-20 15:17:43.385598
916	2	7	2018-07-02	0	395215	722678	1209358	2217035	2825583	1077262	566723	990248	1738391	512560	0	0	0	0	0	26	7	2018	6	2017-10-12 18:47:45.65566	2018-05-20 15:17:43.387599
915	2	7	2018-07-01	0	338756	587176	995942	2453527	1236088	1729762	524106	1421506	1486562	882402	0	0	0	0	0	26	7	2018	5	2017-10-12 18:47:45.647371	2018-05-20 15:17:43.387599
914	2	7	2018-06-30	0	0	0	297675	694842	1086921	1550494	768832	1194899	2156875	2903314	1147847	1860667	0	0	0	26	6	2018	4	2017-10-12 18:47:45.63913	2018-05-20 15:17:43.402599
913	2	7	2018-06-29	0	0	0	363825	603335	1319750	2015762	853962	1114143	3370822	3856967	3691995	1722917	0	0	0	26	6	2018	3	2017-10-12 18:47:45.630026	2018-05-20 15:17:43.408599
912	2	7	2018-06-28	0	0	0	496125	888100	1556627	1536082	1076545	1512276	1703689	2875747	1765257	1340286	0	0	0	26	6	2018	2	2017-10-12 18:47:45.621635	2018-05-20 15:17:43.408599
910	2	7	2018-06-26	0	0	0	793800	1603477	3631124	3671286	2754922	2627001	6783880	6562535	8605352	4696244	0	0	0	25	6	2018	0	2017-10-12 18:47:45.605528	2018-05-20 15:17:43.4256
909	2	7	2018-06-25	0	0	0	529200	963333	1908221	764360	819622	2775542	2051092	1906389	4940532	1432946	0	0	0	25	6	2018	6	2017-10-12 18:47:45.597784	2018-05-20 15:17:43.4316
908	2	7	2018-06-24	0	0	0	496125	557202	1511282	884821	907414	1371973	1681469	3322598	3209050	2335673	0	0	0	25	6	2018	5	2017-10-12 18:47:45.589925	2018-05-20 15:17:43.4366
907	2	7	2018-06-23	0	0	0	330750	1171183	1692056	1965104	1436170	1862133	4330908	4471530	2311204	1173684	0	0	0	25	6	2018	4	2017-10-12 18:47:45.581122	2018-05-20 15:17:43.442601
906	2	7	2018-06-22	0	0	0	396900	1076461	739582	1435143	1551695	1731682	2817279	3779313	2144851	1323411	0	0	0	25	6	2018	3	2017-10-12 18:47:45.572671	2018-05-20 15:17:43.448601
905	2	7	2018-06-21	0	0	0	628425	1030891	1994092	1127475	1083480	1122084	3387464	1970635	3033283	1684002	0	0	0	25	6	2018	2	2017-10-12 18:47:45.56447	2018-05-20 15:17:43.454601
904	2	7	2018-06-20	0	0	0	529200	1735359	1448807	3711929	2702684	2735336	3011343	8587827	11723798	1849677	0	0	0	25	6	2018	1	2017-10-12 18:47:45.556049	2018-05-20 15:17:43.460602
903	2	7	2018-06-19	0	0	0	727650	2295111	2008163	2593164	2048935	3298670	9176734	7884741	5537642	3184264	0	0	0	24	6	2018	0	2017-10-12 18:47:45.548167	2018-05-20 15:17:43.465602
902	2	7	2018-06-18	0	0	0	429975	643239	1174058	1496440	1027299	1868721	3969877	3357669	2252380	3587762	0	0	0	24	6	2018	6	2017-10-12 18:47:45.539802	2018-05-20 15:17:43.471602
901	2	7	2018-06-17	0	0	0	496125	680099	1358978	1583694	927387	2071327	1277309	3123490	4611148	1533092	0	0	0	24	6	2018	5	2017-10-12 18:47:45.531072	2018-05-20 15:17:43.477603
900	2	7	2018-06-16	0	0	0	496125	481723	1621304	995771	856884	2185148	2268072	2924032	3215432	1828003	0	0	0	24	6	2018	4	2017-10-12 18:47:45.522072	2018-05-20 15:17:43.482603
899	2	7	2018-06-15	0	0	0	595350	1515974	1463392	1055955	642426	1305944	2306931	2762455	3806090	1413032	0	0	0	24	6	2018	3	2017-10-12 18:47:45.513622	2018-05-20 15:17:43.488603
898	2	7	2018-06-14	0	0	0	562275	626020	1131711	1766540	1044067	1511213	3540964	2087444	1185907	1157282	0	0	0	24	6	2018	2	2017-10-12 18:47:45.505172	2018-05-20 15:17:43.494604
897	2	7	2018-06-13	0	0	0	529200	1351490	2358271	2849151	2868986	2485563	6254621	4698262	10881635	3731008	0	0	0	24	6	2018	1	2017-10-12 18:47:45.496666	2018-05-20 15:17:43.499604
896	2	7	2018-06-12	0	0	0	595350	1199685	2971740	2438560	1562248	1917663	4917968	4602932	3487022	6116168	0	0	0	23	6	2018	0	2017-10-12 18:47:45.487488	2018-05-20 15:17:43.499604
895	2	7	2018-06-11	0	0	0	429975	983164	947321	1148023	1491643	1766497	2372064	3495616	3702772	2439979	0	0	0	23	6	2018	6	2017-10-12 18:47:45.477901	2018-05-20 15:17:43.511604
894	2	7	2018-06-10	0	0	0	562275	310379	910698	1036153	1297794	1300870	2755425	3398722	2869211	2308470	0	0	0	23	6	2018	5	2017-10-12 18:47:45.468354	2018-05-20 15:17:43.517604
893	2	7	2018-06-09	0	0	0	330750	1410838	1978866	1543136	815051	2453916	2482528	4964814	2889084	2336481	0	0	0	23	6	2018	4	2017-10-12 18:47:45.459386	2018-05-20 15:17:43.523605
892	2	7	2018-06-08	0	0	0	661500	927178	682569	1061689	823885	1771687	2880922	3504257	2392182	2205002	0	0	0	23	6	2018	3	2017-10-12 18:47:45.450551	2018-05-20 15:17:43.528605
891	2	7	2018-06-07	0	0	0	330750	907741	721808	694517	1301750	1269768	3353680	5122260	1865469	1353245	0	0	0	23	6	2018	2	2017-10-12 18:47:45.441847	2018-05-20 15:17:43.535605
890	2	7	2018-06-06	0	0	0	476280	1549559	2028020	3495462	3251020	2546168	5474993	7336514	5160240	4977910	0	0	0	23	6	2018	1	2017-10-12 18:47:45.432662	2018-05-20 15:17:43.540606
889	2	7	2018-06-05	0	0	0	992250	1241068	1219306	1781584	3610416	3111798	5609572	9322710	5763937	3414787	0	0	0	22	6	2018	0	2017-10-12 18:47:45.424121	2018-05-20 15:17:43.540606
888	2	7	2018-06-04	0	0	0	396900	1550491	969651	2005234	1053182	2719414	4140267	2729174	3764168	1934323	0	0	0	22	6	2018	6	2017-10-12 18:47:45.416068	2018-05-20 15:17:43.552606
887	2	7	2018-06-03	0	0	0	496125	1030095	1172714	701020	1194185	1440777	2862958	5021491	1758362	1490067	0	0	0	22	6	2018	5	2017-10-12 18:47:45.408367	2018-05-20 15:17:43.559606
886	2	7	2018-06-02	0	0	0	628425	978912	924540	1596069	928910	1403239	1762346	4012425	1975314	1135441	0	0	0	22	6	2018	4	2017-10-12 18:47:45.400477	2018-05-20 15:17:43.565606
885	2	7	2018-06-01	0	0	0	496125	592855	692369	955627	1866560	1965070	3584401	2422589	3452525	1627278	0	0	0	22	6	2018	3	2017-10-12 18:47:45.392564	2018-05-20 15:17:43.570607
884	2	7	2018-05-31	0	0	0	628425	413090	1125431	1415042	689182	1211671	1884940	2366378	2221986	1115448	0	0	0	22	5	2018	2	2017-10-12 18:47:45.384405	2018-05-20 15:17:43.571607
883	2	7	2018-05-30	0	0	0	628425	1281370	1619131	1474502	1255740	1026691	2099042	3393874	3764014	996784	0	0	0	22	5	2018	1	2017-10-12 18:47:45.375698	2018-05-20 15:17:43.583607
881	2	7	2018-05-28	0	0	0	670320	634571	2450898	1848160	2247324	2761415	5238045	3915161	4183688	1186525	0	0	0	21	5	2018	6	2017-10-12 18:47:45.359567	2018-05-20 15:17:43.595608
880	2	7	2018-05-27	0	0	0	661500	1244198	1406406	1716278	1144181	2858645	3736415	6478533	4622405	2375807	0	0	0	21	5	2018	5	2017-10-12 18:47:45.350989	2018-05-20 15:17:43.598608
879	2	7	2018-05-26	0	0	0	242550	1048394	357436	487253	753174	1589778	2334892	2820227	2523906	912103	0	0	0	21	5	2018	4	2017-10-12 18:47:45.342791	2018-05-20 15:17:43.598608
878	2	7	2018-05-25	0	0	0	286650	1101829	550243	1096585	938803	910710	2773253	1926582	1952839	1462442	0	0	0	21	5	2018	3	2017-10-12 18:47:45.334191	2018-05-20 15:17:43.613608
877	2	7	2018-05-24	0	0	0	352800	922750	583985	651069	936758	1232800	1888192	1341388	1887402	1815784	0	0	0	21	5	2018	2	2017-10-12 18:47:45.325614	2018-05-20 15:17:43.619608
876	2	7	2018-05-23	0	0	0	198450	975403	1138308	755632	1361876	1126282	1983879	1626637	2044634	734779	0	0	0	21	5	2018	1	2017-10-12 18:47:45.298013	2018-05-20 15:17:43.625609
875	2	7	2018-05-22	0	0	0	220500	894570	632918	1392231	689616	876970	1616048	2095387	2538153	1129784	0	0	0	20	5	2018	0	2017-10-12 18:47:45.288319	2018-05-20 15:17:43.631609
873	2	7	2018-05-20	0	0	0	661500	1242989	1470622	1037516	1257549	2652493	2133058	2215679	5747258	3087699	0	0	0	20	5	2018	5	2017-10-12 18:47:45.268539	2018-05-20 15:17:43.63961
872	2	7	2018-05-19	0	0	0	374850	637270	914195	927744	1134908	987197	2353986	2327050	1898394	1596492	0	0	0	20	5	2018	4	2017-10-12 18:47:45.257022	2018-05-20 15:17:43.65261
871	2	7	2018-05-18	0	0	0	352800	546739	502757	493622	658790	732200	1393822	1561030	1362629	864240	0	0	0	20	5	2018	3	2017-10-12 18:47:45.247979	2018-05-20 15:17:43.66461
870	2	7	2018-05-17	0	0	0	396900	731010	872824	1407300	545501	1719388	1751956	1710979	2391266	774053	0	0	0	20	5	2018	2	2017-10-12 18:47:45.23848	2018-05-20 15:17:43.674611
869	2	7	2018-05-16	0	0	0	286650	447168	734258	486300	1111872	585315	1219280	1754628	1608639	1528362	0	0	0	20	5	2018	1	2017-10-12 18:47:45.22942	2018-05-20 15:17:43.682611
868	2	7	2018-05-15	0	0	0	396900	534424	842111	503663	1146179	731677	1351063	1651895	2364567	1079615	0	0	0	19	5	2018	0	2017-10-12 18:47:45.220639	2018-05-20 15:17:43.690612
867	2	7	2018-05-14	0	0	0	458640	572717	760040	1838438	1408302	2021649	4047910	3044860	2605073	2760734	0	0	0	19	5	2018	6	2017-10-12 18:47:45.210408	2018-05-20 15:17:43.697612
866	2	7	2018-05-13	0	0	0	617400	1135652	2677529	2312059	1007444	1558036	2988677	5230729	3373083	4523385	0	0	0	19	5	2018	5	2017-10-12 18:47:45.201763	2018-05-20 15:17:43.700613
865	2	7	2018-05-12	0	0	0	418950	444963	422204	1324823	1070388	922653	1407199	1323692	859325	962088	0	0	0	19	5	2018	4	2017-10-12 18:47:45.190743	2018-05-20 15:17:43.713613
864	2	7	2018-05-11	0	0	0	286650	587355	1276385	590507	532600	1585496	1278651	1757898	1349035	1053069	0	0	0	19	5	2018	3	2017-10-12 18:47:45.17762	2018-05-20 15:17:43.721613
863	2	7	2018-05-10	0	0	0	330750	381699	415011	659277	1157206	1463775	1898640	1447958	1351736	1968978	0	0	0	19	5	2018	2	2017-10-12 18:47:45.160845	2018-05-20 15:17:43.729614
862	2	7	2018-05-09	0	0	0	220500	421124	1194255	769744	571341	906596	1278572	1799666	2127640	1098363	0	0	0	19	5	2018	1	2017-10-12 18:47:45.151984	2018-05-20 15:17:43.737614
861	2	7	2018-05-08	0	0	0	286650	641088	913530	894818	943051	896355	1716494	3465666	1756569	741416	0	0	0	18	5	2018	0	2017-10-12 18:47:45.141497	2018-05-20 15:17:43.744614
860	2	7	2018-05-07	0	0	0	670320	1457351	1053140	1478030	2241599	1475736	3710366	3890472	4620863	2745333	0	0	0	18	5	2018	6	2017-10-12 18:47:45.132266	2018-05-20 15:17:43.752615
859	2	7	2018-05-06	0	0	0	617400	1087359	2729038	1520917	1823096	2740643	2642587	4750775	3160139	2434323	0	0	0	18	5	2018	5	2017-10-12 18:47:45.121363	2018-05-20 15:17:43.760615
858	2	7	2018-05-05	0	0	0	352800	444565	377022	891990	913679	1092617	1336222	2736406	1147592	1411776	0	0	0	18	5	2018	4	2017-10-12 18:47:45.11081	2018-05-20 15:17:43.768616
857	2	7	2018-05-04	0	0	0	374850	552882	711618	739043	779303	762113	2886616	1298376	3060738	1621214	0	0	0	18	5	2018	3	2017-10-12 18:47:45.102281	2018-05-20 15:17:43.775616
856	2	7	2018-05-03	0	0	0	352800	381426	750209	1023142	570386	1377561	1673250	1443763	2339186	1049713	0	0	0	18	5	2018	2	2017-10-12 18:47:45.093279	2018-05-20 15:17:43.784617
855	2	7	2018-05-02	0	0	0	198450	577021	1106692	947222	532518	732822	1366405	3041992	1269660	610160	0	0	0	18	5	2018	1	2017-10-12 18:47:45.084614	2018-05-20 15:17:43.792617
854	2	7	2018-05-01	0	0	0	374850	572713	991321	593100	448853	827488	1408461	1089218	1891724	1210094	0	0	0	17	5	2018	0	2017-10-12 18:47:45.074627	2018-05-20 15:17:43.798618
853	2	7	2018-04-30	0	762200	813013	2134160	5203716	3531407	2052075	775723	2120573	1900767	1653290	0	0	0	0	0	17	4	2018	6	2017-10-12 18:47:45.065071	2018-05-20 15:17:43.812618
852	2	7	2018-04-29	0	465789	1219520	1280496	1559274	3114130	1707406	1551995	1676085	2035816	1107210	0	0	0	0	0	17	4	2018	5	2017-10-12 18:47:45.054027	2018-05-20 15:17:43.818618
851	2	7	2018-04-28	0	635167	813013	1707328	5664562	2158261	3218131	1233167	1338827	2870189	1006972	0	0	0	0	0	17	4	2018	4	2017-10-12 18:47:45.042188	2018-05-20 15:17:43.820618
850	2	7	2018-04-27	0	381100	609760	800310	1290398	2584121	1371938	662592	926800	1257867	387471	0	0	0	0	0	17	4	2018	3	2017-10-12 18:47:45.030539	2018-05-20 15:17:43.836619
849	2	7	2018-04-26	0	296411	474258	1067080	1435474	2817749	750833	814768	420964	1352849	580497	0	0	0	0	0	17	4	2018	2	2017-10-12 18:47:45.020472	2018-05-20 15:17:43.844619
848	2	7	2018-04-25	0	508133	880764	1173788	1582048	2830464	1117204	807159	1744003	2113997	2121242	0	0	0	0	0	17	4	2018	1	2017-10-12 18:47:45.010563	2018-05-20 15:17:43.851619
847	2	7	2018-04-24	0	465789	745262	1173788	2881075	3828102	3285242	1109269	1775512	1791599	2081507	0	0	0	0	0	16	4	2018	0	2017-10-12 18:47:45.001824	2018-05-20 15:17:43.85762
846	2	7	2018-04-23	0	550478	948515	1067080	4090918	3053008	2843275	1242617	2557544	1553531	1753424	0	0	0	0	0	16	4	2018	6	2017-10-12 18:47:44.991386	2018-05-20 15:17:43.86462
844	2	7	2018-04-21	0	762200	1151769	1493912	4097752	3941137	2085169	975316	2942743	2459318	1297230	0	0	0	0	0	16	4	2018	4	2017-10-12 18:47:44.967316	2018-05-20 15:17:43.876621
843	2	7	2018-04-20	0	381100	372631	1013726	1338056	3807843	689614	394929	959852	995056	755630	0	0	0	0	0	16	4	2018	3	2017-10-12 18:47:44.953956	2018-05-20 15:17:43.882621
842	2	7	2018-04-19	0	211722	575884	960372	1097897	828421	902305	457155	932468	830008	685862	0	0	0	0	0	16	4	2018	2	2017-10-12 18:47:44.943339	2018-05-20 15:17:43.888622
841	2	7	2018-04-18	0	592822	1084018	1280496	2992349	4612647	1849865	1078135	2324452	4182488	2129691	0	0	0	0	0	16	4	2018	1	2017-10-12 18:47:44.934162	2018-05-20 15:17:43.895622
840	2	7	2018-04-17	0	804544	1355022	2027452	1457676	3036329	1789657	909663	1218690	3090640	2233075	0	0	0	0	0	15	4	2018	0	2017-10-12 18:47:44.925355	2018-05-20 15:17:43.901622
839	2	7	2018-04-16	0	677511	1151769	1387204	1979216	3194820	1701767	613529	1720446	2710470	1631483	0	0	0	0	0	15	4	2018	6	2017-10-12 18:47:44.916316	2018-05-20 15:17:43.907623
838	2	7	2018-04-15	0	846889	1287271	2134160	2598951	3780299	2488814	1409728	1834697	2454598	2099183	0	0	0	0	0	15	4	2018	5	2017-10-12 18:47:44.907299	2018-05-20 15:17:43.914623
836	2	7	2018-04-13	0	338756	609760	1067080	816156	1392166	836267	530598	731153	1064434	531164	0	0	0	0	0	15	4	2018	3	2017-10-12 18:47:44.886615	2018-05-20 15:17:43.927624
835	2	7	2018-04-12	0	211722	677511	1013726	954692	3167120	689301	668333	1081811	556212	705164	0	0	0	0	0	15	4	2018	2	2017-10-12 18:47:44.877098	2018-05-20 15:17:43.934624
834	2	7	2018-04-11	0	719855	1287271	1920744	2547289	2592900	1899970	820898	1466782	1466686	1060072	0	0	0	0	0	15	4	2018	1	2017-10-12 18:47:44.867841	2018-05-20 15:17:43.940625
833	2	7	2018-04-10	0	465789	677511	960372	3392974	3019211	2229221	1555426	2080401	1839528	1569836	0	0	0	0	0	14	4	2018	0	2017-10-12 18:47:44.857907	2018-05-20 15:17:43.946625
832	2	7	2018-04-09	0	508133	1219520	1814036	6338360	6969842	1761440	920983	1904140	3668936	1824868	0	0	0	0	0	14	4	2018	6	2017-10-12 18:47:44.845697	2018-05-20 15:17:43.953625
831	2	7	2018-04-08	0	804544	948515	1707328	4003787	4875535	1363226	1466711	1903913	2296616	1860474	0	0	0	0	0	14	4	2018	5	2017-10-12 18:47:44.83658	2018-05-20 15:17:43.959626
830	2	7	2018-04-07	0	719855	813013	1814036	1985079	5176352	2659802	2002202	2927007	1879691	2517582	0	0	0	0	0	14	4	2018	4	2017-10-12 18:47:44.827387	2018-05-20 15:17:43.961626
829	2	7	2018-04-06	0	381100	304880	533540	1890862	2279854	1026667	357786	1061920	558553	323265	0	0	0	0	0	14	4	2018	3	2017-10-12 18:47:44.817994	2018-05-20 15:17:43.971626
828	2	7	2018-04-05	0	359928	643635	1013726	1336352	1376641	1113104	556992	1449852	1061352	401605	0	0	0	0	0	14	4	2018	2	2017-10-12 18:47:44.808823	2018-05-20 15:17:43.977626
827	2	7	2018-04-04	0	423444	1287271	1707328	1961492	5269192	1125325	1525559	1213775	2082463	1343708	0	0	0	0	0	14	4	2018	1	2017-10-12 18:47:44.799791	2018-05-20 15:17:43.984627
826	2	7	2018-04-03	0	508133	677511	960372	2446918	3070768	2063916	2201949	2440232	1901977	806583	0	0	0	0	0	13	4	2018	0	2017-10-12 18:47:44.790826	2018-05-20 15:17:43.991627
825	2	7	2018-04-02	0	804544	813013	1707328	1709450	7037456	1165041	918485	1809696	3341059	2255681	0	0	0	0	0	13	4	2018	6	2017-10-12 18:47:44.781202	2018-05-20 15:17:43.998627
824	2	7	2018-04-01	0	592822	677511	1814036	2902246	6341142	2157370	1053645	2648918	3200995	1537758	0	0	0	0	0	13	4	2018	5	2017-10-12 18:47:44.771982	2018-05-20 15:17:43.998627
823	2	7	2018-03-31	0	508133	767846	640248	2752910	2216531	940553	678893	1567535	878518	901661	0	0	0	0	0	13	3	2018	4	2017-10-12 18:47:44.762527	2018-05-20 15:17:44.010627
822	2	7	2018-03-30	0	254067	677511	924803	1630085	4766384	1196465	1050532	1160412	2358776	659049	0	0	0	0	0	13	3	2018	3	2017-10-12 18:47:44.753856	2018-05-20 15:17:44.023628
821	2	7	2018-03-29	0	479904	542009	924803	3165946	2216189	962120	1425103	1215057	789996	831925	0	0	0	0	0	13	3	2018	2	2017-10-12 18:47:44.744907	2018-05-20 15:17:44.031628
820	2	7	2018-03-28	0	155263	451674	497970	1834695	806166	691609	414148	628875	366772	475253	0	0	0	0	0	13	3	2018	1	2017-10-12 18:47:44.736505	2018-05-20 15:17:44.038629
819	2	7	2018-03-27	0	211722	338756	462401	1408743	476236	867653	672123	330205	705880	247062	0	0	0	0	0	12	3	2018	0	2017-10-12 18:47:44.728222	2018-05-20 15:17:44.198636
814	2	7	2018-03-22	0	508133	813013	1209358	2502725	2372540	982855	626671	1075898	1350426	800501	0	0	0	0	0	12	3	2018	2	2017-10-12 18:47:44.680096	2018-05-20 15:17:44.208636
813	2	7	2018-03-21	0	169378	203253	355693	1551167	997097	1025736	340489	646095	651447	336389	0	0	0	0	0	12	3	2018	1	2017-10-12 18:47:44.670105	2018-05-20 15:17:44.214636
812	2	7	2018-03-20	0	282296	271004	320124	1057262	2340691	497728	478378	373133	352516	660440	0	0	0	0	0	11	3	2018	0	2017-10-12 18:47:44.659705	2018-05-20 15:17:44.220637
811	2	7	2018-03-19	0	423444	903348	924803	4011842	1961876	866300	600126	925624	1958019	1179070	0	0	0	0	0	11	3	2018	6	2017-10-12 18:47:44.648457	2018-05-20 15:17:44.226637
810	2	7	2018-03-18	0	395215	813013	924803	1579369	1744448	1905540	1012396	1632759	1148560	747052	0	0	0	0	0	11	3	2018	5	2017-10-12 18:47:44.638188	2018-05-20 15:17:44.231637
809	2	7	2018-03-17	0	282296	587176	1422774	1538508	2961405	899697	830927	1640240	2683040	1182267	0	0	0	0	0	11	3	2018	4	2017-10-12 18:47:44.628967	2018-05-20 15:17:44.237638
808	2	7	2018-03-16	0	564593	903348	924803	1891485	1965648	972370	1295487	907107	1182643	566987	0	0	0	0	0	11	3	2018	3	2017-10-12 18:47:44.620517	2018-05-20 15:17:44.244638
807	2	7	2018-03-15	0	536363	858181	640248	3905061	1904611	1618112	622888	1390570	1546238	936718	0	0	0	0	0	11	3	2018	2	2017-10-12 18:47:44.610692	2018-05-20 15:17:44.249638
806	2	7	2018-03-14	0	282296	383923	355693	583683	985125	521618	483710	448855	866032	419666	0	0	0	0	0	11	3	2018	1	2017-10-12 18:47:44.601578	2018-05-20 15:17:44.249638
805	2	7	2018-03-13	0	197607	361339	711386	1075536	996596	685835	459665	552228	503650	352004	0	0	0	0	0	10	3	2018	0	2017-10-12 18:47:44.590748	2018-05-20 15:17:44.261638
803	2	7	2018-03-11	0	536363	632344	711387	2019460	1943866	979045	917013	1277044	1456457	1054469	0	0	0	0	0	10	3	2018	5	2017-10-12 18:47:44.568993	2018-05-20 15:17:44.273639
802	2	7	2018-03-10	0	423444	858181	853664	2663725	2809192	1787463	722322	1831374	1314870	1276464	0	0	0	0	0	10	3	2018	4	2017-10-12 18:47:44.559348	2018-05-20 15:17:44.279639
801	2	7	2018-03-09	0	423444	813013	1067081	2552324	1751618	1622747	540001	1636018	2364214	1656758	0	0	0	0	0	10	3	2018	3	2017-10-12 18:47:44.549501	2018-05-20 15:17:44.28064
800	2	7	2018-03-08	0	310526	677511	1280497	3698988	3615381	1030640	887598	1081256	1365799	1223940	0	0	0	0	0	10	3	2018	2	2017-10-12 18:47:44.540527	2018-05-20 15:17:44.29064
799	2	7	2018-03-07	0	211722	293588	320124	739916	1213466	953102	302171	775784	553385	457206	0	0	0	0	0	10	3	2018	1	2017-10-12 18:47:44.529933	2018-05-20 15:17:44.29664
798	2	7	2018-03-06	0	197607	429090	355693	789841	1323611	468922	391449	643175	794845	590610	0	0	0	0	0	9	3	2018	0	2017-10-12 18:47:44.520396	2018-05-20 15:17:44.29864
797	2	7	2018-03-05	0	508133	722678	782526	1524292	2782754	1289615	600840	1747451	1220635	1567730	0	0	0	0	0	9	3	2018	6	2017-10-12 18:47:44.484287	2018-05-20 15:17:44.30864
795	2	7	2018-03-03	0	423444	632344	640248	2512639	3767444	1184988	697506	1210303	1506605	797315	0	0	0	0	0	9	3	2018	4	2017-10-12 18:47:44.463853	2018-05-20 15:17:44.319641
794	2	7	2018-03-02	0	508133	813013	853664	3154534	1236088	1405431	611457	1047425	1911294	955936	0	0	0	0	0	9	3	2018	3	2017-10-12 18:47:44.453369	2018-05-20 15:17:44.319641
793	2	7	2018-03-01	0	0	0	429975	1235275	664230	1453589	946254	1294474	2619063	4147592	1658002	1628084	0	0	0	9	3	2018	2	2017-10-12 18:47:44.443958	2018-05-20 15:17:44.332641
792	2	7	2018-02-28	0	0	0	496125	754169	1319750	1511822	853962	2352080	2996286	4083847	3303364	2215179	0	0	0	9	2	2018	1	2017-10-12 18:47:44.435263	2018-05-20 15:17:44.338641
791	2	7	2018-02-27	0	0	0	297675	683154	1660402	768041	1704530	1512276	2650183	3027102	1901046	1583975	0	0	0	8	2	2018	0	2017-10-12 18:47:44.426712	2018-05-20 15:17:44.344642
790	2	7	2018-02-26	0	0	0	793800	827599	1324398	3273767	1866358	3072734	4844694	8128109	7929789	2815891	0	0	0	8	2	2018	6	2017-10-12 18:47:44.418021	2018-05-20 15:17:44.350642
789	2	7	2018-02-25	0	0	0	1124550	1603477	2017291	2202772	2754922	2865820	6783880	5250028	8605352	5948575	0	0	0	8	2	2018	5	2017-10-12 18:47:44.409217	2018-05-20 15:17:44.350642
788	2	7	2018-02-24	0	0	0	496125	1138484	1908221	587969	1229432	2775542	2392940	3812778	4160448	1432946	0	0	0	8	2	2018	4	2017-10-12 18:47:44.395249	2018-05-20 15:17:44.361642
787	2	7	2018-02-23	0	0	0	529200	835803	755641	1327232	1209886	1200476	1201049	4153248	2406788	2076154	0	0	0	8	2	2018	3	2017-10-12 18:47:44.383508	2018-05-20 15:17:44.367642
786	2	7	2018-02-22	0	0	0	297675	810819	1990654	930839	1525930	1489706	2815090	2118093	2067919	1493779	0	0	0	8	2	2018	2	2017-10-12 18:47:44.371972	2018-05-20 15:17:44.373643
785	2	7	2018-02-21	0	0	0	562275	1230242	600911	1640163	1825524	2664126	2817279	3488597	3134782	1058729	0	0	0	8	2	2018	1	2017-10-12 18:47:44.358956	2018-05-20 15:17:44.379643
784	2	7	2018-02-20	0	0	0	330750	902030	2215658	1229972	851305	1745464	2317739	3284392	2654123	797685	0	0	0	7	2	2018	0	2017-10-12 18:47:44.344332	2018-05-20 15:17:44.381643
783	2	7	2018-02-19	0	0	0	687960	1619668	2897615	2149012	1430833	2051502	4401194	7633624	5553378	1849677	0	0	0	7	2	2018	6	2017-10-12 18:47:44.331368	2018-05-20 15:17:44.381643
782	2	7	2018-02-18	0	0	0	1190700	2448118	1129592	1555898	2634345	6267473	5506040	6307793	5537642	2653553	0	0	0	7	2	2018	5	2017-10-12 18:47:44.3179	2018-05-20 15:17:44.404644
781	2	7	2018-02-17	0	0	0	330750	742199	978382	787600	1335489	2156217	2481173	2238446	3603808	3210103	0	0	0	7	2	2018	4	2017-10-12 18:47:44.300263	2018-05-20 15:17:44.410644
780	2	7	2018-02-16	0	0	0	661500	941675	1613786	989809	869426	1035663	2206261	2949962	3458361	1533092	0	0	0	7	2	2018	3	2017-10-12 18:47:44.286204	2018-05-20 15:17:44.416645
779	2	7	2018-02-15	0	0	0	396900	394137	1621304	2102183	1224120	1285381	2268072	2616239	1808681	1265540	0	0	0	7	2	2018	2	2017-10-12 18:47:44.273391	2018-05-20 15:17:44.421645
778	2	7	2018-02-14	0	0	0	628425	1800220	860819	869610	1427614	1596154	1774562	3749046	3806090	2355054	0	0	0	7	2	2018	1	2017-10-12 18:47:44.258843	2018-05-20 15:17:44.428645
777	2	7	2018-02-13	0	0	0	463050	914953	1212548	1472117	1252880	1272600	2655723	3050879	1712976	1602391	0	0	0	6	2	2018	0	2017-10-12 18:47:44.24174	2018-05-20 15:17:44.434646
776	2	7	2018-02-12	0	0	0	952560	2252483	1684479	2999106	1972428	2019520	6254621	7517219	11486171	4145564	0	0	0	6	2	2018	6	2017-10-12 18:47:44.230396	2018-05-20 15:17:44.440646
775	2	7	2018-02-11	0	0	0	1323000	1466281	3241898	2813723	1171686	3196106	7376952	5021381	7361491	3597746	0	0	0	6	2	2018	5	2017-10-12 18:47:44.215635	2018-05-20 15:17:44.442646
1098	2	7	2018-12-31	0	296411	575884	480186	992614	2981678	1028953	1049104	1467433	1187986	317021	0	0	0	0	0	52	12	2018	6	2017-10-12 18:47:47.53287	2018-05-20 15:17:44.442646
1097	2	7	2018-12-30	0	359928	474258	533540	2153211	3220285	625694	910623	795155	1352849	787818	0	0	0	0	0	52	12	2018	5	2017-10-12 18:47:47.524531	2018-05-20 15:17:44.457646
1096	2	7	2018-12-29	0	846889	609760	1814036	3164096	3302208	1228924	1434949	2548928	3805195	1723509	0	0	0	0	0	52	12	2018	4	2017-10-12 18:47:47.515297	2018-05-20 15:17:44.463647
1095	2	7	2018-12-28	0	508133	1355022	1920744	3122230	7455192	2525630	1379062	2356192	1677147	1543070	0	0	0	0	0	52	12	2018	3	2017-10-12 18:47:47.506282	2018-05-20 15:17:44.463647
1094	2	7	2018-12-27	0	762200	948515	1493912	1559274	1966819	1173842	872997	1676085	964334	1328652	0	0	0	0	0	52	12	2018	2	2017-10-12 18:47:47.496836	2018-05-20 15:17:44.474647
1093	2	7	2018-12-26	0	550478	813013	2027452	3398737	2620746	1863128	843746	1561965	2870189	791193	0	0	0	0	0	52	12	2018	1	2017-10-12 18:47:47.487814	2018-05-20 15:17:44.480647
1092	2	7	2018-12-25	0	402272	440382	693602	992614	2782899	1028953	717808	1467433	908460	669267	0	0	0	0	0	51	12	2018	0	2017-10-12 18:47:47.477352	2018-05-20 15:17:44.486647
1090	2	7	2018-12-23	0	846889	1287271	1920744	2373072	3773952	1340645	1345265	2146466	1902597	1458354	0	0	0	0	0	51	12	2018	5	2017-10-12 18:47:47.45598	2018-05-20 15:17:44.494648
1089	2	7	2018-12-22	0	381100	609760	1067080	2080776	3509094	1642621	767956	1775512	2067230	1503311	0	0	0	0	0	51	12	2018	4	2017-10-12 18:47:47.447177	2018-05-20 15:17:44.494648
1088	2	7	2018-12-21	0	804544	880764	960372	2922084	3053008	2527355	1553271	1662404	1912038	1863013	0	0	0	0	0	51	12	2018	3	2017-10-12 18:47:47.438331	2018-05-20 15:17:44.509648
1087	2	7	2018-12-20	0	508133	1151769	1707328	1239874	2704586	2678324	1611945	1071186	1770469	1072409	0	0	0	0	0	51	12	2018	2	2017-10-12 18:47:47.42851	2018-05-20 15:17:44.514648
1086	2	7	2018-12-19	0	423444	880764	1493912	3329424	4657708	2726759	1056592	2779257	2283653	1415160	0	0	0	0	0	51	12	2018	1	2017-10-12 18:47:47.419679	2018-05-20 15:17:44.520649
1085	2	7	2018-12-18	0	190550	372631	640248	1248852	4008256	1172344	359026	738348	995056	488937	0	0	0	0	0	50	12	2018	0	2017-10-12 18:47:47.411029	2018-05-20 15:17:44.526649
1084	2	7	2018-12-17	0	211722	474258	640248	1297514	1054354	1318754	555116	621645	539505	777310	0	0	0	0	0	50	12	2018	6	2017-10-12 18:47:47.402294	2018-05-20 15:17:44.531649
1082	2	7	2018-12-15	0	592822	1355022	1387204	2478049	4385809	1889083	1049612	1523363	1699852	2481194	0	0	0	0	0	50	12	2018	4	2017-10-12 18:47:47.385134	2018-05-20 15:17:44.54365
1081	2	7	2018-12-14	0	635167	813013	1387204	1649347	1437669	2475298	1090718	2150558	4169954	1247605	0	0	0	0	0	50	12	2018	3	2017-10-12 18:47:47.375372	2018-05-20 15:17:44.54965
1080	2	7	2018-12-13	0	423444	1355022	2134160	3544025	2598956	1825130	995102	1019276	2310210	1436283	0	0	0	0	0	50	12	2018	2	2017-10-12 18:47:47.366651	2018-05-20 15:17:44.555651
1079	2	7	2018-12-12	0	762200	609760	1173788	1946246	4083884	1330889	1469348	1786653	2432730	2278571	0	0	0	0	0	50	12	2018	1	2017-10-12 18:47:47.358437	2018-05-20 15:17:44.560651
1078	2	7	2018-12-11	0	423444	440382	907018	1409724	1392166	684219	964724	1242960	827893	354109	0	0	0	0	0	49	12	2018	0	2017-10-12 18:47:47.349751	2018-05-20 15:17:44.568652
1077	2	7	2018-12-10	0	402272	542009	960372	1511596	2421916	781208	668333	1165027	684568	893207	0	0	0	0	0	49	12	2018	6	2017-10-12 18:47:47.340057	2018-05-20 15:17:44.575652
1076	2	7	2018-12-09	0	423444	1287271	1173788	4330391	1872650	949985	947190	2200172	1200016	1649001	0	0	0	0	0	49	12	2018	5	2017-10-12 18:47:47.331274	2018-05-20 15:17:44.583652
1075	2	7	2018-12-08	0	592822	1355022	2134160	2375082	1811526	1981530	1458212	1941708	2299410	1449079	0	0	0	0	0	49	12	2018	4	2017-10-12 18:47:47.321972	2018-05-20 15:17:44.591653
1074	2	7	2018-12-07	0	635167	609760	1280496	3486098	3484921	1174293	1330308	2782974	3118596	1728823	0	0	0	0	0	49	12	2018	3	2017-10-12 18:47:47.313077	2018-05-20 15:17:44.599653
1073	2	7	2018-12-06	0	423444	677511	1707328	4927738	6268545	1181462	1235125	1903913	1952124	2259147	0	0	0	0	0	49	12	2018	2	2017-10-12 18:47:47.303978	2018-05-20 15:17:44.607654
1072	2	7	2018-12-05	0	508133	1219520	1067080	1832381	3364629	1462891	1801982	2002689	1879691	2385077	0	0	0	0	0	49	12	2018	1	2017-10-12 18:47:47.28851	2018-05-20 15:17:44.615654
1071	2	7	2018-12-04	0	338756	474258	533540	2678721	1709891	756491	357786	1517028	1117105	549551	0	0	0	0	0	48	12	2018	0	2017-10-12 18:47:47.278998	2018-05-20 15:17:44.622655
1070	2	7	2018-12-03	0	296411	677511	1013726	1622713	2753282	703013	789072	1279281	825496	516350	0	0	0	0	0	48	12	2018	6	2017-10-12 18:47:47.269205	2018-05-20 15:17:44.630655
1069	2	7	2018-12-02	0	550478	948515	1707328	2101599	5546518	2250650	1220447	1348639	1735386	2443106	0	0	0	0	0	48	12	2018	5	2017-10-12 18:47:47.26073	2018-05-20 15:17:44.638656
1068	2	7	2018-12-01	0	635167	609760	1067080	4893836	3582562	2506184	2446610	2318220	2048283	1129216	0	0	0	0	0	48	12	2018	4	2017-10-12 18:47:47.249365	2018-05-20 15:17:44.646656
1067	2	7	2018-11-30	0	423444	1151769	1173788	2319968	6296671	1864066	918485	1719211	2296978	2005050	0	0	0	0	0	48	11	2018	3	2017-10-12 18:47:47.237629	2018-05-20 15:17:44.653656
1066	2	7	2018-11-29	0	804544	1355022	1814036	2358075	5152178	2049502	1264374	1869824	3389288	1537758	0	0	0	0	0	48	11	2018	2	2017-10-12 18:47:47.228059	2018-05-20 15:17:44.661657
1065	2	7	2018-11-28	0	423444	813013	1280497	3388197	3069043	705415	740610	1132109	1171357	583428	0	0	0	0	0	48	11	2018	1	2017-10-12 18:47:47.2192	2018-05-20 15:17:44.666657
1064	2	7	2018-11-27	0	366985	677511	995942	1120683	3644882	844564	641992	828866	1241461	760442	0	0	0	0	0	47	11	2018	0	2017-10-12 18:47:47.210453	2018-05-20 15:17:44.678657
1063	2	7	2018-11-26	0	282296	767846	711387	1899568	2727618	1332166	900065	841193	1228882	571948	0	0	0	0	0	47	11	2018	6	2017-10-12 18:47:47.202093	2018-05-20 15:17:44.684658
1062	2	7	2018-11-25	0	183493	293588	320124	1641569	806166	772975	414148	595777	394985	225120	0	0	0	0	0	47	11	2018	5	2017-10-12 18:47:47.193386	2018-05-20 15:17:44.692658
1061	2	7	2018-11-24	0	268181	293588	391262	1596575	582066	561422	459874	528328	957980	266067	0	0	0	0	0	47	11	2018	4	2017-10-12 18:47:47.183971	2018-05-20 15:17:44.699659
1060	2	7	2018-11-23	0	536363	587176	853664	2667640	3968290	1236532	563560	755937	1150808	871658	0	0	0	0	0	47	11	2018	3	2017-10-12 18:47:47.174869	2018-05-20 15:17:44.706659
1058	2	7	2018-11-21	0	564593	767846	1209358	996694	4095090	1566671	984899	1705845	1275096	630138	0	0	0	0	0	47	11	2018	1	2017-10-12 18:47:47.158001	2018-05-20 15:17:44.716659
1057	2	7	2018-11-20	0	508133	496841	1209358	1480565	1585746	1913694	704648	952647	1249611	839645	0	0	0	0	0	46	11	2018	0	2017-10-12 18:47:47.149698	2018-05-20 15:17:44.716659
1056	2	7	2018-11-19	0	310526	496841	853664	3465311	2636155	1436480	402860	806924	1157508	640400	0	0	0	0	0	46	11	2018	6	2017-10-12 18:47:47.140375	2018-05-20 15:17:44.731659
1055	2	7	2018-11-18	0	211722	338756	533540	1240933	1107886	461581	510734	646095	738307	252292	0	0	0	0	0	46	11	2018	5	2017-10-12 18:47:47.13137	2018-05-20 15:17:44.73766
1053	2	7	2018-11-16	0	423444	451674	1351635	2206513	2125366	952930	415472	1262214	1827484	806732	0	0	0	0	0	46	11	2018	3	2017-10-12 18:47:47.113127	2018-05-20 15:17:44.74966
1052	2	7	2018-11-15	0	395215	858181	1422774	1246871	1066052	1303791	1168149	1197357	861420	1494104	0	0	0	0	0	46	11	2018	2	2017-10-12 18:47:47.104465	2018-05-20 15:17:44.75466
1051	2	7	2018-11-14	0	479904	858181	711387	846179	1916203	1308650	712223	1332695	2146432	591134	0	0	0	0	0	46	11	2018	1	2017-10-12 18:47:47.095877	2018-05-20 15:17:44.76066
1050	2	7	2018-11-13	0	423444	903348	1209358	2269782	2246454	1620617	1159120	1566822	1034813	623686	0	0	0	0	0	45	11	2018	0	2017-10-12 18:47:47.086772	2018-05-20 15:17:44.766661
1049	2	7	2018-11-12	0	338756	542009	782526	3288472	1904611	1213584	889840	1711470	1159679	1170897	0	0	0	0	0	45	11	2018	6	2017-10-12 18:47:47.077462	2018-05-20 15:17:44.772661
1048	2	7	2018-11-11	0	225837	225837	320124	1102513	1182150	347746	548204	448855	721694	272783	0	0	0	0	0	45	11	2018	5	2017-10-12 18:47:47.068657	2018-05-20 15:17:44.778661
1047	2	7	2018-11-10	0	211722	316172	604678	1368864	647787	685835	429020	404967	755475	608008	0	0	0	0	0	45	11	2018	4	2017-10-12 18:47:47.059804	2018-05-20 15:17:44.778661
1045	2	7	2018-11-08	0	564593	813013	1067081	1121922	2429832	1424066	1244517	780416	1456457	1186277	0	0	0	0	0	45	11	2018	2	2017-10-12 18:47:47.042039	2018-05-20 15:17:44.795662
1044	2	7	2018-11-07	0	310526	496841	1351635	1664828	2984767	1317078	722322	1144609	1561409	1276464	0	0	0	0	0	45	11	2018	1	2017-10-12 18:47:47.032362	2018-05-20 15:17:44.803662
1043	2	7	2018-11-06	0	536363	677511	782526	2252051	2919363	1724169	780001	1554217	2246003	828379	0	0	0	0	0	44	11	2018	0	2017-10-12 18:47:47.02285	2018-05-20 15:17:44.809663
1042	2	7	2018-11-05	0	479904	451674	1209358	3893672	2324174	606259	1109498	1201396	1365799	1162743	0	0	0	0	0	44	11	2018	6	2017-10-12 18:47:47.012878	2018-05-20 15:17:44.815663
1041	2	7	2018-11-04	0	282296	293588	497970	628929	1577506	635401	325415	517189	754616	514357	0	0	0	0	0	44	11	2018	5	2017-10-12 18:47:47.004399	2018-05-20 15:17:44.821663
1040	2	7	2018-11-03	0	127033	316172	711386	1220663	827257	569405	320277	459411	645811	354366	0	0	0	0	0	44	11	2018	4	2017-10-12 18:47:46.995926	2018-05-20 15:17:44.825663
1039	2	7	2018-11-02	0	338756	496841	1209358	1448077	2529776	1146325	934640	1650370	1342699	1014413	0	0	0	0	0	44	11	2018	3	2017-10-12 18:47:46.986702	2018-05-20 15:17:44.825663
1038	2	7	2018-11-01	0	423444	632344	1351635	941598	3212622	665747	802481	1693715	2189433	864663	0	0	0	0	0	44	11	2018	2	2017-10-12 18:47:46.975828	2018-05-20 15:17:44.842664
1037	2	7	2018-10-31	0	254067	542009	853664	1773628	3202327	1831345	697506	1540385	1158927	683413	0	0	0	0	0	44	10	2018	1	2017-10-12 18:47:46.967441	2018-05-20 15:17:44.850664
1036	2	7	2018-10-30	0	479904	496841	1280497	2804030	1348459	1405431	393080	1346690	955647	661802	0	0	0	0	0	43	10	2018	0	2017-10-12 18:47:46.958557	2018-05-20 15:17:44.858665
1035	2	7	2018-10-29	0	0	0	529200	772047	1026537	872153	887114	1194899	2002813	2695935	1147847	1628084	0	0	0	43	10	2018	6	2017-10-12 18:47:46.949481	2018-05-20 15:17:44.866665
1034	2	7	2018-10-28	0	0	0	562275	1005558	1919637	1007881	914960	1980699	3558090	2495684	2137471	1353721	0	0	0	43	10	2018	5	2017-10-12 18:47:46.940093	2018-05-20 15:17:44.875666
1033	2	7	2018-10-27	0	0	0	396900	1024731	1141526	853379	1704530	1628605	2271586	1513551	1493679	2071351	0	0	0	43	10	2018	4	2017-10-12 18:47:46.904097	2018-05-20 15:17:44.883666
1032	2	7	2018-10-26	0	0	0	1005480	965532	1500984	1550732	1466424	5121224	4498645	8128109	6343831	3032498	0	0	0	43	10	2018	3	2017-10-12 18:47:46.892366	2018-05-20 15:17:44.886666
1031	2	7	2018-10-25	0	0	0	1256850	1480133	2017291	2202772	3443652	3104638	4239925	7875041	5568169	3756995	0	0	0	43	10	2018	2	2017-10-12 18:47:46.880073	2018-05-20 15:17:44.899667
1030	2	7	2018-10-24	0	0	0	463050	1401211	1406058	999547	1229432	1632672	2905713	2753673	2600280	2865892	0	0	0	43	10	2018	1	2017-10-12 18:47:46.865323	2018-05-20 15:17:44.907667
1029	2	7	2018-10-23	0	0	0	496125	464335	1007521	1400967	1714005	1543469	1441259	3945586	1925430	1946394	0	0	0	42	10	2018	0	2017-10-12 18:47:46.852391	2018-05-20 15:17:44.907667
1028	2	7	2018-10-22	0	0	0	661500	1441456	1791589	1654824	1615691	1613849	2165454	4471530	2067919	1280382	0	0	0	42	10	2018	6	2017-10-12 18:47:46.841391	2018-05-20 15:17:44.923667
1027	2	7	2018-10-21	0	0	0	330750	1307132	878254	1435143	821486	1332063	3033993	2616448	2309839	1764548	0	0	0	42	10	2018	5	2017-10-12 18:47:46.827588	2018-05-20 15:17:44.931668
1026	2	7	2018-10-20	0	0	0	595350	1224183	2215658	1024977	1393045	2119492	3565752	1970635	2464543	1063580	0	0	0	42	10	2018	4	2017-10-12 18:47:46.815503	2018-05-20 15:17:44.938668
1025	2	7	2018-10-19	0	0	0	740880	1735359	2897615	3125835	3179628	3191226	4401194	9542030	6170420	2055197	0	0	0	42	10	2018	3	2017-10-12 18:47:46.804582	2018-05-20 15:17:44.938668
1024	2	7	2018-10-18	0	0	0	1058400	2601126	2259184	2766042	1317173	3298670	7800224	6307793	7383522	4511040	0	0	0	42	10	2018	2	2017-10-12 18:47:46.793116	2018-05-20 15:17:44.954669
1023	2	7	2018-10-17	0	0	0	595350	742199	1369735	787600	1335489	1437478	2481173	2462291	4054284	3776592	0	0	0	42	10	2018	1	2017-10-12 18:47:46.781643	2018-05-20 15:17:44.962669
1022	2	7	2018-10-16	0	0	0	330750	993991	1528850	1682675	753502	1956253	2322380	1735272	2997246	1423586	0	0	0	41	10	2018	0	2017-10-12 18:47:46.766292	2018-05-20 15:17:44.97067
1021	2	7	2018-10-15	0	0	0	562275	832067	1109313	1991542	918090	1928072	2268072	1846757	2210610	1546772	0	0	0	41	10	2018	6	2017-10-12 18:47:46.751729	2018-05-20 15:17:44.97767
1020	2	7	2018-10-14	0	0	0	330750	1326478	1205147	807495	1070711	2902098	1774562	3157091	3425481	1648538	0	0	0	41	10	2018	5	2017-10-12 18:47:46.738183	2018-05-20 15:17:44.98667
1019	2	7	2018-10-13	0	0	0	661500	914953	889202	981411	1252880	1272600	3540964	2087444	1712976	1780434	0	0	0	41	10	2018	4	2017-10-12 18:47:46.726037	2018-05-20 15:17:44.989671
1018	2	7	2018-10-12	0	0	0	952560	3003310	2526719	1349598	1793116	1553477	3291906	6577567	7254424	1865504	0	0	0	41	10	2018	3	2017-10-12 18:47:46.712147	2018-05-20 15:17:45.000671
1016	2	7	2018-10-10	0	0	0	628425	693998	1464042	2087314	1584871	1766497	4480566	2840188	3147356	2296451	0	0	0	41	10	2018	1	2017-10-12 18:47:46.683473	2018-05-20 15:17:45.010671
1015	2	7	2018-10-09	0	0	0	396900	344865	1024535	1640576	1390494	1601070	1653255	5664536	2869211	1269659	0	0	0	40	10	2018	0	2017-10-12 18:47:46.670361	2018-05-20 15:17:45.022671
1014	2	7	2018-10-08	0	0	0	628425	969951	1484150	1446690	1164358	1587828	1241264	4964814	2311267	1713419	0	0	0	40	10	2018	6	2017-10-12 18:47:46.656721	2018-05-20 15:17:45.030672
1013	2	7	2018-10-07	0	0	0	429975	1004442	630064	589827	760510	2404433	1728553	4255170	2609653	2205002	0	0	0	40	10	2018	5	2017-10-12 18:47:46.643892	2018-05-20 15:17:45.036672
1012	2	7	2018-10-06	0	0	0	363825	1256872	673687	520888	1041400	1632559	3144075	4610034	3357844	2571166	0	0	0	40	10	2018	4	2017-10-12 18:47:46.631503	2018-05-20 15:17:45.043673
1011	2	7	2018-10-05	0	0	0	476280	996145	2568825	2878616	2275714	1797295	6083326	7336514	6098465	2737851	0	0	0	40	10	2018	3	2017-10-12 18:47:46.617975	2018-05-20 15:17:45.049673
1010	2	7	2018-10-04	0	0	0	1058400	1034223	2194751	1781584	4247548	3351167	7612990	7129131	5424882	1897104	0	0	0	40	10	2018	2	2017-10-12 18:47:46.605988	2018-05-20 15:17:45.054673
817	2	7	2018-03-25	0	366985	858181	1209358	2692564	969104	1041863	554508	1180691	1739957	1055450	0	0	0	0	0	12	3	2018	5	2017-10-12 18:47:44.709687	2018-05-20 15:17:45.076673
816	2	7	2018-03-24	0	395215	677511	1280497	1107438	2275050	1790482	615562	1478399	2550192	1008221	0	0	0	0	0	12	3	2018	4	2017-10-12 18:47:44.699221	2018-05-20 15:17:45.085674
815	2	7	2018-03-23	0	451674	496841	782526	1758171	1783964	1530955	542037	1385669	955585	1119526	0	0	0	0	0	12	3	2018	3	2017-10-12 18:47:44.689882	2018-05-20 15:17:45.085674
774	2	7	2018-02-10	0	0	0	529200	925331	1033441	1669851	1771326	3356344	3689878	3714092	1851386	2009395	0	0	0	6	2	2018	4	2017-10-12 18:47:44.201099	2018-05-20 15:17:45.100674
773	2	7	2018-02-09	0	0	0	562275	551784	967616	1122499	1019696	900602	2571730	5381309	3375542	1615929	0	0	0	6	2	2018	3	2017-10-12 18:47:44.191215	2018-05-20 15:17:45.105674
772	2	7	2018-02-08	0	0	0	396900	1675371	1879923	1446690	1106140	1299132	1241264	4442202	1444542	1557654	0	0	0	6	2	2018	2	2017-10-12 18:47:44.179413	2018-05-20 15:17:45.115674
771	2	7	2018-02-07	0	0	0	396900	1236237	787580	530844	760510	2404433	2016645	4755778	3479538	1470001	0	0	0	6	2	2018	1	2017-10-12 18:47:44.168286	2018-05-20 15:17:45.115674
770	2	7	2018-02-06	0	0	0	463050	1047393	625567	636640	1562099	1360466	2515260	4866147	2238563	1217921	0	0	0	5	2	2018	0	2017-10-12 18:47:44.157068	2018-05-20 15:17:45.132675
769	2	7	2018-02-05	0	0	0	846720	2213656	1487214	3906693	2438265	1347971	3041663	5043853	5160240	2488955	0	0	0	5	2	2018	6	2017-10-12 18:47:44.143074	2018-05-20 15:17:45.141675
768	2	7	2018-02-04	0	0	0	727650	689482	2316681	2591395	2548529	3351167	3606153	4935552	4746771	3035366	0	0	0	5	2	2018	5	2017-10-12 18:47:44.129272	2018-05-20 15:17:45.148676
767	2	7	2018-02-03	0	0	0	330750	1356680	1108173	1336823	991230	1631648	3105200	2388028	4705210	2625152	0	0	0	5	2	2018	4	2017-10-12 18:47:44.116919	2018-05-20 15:17:45.154676
766	2	7	2018-02-02	0	0	0	661500	755403	659651	817856	1377906	1571756	2189321	3347660	1934198	2177790	0	0	0	5	2	2018	3	2017-10-12 18:47:44.099105	2018-05-20 15:17:45.161677
765	2	7	2018-02-01	0	0	0	496125	673002	437940	1702474	1444971	2551344	2545611	3776400	2279208	1892402	0	0	0	5	2	2018	2	2017-10-12 18:47:44.087391	2018-05-20 15:17:45.167677
764	2	7	2018-01-31	0	0	0	463050	538959	1038553	1476878	1080640	1179042	3584401	3230118	3046346	1284693	0	0	0	5	2	2018	1	2017-10-12 18:47:44.076092	2018-05-20 15:17:45.172677
763	2	7	2018-01-30	0	0	0	363825	660944	993027	893711	1225213	865479	1884940	2197351	2734752	1115448	0	0	0	4	1	2018	0	2017-10-12 18:47:44.064784	2018-05-20 15:17:45.22668
762	2	7	2018-01-29	0	0	0	595350	809286	1992776	1253327	690657	1026691	1649248	1866631	3764014	1107538	0	0	0	4	1	2018	6	2017-10-12 18:47:44.052732	2018-05-20 15:17:45.339686
761	2	7	2018-01-28	0	0	0	595350	759700	758138	733209	1340869	1788501	1790246	4317276	3817078	2753148	0	0	0	4	1	2018	5	2017-10-12 18:47:44.040144	2018-05-20 15:17:45.345686
760	2	7	2018-01-27	0	0	0	529200	1142228	2604079	2640228	1011296	2598979	6162406	2266672	5020425	1305178	0	0	0	4	1	2018	4	2017-10-12 18:47:44.029047	2018-05-20 15:17:45.351686
759	2	7	2018-01-26	0	0	0	882000	1036832	1406406	1320214	880139	3394641	3238226	6137557	7704008	2243818	0	0	0	4	1	2018	3	2017-10-12 18:47:44.017716	2018-05-20 15:17:45.356687
758	2	7	2018-01-25	0	0	0	374850	629036	397151	584704	715515	1987222	1648159	1824853	1261953	1064120	0	0	0	4	1	2018	2	2017-10-12 18:47:44.005857	2018-05-20 15:17:45.362687
757	2	7	2018-01-24	0	0	0	418950	1101829	687804	808010	1056154	1190928	1459607	1685760	2510793	1852426	0	0	0	4	1	2018	1	2017-10-12 18:47:43.99321	2018-05-20 15:17:45.368687
756	2	7	2018-01-23	0	0	0	308700	705632	583985	911497	526927	1541000	2006204	2063674	1451848	1529082	0	0	0	3	1	2018	0	2017-10-12 18:47:43.982468	2018-05-20 15:17:45.374688
755	2	7	2018-01-22	0	0	0	374850	821392	736552	680069	1157595	1126282	1851620	2349586	1635707	935173	0	0	0	3	1	2018	6	2017-10-12 18:47:43.971725	2018-05-20 15:17:45.380688
754	2	7	2018-01-21	0	0	0	418950	894570	379751	1172405	689616	797245	1154320	2205670	1736631	1129784	0	0	0	3	1	2018	5	2017-10-12 18:47:43.960666	2018-05-20 15:17:45.386688
753	2	7	2018-01-20	0	0	0	317520	1185278	1035168	883137	2206611	2439484	3529022	4400145	5416828	1716773	0	0	0	3	1	2018	4	2017-10-12 18:47:43.949095	2018-05-20 15:17:45.388688
752	2	7	2018-01-19	0	0	0	573300	1920983	2149371	943196	2095916	3789276	3878288	4677545	4023081	3087699	0	0	0	3	1	2018	3	2017-10-12 18:47:43.937914	2018-05-20 15:17:45.388688
751	2	7	2018-01-18	0	0	0	330750	849693	558675	618496	1078163	1198740	1412392	2327050	1423796	718421	0	0	0	3	1	2018	2	2017-10-12 18:47:43.927057	2018-05-20 15:17:45.403689
750	2	7	2018-01-17	0	0	0	264600	514578	628446	789795	922306	732200	2534222	1907926	2316469	972270	0	0	0	3	1	2018	1	2017-10-12 18:47:43.915853	2018-05-20 15:17:45.405689
993	2	7	2018-09-17	0	0	0	418950	955904	660252	1113293	794436	1128226	2000888	1308965	1708555	1197369	0	0	0	37	9	2018	6	2017-10-12 18:47:46.378291	2018-05-20 15:17:42.710569
985	2	7	2018-09-09	0	0	0	330750	839078	921834	817625	576983	1090029	1662246	2812637	1110970	997645	0	0	0	36	9	2018	5	2017-10-12 18:47:46.300506	2018-05-20 15:17:42.786573
956	2	7	2018-08-11	0	190550	609760	746956	1193366	2608217	551441	668333	1248243	641783	564131	0	0	0	0	0	32	8	2018	4	2017-10-12 18:47:46.026032	2018-05-20 15:17:43.159588
948	2	7	2018-08-03	0	592822	880764	2027452	2802132	5546518	1350390	1220447	2157822	1041232	2443106	0	0	0	0	0	31	8	2018	3	2017-10-12 18:47:45.935872	2018-05-20 15:17:43.20659
919	2	7	2018-07-05	0	127033	271004	711386	789841	1654514	669888	320277	413470	496778	472488	0	0	0	0	0	27	7	2018	2	2017-10-12 18:47:45.682996	2018-05-20 15:17:43.366598
911	2	7	2018-06-27	0	0	0	529200	689666	1147812	2929160	1866358	3072734	6920992	6321862	5815179	3249105	0	0	0	26	6	2018	1	2017-10-12 18:47:45.613348	2018-05-20 15:17:43.419599
882	2	7	2018-05-29	0	0	0	628425	1312208	1061393	599899	1415361	2123845	2188078	2878184	1908539	2898050	0	0	0	21	5	2018	0	2017-10-12 18:47:45.367701	2018-05-20 15:17:43.589607
874	2	7	2018-05-21	0	0	0	529200	711167	762755	963422	1393649	1951587	3234937	3936972	4213089	1287580	0	0	0	20	5	2018	6	2017-10-12 18:47:45.279545	2018-05-20 15:17:43.637609
845	2	7	2018-04-22	0	804544	1016267	1493912	1983798	2028439	2529529	1801586	1752849	1438506	1072409	0	0	0	0	0	16	4	2018	5	2017-10-12 18:47:44.980551	2018-05-20 15:17:43.870621
837	2	7	2018-04-14	0	719855	1016267	2027452	1529194	5309049	1663611	2326468	2761191	1459638	2398496	0	0	0	0	0	15	4	2018	4	2017-10-12 18:47:44.89512	2018-05-20 15:17:43.920623
804	2	7	2018-03-12	0	508133	496841	782526	2073042	3685631	670374	859005	816616	1127230	1159063	0	0	0	0	0	10	3	2018	6	2017-10-12 18:47:44.580888	2018-05-20 15:17:44.267639
796	2	7	2018-03-04	0	479904	767846	1351635	1540796	2208678	813691	481488	1223239	1287902	1064200	0	0	0	0	0	9	3	2018	5	2017-10-12 18:47:44.473822	2018-05-20 15:17:44.31464
1091	2	7	2018-12-24	0	359928	609760	640248	2727401	3220285	813402	814768	608059	1139242	414641	0	0	0	0	0	51	12	2018	6	2017-10-12 18:47:47.464998	2018-05-20 15:17:44.491648
1083	2	7	2018-12-16	0	677511	1287271	2134160	2992349	4967466	2114131	1940643	2145648	3555115	1232979	0	0	0	0	0	50	12	2018	5	2017-10-12 18:47:47.393633	2018-05-20 15:17:44.53765
1059	2	7	2018-11-22	0	479904	496841	782526	2692564	2153564	1116282	998114	1033105	1256636	773996	0	0	0	0	0	47	11	2018	2	2017-10-12 18:47:47.16668	2018-05-20 15:17:44.706659
1054	2	7	2018-11-17	0	211722	248421	675817	1359337	2080614	689162	402845	559700	705031	396264	0	0	0	0	0	46	11	2018	4	2017-10-12 18:47:47.122303	2018-05-20 15:17:44.73766
701	1	1	2018-11-30	0	550478	609760	1493912	1953658	4815101	1864066	1085482	1266787	2923427	1378472	0	0	0	0	0	48	11	2018	3	2017-10-11 15:07:16.280263	2018-05-20 15:17:45.518694
702	1	1	2018-12-01	0	381100	609760	1707328	4893836	3326665	1916494	1223305	1952186	1901977	1532508	0	0	0	0	0	48	12	2018	4	2017-10-11 15:07:16.292022	2018-05-20 15:17:45.518694
703	1	1	2018-12-02	0	846889	1084018	1280496	1681279	2773259	1012793	1932374	2427550	1619694	2198795	0	0	0	0	0	48	12	2018	5	2017-10-11 15:07:16.3034	2018-05-20 15:17:45.531694
748	2	7	2018-01-15	0	0	0	308700	569122	944046	972600	994833	995036	1354755	1032134	846652	1018908	0	0	0	2	1	2018	6	2017-10-12 18:47:43.892315	2018-05-20 15:17:45.420689
747	2	7	2018-01-14	0	0	0	418950	534424	1066673	774866	1281024	1382056	1801418	2064869	1120058	1295537	0	0	0	2	1	2018	5	2017-10-12 18:47:43.880941	2018-05-20 15:17:45.426689
746	2	7	2018-01-13	0	0	0	635040	429538	696704	2298048	1408302	2021649	2130479	1970203	3183978	2243097	0	0	0	2	1	2018	4	2017-10-12 18:47:43.869622	2018-05-20 15:17:45.426689
744	2	7	2018-01-11	0	0	0	374850	444963	498969	1472026	619698	1064600	1758999	1764923	1718651	1749250	0	0	0	2	1	2018	2	2017-10-12 18:47:43.845677	2018-05-20 15:17:45.44369
743	2	7	2018-01-10	0	0	0	286650	839078	1276385	681354	710133	891842	2557302	3164216	1190325	554247	0	0	0	2	1	2018	1	2017-10-12 18:47:43.834711	2018-05-20 15:17:45.44969
742	2	7	2018-01-09	0	0	0	264600	202076	498013	732530	791773	1155612	949320	1085969	1531967	1450826	0	0	0	1	1	2018	0	2017-10-12 18:47:43.823419	2018-05-20 15:17:45.454691
741	2	7	2018-01-08	0	0	0	374850	765680	1364862	615795	489721	2014658	2841270	2099611	2245842	617829	0	0	0	1	1	2018	6	2017-10-12 18:47:43.811713	2018-05-20 15:17:45.457691
740	2	7	2018-01-07	0	0	0	198450	641088	1218040	782965	1178814	1165262	1593887	3658203	1171046	1318074	0	0	0	1	1	2018	5	2017-10-12 18:47:43.800599	2018-05-20 15:17:45.457691
739	2	7	2018-01-06	0	0	0	423360	771539	1895652	2111472	1179789	1264916	1669665	3890472	3696690	1715833	0	0	0	1	1	2018	4	2017-10-12 18:47:43.791641	2018-05-20 15:17:45.471691
738	2	7	2018-01-05	0	0	0	705600	972900	1500971	1637910	2278870	3327923	5285174	4750775	3160139	1673597	0	0	0	1	1	2018	3	2017-10-12 18:47:43.782975	2018-05-20 15:17:45.477691
737	2	7	2018-01-04	0	0	0	352800	844674	565533	472230	1021170	1390603	1622555	1778664	1765526	1600013	0	0	0	1	1	2018	2	2017-10-12 18:47:43.774753	2018-05-20 15:17:45.483692
736	2	7	2018-01-03	0	0	0	374850	473899	1352074	692853	606124	762113	2309293	1947564	2142517	1215911	0	0	0	1	1	2018	1	2017-10-12 18:47:43.767031	2018-05-20 15:17:45.489692
735	2	7	2018-01-02	0	0	0	396900	408671	552786	730816	950644	891363	2788750	2110115	1949322	1784512	0	0	0	53	1	2018	0	2017-10-12 18:47:43.758897	2018-05-20 15:17:45.495692
734	2	7	2018-01-01	0	0	0	374850	644906	1027642	1262962	585770	1465644	939403	2505170	1438948	1053913	0	0	0	53	1	2018	6	2017-10-12 18:47:43.74948	2018-05-20 15:17:45.500693
733	2	7	2017-12-31	0	0	0	352800	954522	881174	830340	648343	1471090	1596256	1089218	2017838	968075	0	0	0	53	1	2018	5	2017-10-12 18:47:43.736534	2018-05-20 15:17:45.506693
700	1	1	2018-11-29	0	381100	677511	1707328	2539466	5944821	1941633	632187	2025643	3765876	1922198	0	0	0	0	0	48	11	2018	2	2017-10-11 15:07:16.268689	2018-05-20 15:17:45.512693
1046	2	7	2018-11-09	0	338756	722678	995942	2764056	2457088	1117290	1483737	1361027	1734200	613622	0	0	0	0	0	45	11	2018	3	2017-10-12 18:47:47.051268	2018-05-20 15:17:44.789661
1017	2	7	2018-10-11	0	0	0	926100	2132773	2971740	3001304	2473559	2343811	5409765	6695174	5424257	5756394	0	0	0	41	10	2018	2	2017-10-12 18:47:46.696941	2018-05-20 15:17:45.007671
818	2	7	2018-03-26	0	282296	406507	1280497	2519437	3571461	961747	732628	755937	1918014	1273961	0	0	0	0	0	12	3	2018	6	2017-10-12 18:47:44.719872	2018-05-20 15:17:45.064673
749	2	7	2018-01-16	0	0	0	330750	694460	952171	1111026	400034	1203572	1897952	2322043	1315196	1376094	0	0	0	2	1	2018	0	2017-10-12 18:47:43.903953	2018-05-20 15:17:45.405689
745	2	7	2018-01-12	0	0	0	441000	1135652	1933771	2167556	906700	1687872	3218575	4680126	7120953	3333021	0	0	0	2	1	2018	3	2017-10-12 18:47:43.857632	2018-05-20 15:17:45.43769
387	1	1	2018-01-20	0	0	0	388080	948222	762755	883137	1858198	2195536	5881704	2315866	3009349	2289030	0	0	0	3	1	2018	4	2017-10-11 15:07:12.985406	2018-05-20 15:17:45.869708
395	1	1	2018-01-28	0	0	0	297675	828763	682324	933176	670434	1564938	2784827	4892913	3053662	2608245	0	0	0	4	1	2018	5	2017-10-11 15:07:13.082074	2018-05-20 15:17:45.932711
424	1	1	2018-02-26	0	0	0	635040	1241399	1147812	2584553	1999670	3072734	5190744	7224986	5815179	2599284	0	0	0	8	2	2018	6	2017-10-11 15:07:13.427721	2018-05-20 15:17:46.156721
432	1	1	2018-03-06	0	127033	338756	391262	718037	827257	334944	427036	689117	496778	472488	0	0	0	0	0	9	3	2018	0	2017-10-11 15:07:13.50513	2018-05-20 15:17:46.227724
461	1	1	2018-04-04	0	719855	1287271	2027452	1821386	2773259	1350390	1728966	2697278	1504001	1954485	0	0	0	0	0	14	4	2018	1	2017-10-11 15:07:13.753576	2018-05-20 15:17:46.570744
469	1	1	2018-04-12	0	232894	575884	746956	1113808	3353422	827161	1113888	1165027	641783	705164	0	0	0	0	0	15	4	2018	2	2017-10-11 15:07:13.824416	2018-05-20 15:17:46.620747
498	1	1	2018-05-11	0	0	0	198450	377585	638193	726778	532600	1783683	2173707	2109478	1110970	886795	0	0	0	19	5	2018	3	2017-10-11 15:07:14.0726	2018-05-20 15:17:46.791756
503	1	1	2018-05-16	0	0	0	418950	691077	891599	632190	760755	1112099	1219280	1135347	761987	1935925	0	0	0	20	5	2018	1	2017-10-11 15:07:14.114585	2018-05-20 15:17:46.831758
535	1	1	2018-06-17	0	0	0	429975	837045	1189105	1484714	753502	1841179	2322380	3123490	2766689	1971119	0	0	0	24	6	2018	5	2017-10-11 15:07:14.388213	2018-05-20 15:17:47.040767
543	1	1	2018-06-25	0	0	0	429975	1050908	1104760	940750	1297734	2285741	1880167	2753673	2600280	2436008	0	0	0	25	6	2018	6	2017-10-11 15:07:14.452753	2018-05-20 15:17:47.099769
572	1	1	2018-07-24	0	564593	858181	1138219	2884890	1722851	1041863	831762	1033105	1739957	914723	0	0	0	0	0	29	7	2018	0	2017-10-11 15:07:14.707538	2018-05-20 15:17:47.281776
580	1	1	2018-08-01	0	762200	609760	960372	1098932	7407848	1281545	1502975	1809696	3549875	1754418	0	0	0	0	0	31	8	2018	1	2017-10-11 15:07:14.774164	2018-05-20 15:17:47.341779
609	1	1	2018-08-30	0	0	0	374850	906796	495661	771030	847833	1563033	1032871	1851671	1891724	1149589	0	0	0	35	8	2018	2	2017-10-11 15:07:15.090908	2018-05-20 15:17:47.682795
617	1	1	2018-09-07	0	0	0	286650	497692	853039	346385	693772	1108062	1278572	2699500	2245842	686477	0	0	0	36	9	2018	3	2017-10-11 15:07:15.180407	2018-05-20 15:17:47.728797
640	1	1	2018-09-30	0	0	0	297675	700647	807764	1129378	982400	1473803	4006095	2624471	3046346	1199047	0	0	0	39	9	2018	5	2017-10-11 15:07:15.44051	2018-05-20 15:17:47.872804
646	1	1	2018-10-06	0	0	0	496125	1256872	577446	1041775	1041400	1179070	3772890	4097808	2984750	2706490	0	0	0	40	10	2018	4	2017-10-11 15:07:15.509926	2018-05-20 15:17:47.944807
654	1	1	2018-10-14	0	0	0	661500	1231729	860819	559035	1356233	2902098	2661843	3157091	2854568	1177527	0	0	0	41	10	2018	5	2017-10-11 15:07:15.615985	2018-05-20 15:17:47.990809
683	1	1	2018-11-12	0	395215	632344	1138219	3905061	902184	1375395	756364	1711470	2061651	1561196	0	0	0	0	0	45	11	2018	6	2017-10-11 15:07:16.036456	2018-05-20 15:17:48.164817
691	1	1	2018-11-20	0	451674	903348	853664	925353	1883073	861162	650444	1558877	1470130	615739	0	0	0	0	0	46	11	2018	0	2017-10-11 15:07:16.166821	2018-05-20 15:17:48.20882
724	1	1	2018-12-23	0	762200	1219520	1814036	2531277	3066336	1787526	1614317	1341541	4227994	1590931	0	0	0	0	0	51	12	2018	5	2017-10-11 15:07:16.54311	2018-05-20 15:17:48.382826
732	1	1	2018-12-31	0	232894	575884	480186	1091875	1987785	1200445	1104320	1544666	978341	493144	0	0	0	0	0	52	12	2018	6	2017-10-11 15:07:16.646814	2018-05-20 15:17:48.436828
1135	2	1	2018-02-05	0	0	0	846720	2213656	2704026	2467385	2113163	2845717	6083326	6419449	8913141	4231224	0	0	0	5	2	2018	6	2017-10-12 18:53:41.63896	2018-05-20 15:17:48.816848
1143	2	1	2018-02-13	0	0	0	363825	674176	1455057	1177693	1983727	1352138	3009819	2569162	1712976	1780434	0	0	0	6	2	2018	0	2017-10-12 18:53:41.705408	2018-05-20 15:17:48.86585
1172	2	1	2018-03-14	0	141148	293588	711386	1102513	788100	347746	580451	414328	529242	314750	0	0	0	0	0	11	3	2018	1	2017-10-12 18:53:41.952086	2018-05-20 15:17:49.043857
1180	2	1	2018-03-22	0	395215	858181	1067081	3080277	3690617	982855	895244	1255215	1061049	1067334	0	0	0	0	0	12	3	2018	2	2017-10-12 18:53:42.026378	2018-05-20 15:17:49.084859
1209	2	1	2018-04-20	0	317583	338756	907018	1694870	4008256	620653	502636	664513	746292	666732	0	0	0	0	0	16	4	2018	3	2017-10-12 18:53:42.283827	2018-05-20 15:17:49.267867
1217	2	1	2018-04-28	0	465789	609760	960372	5664562	2312423	2710005	843746	1450396	1722113	791193	0	0	0	0	0	17	4	2018	4	2017-10-12 18:53:42.359555	2018-05-20 15:17:49.31587
1246	2	1	2018-05-27	0	0	0	485100	898587	1125125	2244364	1056167	2501314	4234603	6819508	6933607	2375807	0	0	0	21	5	2018	5	2017-10-12 18:53:42.636275	2018-05-20 15:17:49.487878
1254	2	1	2018-06-04	0	0	0	562275	1744303	1038912	1448225	619519	2719414	2328900	2729174	2587866	1796157	0	0	0	22	6	2018	6	2017-10-12 18:53:42.730184	2018-05-20 15:17:49.52988
1283	2	1	2018-07-03	0	338756	677511	853664	855998	2610256	813691	962977	1693715	1159112	1330250	0	0	0	0	0	26	7	2018	0	2017-10-12 18:53:43.016182	2018-05-20 15:17:49.727888
1291	2	1	2018-07-11	0	254067	903348	1067081	2245796	3480874	968318	1483737	1451762	1040520	954523	0	0	0	0	0	28	7	2018	1	2017-10-12 18:53:43.085153	2018-05-20 15:17:49.930897
1320	2	1	2018-08-09	0	635167	948515	1707328	2205433	2415368	2476912	874927	1525627	1609587	1207566	0	0	0	0	0	32	8	2018	2	2017-10-12 18:53:43.331443	2018-05-20 15:17:50.512921
1328	2	1	2018-08-17	0	719855	1151769	1814036	5386228	6031923	1453465	1617203	1609236	3764239	1793424	0	0	0	0	0	33	8	2018	3	2017-10-12 18:53:43.401321	2018-05-20 15:17:50.564924
1357	2	1	2018-09-15	0	0	0	396900	584808	1190214	962889	690967	945663	2627933	2322043	1913013	946065	0	0	0	37	9	2018	4	2017-10-12 18:53:43.651697	2018-05-20 15:17:50.734931
1365	2	1	2018-09-23	0	0	0	220500	918191	871218	808010	586752	840655	2043450	1324525	1952839	1754930	0	0	0	38	9	2018	5	2017-10-12 18:53:43.721461	2018-05-20 15:17:50.793934
1394	2	1	2018-10-22	0	0	0	661500	1711729	1094860	1654824	807845	1117280	3248181	4000843	1824635	1920573	0	0	0	42	10	2018	6	2017-10-12 18:53:43.972524	2018-05-20 15:17:51.140949
1402	2	1	2018-10-30	0	366985	767846	1280497	2103023	1011344	1513541	567782	1346690	2017477	1250070	0	0	0	0	0	43	10	2018	0	2017-10-12 18:53:44.0424	2018-05-20 15:17:51.18895
1099	2	1	2017-12-31	0	0	0	198450	763618	771028	830340	797960	919431	845077	980296	1639494	665552	0	0	0	53	1	2018	5	2017-10-12 18:53:41.311466	2018-05-20 15:17:45.537694
1100	2	1	2018-01-01	0	0	0	242550	610963	790494	884073	692273	879386	939403	3399873	1692880	554691	0	0	0	53	1	2018	6	2017-10-12 18:53:41.321415	2018-05-20 15:17:45.542694
1101	2	1	2018-01-02	0	0	0	308700	463160	513301	1242387	522854	729297	1812688	2110115	2209232	1364627	0	0	0	53	1	2018	0	2017-10-12 18:53:41.332184	2018-05-20 15:17:45.548695
1102	2	1	2018-01-03	0	0	0	242550	394916	1280912	692853	519535	931471	1587639	1514772	1683406	1722540	0	0	0	1	1	2018	1	2017-10-12 18:53:41.341766	2018-05-20 15:17:45.554695
1103	2	1	2018-01-04	0	0	0	308700	800217	314185	524700	859933	1291274	1240777	2325945	1588973	1411776	0	0	0	1	1	2018	2	2017-10-12 18:53:41.351823	2018-05-20 15:17:45.560695
1104	2	1	2018-01-05	0	0	0	396900	858441	2456134	2339872	1139435	3523684	4110691	5000816	3511265	2586468	0	0	0	1	1	2018	3	2017-10-12 18:53:41.362413	2018-05-20 15:17:45.565696
1105	2	1	2018-01-06	0	0	0	529200	1285898	1579710	1583604	1415747	1897375	2597256	4489007	2772518	2745333	0	0	0	1	1	2018	4	2017-10-12 18:53:41.371594	2018-05-20 15:17:45.571696
1106	2	1	2018-01-07	0	0	0	242550	470131	837403	1006670	1060933	1254897	1471280	1925370	2342092	1647592	0	0	0	1	1	2018	5	2017-10-12 18:53:41.381209	2018-05-20 15:17:45.577696
1440	2	1	2018-12-07	0	381100	677511	1493912	4119934	3136429	1878869	920983	1464723	2568255	1824868	0	0	0	0	0	49	12	2018	3	2017-10-12 18:53:44.371674	2018-05-20 15:17:45.579697
1441	2	1	2018-12-08	0	508133	745262	2134160	3392974	3421772	1362302	874927	1386934	2069469	2173619	0	0	0	0	0	49	12	2018	4	2017-10-12 18:53:44.380256	2018-05-20 15:17:45.579697
1442	2	1	2018-12-09	0	762200	1084018	1920744	3566205	1584550	2111078	1136628	1100086	1200016	1531215	0	0	0	0	0	49	12	2018	5	2017-10-12 18:53:44.389033	2018-05-20 15:17:45.595697
1443	2	1	2018-12-10	0	423444	440382	746956	1352481	1676711	919068	891110	998594	427855	893207	0	0	0	0	0	49	12	2018	6	2017-10-12 18:53:44.398834	2018-05-20 15:17:45.600697
1444	2	1	2018-12-11	0	190550	575884	693602	741960	1591046	836267	482362	1462306	768758	389520	0	0	0	0	0	49	12	2018	0	2017-10-12 18:53:44.438295	2018-05-20 15:17:45.600697
1445	2	1	2018-12-12	0	508133	609760	960372	1807229	4492272	1552704	2448914	1786653	1459638	2038722	0	0	0	0	0	50	12	2018	1	2017-10-12 18:53:44.446854	2018-05-20 15:17:45.612697
1446	2	1	2018-12-13	0	846889	1084018	1493912	2598951	3780299	2156972	1409728	1630842	2743374	1988699	0	0	0	0	0	50	12	2018	2	2017-10-12 18:53:44.455179	2018-05-20 15:17:45.618698
1447	2	1	2018-12-14	0	677511	1355022	1493912	1814282	2236374	2939416	1158888	2724040	2710470	1151635	0	0	0	0	0	50	12	2018	3	2017-10-12 18:53:44.463347	2018-05-20 15:17:45.624698
1448	2	1	2018-12-15	0	423444	880764	1600620	1603444	3036329	994254	1189560	1624920	2936108	1488716	0	0	0	0	0	50	12	2018	4	2017-10-12 18:53:44.471455	2018-05-20 15:17:45.629698
1449	2	1	2018-12-16	0	592822	609760	960372	3590819	5322285	2642664	1725016	2503256	3973364	2241780	0	0	0	0	0	50	12	2018	5	2017-10-12 18:53:44.479964	2018-05-20 15:17:45.635699
1450	2	1	2018-12-17	0	317583	440382	1013726	1796558	1355598	971713	587770	683810	622506	868758	0	0	0	0	0	50	12	2018	6	2017-10-12 18:53:44.48907	2018-05-20 15:17:45.641699
1009	2	7	2018-10-03	0	0	0	562275	1259774	900390	2228038	805375	2311502	2846434	1535161	3058387	1519825	0	0	0	40	10	2018	1	2017-10-12 18:47:46.594552	2018-05-20 15:17:45.646699
1008	2	7	2018-10-02	0	0	0	661500	755403	1392597	701020	1286046	2619594	1852502	3068689	2637543	1260826	0	0	0	39	10	2018	0	2017-10-12 18:47:46.583568	2018-05-20 15:17:45.6527
1007	2	7	2018-10-01	0	0	0	396900	611820	973200	2128092	928910	1913508	2545611	2124225	2279208	946201	0	0	0	39	10	2018	6	2017-10-12 18:47:46.570197	2018-05-20 15:17:45.6587
1006	2	7	2018-09-30	0	0	0	496125	700647	519277	1303128	982400	1866817	2530165	2018824	2030897	856462	0	0	0	39	9	2018	5	2017-10-12 18:47:46.553467	2018-05-20 15:17:45.6637
1005	2	7	2018-09-29	0	0	0	463050	413090	662018	819235	842334	1038575	2609917	3380540	1538298	1622470	0	0	0	39	9	2018	4	2017-10-12 18:47:46.54149	2018-05-20 15:17:45.670701
1004	2	7	2018-09-28	0	0	0	595350	1079048	2490970	663526	753444	1368922	2998632	2715099	3565908	996784	0	0	0	39	9	2018	3	2017-10-12 18:47:46.528251	2018-05-20 15:17:45.671701
1003	2	7	2018-09-27	0	0	0	628425	1105018	1137207	1266453	1117391	1341376	3580492	3741639	1717685	2753148	0	0	0	39	9	2018	2	2017-10-12 18:47:46.513836	2018-05-20 15:17:45.681701
1002	2	7	2018-09-26	0	0	0	635040	1205685	2604079	1848160	1011296	1949234	4929925	3503039	2510213	2017093	0	0	0	39	9	2018	1	2017-10-12 18:47:46.501032	2018-05-20 15:17:45.687701
1001	2	7	2018-09-25	0	0	0	529200	898587	1218885	1320214	1232195	1965318	2490943	6819508	7704008	2639786	0	0	0	38	9	2018	0	2017-10-12 18:47:46.485526	2018-05-20 15:17:45.693701
1000	2	7	2018-09-24	0	0	0	441000	838715	476581	779605	414246	1987222	2746932	3152018	1963038	684077	0	0	0	38	9	2018	6	2017-10-12 18:47:46.472388	2018-05-20 15:17:45.698702
999	2	7	2018-09-23	0	0	0	264600	1224254	733658	634865	1056154	1401092	1751528	1444937	2231816	877465	0	0	0	38	9	2018	5	2017-10-12 18:47:46.456259	2018-05-20 15:17:45.702702
998	2	7	2018-09-22	0	0	0	374850	651353	843534	1106817	1170948	693450	1534156	1650939	2903696	1051244	0	0	0	38	9	2018	4	2017-10-12 18:47:46.445241	2018-05-20 15:17:45.702702
997	2	7	2018-09-21	0	0	0	308700	513370	602634	340034	1225688	1783279	1454845	3434011	1635707	734779	0	0	0	38	9	2018	3	2017-10-12 18:47:46.432114	2018-05-20 15:17:45.715702
996	2	7	2018-09-20	0	0	0	330750	894570	316459	1318955	564232	1594490	1962344	1985103	2003805	1232491	0	0	0	38	9	2018	2	2017-10-12 18:47:46.419111	2018-05-20 15:17:45.721702
995	2	7	2018-09-19	0	0	0	317520	711167	817238	722567	1625924	1951587	5293534	2084279	4814958	1716773	0	0	0	38	9	2018	1	2017-10-12 18:47:46.40163	2018-05-20 15:17:45.722703
994	2	7	2018-09-18	0	0	0	529200	1920983	1018123	1886392	2235643	3410348	3684374	4677545	4885169	3280680	0	0	0	37	9	2018	0	2017-10-12 18:47:46.387949	2018-05-20 15:17:45.732703
367	1	1	2017-12-31	0	0	0	441000	620439	1101468	1186200	498725	919431	1502358	2178436	2270068	1028580	0	0	0	53	1	2018	5	2017-10-11 15:07:12.795211	2018-05-20 15:17:45.732703
368	1	1	2018-01-01	0	0	0	441000	475194	711445	694629	958532	879386	1537205	2147288	1438948	832037	0	0	0	53	1	2018	6	2017-10-11 15:07:12.804383	2018-05-20 15:17:45.749703
369	1	1	2018-01-02	0	0	0	264600	490405	710725	730816	522854	1053429	1673250	1110587	1689412	1469598	0	0	0	53	1	2018	0	2017-10-11 15:07:12.813241	2018-05-20 15:17:45.756703
370	1	1	2018-01-03	0	0	0	286650	789832	711618	877614	822597	1016150	2309293	1190178	2907701	2026518	0	0	0	1	1	2018	1	2017-10-11 15:07:12.821403	2018-05-20 15:17:45.763704
371	1	1	2018-01-04	0	0	0	286650	800217	565533	787050	806187	1887247	1240777	1231383	1059316	1035302	0	0	0	1	1	2018	2	2017-10-11 15:07:12.829242	2018-05-20 15:17:45.769704
372	1	1	2018-01-05	0	0	0	705600	801212	1364519	1988891	1937040	3719444	2936208	2500408	3862392	1521452	0	0	0	1	1	2018	3	2017-10-11 15:07:12.837962	2018-05-20 15:17:45.777705
373	1	1	2018-01-06	0	0	0	599760	1371624	1369082	950162	1415747	1370326	2597256	3291938	5853093	2402166	0	0	0	1	1	2018	4	2017-10-11 15:07:12.846553	2018-05-20 15:17:45.783705
374	1	1	2018-01-07	0	0	0	286650	470131	1141913	503335	825170	1075626	2329527	1732833	1990778	1482833	0	0	0	1	1	2018	5	2017-10-11 15:07:12.855221	2018-05-20 15:17:45.789705
375	1	1	2018-01-08	0	0	0	418950	612544	1194255	731257	612152	1309528	2841270	2849472	2127640	1029716	0	0	0	1	1	2018	6	2017-10-11 15:07:12.863717	2018-05-20 15:17:45.795706
376	1	1	2018-01-09	0	0	0	242550	449058	373510	805783	1157206	924490	1803708	1689285	1081388	932674	0	0	0	1	1	2018	0	2017-10-11 15:07:12.872588	2018-05-20 15:17:45.803706
377	1	1	2018-01-10	0	0	0	441000	545401	850924	726778	621366	1684590	1534381	3340006	872905	775946	0	0	0	2	1	2018	1	2017-10-11 15:07:12.881176	2018-05-20 15:17:45.809706
378	1	1	2018-01-11	0	0	0	352800	342279	345440	1324823	563362	1064600	1172666	1764923	954806	874625	0	0	0	2	1	2018	2	2017-10-11 15:07:12.889586	2018-05-20 15:17:45.813707
379	1	1	2018-01-12	0	0	0	837900	738174	2677529	2312059	1511166	2466890	2069084	3854221	4872231	3571094	0	0	0	2	1	2018	3	2017-10-11 15:07:12.898614	2018-05-20 15:17:45.813707
380	1	1	2018-01-13	0	0	0	388080	680101	823377	1953341	1911267	2378410	2769623	1611985	4341788	3105826	0	0	0	2	1	2018	4	2017-10-11 15:07:12.908252	2018-05-20 15:17:45.826707
381	1	1	2018-01-14	0	0	0	220500	367417	842111	581150	1281024	1219461	1463652	1376579	2489018	1439486	0	0	0	2	1	2018	5	2017-10-11 15:07:12.91708	2018-05-20 15:17:45.832707
382	1	1	2018-01-15	0	0	0	220500	487819	524470	778080	936314	1170630	1219280	1238561	931317	917017	0	0	0	2	1	2018	6	2017-10-11 15:07:12.925842	2018-05-20 15:17:45.834707
383	1	1	2018-01-16	0	0	0	396900	402056	1269562	1333231	472767	773725	1751956	1099915	1076070	1548106	0	0	0	2	1	2018	0	2017-10-11 15:07:12.934405	2018-05-20 15:17:45.844707
384	1	1	2018-01-17	0	0	0	352800	321611	471335	888520	592911	1098301	1520533	1734478	2452732	810225	0	0	0	3	1	2018	1	2017-10-11 15:07:12.943378	2018-05-20 15:17:45.846707
385	1	1	2018-01-18	0	0	0	374850	796587	761829	618496	907926	1128226	1176993	2036168	1328876	1516667	0	0	0	3	1	2018	2	2017-10-11 15:07:12.956073	2018-05-20 15:17:45.856707
386	1	1	2018-01-19	0	0	0	793800	1129990	2262496	1603433	2375371	2084102	3490459	4431359	4597806	3666643	0	0	0	3	1	2018	3	2017-10-11 15:07:12.974024	2018-05-20 15:17:45.862708
388	1	1	2018-01-21	0	0	0	286650	447285	379751	659478	940386	956694	1154320	2205670	2671740	1232491	0	0	0	3	1	2018	5	2017-10-11 15:07:12.997875	2018-05-20 15:17:45.877709
389	1	1	2018-01-22	0	0	0	330750	821392	937430	717850	885219	1126282	2645172	2891798	1124549	734779	0	0	0	3	1	2018	6	2017-10-11 15:07:13.009372	2018-05-20 15:17:45.877709
390	1	1	2018-01-23	0	0	0	308700	977029	1167970	976604	878211	1155750	1062108	1341388	2468142	1720217	0	0	0	3	1	2018	0	2017-10-11 15:07:13.022241	2018-05-20 15:17:45.893709
391	1	1	2018-01-24	0	0	0	396900	1224254	641950	1096585	704102	1331037	1897489	1565348	1534374	974961	0	0	0	4	1	2018	1	2017-10-11 15:07:13.03464	2018-05-20 15:17:45.901709
392	1	1	2018-01-25	0	0	0	441000	471777	675157	730880	640198	894250	2197546	1493061	1402170	1520172	0	0	0	4	1	2018	2	2017-10-11 15:07:13.046499	2018-05-20 15:17:45.90971
393	1	1	2018-01-26	0	0	0	441000	691221	843844	1320214	1232195	1786653	4732792	6478533	5007605	2243818	0	0	0	4	1	2018	3	2017-10-11 15:07:13.05837	2018-05-20 15:17:45.91371
394	1	1	2018-01-27	0	0	0	705600	951857	3063622	1584137	2134958	1786798	5546165	3915161	2510213	1779788	0	0	0	4	1	2018	4	2017-10-11 15:07:13.070513	2018-05-20 15:17:45.92471
396	1	1	2018-01-29	0	0	0	429975	944167	2366422	1253327	565083	1939306	2248974	3054487	2377272	1218292	0	0	0	4	1	2018	6	2017-10-11 15:07:13.093969	2018-05-20 15:17:45.940711
397	1	1	2018-01-30	0	0	0	628425	495708	1324036	1340566	1454940	778931	1449954	1859297	2392908	1723875	0	0	0	4	1	2018	0	2017-10-11 15:07:13.106283	2018-05-20 15:17:45.948712
398	1	1	2018-01-31	0	0	0	661500	485063	980856	1650629	1571840	1277296	2951859	3835766	2030897	1712924	0	0	0	5	2	2018	1	2017-10-11 15:07:13.118339	2018-05-20 15:17:45.956712
399	1	1	2018-02-01	0	0	0	628425	795366	486600	1915283	1548183	2423777	1958162	3776400	2279208	1324681	0	0	0	5	2	2018	2	2017-10-11 15:07:13.130585	2018-05-20 15:17:45.964712
400	1	1	2018-02-02	0	0	0	529200	1236114	952830	1168366	1561627	1571756	3199777	5021491	2637543	2063169	0	0	0	5	2	2018	3	2017-10-11 15:07:13.142183	2018-05-20 15:17:45.971713
401	1	1	2018-02-03	0	0	0	628425	1065963	1246694	2005234	619519	2447473	3881501	2558601	3293647	1243493	0	0	0	5	2	2018	4	2017-10-11 15:07:13.154105	2018-05-20 15:17:45.980713
402	1	1	2018-02-04	0	0	0	1058400	896327	2194751	2105509	4035171	4548013	5609572	6580736	5763937	2466235	0	0	0	5	2	2018	5	2017-10-11 15:07:13.166009	2018-05-20 15:17:45.988714
403	1	1	2018-02-05	0	0	0	529200	2213656	1487214	3906693	1462959	2845717	3649996	6419449	5629352	3733433	0	0	0	5	2	2018	6	2017-10-11 15:07:13.179895	2018-05-20 15:17:45.995714
404	1	1	2018-02-06	0	0	0	529200	698262	529326	520888	781050	816279	3353680	3841695	2052016	2165192	0	0	0	5	2	2018	0	2017-10-11 15:07:13.200687	2018-05-20 15:17:46.003715
405	1	1	2018-02-07	0	0	0	496125	927178	735074	707792	633758	1518589	2592830	2503041	2827124	1592501	0	0	0	6	2	2018	1	2017-10-11 15:07:13.212193	2018-05-20 15:17:46.011715
406	1	1	2018-02-08	0	0	0	297675	1587193	1583093	1157352	989704	2309568	1930855	2613060	2455721	2648012	0	0	0	6	2	2018	2	2017-10-11 15:07:13.223277	2018-05-20 15:17:46.013715
407	1	1	2018-02-09	0	0	0	363825	344865	512267	1640576	1483194	1701137	3306510	3398722	2700434	2193047	0	0	0	6	2	2018	3	2017-10-11 15:07:13.234339	2018-05-20 15:17:46.023715
408	1	1	2018-02-10	0	0	0	429975	1098831	947321	1878583	1584871	2296446	4744129	4151044	1851386	2870564	0	0	0	6	2	2018	4	2017-10-11 15:07:13.246185	2018-05-20 15:17:46.036715
409	1	1	2018-02-11	0	0	0	1190700	2132773	4322531	3001304	1432060	2769958	5409765	5439829	6586597	7195492	0	0	0	6	2	2018	5	2017-10-11 15:07:13.259949	2018-05-20 15:17:46.044716
410	1	1	2018-02-12	0	0	0	899640	1952152	2189823	1349598	2331051	3106954	6254621	8926698	6045353	3316451	0	0	0	6	2	2018	6	2017-10-11 15:07:13.271718	2018-05-20 15:17:46.052716
411	1	1	2018-02-13	0	0	0	628425	529709	889202	1864681	1461694	1511213	2832771	2087444	1844744	801195	0	0	0	6	2	2018	0	2017-10-11 15:07:13.283217	2018-05-20 15:17:46.060717
412	1	1	2018-02-14	0	0	0	661500	1042232	1032983	993840	1284853	1305944	2306931	1775864	2473959	1177527	0	0	0	7	2	2018	1	2017-10-11 15:07:13.294386	2018-05-20 15:17:46.067717
413	1	1	2018-02-15	0	0	0	595350	744481	1365309	2102183	856884	1413919	1134036	1385068	3818326	1265540	0	0	0	7	2	2018	2	2017-10-11 15:07:13.305296	2018-05-20 15:17:46.075718
414	1	1	2018-02-16	0	0	0	330750	784730	764425	989809	869426	2186400	1393428	1908799	2536131	985559	0	0	0	7	2	2018	3	2017-10-11 15:07:13.31641	2018-05-20 15:17:46.085718
415	1	1	2018-02-17	0	0	0	628425	445319	1858926	1102640	1849138	2874956	2729290	3133824	4279522	2643614	0	0	0	7	2	2018	4	2017-10-11 15:07:13.327429	2018-05-20 15:17:46.085718
416	1	1	2018-02-18	0	0	0	1256850	1683081	1255102	1728776	2634345	4618138	7341387	9461689	4060937	4776395	0	0	0	7	2	2018	5	2017-10-11 15:07:13.338314	2018-05-20 15:17:46.101718
417	1	1	2018-02-19	0	0	0	740880	1735359	2897615	3907294	2861665	2735336	4169552	8587827	11723798	3493835	0	0	0	7	2	2018	6	2017-10-11 15:07:13.34929	2018-05-20 15:17:46.109719
418	1	1	2018-02-20	0	0	0	396900	1095322	2215658	1947456	1160871	2244168	2317739	3120172	3033283	886317	0	0	0	7	2	2018	0	2017-10-11 15:07:13.360407	2018-05-20 15:17:46.117719
419	1	1	2018-02-21	0	0	0	529200	845791	878254	1435143	912762	1332063	2600566	2616448	2474828	970501	0	0	0	8	2	2018	1	2017-10-11 15:07:13.371622	2018-05-20 15:17:46.125719
420	1	1	2018-02-22	0	0	0	529200	900910	1194392	1861677	1436170	1613849	1948909	3765499	1459708	1707176	0	0	0	8	2	2018	2	2017-10-11 15:07:13.382931	2018-05-20 15:17:46.13372
421	1	1	2018-02-23	0	0	0	628425	742936	1007521	1253497	1915652	1028980	1201049	2491949	1925430	2465432	0	0	0	8	2	2018	3	2017-10-11 15:07:13.394124	2018-05-20 15:17:46.14172
422	1	1	2018-02-24	0	0	0	396900	1050908	903894	940750	819622	3265344	2905713	1906389	4160448	2436008	0	0	0	8	2	2018	4	2017-10-11 15:07:13.405106	2018-05-20 15:17:46.149721
423	1	1	2018-02-25	0	0	0	727650	1480133	3227666	2753465	2410556	3582275	4239925	5250028	7592958	3443912	0	0	0	8	2	2018	5	2017-10-11 15:07:13.416247	2018-05-20 15:17:46.156721
425	1	1	2018-02-27	0	0	0	562275	1366308	1245301	1280069	1614818	1861262	2271586	1664906	2444202	1705819	0	0	0	8	2	2018	0	2017-10-11 15:07:13.439199	2018-05-20 15:17:46.174722
426	1	1	2018-02-28	0	0	0	562275	553057	2159591	1411033	792965	2228287	3745358	4083847	2331786	1353721	0	0	0	9	2	2018	1	2017-10-11 15:07:13.450418	2018-05-20 15:17:46.189723
427	1	1	2018-03-01	0	0	0	562275	1466889	966152	1938118	1123677	1294474	1386563	4147592	2040618	1395500	0	0	0	9	3	2018	2	2017-10-11 15:07:13.461833	2018-05-20 15:17:46.196723
428	1	1	2018-03-02	0	536363	406507	1351635	2278275	1797946	1837872	436755	972609	1592745	661802	0	0	0	0	0	9	3	2018	3	2017-10-11 15:07:13.472331	2018-05-20 15:17:46.197723
429	1	1	2018-03-03	0	395215	722678	640248	1330221	2637211	1077262	479535	1430358	2317854	1082071	0	0	0	0	0	9	3	2018	4	2017-10-11 15:07:13.480736	2018-05-20 15:17:46.208723
430	1	1	2018-03-04	0	366985	677511	1067081	1455197	3212622	1035607	641984	1881906	2318224	598613	0	0	0	0	0	9	3	2018	5	2017-10-11 15:07:13.488969	2018-05-20 15:17:46.214723
431	1	1	2018-03-05	0	310526	767846	853664	1219434	3541686	1003034	1201680	1553290	1464762	1567730	0	0	0	0	0	9	3	2018	6	2017-10-11 15:07:13.497075	2018-05-20 15:17:46.221724
433	1	1	2018-03-07	0	211722	271004	320124	332962	1577506	741301	441634	387892	654000	400056	0	0	0	0	0	10	3	2018	1	2017-10-11 15:07:13.51338	2018-05-20 15:17:46.233724
434	1	1	2018-03-08	0	508133	587176	995942	1752152	5164830	970014	1109498	720838	1117472	917955	0	0	0	0	0	10	3	2018	2	2017-10-11 15:07:13.521349	2018-05-20 15:17:46.240725
435	1	1	2018-03-09	0	366985	677511	711387	2252051	2919363	1419904	600001	1554217	2009582	1288589	0	0	0	0	0	10	3	2018	3	2017-10-11 15:07:13.530059	2018-05-20 15:17:46.246725
436	1	1	2018-03-10	0	310526	496841	1351635	2830208	1931320	1034847	382406	1373531	1232691	1276464	0	0	0	0	0	10	3	2018	4	2017-10-11 15:07:13.538025	2018-05-20 15:17:46.252726
437	1	1	2018-03-11	0	338756	542009	1422774	2131652	1619888	801037	655009	1418938	1213714	1252182	0	0	0	0	0	10	3	2018	5	2017-10-11 15:07:13.546679	2018-05-20 15:17:46.259726
438	1	1	2018-03-12	0	338756	406507	1422774	3282317	4095146	1415234	1405645	1088821	1474070	954523	0	0	0	0	0	10	3	2018	6	2017-10-11 15:07:13.554779	2018-05-20 15:17:46.268726
439	1	1	2018-03-13	0	169378	338756	426832	1955520	847107	881788	398376	552228	956935	480006	0	0	0	0	0	10	3	2018	0	2017-10-11 15:07:13.562986	2018-05-20 15:17:46.276727
440	1	1	2018-03-14	0	282296	429090	604678	1167367	656750	318767	580451	310746	769806	335733	0	0	0	0	0	11	3	2018	1	2017-10-11 15:07:13.571301	2018-05-20 15:17:46.282727
441	1	1	2018-03-15	0	479904	767846	1067081	4110590	1503641	1294490	622888	962702	1932798	1405076	0	0	0	0	0	11	3	2018	2	2017-10-11 15:07:13.580383	2018-05-20 15:17:46.289728
442	1	1	2018-03-16	0	395215	903348	1209358	2837228	2808068	1296493	886386	989572	960898	566987	0	0	0	0	0	11	3	2018	3	2017-10-11 15:07:13.589138	2018-05-20 15:17:46.298728
443	1	1	2018-03-17	0	366985	542009	782526	692329	2264604	1635812	1068334	1127665	2146432	1182267	0	0	0	0	0	11	3	2018	4	2017-10-11 15:07:13.597842	2018-05-20 15:17:46.306729
444	1	1	2018-03-18	0	508133	587176	1138219	914372	872224	1404082	1479655	1850460	1435700	747052	0	0	0	0	0	11	3	2018	5	2017-10-11 15:07:13.606574	2018-05-20 15:17:46.314729
445	1	1	2018-03-19	0	508133	587176	1138219	3610658	2779325	1386080	692453	1346362	1566415	620563	0	0	0	0	0	11	3	2018	6	2017-10-11 15:07:13.623992	2018-05-20 15:17:46.33773
446	1	1	2018-03-20	0	141148	429090	711386	1510374	1170346	689162	478378	559700	391684	429286	0	0	0	0	0	11	3	2018	0	2017-10-11 15:07:13.632796	2018-05-20 15:17:46.482739
447	1	1	2018-03-21	0	141148	316172	426832	1654578	997097	871876	612880	646095	521158	504583	0	0	0	0	0	12	3	2018	1	2017-10-11 15:07:13.641272	2018-05-20 15:17:46.488739
448	1	1	2018-03-22	0	451674	587176	640248	3465311	3954233	831646	805720	1165557	1061049	960601	0	0	0	0	0	12	3	2018	2	2017-10-11 15:07:13.650007	2018-05-20 15:17:46.494739
449	1	1	2018-03-23	0	310526	406507	1138219	1665635	1090200	1148216	596241	952647	1176104	1007573	0	0	0	0	0	12	3	2018	3	2017-10-11 15:07:13.658423	2018-05-20 15:17:46.50074
450	1	1	2018-03-24	0	395215	858181	1067081	996694	2730060	2238102	861787	1819568	1657625	630138	0	0	0	0	0	12	3	2018	4	2017-10-11 15:07:13.666517	2018-05-20 15:17:46.50574
451	1	1	2018-03-25	0	423444	406507	640248	2884890	2045886	1413957	665410	811725	869979	1125813	0	0	0	0	0	12	3	2018	5	2017-10-11 15:07:13.674392	2018-05-20 15:17:46.51174
452	1	1	2018-03-26	0	564593	542009	1209358	2667640	3769876	893051	845340	1091909	1662279	603455	0	0	0	0	0	12	3	2018	6	2017-10-11 15:07:13.682322	2018-05-20 15:17:46.517741
453	1	1	2018-03-27	0	141148	271004	675817	1878324	582066	561422	459874	528328	504200	190048	0	0	0	0	0	12	3	2018	0	2017-10-11 15:07:13.690544	2018-05-20 15:17:46.523741
454	1	1	2018-03-28	0	254067	248421	355693	1158755	886783	772975	414148	397184	282132	225120	0	0	0	0	0	13	3	2018	1	2017-10-11 15:07:13.698712	2018-05-20 15:17:46.529741
455	1	1	2018-03-29	0	366985	722678	924803	2374460	2727618	888110	825059	1308523	1492214	987911	0	0	0	0	0	13	3	2018	2	2017-10-11 15:07:13.706525	2018-05-20 15:17:46.535742
456	1	1	2018-03-30	0	254067	767846	782526	1324444	5046759	1337226	933806	1077526	1738045	760442	0	0	0	0	0	13	3	2018	3	2017-10-11 15:07:13.714362	2018-05-20 15:17:46.541742
457	1	1	2018-03-31	0	564593	632344	853664	2541148	1534522	1332450	1110915	1306280	1464197	954700	0	0	0	0	0	13	3	2018	4	2017-10-11 15:07:13.722112	2018-05-20 15:17:46.546742
458	1	1	2018-04-01	0	846889	1219520	1280496	2176685	3566893	1618028	632187	1714006	3200995	1633868	0	0	0	0	0	13	4	2018	5	2017-10-11 15:07:13.729909	2018-05-20 15:17:46.552743
459	1	1	2018-04-02	0	635167	1287271	1387204	1953658	6667063	1514553	918485	1719211	2505794	2005050	0	0	0	0	0	13	4	2018	6	2017-10-11 15:07:13.737758	2018-05-20 15:17:46.558743
460	1	1	2018-04-03	0	677511	1016267	1387204	4404452	3838460	1916494	1957288	1830174	2633506	887241	0	0	0	0	0	13	4	2018	0	2017-10-11 15:07:13.745481	2018-05-20 15:17:46.564743
462	1	1	2018-04-05	0	275239	474258	533540	1049991	1529601	1113104	696240	938139	589640	286861	0	0	0	0	0	14	4	2018	2	2017-10-11 15:07:13.761985	2018-05-20 15:17:46.575744
463	1	1	2018-04-06	0	381100	440382	586894	2836292	1823883	972632	636064	1213622	682675	290939	0	0	0	0	0	14	4	2018	3	2017-10-11 15:07:13.770963	2018-05-20 15:17:46.581744
464	1	1	2018-04-07	0	592822	880764	1707328	1679682	4399899	1728871	900991	1694583	3759381	1722556	0	0	0	0	0	14	4	2018	4	2017-10-11 15:07:13.779481	2018-05-20 15:17:46.591745
465	1	1	2018-04-08	0	804544	1287271	1600620	3079836	4527283	1454107	1543906	1776985	1148308	1860474	0	0	0	0	0	14	4	2018	5	2017-10-11 15:07:13.788442	2018-05-20 15:17:46.597745
466	1	1	2018-04-09	0	381100	948515	1173788	5070688	5924366	1291722	1330308	1611195	1834468	1632777	0	0	0	0	0	14	4	2018	6	2017-10-11 15:07:13.79823	2018-05-20 15:17:46.603746
467	1	1	2018-04-10	0	762200	677511	2027452	1696487	2415368	2105375	1652640	2773868	1954499	1328323	0	0	0	0	0	14	4	2018	0	2017-10-11 15:07:13.806846	2018-05-20 15:17:46.609746
468	1	1	2018-04-11	0	762200	1016267	1814036	2547289	2448850	1583309	1262920	1466782	1333351	1177858	0	0	0	0	0	15	4	2018	1	2017-10-11 15:07:13.815507	2018-05-20 15:17:46.615746
470	1	1	2018-04-13	0	359928	440382	640248	741960	1292725	760243	820015	877384	1064434	424931	0	0	0	0	0	15	4	2018	3	2017-10-11 15:07:13.833966	2018-05-20 15:17:46.626747
471	1	1	2018-04-14	0	804544	1287271	1067080	2224282	4083884	2218148	1346903	2923614	2270548	2398496	0	0	0	0	0	15	4	2018	4	2017-10-11 15:07:13.84196	2018-05-20 15:17:46.632747
472	1	1	2018-04-15	0	381100	948515	1600620	2362683	4252837	3152497	1243878	1019276	1732657	994350	0	0	0	0	0	15	4	2018	5	2017-10-11 15:07:13.849819	2018-05-20 15:17:46.638748
473	1	1	2018-04-16	0	635167	880764	1707328	2968825	1916892	2165885	886209	1720446	2918968	1439544	0	0	0	0	0	15	4	2018	6	2017-10-11 15:07:13.857795	2018-05-20 15:17:46.644748
474	1	1	2018-04-17	0	719855	609760	960372	2040746	6410028	994254	1189560	1929593	2163448	1860896	0	0	0	0	0	15	4	2018	0	2017-10-11 15:07:13.865744	2018-05-20 15:17:46.650748
475	1	1	2018-04-18	0	804544	677511	1493912	2693114	4967466	2378398	2156270	1966844	3345990	1232979	0	0	0	0	0	16	4	2018	1	2017-10-11 15:07:13.8738	2018-05-20 15:17:46.655749
476	1	1	2018-04-19	0	190550	338756	1013726	1497132	753110	1249346	653078	1181126	581006	594413	0	0	0	0	0	16	4	2018	2	2017-10-11 15:07:13.882248	2018-05-20 15:17:46.661749
477	1	1	2018-04-20	0	423444	372631	800310	1070444	1803715	1172344	538539	1107522	597034	577834	0	0	0	0	0	16	4	2018	3	2017-10-11 15:07:13.890548	2018-05-20 15:17:46.667749
478	1	1	2018-04-21	0	635167	880764	1600620	4866081	7165704	2085169	1137868	2779257	2986315	2004810	0	0	0	0	0	16	4	2018	4	2017-10-11 15:07:13.898843	2018-05-20 15:17:46.67275
479	1	1	2018-04-22	0	508133	1151769	2027452	2355761	2535549	1339162	853383	1265947	995889	2383132	0	0	0	0	0	16	4	2018	5	2017-10-11 15:07:13.90684	2018-05-20 15:17:46.67975
480	1	1	2018-04-23	0	719855	880764	1280496	4675334	1908130	1737557	1449720	1790281	2270546	1643835	0	0	0	0	0	16	4	2018	6	2017-10-11 15:07:13.914929	2018-05-20 15:17:46.68475
481	1	1	2018-04-24	0	465789	1219520	2134160	2400896	6380170	2135407	1365254	1452692	1378153	1965868	0	0	0	0	0	16	4	2018	0	2017-10-11 15:07:13.923465	2018-05-20 15:17:46.690751
482	1	1	2018-04-25	0	508133	1016267	2027452	1582048	2358720	2010967	1793686	2414774	3382395	1458354	0	0	0	0	0	17	4	2018	1	2017-10-11 15:07:13.931985	2018-05-20 15:17:46.697751
483	1	1	2018-04-26	0	359928	508133	746956	2870948	2213946	1063680	527203	701607	783229	373177	0	0	0	0	0	17	4	2018	2	2017-10-11 15:07:13.940698	2018-05-20 15:17:46.702751
484	1	1	2018-04-27	0	359928	677511	1013726	1191137	3379235	1543430	828240	1467433	768697	387471	0	0	0	0	0	17	4	2018	3	2017-10-11 15:07:13.949197	2018-05-20 15:17:46.709752
485	1	1	2018-04-28	0	508133	745262	1173788	2832281	1695777	2879380	843746	1115689	3826918	1006972	0	0	0	0	0	17	4	2018	4	2017-10-11 15:07:13.957863	2018-05-20 15:17:46.715752
486	1	1	2018-04-29	0	465789	1355022	1920744	2182984	2130721	2027545	1163996	2062874	1392927	1107210	0	0	0	0	0	17	4	2018	5	2017-10-11 15:07:13.974219	2018-05-20 15:17:46.721752
487	1	1	2018-04-30	0	677511	1287271	1387204	5203716	6278056	2209927	1551445	1649334	2236196	2094167	0	0	0	0	0	17	4	2018	6	2017-10-11 15:07:13.982767	2018-05-20 15:17:46.727753
488	1	1	2018-05-01	0	0	0	220500	572713	1046395	1067580	897705	1563033	1032871	980296	2396183	907571	0	0	0	17	5	2018	0	2017-10-11 15:07:13.990807	2018-05-20 15:17:46.732753
489	1	1	2018-05-02	0	0	0	242550	475194	1343840	884073	479266	879386	1622606	1610466	761796	942975	0	0	0	18	5	2018	1	2017-10-11 15:07:13.998594	2018-05-20 15:17:46.738753
490	1	1	2018-05-03	0	0	0	242550	490405	671240	1169306	903112	810330	1952125	999528	1169593	1784512	0	0	0	18	5	2018	2	2017-10-11 15:07:14.00675	2018-05-20 15:17:46.744754
491	1	1	2018-05-04	0	0	0	308700	750340	925103	831424	865892	1016150	2597954	1190178	1683406	1621214	0	0	0	18	5	2018	3	2017-10-11 15:07:14.014721	2018-05-20 15:17:46.750754
492	1	1	2018-05-05	0	0	0	441000	800217	628370	996930	537458	993288	1049888	1231383	1588973	1411776	0	0	0	18	5	2018	4	2017-10-11 15:07:14.023305	2018-05-20 15:17:46.755754
493	1	1	2018-05-06	0	0	0	661500	686753	1228067	1988891	1937040	2544883	4697933	3250530	5969151	1977888	0	0	0	18	5	2018	5	2017-10-11 15:07:14.031814	2018-05-20 15:17:46.761755
494	1	1	2018-05-07	0	0	0	564480	857265	1158454	1161310	1887662	2108194	3339329	2693404	4928920	2573750	0	0	0	18	5	2018	6	2017-10-11 15:07:14.03989	2018-05-20 15:17:46.767755
495	1	1	2018-05-08	0	0	0	396900	769306	989658	671113	943051	1703075	2084314	1925370	1990778	1153314	0	0	0	18	5	2018	0	2017-10-11 15:07:14.047792	2018-05-20 15:17:46.772755
496	1	1	2018-05-09	0	0	0	286650	421124	853039	769744	408101	1510994	2130953	1499722	1891235	1372954	0	0	0	19	5	2018	1	2017-10-11 15:07:14.05606	2018-05-20 15:17:46.774755
497	1	1	2018-05-10	0	0	0	330750	269435	705519	1465060	852678	1386734	1044252	1568622	1531967	2072608	0	0	0	19	5	2018	2	2017-10-11 15:07:14.064315	2018-05-20 15:17:46.785755
499	1	1	2018-05-12	0	0	0	418950	513419	498969	1398425	676034	1135573	1993532	1985539	859325	1661788	0	0	0	19	5	2018	4	2017-10-11 15:07:14.08125	2018-05-20 15:17:46.798756
500	1	1	2018-05-13	0	0	0	661500	624609	2975032	2601067	1309677	1168527	4368066	4404824	5996592	3571094	0	0	0	19	5	2018	5	2017-10-11 15:07:14.089922	2018-05-20 15:17:46.808757
501	1	1	2018-05-14	0	0	0	317520	715896	1266734	1953341	1911267	1664887	4047910	3582188	5789050	2070551	0	0	0	19	5	2018	6	2017-10-11 15:07:14.098461	2018-05-20 15:17:46.817757
502	1	1	2018-05-15	0	0	0	396900	567826	561407	619893	876490	1138164	1125886	2064869	2240116	647769	0	0	0	19	5	2018	0	2017-10-11 15:07:14.106605	2018-05-20 15:17:46.825758
504	1	1	2018-05-17	0	0	0	352800	328955	1190214	1481368	400034	1203572	1897952	2444256	1076070	1634112	0	0	0	20	5	2018	2	2017-10-11 15:07:14.122664	2018-05-20 15:17:46.838759
505	1	1	2018-05-18	0	0	0	330750	482417	628446	888520	724669	976267	1267111	1734478	2588995	648180	0	0	0	20	5	2018	3	2017-10-11 15:07:14.130729	2018-05-20 15:17:46.845759
506	1	1	2018-05-19	0	0	0	220500	902799	558675	989594	567454	775655	1176993	2472490	1423796	957895	0	0	0	20	5	2018	4	2017-10-11 15:07:14.138658	2018-05-20 15:17:46.851759
507	1	1	2018-05-20	0	0	0	529200	1355988	1131248	1414794	1537005	2463029	3296545	4923732	4885169	3859624	0	0	0	20	5	2018	5	2017-10-11 15:07:14.146784	2018-05-20 15:17:46.85676
508	1	1	2018-05-21	0	0	0	635040	1126014	871720	1605704	1625924	1585665	4411278	3473799	3009349	2718224	0	0	0	20	5	2018	6	2017-10-11 15:07:14.154751	2018-05-20 15:17:46.86276
509	1	1	2018-05-22	0	0	0	352800	805113	601272	806028	1191156	1514766	1616048	1102835	2538153	1335199	0	0	0	20	5	2018	0	2017-10-11 15:07:14.162682	2018-05-20 15:17:46.86876
510	1	1	2018-05-23	0	0	0	220500	718718	1205267	491161	817126	938568	2116138	2711061	920085	601183	0	0	0	21	5	2018	1	2017-10-11 15:07:14.170531	2018-05-20 15:17:46.874761
511	1	1	2018-05-24	0	0	0	220500	597073	583985	781283	878211	924600	1888192	1754123	1597033	1624649	0	0	0	21	5	2018	2	2017-10-11 15:07:14.178952	2018-05-20 15:17:46.881761
512	1	1	2018-05-25	0	0	0	396900	795765	917072	692580	997478	910710	1313646	2408228	1394885	974961	0	0	0	21	5	2018	3	2017-10-11 15:07:14.187144	2018-05-20 15:17:46.888761
513	1	1	2018-05-26	0	0	0	264600	733876	675157	877055	489563	1987222	1648159	1658957	2664123	1444163	0	0	0	21	5	2018	4	2017-10-11 15:07:14.195236	2018-05-20 15:17:46.895762
514	1	1	2018-05-27	0	0	0	882000	829465	937604	1716278	968153	2679980	4981886	6137557	5778006	2243818	0	0	0	21	5	2018	5	2017-10-11 15:07:14.203168	2018-05-20 15:17:46.895762
515	1	1	2018-05-28	0	0	0	352800	1142228	2757260	2244194	1685493	2923852	4621805	1854550	4183688	1305178	0	0	0	21	5	2018	6	2017-10-11 15:07:14.211254	2018-05-20 15:17:46.907762
516	1	1	2018-05-29	0	0	0	429975	897827	985579	933176	744927	2235626	3779408	4892913	3817078	1449025	0	0	0	21	5	2018	0	2017-10-11 15:07:14.219316	2018-05-20 15:17:46.914762
517	1	1	2018-05-30	0	0	0	363825	674405	1245485	1253327	1192953	2281536	2248974	3054487	2575378	996784	0	0	0	22	5	2018	1	2017-10-11 15:07:14.227937	2018-05-20 15:17:46.939763
518	1	1	2018-05-31	0	0	0	330750	826180	1257834	1415042	1454940	1557862	2319926	2535405	1880142	1825279	0	0	0	22	5	2018	2	2017-10-11 15:07:14.236282	2018-05-20 15:17:46.946764
519	1	1	2018-06-01	0	0	0	463050	538959	1038553	1042502	1866560	1965070	4006095	4037648	3655615	856462	0	0	0	22	6	2018	3	2017-10-11 15:07:14.244744	2018-05-20 15:17:46.947764
520	1	1	2018-06-02	0	0	0	661500	1101276	486600	1596069	1754607	1530806	1958162	3068325	1823366	1797782	0	0	0	22	6	2018	4	2017-10-11 15:07:14.253211	2018-05-20 15:17:46.957764
521	1	1	2018-06-03	0	0	0	595350	755403	952830	525765	1745348	2488614	2020912	3347660	2285871	1719308	0	0	0	22	6	2018	5	2017-10-11 15:07:14.261477	2018-05-20 15:17:46.963764
522	1	1	2018-06-04	0	0	0	363825	1744303	1315955	1448225	867327	2175531	3881501	3411468	4705210	1243493	0	0	0	22	6	2018	6	2017-10-11 15:07:14.269922	2018-05-20 15:17:46.969764
523	1	1	2018-06-05	0	0	0	1323000	758430	1097375	2915320	3822793	2393691	4407521	10967894	6781102	3794208	0	0	0	22	6	2018	0	2017-10-11 15:07:14.278282	2018-05-20 15:17:46.975765
524	1	1	2018-06-06	0	0	0	529200	996145	2028020	2261769	3088469	2845717	4562495	6877982	7505803	3235642	0	0	0	23	6	2018	1	2017-10-11 15:07:14.286848	2018-05-20 15:17:46.982765
525	1	1	2018-06-07	0	0	0	529200	768088	721808	520888	1041400	1632559	3353680	5122260	1678922	2300517	0	0	0	23	6	2018	2	2017-10-11 15:07:14.295121	2018-05-20 15:17:46.988765
526	1	1	2018-06-08	0	0	0	595350	1313502	525053	1061689	1204140	2024786	2304738	2503041	2392182	2082502	0	0	0	23	6	2018	3	2017-10-11 15:07:14.303612	2018-05-20 15:17:46.988765
527	1	1	2018-06-09	0	0	0	562275	1675371	1682036	1543136	989704	2165220	1930855	3919590	2455721	3115308	0	0	0	23	6	2018	4	2017-10-11 15:07:14.319582	2018-05-20 15:17:47.000766
528	1	1	2018-06-10	0	0	0	297675	379352	569186	1122499	1297794	1200803	2204340	3965175	2700434	1731353	0	0	0	23	6	2018	5	2017-10-11 15:07:14.328225	2018-05-20 15:17:47.005766
529	1	1	2018-06-11	0	0	0	628425	578332	1464042	1878583	1118732	1766497	4744129	3495616	2406802	2296451	0	0	0	23	6	2018	6	2017-10-11 15:07:14.336857	2018-05-20 15:17:47.009766
530	1	1	2018-06-12	0	0	0	595350	1866176	2431424	3564049	1822622	3196106	7868749	7532071	5811704	4317295	0	0	0	23	6	2018	0	2017-10-11 15:07:14.344869	2018-05-20 15:17:47.009766
531	1	1	2018-06-13	0	0	0	1005480	1952152	2863614	2399285	2689674	1864172	5596240	4228436	12090706	4145564	0	0	0	24	6	2018	1	2017-10-11 15:07:14.353393	2018-05-20 15:17:47.022766
532	1	1	2018-06-14	0	0	0	661500	722331	1212548	981411	939660	1511213	1770482	2087444	1449441	1691412	0	0	0	24	6	2018	2	2017-10-11 15:07:14.362005	2018-05-20 15:17:47.028767
533	1	1	2018-06-15	0	0	0	529200	1515974	1119065	807495	999330	1305944	2839299	3551728	2093350	1413032	0	0	0	24	6	2018	3	2017-10-11 15:07:14.370282	2018-05-20 15:17:47.034767
534	1	1	2018-06-16	0	0	0	661500	832067	1194645	1880900	734472	2185148	1247440	1692860	3416397	2812312	0	0	0	24	6	2018	4	2017-10-11 15:07:14.379277	2018-05-20 15:17:47.040767
536	1	1	2018-06-18	0	0	0	363825	643239	1076220	866360	1232759	2012469	2729290	3805358	2477618	2454785	0	0	0	24	6	2018	6	2017-10-11 15:07:14.396222	2018-05-20 15:17:47.052767
537	1	1	2018-06-19	0	0	0	661500	2601126	1631633	3457552	2780698	2968803	4129530	6833442	5168465	2388198	0	0	0	24	6	2018	0	2017-10-11 15:07:14.404394	2018-05-20 15:17:47.057768
538	1	1	2018-06-20	0	0	0	1058400	1388287	2092722	2149012	2702684	4558894	4401194	4293914	11106756	2055197	0	0	0	25	6	2018	1	2017-10-11 15:07:14.412793	2018-05-20 15:17:47.061768
539	1	1	2018-06-21	0	0	0	330750	579876	1772526	1844959	773914	1870140	1604588	1970635	3222863	974949	0	0	0	25	6	2018	2	2017-10-11 15:07:14.420872	2018-05-20 15:17:47.061768
540	1	1	2018-06-22	0	0	0	463050	1076461	693359	922592	1460419	2397713	3684135	4070030	1979862	970501	0	0	0	25	6	2018	3	2017-10-11 15:07:14.429104	2018-05-20 15:17:47.077768
541	1	1	2018-06-23	0	0	0	529200	1261274	1492991	1241118	1077127	1986275	4330908	3059468	1216423	1387081	0	0	0	25	6	2018	4	2017-10-11 15:07:14.437069	2018-05-20 15:17:47.082769
542	1	1	2018-06-24	0	0	0	463050	603636	1091481	1106027	1613181	1714966	1441259	3114936	2567240	1167836	0	0	0	25	6	2018	5	2017-10-11 15:07:14.44486	2018-05-20 15:17:47.092769
544	1	1	2018-06-26	0	0	0	793800	2466888	2622478	1652079	3099287	2627001	5935895	7000037	4555775	5009326	0	0	0	25	6	2018	0	2017-10-11 15:07:14.46106	2018-05-20 15:17:47.105769
545	1	1	2018-06-27	0	0	0	952560	1172432	1059518	2067642	1333113	3584857	4498645	8579670	5815179	2815891	0	0	0	26	6	2018	1	2017-10-11 15:07:14.469497	2018-05-20 15:17:47.117769
546	1	1	2018-06-28	0	0	0	529200	956416	1971727	1621420	897121	1628605	3596677	3027102	2036835	1462130	0	0	0	26	6	2018	2	2017-10-11 15:07:14.478158	2018-05-20 15:17:47.12077
547	1	1	2018-06-29	0	0	0	363825	955280	1199773	1209457	792965	2352080	2809019	3403206	3303364	1969048	0	0	0	26	6	2018	3	2017-10-11 15:07:14.486675	2018-05-20 15:17:47.13077
548	1	1	2018-06-30	0	0	0	562275	1080866	603845	1841212	591409	995749	3081250	4147592	2040618	1162917	0	0	0	26	6	2018	4	2017-10-11 15:07:14.494854	2018-05-20 15:17:47.13277
549	1	1	2018-07-01	0	338756	903348	1067081	2453527	1573202	1729762	873510	972609	1805111	1397137	0	0	0	0	0	26	7	2018	5	2017-10-11 15:07:14.50278	2018-05-20 15:17:47.14477
550	1	1	2018-07-02	0	366985	451674	1138219	1773628	3579072	1184988	435941	1100275	2317854	1139022	0	0	0	0	0	26	7	2018	6	2017-10-11 15:07:14.510916	2018-05-20 15:17:47.15177
551	1	1	2018-07-03	0	366985	542009	924803	1369597	3011834	1405466	695483	940953	2189433	598613	0	0	0	0	0	26	7	2018	0	2017-10-11 15:07:14.5191	2018-05-20 15:17:47.158771
552	1	1	2018-07-04	0	423444	858181	640248	1143219	4553597	1432906	1201680	1067887	2075080	922194	0	0	0	0	0	27	7	2018	1	2017-10-11 15:07:14.527437	2018-05-20 15:17:47.163771
553	1	1	2018-07-05	0	268181	451674	533540	1364270	1240886	468922	462622	505352	695489	324836	0	0	0	0	0	27	7	2018	2	2017-10-11 15:07:14.535714	2018-05-20 15:17:47.169771
554	1	1	2018-07-06	0	169378	271004	569109	480945	1092119	635401	418390	430991	503077	571508	0	0	0	0	0	27	7	2018	3	2017-10-11 15:07:14.543947	2018-05-20 15:17:47.175772
555	1	1	2018-07-07	0	479904	587176	995942	2336203	3615381	909389	1054023	1201396	2359107	979152	0	0	0	0	0	27	7	2018	4	2017-10-11 15:07:14.55243	2018-05-20 15:17:47.181772
556	1	1	2018-07-08	0	338756	542009	853664	2702461	2335490	1318482	1080002	1063412	1063896	1104505	0	0	0	0	0	27	7	2018	5	2017-10-11 15:07:14.561142	2018-05-20 15:17:47.183772
557	1	1	2018-07-09	0	479904	858181	1422774	1997794	2458043	1505232	424895	1030148	1314870	1276464	0	0	0	0	0	27	7	2018	6	2017-10-11 15:07:14.569299	2018-05-20 15:17:47.183772
558	1	1	2018-07-10	0	310526	858181	924803	1795075	3077787	1424066	917013	993257	1092343	659043	0	0	0	0	0	27	7	2018	0	2017-10-11 15:07:14.578125	2018-05-20 15:17:47.198772
559	1	1	2018-07-11	0	254067	722678	1280497	3109563	1842816	1415234	1249462	1270291	1213940	1022703	0	0	0	0	0	28	7	2018	1	2017-10-11 15:07:14.586636	2018-05-20 15:17:47.204773
560	1	1	2018-07-12	0	225837	271004	604678	1075536	448468	930776	551597	699489	503650	384005	0	0	0	0	0	28	7	2018	2	2017-10-11 15:07:14.594787	2018-05-20 15:17:47.204773
561	1	1	2018-07-13	0	197607	338756	533540	1037659	919450	492640	354720	414328	433016	230816	0	0	0	0	0	28	7	2018	3	2017-10-11 15:07:14.603678	2018-05-20 15:17:47.216773
562	1	1	2018-07-14	0	254067	632344	853664	2466354	1603883	728150	578396	1283603	2061651	780598	0	0	0	0	0	28	7	2018	4	2017-10-11 15:07:14.612417	2018-05-20 15:17:47.221773
563	1	1	2018-07-15	0	254067	903348	853664	3215525	1965648	1728658	1159120	1401893	1182643	907179	0	0	0	0	0	28	7	2018	5	2017-10-11 15:07:14.620953	2018-05-20 15:17:47.225773
564	1	1	2018-07-16	0	536363	677511	1280497	1461583	3135605	1145068	830927	1230180	2683040	985223	0	0	0	0	0	28	7	2018	6	2017-10-11 15:07:14.629956	2018-05-20 15:17:47.225773
565	1	1	2018-07-17	0	423444	813013	924803	1496245	1550621	1404082	1323902	1850460	1531413	913064	0	0	0	0	0	28	7	2018	0	2017-10-11 15:07:14.638918	2018-05-20 15:17:47.239774
566	1	1	2018-07-18	0	564593	677511	782526	4011842	2942815	952930	507799	1514657	2480157	930845	0	0	0	0	0	29	7	2018	1	2017-10-11 15:07:14.647318	2018-05-20 15:17:47.245774
567	1	1	2018-07-19	0	282296	451674	355693	1057262	1820538	497728	402845	335820	391684	627418	0	0	0	0	0	29	7	2018	2	2017-10-11 15:07:14.664163	2018-05-20 15:17:47.252774
568	1	1	2018-07-20	0	268181	338756	426832	1654578	830915	512868	340489	894593	651447	280324	0	0	0	0	0	29	7	2018	3	2017-10-11 15:07:14.672982	2018-05-20 15:17:47.258775
569	1	1	2018-07-21	0	282296	903348	711387	3465311	2372540	1436480	850482	1165557	1061049	747134	0	0	0	0	0	29	7	2018	4	2017-10-11 15:07:14.6817	2018-05-20 15:17:47.264775
570	1	1	2018-07-22	0	508133	858181	1422774	1758171	1387527	1435271	975667	866043	808572	727692	0	0	0	0	0	29	7	2018	5	2017-10-11 15:07:14.690544	2018-05-20 15:17:47.270775
571	1	1	2018-07-23	0	254067	496841	1067081	1218182	2957565	1230956	923343	2274460	1402606	756166	0	0	0	0	0	29	7	2018	6	2017-10-11 15:07:14.699054	2018-05-20 15:17:47.275776
573	1	1	2018-07-25	0	479904	677511	924803	2223033	2380974	1167835	563560	1511874	1534411	1273961	0	0	0	0	0	30	7	2018	1	2017-10-11 15:07:14.716057	2018-05-20 15:17:47.287776
574	1	1	2018-07-26	0	282296	406507	462401	1220911	476236	816614	424499	495308	655460	247062	0	0	0	0	0	30	7	2018	2	2017-10-11 15:07:14.724581	2018-05-20 15:17:47.293777
575	1	1	2018-07-27	0	225837	293588	497970	1351881	1531715	610244	345123	496481	394985	325173	0	0	0	0	0	30	7	2018	3	2017-10-11 15:07:14.73288	2018-05-20 15:17:47.296777
576	1	1	2018-07-28	0	366985	587176	640248	1424676	1704761	740092	825059	1215057	1228882	675939	0	0	0	0	0	30	7	2018	4	2017-10-11 15:07:14.740882	2018-05-20 15:17:47.307777
577	1	1	2018-07-29	0	395215	903348	924803	916923	5607510	703803	1167258	1574845	1365607	811138	0	0	0	0	0	30	7	2018	5	2017-10-11 15:07:14.749173	2018-05-20 15:17:47.315777
578	1	1	2018-07-30	0	254067	632344	1138219	2329385	2046029	705415	617175	1741706	1171357	901661	0	0	0	0	0	30	7	2018	6	2017-10-11 15:07:14.757575	2018-05-20 15:17:47.323778
579	1	1	2018-07-31	0	635167	813013	1707328	2539466	6737464	2157370	632187	1714006	3012701	864989	0	0	0	0	0	30	7	2018	0	2017-10-11 15:07:14.765785	2018-05-20 15:17:47.333778
581	1	1	2018-08-02	0	719855	745262	2027452	3915069	4094357	1474226	1712627	1220116	1901977	1129216	0	0	0	0	0	31	8	2018	2	2017-10-11 15:07:14.782221	2018-05-20 15:17:47.349779
582	1	1	2018-08-03	0	550478	609760	2027452	2521919	4159889	1913053	1017039	2022959	2082463	2076640	0	0	0	0	0	31	8	2018	3	2017-10-11 15:07:14.790638	2018-05-20 15:17:47.35778
583	1	1	2018-08-04	0	317583	372631	640248	859083	3059202	1171688	556992	1279281	1002388	487664	0	0	0	0	0	31	8	2018	4	2017-10-11 15:07:14.799192	2018-05-20 15:17:47.35778
584	1	1	2018-08-05	0	254067	609760	960372	2521149	1595898	1026667	636064	1441177	682675	646530	0	0	0	0	0	31	8	2018	5	2017-10-11 15:07:14.807468	2018-05-20 15:17:47.37278
585	1	1	2018-08-06	0	465789	745262	1493912	1526984	2588176	1861861	1001101	2927007	2506254	1722556	0	0	0	0	0	31	8	2018	6	2017-10-11 15:07:14.815619	2018-05-20 15:17:47.381781
586	1	1	2018-08-07	0	635167	677511	2027452	3695803	4527283	1817634	1003539	2284695	2296616	2524929	0	0	0	0	0	31	8	2018	0	2017-10-11 15:07:14.823915	2018-05-20 15:17:47.387781
587	1	1	2018-08-08	0	762200	880764	2134160	4119934	6272858	1878869	1330308	2636501	2201362	864411	0	0	0	0	0	32	8	2018	1	2017-10-11 15:07:14.833716	2018-05-20 15:17:47.393781
588	1	1	2018-08-09	0	762200	609760	1600620	2714379	2012807	1733838	1263783	1386934	1839528	2415132	0	0	0	0	0	32	8	2018	2	2017-10-11 15:07:14.842263	2018-05-20 15:17:47.400782
589	1	1	2018-08-10	0	550478	677511	1600620	2547289	1584550	1899970	820898	1711245	1333351	1177858	0	0	0	0	0	32	8	2018	3	2017-10-11 15:07:14.850752	2018-05-20 15:17:47.406782
590	1	1	2018-08-11	0	190550	440382	1013726	1432039	1863012	873115	779722	1414675	470641	517120	0	0	0	0	0	32	8	2018	4	2017-10-11 15:07:14.861617	2018-05-20 15:17:47.408782
591	1	1	2018-08-12	0	381100	508133	907018	1261332	1193285	760243	868252	1316075	1005298	601985	0	0	0	0	0	32	8	2018	5	2017-10-11 15:07:14.872718	2018-05-20 15:17:47.418782
592	1	1	2018-08-13	0	592822	1287271	1173788	1807229	7350991	998167	1959131	2273922	1946184	1319173	0	0	0	0	0	32	8	2018	6	2017-10-11 15:07:14.884132	2018-05-20 15:17:47.420782
593	1	1	2018-08-14	0	635167	880764	1493912	2362683	3071493	1493288	829252	2038552	2454598	1767733	0	0	0	0	0	32	8	2018	0	2017-10-11 15:07:14.895218	2018-05-20 15:17:47.431782
594	1	1	2018-08-15	0	762200	1084018	1814036	3133759	2715597	2939416	681699	2007187	3544461	1151635	0	0	0	0	0	33	8	2018	1	2017-10-11 15:07:14.906227	2018-05-20 15:17:47.437783
595	1	1	2018-08-16	0	804544	745262	1493912	1894979	6747398	1391956	1119586	1624920	2781576	2233075	0	0	0	0	0	33	8	2018	2	2017-10-11 15:07:14.917399	2018-05-20 15:17:47.443783
596	1	1	2018-08-17	0	465789	948515	1707328	5984698	6031923	2510531	2048457	3576080	4182488	1120890	0	0	0	0	0	33	8	2018	3	2017-10-11 15:07:14.928864	2018-05-20 15:17:47.449783
597	1	1	2018-08-18	0	381100	440382	746956	1397323	828421	763489	587770	1056797	456504	777310	0	0	0	0	0	33	8	2018	4	2017-10-11 15:07:14.940492	2018-05-20 15:17:47.455784
598	1	1	2018-08-19	0	359928	304880	586894	1784074	2404954	689614	430831	886018	895550	666732	0	0	0	0	0	33	8	2018	5	2017-10-11 15:07:14.951811	2018-05-20 15:17:47.461784
599	1	1	2018-08-20	0	508133	1287271	1920744	5122190	5732563	2566362	1056592	2615771	1580990	1179300	0	0	0	0	0	33	8	2018	6	2017-10-11 15:07:14.963357	2018-05-20 15:17:47.461784
600	1	1	2018-08-21	0	677511	609760	2027452	2355761	2535549	2975916	1517125	1558088	1217197	2144819	0	0	0	0	0	33	8	2018	0	2017-10-11 15:07:14.975127	2018-05-20 15:17:47.512786
601	1	1	2018-08-22	0	465789	677511	1814036	3214292	1908130	2369396	1967477	2046035	1075522	2082191	0	0	0	0	0	34	8	2018	1	2017-10-11 15:07:14.987154	2018-05-20 15:17:47.634792
602	1	1	2018-08-23	0	677511	880764	960372	2240836	6380170	3120980	1023941	2905384	2205045	1387672	0	0	0	0	0	34	8	2018	2	2017-10-11 15:07:14.998847	2018-05-20 15:17:47.640793
603	1	1	2018-08-24	0	465789	1287271	1280496	2531277	4717440	1899247	1076212	1744003	3805195	2651552	0	0	0	0	0	34	8	2018	3	2017-10-11 15:07:15.010463	2018-05-20 15:17:47.641793
604	1	1	2018-08-25	0	275239	338756	907018	2296758	3622820	1188819	431348	420964	1424052	746354	0	0	0	0	0	34	8	2018	4	2017-10-11 15:07:15.022045	2018-05-20 15:17:47.653793
605	1	1	2018-08-26	0	254067	338756	800310	992614	3379235	1200445	496944	1312966	628934	493144	0	0	0	0	0	34	8	2018	5	2017-10-11 15:07:15.033788	2018-05-20 15:17:47.658793
606	1	1	2018-08-27	0	508133	677511	1280496	5381334	1849938	2201879	584132	2119809	3252880	1438532	0	0	0	0	0	34	8	2018	6	2017-10-11 15:07:15.045297	2018-05-20 15:17:47.665794
607	1	1	2018-08-28	0	508133	1084018	960372	1403347	3114130	1387268	1745995	1418226	1821519	1107210	0	0	0	0	0	34	8	2018	0	2017-10-11 15:07:15.056959	2018-05-20 15:17:47.671794
608	1	1	2018-08-29	0	550478	609760	1920744	2601858	4316164	1420667	1637637	1413715	1118098	991974	0	0	0	0	0	35	8	2018	1	2017-10-11 15:07:15.079352	2018-05-20 15:17:47.676794
610	1	1	2018-08-31	0	0	0	220500	678848	1264790	757777	745525	806104	854003	1610466	1185016	1109382	0	0	0	35	8	2018	3	2017-10-11 15:07:15.102035	2018-05-20 15:17:47.688795
611	1	1	2018-09-01	0	0	0	220500	517649	552786	1242387	808047	891363	1673250	1554822	1949322	1679541	0	0	0	35	9	2018	4	2017-10-11 15:07:15.113207	2018-05-20 15:17:47.694795
612	1	1	2018-09-02	0	0	0	308700	394916	782780	785233	865892	1100830	1731970	1622970	2448590	1621214	0	0	0	35	9	2018	5	2017-10-11 15:07:15.124695	2018-05-20 15:17:47.699796
613	1	1	2018-09-03	0	0	0	374850	666848	628370	577170	537458	1787918	1240777	2189125	1235868	1317658	0	0	0	35	9	2018	6	2017-10-11 15:07:15.135921	2018-05-20 15:17:47.705796
614	1	1	2018-09-04	0	0	0	573300	743982	1228067	2105885	1139435	2544883	5285174	3250530	7022530	1977888	0	0	0	35	9	2018	0	2017-10-11 15:07:15.146941	2018-05-20 15:17:47.711796
615	1	1	2018-09-05	0	0	0	388080	1543077	1053140	1055736	1297768	1897375	3153811	5087541	4312805	2059000	0	0	0	36	9	2018	1	2017-10-11 15:07:15.158097	2018-05-20 15:17:47.716796
616	1	1	2018-09-06	0	0	0	220500	512870	1370295	559261	884111	1523804	1839101	3080592	2107883	1153314	0	0	0	36	9	2018	2	2017-10-11 15:07:15.169237	2018-05-20 15:17:47.722797
618	1	1	2018-09-08	0	0	0	441000	449058	539514	952289	669962	1078571	854388	2171938	1802314	1036304	0	0	0	36	9	2018	4	2017-10-11 15:07:15.191962	2018-05-20 15:17:47.734798
619	1	1	2018-09-09	0	0	0	286650	545401	921834	635930	665750	1585496	1534381	2812637	1269680	498822	0	0	0	36	9	2018	5	2017-10-11 15:07:15.203324	2018-05-20 15:17:47.739798
620	1	1	2018-09-10	0	0	0	352800	479191	614115	662412	507026	1348493	1758999	1103077	1623170	1574325	0	0	0	36	9	2018	6	2017-10-11 15:07:15.214344	2018-05-20 15:17:47.746798
621	1	1	2018-09-11	0	0	0	485100	1022087	1338764	2456563	1914144	1298363	3448473	4129523	5621805	2618802	0	0	0	36	9	2018	0	2017-10-11 15:07:15.225279	2018-05-20 15:17:47.751798
622	1	1	2018-09-12	0	0	0	388080	393743	1013387	1149024	1710081	1427046	3408766	2865750	2894525	2415643	0	0	0	37	9	2018	1	2017-10-11 15:07:15.236531	2018-05-20 15:17:47.757799
623	1	1	2018-09-13	0	0	0	220500	434220	954392	619893	1146179	1219461	2026595	1514237	1493411	647769	0	0	0	37	9	2018	2	2017-10-11 15:07:15.24771	2018-05-20 15:17:47.764799
624	1	1	2018-09-14	0	0	0	308700	487819	996493	826710	994833	819441	1490231	1548201	761987	1222690	0	0	0	37	9	2018	3	2017-10-11 15:07:15.258633	2018-05-20 15:17:47.7698
625	1	1	2018-09-15	0	0	0	308700	657909	714128	814752	654601	945663	1459963	2199830	1315196	1720118	0	0	0	37	9	2018	4	2017-10-11 15:07:15.269698	2018-05-20 15:17:47.7758
626	1	1	2018-09-16	0	0	0	396900	353772	439912	444260	1119943	610167	1647244	2948613	1771418	1026285	0	0	0	37	9	2018	5	2017-10-11 15:07:15.280917	2018-05-20 15:17:47.7818
627	1	1	2018-09-17	0	0	0	330750	637270	761829	927744	794436	705141	2000888	2617931	1613635	1117544	0	0	0	37	9	2018	6	2017-10-11 15:07:15.292304	2018-05-20 15:17:47.7868
628	1	1	2018-09-18	0	0	0	529200	1355988	1583747	848876	1397277	2463029	1745230	4185172	2586266	2894718	0	0	0	37	9	2018	0	2017-10-11 15:07:15.303421	2018-05-20 15:17:47.792801
629	1	1	2018-09-19	0	0	0	317520	770431	871720	883137	1974336	1097768	4999448	3936972	5416828	1573708	0	0	0	38	9	2018	1	2017-10-11 15:07:15.314379	2018-05-20 15:17:47.798801
630	1	1	2018-09-20	0	0	0	374850	581471	284813	1465506	877694	1275592	1385184	1764536	2404566	1335199	0	0	0	38	9	2018	2	2017-10-11 15:07:15.32567	2018-05-20 15:17:47.806802
631	1	1	2018-09-21	0	0	0	242550	924066	1004390	717850	885219	1407852	1587103	1988111	1124549	1135568	0	0	0	38	9	2018	3	2017-10-11 15:07:15.336762	2018-05-20 15:17:47.812802
632	1	1	2018-09-22	0	0	0	374850	597073	713759	585962	1112401	1001650	1652168	1444572	2468142	860108	0	0	0	38	9	2018	4	2017-10-11 15:07:15.348212	2018-05-20 15:17:47.818802
633	1	1	2018-09-23	0	0	0	242550	979403	458536	634865	762778	1190928	2335371	2167405	2650282	877465	0	0	0	38	9	2018	5	2017-10-11 15:07:15.35969	2018-05-20 15:17:47.820802
634	1	1	2018-09-24	0	0	0	198450	995974	595727	438528	376587	1092972	1373466	1824853	2243472	1520172	0	0	0	38	9	2018	6	2017-10-11 15:07:15.371342	2018-05-20 15:17:47.831802
635	1	1	2018-09-25	0	0	0	396900	898587	1218885	1320214	1320209	1786653	2740037	3409754	5007605	1319893	0	0	0	38	9	2018	0	2017-10-11 15:07:15.38291	2018-05-20 15:17:47.837803
636	1	1	2018-09-26	0	0	0	317520	888399	3063622	1716148	2022592	3086288	4313684	4121222	3625863	2373050	0	0	0	39	9	2018	1	2017-10-11 15:07:15.394517	2018-05-20 15:17:47.839803
637	1	1	2018-09-27	0	0	0	595350	1243145	833952	666554	893912	1117813	3381575	4892913	2862809	2028635	0	0	0	39	9	2018	2	2017-10-11 15:07:15.406236	2018-05-20 15:17:47.850803
638	1	1	2018-09-28	0	0	0	363825	1146489	2117325	1032151	565083	1597075	2398906	2545406	2377272	2104322	0	0	0	39	9	2018	3	2017-10-11 15:07:15.417719	2018-05-20 15:17:47.857803
639	1	1	2018-09-29	0	0	0	330750	413090	1191632	819235	995485	865479	2174931	1521243	1709220	912640	0	0	0	39	9	2018	4	2017-10-11 15:07:15.429091	2018-05-20 15:17:47.864804
641	1	1	2018-10-01	0	0	0	628425	1040094	437940	1489664	1032122	1403239	3328875	3540375	2583102	1324681	0	0	0	39	10	2018	6	2017-10-11 15:07:15.452085	2018-05-20 15:17:47.913806
642	1	1	2018-10-02	0	0	0	595350	1236114	952830	759438	1377906	1309797	2020912	5300462	2461707	1833928	0	0	0	39	10	2018	0	2017-10-11 15:07:15.463503	2018-05-20 15:17:47.920806
643	1	1	2018-10-03	0	0	0	429975	1550491	1385216	1893832	867327	2039561	3105200	1705734	4234689	2763318	0	0	0	40	10	2018	1	2017-10-11 15:07:15.475072	2018-05-20 15:17:47.926807
644	1	1	2018-10-04	0	0	0	793800	1103171	1463167	2267471	2336151	4308644	6010256	4935552	6102992	2845656	0	0	0	40	10	2018	2	2017-10-11 15:07:15.48672	2018-05-20 15:17:47.932807
645	1	1	2018-10-05	0	0	0	476280	1881608	2704026	3701077	2275714	2695943	2737497	4126789	4691127	4977910	0	0	0	40	10	2018	3	2017-10-11 15:07:15.498583	2018-05-20 15:17:47.932807
647	1	1	2018-10-07	0	0	0	496125	1081707	630064	530844	760510	2024786	2160692	3253953	2827124	2450002	0	0	0	40	10	2018	5	2017-10-11 15:07:15.521199	2018-05-20 15:17:47.950808
648	1	1	2018-10-08	0	0	0	595350	881774	1780979	868014	640397	1732176	1792937	4180896	2600176	2648012	0	0	0	40	10	2018	6	2017-10-11 15:07:15.543688	2018-05-20 15:17:47.953808
649	1	1	2018-10-09	0	0	0	661500	448325	512267	1295192	834296	1901271	2204340	4248402	2531657	1500506	0	0	0	40	10	2018	0	2017-10-11 15:07:15.555705	2018-05-20 15:17:47.953808
650	1	1	2018-10-10	0	0	0	396900	1098831	1464042	1043657	1491643	3532994	4217003	1966284	3147356	2439979	0	0	0	41	10	2018	1	2017-10-11 15:07:15.567607	2018-05-20 15:17:47.968808
651	1	1	2018-10-11	0	0	0	661500	1599580	4052373	2250978	2213184	2983032	9835936	4602932	5811704	5756394	0	0	0	41	10	2018	2	2017-10-11 15:07:15.579879	2018-05-20 15:17:47.973808
652	1	1	2018-10-12	0	0	0	952560	1501655	3200510	2549240	3586232	1553477	3621097	5168088	12090706	3731008	0	0	0	41	10	2018	3	2017-10-11 15:07:15.592057	2018-05-20 15:17:47.979809
653	1	1	2018-10-13	0	0	0	297675	626020	1616730	1864681	1670507	954450	3186868	2890307	1449441	1602391	0	0	0	41	10	2018	4	2017-10-11 15:07:15.604143	2018-05-20 15:17:47.985809
655	1	1	2018-10-15	0	0	0	396900	832067	1109313	1770259	795678	1413919	1474247	1385068	1808681	2671696	0	0	0	41	10	2018	6	2017-10-11 15:07:15.627597	2018-05-20 15:17:47.99781
656	1	1	2018-10-16	0	0	0	628425	680099	1443914	1088790	695540	1611032	1509547	3470544	2536131	1314079	0	0	0	41	10	2018	0	2017-10-11 15:07:15.63914	2018-05-20 15:17:48.00381
657	1	1	2018-10-17	0	0	0	363825	593759	1369735	1575200	1643678	1868721	2729290	4476892	4504760	1699466	0	0	0	42	10	2018	1	2017-10-11 15:07:15.650949	2018-05-20 15:17:48.00881
658	1	1	2018-10-18	0	0	0	1124550	1683081	1757143	2766042	2048935	3628537	6882551	4730845	3322585	2653553	0	0	0	42	10	2018	2	2017-10-11 15:07:15.662408	2018-05-20 15:17:48.014811
659	1	1	2018-10-19	0	0	0	1058400	1041215	2253700	1953647	1748795	2963281	4169552	7633624	9255630	2055197	0	0	0	42	10	2018	3	2017-10-11 15:07:15.674041	2018-05-20 15:17:48.020811
660	1	1	2018-10-20	0	0	0	628425	644307	1218612	2049954	1393045	2119492	2317739	1642196	2464543	1595371	0	0	0	42	10	2018	4	2017-10-11 15:07:15.685937	2018-05-20 15:17:48.026811
661	1	1	2018-10-21	0	0	0	496125	1537802	878254	1025102	1369143	2664126	3900848	4942179	1979862	794047	0	0	0	42	10	2018	5	2017-10-11 15:07:15.698178	2018-05-20 15:17:48.031812
662	1	1	2018-10-22	0	0	0	429975	1801820	995327	1965104	1615691	2234560	2381999	4706874	1216423	1173684	0	0	0	42	10	2018	6	2017-10-11 15:07:15.709972	2018-05-20 15:17:48.034812
663	1	1	2018-10-23	0	0	0	661500	510769	839601	1179762	1209886	1629218	1561364	2699611	2727693	1297596	0	0	0	42	10	2018	0	2017-10-11 15:07:15.72174	2018-05-20 15:17:48.034812
664	1	1	2018-10-24	0	0	0	330750	1751514	903894	940750	1092829	2449008	2222016	2753673	3380364	1432946	0	0	0	43	10	2018	1	2017-10-11 15:07:15.733678	2018-05-20 15:17:48.049812
665	1	1	2018-10-25	0	0	0	727650	1603477	3429395	1835643	1894009	4059911	4239925	3937521	10123944	5635492	0	0	0	43	10	2018	2	2017-10-11 15:07:15.745824	2018-05-20 15:17:48.055813
666	1	1	2018-10-26	0	0	0	635040	827599	794639	3273767	1999670	2560612	4844694	6321862	6872484	2166070	0	0	0	43	10	2018	3	2017-10-11 15:07:15.758096	2018-05-20 15:17:48.055813
667	1	1	2018-10-27	0	0	0	297675	888100	1971727	853379	1525106	1628605	1703689	1967616	1222101	1705819	0	0	0	43	10	2018	4	2017-10-11 15:07:15.771342	2018-05-20 15:17:48.067813
668	1	1	2018-10-28	0	0	0	562275	955280	2399546	1108669	670970	2104493	3183554	3176326	1943155	1107590	0	0	0	43	10	2018	5	2017-10-11 15:07:15.783893	2018-05-20 15:17:48.072813
669	1	1	2018-10-29	0	0	0	661500	1544094	1026537	1550494	1123677	1194899	2310938	4147592	2550772	1279209	0	0	0	43	10	2018	6	2017-10-11 15:07:15.799239	2018-05-20 15:17:48.079813
670	1	1	2018-10-30	0	282296	813013	995942	2453527	1573202	1945982	786159	673345	2123660	1397137	0	0	0	0	0	43	10	2018	0	2017-10-11 15:07:15.822784	2018-05-20 15:17:48.084814
671	1	1	2018-10-31	0	282296	451674	1138219	2364837	2448839	1939072	784694	1540385	1506605	512560	0	0	0	0	0	44	10	2018	1	2017-10-11 15:07:15.838037	2018-05-20 15:17:48.090814
672	1	1	2018-11-01	0	282296	587176	1067081	1283997	3212622	739719	534987	1787811	1931853	931175	0	0	0	0	0	44	11	2018	2	2017-10-11 15:07:15.853948	2018-05-20 15:17:48.097814
673	1	1	2018-11-02	0	282296	542009	853664	1067004	2529776	1432906	600840	970806	1342699	829975	0	0	0	0	0	44	11	2018	3	2017-10-11 15:07:15.869404	2018-05-20 15:17:48.102815
674	1	1	2018-11-03	0	239952	361339	355693	1077056	744531	368438	533795	459411	645811	413427	0	0	0	0	0	44	11	2018	4	2017-10-11 15:07:15.885573	2018-05-20 15:17:48.108815
675	1	1	2018-11-04	0	211722	429090	355693	628929	2426932	635401	278927	818883	905539	371480	0	0	0	0	0	44	11	2018	5	2017-10-11 15:07:15.903349	2018-05-20 15:17:48.114815
676	1	1	2018-11-05	0	423444	451674	1280497	2530887	4131864	1030640	887598	780907	1365799	611970	0	0	0	0	0	44	11	2018	6	2017-10-11 15:07:15.920523	2018-05-20 15:17:48.119816
677	1	1	2018-11-06	0	282296	406507	1280497	1801640	1946242	1014217	780001	1554217	1182107	1288589	0	0	0	0	0	44	11	2018	0	2017-10-11 15:07:15.937067	2018-05-20 15:17:48.125816
678	1	1	2018-11-07	0	564593	677511	995942	3163173	3160341	1034847	382406	1030148	1150512	1021171	0	0	0	0	0	45	11	2018	1	2017-10-11 15:07:15.953667	2018-05-20 15:17:48.131816
679	1	1	2018-11-08	0	282296	587176	1422774	2243844	2753810	1602074	1113515	851363	2184685	1120373	0	0	0	0	0	45	11	2018	2	2017-10-11 15:07:15.96964	2018-05-20 15:17:48.133816
680	1	1	2018-11-09	0	423444	632344	924803	1900289	3480874	1266262	1561828	1814702	1647490	1295424	0	0	0	0	0	45	11	2018	3	2017-10-11 15:07:15.985828	2018-05-20 15:17:48.144816
681	1	1	2018-11-10	0	183493	271004	604678	879984	747447	930776	337087	331337	805840	416005	0	0	0	0	0	45	11	2018	4	2017-10-11 15:07:16.002873	2018-05-20 15:17:48.147817
682	1	1	2018-11-11	0	268181	429090	462401	1037659	1182150	550597	322473	448855	866032	356716	0	0	0	0	0	45	11	2018	5	2017-10-11 15:07:16.019918	2018-05-20 15:17:48.158817
684	1	1	2018-11-13	0	282296	903348	1067081	2458931	2386858	1404534	1022753	1649286	1404389	1020577	0	0	0	0	0	45	11	2018	0	2017-10-11 15:07:16.05226	2018-05-20 15:17:48.173818
685	1	1	2018-11-14	0	282296	542009	1422774	692329	3484006	1308650	1008982	1947785	2548888	1247949	0	0	0	0	0	46	11	2018	1	2017-10-11 15:07:16.067779	2018-05-20 15:17:48.179818
686	1	1	2018-11-15	0	536363	767846	1351635	1662494	1259879	902624	778766	1088506	1244273	1245087	0	0	0	0	0	46	11	2018	2	2017-10-11 15:07:16.083215	2018-05-20 15:17:48.185818
687	1	1	2018-11-16	0	395215	451674	1209358	3410066	2779325	1645970	600126	1009771	2219088	744676	0	0	0	0	0	46	11	2018	3	2017-10-11 15:07:16.100166	2018-05-20 15:17:48.191819
688	1	1	2018-11-17	0	183493	451674	497970	1208299	1300384	765736	428023	335820	391684	627418	0	0	0	0	0	46	11	2018	4	2017-10-11 15:07:16.118594	2018-05-20 15:17:48.197819
689	1	1	2018-11-18	0	254067	338756	497970	1344344	941703	666728	544782	496996	781736	532616	0	0	0	0	0	46	11	2018	5	2017-10-11 15:07:16.14413	2018-05-20 15:17:48.203819
690	1	1	2018-11-19	0	254067	767846	640248	2887760	4217848	1285271	492384	1344873	1639803	640400	0	0	0	0	0	46	11	2018	6	2017-10-11 15:07:16.155535	2018-05-20 15:17:48.20882
692	1	1	2018-11-21	0	451674	542009	1067081	1993388	2502555	2126197	984899	2160737	2422682	567124	0	0	0	0	0	47	11	2018	1	2017-10-11 15:07:16.177858	2018-05-20 15:17:48.22082
693	1	1	2018-11-22	0	366985	722678	1422774	1730934	1615173	1041863	1053565	1328278	1159972	914723	0	0	0	0	0	47	11	2018	2	2017-10-11 15:07:16.189562	2018-05-20 15:17:48.22082
694	1	1	2018-11-23	0	479904	542009	995942	1778426	2777803	961747	619916	1259895	1150808	737557	0	0	0	0	0	47	11	2018	3	2017-10-11 15:07:16.201013	2018-05-20 15:17:48.23282
695	1	1	2018-11-24	0	211722	248421	426832	1126994	740811	612461	353749	429267	554620	228058	0	0	0	0	0	47	11	2018	4	2017-10-11 15:07:16.212333	2018-05-20 15:17:48.23982
696	1	1	2018-11-25	0	141148	361339	604678	1448444	806166	610244	230082	430283	479624	475253	0	0	0	0	0	47	11	2018	5	2017-10-11 15:07:16.223584	2018-05-20 15:17:48.24182
697	1	1	2018-11-26	0	536363	813013	1422774	3007649	3068570	888110	1500108	1308523	1579991	675939	0	0	0	0	0	47	11	2018	6	2017-10-11 15:07:16.234839	2018-05-20 15:17:48.24182
698	1	1	2018-11-27	0	423444	677511	1280497	2037606	5046759	703803	641992	828866	1365607	963226	0	0	0	0	0	47	11	2018	0	2017-10-11 15:07:16.246045	2018-05-20 15:17:48.256821
699	1	1	2018-11-28	0	366985	722678	924803	3176435	1705024	1332450	555458	1480450	1952262	583428	0	0	0	0	0	48	11	2018	1	2017-10-11 15:07:16.257402	2018-05-20 15:17:48.262821
704	1	1	2018-12-03	0	423444	508133	853664	1813620	1988481	644428	510576	1023425	589640	516350	0	0	0	0	0	48	12	2018	6	2017-10-11 15:07:16.314609	2018-05-20 15:17:48.268821
705	1	1	2018-12-04	0	275239	609760	907018	2206005	1367912	648421	675818	1289474	868860	355592	0	0	0	0	0	48	12	2018	0	2017-10-11 15:07:16.325752	2018-05-20 15:17:48.273822
706	1	1	2018-12-05	0	762200	1016267	1387204	2901270	4399899	2393822	1201321	2927007	2715109	1722556	0	0	0	0	0	49	12	2018	1	2017-10-11 15:07:16.33686	2018-05-20 15:17:48.280822
707	1	1	2018-12-06	0	635167	745262	1707328	5543705	6616798	1090580	1466711	1650058	2296616	2126256	0	0	0	0	0	49	12	2018	2	2017-10-11 15:07:16.348193	2018-05-20 15:17:48.285822
708	1	1	2018-12-07	0	550478	1355022	1707328	4753770	5924366	1409152	2046628	1904140	2201362	1152548	0	0	0	0	0	49	12	2018	3	2017-10-11 15:07:16.359317	2018-05-20 15:17:48.291823
709	1	1	2018-12-08	0	677511	1084018	960372	1696487	4025614	2476912	1749854	2635175	1034735	1449079	0	0	0	0	0	49	12	2018	4	2017-10-11 15:07:16.370303	2018-05-20 15:17:48.292823
710	1	1	2018-12-09	0	762200	880764	1067080	3056747	1584550	2111078	1010336	1222318	1466686	1060072	0	0	0	0	0	49	12	2018	5	2017-10-11 15:07:16.381588	2018-05-20 15:17:48.303823
711	1	1	2018-12-10	0	232894	677511	533540	1193366	2980819	781208	612638	1497892	470641	752174	0	0	0	0	0	49	12	2018	6	2017-10-11 15:07:16.393313	2018-05-20 15:17:48.309823
712	1	1	2018-12-11	0	402272	575884	1013726	1483920	894964	836267	868252	1316075	946163	460342	0	0	0	0	0	49	12	2018	0	2017-10-11 15:07:16.404679	2018-05-20 15:17:48.315823
713	1	1	2018-12-12	0	508133	948515	2027452	1390176	6942603	2107241	1714240	3248460	2432730	1918797	0	0	0	0	0	50	12	2018	1	2017-10-11 15:07:16.416132	2018-05-20 15:17:48.320824
714	1	1	2018-12-13	0	635167	677511	1387204	2126415	2362687	1991051	1492654	1426986	2887762	1215316	0	0	0	0	0	50	12	2018	2	2017-10-11 15:07:16.427393	2018-05-20 15:17:48.320824
715	1	1	2018-12-14	0	465789	1016267	2027452	2309086	3194820	2630004	1227058	1433705	2710470	1727453	0	0	0	0	0	50	12	2018	3	2017-10-11 15:07:16.438662	2018-05-20 15:17:48.332824
716	1	1	2018-12-15	0	762200	1355022	1387204	2332282	4048439	1193105	1049612	1726478	1854384	2109015	0	0	0	0	0	50	12	2018	4	2017-10-11 15:07:16.450093	2018-05-20 15:17:48.338824
717	1	1	2018-12-16	0	846889	1219520	1493912	2992349	3193371	2378398	1940643	2503256	3345990	2129691	0	0	0	0	0	50	12	2018	5	2017-10-11 15:07:16.461412	2018-05-20 15:17:48.341824
718	1	1	2018-12-17	0	423444	372631	533540	1996176	1355598	1388162	326539	1181126	664006	914482	0	0	0	0	0	50	12	2018	6	2017-10-11 15:07:16.473314	2018-05-20 15:17:48.341824
719	1	1	2018-12-18	0	381100	338756	746956	1427259	3006192	689614	718052	959852	995056	488937	0	0	0	0	0	50	12	2018	0	2017-10-11 15:07:16.484971	2018-05-20 15:17:48.356825
720	1	1	2018-12-19	0	635167	813013	1707328	4097752	5015993	2726759	894039	1798343	2107987	1533090	0	0	0	0	0	51	12	2018	1	2017-10-11 15:07:16.497082	2018-05-20 15:17:48.361825
721	1	1	2018-12-20	0	719855	609760	960372	2355761	3380732	2975916	1327484	1558088	1659815	1787349	0	0	0	0	0	51	12	2018	2	2017-10-11 15:07:16.508636	2018-05-20 15:17:48.369825
722	1	1	2018-12-21	0	762200	880764	1814036	2629876	1908130	1895516	1242617	1406649	1075522	2191780	0	0	0	0	0	51	12	2018	3	2017-10-11 15:07:16.520064	2018-05-20 15:17:48.376826
723	1	1	2018-12-22	0	508133	609760	1493912	1440537	5742153	2956718	853284	1775512	2205045	1850229	0	0	0	0	0	51	12	2018	4	2017-10-11 15:07:16.531659	2018-05-20 15:17:48.382826
725	1	1	2018-12-24	0	190550	338756	800310	2009664	3421553	1251388	958550	841928	1281647	497569	0	0	0	0	0	51	12	2018	6	2017-10-11 15:07:16.554817	2018-05-20 15:17:48.395826
726	1	1	2018-12-25	0	254067	609760	746956	1885967	2385342	857461	993888	926800	1397630	387471	0	0	0	0	0	51	12	2018	0	2017-10-11 15:07:16.566312	2018-05-20 15:17:48.400827
727	1	1	2018-12-26	0	423444	609760	1600620	4248422	1387454	2710005	1233167	1896671	2870189	1438532	0	0	0	0	0	52	12	2018	1	2017-10-11 15:07:16.577733	2018-05-20 15:17:48.403827
728	1	1	2018-12-27	0	846889	1287271	1280496	2182984	1966819	1173842	1551995	2191803	1607223	1107210	0	0	0	0	0	52	12	2018	2	2017-10-11 15:07:16.589737	2018-05-20 15:17:48.403827
729	1	1	2018-12-28	0	508133	813013	1173788	4162973	5100921	2999186	1551445	2002763	1677147	1763509	0	0	0	0	0	52	12	2018	3	2017-10-11 15:07:16.601728	2018-05-20 15:17:48.417827
730	1	1	2018-12-29	0	719855	1355022	1920744	1740253	3302208	1117204	1704002	1207387	1902597	2386397	0	0	0	0	0	52	12	2018	4	2017-10-11 15:07:16.623977	2018-05-20 15:17:48.420827
731	1	1	2018-12-30	0	359928	542009	693602	1579021	2415214	1001110	670985	561286	1352849	580497	0	0	0	0	0	52	12	2018	5	2017-10-11 15:07:16.635416	2018-05-20 15:17:48.420827
1107	2	1	2018-01-08	0	0	0	198450	574260	938343	384872	612152	1813192	2273016	1349750	2245842	1235659	0	0	0	1	1	2018	6	2017-10-12 18:53:41.3904	2018-05-20 15:17:48.441828
1108	2	1	2018-01-09	0	0	0	220500	202076	747020	805783	974490	1078571	949320	1689285	1622083	2072608	0	0	0	1	1	2018	0	2017-10-12 18:53:41.4007	2018-05-20 15:17:48.441828
1109	2	1	2018-01-10	0	0	0	242550	671262	921834	499660	754516	1090029	1278651	2461057	872905	886795	0	0	0	2	1	2018	1	2017-10-12 18:53:41.410969	2018-05-20 15:17:48.455828
1110	2	1	2018-01-11	0	0	0	286650	308051	498969	809614	957715	1064600	1407199	2095846	954806	1224475	0	0	0	2	1	2018	2	2017-10-12 18:53:41.419856	2018-05-20 15:17:48.463829
1111	2	1	2018-01-12	0	0	0	485100	511043	1338764	2456563	1611910	1298363	3448473	3578920	6746166	3809166	0	0	0	2	1	2018	3	2017-10-12 18:53:41.428193	2018-05-20 15:17:48.472829
1112	2	1	2018-01-13	0	0	0	529200	536922	696704	1034122	1005930	2378410	2769623	1611985	2894525	2588189	0	0	0	2	1	2018	4	2017-10-12 18:53:41.436582	2018-05-20 15:17:48.48083
1113	2	1	2018-01-14	0	0	0	198450	501023	1010533	581150	1213601	1056866	1351063	1789553	1617862	1079615	0	0	0	2	1	2018	5	2017-10-12 18:53:41.444769	2018-05-20 15:17:48.48883
1114	2	1	2018-01-15	0	0	0	418950	650426	576917	437670	1053353	1053567	1761182	1444988	931317	1732144	0	0	0	2	1	2018	6	2017-10-12 18:53:41.452903	2018-05-20 15:17:48.497831
1115	2	1	2018-01-16	0	0	0	242550	694460	1031519	1333231	400034	859694	2919926	1588766	2032576	1720118	0	0	0	2	1	2018	0	2017-10-12 18:53:41.462037	2018-05-20 15:17:48.505831
1116	2	1	2018-01-17	0	0	0	374850	418094	534179	987244	1185822	915251	2154089	3468956	2725258	486135	0	0	0	3	1	2018	1	2017-10-12 18:53:41.470888	2018-05-20 15:17:48.513831
1117	2	1	2018-01-18	0	0	0	198450	690375	711040	618496	624199	1057712	1412392	2617931	1708555	1596492	0	0	0	3	1	2018	2	2017-10-12 18:53:41.480456	2018-05-20 15:17:48.522832
1118	2	1	2018-01-19	0	0	0	882000	1694985	2262496	1697753	1956188	3031421	3878288	2215679	5172532	3087699	0	0	0	3	1	2018	3	2017-10-12 18:53:41.489038	2018-05-20 15:17:48.530832
1119	2	1	2018-01-20	0	0	0	458640	1066750	980685	1043708	1161374	1463690	5587619	2315866	3310284	2718224	0	0	0	3	1	2018	4	2017-10-12 18:53:41.49814	2018-05-20 15:17:48.538833
1120	2	1	2018-01-21	0	0	0	352800	402557	506334	1318955	1065771	1116143	1269752	1985103	1603044	1335199	0	0	0	3	1	2018	5	2017-10-12 18:53:41.507061	2018-05-20 15:17:48.547833
1121	2	1	2018-01-22	0	0	0	198450	975403	1004390	415598	1361876	1032425	1851620	2711061	1533476	935173	0	0	0	3	1	2018	6	2017-10-12 18:53:41.516801	2018-05-20 15:17:48.556834
1122	2	1	2018-01-23	0	0	0	418950	977029	583985	651069	1170948	1001650	2124216	1857307	2758511	1624649	0	0	0	3	1	2018	0	2017-10-12 18:53:41.525635	2018-05-20 15:17:48.563834
1123	2	1	2018-01-24	0	0	0	330750	673340	779511	519435	880128	1050819	1897489	1204114	1813351	1267449	0	0	0	4	1	2018	1	2017-10-12 18:53:41.53563	2018-05-20 15:17:48.571835
1124	2	1	2018-01-25	0	0	0	264600	576617	635442	487253	753174	1291694	1373466	3152018	2383689	1216138	0	0	0	4	1	2018	2	2017-10-12 18:53:41.544881	2018-05-20 15:17:48.580835
1125	2	1	2018-01-26	0	0	0	837900	1175076	937604	1320214	1496236	1607988	4732792	5114631	6933607	1979840	0	0	0	4	1	2018	3	2017-10-12 18:53:41.553623	2018-05-20 15:17:48.589836
1126	2	1	2018-01-27	0	0	0	529200	951857	1531811	2244194	1236028	1624362	4005564	2678794	4741513	2017093	0	0	0	4	1	2018	4	2017-10-12 18:53:41.563003	2018-05-20 15:17:48.597836
1127	2	1	2018-01-28	0	0	0	661500	690636	1364648	599899	1117391	1229594	1989162	5756368	2671955	2028635	0	0	0	4	1	2018	5	2017-10-12 18:53:41.572143	2018-05-20 15:17:48.604837
1128	2	1	2018-01-29	0	0	0	496125	1011608	2117325	1179602	627870	1482998	2099042	2206018	2377272	1107538	0	0	0	4	1	2018	6	2017-10-12 18:53:41.581593	2018-05-20 15:17:48.612837
1129	2	1	2018-01-30	0	0	0	363825	702253	1257834	1191614	689182	778931	1594949	2535405	1538298	1622470	0	0	0	4	1	2018	0	2017-10-12 18:53:41.589771	2018-05-20 15:17:48.620838
1130	2	1	2018-01-31	0	0	0	297675	970126	634671	1303128	982400	1277296	2108471	4037648	3655615	1455985	0	0	0	5	2	2018	1	2017-10-12 18:53:41.598638	2018-05-20 15:17:48.784846
1131	2	1	2018-02-01	0	0	0	595350	734184	924540	1064046	1548183	2168642	3133059	2832300	1823366	1135441	0	0	0	5	2	2018	2	2017-10-12 18:53:41.606503	2018-05-20 15:17:48.791847
1132	2	1	2018-02-02	0	0	0	529200	961422	806241	701020	1010464	1178817	2526140	3905604	3165052	1031585	0	0	0	5	2	2018	3	2017-10-12 18:53:41.614767	2018-05-20 15:17:48.796847
1133	2	1	2018-02-03	0	0	0	396900	1841208	1385216	1002617	867327	2039561	3105200	2217454	2117345	1796157	0	0	0	5	2	2018	4	2017-10-12 18:53:41.622796	2018-05-20 15:17:48.804848
1134	2	1	2018-02-04	0	0	0	727650	689482	2438612	1943546	2123774	2393691	8013674	10967894	3051496	3414787	0	0	0	5	2	2018	5	2017-10-12 18:53:41.630978	2018-05-20 15:17:48.810848
1136	2	1	2018-02-06	0	0	0	595350	977567	721808	926022	1475316	1088372	3772890	5122260	1865469	2706490	0	0	0	5	2	2018	0	2017-10-12 18:53:41.647682	2018-05-20 15:17:48.821849
1137	2	1	2018-02-07	0	0	0	463050	927178	577558	530844	1267516	1898237	1728553	2252737	4349422	2205002	0	0	0	6	2	2018	1	2017-10-12 18:53:41.655751	2018-05-20 15:17:48.821849
1138	2	1	2018-02-08	0	0	0	529200	1322661	1088376	1253798	1164358	2453916	2068773	3658284	2455721	2336481	0	0	0	6	2	2018	2	2017-10-12 18:53:41.663816	2018-05-20 15:17:48.835849
1139	2	1	2018-02-09	0	0	0	661500	482811	683023	1554230	1205095	1801204	3490205	3965175	3375542	2193047	0	0	0	6	2	2018	3	2017-10-12 18:53:41.672373	2018-05-20 15:17:48.841849
1140	2	1	2018-02-10	0	0	0	529200	1156664	1377922	1252388	1584871	3179695	3426315	3277140	2036525	2009395	0	0	0	6	2	2018	4	2017-10-12 18:53:41.681131	2018-05-20 15:17:48.847849
1141	2	1	2018-02-11	0	0	0	595350	2132773	4322531	2813723	2082997	2343811	8852342	5021381	7361491	3237971	0	0	0	6	2	2018	5	2017-10-12 18:53:41.689062	2018-05-20 15:17:48.85385
1142	2	1	2018-02-12	0	0	0	582120	2102317	2189823	2099374	1613804	2951606	4608668	8926698	10881635	2901895	0	0	0	6	2	2018	6	2017-10-12 18:53:41.697462	2018-05-20 15:17:48.85985
1144	2	1	2018-02-14	0	0	0	297675	947484	1119065	621150	999330	2321678	1774562	3354409	2093350	1766291	0	0	0	7	2	2018	1	2017-10-12 18:53:41.71341	2018-05-20 15:17:48.870851
1145	2	1	2018-02-15	0	0	0	330750	437930	1279977	1659618	1101708	2185148	2154668	1846757	4019290	1546772	0	0	0	7	2	2018	2	2017-10-12 18:53:41.72129	2018-05-20 15:17:48.876851
1146	2	1	2018-02-16	0	0	0	463050	680099	934297	989809	521655	2186400	1974023	3470544	2075017	2190132	0	0	0	7	2	2018	3	2017-10-12 18:53:41.729131	2018-05-20 15:17:48.881851
1147	2	1	2018-02-17	0	0	0	595350	742199	978382	708840	1130029	1437478	4714229	3805358	2477618	2832444	0	0	0	7	2	2018	4	2017-10-12 18:53:41.736769	2018-05-20 15:17:48.881851
1148	2	1	2018-02-18	0	0	0	727650	2295111	2510204	2766042	1317173	3628537	5047204	4730845	6645170	2653553	0	0	0	7	2	2018	5	2017-10-12 18:53:41.744817	2018-05-20 15:17:48.896852
1149	2	1	2018-02-19	0	0	0	687960	2198121	1609786	3711929	2225740	3191226	3706269	4293914	11723798	3082796	0	0	0	7	2	2018	6	2017-10-12 18:53:41.753125	2018-05-20 15:17:48.903852
1150	2	1	2018-02-20	0	0	0	363825	773168	2104875	1434968	1006088	1620788	3030889	2955953	2464543	1240844	0	0	0	7	2	2018	0	2017-10-12 18:53:41.761263	2018-05-20 15:17:48.911853
1151	2	1	2018-02-21	0	0	0	595350	1230242	693359	1435143	1642972	2264507	2817279	5523612	1649885	1323411	0	0	0	8	2	2018	1	2017-10-12 18:53:41.77011	2018-05-20 15:17:48.917853
1152	2	1	2018-02-22	0	0	0	463050	1531547	1592523	930839	1256648	1986275	1948909	3765499	1702992	2133970	0	0	0	8	2	2018	2	2017-10-12 18:53:41.778167	2018-05-20 15:17:48.917853
1153	2	1	2018-02-23	0	0	0	330750	464335	1679202	1179762	1209886	1543469	1801574	3322598	1764978	1297596	0	0	0	8	2	2018	3	2017-10-12 18:53:41.786103	2018-05-20 15:17:48.929853
1154	2	1	2018-02-24	0	0	0	396900	1576363	1205192	823157	819622	1959206	2905713	4236420	3640392	2865892	0	0	0	8	2	2018	4	2017-10-12 18:53:41.794	2018-05-20 15:17:48.929853
1155	2	1	2018-02-25	0	0	0	1190700	2343544	2420749	2019207	2238374	4776366	4239925	6125032	5061972	5009326	0	0	0	8	2	2018	5	2017-10-12 18:53:41.801911	2018-05-20 15:17:48.939853
1156	2	1	2018-02-26	0	0	0	1058400	1310365	882932	2929160	1199802	4865163	4498645	4515616	4757873	3682319	0	0	0	8	2	2018	6	2017-10-12 18:53:41.81007	2018-05-20 15:17:48.949853
1157	2	1	2018-02-27	0	0	0	595350	888100	1452851	853379	1345682	1512276	1892988	1967616	1493679	1949507	0	0	0	8	2	2018	0	2017-10-12 18:53:41.818258	2018-05-20 15:17:48.955853
1158	2	1	2018-02-28	0	0	0	562275	452501	1079796	1209457	1158949	1361731	2247215	3176326	3109048	1107590	0	0	0	9	2	2018	1	2017-10-12 18:53:41.826626	2018-05-20 15:17:48.961854
1159	2	1	2018-03-01	0	0	0	463050	1003661	1147306	1259777	650550	1095324	2927188	3110694	1530463	2209542	0	0	0	9	3	2018	2	2017-10-12 18:53:41.834598	2018-05-20 15:17:48.967854
1160	2	1	2018-03-02	0	254067	858181	640248	1752519	1348459	1945982	698808	1047425	1380379	1470670	0	0	0	0	0	9	3	2018	3	2017-10-12 18:53:41.842661	2018-05-20 15:17:48.973854
1161	2	1	2018-03-03	0	508133	903348	1280497	2808244	2072094	1939072	392347	1650413	1622498	740364	0	0	0	0	0	9	3	2018	4	2017-10-12 18:53:41.850657	2018-05-20 15:17:48.980855
1162	2	1	2018-03-04	0	310526	451674	782526	1455197	3413411	1035607	909478	1881906	1931853	1197225	0	0	0	0	0	9	3	2018	5	2017-10-12 18:53:41.859999	2018-05-20 15:17:48.986855
1163	2	1	2018-03-05	0	479904	496841	1138219	1219434	3794664	716453	1201680	1456209	2319207	1198852	0	0	0	0	0	9	3	2018	6	2017-10-12 18:53:41.869026	2018-05-20 15:17:48.991855
1164	2	1	2018-03-06	0	268181	203253	320124	1220663	909983	602899	533795	413470	894200	531549	0	0	0	0	0	9	3	2018	0	2017-10-12 18:53:41.877967	2018-05-20 15:17:48.997856
1165	2	1	2018-03-07	0	141148	316172	497970	665924	1941546	900152	441634	387892	754616	485782	0	0	0	0	0	10	3	2018	1	2017-10-12 18:53:41.886861	2018-05-20 15:17:49.003856
1166	2	1	2018-03-08	0	310526	722678	782526	2920254	3615381	788137	610224	840977	2359107	1101546	0	0	0	0	0	10	3	2018	2	2017-10-12 18:53:41.897193	2018-05-20 15:17:49.008856
1167	2	1	2018-03-09	0	338756	406507	1351635	1501367	3308611	1419904	720001	1063412	1773161	1656758	0	0	0	0	0	10	3	2018	3	2017-10-12 18:53:41.90791	2018-05-20 15:17:49.014857
1168	2	1	2018-03-10	0	254067	542009	1422774	1498345	3160341	1599309	807301	1831374	1479229	1531757	0	0	0	0	0	10	3	2018	4	2017-10-12 18:53:41.916992	2018-05-20 15:17:49.020857
1169	2	1	2018-03-11	0	536363	542009	1351635	1121922	2753810	1513070	655009	709469	1577828	724947	0	0	0	0	0	10	3	2018	5	2017-10-12 18:53:41.926046	2018-05-20 15:17:49.020857
1170	2	1	2018-03-12	0	564593	858181	1280497	2764056	1842816	819346	1327554	907351	1213940	749982	0	0	0	0	0	10	3	2018	6	2017-10-12 18:53:41.934501	2018-05-20 15:17:49.031857
1171	2	1	2018-03-13	0	169378	225837	533540	1955520	647787	440894	459665	515413	554015	416005	0	0	0	0	0	10	3	2018	0	2017-10-12 18:53:41.943601	2018-05-20 15:17:49.032857
1173	2	1	2018-03-15	0	338756	406507	640248	2055295	1303155	1375395	756364	962702	2448211	702538	0	0	0	0	0	11	3	2018	2	2017-10-12 18:53:41.959897	2018-05-20 15:17:49.049858
1174	2	1	2018-03-16	0	536363	722678	1209358	2648079	1544437	1296493	886386	907107	1404389	1133974	0	0	0	0	0	11	3	2018	3	2017-10-12 18:53:41.967696	2018-05-20 15:17:49.054858
1175	2	1	2018-03-17	0	366985	542009	640248	1461583	2961405	1063278	652871	1947785	1743976	722497	0	0	0	0	0	11	3	2018	4	2017-10-12 18:53:41.978455	2018-05-20 15:17:49.060858
1176	2	1	2018-03-18	0	564593	542009	711387	914372	1841362	1103208	1168149	1850460	1722839	996070	0	0	0	0	0	11	3	2018	5	2017-10-12 18:53:41.989997	2018-05-20 15:17:49.063858
1177	2	1	2018-03-19	0	508133	722678	711387	3610658	2125366	1212820	646289	757328	2088554	1241126	0	0	0	0	0	11	3	2018	6	2017-10-12 18:53:42.000283	2018-05-20 15:17:49.063858
1178	2	1	2018-03-20	0	239952	271004	640247	981743	2340691	536015	352489	335820	430852	627418	0	0	0	0	0	11	3	2018	0	2017-10-12 18:53:42.009639	2018-05-20 15:17:49.078859
1179	2	1	2018-03-21	0	141148	383923	426832	1757989	1052492	974449	544782	944292	868596	364421	0	0	0	0	0	12	3	2018	1	2017-10-12 18:53:42.017787	2018-05-20 15:17:49.084859
1181	2	1	2018-03-23	0	479904	406507	1422774	1573100	1684855	1818009	975667	1212460	1470130	951597	0	0	0	0	0	12	3	2018	3	2017-10-12 18:53:42.034591	2018-05-20 15:17:49.096859
1182	2	1	2018-03-24	0	479904	587176	711387	1439669	3185070	1342861	800231	1819568	1657625	693152	0	0	0	0	0	12	3	2018	4	2017-10-12 18:53:42.042884	2018-05-20 15:17:49.10286
1183	2	1	2018-03-25	0	310526	632344	640248	2307912	1076782	1041863	720860	737932	1159972	1055450	0	0	0	0	0	12	3	2018	5	2017-10-12 18:53:42.05119	2018-05-20 15:17:49.10786
1184	2	1	2018-03-26	0	479904	632344	711387	2815842	3174632	961747	563560	923923	1790146	871658	0	0	0	0	0	12	3	2018	6	2017-10-12 18:53:42.05988	2018-05-20 15:17:49.11386
1185	2	1	2018-03-27	0	282296	338756	462401	939162	952472	918691	565998	627390	504200	209053	0	0	0	0	0	12	3	2018	0	2017-10-12 18:53:42.068116	2018-05-20 15:17:49.119861
1186	2	1	2018-03-28	0	254067	248421	640247	1062192	1048016	650926	391139	330987	366772	225120	0	0	0	0	0	13	3	2018	1	2017-10-12 18:53:42.076356	2018-05-20 15:17:49.124861
1187	2	1	2018-03-29	0	338756	903348	640248	2691054	2898094	814101	750054	841193	1667769	727934	0	0	0	0	0	13	3	2018	2	2017-10-12 18:53:42.084732	2018-05-20 15:17:49.130861
1188	2	1	2018-03-30	0	395215	496841	782526	1528205	3084131	1407606	641992	994639	1489753	760442	0	0	0	0	0	13	3	2018	3	2017-10-12 18:53:42.093267	2018-05-20 15:17:49.131861
1189	2	1	2018-03-31	0	310526	406507	1067081	2541148	2216531	1489209	987480	1132109	1659423	742545	0	0	0	0	0	13	3	2018	4	2017-10-12 18:53:42.102631	2018-05-20 15:17:49.142861
1190	2	1	2018-04-01	0	508133	745262	1600620	1632514	5944821	1618028	842916	1869824	3200995	1922198	0	0	0	0	0	13	4	2018	5	2017-10-12 18:53:42.11189	2018-05-20 15:17:49.148862
1191	2	1	2018-04-02	0	592822	609760	1173788	1953658	5555886	1980570	1502975	1538242	3341059	1754418	0	0	0	0	0	13	4	2018	6	2017-10-12 18:53:42.123761	2018-05-20 15:17:49.153862
1192	2	1	2018-04-03	0	846889	609760	1280496	2446918	4094357	2506184	2079619	2318220	1463059	1532508	0	0	0	0	0	13	4	2018	0	2017-10-12 18:53:42.134009	2018-05-20 15:17:49.159862
1193	2	1	2018-04-04	0	635167	880764	1920744	2381812	3050585	2250650	915335	1483503	1272616	2198795	0	0	0	0	0	14	4	2018	1	2017-10-12 18:53:42.143092	2018-05-20 15:17:49.166863
1194	2	1	2018-04-05	0	232894	406507	960372	1049991	1376641	1113104	742656	938139	825496	545036	0	0	0	0	0	14	4	2018	2	2017-10-12 18:53:42.151903	2018-05-20 15:17:49.173863
1195	2	1	2018-04-06	0	381100	338756	693602	2993864	2165861	756491	437294	1517028	1179167	517224	0	0	0	0	0	14	4	2018	3	2017-10-12 18:53:42.160527	2018-05-20 15:17:49.173863
1196	2	1	2018-04-07	0	677511	1219520	1280496	2137778	4917534	2260832	2002202	1848636	3550527	1855060	0	0	0	0	0	14	4	2018	4	2017-10-12 18:53:42.168715	2018-05-20 15:17:49.183863
1197	2	1	2018-04-08	0	550478	1287271	960372	5543705	5223788	999699	1389515	2030840	1377970	2126256	0	0	0	0	0	14	4	2018	5	2017-10-12 18:53:42.17776	2018-05-20 15:17:49.195863
1198	2	1	2018-04-09	0	423444	677511	1173788	2852262	5227382	2348586	1534971	1904140	2568255	1248594	0	0	0	0	0	14	4	2018	6	2017-10-12 18:53:42.186316	2018-05-20 15:17:49.201864
1199	2	1	2018-04-10	0	677511	609760	1173788	2544731	3220491	1733838	1847068	2773868	1724558	1449079	0	0	0	0	0	14	4	2018	0	2017-10-12 18:53:42.198252	2018-05-20 15:17:49.208864
1200	2	1	2018-04-11	0	508133	745262	2134160	4839849	1584550	2111078	1262920	2200172	2266697	2237930	0	0	0	0	0	15	4	2018	1	2017-10-12 18:53:42.210121	2018-05-20 15:17:49.214864
1201	2	1	2018-04-12	0	190550	677511	480186	1272923	2980819	459534	612638	1248243	812925	752174	0	0	0	0	0	15	4	2018	2	2017-10-12 18:53:42.21983	2018-05-20 15:17:49.220865
1202	2	1	2018-04-13	0	423444	372631	960372	1112940	894964	1064340	627071	950499	1005298	566574	0	0	0	0	0	15	4	2018	3	2017-10-12 18:53:42.228361	2018-05-20 15:17:49.226865
1203	2	1	2018-04-14	0	550478	1016267	2027452	2224282	6125826	1219981	2204023	1461807	3243640	1678947	0	0	0	0	0	15	4	2018	4	2017-10-12 18:53:42.236197	2018-05-20 15:17:49.232865
1204	2	1	2018-04-15	0	508133	609760	960372	4016561	2126418	3152497	1575579	1528914	2598986	1767733	0	0	0	0	0	15	4	2018	5	2017-10-12 18:53:42.243913	2018-05-20 15:17:49.238866
1205	2	1	2018-04-16	0	804544	1219520	1600620	3298694	1757151	2784710	1227058	2150558	3335963	1535514	0	0	0	0	0	15	4	2018	6	2017-10-12 18:53:42.25177	2018-05-20 15:17:49.244866
1206	2	1	2018-04-17	0	762200	1287271	2027452	2040746	3711069	1491381	1399482	2031150	2008916	1984955	0	0	0	0	0	15	4	2018	0	2017-10-12 18:53:42.259544	2018-05-20 15:17:49.249866
1207	2	1	2018-04-18	0	465789	880764	1173788	5984698	7096380	1321332	1509389	2145648	3136866	2241780	0	0	0	0	0	16	4	2018	1	2017-10-12 18:53:42.267511	2018-05-20 15:17:49.255867
1208	2	1	2018-04-19	0	359928	474258	907018	1796558	1204976	763489	391847	932468	456504	685862	0	0	0	0	0	16	4	2018	2	2017-10-12 18:53:42.275643	2018-05-20 15:17:49.261867
1210	2	1	2018-04-21	0	550478	609760	1600620	4353862	6449134	3207952	731487	1798343	2634984	1533090	0	0	0	0	0	16	4	2018	4	2017-10-12 18:53:42.291759	2018-05-20 15:17:49.273868
1211	2	1	2018-04-22	0	465789	880764	1173788	1611836	1521329	2231937	1043023	876425	1438506	1787349	0	0	0	0	0	16	4	2018	5	2017-10-12 18:53:42.299977	2018-05-20 15:17:49.274868
1212	2	1	2018-04-23	0	508133	745262	1814036	4675334	3053008	3001234	1139065	1790281	1792536	1315068	0	0	0	0	0	16	4	2018	6	2017-10-12 18:53:42.30817	2018-05-20 15:17:49.285868
1213	2	1	2018-04-24	0	381100	948515	1707328	1440537	3828102	1971145	1194598	2905384	2618491	1850229	0	0	0	0	0	16	4	2018	0	2017-10-12 18:53:42.318913	2018-05-20 15:17:49.290868
1214	2	1	2018-04-25	0	550478	1219520	1280496	2689482	2594592	2234408	1434949	1475695	3382395	1325776	0	0	0	0	0	17	4	2018	1	2017-10-12 18:53:42.32978	2018-05-20 15:17:49.297868
1215	2	1	2018-04-26	0	423444	542009	960372	2009664	2415214	813402	623058	748381	1424052	663426	0	0	0	0	0	17	4	2018	2	2017-10-12 18:53:42.338801	2018-05-20 15:17:49.303869
1216	2	1	2018-04-27	0	190550	677511	1067080	1091875	1789007	771715	552160	1235733	1397630	634043	0	0	0	0	0	17	4	2018	3	2017-10-12 18:53:42.349091	2018-05-20 15:17:49.309869
1218	2	1	2018-04-29	0	465789	1016267	2027452	1559274	3278032	1600694	1357996	2191803	1928668	1107210	0	0	0	0	0	17	4	2018	5	2017-10-12 18:53:42.369113	2018-05-20 15:17:49.32187
1219	2	1	2018-04-30	0	592822	745262	1173788	4423159	4708542	3157038	1034297	2238382	1229908	1432851	0	0	0	0	0	17	4	2018	6	2017-10-12 18:53:42.377967	2018-05-20 15:17:49.32687
1220	2	1	2018-05-01	0	0	0	330750	524987	1101468	830340	448853	1563033	1596256	1851671	1639494	1149589	0	0	0	17	5	2018	0	2017-10-12 18:53:42.3867	2018-05-20 15:17:49.33287
1221	2	1	2018-05-02	0	0	0	308700	373366	1185741	568333	958532	1465644	1281005	1789407	1100372	554691	0	0	0	18	5	2018	1	2017-10-12 18:53:42.395218	2018-05-20 15:17:49.338871
1222	2	1	2018-05-03	0	0	0	308700	354181	750209	1242387	475322	1296528	2509875	2110115	2339186	1469598	0	0	0	18	5	2018	2	2017-10-12 18:53:42.404699	2018-05-20 15:17:49.345871
1223	2	1	2018-05-04	0	0	0	418950	513391	1138589	461902	736008	1354867	2742285	1622970	1377332	2026518	0	0	0	18	5	2018	3	2017-10-12 18:53:42.413669	2018-05-20 15:17:49.351872
1224	2	1	2018-05-05	0	0	0	242550	844674	565533	472230	967424	1092617	1717999	2599586	1677250	847066	0	0	0	18	5	2018	4	2017-10-12 18:53:42.422894	2018-05-20 15:17:49.356872
1225	2	1	2018-05-06	0	0	0	529200	915670	2729038	1754904	1937040	3719444	3523450	4500734	7022530	3042904	0	0	0	18	5	2018	5	2017-10-12 18:53:42.430913	2018-05-20 15:17:49.362872
1226	2	1	2018-05-07	0	0	0	388080	942992	1474396	1689178	2359578	1686555	3339329	3291938	3388633	1715833	0	0	0	18	5	2018	6	2017-10-12 18:53:42.439375	2018-05-20 15:17:49.368873
1227	2	1	2018-05-08	0	0	0	330750	555610	1218040	950744	1060933	1254897	1716494	2502981	2342092	1647592	0	0	0	18	5	2018	0	2017-10-12 18:53:42.448398	2018-05-20 15:17:49.374873
1228	2	1	2018-05-09	0	0	0	264600	497692	1194255	692770	612152	1510994	2273016	2099611	2364044	1029716	0	0	0	19	5	2018	1	2017-10-12 18:53:42.457526	2018-05-20 15:17:49.379873
1229	2	1	2018-05-10	0	0	0	308700	246982	373510	1098795	852678	693367	1044252	1930611	1802314	1347195	0	0	0	19	5	2018	2	2017-10-12 18:53:42.467057	2018-05-20 15:17:49.385874
1230	2	1	2018-05-11	0	0	0	396900	797124	850924	499660	710133	1387309	2557302	2988427	1190325	831371	0	0	0	19	5	2018	3	2017-10-12 18:53:42.475662	2018-05-20 15:17:49.391874
1231	2	1	2018-05-12	0	0	0	242550	410735	652497	1251222	845043	851680	1524466	1323692	1432209	1574325	0	0	0	19	5	2018	4	2017-10-12 18:53:42.484651	2018-05-20 15:17:49.397874
1232	2	1	2018-05-13	0	0	0	617400	1078869	2380026	2456563	1611910	1947545	2298982	3028317	4497444	3333021	0	0	0	19	5	2018	5	2017-10-12 18:53:42.493101	2018-05-20 15:17:49.403875
1233	2	1	2018-05-14	0	0	0	529200	465332	760040	1838438	905337	2140569	3621814	2149313	2605073	2243097	0	0	0	19	5	2018	6	2017-10-12 18:53:42.502749	2018-05-20 15:17:49.405875
1234	2	1	2018-05-15	0	0	0	220500	668030	617548	774866	809068	1056866	1351063	2477842	2115665	1223563	0	0	0	19	5	2018	0	2017-10-12 18:53:42.513434	2018-05-20 15:17:49.415875
1235	2	1	2018-05-16	0	0	0	330750	609774	839152	729450	877794	585315	2574035	1961055	1693304	917017	0	0	0	20	5	2018	1	2017-10-12 18:53:42.523011	2018-05-20 15:17:49.420875
1236	2	1	2018-05-17	0	0	0	198450	475157	1190214	1036958	690967	1117602	1751956	2444256	1913013	1032071	0	0	0	20	5	2018	2	2017-10-12 18:53:42.531443	2018-05-20 15:17:49.426875
1237	2	1	2018-05-18	0	0	0	198450	450255	408490	740433	790548	793217	2027378	2254821	2316469	972270	0	0	0	20	5	2018	3	2017-10-12 18:53:42.540263	2018-05-20 15:17:49.432876
1238	2	1	2018-05-19	0	0	0	374850	796587	812618	1051443	510709	916683	1647790	2763371	1803474	878071	0	0	0	20	5	2018	4	2017-10-12 18:53:42.550415	2018-05-20 15:17:49.438876
1239	2	1	2018-05-20	0	0	0	749700	1129990	1131248	1509114	1537005	3789276	2714802	3692799	3735718	2315774	0	0	0	20	5	2018	5	2017-10-12 18:53:42.559626	2018-05-20 15:17:49.444876
1240	2	1	2018-05-21	0	0	0	599760	711167	708273	1204278	1974336	1585665	3234937	4631732	4814958	2145966	0	0	0	20	5	2018	6	2017-10-12 18:53:42.568515	2018-05-20 15:17:49.446876
1241	2	1	2018-05-22	0	0	0	242550	536742	411397	1172405	564232	1195868	2308640	1213119	2671740	1027076	0	0	0	20	5	2018	0	2017-10-12 18:53:42.577022	2018-05-20 15:17:49.446876
1242	2	1	2018-05-23	0	0	0	441000	770055	736552	415598	885219	1877136	2380655	1626637	1226780	1269164	0	0	0	21	5	2018	1	2017-10-12 18:53:42.586942	2018-05-20 15:17:49.461877
1243	2	1	2018-05-24	0	0	0	308700	1085588	583985	846390	1170948	1463950	2006204	1238204	2903696	1433514	0	0	0	21	5	2018	2	2017-10-12 18:53:42.600082	2018-05-20 15:17:49.467877
1244	2	1	2018-05-25	0	0	0	396900	734552	779511	1096585	821453	910710	2627293	2167405	1534374	1267449	0	0	0	21	5	2018	3	2017-10-12 18:53:42.612974	2018-05-20 15:17:49.467877
1245	2	1	2018-05-26	0	0	0	242550	629036	516296	535978	338928	1092972	1785506	1824853	2383689	760086	0	0	0	21	5	2018	4	2017-10-12 18:53:42.624826	2018-05-20 15:17:49.481877
1247	2	1	2018-05-28	0	0	0	635040	951857	2757260	2508217	1797859	3248724	5546165	3296978	2510213	2017093	0	0	0	21	5	2018	6	2017-10-12 18:53:42.64888	2018-05-20 15:17:49.488878
1248	2	1	2018-05-29	0	0	0	396900	759700	1516276	1199797	968405	1788501	2784827	3741639	3435370	2318440	0	0	0	21	5	2018	0	2017-10-12 18:53:42.660245	2018-05-20 15:17:49.498878
1249	2	1	2018-05-30	0	0	0	297675	944167	1494582	884701	1130166	1140768	2099042	1527243	2377272	996784	0	0	0	22	5	2018	1	2017-10-12 18:53:42.671651	2018-05-20 15:17:49.504878
1250	2	1	2018-05-31	0	0	0	297675	495708	595816	1415042	1454940	1644410	2899908	1521243	3076596	2028088	0	0	0	22	5	2018	2	2017-10-12 18:53:42.682812	2018-05-20 15:17:49.510878
1251	2	1	2018-06-01	0	0	0	595350	754543	1153948	955627	1277120	1179042	2108471	1816942	2030897	1199047	0	0	0	22	6	2018	3	2017-10-12 18:53:42.694477	2018-05-20 15:17:49.515879
1252	2	1	2018-06-02	0	0	0	463050	978912	875880	1276855	1548183	1275672	1762346	2360250	2431155	946201	0	0	0	22	6	2018	4	2017-10-12 18:53:42.706712	2018-05-20 15:17:49.521879
1253	2	1	2018-06-03	0	0	0	463050	1098768	1465892	876275	1837208	1833716	3031367	5300462	2813379	1490067	0	0	0	22	6	2018	5	2017-10-12 18:53:42.718454	2018-05-20 15:17:49.527879
1255	2	1	2018-06-05	0	0	0	1124550	1034223	1950890	1943546	2760906	2872429	7212307	4935552	5085827	2086814	0	0	0	22	6	2018	0	2017-10-12 18:53:42.741799	2018-05-20 15:17:49.52988
1256	2	1	2018-06-06	0	0	0	899640	1217511	2568825	2056154	2763367	1947070	2737497	7795046	7036691	3235642	0	0	0	23	6	2018	1	2017-10-12 18:53:42.753903	2018-05-20 15:17:49.54488
1257	2	1	2018-06-07	0	0	0	628425	628436	433085	520888	781050	1451163	3772890	4610034	2425110	2029868	0	0	0	23	6	2018	2	2017-10-12 18:53:42.764335	2018-05-20 15:17:49.55088
1258	2	1	2018-06-08	0	0	0	363825	1545296	577558	530844	697134	2151335	1728553	3253953	3044595	1347501	0	0	0	23	6	2018	3	2017-10-12 18:53:42.772562	2018-05-20 15:17:49.556881
1259	2	1	2018-06-09	0	0	0	297675	1410838	1187320	1832474	640397	2742612	2344609	2613060	2022359	2959543	0	0	0	23	6	2018	4	2017-10-12 18:53:42.780813	2018-05-20 15:17:49.562881
1260	2	1	2018-06-10	0	0	0	429975	413838	512267	1381538	1390494	1601070	1653255	3681948	2194102	2193047	0	0	0	23	6	2018	5	2017-10-12 18:53:42.788941	2018-05-20 15:17:49.568881
1261	2	1	2018-06-11	0	0	0	661500	1040998	1291802	1148023	1678099	1943147	3162752	2184760	1666247	2583508	0	0	0	23	6	2018	6	2017-10-12 18:53:42.797688	2018-05-20 15:17:49.570881
1262	2	1	2018-06-12	0	0	0	727650	2665966	2431424	3001304	2343371	2130737	4426171	5439829	3487022	5756394	0	0	0	23	6	2018	0	2017-10-12 18:53:42.806902	2018-05-20 15:17:49.582881
1263	2	1	2018-06-13	0	0	0	952560	1501655	2863614	1799464	1793116	1708825	3621097	7517219	9672565	2694617	0	0	0	24	6	2018	1	2017-10-12 18:53:42.816155	2018-05-20 15:17:49.588882
1264	2	1	2018-06-14	0	0	0	496125	529709	1535894	1864681	1983727	1590750	3540964	2087444	1185907	890217	0	0	0	24	6	2018	2	2017-10-12 18:53:42.855915	2018-05-20 15:17:49.591882
1265	2	1	2018-06-15	0	0	0	429975	1800220	946901	931725	642426	2176574	2129474	1973182	3425481	1530785	0	0	0	24	6	2018	3	2017-10-12 18:53:42.864858	2018-05-20 15:17:49.602882
1266	2	1	2018-06-16	0	0	0	429975	744481	1109313	2102183	1040502	1542457	1134036	2154550	3215432	1828003	0	0	0	24	6	2018	4	2017-10-12 18:53:42.872754	2018-05-20 15:17:49.608882
1267	2	1	2018-06-17	0	0	0	529200	837045	1104169	1187771	1043311	1495958	1277309	2255854	3919476	1423586	0	0	0	24	6	2018	5	2017-10-12 18:53:42.880656	2018-05-20 15:17:49.615883
1268	2	1	2018-06-18	0	0	0	429975	643239	1565411	708840	1335489	2731208	4962346	3357669	3153332	1888296	0	0	0	24	6	2018	6	2017-10-12 18:53:42.888803	2018-05-20 15:17:49.621883
1269	2	1	2018-06-19	0	0	0	595350	1683081	2510204	2593164	2487993	5607739	6882551	6307793	5168465	4245685	0	0	0	24	6	2018	0	2017-10-12 18:53:42.896956	2018-05-20 15:17:49.623883
1270	2	1	2018-06-20	0	0	0	635040	1966740	2414679	3907294	3179628	2735336	3706269	9064929	5553378	3288315	0	0	0	25	6	2018	1	2017-10-12 18:53:42.905506	2018-05-20 15:17:49.638884
1271	2	1	2018-06-21	0	0	0	297675	1095322	2215658	1537466	773914	1496112	1782876	2463294	1895802	1418107	0	0	0	25	6	2018	2	2017-10-12 18:53:42.914969	2018-05-20 15:17:49.647884
1272	2	1	2018-06-22	0	0	0	396900	1153352	600911	1127612	1642972	1598476	3033993	4360746	2309839	1588093	0	0	0	25	6	2018	3	2017-10-12 18:53:42.923119	2018-05-20 15:17:49.655885
1273	2	1	2018-06-23	0	0	0	396900	1081092	1692056	1137692	1166888	1489706	2815090	4706874	1459708	1600478	0	0	0	25	6	2018	4	2017-10-12 18:53:42.932134	2018-05-20 15:17:49.664885
1274	2	1	2018-06-24	0	0	0	463050	742936	1679202	1474702	1008238	857483	2281993	3737923	1444073	1427356	0	0	0	25	6	2018	5	2017-10-12 18:53:42.940112	2018-05-20 15:17:49.664885
1275	2	1	2018-06-25	0	0	0	330750	1576363	1004327	529172	819622	2612275	2051092	2753673	4160448	1432946	0	0	0	25	6	2018	6	2017-10-12 18:53:42.949135	2018-05-20 15:17:49.677885
1276	2	1	2018-06-26	0	0	0	992250	1850166	2017291	2386336	2238374	3343456	7631865	4375023	10123944	5009326	0	0	0	25	6	2018	0	2017-10-12 18:53:42.95864	2018-05-20 15:17:49.684886
1277	2	1	2018-06-27	0	0	0	899640	1379332	1059518	2756856	1866358	3840918	5190744	7676547	10044399	4332140	0	0	0	26	6	2018	1	2017-10-12 18:53:42.96698	2018-05-20 15:17:49.685886
1278	2	1	2018-06-28	0	0	0	661500	888100	1971727	1706758	1704530	1861262	1703689	3027102	2308413	2315040	0	0	0	26	6	2018	2	2017-10-12 18:53:42.975289	2018-05-20 15:17:49.696886
1279	2	1	2018-06-29	0	0	0	595350	854724	1079796	1007881	1097951	1114143	2059947	3403206	3497679	1476786	0	0	0	26	6	2018	3	2017-10-12 18:53:42.983247	2018-05-20 15:17:49.702886
1280	2	1	2018-06-30	0	0	0	595350	1080866	905768	1841212	650550	1692773	1386563	3732833	1275386	1046625	0	0	0	26	6	2018	4	2017-10-12 18:53:42.990948	2018-05-20 15:17:49.708886
1281	2	1	2018-07-01	0	423444	903348	1422774	2804030	2247432	1945982	742484	1047425	955647	661802	0	0	0	0	0	26	7	2018	5	2017-10-12 18:53:42.999406	2018-05-20 15:17:49.714887
1282	2	1	2018-07-02	0	508133	677511	1067081	1625825	1695350	1400441	479535	1430358	1506605	911218	0	0	0	0	0	26	7	2018	6	2017-10-12 18:53:43.008261	2018-05-20 15:17:49.721887
1284	2	1	2018-07-04	0	310526	722678	924803	914575	4806574	931389	1134920	1941612	2197143	1844388	0	0	0	0	0	27	7	2018	1	2017-10-12 18:53:43.024581	2018-05-20 15:17:49.733888
1285	2	1	2018-07-05	0	127033	293588	426832	646233	1323611	569405	427036	597234	645811	324836	0	0	0	0	0	27	7	2018	2	2017-10-12 18:53:43.032514	2018-05-20 15:17:49.739888
1286	2	1	2018-07-06	0	268181	429090	711386	591933	2426932	794252	255683	387892	955846	571508	0	0	0	0	0	27	7	2018	3	2017-10-12 18:53:43.040693	2018-05-20 15:17:49.740888
1287	2	1	2018-07-07	0	564593	813013	711387	2920254	4390106	909389	776649	780907	2359107	979152	0	0	0	0	0	27	7	2018	4	2017-10-12 18:53:43.051487	2018-05-20 15:17:49.751888
1288	2	1	2018-07-08	0	395215	632344	782526	1351230	3113987	1825591	780001	736208	1300318	828379	0	0	0	0	0	27	7	2018	5	2017-10-12 18:53:43.060913	2018-05-20 15:17:49.756889
1289	2	1	2018-07-09	0	282296	406507	782526	2497242	1931320	1505232	552364	2060296	821794	1106269	0	0	0	0	0	27	7	2018	6	2017-10-12 18:53:43.069156	2018-05-20 15:17:49.762889
1290	2	1	2018-07-10	0	310526	632344	711387	1234114	1457899	1157053	1113515	780416	1820571	1120373	0	0	0	0	0	27	7	2018	0	2017-10-12 18:53:43.077166	2018-05-20 15:17:49.790891
1292	2	1	2018-07-12	0	225837	271004	391262	1271088	896936	930776	337087	331337	654745	448006	0	0	0	0	0	28	7	2018	2	2017-10-12 18:53:43.094926	2018-05-20 15:17:49.930897
1293	2	1	2018-07-13	0	169378	383923	462401	648537	591075	579576	451462	448855	721694	209833	0	0	0	0	0	28	7	2018	3	2017-10-12 18:53:43.103301	2018-05-20 15:17:49.942897
1294	2	1	2018-07-14	0	564593	813013	853664	2877413	1403398	1375395	889840	2032371	1803945	702538	0	0	0	0	0	28	7	2018	4	2017-10-12 18:53:43.112007	2018-05-20 15:17:49.942897
1295	2	1	2018-07-15	0	366985	722678	1209358	3026376	2246454	1836699	613652	742179	886982	1077275	0	0	0	0	0	28	7	2018	5	2017-10-12 18:53:43.120025	2018-05-20 15:17:49.958897
1296	2	1	2018-07-16	0	451674	406507	1209358	692329	2090404	1226859	890279	1947785	2548888	788178	0	0	0	0	0	28	7	2018	6	2017-10-12 18:53:43.128176	2018-05-20 15:17:49.967898
1297	2	1	2018-07-17	0	366985	451674	1138219	831247	1841362	1604666	1323902	1197357	1435700	1245087	0	0	0	0	0	28	7	2018	0	2017-10-12 18:53:43.136572	2018-05-20 15:17:49.976898
1298	2	1	2018-07-18	0	338756	406507	853664	2407105	1471407	779670	830943	1093919	1827484	744676	0	0	0	0	0	29	7	2018	1	2017-10-12 18:53:43.145612	2018-05-20 15:17:49.984899
1299	2	1	2018-07-19	0	282296	316172	320124	1057262	2470730	574302	478378	671639	744200	627418	0	0	0	0	0	29	7	2018	2	2017-10-12 18:53:43.153845	2018-05-20 15:17:49.991899
1300	2	1	2018-07-20	0	225837	248421	604678	1344344	1052492	564155	442636	993992	434298	532616	0	0	0	0	0	29	7	2018	3	2017-10-12 18:53:43.16211	2018-05-20 15:17:49.9999
1301	2	1	2018-07-21	0	282296	813013	1138219	3850346	3954233	680438	760957	1434531	868131	533667	0	0	0	0	0	29	7	2018	4	2017-10-12 18:53:43.17043	2018-05-20 15:17:50.0069
1302	2	1	2018-07-22	0	564593	406507	711387	925353	1783964	956847	487833	779439	1470130	727692	0	0	0	0	0	29	7	2018	5	2017-10-12 18:53:43.178721	2018-05-20 15:17:50.0129
1303	2	1	2018-07-23	0	254067	451674	640248	2104132	2502555	1454766	615562	1250953	2040154	819179	0	0	0	0	0	29	7	2018	6	2017-10-12 18:53:43.187505	2018-05-20 15:17:50.013901
1304	2	1	2018-07-24	0	564593	587176	1351635	2307912	1292138	818607	499057	1402071	1353300	633270	0	0	0	0	0	29	7	2018	0	2017-10-12 18:53:43.196792	2018-05-20 15:17:50.024901
1305	2	1	2018-07-25	0	508133	903348	1138219	2519437	3571461	618266	563560	839930	2429484	737557	0	0	0	0	0	30	7	2018	1	2017-10-12 18:53:43.20502	2018-05-20 15:17:50.084904
1306	2	1	2018-07-26	0	239952	293588	355693	1596575	634981	663499	495249	594369	1008400	323082	0	0	0	0	0	30	7	2018	2	2017-10-12 18:53:43.213195	2018-05-20 15:17:50.161906
1307	2	1	2018-07-27	0	141148	361339	497970	1738132	1048016	610244	322115	430283	310345	275146	0	0	0	0	0	30	7	2018	3	2017-10-12 18:53:43.221478	2018-05-20 15:17:50.195908
1308	2	1	2018-07-28	0	423444	767846	924803	2532757	1704761	1184147	1125081	1588920	1228882	1039906	0	0	0	0	0	30	7	2018	4	2017-10-12 18:53:43.229962	2018-05-20 15:17:50.236909
1309	2	1	2018-07-29	0	423444	903348	640248	916923	2803755	914944	700355	1160412	2482922	861834	0	0	0	0	0	30	7	2018	5	2017-10-12 18:53:43.238238	2018-05-20 15:17:50.284911
1310	2	1	2018-07-30	0	564593	632344	782526	3176435	2387034	1332450	678893	1219194	1366583	901661	0	0	0	0	0	30	7	2018	6	2017-10-12 18:53:43.24713	2018-05-20 15:17:50.380915
1311	2	1	2018-07-31	0	508133	609760	1067080	1813904	6341142	1618028	1194131	2181462	2636113	1633868	0	0	0	0	0	30	7	2018	0	2017-10-12 18:53:43.25565	2018-05-20 15:17:50.394916
1312	2	1	2018-08-01	0	423444	1287271	960372	2075761	3333532	1165041	751487	1809696	1879346	2130365	0	0	0	0	0	31	8	2018	1	2017-10-12 18:53:43.263842	2018-05-20 15:17:50.407916
1313	2	1	2018-08-02	0	762200	1355022	1920744	4159761	3582562	1326803	1590297	2318220	2633506	967900	0	0	0	0	0	31	8	2018	2	2017-10-12 18:53:43.272202	2018-05-20 15:17:50.421917
1314	2	1	2018-08-03	0	677511	1016267	1387204	1541173	2495933	2025585	1525559	1618367	1735386	2076640	0	0	0	0	0	31	8	2018	3	2017-10-12 18:53:43.280848	2018-05-20 15:17:50.434917
1315	2	1	2018-08-04	0	275239	508133	746956	1909074	3059202	878766	835488	1620423	1120316	458978	0	0	0	0	0	31	8	2018	4	2017-10-12 18:53:43.289054	2018-05-20 15:17:50.447918
1316	2	1	2018-08-05	0	381100	440382	480186	2836292	1025934	972632	675818	910217	682675	484898	0	0	0	0	0	31	8	2018	5	2017-10-12 18:53:43.297497	2018-05-20 15:17:50.460919
1317	2	1	2018-08-06	0	592822	880764	1387204	2901270	2329358	1728871	1701872	2002689	2715109	2252573	0	0	0	0	0	31	8	2018	6	2017-10-12 18:53:43.305739	2018-05-20 15:17:50.48192
1318	2	1	2018-08-07	0	508133	880764	1600620	4619754	5572040	817935	849148	1523130	1952124	1461801	0	0	0	0	0	31	8	2018	0	2017-10-12 18:53:43.314957	2018-05-20 15:17:50.48892
1319	2	1	2018-08-08	0	508133	1287271	1173788	6021442	5924366	1761440	920983	1757668	2568255	1440686	0	0	0	0	0	32	8	2018	1	2017-10-12 18:53:43.323197	2018-05-20 15:17:50.504921
1321	2	1	2018-08-10	0	635167	1219520	1814036	4330391	2448850	1477755	1199774	1711245	1600021	2355716	0	0	0	0	0	32	8	2018	3	2017-10-12 18:53:43.339951	2018-05-20 15:17:50.521922
1322	2	1	2018-08-11	0	275239	609760	907018	875135	2421916	919068	1058194	1664324	770139	423098	0	0	0	0	0	32	8	2018	4	2017-10-12 18:53:43.349144	2018-05-20 15:17:50.530922
1323	2	1	2018-08-12	0	232894	575884	960372	1335528	894964	1368437	530598	804268	1123569	531164	0	0	0	0	0	32	8	2018	5	2017-10-12 18:53:43.357618	2018-05-20 15:17:50.535923
1324	2	1	2018-08-13	0	804544	948515	960372	2641334	7350991	1552704	1469348	3086037	3081458	1079323	0	0	0	0	0	32	8	2018	6	2017-10-12 18:53:43.366049	2018-05-20 15:17:50.539923
1325	2	1	2018-08-14	0	508133	1084018	960372	3780293	4489105	2654734	1575579	1834697	1588269	994350	0	0	0	0	0	32	8	2018	0	2017-10-12 18:53:43.374239	2018-05-20 15:17:50.539923
1326	2	1	2018-08-15	0	635167	880764	1600620	2309086	2715597	2320592	818039	1577076	2084977	1343574	0	0	0	0	0	33	8	2018	1	2017-10-12 18:53:43.383487	2018-05-20 15:17:50.552923
1327	2	1	2018-08-16	0	635167	1016267	1920744	2915352	3036329	1988508	1329508	1726478	2627044	1488716	0	0	0	0	0	33	8	2018	2	2017-10-12 18:53:43.391717	2018-05-20 15:17:50.558923
1329	2	1	2018-08-18	0	402272	440382	960372	1696750	1280287	1110530	293885	932468	622506	777310	0	0	0	0	0	33	8	2018	4	2017-10-12 18:53:43.410301	2018-05-20 15:17:50.570924
1330	2	1	2018-08-19	0	296411	304880	960372	1159648	3807843	1034421	646247	1107522	746292	444488	0	0	0	0	0	33	8	2018	5	2017-10-12 18:53:43.418639	2018-05-20 15:17:50.577924
1331	2	1	2018-08-20	0	550478	1287271	1387204	2817205	5374278	2085169	1625526	3269714	3513312	1651020	0	0	0	0	0	33	8	2018	6	2017-10-12 18:53:43.428388	2018-05-20 15:17:50.583925
1332	2	1	2018-08-21	0	381100	745262	1493912	2107786	2028439	2380733	1706765	1071186	1770469	2263975	0	0	0	0	0	33	8	2018	0	2017-10-12 18:53:43.436846	2018-05-20 15:17:50.589925
1333	2	1	2018-08-22	0	592822	609760	2134160	4090918	3243821	2527355	1863925	1918158	1792536	1643835	0	0	0	0	0	34	8	2018	1	2017-10-12 18:53:43.447294	2018-05-20 15:17:50.590925
1334	2	1	2018-08-23	0	592822	609760	1387204	1440537	5742153	2956718	853284	1614102	2067230	2081507	0	0	0	0	0	34	8	2018	2	2017-10-12 18:53:43.456518	2018-05-20 15:17:50.600925
1335	2	1	2018-08-24	0	846889	1016267	1387204	3164096	3538080	2122688	1704002	1341541	1902597	2651552	0	0	0	0	0	34	8	2018	3	2017-10-12 18:53:43.464574	2018-05-20 15:17:50.606926
1336	2	1	2018-08-25	0	254067	677511	853664	1435474	3019017	1001110	910623	795155	996836	704890	0	0	0	0	0	34	8	2018	4	2017-10-12 18:53:43.473815	2018-05-20 15:17:50.612926
1337	2	1	2018-08-26	0	211722	474258	800310	1786705	1987785	857461	828240	1544666	978341	528369	0	0	0	0	0	34	8	2018	5	2017-10-12 18:53:43.482156	2018-05-20 15:17:50.617926
1338	2	1	2018-08-27	0	423444	745262	1920744	4814878	2929069	2371254	843746	1673534	2296151	719266	0	0	0	0	0	34	8	2018	6	2017-10-12 18:53:43.491239	2018-05-20 15:17:50.623926
1339	2	1	2018-08-28	0	762200	1151769	2134160	2806693	2622426	1280555	1260996	1805014	2035816	1771536	0	0	0	0	0	34	8	2018	0	2017-10-12 18:53:43.49977	2018-05-20 15:17:50.629927
1340	2	1	2018-08-29	0	719855	880764	1707328	4943530	4708542	2367779	1637637	1531525	1565337	1322632	0	0	0	0	0	35	8	2018	1	2017-10-12 18:53:43.50955	2018-05-20 15:17:50.635927
1341	2	1	2018-08-30	0	0	0	441000	572713	715954	593100	748088	1838862	1596256	2069514	1135034	726056	0	0	0	35	8	2018	2	2017-10-12 18:53:43.517967	2018-05-20 15:17:50.640927
1342	2	1	2018-08-31	0	0	0	220500	678848	948593	1199814	532518	1465644	1110204	2326229	1608236	998444	0	0	0	35	8	2018	3	2017-10-12 18:53:43.52603	2018-05-20 15:17:50.646928
1343	2	1	2018-09-01	0	0	0	352800	408671	513301	1169306	903112	972396	1952125	2221174	1299548	944742	0	0	0	35	9	2018	4	2017-10-12 18:53:43.534479	2018-05-20 15:17:50.652928
1344	2	1	2018-09-02	0	0	0	374850	789832	1280912	461902	865892	1608905	2020631	1190178	2448590	1925192	0	0	0	35	9	2018	5	2017-10-12 18:53:43.543414	2018-05-20 15:17:50.654928
1345	2	1	2018-09-03	0	0	0	308700	444565	408441	891990	859933	1092617	1813444	1231383	1235868	1411776	0	0	0	35	9	2018	6	2017-10-12 18:53:43.551522	2018-05-20 15:17:50.664928
1346	2	1	2018-09-04	0	0	0	396900	858441	1637423	1286930	1823096	2153362	3817070	4000653	3862392	2738614	0	0	0	35	9	2018	0	2017-10-12 18:53:43.559513	2018-05-20 15:17:50.666928
1347	2	1	2018-09-05	0	0	0	599760	1543077	2000966	2111472	1887662	1054097	3153811	5087541	3696690	2573750	0	0	0	36	9	2018	1	2017-10-12 18:53:43.567465	2018-05-20 15:17:50.666928
1348	2	1	2018-09-06	0	0	0	418950	854784	1065785	503335	707288	1344533	1471280	3465666	1288151	1400453	0	0	0	36	9	2018	2	2017-10-12 18:53:43.575518	2018-05-20 15:17:50.681929
1349	2	1	2018-09-07	0	0	0	352800	382840	1706078	461846	734582	1410261	1278572	2849472	1182022	686477	0	0	0	36	9	2018	3	2017-10-12 18:53:43.583715	2018-05-20 15:17:50.687929
1350	2	1	2018-09-08	0	0	0	418950	359246	622517	1098795	1035395	1001530	949320	1447958	1261620	1968978	0	0	0	36	9	2018	4	2017-10-12 18:53:43.592268	2018-05-20 15:17:50.693929
1351	2	1	2018-09-09	0	0	0	308700	545401	1205475	908472	576983	1783683	2301572	3340006	1428390	775946	0	0	0	36	9	2018	5	2017-10-12 18:53:43.600525	2018-05-20 15:17:50.69993
1352	2	1	2018-09-10	0	0	0	264600	616102	614115	1251222	957715	1419466	1524466	1985539	1050287	1749250	0	0	0	36	9	2018	6	2017-10-12 18:53:43.608529	2018-05-20 15:17:50.70493
1353	2	1	2018-09-11	0	0	0	705600	1022087	2975032	2023052	1611910	1558036	4368066	3303618	5247018	3809166	0	0	0	36	9	2018	0	2017-10-12 18:53:43.616887	2018-05-20 15:17:50.71093
1354	2	1	2018-09-12	0	0	0	388080	393743	1140061	2068243	1508895	2378410	3408766	2507532	3183978	2760734	0	0	0	37	9	2018	1	2017-10-12 18:53:43.625172	2018-05-20 15:17:50.715931
1355	2	1	2018-09-13	0	0	0	286650	534424	785970	426176	606801	1463353	1238475	2477842	1991214	1439486	0	0	0	37	9	2018	2	2017-10-12 18:53:43.634077	2018-05-20 15:17:50.717931
1356	2	1	2018-09-14	0	0	0	352800	569122	996493	437670	819274	585315	1354755	1341774	1608639	1120799	0	0	0	37	9	2018	3	2017-10-12 18:53:43.643334	2018-05-20 15:17:50.728931
1358	2	1	2018-09-16	0	0	0	220500	482417	439912	493622	1251701	915251	2534222	1734478	1362629	756210	0	0	0	37	9	2018	5	2017-10-12 18:53:43.660799	2018-05-20 15:17:50.741932
1359	2	1	2018-09-17	0	0	0	264600	584164	761829	742195	510709	705141	2353986	2908812	1233956	1596492	0	0	0	37	9	2018	6	2017-10-12 18:53:43.669296	2018-05-20 15:17:50.748932
1360	2	1	2018-09-18	0	0	0	661500	1355988	1244373	1886392	2654826	3220885	2520887	3938986	4310444	3087699	0	0	0	37	9	2018	0	2017-10-12 18:53:43.677734	2018-05-20 15:17:50.754932
1361	2	1	2018-09-19	0	0	0	705600	1126014	708273	1364848	1858198	1097768	4411278	2547453	3310284	2289030	0	0	0	38	9	2018	1	2017-10-12 18:53:43.68626	2018-05-20 15:17:50.762933
1362	2	1	2018-09-20	0	0	0	374850	626199	316459	1245680	564232	797245	2193208	1433686	1870218	1540614	0	0	0	38	9	2018	2	2017-10-12 18:53:43.695411	2018-05-20 15:17:50.770933
1363	2	1	2018-09-21	0	0	0	441000	1026740	1004390	604506	1157595	1877136	2645172	2711061	1022317	1001972	0	0	0	38	9	2018	3	2017-10-12 18:53:43.70449	2018-05-20 15:17:50.778934
1364	2	1	2018-09-22	0	0	0	441000	705632	648872	781283	761116	1232800	1180120	1754123	2903696	860108	0	0	0	38	9	2018	4	2017-10-12 18:53:43.712669	2018-05-20 15:17:50.778934
1366	2	1	2018-09-24	0	0	0	286650	1048394	357436	730880	602539	894250	1236119	2322540	2243472	1064120	0	0	0	38	9	2018	6	2017-10-12 18:53:43.730137	2018-05-20 15:17:50.799934
1367	2	1	2018-09-25	0	0	0	661500	1036832	1500166	2640428	968153	2143984	3736415	4773656	5392806	2507797	0	0	0	38	9	2018	0	2017-10-12 18:53:43.739292	2018-05-20 15:17:50.818935
1368	2	1	2018-09-26	0	0	0	599760	761485	3063622	2112182	1910225	1786798	6162406	3709100	3068038	2135745	0	0	0	39	9	2018	1	2017-10-12 18:53:43.747313	2018-05-20 15:17:50.824935
1369	2	1	2018-09-27	0	0	0	330750	1174081	1516276	1333108	1489854	1676720	2386994	4605094	3817078	2753148	0	0	0	39	9	2018	2	2017-10-12 18:53:43.755137	2018-05-20 15:17:50.830936
1370	2	1	2018-09-28	0	0	0	496125	809286	1494582	810976	1004592	1939306	1949111	1696937	3169696	1107538	0	0	0	39	9	2018	3	2017-10-12 18:53:43.763443	2018-05-20 15:17:50.830936
1371	2	1	2018-09-29	0	0	0	396900	454399	728220	744759	1148637	1384766	1884940	1521243	2221986	1318257	0	0	0	39	9	2018	4	2017-10-12 18:53:43.772246	2018-05-20 15:17:50.842936
1372	2	1	2018-09-30	0	0	0	297675	1077918	692369	868752	1473600	1473803	4216942	2826354	1827807	942108	0	0	0	39	9	2018	5	2017-10-12 18:53:43.780065	2018-05-20 15:17:50.849936
1373	2	1	2018-10-01	0	0	0	529200	673002	778560	1064046	1754607	2168642	3524692	3540375	2279208	1892402	0	0	0	39	10	2018	6	2017-10-12 18:53:43.789405	2018-05-20 15:17:50.851936
1374	2	1	2018-10-02	0	0	0	628425	1236114	1172714	1051529	1194185	2619594	3199777	2510745	2461707	1490067	0	0	0	39	10	2018	0	2017-10-12 18:53:43.797473	2018-05-20 15:17:50.861936
1375	2	1	2018-10-03	0	0	0	562275	1938114	692608	1225421	867327	1903590	3622734	2729174	3999429	1381659	0	0	0	40	10	2018	1	2017-10-12 18:53:43.805519	2018-05-20 15:17:50.863936
1376	2	1	2018-10-04	0	0	0	595350	896327	2438612	2915320	2760906	4548013	6410939	8774315	6781102	2845656	0	0	0	40	10	2018	2	2017-10-12 18:53:43.814487	2018-05-20 15:17:50.874936
1377	2	1	2018-10-05	0	0	0	1058400	1328194	2568825	1850539	1462959	1497746	3345829	7795046	7974916	2488955	0	0	0	40	10	2018	3	2017-10-12 18:53:43.823298	2018-05-20 15:17:50.880937
1378	2	1	2018-10-06	0	0	0	463050	1187045	962410	636640	867833	1360466	2096050	3329469	1678922	2165192	0	0	0	40	10	2018	4	2017-10-12 18:53:43.831661	2018-05-20 15:17:50.886937
1379	2	1	2018-10-07	0	0	0	661500	1004442	682569	1061689	1014013	1771687	2880922	3253953	2392182	1347501	0	0	0	40	10	2018	5	2017-10-12 18:53:43.840165	2018-05-20 15:17:50.892937
1380	2	1	2018-10-08	0	0	0	529200	1146306	1879923	1157352	1106140	2309568	1655018	3919590	2600176	1713419	0	0	0	40	10	2018	6	2017-10-12 18:53:43.84995	2018-05-20 15:17:50.898938
1381	2	1	2018-10-09	0	0	0	429975	413838	853779	1467884	1761292	2001338	2020645	4531629	2531657	1615929	0	0	0	40	10	2018	0	2017-10-12 18:53:43.858433	2018-05-20 15:17:50.904938
1382	2	1	2018-10-10	0	0	0	429975	983164	861201	1878583	839049	1943147	4744129	2403236	1666247	2439979	0	0	0	41	10	2018	1	2017-10-12 18:53:43.867252	2018-05-20 15:17:50.953941
1383	2	1	2018-10-11	0	0	0	1323000	1466281	4052373	3751630	1952810	3409179	7868749	5439829	3487022	3957521	0	0	0	41	10	2018	2	2017-10-12 18:53:43.878505	2018-05-20 15:17:51.076945
1384	2	1	2018-10-12	0	0	0	1058400	1501655	2526719	1499553	2510362	1864172	3291906	9396524	12090706	2072782	0	0	0	41	10	2018	3	2017-10-12 18:53:43.887337	2018-05-20 15:17:51.082945
1385	2	1	2018-10-13	0	0	0	529200	914953	1616730	1570258	1566101	874913	2478675	2569162	1581209	1068260	0	0	0	41	10	2018	4	2017-10-12 18:53:43.896492	2018-05-20 15:17:51.088946
1386	2	1	2018-10-14	0	0	0	396900	1800220	1721638	621150	1070711	1886364	3371668	2170500	3235177	1177527	0	0	0	41	10	2018	5	2017-10-12 18:53:43.904814	2018-05-20 15:17:51.094946
1387	2	1	2018-10-15	0	0	0	529200	656895	1109313	1217053	1224120	1670995	1247440	1846757	3617361	1687387	0	0	0	41	10	2018	6	2017-10-12 18:53:43.913833	2018-05-20 15:17:51.100947
1388	2	1	2018-10-16	0	0	0	429975	784730	1189105	1979618	753502	1495958	1277309	2602908	4380591	1642599	0	0	0	41	10	2018	0	2017-10-12 18:53:43.922646	2018-05-20 15:17:51.105947
1389	2	1	2018-10-17	0	0	0	463050	643239	1271897	945120	1438219	2731208	4714229	2686135	4279522	3021274	0	0	0	42	10	2018	1	2017-10-12 18:53:43.931105	2018-05-20 15:17:51.111947
1390	2	1	2018-10-18	0	0	0	1323000	2754133	2384694	2593164	1317173	4948005	5047204	5782143	4060937	2918908	0	0	0	42	10	2018	2	2017-10-12 18:53:43.940241	2018-05-20 15:17:51.117947
1391	2	1	2018-10-19	0	0	0	1058400	2198121	2736636	3907294	1907777	2279447	3474627	5248117	8638588	2260717	0	0	0	42	10	2018	3	2017-10-12 18:53:43.94822	2018-05-20 15:17:51.123948
1392	2	1	2018-10-20	0	0	0	429975	773168	1994092	2049954	696523	2493520	2317739	2463294	1706222	974949	0	0	0	42	10	2018	4	2017-10-12 18:53:43.956231	2018-05-20 15:17:51.128948
1393	2	1	2018-10-21	0	0	0	529200	922681	924478	1127612	821486	2264507	1950424	4651462	2639816	1588093	0	0	0	42	10	2018	5	2017-10-12 18:53:43.964207	2018-05-20 15:17:51.134948
1395	2	1	2018-10-23	0	0	0	396900	742936	1595242	884821	1411533	1286225	1681469	2491949	3209050	1427356	0	0	0	42	10	2018	0	2017-10-12 18:53:43.980835	2018-05-20 15:17:51.147949
1396	2	1	2018-10-24	0	0	0	595350	1576363	1908221	999547	751320	3265344	2563865	4024599	2600280	2292714	0	0	0	43	10	2018	1	2017-10-12 18:53:43.989878	2018-05-20 15:17:51.15395
1397	2	1	2018-10-25	0	0	0	793800	2220199	2219020	1835643	2754922	2149365	6783880	4812525	5061972	3443912	0	0	0	43	10	2018	2	2017-10-12 18:53:43.998728	2018-05-20 15:17:51.15995
1398	2	1	2018-10-26	0	0	0	1005480	689666	1236105	1895339	2266292	4609102	3114446	7676547	7401136	2166070	0	0	0	43	10	2018	3	2017-10-12 18:53:44.007077	2018-05-20 15:17:51.16595
1399	2	1	2018-10-27	0	0	0	463050	683154	1867952	1109393	1704530	1279618	2650183	2421682	1765257	1583975	0	0	0	43	10	2018	4	2017-10-12 18:53:44.015274	2018-05-20 15:17:51.16595
1400	2	1	2018-10-28	0	0	0	429975	703891	1199773	1007881	914960	1980699	3558090	4083847	1943155	1230655	0	0	0	43	10	2018	5	2017-10-12 18:53:44.024375	2018-05-20 15:17:51.17595
1401	2	1	2018-10-29	0	0	0	429975	1080866	1086921	1356683	709691	1493624	2156875	3732833	1275386	1279209	0	0	0	43	10	2018	6	2017-10-12 18:53:44.03326	2018-05-20 15:17:51.17595
1403	2	1	2018-10-31	0	254067	496841	995942	1921430	2637211	1184988	435941	1210303	2201961	683413	0	0	0	0	0	44	10	2018	1	2017-10-12 18:53:44.050622	2018-05-20 15:17:51.194951
1404	2	1	2018-11-01	0	338756	451674	1422774	1455197	2610256	1183550	481488	1035048	1416692	864663	0	0	0	0	0	44	11	2018	2	2017-10-12 18:53:44.058831	2018-05-20 15:17:51.196951
1405	2	1	2018-11-02	0	254067	677511	1209358	685931	4300619	859744	1201680	1650370	2075080	1567730	0	0	0	0	0	44	11	2018	3	2017-10-12 18:53:44.067204	2018-05-20 15:17:51.196951
1406	2	1	2018-11-03	0	169378	203253	391262	933448	1240886	468922	533795	735058	596134	561080	0	0	0	0	0	44	11	2018	4	2017-10-12 18:53:44.07592	2018-05-20 15:17:51.211951
1407	2	1	2018-11-04	0	197607	203253	320124	369958	1577506	688351	302171	430991	955846	571508	0	0	0	0	0	44	11	2018	5	2017-10-12 18:53:44.085399	2018-05-20 15:17:51.217952
1408	2	1	2018-11-05	0	536363	451674	1138219	2530887	3873623	727511	998548	1141326	2483270	856758	0	0	0	0	0	44	11	2018	6	2017-10-12 18:53:44.09399	2018-05-20 15:17:51.217952
1409	2	1	2018-11-06	0	310526	767846	1209358	1351230	2724739	1622747	1020002	899810	1654950	1104505	0	0	0	0	0	44	11	2018	0	2017-10-12 18:53:44.102432	2018-05-20 15:17:51.228952
1410	2	1	2018-11-07	0	479904	722678	640248	2330759	3160341	1034847	382406	1716914	1479229	1021171	0	0	0	0	0	45	11	2018	1	2017-10-12 18:53:44.110794	2018-05-20 15:17:51.233952
1411	2	1	2018-11-08	0	310526	813013	853664	2019460	2267843	1335062	1048014	1064204	1456457	1318086	0	0	0	0	0	45	11	2018	2	2017-10-12 18:53:44.119272	2018-05-20 15:17:51.239952
1412	2	1	2018-11-09	0	564593	496841	640248	2245796	1842816	893832	1249462	907351	1474070	1363604	0	0	0	0	0	45	11	2018	3	2017-10-12 18:53:44.127993	2018-05-20 15:17:51.245953
1413	2	1	2018-11-10	0	239952	316172	462401	977760	946766	440894	275799	662674	755475	448006	0	0	0	0	0	45	11	2018	4	2017-10-12 18:53:44.136941	2018-05-20 15:17:51.248953
1414	2	1	2018-11-11	0	211722	293588	391262	1297074	1313500	434682	354720	345273	962258	272783	0	0	0	0	0	45	11	2018	5	2017-10-12 18:53:44.145679	2018-05-20 15:17:51.260953
1415	2	1	2018-11-12	0	564593	496841	1422774	2877413	1503641	1132678	400428	1390570	2319358	1561196	0	0	0	0	0	45	11	2018	6	2017-10-12 18:53:44.153974	2018-05-20 15:17:51.260953
1416	2	1	2018-11-13	0	451674	542009	640248	1702337	2667665	1728658	1090936	1649286	1478304	510288	0	0	0	0	0	45	11	2018	0	2017-10-12 18:53:44.162613	2018-05-20 15:17:51.275953
1417	2	1	2018-11-14	0	508133	587176	1067081	1384657	3309806	1308650	1008982	1435210	2548888	985223	0	0	0	0	0	46	11	2018	1	2017-10-12 18:53:44.171823	2018-05-20 15:17:51.282954
1418	2	1	2018-11-15	0	395215	632344	1138219	748122	1841362	1604666	1557532	1959311	861420	913064	0	0	0	0	0	46	11	2018	2	2017-10-12 18:53:44.180568	2018-05-20 15:17:51.287954
1419	2	1	2018-11-16	0	536363	632344	995942	3209474	1961876	1386080	415472	1009771	1435881	992901	0	0	0	0	0	46	11	2018	3	2017-10-12 18:53:44.189657	2018-05-20 15:17:51.294954
1420	2	1	2018-11-17	0	183493	248421	711386	830706	1560461	765736	276956	485073	665863	627418	0	0	0	0	0	46	11	2018	4	2017-10-12 18:53:44.198373	2018-05-20 15:17:51.299955
1421	2	1	2018-11-18	0	155263	361339	533540	1964811	997097	512868	306440	646095	477728	392454	0	0	0	0	0	46	11	2018	5	2017-10-12 18:53:44.206714	2018-05-20 15:17:51.305955
1422	2	1	2018-11-19	0	423444	542009	924803	2695242	2372540	1134063	581909	1165557	1736262	960601	0	0	0	0	0	46	11	2018	6	2017-10-12 18:53:44.217612	2018-05-20 15:17:51.311955
1423	2	1	2018-11-20	0	508133	451674	853664	1295494	891982	1913694	596241	1039252	661559	727692	0	0	0	0	0	46	11	2018	0	2017-10-12 18:53:44.227027	2018-05-20 15:17:51.316956
1424	2	1	2018-11-21	0	423444	677511	782526	1107438	4095090	1454766	554006	1023507	1402606	630138	0	0	0	0	0	47	11	2018	1	2017-10-12 18:53:44.236426	2018-05-20 15:17:51.322956
1425	2	1	2018-11-22	0	395215	406507	924803	2307912	1184460	818607	720860	1033105	1159972	985086	0	0	0	0	0	47	11	2018	2	2017-10-12 18:53:44.24521	2018-05-20 15:17:51.328956
1426	2	1	2018-11-23	0	423444	903348	1138219	1482022	3968290	824354	901696	1595867	1918014	1139860	0	0	0	0	0	47	11	2018	3	2017-10-12 18:53:44.253961	2018-05-20 15:17:51.333956
1427	2	1	2018-11-24	0	254067	271004	711386	1784408	846642	459346	389124	297185	907560	380096	0	0	0	0	0	47	11	2018	4	2017-10-12 18:53:44.262484	2018-05-20 15:17:51.339957
1428	2	1	2018-11-25	0	254067	271004	569109	869066	1048016	488195	207074	496481	536051	400213	0	0	0	0	0	47	11	2018	5	2017-10-12 18:53:44.271141	2018-05-20 15:17:51.345957
1429	2	1	2018-11-26	0	564593	858181	1067081	1899568	2216189	1110138	900065	1495454	1316660	675939	0	0	0	0	0	47	11	2018	6	2017-10-12 18:53:44.278977	2018-05-20 15:17:51.350957
1430	2	1	2018-11-27	0	338756	587176	995942	2037606	3925257	914944	583629	911753	1365607	760442	0	0	0	0	0	47	11	2018	0	2017-10-12 18:53:44.287804	2018-05-20 15:17:51.357958
1431	2	1	2018-11-28	0	366985	496841	640248	3176435	2557536	1097312	987480	870853	1757036	689506	0	0	0	0	0	48	11	2018	1	2017-10-12 18:53:44.29579	2018-05-20 15:17:51.363958
1432	2	1	2018-11-29	0	762200	948515	2134160	3265027	4359535	2157370	1123888	1714006	3765876	1057209	0	0	0	0	0	48	11	2018	2	2017-10-12 18:53:44.303865	2018-05-20 15:17:51.368958
1433	2	1	2018-11-30	0	677511	677511	1173788	1465243	5555886	2213578	1252479	1809696	1879346	1503787	0	0	0	0	0	48	11	2018	3	2017-10-12 18:53:44.31211	2018-05-20 15:17:51.371959
1434	2	1	2018-12-01	0	592822	880764	1600620	4893836	2303076	2358762	2079619	1586151	2487200	1290533	0	0	0	0	0	48	12	2018	4	2017-10-12 18:53:44.32101	2018-05-20 15:17:51.371959
1435	2	1	2018-12-02	0	381100	1084018	2027452	1961492	4159889	1800520	1627262	1888095	1272616	1832330	0	0	0	0	0	48	12	2018	5	2017-10-12 18:53:44.329102	2018-05-20 15:17:51.386959
1436	2	1	2018-12-03	0	359928	542009	1013726	1145444	1682561	585844	556992	1449852	1061352	573722	0	0	0	0	0	48	12	2018	6	2017-10-12 18:53:44.337227	2018-05-20 15:17:51.392959
1437	2	1	2018-12-04	0	381100	440382	907018	1890862	1709891	486316	477048	1517028	1241228	484898	0	0	0	0	0	48	12	2018	0	2017-10-12 18:53:44.345598	2018-05-20 15:17:51.392959
1438	2	1	2018-12-05	0	635167	1084018	2134160	2290476	5176352	2659802	900991	2464848	1879691	1855060	0	0	0	0	0	49	12	2018	1	2017-10-12 18:53:44.354273	2018-05-20 15:17:51.403959
1439	2	1	2018-12-06	0	635167	1219520	1600620	4927738	6268545	1181462	771953	1903913	2066954	1727583	0	0	0	0	0	49	12	2018	2	2017-10-12 18:53:44.363313	2018-05-20 15:17:51.40996
1451	2	1	2018-12-18	0	296411	542009	746956	1159648	2605366	620653	682149	664513	746292	488937	0	0	0	0	0	50	12	2018	0	2017-10-12 18:53:44.497434	2018-05-20 15:17:51.41496
1452	2	1	2018-12-19	0	719855	1084018	1600620	2561095	4299422	1603976	1381697	3106228	1580990	1651020	0	0	0	0	0	51	12	2018	1	2017-10-12 18:53:44.506788	2018-05-20 15:17:51.42096
1453	2	1	2018-12-20	0	381100	1151769	1280496	1363861	3042659	1339162	948203	1558088	1327852	1906506	0	0	0	0	0	51	12	2018	2	2017-10-12 18:53:44.51527	2018-05-20 15:17:51.426961
1454	2	1	2018-12-21	0	465789	1151769	1920744	5551960	2671382	1421637	1035514	1662404	1912038	1753424	0	0	0	0	0	51	12	2018	3	2017-10-12 18:53:44.523563	2018-05-20 15:17:51.431961
1455	2	1	2018-12-22	0	465789	745262	1814036	1920716	3190085	2299669	1450583	3066794	1653784	1734590	0	0	0	0	0	51	12	2018	4	2017-10-12 18:53:44.532536	2018-05-20 15:17:51.437961
1456	2	1	2018-12-23	0	635167	1151769	1707328	2373072	4717440	1228924	1345265	1207387	3382395	1325776	0	0	0	0	0	51	12	2018	5	2017-10-12 18:53:44.543444	2018-05-20 15:17:51.443962
1457	2	1	2018-12-24	0	381100	575884	746956	1291927	2616481	750833	862695	514512	712026	497569	0	0	0	0	0	51	12	2018	6	2017-10-12 18:53:44.551833	2018-05-20 15:17:51.443962
1458	2	1	2018-12-25	0	190550	508133	907018	992614	3379235	1200445	1104320	1544666	628934	528369	0	0	0	0	0	51	12	2018	0	2017-10-12 18:53:44.560523	2018-05-20 15:17:51.454962
1459	2	1	2018-12-26	0	508133	609760	1280496	4531650	2004100	2540630	973553	1673534	2870189	1222752	0	0	0	0	0	52	12	2018	1	2017-10-12 18:53:44.569157	2018-05-20 15:17:51.460962
1460	2	1	2018-12-27	0	762200	1016267	2134160	1871129	2950229	1920832	969997	2449662	1821519	1882257	0	0	0	0	0	52	12	2018	2	2017-10-12 18:53:44.578196	2018-05-20 15:17:51.464962
1461	2	1	2018-12-28	0	508133	1355022	1067080	2601858	4316164	2999186	775723	1178096	1341718	1102193	0	0	0	0	0	52	12	2018	3	2017-10-12 18:53:44.586424	2018-05-20 15:17:51.464962
1462	2	1	2018-12-29	0	677511	813013	1387204	1582048	4717440	2234408	896843	2146466	2748196	1325776	0	0	0	0	0	52	12	2018	4	2017-10-12 18:53:44.59542	2018-05-20 15:17:51.477963
1463	2	1	2018-12-30	0	317583	677511	1013726	1435474	4025356	1126249	814768	467738	1210444	787818	0	0	0	0	0	52	12	2018	5	2017-10-12 18:53:44.60406	2018-05-20 15:17:51.485963
1464	2	1	2018-12-31	0	423444	304880	640248	1290398	3379235	1457684	883456	695100	838578	457920	0	0	0	0	0	52	12	2018	6	2017-10-12 18:53:44.612267	2018-05-20 15:17:51.485963
\.


--
-- Name: sale_reals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: coke
--

SELECT pg_catalog.setval('public.sale_reals_id_seq', 1464, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: coke
--

COPY public.schema_migrations (version) FROM stdin;
20170816011851
20170816004646
20170816004709
20170810054051
20170816011612
20170816004606
20170816004742
20170816004630
20170829154632
20170829182654
20170829214157
20170829232211
20170830141530
20170921172936
20170921174138
20170921181437
20170921181618
20170921181833
20170921182445
20170926160056
20171011142946
20171011144149
20171011144252
20171011150202
20171013143922
20171110071756
20180228063728
20180228071958
20180228072002
20180430142149
20180501204206
20180503165753
20180503170129
20180507180908
20180507181518
20180507185155
20180507200300
20180508001740
20180508004034
20180508133742
20180508162642
20180513123019
20180513123303
20180513124427
20180519223234
20180519224229
\.


--
-- Data for Name: sellers; Type: TABLE DATA; Schema: public; Owner: coke
--

COPY public.sellers (id, rut, name, lastname, email, phone, street, number, city, district, county, country, department_id, created_at, updated_at, store_id, assigned_shift, begin_shift) FROM stdin;
25	10341986-7	Fernando Andrés	Pérez Díaz	perezdiaz.fernando@gmail.com	99990521	Costanera	1	Santiago	-	Vitacura	CL	1	2017-10-13 14:54:25.461079	2017-10-13 14:54:25.461079	1	1	2017-10-01
26	5031807-9	Claudia Andréa	Bravo Lopez	calop@gf.com	48383221	Los Robles	2	Santiago	-	Nuñoa	CL	5	2017-10-13 14:54:25.472664	2017-10-13 14:54:25.472664	1	1	2017-10-02
27	7777777-7	Juan 	Herrera	jherrera@gmail.com	38383223	Av Siempre Viva	3	Viña del Mar	-	Recreo	COL	1	2017-10-13 14:54:25.482852	2017-10-13 14:54:25.482852	1	1	2017-10-03
28	8888888-8	Ulises	Medina	umedina2@gmail.com	78383224	Av. Conquistador	4	Concepción	-	San Pedro de la Paz	ARG	5	2017-10-13 14:54:25.492239	2017-10-13 14:54:25.492239	1	2	2017-10-04
29	9999999-9	Rodrigo	Sanz	rsanz@gmail.com	88383225	Av. Sting	5	Santiago	-	La Reina	PER	1	2017-10-13 14:54:25.502116	2017-10-13 14:54:25.502116	1	2	2017-10-05
30	5555555-5	Herminio	Cuevas	hcuevas@gmail.com	78383226	Av Manuel rodriguez	6	Temuco	-	Temuco	CL	5	2017-10-13 14:54:25.510929	2017-10-13 14:54:25.510929	1	2	2017-10-06
31	1-1	Pedro	Silva	psilva@gmail.com	99990522	Costanera	7	Santiago	-	Vitacura	CL	1	2017-10-13 14:54:25.519564	2017-10-13 14:54:25.519564	1	3	2017-10-07
32	1-2	Pablo	Marmolejo	pmarmolejo@gmail.com	48383222	Los Robles	8	Santiago	-	Nuñoa	CL	5	2017-10-13 14:54:25.52828	2017-10-13 14:54:25.52828	1	4	2017-10-08
34	1-4	Oliver	Urrutia	ourrutia@gmail.com	78383225	Av. Alemania	10	Concepción	-	San Pedro de la Paz	ARG	5	2017-10-13 14:54:25.555209	2017-10-13 14:54:25.555209	1	1	2017-10-10
35	1-5	Carlos	Paz	cpaz@gmail.com	88383226	Av. Sting	11	Santiago	-	La Reina	PER	5	2017-10-13 14:54:25.563797	2017-10-13 14:54:25.563797	1	2	2017-10-01
36	1-6	Bruce	Brown	bbrown@gmail.com	78383227	Av Balmaceda	12	Temuco	-	Temuco	CL	1	2017-10-13 14:54:25.571887	2017-10-13 14:54:25.571887	1	7	2017-10-02
37	1-7	Fernando Patricio	Capone	fcapone@gmail.com	48383223	Los Robles	13	Santiago	-	Nuñoa	CL	1	2017-10-13 14:54:25.579953	2017-10-13 14:54:25.579953	1	8	2017-10-03
38	1-8	Claudia Andrea	Fuentes	cfuentes@gmail.com	38383225	Av Siempre Viva	14	Viña del Mar	-	Recreo	COL	5	2017-10-13 14:54:25.587681	2017-10-13 14:54:25.587681	1	1	2017-10-04
39	1-9	Juan 	Garcia	jgarcia@gmail.com	78383226	Av. Pueblo nuevo	15	Concepción	-	San Pedro de la Paz	ARG	1	2017-10-13 14:54:25.595473	2017-10-13 14:54:25.595473	1	1	2017-10-05
40	1-10	Ulises	Fredes	ufredes@gmail.com	88383227	Av. Sting	16	Santiago	-	La Reina	PER	1	2017-10-13 14:54:25.603214	2017-10-13 14:54:25.603214	1	2	2017-10-06
41	1-11	Francisco	Lillo	flillo@gmail.com	78383228	Av Caupolicán	17	Temuco	-	Temuco	CL	5	2017-10-13 14:54:25.610789	2017-10-13 14:54:25.610789	1	9	2017-10-07
42	1-12	Juan 	Moya	jmoya@gmail.com	48383224	Los Robles	18	Santiago	-	Nuñoa	CL	5	2017-10-13 14:54:25.618759	2017-10-13 14:54:25.618759	1	6	2017-10-08
33	1-3	Luis	Sanchez	lsanchez@gmail.com	38383224	Av Siempre Viva	9	Viña del Mar	-	Recreo	COL	1	2017-10-13 14:54:25.54668	2017-10-13 14:54:25.54668	1	5	2017-10-09
\.


--
-- Name: sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: coke
--

SELECT pg_catalog.setval('public.sellers_id_seq', 42, true);


--
-- Data for Name: shift_breaks; Type: TABLE DATA; Schema: public; Owner: coke
--

COPY public.shift_breaks (id, seller_id, date, "time", created_at, updated_at) FROM stdin;
630	25	2017-10-02	17:00:00	2017-11-10 07:49:23.298091	2017-11-10 07:49:23.298091
631	25	2017-10-03	18:00:00	2017-11-10 07:49:23.306065	2017-11-10 07:49:23.306065
632	25	2017-10-05	17:00:00	2017-11-10 07:49:23.311386	2017-11-10 07:49:23.311386
633	25	2017-10-06	17:00:00	2017-11-10 07:49:23.317031	2017-11-10 07:49:23.317031
634	25	2017-10-07	17:00:00	2017-11-10 07:49:23.321555	2017-11-10 07:49:23.321555
635	25	2017-10-08	17:00:00	2017-11-10 07:49:23.326135	2017-11-10 07:49:23.326135
636	25	2017-10-09	16:00:00	2017-11-10 07:49:23.330719	2017-11-10 07:49:23.330719
637	25	2017-10-11	16:00:00	2017-11-10 07:49:23.335196	2017-11-10 07:49:23.335196
638	25	2017-10-12	15:00:00	2017-11-10 07:49:23.33971	2017-11-10 07:49:23.33971
639	25	2017-10-13	16:00:00	2017-11-10 07:49:23.344786	2017-11-10 07:49:23.344786
640	25	2017-10-14	16:00:00	2017-11-10 07:49:23.349796	2017-11-10 07:49:23.349796
641	25	2017-10-18	16:00:00	2017-11-10 07:49:23.354174	2017-11-10 07:49:23.354174
642	25	2017-10-20	17:00:00	2017-11-10 07:49:23.358336	2017-11-10 07:49:23.358336
643	25	2017-10-21	16:00:00	2017-11-10 07:49:23.362761	2017-11-10 07:49:23.362761
644	25	2017-10-22	18:00:00	2017-11-10 07:49:23.367181	2017-11-10 07:49:23.367181
645	25	2017-10-23	17:00:00	2017-11-10 07:49:23.371397	2017-11-10 07:49:23.371397
646	25	2017-10-24	15:00:00	2017-11-10 07:49:23.375648	2017-11-10 07:49:23.375648
647	25	2017-10-25	16:00:00	2017-11-10 07:49:23.379925	2017-11-10 07:49:23.379925
648	25	2017-10-26	16:00:00	2017-11-10 07:49:23.384589	2017-11-10 07:49:23.384589
649	25	2017-10-27	16:00:00	2017-11-10 07:49:23.389536	2017-11-10 07:49:23.389536
650	25	2017-10-30	17:00:00	2017-11-10 07:49:23.393821	2017-11-10 07:49:23.393821
651	25	2017-10-31	17:00:00	2017-11-10 07:49:23.398215	2017-11-10 07:49:23.398215
652	25	2017-11-02	18:00:00	2017-11-10 07:49:23.402323	2017-11-10 07:49:23.402323
653	25	2017-11-03	17:00:00	2017-11-10 07:49:23.406348	2017-11-10 07:49:23.406348
654	25	2017-11-04	17:00:00	2017-11-10 07:49:23.410434	2017-11-10 07:49:23.410434
655	25	2017-11-05	16:00:00	2017-11-10 07:49:23.414816	2017-11-10 07:49:23.414816
656	25	2017-11-06	16:00:00	2017-11-10 07:49:23.419169	2017-11-10 07:49:23.419169
657	25	2017-11-08	16:00:00	2017-11-10 07:49:23.423379	2017-11-10 07:49:23.423379
658	25	2017-11-09	15:00:00	2017-11-10 07:49:23.427719	2017-11-10 07:49:23.427719
659	25	2017-11-10	15:00:00	2017-11-10 07:49:23.432159	2017-11-10 07:49:23.432159
660	25	2017-11-11	16:00:00	2017-11-10 07:49:23.437257	2017-11-10 07:49:23.437257
661	25	2017-11-15	15:00:00	2017-11-10 07:49:23.442022	2017-11-10 07:49:23.442022
662	25	2017-11-17	18:00:00	2017-11-10 07:49:23.44636	2017-11-10 07:49:23.44636
663	25	2017-11-18	16:00:00	2017-11-10 07:49:23.450992	2017-11-10 07:49:23.450992
664	25	2017-11-19	18:00:00	2017-11-10 07:49:23.455293	2017-11-10 07:49:23.455293
665	25	2017-11-20	16:00:00	2017-11-10 07:49:23.459627	2017-11-10 07:49:23.459627
666	25	2017-11-21	16:00:00	2017-11-10 07:49:23.463787	2017-11-10 07:49:23.463787
667	25	2017-11-22	16:00:00	2017-11-10 07:49:23.4681	2017-11-10 07:49:23.4681
668	25	2017-11-23	15:00:00	2017-11-10 07:49:23.472296	2017-11-10 07:49:23.472296
669	25	2017-11-24	16:00:00	2017-11-10 07:49:23.47658	2017-11-10 07:49:23.47658
670	25	2017-11-27	17:00:00	2017-11-10 07:49:23.481013	2017-11-10 07:49:23.481013
671	25	2017-11-28	17:00:00	2017-11-10 07:49:23.48574	2017-11-10 07:49:23.48574
672	25	2017-11-30	18:00:00	2017-11-10 07:49:23.490439	2017-11-10 07:49:23.490439
673	25	2017-12-01	16:00:00	2017-11-10 07:49:23.495118	2017-11-10 07:49:23.495118
674	25	2017-12-02	16:00:00	2017-11-10 07:49:23.49958	2017-11-10 07:49:23.49958
675	25	2017-12-03	16:00:00	2017-11-10 07:49:23.503989	2017-11-10 07:49:23.503989
676	25	2017-12-04	16:00:00	2017-11-10 07:49:23.508265	2017-11-10 07:49:23.508265
677	25	2017-12-06	15:00:00	2017-11-10 07:49:23.512495	2017-11-10 07:49:23.512495
678	25	2017-12-07	16:00:00	2017-11-10 07:49:23.516851	2017-11-10 07:49:23.516851
679	25	2017-12-08	15:00:00	2017-11-10 07:49:23.521699	2017-11-10 07:49:23.521699
680	25	2017-12-09	15:00:00	2017-11-10 07:49:23.526853	2017-11-10 07:49:23.526853
681	25	2017-12-13	15:00:00	2017-11-10 07:49:23.531998	2017-11-10 07:49:23.531998
682	25	2017-12-15	18:00:00	2017-11-10 07:49:23.5367	2017-11-10 07:49:23.5367
683	25	2017-12-16	16:00:00	2017-11-10 07:49:23.541296	2017-11-10 07:49:23.541296
684	25	2017-12-17	17:00:00	2017-11-10 07:49:23.54621	2017-11-10 07:49:23.54621
685	25	2017-12-18	16:00:00	2017-11-10 07:49:23.551263	2017-11-10 07:49:23.551263
686	25	2017-12-19	15:00:00	2017-11-10 07:49:23.556207	2017-11-10 07:49:23.556207
687	25	2017-12-20	16:00:00	2017-11-10 07:49:23.56112	2017-11-10 07:49:23.56112
688	25	2017-12-21	16:00:00	2017-11-10 07:49:23.565975	2017-11-10 07:49:23.565975
689	25	2017-12-22	15:00:00	2017-11-10 07:49:23.57094	2017-11-10 07:49:23.57094
690	25	2017-12-25	17:00:00	2017-11-10 07:49:23.575657	2017-11-10 07:49:23.575657
691	25	2017-12-26	18:00:00	2017-11-10 07:49:23.58026	2017-11-10 07:49:23.58026
692	25	2017-12-28	17:00:00	2017-11-10 07:49:23.585669	2017-11-10 07:49:23.585669
693	25	2017-12-29	16:00:00	2017-11-10 07:49:23.590654	2017-11-10 07:49:23.590654
694	25	2017-12-30	16:00:00	2017-11-10 07:49:23.597993	2017-11-10 07:49:23.597993
695	25	2017-12-31	17:00:00	2017-11-10 07:49:23.602473	2017-11-10 07:49:23.602473
696	25	2018-01-01	15:00:00	2017-11-10 07:49:23.606872	2017-11-10 07:49:23.606872
697	25	2018-01-03	16:00:00	2017-11-10 07:49:23.611579	2017-11-10 07:49:23.611579
698	25	2018-01-04	15:00:00	2017-11-10 07:49:23.616433	2017-11-10 07:49:23.616433
699	25	2018-01-05	16:00:00	2017-11-10 07:49:23.621262	2017-11-10 07:49:23.621262
700	25	2018-01-06	15:00:00	2017-11-10 07:49:23.626098	2017-11-10 07:49:23.626098
701	25	2018-01-10	15:00:00	2017-11-10 07:49:23.630598	2017-11-10 07:49:23.630598
702	25	2018-01-12	18:00:00	2017-11-10 07:49:23.63514	2017-11-10 07:49:23.63514
703	25	2018-01-13	17:00:00	2017-11-10 07:49:23.639334	2017-11-10 07:49:23.639334
704	25	2018-01-14	18:00:00	2017-11-10 07:49:23.643635	2017-11-10 07:49:23.643635
705	25	2018-01-15	17:00:00	2017-11-10 07:49:23.64786	2017-11-10 07:49:23.64786
706	25	2018-01-16	16:00:00	2017-11-10 07:49:23.652098	2017-11-10 07:49:23.652098
707	25	2018-01-17	16:00:00	2017-11-10 07:49:23.656309	2017-11-10 07:49:23.656309
708	25	2018-01-18	15:00:00	2017-11-10 07:49:23.660899	2017-11-10 07:49:23.660899
709	25	2018-01-19	15:00:00	2017-11-10 07:49:23.665461	2017-11-10 07:49:23.665461
710	25	2018-01-22	17:00:00	2017-11-10 07:49:23.669887	2017-11-10 07:49:23.669887
711	25	2018-01-23	17:00:00	2017-11-10 07:49:23.674049	2017-11-10 07:49:23.674049
712	25	2018-01-25	18:00:00	2017-11-10 07:49:23.678345	2017-11-10 07:49:23.678345
713	25	2018-01-26	16:00:00	2017-11-10 07:49:23.682594	2017-11-10 07:49:23.682594
714	25	2018-01-27	16:00:00	2017-11-10 07:49:23.686812	2017-11-10 07:49:23.686812
715	25	2018-01-28	17:00:00	2017-11-10 07:49:23.690896	2017-11-10 07:49:23.690896
716	25	2018-01-29	15:00:00	2017-11-10 07:49:23.694918	2017-11-10 07:49:23.694918
717	25	2018-01-31	15:00:00	2017-11-10 07:49:23.699104	2017-11-10 07:49:23.699104
718	25	2018-02-01	15:00:00	2017-11-10 07:49:23.70385	2017-11-10 07:49:23.70385
719	25	2018-02-02	15:00:00	2017-11-10 07:49:23.708583	2017-11-10 07:49:23.708583
720	25	2018-02-03	16:00:00	2017-11-10 07:49:23.713562	2017-11-10 07:49:23.713562
721	25	2018-02-07	16:00:00	2017-11-10 07:49:23.718196	2017-11-10 07:49:23.718196
722	25	2018-02-09	18:00:00	2017-11-10 07:49:23.722761	2017-11-10 07:49:23.722761
723	25	2018-02-10	16:00:00	2017-11-10 07:49:23.727494	2017-11-10 07:49:23.727494
724	25	2018-02-11	17:00:00	2017-11-10 07:49:23.731781	2017-11-10 07:49:23.731781
725	25	2018-02-12	17:00:00	2017-11-10 07:49:23.736005	2017-11-10 07:49:23.736005
726	25	2018-02-13	15:00:00	2017-11-10 07:49:23.740207	2017-11-10 07:49:23.740207
727	25	2018-02-14	16:00:00	2017-11-10 07:49:23.744535	2017-11-10 07:49:23.744535
728	25	2018-02-15	15:00:00	2017-11-10 07:49:23.749165	2017-11-10 07:49:23.749165
729	25	2018-02-16	15:00:00	2017-11-10 07:49:23.753776	2017-11-10 07:49:23.753776
730	25	2018-02-19	18:00:00	2017-11-10 07:49:23.759353	2017-11-10 07:49:23.759353
731	25	2018-02-20	18:00:00	2017-11-10 07:49:23.765137	2017-11-10 07:49:23.765137
732	25	2018-02-22	18:00:00	2017-11-10 07:49:23.769683	2017-11-10 07:49:23.769683
733	25	2018-02-23	17:00:00	2017-11-10 07:49:23.774019	2017-11-10 07:49:23.774019
734	25	2018-02-24	16:00:00	2017-11-10 07:49:23.778291	2017-11-10 07:49:23.778291
735	25	2018-02-25	16:00:00	2017-11-10 07:49:23.782582	2017-11-10 07:49:23.782582
736	25	2018-02-26	16:00:00	2017-11-10 07:49:23.786902	2017-11-10 07:49:23.786902
737	25	2018-02-28	15:00:00	2017-11-10 07:49:23.791493	2017-11-10 07:49:23.791493
738	25	2018-03-01	16:00:00	2017-11-10 07:49:23.796713	2017-11-10 07:49:23.796713
739	25	2018-03-02	16:00:00	2017-11-10 07:49:23.801385	2017-11-10 07:49:23.801385
740	25	2018-03-03	16:00:00	2017-11-10 07:49:23.805863	2017-11-10 07:49:23.805863
741	25	2018-03-07	16:00:00	2017-11-10 07:49:23.810324	2017-11-10 07:49:23.810324
742	25	2018-03-09	17:00:00	2017-11-10 07:49:23.814837	2017-11-10 07:49:23.814837
743	25	2018-03-10	17:00:00	2017-11-10 07:49:23.819335	2017-11-10 07:49:23.819335
744	25	2018-03-11	17:00:00	2017-11-10 07:49:23.824005	2017-11-10 07:49:23.824005
745	25	2018-03-12	16:00:00	2017-11-10 07:49:23.828778	2017-11-10 07:49:23.828778
746	25	2018-03-13	15:00:00	2017-11-10 07:49:23.83355	2017-11-10 07:49:23.83355
747	25	2018-03-14	17:00:00	2017-11-10 07:49:23.838652	2017-11-10 07:49:23.838652
748	25	2018-03-15	16:00:00	2017-11-10 07:49:23.843481	2017-11-10 07:49:23.843481
749	25	2018-03-16	15:00:00	2017-11-10 07:49:23.848028	2017-11-10 07:49:23.848028
750	25	2018-03-19	17:00:00	2017-11-10 07:49:23.852357	2017-11-10 07:49:23.852357
751	25	2018-03-20	17:00:00	2017-11-10 07:49:23.856702	2017-11-10 07:49:23.856702
752	25	2018-03-22	17:00:00	2017-11-10 07:49:23.861053	2017-11-10 07:49:23.861053
753	25	2018-03-23	17:00:00	2017-11-10 07:49:23.866869	2017-11-10 07:49:23.866869
754	25	2018-03-24	17:00:00	2017-11-10 07:49:23.872848	2017-11-10 07:49:23.872848
755	25	2018-03-25	17:00:00	2017-11-10 07:49:23.877604	2017-11-10 07:49:23.877604
756	25	2018-03-26	16:00:00	2017-11-10 07:49:23.882826	2017-11-10 07:49:23.882826
757	25	2018-03-28	15:00:00	2017-11-10 07:49:23.887474	2017-11-10 07:49:23.887474
758	25	2018-03-29	15:00:00	2017-11-10 07:49:23.8924	2017-11-10 07:49:23.8924
759	25	2018-03-30	16:00:00	2017-11-10 07:49:23.89699	2017-11-10 07:49:23.89699
760	25	2018-03-31	15:00:00	2017-11-10 07:49:23.901508	2017-11-10 07:49:23.901508
761	25	2018-04-04	16:00:00	2017-11-10 07:49:23.906086	2017-11-10 07:49:23.906086
762	25	2018-04-06	17:00:00	2017-11-10 07:49:23.91066	2017-11-10 07:49:23.91066
763	25	2018-04-07	17:00:00	2017-11-10 07:49:23.914983	2017-11-10 07:49:23.914983
764	25	2018-04-08	17:00:00	2017-11-10 07:49:23.919298	2017-11-10 07:49:23.919298
765	25	2018-04-09	16:00:00	2017-11-10 07:49:23.923533	2017-11-10 07:49:23.923533
766	25	2018-04-10	15:00:00	2017-11-10 07:49:23.929191	2017-11-10 07:49:23.929191
767	25	2018-04-11	17:00:00	2017-11-10 07:49:23.934722	2017-11-10 07:49:23.934722
768	25	2018-04-12	16:00:00	2017-11-10 07:49:23.939728	2017-11-10 07:49:23.939728
769	25	2018-04-13	16:00:00	2017-11-10 07:49:23.944302	2017-11-10 07:49:23.944302
770	25	2018-04-16	18:00:00	2017-11-10 07:49:23.948585	2017-11-10 07:49:23.948585
771	25	2018-04-17	17:00:00	2017-11-10 07:49:23.953459	2017-11-10 07:49:23.953459
772	25	2018-04-19	17:00:00	2017-11-10 07:49:23.957873	2017-11-10 07:49:23.957873
773	25	2018-04-20	17:00:00	2017-11-10 07:49:23.962162	2017-11-10 07:49:23.962162
774	25	2018-04-21	17:00:00	2017-11-10 07:49:23.966316	2017-11-10 07:49:23.966316
775	25	2018-04-22	16:00:00	2017-11-10 07:49:23.971189	2017-11-10 07:49:23.971189
776	25	2018-04-23	15:00:00	2017-11-10 07:49:23.975996	2017-11-10 07:49:23.975996
777	25	2018-04-25	16:00:00	2017-11-10 07:49:23.980447	2017-11-10 07:49:23.980447
778	25	2018-04-26	16:00:00	2017-11-10 07:49:23.985441	2017-11-10 07:49:23.985441
779	25	2018-04-27	15:00:00	2017-11-10 07:49:23.98994	2017-11-10 07:49:23.98994
780	25	2018-04-28	16:00:00	2017-11-10 07:49:23.994606	2017-11-10 07:49:23.994606
781	25	2018-05-02	15:00:00	2017-11-10 07:49:24.000326	2017-11-10 07:49:24.000326
782	25	2018-05-04	17:00:00	2017-11-10 07:49:24.005199	2017-11-10 07:49:24.005199
783	25	2018-05-05	16:00:00	2017-11-10 07:49:24.009857	2017-11-10 07:49:24.009857
784	25	2018-05-06	18:00:00	2017-11-10 07:49:24.014613	2017-11-10 07:49:24.014613
785	25	2018-05-07	17:00:00	2017-11-10 07:49:24.019398	2017-11-10 07:49:24.019398
786	25	2018-05-08	15:00:00	2017-11-10 07:49:24.024049	2017-11-10 07:49:24.024049
787	25	2018-05-09	17:00:00	2017-11-10 07:49:24.028647	2017-11-10 07:49:24.028647
788	25	2018-05-10	16:00:00	2017-11-10 07:49:24.033723	2017-11-10 07:49:24.033723
789	25	2018-05-11	15:00:00	2017-11-10 07:49:24.03837	2017-11-10 07:49:24.03837
790	25	2018-05-14	18:00:00	2017-11-10 07:49:24.042457	2017-11-10 07:49:24.042457
791	25	2018-05-15	18:00:00	2017-11-10 07:49:24.046492	2017-11-10 07:49:24.046492
792	25	2018-05-17	17:00:00	2017-11-10 07:49:24.051215	2017-11-10 07:49:24.051215
793	25	2018-05-18	17:00:00	2017-11-10 07:49:24.055729	2017-11-10 07:49:24.055729
794	25	2018-05-19	16:00:00	2017-11-10 07:49:24.060458	2017-11-10 07:49:24.060458
795	25	2018-05-20	17:00:00	2017-11-10 07:49:24.065116	2017-11-10 07:49:24.065116
796	25	2018-05-21	16:00:00	2017-11-10 07:49:24.069568	2017-11-10 07:49:24.069568
797	25	2018-05-23	16:00:00	2017-11-10 07:49:24.073985	2017-11-10 07:49:24.073985
798	25	2018-05-24	16:00:00	2017-11-10 07:49:24.07832	2017-11-10 07:49:24.07832
799	25	2018-05-25	15:00:00	2017-11-10 07:49:24.08272	2017-11-10 07:49:24.08272
800	25	2018-05-26	15:00:00	2017-11-10 07:49:24.087138	2017-11-10 07:49:24.087138
801	25	2018-05-30	15:00:00	2017-11-10 07:49:24.091757	2017-11-10 07:49:24.091757
802	25	2018-06-01	17:00:00	2017-11-10 07:49:24.096211	2017-11-10 07:49:24.096211
803	25	2018-06-02	17:00:00	2017-11-10 07:49:24.100722	2017-11-10 07:49:24.100722
804	25	2018-06-03	17:00:00	2017-11-10 07:49:24.105557	2017-11-10 07:49:24.105557
805	25	2018-06-04	16:00:00	2017-11-10 07:49:24.110401	2017-11-10 07:49:24.110401
806	25	2018-06-05	15:00:00	2017-11-10 07:49:24.115151	2017-11-10 07:49:24.115151
807	25	2018-06-06	16:00:00	2017-11-10 07:49:24.119486	2017-11-10 07:49:24.119486
808	25	2018-06-07	15:00:00	2017-11-10 07:49:24.123604	2017-11-10 07:49:24.123604
809	25	2018-06-08	15:00:00	2017-11-10 07:49:24.127674	2017-11-10 07:49:24.127674
810	25	2018-06-11	18:00:00	2017-11-10 07:49:24.131781	2017-11-10 07:49:24.131781
811	25	2018-06-12	17:00:00	2017-11-10 07:49:24.136836	2017-11-10 07:49:24.136836
812	25	2018-06-14	18:00:00	2017-11-10 07:49:24.141324	2017-11-10 07:49:24.141324
813	25	2018-06-15	16:00:00	2017-11-10 07:49:24.145575	2017-11-10 07:49:24.145575
814	25	2018-06-16	17:00:00	2017-11-10 07:49:24.149829	2017-11-10 07:49:24.149829
815	25	2018-06-17	16:00:00	2017-11-10 07:49:24.154255	2017-11-10 07:49:24.154255
816	25	2018-06-18	16:00:00	2017-11-10 07:49:24.158519	2017-11-10 07:49:24.158519
817	25	2018-06-20	15:00:00	2017-11-10 07:49:24.162903	2017-11-10 07:49:24.162903
818	25	2018-06-21	16:00:00	2017-11-10 07:49:24.167067	2017-11-10 07:49:24.167067
819	25	2018-06-22	16:00:00	2017-11-10 07:49:24.171107	2017-11-10 07:49:24.171107
820	25	2018-06-23	16:00:00	2017-11-10 07:49:24.17518	2017-11-10 07:49:24.17518
821	25	2018-06-27	16:00:00	2017-11-10 07:49:24.179245	2017-11-10 07:49:24.179245
822	25	2018-06-29	17:00:00	2017-11-10 07:49:24.18327	2017-11-10 07:49:24.18327
823	25	2018-06-30	16:00:00	2017-11-10 07:49:24.187531	2017-11-10 07:49:24.187531
824	25	2018-07-01	18:00:00	2017-11-10 07:49:24.192557	2017-11-10 07:49:24.192557
825	25	2018-07-02	17:00:00	2017-11-10 07:49:24.198047	2017-11-10 07:49:24.198047
826	25	2018-07-03	16:00:00	2017-11-10 07:49:24.204255	2017-11-10 07:49:24.204255
827	25	2018-07-04	17:00:00	2017-11-10 07:49:24.210231	2017-11-10 07:49:24.210231
828	25	2018-07-05	16:00:00	2017-11-10 07:49:24.215218	2017-11-10 07:49:24.215218
829	25	2018-07-06	16:00:00	2017-11-10 07:49:24.219713	2017-11-10 07:49:24.219713
830	25	2018-07-09	17:00:00	2017-11-10 07:49:24.224214	2017-11-10 07:49:24.224214
831	25	2018-07-10	18:00:00	2017-11-10 07:49:24.228713	2017-11-10 07:49:24.228713
832	25	2018-07-12	17:00:00	2017-11-10 07:49:24.233154	2017-11-10 07:49:24.233154
833	25	2018-07-13	17:00:00	2017-11-10 07:49:24.237744	2017-11-10 07:49:24.237744
834	25	2018-07-14	16:00:00	2017-11-10 07:49:24.242698	2017-11-10 07:49:24.242698
835	25	2018-07-15	16:00:00	2017-11-10 07:49:24.247563	2017-11-10 07:49:24.247563
836	25	2018-07-16	15:00:00	2017-11-10 07:49:24.252532	2017-11-10 07:49:24.252532
837	25	2018-07-18	16:00:00	2017-11-10 07:49:24.256879	2017-11-10 07:49:24.256879
838	25	2018-07-19	16:00:00	2017-11-10 07:49:24.261139	2017-11-10 07:49:24.261139
839	25	2018-07-20	15:00:00	2017-11-10 07:49:24.265341	2017-11-10 07:49:24.265341
840	25	2018-07-21	15:00:00	2017-11-10 07:49:24.269644	2017-11-10 07:49:24.269644
841	25	2018-07-25	15:00:00	2017-11-10 07:49:24.274131	2017-11-10 07:49:24.274131
842	25	2018-07-27	18:00:00	2017-11-10 07:49:24.278391	2017-11-10 07:49:24.278391
843	25	2018-07-28	16:00:00	2017-11-10 07:49:24.282531	2017-11-10 07:49:24.282531
844	25	2018-07-29	18:00:00	2017-11-10 07:49:24.287207	2017-11-10 07:49:24.287207
845	25	2018-07-30	17:00:00	2017-11-10 07:49:24.292197	2017-11-10 07:49:24.292197
846	25	2018-07-31	15:00:00	2017-11-10 07:49:24.296774	2017-11-10 07:49:24.296774
847	25	2018-08-01	17:00:00	2017-11-10 07:49:24.301544	2017-11-10 07:49:24.301544
848	25	2018-08-02	15:00:00	2017-11-10 07:49:24.306171	2017-11-10 07:49:24.306171
849	25	2018-08-03	15:00:00	2017-11-10 07:49:24.310649	2017-11-10 07:49:24.310649
850	25	2018-08-06	17:00:00	2017-11-10 07:49:24.315052	2017-11-10 07:49:24.315052
851	25	2018-08-07	18:00:00	2017-11-10 07:49:24.319725	2017-11-10 07:49:24.319725
852	25	2018-08-09	18:00:00	2017-11-10 07:49:24.32423	2017-11-10 07:49:24.32423
853	25	2018-08-10	16:00:00	2017-11-10 07:49:24.328522	2017-11-10 07:49:24.328522
854	25	2018-08-11	17:00:00	2017-11-10 07:49:24.3329	2017-11-10 07:49:24.3329
855	25	2018-08-12	16:00:00	2017-11-10 07:49:24.337647	2017-11-10 07:49:24.337647
856	25	2018-08-13	16:00:00	2017-11-10 07:49:24.342228	2017-11-10 07:49:24.342228
857	25	2018-08-15	16:00:00	2017-11-10 07:49:24.347254	2017-11-10 07:49:24.347254
858	25	2018-08-16	16:00:00	2017-11-10 07:49:24.351718	2017-11-10 07:49:24.351718
859	25	2018-08-17	15:00:00	2017-11-10 07:49:24.356148	2017-11-10 07:49:24.356148
860	25	2018-08-18	15:00:00	2017-11-10 07:49:24.360814	2017-11-10 07:49:24.360814
861	25	2018-08-22	15:00:00	2017-11-10 07:49:24.365391	2017-11-10 07:49:24.365391
862	25	2018-08-24	18:00:00	2017-11-10 07:49:24.369707	2017-11-10 07:49:24.369707
863	25	2018-08-25	16:00:00	2017-11-10 07:49:24.373801	2017-11-10 07:49:24.373801
864	25	2018-08-26	17:00:00	2017-11-10 07:49:24.378337	2017-11-10 07:49:24.378337
865	25	2018-08-27	17:00:00	2017-11-10 07:49:24.383549	2017-11-10 07:49:24.383549
866	25	2018-08-28	15:00:00	2017-11-10 07:49:24.387848	2017-11-10 07:49:24.387848
867	25	2018-08-29	17:00:00	2017-11-10 07:49:24.39216	2017-11-10 07:49:24.39216
868	25	2018-08-30	15:00:00	2017-11-10 07:49:24.396308	2017-11-10 07:49:24.396308
869	25	2018-08-31	15:00:00	2017-11-10 07:49:24.402934	2017-11-10 07:49:24.402934
870	25	2018-09-03	18:00:00	2017-11-10 07:49:24.407311	2017-11-10 07:49:24.407311
871	25	2018-09-04	17:00:00	2017-11-10 07:49:24.41164	2017-11-10 07:49:24.41164
872	25	2018-09-06	18:00:00	2017-11-10 07:49:24.415732	2017-11-10 07:49:24.415732
873	25	2018-09-07	16:00:00	2017-11-10 07:49:24.419877	2017-11-10 07:49:24.419877
874	25	2018-09-08	16:00:00	2017-11-10 07:49:24.424381	2017-11-10 07:49:24.424381
875	25	2018-09-09	16:00:00	2017-11-10 07:49:24.428805	2017-11-10 07:49:24.428805
876	25	2018-09-10	15:00:00	2017-11-10 07:49:24.433251	2017-11-10 07:49:24.433251
877	25	2018-09-12	16:00:00	2017-11-10 07:49:24.437644	2017-11-10 07:49:24.437644
878	25	2018-09-13	16:00:00	2017-11-10 07:49:24.441896	2017-11-10 07:49:24.441896
879	25	2018-09-14	15:00:00	2017-11-10 07:49:24.446735	2017-11-10 07:49:24.446735
880	25	2018-09-15	15:00:00	2017-11-10 07:49:24.451288	2017-11-10 07:49:24.451288
881	25	2018-09-19	16:00:00	2017-11-10 07:49:24.455708	2017-11-10 07:49:24.455708
882	25	2018-09-21	18:00:00	2017-11-10 07:49:24.460151	2017-11-10 07:49:24.460151
883	25	2018-09-22	17:00:00	2017-11-10 07:49:24.464438	2017-11-10 07:49:24.464438
884	25	2018-09-23	17:00:00	2017-11-10 07:49:24.469381	2017-11-10 07:49:24.469381
885	25	2018-09-24	16:00:00	2017-11-10 07:49:24.474	2017-11-10 07:49:24.474
886	25	2018-09-25	16:00:00	2017-11-10 07:49:24.478294	2017-11-10 07:49:24.478294
887	25	2018-09-26	16:00:00	2017-11-10 07:49:24.482718	2017-11-10 07:49:24.482718
888	25	2018-09-27	15:00:00	2017-11-10 07:49:24.487471	2017-11-10 07:49:24.487471
889	25	2018-09-28	16:00:00	2017-11-10 07:49:24.491962	2017-11-10 07:49:24.491962
890	25	2018-10-01	18:00:00	2017-11-10 07:49:24.496303	2017-11-10 07:49:24.496303
\.


--
-- Name: shift_breaks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: coke
--

SELECT pg_catalog.setval('public.shift_breaks_id_seq', 890, true);


--
-- Data for Name: sps; Type: TABLE DATA; Schema: public; Owner: coke
--

COPY public.sps (id, store_id, department_id, date, year, month, week, dow, sale, created_at, updated_at) FROM stdin;
365	1	1	2018-01-01	2018	1	1	1	9164359	2018-02-28 07:06:58.822045	2018-02-28 07:06:58.822045
366	1	1	2018-01-02	2018	1	1	2	12019657	2018-02-28 07:06:58.834394	2018-02-28 07:06:58.834394
367	1	1	2018-01-03	2018	1	1	3	11074253	2018-02-28 07:06:58.845199	2018-02-28 07:06:58.845199
368	1	1	2018-01-04	2018	1	1	4	14601180	2018-02-28 07:06:58.856009	2018-02-28 07:06:58.856009
369	1	1	2018-01-05	2018	1	1	5	11820190	2018-02-28 07:06:58.868616	2018-02-28 07:06:58.868616
370	1	1	2018-01-06	2018	1	1	6	21965683	2018-02-28 07:06:58.882917	2018-02-28 07:06:58.882917
371	1	1	2018-01-07	2018	1	1	7	23753051	2018-02-28 07:06:58.891973	2018-02-28 07:06:58.891973
372	1	1	2018-01-08	2018	1	2	1	13157756	2018-02-28 07:06:58.899969	2018-02-28 07:06:58.899969
373	1	1	2018-01-09	2018	1	2	2	12270990	2018-02-28 07:06:58.907608	2018-02-28 07:06:58.907608
374	1	1	2018-01-10	2018	1	2	3	9987539	2018-02-28 07:06:58.915172	2018-02-28 07:06:58.915172
375	1	1	2018-01-11	2018	1	2	4	13187647	2018-02-28 07:06:58.922834	2018-02-28 07:06:58.922834
376	1	1	2018-01-12	2018	1	2	5	10324531	2018-02-28 07:06:58.931384	2018-02-28 07:06:58.931384
377	1	1	2018-01-13	2018	1	2	6	24054876	2018-02-28 07:06:58.937694	2018-02-28 07:06:58.937694
378	1	1	2018-01-14	2018	1	2	7	21573173	2018-02-28 07:06:58.943109	2018-02-28 07:06:58.943109
379	1	1	2018-01-15	2018	1	3	1	11170909	2018-02-28 07:06:58.948118	2018-02-28 07:06:58.948118
380	1	1	2018-01-16	2018	1	3	2	8019977	2018-02-28 07:06:58.953181	2018-02-28 07:06:58.953181
381	1	1	2018-01-17	2018	1	3	3	11743090	2018-02-28 07:06:58.958291	2018-02-28 07:06:58.958291
382	1	1	2018-01-18	2018	1	3	4	11169996	2018-02-28 07:06:58.963404	2018-02-28 07:06:58.963404
383	1	1	2018-01-19	2018	1	3	5	12052245	2018-02-28 07:06:58.968964	2018-02-28 07:06:58.968964
384	1	1	2018-01-20	2018	1	3	6	21203079	2018-02-28 07:06:58.975021	2018-02-28 07:06:58.975021
385	1	1	2018-01-21	2018	1	3	7	20795375	2018-02-28 07:06:58.98081	2018-02-28 07:06:58.98081
386	1	1	2018-01-22	2018	1	4	1	12947870	2018-02-28 07:06:58.986456	2018-02-28 07:06:58.986456
387	1	1	2018-01-23	2018	1	4	2	11133949	2018-02-28 07:06:58.991903	2018-02-28 07:06:58.991903
388	1	1	2018-01-24	2018	1	4	3	12552069	2018-02-28 07:06:58.997217	2018-02-28 07:06:58.997217
389	1	1	2018-01-25	2018	1	4	4	12184805	2018-02-28 07:06:59.00263	2018-02-28 07:06:59.00263
390	1	1	2018-01-26	2018	1	4	5	10449099	2018-02-28 07:06:59.007702	2018-02-28 07:06:59.007702
391	1	1	2018-01-27	2018	1	4	6	23306002	2018-02-28 07:06:59.012708	2018-02-28 07:06:59.012708
392	1	1	2018-01-28	2018	1	4	7	20206657	2018-02-28 07:06:59.018244	2018-02-28 07:06:59.018244
393	1	1	2018-01-29	2018	2	1	1	17265233	2018-02-28 07:06:59.023679	2018-02-28 07:06:59.023679
394	1	1	2018-01-30	2018	2	1	2	14928378	2018-02-28 07:06:59.029503	2018-02-28 07:06:59.029503
395	1	1	2018-01-31	2018	2	1	3	14328452	2018-02-28 07:06:59.036898	2018-02-28 07:06:59.036898
396	1	1	2018-02-01	2018	2	1	4	17782517	2018-02-28 07:06:59.042728	2018-02-28 07:06:59.042728
397	1	1	2018-02-02	2018	2	1	5	16432814	2018-02-28 07:06:59.048679	2018-02-28 07:06:59.048679
398	1	1	2018-02-03	2018	2	1	6	19897375	2018-02-28 07:06:59.054684	2018-02-28 07:06:59.054684
399	1	1	2018-02-04	2018	2	1	7	18867081	2018-02-28 07:06:59.060214	2018-02-28 07:06:59.060214
400	1	1	2018-02-05	2018	2	2	1	39494367	2018-02-28 07:06:59.066475	2018-02-28 07:06:59.066475
401	1	1	2018-02-06	2018	2	2	2	36389151	2018-02-28 07:06:59.072862	2018-02-28 07:06:59.072862
402	1	1	2018-02-07	2018	2	2	3	18144944	2018-02-28 07:06:59.079082	2018-02-28 07:06:59.079082
403	1	1	2018-02-08	2018	2	2	4	14766229	2018-02-28 07:06:59.084957	2018-02-28 07:06:59.084957
404	1	1	2018-02-09	2018	2	2	5	15967854	2018-02-28 07:06:59.090621	2018-02-28 07:06:59.090621
405	1	1	2018-02-10	2018	2	2	6	18203423	2018-02-28 07:06:59.096507	2018-02-28 07:06:59.096507
406	1	1	2018-02-11	2018	2	2	7	17864094	2018-02-28 07:06:59.10205	2018-02-28 07:06:59.10205
407	1	1	2018-02-12	2018	2	3	1	36732530	2018-02-28 07:06:59.107876	2018-02-28 07:06:59.107876
408	1	1	2018-02-13	2018	2	3	2	40345955	2018-02-28 07:06:59.113774	2018-02-28 07:06:59.113774
409	1	1	2018-02-14	2018	2	3	3	15094955	2018-02-28 07:06:59.119761	2018-02-28 07:06:59.119761
410	1	1	2018-02-15	2018	2	3	4	16564403	2018-02-28 07:06:59.125301	2018-02-28 07:06:59.125301
411	1	1	2018-02-16	2018	2	3	5	16543328	2018-02-28 07:06:59.130898	2018-02-28 07:06:59.130898
412	1	1	2018-02-17	2018	2	3	6	16076342	2018-02-28 07:06:59.136571	2018-02-28 07:06:59.136571
413	1	1	2018-02-18	2018	2	3	7	18551777	2018-02-28 07:06:59.141928	2018-02-28 07:06:59.141928
414	1	1	2018-02-19	2018	2	4	1	43578293	2018-02-28 07:06:59.147406	2018-02-28 07:06:59.147406
415	1	1	2018-02-20	2018	2	4	2	32076420	2018-02-28 07:06:59.153263	2018-02-28 07:06:59.153263
416	1	1	2018-02-21	2018	2	4	3	15259241	2018-02-28 07:06:59.15902	2018-02-28 07:06:59.15902
417	1	1	2018-02-22	2018	2	4	4	17166525	2018-02-28 07:06:59.164441	2018-02-28 07:06:59.164441
418	1	1	2018-02-23	2018	2	4	5	16072182	2018-02-28 07:06:59.170177	2018-02-28 07:06:59.170177
419	1	1	2018-02-24	2018	2	4	6	14697093	2018-02-28 07:06:59.176367	2018-02-28 07:06:59.176367
420	1	1	2018-02-25	2018	2	4	7	16341502	2018-02-28 07:06:59.182915	2018-02-28 07:06:59.182915
421	1	1	2018-02-26	2018	3	1	1	34957568	2018-02-28 07:06:59.190417	2018-02-28 07:06:59.190417
422	1	1	2018-02-27	2018	3	1	2	31797273	2018-02-28 07:06:59.19689	2018-02-28 07:06:59.19689
423	1	1	2018-02-28	2018	3	1	3	14393883	2018-02-28 07:06:59.203866	2018-02-28 07:06:59.203866
424	1	1	2018-03-01	2018	3	1	4	17106691	2018-02-28 07:06:59.210605	2018-02-28 07:06:59.210605
425	1	1	2018-03-02	2018	3	1	5	13491622	2018-02-28 07:06:59.217245	2018-02-28 07:06:59.217245
426	1	1	2018-03-03	2018	3	1	6	10633793	2018-02-28 07:06:59.223579	2018-02-28 07:06:59.223579
427	1	1	2018-03-04	2018	3	1	7	14719347	2018-02-28 07:06:59.230067	2018-02-28 07:06:59.230067
428	1	1	2018-03-05	2018	3	2	1	12933167	2018-02-28 07:06:59.237148	2018-02-28 07:06:59.237148
429	1	1	2018-03-06	2018	3	2	2	13728530	2018-02-28 07:06:59.243821	2018-02-28 07:06:59.243821
430	1	1	2018-03-07	2018	3	2	3	6106065	2018-02-28 07:06:59.25068	2018-02-28 07:06:59.25068
431	1	1	2018-03-08	2018	3	2	4	5860476	2018-02-28 07:06:59.257628	2018-02-28 07:06:59.257628
432	1	1	2018-03-09	2018	3	2	5	13616036	2018-02-28 07:06:59.264514	2018-02-28 07:06:59.264514
433	1	1	2018-03-10	2018	3	2	6	14060033	2018-02-28 07:06:59.270801	2018-02-28 07:06:59.270801
434	1	1	2018-03-11	2018	3	2	7	14301960	2018-02-28 07:06:59.27733	2018-02-28 07:06:59.27733
435	1	1	2018-03-12	2018	3	3	1	11218675	2018-02-28 07:06:59.283654	2018-02-28 07:06:59.283654
436	1	1	2018-03-13	2018	3	3	2	13641638	2018-02-28 07:06:59.289465	2018-02-28 07:06:59.289465
437	1	1	2018-03-14	2018	3	3	3	5992183	2018-02-28 07:06:59.296602	2018-02-28 07:06:59.296602
438	1	1	2018-03-15	2018	3	3	4	5343636	2018-02-28 07:06:59.302621	2018-02-28 07:06:59.302621
439	1	1	2018-03-16	2018	3	3	5	11380495	2018-02-28 07:06:59.307884	2018-02-28 07:06:59.307884
440	1	1	2018-03-17	2018	3	3	6	13943781	2018-02-28 07:06:59.31309	2018-02-28 07:06:59.31309
441	1	1	2018-03-18	2018	3	3	7	12652980	2018-02-28 07:06:59.317983	2018-02-28 07:06:59.317983
442	1	1	2018-03-19	2018	3	4	1	10411336	2018-02-28 07:06:59.323031	2018-02-28 07:06:59.323031
443	1	1	2018-03-20	2018	3	4	2	12029825	2018-02-28 07:06:59.328198	2018-02-28 07:06:59.328198
444	1	1	2018-03-21	2018	3	4	3	6754789	2018-02-28 07:06:59.333332	2018-02-28 07:06:59.333332
445	1	1	2018-03-22	2018	3	4	4	7326726	2018-02-28 07:06:59.341509	2018-02-28 07:06:59.341509
446	1	1	2018-03-23	2018	3	4	5	15619743	2018-02-28 07:06:59.34725	2018-02-28 07:06:59.34725
447	1	1	2018-03-24	2018	3	4	6	9941043	2018-02-28 07:06:59.352587	2018-02-28 07:06:59.352587
448	1	1	2018-03-25	2018	3	4	7	14383555	2018-02-28 07:06:59.357982	2018-02-28 07:06:59.357982
449	1	1	2018-03-26	2018	3	5	1	12134411	2018-02-28 07:06:59.363101	2018-02-28 07:06:59.363101
450	1	1	2018-03-27	2018	3	5	2	14543055	2018-02-28 07:06:59.36828	2018-02-28 07:06:59.36828
451	1	1	2018-03-28	2018	3	5	3	5862664	2018-02-28 07:06:59.373698	2018-02-28 07:06:59.373698
452	1	1	2018-03-29	2018	3	5	4	4676337	2018-02-28 07:06:59.379368	2018-02-28 07:06:59.379368
453	1	1	2018-03-30	2018	3	5	5	10138962	2018-02-28 07:06:59.385278	2018-02-28 07:06:59.385278
454	1	1	2018-03-31	2018	3	5	6	13763000	2018-02-28 07:06:59.390498	2018-02-28 07:06:59.390498
455	1	1	2018-04-01	2018	3	5	7	11736479	2018-02-28 07:06:59.395429	2018-02-28 07:06:59.395429
456	1	1	2018-04-02	2018	4	1	1	19462145	2018-02-28 07:06:59.400519	2018-02-28 07:06:59.400519
457	1	1	2018-04-03	2018	4	1	2	19219048	2018-02-28 07:06:59.405461	2018-02-28 07:06:59.405461
458	1	1	2018-04-04	2018	4	1	3	17666198	2018-02-28 07:06:59.410236	2018-02-28 07:06:59.410236
459	1	1	2018-04-05	2018	4	1	4	14250325	2018-02-28 07:06:59.415371	2018-02-28 07:06:59.415371
460	1	1	2018-04-06	2018	4	1	5	9832500	2018-02-28 07:06:59.420739	2018-02-28 07:06:59.420739
461	1	1	2018-04-07	2018	4	1	6	9355358	2018-02-28 07:06:59.427171	2018-02-28 07:06:59.427171
462	1	1	2018-04-08	2018	4	1	7	19096905	2018-02-28 07:06:59.43298	2018-02-28 07:06:59.43298
463	1	1	2018-04-09	2018	4	2	1	22693371	2018-02-28 07:06:59.438697	2018-02-28 07:06:59.438697
464	1	1	2018-04-10	2018	4	2	2	22986093	2018-02-28 07:06:59.444464	2018-02-28 07:06:59.444464
465	1	1	2018-04-11	2018	4	2	3	17672625	2018-02-28 07:06:59.449706	2018-02-28 07:06:59.449706
466	1	1	2018-04-12	2018	4	2	4	15109480	2018-02-28 07:06:59.455018	2018-02-28 07:06:59.455018
467	1	1	2018-04-13	2018	4	2	5	10112667	2018-02-28 07:06:59.46017	2018-02-28 07:06:59.46017
468	1	1	2018-04-14	2018	4	2	6	6599647	2018-02-28 07:06:59.465431	2018-02-28 07:06:59.465431
469	1	1	2018-04-15	2018	4	2	7	20330932	2018-02-28 07:06:59.470856	2018-02-28 07:06:59.470856
470	1	1	2018-04-16	2018	4	3	1	20478536	2018-02-28 07:06:59.477145	2018-02-28 07:06:59.477145
471	1	1	2018-04-17	2018	4	3	2	19354699	2018-02-28 07:06:59.483051	2018-02-28 07:06:59.483051
472	1	1	2018-04-18	2018	4	3	3	16608363	2018-02-28 07:06:59.4891	2018-02-28 07:06:59.4891
473	1	1	2018-04-19	2018	4	3	4	20440488	2018-02-28 07:06:59.49475	2018-02-28 07:06:59.49475
474	1	1	2018-04-20	2018	4	3	5	8200986	2018-02-28 07:06:59.500204	2018-02-28 07:06:59.500204
475	1	1	2018-04-21	2018	4	3	6	11224230	2018-02-28 07:06:59.505586	2018-02-28 07:06:59.505586
476	1	1	2018-04-22	2018	4	3	7	19735050	2018-02-28 07:06:59.511301	2018-02-28 07:06:59.511301
477	1	1	2018-04-23	2018	4	4	1	17569360	2018-02-28 07:06:59.517105	2018-02-28 07:06:59.517105
478	1	1	2018-04-24	2018	4	4	2	20951701	2018-02-28 07:06:59.522514	2018-02-28 07:06:59.522514
479	1	1	2018-04-25	2018	4	4	3	21812571	2018-02-28 07:06:59.528036	2018-02-28 07:06:59.528036
480	1	1	2018-04-26	2018	4	4	4	20740915	2018-02-28 07:06:59.533599	2018-02-28 07:06:59.533599
481	1	1	2018-04-27	2018	4	4	5	11941830	2018-02-28 07:06:59.538904	2018-02-28 07:06:59.538904
482	1	1	2018-04-28	2018	4	4	6	11029383	2018-02-28 07:06:59.54481	2018-02-28 07:06:59.54481
483	1	1	2018-04-29	2018	4	4	7	15847944	2018-02-28 07:06:59.550764	2018-02-28 07:06:59.550764
519	1	1	2018-06-04	2018	6	1	1	15995489	2018-02-28 07:06:59.749523	2018-02-28 07:06:59.749523
520	1	1	2018-06-05	2018	6	1	2	19547597	2018-02-28 07:06:59.758002	2018-02-28 07:06:59.758002
521	1	1	2018-06-06	2018	6	1	3	34103287	2018-02-28 07:06:59.763332	2018-02-28 07:06:59.763332
522	1	1	2018-06-07	2018	6	1	4	35117519	2018-02-28 07:06:59.768867	2018-02-28 07:06:59.768867
523	1	1	2018-06-08	2018	6	1	5	19587047	2018-02-28 07:06:59.774729	2018-02-28 07:06:59.774729
524	1	1	2018-06-09	2018	6	1	6	16279617	2018-02-28 07:06:59.780422	2018-02-28 07:06:59.780422
525	1	1	2018-06-10	2018	6	1	7	18435859	2018-02-28 07:06:59.78619	2018-02-28 07:06:59.78619
526	1	1	2018-06-11	2018	6	2	1	17108246	2018-02-28 07:06:59.792036	2018-02-28 07:06:59.792036
527	1	1	2018-06-12	2018	6	2	2	17067993	2018-02-28 07:06:59.79874	2018-02-28 07:06:59.79874
528	1	1	2018-06-13	2018	6	2	3	38111182	2018-02-28 07:06:59.805129	2018-02-28 07:06:59.805129
529	1	1	2018-06-14	2018	6	2	4	33775942	2018-02-28 07:06:59.811317	2018-02-28 07:06:59.811317
530	1	1	2018-06-15	2018	6	2	5	17479299	2018-02-28 07:06:59.817246	2018-02-28 07:06:59.817246
531	1	1	2018-06-16	2018	6	2	6	16318955	2018-02-28 07:06:59.823396	2018-02-28 07:06:59.823396
532	1	1	2018-06-17	2018	6	2	7	16784613	2018-02-28 07:06:59.829289	2018-02-28 07:06:59.829289
533	1	1	2018-06-18	2018	6	3	1	17026833	2018-02-28 07:06:59.835178	2018-02-28 07:06:59.835178
534	1	1	2018-06-19	2018	6	3	2	21024801	2018-02-28 07:06:59.841287	2018-02-28 07:06:59.841287
535	1	1	2018-06-20	2018	6	3	3	32885441	2018-02-28 07:06:59.847265	2018-02-28 07:06:59.847265
536	1	1	2018-06-21	2018	6	3	4	27450762	2018-02-28 07:06:59.852859	2018-02-28 07:06:59.852859
537	1	1	2018-06-22	2018	6	3	5	16579574	2018-02-28 07:06:59.858562	2018-02-28 07:06:59.858562
538	1	1	2018-06-23	2018	6	3	6	17441893	2018-02-28 07:06:59.86442	2018-02-28 07:06:59.86442
539	1	1	2018-06-24	2018	6	3	7	16512563	2018-02-28 07:06:59.870246	2018-02-28 07:06:59.870246
540	1	1	2018-06-25	2018	6	4	1	16535989	2018-02-28 07:06:59.875886	2018-02-28 07:06:59.875886
498	1	1	2018-05-14	2018	5	3	1	22659900	2018-02-28 07:06:59.635893	2018-02-28 07:06:59.635893
497	1	1	2018-05-13	2018	5	2	7	11850419	2018-02-28 07:06:59.631025	2018-02-28 07:06:59.631025
496	1	1	2018-05-12	2018	5	2	6	8724856	2018-02-28 07:06:59.626059	2018-02-28 07:06:59.626059
495	1	1	2018-05-11	2018	5	2	5	9211675	2018-02-28 07:06:59.621173	2018-02-28 07:06:59.621173
491	1	1	2018-05-07	2018	5	2	1	24327775	2018-02-28 07:06:59.598081	2018-02-28 07:06:59.598081
492	1	1	2018-05-08	2018	5	2	2	22035895	2018-02-28 07:06:59.603586	2018-02-28 07:06:59.603586
493	1	1	2018-05-09	2018	5	2	3	13131749	2018-02-28 07:06:59.6095	2018-02-28 07:06:59.6095
511	1	1	2018-05-27	2018	5	4	7	11666603	2018-02-28 07:06:59.706129	2018-02-28 07:06:59.706129
512	1	1	2018-05-28	2018	5	5	1	23653412	2018-02-28 07:06:59.711668	2018-02-28 07:06:59.711668
509	1	1	2018-05-25	2018	5	4	5	12335248	2018-02-28 07:06:59.695008	2018-02-28 07:06:59.695008
510	1	1	2018-05-26	2018	5	4	6	10641317	2018-02-28 07:06:59.700614	2018-02-28 07:06:59.700614
507	1	1	2018-05-23	2018	5	4	3	11102821	2018-02-28 07:06:59.684289	2018-02-28 07:06:59.684289
508	1	1	2018-05-24	2018	5	4	4	10377274	2018-02-28 07:06:59.689711	2018-02-28 07:06:59.689711
505	1	1	2018-05-21	2018	5	4	1	23831543	2018-02-28 07:06:59.673273	2018-02-28 07:06:59.673273
506	1	1	2018-05-22	2018	5	4	2	18879587	2018-02-28 07:06:59.678823	2018-02-28 07:06:59.678823
541	1	1	2018-06-26	2018	6	4	2	20066253	2018-02-28 07:06:59.88156	2018-02-28 07:06:59.88156
542	1	1	2018-06-27	2018	6	4	3	41435355	2018-02-28 07:06:59.888364	2018-02-28 07:06:59.888364
543	1	1	2018-06-28	2018	6	4	4	32622363	2018-02-28 07:06:59.897893	2018-02-28 07:06:59.897893
544	1	1	2018-06-29	2018	6	4	5	17332572	2018-02-28 07:06:59.907179	2018-02-28 07:06:59.907179
545	1	1	2018-06-30	2018	6	4	6	16004309	2018-02-28 07:06:59.915335	2018-02-28 07:06:59.915335
546	1	1	2018-07-01	2018	6	4	7	14312986	2018-02-28 07:06:59.923056	2018-02-28 07:06:59.923056
547	1	1	2018-07-02	2018	7	1	1	13219670	2018-02-28 07:06:59.929654	2018-02-28 07:06:59.929654
548	1	1	2018-07-03	2018	7	1	2	12616820	2018-02-28 07:06:59.936452	2018-02-28 07:06:59.936452
549	1	1	2018-07-04	2018	7	1	3	12037097	2018-02-28 07:06:59.946121	2018-02-28 07:06:59.946121
550	1	1	2018-07-05	2018	7	1	4	13820020	2018-02-28 07:06:59.954816	2018-02-28 07:06:59.954816
551	1	1	2018-07-06	2018	7	1	5	5974765	2018-02-28 07:06:59.963126	2018-02-28 07:06:59.963126
552	1	1	2018-07-07	2018	7	1	6	6534359	2018-02-28 07:06:59.97078	2018-02-28 07:06:59.97078
553	1	1	2018-07-08	2018	7	1	7	13397529	2018-02-28 07:06:59.977621	2018-02-28 07:06:59.977621
554	1	1	2018-07-09	2018	7	2	1	12551171	2018-02-28 07:06:59.9847	2018-02-28 07:06:59.9847
555	1	1	2018-07-10	2018	7	2	2	12730776	2018-02-28 07:06:59.991686	2018-02-28 07:06:59.991686
556	1	1	2018-07-11	2018	7	2	3	11243381	2018-02-28 07:06:59.997183	2018-02-28 07:06:59.997183
557	1	1	2018-07-12	2018	7	2	4	13125732	2018-02-28 07:07:00.00239	2018-02-28 07:07:00.00239
558	1	1	2018-07-13	2018	7	2	5	5935734	2018-02-28 07:07:00.007562	2018-02-28 07:07:00.007562
559	1	1	2018-07-14	2018	7	2	6	5436692	2018-02-28 07:07:00.012908	2018-02-28 07:07:00.012908
560	1	1	2018-07-15	2018	7	2	7	13607203	2018-02-28 07:07:00.018404	2018-02-28 07:07:00.018404
561	1	1	2018-07-16	2018	7	3	1	11663669	2018-02-28 07:07:00.024363	2018-02-28 07:07:00.024363
562	1	1	2018-07-17	2018	7	3	2	11055479	2018-02-28 07:07:00.030266	2018-02-28 07:07:00.030266
563	1	1	2018-07-18	2018	7	3	3	10731422	2018-02-28 07:07:00.036284	2018-02-28 07:07:00.036284
564	1	1	2018-07-19	2018	7	3	4	13653261	2018-02-28 07:07:00.041798	2018-02-28 07:07:00.041798
565	1	1	2018-07-20	2018	7	3	5	6053743	2018-02-28 07:07:00.047207	2018-02-28 07:07:00.047207
566	1	1	2018-07-21	2018	7	3	6	5882368	2018-02-28 07:07:00.052714	2018-02-28 07:07:00.052714
567	1	1	2018-07-22	2018	7	3	7	12282239	2018-02-28 07:07:00.058326	2018-02-28 07:07:00.058326
568	1	1	2018-07-23	2018	7	4	1	10269684	2018-02-28 07:07:00.064308	2018-02-28 07:07:00.064308
569	1	1	2018-07-24	2018	7	4	2	15877703	2018-02-28 07:07:00.070495	2018-02-28 07:07:00.070495
570	1	1	2018-07-25	2018	7	4	3	12646313	2018-02-28 07:07:00.076407	2018-02-28 07:07:00.076407
571	1	1	2018-07-26	2018	7	4	4	12852157	2018-02-28 07:07:00.081643	2018-02-28 07:07:00.081643
572	1	1	2018-07-27	2018	7	4	5	5952468	2018-02-28 07:07:00.086679	2018-02-28 07:07:00.086679
573	1	1	2018-07-28	2018	7	4	6	5670095	2018-02-28 07:07:00.092173	2018-02-28 07:07:00.092173
574	1	1	2018-07-29	2018	7	4	7	12599983	2018-02-28 07:07:00.098197	2018-02-28 07:07:00.098197
575	1	1	2018-07-30	2018	8	1	1	14511242	2018-02-28 07:07:00.104289	2018-02-28 07:07:00.104289
576	1	1	2018-07-31	2018	8	1	2	13593978	2018-02-28 07:07:00.109631	2018-02-28 07:07:00.109631
577	1	1	2018-08-01	2018	8	1	3	22352346	2018-02-28 07:07:00.115446	2018-02-28 07:07:00.115446
578	1	1	2018-08-02	2018	8	1	4	22042466	2018-02-28 07:07:00.121483	2018-02-28 07:07:00.121483
579	1	1	2018-08-03	2018	8	1	5	20465777	2018-02-28 07:07:00.127034	2018-02-28 07:07:00.127034
580	1	1	2018-08-04	2018	8	1	6	17260915	2018-02-28 07:07:00.133032	2018-02-28 07:07:00.133032
581	1	1	2018-08-05	2018	8	1	7	8727160	2018-02-28 07:07:00.138567	2018-02-28 07:07:00.138567
582	1	1	2018-08-06	2018	8	2	1	9167105	2018-02-28 07:07:00.143948	2018-02-28 07:07:00.143948
583	1	1	2018-08-07	2018	8	2	2	21411617	2018-02-28 07:07:00.149531	2018-02-28 07:07:00.149531
584	1	1	2018-08-08	2018	8	2	3	21036305	2018-02-28 07:07:00.154849	2018-02-28 07:07:00.154849
585	1	1	2018-08-09	2018	8	2	4	22119241	2018-02-28 07:07:00.160952	2018-02-28 07:07:00.160952
586	1	1	2018-08-10	2018	8	2	5	16025804	2018-02-28 07:07:00.166806	2018-02-28 07:07:00.166806
587	1	1	2018-08-11	2018	8	2	6	16281140	2018-02-28 07:07:00.172556	2018-02-28 07:07:00.172556
588	1	1	2018-08-12	2018	8	2	7	9140141	2018-02-28 07:07:00.178144	2018-02-28 07:07:00.178144
589	1	1	2018-08-13	2018	8	3	1	6965889	2018-02-28 07:07:00.183976	2018-02-28 07:07:00.183976
590	1	1	2018-08-14	2018	8	3	2	20927841	2018-02-28 07:07:00.18967	2018-02-28 07:07:00.18967
591	1	1	2018-08-15	2018	8	3	3	16567279	2018-02-28 07:07:00.195217	2018-02-28 07:07:00.195217
592	1	1	2018-08-16	2018	8	3	4	16169632	2018-02-28 07:07:00.201104	2018-02-28 07:07:00.201104
593	1	1	2018-08-17	2018	8	3	5	16092569	2018-02-28 07:07:00.206945	2018-02-28 07:07:00.206945
594	1	1	2018-08-18	2018	8	3	6	23469399	2018-02-28 07:07:00.215167	2018-02-28 07:07:00.215167
595	1	1	2018-08-19	2018	8	3	7	7687738	2018-02-28 07:07:00.221156	2018-02-28 07:07:00.221156
596	1	1	2018-08-20	2018	8	4	1	10024281	2018-02-28 07:07:00.226689	2018-02-28 07:07:00.226689
597	1	1	2018-08-21	2018	8	4	2	24893871	2018-02-28 07:07:00.231942	2018-02-28 07:07:00.231942
598	1	1	2018-08-22	2018	8	4	3	14730257	2018-02-28 07:07:00.237652	2018-02-28 07:07:00.237652
599	1	1	2018-08-23	2018	8	4	4	16216850	2018-02-28 07:07:00.243392	2018-02-28 07:07:00.243392
600	1	1	2018-08-24	2018	8	4	5	20413334	2018-02-28 07:07:00.249113	2018-02-28 07:07:00.249113
601	1	1	2018-08-25	2018	8	4	6	19883508	2018-02-28 07:07:00.255277	2018-02-28 07:07:00.255277
602	1	1	2018-08-26	2018	8	4	7	9981521	2018-02-28 07:07:00.261237	2018-02-28 07:07:00.261237
603	1	1	2018-08-27	2018	9	1	1	10500576	2018-02-28 07:07:00.2671	2018-02-28 07:07:00.2671
604	1	1	2018-08-28	2018	9	1	2	20375146	2018-02-28 07:07:00.273186	2018-02-28 07:07:00.273186
605	1	1	2018-08-29	2018	9	1	3	14995392	2018-02-28 07:07:00.279	2018-02-28 07:07:00.279
606	1	1	2018-08-30	2018	9	1	4	21098018	2018-02-28 07:07:00.284682	2018-02-28 07:07:00.284682
607	1	1	2018-08-31	2018	9	1	5	9738510	2018-02-28 07:07:00.29044	2018-02-28 07:07:00.29044
608	1	1	2018-09-01	2018	9	1	6	11035626	2018-02-28 07:07:00.296362	2018-02-28 07:07:00.296362
609	1	1	2018-09-02	2018	9	1	7	11582417	2018-02-28 07:07:00.302491	2018-02-28 07:07:00.302491
610	1	1	2018-09-03	2018	9	2	1	13227204	2018-02-28 07:07:00.308241	2018-02-28 07:07:00.308241
611	1	1	2018-09-04	2018	9	2	2	11215374	2018-02-28 07:07:00.313635	2018-02-28 07:07:00.313635
612	1	1	2018-09-05	2018	9	2	3	23540622	2018-02-28 07:07:00.318986	2018-02-28 07:07:00.318986
613	1	1	2018-09-06	2018	9	2	4	22194868	2018-02-28 07:07:00.324348	2018-02-28 07:07:00.324348
614	1	1	2018-09-07	2018	9	2	5	11599013	2018-02-28 07:07:00.329647	2018-02-28 07:07:00.329647
615	1	1	2018-09-08	2018	9	2	6	11710457	2018-02-28 07:07:00.335125	2018-02-28 07:07:00.335125
616	1	1	2018-09-09	2018	9	2	7	9512304	2018-02-28 07:07:00.341178	2018-02-28 07:07:00.341178
617	1	1	2018-09-10	2018	9	3	1	12830686	2018-02-28 07:07:00.347178	2018-02-28 07:07:00.347178
618	1	1	2018-09-11	2018	9	3	2	9204563	2018-02-28 07:07:00.353067	2018-02-28 07:07:00.353067
619	1	1	2018-09-12	2018	9	3	3	25908028	2018-02-28 07:07:00.358292	2018-02-28 07:07:00.358292
620	1	1	2018-09-13	2018	9	3	4	21026646	2018-02-28 07:07:00.363591	2018-02-28 07:07:00.363591
621	1	1	2018-09-14	2018	9	3	5	11398812	2018-02-28 07:07:00.369545	2018-02-28 07:07:00.369545
622	1	1	2018-09-15	2018	9	3	6	9821373	2018-02-28 07:07:00.375257	2018-02-28 07:07:00.375257
623	1	1	2018-09-16	2018	9	3	7	12379920	2018-02-28 07:07:00.380768	2018-02-28 07:07:00.380768
624	1	1	2018-09-17	2018	9	4	1	9848267	2018-02-28 07:07:00.386558	2018-02-28 07:07:00.386558
625	1	1	2018-09-18	2018	9	4	2	10032250	2018-02-28 07:07:00.391961	2018-02-28 07:07:00.391961
626	1	1	2018-09-19	2018	9	4	3	24188862	2018-02-28 07:07:00.397515	2018-02-28 07:07:00.397515
627	1	1	2018-09-20	2018	9	4	4	21420584	2018-02-28 07:07:00.402734	2018-02-28 07:07:00.402734
628	1	1	2018-09-21	2018	9	4	5	12538523	2018-02-28 07:07:00.407927	2018-02-28 07:07:00.407927
629	1	1	2018-09-22	2018	9	4	6	13141939	2018-02-28 07:07:00.413135	2018-02-28 07:07:00.413135
630	1	1	2018-09-23	2018	9	4	7	12404682	2018-02-28 07:07:00.418165	2018-02-28 07:07:00.418165
631	1	1	2018-09-24	2018	10	1	1	10846831	2018-02-28 07:07:00.423511	2018-02-28 07:07:00.423511
632	1	1	2018-09-25	2018	10	1	2	12335874	2018-02-28 07:07:00.42953	2018-02-28 07:07:00.42953
633	1	1	2018-09-26	2018	10	1	3	25042663	2018-02-28 07:07:00.43559	2018-02-28 07:07:00.43559
634	1	1	2018-09-27	2018	10	1	4	21404959	2018-02-28 07:07:00.440657	2018-02-28 07:07:00.440657
635	1	1	2018-09-28	2018	10	1	5	18257483	2018-02-28 07:07:00.445515	2018-02-28 07:07:00.445515
636	1	1	2018-09-29	2018	10	1	6	16715985	2018-02-28 07:07:00.450819	2018-02-28 07:07:00.450819
637	1	1	2018-09-30	2018	10	1	7	14345511	2018-02-28 07:07:00.456017	2018-02-28 07:07:00.456017
638	1	1	2018-10-01	2018	10	2	1	16653398	2018-02-28 07:07:00.461076	2018-02-28 07:07:00.461076
639	1	1	2018-10-02	2018	10	2	2	19130165	2018-02-28 07:07:00.466185	2018-02-28 07:07:00.466185
640	1	1	2018-10-03	2018	10	2	3	18380431	2018-02-28 07:07:00.472187	2018-02-28 07:07:00.472187
641	1	1	2018-10-04	2018	10	2	4	15900282	2018-02-28 07:07:00.477876	2018-02-28 07:07:00.477876
642	1	1	2018-10-05	2018	10	2	5	38159792	2018-02-28 07:07:00.483414	2018-02-28 07:07:00.483414
643	1	1	2018-10-06	2018	10	2	6	36723196	2018-02-28 07:07:00.489138	2018-02-28 07:07:00.489138
644	1	1	2018-10-07	2018	10	2	7	15183024	2018-02-28 07:07:00.4942	2018-02-28 07:07:00.4942
645	1	1	2018-10-08	2018	10	3	1	19545574	2018-02-28 07:07:00.499175	2018-02-28 07:07:00.499175
646	1	1	2018-10-09	2018	10	3	2	18556169	2018-02-28 07:07:00.504414	2018-02-28 07:07:00.504414
647	1	1	2018-10-10	2018	10	3	3	14532344	2018-02-28 07:07:00.509564	2018-02-28 07:07:00.509564
648	1	1	2018-10-11	2018	10	3	4	19954021	2018-02-28 07:07:00.514499	2018-02-28 07:07:00.514499
649	1	1	2018-10-12	2018	10	3	5	46881284	2018-02-28 07:07:00.519916	2018-02-28 07:07:00.519916
650	1	1	2018-10-13	2018	10	3	6	35045140	2018-02-28 07:07:00.525647	2018-02-28 07:07:00.525647
651	1	1	2018-10-14	2018	10	3	7	14668486	2018-02-28 07:07:00.531028	2018-02-28 07:07:00.531028
652	1	1	2018-10-15	2018	10	4	1	16235366	2018-02-28 07:07:00.537346	2018-02-28 07:07:00.537346
653	1	1	2018-10-16	2018	10	4	2	14149476	2018-02-28 07:07:00.543662	2018-02-28 07:07:00.543662
654	1	1	2018-10-17	2018	10	4	3	14672980	2018-02-28 07:07:00.549013	2018-02-28 07:07:00.549013
655	1	1	2018-10-18	2018	10	4	4	20467705	2018-02-28 07:07:00.554407	2018-02-28 07:07:00.554407
656	1	1	2018-10-19	2018	10	4	5	34874494	2018-02-28 07:07:00.559548	2018-02-28 07:07:00.559548
657	1	1	2018-10-20	2018	10	4	6	36379437	2018-02-28 07:07:00.564817	2018-02-28 07:07:00.564817
658	1	1	2018-10-21	2018	10	4	7	12744438	2018-02-28 07:07:00.57056	2018-02-28 07:07:00.57056
659	1	1	2018-10-22	2018	10	5	1	13034863	2018-02-28 07:07:00.576493	2018-02-28 07:07:00.576493
660	1	1	2018-10-23	2018	10	5	2	15612796	2018-02-28 07:07:00.581939	2018-02-28 07:07:00.581939
661	1	1	2018-10-24	2018	10	5	3	16158548	2018-02-28 07:07:00.587158	2018-02-28 07:07:00.587158
662	1	1	2018-10-25	2018	10	5	4	16658237	2018-02-28 07:07:00.59264	2018-02-28 07:07:00.59264
663	1	1	2018-10-26	2018	10	5	5	39125512	2018-02-28 07:07:00.598	2018-02-28 07:07:00.598
664	1	1	2018-10-27	2018	10	5	6	30370835	2018-02-28 07:07:00.603554	2018-02-28 07:07:00.603554
665	1	1	2018-10-28	2018	10	5	7	15253257	2018-02-28 07:07:00.608914	2018-02-28 07:07:00.608914
666	1	1	2018-10-29	2018	11	1	1	17590709	2018-02-28 07:07:00.615926	2018-02-28 07:07:00.615926
667	1	1	2018-10-30	2018	11	1	2	16546990	2018-02-28 07:07:00.621412	2018-02-28 07:07:00.621412
668	1	1	2018-10-31	2018	11	1	3	11920371	2018-02-28 07:07:00.628623	2018-02-28 07:07:00.628623
669	1	1	2018-11-01	2018	11	1	4	11780331	2018-02-28 07:07:00.633754	2018-02-28 07:07:00.633754
670	1	1	2018-11-02	2018	11	1	5	12671201	2018-02-28 07:07:00.63853	2018-02-28 07:07:00.63853
671	1	1	2018-11-03	2018	11	1	6	12923360	2018-02-28 07:07:00.643781	2018-02-28 07:07:00.643781
672	1	1	2018-11-04	2018	11	1	7	5915889	2018-02-28 07:07:00.64974	2018-02-28 07:07:00.64974
673	1	1	2018-11-05	2018	11	2	1	5554656	2018-02-28 07:07:00.655259	2018-02-28 07:07:00.655259
674	1	1	2018-11-06	2018	11	2	2	14254230	2018-02-28 07:07:00.661222	2018-02-28 07:07:00.661222
675	1	1	2018-11-07	2018	11	2	3	12992014	2018-02-28 07:07:00.666504	2018-02-28 07:07:00.666504
676	1	1	2018-11-08	2018	11	2	4	13666211	2018-02-28 07:07:00.672343	2018-02-28 07:07:00.672343
677	1	1	2018-11-09	2018	11	2	5	11845529	2018-02-28 07:07:00.678124	2018-02-28 07:07:00.678124
678	1	1	2018-11-10	2018	11	2	6	11634223	2018-02-28 07:07:00.6837	2018-02-28 07:07:00.6837
679	1	1	2018-11-11	2018	11	2	7	6477393	2018-02-28 07:07:00.689163	2018-02-28 07:07:00.689163
680	1	1	2018-11-12	2018	11	3	1	4866474	2018-02-28 07:07:00.694786	2018-02-28 07:07:00.694786
681	1	1	2018-11-13	2018	11	3	2	13653046	2018-02-28 07:07:00.700211	2018-02-28 07:07:00.700211
682	1	1	2018-11-14	2018	11	3	3	12193239	2018-02-28 07:07:00.706568	2018-02-28 07:07:00.706568
683	1	1	2018-11-15	2018	11	3	4	12881093	2018-02-28 07:07:00.712358	2018-02-28 07:07:00.712358
684	1	1	2018-11-16	2018	11	3	5	10766954	2018-02-28 07:07:00.718373	2018-02-28 07:07:00.718373
685	1	1	2018-11-17	2018	11	3	6	14761634	2018-02-28 07:07:00.723987	2018-02-28 07:07:00.723987
686	1	1	2018-11-18	2018	11	3	7	6200128	2018-02-28 07:07:00.72981	2018-02-28 07:07:00.72981
687	1	1	2018-11-19	2018	11	4	1	6475242	2018-02-28 07:07:00.73551	2018-02-28 07:07:00.73551
688	1	1	2018-11-20	2018	11	4	2	12594007	2018-02-28 07:07:00.741158	2018-02-28 07:07:00.741158
689	1	1	2018-11-21	2018	11	4	3	8736958	2018-02-28 07:07:00.746826	2018-02-28 07:07:00.746826
690	1	1	2018-11-22	2018	11	4	4	13489234	2018-02-28 07:07:00.75278	2018-02-28 07:07:00.75278
691	1	1	2018-11-23	2018	11	4	5	12024668	2018-02-28 07:07:00.758265	2018-02-28 07:07:00.758265
692	1	1	2018-11-24	2018	11	4	6	13096259	2018-02-28 07:07:00.763835	2018-02-28 07:07:00.763835
693	1	1	2018-11-25	2018	11	4	7	5603559	2018-02-28 07:07:00.769771	2018-02-28 07:07:00.769771
694	1	1	2018-11-26	2018	12	1	1	6825456	2018-02-28 07:07:00.775977	2018-02-28 07:07:00.775977
695	1	1	2018-11-27	2018	12	1	2	11547923	2018-02-28 07:07:00.782656	2018-02-28 07:07:00.782656
696	1	1	2018-11-28	2018	12	1	3	15422034	2018-02-28 07:07:00.788714	2018-02-28 07:07:00.788714
697	1	1	2018-11-29	2018	12	1	4	13441754	2018-02-28 07:07:00.794523	2018-02-28 07:07:00.794523
698	1	1	2018-11-30	2018	12	1	5	20690474	2018-02-28 07:07:00.80102	2018-02-28 07:07:00.80102
699	1	1	2018-12-01	2018	12	1	6	20609210	2018-02-28 07:07:00.806707	2018-02-28 07:07:00.806707
700	1	1	2018-12-02	2018	12	1	7	18060978	2018-02-28 07:07:00.811875	2018-02-28 07:07:00.811875
701	1	1	2018-12-03	2018	12	2	1	17675930	2018-02-28 07:07:00.816993	2018-02-28 07:07:00.816993
702	1	1	2018-12-04	2018	12	2	2	9388334	2018-02-28 07:07:00.822247	2018-02-28 07:07:00.822247
703	1	1	2018-12-05	2018	12	2	3	8842595	2018-02-28 07:07:00.827426	2018-02-28 07:07:00.827426
704	1	1	2018-12-06	2018	12	2	4	21974327	2018-02-28 07:07:00.832549	2018-02-28 07:07:00.832549
705	1	1	2018-12-07	2018	12	2	5	20201458	2018-02-28 07:07:00.838018	2018-02-28 07:07:00.838018
706	1	1	2018-12-08	2018	12	2	6	23842052	2018-02-28 07:07:00.843837	2018-02-28 07:07:00.843837
707	1	1	2018-12-09	2018	12	2	7	16211922	2018-02-28 07:07:00.849516	2018-02-28 07:07:00.849516
708	1	1	2018-12-10	2018	12	3	1	17355997	2018-02-28 07:07:00.854607	2018-02-28 07:07:00.854607
709	1	1	2018-12-11	2018	12	3	2	10410204	2018-02-28 07:07:00.859603	2018-02-28 07:07:00.859603
710	1	1	2018-12-12	2018	12	3	3	8431023	2018-02-28 07:07:00.865009	2018-02-28 07:07:00.865009
711	1	1	2018-12-13	2018	12	3	4	20203250	2018-02-28 07:07:00.870718	2018-02-28 07:07:00.870718
712	1	1	2018-12-14	2018	12	3	5	18850195	2018-02-28 07:07:00.876823	2018-02-28 07:07:00.876823
713	1	1	2018-12-15	2018	12	3	6	18102412	2018-02-28 07:07:00.882984	2018-02-28 07:07:00.882984
714	1	1	2018-12-16	2018	12	3	7	18724239	2018-02-28 07:07:00.888634	2018-02-28 07:07:00.888634
715	1	1	2018-12-17	2018	12	4	1	23662134	2018-02-28 07:07:00.893849	2018-02-28 07:07:00.893849
716	1	1	2018-12-18	2018	12	4	2	8059545	2018-02-28 07:07:00.899509	2018-02-28 07:07:00.899509
717	1	1	2018-12-19	2018	12	4	3	9044177	2018-02-28 07:07:00.905738	2018-02-28 07:07:00.905738
718	1	1	2018-12-20	2018	12	4	4	23945403	2018-02-28 07:07:00.910971	2018-02-28 07:07:00.910971
719	1	1	2018-12-21	2018	12	4	5	16407598	2018-02-28 07:07:00.915999	2018-02-28 07:07:00.915999
720	1	1	2018-12-22	2018	12	4	6	17594457	2018-02-28 07:07:00.921014	2018-02-28 07:07:00.921014
721	1	1	2018-12-23	2018	12	4	7	22356192	2018-02-28 07:07:00.926261	2018-02-28 07:07:00.926261
722	1	1	2018-12-24	2018	12	5	1	17811743	2018-02-28 07:07:00.932221	2018-02-28 07:07:00.932221
723	1	1	2018-12-25	2018	12	5	2	11694069	2018-02-28 07:07:00.938037	2018-02-28 07:07:00.938037
724	1	1	2018-12-26	2018	12	5	3	8881905	2018-02-28 07:07:00.943623	2018-02-28 07:07:00.943623
725	1	1	2018-12-27	2018	12	5	4	20965658	2018-02-28 07:07:00.949012	2018-02-28 07:07:00.949012
726	1	1	2018-12-28	2018	12	5	5	15065689	2018-02-28 07:07:00.954426	2018-02-28 07:07:00.954426
727	1	1	2018-12-29	2018	12	5	6	18593618	2018-02-28 07:07:00.959893	2018-02-28 07:07:00.959893
728	1	1	2018-12-30	2018	12	5	7	19977298	2018-02-28 07:07:00.965331	2018-02-28 07:07:00.965331
485	1	1	2018-05-01	2018	5	1	2	23590621	2018-02-28 07:06:59.562398	2018-02-28 07:06:59.562398
486	1	1	2018-05-02	2018	5	1	3	10716865	2018-02-28 07:06:59.568897	2018-02-28 07:06:59.568897
487	1	1	2018-05-03	2018	5	1	4	11873808	2018-02-28 07:06:59.575236	2018-02-28 07:06:59.575236
488	1	1	2018-05-04	2018	5	1	5	11656314	2018-02-28 07:06:59.580755	2018-02-28 07:06:59.580755
489	1	1	2018-05-05	2018	5	1	6	11461244	2018-02-28 07:06:59.586482	2018-02-28 07:06:59.586482
490	1	1	2018-05-06	2018	5	1	7	11296190	2018-02-28 07:06:59.592303	2018-02-28 07:06:59.592303
494	1	1	2018-05-10	2018	5	2	4	11805963	2018-02-28 07:06:59.615732	2018-02-28 07:06:59.615732
484	1	1	2018-04-30	2018	5	1	1	15310803	2018-02-28 07:06:59.556845	2018-02-28 07:06:59.556845
515	1	1	2018-05-31	2018	5	5	4	15744974	2018-02-28 07:06:59.727341	2018-02-28 07:06:59.727341
516	1	1	2018-06-01	2018	5	5	5	13942968	2018-02-28 07:06:59.732678	2018-02-28 07:06:59.732678
518	1	1	2018-06-03	2018	5	5	7	18651241	2018-02-28 07:06:59.743537	2018-02-28 07:06:59.743537
513	1	1	2018-05-29	2018	5	5	2	20762003	2018-02-28 07:06:59.716775	2018-02-28 07:06:59.716775
514	1	1	2018-05-30	2018	5	5	3	19913411	2018-02-28 07:06:59.72198	2018-02-28 07:06:59.72198
517	1	1	2018-06-02	2018	5	5	6	16939496	2018-02-28 07:06:59.738036	2018-02-28 07:06:59.738036
502	1	1	2018-05-18	2018	5	3	5	10354339	2018-02-28 07:06:59.656923	2018-02-28 07:06:59.656923
501	1	1	2018-05-17	2018	5	3	4	9270279	2018-02-28 07:06:59.65124	2018-02-28 07:06:59.65124
500	1	1	2018-05-16	2018	5	3	3	8428249	2018-02-28 07:06:59.645945	2018-02-28 07:06:59.645945
499	1	1	2018-05-15	2018	5	3	2	19789861	2018-02-28 07:06:59.640701	2018-02-28 07:06:59.640701
504	1	1	2018-05-20	2018	5	3	7	8875739	2018-02-28 07:06:59.667827	2018-02-28 07:06:59.667827
503	1	1	2018-05-19	2018	5	3	6	10748944	2018-02-28 07:06:59.662419	2018-02-28 07:06:59.662419
\.


--
-- Name: sps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: coke
--

SELECT pg_catalog.setval('public.sps_id_seq', 728, true);


--
-- Data for Name: staffing_cases; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.staffing_cases (id, id_case, tolerance, actual_staffing_eval, max_time, "user", created_at, updated_at) FROM stdin;
29	29	3	1	1	fatapia@scipion.cl	2018-05-16 19:59:43.570779	2018-05-16 19:59:43.570779
30	30	3	1	1	fatapia@scipion.cl	2018-05-16 19:59:43.571779	2018-05-16 19:59:43.571779
31	31	3	1	1	fatapia@scipion.cl	2018-05-16 19:59:43.573779	2018-05-16 19:59:43.573779
32	32	3	1	1	fatapia@scipion.cl	2018-05-16 19:59:43.575779	2018-05-16 19:59:43.575779
\.


--
-- Name: staffing_cases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.staffing_cases_id_seq', 32, true);


--
-- Data for Name: store_categories; Type: TABLE DATA; Schema: public; Owner: coke
--

COPY public.store_categories (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: store_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: coke
--

SELECT pg_catalog.setval('public.store_categories_id_seq', 1, false);


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: coke
--

COPY public.stores (id, name, street, number, city, district, country, created_at, updated_at, origin_id, county, size, economic_segment, cluster_id) FROM stdin;
1	Alto Las Condes	 Av. Pdte. Kennedy Lateral 	9001	Santiago	-	CL	2017-08-22 14:30:06.648926	2018-05-19 19:18:24.16608	1	Las Condes	Grande	ABC1	1
2	Parque Aracuco	Av Presidente Kennedy	5413	Santiago	-	CL	2017-08-22 14:30:06.65399	2018-05-19 19:18:24.275086	2	Las Condes	Grande	ABC1	1
3	Plaza Oeste	 Av. Américo Vespucio	1501	Santiago	-	CL	2017-08-22 14:30:06.658309	2018-05-19 19:18:24.428095	3	Cerrillos	Grande	C3	3
5	Plaza Egaña	 Av. Larrain	5	Santiago	-	CL	2017-08-22 14:30:06.665672	2018-05-19 19:18:24.659108	5	La Reina	Grande	C2	2
6	Portal La Dehesa	Av. La Dehesa	1445	Santiago	-	CL	2017-08-22 14:30:06.669516	2018-05-19 19:18:26.288202	6	Lo Barnechea	Grande	C2	2
4	Santiago Centro	Ahumada	112	Santiago	-	CL	2017-08-22 14:30:06.662028	2018-05-19 19:19:48.484903	4	Santiago	Grande	C3	3
\.


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: coke
--

SELECT pg_catalog.setval('public.stores_id_seq', 6, true);


--
-- Data for Name: summary_cases; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.summary_cases (id, id_case, sale_plan, coverange_deficit, surplus_coverange, total_deviation, cost_of_remunerations, margin_adjustment, created_at, updated_at, type_io, real_dot) FROM stdin;
59	29	86316060	8007801	13059540	55581741	0	36.3%	2018-05-16 19:59:43.59278	2018-05-16 19:59:43.59278	in	{1 : 1, 2 : 1, 3 : 1, 4 : 2 , 5 : 2 , 6 : 2 , 7 : 2 , 8 : 1 , 9 : 0 , 10 : 0 , 11 : 0 , 12 : 0}
60	29	86316060	16604190	10168130	26772320	0	69.0%	2018-05-16 19:59:43.59578	2018-05-16 19:59:43.59578	out	{1 : 0, 2 : 2, 3 : 0, 4 : 1 , 5 : 0 , 6 : 0 , 7 : 1 , 8 : 1 , 9 : 0 , 10 : 2 , 11 : 0 , 12 : 0}
61	30	134641260	43138533	30942273	74080806	0	45.0%	2018-05-16 19:59:43.59778	2018-05-16 19:59:43.59778	in	{1 : 1, 2 : 1, 3 : 1, 4 : 2 , 5 : 2 , 6 : 2 , 7 : 2 , 8 : 1 , 9 : 0 , 10 : 0 , 11 : 0 , 12 : 0}
62	30	134641260	50852643	14471383	65324026	0	51.5%	2018-05-16 19:59:43.599781	2018-05-16 19:59:43.599781	out	{1 : 1, 2 : 1, 3 : 1, 4 : 2 , 5 : 0 , 6 : 0 , 7 : 1 , 8 : 2 , 9 : 0 , 10 : 0 , 11 : 0 , 12 : 1}
63	31	80037950	11619016	54036066	65655082	0	18.0%	2018-05-16 19:59:43.601781	2018-05-16 19:59:43.601781	in	{1 : 1, 2 : 1, 3 : 1, 4 : 2 , 5 : 2 , 6 : 2 , 7 : 2 , 8 : 1 , 9 : 0 , 10 : 0 , 11 : 0 , 12 : 0}
64	31	80037950	23870794	13242844	37113638	0	53.6%	2018-05-16 19:59:43.604781	2018-05-16 19:59:43.604781	out	{1 : 1, 2 : 1, 3 : 0, 4 : 1 , 5 : 0 , 6 : 0 , 7 : 1 , 8 : 1 , 9 : 0 , 10 : 0 , 11 : 0 , 12 : 1}
65	32	102668930	23048729	37749799	60798528	0	40.8%	2018-05-16 19:59:43.607781	2018-05-16 19:59:43.607781	in	{1 : 1, 2 : 1, 3 : 1, 4 : 2 , 5 : 2 , 6 : 2 , 7 : 2 , 8 : 1 , 9 : 0 , 10 : 0 , 11 : 0 , 12 : 0}
66	32	102668930	37536478	10682548	48219026	0	53.0%	2018-05-16 19:59:43.609781	2018-05-16 19:59:43.609781	out	{1 : 2, 2 : 1, 3 : 1, 4 : 0, 5 : 0, 6 : 0, 7 : 0, 8 : 0, 9 : 0 , 10 : 0 , 11 : 0 , 12 : 3}
\.


--
-- Name: summary_cases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.summary_cases_id_seq', 66, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: coke
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name, lastname, surname, role, picture, status, "position", rut) FROM stdin;
3	coke@mta.cl	$2a$11$ZpgJ2DJub/fHP0mtggRi8eClLrs/SzZ4D9B86mjrNLo9xQvyNoynm	\N	\N	\N	1	2017-08-30 18:46:58.903108	2017-08-30 18:46:58.903108	127.0.0.1	127.0.0.1	2017-08-30 18:46:40.994371	2017-08-30 18:46:58.904372	Jorge	Astudillo	Andrades	0	\N	0	\N	151599516
2	admin@mta.cl	$2a$11$d1GyWIsKhZNICoxsixCEFeclxwX0jQX9O67Meg74q0DrRLGOlttfS	\N	\N	\N	42	2018-05-20 01:27:00.517944	2018-05-12 18:48:13.011818	127.0.0.1	127.0.0.1	2017-08-30 18:46:40.860155	2018-05-20 01:27:00.527945	admin	sales	force	0	\N	0	\N	111111111
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: coke
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: available_shifts available_shifts_pkey; Type: CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.available_shifts
    ADD CONSTRAINT available_shifts_pkey PRIMARY KEY (id);


--
-- Name: clusters clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_pkey PRIMARY KEY (id);


--
-- Name: data_cases data_cases_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.data_cases
    ADD CONSTRAINT data_cases_pkey PRIMARY KEY (id);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: historic_sales historic_sales_pkey; Type: CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.historic_sales
    ADD CONSTRAINT historic_sales_pkey PRIMARY KEY (id);


--
-- Name: hs hs_pkey; Type: CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.hs
    ADD CONSTRAINT hs_pkey PRIMARY KEY (id);


--
-- Name: master_departments master_departments_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.master_departments
    ADD CONSTRAINT master_departments_pkey PRIMARY KEY (id);


--
-- Name: return_cases return_cases_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.return_cases
    ADD CONSTRAINT return_cases_pkey PRIMARY KEY (id);


--
-- Name: rs rs_pkey; Type: CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.rs
    ADD CONSTRAINT rs_pkey PRIMARY KEY (id);


--
-- Name: sale_by_sellers sale_by_sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sale_by_sellers
    ADD CONSTRAINT sale_by_sellers_pkey PRIMARY KEY (id);


--
-- Name: sale_plans sale_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.sale_plans
    ADD CONSTRAINT sale_plans_pkey PRIMARY KEY (id);


--
-- Name: sale_reals sale_reals_pkey; Type: CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.sale_reals
    ADD CONSTRAINT sale_reals_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sellers sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT sellers_pkey PRIMARY KEY (id);


--
-- Name: shift_breaks shift_breaks_pkey; Type: CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.shift_breaks
    ADD CONSTRAINT shift_breaks_pkey PRIMARY KEY (id);


--
-- Name: sps sps_pkey; Type: CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.sps
    ADD CONSTRAINT sps_pkey PRIMARY KEY (id);


--
-- Name: staffing_cases staffing_cases_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.staffing_cases
    ADD CONSTRAINT staffing_cases_pkey PRIMARY KEY (id);


--
-- Name: store_categories store_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.store_categories
    ADD CONSTRAINT store_categories_pkey PRIMARY KEY (id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: summary_cases summary_cases_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.summary_cases
    ADD CONSTRAINT summary_cases_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_available_shifts_on_store_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_available_shifts_on_store_id ON public.available_shifts USING btree (store_id);


--
-- Name: index_departments_on_origin_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_departments_on_origin_id ON public.departments USING btree (origin_id);


--
-- Name: index_departments_on_store_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_departments_on_store_id ON public.departments USING btree (store_id);


--
-- Name: index_historic_sales_on_department_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_historic_sales_on_department_id ON public.historic_sales USING btree (department_id);


--
-- Name: index_historic_sales_on_store_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_historic_sales_on_store_id ON public.historic_sales USING btree (store_id);


--
-- Name: index_hs_on_department_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_hs_on_department_id ON public.hs USING btree (department_id);


--
-- Name: index_hs_on_store_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_hs_on_store_id ON public.hs USING btree (store_id);


--
-- Name: index_rs_on_department_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_rs_on_department_id ON public.rs USING btree (department_id);


--
-- Name: index_rs_on_store_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_rs_on_store_id ON public.rs USING btree (store_id);


--
-- Name: index_sale_plans_on_department_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_sale_plans_on_department_id ON public.sale_plans USING btree (department_id);


--
-- Name: index_sale_plans_on_store_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_sale_plans_on_store_id ON public.sale_plans USING btree (store_id);


--
-- Name: index_sale_reals_on_department_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_sale_reals_on_department_id ON public.sale_reals USING btree (department_id);


--
-- Name: index_sale_reals_on_store_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_sale_reals_on_store_id ON public.sale_reals USING btree (store_id);


--
-- Name: index_sellers_on_department_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_sellers_on_department_id ON public.sellers USING btree (department_id);


--
-- Name: index_sellers_on_store_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_sellers_on_store_id ON public.sellers USING btree (store_id);


--
-- Name: index_shift_breaks_on_seller_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_shift_breaks_on_seller_id ON public.shift_breaks USING btree (seller_id);


--
-- Name: index_sps_on_department_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_sps_on_department_id ON public.sps USING btree (department_id);


--
-- Name: index_sps_on_store_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_sps_on_store_id ON public.sps USING btree (store_id);


--
-- Name: index_stores_on_cluster_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_stores_on_cluster_id ON public.stores USING btree (cluster_id);


--
-- Name: index_stores_on_origin_id; Type: INDEX; Schema: public; Owner: coke
--

CREATE INDEX index_stores_on_origin_id ON public.stores USING btree (origin_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: coke
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: coke
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: sale_plans fk_rails_0114e1ed82; Type: FK CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.sale_plans
    ADD CONSTRAINT fk_rails_0114e1ed82 FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: historic_sales fk_rails_1280d3b3fa; Type: FK CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.historic_sales
    ADD CONSTRAINT fk_rails_1280d3b3fa FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: sps fk_rails_143adc4732; Type: FK CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.sps
    ADD CONSTRAINT fk_rails_143adc4732 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: shift_breaks fk_rails_3be6c8adfb; Type: FK CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.shift_breaks
    ADD CONSTRAINT fk_rails_3be6c8adfb FOREIGN KEY (seller_id) REFERENCES public.sellers(id);


--
-- Name: sale_reals fk_rails_4ab334433c; Type: FK CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.sale_reals
    ADD CONSTRAINT fk_rails_4ab334433c FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: sps fk_rails_7ee155299e; Type: FK CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.sps
    ADD CONSTRAINT fk_rails_7ee155299e FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: hs fk_rails_91370872b5; Type: FK CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.hs
    ADD CONSTRAINT fk_rails_91370872b5 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: historic_sales fk_rails_9243f9f41b; Type: FK CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.historic_sales
    ADD CONSTRAINT fk_rails_9243f9f41b FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: sale_reals fk_rails_94a7ab9fa6; Type: FK CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.sale_reals
    ADD CONSTRAINT fk_rails_94a7ab9fa6 FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: departments fk_rails_a4f89e69bb; Type: FK CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT fk_rails_a4f89e69bb FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: stores fk_rails_a961131721; Type: FK CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT fk_rails_a961131721 FOREIGN KEY (cluster_id) REFERENCES public.clusters(id);


--
-- Name: sellers fk_rails_b9da527f94; Type: FK CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT fk_rails_b9da527f94 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: available_shifts fk_rails_c11526c214; Type: FK CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.available_shifts
    ADD CONSTRAINT fk_rails_c11526c214 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: rs fk_rails_ccea61b4d5; Type: FK CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.rs
    ADD CONSTRAINT fk_rails_ccea61b4d5 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: rs fk_rails_e44209ac70; Type: FK CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.rs
    ADD CONSTRAINT fk_rails_e44209ac70 FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: sale_plans fk_rails_e8a8459ef9; Type: FK CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.sale_plans
    ADD CONSTRAINT fk_rails_e8a8459ef9 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: sellers fk_rails_efd6f20315; Type: FK CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT fk_rails_efd6f20315 FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: hs fk_rails_f92948468a; Type: FK CONSTRAINT; Schema: public; Owner: coke
--

ALTER TABLE ONLY public.hs
    ADD CONSTRAINT fk_rails_f92948468a FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- PostgreSQL database dump complete
--

