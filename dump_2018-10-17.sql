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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: Magnius
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO "Magnius";

--
-- Name: available_shifts; Type: TABLE; Schema: public; Owner: Magnius
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


ALTER TABLE public.available_shifts OWNER TO "Magnius";

--
-- Name: available_shifts_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.available_shifts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.available_shifts_id_seq OWNER TO "Magnius";

--
-- Name: available_shifts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
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
-- Name: departments; Type: TABLE; Schema: public; Owner: Magnius
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


ALTER TABLE public.departments OWNER TO "Magnius";

--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_id_seq OWNER TO "Magnius";

--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- Name: historic_sales; Type: TABLE; Schema: public; Owner: Magnius
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


ALTER TABLE public.historic_sales OWNER TO "Magnius";

--
-- Name: historic_sales_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.historic_sales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historic_sales_id_seq OWNER TO "Magnius";

--
-- Name: historic_sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
--

ALTER SEQUENCE public.historic_sales_id_seq OWNED BY public.historic_sales.id;


--
-- Name: hs; Type: TABLE; Schema: public; Owner: Magnius
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


ALTER TABLE public.hs OWNER TO "Magnius";

--
-- Name: hs_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.hs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hs_id_seq OWNER TO "Magnius";

--
-- Name: hs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
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
-- Name: request_details; Type: TABLE; Schema: public; Owner: Magnius
--

CREATE TABLE public.request_details (
    id bigint NOT NULL,
    request_id integer,
    department_id integer,
    turn integer,
    quantity integer,
    rrhh integer,
    internal integer,
    laborum integer,
    trabajando integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.request_details OWNER TO "Magnius";

--
-- Name: request_details_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.request_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.request_details_id_seq OWNER TO "Magnius";

--
-- Name: request_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
--

ALTER SEQUENCE public.request_details_id_seq OWNED BY public.request_details.id;


--
-- Name: requests; Type: TABLE; Schema: public; Owner: Magnius
--

CREATE TABLE public.requests (
    id bigint NOT NULL,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.requests OWNER TO "Magnius";

--
-- Name: requests_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requests_id_seq OWNER TO "Magnius";

--
-- Name: requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
--

ALTER SEQUENCE public.requests_id_seq OWNED BY public.requests.id;


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
-- Name: rs; Type: TABLE; Schema: public; Owner: Magnius
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


ALTER TABLE public.rs OWNER TO "Magnius";

--
-- Name: rs_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.rs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rs_id_seq OWNER TO "Magnius";

--
-- Name: rs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
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
-- Name: sale_plans; Type: TABLE; Schema: public; Owner: Magnius
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


ALTER TABLE public.sale_plans OWNER TO "Magnius";

--
-- Name: sale_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.sale_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sale_plans_id_seq OWNER TO "Magnius";

--
-- Name: sale_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
--

ALTER SEQUENCE public.sale_plans_id_seq OWNED BY public.sale_plans.id;


--
-- Name: sale_reals; Type: TABLE; Schema: public; Owner: Magnius
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


ALTER TABLE public.sale_reals OWNER TO "Magnius";

--
-- Name: sale_reals_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.sale_reals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sale_reals_id_seq OWNER TO "Magnius";

--
-- Name: sale_reals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
--

ALTER SEQUENCE public.sale_reals_id_seq OWNED BY public.sale_reals.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: Magnius
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO "Magnius";

--
-- Name: sellers; Type: TABLE; Schema: public; Owner: Magnius
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


ALTER TABLE public.sellers OWNER TO "Magnius";

--
-- Name: sellers_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.sellers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sellers_id_seq OWNER TO "Magnius";

--
-- Name: sellers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
--

ALTER SEQUENCE public.sellers_id_seq OWNED BY public.sellers.id;


--
-- Name: shift_breaks; Type: TABLE; Schema: public; Owner: Magnius
--

CREATE TABLE public.shift_breaks (
    id bigint NOT NULL,
    seller_id bigint,
    date date,
    "time" time without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.shift_breaks OWNER TO "Magnius";

--
-- Name: shift_breaks_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.shift_breaks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shift_breaks_id_seq OWNER TO "Magnius";

--
-- Name: shift_breaks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
--

ALTER SEQUENCE public.shift_breaks_id_seq OWNED BY public.shift_breaks.id;


--
-- Name: sps; Type: TABLE; Schema: public; Owner: Magnius
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


ALTER TABLE public.sps OWNER TO "Magnius";

--
-- Name: sps_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.sps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sps_id_seq OWNER TO "Magnius";

--
-- Name: sps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
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
-- Name: staffing_reals; Type: TABLE; Schema: public; Owner: Magnius
--

CREATE TABLE public.staffing_reals (
    id bigint NOT NULL,
    department_id bigint,
    year integer,
    month integer,
    day integer,
    count integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    hour integer,
    store_id integer
);


ALTER TABLE public.staffing_reals OWNER TO "Magnius";

--
-- Name: staffing_reals_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.staffing_reals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staffing_reals_id_seq OWNER TO "Magnius";

--
-- Name: staffing_reals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
--

ALTER SEQUENCE public.staffing_reals_id_seq OWNED BY public.staffing_reals.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: Magnius
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


ALTER TABLE public.stores OWNER TO "Magnius";

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_id_seq OWNER TO "Magnius";

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
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
-- Name: users; Type: TABLE; Schema: public; Owner: Magnius
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
    rut character varying,
    phone character varying,
    street character varying,
    number character varying,
    city character varying,
    district character varying,
    county character varying,
    country character varying,
    department_id bigint,
    store_id bigint,
    assigned_shift integer,
    begin_shift date
);


ALTER TABLE public.users OWNER TO "Magnius";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Magnius
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "Magnius";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Magnius
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: available_shifts id; Type: DEFAULT; Schema: public; Owner: Magnius
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
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- Name: historic_sales id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.historic_sales ALTER COLUMN id SET DEFAULT nextval('public.historic_sales_id_seq'::regclass);


--
-- Name: hs id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.hs ALTER COLUMN id SET DEFAULT nextval('public.hs_id_seq'::regclass);


--
-- Name: master_departments id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.master_departments ALTER COLUMN id SET DEFAULT nextval('public.master_departments_id_seq'::regclass);


--
-- Name: request_details id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.request_details ALTER COLUMN id SET DEFAULT nextval('public.request_details_id_seq'::regclass);


--
-- Name: requests id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.requests ALTER COLUMN id SET DEFAULT nextval('public.requests_id_seq'::regclass);


--
-- Name: return_cases id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.return_cases ALTER COLUMN id SET DEFAULT nextval('public.return_cases_id_seq'::regclass);


--
-- Name: rs id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.rs ALTER COLUMN id SET DEFAULT nextval('public.rs_id_seq'::regclass);


--
-- Name: sale_by_sellers id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sale_by_sellers ALTER COLUMN id SET DEFAULT nextval('public.sale_by_sellers_id_seq'::regclass);


--
-- Name: sale_plans id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sale_plans ALTER COLUMN id SET DEFAULT nextval('public.sale_plans_id_seq'::regclass);


--
-- Name: sale_reals id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sale_reals ALTER COLUMN id SET DEFAULT nextval('public.sale_reals_id_seq'::regclass);


--
-- Name: sellers id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sellers ALTER COLUMN id SET DEFAULT nextval('public.sellers_id_seq'::regclass);


--
-- Name: shift_breaks id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.shift_breaks ALTER COLUMN id SET DEFAULT nextval('public.shift_breaks_id_seq'::regclass);


--
-- Name: sps id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sps ALTER COLUMN id SET DEFAULT nextval('public.sps_id_seq'::regclass);


--
-- Name: staffing_cases id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.staffing_cases ALTER COLUMN id SET DEFAULT nextval('public.staffing_cases_id_seq'::regclass);


--
-- Name: staffing_reals id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.staffing_reals ALTER COLUMN id SET DEFAULT nextval('public.staffing_reals_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);


--
-- Name: summary_cases id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.summary_cases ALTER COLUMN id SET DEFAULT nextval('public.summary_cases_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2018-10-08 19:55:40.919189	2018-10-08 19:55:40.919189
\.


--
-- Data for Name: available_shifts; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.available_shifts (id, store_id, num, name, month, week, day, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty, twenty_one, twenty_two, twenty_three, twenty_four, created_at, updated_at) FROM stdin;
\.


--
-- Name: available_shifts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.available_shifts_id_seq', 1, false);


--
-- Data for Name: clusters; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.clusters (id, name, description, created_at, updated_at) FROM stdin;
1	ABC1	\N	2018-10-08 21:51:44.211467	2018-10-08 21:51:44.211467
2	C2	\N	2018-10-08 21:51:44.213467	2018-10-08 21:51:44.213467
3	C3	\N	2018-10-08 21:51:44.214467	2018-10-08 21:51:44.214467
4	D	\N	2018-10-08 21:51:44.216467	2018-10-08 21:51:44.216467
5	E	\N	2018-10-08 21:51:44.217467	2018-10-08 21:51:44.217467
\.


--
-- Name: clusters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.clusters_id_seq', 1, false);


--
-- Data for Name: data_cases; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.data_cases (id, id_case, turn_num, dep_num, day_num, hour_day, hp_val, prod_obj, vhp, pov, lunch_in, lunch_hours, hour_min, turns_matrix, real_dot, sale_plan, created_at, updated_at, month, year) FROM stdin;
\.


--
-- Name: data_cases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.data_cases_id_seq', 1, false);


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.departments (id, origin_id, name, store_id, created_at, updated_at, productivity_obj, master_id) FROM stdin;
1	1	Rincon juvenil Mujer	1	2018-10-08 21:51:44.26847	2018-10-08 21:51:44.26847	\N	\N
2	7	Moda Hombre	2	2018-10-08 21:51:44.27247	2018-10-08 21:51:44.27247	\N	\N
3	6	Tecnología	3	2018-10-08 21:51:44.275471	2018-10-08 21:51:44.275471	\N	\N
4	2	Moda Mujer	5	2018-10-08 21:51:44.278471	2018-10-08 21:51:44.278471	\N	\N
5	4	Deportes	6	2018-10-08 21:51:44.280471	2018-10-08 21:51:44.280471	\N	\N
6	3	Infantíl	1	2018-10-08 21:51:44.284471	2018-10-08 21:51:44.284471	\N	\N
\.


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.departments_id_seq', 6, true);


--
-- Data for Name: historic_sales; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.historic_sales (id, department_id, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty, twenty_one, twenty_two, twenty_three, twenty_four, created_at, updated_at, historic_date, store_id, week, month, year, day_number) FROM stdin;
\.


--
-- Name: historic_sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.historic_sales_id_seq', 1, false);


--
-- Data for Name: hs; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.hs (id, store_id, department_id, date, year, month, week, dow, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty, twenty_one, twenty_two, twenty_three, total_day, created_at, updated_at) FROM stdin;
\.


--
-- Name: hs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.hs_id_seq', 1, false);


--
-- Data for Name: master_departments; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.master_departments (id, name, created_at, updated_at) FROM stdin;
1	Rincon juvenil Mujer	2018-10-08 21:51:44.219467	2018-10-08 21:51:44.219467
2	Moda Hombre	2018-10-08 21:51:44.220467	2018-10-08 21:51:44.220467
3	Tecnología	2018-10-08 21:51:44.222468	2018-10-08 21:51:44.222468
4	Deportes	2018-10-08 21:51:44.224468	2018-10-08 21:51:44.224468
5	Moda Mujer	2018-10-08 21:51:44.226468	2018-10-08 21:51:44.226468
6	Infantil	2018-10-08 21:51:44.227468	2018-10-08 21:51:44.227468
\.


--
-- Name: master_departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.master_departments_id_seq', 1, false);


--
-- Data for Name: request_details; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.request_details (id, request_id, department_id, turn, quantity, rrhh, internal, laborum, trabajando, created_at, updated_at) FROM stdin;
\.


--
-- Name: request_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.request_details_id_seq', 1, false);


--
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.requests (id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.requests_id_seq', 1, false);


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
-- Data for Name: rs; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.rs (id, store_id, department_id, date, year, month, week, dow, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty, twenty_one, twenty_two, twenty_three, total_day, created_at, updated_at) FROM stdin;
\.


--
-- Name: rs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.rs_id_seq', 1, false);


--
-- Data for Name: sale_by_sellers; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.sale_by_sellers (id, seller, month, week, day, hour, department, sale, turn, year, created_at, updated_at) FROM stdin;
\.


--
-- Name: sale_by_sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.sale_by_sellers_id_seq', 1, false);


--
-- Data for Name: sale_plans; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.sale_plans (id, department_id, created_at, updated_at, sale_date, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty, twenty_one, twenty_two, twenty_three, twenty_four, store_id, week, month, year, day_number) FROM stdin;
\.


--
-- Name: sale_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.sale_plans_id_seq', 1, false);


--
-- Data for Name: sale_reals; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.sale_reals (id, store_id, department_id, sale_date, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty, twenty_one, twenty_two, twenty_three, twenty_four, week, month, year, day_number, created_at, updated_at) FROM stdin;
\.


--
-- Name: sale_reals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.sale_reals_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.schema_migrations (version) FROM stdin;
20170810054051
20170816004606
20170816004630
20170816004646
20170816004709
20170816011612
20170816011851
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
20180829175331
20180915180133
20180921174220
20180921174501
20181002191918
\.


--
-- Data for Name: sellers; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.sellers (id, rut, name, lastname, email, phone, street, number, city, district, county, country, department_id, created_at, updated_at, store_id, assigned_shift, begin_shift) FROM stdin;
\.


--
-- Name: sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.sellers_id_seq', 1, false);


--
-- Data for Name: shift_breaks; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.shift_breaks (id, seller_id, date, "time", created_at, updated_at) FROM stdin;
\.


--
-- Name: shift_breaks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.shift_breaks_id_seq', 1, false);


--
-- Data for Name: sps; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.sps (id, store_id, department_id, date, year, month, week, dow, sale, created_at, updated_at) FROM stdin;
\.


--
-- Name: sps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.sps_id_seq', 1, false);


--
-- Data for Name: staffing_cases; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.staffing_cases (id, id_case, tolerance, actual_staffing_eval, max_time, "user", created_at, updated_at) FROM stdin;
\.


--
-- Name: staffing_cases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.staffing_cases_id_seq', 1, false);


--
-- Data for Name: staffing_reals; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.staffing_reals (id, department_id, year, month, day, count, created_at, updated_at, hour, store_id) FROM stdin;
\.


--
-- Name: staffing_reals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.staffing_reals_id_seq', 1, false);


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.stores (id, name, street, number, city, district, country, created_at, updated_at, origin_id, county, size, economic_segment, cluster_id) FROM stdin;
1	Alto Las Condes	 Av. Pdte. Kennedy Lateral 	9001	Santiago	-	CL	2018-10-08 21:51:44.243469	2018-10-08 21:51:44.243469	1	Las Condes	Grande	ABC1	1
2	Parque Arauco	Av Presidente Kennedy	5413	Santiago	-	CL	2018-10-08 21:51:44.246469	2018-10-08 21:51:44.246469	2	Las Condes	Grande	C3	3
3	Plaza Oeste	 Av. Américo Vespucio	1501	Santiago	-	CL	2018-10-08 21:51:44.249469	2018-10-08 21:51:44.249469	3	Cerrillos	Grande	C2	2
4	Santiago Centro	Ahumada	112	Santiago	-	CL	2018-10-08 21:51:44.252469	2018-10-08 21:51:44.252469	4	Santiago	Grande	C2	2
5	Plaza Egaña	 Av. Larrain	5	Santiago	-	CL	2018-10-08 21:51:44.254469	2018-10-08 21:51:44.254469	5	La Reina	Grande	C3	3
6	Portal La Dehesa	Av. La Dehesa	1445	Santiago	-	CL	2018-10-08 21:51:44.25847	2018-10-08 21:51:44.25847	6	Lo Barnechea	Grande	ABC1	1
\.


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.stores_id_seq', 18, true);


--
-- Data for Name: summary_cases; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.summary_cases (id, id_case, sale_plan, coverange_deficit, surplus_coverange, total_deviation, cost_of_remunerations, margin_adjustment, created_at, updated_at, type_io, real_dot) FROM stdin;
\.


--
-- Name: summary_cases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.summary_cases_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Magnius
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name, lastname, surname, role, picture, status, "position", rut, phone, street, number, city, district, county, country, department_id, store_id, assigned_shift, begin_shift) FROM stdin;
9	admin@mta.cl	$2a$11$6bU9BnLKANZoEvlag30pbeegkWByioK3E31yI3U6STytlWEVwJkxW	\N	\N	\N	3	2018-10-08 22:07:08.548336	2018-10-08 22:01:35.897309	127.0.0.1	127.0.0.1	2018-10-08 21:51:45.548543	2018-10-08 22:07:08.550336	admin	sales	force	0		0		111111111	\N	\N	\N	\N	\N	\N	\N	1	2	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Magnius
--

SELECT pg_catalog.setval('public.users_id_seq', 9, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: available_shifts available_shifts_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
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
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: historic_sales historic_sales_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.historic_sales
    ADD CONSTRAINT historic_sales_pkey PRIMARY KEY (id);


--
-- Name: hs hs_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.hs
    ADD CONSTRAINT hs_pkey PRIMARY KEY (id);


--
-- Name: master_departments master_departments_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.master_departments
    ADD CONSTRAINT master_departments_pkey PRIMARY KEY (id);


--
-- Name: request_details request_details_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.request_details
    ADD CONSTRAINT request_details_pkey PRIMARY KEY (id);


--
-- Name: requests requests_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);


--
-- Name: return_cases return_cases_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.return_cases
    ADD CONSTRAINT return_cases_pkey PRIMARY KEY (id);


--
-- Name: rs rs_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.rs
    ADD CONSTRAINT rs_pkey PRIMARY KEY (id);


--
-- Name: sale_by_sellers sale_by_sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sale_by_sellers
    ADD CONSTRAINT sale_by_sellers_pkey PRIMARY KEY (id);


--
-- Name: sale_plans sale_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sale_plans
    ADD CONSTRAINT sale_plans_pkey PRIMARY KEY (id);


--
-- Name: sale_reals sale_reals_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sale_reals
    ADD CONSTRAINT sale_reals_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sellers sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT sellers_pkey PRIMARY KEY (id);


--
-- Name: shift_breaks shift_breaks_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.shift_breaks
    ADD CONSTRAINT shift_breaks_pkey PRIMARY KEY (id);


--
-- Name: sps sps_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sps
    ADD CONSTRAINT sps_pkey PRIMARY KEY (id);


--
-- Name: staffing_cases staffing_cases_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.staffing_cases
    ADD CONSTRAINT staffing_cases_pkey PRIMARY KEY (id);


--
-- Name: staffing_reals staffing_reals_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.staffing_reals
    ADD CONSTRAINT staffing_reals_pkey PRIMARY KEY (id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: summary_cases summary_cases_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.summary_cases
    ADD CONSTRAINT summary_cases_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_available_shifts_on_store_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_available_shifts_on_store_id ON public.available_shifts USING btree (store_id);


--
-- Name: index_departments_on_origin_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_departments_on_origin_id ON public.departments USING btree (origin_id);


--
-- Name: index_departments_on_store_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_departments_on_store_id ON public.departments USING btree (store_id);


--
-- Name: index_historic_sales_on_department_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_historic_sales_on_department_id ON public.historic_sales USING btree (department_id);


--
-- Name: index_historic_sales_on_store_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_historic_sales_on_store_id ON public.historic_sales USING btree (store_id);


--
-- Name: index_hs_on_department_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_hs_on_department_id ON public.hs USING btree (department_id);


--
-- Name: index_hs_on_store_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_hs_on_store_id ON public.hs USING btree (store_id);


--
-- Name: index_rs_on_department_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_rs_on_department_id ON public.rs USING btree (department_id);


--
-- Name: index_rs_on_store_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_rs_on_store_id ON public.rs USING btree (store_id);


--
-- Name: index_sale_plans_on_department_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_sale_plans_on_department_id ON public.sale_plans USING btree (department_id);


--
-- Name: index_sale_plans_on_store_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_sale_plans_on_store_id ON public.sale_plans USING btree (store_id);


--
-- Name: index_sale_reals_on_department_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_sale_reals_on_department_id ON public.sale_reals USING btree (department_id);


--
-- Name: index_sale_reals_on_store_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_sale_reals_on_store_id ON public.sale_reals USING btree (store_id);


--
-- Name: index_sellers_on_department_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_sellers_on_department_id ON public.sellers USING btree (department_id);


--
-- Name: index_sellers_on_store_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_sellers_on_store_id ON public.sellers USING btree (store_id);


--
-- Name: index_shift_breaks_on_seller_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_shift_breaks_on_seller_id ON public.shift_breaks USING btree (seller_id);


--
-- Name: index_sps_on_department_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_sps_on_department_id ON public.sps USING btree (department_id);


--
-- Name: index_sps_on_store_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_sps_on_store_id ON public.sps USING btree (store_id);


--
-- Name: index_staffing_reals_on_department_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_staffing_reals_on_department_id ON public.staffing_reals USING btree (department_id);


--
-- Name: index_stores_on_cluster_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_stores_on_cluster_id ON public.stores USING btree (cluster_id);


--
-- Name: index_stores_on_origin_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_stores_on_origin_id ON public.stores USING btree (origin_id);


--
-- Name: index_users_on_department_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_users_on_department_id ON public.users USING btree (department_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_store_id; Type: INDEX; Schema: public; Owner: Magnius
--

CREATE INDEX index_users_on_store_id ON public.users USING btree (store_id);


--
-- Name: sale_plans fk_rails_0114e1ed82; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sale_plans
    ADD CONSTRAINT fk_rails_0114e1ed82 FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: historic_sales fk_rails_1280d3b3fa; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.historic_sales
    ADD CONSTRAINT fk_rails_1280d3b3fa FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: sps fk_rails_143adc4732; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sps
    ADD CONSTRAINT fk_rails_143adc4732 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: shift_breaks fk_rails_3be6c8adfb; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.shift_breaks
    ADD CONSTRAINT fk_rails_3be6c8adfb FOREIGN KEY (seller_id) REFERENCES public.sellers(id);


--
-- Name: sale_reals fk_rails_4ab334433c; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sale_reals
    ADD CONSTRAINT fk_rails_4ab334433c FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: sps fk_rails_7ee155299e; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sps
    ADD CONSTRAINT fk_rails_7ee155299e FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: hs fk_rails_91370872b5; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.hs
    ADD CONSTRAINT fk_rails_91370872b5 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: historic_sales fk_rails_9243f9f41b; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.historic_sales
    ADD CONSTRAINT fk_rails_9243f9f41b FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: sale_reals fk_rails_94a7ab9fa6; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sale_reals
    ADD CONSTRAINT fk_rails_94a7ab9fa6 FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: departments fk_rails_a4f89e69bb; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT fk_rails_a4f89e69bb FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: stores fk_rails_a961131721; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT fk_rails_a961131721 FOREIGN KEY (cluster_id) REFERENCES public.clusters(id);


--
-- Name: staffing_reals fk_rails_b2f71e4525; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.staffing_reals
    ADD CONSTRAINT fk_rails_b2f71e4525 FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: sellers fk_rails_b9da527f94; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT fk_rails_b9da527f94 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: available_shifts fk_rails_c11526c214; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.available_shifts
    ADD CONSTRAINT fk_rails_c11526c214 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: users fk_rails_c6f326481e; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_c6f326481e FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: rs fk_rails_ccea61b4d5; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.rs
    ADD CONSTRAINT fk_rails_ccea61b4d5 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: rs fk_rails_e44209ac70; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.rs
    ADD CONSTRAINT fk_rails_e44209ac70 FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: sale_plans fk_rails_e8a8459ef9; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sale_plans
    ADD CONSTRAINT fk_rails_e8a8459ef9 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: sellers fk_rails_efd6f20315; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT fk_rails_efd6f20315 FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: users fk_rails_f29bf9cdf2; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_f29bf9cdf2 FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: hs fk_rails_f92948468a; Type: FK CONSTRAINT; Schema: public; Owner: Magnius
--

ALTER TABLE ONLY public.hs
    ADD CONSTRAINT fk_rails_f92948468a FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- PostgreSQL database dump complete
--

