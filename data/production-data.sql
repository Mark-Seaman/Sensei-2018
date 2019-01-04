--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO django;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO django;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO django;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO django;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO django;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO django;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO django;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO django;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO django;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO django;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO django;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO django;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO django;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO django;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO django;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO django;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO django;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO django;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO django;

--
-- Name: health_healthscore; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.health_healthscore (
    id integer NOT NULL,
    date date NOT NULL,
    sleep integer NOT NULL,
    weight integer NOT NULL,
    eat integer NOT NULL,
    exercise integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.health_healthscore OWNER TO django;

--
-- Name: health_healthscore_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.health_healthscore_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.health_healthscore_id_seq OWNER TO django;

--
-- Name: health_healthscore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.health_healthscore_id_seq OWNED BY public.health_healthscore.id;


--
-- Name: life_aspect; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.life_aspect (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.life_aspect OWNER TO django;

--
-- Name: life_aspect_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.life_aspect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.life_aspect_id_seq OWNER TO django;

--
-- Name: life_aspect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.life_aspect_id_seq OWNED BY public.life_aspect.id;


--
-- Name: life_experience; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.life_experience (
    id integer NOT NULL,
    age integer NOT NULL,
    summary text NOT NULL,
    aspect_id integer NOT NULL
);


ALTER TABLE public.life_experience OWNER TO django;

--
-- Name: life_experience_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.life_experience_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.life_experience_id_seq OWNER TO django;

--
-- Name: life_experience_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.life_experience_id_seq OWNED BY public.life_experience.id;


--
-- Name: life_year; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.life_year (
    id integer NOT NULL,
    age integer NOT NULL,
    contribute text NOT NULL,
    relate text NOT NULL,
    learn text NOT NULL,
    enjoy text NOT NULL
);


ALTER TABLE public.life_year OWNER TO django;

--
-- Name: life_year_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.life_year_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.life_year_id_seq OWNER TO django;

--
-- Name: life_year_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.life_year_id_seq OWNED BY public.life_year.id;


--
-- Name: superuser_administrator; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.superuser_administrator (
    id integer NOT NULL,
    surrogate_id integer,
    user_id integer NOT NULL
);


ALTER TABLE public.superuser_administrator OWNER TO django;

--
-- Name: superuser_administrator_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.superuser_administrator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.superuser_administrator_id_seq OWNER TO django;

--
-- Name: superuser_administrator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.superuser_administrator_id_seq OWNED BY public.superuser_administrator.id;


--
-- Name: tasks_task; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.tasks_task (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    notes text,
    date date NOT NULL,
    hours integer NOT NULL,
    done boolean NOT NULL
);


ALTER TABLE public.tasks_task OWNER TO django;

--
-- Name: tasks_task_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.tasks_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_task_id_seq OWNER TO django;

--
-- Name: tasks_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.tasks_task_id_seq OWNED BY public.tasks_task.id;


--
-- Name: tool_page; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.tool_page (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    text text,
    html text,
    expected_text text,
    expected_html text
);


ALTER TABLE public.tool_page OWNER TO django;

--
-- Name: tool_page_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.tool_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tool_page_id_seq OWNER TO django;

--
-- Name: tool_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.tool_page_id_seq OWNED BY public.tool_page.id;


--
-- Name: tool_project; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.tool_project (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    user_id integer
);


ALTER TABLE public.tool_project OWNER TO django;

--
-- Name: tool_project_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.tool_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tool_project_id_seq OWNER TO django;

--
-- Name: tool_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.tool_project_id_seq OWNED BY public.tool_project.id;


--
-- Name: tool_test; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.tool_test (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    output text,
    expected text
);


ALTER TABLE public.tool_test OWNER TO django;

--
-- Name: tool_test_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.tool_test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tool_test_id_seq OWNER TO django;

--
-- Name: tool_test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.tool_test_id_seq OWNED BY public.tool_test.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.health_healthscore ALTER COLUMN id SET DEFAULT nextval('public.health_healthscore_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.life_aspect ALTER COLUMN id SET DEFAULT nextval('public.life_aspect_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.life_experience ALTER COLUMN id SET DEFAULT nextval('public.life_experience_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.life_year ALTER COLUMN id SET DEFAULT nextval('public.life_year_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.superuser_administrator ALTER COLUMN id SET DEFAULT nextval('public.superuser_administrator_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.tasks_task ALTER COLUMN id SET DEFAULT nextval('public.tasks_task_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.tool_page ALTER COLUMN id SET DEFAULT nextval('public.tool_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.tool_project ALTER COLUMN id SET DEFAULT nextval('public.tool_project_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.tool_test ALTER COLUMN id SET DEFAULT nextval('public.tool_test_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add client	1	add_client
2	Can change client	1	change_client
3	Can delete client	1	delete_client
4	Can add role	2	add_role
5	Can change role	2	change_role
6	Can delete role	2	delete_role
7	Can add project	3	add_project
8	Can change project	3	change_project
9	Can delete project	3	delete_project
10	Can add node	4	add_node
11	Can change node	4	change_node
12	Can delete node	4	delete_node
13	Can add church	5	add_church
14	Can change church	5	change_church
15	Can delete church	5	delete_church
16	Can add leader	6	add_leader
17	Can change leader	6	change_leader
18	Can delete leader	6	delete_leader
19	Can add church score	7	add_churchscore
20	Can change church score	7	change_churchscore
21	Can delete church score	7	delete_churchscore
22	Can add church event	8	add_churchevent
23	Can change church event	8	change_churchevent
24	Can delete church event	8	delete_churchevent
25	Can add church budget	9	add_churchbudget
26	Can change church budget	9	change_churchbudget
27	Can delete church budget	9	delete_churchbudget
28	Can add log entry	10	add_logentry
29	Can change log entry	10	change_logentry
30	Can delete log entry	10	delete_logentry
31	Can add permission	11	add_permission
32	Can change permission	11	change_permission
33	Can delete permission	11	delete_permission
34	Can add group	12	add_group
35	Can change group	12	change_group
36	Can delete group	12	delete_group
37	Can add user	13	add_user
38	Can change user	13	change_user
39	Can delete user	13	delete_user
40	Can add content type	14	add_contenttype
41	Can change content type	14	change_contenttype
42	Can delete content type	14	delete_contenttype
43	Can add session	15	add_session
44	Can change session	15	change_session
45	Can delete session	15	delete_session
46	Can add health score	16	add_healthscore
47	Can change health score	16	change_healthscore
48	Can delete health score	16	delete_healthscore
49	Can add author	17	add_author
50	Can change author	17	change_author
51	Can delete author	17	delete_author
52	Can add book	18	add_book
53	Can change book	18	change_book
54	Can delete book	18	delete_book
55	Can add administrator	19	add_administrator
56	Can change administrator	19	change_administrator
57	Can delete administrator	19	delete_administrator
58	Can add task	20	add_task
59	Can change task	20	change_task
60	Can delete task	20	delete_task
61	Can add test	21	add_test
62	Can change test	21	change_test
63	Can delete test	21	delete_test
64	Can add page	22	add_page
65	Can change page	22	change_page
66	Can delete page	22	delete_page
67	Can add project	23	add_project
68	Can change project	23	change_project
69	Can delete project	23	delete_project
70	Can add goal	24	add_goal
71	Can change goal	24	change_goal
72	Can delete goal	24	delete_goal
73	Can add doc	25	add_doc
74	Can change doc	25	change_doc
75	Can delete doc	25	delete_doc
76	Can add thot	26	add_thot
77	Can change thot	26	change_thot
78	Can delete thot	26	delete_thot
79	Can add thot book	27	add_thotbook
80	Can change thot book	27	change_thotbook
81	Can delete thot book	27	delete_thotbook
82	Can add budget	28	add_budget
83	Can change budget	28	change_budget
84	Can delete budget	28	delete_budget
85	Can add budget category	29	add_budgetcategory
86	Can change budget category	29	change_budgetcategory
87	Can delete budget category	29	delete_budgetcategory
88	Can add money	30	add_money
89	Can change money	30	change_money
90	Can delete money	30	delete_money
91	Can add category	31	add_category
92	Can change category	31	change_category
93	Can delete category	31	delete_category
94	Can add money client	32	add_moneyclient
95	Can change money client	32	change_moneyclient
96	Can delete money client	32	delete_moneyclient
97	Can add review score	33	add_reviewscore
98	Can change review score	33	change_reviewscore
99	Can delete review score	33	delete_reviewscore
100	Can add money	34	add_money
101	Can change money	34	change_money
102	Can delete money	34	delete_money
103	Can add reviewer score	35	add_reviewerscore
104	Can change reviewer score	35	change_reviewerscore
105	Can delete reviewer score	35	delete_reviewerscore
106	Can add wiki doc	36	add_wikidoc
107	Can change wiki doc	36	change_wikidoc
108	Can delete wiki doc	36	delete_wikidoc
109	Can add course	37	add_course
110	Can change course	37	change_course
111	Can delete course	37	delete_course
112	Can add student	38	add_student
113	Can change student	38	change_student
114	Can delete student	38	delete_student
115	Can add course	39	add_course
116	Can change course	39	change_course
117	Can delete course	39	delete_course
118	Can add student	40	add_student
119	Can change student	40	change_student
120	Can delete student	40	delete_student
121	Can add review	41	add_review
122	Can change review	41	change_review
123	Can delete review	41	delete_review
124	Can add aspect	42	add_aspect
125	Can change aspect	42	change_aspect
126	Can delete aspect	42	delete_aspect
127	Can add experience	43	add_experience
128	Can change experience	43	change_experience
129	Can delete experience	43	delete_experience
130	Can add year	44	add_year
131	Can change year	44	change_year
132	Can delete year	44	delete_year
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 132, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$36000$62KSeQlGP4ck$HJi2Ug5Pfw764Ma578HjlLmKnl6LMqpW2D/fRqUtvyo=	2018-02-17 22:19:16.916101+00	f	StacieSeaman	Stacie	Seaman	Stacie.Seaman@gmail.com	t	t	2017-08-14 22:44:27.760861+00
1	pbkdf2_sha256$36000$l3MBrZDF5pDf$d72tjaHBa6PeGcoUMkzwlu/oGKrvAWHn0cF18yBBiGc=	2019-01-03 19:10:46.199089+00	f	MarkSeaman	Mark	Seaman	Mark.B.Seaman@gmail.com	t	t	2017-04-12 13:53:38.916+00
4	pbkdf2_sha256$36000$OHhS10nw7ups$kV7BdNUDJ43L0R3Of1vqeQKfoksm0bwjB73qWVAs8dE=	\N	f	JennyBeilman	Jenny	Beilman	jennyb@greeleyvineyard.org	t	t	2017-08-14 22:48:11.541665+00
3	pbkdf2_sha256$36000$fxcELW0AaG3Y$0l/wIXbHCGGkY7QZwTXrpqH1Z2t0zSBBwygkj7yvlQg=	2018-01-09 22:48:14.532048+00	f	KyleWhitlow	Kyle	Whitlow	whitlow.k@gmail.com	t	t	2017-08-14 22:47:55.476422+00
5	pbkdf2_sha256$36000$wR6fpQSVD91v$LxQrE75exG4vSF4X9a0SYrEkSXpCJxOTpto5S0Z+qu4=	2018-01-26 00:50:00.56793+00	f	ToddBeilman	Todd	Beilman	toddb@greeleyvineyard.org	t	t	2017-08-14 22:48:18.314431+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	aspire	client
2	aspire	role
3	aspire	project
4	aspire	node
5	church	church
6	church	leader
7	church	churchscore
8	church	churchevent
9	church	churchbudget
10	admin	logentry
11	auth	permission
12	auth	group
13	auth	user
14	contenttypes	contenttype
15	sessions	session
16	health	healthscore
17	mybook	author
18	mybook	book
19	superuser	administrator
20	tasks	task
21	tool	test
22	tool	page
23	tool	project
24	aspire	goal
25	doc	doc
26	workshop	thot
27	workshop	thotbook
28	church	budget
29	church	budgetcategory
30	workshop	money
31	workshop	category
32	workshop	moneyclient
33	unc	reviewscore
34	church	money
35	unc	reviewerscore
36	wiki	wikidoc
37	guide	course
38	guide	student
39	unc	course
40	unc	student
41	unc	review
42	life	aspect
43	life	experience
44	life	year
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 44, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-04-12 13:32:04.246953+00
2	auth	0001_initial	2017-04-12 13:32:04.346751+00
3	admin	0001_initial	2017-04-12 13:32:04.373668+00
4	admin	0002_logentry_remove_auto_add	2017-04-12 13:32:04.390769+00
5	aspire	0001_initial	2017-04-12 13:32:04.470769+00
6	contenttypes	0002_remove_content_type_name	2017-04-12 13:32:04.52346+00
7	auth	0002_alter_permission_name_max_length	2017-04-12 13:32:04.545252+00
8	auth	0003_alter_user_email_max_length	2017-04-12 13:32:04.563755+00
9	auth	0004_alter_user_username_opts	2017-04-12 13:32:04.582219+00
10	auth	0005_alter_user_last_login_null	2017-04-12 13:32:04.602699+00
11	auth	0006_require_contenttypes_0002	2017-04-12 13:32:04.605068+00
12	auth	0007_alter_validators_add_error_messages	2017-04-12 13:32:04.623609+00
13	sessions	0001_initial	2017-04-12 13:32:04.637191+00
14	superuser	0001_initial	2017-04-12 13:32:04.666263+00
15	tasks	0001_initial	2017-04-12 13:32:04.677981+00
16	tool	0001_initial	2017-04-12 13:32:04.731184+00
17	mybook	0001_initial	2017-04-12 13:47:03.551957+00
18	church	0001_initial	2017-04-12 13:56:46.108716+00
19	aspire	0002_auto_20170412_1142	2017-04-12 17:42:45.0733+00
20	aspire	0003_goal	2017-04-14 17:54:58.028528+00
21	aspire	0004_auto_20170420_1346	2017-04-20 19:46:39.92145+00
22	doc	0001_initial	2017-04-20 19:47:29.960671+00
23	auth	0008_alter_user_username_max_length	2017-04-30 14:27:06.481874+00
24	health	0001_initial	2017-04-30 14:27:06.525337+00
25	mybook	0002_auto_20170502_1436	2017-05-02 20:36:53.658608+00
26	workshop	0001_initial	2017-05-29 12:43:36.081389+00
27	workshop	0002_auto_20170619_1607	2017-06-19 22:07:39.723589+00
28	church	0002_auto_20170728_1711	2017-07-28 23:11:56.755676+00
29	workshop	0003_auto_20170728_1711	2017-07-28 23:11:56.86204+00
30	church	0003_auto_20170815_1130	2017-08-15 17:30:14.45171+00
31	unc	0001_initial	2017-11-07 18:30:06.075743+00
32	church	0004_money	2017-11-11 22:43:11.592456+00
33	unc	0002_auto_20171112_1726	2017-11-13 00:26:33.248421+00
34	church	0005_auto_20171221_1308	2017-12-21 20:08:11.735004+00
35	church	0006_auto_20171228_1553	2017-12-28 22:53:50.807478+00
36	church	0007_remove_money_mortgage	2017-12-28 23:22:26.385325+00
37	church	0008_auto_20180107_1728	2018-01-08 00:28:08.83516+00
38	wiki	0001_initial	2018-05-01 15:20:05.581843+00
39	wiki	0002_wikidoc_slug	2018-05-01 19:11:33.928454+00
40	guide	0001_initial	2018-10-10 13:13:06.837103+00
41	unc	0003_auto_20181010_0713	2018-10-10 13:13:06.968904+00
42	unc	0004_review_notes	2018-10-10 15:41:34.679095+00
43	unc	0005_auto_20181011_1322	2018-10-11 19:22:22.860371+00
44	life	0001_initial	2018-11-27 21:58:48.371402+00
45	aspire	0002_auto_20170410_1739	2018-12-14 19:54:01.604912+00
46	unc	0002_auto_20181228_1806	2018-12-29 01:06:55.256045+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 46, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
qc3d7r5b0xy0r7nn89qx8xf02kpenxsv	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-20 19:30:28.373987+00
rsm1nhguyofen0ylsyqobudtfclxqps6	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-11 13:56:24.626923+00
h7b2xgmycyo7y3727ev24ttx81odndgb	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-13 21:19:56.016449+00
ffwj0vay175omkjccbmvp9l39ac4yvi9	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-13 21:32:54.602712+00
ftfijfdf9lo136zozf08xzyb0qkvnvml	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-13 21:33:02.582684+00
h39d7vmdhvix9p3pu54i40g57w218tzy	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-13 22:48:34.992422+00
lugrjc9if9kd5uc0ztx7qxm1ztcdphax	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-13 23:20:02.017788+00
rofvz4cd0tw95mvie6mtnsxqj1zh1lqy	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-13 23:20:09.756602+00
kr5t6tl3fxz3iycg8eafdf4cj8sp9q5i	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-14 21:27:34.896447+00
5bbwenj6w084s6oxtsxsllr50o9kfdgg	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-14 21:27:40.250839+00
4gf1a2aonp95dpnv79v5lr1pvxvw0mbw	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-14 21:32:09.54982+00
48g2a2m25xwn3r3sjl3k670aw7vnu73c	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-14 21:32:14.747471+00
cn5nsol1cat22ail5hy67e27w83lrk1g	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-14 21:55:27.706732+00
ye1ubdf35f5e8ddgjuhb1wyx5d2lcbnk	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-14 21:55:32.379132+00
0l7qy27zznmsltbziwpqwfajuw9ic57c	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-13 22:34:10.292+00
0ol4jqacqldh5rfii9vbzdkkd5z89vr5	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-13 22:44:10.603+00
732mdseojdfusloza1imeo10sa8kh2xa	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-06 18:57:14.962+00
a9joba5wcufdejogswrqhegq2g885okv	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-06 16:32:40.525+00
ey3vcpgxupbjs2y0g701wt5eh4xxtn7x	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-05 14:59:17.099+00
f6z03vv40lcgt9sllbu0pxira51xa820	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-13 22:44:02.812+00
fdgf74hfh9oc3xpyntojuglr3tcp357q	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-11 00:23:40.387+00
nbz198ut20t57is40tc67m0g95zq2eup	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-13 22:41:47.365+00
p0v7uhuutv4d884a4k2op3t1xtmmrm8q	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-13 17:02:33.058+00
pus8eslv74xfwew9o93vvpjc1mel0eiq	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-13 22:34:18.095+00
qzijw5euz3jdyz9e8uvlcip0ve2dpk7v	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-04 20:34:39.41+00
trmdhz4wkkym8hm7b6wbfr526ngkxpj5	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-12 13:12:57.308+00
vf929gpqbcw3sqio278kk0ex74ehxme3	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-13 17:02:40.9+00
xa0hcw4l8in1i03fsa8uxbt1wmvg2r2u	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-05 12:29:57.665+00
z7utm0744zsppg2hs6x9dd1blxc505yh	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-13 22:41:38.674+00
w2jabfv8edbivw4bgg5r3obv5gnd9vmk	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-15 22:47:16.044397+00
mazbsn92zults7vr9h36mbwrqav612hd	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-08 12:56:21.428016+00
44nheg2ra39gpb66ai0h2d1m92vo85ey	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-15 22:47:23.938684+00
btjy7yggiccfx7supquu4iigijjfwnvi	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-15 22:58:33.794672+00
1k4wf9pfvyfy3s1ri284idojuqynxsbv	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-13 21:19:48.242997+00
5yr7tmx13n0c0li5zbzwbh6br2run8ud	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-15 22:58:41.628076+00
6fsx6wdybss3h76pbpo4imw1z22o7ie8	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-16 18:05:08.237228+00
9i6td9wimxfy9sq2org8llnnvn99gxdg	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-16 18:05:16.943793+00
hpiv209juj8zcdd6emcivoa8girzehn0	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-16 18:54:27.208012+00
m2yhatoozl10ywup578i12p548dsrh36	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-16 22:13:00.236477+00
n8pthrapcva1lxhgw16s3o8qfccvi1d9	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-16 22:13:05.309697+00
mwkoea312wxkj33yvfky0w3l5x55sgoc	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-17 13:07:36.096783+00
467o40goo7bbw24t83369jmp4hm0cnzc	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-17 13:07:43.948734+00
9qbyd3vb4cd22jelcaaww1va5osbnaki	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-17 13:12:38.935862+00
mqydthg9qdlrtzxyqs207x0snb1sackr	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-17 13:12:46.782375+00
ngaygscxe6bqy10bpdm2iomaz4w82aon	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-18 12:51:23.686256+00
o2n6pd4y71cnn69h1lzngz45zbkd513p	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-18 12:51:28.800943+00
u9hxppllplwhrr33e8x56w0yc7vyqrzw	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-20 19:21:39.455333+00
zl7vt7bwbl39cs7e8oghwavmx1pis0wo	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-14 22:00:21.38053+00
ffxowf7xq2jwjzrxxhq4nty5z2tn7nbq	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-13 17:12:49.266953+00
b8olx65pm5mnd43t0j1jc377gzl5tvwx	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-02-10 22:18:38.724821+00
hi9kdrs46oz0z7wemjh936l43eefbqfa	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-14 22:00:26.059143+00
79r13gcnyqe7pxj1u7mgkhe4q6yix47t	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-13 17:12:54.012895+00
uy9g25mq8h9f0hkf4io7zme79tmppirg	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-02-11 15:32:38.191888+00
qjki72m0wiyb5od7cg81pc70ru2cq97f	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-02-27 00:59:11.028021+00
kppk46j9k3ah3d5cf1tmj6phva1ik82x	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-03-13 16:17:10.717585+00
m5on4c1z5btjbyzsrsd5clig41n6uxrp	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-04-03 21:06:40.009368+00
r0t0wwfj1uplyo1f2xnrbdzpackdyx6n	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-09-04 18:25:53.9158+00
jbox2fxa0gsog7srxhe453lea2imyh8q	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-14 22:08:16.620567+00
z00xq07u49v3u4ovy5c53nxo3df3yptf	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-13 17:29:55.765582+00
ecbxybsqg38pcl3znqmjiu3dw0rymkfd	MTg4OTVjYjFmZmU5ODNlNWFhY2Q4Zjc5YjZhZjgzMGU2MDE5NTRmZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjYyMmRjYTliYTk3YWFmMjU1NDdlNmQzNDNkYmE1MDYzMGJhODQzOTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2018-03-03 22:19:16.92135+00
fu0855zpxri72n6bur109esim57i30lt	NDBmZGY2YWZlZWNhZWMyYzY0ZTBkMWFhMDdlY2Y1YWNlYTI5NGRkMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjUxMjU4ODg2NjBkYTdhMzliMDNjNDAwZjk5NjM2YTY4NDRmYWQwYTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-08-29 19:06:08.563848+00
y4ig5t1ohia1lf3j7iuoq8wc3yj6gsal	MTg4OTVjYjFmZmU5ODNlNWFhY2Q4Zjc5YjZhZjgzMGU2MDE5NTRmZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjYyMmRjYTliYTk3YWFmMjU1NDdlNmQzNDNkYmE1MDYzMGJhODQzOTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2017-12-20 16:48:17.38667+00
4fz8gmk6nir7v36jk4xus4nglr3yi0oh	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-03-18 15:08:22.442943+00
pfviy2q9hgxpvi8ic4iokf1c1s2k78j9	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-01-30 20:16:17.817598+00
to8f493l8lhcchyt1jrsnxx009avky68	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-04-12 16:37:13.528228+00
hzw6mxdlekdz18cb7i0d11nh455ef7ys	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-09-19 14:03:17.59778+00
czxd5g92wjmajyn6sajkery4q9zzkq44	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-14 22:08:21.14323+00
li20vuy8dwr0l6p8haxsoh3t5l7hc40t	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-13 17:30:05.874903+00
cxhiljkp2cqxiu7dntwmv4d6l4zm6q1b	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-04-20 14:11:10.23109+00
mqeupclc0wq412r1zoyk1se0o9oeo9oa	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-02 01:25:33.798576+00
rhxp4qxdyk4mzq684t8esootjugcm623	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-01-04 17:13:01.044425+00
yoaryb1iz3aa80lggs99ti7ditgyw033	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-09-25 16:48:19.066236+00
872yfseue25aql4swem9x6wrsb3xk82a	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-01-30 20:17:07.859503+00
i2m86bmbkkdhq24se0g0rqokc86i148d	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-15 21:26:29.78297+00
iq586zxcgu68a542wo3uc8iyve51aabw	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-13 22:15:18.676781+00
oiiaizah8cuppuwamxuplc99s05i9ovq	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-05-15 15:20:41.850028+00
87zs4w3l96t4ucrscipw62rb3l71f2r6	ZmExZmNhZjYxMDMyM2ExMDZkNTRmNWMyZWVkYTlmZmYzZTY4NTJkODp7Il9hdXRoX3VzZXJfaGFzaCI6ImIxNjZjMTQxZDg2YmZhM2U0MTkyYzRlZmNmNTExNTU1ZjUwYTEyZDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=	2017-09-02 14:59:29.64969+00
j2jy87efu90lka2plfnth9t3wkff69r5	MTg4OTVjYjFmZmU5ODNlNWFhY2Q4Zjc5YjZhZjgzMGU2MDE5NTRmZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjYyMmRjYTliYTk3YWFmMjU1NDdlNmQzNDNkYmE1MDYzMGJhODQzOTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2018-01-11 17:09:02.443762+00
u0bawle4ax9driufby32ehm8b5a63mj5	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-10-04 15:04:54.244536+00
52fc4f6hg4ehqanvzooobanuynw3rm9i	MTg4OTVjYjFmZmU5ODNlNWFhY2Q4Zjc5YjZhZjgzMGU2MDE5NTRmZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjYyMmRjYTliYTk3YWFmMjU1NDdlNmQzNDNkYmE1MDYzMGJhODQzOTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2018-02-08 22:48:56.911759+00
76cyljd7barrnr80xaweguzcymttkrsq	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-15 21:26:34.460395+00
4fbijgu8m5l3u7327lb2ce6hkr6a8utq	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-13 22:15:23.164801+00
esknahze72rebsxi7px220btihe3djfq	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-05-15 17:12:52.412167+00
tp2uiiqs8szv655ybhkcnswo5tdxy77x	ZmExZmNhZjYxMDMyM2ExMDZkNTRmNWMyZWVkYTlmZmYzZTY4NTJkODp7Il9hdXRoX3VzZXJfaGFzaCI6ImIxNjZjMTQxZDg2YmZhM2U0MTkyYzRlZmNmNTExNTU1ZjUwYTEyZDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=	2017-09-03 02:23:20.077621+00
wj67sgh5bsd313dvr7nkgf8rbptj59o3	ZmExZmNhZjYxMDMyM2ExMDZkNTRmNWMyZWVkYTlmZmYzZTY4NTJkODp7Il9hdXRoX3VzZXJfaGFzaCI6ImIxNjZjMTQxZDg2YmZhM2U0MTkyYzRlZmNmNTExNTU1ZjUwYTEyZDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=	2018-01-11 20:35:25.073933+00
5fx1rmhozhedmg008g9yvsaz3nurxwq1	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-10-15 03:38:12.240672+00
26cphs178gi63uo0yoour4kngcf4i2c1	ZmExZmNhZjYxMDMyM2ExMDZkNTRmNWMyZWVkYTlmZmYzZTY4NTJkODp7Il9hdXRoX3VzZXJfaGFzaCI6ImIxNjZjMTQxZDg2YmZhM2U0MTkyYzRlZmNmNTExNTU1ZjUwYTEyZDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=	2018-02-09 00:08:34.019001+00
djao0ss41qlggd33hirqlf6s7x1zv6am	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-16 13:02:25.900186+00
eclvowt3l90k1c4teha4mgximgx1edli	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-18 14:20:14.844546+00
otnwhm3t6n8mk9c8g59f5odw03dbn1nz	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-05-22 22:49:21.556276+00
n0chwdvvmpig91w27ly0l921b3yg0z8j	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-03 16:44:15.621859+00
m1f5tq41ajb9347sxy1fe25yc9il4zqy	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-01-16 18:50:27.707233+00
vev5u7v8vnmy5i061bpjhbev3jpv6691	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-10-18 18:55:37.605827+00
r65bbsgc5ct8dc6b2bmf9knihh0m713y	ZmExZmNhZjYxMDMyM2ExMDZkNTRmNWMyZWVkYTlmZmYzZTY4NTJkODp7Il9hdXRoX3VzZXJfaGFzaCI6ImIxNjZjMTQxZDg2YmZhM2U0MTkyYzRlZmNmNTExNTU1ZjUwYTEyZDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=	2018-02-09 00:50:00.570541+00
r1wqiyl9x0st61x51r107uy1qqrpg3bw	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-16 13:02:30.41284+00
n4c2vu1pxhvvymmne8a165vcp6vffu1t	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-18 19:31:48.654835+00
4v4034zx85cgui4xlvgm41t7kkz9criw	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-06-07 22:41:05.905377+00
deql2gbesxggaisomr7ctwdua1k1y99x	NDBmZGY2YWZlZWNhZWMyYzY0ZTBkMWFhMDdlY2Y1YWNlYTI5NGRkMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjUxMjU4ODg2NjBkYTdhMzliMDNjNDAwZjk5NjM2YTY4NDRmYWQwYTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-09-11 17:26:11.891612+00
950uw1netztzej7d0o1r6ha494cr2gat	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-01-16 18:57:56.799988+00
01t4kllkj7uvp3h3tkf3eq0lzc1sr3hm	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-10-20 14:28:04.31207+00
ma7yndg06peigj17s3x6u16tgob8fsjw	MTg4OTVjYjFmZmU5ODNlNWFhY2Q4Zjc5YjZhZjgzMGU2MDE5NTRmZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjYyMmRjYTliYTk3YWFmMjU1NDdlNmQzNDNkYmE1MDYzMGJhODQzOTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2018-02-09 00:56:16.647406+00
g6ueot2xs7eatqplenl67t9ptrenna10	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-16 16:45:14.189353+00
d5f1s2hz4qq05gg5h02l16vz6l84hzrd	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-31 18:49:37.450108+00
ml8p8tkz4v429o46nqtab7p98pd2x7tj	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-06-08 19:48:53.908727+00
p4po4svss4xvfg90mc6xkaeib31nqmdf	NDBmZGY2YWZlZWNhZWMyYzY0ZTBkMWFhMDdlY2Y1YWNlYTI5NGRkMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjUxMjU4ODg2NjBkYTdhMzliMDNjNDAwZjk5NjM2YTY4NDRmYWQwYTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2018-01-23 22:48:14.535028+00
javpw5bqgqt4vi129sg35mxaaoto9xfa	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-02-10 20:16:16.966794+00
9ulrhj3j7vb7tc7kklu8gtv364on642c	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-16 18:00:28.091971+00
dqo0f26zn8v55egg8998gn8qdlhi9xxm	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-08-01 23:02:49.735144+00
1cttfenqj6yiwd6j5hrm8fhd4ig63n1s	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-06-11 16:18:10.79996+00
wjburtdervoc1s9125gb3en3z5glo46m	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-13 22:54:48.825922+00
two3ugjsdbm71e21aff0fi8ltlt1gtvj	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-02-10 20:16:21.738196+00
862z9ylaz4adg2w4hc9dw3ybg9e6b80r	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-11-09 00:54:29.903284+00
3zsno24rrexmvkwx09iv6evn2xg5x65j	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-16 18:00:33.84354+00
4e0f48i0j3nh1wwco9zh6gsj04zvifek	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-08-01 23:02:55.47602+00
agq71se2h2v2enppahqdftydr2s04gbi	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-06-29 22:05:10.334744+00
b6bcyyltxvqme3ruqruur9tm4kp67ces	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-14 21:48:10.705467+00
3xgwrnu1i957cpopvsp14sbt3o3341id	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-02-10 22:01:35.369716+00
5jmwbfkom7x0fgwlxlf5qds9tsuta0y1	ZDM5NjI2NzQ0OGY3M2VlMTJjZjc2NTFmZTY0NTAwZWVkMTljYjJmNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-11-09 00:55:19.023518+00
0awzgf2l7oh36fnktsvf3t8ici5fgydl	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-16 18:03:06.721818+00
252l6u1h4nl777ttwqw4bsdje0t1iyjn	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-08-01 23:08:45.531847+00
ev4xrq87gpxdvxkq9cnslhbriygj0tvg	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-07-15 21:23:53.824269+00
h1nie1nz8opik30f0d5ilrjc3sko19c6	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-14 21:48:15.305051+00
vh1ecaer74viko11y5g7btlpiww5m9qp	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-11-09 00:59:08.85384+00
4ay2mszhxhmk77mkennyzdm8hwie2vh2	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-16 18:03:11.23802+00
4x9b5qwkahpb94ytgp4c8yai4p3jsvzr	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-08-01 23:08:50.770531+00
al2g2bw2z2emaxeqgs56gzi8n9cmikj7	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-14 22:15:47.559187+00
hnhyns46k2grso7nwo5t5lra2tpn71of	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-12-01 15:43:14.115647+00
606j0jw9m4w6ojdowe7o3iqknlt45jfs	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-19 21:16:36.993472+00
qa3t90op3ejcccn1wgm69415gn7iynmd	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-08-02 15:39:42.538256+00
ler09vc38z6kul062mufvu9unqf8wt6j	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-14 22:21:30.144123+00
7sqc5kw9w4acc480dzrkwp9p713o5n6z	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-12-18 21:21:08.972965+00
ledh9dr1ra5dblcfejvoj40nz0efnwol	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-19 21:16:42.084993+00
sdsdykydpvw756rtvqfb4iosy30oc7yc	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-08-02 15:39:47.670473+00
m0b26f03ac08qvegf0d99thcffvb8j6h	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-14 22:21:34.643408+00
bvz5l3rux6kfqh7sy60tki07fq5irbkw	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-12-18 22:21:38.04031+00
rueqah2t049rtko35niq79das5yn5tnx	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-21 15:43:20.047643+00
vtre5qa7d649yzxxeflqalwimpdo0v8i	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-08-09 15:31:53.723331+00
5u0ynu154h18v19gwqyvz2gtn5picn7t	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-08-20 18:51:42.718655+00
eoepxqsfvq7lkw4a9xj1en5l4e9sq2dg	ZmExZmNhZjYxMDMyM2ExMDZkNTRmNWMyZWVkYTlmZmYzZTY4NTJkODp7Il9hdXRoX3VzZXJfaGFzaCI6ImIxNjZjMTQxZDg2YmZhM2U0MTkyYzRlZmNmNTExNTU1ZjUwYTEyZDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=	2017-09-15 01:10:55.430247+00
amgsz4g9knudnbaurbbdod5d52us8x0n	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-12-26 22:39:46.975196+00
457ygayajh8b9sb5wwu0elb42ktxxm8g	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-27 13:52:34.894695+00
ai93cwdbpnqe0al9mpirnumosgpeygm0	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-08-12 21:15:38.326572+00
b3twgfqw6tmiqqxya1whoutu1dg3g3vm	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-12-27 21:06:55.956423+00
yey8stolwd80fdnjhndic9dazti0orug	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-27 13:52:40.037132+00
lq99kvr6v1omdjypby4lcslzuhuys78q	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-08-12 21:15:42.788658+00
kpl38ryswm9nhybddu3a45l1isfyk23c	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-12-28 17:53:55.150409+00
63ms6smkv6tiv03qzfou1wcijc2w9dpi	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-23 17:01:25.364843+00
kyrwid9v14v37ynxzr2ennpf9gcjijrp	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-30 16:50:18.982876+00
bfuhdjkl5cp0cnnnrp0zq4a6d6mzgx74	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-08-12 21:20:08.323035+00
6zbyb7kt97flic4oxjav00cgxd52hyis	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-12-30 20:35:21.457429+00
etdbp0qzz2k9vucdmjjr18gmwjcrf8ec	NDBmZGY2YWZlZWNhZWMyYzY0ZTBkMWFhMDdlY2Y1YWNlYTI5NGRkMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjUxMjU4ODg2NjBkYTdhMzliMDNjNDAwZjk5NjM2YTY4NDRmYWQwYTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-09-25 16:48:09.611222+00
yoy9uyk6zv1h5kluez8odd5xjxn5edyb	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-30 16:50:24.025284+00
p4zqnmp12d4blqg33pb7dvlztix8a90p	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-08-12 21:20:12.944961+00
g2j4hoowyxcxwk4vfxm0k2erm2p323br	ZmExZmNhZjYxMDMyM2ExMDZkNTRmNWMyZWVkYTlmZmYzZTY4NTJkODp7Il9hdXRoX3VzZXJfaGFzaCI6ImIxNjZjMTQxZDg2YmZhM2U0MTkyYzRlZmNmNTExNTU1ZjUwYTEyZDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=	2017-10-11 23:16:15.246684+00
brg852kyi8soh8tucimomwv0n09o2uqk	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-30 17:19:32.326107+00
vl3bqu1s0aeytx2oid7biup6e5enmqga	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-08-12 21:21:50.311501+00
tuhsw5vy2krstvufuc68a4kblj8rkij4	MTg4OTVjYjFmZmU5ODNlNWFhY2Q4Zjc5YjZhZjgzMGU2MDE5NTRmZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjYyMmRjYTliYTk3YWFmMjU1NDdlNmQzNDNkYmE1MDYzMGJhODQzOTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2017-10-12 01:25:36.454786+00
w5tpuw6uikqy8osnhg7v2gu5pix464iw	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-30 17:19:36.720237+00
myojqioxz2eed8wpcrhcn2lunauxx0ww	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-08-12 21:21:54.728258+00
1c8vakwbwx5rgy7w7o703djhes85g2cc	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-01-03 18:49:21.866852+00
njkde8028d4ktvv5ph6oa6w9ovwxcrhy	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-10-15 21:50:21.037437+00
i4u1lzibq9mqn6j1y4m9f4e20vj4kj2j	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-30 17:36:18.817477+00
wzb03ren40j6eaid03ilug8w9z7b27pe	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-08-16 14:20:15.337085+00
y36jo3fa22t9xzx7opcrzjfndg5ssimn	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-01-17 19:10:46.204023+00
inturdempcd0uw65lymuqtr82gscbje8	NDBmZGY2YWZlZWNhZWMyYzY0ZTBkMWFhMDdlY2Y1YWNlYTI5NGRkMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjUxMjU4ODg2NjBkYTdhMzliMDNjNDAwZjk5NjM2YTY4NDRmYWQwYTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-10-18 21:40:24.545974+00
m065j60bp268zcc0dfzz712b6s7i5pot	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-30 17:36:23.388762+00
d6qt7lrof606i48r2fe2dzzmeu2sq6ig	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-08-16 14:20:19.779443+00
uywxn2j561v4a6cxs4ufvaz9sx5drkch	ZmExZmNhZjYxMDMyM2ExMDZkNTRmNWMyZWVkYTlmZmYzZTY4NTJkODp7Il9hdXRoX3VzZXJfaGFzaCI6ImIxNjZjMTQxZDg2YmZhM2U0MTkyYzRlZmNmNTExNTU1ZjUwYTEyZDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=	2017-10-25 17:20:19.585744+00
h7nw0v4k97gys3n5iunje1x6rk8ospop	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-30 17:41:25.394811+00
cesdn1ibw3r7p8l7lg2n355gnugqvfiy	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-10-29 02:21:01.544808+00
3975uyt7vagcrjvf9t8bp28pyw52icrx	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-30 17:41:30.016438+00
49cq84gp5n6tpu9mn0m10r1tz9g395ka	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-08-28 14:16:50.38064+00
4823qibsepysvxukzd26yx4lkpgv4r5l	MTg4OTVjYjFmZmU5ODNlNWFhY2Q4Zjc5YjZhZjgzMGU2MDE5NTRmZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjYyMmRjYTliYTk3YWFmMjU1NDdlNmQzNDNkYmE1MDYzMGJhODQzOTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2017-11-04 19:50:03.111046+00
yjyxlsuiysvqokmuyxm6yvi52s8ksfca	NDBmZGY2YWZlZWNhZWMyYzY0ZTBkMWFhMDdlY2Y1YWNlYTI5NGRkMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjUxMjU4ODg2NjBkYTdhMzliMDNjNDAwZjk5NjM2YTY4NDRmYWQwYTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-08-28 22:49:16.540098+00
hfypbf5efnscacbn2u8j2nph66415pbb	MTg4OTVjYjFmZmU5ODNlNWFhY2Q4Zjc5YjZhZjgzMGU2MDE5NTRmZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjYyMmRjYTliYTk3YWFmMjU1NDdlNmQzNDNkYmE1MDYzMGJhODQzOTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2017-11-04 20:45:15.880345+00
7z9jlhnkxantmojdgfnim1eip550eotx	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-04 19:26:26.225661+00
44j58hsen6vnmbdptk17ycakzo1pqcfk	NDBmZGY2YWZlZWNhZWMyYzY0ZTBkMWFhMDdlY2Y1YWNlYTI5NGRkMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjUxMjU4ODg2NjBkYTdhMzliMDNjNDAwZjk5NjM2YTY4NDRmYWQwYTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-08-29 15:45:02.81261+00
j6ekbmdql3j0feficlq3oxkohidjxffi	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-11-04 20:46:36.883467+00
2z4q8o4f6adang8y7n67vbv1h20fv2xu	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-04 19:26:30.799589+00
v1q2nia8bw7j4eo3y20obvnmcly1uxrg	ZmExZmNhZjYxMDMyM2ExMDZkNTRmNWMyZWVkYTlmZmYzZTY4NTJkODp7Il9hdXRoX3VzZXJfaGFzaCI6ImIxNjZjMTQxZDg2YmZhM2U0MTkyYzRlZmNmNTExNTU1ZjUwYTEyZDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=	2017-11-07 19:04:06.672537+00
2it3wrrl1559irrm02a4ro5yydbkthfk	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-05 13:32:31.055617+00
k9pigu2bjgba4hpp1jncmjq5vx2vjwoe	NDBmZGY2YWZlZWNhZWMyYzY0ZTBkMWFhMDdlY2Y1YWNlYTI5NGRkMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjUxMjU4ODg2NjBkYTdhMzliMDNjNDAwZjk5NjM2YTY4NDRmYWQwYTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-11-09 20:36:12.660532+00
ctjdlr9lbk8qxieq0njdtg7patxr18t2	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-05 13:32:40.102543+00
q8m4z87zqe8bpxkvh15bz2n6s505ioeb	ZmExZmNhZjYxMDMyM2ExMDZkNTRmNWMyZWVkYTlmZmYzZTY4NTJkODp7Il9hdXRoX3VzZXJfaGFzaCI6ImIxNjZjMTQxZDg2YmZhM2U0MTkyYzRlZmNmNTExNTU1ZjUwYTEyZDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=	2017-11-09 23:49:41.834261+00
f6dbjbt3qaxbnaoedfijkf81lwm6yxwh	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-05 15:35:47.08498+00
j12tdw1ia0pse4v3v135ve0f7nqwygny	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-11-14 13:40:20.737588+00
wkv3y0tyubolz7a2hnd05kddh8jyguwk	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-05 19:14:44.809923+00
t9gw21orc567t9795m6qm4hfzjdgddl6	MTg4OTVjYjFmZmU5ODNlNWFhY2Q4Zjc5YjZhZjgzMGU2MDE5NTRmZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjYyMmRjYTliYTk3YWFmMjU1NDdlNmQzNDNkYmE1MDYzMGJhODQzOTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2017-11-21 18:28:30.032629+00
w9fpdsw0hvr2aqpbitiu43y6wr5c31nr	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-11-25 17:54:54.761818+00
ns4v60irl1e63ovz9v64i03j4i8d3kwn	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-12 22:46:47.954301+00
07jpbbsguoikw539ptwxrtewoqz817u4	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-12 23:29:15.554581+00
394yher2riua4d5epoy0sant41uuq9px	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-12 23:29:20.489641+00
p96f8niq3s9sk1dhc0ht1saznsux06fu	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-12 23:32:07.371973+00
m53y7786z9558luznm74pyhumm2vgmll	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-12 23:32:12.03978+00
9tew1wsr8jkn19gds8po6d0fmmu0kyt1	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-13 14:52:08.6727+00
0mkp53ip2llziq3rggz52v958b7bmlak	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-13 14:52:13.260164+00
gjp8z63v3riq2b2d82shiisqt822q9op	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-13 14:54:07.643267+00
8wuc29i7x4ecoyu9ftpdkssnue22i1yn	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-13 14:54:12.145297+00
gr55lrl2ppu0robp1oi2u33nla5ebsre	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-13 15:46:11.102184+00
fxtxy2ar5wuq4rvhkxev67m5qe9ifkt5	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-13 15:46:15.574231+00
qpbvv9iv5p778xqttfswg77jzwpsju9g	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-13 16:09:38.116448+00
nho8478wfdu4l8hbz2n5ufhmv767z0kh	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-13 16:09:42.715795+00
y8ebs6jycwzbkus7bucnusmkf9mrxpxw	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-13 16:36:09.982353+00
8jbyxmdp0yymj53isl2ilhwssnkiq4rr	ZGMxOGJmZjZlNWNhNzcxMjAxNDY3OWVjOTE4N2MyNjg0ZWZjNGQ2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZjk4MmM2ZjJjOTJiOTFhMWU1YzY2YzQwNzNjYWJjZmFmZTFjYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-13 16:36:14.496532+00
\.


--
-- Data for Name: health_healthscore; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.health_healthscore (id, date, sleep, weight, eat, exercise, user_id) FROM stdin;
1	2017-04-01	4	3	3	2	1
2	2017-04-02	4	3	3	4	1
3	2017-04-03	4	3	3	4	1
4	2017-04-04	4	3	2	2	1
5	2017-04-05	5	3	2	2	1
6	2017-04-07	5	2	1	4	1
7	2017-04-08	3	1	4	1	1
8	2017-04-09	5	2	3	3	1
9	2017-04-10	5	4	2	4	1
10	2017-04-11	5	3	3	3	1
11	2017-04-12	5	3	3	3	1
12	2017-04-13	5	3	4	4	1
13	2017-04-15	5	3	3	4	1
14	2017-04-16	3	4	1	3	1
15	2017-04-17	5	2	2	1	1
16	2017-04-18	3	1	2	1	1
17	2017-04-19	2	1	3	2	1
18	2017-04-20	3	2	2	2	1
19	2017-04-21	3	3	4	1	1
20	2017-04-22	3	4	3	3	1
21	2017-04-23	5	4	3	3	1
22	2017-04-24	3	3	2	3	1
23	2017-04-25	5	2	3	3	1
24	2017-04-26	3	2	3	3	1
25	2017-04-27	3	2	3	3	1
26	2017-04-28	5	2	2	2	1
\.


--
-- Name: health_healthscore_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.health_healthscore_id_seq', 26, true);


--
-- Data for Name: life_aspect; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.life_aspect (id, name) FROM stdin;
1	Contribute
2	Relate
3	Learn
4	Enjoy
\.


--
-- Name: life_aspect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.life_aspect_id_seq', 4, true);


--
-- Data for Name: life_experience; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.life_experience (id, age, summary, aspect_id) FROM stdin;
1	-1	None	1
2	-1	Before I was born	1
3	0	Born Sep 1, 1959	1
4	59	Second year at UNC\r\nFirst time teaching PHP/MySQL\r\nThird time teaching HTML Intro\r\nBuild design review system\r\nRefine classroom lesson system\r\nSeeing limits of my contribution at UNC\r\nCreate Life Journey Notebook\r\nxxx	1
5	59	Learn to rest while awake at night\r\nStruggle with pessimism over our society and politics\r\nBegin reviewing my life story	4
6	59	Create alliance with Mehrgan and Moe\r\nMove to new office with Dan & Vish\r\nStruggle with my role in church\r\n\r\nStacie:\r\nTravel to AZ with mom and sisters\r\nLive broadcast of Missions Conference\r\nStart staff development at Greeley Vineyard\r\nCoach training & Spiritual Direction\r\nMeet with Sri Lanka partners\r\n\r\nChristine (37):\r\nInsurance billing problems with Gall Bladder surgery\r\n\r\nJosiah (34):\r\nTrying to finish PhD in 2019\r\nOpportunity for Biola University\r\nSam does not want to live in LA\r\n\r\nRachel (31):\r\nDue on Nov 30\r\nBaby Shower and other preparations	2
7	59	Learn PHP coding\r\nSetup Apache server on Mac & Windows\r\nTeaching style - explain code examples, produce templates\r\nLimitations of my role at church\r\nLimitations of my role at UNC\r\nBuild applications quickly\r\nPersonal retreat	3
8	58	Start teaching at UNC\r\nTeach Web Dev Intro\r\nTeach Software Engineering for Chris Harris\r\nConduct design reviews in BACS 200\r\nBuild classroom & lesson presentation system over Christmas break\r\nUse Reveal JS for showing slides\r\nTeach Web Dev in Spring\r\nExpress interest in teaching Intermediate Web Dev	1
9	58	Develop relationship with Mehrgan\r\nSignificant interactions with students\r\nDeep satisfaction in teaching others\r\nSpend time with Don Seaman at High school reunion\r\nMeet with Greg McCutchan in July 2017 \r\n\r\nChurch:\r\nCooling of connection with Greeley Vineyard\r\nResign from Church board (Aug 2018)\r\nBad political conversations with friends & relatives (stop facebook)\r\n\r\nStacie:\r\nRelationship with Stacie deepened in trust and respect\r\nResearch for Vineyard healthcare\r\nPrayer team at Missions Conference\r\nKaren Fields as Spiritual Director\r\nStart coaching training\r\nTexas trip for Lucy's 80 birthday\r\n\r\nChristine (36):\r\nGall Bladder surgery (Jan 2017)\r\n\r\nJosiah (33):\r\nVisit London in July after River Cruise\r\nConflict between Josiah & Sam\r\nLondon record heat in London\r\nCassie visits Colorado\r\n\r\nRachel (30):\r\nBuild meaningful connection with Andrew and Rachel\r\n    * church involvement\r\n    * leisure time\r\nPregnant in Feb, 2018\r\nMasters degree (Dec 2017)\r\nAndrew working an Behavioral Health hospital\r\nUNC cancels teaching job	2
10	58	River Cruise Trip - Austria, Germany, Netherlands, England	4
11	58	Learn about Emotional Intelligence\r\nGrowth books - 100 Years, Principles, Tribe of Mentors, Activate Your Brain, Habits, Originals\r\nAudiobooks on drive to UNC\r\nAttend PyCon in Cleveland, OH\r\nMeaning Model - Contribute, Relate, Learn, Enjoy	3
12	57	Stacie:\r\nWork together on Who2Hire\r\n\r\nChristine (35):\r\nWork at King Soopers\r\n\r\nJosiah (32):\r\nVisit London in May\r\nTravel to Paris\r\n\r\nRachel (29):\r\nBuy house in Jan 2016\r\nWork on Masters degree\r\nTeach Japanese culture and language at UNC\r\n\r\nChurch:\r\nSchool of Kingdom Ministry (Sep 2016 - May 2017)\r\nLack of direction in ministry\r\nStruggle with School of Kingdom Ministry\r\nVineyard National Conference in Anahiem\r\n\r\nTravel to CA to see Deb & Bob Moyer\r\n\r\n40 year high school reunion	2
13	57	Women2Women\r\n* Complete work on Women2Women application (Agency Portal)\r\n* Conflict over billing practices\r\n\r\nLow revenue for Shrinking World (no new work)\r\n* Decide that we can retire and be OK\r\n* Start investing with Personal Captital\r\n\r\nCreate Who2Hire application and business\r\n* Build app (1000 hours)\r\n* Difficulty marketing application\r\n\r\nCreate booknotes website	1
14	57	Global Leadership Summit\r\nNational Vineyard Conference\r\n\r\n\r\nLearn about emotions\r\n    * Study books Destiny, Originals, Fully Charged, EQ 2.0, Next 100 Years\r\n\r\nPersonal growth challenges\r\n    * Battle disillusionment over career and church\r\n    * No longer need to make money\r\n    * Tension over Who2Hire business\r\n    * Spiritual and emotional and intellectual growth\r\n    * Understand meaning = contribute + connect + understand + enjoy\r\n    * Clarify my identity and identify life purpose\r\n    * Meltdown of politics	3
15	57	Travel to \r\n* Missouri, Tennessee, Kentucky, Maryland, Washington (Oct 2016)\r\n* Arizona - Jan 2017 (Dad's 85)\r\n* Hawaii - Feb 2017\r\n* England, France, Iceland - May 2017\r\n* California, Arizona - July 2017\r\n\r\nWestminster Trip\r\n* watch soccer game with Andrew\r\n* time away with Stacie\r\n* personal retreat	4
16	56	Publish "The Leverage Principle" ebook (Dec 2015)\r\n\r\nWomen2Women \r\n* Start project in Dec 2015\r\n* First release in April\r\n* Extended to include Agency Portal\r\n* Conflict over billing and schedule\r\n\r\nSemantic Arts\r\n* work with Dave McComb on Siemans contract (Oct - Nov 2015)\r\n\r\nCreative Leap\r\n* meet with Greg McGutchen on phone\r\n* meet with Greg in Boulder\r\n* meet with Greg and Josiah	1
17	55	Shrinking World:\r\n* Pipescan deployed in Dec 2014\r\n* Demand for more business\r\n* Stacie leaves Banner to join Shrinking World - Nov 2014\r\n* Josiah, Jim, Mark N. join Shrinking World - Dec 2014\r\n* Setup S-Corp,  payroll, and employees for SWS - Jan 2015\r\n* PRS work collapses - Feb 2015\r\n* Jim works until May 2015\r\n\r\nStart writing book\r\n\r\nClose App Thumper - Jun 2015\r\n\r\nPyCon 2015	1
18	55	Church:\r\n* Active in Greeley Vineyard\r\n* Preach Feb 1\r\n* Mentor and resource for Beilmans\r\n* Join board and setup budget (Oct 2014)\r\n* Host FPU\r\n\r\nStacie:\r\nWedding takes a big physical toll on Stacie\r\nAfter watching Cassie she can barely walk\r\nDr says she should try to avoid surgery\r\nStarts doing therapeutic massage every other week\r\n\r\nChristine (34):\r\nStart work at King Soopers\r\n\r\nJosiah (31):\r\nMove to CO Springs\r\nDifficult visit to Co Springs for Mothers Day\r\nCannot find work\r\n\r\nRachel (28):\r\nAndrew and Rachel get engaged - Nov 2014\r\nRachel's wedding - Aug 2015\r\nLots of relatives come to the wedding\r\nElen is very helpful during the wedding	2
19	55	Trip to Hawaii - Nov 2014\r\nExtended time off - Dec 2014\r\nK-Love Cruise with Christine & Rachel - Jan 2105\r\nDrive to Key West, stay at Key Largo\r\nPyCon in Montreal with Stacie, Jim, Eric, Josiah - May 2015	4
20	55	PyCon in Montreal with Stacie, Jim, Eric, Josiah - May 2015\r\n\r\nStruggle with personal problems:\r\n* Identity crisis\r\n* Disappointment over business failures\r\n* Loss of hope\r\n* Stress with Stacie\r\n* Fear of the future\r\n* Overwhelming frustration	3
21	42	None	4
22	54	AZ trip and K-Love Cruise - Jan 2014\r\n\r\nChurch:\r\nStart with Beilman's home group - Nov 2013\r\nSwitch to Greeley Vineyard - May 2014\r\nPastor hand-off - Aug 2014\r\nStacie joins board - Aug 2014\r\n\r\nGet to know Andrew\r\nSpend time with Garcias - June 2014	2
23	54	App Thumper \r\n* Work throughout the year\r\n\r\nShrinking World:\r\n* Eric joins company - Jan 2014\r\n* Todd joins company - Jan 2014\r\n* Work on PRS \r\n* PyCon Montreal (Stacie) - April 2014\r\n* Start Impact SRS - May 2014	1
24	54	Baltimore/DC trip - Oct 2013\r\nAZ trip and K-Love Cruise - Jan 2014\r\nPyCon Montreal (Stacie) - April 2014\r\nBlues Fest with Garcias - June 2014	4
25	54	PyCon Montreal (Stacie) - April 2014	3
26	53	Searching for new work (Sep - Dec) 2012\r\nWork with Chris Crownhart - Oct/Nov  2012\r\nHire Bryan for watermill support - Nov 2012\r\nStart Pipe Scan coding - Jan 2013\r\nStart App Thumper LLC - Feb  2013\r\nHail storm damages roof - Aug 2013\r\nRepair roof - Dec 2013	1
27	53	Cassandriel is born - Oct 5, 2012\r\nJordan/Israel/Austria - Nov  2012\r\nSpend time with Hoods\r\nRachel visits Hong Kong - Dec 2012\r\nVineyard National Conference - June 2013\r\nRachel returns to USA- Aug 2013\r\nJosiah creates New Line Technical Innovations\r\nVisit from Dave Seaman \r\nVisit from Mandy & JD	2
28	53	PyCon Santa Clara (Stacie) - April 2013	3
29	53	Visit Monte Ray with Stacie - Apr 2012\r\nVisit Jordan/Israel/Austria\r\npuzzle from Vienna\r\nanniversary in Denver\r\nJosiah & Sam & Cassandriel for Christmas	4
30	52	Searching for new work (Feb - Aug 2012)\r\nNoCoNet and Two-hour Job Search\r\nHigh level of uncertainty and insecurity\r\nPresent to SW Architects group - Aug  2012\r\nNew Tech Meetups  2012\r\nReplace furnance and A/C\r\nStart Exterior Brain project\r\nUpdate MyBook online website\r\n50 tricks ideas\r\nBuild automatic test framework at Watermill\r\nStart work on PRS project - Jun 2012	1
31	52	Vineyard Missions Conference - Oct 2011\r\nGlen Erie retreat - Dec 2011\r\nRachel visits from Japan - July 2012\r\nAuction for Youth initiative\r\ntravel to Dave Seaman's 80th birthday\r\nMeet  with Tim Musselwhite Jan 2012\r\nStart home group - Jan 2012\r\nWeekly Skype with Rachel \r\nWeekly Skype with Hoods\r\nSam pregnant - Feb 2012\r\nProgramming project with Josiah\r\nHOA web site\r\nJosiah starts with migraines\r\nTurmoil starts at Banner (Optimization)\r\nChristine works for Eric\r\nJoin church tech team\r\nJosiah gets leave of absence from CU - Jun 2012	2
32	52	PyCon Santa Clara - April  2012\r\nQuarterly personal retreat\r\nBudgeting model\r\nSeaman's Log (weekly articles)\r\nSpiritual Transformation, Prayer Journal and Practices\r\nLearn about self-publishing\r\nBuy ultra book - Apr 2012\r\nLean Startup - Agile business model\r\nTrust ramp\r\nJuan and Lynn Mora	3
33	52	Winter Park Blues - July  2012 - Ana Popovic\r\nTravel to Arizona\r\nAnxiety over business strategy\r\nGreeley Blues Jam - Jun 2012	4
34	51	OSCON Portland with Josiah - June 2011\r\nBuild out Watermill accounting system\r\nCommute to Brighton	1
35	51	Tsunami - Mar 2011\r\nTravel  to Hawaii & Japan - Mar/Apr 2011\r\nArizona trip with Banner - Mediserve	4
36	51	Visit Rachel in Japan 2011	2
37	50	Move into new house on 50th birthday\r\nHost regular parties in new house\r\nMeet all our neighbors\r\nHoppes over for Thanksgiving	2
38	50	Decide to double productivity - Jan 2010\r\nFocus on scripting and automation\r\nBuild Support Center infrastructure\r\nGet Proficient at Django\r\nAttend OSCON in June 2010	1
39	51	Learn Git,  Django, Python	3
40	50	Read Pragmatic Thinking and Learning\r\nRead Productive Programmer\r\nFully embrace God's blessing for our family	3
41	50	Thrilled to be living in Water Valley\r\nEvery day is a resort stay	4
42	56	Stacie:\r\nBi-Weekly massages\r\n\r\nChristine (34):\r\nWork as Pharmacy technician\r\n\r\nJosiah (31):\r\n\r\nRachel (28):\r\nCelebrate 1 year in Aug 2016\r\nWork as sales person for solar panels\r\n\r\nChurch:\r\nFallout from presidential race sours relationships for church, family, neighbors\r\n\r\nTravel to visit relatives in Tennessee, Kentucky, Misouri, Maryland, Washington	2
43	56	Tension over politics	4
\.


--
-- Name: life_experience_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.life_experience_id_seq', 43, true);


--
-- Data for Name: life_year; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.life_year (id, age, contribute, relate, learn, enjoy) FROM stdin;
\.


--
-- Name: life_year_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.life_year_id_seq', 1, false);


--
-- Data for Name: superuser_administrator; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.superuser_administrator (id, surrogate_id, user_id) FROM stdin;
\.


--
-- Name: superuser_administrator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.superuser_administrator_id_seq', 1, false);


--
-- Data for Name: tasks_task; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.tasks_task (id, name, notes, date, hours, done) FROM stdin;
1762	Grow	\n        think about life goals\n        problems with back pain\n        3, 3, 2, 3	2017-04-24	3	f
1769	Aspire	\n        learn how to create a data table using the ORM\n        build view for Time Summary\n        create views for time and days\n        clean up time data on production	2017-04-26	5	f
90	People	\n        Fly with Don\n        Breakfast at airport diner\n        Visit April & Jim's new house\n        Dinner at Edwards	2016-02-01	13	f
92	People	\n        Breakfast at hotel\n        Fly home after vacation	2016-02-02	9	f
94	Fun	\n        Black Widow\n	2016-02-02	2	f
95	Sign	\n        Setup new repos\n        Build automation script\n        Build test infrastructure\n        Debug package install and Python setup for dev	2016-02-03	9	f
1982	Grow	\n        2, 1, 2, 3 \n        nap\n        capture life destiny events	2017-05-07	4	f
1549	Grow	\n        think about writing goals\n        learn about American Revolution\n        think about family history\n        4, 3, 3, 4\n	2017-04-03	3	f
1563	Tools	\n        rebuild mybook logic for registration and auth\n        login view\n        rework personal websites\n        debug image resize script\n        standardize menus and titles for all websites	2017-04-06	4	f
1582	Tools	\n        update OS on macbook\n        build chapters list on mybook\n        create Chapters to define reading order\n        fix numerous small issues\n        extend book and author views on mybook\n        save data from production	2017-04-11	5	f
1591	Aspire	\n        fix anonymous user experience\n        create better landing page\n        improve routing of AspireDoc pages\n        build dynamic menu logic\n        debug roles and projects views	2017-04-13	5	f
1606	Aspire	\n        debug online editor\n        convert single topic to folder \n        deploy to MyBook server\n        test/fix cycle between MyBook and iMac\n        build content on Aspire\n        sync docs automatically from server\n        improve landing page\n        create new Aspire projects\n        create new files with Aspire Edit feature\n        refactor Aspire views	2017-04-17	9	f
1983	Church	\n        resurrect the dream Business as Ministry\n        church\n        give computer to Jayden\n        help Jayden set up Ubuntu	2017-05-07	7	f
2074	Grow	\n        4, 2, 2, 5\n        walk	2017-06-09	0	f
2107	Fun	\n        plan San Diego trip\n        SHIELD\n	2017-06-16	4	f
1984	People	\n        Potters @ Nepal\n        pack for trip\n	2017-05-07	3	f
1985	Grow	\n        3, 1,\n        nap\n        think about business opportunity	2017-05-08	2	f
2109	Tools	\n        show outline with grandkids\n        build document manager - storage & display\n        build Thot Viewer	2017-06-17	4	f
2110	People	\n        small group party\n        meet RoiYou\n        games & beach	2017-06-17	5	f
2112	Grow	\n        5, 1, 2, 2\n        nap	2017-06-18	2	f
2072	People	\n        visit Rachel & Andrew\n        Jayden Howell yard work\n        mount flag on Stacie's trike	2017-06-08	3	f
2108	Grow	\n        5, 2, 2, 5\n        walk\n        nap	2017-06-17	3	f
2111	Fun	\n        Niki Heat\n	2017-06-17	2	f
2113	Church	\n        church service	2017-06-18	4	f
2114	People	\n        Father's Day celebration at Rio\n        call Dad\n        talk to Josiah	2017-06-18	2	f
2115	Fun	\n        Me Before You\n        Ocean's 11\n        Niki Heat\n	2017-06-18	6	f
2116	Grow	\n        5, 1, 3, 5\n        walk	2017-06-19	1	f
2117	Tools	\n        restructure ThotBook code\n        improve outline reader\n        build better ThotView	2017-06-19	8	f
2069	Fun	\n        Flash\n	2017-06-07	2	f
2070	Grow	\n        3, 4, 2, 4\n        walk	2017-06-08	1	f
2118	Fun	\n        Hawaii 50, Sherlock\n	2017-06-19	5	f
2252	People	\n        Mash Works	2017-07-29	2	f
2068	People	\n        lunch at Sandbar	2017-06-07	1	f
2251	Church	\n        respond to Todd's message about budget	2017-07-29	2	f
2300	Fun	\n        Dance	2017-08-11	4	f
2668	Fun	\n        Fraiser\n	2017-11-12	2	f
2073	Fun	\n        Fraiser\n        Homeland\n	2017-06-08	2	f
93	Grow	\n        Personal reflection	2016-02-02	3	f
1541	Church	\n        Men's Breakfast\n        church leadership dashboard	2017-04-01	3	f
1980	Fun	\n        Collateral Beauty, Fraiser, Americans	2017-05-06	4	f
96	Church	\n        Financial Peace University - Lesson #1 - Pizza\n        Subway is robbed	2016-02-03	4	f
97	Fun	\n        Finish Black Widow book\n	2016-02-03	1	f
98	Sign	\n        Define application architecture\n        Build application cookbook\n        Setup Django Droplet on Digital Ocean\n        Write up version control recommendations\n        Plan SignMaster Django app\n        Build document viewer\n        Prep for team meeting\n        Meet with team 10-12\n	2016-02-04	10	f
99	People	\n        Breakfast with Rachel & Christine & Stacie\n        House cleaning	2016-02-04	3	f
100	Fun	\n        Chuck\n        	2016-02-04	1	f
101	WAM	\n        Fix numerous issues with UI\n        Investigate setting up email\n        End frustrated	2016-02-05	8	f
102	People	\n        Lunch with Stacie at Senior Jalapeno\n        Visit Juan and Lynn	2016-02-05	4	f
103	Fun	\n        X-23\n	2016-02-05	2	f
104	Business	\n        Discuss career with Stacie\n        Order iMac computer	2016-02-06	4	f
105	Grow	\n        Quiet time	2016-02-06	2	f
106	Church	\n        Watch War Room at church	2016-02-06	4	f
107	Fun	\n        X-23, Mad Men, Winter World\n\n        	2016-02-06	4	f
108	Church	\n        Baptism	2016-02-07	4	f
109	Grow	\n        Prayer time\n        Develop ideas about work hours	2016-02-07	2	f
1981	Church	\n        prepare computer for Jayden\n        think through engagement\n	2017-05-06	3	f
1545	Grow	\n        personal review\n        4, 3, 3, 4	2017-04-02	2	f
1771	Church	\n        attend home group	2017-04-18	4	f
1996	Write	\n        create charter for Shrinking World Challenge\n        Internet Fun Challenge\n        Learning Challenge\n        Evernote Challenge\n        watch videos of Justinian\n        watch videos of currency	2017-05-14	6	f
2006	People	\n        Eiffel Tower\n        Notre Dame\n        Ste. Chappelle\n        watch Cassie with Josiah and Sam at Louvre\n	2017-05-19	14	f
2007	People	\n        boat on Seine\n        travel to London\n	2017-05-20	14	f
2008	People	\n        church at Vineyard Richmond\n        lunch with Farandakis, PDS	2017-05-21	8	f
2017	People	\n        travel from Iceland home\n        layover in Iceland	2017-05-26	12	f
2018	Grow	\n        economic cycles in America\n        demographic shifts\n	2017-05-26	2	f
2020	Write	\n        build on thot design\n        thot code - add, list, tree, children, print, read, write\n        thot debug & test strategy\n        update macbook OS\n        build booknotes\n        post info about - 100 years, Requiem, Perfect\n	2017-05-27	6	f
2021	Church	\n        church service	2017-05-28	4	f
2253	Fun	\n        Amazing Race\n	2017-07-29	2	f
1954	Fun	\n        Fraiser, Southside (Barak & Michelle)\n	2017-04-29	5	f
1955	Grow	\n        nap\n        5, 2, 	2017-04-30	2	f
2075	Tools	\n        restructure menu loading across all domains\n        rebuild workshop app	2017-06-09	3	f
1997	People	\n        take care of Cassie\n        Josiah & Sam to Bath\n        birthday party for Cassie	2017-05-14	6	f
2009	Grow	\n        insight on relationships and emotional energy	2017-05-21	4	f
2022	People	\n        talk to Andrew and Rachel	2017-05-28	2	f
2120	Tools	\n        first working version of Thot Recorder\n        debug ThotBook links\n        debug ThotDocEdit\n        improve doc.doc.py logic	2017-06-20	4	f
1986	People	\n        prepare for trip	2017-05-08	10	f
1987	Church	\n        flood \n        strategy discussions\n	2017-05-08	2	f
1988	People	\n        Travel from CO to London\n	2017-05-09	14	f
2023	Fun	\n        Lord of the Rings	2017-05-28	4	f
2076	Hire	\n        create production release 2017-06-09\n        test release\n        convert all email code to use DJRILL\n        setup Who2Hire email records on server	2017-06-09	6	f
1989	People	\n        arrive in London\n        visit with people\n        dinner and Melrose\n\n	2017-05-10	14	f
2024	Grow	\n        2 naps\n        think about EQ\n        think about teaching\n        2, 1, 3, 2	2017-05-28	2	f
1998	Grow	\n        good sleep\n	2017-05-14	2	f
2010	Fun	\n        finish Last Patriot\n        Last Airbender\n	2017-05-21	2	f
2011	People	\n        breakfast with Josiah\n        talk with Josiah about life	2017-05-22	12	f
1999	People	\n        take Cassie to school\n        visit Sainsbury's	2017-05-15	6	f
2012	Grow	\n        read EQ 2.0\n	2017-05-22	2	f
2000	Write	\n        Programming Challenge\n        PyCon keynote\n        PyCon dictionary\n        Jessica McKellar making a difference\n        video on Selenium and AutoGUI	2017-05-15	6	f
1990	People	\n        tour of Kew Gardens\n        walk to hardware store\n	2017-05-11	14	f
1991	People	\n        discuss writing\n        take Cassie to school	2017-05-12	10	f
2013	People	\n        river cruise and London Eye\n        discussion of EQ\n	2017-05-23	14	f
2001	Fun	\n        walk around neighborhood\n        read Last Patriot\n	2017-05-15	2	f
2002	People	\n        Josiah returns from Bath\n        Cassie ice cream\n        Visit park\n        discuss identity crisis\n	2017-05-16	14	f
2014	People	\n        tour of Steam and Water museum\n        organize photos\n        Library Pot\n	2017-05-24	14	f
2003	People	\n        discuss relationships	2017-05-17	10	f
2004	Fun	\n        Next 100 Years\n	2017-05-17	4	f
1992	Grow	\n        laid awake for 6 hours\n        take nap\n	2017-05-12	4	f
2015	People	\n        pack for return trip\n        travel from London to Iceland\n        discussions with Josiah & Sam	2017-05-25	11	f
1993	People	\n        visit with Dave and Carol\n        talk with Josiah about relationship at pub	2017-05-13	8	f
1994	Write	\n        read Next 100 Years	2017-05-13	4	f
2121	Hire	\n        improve login view\n        teach Stacie about SendGrid\n        remove Who2Hire links on all Shrinking World sites\n        rebuild WebDev content within Thot\n        review encryption renewals	2017-06-20	4	f
2079	Grow	\n        5, 2, 2, 5\n        sleep in	2017-06-10	1	f
2067	Hire	\n        integrate djrill library into source code\n        send basic email message using Djrill\n        debug sending template\n        fix issue with login\n        flatten urls (remove /hire)	2017-06-07	8	f
2078	Fun	\n        Austin Young concert\n	2017-06-09	3	f
2119	Grow	\n        4, 2, 3, 2	2017-06-20	0	f
2077	People	\n        dinner with Howells at Blues Jam\n        Stacie's visit to dermatologist	2017-06-09	2	f
2254	Grow	\n        5, 1, 1, 1\n        nap	2017-07-30	2	f
2223	Fun	\n        drive from Sedona to Green River, UT\n        visit Grand Canyon	2017-07-21	10	f
2222	Fun	\n        Sudoku, Tsumego\n        movie\n	2017-07-20	4	f
2302	Church	\n        write about church mission	2017-08-12	2	f
91	Business	\n        Business meeting with Jim Edwards\n	2016-02-01	1	f
1995	Grow	\n        lay awake for 6 hours\n        nap\n\n        	2017-05-13	2	f
2005	People	\n        travel to Paris\n        travel to Rue Claire on Metro\n	2017-05-18	14	f
2016	Grow	\n        economic cycles in America\n        	2017-05-25	3	f
184	Fun	\N	2016-02-28	2	f
2027	Business	\n        discuss Creative Leap with Stacie\n        discuss website redesign	2017-05-29	2	f
2028	Grow	\n        4, 1, 1, 5\n        long walk to gravel pit\n	2017-05-29	2	f
3249	Fun	\n        investigate playing music in car\n        load music player with Buddy Guy and ZZ Top\n        play dominoes\n        visit library (return Amber audiobook)\n        buy Vikings book	2018-03-31	4	f
1956	Church	\n        attend church\n        grill burgers at church	2017-04-30	6	f
1957	People	\n        visit with Kelli and Dee Dee at Fredrick	2017-04-30	4	f
1958	Fun	\n        Good Place, Fraiser	2017-04-30	2	f
3250	People	\n        pancakes with Lucy and Stacie\n        Cafe Athens with Garcias and Lucy\n        learn Dominoes game with Grandma	2018-03-31	6	f
3868	WAM	    setup SSL on Web Server\n    generate SSL\n    read article outlining server setup\n    customize to our needs	2018-08-21	2	f
3873	People	    dinner at Fonta's with Stacie	2018-08-22	2	f
2920	Teach	\n        extend students.html\n        grade Ex1 and Ex2\n        give students feedback\n        setup Erick Ruvalcaba	2018-01-11	5	f
2071	Hire	\n        create standalone email sender\n        debug send text, HTML, templates\n        investigate password reset\n        implement password reset views\n        implement John Klassen account logic\n        reconcile code changes with src command	2017-06-08	8	f
3858	Teach	    first day of classes\n    final run-through of class materials\n    Kendall-Tobey\n    settle into office\n    BACS 200\n    BACS 350\n    meet with Robert & Noah\n    meet office mate - Oil & Gas Man\n    	2018-08-20	8	f
2225	Fun	\n        drive home	2017-07-22	6	f
2226	Grow	\n        personal reflections\n        think about goals for coming week\n        prayer time	2017-07-22	4	f
2227	Church	\n        listen to Amazing Grace\n        think about social justice\n	2017-07-22	4	f
2228	Church	\n        church service\n        Kingdom Characteristics: Justice, Mercy, Humility (Micah mandate)	2017-07-23	4	f
2304	People	\n        Juan and Lynn	2017-08-12	4	f
2305	Grow	\n        personal time\n        nap\n        5, 1, 1, 3	2017-08-13	4	f
2306	Church	\n        church service	2017-08-13	4	f
2307	People	\n        lunch at Rio	2017-08-13	2	f
2229	Grow	\n        nap\n        reflections on life\n        update personal journals	2017-07-23	5	f
2230	People	\n        Stacie's birthday - Ambrosia\n	2017-07-23	5	f
2255	Church	\n        church potluck\n        analyze giving records	2017-07-30	6	f
2308	Fun	\n        London has Fallen\n        Edge of Eternity\n        Supergirl\n	2017-08-13	4	f
3871	Tools	    	2018-08-22	0	f
3673	Fun	    Travel Log: Day 0\n    Most extensive trip packing and planning\n    Forget drivers license and credit card\n    Rachel & Andrew drive to DIA\n    Nice meal at DIA\n    Cramped space on flight\n    Poor air circulation\n    Crying twins\n    Good food on plane\n    Headphones on plane\n    15 minutes of sleep during flight\n    Movie: All the Money\n    4 hours at Heathrow\n    5,000 steps	2018-07-07	7	f
3482	Tools	    fix issues with MyBook redirect\n    fix github links on MyBook server\n    simplify MyBook code\n    create shortcuts for GitHub/GitBook/MyBook\n    container nesting (Author, Course, Part, Module, Lesson, Scorecard, Slides)\n    data for classroom (Section, Teacher, Student, Review, Score, Assignment, Group)	2018-05-29	3	f
3489	Teach	    build mapping of lessons to dates for BACS 350\n    create script to build class schedule\n    develop template for lessons\n    reconcile changes on server\n    write in Teaching Blog	2018-05-30	3	f
3507	Teach	    build mindmap of BACS 350\n    install Simple Mind on iMac\n    UNC Work Goals mind map\n    note - Create Presentations\n    capture mind maps in Evernote\n    setup new doc command	2018-06-01	6	f
3869	Grow	    4, 4, 3, 4\n    weight: 206.6	2018-08-22	0	f
3870	Teach	    grade Lesson 1\n    improve Lesson 2\n    create Lesson 4\n    Chrome UNC login and bookmarks\n    Student name tags\n    teach Lesson 2\n    help 8 students\n    Stacie visit (meet Dan, Moe, Vish)\n    	2018-08-22	9	f
3872	Fun	    Profit, Resident\n    	2018-08-22	3	f
3864	Teach	    help students with assignment 1\n    announcement - Where's my server\n    announcement - lesson 1 change\n    20 emails\n    update lessons 1 and 2\n    	2018-08-21	7	f
2670	Teach	\n        classes #36	2017-11-13	9	f
2671	Fun	\n        Inhumans	2017-11-13	2	f
2672	People	\n        talk with Stace\n	2017-11-13	2	f
4015	People	    dinner with Stacie at Pelican Lakes	2018-09-22	2	f
4002	Grow	    5, 3, 2, 3\n    weight: 208.4	2018-09-19	0	f
4012	Teach	    grading 200 exam\n    grading 350 exam\n    build solutions for 11\n    	2018-09-22	6	f
2080	Write	\n        creative writing class	2017-06-10	1	f
2673	Grow	\n        5, 4, 4, 2	2017-11-14	0	f
2674	Teach	\n        grading of Design Review	2017-11-14	9	f
2675	People	\n        Pelican Lakes - Rachel, Andrew, Christine	2017-11-14	3	f
2676	Fun	\n        Inhumans, Librarians\n	2017-11-14	2	f
4013	WAM	    remove extra users	2018-09-22	1	f
4017	Teach	    create map of zybooks lessons for 200/350\n    plan out lesson rhythms\n    350 Exam\n    200 Exam (start grading)\n    	2018-09-21	9	f
4014	Fun	    Hunger Games I\n    Enterprise\n    	2018-09-22	3	f
4016	Grow	    3, 3, 2, 3\n    weight: 208.2	2018-09-21	0	f
2081	Hire	\n        build general email functions for text, html, templates	2017-06-10	2	f
2082	Fun	\n        Greeley Blues Jam\n	2017-06-10	10	f
2256	Fun	\n        Tomorrow People\n        John Adams\n        Amazing Race\n        Edge of Eternity\n	2017-07-30	6	f
3513	Fun	    Profit\n    Animal Planet Earth	2018-06-04	4	f
2029	People	\n        Memorial Day neighborhood party\n        Carcassonne with Andrew & Rachel	2017-05-29	4	f
2219	Fun	\n        Assassin's Creed\n        Niki Heat\n        Sudoku, Tsumego\n	2017-07-19	4	f
2220	Grow	\n        dream about possible future projects\n        update plans for MyBook	2017-07-20	4	f
2221	People	\n        Mandy and kids visit Sedona\n        dinner at Javelina grill	2017-07-20	6	f
2083	Grow	\n        3, 1, 2, 3\n        nap\n        reflection and thinking\n        EQ\n        Essentialism	2017-06-11	5	f
2084	Church	\n        church service\n        Gabe and Luke from Campus Crusade	2017-06-11	4	f
2085	People	\n        Egginomics	2017-06-11	2	f
2086	Fun	\n        Homeland\n	2017-06-11	3	f
2087	Grow	\n        2, 1, 2, 4\n        walk	2017-06-12	1	f
2088	People	\n        Stacie surgery on arm\n        Nordy's BBQ	2017-06-12	3	f
2089	Tools	\n        thot outline reader (iterative and recursive designs)\n        create recipe for setup of PyCharm debugger	2017-06-12	6	f
2090	Grow	\n        3, 2, 1, 2\n        sleepless night worrying about Mandrill issue\n        visit library\n        write about public web presence\n        decide on making services private	2017-06-13	2	f
2091	Hire	\n        work on Mandrill email SMTP outage	2017-06-13	5	f
2122	People	\n        FCIP	2017-06-20	4	f
2123	Fun	\n        Supergirl\n	2017-06-20	2	f
2124	Grow	\n        3, 2, 3, 5\n        walk to Robin's Nest\n        decide to get counseling	2017-06-21	0	f
2125	People	\n        discuss hurts and dysfunction with Stacie\n        lunch with Stacie - Robin's Nest	2017-06-21	2	f
2926	People	\n        planning for River Cruise Trip\n        High Hops	2018-01-13	3	f
2927	Teach	\n        grade quiz and ex3\n        outline week 2	2018-01-13	4	f
2928	Tools	\n        work on encryption logic	2018-01-13	5	f
2929	Fun	\n        Enterprise, Profit\n	2018-01-13	2	f
2299	Church	\n        lunch with Beilmans, discuss church issues	2017-08-10	2	f
2930	Grow	\n        nap\n        5, 4, 3, 3	2018-01-14	1	f
2301	Grow	\n        Global Leadership Summit\n	2017-08-11	10	f
2931	People	\n        time with Stacie\n        Doug's for Christine birthday	2018-01-14	3	f
2932	Church	\n        church service	2018-01-14	4	f
3519	Grow	    5, 5, 5, 3	2018-06-07	0	f
3251	Grow	\n        3, 3, 1, 2	2018-04-01	0	f
2669	Grow	\n        bed at 8:00\n        4, 5, 3, 4	2017-11-13	1	f
2933	Tools	\n        work on system tests	2018-01-14	1	f
2934	Fun	\n        Jumanji\n        Arrow, Flash\n	2018-01-14	5	f
2935	Grow	\n        5, 4, 2, 2\n        nts	2018-01-15	1	f
2936	Teach	\n        create Lesson 4, 5	2018-01-15	2	f
2937	Tools	\n        repair and test infrastructure\n        turn on WAM	2018-01-15	5	f
3252	Church	\n        Easter Sunday\n        burritos at church	2018-04-01	4	f
3253	People	\n        Easter celebration (Fleebees, Garcias)\n        Dominoes, Carcassonne\n	2018-04-01	10	f
3254	Grow	\n        3, 1, 4, 5\n        Principles\n        chest pains	2018-04-02	3	f
3874	Grow	    4, 3, 2, 2\n    weight: 207.8\n    wake up at 5	2018-08-23	0	f
3510	Grow	    3, 3, 5, 5\n    walk to CR 13 - 13000 Steps - blister\n    read Activate Your Brain	2018-06-04	3	f
3511	Teach	    build details of summer schedule into a mind map\n    update planning for summer	2018-06-04	1	f
3512	WAM	    plan out strategy for SLL on WAM\n    Investigate alternative paths for building new Droplet on Digital Ocean	2018-06-04	3	f
3514	People	    Pelican Lakes lunch with Rachel\n    time with Stacie	2018-06-04	3	f
3515	Grow	    5, 4, 5, 4\n    morning walk	2018-06-06	1	f
3517	Fun	    ER, Profit	2018-06-06	4	f
3931	Tools	    	2018-09-04	0	f
3881	Tools	    	2018-08-24	0	f
3879	Grow	    5, 2, 3, 4\n    weight: 208.2	2018-08-24	0	f
340	People	\n        lunch at Romas	2016-04-14	1	f
3880	Teach	    grade Lesson 2\n    build Quiz 1\n    write Pat about 422\n    set up directed study\n    Lesson 3\n    help Sean Miller\n    	2018-08-24	10	f
3882	Fun	    ER, Dance, Fraiser\n    	2018-08-24	3	f
3883	People	    discuss classes with Stacie	2018-08-24	1	f
3875	Teach	    grading on Lesson 1,2\n    get helper for 200\n    plan Lesson 4\n    prep Lesson 3\n    provide info for Directed Study	2018-08-23	5	f
3877	Fun	    Dance	2018-08-23	1	f
3878	People	    dinner with Potters at Parry's Pizza and visit home	2018-08-23	3	f
3933	People	    talk with Christine about life	2018-09-04	2	f
3945	Business	    haircut\n    get new library card	2018-09-06	2	f
4078	Grow	    3, 3, 1, 1\n    weight: 208.4\n    nap	2018-10-09	1	f
4079	Teach	    build review manager application\n    	2018-10-09	9	f
3929	Grow	    5, 2, 1, 4\n    weight: 208.2\n    walk to Pelican Joe's for lunch	2018-09-04	1	f
3932	Fun	    Britannia\n    finish Turn series\n    nts 1\n    	2018-09-04	5	f
4019	People	    visit with Rachel 	2018-09-21	2	f
1596	Hire	\n        fix issue with payment keys on production\n        fix margins on PDF\n        deploy new repo on production server\n        create release branch for 2017-04-14\n        clean up old files from production server	2017-04-14	5	f
1607	Fun	\n        Good Place\n	2017-04-14	4	f
3518	People	    talk with Stacie about Metabolic research center\n    Romas with Stacie	2018-06-06	1	f
2030	Grow	\n        3, 1, 3, 5\n        long walk dog park/library\n        skim book KaChing	2017-05-30	2	f
2031	Tools	\n        fix tests\n        develop thot views\n        simplify menu loading code\n        change default menu for MyBook\n        rework workshop views\n        refine menu code for demo views	2017-05-30	4	f
2092	Fun	\n        TV\n\n	2017-06-12	4	f
2093	People	\n        visit surgery center for bleeding\n        last night with Luke and Gabe	2017-06-13	4	f
2094	Fun	\n        Amazing Grace\n	2017-06-13	3	f
2095	Grow	\n        5, 1, 2, 5\n        long walk	2017-06-14	1	f
2096	People	\n        Stacie sick in bed all day\n        cancel visit with Arlyn and Lynn	2017-06-14	5	f
2097	Hire	\n        investigate tools for transactional email\n        decide to replace Mandrill\n        replace email from Mandrill with SendGrid\n        repair web services\n        configure SMTP service for Stacie & Mark @ Shrinking World\n        setup two-factor auth at Digital Ocean	2017-06-14	6	f
2098	Fun	\n        Hawaii 50\n	2017-06-14	2	f
2099	Grow	\n        5, 2, 3, 5\n        write Daily Work Objectives\n        long walk	2017-06-15	2	f
2100	Tools	\n        testing and consolidation of email changes\n        create ThotView and ThotBookView logic\n        handle urls for thot/42 and thotbook/Work\n        build thot outline for web development of thot application\n        setup menu and site title for thot	2017-06-15	4	f
2126	Tools	\n        update plans for Aspire based on Thot work\n        work on data models and views for Aspire	2017-06-21	4	f
2127	Hire	\n        convert aspire documentation to thot/Who2Hire/Index\n        release notes for 2017-06-16	2017-06-21	4	f
2128	Church	\n        church board meeting\n        Todd discussed Rachel Dawson\n	2017-06-21	4	f
2259	Fun	\n        John Adams\n        Suits	2017-07-31	4	f
2260	People	\n        dinner with Stacie and Christine\n        hear about Christine's trip to CO Springs	2017-07-31	1	f
2328	Fun	\n        Profit\n	2017-08-15	1	f
2322	Fun	\n        Dance\n        Alias\n	2017-08-14	4	f
2231	Grow	\n        4, 1, 4, 4\n        think about life goals	2017-07-24	1	f
2232	Business	\n        connect with personal capital\n        help Stacie with computer troubleshooting\n        Stacie buys new computer\n        meet with Personal Capital reps\n        start SEPP setup \n        work on retirement planner (initial danger signal)\n        create sustainable retirement plan	2017-07-24	9	f
2323	Grow	\n        5, 2, 3, 5	2017-08-15	0	f
2233	Fun	\n        NCIS\n        Suits\n	2017-07-24	4	f
2257	Grow	\n        5, 1, 3, 5	2017-07-31	1	f
2324	Teach	\n        Send release for background check\n        get employment forms from UNC\n        ask about textbook, Bear ID, computer access	2017-08-15	3	f
2682	Teach	\n        create take-home exams	2017-11-16	8	f
2683	People	\n        Julio working on resume	2017-11-16	1	f
2317	Teach	\n        meet with Mehrgan & Carmayne\n        work with course materials for BACS 200\n        explore info about BACS 	2017-08-12	6	f
2316	Fun	\n        Dance\n	2017-08-12	2	f
2318	Grow	\n        4, 1, 3, 3	2017-08-14	0	f
2325	Tools	\n        supply Digital Ocean with ID info\n        fix Fitbit software connect to phone	2017-08-15	2	f
2326	Church	\n        meeting to plan church retreat\n        debug and improve Church Dashboard	2017-08-15	4	f
2327	Business	\n        FCIP	2017-08-15	4	f
2309	Church	\n        build on Church Dashboard	2017-08-09	2	f
2310	Fun	\n        Top Gun\n	2017-08-09	3	f
2311	Business	\n        set up interview date	2017-08-10	1	f
2312	Grow	\n        1, 2, 2, 3\n        attend GLS\n        talk with Tim Musslewhite	2017-08-10	6	f
2319	Teach	\n        meet with Pat Seaton - agree to teach class\n        communicate about UNC Class (11 + facebook)\n        write to Wendy about Spiritual Things and Booknotes	2017-08-14	4	f
2320	Tools	\n        contact Digital Ocean\n        research Amazon Lightsail	2017-08-14	4	f
2684	Fun	\n        Black Panther\n        Librarians\n	2017-11-16	3	f
2313	People	\n        talk with Jeff Lee\n        discuss talks with Stacie	2017-08-10	2	f
2321	Church	\n        build edit view in Church Dashboard\n        work with Kyle on Dashboard	2017-08-14	2	f
2314	Fun	\n        The Profit\n	2017-08-10	3	f
2315	Grow	\n        5, 1, 1, 5	2017-08-12	0	f
2677	Grow	\n        pray for Rachel\n        3, 3, 3, 4	2017-11-15	1	f
2678	Teach	\n        class #37	2017-11-15	8	f
2679	People	\n        Rachel meets with department chair	2017-11-15	2	f
2680	Fun	\n        Black Panther\n        Librarians\n	2017-11-15	3	f
2681	Grow	\n        pray for students\n        4, 3, 3, 2	2017-11-16	2	f
2943	Fun	\n        Madam Sec\n        Rick Steves and river trip planning\n        	2018-01-16	4	f
2939	People	\n        visit with Rachel\n	2018-01-15	1	f
2940	Grow	\n        5, 3, 2, 2	2018-01-16	0	f
2942	People	\n        Sol de Jalisco	2018-01-16	1	f
3255	Teach	\n        Lesson 30 - Display Images\n        sign up for teaching BACS 200 - Fall 2018	2018-04-02	7	f
3256	Fun	\n        Hawaii 50, NCIS	2018-04-02	2	f
3257	People	\n        visit Lucy\n        time with Stacie\n    	2018-04-02	2	f
4080	Fun	    Vikings\n    	2018-10-09	2	f
494	Fun	\n        Arrow\n	2016-06-05	2	f
1959	Grow	\n        2, 1, \n        read Destiny\n        discuss personal growth with Stacie\n        get cold	2017-05-01	6	f
1960	Business	\n        Shrinking World Partners meeting	2017-05-01	4	f
1961	Tools	\n        automated testing\n        copy music repos O-T	2017-05-01	1	f
2036	Grow	\n        4, 1, 3, 5\n        update personal goals\n        walk	2017-05-31	2	f
663	Church	\N	2016-07-24	4	f
2234	Grow	\n        5, 1, 4, 3\n        pray for relationships\n        write - Driven to Invent\n        think about engagement with Peter Runge and Greg McGutchen\n        walk at Windsor Lake\n        pray for Josiah\n        write in Journal\n        nap	2017-07-25	4	f
2235	People	\n        lunch at Robin's Nest with Chris Warren\n        Stacie has lunch with Banner people\n        Facebook	2017-07-25	4	f
2236	Fun	\n        Star Trek Generations movie\n        Anthony Bordain\n        X-force comics\n        EW\n	2017-07-25	6	f
2101	Hire	\n        build templates for notifications\n        send new notification messages	2017-06-15	3	f
2102	People	\n        discuss Josiah thesis change with Stacie	2017-06-15	2	f
2103	Fun	\n        Sherlock\n	2017-06-15	3	f
2104	Grow	\n        5, 3, 2, 5 \n        renew medicine\n        nap	2017-06-16	2	f
2129	Grow	\n        5, 2, 3, 2	2017-06-22	0	f
2130	Hire	\n        create Who2Hire release notes\n        create Who2Hire Thotbook	2017-06-22	2	f
2131	Tools	\n        build workshop view for email\n        build workshop view for file upload\n        create workshop/app/SimpleApp\n        create workshop/views/RedirectView\n        create workshop/views/FormView\n        create workshop/views/TemplateView\n        restructured workshop code	2017-06-22	6	f
2132	People	\n        Palominos & Sams	2017-06-22	4	f
2133	Fun	\n        Castle\n        	2017-06-22	2	f
2134	Grow	\n        5, 2, 3, 2	2017-06-23	0	f
2135	Hire	\n        software release 2017-06-23\n        learn about view-class inheritance\n        create file uploader\n        create email request for support	2017-06-23	6	f
2136	Tools	\n        build Material template base view\n        extract File Upload logic from Material\n        debug file uploader	2017-06-23	2	f
2137	People	\n        grill	2017-06-23	3	f
2138	Fun	\n        Flash, Star Trek\n        	2017-06-23	3	f
2139	Grow	\n        5, 2, 3, 5\n        walk over to 257\n        walk on beach and hurt feet\n        write about emotional health	2017-06-24	3	f
1962	Fun	\n        Good Place\n	2017-05-01	3	f
2692	Fun	\n        watch James Bond with Andrew\n        Spider Man\n	2017-11-18	6	f
1963	Grow	\n        2, 2, 3, 2\n        grapple with cold	2017-05-02	2	f
1964	Tools	\n        set up encryption on macbook\n        copy music repos U-Z\n        implement MyBookPrivateDoc view\n        build book content for: seamanslog, spiritual, leverage, reuse	2017-05-02	6	f
2032	Tools	\n        build basic thot view\n        refactor workshop demo views\n        refactor Menu & SiteTitle\n        create /thot/42 view\n        think about booknotes design\n        create new WordPress site with template	2017-05-29	6	f
2938	Fun	\n        Victoria\n        library (the Apostle)	2018-01-15	5	f
2941	Hire	\n        optimize command scripts\n        investigate system configurations for all server\n        repair letsencrypt SSL certs\n        learn about encryption on servers\n        create process for managing code on servers	2018-01-16	9	f
2261	Grow	\n        5, 1, 2, 5\n        walk	2017-08-01	2	f
2329	Grow	\n        4, 3, 3, 4\n        walk around park	2017-08-16	1	f
2330	Tools	\n        meet with Josiah on Kronos - Gene Server\n        prototype ideas in Jupiter notebook\n        choose name - Kronos - Gene Server	2017-08-16	6	f
2331	Teach	\n        fill out forms for UNC	2017-08-16	1	f
2332	Business	\n        research portfolio management at Fidelity	2017-08-16	1	f
2333	Fun	\n        have fun\n	2017-08-16	5	f
2334	Grow	\n        3, 3, 3, 5	2017-08-17	0	f
2335	Teach	\n        get setup at UNC\n        Bear ID\n        keys\n        classroom tour\n        computer configuration\n        read HTML & CSS	2017-08-17	10	f
2336	People	\n        Palaminos	2017-08-17	2	f
3262	People	\n        Stacie goes to SD\n        discuss life with Stacie	2018-04-04	2	f
2685	Grow	\n        3, 5, 4, 5\n        personal reflection	2017-11-17	1	f
2686	Teach	\n        try to contact Jose\n        final reviews	2017-11-17	8	f
2687	Fun	\n        Black Panther\n        Alias\n	2017-11-17	5	f
2688	Grow	\n        3, 4, 4, 2\n        discuss business and personal plans with Stacie\n        fall asleep w/TV	2017-11-18	3	f
2689	Teach	\n        meet with Jose	2017-11-18	1	f
2690	People	\n        lunch at Toast with Rachel and Stacie	2017-11-18	2	f
3263	Fun	\n        Atomic Blond\n	2018-04-04	2	f
2691	Tools	\n        rework email password on all devices\n        update Mac OS	2017-11-18	2	f
3264	Grow	\n        2, 2, 4, 4\n        list chapters in Seaman's Guide to Life\n        night thinking (Principles of Life)\n        draft My Goals (Work & Connect)\n        create outline of Principle Life Goals from book\n        nap\n        walk\n        nts 4	2018-04-05	9	f
3265	Teach	\n        write Blog 7 - Find a Cause	2018-04-05	2	f
3259	Fun	\n        Dragonfly\n	2018-04-03	2	f
649	Grow	\n        walk	2016-07-20	1	f
3260	Grow	\n        3, 3, 2, 4\n        walk on campus\n        sit-ups\n        start pain log\n        think about health\n        think about thoughtful disagreements\n        Principles	2018-04-04	3	f
3261	Teach	\n        Lesson 31 - Photoshop\n        grade blog 5\n        good talk with Mehrgan\n        50th anniversary of MLK	2018-04-04	7	f
2033	Hire	\n        create WordPress site\n        install theme code in WordPress\n        setup encryption on WordPress site	2017-05-30	4	f
2034	People	\n        dinner on patio	2017-05-30	1	f
2035	Fun	\n        Two Towers\n	2017-05-30	3	f
2144	People	\n        Royal Nepal with Andrew and Rachel\n        Stacie and Christine to Toby Mac concert\n        plan trip to San Diego, Anaheim, and Flagstaff	2017-06-25	4	f
2145	Fun	\n        Hawaii 50\n        visit library	2017-06-25	3	f
2146	Church	\n        paint lines on parking lot\n        invited to Pastors' Conference in Anaheim\n\n	2017-06-25	5	f
2147	Grow	\n        think about life and ministry\n        5, 1, 1, 2	2017-06-26	1	f
2337	Fun	\n        Voyager\n	2017-08-17	2	f
2338	Church	\n        leadership retreat	2017-08-18	7	f
2339	Teach	\n        login to Canvas\n        set up computer for UNC\n        update syllabus\n        UNC email\n        update lesson #1 presentation	2017-08-18	4	f
1965	People	\n        go to Crooked Cup with Stacie\n        library	2017-05-02	2	f
1966	Fun	\n        Turn\n        	2017-05-02	4	f
1967	Grow	\n        4, 3	2017-05-03	2	f
2340	Grow	\n        nap \n        5, 2, 3, 3	2017-08-18	2	f
2341	Fun	\n        Voyager\n	2017-08-18	1	f
2698	Tools	\n        watch videos on Jupyter\n        learn about python-pptx\n        build slideshow using jupyter-nbconvert reveal.js	2017-11-20	4	f
2237	Grow	\n        5, 1, 5, 4\n        walk to library	2017-07-26	2	f
2238	Church	\n        move church money data from MyBook server to dev\n        design new application for dashboard\n        document Church dashboard plan in thot/App_Design 	2017-07-26	6	f
2239	Business	\n        develop business goals for NAU archive project	2017-07-26	2	f
2240	Fun	\n        John Adams\n        Amazing Race\n\n	2017-07-26	4	f
2241	Grow	\n        5, 1, 5, 3	2017-07-27	0	f
2699	Fun	\n        Iron Fist, Madam Sec, Poldark, Black Panther\n	2017-11-20	6	f
2242	Church	\n        board meeting\n        church dashboard application\n        lift data from old data entry	2017-07-27	6	f
2243	People	\n        Dan Johnson @ Albertos	2017-07-27	2	f
2244	Tools	\n        meet with Josiah to discuss genetics tools\n        design work for job control interface\n        make list of names for project	2017-07-27	4	f
2245	Fun	\n        Amazing Race\n	2017-07-27	2	f
2246	Grow	\n        5, 2, 3, 4\n        walk	2017-07-28	2	f
806	Grow	\n        household catch up\n        walk	2016-09-06	4	f
2105	Tools	\n        debug selenium tests\n        use chromedriver\n        setup db.py on macbook\n        clean up and test menus, site titles, landing pages\n        Building_Software thot map	2017-06-16	4	f
2247	Church	\n        analyze giving and spending for 2017\n        share findings with team\n        enter budget data into Church Dashboard\n        gather data from Todd's spreadsheet\n        build CSV importer\n        send email with updated numbers\n        create view to display church money data	2017-07-28	8	f
3527	Fun	    So You Think You Can Dance\n    nts 3	2018-06-05	7	f
2944	Teach	\n        prep lesson 4\n        switch to PyCharm for content creation\n        teach lesson 4	2018-01-17	8	f
2693	Grow	\n        5, 5, 3, 4\n        time with Stacie\n        nap	2017-11-19	3	f
2694	Church	\n        video of our Giving Talk	2017-11-19	4	f
2262	Tools	\n        monthly rollover of To Do files\n        Weekly planning\n        try to get Digital Ocean 2-factor auth working	2017-08-01	4	f
2695	People	\n        lunch at Rio with Christine and Rachel	2017-11-19	2	f
3528	People	    walk with Rachel\n    talk with Stacie about brain features and habits  \n    look at suitcases with Stacie\n    eating with the baby birds\n    Andrew & Rachel	2018-06-05	3	f
3530	Tools	    deregister old Kindle devices	2018-06-03	1	f
3531	Fun	    Game Night\n    Dragonfly	2018-06-03	5	f
3532	People	    Noodles with Rachel & Christine\n    use new grill for first time\n    call Dad	2018-06-03	3	f
2696	Fun	\n        Run Down, Prince Caspian\n	2017-11-19	5	f
2697	Grow	\n        5, 4, 4, 2\n        personal aspirations\n        organize thoughts and notes\n        sort email\n        sort papers and finance\n        learn about slide show creators	2017-11-20	4	f
3266	People	\n        talk with Stacie	2018-04-05	1	f
3267	Fun	\n        American Made\n	2018-04-05	2	f
3522	Tools	    transfer all repos from Shrinking-World\n    cancel Shrinking-World GitHub account\n    mv UNC repo to UNC-2018-Spring\n    sync content with macbook\n    revamp vc script\n    learn to use color on CLI commands	2018-06-07	5	f
3525	Grow	    4, 4, 5, 5\n    Habits	2018-06-05	1	f
3533	Church	    church service	2018-06-03	4	f
3523	Fun	    travel headphones with patch chord\n    sleep phones - connect macbook & imac\n    listen to KWS\n    ER, Anthony Bordain	2018-06-07	4	f
3524	People	    fix patio chair\n    meet with Josiah	2018-06-07	2	f
3520	WAM	    register for Digital Ocean account using Godaddy contact info	2018-06-07	1	f
3521	Teach	    forward email from unc\n    update UNC automation\n    debug Sensei in new UNC repo	2018-06-07	2	f
3526	Teach	    email UNC colleagues about Teaching Tech\n    work on course map\n    dissatisfying class content	2018-06-05	3	f
3529	Grow	    3, 3, 4, 2\n    feeling sick\n    fear of future	2018-06-03	1	f
4020	Grow	    5, 3, 4, 3\n    weight: 207.2\n    nap	2018-09-23	1	f
2140	Church	\n        pray for church	2017-06-24	1	f
2141	Fun	\n        Niki Heat\n        relax	2017-06-24	6	f
2142	People	\n        visit with Stacie\n        Stacie & Christine to Women's breakfast\n        go to store with Stacie\n	2017-06-24	4	f
2143	Grow	\n        5, 2, 1, 5\n        work on emotional growth\n        walk to library	2017-06-25	2	f
2249	Grow	\n        5, 4, 2, 5	2017-07-29	0	f
2347	Grow	\n        4, 2\n	2017-08-20	0	f
2702	People	\n        Nardins @ Bent Fork\n        Carcassonne	2017-11-21	5	f
2038	Grow	\n        4, 2, 2, 3	2017-06-01	0	f
2039	Hire	\n        learn about Domains and encryption\n        rebuild who2hire.wordpress droplet\n        enable https://who2hire.us\n        create wordpress command script\n        document recipe for creating wordpress site\n        work on encryption for Who2Hire.us	2017-06-01	7	f
2106	Hire	\n        setup Stacie to test\n        resize Who2HIRE.200.png\n        use Who2HIRE.200.png\n        delete Eric Stanley\n        only send notifications from production\n        promote code	2017-06-16	4	f
2945	Grow	\n        5, 2, 2, 4	2018-01-17	0	f
3258	Grow	\n        2, 3, 3, 4\n        sit-ups\n        high winds throughout the night\n        nts 3\n        UNC safety class\n        download Originals audio\n        Principles audio\n        visit Michner library\n        create notes for Principles\n        export kindle highlights as HTML	2018-04-03	12	f
3502	Fun	    Circ du Soleil\n    Dragonfly\n    ER	2018-06-02	4	f
2700	Grow	\n        think about teaching benefits and cost\n        5, 5, 4, 2	2017-11-21	1	f
2701	Tools	\n        investigate jupyter2slides\n        install Reveal.JS\n        setup Tools directory on Uncle Ed\n        move scripts from BACS_200/scripts into Tools\n        setup class variable\n        script to build slide deck from Jupyter file	2017-11-21	7	f
2703	Fun	\n        Black Widow\n	2017-11-21	1	f
2704	Grow	\n        5, 5, 4, 2	2017-11-22	0	f
2705	Teach	\n        help with CS 350 exam\n        read email\n        think about teaching in Spring	2017-11-22	2	f
2706	Tools	\n        investigate extracting text from Power Point\n        install Pandoc on Unco.edu\n        enumerate methods for building presentations\n        debug scripts on Uncle Ed	2017-11-22	4	f
2263	People	\n        lunch with Stacie at Cables\n        visit to Farr Library	2017-08-01	2	f
2264	Fun	\n        browse library\n        John Adams\n        Suits	2017-08-01	5	f
2265	Business	\n        initiate 72T payments\n	2017-08-01	1	f
2266	Grow	\n        4, 1, 3, 2	2017-08-02	0	f
2267	Tools	\n        build workshop/app/DjangoCommand\n        create workshop/views.py code\n\n        fight with Digital Ocean	2017-08-02	6	f
2342	Grow	\n        4, 2, 3, 3	2017-08-19	0	f
2343	Teach	\n        setup UNC office\n        setup office computer\n        build course syllabus, upload to canvas, send to Anne\n        create first three lectures\n        build first week on canvas	2017-08-19	5	f
2344	Church	\n        send out info about dashboard	2017-08-19	1	f
2707	People	\n        Rachel & Andrew @ Romas\n        Carcassonne	2017-11-22	4	f
2708	Fun	\n        Tinker, Tailor\n        library\n	2017-11-22	4	f
2946	People	\n        Christine surgery \n        change flat tire in Bittersweet Park\n	2018-01-17	6	f
2947	Grow	\n        3, 1, 3, 3	2018-01-18	0	f
2948	Teach	\n        grade ex4\n        contact poorly performing students\n        setup macbook for UNC work\n        create lesson 5, ex 5, quiz 2	2018-01-18	5	f
2949	People	\n        Christine surgery #2\n        wait at hospital\n        repair tire	2018-01-18	6	f
3876	WAM	    get GoDaddy CRT\n    install on Digital Ocean web server\n    tighten security on server\n    request SSL certificate using CSR\n    document SSL setup\n    install SSL in NGINX config\n    debug web server config\n    make web server secure\n    minor UI improvements\n    capture log of engineering activities	2018-08-23	5	f
3505	Business	    Stacie met with Women2Women\n    create plan for support	2018-05-30	2	f
4082	Grow	    5, 3, 3, 2\n    weight: 207.8	2018-10-11	0	f
4022	Fun	    Hunger Games II, III\n    	2018-09-23	4	f
4081	People	    Stacie's family travels to Flagstaff\n    Rachel and Andrew come over	2018-10-09	2	f
4010	People	    Mo and Asal\n    clean up house for guests	2018-09-20	4	f
4024	Church	    lunch at Daruma with Suzie, Beilmans, Dawsons\n    talk on money\n    Suzie Klein	2018-09-23	4	f
110	Fun	\n        Connect CBS Sports\n        Superbowl\n	2016-02-07	8	f
4023	People	    time with Stacie	2018-09-23	2	f
2149	People	\n        lunch at Wild Wings with Stacie\n        dermatology checkin	2017-06-26	2	f
2150	Grow	\n        4, 1, 4, 1\n        score mental well-being: appreciation, creativity, destiny, connection	2017-06-27	2	f
2250	Tools	\n        a article to Seaman's Log\n        post articles from Seaman's Log on Facebook\n        show profile pict in Facebook excerpts\n        update logic in Book Notes\n        refactor Seaman's Log and Book Notes\n        show one excerpt in Book Notes page\n        debug char encoding issue\n        fix issue with thot doc	2017-07-29	8	f
2151	Hire	\n        update production server to release 2017-06-23\n        testing on candidate PDF\n        create notifications log\n        view notification log\n        send request for assistance	2017-06-27	6	f
2345	People	\n        Dave & Carol\n        Dinner at Andrew and Rachel's\n        help Stacie clean house\n	2017-08-19	8	f
2248	People	\n        Rachel & Andrew over\n        Carcassonne with Andrew\n	2017-07-28	4	f
2346	People	\n        Dave & Carol\n        lunch at Pelican Lakes\n        Rachel & Andrew\n        Carcassone	2017-08-20	14	f
2348	Grow	\n        5, 2, 2, 5	2017-08-21	0	f
1969	Hire	\n        Hook up Who2Hire user guide\n        Issue 126: Remove manager notes and candidate\n        update doc text for User Guide\n        fix headings for User Guide\n        create panel for page layout\n        enlarge body text\n        simplify team views	2017-05-03	5	f
2354	People	\n        visit with Dave & Carol\n	2017-08-22	2	f
1209	Fun	\N	2016-12-20	3	f
2355	Grow	\n        3, 3, 4, 3\n        nap	2017-08-23	2	f
2356	Tools	\n        Fix Digital Ocean auth	2017-08-23	1	f
2357	People	\n        discuss visit with Stacie\n        discuss class and future with Stacie\n        plan camping trip\n        order bed	2017-08-23	3	f
2358	Teach	\n        class #2 lecture\n        office hours\n        class prep\n        Classroom Setup notes	2017-08-23	5	f
2359	Fun	\n        Mr. Smith\n        Dance\n	2017-08-23	3	f
2366	Fun	\n        camping trip to Covenant Heights\n	2017-08-25	8	f
2367	Grow	\n        2, 1, 2, 5	2017-08-26	0	f
2368	Church	\n        get to know Miga and Jose\n        visit with Mark, Denise, Debbie\n        learn about Covenant Heights	2017-08-26	6	f
2369	People	\n        time with Stacie, Christine	2017-08-26	4	f
2040	Business	\n        meet with Greg\n        discuss business goals	2017-06-01	2	f
2041	Church	\n        church board meeting	2017-06-01	3	f
2370	Fun	\n        relax in mountains\n	2017-08-26	4	f
2371	Grow	\n        4, 1\n        nap	2017-08-27	2	f
2379	Grow	\n        2, 4, 4, 3\n        nap	2017-08-29	2	f
2380	Teach	\n        decide on class assignment approach\n        learn to use Dreamweaver\n        connect to FTP server (Filezilla, Dreamweaver)\n        prep Lecture #5, #6	2017-08-29	8	f
2381	Tools	\n        evaluate Letsencrypt\n        fix  SLL certs on all domains\n        repair Who2Hire.us\n        update notes for SSL	2017-08-29	3	f
2382	Fun	\n        Dance\n	2017-08-29	1	f
2710	People	\n        Thanksgiving with Fleebees\n        tribute to Stacie	2017-11-23	5	f
2712	Fun	\n        Iron Fist, Black Widow\n	2017-11-23	3	f
2349	Teach	\n        first class at UNC	2017-08-21	3	f
2360	Grow	\n        4, 4, 2, 5\n        reflection time	2017-08-24	1	f
2713	Grow	\n        5, 3, 2, 1	2017-11-24	0	f
2361	People	\n        meeting with Josiah	2017-08-24	1	f
2350	Fun	\n        solar eclipse\n        lunch at Romas\n        Arrival	2017-08-21	5	f
2351	People	\n        visit about teaching college\n        visit with Dave & Carol\n	2017-08-21	6	f
2352	Grow	\n        5, 2, 2, 4	2017-08-22	0	f
2353	Teach	\n        training on Canvas\n        build course in Canvas\n        prep for Wed class	2017-08-22	12	f
2362	Fun	\n        Alias	2017-08-24	3	f
2372	Church	\n        Rachel Dawson leads worship\n        think about ministry passions\n        pray about my role in church	2017-08-27	6	f
2373	People	\n        Rachel and Stacie at Egg & I\n        discuss teaching 	2017-08-27	2	f
2374	Fun	\n        Vikings, Alias\n	2017-08-27	4	f
2375	Grow	\n        3, 1, 4, 4	2017-08-28	0	f
2363	Teach	\n        Design & Development\n        discussion ideas\n        Effective & Efficient\n        Software Workshop ideas\n        install Dropbox on UNC computer\n        explore textbook and CD\n        update lecture notes for Week 1 & Week 2\n	2017-08-24	9	f
2364	Grow	\n        3, 2, 2, 5	2017-08-25	0	f
2365	Teach	\n        Lecture #3\n        follow up with students\n        use name tag\n        install Dreamweaver	2017-08-25	6	f
2714	Tools	\n        create reusable slide creator	2017-11-24	1	f
2715	People	\n        9-8 Thanksgiving with Rachel and Andrew	2017-11-24	11	f
2376	Teach	\n        lecture prep\n        Lecture #4\n        rebuild Canvas for course\n        follow up with students	2017-08-28	8	f
2377	People	\n        talk with Stacie	2017-08-28	2	f
2716	Fun	\n        Big Bang\n	2017-11-24	2	f
2717	Grow	\n        5, 2, 2, 3	2017-11-25	0	f
2378	Fun	\n        Profit, Dance, Edge of Eternity\n    	2017-08-28	4	f
2718	Tools	\n        renew certificate for Who2hire.us\n        build general purpose slides creator script	2017-11-25	4	f
2719	Fun	\n        Silicon Valley\n        Profit, This is Us	2017-11-25	7	f
2720	People	\n        Christmas lights\n        Christine treats @ Sol de Jalisco\n	2017-11-25	3	f
2721	Grow	\n        4, 2, 3, 4\n        nap	2017-11-26	1	f
2722	Teach	\n        plan lessons for BACS 200 last week\n        create exercise templates and instructions	2017-11-26	4	f
2723	Church	\n        Rachel D. talk on Hope	2017-11-26	4	f
2724	People	\n        turkey soup at Garcias\n        time with Stacie	2017-11-26	2	f
2725	Fun	\n        Runaways, Big Bang\n	2017-11-26	3	f
2726	Grow	\n        3, 4, 3, 5\n        talk with Stacie	2017-11-27	2	f
2727	Teach	\n        teach class #39	2017-11-27	9	f
2728	Fun	\n        Madam Sec\n	2017-11-27	3	f
2729	Grow	\n        5, 5, 4, 2	2017-11-28	0	f
2709	Grow	\n        5, 5, 2, 5\n        long walk	2017-11-23	2	f
2950	Fun	\n        Profit, This is Us\n        Carcasonne\n	2018-01-18	3	f
2951	Grow	\n        5, 2, 2, 3	2018-01-19	0	f
2269	Grow	\n        4, 2, 2, 5	2017-08-03	0	f
2271	Church	\n        Dawson family & Garcias\n	2017-08-03	6	f
2224	Church	\n        listen to Amazing Grace\n	2017-07-21	4	f
1313	Fun	\n        This is Us, Goldbergs\n	2017-02-01	2	f
111	Business	\n        Monthly meeting with Stacie & Eric	2016-02-08	4	f
113	People	\n        Tomoko and Greg over for dinner	2016-02-08	4	f
2383	Grow	\n        5, 5, 3, 4	2017-08-30	0	f
2384	Teach	\n        Lecture #5\n        read HTML & CSS\n        use Aptana\n        create demo directory\n        follow up with students\n        grade assignment #3\n        Aaron Drury quiz	2017-08-30	8	f
2385	People	\n        Andrew and Rachel over for dinner\n        lunch at Zoes\n        Stacie visits my office	2017-08-30	4	f
2386	Fun	\n        Dance, Profit\n	2017-08-30	2	f
2387	Teach	\n        build HTML demo projects	2017-08-31	2	f
2388	Hire	\n        mid-night thinking about Who2Hire\n        install Yoast SEO on Who2Hire.us\n        discuss business plans with Stacie\n        explore SEO\n        think through marketing learning	2017-08-31	6	f
2389	Grow	\n        3, 4, \n        nap\n        think about personal independence dysfunction\n        schedule Dr Kary\n        schedule Ehrlich	2017-08-31	2	f
2390	Church	\n        church board meeting	2017-08-31	3	f
2391	People	\n        unpack bed	2017-08-31	1	f
2962	Grow	\n        5, 2, 3, 3\n        my heros\n        simpler life\n        personal reflection\n        thinking patterns & books\n        Learning patterns\n        read Focus\n        weekly rhythm	2018-01-21	5	f
2965	Teach	\n        student follow up\n	2018-01-21	1	f
2736	Grow	\n        5, 4, 4, 2	2017-11-30	0	f
2730	Teach	\n        grade take-home exam 200, 350\n        prep class #40	2017-11-28	9	f
2731	People	\n        Pelican Lake with Christine 	2017-11-28	2	f
2732	Fun	\n        Alias\n	2017-11-28	3	f
1970	Church	\n        last SoKM\n	2017-05-03	4	f
2042	Fun	\n        Return of the King	2017-05-31	4	f
2733	Grow	\n        discuss life with Stacie\n        5, 5, 3, 5	2017-11-29	2	f
2734	Teach	\n        teach class #40	2017-11-29	9	f
2735	Fun	\n        Legends of Tomorrow, Big Bang\n	2017-11-29	3	f
2969	Fun	\n        Defenders, Victoria, Amazing Race\n	2018-01-22	5	f
2953	People	\n        Christine comes home from hospital	2018-01-19	2	f
2963	People	\n        Greek cooking\n        Rachel and Andrew\n        Carcassonne with Andrew\n        time with Stacie	2018-01-21	6	f
2970	Grow	\n        5, 1, 3, 3	2018-01-23	0	f
2952	Teach	\n        Update lesson5 (lesson5, ex5, quiz2)\n         Build plans for Sensei Online Courses\n         Teach Lesson \n         Grade Quiz 	2018-01-19	6	f
2959	Tools	\n        create todo and done notes for teaching tools\n        debug UNC scripts on Uncle Ed\n        Web Apps Lesson 1-3\n        build Django app on Uncle Ed	2018-01-20	3	f
2960	Write	\n        Web Apps lesson plan	2018-01-20	2	f
2966	Grow	\n        5, 2, 2, 2\n        weekly planning	2018-01-22	2	f
2961	Fun	\n        Amazing Race, Timeless, Shield\n        read about Carcassonne extensions online\n	2018-01-20	4	f
2964	Church	\n        read first part of Acts\n        read Slow Kingdom Coming\n        time with God\n        stay home from church	2018-01-21	2	f
2971	Business	\n        explore Keysight opportunity\n        review investment strategy\n        investigate blockchain opportunities	2018-01-23	1	f
3276	People	    Noodles with Rachel\n    time with Stacie	2018-04-08	3	f
2954	Church	\n        volunteer appreciate night	2018-01-19	2	f
2955	Tools	\n        create plan for Sensei Online Courses	2018-01-19	3	f
2956	Fun	\n        Carcassonne\n	2018-01-19	1	f
2967	Teach	\n        create lesson 6\n        grade ex5\n        teach lesson 6	2018-01-22	6	f
2968	People	\n        talk with Christine and Stacie\n        job query from John Dutton	2018-01-22	1	f
2957	Grow	\n        walk to HOA meeting\n        get library book about Non-conventional People\n        5, 1, 3, 3	2018-01-20	1	f
2972	Tools	\n        build Sensei prototype web server\n        update code repos and scripts\n        Uncle Ed Tools\n        fix bash shell prompt\n        build out WebApps lessons 1-5\n        create Sensei Online Courses tool	2018-01-23	7	f
3936	Tools	    	2018-09-05	0	f
2153	Tools	\n        fix issue with blank root parent\n        improve Thot UX\n        debug thot import	2017-06-27	3	f
3268	Grow	\n        5, 4, 4, 3\n        nts 2\n        think about personal growth	2018-04-06	3	f
3269	Teach	\n        Lesson 32 - Illustrator\n        grade blog 5	2018-04-06	5	f
3270	Fun	\n        Homeland\n        Abertos\n    	2018-04-06	6	f
3275	Church	    Anabeth & Amy	2018-04-08	4	f
3938	People	    	2018-09-05	0	f
3273	Fun	    Ghost in the Shell\n    Dragonfly	2018-04-07	4	f
3937	Fun	    Britannia\n    nts 1\n    	2018-09-05	5	f
3272	People	    talk with Stacie\n    Stacie returns\n    Andrew, Rachel, Christine	2018-04-07	5	f
3274	Grow	    5, 4, 4, 5\n    nap\n    walk\n    My Life Goals\n    Life Principles	2018-04-08	2	f
2272	Grow	\n        4, 1, 2, 5\n        walk	2017-08-04	1	f
2958	People	\n        HOA meeting\n        shopping for Greek dinner	2018-01-20	4	f
114	Grow	\n        Quiet time	2016-02-08	1	f
115	Fun	\n        X-23\n	2016-02-08	1	f
141	Sign	\n        iMac tools\n            Install PyCharm\n            Python Setup 2.7\n            Install virtualenv for Python 2.7 on Mac\n            Debug Python 2.7\n            Debug Redis install\n            Get testing running	2016-02-16	3	f
142	WAM	\n        create project planning template\n        develop planning strategy\n        create WAM 2.1 project plan\n        create WAM 2.1 project milestones\n        create WAM 2.1 product definition\n        review project plan with Stacie	2016-02-16	7	f
2273	Business	\n        planning for Creative Leap	2017-08-04	2	f
1311	People	\n        surgery for Stacie\n        Andrew over for Carcassonne	2017-02-01	4	f
1312	Church	\n        cancel SoKM due to weather\n        5 traffic deaths in Weld 	2017-02-01	1	f
2154	Fun	\n        Amazing Race\n\n	2017-06-26	4	f
2155	Fun	\n        setup new phone\n        Amazing Race\n	2017-06-27	3	f
2156	Grow	\n        long walk\n        3, 3, 3, 5\n        reflect on joy/pain	2017-06-28	2	f
2157	Tools	\n        learn about view subclassing with Mixins\n        build workshop views: Redirect, Template, Mixins\n        isolate pandoc_html_text\n        create card data converter\n        create universal page logger\n        eliminate dead code\n        heavy app refactoring	2017-06-28	8	f
2158	Fun	\n        Sherlock\n	2017-06-28	4	f
2159	Grow	\n        3, 3, 3, 2\n        personal reflections\n        think about wellbeing	2017-06-29	2	f
2281	Fun	\n        So you think you can dance\n        Limitless\n	2017-08-05	4	f
2282	Grow	\n        4, 1, 2, 5	2017-08-06	0	f
2283	Church	\n        church service	2017-08-06	4	f
2284	People	\n        drive to Denver with Julio & Jackie\n        Rockies Game\n        Newsboys concert	2017-08-06	8	f
2285	Fun	\n        Edge of Eternity\n	2017-08-06	2	f
2286	Business	\n        SWS Partners\n        set up 72T withdrawals	2017-08-07	4	f
2287	Grow	\n        nap\n        5, 1, 3, 3	2017-08-07	2	f
2982	People	\n        Cables Pub & Grill	2018-01-25	1	f
2711	Tools	\n        create slides using jupyter2slides\n        customize CSS for slides\n        improve script for slides	2017-11-23	4	f
1971	Grow	\n        sick day\n        nap\n        3, 3, 3, 2	2017-05-04	7	f
1972	Fun	\n        Tomorrow People, Finding Dory, Entertainment Weekly, Elektra\n	2017-05-04	7	f
1973	Tools	\n        design for canonical queries	2017-05-05	3	f
1974	Hire	\n        work on integration of email system\n        pip install djrill\n        build view for sending support message	2017-05-05	5	f
1975	WAM	\n        fix WAM email address	2017-05-05	1	f
1976	Fun	\n        Guardians, Shield, Good Place	2017-05-05	3	f
1977	People	\n        meet with Howells	2017-05-05	2	f
2737	Teach	\n        grade take-home exam 200, 350\n        prep class #41\n        MCB faculty meeting\n        MCB Christmas party	2017-11-30	14	f
2392	Teach	\n        lecture #6\n        first quiz\n        decide to retake quiz\n        start coding live in class	2017-09-01	7	f
2393	Grow	\n        4, 1, 3, 3	2017-09-01	0	f
2394	People	\n        birthday celebration\n        CB Potts	2017-09-01	3	f
2395	Fun	\n        Hitman's Bodyguard\n	2017-09-01	4	f
2975	Grow	\n        4, 2, 3, 3\n        read Originals	2018-01-24	2	f
2976	Teach	\n        create lesson7, ex7\n        teach lesson7	2018-01-24	6	f
2983	Fun	\n        Victoria	2018-01-25	1	f
2991	People	\n        Egg & I\n        game store\n        Andrew & Rachel	2018-01-27	5	f
3539	People	    house cleaning\n    Anthony Bordain death\n    prepare grill for Andrew\n    transport grill to Andrew's\n    Cazadores\n    Davey and the Blue Dogs	2018-06-08	6	f
2977	People	\n        High Hops	2018-01-24	2	f
2275	Tools	\n        Aspire UX\n        meet with Josiah on collaboration\n        restore Github repos for pipescan	2017-08-04	4	f
2276	Church	\n        create tabbed view in church dashboard\n        refactor view logic\n        meet with Daryl & Heather at Hearth	2017-08-04	5	f
2984	Church	\n        church board meeting\n	2018-01-25	4	f
145	Tools	\n        decide on using "Learning" task in Harvest\n        respond to Michael Uschold	2016-02-17	1	f
2985	Grow	\n        4, 3, 3, 3	2018-01-26	0	f
2986	Teach	\n        teach8\n        ex8, lesson8	2018-01-26	8	f
2987	People	\n        Hirata's party	2018-01-26	2	f
2988	Fun	\n        Victoria, Good Place, Turn\n	2018-01-26	4	f
3500	Teach	    create booknotes quotes from kindle highlights	2018-06-02	3	f
4085	Fun	    library\n    nts 2\n    Jack Ryan\n    Mr Robot\n    	2018-10-11	6	f
3271	Grow	    3, 4\n    Great Organization = People + Culture\n    Openness and accepting reality\n    List of Problems\n    nts 2	2018-04-07	5	f
2973	People	\n        cook Tadtziki & zuchini croquettes\n        Andrew and Rachel	2018-01-23	4	f
2974	Fun	\n        Goldbergs, Victoria\n	2018-01-23	2	f
2978	Fun	\n        Shield, This is US\n	2018-01-24	4	f
143	Church	\n        create planning template for church budget\n        board meeting	2016-02-16	3	f
2980	Business	\n        investments	2018-01-25	2	f
2981	Tools	\n        grade ex7\n        build Sensei tool\n        create plan for Uncle Ed computer\n        write plan for Uncle Ed Tools\n        build tools on Uncle Ed computer\n        debug 	2018-01-25	6	f
2989	Grow	\n        4, 4, 3, 3\n        planning and goals	2018-01-27	1	f
2990	Tools	\n        MyBook redirect and domain manager\n        simplify MyBook routing\n        renew SLL for who2hire.us\n        build new info app in MyBook\n        move history files to info	2018-01-27	5	f
3536	Teach	    	2018-06-08	0	f
3537	Tools	    	2018-06-08	0	f
3538	Fun	    	2018-06-08	0	f
3540	Church	    	2018-06-08	0	f
3534	Grow	    5, 5, 3, 5\n    walk 5.5 miles\n    13,000 steps\n    Habits	2018-06-08	4	f
4083	Teach	    present designer feedback\n    refactor dead code\n    	2018-10-11	7	f
3939	Business	    grout shower	2018-09-04	2	f
4084	Tools	    	2018-10-11	0	f
4011	Grow	    5, 3, 4, 5\n    11,000 steps\n    long walk\n    weight: 208.2	2018-09-22	2	f
2277	Fun	\n        John Adams\n	2017-08-04	2	f
2278	Grow	\n        4, 1, 1, 5\n        daily planning	2017-08-05	1	f
144	Grow	\n        Cornbread chart template\n        high: budget process with cornbread, iMac setup\n        low: board meeting, WAM 2.1 hours\n	2016-02-16	1	f
2979	Grow	\n        4, 2, 3, 3	2018-01-25	0	f
2279	Business	\n        write to Greg about programming languages	2017-08-05	1	f
2043	Fun	\n        Enterprise\n	2017-06-01	2	f
1979	Grow	\n        5, 3, 2, 5\n        Walk to library\n        The Next 100 Years\n        Think about personal destiny	2017-05-06	7	f
2045	Tools	\n        organize brain\n        create booknotes for EQ, Next100Years, Perfect, Requiem\n        build shrinking-world.com website	2017-06-02	5	f
2161	Grow	\n        5, 4, 3, 5\n        walk to lunch\n        appreciate life	2017-06-30	2	f
2290	Fun	\n        Edge of Eternity\n        Benjamin Buttons\n	2017-08-07	4	f
2291	Grow	\n        5, 1, 3, 2	2017-08-08	0	f
2292	Church	\n        meet with Kyle on church dashboard\n        build church dashboard views	2017-08-08	2	f
2293	People	\n        Terry Scott	2017-08-08	4	f
2294	Business	\n        meet with Fidelity on investment tools and techniques\n        consider UNC teaching job\n        send updated resume to Pat Seaton at UNC\n        think about UNC class opportunity	2017-08-08	5	f
2295	Fun	\n        Limitless\n	2017-08-08	3	f
2296	Grow	\n        1, 2, 1, 4	2017-08-09	0	f
2297	Tools	\n        meet with Josiah on biology project\n        system design of data and views for Bio project\n        send info to Josiah about design and project naming	2017-08-09	6	f
2298	Business	\n        think about UNC class opportunity	2017-08-09	3	f
146	Church	\n        FPU	2016-02-17	4	f
3550	Grow	    4, 2, 3, 5\n    long walk\n    haircut	2018-06-15	3	f
3556	Grow	    5, 3, 2, 5\n    mind map: Thinking Patterns\n    morning walk	2018-06-09	2	f
2992	Fun	\n        Victoria\n        play new Timeline - Events game\n	2018-01-27	3	f
2993	Grow	\n        4, 2, 2, 3\n        Tribe of Mentors\n        develop MarkSeaman/info system\n        nap	2018-01-28	3	f
2994	Church	\n        church business meeting\n	2018-01-28	4	f
2396	Grow	\n        3, 4, 3, 4	2017-09-02	0	f
2397	People	\n        birthday celebration & grease fire\n        disassemble bed\n        deliver bed to Garcias and assembly\n        assemble king bed\n	2017-09-02	8	f
2398	Teach	\n        decide on Course Summary Web Demo\n        create Week 1, Week 2 web site\n        move code to FTP server\n        gain experience with Aptana\n	2017-09-02	6	f
2399	Grow	\n        4, 4, 3, 2	2017-09-03	0	f
2400	People	\n        lunch at Meeker's\n        tour Greeley Convention Center	2017-09-03	2	f
2401	Church	\n        church service	2017-09-03	4	f
2402	Fun	\n        Iron Man 1 & 2, Thor\n	2017-09-03	8	f
2738	Grow	\n        5, 5, 3, 5	2017-12-01	0	f
2739	Teach	\n        teach class #41\n        last day of classes\n        CIS department meeting	2017-12-01	10	f
2740	People	\n        Big Fat Pastor with Rachel\n    	2017-12-01	4	f
3285	Grow	    5, 2,\n    record personal beliefs about business\n    analyze pain for marketing success	2018-04-11	2	f
3546	Grow	    5, 2, 3, 2\n    nap\n    video on foods to avoid	2018-06-10	3	f
147	Grow	\n        Late night worry\n        	2016-02-17	1	f
3549	Church	    talk to Chris Warren\n    talk to Clint and Mary Swain	2018-06-10	4	f
3555	Church	    	2018-06-15	0	f
3551	Teach	    plan PHP lessons & apps\n    update BACS 350 content\n    build guide Django app\n    isolate guide from mybook logic	2018-06-15	5	f
3553	Fun	    Supergirl\n    Dragonfly	2018-06-15	2	f
3557	Teach	    first complete schedule for 350 class\n    update http://seamansguide.com/PhpApps/Schedule page\n    decide on Bluehost for BACS 200	2018-06-09	2	f
3558	Tools	    sync files onto macbook	2018-06-09	1	f
3547	Fun	    Dragonfly	2018-06-10	1	f
3290	Teach	    Lesson 35 - Beyond Websites	2018-04-12	5	f
2288	People	\n        lunch with Eric at Sol de Jalisco	2017-08-07	2	f
3294	Teach	    Lesson 35 - Publishing	2018-04-13	6	f
3286	Teach	    Lesson 34 - Design Review\n    All the Queens Horses	2018-04-11	7	f
3288	Church	    small group	2018-04-11	3	f
3554	People	    Anna's Graduation\n    Rachel sick at party	2018-06-15	4	f
3291	People	    Stacie returns	2018-04-12	1	f
3292	Fun	    Amazing Race, Homeland, Madam Sec	2018-04-12	5	f
3281	Grow	    3, 1, 3, 5\n    Originals - Women's suffrage\n    tools for time tracking\n    nts 2	2018-04-10	4	f
3282	Teach	    build design review groups pages	2018-04-10	5	f
3283	People	    discuss coaching with Stacie	2018-04-10	1	f
148	Grow	\n        talk about work life\n        thinking about expectations	2016-02-18	2	f
3284	Fun	    Homeland	2018-04-10	4	f
3542	Teach	    install XAMPP (not yet working)\n    decide on server strategy\n    write PHP Skills, HTML Skills	2018-06-12	2	f
3278	Grow	    5, 2, 2, 4\n    walk\n    nts 3	2018-04-09	3	f
3279	Teach	    Lesson 33 - Teamwork	2018-04-09	7	f
3543	Church	    pack for trip\n    travel to Grand Junction\n    Abe Huber spoke on Living in Tents\n    regional conference	2018-06-12	11	f
3280	Fun	    Homeland	2018-04-09	4	f
3541	Grow	    4, 3, 3, 5\n    wake up at 5:00\n    walk over to garden	2018-06-12	1	f
3544	Grow	    5, 3, 4, 3  	2018-06-14	0	f
3293	Grow	    5, 4, 3, 3\n    Originals - Principle and decision making\n    Effectiveness Metric - ROI on time (influence hours / invested hours)	2018-04-13	2	f
3287	People	    discuss coach retreat\n    talk with Christine	2018-04-11	2	f
3277	Fun	    Lincoln movie, Dragonfly	2018-04-08	5	f
3548	People	    Mark & Jen Nardin\n    Romas with Andrew, Rachel, Christine	2018-06-10	6	f
2289	Tools	\n        design for Bio Workflow Manager	2017-08-07	2	f
149	People	\n        dinner at Palominos	2016-02-18	2	f
150	Fun	\n        TV\n	2016-02-18	2	f
3552	Tools	    	2018-06-15	0	f
2044	Grow	\n        5, 2, 3, 2	2017-06-02	0	f
1978	Grow	\n        5, 3, 3, 2\n	2017-05-05	0	f
2162	Fun	\n        Amazing Race, Castle\n        	2017-06-29	4	f
2163	Tools	\n        create simple summary for app design: Wellbeing, Money, Aspire, MyBook\n        rework menu loading for all sites\n        remove dead code\n        start work on money app	2017-06-30	8	f
2164	People	\n        lunch with Stacie at Senior Jalapeno	2017-06-30	2	f
2741	Grow	\n        5, 4, 3, 3\n        brainstorm on tasks to do\n        review time logs	2017-12-02	2	f
2742	Business	\n        discuss health insurance	2017-12-02	1	f
2743	Teach	\n        grade BACS 200 websites	2017-12-02	8	f
2744	Fun	\n        The Americans\n        Valerian\n	2017-12-02	3	f
2745	Grow	\n        5, 4, 3, 4\n        nap\n        reflection	2017-12-03	2	f
2746	Church	\n        Jenny - Peace	2017-12-03	4	f
2747	People	\n        time with Stacie\n        lunch with Rachel at Doug's Day Diner	2017-12-03	4	f
2748	Fun	\n        Legends, Madam Sec\n        Edge of Eternity\n        Black Widow\n	2017-12-03	4	f
2749	Grow	\n        4, 4, 3, 3	2017-12-04	0	f
2750	Teach	\n        create two final exams\n        lunch at Romas	2017-12-04	9	f
2751	Church	\n        UNC finals outreach	2017-12-04	3	f
2752	Fun	\n        Goldbergs, Librarians\n	2017-12-04	2	f
2753	Grow	\n        4, 4, 3, 3	2017-12-05	0	f
2754	Teach	\n        no show special offer\n        BACS 200 course schedule\n        interact with students	2017-12-05	6	f
3952	Fun	    Westworld\n    	2018-09-07	5	f
2886	Business	\n        review investments\n        sell $20,000 FSTVX\n        review 2017 finances\n    	2018-01-02	4	f
3297	Grow	    4, 3, 3, 2\n    Time Effectiveness\n    explore biz and life goals with Stacie	2018-04-14	3	f
3298	Tools	    renew SSL certificate on who2hire.biz\n    create view for Time Summary\n    compare actual to ideal	2018-04-14	1	f
3561	Church	    write Church Benefits Principles	2018-06-09	1	f
2403	Grow	\n        4, 4, 3, 3	2017-09-04	0	f
2404	People	\n        discuss Josiah travel with Stacie\n        discuss career development with Christine\n        Facebook	2017-09-04	3	f
2405	Teach	\n        build week-3 demo site\n        build FTP site for HTML & CSS example code\n        build Tricks web site tree\n        create course roadmap	2017-09-04	7	f
2406	Fun	\n        Avengers, Iron Man 3\n	2017-09-04	4	f
2407	Grow	\n        3, 4, 3, 3	2017-09-05	0	f
3953	Grow	    4, 4, 3, 5\n    weight: 206.4\n    nap	2018-09-09	2	f
3957	People	    Rio with Potters and Chris Newby\n    time with Stacie\n    	2018-09-09	5	f
3299	People	    explore biz and life goals with Stacie\n    Andrew and Rachel and David - Shrimp and games	2018-04-14	5	f
3559	Fun	    get worms for baby birds\n    desktop music\n    Dragonfly\n    ER	2018-06-09	3	f
3564	WAM	    communications for WAM Server Project	2018-06-11	1	f
3560	People	    Josiah got offer to teach at Biola College\n    Hand & Foot at Fleebes'	2018-06-09	5	f
3289	Grow	    4, 3, \n    Marketing Beliefs\n    organize notes\n    walk\n    fix tennis ball	2018-04-12	3	f
2046	Hire	\n        who2hire.us website security\n        fix email at shrinking-world.com	2017-06-02	2	f
3562	Grow	    4, 2, 3, 3\n    clean paper inbox	2018-06-11	1	f
4018	Fun	    Good Place, Iron Fist, Proposal\n    mess with sound\n    	2018-09-21	3	f
3930	Teach	    clean up old file\n    optimize lesson creation\n    plan Lesson 7 200/350\n    build BACS_350 repo\n    create code tree for 350\n    	2018-09-04	4	f
3295	People	    discuss coaching with Stacie\n    life goals and embracing reality	2018-04-13	2	f
3565	Fun	    ET, Dragonfly\n    Flash	2018-06-11	4	f
3563	Teach	    meet Charmayne\n    write Teaching Tech - Lectures have little value\n    write Mehrgan\n    work out server strategy with Chris Vegter\n    organize schedule around textbook\n    update prep notes	2018-06-11	8	f
3566	Grow	    5, 3, 4, 3	2018-06-13	0	f
3950	Grow	    3, 3, 1, 1\n    weight: 209.0\n    dizziness and early bed	2018-09-07	1	f
3954	Teach	    rewrite lesson script code\n    build test process for both classes\n    	2018-09-09	4	f
3296	Fun	    Amazing Race, Justice League	2018-04-13	4	f
3955	Tools	    	2018-09-09	0	f
3956	Fun	    \n    	2018-09-09	0	f
3567	Church	    regional conference\n    Daryl Evans\n    Abe Huber\n    Kirk Yamaguchi\n    Gabe Quintana\n    Phil Stroud	2018-06-13	14	f
4003	Teach	    200-13 Forms\n    350-13 Building Apps, practice for exams, solutions\n    sign up for zyBooks\n    	2018-09-19	9	f
4086	People	    Andrew & Rachel watch This is Us	2018-10-11	1	f
4021	Teach	    build solutions for lesson 350-14    \n    	2018-09-23	3	f
151	Fun	\n        TV\n        	2016-02-19	4	f
4090	People	    dinner at Rio\n    Kelli arrives at airport	2018-10-08	3	f
152	Business	\n        family finances\n        create cornbread charts	2016-02-20	8	f
4092	Teach	    basic template encoding\n    	2018-10-07	2	f
4093	Fun	    Circle trilogy white\n    	2018-10-07	2	f
3947	Teach	    think through Lesson 9\n    	2018-09-08	2	f
3948	Fun	    Westworld (finish season 1)\n    Dance\n    	2018-09-08	8	f
3949	People	    visit with Stacie	2018-09-08	3	f
4087	Grow	    5, 3, 2, 3\n    weight: 207.2	2018-10-08	0	f
4088	Teach	    talk with Christopher Maxwell\n        	2018-10-08	8	f
4089	Fun	    Vikings, Circle\n    	2018-10-08	3	f
4091	Grow	    4, 3, 3, 3\n    weight: 208	2018-10-07	0	f
2047	People	\n        deep talk with Stacie\n        Cafe Athens	2017-06-02	3	f
2048	Fun	\n        Wonder Woman\n        Barnes and Noble\n	2017-06-02	4	f
2049	Grow	\n        5, 3, 2, 3\n        publish booknotes excerpts	2017-06-03	1	f
2055	Grow	\n        5, 2, 3, 4\n        walk to library	2017-06-05	0	f
2423	Fun	\n        Hawaii 50, internet\n	2017-09-08	6	f
2424	Grow	\n        4, 5\n        think about personal growth and teaching experience	2017-09-09	2	f
1124	Business	\n        develop retirement analysis\n        apply for loan on HELOC	2016-12-01	4	f
1125	Write	\n        create Facebook group for Seaman's Log\n        grow membership of Spiritual Things to 23 people\n        post articles on Facebook\n        organize brain topics	2016-12-01	3	f
1134	Tools	\n        investigate character encoding\n        remove all bad characters from documents\n        plan out next phase of projects\n        improve command "ce"\n        improve Spiritual Send	2016-12-03	5	f
1148	Hire	\n        refine ideas about panel interviews\n        update data model diagram\n        build job menu items\n        load production data onto Macbook\n        create session configuration view\n        create a table to display skills and interviewers\n        select many-to-many skills/interviewers	2016-12-06	7	f
1187	Tools	\n        update plan for task manager\n        create monthly display of tasks\n        create weekly summary for tasks\n        simplify task queries using ORM\n        create task tests\n        build task dashboard\n        WAM message post\n        upgrade operating system on Mac\n        renew Goddady domains	2016-12-16	6	f
1222	Write	\n        author scorecard\n        Writing Workbench\n        organize brain\n        publish Projects articles\n        publish Brain Spaces (Goal, Learn, Teach, Build)\n        Processing Ideas\n        Tools for Thinking\n        publish Project list\n        create Software/BestPractice	2016-12-24	6	f
1244	People	\n        New Years party - Moras, Claudine, Rachel	2016-12-31	6	f
2408	Teach	\n        decide on parts: HTML/CSS basics, Design, JavaScript\n        prep lecture #7, #8\n        work at library\n        FTP content to server	2017-09-05	8	f
2409	People	\n        lunch at Romas with Christine and Stacie	2017-09-05	3	f
2410	Fun	\n        Dance\n        Edge of Eternity\n\n	2017-09-05	3	f
2411	Grow	\n        nap\n        4, 4, 2, 3	2017-09-06	2	f
2412	Teach	\n        prepare for Lecture #7\n        Lecture #7\n        introduce live programming to class\n        troubleshoot FTP connections\n        hookup Instructor laptop\n        lunch and think at Santeramos	2017-09-06	7	f
2425	Business	\n        buy INST stock\n        subscribe to Motley Fool	2017-09-09	2	f
2426	Teach	\n        workflow model - build overview, send to Stacie	2017-09-09	2	f
2995	People	\n        time with Stacie\n        Right Coast Pizza	2018-01-28	3	f
2996	Fun	\n        Resident, This is Us, Shield	2018-01-28	4	f
2997	Grow	\n        5, 2, 3, 2\n        build MarkSeaman/info/Projects - Grow, Build, Learn, Write	2018-01-29	2	f
3300	Business	    investment review	2018-04-14	1	f
4095	Church	    chili potluck\n    Arrows finale	2018-10-07	6	f
2413	People	\n        Rachel in car accident\n        Andrew and Rachel over	2017-09-06	2	f
2414	Fun	\n        Edge of Eternity\n        Guardians of Galaxy\n        Profit\n	2017-09-06	3	f
2415	Grow	\n        4, 3, 4, 3	2017-09-07	0	f
2416	Church	\n        give away Wii	2017-09-07	1	f
2417	Teach	\n        build framework for Workflow Model\n        create diagrams for workflow model\n        create evernote with workflow model description\n        setup website for class\n        setup Quiz #1 Retake	2017-09-07	6	f
3545	Church	    Abe Huber\n    Insurance meeting at conference\n    discuss financial numbers with Stacie\n    Phil Stroud\n    drive home\n    dinner at Pullmans in Glenwood	2018-06-14	14	f
117	People	\n        Business with Stacie	2016-02-09	3	f
3301	Fun	    use OverDrive to checkout eBooks\n    install Olive Tree app on Kindle Fire	2018-04-14	4	f
4036	Fun	    TV installation and setup\n    Hunger Game IV	2018-09-25	6	f
4094	People	    call Dad about Atheist email \n    Leslie and Lucy arrive\n    time with Stacie	2018-10-07	4	f
4029	Grow	    5, 4, 5, 3\n    weight: 207	2018-09-26	0	f
4031	Tools	    	2018-09-26	0	f
2418	Business	\n        haircut\n        propane	2017-09-07	1	f
4032	Fun	    Vikings\n    	2018-09-26	1	f
4033	People	    Andrew and Rachel	2018-09-26	4	f
4034	Grow	    5, 3, 4, 3\n    weight: 208	2018-09-25	0	f
4025	Grow	    5, 4, 3, 3\n    weight: 207	2018-09-24	0	f
4027	Fun	    Vikings\n    mess with TV sound\n    Resident\n    	2018-09-24	5	f
4028	People	    talk with Stacie	2018-09-24	1	f
2420	Fun	\n        Hawaii 50, Dance\n	2017-09-07	3	f
2421	Grow	\n        4, 5, 3, 3	2017-09-08	0	f
4030	Teach	    200 15 - CSS Color\n    350 15 - Design Patterns\n    Meet about 250 class structure	2018-09-26	9	f
2419	People	\n        Josiah & Sam\n        Smash Burger with Stacie	2017-09-07	3	f
2422	Teach	\n        setup Quiz\n        class #8\n        Quiz #1 retake\n        conflict with students\n        CIS meeting\n        announce homework due date extension	2017-09-08	8	f
2052	Grow	\n        5, 2, 2, 3\n        walk\n        pray for others\n        nap	2017-06-04	4	f
2050	People	\n        HOA board BBQ\n        help Andrew build workbench	2017-06-03	9	f
2051	Fun	\n        Vikings\n        Niki Heat\n	2017-06-03	4	f
2053	Church	\n        service\n        lunch with Chris and Elaine at El Cielo	2017-06-04	6	f
2054	Fun	\n        Return of the King \n        Niki Heat\n	2017-06-04	4	f
2056	Tools	\n        fix tests	2017-06-05	2	f
2165	Fun	\n        Aeon Flux	2017-06-30	2	f
4389	Church	    Ruby's first church service	2018-12-16	4	f
4390	Fun	    Stargate: Continuum, Resident\n    	2018-12-16	4	f
4381	Grow	    5, 3, 3, 2\n    weight: 207.4\n    Man's Search for Meaning	2018-12-17	2	f
4382	Teach	    explore Repl.it\n    write draft of first lessons\n    build embedded Repl\n    create Repl: Simple Page, HTML and CSS\n    	2018-12-17	5	f
4384	Fun	    download Pentomino puzzles\n    GoT\n    	2018-12-17	3	f
4385	People	    Lucy arrives\n    dinner with Lucy & Stacie\n    setup CPAP machine	2018-12-17	2	f
4388	People	    dinner at home\n    time with Stacie\n    	2018-12-16	2	f
2169	Fun	\n        Regarding Henry\n        Timeless, Legends\n	2017-07-01	5	f
2170	Grow	\n        3, 3, 3, 2\n        nap	2017-07-02	2	f
2171	Church	\n        church service	2017-07-02	4	f
2172	People	\n        visit with Rachel	2017-07-02	2	f
2173	Tools	\n        design for new email sender\n        system testing	2017-07-02	2	f
2174	Fun	\n        Contact\n	2017-07-02	4	f
2175	Grow	\n        5, 3, 1, 2	2017-07-03	0	f
2176	Church	\n        think about church leadership and strategy\n        write ideas about dimensions of church health	2017-07-03	4	f
956	Write	\n        Write Transformation notes\n        writing plan for politics\n        Jesus and Politics\n        Politics and Outrage	2016-10-11	3	f
2428	Fun	\n        Vikings, internet	2017-09-09	4	f
2429	People	\n        Andrew's birthday\n	2017-09-09	2	f
2430	Grow	\n        4, 3, 4, 3\n        personal review\n        think about teaching experience	2017-09-10	2	f
2431	Teach	\n        build week4 website\n        repair web server root page\n        build up Teacher web page\n        setup Google user for UNC\n        build index page for HTML examples\n        create links for web tricks\n        write Development Skills guide\n        review Quiz results\n        prep lecture\n        send announcement to students	2017-09-10	7	f
2432	Fun	\n        Silicon Valley\n	2017-09-10	5	f
2057	People	\n        meet with Jayden Howell	2017-06-05	2	f
2058	Hire	\n        debug who2hire.us security settings for letsencrypt\n        update server setup notes	2017-06-05	6	f
2059	Write	\n        add booknotes for EQ and Integrity\n        post on Facebook	2017-06-05	2	f
2060	Fun	\n        Homeland\n	2017-06-05	2	f
2061	Grow	\n        5, 3, 3, 5\n        read EQ\n        read Essentialist\n        two long walks	2017-06-06	3	f
2062	Tools	\n        improve booknotes\n        clean up websites\n        build rcp scripts\n        move docs around	2017-06-06	3	f
3576	Fun	    100 Foot Journey\n    I Can Only Imagine	2018-06-16	4	f
2998	Teach	\n        Topics for Part 1 (week 1-5)\n        Lesson 9: \n            prep lesson, ex\n            grade quiz, ex\n            teach	2018-01-29	6	f
2063	Hire	\n        Stacie meets with John Klassen\n        discuss meeting and next steps	2017-06-06	5	f
2064	Fun	\n        Madam Sec\n	2017-06-06	3	f
2065	Grow	\n        3, 4, 4, 5\n        walk	2017-06-07	1	f
4048	Grow	    5, 3, 3, 3\n    weight: 207.2\n    nap	2018-09-30	2	f
2999	People	\n        lunch with Todd\n        talk with Stacie	2018-01-29	2	f
3000	Fun	\n        ER, Flash, Supergirl, Amazing Race\n	2018-01-29	4	f
3001	Grow	\n        5, 2, \n        mid-night prayer\n        task planning	2018-01-30	3	f
3002	Business	\n        gather pay stubs	2018-01-30	1	f
4049	Teach	    Plan lessons for week \n    	2018-09-30	1	f
3573	Church	    church service	2018-06-17	4	f
3574	Grow	    5, 3, 5, 3	2018-06-16	0	f
3577	People	    clothes shopping\n    clean up patio	2018-06-16	3	f
3575	Teach	    build guide structure\n    add guide menu\n    add CSS to guide\n    Outline View\n    Schedule View\n    Lesson View	2018-06-16	6	f
3302	Grow	    5, 3, 2, 3\n    nap\n    time tracking summary view	2018-04-15	3	f
3568	Grow	    5, 5, 2, 3	2018-06-17	0	f
3569	Teach	    create PHP lesson 2	2018-06-17	2	f
3570	Tools	    	2018-06-17	0	f
3571	Fun	    	2018-06-17	0	f
3572	People	    Father's Day lunch\n    call dad\n    Anna's wedding\n    drive to Estes park	2018-06-17	8	f
2755	Hammer	\n        debug test across all three platforms\n        budget hours and score script\n        create summary for each month of 2016\n        update time history for 2016 Jan-May\n        move TODO_DIR to MarkSeaman/history	2016-10-05	2	f
3578	Church	    discuss church involvement	2018-06-16	1	f
4043	Fun	    White\n    Voyager, Overboard\n    	2018-09-29	4	f
119	WAM	\n        Acceptance testing with WAM\n        Develop requirements for email\n        Add workflow buttons to edit page\n        Edit when appstatus = 0 or 5 or 3\n        Change button to "Accepted Complete"  (from "Accept and Close")\n        Display "Notes for Voters" on vote page\n        Add report capability to Admin Director\n        Display case ID number\n        Change voting redirect	2016-02-10	4	f
4037	Grow	    5, 5, 3, 3\n    weight: 205.5	2018-09-28	0	f
4039	Fun	    Judgement at Nurenberg\n    	2018-09-28	3	f
4040	People	    Rachel and Andrew\n    Nordy's\n    Christine dislocated shoulder	2018-09-28	3	f
4041	Grow	    5, 5, 2, 1\n    weight 205	2018-09-29	0	f
4042	Teach	    learn PHP - Arrays\n    build solutions for 350\n    	2018-09-29	8	f
4045	Grow	    5, 5, 5, 5\n    weight: 206\n    10,000 steps	2018-09-27	2	f
4046	Teach	    Build solution directories\n    Document design patterns	2018-09-27	5	f
4047	Fun	    Infinity War\n    	2018-09-27	3	f
2168	Tools	\n        create money application\n        update all plans and project ideas\n        plan how to incorporate view refactoring into existing apps\n        create menu tester	2017-07-01	4	f
2166	Grow	\n        4, 4, 2, 5\n        walk with Stacie to 257\n        read about Wellbeing\n        review relationships	2017-07-01	3	f
963	People	\n        drive to Nashville\n        transport Lucy to Laurie's\n        visit with Laurie's family\n        listen to Perelandra\n        condo in Nashville	2016-10-13	13	f
2427	Church	\n        update church dashboard	2017-09-09	2	f
120	Business	\n        Review all linked in contacts\n        Create email for book promotion\n        Update linked in contacts\n        Send out 100 emails promoting book\n        Reply to 20 emails\n        Update posts on Google+	2016-02-10	4	f
4044	People	    Send TV to Garcias	2018-09-29	2	f
2167	People	\n        lunch with Stacie at Pelican Joes\n        reconnect with Larry Chapman\n        research Duncan Terry	2017-07-01	2	f
118	Grow	\n        Quiet time\n\n	2016-02-09	1	f
2433	Grow	\n        5, 4, 3, 3	2017-09-11	0	f
3004	People	\n        Pelican Lakes	2018-01-30	2	f
3304	People	    El Cielo with Garcias and Christine	2018-04-15	2	f
3305	Fun	    Ready Player One	2018-04-15	5	f
3303	Church	    church service	2018-04-15	4	f
122	Church	\n        Financial Peace Univ	2016-02-10	4	f
333	Tools	\n        simplify user command scripts\n        debug data command scripts\n        convert tests for user and data\n        upgrade Django to 1.9.4 on WAM Staging server\n        rebuild tables on staging\n        deploy new code to staging	2016-04-13	6	f
420	Tools	\n        create App Master web app\n        create initial doc content files for App Master\n        5-views: list, detail, add, edit, delete\n        clone generic app structure\n        plug in custom CSS	2016-05-09	8	f
429	Tools	\n        theme & fonts for PyCharm\n        update deployment of MyBook\n        save current data\n        destroy DB\n        upgrade MyBook online to Django 1.9.4\n        rebuild tables\n        test & debug application settings\n        debug Gunicorn configuration\n        test deployment	2016-05-11	8	f
471	Tools	\n        Build up technology showcase\n        Develop automated testing\n        Move app location for Home\n        Create Hire app ideas	2016-05-24	3	f
530	Tools	\n        create design for consolidation of front-end logic\n        build hire_home.html template\n        create cards in page layout\n        create main menu structure\n        load fake data into all views\n        create descriptions for workflow\n        build display for listing questions, interviewers, candidates\n        deploy to production server\n        create initial user experience	2016-06-16	8	f
584	Tools	\n        build collab views\n        develop outline of collab docs	2016-07-03	2	f
593	Tools	\n        build collaborator application tool\n        add collab routes to Hammer Showcase\n        create menu for: Project, UX, Front, Back, Hosting, Auto, Test\n        build page master script\n        create general Project management tools\n        custom logic for document views\n        display document in directory folder\n        deploy changes on production server	2016-07-05	8	f
643	Tools	\n        major refactoring on all hammer websites\n        rebuild all views\n        debug domain selector\n        change folder structure for documents\n        create menu for hammer showcase\n        create menu for collaboration\n        build site navigation\n        debug template loading	2016-07-19	8	f
669	Tools	\n        EB - create doc send command script\n        EB - create doc html command script\n        PP - document Front-end tricks in collaborator\n        FU - improve interaction with collab app\n        PP - apply task codes\n        IB - remove dead code and refactor\n        IH - deploy new website	2016-07-26	8	f
691	Tools	\n        Update todo.py script\n        Analysis of work done recently\n        create hourly script\n        create client script\n        setup spiritual things sender\n        select random notes for email	2016-08-01	4	f
701	Tools	\n        add instrumentation to hammer\n        improve page redirect mechanism\n        general purpose display_document \n        encapsulate page redirect logic\n        create specialized views\n        debug Spiritual Things site\n        debug Seamans Log site\n        create Seaman Tech plan	2016-08-05	8	f
747	Tools	\n        create text processing script\n        implement text select\n        implement text match, no-match\n        implement text replace\n        test for text functionality\n        create general purpose text mapping tool\n        create text converter utility\n        convert Hammer web site to use new code	2016-08-19	3	f
880	Tools	\n        time management scripts	2016-09-24	2	f
121	People	\n        Time with Stacie	2016-02-10	1	f
928	Tools	\n        debug test across all three platforms\n        budget hours and score script\n        create summary for each month of 2016\n        update time history for 2016 Jan-May\n        move TODO_DIR to MarkSeaman/history	2016-10-05	2	f
1826	Tools	\n        Update 2016 project goals\n        Update Time.xlsx record for 2015 & 2016\n        Build goals for Hammer project\n        Clean up CSS for web sites\n        Debug data load and data store	2016-01-15	6	f
1851	Tools	\n        Install Pycharm 5.0.3 on all three computers\n        Update Linux computer to run Ubuntu 15.10\n        Debug system tests on 15.10\n        Build sysnew and sysold command scripts\n        Build editing workflow for renaming thots	2016-01-23	4	f
1877	Tools	\n        re-purpose existing Digital Ocean Droplet to Hammer host\n        setup git repo and pandoc on Droplet\n        reassign floating IP	2016-04-25	3	f
1881	Tools	\n        Create view to list the tasks\n        Build simplest possible view for tasks\n        Build task command script\n        Add tasks app to Hammer\n        Build functional test under tst\n        build tasks app in Django\n        Add task list and details views	2016-05-04	8	f
2177	Tools	\n        email send is broken\n        build Advisor view\n        select review of random documents\n        advisor: doc selector\n        build excerpt view for booknotes\n        create base class for Aspire Views	2017-07-03	6	f
2434	Teach	\n        homework help\n        lecture #9\n        help with homework after class\n        Zoe's email complaints\n        build homework guide doc\n        copy FTP files to Mac\n        create list of common problems\n        email students with guidance\n        set grades for Quiz #1	2017-09-11	11	f
153	People	\n        Josiah and Sam\n        apologize to Todd & Jenny	2016-02-20	2	f
155	Fun	\n        X-Men First Class\n	2016-02-20	3	f
1130	Business	\n        develop Household Economics\n        create general spreadsheet for Budget, Investment, House\n        create simplified budget review process\n        discuss family finance with Stacie\n        resolve gross/net budget\n        build spreadsheet for tracking investments	2016-12-02	5	f
2435	People	\n        Stacie returns home	2017-09-11	2	f
2436	Fun	\n        TV\n	2017-09-11	1	f
4399	Fun	    British Baking, Profit\n    	2018-12-19	2	f
4400	People	    visit Rachel\n    Ruby now weighs 8 lb 2 oz	2018-12-19	2	f
4396	Grow	    4, 1, 2, 2\n    weight: 209.4\n    reflection and prayer\n    Christmas Story	2018-12-19	3	f
4397	Business	    finish up on Agent Match project\n    	2018-12-19	1	f
156	Church	\N	2016-02-21	4	f
3321	People	    discuss strategy for deeper connections\n    interact with Lynn on teaching\n    dinner with Stacie	2018-04-19	3	f
3322	Fun	    Legends, Supergirl	2018-04-19	2	f
2066	Tools	\n        clean up time data (write task_rename script)\n        improve tech, shrinking-world, mybook sites	2017-06-07	2	f
802	People	\n        visit Pittick Mansion\n        Jory restaurant with Jen & Mark\n        drive to downtown Portland\n        Josiah and Sam meet up with PDS in London\n        Josiah calls to talk about house	2016-09-04	12	f
2437	Grow	\n        5, 4, 5, 5	2017-09-12	1	f
2438	Teach	\n        think about class\n        help students with homework	2017-09-12	6	f
2439	People	\n        Sr Jalapenos\n        visit bike shop\n        look at grill repair	2017-09-12	3	f
2440	Fun	\n        Legends, Fraiser, \n	2017-09-12	4	f
2441	Grow	\n        5, 5, 3, 3\n        explore idea of Study Abroad\n        Standout Assessment Report	2017-09-13	4	f
2442	People	\n        discuss career plans with Stacie	2017-09-13	2	f
2443	Teach	\n        class #10\n        help students after class\n        meet with Merhgan & Charmayne\n        plan new class strategy	2017-09-13	4	f
2444	Business	\n        maintenance on car	2017-09-13	1	f
2445	Fun	\n        Profit\n	2017-09-13	3	f
2446	Grow	\n        2, 4,\n        sleepless night processing new ideas\n        nap	2017-09-14	3	f
2447	Teach	\n        plan out homework strategy for class\n        build homework assignment web content\n        publish Exercise #1\n        build list of first 10 exercises	2017-09-14	5	f
3328	People	    Fondue with family\n    Rachel & Andrew\n    discuss life learnings with Andrew & Rachel\n    Carcassonne with Andrew	2018-04-21	4	f
3307	Teach	    Lesson 36 - Web Hosting\n    CIS staff meeting	2018-04-16	8	f
3309	Grow	    5, 2, 2, 3\n    Time Investment\n    Originals - revolutionaries, ideas to apply\n    Time scorecard - ROI for regular activities	2018-04-17	3	f
3320	Tools	    learn about character encoding\n    update tools plans\n    create list of UNC Teaching tools	2018-04-19	4	f
3005	Fun	\n        ER, Amazing Race, Resident, Goldbergs\n	2018-01-30	4	f
3006	Grow	\n        5, 3, 3, 2\n        personal planning\n        Originals	2018-01-31	2	f
3007	Teach	\n        lesson 10 - prep, teach, grade, assist\n        create students website page	2018-01-31	8	f
3314	Grow	    5, 1, 3, 4\n    Calendar\n    Investments	2018-04-18	0	f
3310	Teach	    Grading\n    MCB Graduates	2018-04-17	4	f
3311	Church	    Center for International Education (seminar)	2018-04-17	2	f
3315	Teach	    Lesson 37 - App Hosting\n    work on Uncle Ed web page creation\n    Charmayne - help with BACS 350	2018-04-18	8	f
3308	Fun	    Amazing Race, Shield	2018-04-16	3	f
3580	Teach	    email UNC colleagues\n    congrats Mehrgan\n    plan UNC day on Tues (tools, textbook, Uncle Ed, network)\n    write Software Dev Workflow\n    write Problem-solving Workflow	2018-06-18	4	f
3582	Fun	    Think you can Dance 	2018-06-18	1	f
3330	Grow	    5, 3, 3, 2\n    analyze time spent\n    learn new python tricks	2018-04-22	2	f
3317	Fun	    Madam Sec, ER	2018-04-18	3	f
3324	Teach	    Lesson 38 - Domain Hosting\n    text char encoding	2018-04-20	8	f
3325	Fun	    Matrix	2018-04-20	3	f
3323	Grow	    5, 3, 3, 3 \n    Principles - Life story, Two brains, Bridgewater	2018-04-20	3	f
3581	Tools	    	2018-06-18	0	f
3329	Fun	    Homeland	2018-04-21	3	f
3326	Grow	    4, 3, 3, 1\n    discuss recent learning with Stacie\n    Mental Models notes\n    organize info in brain\n    nap	2018-04-21	5	f
3584	Church	    health benefits\n    budget planning	2018-06-18	2	f
3327	Teach	    build outline for last 3 lectures\n    learn new Python idioms	2018-04-21	2	f
3316	People	    walk and dinner with Stacie at Sand Bar\n    discuss life opportunities\n    Stacie meets with John Klassen	2018-04-18	3	f
3312	People	    Stacie phone call with Dave Chase team\n    Stacie meets with John Klassen\n    email Lynn Mora\n    email Joe Woodman	2018-04-17	2	f
3313	Fun	    Amazing Race	2018-04-17	3	f
3306	Grow	    5, 2, 2, 5\n    ROI of time invested\n    Activities for Personal Growth	2018-04-16	3	f
3583	People	    healthcare planning\n    Rachel & Andrew\n    Father's Day at Pelican Lakes	2018-06-18	5	f
1079	Fun	\n        Heat Wave\n        Ms. Marvel\n	2016-11-19	4	f
124	Sign	\n        Create local dev machine (front-end)\n        Debug local dev machine (back-end)\n        Setup PyCharm for Sign\n        Review JIRA tickets\n        Design Payment and Notify systems\n        Meet with Tom & Brandon	2016-02-11	8	f
3579	Grow	    5, 3, 1, 5\n    personal review and planning\n    walk to library\n    refill prescriptions (try to register for account)	2018-06-18	2	f
2178	Fun	\n        Rogue One\n        organize music with phone\n        Sudoku\n	2017-07-03	4	f
853	Grow	\n        take magazines to library\n        Mega Trends 2010\n        Impact\n        organize brain\n        post on facebook\n        sleep: 0, weight: 208.2, cal: -, exercise: 1 mile	2016-09-17	5	f
859	Hire	\n        fix problem with cut and paste of questions\n        deploy code for Stacie to test\n        changes from Stacie's review\n        add http://hire/score page\n        design for scoring\n        create screen shots for presentation\n        improve look & feel\n        debug and test all features in app	2016-09-19	8	f
2756	Hammer	\n        time management scripts	2016-09-24	2	f
2180	Tools	\n        create thot/App_Design\n        fix issues with new features\n        refactor tst_results code\n        clean up old WAM domain\n        implement doc sender\n        remove old email code\n        simplify old doc code\n        clean up advisor	2017-07-04	6	f
2179	Grow	\n        3, 2, 2, 2	2017-07-04	0	f
4435	Fun	    Muppets Christmas Carol\n    	2018-12-26	4	f
4198	Grow	    5, 1, 3, 5\n    weight: 209.2	2018-11-17	0	f
4436	People	    Garcias over to watch Muppets	2018-12-26	2	f
4403	Fun	    GoT\n    	2018-12-21	2	f
4370	People	    neighborhood party at Faye's\n    get Christmas tree\n    buy concrete for household project	2018-12-14	5	f
4434	Tools	    implement Rest Framework\n    install React\n    build React UI	2018-12-26	3	f
2181	Fun	\n        Read\n	2017-07-04	2	f
2183	People	\n        Stacie's computer fails to upgrade drivers\n        meet Larry Chapman for lunch	2017-07-05	4	f
2185	Grow	\n        5, 2, 1, 1	2017-07-06	0	f
3339	People	    discuss business goals with Stacie\n    Joe Woodman	2018-04-24	4	f
3346	Fun	    Profit, Madam Sec, Fraiser	2018-04-25	2	f
3342	Grow	    4, 1, 1, 3\n    think about goals	2018-04-25	1	f
3951	Teach	    prep Lesson 8\n    live programming subscribers app\n    image display\n    show class materials to Chris Newby\n    	2018-09-07	8	f
3331	Church	    community garden\n    church service	2018-04-22	6	f
2457	People	\n        Greeley Feastival\n	2017-09-16	4	f
2458	Teach	\n        build exercise 3	2017-09-17	3	f
2459	Church	\n        church service	2017-09-17	4	f
2460	People	\n        lunch with Rachel & Andrew at Mexicali	2017-09-17	2	f
2461	Grow	\n        3, 4, 3, 3\n        nap	2017-09-17	2	f
2462	Fun	\n        Winter Soldier\n	2017-09-17	3	f
2463	Grow	\n        5, 4, 4, 5\n        thoughts about Dad\n        walk to UC and bookstore	2017-09-18	3	f
2464	Teach	\n        class prep\n        class #12\n        help students\n        grading quiz #2	2017-09-18	8	f
2465	Fun	\n        Ultron\n	2017-09-18	3	f
2757	People	\n        Courtney graduation at Chop House	2017-09-30	4	f
3003	Tools	\n        Notes - Build out Private Notes topics: Build,Teach\n        debug Django and script setup on Uncle Ed\n        remove Python installs from UNC Git repo\n        Pandoc on Uncle Ed, Slide Master	2018-01-30	4	f
4097	Grow	    5, 4, 3, 4\n    weight: 206.4	2018-10-10	0	f
3334	Grow	    5, 4, 1, 4\n    walk\n    Principles - heroes & philanthropy\n    organize brain notes (tags, TOC, folders)	2018-04-23	2	f
3335	People	    time with Stacie	2018-04-23	1	f
3345	Business	    discuss who2hire with Stacie\n    sell Whole Market investements; buy Motley Fool	2018-04-25	1	f
3336	Teach	    Lesson 39 - Project Planning\n    Moe interview - class, lunch, dinner, summary\n    Design Review data structures\n    Brandon Williams\n    Michael Schott	2018-04-23	10	f
3337	Fun	    Fraiser, ER	2018-04-23	1	f
3343	People	    dinner with Stacie at Hearth\n    walk together	2018-04-25	3	f
3344	Teach	    Lesson 40 - Project Tracking\n    follow up new tools - Github Desktop, Brackets\n    student council picnic	2018-04-25	7	f
4100	People	    visit with Stacie on phone	2018-10-10	1	f
3319	Teach	    Web server down\n    query team about reviews in Canvas\n    contact Mehrgan about Originals	2018-04-19	1	f
3341	Fun	    Fraiser, Turn	2018-04-24	2	f
3338	Grow	    5, 2, 3, 2\n    sort through ideas\n    build index for topics about Fun\n    create note for Booknotes\n    create note for Thinking Tools\n    create Personal Growth index 	2018-04-24	5	f
3946	Grow	    5, 2, 5, 3\n    walk	2018-09-08	1	f
285	People	\n        Allegiant at Carmike Bistro\n        Alley Cat coffee shop	2016-03-30	4	f
4007	Teach	    200 - export grades, create exam, grading\n    350 - export grades, create exam, grading, Noah,Robert,Bryan\n    zbooks investigate lessons\n    	2018-09-20	8	f
289	Fun	\n        \n\n# Tasks History     April 2016\n\n## April Objectives 2016\n\n    Balance with Work & Life (100-120 billable hours)\n    Family budget\n    HELOC (22,000 by 5-1)\n    Content with life\n\n    \n## Accomplishments\n	2016-03-31	5	f
4026	Teach	    200 - 14 - slides, zb assignment, release grades\n    350 - 14 - slides, zb assignment, release grades\n    first day with zybooks\n    	2018-09-24	8	f
4051	Church	    David Brooks, Whiteout\n    Drive to Denver to meet Susan and Gary Stokes	2018-09-30	8	f
2448	Fun	\n        Dark Matter, Limitless, Last Man\n	2017-09-14	6	f
4096	WAM	    testing and deploy\n    improve report\n    improve user list\n    restructure who gets notified	2018-10-06	5	f
4098	Teach	    introduce design reviews\n    pair programming in 350\n    office hours - Christina Richey, Jorge Rubio\n    talk with Vish	2018-10-10	8	f
4099	Fun	    Britannia, Jack Ryan\n    dinner at Fontas\n    Tombs - audiobook\n    	2018-10-10	5	f
4114	Grow	    5, 3, 3, 3\n    weight: 207.8	2018-10-12	0	f
4115	Teach	    posting data to same page\n    improve logging utility\n    	2018-10-12	8	f
3340	Business	    Motley Fool investment seminar\n    research investments	2018-04-24	3	f
2449	Grow	\n        5, 5	2017-09-15	0	f
2450	Teach	\n        prep for class\n        homework pivot\n        quiz #2\n        write exercise #2\n        setup Dropbox to sync files\n        work on FTP server permissions\n        plan strategy for exercises and in-class practice	2017-09-15	8	f
2453	People	\n        Andrew & Rachel (having difficulties)\n	2017-09-15	2	f
2454	Grow	\n        4, 5, 2, 3	2017-09-16	0	f
2451	Business	\n        discuss partnering strategy with Stacie	2017-09-15	2	f
2452	Fun	\n        NCIS, Hawaii 50	2017-09-15	2	f
2455	Teach	\n        create homework grading scripts\n        give feedback on exercise #1\n        look at quiz results\n        take exam	2017-09-16	6	f
2182	Grow	\n        5, 1, 1, 3	2017-07-05	0	f
2456	Fun	\n        Iron Fist, Hawaii 50, Supergirl	2017-09-16	4	f
3332	Teach	    Lesson 39 - Project planning\n    grading and review of progress	2018-04-22	4	f
2184	Fun	\n        pack for trip\n        Amazing Race\n	2017-07-05	6	f
3333	Fun	    Madam Sec, Shield, ER	2018-04-22	2	f
2471	Business	\n        Tech Startup meeting in Denver	2017-09-20	6	f
2473	Grow	\n        4, 3, 3, 4\n        personal reflection\n        walk medicine\n        talk with Stacie and life	2017-09-21	4	f
2474	People	\n        meet with Josiah\n        date at Carrabbas	2017-09-21	3	f
2475	Teach	\n        build class website\n        write Ex 4-6\n        create Ex list\n        post exercises on Canvas	2017-09-21	6	f
2476	Fun	\n        Profit\n\n	2017-09-21	1	f
2477	Grow	\n        5, 3, 3, 2	2017-09-22	0	f
2478	Teach	\n        prepare for class\n        give Exam #1\n        grade exam\n        capture lessons from first month of teaching\n        teaching insights	2017-09-22	7	f
2479	Tools	\n        investigate Visual Studio Code\n        Python 3.6	2017-09-22	3	f
1566	People	\n        Shrinking World Celebration dinner at Melting Pot\n	2017-04-07	5	f
2480	Church	\n        meet with Todd and Jenny about money communication	2017-09-22	1	f
2481	Fun	\n        Days of Future Past\n	2017-09-22	3	f
2482	Grow	\n        4, 3, \n        outline: Living in the Present\n        outline: Emotional Management\n        outline: Quality of Sleep\n        outline: Life Stages\n        walk to library\n        setup and use Hoopla	2017-09-23	6	f
2483	People	\n        time with Stacie	2017-09-23	2	f
2759	Teach	\n        prepare #31\n            200 - write exam\n            350 - unit test, sessions, take home	2017-10-31	6	f
296	People	\n        lunch at El Cielo with Potters and Garcias\n        plan trip to Portland with Stacie	2016-04-03	5	f
3960	People	    carpet project\n    leave early to avoid carpet conflict\n    	2018-09-10	1	f
1309	Grow	\n        4, 1, 3, 2\n        reflection and personal planning and review	2017-02-01	1	f
3590	Grow	    5, 5, 3, 4\n    walk	2018-06-20	1	f
3588	People	    time with Stacie\n    discuss life issues with Stacie	2018-06-19	2	f
3318	Grow	    5, 2, 4, 4\n    ask for help on design review scoring\n    think about meaning (contribute, connect, understand)\n    walk to lunch at Pelican Jo's\n    organize info from Lynn	2018-04-19	4	f
3008	People	\n        Andrew and Rachel - timeline game	2018-01-31	4	f
3886	Tools	    	2018-08-25	0	f
3587	Fun	    Vikings, Wrinkle in Time	2018-06-19	3	f
3589	Church	    lunch with Todd at Rio\n    dramatic rain storm at Rio	2018-06-19	3	f
3884	Grow	    4, 2, 4, 2\n    weight: 208.2	2018-08-25	0	f
387	Business	\N	2016-04-28	3	f
3885	Teach	    create script for guide outline, create\n    investigate teaching SQL\n    build outline for 350 - Lesson 4\n    grade quizzes and assigments\n    	2018-08-25	5	f
3888	People	    Andrew & Rachel BBQ	2018-08-25	3	f
4038	Teach	    Lesson 16 - CSS Spacing, Build an app with MVC\n    	2018-09-28	8	f
3595	Church	    	2018-06-20	0	f
3593	Fun	    Supergirl, Dance, Profit, ER	2018-06-20	3	f
3348	People	    MCB Dinner Party	2018-04-26	3	f
3349	Church	    board meeting	2018-04-26	2	f
3350	Teach	    Lesson 41 - Workflow\n    class archive download file\n    MCB Faculty meeting	2018-04-26	5	f
3887	Fun	    Profit, ER, Fraiser\n    	2018-08-25	2	f
3594	People	    find out about Passport expiration	2018-06-20	1	f
3585	Grow	    3, 3, 5, 3\n    order eyeglasses	2018-06-19	0	f
3586	Teach	    work on teaching tools\n    install NetBeans & XAMPP unsuccessful\n    develop look and feel of Teaching website\n    write Charmayne about textbook\n    travel to UNC\n    sign up for BlueHost    	2018-06-19	6	f
3352	Grow	    5, 1, 3, 5\n    enjoy wonderful weather at UNC	2018-04-27	3	f
3351	Fun	    ER, Goldbergs	2018-04-26	2	f
2466	Grow	\n        4, 5, 4, 5\n        Dr. Kary\n        walk to library\n        think about life	2017-09-19	3	f
3591	Teach	    work out student hosting of PHP and HTML\n    use Bluehost account	2018-06-20	2	f
4103	Tools	    	2018-10-18	0	f
4106	Grow	    4, 3, 3, 3\n    weight: 207.8\n    bed at 8:30	2018-10-17	2	f
3959	Teach	    go to UNC early\n    archive grade book\n    rebuild grade weights to be more equitable\n    Testing\n    Jerone Jackson, Brittney Dinsmore\n    	2018-09-10	8	f
3347	Grow	    4, 1, 2, 3\n    interview for book Inevitable	2018-04-26	2	f
2468	Fun	\n        Ant Man\n        movies from library\n	2017-09-19	4	f
293	Grow	\n        Personal retreat\n        think about life goals and relationships\n        write notes\n            Life I Want\n            Band of Brothers	2016-04-02	3	f
2472	Fun	\n        Supergirl\n	2017-09-20	1	f
2469	Grow	\n        3, 4, 2, 4\n        nap	2017-09-20	2	f
2186	People	\n        4th of July party	2017-07-04	6	f
2467	Teach	\n        create schedule for 30 exercises\n        think through long-term strategy\n        start building MyBook/UNC\n        write Exercise 3	2017-09-19	7	f
2470	Teach	\n        prep for class\n        class #13\n        help students after class\n        work on list of exercises	2017-09-20	5	f
4101	Grow	    4, 3, 3, 2\n    think about stress and growth	2018-10-18	2	f
2187	Tools	\n        explore Safari Books Online and Amazon for tech books\n        cancel Safari Books Online\n        work on system architecture (thot/App_Design)	2017-07-05	4	f
4102	Teach	    create diagram of templates for 350  \n    create Complex page lesson in 350\n    add render functions to views.php  \n    	2018-10-18	7	f
4104	Fun	    Resident, Profit\n    	2018-10-18	3	f
2188	People	\n        drive to St George\n	2017-07-06	0	f
2485	Church	\n        church service\n        staff meeting	2017-10-01	7	f
2486	People	\n        Andrew and Rachel	2017-10-01	4	f
2771	People	\n        Rachel's graduation	2017-12-08	6	f
2189	Fun	\n        drive to St George\n	2017-07-06	14	f
2190	People	\n        drive to San Diego\n        visit with Moyers\n	2017-07-07	14	f
2191	Fun	\n        downtown San Diego\n        harbor cruise\n        USS Midway	2017-07-08	8	f
2192	People	\n        visit with Moyers\n	2017-07-08	6	f
2193	Church	\n        church with Bob & Deb	2017-07-09	2	f
2194	People	\n        lunch on Coranado\n        visit Deb's office\n        visit with Moyers	2017-07-09	6	f
2195	Write	\n        write booknotes on Integrity, Execution	2017-07-09	4	f
2196	Grow	\n        nap\n	2017-07-09	2	f
2772	Fun	\n        Defenders\n	2017-12-08	2	f
2773	Grow	\n        5, 4, 3, 3\n        think about goals and values\n        update journal\n        discuss life learning and direction with Stacie	2017-12-09	3	f
2774	Business	\n        research buying stock in innovative companies\n        sell S&P; buy BIDU, Camping World, GOOG, SHOP\n        research SuperNova fund	2017-12-09	2	f
2775	Church	\n        graduation party for Devlin	2017-12-09	3	f
2776	People	\n        graduation party for Rachel	2017-12-09	4	f
2777	Fun	\n        Crown\n	2017-12-09	2	f
2778	Grow	\n        4, 3, 4, 5\n        time with Stacie\n        nap	2017-12-10	3	f
2779	Church	\n        Carlos and Leslie over for lunch\n        talk on Joy	2017-12-10	7	f
2780	Fun	\n        Live Die Repeat\n	2017-12-10	4	f
2781	Grow	\n        5, 3, 3, 2\n        celebrate successes\n            MediShare enrollment\n            Grade submission\n            Motley Fool investment strategy\n        think about the future	2017-12-11	3	f
2782	Teach	\n        submit final grades\n        student interactions	2017-12-11	4	f
2783	Fun	\n        library\n        ER marathon\n        Supergirl	2017-12-11	4	f
2784	People	\n        get Christmas tree\n	2017-12-11	3	f
2785	Teach	\n        archive all BACS Student files\n        check on grade posting	2017-12-12	1	f
3045	Teach	\n        give exam\n        student caught cheating	2018-02-09	4	f
3046	Fun	\n        Americans, Vikings, Flash\n	2018-02-09	5	f
3353	People	    Dominoes, and Carcassonne	2018-04-27	3	f
3360	Church	    Joe & Katie Woodman\n    church service\n    picnic	2018-04-29	7	f
3359	Grow	    5, 2, 3, 2\n    nap	2018-04-29	2	f
3598	People	    trip to passport center\n    time with Stacie	2018-06-25	5	f
3354	Teach	    all day at UNC\n    last day of class	2018-04-27	7	f
2760	People	\n        Pelican Lakes w/Christine	2017-12-05	2	f
2761	Fun	\n        Arrow, Explore\n	2017-12-05	6	f
2762	Teach	\n        final in BACS 200\n        grade final\n        interact with students\n        calculate grades	2017-12-06	9	f
2763	Grow	\n        4, 4, 3, 1\n        talk with Stacie	2017-12-06	1	f
2764	Fun	\n        Arrow\n	2017-12-06	4	f
2765	Grow	\n        4, 4, 3, 2	2017-12-07	1	f
157	People	\n        Lunch at Noodles with Potters and Garcias	2016-02-21	2	f
2767	People	\n        discuss events with Stacie	2017-12-07	3	f
2768	Fun	\n        Legends, Arrow, Flash, Other Boleyn\n	2017-12-07	3	f
3009	Grow	\n        4, 3, 3, 2	2018-02-01	0	f
3036	Teach	\n        Lesson 12	2018-02-07	8	f
3037	People	\n        talk with Stacie about meeting with Karen	2018-02-07	1	f
3038	Fun	\n        Profit, Goldbergs\n\n	2018-02-07	4	f
3039	Grow	\n        5, 3, 3, 2\n        nts	2018-02-08	1	f
3040	Tools	\n        build custom views for Sensei\n        create Web Apps course outline\n        get Presenter to work with other courses\n        get ready for meeting with Lynn Mora	2018-02-08	9	f
3041	Fun	\n        This is Us, Legends, Vikings\n	2018-02-08	4	f
3042	Grow	\n        5, 3, 3, 2	2018-02-09	0	f
3043	People	\n        talk with Stacie about meeting with Karen\n        book travel to PyCon and Texas	2018-02-09	1	f
3363	Fun	    TV	2018-04-29	2	f
3362	People	    time with Stacie	2018-04-29	1	f
3361	Tools	    project plans	2018-04-29	2	f
3599	Grow	    4, 3, 3, 3	2018-06-23	0	f
3044	Tools	\n        move content to Sensei/content/course\n        pass through course to builder scripts	2018-02-09	4	f
3601	People	    brunch in Winter Park\n    scrabble and dominoes and solitaire\n    dinner at Fontnorov	2018-06-23	6	f
3600	Fun	    Blues from the Top\n    Kenny Wayne Shepherd\n    Southern Ave	2018-06-23	8	f
3358	Fun	    Matrix 2	2018-04-28	3	f
3357	People	    discuss summer desires\n    struggles with communication issues\n    visit Tom & John Bush\n    walk with Stacie\n    first grilling day	2018-04-28	5	f
3364	Grow	    3, 2,\n    allergy problems\n    nap\n    discuss Master's degree with Stacie	2018-04-30	4	f
3367	Fun	    Infinity War\n    Profit	2018-04-30	5	f
3365	Teach	    ideas for Mehrgan's senior project classes	2018-04-30	3	f
3366	Tools	    refactoring of MyBook app to create wiki app	2018-04-30	2	f
3355	Fun	    Resident	2018-04-27	1	f
2766	Teach	\n        meet with Dean Allison\n        give final exam in CS 350\n        grade final & calculate grades\n        start on BACS 200 course outline	2017-12-07	7	f
2769	Teach	\n        create syllabus for BACS 200\n        update course outline \n        think about teaching tools\n        process plan for Spring	2017-12-08	4	f
2770	Grow	\n        4, 5, 3, 4\n        nap\n        breakfast burritos	2017-12-08	2	f
2484	Grow	\n        4, 3, 4, 4	2017-10-01	0	f
3014	Grow	\n        5, 4, 3, 3\n        first visit to Looking Good barber shop	2018-02-02	2	f
3015	Teach	\n        Prep and teach lesson 11	2018-02-02	8	f
3016	Fun	\n        Amazing Race, ER\n	2018-02-02	4	f
3017	Grow	\n        5, 4, 3, 3\n        first visit to Looking Good barber shop	2018-02-03	2	f
2198	People	\n        Carolina's italian food	2017-07-10	2	f
2199	Grow	\n        nap\n	2017-07-10	2	f
2487	Fun	\n        Days of Future Past\n	2017-09-23	6	f
2488	Tools	\n        install Jupyter	2017-09-24	1	f
123	Grow	\n        Quiet time\n	2016-02-10	1	f
2489	Church	\n        church service\n        lunch at Rio with Beth Ball	2017-09-24	5	f
2490	People	\n        time with Stacie	2017-09-24	2	f
2491	Grow	\n        walk\n        nap\n        5, 4, 4, 4	2017-09-24	2	f
2492	Fun	\n        American Graffiti\n	2017-09-24	4	f
2493	Grow	\n        5, 5, 3, 3	2017-09-25	0	f
2495	People	\n        Bad Daddy with Stacie	2017-09-25	2	f
2496	Fun	\n        Dance\n	2017-09-25	1	f
2497	Grow	\n        5, 5, 4, 5	2017-09-26	1	f
2498	Teach	\n        grade exercises 2-5\n        review student progress	2017-09-26	4	f
2499	People	\n        Estes Park with Stacie and Christine	2017-09-26	6	f
2500	Fun	\n        Ben-Hur\n	2017-09-26	3	f
2501	Grow	\n        4, 5, 3, 3	2017-09-27	0	f
2502	Teach	\n        class prep\n        class #16\n        help students with exercises\n        class prep for #17\n        lunch at Alberto's\n        create automation scripts\n        grade exercises	2017-09-27	10	f
2503	Church	\n        church board meeting	2017-09-27	3	f
2504	Fun	\n        Dance\n	2017-09-27	1	f
2505	Grow	\n        3, 5, 3, 3\n        walk to library\n        think about sustainability	2017-09-28	2	f
2506	Teach	\n        build exercise 7 & 8\n        create CSS Property Templates\n            box\n            spacing\n            text\n            border\n            color\n        create CSS Sampler\n        create ideas for textbook and class server	2017-09-28	8	f
2507	Fun	\n        Dance, Alias\n	2017-09-28	4	f
2508	Grow	\n        3, 5, 3, 3	2017-09-29	0	f
2509	Teach	\n        request to teach 350\n        200: class #17\n        help students\n        meet with Mehrgan, Charmayne, Pat, Dean\n        agree to teach 350\n        MCB faculty meeting	2017-09-29	10	f
2510	People	\n        dinner Pueblo Villejo with Jackie & Julio	2017-09-29	2	f
2511	Fun	\n        Dance\n	2017-09-29	2	f
2512	Grow	\n        3, 3, 3, 3\n        nap\n        walk to library\n        think about career path and choices\n        write Flavors of Pain\n        read book on sleeping	2017-09-30	5	f
2513	Teach	\n        prioritize teaching time investment\n        write Embrace the Rhythm\n        UNC Teaching Schedule\n        Teaching 200 & 350	2017-09-30	5	f
3048	Teach	\n        grade exam	2018-02-10	4	f
3049	Write	\n        plan out investment teaching	2018-02-10	2	f
2786	Grow	\n        5, 4, 2, 5\n        update time\n        walk\n        nap	2017-12-12	3	f
2787	Tools	\n        build slide show using Reveal.JS\n        create text in HTML file\n        locate slide builder from 2013\n        experiment with different presentation tools	2017-12-12	3	f
2788	People	\n        decorate tree	2017-12-12	2	f
2789	Church	\n        host Christmas party	2017-12-12	4	f
2790	Fun	\n        Other Boleyn\n        	2017-12-12	1	f
2791	Grow	\n        3, 4, 3, 2	2017-12-13	0	f
2792	Tools	\n        solve issues with Markdown in slides\n        static server for slide shows\n        document creating slides	2017-12-13	4	f
2793	Fun	\n        visit library\n        read books at library during house cleaning\n        Crown, Arrow	2017-12-13	6	f
2794	People	\n        Rachel's class in Spring was canceled\n        visit with Rachel\n	2017-12-13	4	f
3025	People	\n        lunch\n        Super Bowl party	2018-02-04	7	f
3026	Fun	\n        tv\n	2018-02-04	0	f
3047	Grow	\n        5, 3, 4, 3	2018-02-10	1	f
3050	People	\n        Andrew lunch\n        discuss investments\n        watch Valor\n        play Carcassonne	2018-02-10	5	f
3051	Fun	\n        Knights Tale\n	2018-02-10	2	f
3052	Grow	\n        5, 3, 4, 3\n        Originals, Tribe of Mentors	2018-02-11	2	f
3053	Fun	\n        Victoria, Knights Tale, ER	2018-02-11	5	f
3011	Tools	\n        monthly rollover\n        update tools and tests on all systems	2018-02-01	4	f
3012	Write	\n        visit library\n        American Creation	2018-02-01	4	f
3013	Fun	\n        Victoria, Profit, Good Place\n	2018-02-01	4	f
3018	Business	\n        discover MTFC (Motely Fool 100 Index)\n        build investing portfolio	2018-02-03	2	f
3019	Write	\n        Seaman's Guide to Investing	2018-02-03	2	f
3020	People	\n        lunch at Hearth	2018-02-03	2	f
3021	Fun	\n        Vikings, Blade Running\n	2018-02-03	6	f
3022	Grow	\n        5, 3, 1, 3\n        disconnect alarm during night\n        time with Stacie	2018-02-04	2	f
3023	Tools	\n        clean up task history view	2018-02-04	1	f
3024	Church	\n        church service	2018-02-04	4	f
3597	Fun	    Rick Steves videos	2018-06-25	6	f
2795	Grow	\n        5, 4, 3, 2	2017-12-14	0	f
2796	Teach	\n        read evaluations\n        update syllabus for BACS 200	2017-12-14	2	f
2797	Tools	\n        create script for making slides\n        optimize slide maker	2017-12-14	3	f
2798	People	\n        Cassie & Sam\n        Palominos with Stacie\n        time with Stacie	2017-12-14	3	f
3612	Teach	    improve stylesheets used for class notes\n    create outline for first three lessons\n    build views around Learn,Plan,Build,Share	2018-06-22	7	f
3813	Grow	    5, 3, 1, 3\n    weight: 208.8	2018-08-11	0	f
3814	Teach	    find Syllabus files\n    	2018-08-11	2	f
2799	Fun	\n        ER, Turn, Librarians\n	2017-12-14	6	f
154	Grow	\n        personal growth\n        walk to park	2016-02-20	1	f
2800	Grow	\n        4, 4, 2, 2	2017-12-15	0	f
2801	Teach	\n        create Class Content Plan	2017-12-15	4	f
2802	Tools	\n        create Archive for UNC Documents	2017-12-15	2	f
2803	People	\n        Rachel at Lucky Fins\n        party at Faye Bell's	2017-12-15	3	f
2804	Fun	\n        return Other Boleyn CDs\n        Barnes & Nobel\n        Best Buy\n        Explore tools\n        Profit\n	2017-12-15	5	f
2805	Grow	\n        4, 3, 4, 1\n        nts	2017-12-16	4	f
2806	Tools	\n        upgrade PyCharm to 17.3.1\n        update OS on macbook (issue with password)	2017-12-16	2	f
2807	Fun	\n        finish Other Boleyn\n        Legends\n	2017-12-16	4	f
3602	Grow	    5, 3, 5, 2\n    emotional roller-coaster about WAM server rebuild\n    trouble going to sleep\n    too much work	2018-06-26	0	f
2514	Teach	\n        grading of assignments\n        planning of class 10/4	2017-10-01	2	f
2515	Tools	\n        update month for time tracking\n	2017-10-01	1	f
2516	Grow	\n        4, 4, 3, 5	2017-10-02	0	f
2200	Grow	\n        Slow Kingdom Coming\n        Emotional Journey	2017-07-11	2	f
2517	Teach	\n        200 class 18 (prep, meet, followup)\n        350 class 18 (prep, meet, followup)\n        meet with Dean to get class details\n        start with 350	2017-10-02	9	f
2518	Fun	\n        movies\n	2017-10-02	5	f
2201	Church	\n        Vineyard Conference\n        Geno Olison\n        Chris Wright\n        discuss conference with team\n	2017-07-11	12	f
2519	Grow	\n        3, 4, 3, 3\n        night work: lessons for 350	2017-10-03	0	f
2520	Teach	\n        prep for 350 - outline of all lessons\n        build lecture for 350: Software Process\n        create master plan for course\n        prep for 200 - testing exercise, page quiz example	2017-10-03	9	f
2521	Fun	\n        comics, Castle\n	2017-10-03	5	f
2522	Grow	\n        3, 5, 3, 5\n        sleep disturbed by phone call from Dr Harris	2017-10-04	1	f
2523	Teach	\n        200 class 19 (prep, meet, follow up)\n        350 class 19 (prep, meet, follow up)\n        prep for meeting Dean\n        meet with Dean discuss admin	2017-10-04	8	f
2524	Fun	\n        movies\n	2017-10-04	5	f
2525	Grow	\n        4, 5, 3, 4\n        walk to library\n        nap	2017-10-05	2	f
2526	Teach	\n        outline for Project Plan\n        exercise for Project Plan\n        outline for Technology Plan\n        exercise for Technology Plan\n        200 - Usability exercise, create page quiz	2017-10-05	8	f
2527	People	\n        talk with Christine\n        pizza with Christine	2017-10-05	1	f
2528	Fun	\n        Dark Matter, Lion\n	2017-10-05	3	f
3368	Grow	    3, 3,	2018-05-01	0	f
3607	Church	    	2018-06-26	0	f
3605	Fun	    Vikings	2018-06-26	2	f
3903	Fun	    Anthony Bordain, ER, Fraiser\n    	2018-08-28	4	f
3904	People	    lunch at Sand Bar with Christine, Rachel	2018-08-28	2	f
3815	Tools	    	2018-08-11	0	f
3610	People	    travel home\n    breakfast \n    dinner together	2018-06-24	6	f
3606	People	    Andrew & Rachel - made dinner\n    argue with Stacie about WAM	2018-06-26	2	f
3900	Grow	    3, 3, 3, 3\n    weight: 207.4\n    thinking at night (tips and tricks for 200)	2018-08-28	0	f
3027	Grow	\n        4, 1, 4, 3 	2018-02-05	0	f
3054	Church	\n        church	2018-02-11	4	f
3055	People	\n        time with Stacie\n        lunch at Fat Alberts with Rachel\n	2018-02-11	3	f
3056	Grow	\n        5, 3, 3, 3	2018-02-12	0	f
3613	People	    drive to Winter Park\n    listen to Americans in Paris\n    eat at Aztec\n    pack for trip	2018-06-22	6	f
3901	Teach	    build Tips & Tricks page\n    document top 16 tips\n    Quiz 1 - grades\n    Announcement for OneDrive\n    Announcement for Quiz retake\n    Lesson 5 prep\n    learn about PHP forms\n    email about Adjunct Qualifications\n    	2018-08-28	8	f
3611	Grow	    5, 4, 3, 4\n    walk	2018-06-22	1	f
3617	People	    meet with Josiah\n    Andrew & Rachel - movie & Parry's Pizza	2018-06-21	3	f
3902	Tools	    	2018-08-28	0	f
3614	Grow	    4, 4, 4, 5\n    walk 10000 steps\n    pick up prescriptions	2018-06-21	2	f
3816	Fun	    Red\n    	2018-08-11	2	f
3608	Grow	    3, 3, 3, 3\n    restless sleep in Winter part\n    read about SCARF	2018-06-24	2	f
3603	Teach	    	2018-06-26	0	f
3817	People	    inflate Unicorn\n    mount Unicorn at lake\n    Andrew & Rachel visit	2018-08-11	10	f
4055	Church	    Vineyard Mission Conference stream	2018-10-03	3	f
3604	Tools	    	2018-06-26	0	f
4108	Fun	    Madam Sec, Good Place\n    	2018-10-17	3	f
4105	People	    Palominos	2018-10-18	2	f
4053	Grow	    4, 3, 2, 5\n    weight: 207.4	2018-10-03	0	f
4109	People	    dinner with Stacie	2018-10-17	1	f
4131	Teach	    create Music Manager exam\n    optimize template structure for 350\n    grade project designs and reviews\n    	2018-10-23	4	f
3616	Fun	    movie: Ocean's 8\n    Dance	2018-06-21	5	f
3818	Grow	    3, 2, 3, 2\n    weight: 208.2\n    10% Happiness\n    awake from 4-6; sleep till 9	2018-08-10	1	f
3609	Fun	    listen to Americans in Paris\n    Blues from the Top	2018-06-24	6	f
4258	Fun	    TV	2018-02-20	5	f
4130	Grow	    5, 3, 3, 2\n    weight: 207.4\n    prepare for personal retreat\n    plan Life Journey Notebook	2018-10-23	2	f
4452	Grow	    5, 1, 2, 4\n    not feeling good in evening\n    constant back pain	2018-12-31	2	f
4453	Fun	    walk on beach\n    GoT\n    watch New Years Eve TV\n    	2018-12-31	4	f
4454	People	    New Years Eve (party and TV)\n    Greek Town Taverna for late lunch\n    time with Stacie	2018-12-31	8	f
2529	Grow	\n        4, 5, 4, 5	2017-10-06	0	f
2531	Fun	\n        Ultron\n        Iron Fist\n	2017-10-06	6	f
2532	Grow	\n        4, 5, 4, 5	2017-10-07	0	f
2533	Teach	\n        prep Technology lecture 10/9\n        investigate Jupyter \n        200: Grade quiz (contact students with missing quiz)\n        350: outline Tech lectures (21, 22, 23), WordPress lite Project Plan \n        grading in 350 	2017-10-07	6	f
2202	Church	\n        Vineyard Conference\n        meet with Langham project director\n        Rachel Conner\n        Chris Wright\n        Allen Hodges\n        party at house\n\n	2017-07-12	14	f
2203	Church	\n        Vineyard Conference\n        meet with Langham project director\n	2017-07-13	14	f
2204	Fun	\n        drive to Flagstaff	2017-07-14	7	f
2205	People	\n        high school reunion	2017-07-14	5	f
2206	Church	\n        Slow Kingdom Coming\n        process conference learnings\n	2017-07-14	2	f
2207	People	\n        high school reunion picnic\n        connect with Don, Diane, Birdie, Betty, Ed\n        discuss connections with Stacie\n        Greg & Kate	2017-07-15	13	f
2534	People	\n        discuss Slovenia with Stacie\n        bike hoist project\n        grocery store\n        dinner - Christine job difficulties	2017-10-07	6	f
2536	Grow	\n        4, 5, 4, 4\n        nap	2017-10-08	1	f
2537	Teach	\n        200: prep 10/09, ex 11 - Project Plan\n        350\n            type Tech lectures (21, 22, 23)\n            type WordPress lite Project Plan \n            outline 10/09 - Learning\n            Word Press project plan\n            grade exam	2017-10-08	6	f
2538	Church	\n        church server\n        lunch at Nepal with John and Sue Marsden	2017-10-08	6	f
2539	Fun	\n        TV\n	2017-10-08	1	f
2540	Grow	\n        4, 5, 4, 5	2017-10-09	0	f
2208	Grow	\n        nap\n	2017-07-15	1	f
2209	People	\n        Stacie's birthday\n        Famous Pizza\n        Creakside Coffee\n        visit with Mandy's family	2017-07-16	6	f
2210	Grow	\n        process experiences of interacting with people\n        overcoming communication challenges	2017-07-16	2	f
2211	Fun	\n        Celtic Festival\n        Spider Man\n	2017-07-16	6	f
2212	People	\n        time with Stacie\n        Cafe Jose	2017-07-17	4	f
2213	Tools	\n        prepare for meeting with Josiah\n        collaborate with Josiah\n        follow up	2017-07-17	4	f
2214	Fun	\n        Tusmego\n        Sudoku\n        Gavin Stone\n        relax in Sedona\n        swimming\n	2017-07-17	6	f
2541	Teach	\n        200\n        class 21 - 10/09 - ex 11 - Project Plan\n        work with Evelyn Cruz\n        350\n        prep 21 - 10/09 - Learning - World Press\n        class 21 - 10/09 - Learning\n        350 name tags\n        Type in notes from brainstorm\n        Tools & Admin\n        Email\n        email Jim Reardon\n        shirt at bookstore\n        research teaching in Slovenia\n        contact Mehran to discuss Lithuania\n        request transcript from NAU	2017-10-09	8	f
2542	People	\n        discuss Slovenia and teaching with Stacie	2017-10-09	2	f
2543	Fun	\n        This is Us, Enterprise\n	2017-10-09	4	f
2544	Grow	\n        5, 4, 4, 4	2017-10-10	0	f
2545	Teach	\n        prep #22	2017-10-10	10	f
2546	Fun	\n        Enterprise\n	2017-10-10	4	f
2547	Grow	\n        3, 5, 3, 5	2017-10-11	0	f
2548	Teach	\n        class #22	2017-10-11	8	f
2549	People	\n        Durama with Stacie\n        Pelican Lakes with Stacie	2017-10-11	2	f
2535	Fun	\n        This is Us\n        Discuss Slovenia with Stacie (watch video)\n	2017-10-07	2	f
2550	Fun	\n        Wonder Woman, Arrow\n	2017-10-11	4	f
2551	Grow	\n        5, 4, 5, 4	2017-10-12	0	f
2810	Tools	\n        build archive for UNC-2017, BACS_200, CS350\n        adapt to new UNC repo\n        build tests for archive, unc	2017-12-17	2	f
2552	Teach	\n        prep #23	2017-10-12	8	f
2560	People	\n        Swain's birthday party\n        lunch with Jesse at Hearth	2017-10-14	3	f
2553	People	\n        time with Stacie	2017-10-12	2	f
2554	Fun	\n        This is Us, Supergirl\n	2017-10-12	4	f
2555	Grow	\n        5, 5, 4, 4	2017-10-13	0	f
2556	People	\n        dinner with Stacie	2017-10-13	2	f
2557	Teach	\n        class #23	2017-10-13	8	f
2558	Fun	\n        Castle\n	2017-10-13	4	f
2559	Grow	\n        midnight sleep attempt\n        4, 4	2017-10-14	1	f
2811	Church	\n        take out Gardeners	2017-12-17	4	f
2812	People	\n        Mandy and JD\n	2017-12-17	7	f
2808	People	\n        Andrew and Rachel drop presents off\n        awkward interaction (stress of Rachel's job)\n        Stacie and Rachel attend women's brunch\n        time with Stacie	2017-12-16	4	f
3105	Teach	\n        grade ex 17	2018-02-24	5	f
3029	Fun	\n        Vikings, This is Us, Sheild\n	2018-02-05	3	f
3106	Fun	\n        Amazing Race\n        Parts Unknown\n        Two Weeks Notice	2018-02-24	5	f
3107	Grow	\n        5, 5, 5, 4\n        walk to park\n        nts	2018-02-25	3	f
3108	Teach	\n        grade quiz 6\n        grade blog 1\n        generate new list of students\n        review grades\n        create design review groups	2018-02-25	6	f
3109	Fun	\n        Count of Monte Cristo, Mummy\n	2018-02-25	5	f
3619	Teach	    	2018-06-27	0	f
3618	Grow	    3, 5, 3, 5\n    10,000 steps	2018-06-27	2	f
2561	Fun	\n        Good Place, Alias	2017-10-14	3	f
2562	Teach	\n        grade 200 exercises\n        outline Architecture\n	2017-10-14	7	f
3110	Grow	\n        5, 5, 4, 3	2018-02-26	0	f
3111	Teach	\n        prep and teach Lesson 19\n        sign up for meal ticket	2018-02-26	9	f
3113	Fun	\n        Victoria\n	2018-02-26	1	f
2809	Grow	\n        3, 3, 2, 2\n        worry about Rachel	2017-12-17	1	f
2572	Church	\n        Justice initiative - Rachel\n        great worship	2017-10-22	6	f
2573	Teach	\n        grading (Israel)	2017-10-22	6	f
2575	Grow	\n        4,4,5,2\n	2017-10-22	0	f
3073	Grow	\n        4, 3, 3, 3	2018-02-16	0	f
3075	Fun	\n        Legends	2018-02-16	2	f
3076	People	\n        Stacie visits office and helps decorate\n        dinner at Fontas\n        Mod Pizza with Rachel, Andrew, Stacie\n	2018-02-16	3	f
3030	Grow	\n        5, 3, 3, 2\n        nts	2018-02-06	4	f
3032	Business	\n        investments buy order for TMFC	2018-02-06	2	f
3033	Church	\n        home group	2018-02-06	3	f
3034	Fun	\n        Flash\n	2018-02-06	1	f
3035	Grow	\n        5, 3, 3, 2\n        nts	2018-02-07	1	f
3057	Teach	\n        teach Lesson 14	2018-02-12	5	f
3058	People	\n        discuss Originals	2018-02-12	1	f
3070	Tools	\n        organize project notes and plans\n        work on Sensei Course for Software Practices	2018-02-15	6	f
3061	Grow	\n        4, 3, 3, 3\n        nts	2018-02-13	1	f
3062	Teach	\n        build templates for CSS (font, color, space, border)\n        grade ex14	2018-02-13	7	f
3063	People	\n        Pelican & Lakes & cherry pie\n        Josiah (discuss tech)	2018-02-13	4	f
3114	Grow	\n        3, 4, 3, 2\n        nts	2018-02-27	3	f
3621	Fun	    Profit, ER, Dragonfly	2018-06-27	5	f
3620	WAM	    Digital Ocean new Droplet from WAM-2.2 Snapshot (with SSH key)\n    Hostname  WAM-2.2 (change from wam-2.2)\n    Park w2wweld.org\n    nslookup w2wweld.org\n    ssh django@w2wweld.org\n    modify db.py for hostname\n    data migrate\n    tst (approve all)\n    fix all tests\n    configure web servers\n    debug page loading 	2018-06-27	5	f
3763	Teach	    add JS content to agenda for BASS 350\n    go to UNC\n    get keys for new office\n    lunch at Chiba Hut	2018-07-31	8	f
3760	Fun	    Black\n    Trip log - day by day	2018-08-01	2	f
3764	Fun	    You Tube with Stacie\n    Black	2018-07-31	2	f
3761	People	    visit with Cassie	2018-08-01	2	f
3622	People	    talk with Stacie	2018-06-27	2	f
3623	Church	    	2018-06-27	0	f
2563	Church	\n        Hunger initiative - Jenny\n        Rick Lehman\n        Swains at Rio	2017-10-15	6	f
3067	People	\n        discuss live issues with Stacie	2018-02-14	1	f
2564	People	\n        Stacie	2017-10-15	2	f
3064	Fun	\n        Enterprise\n	2018-02-13	2	f
3065	Grow	\n        3, 3, 3, 3	2018-02-14	0	f
3066	Teach	\n        develop future lesson topics\n        plan out student projects blog project\n        Lesson 15 - Color\n        develop agenda for remaining lessons	2018-02-14	9	f
3762	Grow	    5, 3, 3, 5\n    weight: 207.8	2018-07-31	0	f
3068	Fun	\n        Profit\n	2018-02-14	4	f
3069	Grow	\n        4, 3, 3, 3\n        Originals	2018-02-15	1	f
2215	Tools	\n        design work for BioHammer\n        create thot doc for BioHammer	2017-07-18	4	f
2565	Grow	\n        5,5,4,3\n        nap, reflect	2017-10-15	2	f
2566	Fun	\n        Poldark\n        Gifted  \n	2017-10-15	4	f
2567	Teach	\n        350 #24 Arch (prep, class, grade)\n        200 #24 Tables (prep, ex, class, grade)\n        Dean Allison	2017-10-16	9	f
2574	Fun	\n        Circle, DS9	2017-10-22	2	f
2813	Grow	\n        5, 2, 3, 1\n        nts	2017-12-18	3	f
2814	Tools	\n        clean up archive file\n        build tests for archive (files, dirs, contents)\n        create plan for doc management	2017-12-18	2	f
3071	Fun	\n        Star Trek Next Gen	2018-02-15	2	f
3072	People	\n        Valentines Day\n        time with Stacie\n        Chop House\n	2018-02-15	5	f
2568	Grow	\n        4,5,3,5	2017-10-16	0	f
2569	Fun	\n        Arrow, Flash\n        library Other Boleyn\n	2017-10-16	5	f
2570	Teach	\n        experiment with Jupyter and IDLE for coding exercise\n        build file formatters for exercise	2017-10-21	10	f
2571	Fun	\n        Americans, Castle, Supergirl, Flash\n	2017-10-21	4	f
3031	Tools	\n        create task history views for activity\n        rewrite ops code scripts\n        simplify deployment	2018-02-06	4	f
3074	Teach	\n        create class schedule\n        Lesson 16 - Border & Spacing\n        prep Lesson 17	2018-02-16	9	f
3059	Fun	\n        Profit, Supergirl	2018-02-12	5	f
2815	People	\n        Mandy & JD visit\n        celebrate Christine passing test at Palominos	2017-12-18	4	f
2216	Fun	\n        giant rain storm with lightning\n        swim\n        Niki Heat	2017-07-18	4	f
2217	People	\n        Harry's Hideaway\n        walk around Poco Diablo\n        discussed business with Stacie\n        meet with Josiah\n	2017-07-18	6	f
256	Grow	\n        Nap\n	2016-03-20	2	f
2218	People	\n        visit Whiting Archives\n        meet Peter Runge\n        discuss possible futures\n        lunch at Taverna	2017-07-19	10	f
3060	Business	\n        SWS Partenership Meeting\n    	2018-02-12	3	f
3765	Business	    battery died in car	2018-07-31	2	f
3077	Grow	    4, 3, 3, 2\n    nightly prayer\n    aspire and review	2018-02-17	2	f
2583	People	\n        Josiah, Palominos	2017-10-19	3	f
2584	Grow	\n        walk\n        5,5,2,3	2017-10-19	1	f
2585	Fun	\n        Madam Sec, Fraiser\n	2017-10-19	2	f
2586	Teach	\n        350 #26\n        200 #26	2017-10-20	8	f
2587	Grow	\n        5,5,4,5\n        discuss spiritual growth and ministry with Stacie	2017-10-20	2	f
2604	Teach	\n        Classes #29\n        Pat Seaton feedback\n        Commit to teach BACS200 in Spring	2017-10-27	8	f
2605	People	\n        Stacie\n        Andrew & Rachel	2017-10-27	4	f
2606	Fun	\n        Supergirl, DS9	2017-10-27	2	f
2607	Grow	\n        4,5,3,5\n	2017-10-27	0	f
2608	Teach	\n        350 grade exam\n        email about cheating	2017-10-28	6	f
2609	Fun	\n        Edge of Eternity, Americans, This is Us	2017-10-28	6	f
2817	Fun	\n        Goldbergs, Madam Sec\n	2017-12-18	3	f
2818	Grow	\n        4, 3, 3, 2	2017-12-19	0	f
2589	Teach	\n        200 Confront Israel\n        350 Meet with Seth & Jose\n        Turn down PM class\n        Candidate for PM	2017-10-23	8	f
3820	Fun	    finish Black start Red\n    nts 2	2018-08-10	3	f
2821	People	\n        Christmas shopping\n	2017-12-19	2	f
3081	Grow	\n        5, 3, 2, 3\n        Fully Charged\n        walk\n        nap\n        personal planning	2018-02-18	4	f
3082	Church	\n        Beilmans at White Out\n	2018-02-18	4	f
3905	Grow	    4, 3, 3, 3\n    awake at night\n    think about credentials email from Anne and future at UNC	2018-08-29	0	f
3375	Fun	    Turn, Enterprise, Blue Planet	2018-05-02	4	f
3906	Teach	    teach Lesson 5 \n    technical problems with Bluehost File Manager\n    slides for Form posting\n    forgot Canvas links\n    get Bluehost working at UNC (login)\n    	2018-08-29	8	f
3379	Fun	    Matrix III	2018-05-03	3	f
2824	Tools	\n        build website generator in MyBook app\n        build lesson generator in MyBook app\n        create production lesson planning system\n        test and deploy slides and website	2017-12-20	8	f
2610	Grow	\n        walk to library\n        4,4,2,4\n	2017-10-28	2	f
2611	Church	\n        community Sunday	2017-10-29	6	f
3370	People	    clean up house for Thornes\n    Thornes visit	2018-05-01	6	f
3376	Grow	    3, 2, 3, 2\n    haircut\n    talk with Stacie	2018-05-03	2	f
3378	People	    dinner with Stacie	2018-05-03	1	f
3373	Teach	    communicate with students\n    contact Charmayne\n    learn about PHP\n    outline of PHP textbook	2018-05-02	3	f
3374	People	    Ray & Billie Thorne\n    Egg & I	2018-05-02	7	f
2819	Teach	\n        create class website\n        start on markdown formatter\n        start on lesson content	2017-12-19	3	f
2822	Grow	\n        5, 3, 4, 2	2017-12-20	0	f
2825	People	\n        Stacie meets with Karen\n        Discuss life choices	2017-12-20	2	f
2820	Fun	\n        Star Wars 5\n        Shield, Crown, Enterprise	2017-12-19	9	f
3766	People	    time with Stacie\n    Visit with Cassie & Rachel	2018-07-31	2	f
2588	Fun	\n        TV\n	2017-10-20	4	f
2616	People	\n        Pannera's with Smiths	2017-10-30	2	f
3078	Tools	    include chapters in Sensei course\n    start on building chapter heading extractor\n    plan management of textbook in Sensei	2018-02-17	5	f
3079	Fun	    Vikings\n    nts	2018-02-17	3	f
3080	People	    game night with Fleebees	2018-02-17	4	f
2612	Grow	\n        discuss spiritual growth with Stacie\n        time off from UNC work\n        5, 3, 2, 2	2017-10-29	2	f
2613	Fun	\n        Gravity\n	2017-10-29	4	f
2614	Teach	\n        plan out CS350 schedule of topics\n        teach classes #30	2017-10-30	10	f
2615	Grow	\n        5, 3, 1, 4	2017-10-30	0	f
3010	Business	\n        buy NVDA stock\n        build Disrupters Dashboard\n        set goals for asset allocation	2018-02-01	2	f
2816	Teach	\n        build new BACS_200_2018 repo\n        start building website for class	2017-12-18	2	f
3097	Write	\n        work on paperback publishing of Leverage	2018-02-22	8	f
3098	Church	\n        church board meeting	2018-02-22	4	f
435	Fun	\n        Madam Sec, Flash\n	2016-05-12	2	f
3100	Grow	\n        5, 3, 4, 3	2018-02-23	0	f
3101	Teach	\n        Michael Pelosi interview (lecture, lunch, writeup)\n        Lesson 18 - Main Menu	2018-02-23	11	f
3102	Fun	\n        Amazing Race, Man on a Ledge\n    	2018-02-23	3	f
3103	Grow	\n        4, 4, 4, 4\n        reflect and review	2018-02-24	2	f
3104	People	\n        talk with Stacie\n        time with Stacie\n	2018-02-24	2	f
3115	Teach	\n        grade ex 19\n        grade blog\n        fix quiz grade in Canvas\n        contact failing students	2018-02-27	5	f
3116	Business	\n        sort papers\n        FCIP - prototyping	2018-02-27	4	f
3117	Fun	\n        Supergirl\n	2018-02-27	2	f
2826	Fun	\n        Finish Edge of Eternity\n        ER, Voyager, Frasier\n	2017-12-20	4	f
2827	Grow	\n        4, 4, 2, 4	2017-12-21	0	f
2831	People	\n        Josiah & Sam arrive	2017-12-21	4	f
2830	Tools	\n        create script to generate\n        improve CSS\n        find logo images for UNC website\n        build general slide presenter for Markdown	2017-12-21	1	f
2828	Business	\n        Invest in EDIT, TSLA, MULE\n        Review investing strategy	2017-12-21	2	f
3118	Grow	\n        3, 3, 3, 3\n        feeling sick	2018-02-28	2	f
1080	Church	\N	2016-11-20	4	f
3386	People	    Big Fat Pastor\n    audiobook - Sufferage	2018-05-05	3	f
3626	Grow	    5, 5, 2, 2	2018-06-28	0	f
3148	Grow	\n        4, 4, 3, 4	2018-03-07	0	f
3151	Grow	\n        4, 3, 3, 2	2018-03-08	0	f
3392	Grow	    too much spicy food\n    nap\n    discuss my insecurities with Stacie\n    2, 3, 5, 2	2018-05-07	3	f
3627	Teach	    improve CSS and views for Seaman's Guides	2018-06-28	2	f
3393	Teach	    develop BACS 350 topic schedule week by week\n    create lesson plan for first four weeks	2018-05-07	2	f
3394	Tools	    design data models for Sensei\n    update Sensei UX\n    implement Task Export to files	2018-05-07	4	f
3387	Fun	    Andrew & Rachel\n    Pitch Perfect\n    discuss Mary Wilson & Women to Women	2018-05-05	3	f
3630	Church	    prepare for board meeting\n    meet with board\n    last board meeting\n    adopt healthcare benefits plan	2018-06-28	5	f
3083	Fun	\n        Black Panther	2018-02-18	4	f
3084	People	\n        El Cielo	2018-02-18	2	f
3085	Grow	\n        5, 2, 2, 3\n        Notes for Fully Charged\n        process ideas about personal growth	2018-02-19	5	f
3086	Church	\n        think through White Out expenses	2018-02-19	1	f
3087	Fun	\n        library\n        Parts Unknown	2018-02-19	4	f
2829	Teach	\n        Class - build first week content (Lectures, Ex, Web)\n        UNC Email	2017-12-21	0	f
3088	Tools	\n        build book viewer\n	2018-02-19	4	f
3395	Fun	    Dragonfly\n    Madam Sec, Profit, Legends	2018-05-07	5	f
3384	Grow	    5, 4, 2, 3\n    sleep in\n    discuss female leadership with Stacie	2018-05-05	2	f
3380	Grow	    5, 3, 3, 3	2018-05-04	0	f
3821	People	    dinner with Mehrgan & Josiah\n    Bryan comes to Ft Collins	2018-08-10	4	f
3388	Grow	    4, 2, 1, 4\n    nap	2018-05-06	1	f
3099	Fun	\n        Profit, Amazing Race\n        	2018-02-22	2	f
3389	Church	    church service	2018-05-06	4	f
3385	Teach	    submit final grades for BACS 200\n    MCB graduation reception\n    archive student results	2018-05-05	6	f
3383	Fun	    Legends, Death Cure	2018-05-04	3	f
3391	Fun	    Avengers (2nd view)\n    work with Kindle on Comics	2018-05-06	5	f
3596	Grow	    3, 3, 3, 5\n    restless night\n    thinking about emotional threat response and SCARF\n    nap\n    long walk	2018-06-25	3	f
3629	People	    meet Burkes at Palominos	2018-06-28	2	f
3382	People	    celebration at Palominos\n    talk with Stacie	2018-05-04	3	f
3628	Fun	    visit library\n    Jurassic World	2018-06-28	5	f
3822	Business	    cancel Host Gator account\n    clean house\n    grout sealer	2018-08-10	1	f
3089	Grow	    4, 2, 3, 2	2018-02-20	0	f
2618	People	\n        Stacie Sol de Jalisco	2017-10-29	2	f
2619	Church	\n        Pannera's with Smiths	2017-10-30	2	f
3093	People	\n        discuss investments for kids	2018-02-21	2	f
3094	Fun	\n        Amazing Race, Next Gen, Vikings	2018-02-21	5	f
3095	Teach	\n        Lesson 17 - Page Layout\n        prep for lesson 17\n        build course work on Sensei\n        create notes on hiring\n	2018-02-21	7	f
3092	Grow	\n        3, 2, 3, 3	2018-02-21	0	f
3096	Grow	\n        5, 2, 3, 1	2018-02-22	0	f
3150	Church	\n        lunch with Todd at UC\n        home group at Swain's\n    	2018-03-07	4	f
2620	Grow	\n        3, 1, 4, 3\n        reflect and plan	2017-10-31	2	f
2621	People	\n        Trick or Treat\n        fondue	2017-10-31	1	f
2622	Fun	\n        Allied	2017-10-31	5	f
3149	Teach	\n        Lesson 23 - Bootstrap UI	2018-03-07	10	f
3090	People	    think about investments for kids	2018-02-20	1	f
3091	Teach	    meet with interview candidate Vaibhav Anu\n    lunch with interview team	2018-02-20	8	f
2841	People	\n        Rudys with Josiah clan\n	2017-12-24	4	f
3390	People	    time with Stacie\n    lunch at Tres Marg	2018-05-06	4	f
3356	Grow	    3, 2, 3, 4\n    household, work, and travel projects\n    plans and goals for summer\n    time budget\n    book quotes\n    life values and plans\n    nap & sleepless night\n    think through conflicts over control	2018-04-28	6	f
3625	Grow	    5, 3, 3, 5\n    walk\n    organize office\n    organize brain notes\n    barBQ left-over nachos	2018-06-29	5	f
3120	People	\n        lunch with Stacie and Tobey Kendall	2018-02-28	2	f
3729	Fun	    Travel Log: Day 11 - Wertheim\n        Sleep in\n        Breakfast Valerie and Brenda\n        Arrive in Wertheim at 6am\n        Walking tour of Wertheim\n            Jewish plaques\n            Medieval Jews in Wertheim\n            Nazi purge\n            Buy belts and backpacks\n            Choo-choo to castle\n            Climb castle walls\n        Lecture on Jews in Germany\n        Kareoke\n        Time with Stacie\n        9,500 steps	2018-07-18	7	f
3912	Fun	    ER, Fraiser\n    	2018-08-30	4	f
3631	WAM	    register w2wweld.org for SSL Certificate\n    test SSL using SSLLabs website\n    attempt to fix incorrect hostnames\n    fix bug with user login	2018-06-29	3	f
3632	People	    help Stacie with Google SEO	2018-06-29	0	f
3909	Grow	    5, 3, 5, 5\n    long walk (8000 steps)\n    10,000 steps	2018-08-30	2	f
3753	Fun	    Travel Log: Day 6 - Regensburg\n    First night on ship\n    Breakfast buffet\n    Walking tour \n    Medieval skyscrapers\n    Charming small town\n    Regensburg history:\n    Early roman military camp\n    1200-1500 tall building constructed to demostrate wealth and power\n    Economic setbacks in 1600s\n    Rediscovery in 1800s\n    Beer Garden - Monks and Lent - Ready for harvest\n    Stacie injured toe\n    Gothic church with pipe organ\n    Bookstore\n    Welcome reception with ship's crew\n    Dinner on ship - Keith & Elena\n    Watch breakdown of observation deck for low bridges\n    6,500 steps	2018-07-13	7	f
3823	Grow	    5, 2, 3, 5\n    weight: 208.8\n    	2018-08-12	0	f
3824	Fun	    Red	2018-08-12	1	f
3825	People	    Cazadore's with Josiah & Cassie\n    lake day with Unicorn and swimming\n    Andrew & Rachel\n    Nick Vujicic - Overcoming Hopelessness	2018-08-12	9	f
3377	Teach	    write Chris Vegter about PHP server\n    Robert Carver in BACS 350 override\n    decide on Leverage Book Promotion\n    write letter to book recipients\n    weekly schedule for BACS 350\n    setup email signature for Outlook 360\n    create list of apps for PHP class\n    create sample schedule for PHP class	2018-05-03	8	f
3911	Tools	    	2018-08-30	0	f
3913	People	    	2018-08-30	0	f
3826	Church	    Becky Olmstead\n    Josiah & Cassie	2018-08-12	4	f
3369	Tools	    develop and debug wiki tool\n    begin document wiki project	2018-05-01	4	f
3396	Grow	    pack for trip\n    prepare for conference\n    5, 5, 	2018-05-08	4	f
3154	People	\n        meet with Lynn Mora\n    	2018-03-08	2	f
3372	Grow	    2, 3, 3, 2\n    restless night out of our bed	2018-05-02	0	f
3819	Teach	    create special template views (show both HTML and PHP code)\n    build first few demos on website\n    PHP directory listing\n    create variable injection in PHP\n    	2018-08-10	5	f
2832	Church	\n        improve church dashboard	2017-12-21	3	f
2837	Grow	\n        5, 3, 3, 2\n        read Tribe of Mentors\n        talk with Stacie about relationships\n        Lessons from 2017	2017-12-23	6	f
2839	Grow	\n        4, 3, 3, 4\n        nap\n        read 10% Happiness, Well Being, Tribe of Mentors	2017-12-24	6	f
2840	Church	\n        Christmas Eve church service\n        low tire pressure	2017-12-24	4	f
2838	People	\n        discuss Shrinking World Investment Fund with Josiah\n        visit Garcias\n        visit library\n	2017-12-23	8	f
2623	Grow	\n        write about grace and emotional health\n        4, 4, 4, 5	2017-11-01	1	f
2836	Fun	\n        Black Widow\n	2017-12-22	2	f
3152	Teach	\n        grade ex23\n        grade blog #2\n        corrupted gradebook while bringing in exam	2018-03-08	6	f
2626	Fun	\n        Flash, This is Us\n	2017-11-01	2	f
3119	Teach	\n        Lesson 20 - Design Review\n        broken merge for slides show	2018-02-28	10	f
3907	Fun	    ER, Fraiser, Dance\n    	2018-08-29	4	f
2833	Fun	\n        Americans\n	2017-12-21	4	f
2624	People	\n        discuss grace with Stace\n        time with Stacie	2017-11-01	2	f
3910	Teach	    Announcement Drop Deadline\n    lessons - 350/200  6-10\n    grade 200 05\n    outline 200 06\n    CRUD in PHP\n    URL Quiz for 200\n    	2018-08-30	8	f
2625	Teach	\n        200\n            gave exam\n            grade exam & decide on quiz for URL\n        350\n            make up exam\n            unit test exercise and lecture	2017-11-01	9	f
3908	People	    Rudy BBQ take out\n    discuss UNC with Stacie	2018-08-29	2	f
3153	Tools	\n        refactoring plans for MyBook\n        improve high level user flow for Sensei	2018-03-08	6	f
2627	Grow	\n        reflection\n        track time\n        4, 5, 3, 2	2017-11-02	2	f
2834	Grow	\n        2, 2, 3, 2\n        Cassie wakes up at 2:00	2017-12-22	2	f
2835	People	\n        work puzzle\n        play Carcassonne\n        discuss teaching tools with Josiah\n        Rachel and Andrew come over in evening	2017-12-22	10	f
3758	Grow	    4, 1, 3, 5\n    weight: 207.8\n    sleep in\n    organize\n    	2018-08-01	1	f
3759	Teach	    plan tasks before class\n    install NetBeans on Mac\n    use XAMPP on Mac\n    start building example code for 350	2018-08-01	6	f
3779	Teach	    build slide show application\n    use slides from Spring as model\n    copy images for BACS 200 in spring\n    debug image loading\n    	2018-08-02	6	f
3155	Grow	\n        4, 3, 3, 3	2018-03-09	0	f
3156	Teach	\n        corrupted gradebook\n        exam	2018-03-09	6	f
3157	Tools	\n        fix production who2hire by restarting nginx	2018-03-09	2	f
3171	Tools	\n        card view\n        outline parsing algorithm	2018-03-12	6	f
3158	People	\n        HP alumni lunch	2018-03-09	3	f
3159	Church	\n        Brews and Bros	2018-03-09	2	f
3160	Fun	\n        Amazing Race\n	2018-03-09	1	f
3780	WAM	    restart WAM staging server\n    reset admin passwords for testing	2018-08-02	1	f
3781	Fun	    nts 2\n    Black	2018-08-02	4	f
3769	Fun	    Black\n    Americans	2018-08-04	3	f
3770	People	    subway sandwich\n    Andrew & Rachel - take out from Sol de Jalisco	2018-08-04	3	f
3637	Fun	    nts 3\n    Last Jedi	2018-06-30	7	f
3638	People	    	2018-06-30	0	f
3771	Church	    baptism and picnic	2018-08-01	3	f
3164	People	\n        games with Leaders	2018-03-10	3	f
3165	Fun	\n        Thor: Ragnarok\n	2018-03-10	2	f
3772	Grow	    5, 4, 4, 3\n    weight: 206.8\n    Ray Dalio's 1937 Article	2018-08-03	1	f
3635	Teach	    unify and optimize CSS for Guide\n    think through branding\n    refactor view code to eliminate duplication	2018-06-30	3	f
3773	Teach	    move office\n    talk with Mehrgan\n    talk with Anne\n 	2018-08-03	3	f
3774	WAM	    Basic testing\n    Fix issue with Login style\n    Fix issue with Director view not linking to correct case views\n    Improve overall spacing and borders for better appearance\n    Relayout tables in views to be more consistent	2018-08-03	4	f
3633	Fun	    Profit\n    Last of Mohicans	2018-06-29	6	f
3397	Teach	    meet with Charmayne\n    work on class details	2018-05-08	2	f
3398	Tools	    implement Task Import from files\n    simplify Task processing code\n    unify views\n    upgrade Pycharm on macbook\n    remove old history files from all machines\n    eliminate 1000 lines of code\n    fix all tests	2018-05-08	6	f
3166	Grow	\n        Originals, Fully Charged\n        nap\n        4, 3, 4, 3	2018-03-11	3	f
3167	People	\n        Meekers\n        time with Stacie	2018-03-11	3	f
3775	Business	    Car repair\n    Haircut	2018-08-03	2	f
3776	Fun	    Black\n    	2018-08-03	1	f
3028	Teach	\n        lesson 12 - prep, ex, grade\n        teach about Forms\n        discuss faculty interview process with Mehrgan	2018-02-05	11	f
2628	Teach	\n        200\n            grade exam\n            grade proto\n            review grades\n            url quiz\n        350\n            hosting prep\n            system test prep	2017-11-02	10	f
3768	WAM	    save data from production\n    turn off old server\n    clone staging server\n    configure server\n    attempt to get SSL certificate\n    test server & data\n    release 2.2.1\n    	2018-08-04	8	f
3168	Fun	\n        Avengers Civil War, Amazing Race	2018-03-11	4	f
3169	Church	\n        church\n	2018-03-11	4	f
2633	Grow	\n        4, 5, 2, 5\n	2017-11-03	0	f
2634	Grow	\n        4, 3, 3, 2\n        personal review	2017-11-04	1	f
2635	Teach	\n        200\n            Design Review planning\n            Design Review Checklist\n            Design Review tool for scoring\n            Adjust grades for proto\n            Assign review groups	2017-11-04	7	f
3170	Grow	\n        reflection\n        haircut\n        3, 4, 4, 2	2018-03-12	2	f
2629	Fun	\n        Flash\n	2017-11-02	2	f
2630	Teach	\n        Class #32\n        200: Exam review, Prototype, 20 people missing\n        350: system test, help Fayed	2017-11-03	9	f
2844	Grow	\n        5, 1, 3, 2	2017-12-26	0	f
2845	People	\n        Three Wise Men role playing\n        group to Jumanji\n        Fleebees to meet Ben	2017-12-26	12	f
2846	Fun	\n        Jumanji\n	2017-12-26	2	f
3399	Fun	    buy Kenny Wayne Shepherd - Let it go	2018-05-08	2	f
3778	Grow	    5, 3, 3, 3\n    weight: 207.8\n    Grumpy Old Man	2018-08-02	1	f
3161	Grow	\n        nts\n        4, 3, 3, 2	2018-03-10	2	f
3777	People	    Andrew & Rachel - Carcassonne\n    cook steaks\n    visit with Cassie	2018-08-03	3	f
2631	Church	\n        Dayspring Banquet	2017-11-03	4	f
2842	Grow	\n        5, 2, 2, 1	2017-12-25	0	f
2843	People	\n        open presents\n        finish Star Wars puzzle\n        Julio and Jackie for Christmas dinner\n        play games	2017-12-25	13	f
3639	Church	    Beilman's BarBQ   	2018-06-30	2	f
3636	Tools	    	2018-06-30	0	f
3162	Teach	\n        grade exam	2018-03-10	3	f
2632	Fun	\n        Entertainment Weekly	2017-11-03	1	f
3767	Grow	    5, 4, 4, 3\n    weight: 206.4	2018-08-04	0	f
3163	Tools	\n        build card view (CSS, and view logic)	2018-03-10	4	f
3175	Business	\n        update Personal Capital dashboard\n        review finances	2018-03-13	3	f
3176	People	\n        visit Shiels	2018-03-13	3	f
3121	Grow	\n        feeling sick\n        pass kidney stone\n        walk to Pelican Lakes\n        3, 3, 2, 3	2018-03-01	5	f
3122	Teach	\n        repair slide show\n        prep Lesson 21\n        debug tabs and accordion	2018-03-01	7	f
3123	Fun	\n        Amazing Race\n	2018-03-01	2	f
3124	Grow	\n        nap\n        bad sleep\n        1, 3, 4, 2	2018-03-02	2	f
3125	Teach	\n        Lesson 21	2018-03-02	6	f
3126	Business	\n        tax meeting with Diane Alexander	2018-03-02	1	f
3127	People	\n        Fat Pastors	2018-03-02	3	f
2847	Fun	\n        experiment with Ember\n	2017-12-25	1	f
2848	Grow	\n        Tribe of Mentors\n        5, 2, 3, 2	2017-12-27	1	f
2849	People	\n        Egg & I with Josiah\n        Agreed on Investment Fund\n        played Cure with Josiah & Andrew	2017-12-27	8	f
2850	Tools	\n        install Django, and PyCharm on UNCO.EDU\n        plan repo roll	2017-12-27	3	f
2851	Fun	\n        Black Widow\n	2017-12-27	2	f
2852	Grow	\n        5, 1, 3, 2	2017-12-28	0	f
2853	Tools	\n        organize repos	2017-12-28	3	f
3916	Fun	    Americans (next to last episodes)	2018-08-31	4	f
3830	Fun	    Dance\n    ER\n    Elementary\n    	2018-08-14	3	f
3128	Fun	\n        Real Steel\n	2018-03-02	2	f
2636	Fun	\n        TV\n	2017-11-04	6	f
2637	Grow	\n        3, 5, 4, 5	2017-11-05	0	f
2638	Church	\n        Todd - Generocity	2017-11-05	4	f
2639	Fun	\n        Ragnarok with Rachel, Christine\n        Edge of Eternity\n        Limitless, NCIS, Poldark\n	2017-11-05	10	f
2640	Grow	\n        write about life\n        3, 5, 4, 5	2017-11-06	2	f
2641	Teach	\n        200\n            create URL quiz\n            create canvas\n            class #33\n        350\n            class #33	2017-11-06	9	f
2642	Fun	\n        TV\n        	2017-11-06	3	f
2643	Grow	\n        3, 5, 4, 5	2017-11-07	0	f
2644	Teach	\n        200 - build design review data form app	2017-11-07	9	f
2645	People	\n        Pelican Lakes with Stacie	2017-11-07	2	f
2646	Fun	\n        TV\n	2017-11-07	3	f
2647	Grow	\n        3, 4, 4, 5	2017-11-08	0	f
2648	Teach	\n        200\n            class #34\n            grade URL quiz\n        350\n            class #34	2017-11-08	9	f
2649	Fun	\n        TV\n	2017-11-08	5	f
2650	Grow	\n        3, 5, 4, 5	2017-11-09	0	f
2651	Teach	\n        200 - build design review data form app\n        grade design reviews	2017-11-09	9	f
2653	Grow	\n        3, 5, 4, 5	2017-11-10	0	f
2654	Teach	\n        200\n            grade design reviews\n            class #35\n        350\n            class #35	2017-11-10	9	f
2655	People	\n        Cafe Athens with Julio	2017-11-10	3	f
2656	Fun	\n        Edge of Eternity\n	2017-11-10	2	f
2657	Grow	\n        3, 4, 3, 2	2017-11-11	0	f
2658	Teach	\n        fix student selector on design review app	2017-11-11	2	f
2659	Church	\n        rewrite Church money dashboard	2017-11-11	7	f
3831	People	    Josiah & Cassie return to London\n    breakfast with Josiah & Cassie\n    dinner at Pelican Lakes with Stacie & Christine\n    neighbors use Unicorn float	2018-08-14	4	f
3129	Grow	\n        4, 4, 4, 4\n        walk to library\n        reflection\n        nts	2018-03-03	3	f
3130	Tools	\n        imagine high-level workflow in Sensei\n        create export for Time history	2018-03-03	2	f
3172	Fun	\n        Amazing Race (Season 28 finale), This is Us, Shield, Vikings\n	2018-03-12	6	f
3782	People	    time with Cassie\n    steaks for dinner with Stacie & Cassie	2018-08-02	2	f
3592	WAM	    Get logged into GoDaddy\n    Setup DNS record to point to old production server\n    Work on Server configuration for WAM\n    Debug server configuration on WAM image\n    Load production data into WAM	2018-06-20	7	f
3739	People	    Travel with Stacie\n    Visit with other travelers\n    	2018-07-20	7	f
3381	Teach	    final exam\n    book give away\n    calculate final grades\n    meet with Pat Seaton, Paul B., Dean A., Jay	2018-05-04	8	f
3173	Grow	\n        nts\n        5, 3, 3, 3	2018-03-13	1	f
4056	People	    dinner at Sol de Jalisco  \n    house cleaning  	2018-10-03	2	f
3829	Tools	    	2018-08-14	0	f
3400	Grow	    Activate Your Brain\n    prepare for conference\n    travel to Cleveland\n    5, 5, 5, 4	2018-05-09	14	f
3827	Grow	    5, 2, 3, 2	2018-08-14	0	f
3640	Grow	    5, 4, 3, 3\n    Same Different as Me	2018-07-01	3	f
3914	Grow	    5, 4, 2, 5\n    Albertos dinner and think time	2018-08-31	2	f
3634	Grow	    5, 3, 4, 5\n    walk \n    11,000 steps	2018-06-30	2	f
3642	Tools	    improve MyBook Stylesheet	2018-07-01	2	f
3645	Church	    church service\n    Chris Warren preached\n    lunch at Royal Nepal with Warrens	2018-07-01	6	f
3644	People	    pack clothes for donation\n    prep for Europe trip\n    time with Stacie	2018-07-01	2	f
3641	Teach	    Order book for BACS 350 (bookstore)	2018-07-01	1	f
3643	Fun	    	2018-07-01	0	f
4057	Grow	    5, 3, 3, 2\n    weight: 208.4	2018-10-01	0	f
3961	Business	    prepare house for move	2018-09-09	3	f
4199	Teach	    \n    	2018-11-17	0	f
2660	Business	\n        mount trike in garage	2017-11-11	1	f
3174	Tools	\n        card view	2018-03-13	3	f
2662	Grow	\n        bed at 8:00\n        4, 5, 3, 3	2017-11-12	2	f
2661	Fun	\n        Inhumans\n	2017-11-11	4	f
4200	Tools	    Fix old time records	2018-11-17	2	f
2663	People	\n        discuss business with Stacie\n        Stacie meets with John Klassen	2017-11-09	1	f
2664	Church	\n        Small group with Howells\n	2017-11-09	4	f
3414	Fun	    explore Cleavland\n    Red Sparrow	2018-05-13	3	f
3131	People	\n        lunch at Egg & I	2018-03-03	1	f
3132	Teach	\n        create lesson plan for Bootstap\n        create tabs (raw, bootstrap, material)	2018-03-03	3	f
3133	Fun	\n        Star Trek, Voyage Home\n        check out Dragonfly audio\n	2018-03-03	5	f
3134	Grow	\n        5, 4, 2, 3\n        think about 4 Questions to Change Your Life\n        nap	2018-03-04	3	f
3178	Grow	\n        5, 3, 3, 2	2018-03-14	0	f
3179	People	\n        Joe Woodman\n        Rachel and Andrew and Fondue	2018-03-14	5	f
3181	Grow	\n        5, 3, 3, 4\n        personal renewal and reflection	2018-03-15	2	f
3182	Fun	\n        hook up bluetooth transmitter\n        create scripts for loading music player\n        mess with music collection	2018-03-15	5	f
767	Fun	\n        Sliders\n	2016-08-24	3	f
4107	Teach	    prepare lesson slides\n    issues with Garret and Jessica	2018-10-17	8	f
3785	Tools	    	2018-08-05	0	f
2854	People	\n        Bryan & Corina visit\n        visit with Josiah & Sam	2017-12-28	4	f
2855	Church	\n        church board meeting	2017-12-28	3	f
2856	Fun	\n        Defenders\n        Crown\n	2017-12-28	4	f
2857	Grow	\n        5, 1, 3, 2\n        visit library\n        read Sapiens\n        read Tools of Titans\n        nts	2017-12-29	5	f
3834	People	    talk with Josiah\n    pancakes\n    Cassie and swimming\n    Josiah goes to CSU\n    discuss careers with Josiah\n    time with Stacie	2018-08-13	8	f
4062	Teach	    build solution code\n    	2018-10-02	5	f
3656	Church	    discuss message from Todd\n    write about church savings\n    review message from Stacie	2018-07-03	2	f
3405	Teach	    ideas for teaching	2018-05-14	3	f
3407	Fun	    Rock and Roll Hall of Fame	2018-05-14	3	f
3648	WAM	    solve Letsencrypt problems\n    test and fix staging server\n    improve CSS on WAM\n    relayout page banner 	2018-07-02	4	f
3649	Fun	    Turn, ER, Dance, Fraiser	2018-07-02	4	f
3921	People	    	2018-09-03	0	f
3401	Grow	    PyCon Day 2\n    security keynote\n    3, 3, 3, 5	2018-05-12	8	f
3828	Teach	    finalize syllabi for 200 & 350\n    sign contract\n    visit new office\n    setup office\n    setup new computer system\n    copy files from existing system\n    talk with Vish & Dan\n    email Robert & Noah\n    	2018-08-14	7	f
4063	Fun	    Patriot Games\n    	2018-10-02	3	f
3928	People	    Pelegrini's with Balls\n    breakfast at Severence Grill\n    Facebook	2018-09-01	6	f
3653	WAM	    review progress from Stacie\n    fix issue with Bootstrap\n    create simpler Banner\n    redesign Director view logic	2018-07-03	4	f
3654	Fun	    nts 1\n    Supergirl, Fraiser	2018-07-03	4	f
3652	Teach	    	2018-07-03	0	f
3651	Grow	    5, 3, 4, 5\n    walk	2018-07-03	2	f
3404	Grow	    3, 3, 3, 5	2018-05-14	0	f
3406	People	    visit Sprints\n    Bill Tucker\n    travel from Cleavland to Houstin\n    ride to beach house	2018-05-14	8	f
3783	Grow	    5, 4, 4, 3\n    weight: 206.6\n    nap\n    research investment strategies\n    walk to Boardwalk Lake	2018-08-05	3	f
3786	Fun	    Americans\n    Black\n    	2018-08-05	3	f
3787	People	    lunch at Rio with Webbs, Balls, Garcias, Cassie\n    time with Cassie\n 	2018-08-05	4	f
4060	People	    talk with Stacie	2018-10-01	2	f
3917	Grow	    3, 1, 1, 4\n    walk\n    weight: 210.2	2018-09-03	1	f
3647	Teach	    locate patent info online	2018-07-02	1	f
3650	People	    lunch with Stacie at Pelican Lakes	2018-07-02	2	f
3408	Grow	    PyCon Education Summit\n    Edu Blocks\n    Robots with visual learning\n    GitHub Classroom + Travis + GatorGrader\n    Mark @ Allegehney\n    Jupyter Hub\n    Winking Lizard\n    3, 3, 3, 5	2018-05-10	14	f
4061	Grow	    5, 3, 3, 5\n    10,000 steps\n    weight: 207.4\n    Dr Kary - annual physical\n    medicine prescriptions	2018-10-02	4	f
4064	People	    Stacie VMC live stream\n    lunch at Sandbar	2018-10-02	2	f
3409	Grow	    PyCon Day 1\n    Expo opening\n    Harry Percival\n    Chris Wang\n    3, 3, 3, 5	2018-05-11	9	f
3410	Teach	    ideas for teaching	2018-05-11	2	f
3412	Grow	    PyCon day 3 \n    attend Sprint training session\n    3, 3, 3, 5	2018-05-13	9	f
3832	Grow	    3, 3, 3, 4\n    weight: 207.8\n    sleep in till 9	2018-08-13	0	f
3403	People	    Winking Lizard with 6 new people\n    Greg Dozier	2018-05-12	4	f
3919	Tools	    	2018-09-03	0	f
3833	Teach	    edit syllabi for 350 and 200\n    get Stacie to help with syllabi\n    build class lesson content\n    screen shots for bluehost.com	2018-08-13	6	f
3402	Teach	    think about teaching	2018-05-12	2	f
3922	Grow	    3, 3, 1, 2\n    nap	2018-09-02	1	f
3923	Fun	    finish Turtles All The Way Down\n    Red\n    	2018-09-02	3	f
3924	People	    Family Birthday celebration\n    Stacie prepares for trip\n    time with Stacie	2018-09-02	6	f
3925	Church	    start Arrows series (On Target with God)\n    visit with people at church	2018-09-02	4	f
3926	Grow	    3, 3, 2, 2\n    Happy Birthday!	2018-09-01	0	f
3927	Fun	    movie: Mission Impossible - Fallout\n    home entertainment equipment\n    watch hot air balloons\n    	2018-09-01	8	f
3918	Teach	    refactor views for lessons\n    	2018-09-03	3	f
3920	Fun	    nts 4\n    Turn\n    finish Americans series	2018-09-03	10	f
3655	People	    pack for trip	2018-07-03	1	f
3784	Teach	    \n    	2018-08-05	0	f
4201	Fun	    \n    	2018-11-17	0	f
3413	People	    gave out two Leverage books\n    communicated with 7 people through email	2018-05-13	2	f
3411	Fun	    TV	2018-05-11	3	f
2858	People	\n        dinner at Outback with Josiah & Sam	2017-12-29	4	f
2859	Tools	\n        simplify tests	2017-12-29	3	f
2860	Fun	\n        King's Speech\n	2017-12-29	2	f
2861	Grow	\n        5, 1, 4, 3\n        nts\n        Questions for Personal Reflection\n        Making Commitments for 2018	2017-12-30	3	f
2862	People	\n        Cassie to Ft Collins Discovery Museum\n        read to Cassie	2017-12-30	4	f
2863	Teach	\n        create schedule.md for BACS 200\n        create WebApps content directory\n        WebApps Course - build two levels of lesson plan (4 Parts, 48 Lessons)	2017-12-30	4	f
2864	Fun	\n        Black Widow\n	2017-12-30	3	f
2865	Grow	\n        5, 1, \n        personal reflection	2017-12-31	1	f
2866	Tools	\n        create Documents-2017, MyBook-2017 archive repos\n        create Documents-2018, MyBook-2018 repos	2017-12-31	2	f
3659	Teach	    	2018-07-04	0	f
3433	People	    Royal Wedding\n    bird building nest on back porch	2018-05-19	2	f
3135	Church	\n        church service	2018-03-04	4	f
3136	People	\n        Parry's Pizzeria\n        Palaminos Greeley\n        visit Garcias and play Carcassonne\n        time with Stacie\n	2018-03-04	7	f
2665	Church	\n        Vineyard 101\n        Tape giving blurb	2017-11-12	7	f
2666	People	\n        Rachel having difficulties	2017-11-12	1	f
2667	Teach	\n        build designer score\n        class prep	2017-11-12	2	f
3137	Grow	\n        4, 3, 3, 3	2018-03-05	0	f
3430	Fun	    Vikings, Legends	2018-05-20	3	f
3943	Fun	    Westworld\n    nts 2\n    	2018-09-06	6	f
3425	Teach	    course outline for 200	2018-05-17	3	f
3138	Business	\n        tax appointment	2018-03-05	2	f
3139	Teach	\n        Lesson 22 - Bootstrap	2018-03-05	6	f
3140	People	\n        lunch with Eric and Stacie	2018-03-05	2	f
3141	Fun	\n        Shield, ER, Amazing Race\n    	2018-03-05	4	f
3142	Grow	\n        high winds during night\n        4, 3, 4, 2	2018-03-06	1	f
3143	Business	\n        closing on refi	2018-03-06	1	f
3144	Teach	\n        Lesson 23 - Data Display	2018-03-06	5	f
3145	Tools	\n        upgrade cable modem and wireless networks	2018-03-06	1	f
3146	Church	\n        talk with Todd	2018-03-06	1	f
3147	Fun	\n        ER, Enterprise, Amazing Race\n    	2018-03-06	5	f
3183	People	\n        watch Andrew's soccer game\n        dinner at Yak and Yeti\n        discuss life issues with Stacie\n        upsetting conversation with Stacie about church\n	2018-03-15	7	f
3184	Grow	\n        3, 3, 2, 3\n        life goal during night	2018-03-16	2	f
3185	People	\n        breakfast with Stacie in Westin Hotel\n        explore itinerary for River Cruise	2018-03-16	4	f
3186	Fun	\n        setup new Kindle Fire\n        watch Vikings on Fire with headphones	2018-03-16	3	f
3435	Fun	    Madam Sec, Shield	2018-05-19	3	f
3426	Fun	    Dragonfly	2018-05-17	4	f
3660	Tools	    	2018-07-04	0	f
3962	Grow	    5, 2, 2, 5\n    weight: 208.4\n    walk to library & Border restaurant	2018-09-12	2	f
3944	People	    Josiah worried about checkpoint in program	2018-09-06	1	f
3788	Church	    Mike Webb teaching	2018-08-05	4	f
3417	Teach	    course outline for 350\n    apps to create for 350\n    lesson plans\n    work on system call in PHP	2018-05-15	3	f
3187	Church	\n        passover\n        processing church ideas (middle of night)\n	2018-03-16	5	f
3432	Grow	    4, 1, 3, 2\n    prayer time\n    settle in from trip	2018-05-19	2	f
3658	Grow	    4, 4, 3, 5\n    9,000 steps	2018-07-04	1	f
3418	Fun	    Dragonfly	2018-05-15	4	f
3662	People	    July 4th Party\n    Hirata, Warren, Bolowski, Mora, Garcia, Martinez, Fleebe\n    Stacie met with Shawn Barrio	2018-07-04	10	f
3421	Teach	    course outline for 200	2018-05-16	3	f
3663	Church	    	2018-07-04	0	f
3422	Fun	    Dragonfly\n    walk on beach at sunset\n    time in swimming pool	2018-05-16	4	f
3423	Grow	    3, 3, 1, 5\n    Activate your Brain	2018-05-17	3	f
3429	Teach	    classroom content teaching tools\n    Learn, Plan, Build, Collab model for each lesson\n    Template for lesson content	2018-05-20	2	f
3661	Fun	    work with photos\n    try out camera\n    create collection of photos on Mac	2018-07-04	3	f
3963	Teach	    go to UNC at 8am\n    plan 350 Lesson 10\n    teach Lesson 10\n    Semantic Elements\n    conflict with Brian, Brittney\n    	2018-09-12	8	f
3431	Church	    church service	2018-05-20	4	f
3427	Grow	    3, 3, 1, 3\n    nap	2018-05-20	1	f
3428	People	    Royal Wedding w/Stacie and Rachel	2018-05-20	2	f
3940	Grow	    5, 2, 1, 2\n    weight: 209.0	2018-09-06	0	f
3941	Teach	    build steps for Subscriber App\n    	2018-09-06	5	f
3436	Grow	    2, 2, 2, 4\n    Activate your Brain\n    problems with digestion	2018-05-18	3	f
3415	Grow	    3, 2, 2, 4\n    Thinking F & S	2018-05-15	3	f
3437	People	    check out of condo\n    drop Lucy at airport\n    travel from Houston to Home	2018-05-18	11	f
3789	Grow	    3, 4, 1, 5\n    weight: 206.6\n    13,000 steps	2018-08-06	2	f
3942	Tools	    	2018-09-06	0	f
3791	Tools	    restructure info views\n    build out UI for class website	2018-08-06	2	f
3792	Fun	    Black\n    Americans	2018-08-06	3	f
3419	Grow	    5, 2, 3, 4\n    Thinking F & S	2018-05-16	3	f
3420	People	    visit with Lucy, Stacie, Christine\n    time with Stacie	2018-05-16	4	f
3189	People	\n        Rachel's 30th birthday\n        St. Patricks Party	2018-03-17	6	f
3424	People	    visit with Lucy, Stacie, Christine\n    time with Stacie\n    Red Snapper	2018-05-17	4	f
3190	Fun	\n        setup Kindle Fire\n        try to get Marvel Comics working\n	2018-03-17	2	f
3702	Fun	    Travel Log: Day 18 - London 3\n        Little sleep\n        Breakfast at Bridge Inn\n        Imperial War Museum\n        Virtual Reality tours of Victoria Falls, Petra\n        Look at trip photos\n        Hide in front of AC\n        Finally succumb to cold\n        Book final night a Premier Inn\n        Bus to Richmond\n        Italian restaurant\n        Cold shower before bed\n        Wet wash clothes all night\n        Cooled off by 5am\n        3,500 steps	2018-07-25	7	f
3794	Grow	    5, 5, 2, 5\n    weight: 206.0\n    3,000 steps + carryover of exercise stars\n    browse Amazon wish list\n    start Whole New Mind	2018-08-07	1	f
3968	Teach	    lunch at Toby-Kendell\n    teach Lesson 11\n    setup Apache on UNC computer\n    script for Apache setup	2018-09-14	8	f
3797	Fun	    organize brain \n    nts \n    	2018-08-07	2	f
3793	People	    time with Stacie\n    Cassie to Windsor Lake with Andrew & Rachel\n    Stacie - meet with Todd & Jenny, W2W program team	2018-08-06	3	f
3798	People	    Cassie, Christine, and Stacie go to movie\n    schedule Bill Hayes lunch	2018-08-07	2	f
3667	Fun	    Turn\n    Mash	2018-07-05	4	f
4073	Grow	    5, 3, 3, 1\n    weight: 207.4	2018-10-06	0	f
3438	Tools	    collaboration opportunities\n    follow up ideas from PyCon	2018-05-20	2	f
3970	Business	    Rearrange furniture downstairs\n    	2018-09-14	1	f
3416	People	    visit with Lucy, Stacie, Christine\n    walk on beach with Stacie\n    time with Stacie\n    Red Snapper	2018-05-15	4	f
3971	People	    Andrew & Rachel for dinner\n    Carcassonne\n    Talk with Stacie about feeling over-committed	2018-09-14	4	f
3668	People	    Grand Circle boat will not go to Vienna\n    return awning after party	2018-07-05	1	f
3669	Church	    	2018-07-05	0	f
3666	Tools	    	2018-07-05	0	f
3664	Grow	    5, 4, 3, 2	2018-07-05	0	f
3665	Teach	    send email about Learn by Doing\n    create Schedule spreadsheet for BACS 200\n    approve registration for Noah Rolf\n    setup templates for BACS 200 class\n    review scheduled topic for BACS 200\n    learn about Flexible Box and Grid Layout\n    learn about SASS, Gulp, and Emmet\n    learn bootstrap grid layout\n    setup XAMPP on iMac	2018-07-05	9	f
3972	Fun	    Red	2018-09-10	2	f
4068	People	    dinner with Stacie & Christine	2018-10-04	1	f
3799	Business	    IRS letter Raymond James 2017/2016	2018-08-06	0	f
3790	Teach	    rework lesson display\n    create viable slide show\n    build menu for class views\n    Digital Measures\n    invite Mehrgan to dinner\n    check on computer setup\n    process UNC email\n    	2018-08-06	4	f
3967	Grow	    3, 3, 2, 4\n    weight: 208.0	2018-09-14	0	f
4069	Grow	    5, 4, 3, 3\n    weight: 207	2018-10-05	0	f
4070	Teach	    prep RWD lesson\n    prep Objects lesson\n    prep Bear Notes app\n    create object logging app\n    great talk with Moe\n    	2018-10-05	8	f
4071	Fun	    Vikings\n    Father of the Bride\n    	2018-10-05	4	f
4058	Teach	    200 17 - Page layout\n    350 17 - MVC pattern\n    depression over student performance	2018-10-01	8	f
3988	Grow	    5, 3, 2, 3\n    weight: 207.6\n    nap	2018-09-16	1	f
3989	Teach	    create solutions for 350 projects\n    	2018-09-16	4	f
3990	Church	    busyness	2018-09-16	4	f
3991	Fun	    Gattaca\n    Setup TV system\n    	2018-09-16	3	f
3992	People	    lunch at Fuzzy Tacos\n    time with Stacie	2018-09-16	2	f
3964	Business	    carpet project	2018-09-12	2	f
3965	People	    talk with Stacie	2018-09-12	2	f
4075	Tools	    	2018-10-06	0	f
3966	Fun	    Last 100 Years	2018-09-12	0	f
4065	Grow	    4, 2, 4, 2\n    weight: 208.4\n    haircut\n    personal time	2018-10-04	1	f
4067	Church	    Vineyard Missions Conference	2018-10-04	4	f
2867	Church	\n        church with family\n        Habitat for Humanity	2017-12-31	4	f
2868	People	\n        Juan and Lynn	2017-12-31	5	f
3194	Fun	\n        Mary Poppins, Kindle games\n	2018-03-18	3	f
2869	Fun	\n        buy headphones\n        read Tribe of Mentors	2017-12-31	2	f
3195	Grow	\n        3, 4, 3, 3\n        weekly planning	2018-03-19	1	f
4076	Fun	    ER, Good Place\n    	2018-10-06	4	f
3193	People	\n        Doug's with Garcias and Christine\n        time with Stacie	2018-03-18	3	f
3796	Tools	    	2018-08-07	0	f
3795	Teach	    update lesson slides & class web site\n    rebuild & refine guide theme\n    add bear logo to every page\n    merge and test changes\n    create proper class menus\n    create tabs for lessons\n    	2018-08-07	4	f
3969	Fun	    Red\n    	2018-09-14	1	f
3657	Tools	    experiment with redirect logic for MyBook\n    renew SSL cert for app.Who2Hire.us	2018-07-03	1	f
3646	Grow	    5, 3, 3, 5\n    write Good Stress/Bad Stress\n    Years of My Life (2017)\n    Time Investment\n    Thinking Patterns & Ideas\n    walk	2018-07-02	3	f
3191	Grow	\n        4, 3, 4, 3\n        nap\n        Fully Charged\n        weekly review	2018-03-18	4	f
3192	Church	\n        Gabe Quintana\n        Daryl announced he is going to Bahamas\n        Prayed for Ben and Aubrey	2018-03-18	4	f
4077	People	    dinner with Christine and Stacie	2018-10-06	1	f
4072	People	    dinner with Stacie & Christine	2018-10-05	2	f
4074	Teach	    experiment with Regex\n    build demo code for search and replace\n    	2018-10-06	4	f
3196	Teach	\n        first day back\n        Lesson 24 - Organizing Info\n        CIS program meeting	2018-03-19	9	f
3197	Fun	\n        Fraiser	2018-03-19	1	f
3198	People	\n        Fleebees publishing party\n	2018-03-19	3	f
3199	Grow	\n        5, 3, 4, 2	2018-03-20	0	f
3845	Teach	    faculty staff meeting at UNC\n    	2018-08-17	5	f
3847	People	    dinner with Stacie	2018-08-17	3	f
3896	Teach	    slides for 350-Lesson 4\n    	2018-08-26	2	f
3897	Fun	    Tomb Raider, Fantastic Beasts\n    Red\n    	2018-08-26	4	f
3856	People	    Shrimp boil with Carmen & Jackie\n    time with Stacie\n    	2018-08-19	4	f
3839	Grow	    5, 2, 2, 5\n    long walk	2018-08-16	1	f
3843	People	    talk to Stacie	2018-08-16	1	f
3735	Fun	    Travel Log: Day 12 - Heidelberg\n        Breakfast - Don, Marg, Dave, Mich.\n        Bus to Heidelberg\n            Offenbach/Franfurt\n            American military in Germany\n            Udo's perspective and memories\n        Heidelberg\n            Walking tour with Udo\n            Student from University\n            Lunch Ravioli w/beef and spinach\n            Heidelberg castle\n            90 degree heat\n            Giant barrels\n            Pictures of valley\n        Bus to Rudesheim\n        Walk to restaraunt\n            Dinner with CO folks\n            Loud and slow\n            Leave early\n            Gelato in town\n            Buy map for castles\n            Buy teddy bear for Cassie\n        Finish Dragonfly in Amber\n        8,500 steps	2018-07-19	7	f
3846	Fun	    Ant Man with Stacie\n    Red\n    	2018-08-17	4	f
3889	Grow	    4, 3, 4, 4\n    weight: 207.4	2018-08-27	0	f
3890	Teach	    Lesson 4\n    Eleazar for office hours\n    meet with Chris Vegter about OneDrive\n    	2018-08-27	11	f
3892	Fun	    Star Trek\n    ER\n    	2018-08-27	2	f
3841	Tools	    	2018-08-16	0	f
3898	People	    Chris & Elaine\n    time with Stacie	2018-08-26	3	f
3835	Grow	    5, 2, 3, 2	2018-08-15	0	f
3836	Teach	    lesson content for HTML 1-3, PHP 1\n    copy files from Uncle Ed to OneDrive\n    create script to edit lesson files\n    debug 'pe' script\n    implement Next, Prev lesson buttons\n    setup images for PHP class\n    	2018-08-15	6	f
3838	People	    Chicken on patio with Stacie\n    deflate Unicorn float\n    Stacie massage	2018-08-15	3	f
3852	Grow	    5, 3, 3, 3\n    weight: 207.8\n    nap	2018-08-19	1	f
3671	Teach	    	2018-07-07	0	f
3672	Tools	    	2018-07-07	0	f
3670	Grow	    4, 1, 3, 5	2018-07-07	0	f
3853	Teach	    \n    	2018-08-19	0	f
3445	People	    walk with Stacie	2018-05-22	2	f
3674	People	    Travel with Stacie	2018-07-07	7	f
3443	Business	    Shrinking World Partners\n    schedule appointments\n    windshield repair\n    dentist\n    eye dr	2018-05-21	3	f
3848	Grow	    3, 3, 3, 3\n    weight: 207.8\n    walk\n    nap\n    Activate your brain\n    wake up at 4am\n    discuss coaching with Stacie\n    capture ideas	2018-08-18	4	f
3855	Fun	    Dance, ER\n    	2018-08-19	3	f
3434	Teach	    investigate setup of PHP server\n    outline of first four lessons in PHP class\n    build list of all apps for 350\n    setup Digital Ocean account\n    investigate pytest on PHP account	2018-05-19	7	f
3840	Teach	    build Canvas structure\n    create 350 images\n    create Exercises and content for PHP Lesson 2-3\n    	2018-08-16	9	f
3448	Fun	    The Post	2018-05-22	3	f
3844	Grow	    4, 3, 3, 4\n    Activate your Brain\n    think about coaching	2018-08-17	2	f
3675	Church	    	2018-07-07	0	f
3439	Grow	    3, 1, 3, 5\n    walk to garden	2018-05-21	1	f
3440	People	    walk to Pelican Lakes with Stacie\n    discuss chest pains with Stacie	2018-05-21	2	f
3849	Teach	    create graphics for Canvas\n    publish classes in Canvas\n    install GIMP & learn to use it\n    meet with Chris Harris about CS350	2018-08-18	2	f
3850	Tools	    work with regular expressions in python\n    rewrite text.py and text_test.py	2018-08-18	3	f
3441	Teach	    work on strategy for class website\n    update todo list for class prep\n    create new repo for UNC-2018-Fall \n    start on new code for UNC repo\n    create class schedule	2018-05-21	5	f
3442	Fun	    Madam Sec, Goldbergs, Frasier	2018-05-21	3	f
3679	Fun	    nts 1\n    reload music	2018-07-06	3	f
3680	People	    pack for trip	2018-07-06	2	f
3851	Fun	    copy Photos for Stacie\n    Bridge to Far\n    	2018-08-18	5	f
3894	Business	    visit Ace hardware\n    Stacie deflates Unicorn\n    grout project	2018-08-25	4	f
3899	Church	    Arrows\n    talk to Matt Isborn about business	2018-08-26	4	f
3842	Fun	    Dance, Librarians\n    	2018-08-16	3	f
3676	Grow	    5, 3, 4, 3\n    shopping for pants\n    pick up glasses	2018-07-06	3	f
3447	Tools	    build guide script command	2018-05-22	1	f
3678	WAM	    deactivate WAM users	2018-07-06	1	f
3893	People	    discuss students with Stacie\n    discuss Greg M. with Stacie	2018-08-27	1	f
3895	Grow	    5, 3, 4, 3\n    weight: 207.8\n    nap	2018-08-26	1	f
3837	Fun	    nts 1\n    Hawaii 50, Dance, ER, Librarians\n    	2018-08-15	5	f
3854	Tools	    work on text.py and text_test.py	2018-08-19	3	f
3677	Teach	    create first four app exercises (Server, HTML++, Directory, Files)\n    show PHP Templates in Guide website\n    show HTML Templates in Guide website\n    debug use of PHP on iMac\n    build web-root and 3 exercises	2018-07-06	5	f
3891	Tools	    	2018-08-27	0	f
2871	Tools	\n        automate all web page creation	2017-01-01	2	f
2870	Teach	\n        build first three lessons for BACS 200\n        create standard lesson and ex layout	2017-01-01	4	f
1692	People	\n        Andrew & Rachel move\n        Josiah	2017-01-15	2	f
1697	Aspire	\n        count aspire documents (39 docs, 5K words)\n        track hours for Aspire projects\n        track files for Aspire projects\n        create report of all projects	2017-01-16	4	f
1702	Hire	\n        Build production server\n        Create notes for building future servers\n        Rename droplet and create console access\n        Build code directories and version control\n        Debug automation and tests\n        Setup web server and static server	2017-01-17	6	f
3690	People	    Cassie\n        Cassie sleeps for three hours on the plane\n        Cassie sleeps from 10pm to 2am at home\n        Stacie sleeps downstairs\n        At 6am Cassie is frantic\n        Rachel & Andrew entertain Cassie\n        	2018-07-28	4	f
3688	Teach	    planning work to do\n    think about PHP apps\n    review textbook	2018-07-28	2	f
3698	Teach	    review book on PHP\n    plan content of first sessions	2018-07-29	3	f
3700	People	    visit with Cassie	2018-07-29	2	f
3682	Teach	    create outline for exercises in 350\n        ex1\n        ex2\n        ex3\n    outline first 7 lessons in 350\n    review Murach PHP book chapter by chapter\n        build schedule for 24 lessons\n    send out email to colleagues\n        moving\n        schedule conflict\n        upcoming schedule\n    discover issue with JavaScript content	2018-07-30	6	f
3460	Church	    	2018-05-25	0	f
3684	Fun	    Record travel log of adventures	2018-07-30	3	f
3200	Teach	\n        interact with students	2018-03-20	3	f
3201	Tools	\n        update CardView, OutlineView, ContainerView\n        integrated multiple views into MyBook\n        build document reader for Knowledge.md	2018-03-20	4	f
3202	Church	\n        record ideas for Church Board Meeting	2018-03-20	2	f
3203	Fun	\n        Vikings, Amazing Race, ER, This is Us\n	2018-03-20	5	f
3204	Grow	\n        5, 4, \n        walk\n        activity planning	2018-03-21	2	f
3685	People	    Cassie to park\n    visit with Cassie\n    discuss church decision with Stacie	2018-07-30	3	f
3692	Teach	    	2018-07-27	0	f
3693	Tools	    	2018-07-27	0	f
3452	Tools	    investigate nested project repos\n    rebuild vc script to accommodate multiple repos	2018-05-23	3	f
3454	People	    time with Stacie\n    grill and dine with nesting bird 	2018-05-23	2	f
3458	Fun	    Solo\n    Barnes & Noble\n    Dragonfly	2018-05-25	5	f
3805	WAM	    call GoDaddy to learn how to get SSL\n    conference in Julie to get pin\n    think through next steps to debug SLL	2018-08-07	2	f
3806	Church	    Church leaders meet at Beilmans	2018-08-07	3	f
3695	People	    Travel with Stacie\n    Visit with other travelers\n    	2018-07-27	7	f
3683	Tools	    	2018-07-30	0	f
1065	Church	\n        small group\n	2016-11-15	4	f
3697	Grow	    1, 1, 5, 1\n    rest and recover\n    weight: 211.8	2018-07-29	6	f
3699	Fun	    Entertainment Weekly\n    Black	2018-07-29	3	f
3686	Church	    	2018-07-30	0	f
3689	Fun	    So you think you can dance\n    unload photos from camera	2018-07-28	4	f
3801	Teach	    relayout schedule views for classes\n    build templates code views\n    work on UNCO-BACS.ORG website structure\n    show code templates source and live code\n    clean up dead code\n    	2018-08-08	6	f
3802	Business	    grout shower	2018-08-08	2	f
3803	Fun	    Black, 10% Happier	2018-08-08	2	f
3804	People	    lunch with Bill Hayes at Roma's\n    Cassie goes to kid's movie with Christine\n    Stacie and Cassie go for trike ride	2018-08-08	3	f
3456	Teach	    plan out essential class preparation\n    create summer work schedule\n    detailed plan for work to do	2018-05-25	4	f
3457	Tools	    deploy new repos	2018-05-25	1	f
3459	People	    Josiah & Cassie\n    dinner at Cafe Athens	2018-05-25	4	f
3687	Grow	    2, 1, 4, 1\n    weight: 214.6\n    sleep and rest\n    unpack and organize after trip\n    planning transition to real life	2018-07-28	4	f
3800	Grow	    2, 3, 1, 4\n    weight: 207.2\n    coughing in night; sleep face-down\n    sleep in	2018-08-08	1	f
3450	Grow	    5, 3, 3, 5	2018-05-23	0	f
3455	Grow	    5, 1, 2, 3	2018-05-25	0	f
3461	Grow	    5, 3, 1, 5\n    Dentist visit\n    If We can Keep It    	2018-05-24	2	f
3462	Tools	    restructure loading of SiteTitle and Menu in MyBook online\n    run page test robot\n    simplify MyBook code	2018-05-24	3	f
3463	People	    walk with Stacie\n    Rachel and Andrew	2018-05-24	5	f
3451	Teach	    build class content\n    setup standard treatment of GitBook repos\n    guide - HtmlApps, PhpApps, PythonApps, Teaching\n    start writing Teaching Technology guide	2018-05-23	5	f
3696	Church	    	2018-07-27	0	f
3464	Church	    church board meeting\n    decision to resign from board	2018-05-24	3	f
3465	Fun	    Vikings	2018-05-24	1	f
3681	Grow	    2, 2, 1, 1\n    Weight: 208.6\n    develop time log	2018-07-30	2	f
3453	Fun	    ER, Fraiser, DS9	2018-05-23	4	f
2873	Work	\n        develop idea of writing scorecard\n        build initial scorecard snapshot 2016-12-30\n        write Web App Dimensions\n        App Development - project catalog	2017-01-01	3	f
1647	Write	\n        A New Paradigm for Writers\n        create index of Ideas for Writing\n        clean up scripts and document structure\n        build World Class Software website\n        move tech docs to tech structure (tech/Index)\n        remove showcase files\n        create BestPractices Index\n        refactor Leverage & Projects content	2017-01-05	4	f
1643	Hire	\n        Build candidate document view\n            upload UI\n            upload back-end\n            view docs UI \n            static server access to docs\n            show doc in browser\n            deploy\n            test	2017-01-04	5	f
3707	Grow	    4, 1, 3, 5	2018-07-16	0	f
3709	People	    Travel with Stacie\n    Visit with other travelers\n    	2018-07-16	7	f
3731	Grow	    4, 1, 3, 5	2018-07-26	0	f
3732	Fun	    Travel Log: Day 19 - London 4\n        Little sleep\n        Breakfast at Bridge Inn\n        Pack to move\n        Visit with Josiah, Sam, Cassie\n        Landlord inspection\n        Order pizza for lunch\n        Indoors in cool\n        Bus to Premier\n        Nap in luxury\n        Dinner at pub with Sam & Cassie\n        Problems with food at pub\n        Josiah at team BBQ\n        Arrange airport taxi\n        4,500 steps\n        Sound night of sleep	2018-07-26	7	f
3734	Grow	    4, 1, 3, 5	2018-07-19	0	f
3701	Grow	    4, 1, 3, 5	2018-07-25	0	f
3706	People	    Travel with Stacie\n    Visit with other travelers\n    	2018-07-21	7	f
3466	Grow	    5, 2, 3, 4	2018-05-28	0	f
3467	Teach	    Teaching Tech - Introduction	2018-05-28	2	f
3205	Teach	\n        Lesson 25 - Navigation\n        Faculty meeting\n        grade Ex 24\n        grade Blog 3	2018-03-21	9	f
3206	People	\n        dinner with Stacie	2018-03-21	1	f
3207	Fun	\n        Profit, Faiser\n	2018-03-21	2	f
3208	Grow	\n        5, 4, 2, 2\n        pharmacy, buy burritos	2018-03-22	3	f
3209	Teach	\n        Grade Blog 3	2018-03-22	3	f
3210	Business	\n        Stacie meeting with TransUnion	2018-03-22	1	f
3211	People	\n        Josiah and Sam	2018-03-22	1	f
3212	Church	\n        plan for board meeting\n        board meeting\n        disagreement with Todd\n        revelation of personal failures in relationships\n	2018-03-22	6	f
3468	Tools	    debug Github/GitBook interactions\n    restructure redirect code\n    build new tests for menu, site title, redirect\n    expand testing infrastructure	2018-05-28	5	f
3469	Fun	    Battle for LA, Profit	2018-05-28	4	f
3714	Fun	    Travel Log: Day 1\n    Arrive at Heathrow 11am\n    Short on sleep\n    4 hours at Heathrow\n    Deport for Vienna at 4pm\n    Arrive at 7pm\n    Trains to city center\n    Short walk to Hilton\n    Beatiful Hilton on the Danube\n    Dinner on the Danube - Goulash\n    Sound night's sleep till 4am\n    5,000 steps	2018-07-08	7	f
3471	Church	    	2018-05-28	0	f
1081	People	\n        lunch with Christine, Lucy, Rachel, Andrew at Tres Marg	2016-11-20	3	f
3473	Tools	    Microplanning idea capture\n    move Leverage project to Mark-Seaman github\n    experiment with GitBook	2018-05-27	1	f
3474	Fun	    Darkest Hour, ER\n    Dragonfly	2018-05-27	4	f
3475	People	    Andrew & Rachel -- Fuzzy's tacos\n    Ben Martinez graduation party\n    Jayden Bowen (engineering student)	2018-05-27	4	f
3719	Grow	    4, 1, 3, 5	2018-07-14	0	f
3721	People	    Travel with Stacie\n    Visit with other travelers\n    	2018-07-14	7	f
3476	Church	    church service\n    connect with Ken Gathings	2018-05-27	4	f
3710	Grow	    4, 1, 3, 5	2018-07-17	0	f
3712	People	    Travel with Stacie\n    Visit with other travelers\n    	2018-07-17	7	f
3715	People	    Travel with Stacie\n    Visit with other travelers	2018-07-08	7	f
3713	Grow	    4, 1, 3, 4	2018-07-08	0	f
3716	Grow	    4, 1, 3, 5	2018-07-24	0	f
3717	Fun	    Travel Log: Day 17 - London 2\n        Breakfast at Bridge Inn\n        Laundry at Josiah's\n        Day at Kew\n            Train to Kew\n            Walk around Kew gardens\n            Sweltering heat\n            Walk to dinner\n            Lunch at Kew\n            Hot and dry\n            Low water in Thames\n            Bruised foot\n        Plan Imperial War Museum\n        Solitaire distraction to kill time\n        Walk to pub for dinner\n        14,000 steps\n        Better sleep\n        Hot and restless	2018-07-24	7	f
3718	People	    Travel with Stacie\n    Visit with other travelers\n    	2018-07-24	7	f
3726	Fun	    Travel Log: Day 8 - Nurenberg\n        Wake up in Nurenberg\n        Bus to city center\n        Nazi parade grounds on Zepplin Field\n        Medieval town\n        Courtroom 600/prison\n        Clock tower with animation\n        Lunch at sausage house\n        Switch tables to visit with New Yorkers\n        Nazi documentation center\n        Nazi arena overlook\n        Lecture about German politics\n        Sail from Nurenberg\n        Liars club entertainment\n        Port talk about Bamberg\n        6,000 steps	2018-07-15	7	f
3727	People	    Travel with Stacie\n    Visit with other travelers\n    	2018-07-15	7	f
3728	Grow	    4, 1, 3, 5	2018-07-18	0	f
3722	Grow	    4, 1, 3, 5	2018-07-23	0	f
3724	People	    Travel with Stacie\n    Visit with other travelers\n    	2018-07-23	7	f
3725	Grow	    4, 1, 3, 5\n    	2018-07-15	0	f
3730	People	    Travel with Stacie\n    Visit with other travelers\n    	2018-07-18	7	f
3733	People	    Travel with Stacie\n    Visit with other travelers\n    	2018-07-26	7	f
3736	People	    Travel with Stacie\n    Visit with other travelers\n    	2018-07-19	7	f
3478	Fun	    Dragonfly, Vikings	2018-05-26	3	f
3703	People	    Travel with Stacie\n    Visit with other travelers\n    	2018-07-25	7	f
2874	Hire	\n        implemented interviewer role in app\n        select each interview session (by candidate)\n        remove menu for interviewers\n        update skill selection pages\n        work on removing alert menu from banner\n        create interviewer mode and permissions 	2017-01-02	6	f
3704	Grow	    4, 1, 3, 5	2018-07-21	0	f
3470	People	    neighborhood picnic\n    Jim De Boo	2018-05-28	3	f
3472	Grow	    5, 2, 2, 2\n    nap	2018-05-27	1	f
2876	Grow	\n        think about social dysfunction\n        discuss business constraints with Stacie\n        4, 1, 3, 2	2017-01-02	3	f
2877	Fun	\n        Maze Runner II\n	2017-01-02	4	f
2875	Write	\n        update task history content	2017-01-02	1	f
3480	Grow	    3, 2, 3, 4	2018-05-29	0	f
3213	Grow	\n        sleepless night (I'm part of problem)\n        3, 2, 2, 3	2018-03-23	2	f
2878	Grow	\n        5, 1, 3, 2\n        Tribe of Mentors\n        Mini Habits\n        discuss personal retreat with Stacie	2018-01-01	2	f
2879	Teach	\n        build first three lessons for BACS 200\n        create standard lesson and ex layout	2018-01-01	4	f
2880	Tools	\n        automate all web page creation	2018-01-01	2	f
2881	People	\n        visit with Josiah\n	2018-01-01	6	f
2882	Grow	\n        pay parking ticket\n        4, 1, 3, 2\n        nts\n        think about commitments for 2018	2018-01-02	3	f
2883	Teach	\n        create Quiz #1\n        build class website\n        deploy and test	2018-01-02	3	f
3228	Fun	\n        Vikings, Madam Sec\n	2018-03-26	4	f
3229	Grow	\n        5, 3, 4, 2\n        nts	2018-03-27	3	f
3230	Church	\n        think about church leadership\n        build slides for meeting with Todd\n        discuss church contribution with Stacie	2018-03-27	3	f
3231	Tools	\n        create slide show generator\n        build core infrastructure logic	2018-03-27	4	f
125	Business	\n        Send out emails for book promotion\n        Review stats on Amazon  (Best Seller System Analysis & Design)	2016-02-11	3	f
126	Grow	\n        Quiet time	2016-02-11	1	f
130	Fun	\n        Scrubs, Arrow, Madam Sec\n	2016-02-12	4	f
3483	Fun	    ER, Martin & Short\n    nts 2	2018-05-29	6	f
3484	People	    Terry Scott at Coyote Grill	2018-05-29	2	f
3485	Church	    	2018-05-29	0	f
134	Church	\N	2016-02-14	4	f
3214	Teach	\n        Lesson 26 - Dev Tools\n        faculty meeting	2018-03-23	6	f
3215	Church	\n        meet with Todd	2018-03-23	2	f
3216	Fun	\n        Fraiser, Amazing Race, ER\n	2018-03-23	4	f
3737	Grow	    4, 1, 3, 5	2018-07-20	0	f
3217	Church	\n        habitat for Humanity	2018-03-24	7	f
3218	Grow	\n        nap\n        3, 2, 3, 5	2018-03-24	3	f
3219	People	\n        Pappa Murphy's 	2018-03-24	1	f
3220	Fun	\n        Vikings, Profit, Animal Planet\n	2018-03-24	3	f
3221	Grow	\n        5, 1, 2, 3\n        nap\n        time with Stacie\n        Fully Charged, Originals	2018-03-25	5	f
3222	Church	\n        Rachel D taught about photosynthesis\n        think about my role\n        notes on church process	2018-03-25	5	f
3223	People	\n        lunch at home	2018-03-25	1	f
3807	Grow	    4, 3, 2, 3\n    weight: 207.8	2018-08-09	0	f
3809	Tools	    reduce git repos (Php, Html, Python, Teaching)	2018-08-09	1	f
3810	Fun	    nts 2	2018-08-09	2	f
3861	People	    Hearth with Stacie\n    discuss finances and household projects	2018-08-20	4	f
3995	Teach	    200 Lesson 12 - testing, Brittney Dinsmore\n    350 Lesson 12 - solutions/Apache/exam\n    	2018-09-17	9	f
3857	Grow	    4, 3, 3, 3	2018-08-20	0	f
3860	Fun	    Dance, Profit\n    	2018-08-20	2	f
3691	Grow	    4, 1, 3, 5\n    	2018-07-27	0	f
3742	People	    Travel with Stacie\n    Visit with other travelers\n    	2018-07-11	7	f
3740	Grow	    4, 1, 3, 5	2018-07-11	0	f
3743	Grow	    4, 1, 3, 5	2018-07-12	0	f
3859	Tools	    	2018-08-20	0	f
3812	Business	    IRS forms for 2016/2017\n    Financial Review\n    discuss finances with Stacie	2018-08-09	2	f
3996	Fun	    Jack Ryan, Vikings\n    	2018-09-17	4	f
3994	Grow	    5, 2, 3, 4\n    weight: 208.4	2018-09-17	0	f
3862	Church	    Angel Flores	2018-08-19	3	f
1205	Write	\n        Facebook - read and post	2016-12-20	2	f
127	Fun	\n        Madam Sec, Last Man\n	2016-02-11	2	f
3226	Church	\n        meet with Todd at Chipotle\n        create ideas for discussion	2018-03-26	2	f
129	People	\n        Time with Stacie	2016-02-12	2	f
3225	Grow	\n        4, 2, 4, 3\n        review personal role at church	2018-03-26	2	f
3232	Fun	\n        Vikings, ER, Amazing Race	2018-03-27	3	f
131	Sign	\n        Build users script\n        Build notify script\n        Build chargify script\n        Investigate Mandrill email notifier\n        Investigate Chargify service logic\n        Meet with Tom to work on business requirements and design\n        Review all JIRA issues assigned to Mark\n        Create plan for resolving issues	2016-02-13	9	f
132	People	\n        Visit Fire & Ice Festival	2016-02-13	4	f
133	Fun	\n        Last Man\n    \n	2016-02-13	1	f
135	People	\n        Valentine's Day\n        Lunch with Rachel and Andrew\n        Fire & Ice Festival	2016-02-14	5	f
136	Fun	\n        Relax\n        Sherlock, Enterprise\n        Read AngularJS, Bootstrap\n	2016-02-14	5	f
137	Business	\n        daily plan\n        update time and tasks\n        Christine scans receipts\n        work hours\n        family finances\n        book stats (181 books sold)\n        setup music on iMac	2016-02-15	4	f
138	Sign	\n        setup iMac system\n            sublime text\n            Documents\n            node.js\n            brew\n            evernote\n            libreoffice\n            dropbox\n            keepass\n            source tree	2016-02-15	4	f
139	Grow	\n        Improve personal planning process\n        think about life\n        grapple with depression	2016-02-15	4	f
140	Fun	\n        try to watch Grammy Awards\n        watch Roosevelts\n	2016-02-15	2	f
3233	People	\n        Pelican Lakes\n	2018-03-27	1	f
4275	Grow	    5, 2, 3, 2\n    weight: 208.2	2018-11-23	0	f
3224	Fun	\n        Vikings\n        Shield, Amazing Race, Goldbergs        \n	2018-03-25	3	f
181	Church	\N	2016-02-28	3	f
198	Church	\N	2016-03-02	4	f
163	Grow	\n        Conceptual model for balanced project work\n        Weekly review of results	2016-02-23	2	f
164	People	\n        lunch with Stacie at Sand Bar	2016-02-23	2	f
165	Fun	\n        Heroes\n	2016-02-23	4	f
166	Sign	\n        Business on all three subsystems: Notifications, Registration, Payments\n        Testing on product code\n        Fix numerous problems with user registration and activation\n        Build unit tests to cover product (all three subsystems)\n        Debug user registration system\n        Figure out how to test Rest API\n        Restructure and clean up product code\n        Some unit testing is still in process\n        Some debug is still required before pushing the MVP-364 branch to master	2016-02-24	10	f
167	Church	\n        FPU\n	2016-02-24	4	f
168	WAM	\n        Debug issue with Domain transfer\n        Setup email records at GoDaddy\n        Debug issues at Wix\n        Test and setup email for notifications	2016-02-25	4	f
169	Sign	\n        write tests for MVP-364\n        work on user activation (new user record)\n        fix all application issues\n        merge code into master\n        prep for meeting\n        scrum meeting	2016-02-25	6	f
170	People	\n        Talk with Stacie	2016-02-25	1	f
171	Fun	\n        Grammys\n	2016-02-25	3	f
172	WAM	\n        setup email SMTP server for notifications\n        testing of email config\n        setup SMTP server for user email at GoDaddy\n        update plan for WAM 2.0 release\n        record all service provider information	2016-02-26	4	f
173	People	\n        Lunch at Garbanzos\n        talk with Stacie about business breakthrough	2016-02-26	3	f
174	Grow	\n        think about work and life balance	2016-02-26	3	f
175	Fun	\n        fix Marvel subscription\n        Amazing Race\n	2016-02-26	4	f
176	Sign	\n        write test plan for Sign\n        meet with Tom	2016-02-27	3	f
177	Business	\n        discuss financial tasks with Stacie\n        setup Personal Capital\n        read reviews for money software \n        connect to accounts: first tech, cap one, chase\n        get summary of money	2016-02-27	4	f
178	Grow	\n        work/life balance\n        organize evernotes	2016-02-27	2	f
179	Fun	\n        Madam Sec, Agent Carter\n	2016-02-27	5	f
180	Business	\n        organize Evernotes\n        figure out export from Evernote	2016-02-28	2	f
182	People	\n        Andrew & Rachel at Tres Margaritas\n        video with Josiah\n        Juan & Lynn over to house	2016-02-28	6	f
183	Grow	\n        walk around the park\n        time planning	2016-02-28	1	f
185	Business	\n        organize info\n        weekly review\n        create business objectives\n        Revenue Statement for Dec-March	2016-02-29	4	f
186	Sign	\n        Django user admin and password management	2016-02-29	2	f
187	WAM	\n        Follow up from meeting with WAM	2016-02-29	2	f
188	Church	\n        meet Todd for lunch	2016-02-29	1	f
189	Grow	\n        think about life	2016-02-29	1	f
190	Fun	\n        Chuck\n\n# Tasks History     March 2016\n\n\n## March Objectives 2016\n\n    * 160 billable hours in March & book April time \n    * Support WAM 2.0 & start on WAM 2.1\n    * Setup MVP for SignSpan\n    * File taxes\n    * Manage family budget through March\n\n    \n## Accomplishments\n	2016-02-29	4	f
191	Sign	\n        meet with Tom & Stacie about testing\n        investigate password management\n        create tests for change of password\n        meet with Brandon on user config\n        finish tests for new user config	2016-03-01	8	f
192	People	\n        Stacie, Rachel, Christine, Andrew attend Caucus	2016-03-01	4	f
193	Fun	\n        Mad Men\n        	2016-03-01	2	f
194	Sign	\n        create tests for email\n        research password validation\n        merge MVP-364 to master branch\n        investigate user administration solutions\n        test - user registers (request, activate)\n        test - change email (request, act)\n        test - change password (request, act)\n        test - notification send\n        merge code	2016-03-02	5	f
195	Business	\n        meet with Diane, Eric, Stacie\n        financial plan using info from Personal Capital	2016-03-02	2	f
196	WAM	\n        Work on SMTP config	2016-03-02	1	f
197	People	\n        lunch with Stacie @ Coyotes	2016-03-02	2	f
199	Sign	\n        write test plan\n        create outline of functional requirements\n        investigate user administration\n        investigate testing of Rest API\n        scrum meeting 	2016-03-03	6	f
200	WAM	\n        testing on SMTP setup\n        testing on WAM 2.0 code\n        create plan for deploying WAM 2.0	2016-03-03	2	f
201	Business	\n        setup categories for spending in Personal Capital\n        pay bills\n        review finances	2016-03-03	2	f
202	Fun	\n        Agent Carter, Iliad\n	2016-03-03	4	f
203	WAM	\n        import active data from WAM 1.2\n        create new view for successful submission of app\n        review logic for notifications\n        send message to user for information change\n        build new logic to change username, password, name, email\n        create test plan for acceptance testing\n        build new users on production site\n        remove old data from production system\n        testing on production server	2016-03-04	9	f
204	People	\n        dinner at Pelagrini	2016-03-04	2	f
205	Church	\n        leadership meeting	2016-03-04	2	f
206	Fun	\n        Iliad\n	2016-03-04	1	f
207	Business	\n        March budget\n        time and task planning\n        financial planning	2016-03-05	5	f
208	WAM	\n        fix print font size\n        fix sort of case list\n        fix wording on buttons	2016-03-05	1	f
159	Fun	\n        Heroes\n	2016-02-21	2	f
162	Sign	\n        Wrote progress report\n        Debug MySQL connection on iMac\n        Debug Services (sss)	2016-02-23	6	f
161	Fun	\n        Mad Men\n        Winter World\n	2016-02-22	4	f
211	Church	\N	2016-03-06	4	f
226	Church	\N	2016-03-09	4	f
215	Fun	\n        Tomorrow People\n        House of Cards\n	2016-03-06	3	f
218	Grow	\n        read about Discipline of Organizing\n        read God's Strategy in History	2016-03-07	2	f
219	Fun	\n        Flash\n	2016-03-07	4	f
220	WAM	\n        investigate and fix notification delivery	2016-03-08	2	f
221	Sign	\n        write confluence docs: \n            Team Schedule, Project Priorities, Job Assignments\n            Engineering Log, Project Coordination, DevOps\n        send email about new coordination docs\n        coordinate with Thomas on testing\n        attempt to debug new user activation (not yet successful)\n        get login info for EC2\n        explore AWS setup	2016-03-08	8	f
222	Fun	\n        Grammys, Amazing Race\n	2016-03-08	4	f
223	Business	\n        analyze expenses for Jan\n        create budget for Jan\n        create model for exceptions\n        calculate trip cost\n        visit bank for credit card info\n        download all Business VIsa statements	2016-03-09	5	f
224	WAM	\n        solve problem with notifications\n        plan releases and features 2.0.1 2.0.2	2016-03-09	3	f
225	Grow	\n        haircut\n        lunch at Senior Jalapenos\n        think about work/life balance	2016-03-09	2	f
227	Sign	\n        start on Debugging on Dev Portal doc\n        update JIRA request for SSH access\n        write Meetings doc\n        fix hostname in activation message\n        fix Response paths in server\n        merge Mark branch into master\n        work on getting new user API connection working properly\n        learn about Bamboo builds\n        create test view to fire for all notifications	2016-03-10	8	f
228	WAM	\n        fix issue with notifications on new app	2016-03-10	1	f
229	Fun	\n        House of Cards, Scorpion, Amazing Race\n	2016-03-10	5	f
230	Sign	\n        Meet with Thomas	2016-03-11	1	f
231	WAM	\n        update release plans for 2.0.1 and 2.0.2\n        gather and prioritize tasks from Stacie\n        add case number to all notifications\n        improve all notification code\n        build test harness of exercising code\n        display voters in voting view\n        fix issue with required fields	2016-03-11	8	f
232	Fun	\n        TV: Flash, Amazing Race\n	2016-03-11	5	f
233	Sign	\n        build command-line tool to work with user records\n        build functional test infrastructure\n        create scriptor to execute user commands\n        build out notification and payment interfaces\n        update code on master branch\n        build qt script for quick test loop\n        test scriptor commands for payments, users, notifications	2016-03-12	6	f
234	People	\n        Stacie to Republican caucus\n        Matt and Erin Fonken	2016-03-12	2	f
235	Fun	\n        Elementary, Scorpion, Shield, Madam Sec\n	2016-03-12	6	f
236	Church	\n        lunch with Jenifer and John Honeycutt	2016-03-13	6	f
237	People	\n        video with Josiah\n        Roots wine bar with food truck	2016-03-13	4	f
238	Fun	\n        TV: NCIS LA, \n        Cancel CBS All Access\n        House of Cards\n        read\n	2016-03-13	4	f
240	Fun	\n        Elementary\n	2016-03-14	6	f
241	Sign	\n        plan for integration day	2016-03-15	1	f
242	WAM	\n        build bookkeeper view of requests in voting\n        debug redacted info in views\n        solve problem of gathering form data\n        build search view\n        refactor view code\n        testing on staging server\n        assign milestones to all issues\n        investigate saving the data for notes during edit\n        clean up issues within code\n        fix mobile device display of edit fields	2016-03-15	9	f
243	Fun	\n        Carcassonne on Tablet\n        Winter World\n	2016-03-15	4	f
244	Business	\n        prepare tax records\n        calculate business expenses\n        work with Stacie to create records\n        update family budget	2016-03-16	10	f
245	Church	\n        FPU\n	2016-03-16	4	f
246	Sign	\n        propose idea of integration day\n        streamline todo list\n        ssh to dev\n        create dev script\n        create mac script\n        rsync deploy to dev\n        create run-ui script to launch portal\n        run ssp on iMac\n        commit changes to master\n        update engineering log and progress report\n        weekly Scrum	2016-03-17	9	f
247	People	\n        St Patricks party at Hiratas'\n	2016-03-17	5	f
248	Business	\n        meet with Dianne Alexander\n        gathered all finances files\n        organize paper files\n        summary of retirement plans and history\n        calculate ROI for investments	2016-03-18	8	f
249	People	\n        brunch at Greeley	2016-03-18	2	f
250	Fun	\n        House of Cards\n	2016-03-18	4	f
251	Sign	\n        run django scripts on iMac\n        create user commands for register and activate\n        create user command self test scenario\n        debug user registration sequence\n        solve migration problem with database\n        meeting with Tom and Thomas	2016-03-19	9	f
252	People	\n        Rachel hosts party for birthday\n        Watch Cassie for Rachel's party\n        visit with Josiah\n        Josiah and Sam visit from CO Springs	2016-03-19	2	f
253	Fun	\n        Winter World\n        X-Force\n    	2016-03-19	3	f
254	Church	\n        Rick Knable \n        Todd and Jenny (Rachel and Andrew) at Whiteout	2016-03-20	4	f
255	People	\n        Visit with Josiah & Sam	2016-03-20	8	f
210	People	\n        WeldWerks with Stacie\n        Play Carcasonne with Rachel & Andrew\n	2016-03-05	4	f
212	People	\n        Noodles with Andrew & Rachel	2016-03-06	1	f
214	WAM	\n        remove old data\n        fix minor bugs\n        write rollout plan\n        final testing on WAM 2.0	2016-03-06	3	f
217	Business	\n        develop better budget tools	2016-03-07	2	f
213	Grow	\n        take nap\n        budget work	2016-03-06	3	f
259	Sign	\N	2016-03-21	1	f
262	People	\N	2016-03-22	2	f
263	Fun	\N	2016-03-22	4	f
1245	Fun	\N	2016-12-31	4	f
265	Sign	\n        read Harry Percival's book\n        learn about creating embedded Functional Tests 	2016-03-23	3	f
266	People	\n        visit with Andrew and Rachel\n        cancel FPU for big snow\n        Stacie gets a cold	2016-03-23	2	f
267	Fun	\n        Father of Lights\n	2016-03-23	4	f
268	Sign	\n        meeting at 10:00\n        learn how to modify code on dev server\n        investigate invoking the UserAPI on the dev server from localhost\n        do iterative builds on dev server\n        investigate why builds were not triggering\n        debug password reset user flow\n        debug user activation user flow\n        scrum meeting\n        get new code for ssp\n        interactive testing of dev server (for faster dev loop)\n        learn about Bamboo for build and deploy\n        explore code on dev server	2016-03-24	8	f
269	Fun	\n        Shield, Psych	2016-03-24	4	f
270	Grow	\n        deal with frustration on SignSpan project\n        Stacie sick in bed\n\n	2016-03-24	2	f
271	Sign	\n        learn how to build automated functional tests\n        apply concepts from TDD with Python\n        build structure for Functional Tests, Unit Tests, Quick Test\n        plan out debug day on 3-28	2016-03-25	6	f
272	WAM	\n        turn on notifications by rebooting the server	2016-03-25	1	f
273	People	\n        grocery shopping with Stacie\n        dinner at Cables Pub	2016-03-25	4	f
274	Fun	\n        think about viewer app\n	2016-03-25	3	f
275	Grow	\n        update time & tasks\n        review last two weeks\n        work hours dashboard\n        budget dashboard\n        time dashboard\n        work on filing papers and clean up	2016-03-26	7	f
276	People	\n        go to library with Cassie\n\n	2016-03-26	7	f
277	Church	\n        Easter service\n        Passover meal in evening	2016-03-27	7	f
278	People	\n        lunch of Matsa ball soup\n        games with 13 guests\n	2016-03-27	7	f
279	Sign	\n        spent day with Tom on integration	2016-03-28	10	f
280	Church	\n        board meeting\n	2016-03-28	4	f
281	WAM	\n        discover issue with old PYC files\n        investigate updating to Django 1.9.4\n        update production server with new code\n        work with Stacie to debug the deployment issues	2016-03-29	8	f
282	Church	\n        worship team meeting	2016-03-29	4	f
283	Fun	\n        comic books\n	2016-03-29	2	f
284	Grow	\n        write Cost Model note\n        write Investments update (NW: 1.13)\n        login to Raymond James\n        write Work Goals note\n        discuss work issues with Stacie\n        work on personal issues	2016-03-30	6	f
286	Church	\n        FPU\n	2016-03-30	4	f
287	WAM	\n        investigate not being able to save notes\n        figure out how to save notes longer than 100 characters\n        create process for resetting the database\n        test database reset on staging\n        business planning for technology management	2016-03-31	8	f
288	Sign	\n        scrum meeting	2016-03-31	1	f
290	WAM	\n        build three test cycles: qt, ft, ut\n        create server script\n        invoke command tests from system_test\n        install git on Digital Ocean\n        automated deployment\n        recreate database on WAM\n        testing for WAM 2.0.3 deployment	2016-04-01	9	f
291	Fun	\n        House of Cards\n        Winter World\n	2016-04-01	5	f
292	Sign	\n        Work with Tom and Brandon	2016-04-02	9	f
294	People	\n        Janey Ball - reception\n	2016-04-02	2	f
295	Church	\n        interact with Darrell and his wife	2016-04-03	4	f
297	Grow	\n        sign up for PyCon tutorials\n        think through personal goals\n        late nap	2016-04-03	3	f
298	Fun	\n        Arrow\n	2016-04-03	2	f
299	Business	\n        review financial results\n        company meeting with Eric and Stacie\n        review projects with Eric\n        discuss taxes, receipts, ownership	2016-04-04	4	f
300	People	\n        lunch with Stacie and Eric at Sand Bar	2016-04-04	2	f
301	Fun	\n        Winter World\n        Arrow, Star Trek Enterprise\n	2016-04-04	8	f
302	Sign	\n        learn about Chargify\n        design for SignSpan payment system\n        think through workflows for:\n            register Chargify user account\n            setup payment\n            track status\n            email notifications\n            integration with portal\n        testing to production transition	2016-04-05	4	f
303	Grow	\n        read TDD with Python\n        learn about logger\n        experiment with functional tests	2016-04-05	4	f
304	Fun	\n        Winter World\n        House of Cards\n	2016-04-05	6	f
305	Sign	\n        create Chargify test page\n        design API connections for all workflows\n            register user\n            setup payment\n            track status\n        debug API calls\n        scrum meeting to present Chargify info	2016-04-06	5	f
306	Grow	\n        work on debugging scenarios	2016-04-06	3	f
307	Church	\n        last class of FPU	2016-04-06	4	f
308	Fun	\n        Chuck\n	2016-04-06	2	f
309	Business	\n        evaluate SignSpan business relationship\n        decide on offering 33% discount to Tom\n        discuss marketing ideas	2016-04-07	2	f
310	Sign	\n        fix issue with email links\n        try to test new code on production serve	2016-04-07	2	f
311	WAM	\n        create design pattern for upgrading Django to 1.9.4\n        create design pattern for management command scripts	2016-04-07	4	f
258	Business	\n        prepare talk for PyNoCo\n        present Best Practices talk at PyNoCo	2016-03-21	5	f
264	WAM	\n        Fix issue with saving notes\n        Improve search function\n        Allow bookkeeper to view closed case file (fix bug with Close)\n        Rewording on view\n        Display search view for correct users\n        Learn about postgres commands\n        Testing on staging server\n        Deploy 2.0.2 (b)	2016-03-23	5	f
260	People	\n        Austin's with Stacie\n        Late night talk with Josiah & Same\n	2016-03-21	4	f
318	Sign	\n        debug with Tom & Brandon\n        work on forgot password\n        work on register\n        work on activate\n        build code for Chargify integration	2016-04-09	7	f
316	People	\n        time with Stacie	2016-04-08	4	f
317	Fun	\n        virtual Saturday\n        My Big Fat Greek Wedding\n        visit Barnes and Noble\n	2016-04-08	6	f
319	People	\n        discuss money concerns with Stacie	2016-04-09	3	f
320	Fun	\n        Big Lebowski\n        Arrow\n	2016-04-09	4	f
321	Church	\n        church service\n        Darrell & Kaitlin	2016-04-10	5	f
323	Grow	\n        nap\n        time with God	2016-04-10	4	f
324	Fun	\n        Black List, Chuck\n	2016-04-10	4	f
325	Sign	\n        figure out URL redirect on success\n        create nine product pages\n        spin up dev server\n        push new code\n        test registration flow\n        debug on failing user registration	2016-04-11	6	f
326	Business	\n        review tax return\n        discuss money with Stacie	2016-04-11	2	f
327	Church	\n        Heidi and Tim Miller over for dinner	2016-04-11	4	f
328	Grow	\n        time with God\n        walk on Poudre river trail\n	2016-04-11	2	f
329	Sign	\n        verify that user record can be saved by posting existing JSON record\n        work on debugging process\n        document failure to add a new organization record	2016-04-12	3	f
331	Grow	\n        time with God\n        personal reflection	2016-04-12	2	f
332	Fun	\n        Battlestar Gallactica, Flash\n        Winter World\n	2016-04-12	4	f
2885	People	\n        Josiah, Sam, & Cassie leave	2018-01-02	2	f
335	People	\n        Todd at Coyotes\n        Grill and visit with Stacie	2016-04-13	2	f
336	Fun	\n        Battlestar Gallactica, Castles\n	2016-04-13	2	f
337	Sign	\n        scrum meeting 	2016-04-14	1	f
338	Business	\n        implement scriptor in hammer app\n        convert hammer app to 1.9.4\n        move command scripts to management commands	2016-04-14	4	f
341	Fun	\n        Chuck\n	2016-04-14	4	f
343	People	\n        Garcias to Hearth\n        offered to cover payoff of Christine's student loan	2016-04-15	4	f
344	Fun	\n        Battlestar Galactica\n	2016-04-15	2	f
345	Business	\n        update project planning (ToDo.md)	2016-04-16	2	f
346	Fun	\n        binge-watch Turn, Quantico\n	2016-04-16	12	f
347	Grow	\n        time with God\n        discuss fear of failure with Stacie\n        excerpts from Integrity\n        process personal growth issues\n        organize Brain\n        weekly review	2016-04-17	6	f
348	People	\n        lunch with Rachel at Egg & I\n        dinner with Stacie\n        meet with Josiah family	2016-04-17	4	f
349	Fun	\n        Quantico, Arrested Dev, Psych\n	2016-04-17	4	f
350	Sign	\n        coordinate with Tom on Chargify integration and setup\n        test user registration\n        build product configs in production Chargify account\n        fix issues with sandbox Chargify account\n        delete extra products in Sandbox\n        write and debug the dynamic URLs for Chargify plans\n        test complete path on user registration\n        implement simple logger\n        work on command-line django tools	2016-04-18	8	f
351	People	\n        time with Stacie	2016-04-18	2	f
352	Fun	\n        Quantico, Kimmy Schmidt, Last Man\n	2016-04-18	4	f
353	Sign	\n        meet with Tom to discuss Chargify integration	2016-04-19	1	f
354	Business	\n        FCIP\n        money management and planning\n        financial review with Will Tyschen\n        set goals for retirement\n        calculate retirement finances	2016-04-19	8	f
355	People	\n        lunch at Doug's Dinner in Loveland	2016-04-19	3	f
356	Fun	\n        Arrow\n	2016-04-19	2	f
358	Fun	\n        Madam Sec, SHIELD	2016-04-20	3	f
359	People	\n        BBQ\n        Rachel came over before work\n	2016-04-20	3	f
360	Sign	\n        scrum meeting (and follow up)	2016-04-21	1	f
362	Grow	\n        walk in park	2016-04-21	1	f
363	People	\n        Romas with Rachel	2016-04-21	3	f
364	Fun	\n        Winter World\n	2016-04-21	1	f
466	Business	\n        Business Partners Meeting\n        Prepare for meeting\n        Help with liability insurance app	2016-05-23	5	f
342	Tools	\n        copy ~/Projects/archive to iMac\n        build Hammer project from scratch\n        create Django app\n        create functional test framework\n        debug automation scripts\n        create document handling logic	2016-04-15	8	f
2884	Fun	\n        Crown	2018-01-02	2	f
3488	Grow	    5, 3, 4, 5\n    long walk	2018-05-30	1	f
334	Grow	\n        read Integrity\n        discuss SignSpan project with Stacie\n        middle of night prayer and reflection\n        walk to large lake	2016-04-13	4	f
361	Tools	\n        Better feedback for Scriptor errors\n        Refactor functional test code\n        Extend scriptor to deal with logs\n        raw document display\n        test for pandoc\n        URL routes for docs\n        load pages from template\n        format output using pandoc\n        page tester\n        build layout page for common look	2016-04-21	8	f
312	People	\n        visit with Stacie, Christine, Rachel\n        Rachel got a job with King Soopers	2016-04-07	1	f
3234	Grow	\n        5, 4, 3, 2	2018-03-28	0	f
322	People	\n        Josiah family	2016-04-10	1	f
313	Grow	\n        long walk to enjoy the beautiful day\n        Margarita's and grilling	2016-04-07	2	f
314	Fun	\n        Elementary\n        sign up for Hulu commercial-free\n	2016-04-07	3	f
376	People	\N	2016-04-25	1	f
384	Grow	\N	2016-04-27	1	f
404	Tools	\n        debug setting of styles in CSS\n        build tasks app in django\n        debug edit, add, and delete views\n        create reusable views\n        full user experience for tasks	2016-05-05	6	f
368	Fun	\n        Last man\n	2016-04-22	1	f
370	Grow	\n        night reading Nowen(nature,time,people)\n        discuss with Stacie	2016-04-23	4	f
373	People	\n        Wayne Ball heart attack\n        Potters to Breakfast Grill\n        Josiah and Same	2016-04-24	4	f
389	Tools	\n        create todo list tool\n        move doc.py, cmd.py, tool.py server.py to bin\n        scriptor help and command dispatch\n        pass all functional tests\n        convert server.py script\n        create tool/log.py & bin/log.py	2016-04-29	6	f
375	Fun	\n        Kimmy, Last man\n	2016-04-24	2	f
377	Grow	\n        think about life attitudes	2016-04-25	2	f
378	Fun	\n        Flash, Scrubs\n	2016-04-25	2	f
380	People	\n        pick up Lucy from airport	2016-04-26	4	f
381	Grow	\n        meditation and rest\n        blood draw for insurance\n        meet with Mike Hefty\n	2016-04-26	2	f
382	Sign	\n        add exception handling to all Rest API calls\n        implement organizational lookup\n        use existing organizations in registration\n        add URL routes for cancel, payment, \n        fix bugs in changeplan logic\n        fix bugs in changepassword API\n        test all API calls to support accounts page panels\n        streamline organization creation   	2016-04-27	7	f
383	People	\n        nice dinner with Lucy	2016-04-27	2	f
385	Fun	\n        Psych, Carcasone  \n	2016-04-27	4	f
388	People	\n        software training with Jackie\n        nice dinner with Andrew and Lucy\n        play Carcassone with Andrew\n	2016-04-28	5	f
390	Business	\n        clean up google password settings\n        cancel Aweber service\n        decide on investment strategy with Stacie\n        fix monthly,weekly,hourly\n        discuss money strategy with Stacie	2016-04-29	2	f
391	Fun	\n        investigate rcp\n        Turn, House of Cards, Mad Men\n	2016-04-29	6	f
393	Grow	\n        personal and spiritual growth\n\n# Tasks History     May 2016\n\n## May Objectives 2016\n\n    Portland Trip\n    Setup Personal Capital (1.3M, SEPP)\n    Disability insurance	2016-04-30	3	f
394	Church	\n        potluck	2016-05-01	6	f
395	People	\n        Stacie & Lucy to visit Mary\n        Josiah in England	2016-05-01	2	f
396	Grow	\n        think about life	2016-05-01	3	f
397	Fun	\n        Turn, House of Cards\n	2016-05-01	3	f
398	Grow	\n        monthly objectives\n        think through life goals	2016-05-02	2	f
400	People	\n        visit with Stacie & Lucy\n        dinner with Andrew and Rachel \n	2016-05-02	4	f
405	Business	\n        create project estimator\n        build 7 systems x 7 problems for project planning\n        discuss opportunities with Stacie\n        business query for OCR	2016-05-05	2	f
406	People	\n        talk to Greg McCutchen	2016-05-05	2	f
407	Fun	\n        Homeland\n	2016-05-05	4	f
467	WAM	\n        Add new fields to case data model: age, disabled, monthlyIncome, incomeSource\n        Extend import and export utilities\n        Perform data migration on staging server\n        Testing of new features	2016-05-23	4	f
468	People	\n        Time with Stacie	2016-05-23	2	f
379	Tools	\n        create remote_tests.py to test:\n            hostname\n            python and django version\n            pip list\n        test for pages on remote server\n        build simplest app on Digital Ocean single-click install\n        setup PyCharm to work with Hammer\n        setup git on remote server\n        deploy code using git	2016-04-26	8	f
386	Tools	\n        debug Hammer (simple site 1.9.4)\n        setup git on remote server\n        debug setup of simple.py\n        strip out extra files on remote server\n        improve remote command context\n        debug install of full app\n        pass remote_tests.py\n        deploy full app\n        rename app from django_project to hammer\n        create process for updating Django to 1.9.4	2016-04-28	6	f
399	Tools	\n        investigate stylesheets at HTML5UP\n        hook up CSS and static assets\n        create separate docs for each ToDo list (7 functional areas)\n        build document display logic for new style\n        create layout.html template\n        automatic test for collecting pages\n        simplify design of command scripts\n        move to aliases from scripts	2016-05-02	8	f
366	Grow	\n        walk in park\n        apply for disability insurance	2016-04-22	2	f
371	Fun	\n        Quantico, Amazing Race\n	2016-04-23	2	f
372	Church	\n        Todd featured Stacie & I in sermon	2016-04-24	4	f
401	Tools	\n        update project plan and documents\n        build basic test runner\n        create database entries for diff tests\n        calculate test output differences from expected\n        show all failing test results\n        build data script for save, load, migrate\n        restructure command aliases \n        approve current test output (using tlike)\n        develop data management scripts	2016-05-03	8	f
2888	Teach	\n        fix syllabus\n        deploy and test website\n        improve lessons 1-3\n        write Chris about FTP server	2018-01-03	3	f
367	People	\n        Forgotten Roots	2016-04-22	3	f
402	Fun	\n        Homeland\n	2016-05-03	6	f
374	Grow	\n        nap\n        night thinking: Nowen (nature, time, people)\n        write about Mind Renewal\n        Retirement budget	2016-04-24	4	f
403	Fun	\n        Quantico\n	2016-05-04	6	f
416	Church	\N	2016-05-08	4	f
441	Fun	\N	2016-05-14	3	f
443	Grow	\N	2016-05-15	2	f
463	Church	\N	2016-05-22	4	f
464	Tools	\n        Setup Gliffy for diagramming\n        Draw data model diagram	2016-05-22	2	f
2890	Grow	\n        sleep in\n        annual personal review\n        5, 1, 3, 5	2018-01-04	9	f
409	People	\n        think about Greg McCutchen\n        talk to Stacie about Mike, Greg, Oli	2016-05-06	2	f
2891	People	\n        time with Stacie\n        coaching interview for Stacie\n        anniversary celebration\n        discuss personal review time	2018-01-04	4	f
2892	Fun	\n        church history\n	2018-01-04	1	f
413	People	\n        learn about Josiah's London trip\n        think about Greg McCutchen\n        Write to Michael\n        Talk with Stacie	2016-05-07	3	f
414	Grow	\n        massive storm\n        haircut\n        think about life goals\n        time and task	2016-05-07	2	f
415	Fun	\n        1215 King John\n	2016-05-07	2	f
417	People	\n        talk with Stacie\n        facebook\n        Alberto's with Andrew and Rachel	2016-05-08	4	f
418	Grow	\n        nap	2016-05-08	2	f
419	Fun	\n        Scandal, Mad Men\n	2016-05-08	4	f
421	Business	\n        meet with Oli Hills	2016-05-09	2	f
422	People	\n        talk with Stacie\n        facebook	2016-05-09	1	f
423	Fun	\n        Scandal, Vikings\n	2016-05-09	3	f
424	Business	\n        controlling project scope\n        connect with people on LinkedIn\n        update project lists	2016-05-10	3	f
425	Sign	\n        solve issue with update payment details\n        debug SHA1 algorithm for creating API token\n        build code in Rest API to update plan	2016-05-10	5	f
426	People	\n        Stacie returns from SD trip\n        facebook	2016-05-10	2	f
427	Grow	\n        think about life goals\n        end of Flouracil treatments	2016-05-10	1	f
428	Fun	\n        lunch at Sol de Jalisco\n	2016-05-10	3	f
430	Grow	\n        meet with Mike Hefty on SEPP and transfer\n        gather Fidelity statement\n        decide on funds to transfer	2016-05-11	2	f
431	People	\n        Andrew and Rachel\n        Stacie to lunch at Sr Jalapeno	2016-05-11	2	f
432	Fun	\n        Agents of SHIELD\n	2016-05-11	2	f
434	Grow	\n        work on organizing brain\n        build new Evernote folders	2016-05-12	4	f
437	People	\n        help Jackie Garcia\n        Forgotten Roots with Julio & Jackie	2016-05-13	4	f
438	Fun	\n        read\n	2016-05-13	2	f
439	People	\n        time with Stacie	2016-05-14	2	f
440	Grow	\n        unplugged retreat	2016-05-14	9	f
442	Church	\n        neighboring	2016-05-15	4	f
444	People	\n        Ambrosia with Andrew & Potters\n        Greg & Kate McCutchen\n        Hearth with McCutchens\n	2016-05-15	8	f
445	Business	\n        meet with Greg McCuthchen to discuss opportunities	2016-05-16	7	f
446	People	\n        build connections with Greg	2016-05-16	2	f
448	Fun	\n        Arrow, Quantico\n	2016-05-16	3	f
449	WAM	\n        apply Hammer advancements to WAM	2016-05-17	8	f
450	Business	\n        attend meetup of FCIP	2016-05-17	5	f
451	People	\n        time with Stacie\n	2016-05-17	1	f
452	WAM	\n        debug scripting changes	2016-05-18	8	f
453	Business	\n        discuss Hire App with Stacie\n        pay bills	2016-05-18	2	f
454	People	\n        lunch with Todd\n        McCutchen (thanks & IoT)\n	2016-05-18	4	f
456	Grow	\n        Dentist	2016-05-19	2	f
457	Fun	\n        1/2 Price Paradise, SHIELD\n	2016-05-19	4	f
458	WAM	\n        Test production and staging servers\n        Create production.py\n        Setup django user & git\n        Set git deployment on production server\n        Push 203 code to production\n        Implement case clear command\n        Import all cases\n        Debugging of import script\n        Export SQL and CSV data from production\n        Add export code to production app	2016-05-20	9	f
459	Business	\n        business planning and marketing activities with Stacie\n        contact Tom & Eric about DevOps	2016-05-20	1	f
460	People	\n        Josiah and Garcias\n	2016-05-20	4	f
462	People	\n        Dinner at Fontas\n        Visit with Josiah clan\n	2016-05-21	8	f
465	People	\n        Mother's Day celebration (with everyone)\n	2016-05-22	8	f
469	Fun	\n        Arrow\n    	2016-05-23	3	f
433	Tools	\n        create new git project\n        create clone of Hammer for MyBook\n        move in old code from existing MyBook project\n        create project context\n        successful deployment to Digital Ocean\n        debugging of pandoc path\n        simplified MyBook business logic\n        debugging on new business logic\n        move across MyBook stylesheet	2016-05-12	8	f
436	Tools	\n        remove Aweber sign up off of Shrinking World\n        build notes for Hammer Core\n        build notes for Hammer Extension Apps\n        debug MyBook Apps\n        fix issues with CSS\n        separate different application demos\n        build extended page tester	2016-05-13	8	f
447	Tools	\n        learn about Edge of IoT\n        upgrade to Ubuntu 16.04	2016-05-16	2	f
461	Tools	\n        Build initial project plan\n        Understand business requirements\n        Draft essential data model\n        Setup Bootstrap theme with UX demo\n        Outline essential view structure\n        Initial draft of questions for interviews	2016-05-21	6	f
412	Business	\n        sign up for Personal Capital IRA (schedule funding meeting)\n        Shut down AWS server	2016-05-07	2	f
411	Sign	\n        cancel subscription\n        change plan\n        change payment	2016-05-07	5	f
473	Grow	\n        Preparation for PyCon trip	2016-05-24	2	f
504	Grow	\N	2016-06-08	2	f
505	Fun	\N	2016-06-08	4	f
508	Sign	\N	2016-06-09	1	f
512	Grow	\N	2016-06-10	1	f
636	Church	\N	2016-07-17	4	f
526	Tools	\n        review with Stacie\n        create hire app with Django\n        select Material theme\n        create simple view with Material\n        update project plan	2016-06-15	6	f
474	Church	\n        Vineyard board meeting\n	2016-05-24	4	f
475	Grow	\n        Leave for PyCon (drive to Brigham City)\n        listen to Blue Highway\n	2016-05-25	14	f
476	Grow	\n        Appendectomy Surgery\n	2016-05-26	14	f
477	Grow	\n        Check out of hospital\n        1st day after surgery\n	2016-05-27	14	f
478	Grow	\n        Drive to Boise\n        Heal & rest\n        Sleep\n	2016-05-28	14	f
479	Grow	\n        Think through life issues and motivations\n        Start reading Good Soil\n        Shower	2016-05-29	4	f
480	Church	\n        Boise Vineyard	2016-05-29	3	f
481	People	\n        Sockeye Brewery with Stacie\n        The Counter\n        Visit with Hunts	2016-05-29	4	f
482	Fun	\n        Captain America - Civil War\n	2016-05-29	3	f
483	Grow	\n        Read Good Soil (intro)\n        Think about life transitions	2016-05-30	8	f
484	People	\n        Learn about making beer from Gary\n        Meals together\n        Watch YouTube together\n        Joel for dinner\n	2016-05-30	6	f
485	Grow	\n        Start reading Revolutionary Leadership\n        Rest\n        Walk to library	2016-05-31	7	f
486	People	\n        visit with Hunts\n\n# Tasks History     June 2016\n\n## June Objectives 2016\n\n    Music festival\n    21 days of Personal Transformation\n\n    \n## Accomplishments\n	2016-05-31	7	f
487	Grow	\n        heal from surgery\n        walk around neighborhood	2016-06-01	7	f
488	People	\n        Carcassone\n        visit with Hunts\n	2016-06-01	7	f
489	Church	\n        meet with Boise Vineyard pastors (Jesse, Ian)\n        attend I61 meeting	2016-06-02	6	f
490	People	\n        board game: Japanese travel game\n        Boise Fry company\n	2016-06-02	8	f
492	Grow	\n        enjoy Blue Highway book\n        drive from Boise to DuBois\n        picnic at Craters of the Moon\n        dinner at Genvieve's in Jackson        \n	2016-06-04	14	f
493	People	\n        drive from DuBois to Windsor\n        finish Blue Highway	2016-06-05	12	f
495	WAM	\n        fix issue with age default\n        build export for legacy records\n        verify import of case records\n        test and fix the features in WAM 2.0.3\n        solve problem of importing users\n        work on database auto-increment during case import	2016-06-06	8	f
496	Church	\n        think about church involvement	2016-06-06	2	f
497	Grow	\n        Personal Transformation	2016-06-06	2	f
498	Fun	\n        Flash, Good Bad Ugly\n	2016-06-06	2	f
499	Business	\n        retrospective on WAM 2.0 project\n        build ideal project template\n        build project plan for Hire app\n        tie up loose ends & follow up with marketing contacts\n        contact Oli Hills & schedule meeting	2016-06-07	4	f
500	WAM	\n        new export of legacy records from production\n        import users from production system\n        pass all tests\n        fix issue with age setting on form submit\n        update code on staging	2016-06-07	4	f
501	Grow	\n        resolve misc biz issues\n        LTC interview\n        Net Worth > 1.8 M	2016-06-07	4	f
502	People	\n        Andrew flagged for medicare fraud\n	2016-06-07	2	f
506	Business	\n        meet with Oli to discuss project (tech difficulties)\n        discuss working with Oli\n        attend Healthcare group at Innosphere	2016-06-09	4	f
509	Fun	\n        Amazing Race, Chuck\n\n	2016-06-09	3	f
510	Business	\n        project plan for Oli\n        project plan for Hire	2016-06-10	6	f
511	WAM	\n        production roll for 2.0.3	2016-06-10	3	f
513	Fun	\n        Fixer Upper, Librarians\n	2016-06-10	4	f
514	Fun	\n        Greeley Blues Jam	2016-06-11	13	f
515	Grow	\n        quiet time\n	2016-06-11	1	f
516	Church	\n        Todd & Jenny in Mexico	2016-06-12	4	f
517	People	\n        pick up Lucy in Fredrick\n        Nardins visit\n        Rio with Stacie	2016-06-12	8	f
518	Grow	\n        quiet time\n	2016-06-12	2	f
519	Business	\n        build development project template and timetable\n        project proposal for Oli Hills\n        meet with Oli Hills\n        project proposal for Mike Kobneck\n        investigate product definition of Harbinger Board	2016-06-13	8	f
520	People	\n        dinner together	2016-06-13	1	f
521	Grow	\n        walk around park\n        quiet time\n        Boise Vineyard	2016-06-13	3	f
522	Fun	\n        Carcassone\n	2016-06-13	2	f
523	Sign	\n        implement delayed cancel behavior\n        implement notifications for six new conditions\n        review Mandrill templates	2016-06-14	8	f
524	Business	\n        meet with Mike Kobneck\n        discuss potential clients with Stacie	2016-06-14	2	f
525	Fun	\n        Mad Men, House of Cards\n	2016-06-14	4	f
527	Grow	\n        organize goals	2016-06-15	2	f
528	People	\n        breakfast with Nardins\n        discussions with Stacie	2016-06-15	3	f
529	Fun	\n        Librarians\n        	2016-06-15	3	f
635	Grow	\n        sort out business issues\n	2016-07-16	3	f
1365	Fun	\n        Dragonfly\n	2017-02-12	2	f
503	Tools	\n        improve vc command\n        consolidate shell variables\n        update task command\n        prune old tests\n        streamline command automation	2016-06-08	8	f
472	Sign	\n        notifications\n        cancelation workflow	2016-05-24	2	f
3235	Teach	\n        grade Blog 4\n        Lesson 28 - UI Widgets	2018-03-28	7	f
554	Fun	\N	2016-06-22	1	f
558	Fun	\N	2016-06-23	3	f
573	Fun	\N	2016-06-29	3	f
3238	Fun	\n        Vikings, Flash\n	2018-03-28	3	f
531	People	\n        dinner with Lucy, DeDee and Suzie	2016-06-16	2	f
532	Grow	\n        quiet time\n        walk	2016-06-16	1	f
3237	People	\n        Rachel is pregnant	2018-03-28	3	f
533	Fun	\n        x-Force\n        	2016-06-16	3	f
536	People	\n        Rachel's curtains (first attempt)\n        dinner at Cazadores\n        Lucy has problems with temp crown	2016-06-17	4	f
537	Fun	\n        Psych, Librarians\n	2016-06-17	2	f
539	People	\n        Josiah & Sam visit\n        Kentucky Fried Chicken\n        Ice cream at Nana Bee's	2016-06-18	8	f
540	Grow	\n        nap\n	2016-06-18	2	f
541	Church	\n        Father's Day\n        everyone at church\n        discussed church building sale and finances	2016-06-19	6	f
542	People	\n        Father's Day\n        Julio, Andrew, Josiah clans\n        campfire on patio	2016-06-19	6	f
543	Grow	\n        nap\n	2016-06-19	2	f
545	People	\n        saw lady catch a fish	2016-06-20	3	f
546	Fun	\n        rip Davy Knowles cds\n	2016-06-20	3	f
547	WAM	\n        create Agency data model\n        create Agent data model\n        create script to add and list existing agencies\n        create script to add and list agents\n        create list of current Agencies in WAM\n        decide on strategy for creating Agency records in WAM 2.1\n        build UI for showing Agency list\n        extend agency and agent tests	2016-06-21	8	f
548	People	\n        Theo's gyros	2016-06-21	2	f
549	Grow	\n        hook up fitbit	2016-06-21	2	f
550	Fun	\n        setup pandora\n	2016-06-21	2	f
551	WAM	\n        extract agencies used in existing cases\n        create script to correct agency names\n        apply correction map to agency names\n        list names of agents from case files\n        create script to correct agent names\n        build Agency objects for 46 Agency\n        work on structure of Agent information in database\n        rebuild database on dev	2016-06-22	8	f
552	People	\n        Noodles with Andrew,Rachel,Lucy\n        Hang curtains at Rachel's 	2016-06-22	4	f
553	Grow	\n        walk\n        use fitbit	2016-06-22	1	f
555	WAM	\n        decide on Agents for historical cases\n        discuss WAM 2.1 design constraints with Stacie\n        testing on macbook\n        rebuild user reset, user import, and user export\n        build agency csv, list, import, export\n        create tests for agency script\n        UI to create agencies and agents\n        test all new logic	2016-06-23	8	f
556	Sign	\n        meeting with team	2016-06-23	1	f
557	People	\n        last night with Lucy	2016-06-23	2	f
559	WAM	\n        create cards using dictionary of data elements\n        refactor all view code\n        switch from case data for agencies and agents to database records\n        build panes for Case listing\n        build logic to show selected case\n        build logic to display one agency\n        solve problem of interface modality\n        testing of all new logic	2016-06-24	8	f
560	Fun	\n        drive to Winter Park\n	2016-06-24	6	f
561	Fun	\n        Blues from the Top\n	2016-06-25	14	f
562	Fun	\n        Blues from the Top	2016-06-26	13	f
563	Grow	\n        destroy wasp nests\n	2016-06-26	1	f
564	WAM	\n        automatic task selector\n        goal space brainstorm\n        update project plan\n        setup src script to manage source updates\n        move log to tool\n        manage connections between projects\n        create source compare tool	2016-06-27	8	f
565	Grow	\n        Good Soil\n        register for Leadership conference\n        prayer time\n        write about personal transformation\n        walk	2016-06-27	4	f
566	People	\n        BBQ with Stacie\n        clean up wasp nests\n	2016-06-27	2	f
567	WAM	\n        build general menu tool\n        create unified agency portal HTML file\n        build cards using JSON data\n        add tool directory to W2W project\n        create page tester\n        debug page master\n        track expected text from pages	2016-06-28	8	f
568	Business	\n        Darci marketing discussion\n        Discuss business strategy with Stacie	2016-06-28	2	f
569	Fun	\n        Chuck	2016-06-28	3	f
570	Grow	\n        walk\n	2016-06-28	1	f
571	WAM	\n        review high-level design with Stacie\n        apply pink color to interface\n        redesign menu structure\n        redesign view structure and workflow\n        define new URLs\n        implement new menu structure\n        build 16 unique views\n        test and debug	2016-06-29	8	f
572	Grow	\n        night prayer	2016-06-29	3	f
574	WAM	\n        experiment with introspection for finding tests\n        build automatic test runner\n        save results in Test records\n        commands to approve unexpected test results\n        debug test infrastructure\n        manage all tests for WAM 2.1\n        expand available tests\n        update design documents to reflect new thinking	2016-06-30	8	f
575	People	\n        PB & Potts	2016-06-30	2	f
576	Grow	\n        night prayer	2016-06-30	1	f
577	Fun	\n        X-Men Apocalypse\n\n\n\n# Tasks History     July 2016\n\n## July Objectives 2016\n\n    Finish WAM 2.1\n    Study Good Soil\n\n    \n## Accomplishments\n	2016-06-30	3	f
637	People	\n        Josiah & Sam visit\n        BBQ \n        hear about Discover conference\n        walk to park	2016-07-17	8	f
638	Grow	\n        nap\n	2016-07-17	2	f
639	Business	\n        prepare for meeting\n        leadership meeting	2016-07-18	3	f
534	Tools	\n        build generalized app structure\n        create general UI driven with cards\n        build out MyBook apps with new UI design\n        create general template for Hire app	2016-06-17	4	f
538	Tools	\n        work on building views based on cards\n        prototype of object list and details\n        think through issues of generic views (LEADS)\n        work on view structure and behavior	2016-06-18	4	f
2889	People	\n        anniversary celebration on Westminster Westin\n        dinner at Scalottos\n    	2018-01-03	7	f
581	People	\N	2016-07-02	2	f
585	Church	\N	2016-07-03	4	f
3239	Grow	\n        nts\n        5, 4, 4, 2	2018-03-29	3	f
594	Grow	\N	2016-07-05	1	f
595	People	\N	2016-07-05	1	f
596	Fun	\N	2016-07-05	3	f
599	People	\N	2016-07-06	1	f
600	Grow	\N	2016-07-06	1	f
603	Grow	\N	2016-07-07	2	f
604	People	\N	2016-07-07	2	f
607	People	\N	2016-07-08	1	f
608	Grow	\N	2016-07-08	2	f
611	People	\N	2016-07-09	2	f
624	People	\N	2016-07-13	1	f
625	Grow	\N	2016-07-13	1	f
626	Fun	\N	2016-07-13	4	f
3240	Write	\n        Managing Expectations	2018-03-29	2	f
579	Church	\n        leaders meeting at Beilman's	2016-07-01	5	f
580	Grow	\n        night prayer\n	2016-07-01	1	f
610	Tools	\n        implement page tests\n        build out spiritual things site\n        think of new project ideas\n        create collab logic	2016-07-09	4	f
582	Grow	\n        create dream box (with daily suggestion)\n        enjoy lakeside view\n        sleep in\n        wasps	2016-07-02	2	f
583	Fun	\n        read\n	2016-07-02	10	f
586	People	\n        Qboba with Andrew, Rachel, Christine	2016-07-03	4	f
587	Grow	\n        walk/ride with Stacie\n        Good Soil\n	2016-07-03	4	f
589	People	\n        July 4th celebration at Garcia's\n        nap	2016-07-04	6	f
590	Grow	\n        long walk/ride with Stacie\n        Good Soil\n        wasps	2016-07-04	2	f
591	Fun	\n        The Librarian 1\n	2016-07-04	4	f
592	Sign	\n        meet with Tom 	2016-07-05	1	f
2887	Grow	\n        5, 1, 3, 3\n        Project Phases\n        Learn - project wish list\n        Tools - project wish list\n        Writing - project wish list	2018-01-03	4	f
598	Business	\n        meet with Greg McCutchen	2016-07-06	2	f
601	Fun	\n        The Librarian 2\n	2016-07-06	2	f
602	WAM	\n        filter queries by agency\n        debug views to match business requirements\n        refactor tests to remove duplication\n        fix failing tests\n        update text in views\n        show unique menu items for manager, agent, and director\n        require authentication to see agency pages\n        test page restrictions	2016-07-07	8	f
605	Fun	\n        Young Indie\n	2016-07-07	2	f
609	Fun	\n        Zootopia\n	2016-07-08	3	f
612	Grow	\n        long walk (dog park, library)	2016-07-09	3	f
613	Fun	\n        read\n        RED\n	2016-07-09	5	f
614	People	\n        El Cielo with Andrew, Rachel, Christine\n        discuss life with Stacie	2016-07-10	3	f
615	Church	\n        Cables Pub with Beilmans	2016-07-10	7	f
616	Grow	\n        watch PyCon videos\n        read Good Soil\n        think about life goals\n	2016-07-10	4	f
618	WAM	\n        baseline testing\n        refactor view logic for agency views\n        debug all views\n        test all code\n        start work on request submission form\n        build logic for permission rules based on roles\n        fix page redirects\n        bind all cases to an agency\n        create better list of cases (by status)\n	2016-07-11	8	f
619	Fun	\n        Quantico\n        Bridge of Spies\n	2016-07-11	4	f
620	WAM	\n        deploy to staging\n        interactive testing on staging\n        restructure top banner of WAM Agency Portal\n        update menu selections\n        implement logic for case and view selection based on role\n        create new submission form for requests\n        create templates for each page type\n        move templates to w2w	2016-07-12	9	f
621	Grow	\n        walk	2016-07-12	2	f
622	Fun	\n        Amazing Race\n        Quantico\n	2016-07-12	3	f
623	WAM	\n        update project task list\n        discover and investigation server malfunction at Digital Ocean\n        add demographics to report\n            city\n            ethnicity\n            amount awarded\n            category\n            submitting agency\n            disability\n            monthly income\n            age\n        rework configuration of test users	2016-07-13	8	f
627	WAM	\n        Setup Christine on Issue tracking\n        Log initial issues list (16 open issues)\n        Coordinate with Stacie on issue tracking\n        Extend test plan for Agency Portal\n        Fix 57 United Way Agency info\n        Fix 56 Active Requests not showing\n        Fix 58 Super User view all\n        Fix 51 Button for List of Agencies	2016-07-14	8	f
628	Sign	\n        meet with Thomas about testing payment system\n        weekly Scrum	2016-07-14	2	f
629	People	\n        Palaminos with Stacie's Banner friends\n    	2016-07-14	4	f
630	WAM	\n        test agency pages using Selenium\n        build page grabber script\n        investigate Digital Ocean access issues\n        streamline deploy to staging server\n        improve automation for code release\n        separate out data sets for each server\n        improve automatic tests	2016-07-15	8	f
631	Sign	\n        meet with Thomas for training on chargify.py script\n        define test approach 	2016-07-15	2	f
632	People	\n        Rio & Tea House with Balls\n	2016-07-15	4	f
633	Sign	\n        setup discount codes on Chargify\n        meet with Brandon on remaining code issues\n        write progress report for Tom	2016-07-16	3	f
634	People	\n        Stacie's birthday	2016-07-16	8	f
588	Tools	\n        create generic views\n        build doc structure	2016-07-04	2	f
597	WAM	\n        create test users\n        deploy on staging server\n        add logic to suppress test notifications (check recipient & server)\n        expand tests\n        think about acceptance test planning\n        rebuild staging database\n        assign Agency to every case\n        add icons to page navigation menu	2016-07-06	8	f
617	Tools	\n        Build out collaborator docs\n        Setup Front-end, Back-end, Test, Automation	2016-07-11	2	f
644	People	\N	2016-07-19	3	f
645	Grow	\N	2016-07-19	2	f
646	Fun	\N	2016-07-19	1	f
682	Tools	\n        create viewer project from scratch\n        Initiate development of Viewer project\n        setup VirtualEnv for Python 3.4\n        create project context\n        create git Repo\n        create PyCharm project\n        create project goals\n        create project milestones\n        create budget	2016-07-30	6	f
681	Fun	\N	2016-07-29	3	f
685	Tools	\n        Build comm system automation\n        Add document selections\n        Hook up spiritual things email	2016-07-31	2	f
2896	People	\n        breakfast with Stacie in Westminster\n        travel home\n	2018-01-05	4	f
2897	Grow	\n        5, 2, 3, 2\n        nts\n        Tools agenda	2018-01-06	3	f
2898	Write	\n        outline Personal Review\n        outline Thinking Patterns	2018-01-06	3	f
3496	Fun	    Anthony Bordain	2018-05-31	4	f
641	People	\n        lunch at Pelican lakes	2016-07-18	2	f
642	Fun	\n        Quantico & Amazing Race\n	2016-07-18	5	f
662	Tools	\n        build email sender\n        create vision for general purpose sending system\n        create Informant project plan	2016-07-24	3	f
647	WAM	\n        fix report and agency menu items\n        build reports with Date Range\n        build search view for agencies \n        solve issues with editing\n        fix issues with redirects\n        fix issue with permission for agency list\n        fix new button in WAM 2.0 	2016-07-20	8	f
648	Sign	\n        review progress with Tom	2016-07-20	1	f
650	People	\n        discuss business with Stacie\n        Shrinking World salary idea	2016-07-20	2	f
651	Fun	\n        The Librarian: Curse of Chalice\n	2016-07-20	2	f
653	WAM	\n        review progress on WAM with Stacie\n        create roll-out plan	2016-07-21	2	f
654	Grow	\n        10000 Steps!	2016-07-21	2	f
655	Fun	\n        Star Trek Movie\n	2016-07-21	4	f
656	WAM	\n        Review all open issues\n        Fix 64 new cases should go to active\n        Fix 69 remove autofill on form\n        Fix 65 title on hold cases view\n        Fix 45 Editing of cases on hold\n        Fix 67 hide edit for archived cases\n        Fix 49 Manager can edit all cases\n        Fix 72 post upgrade message on production\n        Fix 48 Notify new agents	2016-07-22	8	f
657	People	\n        discuss politics and kingdom dynamics with Stacie\n        discuss invoicing on W2W project	2016-07-22	3	f
658	Grow	\n        think about inspiration\n	2016-07-22	3	f
659	People	\n        grocery shopping	2016-07-23	3	f
660	Grow	\n        sleepless night	2016-07-23	3	f
661	Fun	\n        Bourne Movies (3)\n        	2016-07-23	8	f
664	People	\n        Andrew & Rachel	2016-07-24	4	f
665	Grow	\n        walk	2016-07-24	1	f
666	Fun	\n        read\n	2016-07-24	2	f
668	Grow	\n        depression\n 	2016-07-25	6	f
2895	Fun	\n        experiment with headphones\n        Crown, Legends	2018-01-05	4	f
671	Grow	\n        depression\n	2016-07-26	2	f
672	WAM	\n        Fix 74 menu does not display\n        Fix 77 agency menu not highlighting\n        Fix 76 denied menu not highlighting\n        Fix 75 denied menu not highlighting\n        Fix 73, 53 Notes to Agency\n        Fix 66 lost fields during edit\n        Fix 80 case in hold gets error message\n        create test user.csv for staging server\n        Fix input buttons on forms\n        Fix numbering of cases 	2016-07-27	9	f
673	Church	\n        baptism	2016-07-27	4	f
674	Grow	\n        wake up at 3:00 and cannot sleep\n	2016-07-27	1	f
675	Sign	\n        Scrum meeting	2016-07-28	1	f
677	People	\n        dinner at Palominos\n        Amber cleaning	2016-07-28	2	f
678	Grow	\n        hear from God about how I measure success\n        talk with Stacie\n	2016-07-28	3	f
679	Sign	\n        test cancel through UI on dev server\n        met with Thomas to work on testing the payment system\n        interactive testing on the dev server for cancel\n        coordinate test process of cancel testing\n        create user tool for Dev, Production, QA\n        create chargify tool for Production\n        gather user info from Dev, Production, QA\n        solve problem with Auth key\n        write progress report	2016-07-29	9	f
680	People	\n        talk with Stacie	2016-07-29	2	f
683	People	\n        lunch at Rodizio grill\n        Andrew offered day shift	2016-07-30	4	f
684	Fun	\n        Ghostbusters\n	2016-07-30	4	f
686	Church	\n        potluck	2016-07-31	5	f
687	People	\n        fun with Stacie	2016-07-31	3	f
688	Grow	\n        bike ride (first in years, through the golf course)	2016-07-31	1	f
689	Fun	\n        Winter of the World\n# Tasks History     August 2016\n\n## August Objectives 2016\n\n    Hammer Showcase application build out\n    Josiah and Sam visit\n\n    \n## Accomplishments\n	2016-07-31	3	f
690	WAM	\n        Investigate password reset\n        Add password change form\n        Set password when creating agents\n        Password change form\n        Design workflow for registration\n        Send agency signup to program directors\n        Workflow for registration\n        Fix agent notification\n        Send actual password	2016-08-01	8	f
652	Tools	\n        break out Hammer-Documents repo\n        change all tools to use new repo\n        design task codes\n        debug ssh connections for all computers\n        debug issues with style on websites\n        simplify logging facility	2016-07-21	6	f
670	Church	\n        board meeting	2016-07-26	4	f
676	Tools	\n        work at Farr library\n        Implement hammer_page\n        Update hammer_theme and hammer_doc\n        Deal with redirect for directories\n        Build better doc display and start on client portal\n        Improve spiritual layout\n        Build new template files for theme demo\n        Fix responsive design\n        Bring back new doc formatter\n        Update Hammer theme	2016-07-28	8	f
714	Fun	\N	2016-08-08	2	f
741	Fun	\N	2016-08-17	3	f
734	Tools	\n        fix console prompt\n        test todo command\n        extend hourly script to send my todo list and spiritual email\n        move Today, 2016-08 docs\n        review structure of documents\n        plan web presence baseline\n        deploy and test new docs and code\n        test for web presence baseline\n        test domain root pages	2016-08-16	7	f
738	Tools	\n        save test results from each test run\n        clean all docs in tree	2016-08-17	6	f
2899	People	\n        Rick Tenuta funeral\n        talk with Stacie	2018-01-06	4	f
2900	Fun	\n        Hobbit \n        newspaper\n	2018-01-06	4	f
3236	Tools	\n        limit task history to one month	2018-03-28	1	f
3498	Church	    	2018-05-31	0	f
3997	People	    Christine insurance drama\n    grilled chicken	2018-09-17	1	f
692	People	\n        lunch with Stacie at Romas\n	2016-08-01	2	f
695	People	\n        bike ride with Stacie	2016-08-02	2	f
696	Grow	\n        sleepless night\n	2016-08-02	2	f
711	Tools	\n        debug page redirects\n        extract common menu function \n        improve page logging\n        consolidate view logic	2016-08-08	4	f
697	People	\n        drive to CO Springs\n        lunch with Josiah family at Tuscanos\n        bring Cassie to Windsor\n	2016-08-03	14	f
699	Sign	\n        scrum meeting\n        newline meeting	2016-08-04	2	f
700	People	\n        watch Cassie\n        Stacie met with Agency reps for WAM\n	2016-08-04	8	f
702	People	\n        Cassie visit library\n	2016-08-05	6	f
703	Sign	\n        meeting with Tom to work on Chargify	2016-08-06	1	f
704	People	\n        Josiah's farewell party\n        party visits house\n        Andrew \n        get pizza	2016-08-06	9	f
705	Grow	\n        think about life	2016-08-06	2	f
706	Fun	\n        Winter World\n	2016-08-06	2	f
708	Church	\n        Josiah & Sam\n        improve Spiritual Things web site	2016-08-07	5	f
709	People	\n        El Cielo with Josiah clan\n        boat ride with Cassie	2016-08-07	4	f
710	Fun	\n        Uncanny X-Men\n	2016-08-07	2	f
712	Sign	\n        start up dev server\n        run through registration scenarios\n        revert code to test registration\n        work on Payment Gateway error	2016-08-08	4	f
713	People	\n        bike ride with Cassie\n        Stacie and Cassie go swimming\n        Josiah & Sam closing apartment in CO Springs	2016-08-08	4	f
716	Business	\n        Greg McCutchen & Josiah	2016-08-09	4	f
717	People	\n        boat ride with Cassie\n        visit with Josiah & Same\n	2016-08-09	4	f
718	People	\n        family photo shoot\n	2016-08-10	5	f
719	Sign	\n        scrum meeting	2016-08-11	1	f
720	Grow	\n        GLS	2016-08-11	8	f
721	People	\n        Johnny Carinos with Josiah & Cassie\n	2016-08-11	5	f
722	Grow	\n        GLS	2016-08-12	9	f
723	People	\n        Josiah & Sam leave	2016-08-12	2	f
724	Fun	\n        Half-blood Prince\n	2016-08-12	3	f
725	Business	\n        Greg McCutchen	2016-08-13	8	f
726	Grow	\n        purchase Present Over Perfect, 4DX	2016-08-13	2	f
727	Fun	\n        Deathly Hallows I & II\n	2016-08-13	4	f
728	Fun	\n        TV - Mormon movie\n	2016-08-14	4	f
729	WAM	\n        Release Plan for WAM 2.1.0\n        Capture all production data\n        Load data on staging server\n        Fix all agency data on staging server\n        Fix redirect to new page\n        Final testing on staging server\n        Reload production database\n        Final testing on production database\n        Support Stacie in Program Directors training	2016-08-15	9	f
730	People	\n        discuss WAM project with Stacie	2016-08-15	1	f
731	Grow	\n        think about life	2016-08-15	1	f
732	Fun	\n        Mad Men, Fixer upper\n	2016-08-15	3	f
733	WAM	\n        Follow up on release issues\n        Fixes issues found during release 	2016-08-16	2	f
735	People	\n        time with Stacie\n        dinner at PF Chang's\n        discuss SWS business	2016-08-16	4	f
736	Fun	\n        AVX\n	2016-08-16	1	f
737	WAM	\n        Document Production Release Process\n        Document shell tricks for maintenance of WAM on production server	2016-08-17	2	f
739	People	\n        discuss volunteer work with Boise Vineyard	2016-08-17	1	f
740	Grow	\n        develop personal scorecard\n        work with tags in brain\n        organize articles in brain\n        walk to Sr Jalapeno to lunch	2016-08-17	2	f
742	WAM	\n        work on support issues for Joe Ortiz\n        investigate notifications on new cases\n        investigate handling of dates on different browsers\n        review system logs on production\n        do not allow notifications on staging\n        fix date formatting issue	2016-08-18	6	f
743	Sign	\n        outlined work for Geoff\n        create doc to help get Geoff set up\n        scrum meeting\n        help Thomas with shell scripts on dev	2016-08-18	4	f
744	People	\n        Rachel got bad news about her school schedule and work\n        Rachel and Andrew for dinner	2016-08-18	2	f
745	Grow	\n        ideas instead of sleep\n    	2016-08-18	2	f
698	Tools	\n        add new command scripts (faceblog, seamanslog, spiritual)\n        improve hourly test\n        add client command\n        start sending email with Spiritual Things	2016-08-04	4	f
707	Tools	\n        add document summary script\n        document summary test\n        document workflow\n        add collab web	2016-08-07	3	f
715	Tools	\n        build all application menus\n        remove dead code\n        debug the page redirect\n        write business docs for Clients\n        improve footer \n        standardize doc viewer	2016-08-09	6	f
795	Sign	\n        meet with Geoff\n        turn over MailChimp login to Geoff	2016-09-02	3	f
750	Fun	\N	2016-08-19	1	f
759	Fun	\N	2016-08-21	1	f
779	Church	\N	2016-08-28	4	f
794	Church	\N	2016-09-01	3	f
796	People	\n        drive to Tillamook and Canon Beach\n        Tillamook Cheese Factory	2016-09-02	10	f
797	Grow	\n        record time spent\n	2016-09-02	1	f
798	Sign	\n        configure SignSpan VPN\n        investigate tom user login issue	2016-09-03	2	f
799	Grow	\n        work on brain docs\n        update Harvest info	2016-09-03	2	f
800	People	\n        dinner at pub before church	2016-09-03	8	f
801	Church	\n        visit SonRise\n         	2016-09-03	2	f
3241	People	\n        discuss Who2Hire with Stacie	2018-03-29	1	f
2894	Teach	\n        test out FTP server connection\n        fix links on website	2018-01-05	4	f
749	Grow	\n        think about personal scorecard	2016-08-19	1	f
752	People	\n        talk with Stacie	2016-08-20	2	f
755	Tools	\n        create hours activity script\n        extract time summary from monthly data	2016-08-21	3	f
753	Grow	\n        bike ride with Stacie\n        watch videos from GLS\n        think through personal goals	2016-08-20	4	f
754	Fun	\n        listen to Usual Suspects in Berthoud\n        Amazing Race\n    	2016-08-20	5	f
756	Church	\n        discuss leading small groups\n        write notes about budgeting process	2016-08-21	6	f
757	People	\n        discussions with Stacie\n        Daruma with Rachel and Andrew	2016-08-21	2	f
758	Grow	\n        install GLSNext on tablet\n        watch videos from GLS\n        nap	2016-08-21	2	f
761	Grow	\n        weekly review\n        personal planning system	2016-08-22	2	f
762	Fun	\n        Sliders\n	2016-08-22	3	f
763	WAM	\n        user stories and requirements for editing agency info\n        design for editing agency info\n        lost user data when attempting to reset a user entry\n        capture data as JSON\n        reconstruct agency data\n        build tools for manipulating the data directly\n        verify agency info on staging\n        reconstruct data on production	2016-08-23	8	f
764	Church	\n        church board prayer meeting\n        think through ministry opportunities\n	2016-08-23	6	f
765	WAM	\n        check on confirmation page link\n        test production WAM\n        investigate notifications for new cases\n        enable notifications\n        clean up typos in agency records\n        fix problems with create agency\n        fix problems with create agent\n        log exceptions in agent view	2016-08-24	8	f
766	Grow	\n        think about personal life goals\n        focus on sleep habits	2016-08-24	3	f
768	WAM	\n        fix problem with accepted pending\n        ghost agencies crash\n        alphabetize the agency list\n        clean up Jefferson high school	2016-08-25	2	f
770	Grow	\n        develop WIG and lead measures\n        develop scorecard	2016-08-25	2	f
771	Fun	\n        Sliders\n	2016-08-25	4	f
772	WAM	\n        investigate notifications on new submissions\n        add date and time to log entries\n        save production data\n        design for reporting forms errors\n        send automatic notifications of errors\n        log all form data submitted\n        Update form help\n        Update data from production server\n        Fix case notifications and autofill\n        Send automatic report for form submission errors\n        add restart notification	2016-08-26	6	f
773	Grow	\n        study and apply 4DX\n        write about brain	2016-08-26	2	f
774	People	\n        Andrew & Rachel (encouraging news on jobs)	2016-08-26	4	f
775	Fun	\n        Sliders\n	2016-08-26	2	f
776	Grow	\n        write about brain\n        restructure Mark Seaman web site\n        Facebook posting and history\n        visit library\n        capture book notes for 4DX\n        study book on Execution\n        extract book notes\n        begin developing writing scorecard	2016-08-27	6	f
777	People	\n        Bryan and Corina get cats	2016-08-27	4	f
778	Fun	\n        Castle\n	2016-08-27	4	f
780	People	\n        Andrew & Rachel (new salmon dish)	2016-08-28	4	f
781	Grow	\n        nap\n        work on score.py	2016-08-28	2	f
782	Fun	\n        pack for trip\n        Castle\n        Winter of the World\n	2016-08-28	4	f
783	People	\n        visit Multnomah Falls\n        drive to Nardins\n        dinner with Nardins\n        visit with Nardins	2016-08-29	8	f
784	Fun	\n        travel to Portland\n        Winter of the World\n	2016-08-29	6	f
785	WAM	\n        extend scripts to fix issues on production server\n        fix bad agency records in production	2016-08-30	2	f
786	Grow	\n        relax and be refreshed\n        personal revitalization\n        enjoy being in Forest Grove\n        walk around neighborhood	2016-08-30	4	f
787	People	\n        visit with Mark & Jen\n        McMenimans	2016-08-30	4	f
788	Fun	\n        Ben Hur\n        Winter of the World\n	2016-08-30	4	f
789	Grow	\n        write facebook post\n        set up scorecard (Docs, Notes, Scripts)	2016-08-31	2	f
790	People	\n        visit with Mark Nardin\n        visit with Ruth and Truett 	2016-08-31	4	f
791	Church	\n        visit with Ruth and Truett about church leadership	2016-08-31	4	f
792	Fun	\n        drive to Bend\n# Tasks History     September 2016\n\n## September Objectives 2016\n\nFrom 500 articles published (docs 430, code 78) to 600 articles by end of Sep.\n\n    \n## Accomplishments\n	2016-08-31	4	f
751	Tools	\n        create hours script\n        create personal scorecard\n        create new doc summary format\n        build summaries for:\n            seamanslog, spiritual-things, collab, client, doc	2016-08-20	3	f
748	People	\n        Rachel & Andrew (Carcasonne)	2016-08-19	1	f
769	Tools	\n        add tests for app and cmd\n        refactor shell.show_files\n        improve doc summary\n        create app summary\n        update score\n        fix environment var on server	2016-08-25	6	f
808	Fun	\n        travel to airport\n        return home \n        Castle\n	2016-09-06	8	f
810	People	\n        talk with Stacie\n        	2016-09-07	3	f
811	Sign	\n        weekly meeting	2016-09-08	1	f
812	Hire	\n        requirements development with Stacie\n        plan initial user story: Create Job Opening\n        develop data models for database ORM\n        plan views for Job Opening	2016-09-08	4	f
813	People	\n        lunch at Nana Bees	2016-09-08	1	f
814	Church	\n        think about church leadership	2016-09-08	1	f
815	Grow	\n        annual physical\n        count calories\n        walk home from library with books\n        celebrate at Dunkin Donuts\n        sleep: 0, weight: 210.2, cal: 1300, exercise: 60 min	2016-09-08	3	f
816	Fun	\n        visit library\n        1356, Dr Who, 1st Commandment, Good Hunting\n	2016-09-08	4	f
818	Grow	\n        health monitoring\n        sleep: -2, weight: 211.6, cal: 1600, exercise: 0	2016-09-09	1	f
819	People	\n        talk with Stacie	2016-09-09	1	f
820	Fun	\n        Pacific\n        Good Hunting\n        Now you see me 2\n	2016-09-09	4	f
821	Hire	\n        create detailed design for Opening Views\n        create detailed design for Skill Views\n        review view design with Stacie\n        build client portal for Hiring Guru	2016-09-10	4	f
822	People	\n        dinner date at Pelegrini's	2016-09-10	3	f
823	Grow	\n        refill medicine\n        visit GoDaddy urls\n        investigate phone screening\n        installed Call Control\n        40 minute bike ride with Stacie\n        sleep: 0, weight: 209.6, cal: 2000, exercise: 40 bike	2016-09-10	3	f
824	Fun	\n        Vikings, Quantico, \n	2016-09-10	4	f
825	Church	\n        lunch at Rio with Clint and Mary	2016-09-11	4	f
826	People	\n        facebook posts\n        facebook connection and reading others posts	2016-09-11	2	f
827	Grow	\n        set 109 for goal weight\n        sleep: 0, weight: 208.2, cal: - , exercise: -	2016-09-11	2	f
828	Fun	\n        Hawaii 50, NCIS, Sliders, Last Man\n        1st Command, Good Hunting\n	2016-09-11	6	f
829	Hire	\n        investigate class-based views\n        build Openings list and delete pages\n        build Openings add and edit pages\n        build Openings details page	2016-09-12	4	f
830	Church	\n        think through leadership team goals\n        document proposed Board roles\n        schedule lunch with Todd	2016-09-12	3	f
831	Grow	\n        communications\n        weekly review\n        create weight management policy\n        five mile walk (10000 steps)\n        sleep: 0, weight: 207.8, cal: -, exercise: -	2016-09-12	3	f
832	Fun	\n        Meet the Parents\n        Enterprise, Psych\n	2016-09-12	4	f
833	Hire	\n        improve views for Openings\n        build views for Skills	2016-09-13	3	f
834	Business	\n        write doc about EstimatingProjects\n        discuss Spectrobotics with Stacie	2016-09-13	2	f
835	Church	\n        meet with Daryl and Heather about small group	2016-09-13	3	f
836	People	\n        discuss vacation plans with Stacie\n        investigate repositioning cruises\n        calculate travel costs from recent trips\n        talk with Christine about career choices	2016-09-13	3	f
837	Grow	\n        think about life, career, and retirement\n        think about upcoming vacations\n        sleep: -2, weight: 208.2, cal: -, exercise: -	2016-09-13	1	f
838	Fun	\n        1st Command\n	2016-09-13	2	f
839	Sign	\n        reproduce issue with Tom+0912@signspan.com\n        add timestamp to log\n        build better instrumentation\n        fix bug with no Chargify subscription\n        test fix for Tom+0912@signspan.com login\n        experiment with User record missing a subscription\n        document design decisions\n        weekly meeting	2016-09-14	7	f
840	Business	\n        family finances\n        file business reciepts	2016-09-14	2	f
841	Church	\n        Ministry school	2016-09-14	4	f
842	Grow	\n        personal refection\n        sleep: -, weight: 208.2, cal: -, exercise: 2 miles\n	2016-09-14	1	f
843	Hire	\n        improve opening views (5 views)\n        complete skill UI (6 views)\n        add new questions\n        unify titles and labels on all views\n        review UI with Stacie\n        move text from docs to templates\n        solve design issue with skill.question_set.all()\n        setup icons for menu selection\n        extend test page	2016-09-15	8	f
844	Church	\n        lunch with Todd\n        decided to launch Develop Team	2016-09-15	2	f
845	Grow	\n        sleep: -2, weight: 209.2, cal: -, exercise: 2 miles	2016-09-15	1	f
846	Fun	\n        1st Command\n	2016-09-15	3	f
847	Sign	\n        write up test scenario	2016-09-16	1	f
848	Hire	\n        build GUI for interviews\n        create InterviewResponse\n        send tests when differences\n        create Interviewer object model\n        create Interview object model\n        create Interview Record view\n        create Interview Assignment view\n        design for scorecard	2016-09-16	8	f
849	Grow	\n        sleep: 0, weight: 208.8, cal: -, exercise: 2 miles	2016-09-16	1	f
850	Fun	\n        Marvel Civil War movie\n	2016-09-16	4	f
851	People	\n        call with Josiah & Sam\n        order pizza & gyros	2016-09-17	1	f
852	Church	\n        write about Church Development Team\n        create plans for kickoff meeting	2016-09-17	3	f
3491	Fun	    ER, Profit	2018-05-30	4	f
3492	People	    visit with Vicki and Sherrie\n    	2018-05-30	2	f
3490	Tools	    present course on MyBook server\n    debug GitBook sync	2018-05-30	2	f
803	Grow	\n        read Present Over Perfect\n        write ideas\n        	2016-09-04	2	f
805	Fun	\n        visit Powell's City of Books\n        bus tour of Portland\n        drive to airport\n        turn in car\n        dinner at airport hotel\n	2016-09-05	10	f
807	People	\n        discuss life goals and aspiration\n        discuss business issues and billing\n        explore new job opportunity	2016-09-06	2	f
804	People	\n        time with Stacie\n        discuss life goals and philosophy	2016-09-05	4	f
858	Fun	\n        Star Trek NG\n        A vs. X\n	2016-09-18	3	f
874	Fun	\N	2016-09-22	2	f
879	Fun	\N	2016-09-23	2	f
860	People	\n        Don and Kathy Miller	2016-09-19	4	f
887	People	\N	2016-09-25	2	f
901	Fun	\N	2016-09-28	1	f
861	Grow	\n        Life that Matters\n        tool to send test results\n        create a daily task to send spiritual things to others\n        sleep: 0, weight: 207.6, cal: -, exercise: 1 mile (5,3,3,2)\n	2016-09-19	2	f
862	Hire	\n        update project plan\n        fix redirect after adding a response\n        deploy existing code\n        convert scorecard to "Interviews"\n        remove extra fields from InterviewResponse\n        improve presentation of Interview scores\n        build Interviews for Opening screen with scorecard\n        attend Ft Collins IP	2016-09-20	10	f
863	People	\n        celebrate with Stacie	2016-09-20	2	f
864	Grow	\n        quiet time\n        sleep: 0, weight: 207.6, cal: -, exercise: 1 mile (5,3,3,2)\n	2016-09-20	2	f
865	Hire	\n        review data model\n        update data model\n        create datatype script\n        build factory for datatypes on core app\n        debug Company (5-views)	2016-09-21	5	f
866	Sign	\n        meet with Eric for project briefing	2016-09-21	2	f
867	Business	\n        meet with Greg 	2016-09-21	1	f
868	Grow	\n        quiet time\n        sleep: 0, weight: 208.2, cal: -, exercise: 1 mile (5,2,3,2)	2016-09-21	2	f
869	Church	\n        School of Kingdom Ministry\n	2016-09-21	4	f
870	Sign	\n        work on registration of users\n        investigate chargify errors\n        investigate database errors (related to CORS headers)\n        build interactive debug capability on dev server\n        weekly meeting	2016-09-22	5	f
871	Hire	\n        create Company record\n        create Manager record\n        migrate database\n        investigate fix for corrupt hire_company	2016-09-22	4	f
872	People	\n        lunch with Stacie 	2016-09-22	2	f
873	Grow	\n        build weekly highlight notes\n        review activities for Aug and Sep\n        document weekly and monthly activities in Aug-Sep\n        sleep: 0(m), weight: 207.6, cal: -, exercise: 3 mile	2016-09-22	1	f
875	Sign	\n        fix defects\n            dup email\n            change email\n            organization\n        work with Geoff on DB setup and Django scripting	2016-09-23	4	f
876	Hire	\n        fix database issue\n        finish Company & Manager	2016-09-23	2	f
877	Church	\n        prep for kickoff Dev Team\n        kickoff meeting for Dev Team	2016-09-23	4	f
878	Grow	\n        build weekly highlight notes\n        sleep: -2(-m), weight: 208.4, cal: -, exercise: 2 miles	2016-09-23	2	f
881	Write	\n        plan out writing goals\n        get started on publishing Reusable Apps\n        organize publishing evernotes	2016-09-24	4	f
882	People	\n        walk around sculpture garden\n        dinner at Carino's\n        get connected with David Ditto\n        visit with Rachel	2016-09-24	4	f
883	Grow	\n        start health log\n        sleep: 0(m), weight: 208.4, cal: -, exercise: 4 miles (5,2,2,3)	2016-09-24	1	f
884	Fun	\n        movie: Sulley\n	2016-09-24	3	f
885	Church	\n        Transformation notes for church\n        think about Dev Team	2016-09-25	4	f
886	Write	\n        Life That Matters	2016-09-25	2	f
888	Grow	\n        weekly review\n        update health log\n        develop health scorecard\n        walk park & inner path\n        sleep: -1(m), weight: 208.4, cal: -, exercise: 3 miles (4,2,2,4)	2016-09-25	3	f
889	Fun	\n        Quauntico, House of Cards, Brit Problems\n        	2016-09-25	3	f
890	Business	\n        discuss business with Stacie	2016-09-26	2	f
891	Write	\n        create cmd script for reuse\n        create outline of Reusable Apps content\n        create schedule for Reusable Apps\n        build deep outline for Chapter 1\n        edit files to reflect content outline	2016-09-26	6	f
892	Church	\n        follow up on Dev Team\n        schedule for board & dev team	2016-09-26	1	f
893	People	\n        lunch at Summit with Stacie\n        presidential debate	2016-09-26	4	f
894	Grow	\n        walk to library\n        develop health scoring system and health log\n        sleep: 0, weight: 207.6, eat: 2000, exercise: 2.5 miles (4,3,2,3)\n	2016-09-26	1	f
895	Write	\n        write about CareerTransformation\n        add scriptures to spiritual things\n        review notes in brain\n        interactions on facebook\n        build book structure for Life\n        build life script\n        write 50 Tricks page	2016-09-27	8	f
896	Church	\n        develop outline of treasurer job\n        roles of board, staff, dev team\n        meet with Kyle to discuss Treasurer issues\n        board meeting	2016-09-27	5	f
897	Grow	\n        health log\n        sleep: -1, weight: 209.2, eat: 1900, exercise: 2 miles (4,1,2,3)\n	2016-09-27	1	f
898	Hire	\n        create user login\n        link company to user\n        link opening to company	2016-09-28	2	f
899	Church	\n        create Budget Spreadsheet\n        participate in pastor payment discussion\n        second meeting of Dev Team\n        design for key metrics (Attendance, Leaders)\n        SoKM meeting\n        meet with Kyle on budget	2016-09-28	9	f
900	Grow	\n        read Getting Things Done\n        walk to library\n        sleep: 5, weight: 208.4, eat: 1600, exercise: 3 miles (5,2,5,4)	2016-09-28	2	f
902	Hire	\n        solve database issues\n        build user datatype\n        create user scripts	2016-09-29	3	f
903	Sign	\n        scrum meeting 	2016-09-29	1	f
2893	Grow	\n        5, 1, 3, 2\n        sleep in\n        annual personal review	2018-01-05	2	f
3244	Grow	\n        5, 4, 3, 4\n        walk on campus\n        start reading Principles	2018-03-30	3	f
3243	Fun	\n        Vikings\n	2018-03-29	4	f
855	Church	\n        write Transformation article\n        write SpiritualTransformation article\n        email Todd and Jenny about teaching notes	2016-09-18	6	f
856	People	\n        Andrew and Rachel	2016-09-18	2	f
854	Fun	\n        visit library\n        watch documentary about Beatles\n        1st Command\n	2016-09-17	5	f
914	Church	\n        create Church Scorecard	2016-10-02	6	f
931	Fun	\N	2016-10-05	2	f
946	Church	\N	2016-10-09	4	f
915	People	\n        Carl's Junior with Christine\n        Christine went to church\n        assemble CD racks	2016-10-02	1	f
916	Grow	\n        nap\n        sleep: -2, weight: 208.6, eat: 2200, exercise: 1 miles (3,2,2,2)	2016-10-02	2	f
917	Fun	\n        Continuum, House of Cards, 1st Command, MadMen\n	2016-10-02	5	f
918	Sign	\n        create plan for delayed cancel	2016-10-03	1	f
919	Church	\n        Emotional Transformation\n        send church scorecard to Todd and Jenny\n        build budgeting variance calculator\n        watch Vineyard Missions Conference	2016-10-03	5	f
920	People	\n        hear back from Oli Hills	2016-10-03	1	f
922	Fun	\n        A vs. X, 1st Command\n	2016-10-03	2	f
923	Hire	\n        debug view for company registration\n        debug views for company add\n        debug views for manager add\n        debug views for company edit\n        debug views for manager edit\n        work with Stacie on look-and-feel	2016-10-04	6	f
924	Church	\n        small group with Daryl and Heather\n        helped alcoholic neighbor	2016-10-04	5	f
925	People	\n        discuss work with Stacie\n        video with Cassie's birthday	2016-10-04	2	f
926	Grow	\n        sleep in\n        review of emotional health and satisfaction\n        [4] - exercise = 6K - 60 minutes - 3 miles\n        [5] - 1400 calories\n        sleep: -1, weight: 207.8, eat: 1400, exercise: 3 miles (4,3,5,4)\n	2016-10-04	1	f
927	Church	\n        watch SoKM with Andrew\n        pray with Andrew\n        build vision for Church Leadership Tool\n        create church.py script\n        create church budget command	2016-10-05	6	f
929	People	\n        lunch at Cafe Athens	2016-10-05	2	f
930	Grow	\n        schedule auto glass\n        cleaning\n        sleep: -1, weight: 206.6, eat: 1500 c, ex: 1.5 mi (4,4,5,2)	2016-10-05	2	f
932	Sign	\n        email Tom\n        write design guide for Delayed Cancel\n        design period event mechanism\n        create user clean up rules\n        design for when to remove users\n        design when to send notifications	2016-10-06	6	f
933	Hire	\n        park Who2Hire.net\n        DNS for Who2Hire.net\n        setup Who2Hire.net domain router on website\n        hook up hiring-guru.net\n        refactor hire.py	2016-10-06	4	f
934	People	\n        Candelite Dinner Theater	2016-10-06	4	f
935	Hire	\n        work with Stacie on user flow\n        build skills editor\n        create import of skills\n        parse skills file\n        create master list of skills	2016-10-07	6	f
936	Tools	\n        create moving average for health score	2016-10-07	2	f
937	Grow	\n        sleep: -2, weight: 205.4, eat: 1900, exer: 3 mi  (3,5,3,4)	2016-10-07	1	f
938	People	\n        High Hops	2016-10-07	2	f
939	Fun	\n        Castle\n	2016-10-07	3	f
940	Tools	\n        support "Tools" in hours script	2016-10-08	1	f
941	Church	\n        prep for dev team meeting\n        dev team meeting	2016-10-08	3	f
942	People	\n        plan trip\n        create cards for trip events\n        Hearth & Nana Bea's	2016-10-08	5	f
943	Grow	\n        update health score and data feed\n        sleep 0, weight 205.4, eat 2100, 1 mi  (5,5,2,2)	2016-10-08	1	f
944	Fun	\n        browse internet\n        article on demographics\n        digital books from library using Overdrive\n        buy Stacie a Kindle Fire\n        investigate Kindle Unlimited and Am Prime\n        get Castle from library\n	2016-10-08	4	f
945	Hire	\n        update user stories	2016-10-09	1	f
947	People	\n        Cazadores with Stacie	2016-10-09	2	f
948	Grow	\n        sleep 0, weight 206.6, eat 2200, 2.5 mi  (5,2,2,3)	2016-10-09	1	f
949	Fun	\n        presidential debate\n        NCIS, Mad Men\n        1st Command\n	2016-10-09	6	f
950	Sign	\n        discuss work with Tom\n        document test scenario\n        testing for  MVP-519 - incomplete cancel\n        execute django scripts on dev server\n        begin work on periodic task\n        undo new changes	2016-10-10	6	f
951	Hire	\n        update user stories for review\n        organize Hiring Guru documentation	2016-10-10	2	f
952	Write	\n        write to Focus on the Family	2016-10-10	1	f
953	People	\n        send trip itinerary\n        Andrew birthday party	2016-10-10	4	f
954	Grow	\n        organize brain\n        update personal info and plan\n        walk through the golf course\n        sleep 0, weight 207.8, eat 1800, 5 mi  (5, 3, 4, 5)\n	2016-10-10	1	f
955	Sign	\n        meet with Geoff\n        briefing on technology\n        collaborate with Tom on user record cleanup	2016-10-11	2	f
904	Grow	\n        build new projects list\n        build to actions list\n        sleep: 0, weight: 206.6, eat: 1900, exercise: 4 miles (5,4,3,5)	2016-09-29	2	f
905	People	\n        vacation to Rocky Mtn Park\n        hike to Alberta Falls\n        dinner at Baba's Gyros\n	2016-09-29	8	f
906	Sign	\n        test cancel\n        start server\n        register user\n        verify registration with scripts\n        chargify cancel\n        verify login behavior\n        verify cancel with scripts\n        test delete user record\n        communicate results\n        verify setting of cancel_at_end_of_period	2016-09-30	9	f
907	Hire	\n        reset the database\n        build out data scripts and tests	2016-09-30	2	f
908	Church	\n        develop design for interactive church scorecard\n        build four key measures:  connect, lead, give, invest	2016-09-30	2	f
2902	Tools	\n        build task history view	2018-01-07	2	f
2903	Grow	\n        5, 1, 3, 2\n        weekly review and new ideas	2018-01-08	2	f
2901	Grow	\n        5, 2, 3, 3\n        nap	2018-01-07	1	f
909	Fun	\n\n# Tasks History     October 2016\n    \n## Accomplishments\n\n	2016-09-30	1	f
911	People	\n        Barnes and Noble\n        Rachel and Andrew Kobe Sushi	2016-10-01	3	f
913	Fun	\n        movie Ms Peregrin, weight loss documentary\n	2016-10-01	3	f
912	Grow	\n        create health score script\n        sleep: -1, weight: 207.8, eat: 1600, exercise: 2 miles (4,3,5,3)	2016-10-01	2	f
960	People	\n        drive to Kansas City (12 hours clock time)\n        visit with Leslie, Kelli, Lucy	2016-10-12	7	f
991	Fun	\N	2016-10-24	7	f
1002	Fun	\N	2016-10-29	7	f
1004	Fun	\N	2016-10-30	7	f
961	Fun	\n        listen to Out of the Silent Planet\n        start Heat Wave\n        discuss writing project	2016-10-12	6	f
962	Grow	\n        sleep 0, weight 206.0, eat 1300, 3 mi  (5, 4, 5, 4)\n	2016-10-12	1	f
964	Grow	\n        sleep 0, weight -, eat 1300, 2 mi  (5, 5, 5, 3)\n	2016-10-13	1	f
965	Write	\n        time in solitude\n        organize written content\n        post on Facebook\n        write Life - chapter 1	2016-10-14	5	f
966	People	\n        rehearsal dinner \n        trolley\n        tour of Nashville	2016-10-14	8	f
967	Grow	\n        sleep 0, weight -, eat 2600, 1 mi  (5, 5, 1, 2)\n	2016-10-14	1	f
968	People	\n        Calvin's wedding	2016-10-15	8	f
969	Church	\n        discuss church life with Eric	2016-10-15	4	f
970	Grow	\n        sleep 0, weight -, eat 2600, 2 mi  (3, 3, 1, 3)\n	2016-10-15	2	f
971	People	\n        visit at Lehman's house\n        family BBQ\n        talk with Eric, Jim	2016-10-16	8	f
972	Fun	\n        investigate trip plan (Chattanooga/Gatlinburg)	2016-10-16	5	f
973	Grow	\n        sleep 0, weight -, eat 2500, 2 mi  (4, 2, 1, 3)\n	2016-10-16	1	f
974	Write	\n        Life: Work\n        Facebook posting	2016-10-17	2	f
975	People	\n        Portofinos\n        drive to Chattanooga	2016-10-17	5	f
976	Fun	\n        tour Andrew Jackson estate	2016-10-17	7	f
977	People	\n        St Elmore Deli	2016-10-18	5	f
978	Fun	\n        tour Lookout Mountain\n        tour Chicamauga battlefield\n        read about Civil War	2016-10-18	7	f
979	Church	\n        Physical Transformation	2016-10-18	2	f
980	Write	\n        post on Facebook\n        write Work	2016-10-19	2	f
981	People	\n        drive to Gatlinburg\n        deli lunch at St. Elmo's	2016-10-19	6	f
982	Fun	\n        visit Rock City\n        third presidential debate	2016-10-19	6	f
983	Write	\n        post on Facebook\n        write about Freedom	2016-10-20	2	f
984	People	\n        drive through Smoky Mountains	2016-10-20	6	f
985	Fun	\n        visit Lake Junaluska	2016-10-20	6	f
986	Write	\n        post on Facebook	2016-10-21	2	f
987	People	\n        drive to Knoxville\n        Sunsphere and Tomatohead\n        drive to Nicholasville\n        visit with David Ditto	2016-10-21	12	f
988	People	\n        visit Wilmore\n        visit with Aunt Fran\n        meet Lyndsey & Mark\n        Chinese food	2016-10-22	14	f
989	People	\n        church with Fran and David\n        Wesley Village\n        visit Doug and Karen on farm\n        tour Danville and Stanford\n        eat at Cheddars	2016-10-23	14	f
990	People	\n        drive to Washington, DC\n        see Fredricksburg, Wilderness, Chancellorville	2016-10-24	7	f
992	People	\n        VRE to Washington\n        meet Rachel at Capital	2016-10-25	7	f
993	Fun	\n        tour of Capital\n        Big Bus tour of DC\n        Korean Memorial\n        Vietnam Memorial\n        Lincoln Memorial	2016-10-25	7	f
994	People	\n        drive to Greenbelt\n        metro to DC\n        wait for Big Bus\n        drive to Columbia\n        visit Ruth Ann\n        post on Facebook	2016-10-26	7	f
995	Fun	\n        tour Smithsonian\n        Imax\n        stay at Vantage House	2016-10-26	7	f
996	People	\n        stay at Vantage House\n        visit with Ruth, Harry, Nancy, Martha, Wayne\n        play pool with Harry\n        dinner out with Harry, Ruth, Wayne	2016-10-27	13	f
997	Write	\n        post on Facebook	2016-10-27	1	f
998	Write	\n        post on Facebook	2016-10-28	2	f
999	People	\n        drive to Uniontown	2016-10-28	6	f
1000	Fun	\n        tour Connellsville\n        see Inferno	2016-10-28	6	f
1001	People	\n        drive to Indianapolis\n        order pizza	2016-10-29	7	f
1003	People	\n        drive to Kansas City\n        visit with Kelli & Rick\n        feeling sick	2016-10-30	7	f
1005	People	\n        tour of farm with Rick\n        visit with Rick and Kelli\n        trick or tree with kids	2016-10-31	11	f
1006	Write	\n        write about Work\n        outline for Growth\n        outline for Experience	2016-10-31	2	f
3863	Grow	    4, 3, 4, 2\n    weight: 207.2	2018-08-21	0	f
1009	Fun	\n        Out of the Silent Planet\n        lost tablet	2016-11-01	7	f
958	Grow	\n        long walk  - 3 miles\n        process inbox\n        sleep -3, weight 207.0, eat 1300, 3 mi  (2, 3, 5, 4)	2016-10-11	2	f
1010	Church	\n        SoKM	2016-11-02	5	f
1011	People	\n        talk with Stacie	2016-11-02	3	f
1013	People	\n        schedule meeting with Kyle\n        posting on Facebook	2016-11-03	1	f
1014	WAM	\n        pass all tests on dev\n        create automatic backup on production\n        adjust timezone setting on server\n        create hourly maintenance task with log\n        scripts to work with database	2016-11-03	8	f
1015	Sign	\n        review pending issues\n        weekly meeting 	2016-11-03	2	f
1016	Write	\n        write Quiet Time	2016-11-03	1	f
1017	Fun	\n        Hawaii 50 on Kindle Fire\n        Madam Secretary	2016-11-03	2	f
1018	Tools	\n        fix issue with tests\n        add doc search\n        display task history files as web pages\n        remove old history files\n        send spiritual email only from server	2016-11-04	4	f
1019	Write	\n        write Big Ideas & Game Changers\n        add notes from notebook into Evernote	2016-11-04	2	f
1078	People	\n        date with Stacie @ Biagi's\n        Josiah & Sam\n        visit with Lucy	2016-11-19	3	f
957	Church	\n        follow up on Dev team	2016-10-11	4	f
1008	People	\n        drive to Home	2016-11-01	7	f
959	Fun	\n        buy books\n        investigate Amazon Prime and Unlimited\n	2016-10-11	3	f
1024	People	\n        Stacie and Christine go to movie\n        chili cooking for church potluck	2016-11-05	2	f
1025	Fun	\n        Mad Men\n        Citizen Four\n        Heat Wave	2016-11-05	4	f
1026	Church	\n        write Overcoming Anxiety\n        chili cook-off	2016-11-06	7	f
1027	Fun	\n        Madam Secretary, Shield	2016-11-06	5	f
1028	Grow	\n        sleep in\n        organize week\n        time change\n        hurt inside of ear (antibiotic)\n        3, 2, 2, 4\n	2016-11-06	2	f
1029	Write	\n        Think about publishing paragraphs on Faceblog\n        write list of projects to pursue	2016-11-07	1	f
1031	Fun	\n        Legends of Tomorrow	2016-11-07	3	f
1032	People	\n        dinner with Stacie	2016-11-07	1	f
1033	Grow	\n        put on new mattress pad\n        think about Work projects and priorities\n        5, 1, 5, 4\n	2016-11-07	1	f
1034	Hire	\n        Hiring App core work flow\n        debug python console on dev server\n        create backup utility\n        assign openings to Test Manager\n        update design for Skills\n        test import  of production data\n        test create Opening	2016-11-08	8	f
1035	Fun	\n        follow election coverage	2016-11-08	5	f
1036	Grow	\n        restless sleep\n        post on Facebook\n        3, 3, 1, 4\n	2016-11-08	1	f
1037	Church	\n        meeting with Todd and Jenny\n        create basic workflow for Church Dashboard\n        School of Kingdom Ministry	2016-11-09	9	f
1038	People	\n        meeting with Kyle and Stacie about business	2016-11-09	1	f
1039	Fun	\n        organize photos	2016-11-09	1	f
1040	Grow	\n        nap\n        mourn for USA\n        1, 3, 5, 2\n	2016-11-09	3	f
1041	People	\n        dinner at Palominos with Andrew, Rachel and Lucy \n        discussion with Stacie and Rachel about our country and recent events	2016-11-10	5	f
1042	Sign	\n        fix issue with duplicate email\n        weekly meeting	2016-11-10	4	f
1043	Write	\n        think about ideas for My Book Online\n        update outlines on Expectations, Values, Experiences, Time & Place	2016-11-10	3	f
1044	Grow	\n        walk to library\n        process thoughts from SoKM\n        read bible Ezekiel\n        5, 5, 1, 3\n	2016-11-10	2	f
1045	People	\n        visit with Lucy & Christine	2016-11-11	2	f
1046	Write	\n        Stages of Totalitarianism	2016-11-11	3	f
1047	Church	\n        create data model & views for ChurchScore	2016-11-11	4	f
1048	Grow	\n        go to bed early\n        discuss state of world with Stacie\n        finish AVX series\n        2, 2, 5, 2	2016-11-11	3	f
1049	Fun	\n        visit library to read\n        read about government security programs\n	2016-11-11	2	f
1050	People	\n        discuss life and stress with Stacie	2016-11-12	4	f
1051	Fun	\n        finish 1st Commandment\n        comics\n        visit library	2016-11-12	4	f
1052	Church	\n        ChurchEvent views	2016-11-12	4	f
1053	Grow	\n        investigate tools for web protection services\n        5, 2, 3, 2\n	2016-11-12	2	f
1054	Fun	\n        Agatha Christie\n        investigate travel to New Zealand and London\n        investigate house swapping services\n        earthquake in Christchurch NZ	2016-11-13	3	f
1055	Church	\n        skip church due to lack of sleep\n        SoKM lesson with Stacie\n        create ChurchBudget views\n        debug ChurchEvent views	2016-11-13	4	f
1056	Grow	\n        Destiny\n        sleeping problems due to PESD - post election stress disorder\n        1, 2, 3, 4	2016-11-13	3	f
1057	People	\n        Rachel & Andrew for BBQ\n        Dick's BBQ take out\n	2016-11-13	4	f
1058	Business	\n        business meeting for Shrinking World\n        lunch together	2016-11-14	3	f
1059	Hire	\n        backup data on server\n        deploy & test changes\n        clean up perf/tech skills\n        update project plan\n        debug interview scorecard\n        debug interview recording view	2016-11-14	6	f
1060	Church	\n        erased Mac Mini\n        set up to donate computer	2016-11-14	2	f
1061	Fun	\n        Poldark\n	2016-11-14	3	f
1062	Write	\n        The 20-Day Project\n        Organizing Information\n        post Software Dev Phases	2016-11-15	4	f
1063	Tools	\n        create ChurchBudget data model\n        create ChurchBudget views\n        extend datatype code\n        improve style for all apps	2016-11-15	4	f
1064	Grow	\n        review health score\n        long walk - 9600 steps\n        5, 3, 5, 5	2016-11-15	2	f
1066	Church	\n        meet with Todd and Jenny\n        discuss future of America\n        pray together\n        Thirst night	2016-11-16	9	f
1067	Hire	\n        clean up bad companies\n        add security for Company records and views\n        review progress with Stacie\n        update project plan\n        improve style of all views\n        better workflow	2016-11-16	4	f
1068	Grow	\n        long walk - 8100 steps\n        5, 4, 4, 5\n	2016-11-16	1	f
1069	Church	\n        refine ChurchBudget look and feel\n        build new table formatter	2016-11-17	4	f
1070	Grow	\n        personal review and planning\n        3, 3, 4, 3	2016-11-17	2	f
1071	Fun	\n        Dr. Strange\n	2016-11-17	4	f
1072	Business	\n        send Kyle marketing info	2016-11-18	1	f
1073	Tools	\n        simplify menu on company website\n        show todo page on MarkSeaman website\n        create health pages on MarkSeaman site\n        build general template for clonable list table	2016-11-18	3	f
1074	Hire	\n        create new Interviewer data model\n        debug Interviewer records\n        build Interviewer admin page\n        create Add Interviewer view	2016-11-18	6	f
1075	Write	\n        update plan for publishing	2016-11-18	1	f
1076	Fun	\n        Poldark\n	2016-11-18	3	f
1077	Hire	\n        fix interviewers page (opening ID)\n        deploy hire/church/health    \n        data backup on server\n        build hacks.py scripts	2016-11-19	7	f
1021	People	\n        business discussion with Stacie	2016-11-04	2	f
1023	Church	\n        plan for Church Dashboard\n        create basic website	2016-11-05	6	f
1022	Write	\n        organize notes	2016-11-05	2	f
1132	Write	\n        organize brain	2016-12-02	1	f
1133	Fun	\n        Madam Sec.\n        Scrubs\n        House of Cards	2016-12-02	5	f
3866	Fun	    Hawaii 50, ER, Fraiser, Librarians\n    	2018-08-21	4	f
1126	Church	\n        update Reflections in Spiritual Things	2016-12-01	1	f
3867	People	    dinner with Stacie	2018-08-21	1	f
3481	Teach	    work on ideas for lesson prep templates	2018-05-29	1	f
4000	Fun	    buy TV at Best Buy\n    unpack sound system\n    Profit\n    	2018-09-18	4	f
1082	Tools	\n        build time summary over multiple months\n        plan hours data import and views	2016-11-20	2	f
4001	People	    dinner at Palominos	2018-09-18	2	f
1084	Fun	\n        Ms. Marvel\n        Heat Wave\n        Poldark\n	2016-11-20	3	f
1085	Write	\n        write Being Light\n        create Spiritual Things Facebook Group\n        ideas of inspiration\n        post info on Facebook	2016-11-21	3	f
1129	Fun	\n        White Queen\n	2016-12-01	1	f
1086	Church	\n        Rewrite Spiritual Things page router\n        import events from CSV\n        deploy new code\n        build workflow for Church Events\n        write Dashboard page\n        select weeks to work on for meetings\n        score the meetings	2016-11-21	7	f
1087	Grow	\n        bible reading\n        4, 3, 4, 5	2016-11-21	1	f
1088	Fun	\n        Heat Wave\n        Poldark\n	2016-11-21	3	f
1090	Write	\n        post on Facebook	2016-11-22	1	f
1091	Grow	\n        dentist\n        5, 4, 2, 2\n	2016-11-22	2	f
1092	Church	\n        fix issues with Church app\n        meet with Todd and Jenny\n        update meeting times for events week of 11-19\n        meet with Kyle\n        update budget with numbers from Icon\n        extract November budget info from Icon\n        add users for Todd, Jenny, Kyle\n        new design ideas for create weekly score record and reports	2016-11-23	8	f
1093	Fun	\n        Continuum\n        Man in the High Castle\n	2016-11-23	6	f
1094	Write	\n        write Cultivating Gratitude\n        post on Facebook\n        create ideas for Brain Spaces and corresponding details\n        Where Ideas Come From\n        capture quotes from Impact	2016-11-24	6	f
1095	People	\n        Thanksgiving dinner	2016-11-24	6	f
1096	Fun	\n        make list of 101 Amazon Kindle books\n        finish Heat Wave\n	2016-11-24	2	f
1097	Write	\n        publish Justice, Mercy, and Humility\n        write outline for Kingdom of God\n        update bible verses\n        organize books and reading lists	2016-11-25	3	f
1098	Church	\n        create meeting with known dates	2016-11-25	3	f
1099	People	\n        Jenny Beilman birthday	2016-11-25	4	f
1100	Grow	\n        walk\n        read bible\n        5, 3, 1, 4	2016-11-25	1	f
1101	Fun	\n        Wars of the Roses\n        visit library\n        Librarians\n	2016-11-25	3	f
1102	Grow	\n        walk\n        3, 2, 3, 3	2016-11-26	1	f
1103	Church	\n        create score records\n        create budget and meeting records with fixed dates\n        optimize UX for dashboard\n        send messages to Kyle and Beilmans\n        meet with Darryl @ Egg & I	2016-11-26	4	f
1104	People	\n        Meet with Josiah\n        visit with Lucy	2016-11-26	2	f
1105	Fun	\n        White Queen\n        Wars of the Roses\n        Fantastic Beasts\n        Librarians\n	2016-11-26	7	f
1106	Church	\n        write articles Pessimism, Repentance	2016-11-27	5	f
1107	People	\n        talk with Stacie and Lucy	2016-11-27	3	f
1108	Grow	\n        read Integrity\n        nap\n        3, 2, 4, 2	2016-11-27	3	f
1109	Fun	\n        Wars of the Roses\n	2016-11-27	3	f
1110	Tools	\n        create import of tasks from file\n        build task views\n        create task style	2016-11-28	2	f
1111	Hire	\n        testing of app\n        fix data on production server\n        create ManyToMany relationship with Interviewer & Opening\n        attach interviewers to opening\n        serialize interview session\n        improve UX of questionnaire\n        build tabbed view	2016-11-28	8	f
1112	Church	\n        Steve Scifres @ Egg & I	2016-11-28	2	f
1113	Fun	\n        Poldark\n	2016-11-28	2	f
1114	Tools	\n        clean up office (desk, shelf, closet)	2016-11-29	2	f
1115	Business	\n        sort through inbox\n        family finance\n        record family budget Sep-Nov\n        estimate 2017 spending and income\n        create cornbread chart of spending\n        define categories: \n            Basics-45%, Lifestyle-25%, Health-20%, Giving-10%, [Tax-40%]	2016-11-29	6	f
1116	Write	\n        creativity brainstorm\n        Leading Your Church to Grow\n        writing ideas -- headlines for new topics	2016-11-29	2	f
1117	People	\n        goodbye dinner for Lucy at Cafe Athens\n        visit with Andrew & Rachel	2016-11-29	4	f
1118	Business	\n        2016 spending\n        follow up on house payment	2016-11-30	4	f
1119	Grow	\n        walk in cold\n        personal planning\n        schedule Skin Doc\n        monthly objectives  \n        5, 2, 4, 2	2016-11-30	3	f
1120	Church	\n        SoKM video\n        pray with Christine	2016-11-30	2	f
1121	Write	\n        post Facebook articles\n        post blog article\n        publishing commitments	2016-11-30	1	f
1122	People	\n        Lucy travels to Austin	2016-11-30	1	f
1123	Fun	\n        Wars of the Roses\n        return library books\n        White Queen\n\n# Tasks History     December 2016\n    \n## Accomplishments\n	2016-11-30	3	f
3865	Tools	    	2018-08-21	0	f
1473	People	\n        Fat Pastor	2017-03-10	3	f
1127	Grow	\n        5, 4, 3, 2\n        bible study\n        2000 years of Charisma\n        prioritize projects - monthly objectives	2016-12-01	4	f
1128	Tools	\n        hours add script\n        create list of days for month\n        create import filter	2016-12-01	1	f
1131	Tools	\n        build monthly summary for tasks\n        learn about advanced queries in Django\n        deploy Task Master on production\n        import all 2016 months into Task Master	2016-12-02	3	f
1140	People	\n        Rio with Rachel and Andrew\n        Hang Christmas lights with Stacie	2016-12-04	4	f
1141	Fun	\n        create notes for Wars of the Roses\n        Big Bang\n        Jungle Book\n	2016-12-04	5	f
1143	Tools	\n        review project priorities	2016-12-05	1	f
1144	People	\n        help Andrew set up investments\n        talk to Rachel about house	2016-12-05	2	f
1145	Write	\n        post on Facebook\n        teach Andrew about investments\n        write ideas about Household economics\n        research investment break even and accumulation times	2016-12-05	5	f
1146	Grow	\n        walk to Bungalow\n        5, 5, 3, 4	2016-12-05	1	f
1147	Fun	\n        Castle, Madam Sec.\n	2016-12-05	2	f
1149	Church	\n        home group party\n        write prophecy message for Todd	2016-12-06	4	f
1150	Business	\n        apply for HELOC	2016-12-06	1	f
1151	Tools	\n        create project plan for ComSys\n        build tool for app function signatures	2016-12-06	1	f
1152	People	\n        lunch with Stacie at Nana Bea's	2016-12-06	1	f
1153	Church	\n        SoKM	2016-12-07	4	f
1154	Hire	\n        work on interviewer assignment view	2016-12-07	3	f
1155	Grow	\n        dermatologist\n        5, 5, 5, 2	2016-12-07	2	f
1156	People	\n        tour house with Andrew and Rachel\n        lunch with Stacie at Doug's Diner\n        dinner at Noodles	2016-12-07	4	f
1157	Fun	\n        Marvel comics\n	2016-12-07	1	f
1158	Business	\n        loan application process\n        write Tom Yip about SignSpan involvement	2016-12-08	1	f
1159	Church	\n        test out church dashboard\n        meet with Kyle\n        add ChurchScore to Events and Budget records\n        small improvements to presentation layer\n        configure ChurchLeader records	2016-12-08	5	f
1160	Hire	\n        create sessions views\n        split sessions from possible interviewers\n        fix bugs and improve workflow\n        learn about ManyToMany ORM logic\n        learn about Forms processing	2016-12-08	5	f
1161	People	\n        Rachel and Andrew experience turmoil over house purchase\n        Stacie helps with Garcia's house discussion	2016-12-08	2	f
1162	Fun	\n        Big Bang\n	2016-12-08	1	f
1164	People	\n        Rachel and Andrew made and got confirmation of house offer	2016-12-09	2	f
1165	Fun	\n        Star Trek	2016-12-09	2	f
1166	Tools	\n        create goals and notes for Task Master\n        deploy new code\n        rename docs for Seaman's Log\n        rebuild Seaman's log website\n        change title on Seaman's Log	2016-12-10	4	f
1167	Write	\n        post on Facebook\n        think about Inventor Meetup and professional networking\n        build index of Project Notes	2016-12-10	2	f
1168	People	\n        Big Fat Pastor party\n        Hearth with Rachel	2016-12-10	4	f
1169	Fun	\n        Librarians, SHIELD\n	2016-12-10	4	f
1170	Grow	\n        sick in the night\n        skip church\n        sleep late\n        reflect on life\n        read Dad's book\n        1, 5, 5, 1	2016-12-11	8	f
1171	People	\n        meet Josiah	2016-12-11	2	f
1172	Fun	\n        Central Intelligence\n	2016-12-11	4	f
1173	Church	\n        church board meeting\n        create plan for capital spending and borrowing\n        create 4 proposals for board meeting\n        create goals for capital spending team\n        create outline for 2017 budget	2016-12-12	9	f
1174	Business	\n        family finance: long-term planning\n        analysis of net worth 2016	2016-12-12	4	f
1175	Fun	\n        Spider man\n	2016-12-12	1	f
1176	Church	\n        send apology for board meeting	2016-12-13	2	f
1177	Business	\n        finish financial plan for long-term	2016-12-13	2	f
1178	Write	\n        organize notes\n        write Economics: Investment\n        write Economics: Budget	2016-12-13	4	f
1179	Grow	\n        update weekly goals and monthly objectives\n        moment of self awareness about board meeting\n        discuss personal growth with Stacie\n        3, 5, 5, 1	2016-12-13	2	f
1180	Fun	\n        Librarians, Madam Sec\n	2016-12-13	4	f
1181	Church	\n        meet with Todd on Dev Team\n        update invested time record\n        fix spending deviation calculation\n        minor improvements to dashboard\n        discuss church leadership with Todd	2016-12-14	6	f
1182	Hire	\n        enable selection of attributes based on requesting user\n        fix issue with menu items for job opening\n        create new test company\n        debug user creation\n        streamline menu for Job Opening\n        improve skills view	2016-12-14	6	f
1183	Tools	\n        update Mac OS/X\n        create script for posting from Seaman's Log content	2016-12-14	2	f
1184	Tools	\n        enable daily backup of database\n        debug issues with doc code\n        improve scoring for documents\n        create reusable hourly task	2016-12-15	4	f
1185	Hire	\n        update menu logic and icons\n        create workflow in views\n        build opening skills configuration view\n        debug sequence of views during configuration\n        display all questions on skills view	2016-12-15	6	f
1186	Church	\n        Christmas party	2016-12-15	4	f
1135	People	\n        meet with Josiah	2016-12-03	2	f
2905	Fun	\n        Hobbit	2018-01-07	3	f
2906	People	\n        Rio for lunch\n        visit the Ed and Marsha Edmunds\n        time with Stacie\n	2018-01-07	3	f
2904	Church	\n        church service\n        church dashboard	2018-01-07	5	f
3487	Business	    review investments	2018-05-29	2	f
1138	Fun	\n        Librarians\n        SHIELD\n	2016-12-03	3	f
1139	Church	\n        fix issue with Event and Budget records\n        talked to Kyle about marketing	2016-12-04	5	f
1137	Grow	\n        think about project goals\n        organize notes\n        5, 5, 5, 2	2016-12-03	2	f
1193	People	\n        breakfast with Juan and Lynn\n        neighborhood party	2016-12-17	4	f
1194	Grow	\n        read Dad's book\n        5, 4, 4, 2\n\n	2016-12-17	4	f
1195	Church	\n        church service	2016-12-18	3	f
1196	Write	\n        write Now is the Time\n        write Let Darkness Come\n        write Biggest Idea this Year\n        organize brain	2016-12-18	3	f
1197	Tools	\n        develop plans for Software Master\n        develop plans for Writing Master\n        develop brain space ideas	2016-12-18	2	f
1198	People	\n        Papa Murphy pizza with Rachel	2016-12-18	2	f
1199	Fun	\n        Star Wars movie\n        Star Trek Beyond	2016-12-18	3	f
1200	Grow	\n        wake up at 4:45\n        3, 4, 3, 2\n	2016-12-18	1	f
1201	Write	\n        Spiritual Things home page\n        organize brain\n        write notes for Brain Spaces (Goal, Learn, Teach, Build)	2016-12-19	3	f
1202	Tools	\n        design for Score Master application \n        Score Master (stories, data, views, scripts)\n        create outline for building new applications\n        reusable development process	2016-12-19	4	f
1203	Hire	\n        relayout Interviewers view with bootstrap layouts	2016-12-19	3	f
1204	Fun	\n        Supergirl, Madam Sec\n        	2016-12-19	4	f
1206	Tools	\n        update Writing Master user stories	2016-12-20	4	f
1207	Hire	\n        rewrite Interviewer admin\n        rewrite Session admin	2016-12-20	3	f
1208	Grow	\n        task planning\n        sign up for Banner portal\n        renew meds\n        5, 3, 3, 2	2016-12-20	2	f
1210	Hire	\n        add definitions to skill list\n        debug skill library manager\n        update master skill list\n        debug skill selection\n        implement skill selector view	2016-12-21	4	f
1211	Write	\n        write Building a Business is an Investment	2016-12-21	4	f
1212	Business	\n        analyze family finances\n        discuss finances and business opportunity with Stacie	2016-12-21	2	f
1213	Fun	\n        Murray Christmas\n	2016-12-21	4	f
1214	Business	\n        review Eric's reimbursement spreadsheet\n        images of receipts\n        create spreadsheet and Evernotes of receipts\n        file for reimbursement	2016-12-22	6	f
1215	Grow	\n        read Bootstraps and Blessings\n        3, 3, 3, 1	2016-12-22	2	f
1217	Write	\n        Healthy, Wealthy, Wise	2016-12-23	1	f
1216	Fun	\n        Supergirl\n	2016-12-22	4	f
1218	Tools	\n        Software Master - application builder\n        Software Dev Project Template\n        project investment growth simulator 	2016-12-23	4	f
1219	People	\n        shopping in Greeley with Stacie\n        wrap presents	2016-12-23	3	f
1220	Fun	\n        Poldark	2016-12-23	3	f
1221	Grow	\n        read Bootstraps and Blessings\n        4, 3, 3, 2\n	2016-12-23	3	f
1223	People	\n        Christmas Eve Service\n        Royal Nepal Christmas celebration dinner\n        open presents	2016-12-24	6	f
1224	Grow	\n        read Blessings & Bootstraps\n        4, 3, 1, 2\n	2016-12-24	2	f
1225	People	\n        Christmas day\n        open gifts\n        Julio & Jackie\n        play games\n        meet with Josiah & Sam	2016-12-25	12	f
1226	Grow	\n        think about life goals\n        4, 3, 1, 1\n	2016-12-25	2	f
1230	Tools	\n        automatic import of health scores from task file\n        reformat health score display\n        display five-star ratings	2016-12-26	4	f
1231	People	\n        visit with Andrew, Rachel, and Christine	2016-12-26	4	f
1232	Fun	\n        Blast from the Past, Back to the Future II & III\n	2016-12-26	6	f
1233	Write	\n        Facebook\n        Power of Genetics\n        Writing Stages\n        My Story\n        Processing Ideas	2016-12-27	4	f
1227	Church	\n        add leader views\n        build datatype creator\n        create general table display\n        create church login pages	2016-12-27	6	f
1234	Fun	\n        Everest\n	2016-12-27	4	f
1228	People	\n        lunch with Stacie at Mimi's\n        shopping for new office chair\n        game night with Leader family	2016-12-28	9	f
1229	Church	\n        work on church dashboard app\n        Dev Team meeting with Todd & Jenny\n        streamline display  of score detail\n        simplify event view\n        application refactoring	2016-12-28	5	f
1235	People	\n        Anniversary celebration at Greeley Chophouse with Garcias\n        follow up with Dale, David, and Rachel Ditto	2016-12-29	4	f
1236	Business	\n        Family Finance \n            Scorecard\n            Cash flow\n            Snapshot process\n            Budget\n            process for periodic review	2016-12-29	6	f
1237	Tools	\n        assemble new office chair	2016-12-29	2	f
1238	Grow	\n        create list of aspirations for Software Projects\n        create list of aspirations for Writing Projects\n        4, 2,\n	2016-12-29	2	f
1239	Hire	\n        build automatic layout for views\n        design and implement skill selector\n        update skill analysis views\n        discuss landing page	2016-12-30	5	f
1240	Write	\n        investment planning simulator/advisor	2016-12-30	3	f
1241	Grow	\n        start using new shaver\n        4, 1, 2, 1	2016-12-30	2	f
1242	Fun	\n        Last Man, Sliders\n	2016-12-30	4	f
1243	Tools	\n        remove .md suffix from spiritual/prayers files\n        project plan for Software Guru\n        project plan for Writing Guru\n        project plan for My Book Online\n        project plan for Brain	2016-12-31	4	f
1188	Church	\n        create five star rating display\n        figure out layout of pages using bootstrap layouts\n        create better score details page \n        improve scorecard view	2016-12-16	4	f
2907	Grow	\n        5, 1, 3, 4\n        walk to Subway\n        nts	2018-01-09	3	f
3503	People	    assemble grill\n    Biagi's with Diane & Greg Fleebe	2018-06-02	7	f
3504	Church	    	2018-06-02	0	f
3501	Tools	    	2018-06-02	0	f
1190	Fun	\n        Castle\n	2016-12-16	2	f
1192	Tools	\n        update score script\n        fix word counting script\n        expand editing tools for Seaman's Log	2016-12-17	2	f
1189	Grow	\n        wake up at 4 AM\n        nap\n        3, 4, 4, 3	2016-12-16	2	f
1318	Fun	\n        Tomorrow People, Legends, Voyager\n	2017-02-02	3	f
1319	Grow	\n        3, 3, 3, 2	2017-02-03	0	f
1320	Aspire	\n        create Aspire Milestones	2017-02-03	1	f
1321	Hire	\n        update project plans\n        change "Hiring Guru" to "Who 2 Hire"\n        host domains on Digital Ocean\n        fix automatic page sequencing during interview	2017-02-03	6	f
1322	Write	\n        create ideas about Beliefs and Extremism\n        commit to influence through writing\n        restructure directory of writing content	2017-02-03	3	f
1323	Fun	\n        Arrow, Supergirl, Legends, Flash\n	2017-02-03	4	f
1324	Grow	\n        5, 3, 4, 2	2017-02-04	0	f
1325	Write	\n        write political posts in Evernote\n        resolve to have a voice\n        Creative Non-fiction Lesson #1 with Stacie\n        document writing venues to develop	2017-02-04	3	f
1326	Church	\n        update plans for church\n        create Aspire documents\n        decide on website features	2017-02-04	3	f
1327	Fun	\n        White Queen, Voyager, Steve Jobs\n	2017-02-04	8	f
1328	Grow	\n        5, 4, 1, 2	2017-02-05	0	f
1329	Aspire	\n        count classes in code\n        create list of goals/milestones (not steps) for Aspire	2017-02-05	2	f
1330	Church	\n        church building is broken into\n        conflict over political extremism	2017-02-05	4	f
1331	People	\n        Royal Nepal restaurant\n        Superbowl party at Warrens\n        discuss 	2017-02-05	4	f
1332	Fun	\n        finish White Queen series\n	2017-02-05	4	f
1333	People	\n        meet Andrew for lunch to discuss ideas on marriage	2017-02-06	3	f
1334	Aspire	\n        update Aspire/Index, Aspire/ToDo, Aspire/Project\n        write Aspire/Purpose	2017-02-06	2	f
1335	Hire	\n        work on domain handling\n        review logo designs\n        fix issue with crash during editing skills\n        testing on Staging Server\n        fix end condition on interview sequence\n        financial projections with new $295 price point	2017-02-06	6	f
1336	Grow	\n        4, 2, 2, 2	2017-02-06	0	f
1337	Fun	\n        Enterprise\n	2017-02-06	3	f
1338	Grow	\n        awake from 2-5\n        3, 2, 3, 1\n        overwhelmed emotionally	2017-02-07	0	f
1339	Aspire	\n        calculate aspire summary for the week using hours and docs\n        build functions: text_table, table_text, sort_table\n        rename markdown_list_string, markdown_list_links\n        automatically import time daily\n        fix issue with automatic git pull on production server\n        solve pycharm refactoring issue	2017-02-07	5	f
1340	Write	\n        Memories of Hitler\n        12 days of Valentines\n        post 4 snippets on politics\n        Ideology: Thoughts on Politics\n        CS Lewis\n        add several articles to Spiritual Things	2017-02-07	4	f
1341	Hire	\n        clean up documents\n        complete name change to Who2Hire\n        prioritize all enhancements\n        Issue 58. Skills selection save\n        Issue 59. Hide "Edit Performance Skill" button	2017-02-07	3	f
1342	Church	\n        home group\n	2017-02-07	2	f
1343	Grow	\n        3, 2, 4, 2\n        wake up at 5:00\n        horrible wind\n        feeling depressed	2017-02-08	2	f
1344	Aspire	\n        calculate percentages on hours spent\n        update daily report the hours and docs for each project\n        create history for a project and save results\n        track Aspire history for each project automatically	2017-02-08	4	f
1345	Hire	\n        Issue 43. Scorecard layout\n        create report of interview process\n        create interview detail report\n        work on sequencing of interview pages	2017-02-08	4	f
1346	Church	\n        SoKM - teaching on relationships	2017-02-08	2	f
1347	People	\n        go with Stacie to Verizon store\n	2017-02-08	2	f
1348	Grow	\n        4, 4, 3, 2\n        watch John Ortberg about Shadow Mission\n        discuss spiritual health with Stacie\n        think about relying on God for emotional strength	2017-02-09	3	f
1349	Church	\n        evaluate current code structure\n        work on building a report from data	2017-02-09	2	f
1350	Hire	\n        Test on staging server\n        Issue 54. Smart list of interviewers\n        Reformat report pages\n        Simplify workflow of application\n        Improve appearance of views	2017-02-09	5	f
1351	Fun	\n        Crown, Dragonfly, Supergirl\n	2017-02-09	4	f
1352	Hire	\n        prep for meeting with Kyle and Terry\n        create templates from job openings\n        apply templates to new jobs\n        create list of templates\n        copy skills and questions during cloning\n        business meeting with Stacie to debrief after Terry and Kyle	2017-02-10	6	f
1353	Church	\n        build new views for church dashboard\n        Gerry and Cherry	2017-02-10	6	f
1354	Aspire	\n        build better hours report\n        capture tricks for working with dates	2017-02-10	2	f
1356	Hire	\n        Build counts summary logic\n        create table formatter code logic\n        document rules for astounding productivity\n        testing on staging\n        record new issues to resolve	2017-02-11	6	f
1357	Fun	\n        Investigate Jimi Hendrix Tour\n        Hidden Figures\n        Shield, Voyager	2017-02-11	8	f
1358	Grow	\n        3, 3, 3, 2\n	2017-02-10	0	f
1359	Grow	\n        5, 4, 3, 2\n	2017-02-11	0	f
1360	Write	\n        think about politics	2017-02-12	2	f
1361	Grow	\n        5, 4, 1, 2	2017-02-12	0	f
1362	Church	\n        Heidi taught (Beilmans at White Out)	2017-02-12	4	f
1363	Hire	\n        test in prep for Stacie's trip\n        review and refine interview template logic\n        discover broken interview recording logic	2017-02-12	4	f
1364	People	\n        meet with Josiah and Sam\n        lunch with Andrew, Rachel, Christine at El Cielo	2017-02-12	2	f
1314	Grow	\n        Amber cleaning\n        change smoke detector batteries during night\n        awake 3-6; sleep 6-9\n        3, 2, 3, 1	2017-02-02	2	f
1316	Aspire	\n        create web page to report details of activity (eg. /tasks/Grow)\n        create Life Aspire Project	2017-02-02	2	f
1315	Write	\n        thoughts on Push Back Against Fanaticism	2017-02-02	1	f
1370	Write	\n        discover Meetup #Resist\n        post on Facebook	2017-02-14	2	f
1371	Aspire	\n        create History files for each project\n        build logic to send simple guide message daily\n        create strategy for general purpose messages\n        write messages for Aspire (aspire/01 -  Goal, aspire/02 - Learn)	2017-02-14	5	f
1372	People	\n        grocery shopping for Valentine's dinner\n        cook dinner\n        Stacie returns from Kansas	2017-02-14	4	f
1373	Fun	\n        Shakespeare in Love\n	2017-02-14	3	f
1374	Hire	\n        review issues and milestones with Stacie\n        investigate Let's Encrypt\n        create Let's Encrypt Cookbook\n        setup staging server with the-very-idea.us domain\n        attempt to install certbot code	2017-02-15	5	f
1375	Aspire	\n        new ideas about Aspire usability\n        write Aspire User Guide\n        write Aspire User Report\n        design message sequence for milestones	2017-02-15	4	f
1376	Church	\n        SoKM	2017-02-15	4	f
1377	Fun	\n        Voyager	2017-02-15	1	f
1378	Grow	\n        long walk\n        5, 3, 3, 5\n	2017-02-15	0	f
1379	Grow	\n        long walk\n        5, 3, 4, 4	2017-02-16	0	f
1380	Aspire	\n        document - Index, Purpose, Goals, Learn, Build\n        aspire/02 - Learn\n        aspire/03 - Plan\n        aspire/04 - Build\n        update User Guide	2017-02-16	5	f
1381	Hire	\n        document Design Patterns\n        experiment with view patterns: Data Table, Data Detail, Data Form\n        discuss next steps with Stacie\n        fix error in app source\n        use domain in scripts (the-very-idea.us)\n        update project plans and documents\n        plan design review content\n        discuss encryption and payment systems with Eric	2017-02-16	6	f
1382	Fun	\n        Shield, Brooklyn 99\n	2017-02-16	3	f
1383	Grow	\n        2, 3, 3, 3\n        wake up at 2:00, attempt to sleep until 4:30	2017-02-17	0	f
1384	Hire	\n        placed logo artwork in banner\n        create change password view\n        address workflow for changing password\n        rebuild hire_theme.html\n        standardized use of CSS\n        fix font sizes and layout in banner	2017-02-17	8	f
1385	Aspire	\n        aspire/05 - Teach\n        write Aspire Guide\n        write Guide Author\n        review data model 	2017-02-17	4	f
1386	Fun	\n        This is Us	2017-02-17	2	f
1387	People	\n        Christine's car and pharmacy job\n	2017-02-17	0	f
1388	Grow	\n        awake during night 11-3\n        think about prophesy in modern life\n        1, 3, 2, 3	2017-02-18	3	f
1389	Write	\n        Facebook	2017-02-18	3	f
1390	Fun	\n        copy music from Hammer to iMac	2017-02-18	1	f
1391	Hire	\n        create LetsEncrypt Cookbook\n        debug LetsEncrypt process\n        review progress with Eric	2017-02-18	3	f
1392	People	\n        pick up Christine's car after repairs\n        Lucky Fin's with Howells\n        discuss writing with Stacie\n	2017-02-18	4	f
1393	Grow	\n        walk\n        5, 3, 3, 4	2017-02-19	2	f
1394	People	\n        lunch at Panera with Andrew & Rachel\n        discuss writing with Stacie	2017-02-19	3	f
1395	Fun	\n        copy music to iMac\n        learn how to use iTunes to organize music\n	2017-02-19	5	f
1396	Grow	\n        walk\n        3, 3, 3, 5	2017-02-20	2	f
1397	Business	\n        tax preparation\n        gather receipts for trip expenses\n        sort through inbox\n        create updated records for money	2017-02-20	6	f
1398	Write	\n        Watch What You Say\n        Pizza and Prison\n        write to Dad about Greece	2017-02-20	2	f
1399	Fun	\n        watch Timeless\n        listen to music on iMac\n	2017-02-20	4	f
1400	Grow	\n        5, 3	2017-02-21	0	f
1401	Write	\n        Watch What You Say\n        Pizza and Prison\n        Bag of Potatoes\n        Incoming\n        write to Dad about Greece\n        write David Ditto\n        Build a Dictator	2017-02-21	6	f
1402	Hire	\n        update Lets Encrypt Cookbook\n        work on Lets Encrypt for Production Server\n        think through server strategy	2017-02-21	4	f
1403	Church	\n        game night at small group\n	2017-02-21	4	f
1404	Grow	\n        wake at 1:30  (2 hours rest)\n        2, 3, 3, 2	2017-02-22	1	f
1405	Write	\n        Search for Freedom\n        Hippie Years	2017-02-22	2	f
1406	Hire	\n        create new droplet at Digital Ocean\n        create plan for encryption\n        create new server cookbook\n        configure hire scripts for ops commands\n        setup root access with ssh keys\n        configure django user\n        set up git repos	2017-02-22	3	f
1407	Business	\n        tax meeting with Diane Alexander	2017-02-22	2	f
1408	People	\n        Butters for tax celebration	2017-02-22	2	f
1409	Church	\n        SoKM\n	2017-02-22	4	f
1411	Fun	\n        Kindness Diary\n        Shield	2017-02-23	4	f
1412	Grow	\n        5, 3, 3, 2\n        Stacie bought pillows on Amazon\n	2017-02-23	2	f
1413	Hire	\n        create 2017-02-24 code branch\n        update and test on production server\n        add questions to skills library\n        add menu item for Interview Sessions\n        improve creation of jobs from templates\n        Beta Release 2\n        improve Job Opening page	2017-02-24	8	f
1414	Grow	\n        4, 3, 1, 2\n        learn new night meditation techniques\n        enjoy Jedi soft snuggy	2017-02-24	2	f
1415	People	\n        lunch with Stacie at Sol de Jalisco	2017-02-24	2	f
1416	Fun	\n        Titanic\n	2017-02-24	2	f
1417	Grow	\n        3, 3, 3, 2\n        nap	2017-02-25	2	f
1418	Tools	\n        update plans and accomplishments\n        fix issue with x command script	2017-02-25	2	f
1474	Church	\n        discuss prophesy and church leadership with Stacie\n        get books on prophesy\n	2017-03-10	2	f
1367	Grow	\n        5, 2, 3, 2	2017-02-13	0	f
1369	Grow	\n        5, 3, 3, 3	2017-02-14	0	f
1368	Fun	\n        Dragonfly\n	2017-02-13	4	f
1423	People	\n        lunch at Romas with Christine, Andrew and Rachel	2017-02-26	2	f
1424	Write	\n        Freedom, Rights, Incoming Airplanes	2017-02-26	4	f
1425	Fun	\n        This is Us, SNL skits, Amazing Race\n	2017-02-26	4	f
1427	Business	\n        business review with Eric\n        tax preparation meeting with Diane	2017-02-27	3	f
1428	Hire	\n        begin building user administration view\n        begin building test results display	2017-02-27	2	f
1429	Grow	\n        5, 4, 3, 2	2017-02-27	0	f
1430	Fun	\n        Star Trek\n	2017-02-27	1	f
1431	Hire	\n        layout table for user admin\n        create view for system logs\n        display test results in test view\n        create general purpose layouts for pages\n        debug django_project server (config, start, stop, status)\n        debug MyBook server (config, start, stop, status)\n        run all tests\n        test superuser capability\n        document server setup	2017-02-28	9	f
1432	Grow	\n        awake and working 2-4\n        2, 4	2017-02-28	2	f
1433	Grow	\n        4, 2, 2, 2	2017-03-01	0	f
1434	Tools	\n        create days.py command script\n        reset monthly history file\n        improve display of test results (web test)	2017-03-01	2	f
1435	Hire	\n        solve problem with ALLOWED_HOSTS\n        update deployment to new server\n        use SSL to implement secure server\n        automatic redirect to secure server\n        testing and deployment of new code	2017-03-01	6	f
1436	Church	\n        SoKM	2017-03-01	4	f
1437	Fun	\n        Rick Steves\n        book hotel and train in Paris\n	2017-03-01	2	f
1438	Write	\n        post What You Say\n        Classical Greece	2017-03-02	2	f
1439	Hire	\n        move database from MyBookOnline.org to Who2Hire.co\n        create who2hire branch in git\n        enable daily backup on MyBookOnline.org\n        test data save and data backup on who2hire.co\n        create release plan for who2hire  2017-03-03\n        back out superuser login code	2017-03-02	5	f
1440	People	\n        Summit with Stacie\n        library	2017-03-02	2	f
1441	Church	\n        board meeting	2017-03-02	3	f
1442	Fun	\n        Star Trek, Watchmen	2017-03-02	2	f
1443	Grow	\n        4, 3, 3, 2\n	2017-03-02	0	f
1444	Hire	\n        review and update plan for Customer Release 1.0\n        setup cron tasks\n        create who2hire prompt\n        create hire promote\n        fix problem with company_list\n        fix problem with company_detail\n        testing on who2hire server\n        release decision	2017-03-03	8	f
1445	Fun	\n        Timeless, This is Us, Last Man	2017-03-03	4	f
1446	Grow	\n        think about life goals\n        nap\n        4, 3, 3, 2\n	2017-03-03	2	f
1447	Grow	\n        nap\n        walk to library\n        5, 3, 3, 2	2017-03-04	2	f
1448	Church	\n        fix user login on macbook\n        fix aspire todo Church\n        update plan for Church work\n        decide on user experience of Church report	2017-03-04	4	f
1449	Aspire	\n        think about design patterns to use on Aspire\n        design 8 levels of structure for data nodes\n        create views for nodes	2017-03-04	3	f
1450	Fun	\n        Interstellar, Dragonfly\n	2017-03-04	5	f
1451	Church	\n        lunch with Clint and Mary	2017-03-05	6	f
1452	Aspire	\n        think about design patterns to use on Aspire\n        think about test strategy	2017-03-05	2	f
1453	Grow	\n        4, 3, 3, 2\n        nap	2017-03-05	1	f
1454	Fun	\n        Enterprise, Dragonfly, Timeless\n	2017-03-05	5	f
1455	Aspire	\n        think about design patterns to use on Aspire\n        update documents for Back-end construction\n        create Node data scripts\n        build tests and debug node logic	2017-03-06	4	f
1456	Hire	\n        recreate database from old production system\n        save Who2Hire server as Docker Image\n        create who2hire-staging from Image\n        document Server Image (how to create servers)\n        deploy and test new production code\n        update operations scripts	2017-03-06	6	f
1457	Grow	\n        4, 3, 4, 2	2017-03-06	0	f
1458	Church	\n        pray for Daryl Howell	2017-03-06	1	f
1459	Fun	\n        Madam Sec, Crown, Fraiser\n	2017-03-06	3	f
1460	Hire	\n        test existing server setup\n        refine operations policies\n        test for switches and settings code\n        improve scripts for server management\n        update ops script to access all servers\n        add title to staging server web pages	2017-03-07	7	f
1461	Fun	\n        Jimi Hendrix concert	2017-03-07	7	f
1462	Grow	\n        4, 4, 4, 4\n	2017-03-07	0	f
1463	Hire	\n        debug proxied user views\n        create reusable solution for superuser proxies\n        create menu items for superuser proxy\n        deploy user proxy code to staging server\n        testing of new UI with Stacie\n        color coding for proxied users\n        reset production database	2017-03-08	9	f
1464	Business	\n        sign tax documents for Shrinking World	2017-03-08	1	f
1465	Church	\n        SoKM	2017-03-08	4	f
1466	Grow	\n        3, 2, 3, 2\n	2017-03-08	0	f
1468	People	\n        homemade pizza	2017-03-09	1	f
1469	Fun	\n        Crown, Fraiser	2017-03-09	4	f
1470	Grow	\n        2, 3, 3, 1\n	2017-03-09	0	f
1471	Hire	\n        ops release \n        create 2017-03-10 branch \n        update Django to 1.9.4\n        testing on who2hire server\n        quiet testing on five servers\n        build hiring admin view\n        server automation scripting	2017-03-10	8	f
1472	Business	\n        discuss Creative Leap	2017-03-10	1	f
1420	People	\n        discuss life and dreams with Stacie	2017-02-25	1	f
1422	Grow	\n        5, 3, 4, 3	2017-02-26	0	f
1421	Fun	\n        Queen of Katwe, Pete's Dragon\n        This is Us\n	2017-02-25	5	f
1479	People	\n        A. Bay beach day\n        evening walk with Stacie\n        discuss article about Peter Thiel	2017-03-13	6	f
1480	Aspire	\n        build Markdown reader logic (outline parser)	2017-03-13	2	f
1481	Fun	\n        Furious 7\n        Edge of Eternity\n	2017-03-13	6	f
1482	People	\n        Hapuna beach (picnic lunch)\n        dinner for Vito and Christine	2017-03-14	6	f
1483	Aspire	\n        build Outline Reader and Formatter\n        round trip: Markdown --> Outline Tree --> Markdown	2017-03-14	4	f
1484	Fun	\n        Furious 7\n        Force Awakens\n	2017-03-14	4	f
1485	People	\n        swimming at Kailua Suites\n        lunch at Lava Lava\n        BBQ steaks	2017-03-15	8	f
1486	Write	\n        creative non-fiction - Lesson 3	2017-03-15	2	f
1487	Fun	\n        Force Awakens\n        Dr Strange\n	2017-03-15	4	f
1488	People	\n        BBQ chicken\n        Lava Lava and sunset\n        walk around fish ponds\n        walk to King's Land	2017-03-16	4	f
1489	Fun	\n        Dr Strange\n        Jackie	2017-03-16	4	f
1490	Write	\n        Revolution\n        Under the Fireball	2017-03-16	4	f
1491	Tools	\n        Fix tests\n	2017-03-16	2	f
1492	Fun	\n        debate going to Hilton \n        learn about Volcanoes	2017-03-17	12	f
1493	Write	\n        create Index for Freedom book\n	2017-03-17	2	f
1494	Fun	\n        drive to Kiluea\n        Eat at Kona Brewing Company and Cafe Pesto\n	2017-03-18	14	f
1495	Business	\n        unpack\n        lost suitcase	2017-03-19	2	f
1496	Grow	\n        nap after trip\n        personal reflection	2017-03-19	4	f
1497	Fun	\n        return from Hawaii\n	2017-03-19	8	f
1499	Hire	\n        update to Django 1.9.4\n        update who2hire branch\n        test on production server\n        create document display logic\n        document Release Notes, Engineering Log, Design Patterns\n        learn about Stripe\n        make first test charge	2017-03-20	6	f
1500	Fun	\n        Madam Sec, Dragonfly\n	2017-03-20	5	f
1501	Grow	\n        difficulty sleeping through night\n        4, 1, 3, 1	2017-03-21	1	f
1502	Hire	\n        Issue 83. Main menu disappears on small window\n        Issue 34. Help link on banner\n        Refactor template code for theme	2017-03-21	4	f
1503	Tools	\n        build new MyBook Server\n        build new cookbook for MyBook server\n        update tests on all servers\n        host exteriorbrain.com and mybookonline.org	2017-03-21	4	f
1504	Business	\n        post blog article\n        discuss Creative Leap with Stacie	2017-03-21	1	f
1505	Church	\n        Small group	2017-03-21	3	f
1506	Fun	\n        comic books\n	2017-03-21	1	f
1507	Tools	\n        fix failing tests\n        build map of domain setup (22 domains)\n        create map of domains\n        move all domains to new server\n        enable security\n        turn off old server	2017-03-22	4	f
1508	Grow	\n        refill meds\n        walk\n        3, 1, 3, 4	2017-03-22	2	f
1509	Tools	\n        write Landing Page\n        create map of Web Services\n        document Domains to build out	2017-03-23	3	f
1510	Hire	\n        learn more about Stripe\n        create interactive payment\n        build form to submit payment to Stripe\n        debug payment amounts (not yet complete)	2017-03-22	4	f
1511	Fun	\n        This is Us\n	2017-03-22	4	f
1512	Hire	\n        solve issue with posting of payments\n        create User Guide - starter page\n        Issue 39. Payment system: workflow, payment, account page\n        work with Stacie on user experience\n        figure out gunicorn restart needed\n        System log failure	2017-03-23	5	f
1513	Church	\n        SoKM video at home	2017-03-23	3	f
1514	Fun	\n        comic book	2017-03-23	2	f
1515	Grow	\n        walk\n        4, 2, 3, 3\n	2017-03-23	1	f
1516	Grow	\n        5, 3, 1, 2	2017-03-24	0	f
1518	Grow	\n        5, 2, 2, 1	2017-03-25	0	f
1519	Tools	\n        review operational status\n        build demo views 1-5\n        document Reusable Apps Back-end code\n        create MyBook application\n        learn about login management\n        rework application templates\n        build new header structure	2017-03-25	8	f
1520	Fun	\n        This is Us\n	2017-03-24	4	f
1521	People	\n        Rachel's birthday party	2017-03-25	4	f
1522	Fun	\n        Electra, Voyager\n	2017-03-25	2	f
1523	Business	\n        drive to Boulder to meet with Greg McGutchan	2017-03-26	6	f
1524	Fun	\n        Rick Steves, Crown	2017-03-26	4	f
1525	Grow	\n        3, 1, 2, 2\n	2017-03-26	0	f
1526	Hire	\n        learn about CSS\n        build demo views 5-6\n        create new Shrinking World Page Layout template\n        solve problems with main menu and page header\n        build general login\n        debug general logout\n        fix Issue 34 - blemish on banner \n        fix Issue 97 - interview for templates\n        fix Issue 96 - clean up production data\n        fix Issue 89 - DEBUG on who2hire\n        fix Issue 90 - Django 1.10.6\n        fix Issue 82 - rewrite Opening Edit view\n        Superuser page security\n        Learn about LoginRequiredMixin, and UserPermissionRequiredMixin	2017-03-27	12	f
1527	Fun	\n        This is Us\n	2017-03-27	2	f
1528	Grow	\n        2, 2, \n	2017-03-28	0	f
1529	Tools	\n        create landing pages and page routing for all websites\n        deploy new web apps\n        testing of church app on production server\n        create dynamic titles on websites\n        create dynamic menus on websites	2017-03-28	8	f
1530	Church	\n        church board meeting	2017-03-28	4	f
1531	Hire	\n        Issue 95. Staging database cleanup\n        Issue 96. Production database cleanup	2017-03-28	2	f
1476	Write	\n        Mauna Kea at first light	2017-03-12	2	f
1477	People	\n        lunch at food court\n        dinner at condo\n        nap & pool\n        walk around golf course	2017-03-12	8	f
1478	Fun	\n        Passengers\n        Edge of Eternity\n\n	2017-03-12	4	f
1556	Hire	\n        fix question assignments\n        send notifications to proper recipients\n        learn about Stripe email receipts	2017-04-05	6	f
1558	Church	\n        SoKM\n	2017-04-05	4	f
1559	Grow	\n        personal planning & creativity\n        5, 2,	2017-04-06	2	f
1562	Hire	\n        branch merges with who2hire & master\n        fix minor issues\n        build landing page\n        create new artwork for landing page\n        work with Stacie on open issues	2017-04-06	6	f
1564	Fun	\n        Shield\n	2017-04-06	2	f
1565	Tools	\n        work on aspire redirect\n        remove aspire logic; use mybook doc formatter\n        build plan script	2017-04-07	0	f
1567	Hire	\n        delete old used repos at Github\n        create new Who2Hire repo at Github\n        create recipe for building application from git repo\n        debug app install on macbook	2017-04-08	6	f
1568	Grow	\n        nap\n        3, 1, 4, 1\n        food: 1800\n            granola, kifer, sandwich, trail mix\n            hot dog-quesadilla, cottage cheese, ice cream	2017-04-08	2	f
1569	Fun	\n        Iron Fist, Timeless, Three Musketeers\n	2017-04-08	6	f
1570	Tools	\n        enable MyBook doc display UI	2017-04-09	2	f
1571	Church	\n        Brain McLees	2017-04-09	4	f
1572	People	\n        Julio & Jackie	2017-04-09	2	f
1573	Fun	\n        Choice, Recruit\n        Sign Their Lives Away	2017-04-09	5	f
1578	Grow	\n        personal reflection\n        5, 2, 3, 3\n	2017-04-09	1	f
1574	Hire	\n        deploy new repo on staging server\n        build document UI\n        testing on staging server\n        build recipe for Who2Hire server from repo	2017-04-10	4	f
1575	Aspire	\n        debug UI of mybook: book,author\n        debug UI of aspire: project,client\n        debug on new production server of MyBook\n        create book objects for mybook	2017-04-10	4	f
1576	People	\n        first home made pizza	2017-04-10	2	f
1577	Fun	\n        Madam Sec	2017-04-10	3	f
1579	Grow	\n        5, 4, 2, 4\n	2017-04-10	1	f
1580	Grow	\n        5, 3, 3, 3	2017-04-11	0	f
1581	Hire	\n        network problems at Digital Ocean\n        fix problem with sending messages on staging server	2017-04-11	1	f
1583	Write	\n        WorkMindsets\n        1000 Goals\n        develop content for Leverage website\n        create menu for Leverage book\n        build content for MarkSeaman.org 	2017-04-11	4	f
1584	People	\n        dinner with Diane and Greg McFleebe	2017-04-11	2	f
1585	Fun	\n        Crown, Fraiser\n	2017-04-11	2	f
1586	Aspire	\n        update document files for Aspire\n        simplify AspireDoc view logic\n        reset database on MyBook server\n        debug Role views and UX\n        rework routing for aspire docs \n        rework permissions checking for doc loading	2017-04-12	6	f
1588	Fun	\n        Legends, DS9	2017-04-12	1	f
1589	Grow	\n        walk\n        5, 3, 3, 3\n	2017-04-12	1	f
1590	Hire	\n        fix production payment system\n        experiment with PDF doc creation\n        evaluate wkhtmltopdf tool\n        debug on local machine\n        failed attempt to create PDF on servers	2017-04-13	5	f
1542	Fun	\n        Looking Glass, library, Dec. of Indep.	2017-04-01	5	f
1543	Grow	\n        think about life goals\n        4, 3, 3, 2\n	2017-04-01	2	f
1557	Church	\n        lunch at Rio with Warrens and Potters	2017-04-02	6	f
1544	People	\n        Andrew and Carcasonne	2017-04-02	2	f
1546	Fun	\n        Emma, Last Crusade\n    	2017-04-02	4	f
1547	People	\n        lunch with Tristan to discuss his career	2017-04-03	3	f
1550	Hire	\n        build report content for an opening\n        work on logic for assigning questions to interviewers\n        enable payments for testing	2017-04-04	5	f
1551	Tools	\n        create new code generator for views\n        debug code templates\n        build mybook/author\n        build mybook/book\n        build reusable context	2017-04-04	4	f
1552	Grow	\n        reading and writing about America and Freedom\n        Amber cleaning & work at library\n        4, 3, 2, 2	2017-04-04	1	f
1553	Church	\n        small group potluck\n	2017-04-04	4	f
1560	Grow	\n        build up personal goal review notes\n        5, 2, 1, 4	2017-04-07	1	f
1561	Hire	\n        release 2017-03-07\n        testing on production server\n        create new project directory structure\n        create new git repo\n        debug Who2Hire application code	2017-04-07	8	f
2909	Fun	\n        Flash	2018-01-08	4	f
2910	People	\n        talk with Stacie\n	2018-01-08	1	f
2911	Teach	\n        fix FTP server\n        admit Erick into class\n        develop class schedule\n        create students page	2018-01-09	3	f
2912	Tools	\n        organize brain content	2018-01-09	3	f
3506	Grow	    4, 3, 1, 4\n    walk\n    start Power of Habit	2018-06-01	1	f
1532	Tools	\n        build pages and menus for Software website\n        create Leverage pages\n        create Web Dev pages\n        create Best Practices pages	2017-03-29	2	f
2913	People	\n        Pelican Lakes - Lady's night	2018-01-09	2	f
1535	Hire	\n        build notification messages\n        figure out user experience for payments\n        debug payment code\n        clean up user experience	2017-03-30	6	f
1555	Tools	\n        extend My Book main menu\n        show author views\n        show book views\n        website navigation	2017-04-05	3	f
1536	Tools	\n        restructure web services code\n        debug alternatives for different domains	2017-03-30	4	f
1537	People	\n        discuss work anxiety related to work modes\n        visit Rachel & Andrew\n	2017-03-30	4	f
1538	Hire	\n        build release 2017-03-31\n        roll production Django to 1.10.6\n        turn off DEBUG flag\n        review all issues	2017-03-31	6	f
1539	People	\n        Nordy's with Stacie	2017-03-31	2	f
1693	Aspire	\n        update writing scorecard\n        document implementation process	2017-01-15	2	f
1554	Grow	\n        personal reflection\n        5, 3, 2, 2	2017-04-05	1	f
1534	Church	\n        SoKM\n	2017-03-29	4	f
1630	Business	\n        develop idea of writing scorecard\n        build initial scorecard snapshot 2016-12-30\n        write Web App Dimensions\n        App Development - project catalog	2017-01-01	3	f
3248	Grow	\n        3, 1\n        start thinking about Principles (mid-night)\n        read Principles & get audio book	2018-03-31	4	f
3245	Teach	\n        spend all day at UNC\n        Lesson 29 - Brain, Web Design Guidelines\n        talk with Carmayne and Mehrgan\n        grade blog 4\n        prep for Image lectures	2018-03-30	7	f
1599	Hire	\n        fix payments	2017-04-15	1	f
1601	Grow	\n        3, 4, 1, 3	2017-04-16	0	f
1603	People	\n        Easter at Garcia's\n        walk with Rachel\n        Rachel and Andrews cat	2017-04-16	6	f
1604	Fun	\n        Timelapse, Kimmy, Fraiser, Iron Fist\n\n	2017-04-16	4	f
1608	Fun	\n        Good Place, explore\n	2017-04-17	4	f
1610	Hire	\n        add flag for is_active to opening\n        build view to send opening to archive\n        build view to display archived openings\n        deploy on staging\n        create menu for archive view\n        update issues and milestones\n        add manager notes	2017-04-18	6	f
1611	Fun	\n        Enterprise, Elektra	2017-04-18	2	f
1614	WAM	\n        review system logs to track mysteries	2017-04-19	1	f
1613	Grow	\n        nap\n        2, 1, 3, 2	2017-04-19	2	f
1617	Grow	\n        3, 2, 2, 2	2017-04-20	0	f
1618	Hire	\n        build candidate setting into archive view\n        refactor archive view code\n        add info to job report\n        select chosen candidate from list of candidates\n        add view to send job to archive\n        add form error processing	2017-04-20	8	f
1619	Tools	\n        create simple doc app in MyBook\n        build complete data views for doc	2017-04-20	2	f
1621	Fun	\n        Goldbergs, Enterprise, Elektra\n	2017-04-20	4	f
1620	Tools	\n        create list of tasks for Aspire and MyBook\n        move doc when renaming\n        show page after edit\n        think about commercialization of MyBook\n        add directory to Aspire site\n        isolate doc as application\n        debug document browser	2017-04-21	8	f
1622	People	\n        Fleebees party	2017-04-21	3	f
1623	Grow	\n        think about personal journey\n        3, 3, 4, 1	2017-04-21	1	f
1624	Fun	\n        Tesla\n	2017-04-21	2	f
1625	Write	\n        Lesson 7 - Page Turners	2017-04-22	2	f
1626	Tools	\n        create doc index page\n        test and fix on web sites\n        security on doc/* pages	2017-04-22	4	f
1627	Grow	\n        3, 4, 3, 3	2017-04-22	2	f
1640	Church	\n        discussed church budget process with Stacie\n        home group at Howell's	2017-01-03	4	f
1641	Fun	\n        finish That Hideous Strength\n	2017-01-03	2	f
1592	Grow	\n        walk with Stacie\n        5, 3, 4, 4	2017-04-13	1	f
1593	Fun	\n        Crown, Good Place\n	2017-04-13	3	f
1594	Aspire	\n        total hours to invest\n        create container design pattern for related view sets\n        create RoleView redirect\n        display nested roles and projects\n        fix project delete\n        deploy and test\n        role totals	2017-04-14	4	f
1595	Grow	\n        get haircut\n        5, 3,	2017-04-14	1	f
1597	Grow	\n        watch Requiem to the American Dream\n        read Design Your Life\n        walk to library\n        suffering from alergies\n        discuss church attitudes with Stacie\n        nap\n        5, 3, 3, 4	2017-04-15	6	f
1598	Aspire	\n        build Goal data type\n        create AspireDocEdit view\n        use RedirectView\n        clean up user sequence	2017-04-15	4	f
1600	Fun	\n        IQ, Electra\n	2017-04-15	3	f
1602	Church	\n        Easter	2017-04-16	4	f
1605	Grow	\n        hide inside to avoid allergies\n        5, 2, 2, 1	2017-04-17	1	f
1609	Aspire	\n        build content for Aspire project plans\n        build Software DevWorkflow	2017-04-18	2	f
1612	Grow	\n        3, 1, 2, 1\n	2017-04-18	0	f
1615	Aspire	\n        build directory listing with two levels\n        create project list for AspireDoc page\n        create role list for AspireDoc Home page\n        improve site navigation\n        restructure Aspire project goals content \n        improve automatic doc versioning	2017-04-19	7	f
1616	Church	\n        SoKM\n	2017-04-19	4	f
1637	Hire	\n        investigate file upload\n        build form to select file to upload\n        create resume file on server\n        design static server solution for resumes\n        testing on uploading files\n        fix document encoding problems\n        create To Do list for actions	2017-01-03	6	f
1638	Write	\n        Facebook & Email\n        create drafts from ideas\n        capture patterns for software development\n        select notes to work on	2017-01-03	2	f
1642	Write	\n        organize notes (create Write folder in Evernote)\n        create outline for Seaman's Guides\n        gather notes for writing projects\n        post invitation to Seaman's Log	2017-01-04	4	f
1694	Fun	\n        Ike	2017-01-15	4	f
2914	Fun	\n        Amazing Race, Timeless\n	2018-01-09	3	f
1628	Church	\n        baptism service\n        lunch with Matt & Amber Isborn at Royal Nepal	2017-01-01	6	f
1695	Grow	\n        5, 5, 4, 3\n	2017-01-15	0	f
2916	Teach	\n        develop lesson 2\n        campus emergency	2018-01-10	9	f
2918	Fun	\n        Amazing Race, This is Us\n	2018-01-10	2	f
2919	Grow	\n        5, 2, 4, 2\n        nts	2018-01-11	3	f
2915	Grow	\n        4, 1, 3, 3	2018-01-10	0	f
2917	People	\n        talk with Stacie\n        visit Greeley History Museum\n        Andrew stuck with needle	2018-01-10	3	f
3246	Fun	\n        learn about Vikings\n        look for books about Vikings	2018-03-30	2	f
1629	People	\n        meet with Josiah	2017-01-01	1	f
1639	Grow	\n        talk with Stacie about future ideas\n        visit library\n        Pelican Lakes for lunch\n        5, 2, 3, 3	2017-01-03	0	f
1632	Fun	\n        Perfect Pitch 2, Maze Runner\n        Mystery of Roanoke\n	2017-01-01	3	f
1631	Grow	\n        nap\n        4, 2, 2, 2	2017-01-01	1	f
3247	People	\n        visit with Lucy, Andrew, and Rachel\n    	2018-03-30	2	f
1651	Write	\n        build writing workflow\n        investigate software development productivity 2014-2016\n        write article on productivity\n        Convert Dreams to Reality\n        Aspire Project Plan\n        update App Development Projects\n        Software Development Planning\n        The Twenty-day Software Project	2017-01-06	5	f
1652	Grow	\n        5, 2, 2, 2	2017-01-06	0	f
1653	Fun	\n        Spectre, Fraiser\n	2017-01-06	4	f
1654	Write	\n        review weekly progress\n        author script\n        outline for Computer Tools for Writing\n        outline Staying on Track with Writing\n        build on ideas for Aspire system\n        update writing scorecard	2017-01-07	5	f
1655	Tools	\n        build author script\n        develop scoring for writing projects\n        capture writing scorecard\n        learn about regular expressions in Python	2017-01-07	4	f
1656	Grow	\n        5, 3, 3, 2	2017-01-07	0	f
1657	People	\n        play games with Leaders	2017-01-07	4	f
1658	Fun	\n        visit library\n	2017-01-07	1	f
1659	People	\n        lunch with Potters and Garcias\n        meet with Josiah & Sam\n        talk with Stacie about Courtney	2017-01-08	3	f
1660	Grow	\n        fix door knob in study\n        5, 3, 3, 3	2017-01-08	0	f
1661	Write	\n        write Shrinking World News\n        create model for Software Development investment by phase	2017-01-08	2	f
1662	Fun	\n        Social Network\n        White Queen\n        The Realm\n	2017-01-08	5	f
1663	Hire	\n        select questions for each interviewer\n        rebuild interactive interview page\n        update session list\n        build script to list sessions\n        update Interview Response objects\n        build interview data model\n        debug issue with business logic	2017-01-09	8	f
1664	Write	\n        Facebook posts\n        send Shrinking World News\n        update notes on Planning Process	2017-01-09	2	f
1665	Fun	\n        This is us, Madam Sec	2017-01-09	4	f
1666	Grow	\n        4, 2, 4, 2\n	2017-01-09	0	f
1667	Church	\n        Fix defect with date on event\n        Planning for church leadership dashboard	2017-01-10	2	f
1668	Aspire	\n        Project planning template\n        create Aspire Data model	2017-01-10	2	f
1669	Hire	\n        restyle registration page\n        relayout login controls\n        build new landing page\n        investigate CSS form styles and layouts\n        investigate data problems with session linking\n        simplify code for sessions\n        post PDF for skill analysis\n        rebuild login sequence	2017-01-10	6	f
1670	Business	\n        get approval for HELOC \n        send out newsletter	2017-01-10	1	f
1671	Grow	\n        5, 4, 3, 1	2017-01-10	0	f
1672	Fun	\n        DS9, Sliders, Fraiser\n	2017-01-10	3	f
1673	Business	\n        sign papers for HELOC	2017-01-11	1	f
1674	Church	\n        meet with Todd & Jenny\n        SoKM	2017-01-11	6	f
1675	People	\n        Stacie dinner	2017-01-11	1	f
1676	Aspire	\n        project planning - Data Model, Views, UX,\n        create initial messages for Dispatcher\n        build list of desired projects\n        create idea for Goal Scripts and Message Schedule	2017-01-11	2	f
1677	Hire	\n        fix missing interview sessions\n        work on super user logic\n        styling on views\n        testing on server\n        improve login/logout logic and style\n        application refactoring	2017-01-11	4	f
1678	Grow	\n        5, 4, 3, 3\n	2017-01-11	0	f
1679	Hire	\n        broken list of companies\n        redirect from super user home\n        Super user for Company and Skills\n        fix display of sessions for interviewers\n        Redirect after session delete\n        style for company add view\n        hide candidate application from interviewers	2017-01-12	5	f
1680	Aspire	\n        build concept of Objectives\n        Glossary of Concepts\n        Terminology\n        organize project notes\n        build Objective for Aspire\n        build Objective for Hiring Guru	2017-01-12	5	f
1681	Fun	\n        Palaminos for Christine's birthday\n        Circ Du Sole	2017-01-12	4	f
1682	Grow	\n        5, 4, 3, 3\n	2017-01-12	0	f
1683	Hire	\n        Sort Performance skills\n        Remove menu icons for sub-menu\n        Activate sub-menu items\n        Rework main menu	2017-01-13	4	f
1684	Aspire	\n        lunch with Todd to discuss Aspire\n        Aspire - SW Dev - #1, #2\n        create data model diagram\n        write marketing pitch\n        develop template for Guide	2017-01-13	6	f
1685	Fun	\n        Sherlock, Enterprise	2017-01-13	4	f
1686	Grow	\n        5, 4, 3, 3\n	2017-01-13	0	f
1687	Aspire	\n        begin building aspire system\n        create Django app\n        create document storage structure for user data\n        simplify material template theme\n        build user data for real projects	2017-01-14	5	f
1688	People	\n        Macaroni Grill with Stacie	2017-01-14	2	f
1689	Fun	\n        Arrival, Dragonfly in Amber	2017-01-14	7	f
1690	Grow	\n        4, 5, 4, 3\n        	2017-01-14	0	f
1691	Church	\n        church service\n        work on church board issues\n        plan next steps for dashboard\n        document budgeting rules\n        long-term debt policy and net worth calculator\n        develop scoring system for church dashboard\n        build template for weekly report	2017-01-15	6	f
1644	Grow	\n        5, 3, 2, 3	2017-01-04	1	f
3508	Fun	    Black Panther	2018-06-01	3	f
4112	Fun	    Finish Circle book\n    Mr Robot, Homeland\n    	2018-10-15	3	f
4113	People	    Stacie returns home\n    visit with Leslie	2018-10-15	2	f
4111	Teach	    help Cosme\n    	2018-10-15	8	f
1645	Fun	\n        Hot Pursuit, Kingdom Strange\n	2017-01-04	4	f
1648	Grow	\n        wake up at 5:00 and start working\n        nap at 9:00\n        3, 2, 2, 3	2017-01-05	1	f
1649	Fun	\n        Super Girl, Enterprise\n	2017-01-05	4	f
1650	Hire	\n        work with Stacie on workflow\n        relayout team list and add views\n        deploy new code\n        build general display view with field table\n        add password to files\n        add question selector view\n        update Hiring Guru release plan\n        update Hiring Guru documentation	2017-01-06	5	f
1703	Business	\n        FCIP	2017-01-17	4	f
1704	Grow	\n        5, 5, 3, 2\n	2017-01-17	0	f
1705	Aspire	\n        create history linked to reports\n        fix failing tests after setting up staging server\n        continue building project profiles and reports\n        formatted links in reports\n        simplify URL patterns	2017-01-18	5	f
1706	Hire	\n        begin building script to list response objects\n        update release planning\n        test out staging server\n        debug code on staging\n        extend company script	2017-01-18	4	f
1707	Church	\n        SoKM	2017-01-18	4	f
1708	Grow	\n        4, 3, 3, 1	2017-01-18	0	f
1709	Fun	\n        Dragonfly\n	2017-01-18	1	f
1710	Aspire	\n        send reports daily\n        create Write project in Aspire\n        setup writing history and to do list	2017-01-19	2	f
1711	Hire	\n        Delete an interviewer from session\n        Links on master skills\n        Clean up data\n        Session detail menu\n        Interviewers can not view opening (remove link)\n        Build staging server	2017-01-19	6	f
1712	Write	\n        buy Creative Nonfiction\n        listen to Creative Nonfiction - lesson 1	2017-01-19	1	f
1713	Grow	\n        3, 3, 4, 4	2017-01-19	0	f
1714	Fun	\n        House of Cards, Dragonfly\n	2017-01-19	5	f
1715	Tools	\n        build devops command script\n        build 'cmd function' scripting	2017-01-20	2	f
1716	Write	\n        create plan for The Perils of Leadership\n        discuss book idea with Stacie\n        create outline of book project	2017-01-20	3	f
1717	Aspire	\n        measure progress on Aspire objectives\n        measure hours invested on Aspire objectives\n        improve Aspire Report	2017-01-20	2	f
1718	Hire	\n        update documents for Hiring Guru project\n        design for post-backs of checkboxes\n        rebuild skill selector\n        post project info in Aspire/Who2Hire\n        build hours/docs/words to 301/13/4753	2017-01-20	5	f
1719	Fun	\n        This is Us, Voyager	2017-01-20	2	f
1720	Grow	\n        5, 4, 4, 3\n	2017-01-20	0	f
1721	People	\n        HOA	2017-01-21	2	f
1722	Write	\n        think of new ideas for writing projects\n        build 'author blog' command script\n        post Business Is an Investment article on Shrinking World\n        build list of writing projects	2017-01-21	4	f
1723	Aspire	\n        simplify Aspire Report\n            client, date, hours, score, history	2017-01-21	3	f
1724	Fun	\n        Golden Globe, Shield, Sherlock, Last Man	2017-01-21	5	f
1725	Grow	\n        4, 5, 3, 2\n	2017-01-21	0	f
1726	People	\n        lunch with Garcias and Potters\n        take down Christmas lights	2017-01-22	2	f
1727	Write	\n        start writing A Seaman's Guide to Personal Reinvention 	2017-01-22	2	f
1728	Aspire	\n        fix links in Aspire report\n        write Aspire Projects notes\n        write Developing Aspire Guides - user guide for new Guides\n        write Aspire Guides - note discussing how Guides work	2017-01-22	2	f
1729	Fun	\n        celebration of success\n        watch La La Land	2017-01-22	4	f
1730	Grow	\n        4, 5, 3, 3\n	2017-01-22	0	f
1731	Business	\n        leadership meeting with Stacie and Eric\n        Hiring Guru pricing ideas\n        develop pricing model spreadsheet\n        sales projections for Hiring Guru\n        financial model for Hiring Guru	2017-01-23	10	f
1732	Grow	\n        haircut\n        go to bed early\n        5, 3, 3, 2	2017-01-23	2	f
1733	Fun	\n        Supergirl, Legends\n	2017-01-23	2	f
1734	Church	\n        send message about board meeting\n        board meeting	2017-01-24	5	f
1735	Hire	\n        develop model for sales volume and finances\n        review progress for project\n        draft Table of Contents for User's Guide\n        learn about tabbed views with Material template\n        learn about wizard code\n        rebuild interview template as a wizard	2017-01-24	8	f
1736	Aspire	\n        improve hours gathering from text files	2017-01-24	1	f
1737	Grow	\n        4, 3, 2, 2\n	2017-01-24	0	f
1738	Hire	\n        restore files for Hiring Guru for Interview Views	2017-01-25	2	f
1739	People	\n        pack to go to Phoenix\n        travel to Arizona\n        visit with April's family\n        Barnes & Noble with Stacie	2017-01-25	10	f
1740	Aspire	\n        review progress\n        fix banner layout for Aspire website	2017-01-25	2	f
1741	Grow	\n        3, 2, 3, 4\n	2017-01-25	0	f
1742	Grow	\n        5, 2, 1, 3	2017-01-26	0	f
1743	People	\n        visit with Dad\n        recommend publishing 4 books for PDS\n        watch kids while April gets Christine from airport\n        have fun with Edwards kids\n        buy clothes at Kohl's\n        lunch with PDS at Friendship Village\n        discuss life decisions with April	2017-01-26	12	f
1744	Aspire	\n        update user experience planning\n        build sign up process code\n	2017-01-26	2	f
1745	People	\n        visit with Edwards family\n        visit Greg and Kate McGutchen	2017-01-27	12	f
1746	Aspire	\n        build client data model\n        create new clients for Aspire	2017-01-27	2	f
1747	Grow	\n        5, 1, 1, 3   \n	2017-01-27	0	f
1748	People	\n        85th birthday\n        visit with Edwards family	2017-01-28	12	f
1749	Aspire	\n        streamline forms and field display in views\n        create clients in Aspire	2017-01-28	2	f
1750	Grow	\n        5, 1, 1, 3   \n	2017-01-28	0	f
1751	People	\n        church with April and Jim\n        lunch at Joe's Farm\n        attempt to watch movie\n        watch Lego movie\n        dinner with Don & Kathy Miller\n        watch show on Eighties	2017-01-29	14	f
1752	Grow	\n        4, 1, 2, 3   \n	2017-01-29	0	f
1696	People	\n        help Andrew and Rachel move	2017-01-16	6	f
1698	Fun	\n        This is Us, Scrubs	2017-01-16	4	f
1699	Grow	\n        5, 5, 4, 5\n	2017-01-16	0	f
1700	Aspire	\n        Add info to report for Aspire\n        Build structure for cloning basic projects\n        Decide to create one new project profile each day	2017-01-17	2	f
1701	Church	\n        Build Aspire project for Church\n        Create plan for Church activities 	2017-01-17	2	f
1764	Grow	\n        5, 2, 3, 3	2017-04-25	0	f
1765	Hire	\n        build team views: List, Add, Edit, Delete	2017-04-25	4	f
1775	Tools	\n        dynamic menus\n        create new vision for software architecture\n        develop plans for MyBook business	2017-04-25	4	f
1767	Fun	\n        Americans\n    	2017-04-25	6	f
1768	Grow	\n        3, 2, 3, 3	2017-04-26	0	f
1783	Hire	\n        setup Christine on testing\n        update test logic\n        compare project comparison code to track changes\n        repair user inactivation	2017-04-26	5	f
1784	Church	\n        SoKM\n	2017-04-26	4	f
1785	Grow	\n        3, 2, 3, 3	2017-04-27	0	f
1786	Tools	\n        debug page robot\n        improve page tester\n        deploy and test\n        build view for monthly time invested\n        learn about Django ORM annotation and grouping\n        build workshop app\n        remove dead code and refactor\n        start working with Blessings and Bootstraps	2017-04-27	8	f
1753	People	\n        visit with Edwards family\n        visit with Nancy in afternoon\n        visit with Dad & Carol in evening	2017-01-30	10	f
1772	Fun	\n        explore	2017-04-22	2	f
1773	People	\n        library with Lucy\n        play Carcasonne with Lucy\n	2017-04-22	4	f
1774	Church	\n        attend church	2017-04-23	4	f
1758	People	\n        Stacie and Lucy leave	2017-04-23	1	f
1759	Grow	\n        think about life goals\n        5, 4, 3, 3	2017-04-23	1	f
1760	Fun	\n        The Americans\n\n	2017-04-23	8	f
1761	Church	\n        lunch at Albertos with Todd and Jenny	2017-04-24	3	f
1754	Fun	\n        work jigsaw puzzle\n        use VR Headset\n        watch RED with Jim & April	2017-01-30	4	f
1755	Grow	\n        5, 1, 2, 3\n	2017-01-30	0	f
1756	People	\n        visit with Edwards\n        visit with Rachel\n        unpack after trip	2017-01-31	9	f
1757	Fun	\n        travel home\n        Shield, Madam Sec	2017-01-31	4	f
1778	Grow	\n        walk\n        5, 1	2017-01-31	1	f
3242	Tools	\n        build CardView, TabsView, ContainerView, OutlineView	2018-03-29	4	f
1776	Church	\n        attend	2017-01-08	4	f
3499	Grow	    4, 2, 1, 4	2018-06-02	0	f
3811	People	    Josiah arrives from London\n    visit with Josiah\n    walk to park with Josiah and Cassie	2018-08-09	3	f
1780	Church	\n        attend	2017-02-26	4	f
1781	People	\n        dinner at Rachel and Andrew's house\n        rant about politics\n        sent What You Say to Dad	2017-02-28	3	f
1782	Church	\n        attend church	2017-03-26	4	f
1788	Grow	\n        Personal retreat	2016-01-01	6	f
1789	Fun	\n        Star Trek - Red Matter\n        Star Wars - Attack of the Clones\n	2016-01-01	6	f
1790	Business	\n        Business plan for economics and time investments\n        Build monthly plan for January\n        Build weekly plan structure	2016-01-02	5	f
1791	Fun	\n        Star Wars - Force Awakens\n        Star Wars - Revenge of the Sith\n	2016-01-02	7	f
1792	People	\n        Kress film showing and lunch at Moody's with Rachel & Stacie\n	2016-01-02	2	f
1793	Church	\n        Training on new Icon system	2016-01-03	4	f
1794	People	\n        Lunch with Rachel at Noodles\n        Jurassic Exhibition at Island Grove\n        Old Chicago with Josiah's family	2016-01-03	7	f
1795	Fun	\n        Star Trek - Into Darkness\n	2016-01-03	3	f
1796	Business	\n        Create plan for week with goal tracking\n        Work with Stacie on business goals\n        Discuss marketing strategy with Todd\n        Create ideas for Hammer Showcase\n        2015 Financial Analysis	2016-01-04	4	f
1798	Church	\n        Meet Todd for lunch	2016-01-04	2	f
1799	Fun	\n        New Hope\n        Black Widow - Red Forever\n	2016-01-04	4	f
1801	Fun	\n        Mission Impossible\n	2016-01-05	6	f
1802	WAM	\n        Update CSS for better style\n        Build forms error feedback\n        Add hidden fields to forms for non-settable variables\n        Sync data for production and dev server\n        Investigate issue with data sync\n        Upgrade Django library versions\n        Create script for User administration\n        Add User administration view with form for new users\n        Update style for site\n        Build import list for users	2016-01-06	11	f
1803	Fun	\n        Black Widow\n	2016-01-06	3	f
1804	WAM	\n        Update User Guide with current info\n        Update data models to reflect user roles\n        Investigate Date input on forms\n        Create feature list for future project options\n        Rebuild hosting for app at Digital Ocean\n        Build better style for banner, navbar, title, page content\n        Fix issue with static content server\n        Build user login/logout experience	2016-01-07	8	f
1805	Fun	\n        TV: Last Man, Scrubs, Chuck\n	2016-01-07	4	f
1806	Business	\n        Create new financial models	2016-01-08	3	f
1807	WAM	\n        Create security rules for pages\n        Build views for administration\n        Solve problem with Django 1.8.1 upgrade\n        Improve navbar logic\n        Solve problem with caseDate not being set	2016-01-08	5	f
1808	People	\n        Talk with Stacie about life and business	2016-01-08	3	f
1809	Fun	\n        Empire Strikes Back\n	2016-01-08	3	f
1810	Fun	\n        watch movies: Number Station, MI-5, Return of Jedi, Iron Clad\n	2016-01-09	14	f
1811	Church	\n        Help at church\n        Talk with Daniel Peller	2016-01-10	4	f
1812	Business	\n        Review 2015/2016 finances\n        Prepare for business meeting	2016-01-10	3	f
1813	People	\n        John & Jennifer Honeycutt lunch	2016-01-10	3	f
1814	Fun	\n        Heroes, Chuck\n	2016-01-10	4	f
1763	Fun	\n        Homeland\n	2017-04-24	8	f
1770	Fun	\n        Shack, Beauty & Beast	2017-03-31	6	f
1777	Church	\n        attend	2017-01-22	4	f
1779	Church	\n        attend	2017-02-19	4	f
3497	People	    talk with Christine about setting life goals	2018-05-31	1	f
1816	People	\n        Stacie becomes Shrinking World partner\n        Lunch with Eric at Sol de Jalisco	2016-01-11	4	f
1817	Fun	\n        Madam Secretary, Chuck\n	2016-01-11	4	f
1821	People	\n        Palaminos with Stacie	2016-01-13	2	f
1822	WAM	\n        Display counters on accordion groups\n        Fix numerous UI issues\n        Count the demographics for cases\n        Implement print ready view\n        Improve styles on control in new view\n        Prepare for delivery of 2.0 release	2016-01-14	4	f
1823	Business	\n        Project planning	2016-01-14	2	f
1824	Grow	\n        Personal review and reflection	2016-01-14	2	f
1825	Fun	\n        Sherlock Holmes\n	2016-01-14	2	f
1925	Grow	\n        3, 4, 4, 3\n        prayer during night\n	2016-12-02	0	f
1828	Fun	\n        Black Widow\n        Star Wars Graphic Novels\n\n	2016-01-15	6	f
1829	Fun	\n        Watch TV all day long\n            Flash Point, Tomorrow People, Mad Men, Sherlock Holmes	2016-01-16	12	f
1830	People	\n        Lunch with Christine\n	2016-01-16	2	f
1831	Business	\n        Stephanie Farrell (marketing meeting)	2016-01-17	3	f
1832	Church	\n        Lunch with Heidi & Tim	2016-01-17	4	f
1833	Grow	\n        Personal review	2016-01-17	2	f
1834	People	\n        Talk with Stacie	2016-01-17	3	f
1835	Fun	\n        Star Wars\n\n	2016-01-17	2	f
1836	Sign	\n        First day working for Sign Span\n        Setup all user accounts\n        Pull down code repos\n        Create map of code to understand design\n        Create Engineering log\n        Meet with Tom for assignments	2016-01-18	8	f
1837	People	\n        Rachel and Andrew (watch wedding video)\n        Christine's birthday party\n	2016-01-18	4	f
1838	Fun	\n        Star Wars (GV)\n\n	2016-01-18	2	f
1839	Sign	\n        Write new developer doc\n        Review JIRA issues\n        Setup Vagrant\n        Setup local version of Python 3.5 stack on mini\n        Build local virtualenv	2016-01-19	8	f
1841	Grow	\n        Year end financial summary	2016-01-19	1	f
1842	Fun	\n        Sherlock, Star Wars, Madam Sec., Heroes\n	2016-01-19	5	f
1843	Business	\n        Develop schedule for work hours (Jan-Feb);\n        Update marketing info;\n        Create updated financial plan for client work;\n        Meet with Nate and Heidi Webb (3 hours)	2016-01-20	9	f
1844	WAM	\n        Implement email using Mandrill;\n        Register and verify domain for sending notifications;\n        Build prototype of sender script;\n        Debug email sending and plan for WAM integration;	2016-01-20	4	f
1845	Sign	\n        Meet with Tom & Brandon\n	2016-01-20	1	f
1846	Sign	\n        Setup code sharing on all computers;\n        Debug package setup;\n        Create base virtualenv on all computers;\n        Build Sign Master base code setup;\n        Implement command testing;\n        Create project context;	2016-01-21	9	f
1847	People	\n        Time with Stacie	2016-01-21	1	f
1848	Fun	\n        Sherlock Holmes, Chuck\n            	2016-01-21	4	f
1849	WAM	\n        Add user status of Inactive\n        Finish design for selection of users by user role\n        Clean up of inactive users\n        Testing on user roles\n        Hook up real counters on dashboard page\n        Refactor the source files\n        Add edit cases for Program Directors\n        Category, DisburseInstruct, Notes\n        Edit ProgDir view to add ability to edit Accepted Pending cases\n        Add print button to edit case	2016-01-22	9	f
1850	Fun	\n        Sherlock\n	2016-01-22	3	f
1852	People	\n        HOA annual meeting\n        Pack for AZ trip	2016-01-23	4	f
1853	Grow	\n        Take nap\n        Have quiet time	2016-01-23	2	f
1854	Fun	\n        Firefly, X-force \n	2016-01-23	4	f
1855	People	\n        Travel to AZ\n        Eat at bakery shop downtown\n        Drive to Sedona\n        Happy hour at Bella Vita\n        Grocery shopping\n	2016-01-24	14	f
1857	People	\n        Talk about emotions with Stacie	2016-01-25	6	f
1858	Fun	\n        Sherlock Holmes\n        Star Wars\n	2016-01-25	4	f
1859	Business	\n        Analyze 2015 spending\n        Update investment history\n        Measure ROI for investments\n        Develop model for revenue and income	2016-01-26	4	f
1860	People	\n        Visit Red Rock State Park\n        Dinner at Javalina Cafe	2016-01-26	6	f
1861	Fun	\n        Sherlock Holmes\n        Black Widow\n        X-Force\n        Star Wars\n	2016-01-26	4	f
1862	People	\n        Drive to Flagstaff\n        Lunch at Taverna\n        Drive around Flagstaff\n        NAU bookstore\n	2016-01-27	14	f
1863	Business	\n        Project retrospective for Women 2 Women project\n        Review time spent on different tasks for WAM 2.0\n        Visit library	2016-01-28	6	f
1864	People	\n        Time with Stacie	2016-01-28	4	f
1865	Fun	\n        Comics: X-force\n        TV\n	2016-01-28	4	f
1923	Grow	\n        5, 3, 2, 2\n	2016-11-29	0	f
1856	Tools	\n        Build form input for 4 thot app (rename, move, add node)\n        Debug thot app\n        Build content for Thots	2016-01-25	4	f
3112	People	\n        Mehrgan Mostowfi over for dinner	2018-02-26	4	f
1827	People	\n        Time with Stacie	2016-01-15	2	f
1840	Business	\n        Invoice WAM	2016-01-19	0	f
1924	People	\n        dinner with Courtney Peters	2016-12-01	0	f
2908	Teach	\n        update lesson 1\n        teach lesson 1\n        request name tents\n        office hours\n        internet outage\n        investigate FTP permissions	2018-01-08	7	f
1819	Fun	\n        Enterprise, Last Man\n	2016-01-12	3	f
4405	Grow	    5, 1, 3, 2\n    weight: 210	2018-12-20	0	f
4406	Teach	    plan out teaching prep\n    build unc classroom site\n    Classroom UX - style and navigation\n    shrinking-world.com/unc/bacs200\n    shrinking-world.com/unc/bacs350\n    rebuild seamansguide.com\n    	2018-12-20	4	f
4407	Tools	    remove old code: guide, unc, aspire\n    prune old docs\n    fix tests	2018-12-20	2	f
4408	Fun	    Last Kingdom, GoT\n    	2018-12-20	2	f
4409	People	    visit with Stacie and Lucy\n    Stacie gets sick\n    attempt concrete project	2018-12-20	6	f
1878	Business	\n        meeting with Mike Hefty\n        discuss money management with Stacie\n        long-term care meeting	2016-04-28	3	f
1880	Grow	\n\n    \n## Accomplishments\n	2016-04-30	0	f
1897	Grow	\n        5, 1, 3, 2\n	2016-10-17	0	f
1899	Grow	\n        5, 1, 3, 5\n	2016-10-19	0	f
1900	Grow	\n        5, 1, 1, 2\n	2016-10-20	0	f
1901	Grow	\n        create bars for health metrics\n        4, 1, 2, 3 \n	2016-10-21	0	f
1902	Grow	\n        5, 1, 3, 2\n	2016-10-22	0	f
1903	Grow	\n        5, 1, 3, 2\n	2016-10-23	0	f
1904	Grow	\n        5, 1, 4, 2\n	2016-10-24	0	f
1905	Grow	\n        5, 1, 3, 5\n	2016-10-25	0	f
1906	Grow	\n        5, 2, 4, 5\n	2016-10-26	0	f
1907	Grow	\n        5, 3, 1, 4\n	2016-10-27	0	f
1908	Grow	\n        5, 2, 5, 3\n	2016-10-28	0	f
1909	Grow	\n        4, 3, 1, 4\n\n	2016-10-29	0	f
1910	Grow	\n        4, 2, 5, 2\n	2016-10-30	0	f
1891	Sign	\n        review all JIRA issues\n        route issues to testing and to Geoff for fixes\n        solve problem with Forgot password failure\n        testing of basic user flows in SignSpan	2016-09-07	4	f
1892	Grow	\n        sleep: -2, weight: 207.6, eat: 2000, exercise: - miles (3,4,2,4)	2016-09-30	0	f
2922	Grow	\n        5, 3, 5, 2	2018-01-12	0	f
2921	Fun	\n        Hobbit\n	2018-01-11	6	f
3509	People	    Josiah meeting\n    buy gas grill\n    go to church while Stacie works on songs\n    Rio\n    	2018-06-01	4	f
1867	People	\n        Dinner at Famous Pizza	2016-01-29	4	f
1868	Fun	\n        Comics, TV\n	2016-01-29	4	f
1883	Business	\n        Stacie met with Ron Z	2016-05-12	0	f
1886	Sign	\n        test production chargify public page\n        test registration workflow on production\n        setup production command script\n        debug production server context\n        analyze log for registration\n        improve logging in chargify.py\n        improve log.py script to work on production\n        test registration workflow on dev\n        simplify error handling in registration.py\n        simplify error handling in chargify.py	2016-08-10	9	f
1870	Grow	\n        Self-evaluation and discussion with Stacie\n	2016-01-30	4	f
1872	People	\n        Dad's 84th birthday celebration\n        Dinner with Edwards family\n# Tasks History     February 2016\n\n\n## February Objectives 2016\n\n    * 120 billable hours\n    * Book time through March\n    * Deliver Women 2 Women App\n    * Prepare tax info \n\n    \n## Accomplishments\n	2016-01-31	12	f
1884	Business	\n        stop and restart transfer\n        authorize transfer of funds	2016-05-12	0	f
1898	Grow	\n        5, 1, 3, 4\n	2016-10-18	0	f
1873	Sign	\n        iMac tools\n            setup and debug Python 3.4 Virtualenv\n            setup and debug Tox\n            setup Node.JS\n            run Sign UI on iMac\n            debug ssp\n            create run-ui script\n            fix Sublime settings on iMac\n            fix window opacity\n        testing baseline\n            fix tst (2.7)\n            debug all system tests	2016-02-17	8	f
1875	Sign	\n        update product requirements with Tom\n        learn about notifications within Sign\n        finish initial pull request for MVP-352\n        MySql install and usage\n        PyCharm usage: static analysis, debug tools \n        pip & package dependency management\n        Python 3.4 & Django 1.9 	2016-02-19	10	f
1876	Sign	\n        debugging on auth for org lookup\n        map auth header to user claims\n        map claims to user\n        get chargify state for subscription\n        return proper subscription state to caller	2016-04-25	6	f
1893	Hire	\n        get remote tests to pass	2016-10-03	0	f
1879	People	\n        Stacie & Lucy in Colorado Springs	2016-04-30	0	f
1894	Tools	\n        test code on all servers\n        fix issues with data test\n        save data from MyBookOnline.org	2016-10-06	0	f
1887	Church	\n        skip church for personal retreat	2016-08-14	0	f
1888	People	\n        Stacie sick	2016-08-14	0	f
1889	Grow	\n        Present Over Perfect (3 chapters)\n        Present Over Perfect book notes\n        4DX (3 chapters)\n        4DW (book notes)	2016-08-14	10	f
1890	Grow	\n        read about 4DX\n        refine personal scorecard\n        terrible struggle with WAM agency configuration debug	2016-08-23	0	f
1911	Grow	\n        2, 3, 3, 2\n	2016-11-01	0	f
1912	Grow	\n        5, 1, 3, 5\n	2016-11-03	0	f
1913	Grow	\n        4, 1, 5, 2\n	2016-11-04	0	f
1914	Grow	\n        time change\n        4, 1, 3, 3\n	2016-11-05	0	f
1915	Grow	\n        4, 3, 2, 2	2016-11-14	0	f
1916	Tools	\n        create HealthScore app, data model, import\n        improve CSS for hire, church, etc.	2016-11-16	0	f
1917	Business	\n        car maintenance\n        investigate HELOC\n        review family finance	2016-11-17	4	f
1918	Grow	\n        4, 4, 3, 2	2016-11-18	0	f
1919	Grow	\n        5, 4, 2, 2	2016-11-19	0	f
1920	Grow	\n        3, 3, 3, 2	2016-11-23	0	f
1921	Grow	\n        walk\n        5, 3, 1, 3	2016-11-24	0	f
1922	Grow	\n        3, 4, 2, 1	2016-11-28	0	f
1885	Tools	\n        setup Kiwi & Wunderlist	2016-06-14	0	f
1895	Grow	\n        sleep till 9:20\n        sleep: 0, weight: 205.8, eat: 1600 c, ex: 1 mi (5,5,5,2)\n	2016-10-06	0	f
1882	Business	\n        decide on setting up Personal Capital account 	2016-05-05	0	f
1896	Sign	\n        send design info to Tom	2016-10-07	0	f
1869	People	\n        Drive to Phoenix\n        Lunch in Rock Springs\n        Dinner with Don and Kathy Miller	2016-01-30	10	f
1871	Church	\n        Church at Gilbert Vineyard	2016-01-31	2	f
1951	People	\n        call Dad\n        lunch at Cables	2017-04-29	3	f
1952	Church	\n        discuss and pray about ministry\n        pray for Garcias\n        pray for Beilmans	2017-04-29	4	f
1953	Hire	\n        fix botched release	2017-04-29	2	f
3749	Grow	    4, 1, 3, 5	2018-07-22	0	f
3494	Teach	    use SimpleMind to create mind maps\n    note - Wiki Workshop\n    note - Build your own Wiki\n    note - PHP Apps for BACS 350\n    check UNC email	2018-05-31	4	f
1926	Grow	\n        5, 5, 4, 3\n	2016-12-06	0	f
1927	Grow	\n        3, 5, 4, 2	2016-12-08	0	f
1928	Grow	\n        4, 5, 4, 1\n	2016-12-09	0	f
1929	Grow	\n        4, 5, 4, 2	2016-12-10	0	f
1930	Grow	\n        5, 5, 5, 2	2016-12-12	0	f
1931	Grow	\n        3, 5, 4, 2\n	2016-12-14	0	f
1932	Grow	\n        4, 5, 3, 1\n        	2016-12-15	0	f
1933	Grow	\n        5, 4, 3, 2	2016-12-19	0	f
1934	Grow	\n        3, 4, 3, 2	2016-12-21	0	f
1935	Write	\n        create concept for Healthy, Wealthy, Wise\n        work out details of investment growth rates and formulas	2016-12-22	2	f
1936	Grow	\n        3, 1, 4, 2	2016-12-26	0	f
1937	Grow	\n        5, 2, 2, 3	2016-12-27	0	f
1938	Grow	\n        4, 1, 3, 2\n	2016-12-28	0	f
1939	Write	\n        organize notes	2016-12-31	0	f
1940	Grow	\n        3, 2, 2, 2	2016-12-31	0	f
1941	Hire	\n        calculate time investment for project	2017-04-27	2	f
1942	People	\n        visit with Stacie	2017-04-27	2	f
1943	Fun	\n        Madam Sec, Gallavant\n	2017-04-27	2	f
1944	Tools	\n        extend page robot testing\n        mybook implementation plan\n        update mybook aspire docs\n        analyze work time over past year\n        work on public/private page architecture\n        refactoring of MyBook views	2017-04-28	3	f
1946	Hire	\n        review changes on who2hire\n        create 2017-04-28 software release	2017-04-28	2	f
3745	People	    Travel with Stacie\n    Visit with other travelers	2018-07-12	7	f
3748	People	    Travel with Stacie\n    Visit with other travelers\n    	2018-07-09	7	f
3477	Grow	    3, 2, 2, 5\n    build map of essential goals\n    nap\n    exercise throughout day	2018-05-26	3	f
1947	Church	\n        church board meeting	2017-04-28	3	f
3449	Church	    	2018-05-22	0	f
3757	People	    Travel with Stacie\n    Visit with other travelers\n    	2018-07-10	7	f
3444	Grow	    3, 3, 3, 5\n    visit Eye Dr\n    If You Can Keep It\n    walk	2018-05-22	3	f
3516	Teach	    create mind map of Python Apps Course content\n    create mind map of PHP Apps Course content\n    create note for lesson plan\n    good initial class map\n    investigate PHP server setup\n    investigate BlueHost\n    attempt to configure SSH on Windows 10\n    working lunch at Sr. Jalapeno	2018-06-06	8	f
3751	People	    Travel with Stacie\n    Visit with other travelers\n    	2018-07-22	7	f
2923	Teach	\n        Build Lesson 3 (lecture, ex, quiz)\n        Build Mark.Seaman web directory	2018-01-12	11	f
2924	Fun	\n        Amazing Race, Good Place, Fraiser\n	2018-01-12	3	f
2925	Grow	\n        5, 4, 4, 2	2018-01-13	0	f
3479	People	    household projects\n    get Trike down\n    figure out tire inflation\n    Ace Hardware\n    explore trip to Germany\n    Andrew and Rachel (Carcassonne, Bride and Prejudice)	2018-05-26	8	f
3741	Fun	    Travel Log: Day 4 - Melk\n    Bus ride to Melk\n    Melk Abbey tour\n    Abbey garden walk\n    History of monastery\n    Reception hall optical illusion on ceiling\n    Library 100,000 books\n    Founded 1,000 years ago\n    Read about Wachau Valley\n    Dinner at hotel\n    Shower not fixed\n    8,000 steps\n    Talk about German Immigration crisis\n    Thinking about process of aging	2018-07-11	7	f
3755	Grow	    4, 1, 3, 5	2018-07-10	0	f
3495	Tools	    create i command\n    update export of task records for each month\n    note - MyBook Page Templates	2018-05-31	1	f
3808	Teach	    add style to demo website\n    build navigation rules for demo code\n    add logo to website\n    clean up extra files\n    fix tests\n    	2018-08-09	6	f
3493	Grow	    5, 4, 3, 5\n    walk\n    set personal work priorities\n    listen to Originals while walking\n    clean out inbox\n    write note Prioritize\n    note: Mental Habits\n    create Today notes file\n    note - Finding meaning	2018-05-31	4	f
3746	Grow	    4, 1, 3, 4	2018-07-09	0	f
3446	Teach	    GitBook idea\n    discover GitBook web service\n    build personal publishing plan\n    prototype GitBook-MyBook workflow\n    schedule for BACS 350	2018-05-22	5	f
3752	Grow	    4, 1, 3, 5	2018-07-13	0	f
4006	Grow	    5, 2, 3, 2\n    weight: 208.2	2018-09-20	0	f
3754	People	    Travel with Stacie\n    Visit with other travelers	2018-07-13	7	f
4009	Fun	    weird sound/video\n    	2018-09-20	2	f
4004	Fun	    hook up sound\n    Animal Planet, ER\n    	2018-09-19	3	f
4005	People	    visit with Rachel	2018-09-19	2	f
4008	Tools	    	2018-09-20	0	f
3998	Grow	    5, 3, 1, 5\n    weight: 208\n    walk 10,000 steps	2018-09-18	2	f
3999	Teach	    200-13 forms\n    350-13 exam, building apps, solutions\n    	2018-09-18	6	f
4066	Teach	    build updated schedule for 200 and 350 topics\n    publish updated schedule of topics\n    learn about caching\n    create object oriented design pattern\n    	2018-10-04	8	f
1948	People	\n        Pelegrini's with Stacie	2017-04-28	2	f
1945	Grow	\n        5, 2, 2, 2\n        analysis of time spent for work and leisure 	2017-04-28	2	f
1949	Fun	\n        Good Place, SHIELD\n	2017-04-28	2	f
1950	Grow	\n        3, 2, 2, 3	2017-04-29	0	f
3750	Fun	    Travel Log: Day 15 - Amsterdam\n        Breakfast with Don & Margaret\n        Sailing into Amsterdam\n        Pay bill for ship\n        Canal boat tour\n            Canals & boating\n            Building architecture\n        Walking tour\n            Very hot & no rain (worst drought in 100 years)\n            Anne Frank house\n            Houseboats\n            Dutch East India Company \n            Red light district\n            Marijuana selfie at "Coffee house"\n            Bike hassards for tour groups\n            Lunch at restaurant\n            ATM search & gather existing money\n        Learn about "Small boat tours" from Grand Circle\n        Port talk\n            Captain's farewell\n            Disembarking process\n            Gratuities for crew and program directors\n        Dinner with Don, Dave, Margaret, Michelle\n            Fantastic fillet mignon\n        Pack luggage for pickup at 8am\n        9,500 steps	2018-07-22	7	f
3708	Fun	    Travel Log: Day 9 - Bamberg\n        Bus to city center\n        Walking tour of Bamberg\n            History of Bamberg\n            Quaint streets from 1400s\n            Scenic overlook\n            Bishop's residence fortress\n            Town hall\n            Bakery with plum tort\n        Beer garden with Rauchbier\n            Scolding by bierfrau\n            Sit in outdoor courtyard\n            Forget refund on beer glass\n        Depart Bamberg to sail on Main river\n        Lunch with people from South Carolina and Texas\n        Nap\n        Galley tour\n        Dragonfly in Amber\n        Dinner with Keith and Elena\n        Disco night\n        Dance with Stacie\n        Stacie's birthday celebrated by crew\n        Elena got Stacie flowers\n        Crew dancing\n        Port talk - Rotherburg\n        9,000 steps	2018-07-16	7	f
3934	Grow	    5, 1, 4, 3\n    weight: 209.2	2018-09-05	0	f
3973	Grow	    5, 2, 1, 5\n    weight: 208.4\n    walk to library & Border restaurant	2018-09-11	2	f
3974	Teach	    plan 350 Lesson 10\n    subscriber app requirements\n    Essential Skills\n    grade Lesson 9\n    write to students (Brittney, Jerone, Sarah)\n    	2018-09-11	8	f
3975	Business	    carpet project	2018-09-11	2	f
3976	People	    talk with Stacie	2018-09-11	2	f
3977	Grow	    3, 2, 4, 2\n    weight: 208.6	2018-09-15	0	f
3986	Business	    carpet project\n    	2018-09-13	1	f
3978	Teach	    How to use Version Control\n    How to Setup Workflow\n    Install Brackets on Mac\n    Setup Apache on Mac\n    Create solution strategy for 350\n    Grade Lesson 8 & 9 & 10\n    Plan next week\n    	2018-09-15	7	f
3711	Fun	    Travel Log: Day 10 - Rothenburg\n        Arrive in Wurzburg during breakfast\n        Breakfast with Don & Margaret\n        Fortress & bishop's house\n        Bus to Rothenburg with Hanas\n        Rothenburg \n            Walking tour with Hanas\n            Amazing medieval town with original houses\n            Take many photos\n            Chocolate shop\n            Buy coo-coo clock\n            Schneeballen - ball of fried cookie dough\n            Group lunch of meat and noodles\n            Many houses from 1400s\n            Economy collapsed in 1631\n            Town saved by mayor drinking challenge\n            Walk old town walls\n            Dinner Don, Margaret, Dave, Michelle\n        Hot bus ride back to ship\n        Glass blower demonstration\n        Wash clothes in sink\n        Buy T-shirts\n        9,000 steps	2018-07-17	7	f
3723	Fun	    Travel Log: Day 16 - London\n        Leave ship\n            Breakfast on ship\n            Restless night\n            Luggage out at 8\n            Wait in lounge\n            Depart ship at 10:30\n        Meet Udo at Schipol airport\n        Travel to London\n            Long walk through airport\n            Lunch at airport\n            Fly to Gatwick\n            Long walk through airport\n            Train from Gatwick to Isleworth (including backtracking)\n        Bridge Inn\n        Dinner with Josiah family\n        London record heat\n        Hot and noisy night\n        12,000 steps\n        Sleep from 3-5am	2018-07-23	7	f
3694	Fun	    Travel Log: Day 20 - Home\n        Wake up with thoughts of home\n        Breakfast at hotel\n        Pack for final leg\n        Sam and Cassie arrive at 9:30am\n        Taxi to Heathrow\n        Check in with Cassie & Sam\n        Flight delay of 40 mins\n        Wait for gate posting\n        Same terminal and trip out\n        Movie: Chappaquiddic, Downsizing\n        Listen to music with headphones\n        Travel with Cassie\n        2 hours to clear immigration (building anger)\n        Review UNC email in immigration line\n        Ride home with Rachel\n        Unpack and go to bed\n        5,000 steps	2018-07-27	7	f
3987	People	    pizza from Pelican Joe's	2018-09-13	0	f
3756	Fun	    Travel Log: Day 3 - Vienna\n    Find out about Rachel having a girl\n    Stacie checks email at 1:30am\n    Funky shower in hotel\n    Breakfast with Valerie and Brenda\n    Bus to city center\n    Bus tour of Vienna\n    Walking tour\n    Dictionary at bookstore\n    Explore Vienna\n    Stacie tries walking stick\n    Eat lunch at Artemis\n    Cloud burst and torrential rain\n    Get umbrella and poncho\n    Nap\n    Augustina Sellar for schnitzel\n    Meet Don & Margaret, Dave & Michelle\n    9,000 steps	2018-07-10	7	f
3979	Tools	    renew Who2Hire.us cert\n    	2018-09-15	1	f
3980	Business	    grout shower\n    fix bike valve	2018-09-15	1	f
3981	Fun	    ER, Anthony Bordain\n    	2018-09-15	4	f
3982	People	    	2018-09-15	0	f
3983	Grow	    3, 3, 4, 5\n    weight: 209.6\n    sleepless night for stress	2018-09-13	0	f
3984	Teach	    grade assignments\n    create Quiz Gettysburg\n    install XAMPP, NetBeans\n    visit with student at UC	2018-09-13	10	f
3985	Fun	    Dance, Profit, ER\n    Last 100 Years	2018-09-13	3	f
3993	WAM	    remove old users and verify	2018-09-15	1	f
4116	Fun	    Mr Robot\n    Homeland\n    Green Chili Fries\n    	2018-10-12	6	f
4050	People	    time with Stacie\n    renew SSL\n    lunch at Royal Nepal	2018-09-30	3	f
4117	Grow	    3, 4, 3, 1\n    weight: 206.4	2018-10-14	0	f
4118	Teach	    wake up at 2:30 to work on template lesson\n    build template engine demo	2018-10-14	7	f
4119	WAM	    investigate WAM cases	2018-10-14	1	f
4120	Fun	    Circle\n    Homeland\n    	2018-10-14	4	f
4121	People	    pizza with Andrew, Rachel, Christine	2018-10-14	2	f
4122	Grow	    4, 3, 3, 5\n    weight: 207.8\n    get results from blood work\n    walk to Park and Neighborhood	2018-10-16	1	f
4123	Teach	    use design review manager for grading\n    create scorecard for design reviews\n    create page templates\n    create Great Speeches assignment\n    	2018-10-16	8	f
4124	Fun	    This is Us\n    	2018-10-16	4	f
4125	People	    time with Stacie\n    Leslie returns to SD	2018-10-16	1	f
4126	Grow	    5, 3, 3, 1\n    weight: 207.8	2018-10-13	0	f
4127	Teach	    create logging template\n    debug solution 22\n    	2018-10-13	2	f
4128	Fun	    Mr Robot\n    Homeland\n    nts 6\n    	2018-10-13	10	f
4129	Business	    Fix toilet	2018-10-13	2	f
3935	Teach	    improve Lesson 7\n    macbook power failure\n    return Uncle Ed computer\n    discuss curriculum with Chris Vegter and Bill Wilcox\n    Teach Lesson 7\n    help students with homework\n    setup git repo 350 on macbook\n    	2018-09-05	9	f
4059	Fun	    Vikings\n    White\n    Farr library\n    Tombs - Clive Custler\n    	2018-10-01	4	f
4035	Teach	    plan design review app\n    create student list (name, email, domain)\n    build Domains page\n    build Student Test page\n    grade zybook assignment\n    	2018-09-25	8	f
4162	Teach	    prepare for complex page templates\n    meet with Chris Newby\n    version control quiz\n    extra credit assignment in 200\n    	2018-10-19	8	f
4163	Fun	    Get Smart\n    	2018-10-19	2	f
4182	Fun	    Resident, Good Place, Fixer Upper\n    	2018-11-02	4	f
4142	People	    talk with Stacie about church board	2018-10-24	2	f
4194	Fun	    ER, Goldbergs\n    	2018-10-30	3	f
4159	Grow	    3, 3, 1, 1\n    drive to LeCook Ranch for personal retreat	2018-10-26	7	f
4192	Grow	    5, 3, 2, 1\n    weight: 207.2	2018-10-30	0	f
4167	Fun	    Mr Robot, Madam Sec\n    	2018-10-29	4	f
4141	Fun	    13 to 30, Mr Robot\n    Farr Library - book on Elizabeth\n    finish Tombs audiobook\n    	2018-10-24	4	f
4139	Grow	    5, 3, 1, 1\n    weight: 207.4	2018-10-24	0	f
4158	People	    talk with Stacie about retreat	2018-10-28	1	f
4173	People	    Costco\n    time with Stacie\n    Panda Express with Rachel, Christine	2018-11-04	3	f
4179	Grow	    5, 2, 2, 4\n    weight: 208.4	2018-11-02	0	f
4164	People	    talk with Stacie	2018-10-19	2	f
4181	Tools	    work on Bluehost SSH\n    	2018-11-02	1	f
4183	People	    discuss healthcare options	2018-11-02	1	f
4168	People	    talk with Stacie about retreat\n    Andrew & Rachel\n    voting	2018-10-29	3	f
4153	Grow	    5, 3, 1, 5\n    weight: 207.4\n    11,000 steps\n    nap\n    work on bike tires\n    bike ride with Stacie\n    walk to lake\n    End of College	2018-10-21	5	f
4157	Grow	    5, 3, 3, 5\n    personal retreat\n    hike in mountains\n    pray about dealing with emotions\n  	2018-10-28	8	f
4150	Teach	    learn Error Handling and cookies in PHP\n    	2018-10-20	2	f
4184	Grow	    5, 2, 2, 3\n    weight: 208.4	2018-10-31	0	f
4186	Fun	    return to audiobooks to library\n    ER, Resident, This is Us\n    	2018-10-31	3	f
4052	WAM	    work with Stacie\n    plan out next steps for WAM\n    fix numerous minor problems in WAM	2018-09-27	4	f
4187	People	    talk with Stacie about life\n    Halloween\n    Sol de Jalisco	2018-10-31	3	f
4148	People	    time with Stacie\n    discuss teaching with Stacie	2018-10-22	2	f
4149	Grow	    5, 5, 3, 5\n    weight: 206\n    walk to library\n    9500 steps\n    End of College	2018-10-20	1	f
4152	People	    discuss teaching breakthroughs with Stacie\n    Rachel's baby shower	2018-10-20	9	f
4188	Grow	    5, 1, 3, 3\n    weight: 209.4\n    walk	2018-11-01	1	f
4189	Teach	    build object datatype demo code\n    create templates and solutions\n    prep for 350 class\n    create tabs for review feedback\n    	2018-11-01	8	f
4190	Fun	    ER, Mr Robot, Resident\n    	2018-11-01	4	f
4155	Fun	    Father of the Bride 2\n    	2018-10-21	3	f
4156	People	   Right Coast Pizza \n   talk with Stacie	2018-10-21	2	f
4171	Tools	    	2018-11-04	0	f
4193	Teach	    grade 350 exam\n    prep pair programming\n    	2018-10-30	8	f
3958	Grow	    3, 3, 2, 3\n    weight: 207.8\n    lack of sleep waiting for carpet layer\n    Next 100 Years\n    Egg & I in Greeley	2018-09-10	3	f
4154	Church	    learning to love others	2018-10-21	4	f
4054	Teach	    200 18 - Page layout, ethics blog, grading\n    350 18 - App building live demo\n    meet with Robert Carver\n    Progress report for students	2018-10-03	9	f
4132	Tools	    change password on imac\n    change password on Blue Host\n    upgrade imac to Mojave (breaks XAMPP)\n    fix git problems\n    setup web server on macs	2018-10-23	4	f
4133	Fun	    Mr Robot, This is Us, Fraiser\n    	2018-10-23	4	f
4197	Church	    night of worship\n    Rick Omstead prayed for me	2018-10-28	3	f
4136	Tools	    attempt to setup phpMyAdmin	2018-10-25	2	f
4138	People	    lunch with Stacie at Stuffed Burger	2018-10-25	1	f
4196	Teach	    grade exams	2018-10-28	2	f
4137	Fun	    ER, Profit\n    	2018-10-25	5	f
4169	Grow	    3, 2, 1, 3\n    weight: 208.2\n    nap	2018-11-04	1	f
4166	Teach	    Stacie guest speaker in BACS200\n    lunch with Stacie at Tobey-Kendell	2018-10-29	7	f
4185	Teach	    teach Images\n    pair programming \n    	2018-10-31	8	f
4161	Grow	    5, 3, 4, 3\n    weight: 207.6\n    to bed at 8:30\n    	2018-10-19	2	f
4160	Teach	    give two exams	2018-10-26	7	f
4134	Grow	    5, 3, 3, 3\n    weight: 207.6\n    build app for Journey Notebook\n    ready code for retreat	2018-10-25	4	f
4135	Teach	    prepare exams in both 200 and 350\n    	2018-10-25	2	f
4170	Teach	    \n    	2018-11-04	0	f
4146	Tools	    upgrade macbook to Mojave (breaks XAMPP)	2018-10-22	1	f
4140	Teach	    teach Diagrams in 200\n    teach Cookies in 350\n    improve templates library	2018-10-24	8	f
4172	Fun	    Ghost Town, Salt-Fat, Mash\n    	2018-11-04	4	f
4165	Grow	    5, 3, 3, 5\n    weight: 207.4	2018-10-29	0	f
4143	Grow	    5, 3, 3, 5\n    personal retreat at LeCook Road\n    capture life events from 2010 to present\n    hike in mountains	2018-10-27	14	f
4174	Grow	    5, 2, 2, 2\n    weight: 208.4\n    nap	2018-11-03	1	f
4175	Teach	    debug basic auth logic	2018-11-03	3	f
4176	Tools	    enabled SSH on Bluehost\n    build deployment script for Bluehost	2018-11-03	3	f
4177	Fun	    Mr Robot, Resident, Librarians\n    	2018-11-03	4	f
4178	People	    Bonefish Grill with Potters	2018-11-03	3	f
4144	Grow	    5, 3, 3, 5\n    weight: 207.4\n    Stacie books retreat cabin\n    think about retreat	2018-10-22	1	f
4147	Fun	    ER, Profit, Goldbergs\n    visit Farr library\n    milkshake at Sonic\n    	2018-10-22	2	f
4145	Teach	    teach Lesson 26\n    students decide on Music Manager exam\n    frustrating talk with Richard Newmark\n    error handling\n    	2018-10-22	8	f
4195	People	    talk with Stacie about relationships\n    time with Stacie	2018-10-30	3	f
4110	Grow	    5, 4, 2, 5\n    weight: 206.4\n    walk to Park (50 degrees)	2018-10-15	1	f
4191	People	    talk with Stacie	2018-11-01	1	f
4151	Fun	    ER,  Fraiser\n    	2018-10-20	2	f
4273	Church	    Jonah	2018-11-18	4	f
4218	Fun	    Mr Robot\n    	2018-11-09	2	f
4202	People	    pick up Gary & Elen from airport\n    Museum of Science and History	2018-11-17	12	f
4213	Teach	    Sensei planning documents\n    meet with Ben at Pelican Lakes\n    create slide show with PHP\n    	2018-11-15	8	f
4206	People	    Andrew and Rachel\n    Carcassonne	2018-11-12	4	f
4219	People	    Ben Fleebe over for dinner\n    Diane and Greg Fleebe	2018-11-09	2	f
4214	Fun	    This is Us, Madam Sec, Profit, British Baking, Silicon Valley\n    	2018-11-15	5	f
4242	Fun	    British Baking, ER\n    	2018-11-05	4	f
4249	Grow	    4, 3, 3, 3\n    weight: 207.4	2018-11-10	0	f
4260	Teach	    build Sensei lesson plans\n    create senseiapp architecture\n    write Git-1 and Web-1 lessons\n    	2018-11-22	8	f
4232	Teach	    Sensei - ideas for design and projects\n    build Design Review app for 350\n    	2018-11-13	9	f
4231	Grow	    5, 5, 3, 2\n    weight: 206	2018-11-13	0	f
4233	Fun	    ER, Enterprise, Mr Robot\n    	2018-11-13	5	f
4263	Teach	    think about sensei project\n    	2018-11-21	2	f
4262	Grow	    4, 2, 4, 2\n    weight: 208.2	2018-11-21	0	f
4268	People	    lunch at Thai restaurant\n    discuss teaching with Gary \n    High Hopps\n    Elen makes Spanish Tortilla	2018-11-19	9	f
4267	Fun	    puzzle book\n    Fantastic Beasts movie	2018-11-19	5	f
4269	Grow	    5, 3, 3, 4\n    weight: 209.2	2018-11-20	0	f
4266	Grow	    5, 2, 3, 2\n    weight: 209.2	2018-11-19	0	f
4238	Grow	    5, 1, 2, 3\n    weight: 209.2	2018-11-05	0	f
4227	Grow	    5, 3, 1, 3\n    weight: 208	2018-11-16	0	f
4216	Teach	    Notes App\n    design review of Teaching page\n    ssh on UNC computer\n    markdown in PHP pages\n    	2018-11-09	8	f
4265	People	    Hunt return home	2018-11-21	2	f
4250	Teach	    build Notes app\n    	2018-11-10	3	f
4243	People	    election hopes	2018-11-05	1	f
4205	Fun	    nts\n    	2018-11-12	1	f
4228	Teach	    demonstrate Slide Shows using RevealJS\n    discuss end of semester\n    Jamari Logan visits office hours\n    think about Sensei approach\n    	2018-11-16	9	f
4208	Teach	    blog for a cause\n    build Design Review app\n    	2018-11-14	6	f
4204	Teach	    Design reviews of Brain app\n    WordPress setup\n    help Jessica Herold\n    	2018-11-12	9	f
4221	Church	    church service	2018-11-04	4	f
4239	Business	    plan Creative Leap meeting	2018-11-05	1	f
4270	Fun	    puzzles book	2018-11-20	2	f
4248	People	    Andrew and Rachel	2018-11-08	2	f
4244	Grow	    4, 3, 3, 2\n    weight: 207.2\n    wakefulness	2018-11-08	0	f
4271	People	    Carcassonne \n    discuss teaching with Gary \n    WeldWerx with Hunts\n    Meekers	2018-11-20	12	f
4247	Fun	    Mr Robot, Silicon Valley\n    Solo - fell asleep\n    	2018-11-08	4	f
4256	Fun	    Mr Robot, ER, Resident, Goldbergs\n    	2018-11-07	4	f
4255	Teach	    grade assignments in 200/350\n    teach W3Schools\n    teach Auth\n    Fix issue with tabs in reviews\n    Calculations for review scores\n    	2018-11-07	8	f
4212	Grow	    4, 3, 3, 5\n    weight: 208\n    steps: 9500 steps	2018-11-15	1	f
4272	Grow	    5, 2, 3, 3\n    weight: 208.2\n    nap	2018-11-18	1	f
4259	Grow	    5, 3, 1, 2\n    weight: 207.6	2018-11-22	0	f
4220	Business	    think about Creative Leap opportunity	2018-11-04	2	f
4224	Church	    visit Ft Collins Vineyard\n    Culvers with Hoods and Garcias	2018-11-11	6	f
4225	Fun	    Sahara, ER, Good Place\n    	2018-11-11	4	f
4229	Fun	    read about Tutors\n    	2018-11-16	1	f
4246	Business	    meet with Greg McCutchan\n    discuss with Stacie	2018-11-08	4	f
4236	People	    talk with Stacie\n    election results	2018-11-06	2	f
4245	Teach	    debug auth.php\n    	2018-11-08	4	f
4237	Business	    prepare for Creative Leap meeting\n    attend lecture on book publishing	2018-11-06	5	f
4235	Fun	    Charade, British Baking\n    Silicon Valley\n    library\n    	2018-11-06	6	f
4234	Grow	    5, 1, 4, 3\n    weight: 209.2\n    haircut	2018-11-06	1	f
4253	People	    brunch at Egg & I\n    Vish and Sherry for dinner	2018-11-10	6	f
4240	Teach	    Adobe Illustrator\n    Object Pattern for apps\n    	2018-11-05	7	f
4252	Fun	    Mr Robot\n    	2018-11-10	2	f
4241	Tools	    update mac	2018-11-05	1	f
4274	People	    visit with Gary & Elen\n    High Hops\n    Profit\n    time with Stacie\n    Rio	2018-11-18	9	f
4254	Grow	    5, 3, 4, 3\n    weight: 207.4	2018-11-07	0	f
4209	Fun	    Tutors book from England\n    	2018-11-14	3	f
4215	Grow	    4, 3, 1, 1\n    weight: 207.2	2018-11-09	0	f
4210	People	    talk the Vish and Moe\n    Eric Fitzsimons\n    	2018-11-14	3	f
4223	Teach	    Ideas for Sensei Workshop project\n    	2018-11-11	2	f
4226	People	    time with Stacie	2018-11-11	1	f
4261	People	    Thanksgiving celebration	2018-11-22	6	f
4217	Tools	    meet with Ben Fleebe about teaching products	2018-11-09	2	f
4211	Church	    early Thanksgiving	2018-11-14	2	f
4207	Grow	    5, 3, 3, 4\n    weight: 208	2018-11-14	0	f
4222	Grow	    5, 3, 3, 4\n    weight: 207.6\n    nap	2018-11-11	1	f
4230	Church	    Dayspring Banquet	2018-11-16	4	f
4251	Tools	    develop ideas for Sensei Shared Learning system	2018-11-10	3	f
4180	Teach	    cover Moe's classes\n    demo UPDATE logic\n    image story & Photoshop\n    build user auth demo\n    	2018-11-02	8	f
4257	People	    discuss coaching with Stacie\n    election results	2018-11-07	2	f
4264	Fun	    Silicon Valley (finish season 4)\n    nts 2\n    ER, Goldbergs\n    	2018-11-21	10	f
1540	Tools	\n        set up seamanslog and spiritual websites\n        set up navigation between sites	2017-04-01	4	f
4315	Fun	    shopping for Christmas\n    book browsing\n    Mr Robot, GoT\n    Deathly Hallows\n    	2018-11-24	6	f
4291	Fun	    Crazy Rich Asians\n    ER\n    	2018-12-02	4	f
4289	Grow	    5, 2, 2, 3\n    weight: 208.6\n    nap	2018-12-02	2	f
4323	Grow	    4, 3, 2, 3\n    weight: 208	2018-11-26	0	f
4286	Teach	    Last day of class\n    Scheduled alternate final\n    share memory extra credit\n    talk with students\n    give early final	2018-11-30	8	f
4324	Teach	    debug system for Design Review\n    teach Learning in 200\n    	2018-11-26	8	f
4328	Teach	    setup up design reviews (final app reviews)\n    Jamari in office hours\n    talk with Vish\n    	2018-11-28	9	f
4329	Fun	    library visit\n    Mr Robot\n    historical fiction books\n    	2018-11-28	4	f
4330	People	    talk with Stacie	2018-11-28	1	f
4278	Fun	    Half-blood Prince\n    Resident\n    nts 1\n    	2018-11-23	5	f
4276	Teach	    build up Sensei lessons\n    research LMS tools\n    build Github repo for Sensei-Workshop\n    create wiki	2018-11-23	4	f
4282	Business	    plans for Agent Match system\n    write up proposal\n    	2018-11-27	5	f
4283	Fun	    nts 2\n    Mr Robot, GoT\n    	2018-11-27	6	f
4284	People	    Christine to get car fixed\n    schedule with roof repair	2018-11-27	0	f
4280	Grow	    3, 2, 2, 1\n    weight: 208	2018-11-27	0	f
4287	Fun	    Enterprise, British Baking\n    	2018-11-30	3	f
4300	Teach	    build design review sys for 350\n    prep lesson for design reviews\n    	2018-11-25	4	f
4302	Fun	    Deathly Hallows\n    GoT\n    	2018-11-25	4	f
4288	People	    Rachel's due date\n    Greeley Chop House - last class celebration	2018-11-30	3	f
4294	WAM	    build plan for WAM transition	2018-12-03	2	f
4295	Teach	    create syllabus for BACS 200 - Spring 2019\n    schedule final review assignments\n    read "most import learning" feedback\n    grade final review in 350\n    	2018-12-03	5	f
4321	Fun	    \n    	2018-12-04	0	f
4297	Church	    UNC Outreach	2018-12-03	3	f
4298	People	    Pie at Fat Alberts	2018-12-03	2	f
4293	Grow	    5, 1, 2, 4\n    weight: 209.6\n    planning	2018-12-03	1	f
4306	Teach	    Planning on Sensei Workshop project\n    	2018-12-01	2	f
4307	Fun	    GoT\n    Mr Robot\n    IMDB Trailers\n    	2018-12-01	4	f
4308	People	    breakfast at Warren's\n    Andrew and Rachel\n    discuss healthcare options with Stacie\n    sign up for Primary Care	2018-12-01	6	f
4305	Grow	    5, 1, 3, 1\n    weight: 209.2\n    nap	2018-12-01	2	f
4303	People	    Doug's Diner with Garcias and Potters\n    time with Stacie\n    	2018-11-25	2	f
4304	Church	    talk with Matt at church	2018-11-25	3	f
4301	Business	    write to Greg McCutchan	2018-11-25	1	f
4312	People	    driveway project\n    repair toilet	2018-11-29	1	f
4316	People	    La Creperie with Stacie	2018-11-24	3	f
4410	Grow	    5, 2, 2, 2\n    weight: 208.4	2018-12-23	0	f
2025	Tools	\n        refactor menu and site titles on several websites\n        make list of web services to develop\n	2017-05-28	2	f
4413	Fun	    Last Kingdom\n    	2018-12-23	1	f
4414	People	    Christmas dinner\n    Ruby feedings\n    	2018-12-23	8	f
4318	Teach	    350 grades\n    explore Code Mentor, CodePen, React\n    invite Ben to FCIP\n    attend FCIP with Ben\n    	2018-12-04	5	f
4319	Tools	    fix Menu on MyBook server\n    login for Meetup	2018-12-04	2	f
4313	Grow	    5, 3, 1, 1\n    weight: 207.6\n    bed at 8:30	2018-11-24	1	f
4314	Teach	    grading in 200	2018-11-24	4	f
4412	Tools	    build custom views\n    build doc display	2018-12-23	2	f
1548	Hire	\n        learn how to create PDF file\n        install Latex on ubuntu servers\n        attempt to setup Latex on Macs\n        build Markdown file for report (title only)\n        convert Markdown to PDF\n        display PDF file in Who2Hire application\n        manage who2hire branch merges	2017-04-03	8	f
4317	Grow	    4, 2, 1, 1\n    weight: 208.8	2018-12-04	0	f
4325	Fun	    ER, GoT, Fraiser\n    	2018-11-26	4	f
4327	Grow	    4, 1, 3, 4\n    weight: 209.2	2018-11-28	0	f
4285	Grow	    5, 2, 2, 4\n    weight: 208.2	2018-11-30	0	f
4290	Church	    Church service	2018-12-02	4	f
4296	Business	    schedule meeting with Matt\n    driveway repair	2018-12-03	1	f
4415	Grow	    5, 3, 2, 2\n    weight: 208.4	2018-12-22	0	f
4292	People	    lunch with Potters\n    Rachel in waiting\n    time with Stacie	2018-12-02	4	f
2019	Grow	\n        jetlag at sleeping patterns\n        think about non-sleeping activities\n        write about emotional triggers (5x5)\n        capture list of core emotions\n        plan most important activities\n        walk along river\n        brain purge\n        action priorities LPBT (7 each)	2017-05-27	8	f
2026	Tools	\n        build basic thot view\n        refactor workshop demo views\n        refactor Menu & SiteTitle\n        create /thot/42 view\n        think about booknotes design\n        create new WordPress site with template	2017-05-29	0	f
1587	Hire	\n        repair send mechanism\n        remove extra app code and scripts from Who2Hire\n        simplify bashrc-django \n        Issue 119. Disable notifications from staging\n        Issue 120. Landing page background color and other improvements\n        discuss User Guide with Stacie	2017-04-12	6	f
4326	People	    Sol de Jalisco   	2018-11-26	2	f
4281	Teach	    grading and student interaction\n    plan out finals	2018-11-27	3	f
4299	Grow	    5, 2, 3, 1\n    weight: 208.6	2018-11-25	0	f
4411	Teach	    \n    	2018-12-23	0	f
4322	People	    Rachel in labor\n    discuss household projects\n    vigil at hospital	2018-12-04	5	f
4309	Grow	    5, 3, 3, 2\n    weight: 208	2018-11-29	0	f
4311	Fun	    Resident, Madam Sec, This is Us\n    	2018-11-29	5	f
4279	People	    Christmas shopping	2018-11-23	2	f
4320	Business	    Isborn Security prep for meeting 12-6	2018-12-04	2	f
2268	Fun	\n        Dunkirk\n        Barnes & Noble\n        John Adams\n        So You Think You Can Dance\n	2017-08-02	8	f
112	WAM	\n        Setup email at greeleyW2w.org\n        Setup Mandrill account\n        Debug email sending\n        Setup wam.w2Wgreeley.org domain\n        Hook up notifications to email sending	2016-02-08	4	f
2280	People	\n        clean up garage with Stacie\n        meet with Jayden\n        try to setup computer for Jayden\n        try to meet with Kole Curtis\n        figure out video problem with computer for Hangouts	2017-08-05	8	f
2160	Tools	\n        clean up task view\n        start on Advisor\n        move doc links on MarkSeaman page\n        debug tasks in Aspire\n        fix domain redirector\n        create base class for Aspire views\n        remove dead code	2017-06-29	8	f
3535	WAM	    From Backup MyBook-2018-05-17 build Droplet WAM.2.2\n    ssh  django@206.189.67.111\n    git clone git@github.com:Mark-Seaman/Women2Women.git\n    create WAM 2.2 code branch\n    setup .bashrc\n    setup vc.py for version management\n    update tests to new server\n    fix failing tests\n    debug database connection	2018-06-08	4	f
921	Grow	\n        walk 2.5 miles\n        register time in harvest\n        monthly objectives\n        weekly review and plan\n        organize brain tags\n        update health score daily\n        sleep: 0, weight: 207.8, eat: 1350, exercise: 2.5 miles (5,3,5,3)	2016-10-03	5	f
330	Tools	\n        plan for technology assets\n        create scriptor.py (with dispatcher)\n        debug user command scripts	2016-04-12	5	f
365	Tools	\n        create doc edit\n        build cmd script\n        refactor cmd & doc logic into shell\n        create server script\n        implement server commands (console, deploy, command)\n        create Droplet at Digital Ocean\n        setup rsync to server\n        create command context on remote server\n        pull code from Digital Ocean\n        install git on remote server\n        set up ssh keys on django user	2016-04-22	8	f
817	Hire	\n        create design with hire data models\n        create design for hire views\n        implement hire.py script\n        implement hire_test.py script\n        update design of app/hire code\n        create view with multiple panes for opening\n        build logic to create database records\n        deploy and test on production server	2016-09-09	8	f
3744	Fun	    Travel Log: Day 5 - Passau\n    Pack up from hotel\n    Last ones on yellow bus\n    Couple missing blue bus\n    Miles of forrest and farms\n    Austria is beautiful\n    Drive through Wachau Valley\n    Arrive in Passau\n    Walking tour of Passau\n    Bishops fortress in Passau overlooking town hall\n    High water in 2013 town hall under 10' of water\n    Lunch at restaurant\n    Udo discusses immigration issues\n    Cross into Germany\n    Use headphones for music\n    Arrive in Regensburg\n    Board ship and unpack\n    Safety briefing and port talk\n    Dinner on ship with Elena & Keith\n    Evening stroll in Regensburg\n    Unpack and explore\n    7,000 steps\n    Ships stuck in Regensburg	2018-07-12	7	f
3705	Fun	    Travel Log: Day 14 - Cologne\n        Sleep in\n        Breakfast Keith & Elena\n        Dock in Cologne 9am\n        Walking tour \n            St Matthews\n            Town Hall\n            Allied bombing\n            JFK\n            Cologne Cathedral\n            Doughnuts & Beer\n            Lunch in Peters Brauhaus\n            Saugage and schnitzel\n            Roman Museum\n            Chocolate store\n        Disembarking procedure\n        Port talk\n            tipping and surveys\n            Netherlands\n            Crew show\n        Cruise through Dusseldorf at dinner\n        Heavy industry along the lower Rhine\n        9,000 steps	2018-07-21	7	f
2197	Church	\n        drive to LA\n        first night of conference\n        keynote: Adam Russell\n        check in to house\n        visit with Alan & John Hodges	2017-07-10	10	f
2494	Teach	\n        class prep #15\n        class #15 - exam feedback\n        install apps on podium PC\n        start on Jupyter notebook\n            Teaching BACS 200 \n            Web Dev\n        develop Web Dev notebook\n        create templates for page-layout \n            1-col\n            2-col\n            3-col\n            side-menu\n            top-menu	2017-09-25	11	f
3615	Teach	    find better solution for FTP to Bluehost\n    create sample PHP files for app coding\n    think through teaching approach in BACS 350\n    work on lesson structure\n    refactor Guide Views around lessons (Learn, Plan, Build, Share)	2018-06-21	4	f
2530	Teach	\n        200\n            Setup quiz \n            Ex 9, 10\n            Lecture 10/06\n            Extend quiz deadline\n        350\n            Lecture 10/06\n            PM slides\n            Lecture 10/06\n            Project Plan exercise\n        Tools & Admin\n            Slovenia	2017-10-06	8	f
3371	Teach	    commit to teaching 350 in Fall\n    build wiki for Wiki Class Project\n    think about Senior project classes	2018-05-01	4	f
2037	Hire	\n        decide on urls for who2hire.us and app.who2hire.us\n        investigate encryption on WordPress site\n        rename domains for who2hire.us and app.who2hire.us\n        debug issues related to encryption\n        convert to use who2hire URL setting for server	2017-05-31	8	f
1968	Tools	\n        update aspire/MyBook documents\n        setup Bootstraps and Blessings in MyBook\n        setup Leverage in MyBook\n        build author page and book page	2017-05-03	3	f
2148	Tools	\n        remove extra CSS template libraries from MyBook\n        explore UI elements and techniques in Material\n        workshop views\n            template_derived\n            template_columns\n            template_content\n        create view to load custom templates\n        write ThotBook on Creativity\n        simplify plan.py and todo.py\n        plan new features for Time views\n        consolidate 1000Goals and ThotBook: Goals	2017-06-26	7	f
2270	Tools	\n        create workshop/views.py code\n        support request for PipeScan\n        time tabs: Week, Month, Year\n        workshop tricks: DjangoApps, DjangoCommand, DjangoSettings, SecretSettings,\n             Parameters, QueryParameters, SimpleMatch, Accordion, Tabs, Icon\n        create new improved time summaries	2017-08-03	8	f
4416	Teach	    meet with Ben Flebbe to discuss software tools\n    	2018-12-22	2	f
4418	Fun	    Last Kingdom, GoT\n    	2018-12-22	2	f
4419	People	    grocery and Christmas shopping\n    visit with Lucy and Stacie	2018-12-22	2	f
4310	Teach	    planning\n    email\n    grade 350 final project\n    rebuild design review reporting\n    	2018-11-29	8	f
4431	Church	    Lucy stays home from church with cold	2018-12-23	3	f
4373	Tools	    rebuild web pages with Senei/Documents\n    create new repos for Sensei and Documents-2019\n    Debug MyBook server with Documents-2019	2018-12-13	4	f
2594	Fun	\n        Orville, Poldark	2017-10-24	3	f
2598	People	\n        Stacie	2017-10-25	2	f
2599	Fun	\n        TV	2017-10-25	4	f
2600	Grow	\n        5,5,4,5\n	2017-10-25	0	f
410	Fun	\n        Scandal, Mad Men\n        Roku\n	2016-05-06	4	f
2602	Grow	\n        4,5,3,2	2017-10-26	0	f
2823	Teach	\n        Class - build first week content (Lectures, Ex, Web)	2017-12-20	0	f
2603	Church	\n        board meeting\n	2017-10-26	4	f
2576	Teach	\n        350 prep (#25)\n        200 prep (#25)	2017-10-17	8	f
2577	People	\n        Hearth with Stacie	2017-10-17	2	f
2578	Fun	\n        TV\n	2017-10-17	4	f
2579	Teach	\n        350.25 Design. grade Tech Plan\n        200.25 Forms, Homework rules, John Simon	2017-10-18	8	f
2580	Grow	\n        5,5,4,5\n        Beautiful day on campus\n        10000 steps	2017-10-18	2	f
2581	Fun	\n        Elem. Fraiser\n	2017-10-18	4	f
2582	Teach	\n        200 Tabs, Accordion, Pizza Quiz\n        350 Data design, Back-end TDD\n        Jupyter + Django\n        350 Github repo	2017-10-19	8	f
3177	Fun	\n        Best Buy, Barnes and Noble\n        ER, Wonderful Houses\n        use new music player\n	2018-03-13	4	f
3915	Teach	    breakfast with Moe\n    350 Lesson 6 - Database connection basic operations\n    200 Lesson 6 - Reading URLs\n    Chris Newby - graduation requirements\n    350 - Class conflict with Registrar office\n    discuss university conflicts with Stacie, Andrew, and Rachel\n    	2018-08-31	8	f
3180	Fun	\n        setup SanDisk ClipJam device\n        investigate music players for Mac\n        load music onto Clip Jam\n        finish Heat Storm book\n        play with plastic building blocks\n        order Amazon Kindle Fire HD 10\n	2018-03-14	9	f
3188	Grow	\n        3, 4, 2, 2\n        plan out Daily Tasks\n        think about church board steps\n        process conversation with Stacie\n        Wait But Why\n        Tribe of Mentors\n        think about daily task setup	2018-03-17	6	f
3738	Fun	    Travel Log: Day 13 - Koblenz\n        Awake in Rudesheim\n        Castles of the Middle Rhine\n            Use maps to track castles\n        Stacie nap and massage\n        Lunch with Steve & Ilene\n        Walking tour in Koblenz\n            Ice cream lab\n            Eye roller on buildings\n            Local guide to tram\n            Separate from main group\n            Tram ride to Eisenbreitenburg\n            Wander around fortress\n            Stacie overheats\n            Sailors prepare ship\n            Koblenz at night\n        Dinner with Debbie & Charlie\n        Move to table with Dave & Don\n        Stace washes clothes\n        Sail from Koblenz\n        9,500 steps	2018-07-20	7	f
3227	Teach	\n        Lesson 27 - Open Source Design Templates\n        define Blog 5 and design review groups\n        update master syllabus for BACS 200	2018-03-26	6	f
128	Sign	\n        Setup code sharing with Sign team (push, branches)\n        Build script execution engine\n        Create command script for User\n        Create command script for Notify\n        Create command script for Chargify\n        Investigate design alternatives for Mandrill and Chargify\n        Debug and testing for command scripts\n        Create virtualenv for Python 3.4\n        Build script to set up new dev machine\n        Install django-extensions scripts	2016-02-12	8	f
158	Grow	\n        Thinking through personal issues with being distracted at work\n        Build simple app for cornbread charts\n        Think about dashboard\n        Discussed work issues with Stacie\n        Read Integrity book	2016-02-21	6	f
160	Sign	\n        read and experiment with forgot my password code\n        create change email logic to be patterned after the forgot my password (request, and change api calls)\n        build new Mandrill templates for Email Reset and Email Changed \n        create new notifier logic for sending email messages\n        convert change password logic to use simplified code\n        debug all new logic\n        run static analysis and fix all problems\n        create MVP-364 branch (10 new commits)	2016-02-22	10	f
209	Sign	\n        investigate activation URL\n        meeting with Hamed to learn about SignSpan DevOps\n        meeting with Thomas about testing\n        meeting with Tom about design and integration	2016-03-05	4	f
216	WAM	\n        setup redirect from greeleywAm.org to wam.weldwAm.org\n        delete unwanted database records from testing\n        turn on email test mode to allow real email logic\n        solve bug preventing email\n        reword notification for profile change\n        create initial superuser records\n        work with Stacie on testing	2016-03-07	6	f
257	WAM	\n        create process for resetting database contents\n        reset staging server database\n        test application on staging\n        update production server with WAM 2.0.2 (a)	2016-03-21	4	f
3624	WAM	    Digital Ocean Women2Women account\n    Setup new WAM Droplet\n    Configure server scripts and testing\n    Solve problem with weldw2w.org being used by Shrinking World DO account\n    Setup domain routing\n    SSL certificate	2018-06-26	10	f
2590	Fun	\n        Circle. Flash, Madam Sec	2017-10-23	4	f
2591	Grow	\n        5,5,4,5\n        walk around golf course	2017-10-23	0	f
2592	People	\n        Talk with Stacie\n	2017-10-23	2	f
2593	Teach	\n        350: #28 pair programming, Code CRUD Ex, write Exam, Jose\n        200: #28 Im Carousel, investigate cheating	2017-10-24	7	f
2595	Grow	\n        5,5,4,5\n        walk around golf course	2017-10-24	1	f
2596	People	\n        Pelican Lakes\n\n	2017-10-24	3	f
2597	Teach	\n        350: #28\n        200: #28\n        Pat Seaton observation	2017-10-25	8	f
2601	Teach	\n        350: prep #29 write exam\n        200: prep #29 final project plan\n        Restructure doc management repos\n        Work on Github processes\n        work out pull request with multiple repos\n        move Jupyter notes	2017-10-26	10	f
4277	Business	    meet with Matt Isborn\n    investigate solutions to personnel matching\n    	2018-11-23	3	f
4203	Grow	    5, 3, 3, 4\n    weight: 207.6	2018-11-12	0	f
4432	Grow	    3, 1, 1, 1\n    weight: 209.4\n    prayer during night\n    top fears\n    monthly objectives & personal review\n    nap	2018-12-26	4	f
4335	Grow	    1, 1, 1, 4\n    read Django and Rest\n    nap 	2018-12-05	4	f
4420	Teach	    build plan for class prep\n    update notes for Sensei and BACS 200 sites	2018-12-21	3	f
4333	Business	    prep for Isborn meeting\n    meet with Matt\n    research notes apps	2018-12-06	6	f
4334	People	    visit Rachel in hospital	2018-12-06	4	f
369	Sign	\n        interactive debug with \n        echo subscription code in status\n        invoke chargify api to get all subscriptions\n        use the auth key withing the Chargify API call\n        return the active status code\n        set the UNVERIFIED status for new users\n        pass through customer reference value\n        improve logging\n        write initial request user function\n        debugging on user auth	2016-04-23	8	f
408	Sign	\n        Cancel subscription from UI (first draft)\n        debugging on user registration workflow\n        build user.py script\n        build charify.py script\n        move code from registration.py to chargify.py\n        debug API for cancel subscription\n        debug API for update plan\n        work around for venue type setup bug	2016-05-06	8	f
455	WAM	\n        Deployment on Staging Server\n        Test deployment to staging server\n        Consolidate docs on configuration\n        Automate web page loading\n        Rebuild PyCharm project\n        Revamped processing of switches of test acceleration\n        Create qt for export\n        Build an export script for cases to CSV\n        Create import of cases from CSV\n        Test round trip of data\n        Refactor case.py and case_script.py\n        Automated test of case logic	2016-05-19	8	f
470	WAM	\n        Solve problem with template loading on staging server\n        Rebuild database on staging server\n        Testing on staging	2016-05-24	3	f
535	Sign	\n        investigate discounts\n        investigate tool to get info from Chargify\n        testing on dev server	2016-06-17	4	f
578	WAM	\n        measure output from each test\n        build automatic page tester with output compare\n        remove unneeded code\n        move tests into tests directory\n        improve handling of initial test results\n        build new automatic test runner\n        debug test enumerator\n        experiment with Generic Class Views	2016-07-01	8	f
640	WAM	\n        develop edit view of cases\n        fix submit issues on form\n        hide agency list from Agents\n        improve automation command scripts\n        set age on new reports\n        allow database to have blank agency\n        disable anonymous submit\n        clean up staging users for testing	2016-07-18	4	f
667	Sign	\n        review changes by Brandon for Media Approval/Rejected\n        update dev server\n        fix recursive call on checking for suspended users\n        build script for testing user table\n        improve script for testing chargify\n        build script for testing org\n        bench testing of registration workflow on dev\n        test notification messages for approved and rejected      	2016-07-25	8	f
693	Business	\n        create notes for Software Training\n        project proposal for Creative Leap Technologies	2016-08-02	2	f
694	Sign	\n        start up dev server\n        test coupons on dev server\n        test coupons on production server\n        read JIRA ticket\n        test Discount code on Sandbox\n        send tech support email\n        work on suspended user behavior	2016-08-02	8	f
746	WAM	\n        investigate missing agencies\n        create tools to map agencies to proper names\n        fix agencies in cases on production server\n        work with Stacie to find source of missing agencies\n        fix issues with login on production\n        testing of agencies\n        create list of emails for all agencies\n        decide on mapping for email addresses	2016-08-19	8	f
793	People	\n        Pilot Butte with Schillings\n        coffee shop with Ruth and Truett\n        drive from Bend to Hillsboro\n        Masala restaurant with Nardins	2016-09-01	11	f
760	WAM	\n        user stories and requirements for editing agency info\n        design for editing agency info\n        create view for edit of agency\n        create view for edit of agent\n        create security model for directors and managers\n        investigate how to insert data into a form\n        validation of form data\n        testing on staging	2016-08-22	9	f
809	Grow	\n        walk \n        write notes on Enjoying Life\n        create idea for Facebook Philosopher\n        write on Facebook\n        download calorie counter\n        sleep: 0, weight: 210.8, cal: 1300, exercise: 45 min	2016-09-07	7	f
857	Grow	\n        think about writing Life that Matters\n        think about Microbooks strategy\n        quiet time\n        walk\n        read Impact\n        sleep: -1, weight: 208.2, cal: -, exercise: 1 mile	2016-09-18	3	f
910	Hire	\n        build hire todo command\n        deploy new code\n        test user login\n        add user info to all views\n        move data between server and dev\n        create better scripts for Company, Manager, User management	2016-10-01	6	f
1007	Grow	\n        nap\n        5, 3, 3, 4\n\n# Tasks History     November 2016\n    \n## Accomplishments\n	2016-10-31	1	f
1012	Grow	\n        unpack and organize\n        review time investment\n        think about business future\n        research tablets\n        found tablet\n        plan out work\n        8000 steps (library and park)\n        combine months in hours summary\n        4, 1, 5, 5\n	2016-11-02	6	f
1020	Church	\n        lunch with Kyle at Doug's Diner\n        Big Fat Pastor's event\n        create data models for Church Leadership Dashboard	2016-11-04	6	f
315	Grow	\n        write up Retirement Funding Agreement\n        analyze revenue from Q1\n        calculate hourly rate for Q1\n        pay bills	2016-04-08	4	f
339	Grow	\n        think about personal growth\n        decide to invest in writing regularly about spiritual growth\n        understanding my life\n        walk in park\n        sort through old papers\n        process business receipts	2016-04-14	4	f
491	People	\n        visit Greek Festival\n        run into Jim Kazakoff\n        board game:  Forbidden Island\n        Garden City pub crawl\n        dinner at Hunts\n        walk along river with Stacie\n	2016-06-03	14	f
544	WAM	\n        build 5 day plan\n        create design for view structure\n        create URLs for agency, agent, case, history\n        create view logic for all four view types\n        build main menu structure\n        hook up material template and layout code\n        add logic to select each data type with URL\n        debug all view logic	2016-06-20	8	f
1136	Write	\n        post on Facebook\n        write Scoring Creativity	2016-12-03	2	f
1142	Hire	\n        design interviewer selection\n        work with Stacie on design of interview assignments\n        discuss direction of project	2016-12-05	3	f
1163	Hire	\n        create session records\n        convert existing data models\n        create views for sessions\n        assign interviewers to each session\n        interviewer assignments view\n        refactor session and interview code\n        learn how to set data directly from a form\n        expand on hacks for direct data debug\n        refine user story for interview configuration	2016-12-09	10	f
1191	Write	\n        publish Life that Matters in Seaman's Log\n        publish Creativity Score\n        publish InControl\n        organize notes	2016-12-17	4	f
1310	Aspire	\n        update project plans for next steps in Aspire\n        sort list of reports\n        develop task import to work for 2017\n        import all tasks data from 2017-02\n        add details to task records\n        automatically generate index for recent months and weeks	2017-02-01	6	f
1317	Hire	\n        write Milestones document\n        plan releases with Stacie\n        update project plans and review progress\n        create new tabbed view\n        pass response objects to interview page\n        register domain names: who2hire (us, co, biz)\n        refactor interview page code	2017-02-02	6	f
1366	Hire	\n        promote code\n        fix interview recording with interviewers for multiple openings\n        create ops commands: restart, log, push\n        create a shared branch\n        tag the release\n        write release notes\n        create Bootstrap experimental lab\n        work with Buttons, Tabs, Jumbotron, Panels\n        learn about using the CDN for Bootstrap	2017-02-13	10	f
1410	Hire	\n        debug broken python scripts (executing old PYC files)\n        convert bin/x to python script\n        debug tst on local server\n        tst on staging server\n        create admin scripts for production server\n        bring in production data from existing server\n        investigate problems with extra interview questions\n        find and fix issue with InterviewResponse object filter	2017-02-23	8	f
1419	Write	\n        Create Non-fiction - Lesson #3\n        discuss writing with Stacie\n        second draft of Incoming Airplanes\n        second draft of What You Say	2017-02-25	4	f
1426	Aspire	\n        Create signup workflow for aspire\n        Fix login link button\n        Create aspire local\n        Test aspire on localhost\n        Debug user login on localhost\n        Review logs on localhost\n        Build new instrumentation\n        Debug user admin on staging	2017-02-27	8	f
1475	Fun	\n        pack for Hawaii trip\n        travel to Kona\n        read Edge of Eternity\n	2017-03-11	14	f
1498	Grow	\n        develop ideas about Thought Patterns\n        set goals for personal plans\n        hand-drawn tables for Writing, Software, Life\n        record all food eaten\n        5, 1, 5, 4	2017-03-20	3	f
1517	Hire	\n        roll Django to 1.9.4 and back\n        change DEBUG flag to True\n        review project progress with Stacie\n        work with Christine & Stacie on test issues\n        redesign payment scenario\n        fix issue with login on Django 1.10.6\n        Issue 80. First interview session\n        Release 2017-03-24	2017-03-24	10	f
1533	Hire	\n        Issue 74. Asks each question once (first interviewer, deselect old)\n        Rebuild session list view\n        Remove code from mybook app\n        Remove tests from mybook app	2017-03-29	8	f
1646	Hire	\n        investigate upload on production server\n        solve problem with copying client-files\n        custom workflow for interviewers\n        rebuild client document uploader	2017-01-05	5	f
1787	Tools	\n        Setup ocean bin scripts\n        Implement data push and data pull	2016-01-01	2	f
1797	Tools	\n        Investigate Mandrill for email notifications\n        Investigate using Wrap Bootstrap\n        Fix issue with Dropbox sync\n        Capture canonical scripts and views	2016-01-04	4	f
1800	WAM	\n        Investigate sending email with Mandrill\n        Build simple email using SES\n        Create notify command script\n        Build form validation logic for new cases\n        Fix Bootstrap library issues\n        Simplify layout of all pages\n        Improve banner for web pages\n        Start of creating records for new cases\n	2016-01-05	8	f
1815	Business	\n        Board meeting to discuss business plan for 2016\n        Meet with Tom Yip\n        Follow up from meeting	2016-01-11	6	f
1818	WAM	\n        Create capability matrix for permissions\n        Build dynamic menus for each role\n        Implement page level security\n        Solve problem with saving form data\n        Test email notifications from Digital Ocean\n        Update todo and done lists for first and second release\n        Add view for bookkeeper\n        Show new cases when needed	2016-01-12	11	f
1866	Business	\n        Create project task estimate for WAM 2.1\n        Build ideal project profile for new project\n        Work on pricing strategy with Stacie\n        Create financial projections for 2016 Q1 \n        Submit estimate for WAM 2.1 to Women 2 Women	2016-01-29	6	f
1874	Sign	\n        setup iMac email to point to mark@signspan.com\n        organize documents for Confluence\n        process email\n        update JIRA issues status\n        MVP-352 - Fix issue with activate URL\n        setup iMac on VPN\n        write Payment System definition doc\n        write Payment System design doc\n        write User Administration requirements doc\n        update Subscriber Status doc with state machine\n        update Notification messages doc\n        learn about Mandrill templates\n        Scrum meeting	2016-02-18	8	f
1083	Grow	\n        review time summary for last quarter\n        make decisions about current time investments\n        nap\n        4, 3, 3, 1	2016-11-20	2	f
1089	Church	\n        church board meeting\n            demo of Church Dashboard\n            discuss Todd full time\n        create main menu\n        build Dashboard view\n        build Overview view\n        build Meetings and Meetings detail view\n        build Budget and Budget detail view\n        create automatic scoring\n        debug editing of records\n        data backup\n        create budget import mechanism	2016-11-22	11	f
4367	Teach	    \n    	2018-12-14	0	f
4433	Teach	    review UNC email\n    	2018-12-26	1	f
4365	Grow	    3, 3, 2, 4\n    weight: 208	2018-12-14	0	f
4366	WAM	    follow up with remaining issues for transition	2018-12-14	2	f
4369	Fun	    browse Bernard Cornwell books\n    	2018-12-14	1	f
4372	WAM	    work with Nathan and Troy to hand off WAM\n    	2018-12-13	3	f
4371	Grow	    5, 3, 3, 3\n    weight: 208	2018-12-13	0	f
3747	Fun	    Travel Log: Day 2\n    Welcome to Vienna, time with Stacie!\n    Breakfast at hotel\n    Wonderful buffet at Hilton\n    Visit with couple from Munich\n    Taxi to Cruise Hotel\n    Hang out and write\n    Meet cruise directors\n    Bus to city center\n    Baklava at grocery store\n    Walk downtown\n    Meet Valerie and Brenda\n    Nap\n    Welcome instructions\n    Worst drought since 1973\n    6,000 steps	2018-07-09	7	f
507	WAM	\n        solve issue with database incrementing of case records\n        redact sensitive data from casevote view\n        improve data reset process\n        reset database on staging server\n        rebuild users and cases from scratch\n        clean up migrations\n        move database data intact	2016-06-09	6	f
606	Sign	\n        investigate immediate vs. delayed cancel\n        setup meeting with Thomas\n        test chargify script\n        build document to show how to use chargify.py\n        setup meeting with Brandon\n        implement immediate cancel for non-production hosts\n        research Discount codes\n        implement ALWAYSFREE and 99PERCENTOFF coupons on sandbox\n        wrote Tom about production login	2016-07-08	8	f
3720	Fun	    Travel Log: Day 7 - Kelheim\n        Breakfast with Valerie and Brenda\n        Walking tour\n        Hike to liberation hall\n            Monument to commemorate Napoleon\n            Hike up road and down path\n            10,000 steps by lunch\n        Kaffeeklatsch\n            Bus to small Bavarian town\n            Visit with host family\n            Bus ride with Dave and Wendy\n            Kirsten Krånzelein - host\n        Sail through RMD canal\n            Port talk - Rhine-Main-Danube canal\n            First time sailing\n            First lock - watch procedure\n            Second lock during dinner\n            100' lock\n            Tutorial on locks\n            Wake in night to watch cruise\n            Wake up and watch the lock\n        Time with Stacie\n        12,000 steps	2018-07-14	7	f
261	Sign	\n        document layout for POSTED data (profile, password, plan, payment)\n        Sync up the repos to recover from git issues on 3-19\n        Create better error messages for user activation failures\n        Build new API for profile, payment, status, plan \n        Discuss design of new APIs with Tom\n        Start on integrating Java User API\n        Build tests for profile, payment, plan, status\n        Worked on local debug	2016-03-22	8	f
2258	Church	\n        build new church dashboard with two separate reports (Regular, Special)\n        create general infrastructure for multiple reports\n        build report with three levels of entries\n        show totals, monthly, percentages\n        send report via email to board members	2017-07-31	8	f
357	Sign	\n        Test add user scenario\n        Investigate return URL from Chargify\n        Query Chargify for list of active customers\n        Work with Tom to debug code deployment problem\n        Verify that new users are properly added to Chargify\n        Resolve issue with credit card acceptance on Chargify\n        Implement query of Chargify API to get subscription info\n        Implement status route which always returns active\n        Simplified control and data flow in setup of payments\n        Convert all payment plans to pass out subscription_id	2016-04-20	8	f
1030	Hire	\n        debug setup of users on server\n        move production data to dev server\n        baseline testing and review\n        document user stories\n        document test progress\n        refactor views in view types\n        tie openings to companies\n        require passwords to see views\n        review progress with Stacie\n        create test page for access to all views	2016-11-07	8	f
4424	People	    open presents after church\n    meet with Josiah family\n    Garcia's out house	2018-12-24	5	f
239	WAM	\n        promote code to production server\n        investigate emails that are not delivered\n        sign up for paid Mandrill account\n        build staging server\n        create process for acceptance testing\n        log all outstanding issues\n        prioritize remaining work\n        add case number links to all notifications\n        make all Status fields optional when editing\n        voting view - Display users who voted	2016-03-14	8	f
1820	WAM	\n        Debug form to add new users\n        Clean up code\n        Build script to send 5 types of notifications\n        Query for proper recipients for each notification\n        Build notification log\n        Refine logic for sending notifications\n        Add new capabilities for user roles\n        Debug voting logic and display rules\n        Update logic for handling new cases\n        Update CSS and HTML layout code	2016-01-13	10	f
392	Sign	\n        investigate new organization failure\n        restore code to reuse \n        debug the organization lookup\n        fix up exception handling\n        simplify update_java_user\n        debug update_java_user\n        fix problems caused by instrumentation\n        return better responses for errors\n        investigate setting the email address during update\n        create local script to invoke UserAPI\n        debug update_java_user with qt.py\n        integrate code changes into restration.py\n        verify old password during change\n        debug reset password	2016-04-30	11	f
116	WAM	\n        Stacie meets to review code with WAM \n        Stacie delivers code with WAM \n        Stacie's demo to project team\n        Create importer for both types of legacy data\n        Reset all case data on production server\n        Fix button issue with Safari\n        Fix issue with form submittal\n        Create email forwarding addresses at w2wweld.org\n        Setup new w2wweld.org domain\n        Convert Mandrill account to use wam@w2wweld.org\n        Create subdomain wam.w2wweld.org for hosting of app at Digital Ocean\n        Setup domain to work with Mandrill\n        Setup proper details of email text attributes\n        Test notification system	2016-02-09	10	f
4422	Tools	    Explore Codecademy\n    Try lessons for HTML, Git, Coding, Python, Git\n    debug pipenv context\n    	2018-12-24	4	f
4423	Fun	    Last Kingdom\n    	2018-12-24	1	f
4426	Grow	    4, 1, 1, 1\n    weight: 209.8\n    start getting cold\n    nap\n    prayer 	2018-12-25	2	f
4428	Tools	    learn about Codecademy	2018-12-25	2	f
4430	People	    hot cinnamon rolls\n    Christmas morning\n    Julio & Jackie's Christmas\n    conversation with Wade and Anna\n    time with Stacie\n    video with Josiah family\n    phone call with Dad\n    visit with Lucy	2018-12-25	10	f
4336	People	    Ruby is born at 6:30am\n    night at hospital\n    time with Jackie & Christine during Rachel's labor	2018-12-05	10	f
4374	Fun	    Last Kingdom\n    ER, Profit\n    	2018-12-13	4	f
4427	Teach	    \n    	2018-12-25	0	f
4375	People	    visit with Rachel and Andrew and Ruby\n    repair fireplace\n    celebrate with Stacie at Romas\n    Stacie - first shift with Ruby	2018-12-13	3	f
4429	Fun	    \n    	2018-12-25	0	f
4404	People	    tried to work on concrete project\n    visit Rachel\n    dinner at Dickie's BBQ\n    Ruby weighs 8lb 5oz	2018-12-21	4	f
4425	Church	    Christmas Eve service\n    	2018-12-24	4	f
4421	Grow	    5, 1, 1, 2\n    weight: 209.4	2018-12-24	0	f
4359	Business	    Follow up on project plan\n    Investigate notes tools for Agent Match	2018-12-07	2	f
1467	Hire	\n        Issue 49. Multiple managers\n        Issue 70. Superuser access pages\n        Issue 79. Remove scorecard view\n        Issue 75. Constrain score\n        my_company needs spoofing\n        debug interview record\n        Issue 53. Terms of Usage\n        Issue 53. Privacy policy\n        Issue 63. Add candidate score\n        Issue 73. Delete button for candidates\n        reroute Who2Hire.US url\n        Test Customer Release 1	2017-03-09	9	f
4378	People	    work on concrete for driveway\n    learn about concrete for project\n    prep project with Jayden Howell\n    Christmas decorations\n    Stacie to Ruby's\n    Ruby's family visit\n    Pizza from Pelican Joe's\n    hang lights outside	2018-12-15	8	f
4360	Fun	    Electric Dreams\n    	2018-12-07	3	f
4363	Business	    start writing user guide for Agent Match app\n    working session with Heidi\n    create initial tag list\n    setup Evernote account for Heidi\n    process to create Agent Profiles\n    process to search using tags and text\n    process to create index of matching agents\n    follow up after working session\n    	2018-12-11	6	f
4337	Grow	    3, 3, 4, 2\n    weight: 209.4	2018-12-12	0	f
4346	WAM	    prep for meeting with Nathan	2018-12-10	1	f
4349	Fun	    Last Kingdom, Good Place\n    	2018-12-09	2	f
4364	People	    write Greg McCutchen\n    write my dream phobias\n    contact Ben Flebbe - postpone working together\n    dinner at Pelican Lakes\n    time with Stacie\n    Stacie to Ruby's til 2am	2018-12-11	4	f
4340	Tools	    fix problems with websites	2018-12-12	2	f
4350	People	    Right Coast Pizza\n    Visit Ruby	2018-12-09	4	f
4352	Grow	    5, 1, 2, 3\n    weight: 210	2018-12-08	0	f
4355	Fun	    Electric Dreams\n    	2018-12-08	2	f
4356	People	    visit Garcias\n    Stacie stayed till 2am\n    Christine drove me home	2018-12-08	2	f
4379	Fun	    Fraiser, Bean Holiday\n    nts 2\n    	2018-12-15	3	f
4380	Teach	    build ideas for teaching\n    	2018-12-15	2	f
4386	Grow	    3, 1, 4, 3\n    weight: 209.4\n    write project goals\n    nap\n    build planning system\n    prayer	2018-12-16	3	f
4387	Teach	    capture ideas for teaching tools - submitting assignments\n    	2018-12-16	1	f
4393	Tools	    build test pages for MyBook server\n    debug static server\n    debug page loading and redirect\n    simplify production code\n    build common test page format\n    rebuild lessons in HTML apps\n    remove images from HTML apps	2018-12-18	6	f
4394	Fun	    finish Lady Elizabeth audiobook\n    GoT	2018-12-18	2	f
4395	People	    dinner with Beilmans at Pelegrini's\n    visit Ruby's house\n    discuss writing Life App notes\n    cleaning crew	2018-12-18	4	f
4331	Grow	    3, 1, 1, 2\n    weight: 211.4\n    wake at 4:00\n    think about the New Reformation\n    write about life motivation\n    write about Creativity and Commitments\n    record activities\n    talk with Stacie about work fulfillment	2018-12-06	3	f
4338	Teach	    write proposal for Independent Study\n    	2018-12-12	2	f
4341	Fun	    Star Trek Beyond\n    Madam Sec\n    	2018-12-12	4	f
4344	Tools	    rebuild website content for exteriorbrain, shrinking-world, seaman-tech\n    world-class-software etc.\n    fix domain router\n    experiment with character encoding\n    update pandoc char encoding \n    build project pages on shrinking-world	2018-12-10	7	f
4345	Church	    party at Beilman's new house\n    	2018-12-10	4	f
4383	Tools	    create pages for UNC classes\n    work on 404 error handling	2018-12-17	2	f
4351	Church	    advent	2018-12-09	4	f
4353	Teach	    Investigate teaching tools\n        - Repl.it, CodePen, TiddlyWiki\n    	2018-12-08	6	f
4362	Grow	    3, 1, 1, 5\n    Dr Visit intro visit to direct primary care\n    weight: 209.4\n    embrace personal brokenness (Narcissism)\n    Daily Examen app on phone	2018-12-11	4	f
4339	Business	    Isborn\n        Build shared folders\n        Work with Heidi to get first three profiles\n        Reviewed solution with Matt\n        create consulting contract + send to Matt\n    	2018-12-12	5	f
4342	People	    discuss Greg with Stacie	2018-12-12	1	f
4347	Grow	    3, 1, 3, 2\n    weight: 209.6	2018-12-09	0	f
4354	Business	    Isborn Security\n        Research tools for Agent Match platform (based on design requirements)\n        Build and share notes for project collaboration\n        Create Design Plan for initial implementation\n        Draft template for Agent Profiles	2018-12-08	4	f
4376	Grow	    5, 2, 2, 4\n    weight: 208.4	2018-12-15	0	f
4377	Tools	    update PyCharm on iMac\n    debug new repos on macbook	2018-12-15	1	f
4357	Grow	    5, 1, 2, 2\n    weight: 210.2\n    write New Reformation\n    enter notes	2018-12-07	2	f
4392	Teach	    \n    	2018-12-18	0	f
4358	Teach	    gave last final exam\n    grade both classes\n    submit final grades\n    started work on idea of independent study\n    	2018-12-07	4	f
4361	People	    Rachel & Andrew leave the hospital with Ruby\n    Stacie helps with Ruby (home at 3:00)\n    Lets Andrew & Rachel both sleep	2018-12-07	3	f
4391	Grow	    4, 3, 1, 2\n    weight: 207.4\n    haircut\n    	2018-12-18	2	f
4343	Grow	    5, 2, 1, 2\n    weight: 208.4\n    Dentist visit	2018-12-10	2	f
4348	Tools	    create plan for repos and apps\n    cancel 7 unused registered domains\n    resurrect page testing robot\n    remove old code	2018-12-09	4	f
4368	Tools	    Rename Sensei\n    Improve and test repos\n    Debug Sensei & Sensei/Document repos\n    Fix problems on existing websites\n    Simplify websites and app code (eliminate %50 of content)	2018-12-14	6	f
4402	Tools	    learn about pipenv\n    setup development for Rest\n    build Github repo for Rest API\n    learn about Django Rest API\n    record steps to build Rest API\n    update data models for Sensei Review App\n    update project planning notes for Sensei	2018-12-21	5	f
4417	Tools	    learn about pipenv\n    setup Python3 with Django\n    create data models for Course, Lesson, Student\n    write docs for building Sensei app\n    debug context loading for pipenv on Rest and MyBook projects\n    pruned MyBook - aspire, cmd, doc	2018-12-22	8	f
4401	Grow	    4, 2, 1, 1\n    weight: 208.4\n    Stacie gets a cold, sleep on couch 	2018-12-21	0	f
4398	Tools	    move Projects into Archive\n    fix tests for Archive\n    build page tester\n    site title from domdoc\n    menu from domdoc\n    random selector in Spiritual Things\n    random selector in Seamans Log	2018-12-19	6	f
4437	Grow	    4, 1, 1, 1\n    weight: 209.8\n    nap	2018-12-27	2	f
4438	Teach	    build Canvas content\n    refine lesson 1\n    	2018-12-27	2	f
4439	Tools	    work with Simple Mind app\n    optimize repo sync	2018-12-27	2	f
4440	Fun	    Aquaman\n    GoT\n    Madam Sec, Goldbergs\n    	2018-12-27	6	f
4441	People	    visit with Lucy	2018-12-27	2	f
4442	Grow	    5, 1, 1, 1\n    weight: 209.8\n    personal planning\n    injure back moving couch\n    nap\n    Food:\n        coffee - 3 cups\n        toast with peanut butter\n        reuben \n        chips and salsa\n        cherry juice - 16 oz\n        stew - 1 bowl\n        pumpkin pie\n        english toffee	2018-12-28	2	f
4443	Teach	    class prep (Lessons 1-3)\n    create reading assignments\n    create list of students for BACS200\n    create process for adding students\n    	2018-12-28	5	f
4444	Tools	    manage length of hammer.log\n    improve web command\n    create class command	2018-12-28	1	f
4445	Fun	    GoT\n    British baking, Yoyager\n    	2018-12-28	4	f
4446	People	    take down tree\n    discuss trip arrangements with Stacie	2018-12-28	2	f
4447	Grow	    3, 1, 3, 3\n    weight: 209.6\n    fever and chill at airport hotel\n    nap\n    Food:\n        coffee - 3\n        soup - 2 bowls\n        cherry juice\n        chocolates - 4 	2018-12-29	4	f
4449	Tools	    remove old database tables\n    attempt to import users for class	2018-12-29	3	f
4451	People	    pack for trip\n    40th Anniversary\n    travel to Denver- check into Westin\n    bitter cold in Colorado\n    fire alarm at Westin\n    visit with Lucy\n    took Christmas tree to recycle\n    repair fitbit band	2018-12-29	6	f
4450	Fun	    GoT\n    	2018-12-29	1	f
4448	Teach	    \n    	2018-12-29	0	f
4332	Teach	    ideas for Seaman's Guides\n    think about app architecture\n    plan first four weeks - BACS 200\n    	2018-12-06	1	f
4455	Grow	    1, 1, 4, 3\n    sleepless night, stay in bed til 1pm\n    serious back pain (diminished by 1pm)	2019-01-01	4	f
4456	Fun	    New Years Day\n    GoT\n    	2019-01-01	2	f
4457	People	    breakfast of granola, berries\n    Demitri's Greek Food\n    discuss fond memories of 2018	2019-01-01	8	f
4458	Grow	    3, 1, 1, 3\n    fever in early night	2018-12-30	2	f
4459	Fun	    travel to Ormond Beach\n    GoT\n    	2018-12-30	2	f
4460	People	    breakfast at airport\n    fly to Orlando\n    drive with Stacie Orlando-Ormond Beach\n    check into condo\n    dinner and Genevisies restaurant\n    dense fog in evening	2018-12-30	10	f
4461	Grow	    3, 3, 1, 1\n    think about gratitude\n    record aspirations for New Year\n    discuss the future with Stacie\n    create Thankful List	2019-01-03	4	f
4462	Fun	    \n    	2019-01-03	0	f
4463	People	    lunch at IHOP\n    shuffleboard\n    walk on beach	2019-01-03	4	f
4464	Grow	    5, 1, 3, 4	2019-01-02	0	f
4465	Fun	    Kennedy Space Center\n    	2019-01-02	10	f
4466	People	    dinner at Alfie's\n    talk with Stacie about the future \n    drive to KSC	2019-01-02	4	f
\.


--
-- Name: tasks_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.tasks_task_id_seq', 4466, true);


--
-- Data for Name: tool_page; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.tool_page (id, url, text, html, expected_text, expected_html) FROM stdin;
\.


--
-- Name: tool_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.tool_page_id_seq', 1, false);


--
-- Data for Name: tool_project; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.tool_project (id, name, user_id) FROM stdin;
\.


--
-- Name: tool_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.tool_project_id_seq', 1, false);


--
-- Data for Name: tool_test; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.tool_test (id, name, output, expected) FROM stdin;
153	archive-content	No directory exists\nNo directory exists	No directory exists\nNo directory exists
19	app-summary	\nCode Summary            Files     Lines\n\n    App                   218     16287\n    bin                    45      5981\n    test                   45       965\n	\nCode Summary            Files     Lines\n\n    App                   218     16287\n    bin                    45      5981\n    test                   45       965\n
34	staging-ip	\n        Command not found, staging ['ip']\n\n        usage: x cmd [args]\n\n        cmd\n\n            app         # Work with application code\n            aspire      # Set personal goals\n            author      # Manage writing content\n            booknotes   # Manage notes for reading\n            cmd         # Manage command scripts\n            collab      # Application collaborator\n            data        # Database scripting\n            doc         # Manage project documents\n            hourly      # Hourly command for maintence\n            hours       # Hours of invested time\n            log         # Manage logs\n            page        # Page Master app\n            plan        # Planning Script\n            ops         # Operations script\n            project     # Projects for clients\n            robot       # Web Robot using Selenium to fetch web pages\n            seamanslog  # Seaman's Log blog\n            spiritual   # Spiritual Things subscriber list\n            software    # Work with software training materials\n            src         # Manage source code\n            staging     # Manage server at Digital Ocean\n            task        # Task Master\n            thot        # Thot recorder\n            todo        # To do list command\n            tool        # Manage django tool scripts\n            tst         # Run tests with expected results\n            web         # Web pages\n            wordpress   # Work with wordpress server at Digital Ocean\n\n        Example: x staging ip\n                 x doc list\n                 x tst run\n        \n	\n        Command not found, staging ['ip']\n\n        usage: x cmd [args]\n\n        cmd\n\n            app         # Work with application code\n            aspire      # Set personal goals\n            author      # Manage writing content\n            booknotes   # Manage notes for reading\n            cmd         # Manage command scripts\n            collab      # Application collaborator\n            data        # Database scripting\n            doc         # Manage project documents\n            hourly      # Hourly command for maintence\n            hours       # Hours of invested time\n            log         # Manage logs\n            page        # Page Master app\n            plan        # Planning Script\n            ops         # Operations script\n            project     # Projects for clients\n            robot       # Web Robot using Selenium to fetch web pages\n            seamanslog  # Seaman's Log blog\n            spiritual   # Spiritual Things subscriber list\n            software    # Work with software training materials\n            src         # Manage source code\n            staging     # Manage server at Digital Ocean\n            task        # Task Master\n            thot        # Thot recorder\n            todo        # To do list command\n            tool        # Manage django tool scripts\n            tst         # Run tests with expected results\n            web         # Web pages\n            wordpress   # Work with wordpress server at Digital Ocean\n\n        Example: x staging ip\n                 x doc list\n                 x tst run\n        \n
155	archive-nts	no output	no output
137	email	no output	no output
156	archive-repo	No archive home directory on this computer	No archive home directory on this computer
159	doc-file-missing	No file, Test/Missing	No file, Test/Missing
160	doc-file	no output	no output
177	doc-scan	doc_encoding_test is DISABLED	doc_encoding_test is DISABLED
171	text-url	http://example.com\nhttp://example2.com	http://example.com\nhttp://example2.com
1	vc-pull	no output	no output
150	church-export	**Scriptor Error**: unknown command ['church', 'export', 'data/church.csv']\n\n\n            usage: x command \n            \n            command:\n                email       - send integrated email\n                health      - track health metrics\n                help        - show scriptor commands\n                node        - build tree structure for doc nodes\n                page        - track page content for testing\n                project     - manage project content\n                robot       - get pages from web servers\n                task        - work with tasks for user\n                thot        - thot recorder system\n                tst         - perform diff testing\n                user        - login IDs for apps\n        \n	**Scriptor Error**: unknown command ['church', 'export', 'data/church.csv']\n\n\n            usage: x command \n            \n            command:\n                email       - send integrated email\n                health      - track health metrics\n                help        - show scriptor commands\n                node        - build tree structure for doc nodes\n                page        - track page content for testing\n                project     - manage project content\n                robot       - get pages from web servers\n                task        - work with tasks for user\n                thot        - thot recorder system\n                tst         - perform diff testing\n                user        - login IDs for apps\n        \n
23	church-list	28, Greeley Vineyard, 2017-01-28, 2, 2, 4, 1\n29, Greeley Vineyard, 2017-02-04, 5, 2, 2, 1\n30, Greeley Vineyard, 2017-02-11, 4, 1, 4, 2\n31, Greeley Vineyard, 2017-02-18, 2, 1, 4, 1\n32, Greeley Vineyard, 2017-02-25, 1, 1, 5, 1\n33, Greeley Vineyard, 2017-03-04, 1, 1, 5, 1\n34, Greeley Vineyard, 2017-03-11, 1, 1, 5, 1\n35, Greeley Vineyard, 2017-03-18, 1, 1, 5, 1\n36, Greeley Vineyard, 2017-03-25, 1, 1, 5, 1\n37, Greeley Vineyard, 2017-04-01, 1, 1, 2, 1\n38, Greeley Vineyard, 2017-04-08, 1, 1, 5, 1\n39, Greeley Vineyard, 2017-04-15, 0, 0, 0, 0\n40, Greeley Vineyard, 2017-04-22, 0, 0, 0, 0\n41, Greeley Vineyard, 2017-04-29, 0, 0, 0, 0\n42, Greeley Vineyard, 2017-05-06, 0, 0, 0, 0\n43, Greeley Vineyard, 2017-05-13, 0, 0, 0, 0\n44, Greeley Vineyard, 2017-05-20, 0, 0, 0, 0\n45, Greeley Vineyard, 2017-05-27, 0, 0, 0, 0\n7, Greeley Vineyard, 2016-10-08, 2, 1, 3, 5\n8, Greeley Vineyard, 2016-10-15, 2, 5, 3, 5\n9, Greeley Vineyard, 2016-10-22, 2, 1, 3, 5\n10, Greeley Vineyard, 2016-10-29, 2, 1, 1, 1\n11, Greeley Vineyard, 2016-11-05, 5, 1, 2, 1\n12, Greeley Vineyard, 2016-11-12, 5, 1, 3, 1\n13, Greeley Vineyard, 2016-11-19, 3, 5, 3, 4\n15, Greeley Vineyard, 2016-11-26, 3, 5, 4, 1\n16, Greeley Vineyard, 2016-12-03, 2, 1, 4, 4\n21, Greeley Vineyard, 2016-12-10, 4, 1, 4, 3\n22, Greeley Vineyard, 2016-12-17, 1, 5, 4, 5\n23, Greeley Vineyard, 2016-12-24, 5, 5, 4, 3\n24, Greeley Vineyard, 2016-12-31, 4, 5, 4, 2\n25, Greeley Vineyard, 2017-01-07, 4, 5, 3, 1\n26, Greeley Vineyard, 2017-01-14, 3, 5, 5, 2\n27, Greeley Vineyard, 2017-01-21, 4, 1, 5, 2\n	28, Greeley Vineyard, 2017-01-28, 2, 2, 4, 1\n29, Greeley Vineyard, 2017-02-04, 5, 2, 2, 1\n30, Greeley Vineyard, 2017-02-11, 4, 1, 4, 2\n31, Greeley Vineyard, 2017-02-18, 2, 1, 4, 1\n32, Greeley Vineyard, 2017-02-25, 1, 1, 5, 1\n33, Greeley Vineyard, 2017-03-04, 1, 1, 5, 1\n34, Greeley Vineyard, 2017-03-11, 1, 1, 5, 1\n35, Greeley Vineyard, 2017-03-18, 1, 1, 5, 1\n36, Greeley Vineyard, 2017-03-25, 1, 1, 5, 1\n37, Greeley Vineyard, 2017-04-01, 1, 1, 2, 1\n38, Greeley Vineyard, 2017-04-08, 1, 1, 5, 1\n39, Greeley Vineyard, 2017-04-15, 0, 0, 0, 0\n40, Greeley Vineyard, 2017-04-22, 0, 0, 0, 0\n41, Greeley Vineyard, 2017-04-29, 0, 0, 0, 0\n42, Greeley Vineyard, 2017-05-06, 0, 0, 0, 0\n43, Greeley Vineyard, 2017-05-13, 0, 0, 0, 0\n44, Greeley Vineyard, 2017-05-20, 0, 0, 0, 0\n45, Greeley Vineyard, 2017-05-27, 0, 0, 0, 0\n7, Greeley Vineyard, 2016-10-08, 2, 1, 3, 5\n8, Greeley Vineyard, 2016-10-15, 2, 5, 3, 5\n9, Greeley Vineyard, 2016-10-22, 2, 1, 3, 5\n10, Greeley Vineyard, 2016-10-29, 2, 1, 1, 1\n11, Greeley Vineyard, 2016-11-05, 5, 1, 2, 1\n12, Greeley Vineyard, 2016-11-12, 5, 1, 3, 1\n13, Greeley Vineyard, 2016-11-19, 3, 5, 3, 4\n15, Greeley Vineyard, 2016-11-26, 3, 5, 4, 1\n16, Greeley Vineyard, 2016-12-03, 2, 1, 4, 4\n21, Greeley Vineyard, 2016-12-10, 4, 1, 4, 3\n22, Greeley Vineyard, 2016-12-17, 1, 5, 4, 5\n23, Greeley Vineyard, 2016-12-24, 5, 5, 4, 3\n24, Greeley Vineyard, 2016-12-31, 4, 5, 4, 2\n25, Greeley Vineyard, 2017-01-07, 4, 5, 3, 1\n26, Greeley Vineyard, 2017-01-14, 3, 5, 5, 2\n27, Greeley Vineyard, 2017-01-21, 4, 1, 5, 2\n
94	doc-status	On branch master\nYour branch is up-to-date with 'origin/master'.\nnothing to commit, working directory clean\n	On branch master\nYour branch is up-to-date with 'origin/master'.\nnothing to commit, working directory clean\n
168	text-links	[('http://example.com', 'More Examples'), ('http://example2.com', 'Even More Examples')]	[('http://example.com', 'More Examples'), ('http://example2.com', 'Even More Examples')]
135	booknotes-show	shell(x booknotes show) --> 12 lines (should be between 20 and 30)	shell(x booknotes show) --> 12 lines (should be between 20 and 30)
61	reuse-list	Tester\nNotes\nBook\nTechnology\nFrontEnd\nTest\nIndex\nPlanner\nApp\nHammerPrinciple\nScript\nContents\nBackEnd\nArchitecture\nPhotos\nTricks\n	Tester\nNotes\nBook\nTechnology\nFrontEnd\nTest\nIndex\nPlanner\nApp\nHammerPrinciple\nScript\nContents\nBackEnd\nArchitecture\nPhotos\nTricks\n
139	thot-show	no output	no output
88	doc-encoding	Ignore bad chars\n\na "\nb "\nc -\nd '\n\n\nProjects/\n├── BACS200\n├── Index\n\n\nConvert UTF8\n\na "\nb "\nc -\nd '\n\n\nProjects/\n BACS200\n Index\n\n\nConvert UTF16\n\na \nb \nc \nd \n\n\nProjects/\n BACS200\n Index\n\n	Ignore bad chars\n\na "\nb "\nc -\nd '\n\n\nProjects/\n├── BACS200\n├── Index\n\n\nConvert UTF8\n\na "\nb "\nc -\nd '\n\n\nProjects/\n BACS200\n Index\n\n\nConvert UTF16\n\na \nb \nc \nd \n\n\nProjects/\n BACS200\n Index\n\n
136	booknotes-lines	shell(x booknotes content) --> 2711 lines (should be between 1500 and 1600)	shell(x booknotes content) --> 2711 lines (should be between 1500 and 1600)
91	doc-score	\nDoc Summary                       Files       Lines        Words\n\n    Documents                      1333       90603        477 K\n	\nDoc Summary                       Files       Lines        Words\n\n    Documents                      1333       90603        477 K\n
141	mybook-menu-booknotes	('/brain', 'zmdi-library', 'Exterior Brain', None)\n('/booknotes', 'zmdi-home', 'Book Notes', 'class=active')	('/brain', 'zmdi-library', 'Exterior Brain', None)\n('/booknotes', 'zmdi-home', 'Book Notes', 'class=active')
131	app-url	Find all the URLs for the app\n\nhammer/urls.py\n\n    robots.txt$, RedirectView.as_view(url=staticfiles_storage.url('robots.txt'),  permanent=True)\n    favicon.ico$, RedirectView.as_view(url=staticfiles_storage.url('favicon.ico'), permanent=True)\n    admin, admin.site.urls\n    health/, include(health.urls)\n    health, include(health.urls)\n    life/, include(life.urls)\n    life, include(life.urls)\n    superuser/, include(superuser.urls)\n    superuser, include(superuser.urls)\n    task/, include(tasks.urls)\n    task, include(tasks.urls)\n    , include(tool.urls)\n    , include(mybook.urls)\n\nhealth/urls.py\n\n    $, HealthView\n    history$, HealthList\n    url(r'(?P<pk>\\d+)$, HealthEdit)\n\nlife/urls.py\n\n    $, LifeView\n    experience$, ExperienceView\n    year/(?P<age>[-\\d]+)$, YearView\n    (?P<age>[-\\d]+)/(?P<aspect>[\\W\\w]+)/add$, LifeAdd\n    (?P<pk>\\d+)/edit$, LifeEdit\n\nmybook/urls.py\n\n    login, login, {'template_name': 'mybook_login.html'}\n    logout$, logout, {'next_page': '/login'}\n    booknotes/(?P<title>[\\w/\\-.]*)$, BookNotes\n    info/(?P<title>[\\w/\\-_.]*)$, MyBookPrivateDoc\n    seamanslog$, SeamansLog\n    spiritual/(?P<title>[\\w\\-_.]*)$, SpiritualSelect\n    unc/(?P<title>[\\w/\\-_.]*)$, UncDocDisplay\n    (?P<title>[\\w/\\-_.]*)$, MyBookDocDisplay\n\nsuperuser/urls.py\n\n    $, AdminView\n    log, LogView\n    doc/(?P<doc>[\\w/\\-_.]+)$, DocView\n    material, MaterialView\n    test, TestView\n    users$, UsersView\n    surrogate/(?P<pk>\\d+)$, SurrogateView\n    database$, DatabaseView\n\ntasks/urls.py\n\n    add$, TaskCreate\n    url(r'(?P<pk>\\d+)/edit$, TaskUpdate\n    url(r'(?P<pk>\\d+)/delete$, TaskDelete\n    (?P<pk>\\d+)$, TaskDetail\n    import$, TaskImport\n    export$, TaskExport\n    $, TaskHome\n    summary$, TimeSummary\n    time$, MyTime\n    bad$, MissingDays\n    (?P<activity>[\\w\\d\\-\\.]*)$, TaskList\n\ntool/urls.py\n\n    project/$, ProjectList\n    project/(?P<pk>\\d+)$, ProjectDetail\n    project/add$, ProjectCreate\n    project/(?P<pk>\\d+)/edit$, ProjectUpdate\n    project/(?P<pk>\\d+)/delete$, ProjectDelete\n    user_add$, UserCreate\n    user_delete/(?P<pk>\\d+)$, UserDelete\n    user_detail/(?P<pk>\\d+)$, UserDetail\n    user_edit/(?P<pk>\\d+)$, UserEdit\n    user_list$, UserList\n	Find all the URLs for the app\n\nhammer/urls.py\n\n    robots.txt$, RedirectView.as_view(url=staticfiles_storage.url('robots.txt'),  permanent=True)\n    favicon.ico$, RedirectView.as_view(url=staticfiles_storage.url('favicon.ico'), permanent=True)\n    admin, admin.site.urls\n    health/, include(health.urls)\n    health, include(health.urls)\n    life/, include(life.urls)\n    life, include(life.urls)\n    superuser/, include(superuser.urls)\n    superuser, include(superuser.urls)\n    task/, include(tasks.urls)\n    task, include(tasks.urls)\n    , include(tool.urls)\n    , include(mybook.urls)\n\nhealth/urls.py\n\n    $, HealthView\n    history$, HealthList\n    url(r'(?P<pk>\\d+)$, HealthEdit)\n\nlife/urls.py\n\n    $, LifeView\n    experience$, ExperienceView\n    year/(?P<age>[-\\d]+)$, YearView\n    (?P<age>[-\\d]+)/(?P<aspect>[\\W\\w]+)/add$, LifeAdd\n    (?P<pk>\\d+)/edit$, LifeEdit\n\nmybook/urls.py\n\n    login, login, {'template_name': 'mybook_login.html'}\n    logout$, logout, {'next_page': '/login'}\n    booknotes/(?P<title>[\\w/\\-.]*)$, BookNotes\n    info/(?P<title>[\\w/\\-_.]*)$, MyBookPrivateDoc\n    seamanslog$, SeamansLog\n    spiritual/(?P<title>[\\w\\-_.]*)$, SpiritualSelect\n    unc/(?P<title>[\\w/\\-_.]*)$, UncDocDisplay\n    (?P<title>[\\w/\\-_.]*)$, MyBookDocDisplay\n\nsuperuser/urls.py\n\n    $, AdminView\n    log, LogView\n    doc/(?P<doc>[\\w/\\-_.]+)$, DocView\n    material, MaterialView\n    test, TestView\n    users$, UsersView\n    surrogate/(?P<pk>\\d+)$, SurrogateView\n    database$, DatabaseView\n\ntasks/urls.py\n\n    add$, TaskCreate\n    url(r'(?P<pk>\\d+)/edit$, TaskUpdate\n    url(r'(?P<pk>\\d+)/delete$, TaskDelete\n    (?P<pk>\\d+)$, TaskDetail\n    import$, TaskImport\n    export$, TaskExport\n    $, TaskHome\n    summary$, TimeSummary\n    time$, MyTime\n    bad$, MissingDays\n    (?P<activity>[\\w\\d\\-\\.]*)$, TaskList\n\ntool/urls.py\n\n    project/$, ProjectList\n    project/(?P<pk>\\d+)$, ProjectDetail\n    project/add$, ProjectCreate\n    project/(?P<pk>\\d+)/edit$, ProjectUpdate\n    project/(?P<pk>\\d+)/delete$, ProjectDelete\n    user_add$, UserCreate\n    user_delete/(?P<pk>\\d+)$, UserDelete\n    user_detail/(?P<pk>\\d+)$, UserDetail\n    user_edit/(?P<pk>\\d+)$, UserEdit\n    user_list$, UserList\n
36	author-score	  10 - capture\n  40 - draft\n  90 - refine\n 160 - share\n 300 Total\n	  10 - capture\n  40 - draft\n  90 - refine\n 160 - share\n 300 Total\n
31	hourly-list	\nHourly Tasks\n\n\n          echo "PATH=" `path`\n          echo "env=" `env`\n          echo Python: `which python`\n          # git status\n          x tst\n          x tst list\n          x tst send\n      \n\nDaily Tasks\n\n\n          # x spiritual article\n          # x seamanslog article\n          x data backup\n          rm $p/log/django.log\n      \n	\nHourly Tasks\n\n\n          echo "PATH=" `path`\n          echo "env=" `env`\n          echo Python: `which python`\n          # git status\n          x tst\n          x tst list\n          x tst send\n      \n\nDaily Tasks\n\n\n          # x spiritual article\n          # x seamanslog article\n          x data backup\n          rm $p/log/django.log\n      \n
115	page-list	shell(x page list) --> 2 lines (should be between 18 and 30)	shell(x page list) --> 2 lines (should be between 18 and 30)
173	text-anchors	[('http://example.com', 'More Examples'), ('http://example2.com', 'Even More Examples')]	[('http://example.com', 'More Examples'), ('http://example2.com', 'Even More Examples')]
146	mybook-menu-software	('/software', 'zmdi-home', 'World Class Software', 'class=active')\n('/software/Leverage', 'zmdi-key', 'Leverage Principle', None)\n('/software/BestPractice', 'zmdi-face', 'Best Practice', None)	('/software', 'zmdi-home', 'World Class Software', 'class=active')\n('/software/Leverage', 'zmdi-key', 'Leverage Principle', None)\n('/software/BestPractice', 'zmdi-face', 'Best Practice', None)
174	text-div	<p></p>	<p></p>
166	text-findall	### fix\n### test\n### extend\n### improve	### fix\n### test\n### extend\n### improve
75	opc-show	shell(x opc show) --> 42 lines (should be between 2200 and 2500)	shell(x opc show) --> 42 lines (should be between 2200 and 2500)
6	text-markdown	# Work Activities\n\nThese activities are critical to successful work.\nBalance the four activities for the best outcomes.\n\nThis is a second paragraph\nof text.\n\n## Learn\n\ncreate deeper understanding of problem\nevaluate solution\n\n## Plan\n\npast history\npresent tasks\nfuture priorities\n\n## Build\n\n### fix\n\n#### list of known problems\n\n#### issue tracking\n\n### test\n\n#### test inventory\n\n#### tests needed\n\n### extend\n\n### improve\n\n## Teach\n\nshare what you know\ninvite review\n	# Work Activities\n\nThese activities are critical to successful work.\nBalance the four activities for the best outcomes.\n\nThis is a second paragraph\nof text.\n\n## Learn\n\ncreate deeper understanding of problem\nevaluate solution\n\n## Plan\n\npast history\npresent tasks\nfuture priorities\n\n## Build\n\n### fix\n\n#### list of known problems\n\n#### issue tracking\n\n### test\n\n#### test inventory\n\n#### tests needed\n\n### extend\n\n### improve\n\n## Teach\n\nshare what you know\ninvite review\n
49	seamanslog-summary	    seamanslog                       51        1897         17 K\n\n	    seamanslog                       51        1897         17 K\n\n
40	system-host	Hostname: MyBook	Hostname: MyBook
120	software-summary	    software                         68        5366         35 K\n	    software                         68        5366         35 K\n
163	mybook-redirect	OK\nRedirect ('mybookonline.org', 'xxx', ''):  Expected: /mybook/xxx, Got: /missing/xxx\nOK\nRedirect ('mybookonline.org', 'mybook/Index', ''):  Expected: None, Got: /missing/mybook/Index\nOK\nOK\nOK\nRedirect ('mybookonline.org', 'brain', ''):  Expected: /mybook/brain, Got: /missing/brain\nRedirect ('exteriorbrain.org', 'brain', ''):  Expected: /brain/Index, Got: /missing/brain\nRedirect ('seamansguide.com', 'guide', ''):  Expected: /guide/Index, Got: None\nOK\nOK\nOK	OK\nRedirect ('mybookonline.org', 'xxx', ''):  Expected: /mybook/xxx, Got: /missing/xxx\nOK\nRedirect ('mybookonline.org', 'mybook/Index', ''):  Expected: None, Got: /missing/mybook/Index\nOK\nOK\nOK\nRedirect ('mybookonline.org', 'brain', ''):  Expected: /mybook/brain, Got: /missing/brain\nRedirect ('exteriorbrain.org', 'brain', ''):  Expected: /brain/Index, Got: /missing/brain\nRedirect ('seamansguide.com', 'guide', ''):  Expected: /guide/Index, Got: None\nOK\nOK\nOK
105	project-template	{% extends "tool_theme.html" %}\n\n{% block page_content %}\n\n    <div class="card">\n        <div class="card-header">\n            <a href="/project/">\n                <h2>Project Demo\n                    <small>Showcase for Projects</small>\n                </h2>\n            </a>\n\n            <p class="actions"> PROJECT DEMO </p>\n        </div>\n        <div class="card-body card-padding">\n\n            <div class="card" style="border: 2px solid teal; border-radius: 20px">\n\n                {% block topic_content %}\n                {% endblock %}\n\n            </div>\n\n        </div>\n    </div>\n\n{% endblock %}	{% extends "tool_theme.html" %}\n\n{% block page_content %}\n\n    <div class="card">\n        <div class="card-header">\n            <a href="/project/">\n                <h2>Project Demo\n                    <small>Showcase for Projects</small>\n                </h2>\n            </a>\n\n            <p class="actions"> PROJECT DEMO </p>\n        </div>\n        <div class="card-body card-padding">\n\n            <div class="card" style="border: 2px solid teal; border-radius: 20px">\n\n                {% block topic_content %}\n                {% endblock %}\n\n            </div>\n\n        </div>\n    </div>\n\n{% endblock %}
169	text-select-lines	<h3>fix</h3>\n<h3>test</h3>\n<h3>extend</h3>\n<h3>improve</h3>	<h3>fix</h3>\n<h3>test</h3>\n<h3>extend</h3>\n<h3>improve</h3>
84	task-week	no output	no output
85	task-work	no output	no output
132	wordpress-host	shell(x wordpress host) --> 13 lines (should be between 20 and 30)	shell(x wordpress host) --> 13 lines (should be between 20 and 30)
134	booknotes-list	booknotes list\nExecution-quotes.html\nSiteTitle\nNext100Years\nThinking-quotes.html\nEssentialism\nOriginals-quotes.html\nPresentOverPerfect\nPrinciples-quotes.html\nActivateYourBrain-quotes.html\nEssentialism-quote.html\nIndex\nExecution\nIntegrity-quotes.html\nGoodIdeas-quotes.html\nIntegrity\nEQ\nTribeOfMentors-quotes.html\n	booknotes list\nExecution-quotes.html\nSiteTitle\nNext100Years\nThinking-quotes.html\nEssentialism\nOriginals-quotes.html\nPresentOverPerfect\nPrinciples-quotes.html\nActivateYourBrain-quotes.html\nEssentialism-quote.html\nIndex\nExecution\nIntegrity-quotes.html\nGoodIdeas-quotes.html\nIntegrity\nEQ\nTribeOfMentors-quotes.html\n
179	log-length	Log Length OK - /home/django/MyBook/log/hammer.log, 1069 lines	Log Length OK - /home/django/MyBook/log/hammer.log, 1547 lines
65	ops-server-type	Ops Command - production type\n\n        ops production ['type']\n\n        usage: x ops COMMAND [ARGS]\n\n        COMMAND:\n\n            command - execute a single command on the remote server\n            console - login to production\n            deploy  - push all changes to staging server\n            log     - show the log on the production server\n            restart - restart the web server\n            root    - show the root console\n            update  - push all files to remote server\n\n        \n	Ops Command - production type\n\n        ops production ['type']\n\n        usage: x ops COMMAND [ARGS]\n\n        COMMAND:\n\n            command - execute a single command on the remote server\n            console - login to production\n            deploy  - push all changes to staging server\n            log     - show the log on the production server\n            restart - restart the web server\n            root    - show the root console\n            update  - push all files to remote server\n\n        \n
20	app-switches	from os import environ\nfrom os.path import join\nfrom platform import node\n\n# Project\nHOME = environ.get('HOME', '/home/django')\nPROJECT_BASE = join(HOME, 'Projects', 'hammer')\n\n\n# Application Config\nBASE_DIR = environ.get('p', '/home/django/MyBook')\n\nAPP_PORT = '8001'\nAPP_DIRS = ['bin', 'hammer', 'test', 'tool', 'spiritual']\nAPP_DIR = 'tool'\n\n\n# Documents\nDOC_DIRS = ['tech', 'spiritual', 'software', 'seamanslog', 'brain', 'MarkSeaman']\nTODO_DIR  = join(BASE_DIR, 'Documents', 'info', 'days')\nTHOT_DIR = join(BASE_DIR, 'Documents', 'thot')\nTODO_FILES = [\n    join(TODO_DIR, '2018-05-08'),\n]\n\n\n# Test Settings\nTEST_ARCHIVE = False\nTEST_DOC = join(BASE_DIR, 'Documents', 'info', 'history', 'Index')\nTEST_DOC_ENCODING = False\nTEST_DATA = False\nTEST_SELENIUM = True\nTEST_EMAIL = False\nTEST_PAGES = join(BASE_DIR, 'Documents', 'tech', 'test', 'pages')\nTEST_HOSTS = ['localhost:8001', environ.get('DROPLET_IP','localhost')]\nIMPORT_RECORDS = True\nEXPORT_RECORDS = True\nSHOW_WEB_PAGE = False\nON_INTERNET = True\n\n\n# Servers\nWHO2HIRE_PRODUCTION  = 'app.who2hire.us'         # 138.68.46.197\nMYBOOK_PRODUCTION    = 'markseaman.org'    # 138.68.234.96  # old: 45.55.50.13\nSERVER_DIR           = '/home/django/MyBook'\n\n\n# Server Types\nif node()   == 'MyBook':           \n    SERVER_TYPE = 'production'\nelif node() == 'MyBook-Staging':   \n    SERVER_TYPE = 'staging'\nelif node() == 'Marks-iMac.local':\n    SERVER_TYPE = 'imac'\nelif node() == 'seaman-macbook.local':\n    SERVER_TYPE = 'macbook'\nelse:  \n    SERVER_TYPE = 'dev'\n\n\n# Type of server for this machine\ndef server_type():\n    return SERVER_TYPE\n\n\n# Select Domain that matches Hostname\ndef server_host(server):\n    if   server == 'who2hire':             return 'who2hire.co'\n    elif server == 'MyBook':               return 'markseaman.org'\n    elif server == 'Marks-iMac.local':     return 'iMac'\n    elif server == 'seaman-macbook.local': return 'macbook'\n\n	from os import environ\nfrom os.path import join\nfrom platform import node\n\n# Project\nHOME = environ.get('HOME', '/home/django')\nPROJECT_BASE = join(HOME, 'Projects', 'hammer')\n\n\n# Application Config\nBASE_DIR = environ.get('p', '/home/django/MyBook')\n\nAPP_PORT = '8001'\nAPP_DIRS = ['bin', 'hammer', 'test', 'tool', 'spiritual']\nAPP_DIR = 'tool'\n\n\n# Documents\nDOC_DIRS = ['tech', 'spiritual', 'software', 'seamanslog', 'brain', 'MarkSeaman']\nTODO_DIR  = join(BASE_DIR, 'Documents', 'info', 'days')\nTHOT_DIR = join(BASE_DIR, 'Documents', 'thot')\nTODO_FILES = [\n    join(TODO_DIR, '2018-05-08'),\n]\n\n\n# Test Settings\nTEST_ARCHIVE = False\nTEST_DOC = join(BASE_DIR, 'Documents', 'info', 'history', 'Index')\nTEST_DOC_ENCODING = False\nTEST_DATA = False\nTEST_SELENIUM = True\nTEST_EMAIL = False\nTEST_PAGES = join(BASE_DIR, 'Documents', 'tech', 'test', 'pages')\nTEST_HOSTS = ['localhost:8001', environ.get('DROPLET_IP','localhost')]\nIMPORT_RECORDS = True\nEXPORT_RECORDS = True\nSHOW_WEB_PAGE = False\nON_INTERNET = True\n\n\n# Servers\nWHO2HIRE_PRODUCTION  = 'app.who2hire.us'         # 138.68.46.197\nMYBOOK_PRODUCTION    = 'markseaman.org'    # 138.68.234.96  # old: 45.55.50.13\nSERVER_DIR           = '/home/django/MyBook'\n\n\n# Server Types\nif node()   == 'MyBook':           \n    SERVER_TYPE = 'production'\nelif node() == 'MyBook-Staging':   \n    SERVER_TYPE = 'staging'\nelif node() == 'Marks-iMac.local':\n    SERVER_TYPE = 'imac'\nelif node() == 'seaman-macbook.local':\n    SERVER_TYPE = 'macbook'\nelse:  \n    SERVER_TYPE = 'dev'\n\n\n# Type of server for this machine\ndef server_type():\n    return SERVER_TYPE\n\n\n# Select Domain that matches Hostname\ndef server_host(server):\n    if   server == 'who2hire':             return 'who2hire.co'\n    elif server == 'MyBook':               return 'markseaman.org'\n    elif server == 'Marks-iMac.local':     return 'iMac'\n    elif server == 'seaman-macbook.local': return 'macbook'\n\n
103	project-import	\n\n        script to manage projects on servers\n\n        usage: x project command\n\n        command\n\n        List:\n            list                - list the configured project\n            get   name          - get a project by name lookup\n\n        Modify:\n            add     name user   - add a new project record\n            delete  name        - remove this project\n            edit    name value  - rename the project\n\n        I/O \n            import              - import all records from a file \n            export              - export all records to a file \n\n        \n	\n\n        script to manage projects on servers\n\n        usage: x project command\n\n        command\n\n        List:\n            list                - list the configured project\n            get   name          - get a project by name lookup\n\n        Modify:\n            add     name user   - add a new project record\n            delete  name        - remove this project\n            edit    name value  - rename the project\n\n        I/O \n            import              - import all records from a file \n            export              - export all records to a file \n\n        \n
154	archive-dirs	dirs(/home/django/Archive/MyBook-2017) --> 1 dirs (should be between 504 and 507)\ndirs(/home/django/Archive/Documents-2017) --> 1 dirs (should be between 108 and 108)\ndirs(/home/django/Archive/Documents-2016) --> 1 dirs (should be between 88 and 88)\ndirs(/home/django/Archive/Documents-2015) --> 1 dirs (should be between 250 and 250)\ndirs(/home/django/Archive/Documents-2014) --> 1 dirs (should be between 947 and 947)\ndirs(/home/django/Archive/UNC-2017) --> 1 dirs (should be between 3643 and 3645)\ndirs(/home/django/Archive/rcp) --> 1 dirs (should be between 800 and 960)\n	dirs(/home/django/Archive/MyBook-2017) --> 1 dirs (should be between 504 and 507)\ndirs(/home/django/Archive/Documents-2017) --> 1 dirs (should be between 108 and 108)\ndirs(/home/django/Archive/Documents-2016) --> 1 dirs (should be between 88 and 88)\ndirs(/home/django/Archive/Documents-2015) --> 1 dirs (should be between 250 and 250)\ndirs(/home/django/Archive/Documents-2014) --> 1 dirs (should be between 947 and 947)\ndirs(/home/django/Archive/UNC-2017) --> 1 dirs (should be between 3643 and 3645)\ndirs(/home/django/Archive/rcp) --> 1 dirs (should be between 800 and 960)\n
158	tst-time	Fri Jan  4 07:00:12 MST 2019\n	Sat Dec 29 09:42:14 MST 2018\n
144	mybook-menu-list	Documents/Menu\nDocuments/info/Menu\nDocuments/aspire/Menu\nDocuments/seamanslog/Menu\nDocuments/Leverage/Menu\nDocuments/spiritual/Menu\nDocuments/MarkSeaman/Menu\nDocuments/guide/Teaching/Menu\nDocuments/guide/Menu\nDocuments/guide/HtmlApps/Menu\nDocuments/guide/PhpApps/Menu	Documents/Menu\nDocuments/info/Menu\nDocuments/aspire/Menu\nDocuments/seamanslog/Menu\nDocuments/Leverage/Menu\nDocuments/spiritual/Menu\nDocuments/MarkSeaman/Menu\nDocuments/guide/Teaching/Menu\nDocuments/guide/Menu\nDocuments/guide/HtmlApps/Menu\nDocuments/guide/PhpApps/Menu
145	mybook-menu-mybook	('http://seaman-tech.com', 'zmdi-accounts-list', 'Shrinking World', None)\n('/mybook/Index', 'zmdi-home', 'Home', None)\n('/mybook/book_list', 'zmdi-local-library', 'Books', None)\n('/mybook/author_list', 'zmdi-face', 'Authors', None)	('http://seaman-tech.com', 'zmdi-accounts-list', 'Shrinking World', None)\n('/mybook/Index', 'zmdi-home', 'Home', None)\n('/mybook/book_list', 'zmdi-local-library', 'Books', None)\n('/mybook/author_list', 'zmdi-face', 'Authors', None)
148	mybook-menu-swo	('/shrinking-world/Index', 'zmdi-home', 'Shrinking World', 'class=active')\n('/shrinking-world/Blog/Index', 'zmdi-library', 'Blog', None)\n('/shrinking-world/Staff', 'zmdi-accounts', 'Staff', None)\n('https://world-class-software.com/software/Index', 'zmdi-book', 'Training', None)	('/shrinking-world/Index', 'zmdi-home', 'Shrinking World', 'class=active')\n('/shrinking-world/Blog/Index', 'zmdi-library', 'Blog', None)\n('/shrinking-world/Staff', 'zmdi-accounts', 'Staff', None)\n('https://world-class-software.com/software/Index', 'zmdi-book', 'Training', None)
69	hours-days	\n	\n
51	score-list	\n        score Command\n\n        usage: x score COMMAND\n\n        COMMAND:\n\n            edit    - edit the scorecard\n            show    - show the doc content\n            update  - calculate the score\n            web     - show the remote scorecard\n\n        \n	\n        score Command\n\n        usage: x score COMMAND\n\n        COMMAND:\n\n            edit    - edit the scorecard\n            show    - show the doc content\n            update  - calculate the score\n            web     - show the remote scorecard\n\n        \n
127	src-unique	manage.py\n__init__.py\nmybook/book.py\nmybook/book_views.py\nmybook/admin.py\nmybook/models.py\nmybook/urls.py\nmybook/task.py\nmybook/author.py\nmybook/mybook.py\nmybook/__init__.py\nmybook/info.py\nmybook/author_views.py\nmybook/outline.py\nmybook/tests.py\nmybook/mybook_views.py\nmybook/apps.py\nmybook/chapter.py\nconfig/x.py\ntest/mybook_test.py\ntest/seamanslog_test.py\ntest/text_test.py\ntest/doc_test.py\ntest/days_test.py\ntest/tst_test.py\ntest/user_test.py\ntest/ops_test.py\ntest/health_test.py\ntest/src_test.py\ntest/archive_test.py\ntest/cmd_test.py\ntest/page_test.py\ntest/node_test.py\ntest/email_test.py\ntest/system_test.py\ntest/booknotes_test.py\ntest/wordpress_test.py\ntest/unc_test.py\ntest/vc_test.py\ntest/i_test.py\ntest/app_test.py\ntest/music_test.py\ntest/robot_test.py\ntest/css_test.py\ntest/data_test.py\ntest/datatype_test.py\ntest/hourly_test.py\ntest/__init__.py\ntest/aspire_test.py\ntool/user.py\ntool/document.py\ntool/user_views.py\ntool/robot.py\ntool/models.py\ntool/urls.py\ntool/xxx_script.py\ntool/log.py\ntool/project.py\ntool/email.py\ntool/domain.py\ntool/notify.py\ntool/page.py\ntool/tst.py\ntool/__init__.py\ntool/xxx_views.py\ntool/xxx.py\ntool/management/__init__.py\ntool/management/commands/scriptor.py\ntool/management/commands/__init__.py\nhammer/urls.py\nhammer/settings.py\nhammer/__init__.py\nhammer/wsgi.py\nhammer/secret_settings.py\naspire/goal_views.py\naspire/project_views.py\naspire/client.py\naspire/admin.py\naspire/models.py\naspire/node.py\naspire/node_views.py\naspire/urls.py\naspire/project.py\naspire/role_views.py\naspire/role.py\naspire/aspire.py\naspire/client_views.py\naspire/doc.py\naspire/__init__.py\naspire/advisor_views.py\naspire/tests.py\naspire/apps.py\naspire/goal.py\naspire/views.py\nbin/cmd.py\nbin/book.py\nbin/user.py\nbin/switches.py\nbin/web.py\nbin/booknotes.py\nbin/days.py\nbin/faceblog.py\nbin/guide.py\nbin/src.py\nbin/vc.py\nbin/hours.py\nbin/text.py\nbin/shell.py\nbin/log.py\nbin/resize.py\nbin/datatype.py\nbin/data.py\nbin/page_tests.py\nbin/files.py\nbin/tool.py\nbin/remote_tests.py\nbin/ntsh.py\nbin/life.py\nbin/score.py\nbin/aspire.py\nbin/doc.py\nbin/hourly.py\nbin/todo.py\nbin/app.py\nbin/spiritual.py\nbin/x.py\nbin/n.py\nbin/__init__.py\nbin/archive.py\nbin/i.py\nbin/music.py\nbin/pandoc.py\nbin/ops.py\nbin/seamanslog.py\nbin/wordpress.py\nsensei/admin.py\nsensei/models.py\nsensei/__init__.py\nsensei/tests.py\nsensei/apps.py\nsensei/views.py\nunc/admin.py\nunc/review.py\nunc/models.py\nunc/sensei.py\nunc/urls.py\nunc/__init__.py\nunc/tests.py\nunc/apps.py\nunc/views.py\nlife/admin.py\nlife/models.py\nlife/urls.py\nlife/life.py\nlife/__init__.py\nlife/tests.py\nlife/apps.py\nlife/views.py\nhealth/health.py\nhealth/admin.py\nhealth/models.py\nhealth/urls.py\nhealth/__init__.py\nhealth/tests.py\nhealth/apps.py\nhealth/views.py\nsuperuser/admin.py\nsuperuser/models.py\nsuperuser/urls.py\nsuperuser/initialize.py\nsuperuser/admin_views.py\nsuperuser/__init__.py\nsuperuser/tests.py\nsuperuser/apps.py\ntasks/models.py\ntasks/urls.py\ntasks/task.py\ntasks/summary.py\ntasks/__init__.py\ntasks/views.py\nguide/urls.py\nguide/__init__.py\nguide/views.py\n	manage.py\n__init__.py\nmybook/book.py\nmybook/book_views.py\nmybook/admin.py\nmybook/models.py\nmybook/urls.py\nmybook/task.py\nmybook/author.py\nmybook/mybook.py\nmybook/__init__.py\nmybook/info.py\nmybook/author_views.py\nmybook/outline.py\nmybook/tests.py\nmybook/mybook_views.py\nmybook/apps.py\nmybook/chapter.py\nconfig/x.py\ntest/mybook_test.py\ntest/seamanslog_test.py\ntest/text_test.py\ntest/doc_test.py\ntest/days_test.py\ntest/tst_test.py\ntest/user_test.py\ntest/ops_test.py\ntest/health_test.py\ntest/src_test.py\ntest/archive_test.py\ntest/cmd_test.py\ntest/page_test.py\ntest/node_test.py\ntest/email_test.py\ntest/system_test.py\ntest/booknotes_test.py\ntest/wordpress_test.py\ntest/unc_test.py\ntest/vc_test.py\ntest/i_test.py\ntest/app_test.py\ntest/music_test.py\ntest/robot_test.py\ntest/css_test.py\ntest/data_test.py\ntest/datatype_test.py\ntest/hourly_test.py\ntest/__init__.py\ntest/aspire_test.py\ntool/user.py\ntool/document.py\ntool/user_views.py\ntool/robot.py\ntool/models.py\ntool/urls.py\ntool/xxx_script.py\ntool/log.py\ntool/project.py\ntool/email.py\ntool/domain.py\ntool/notify.py\ntool/page.py\ntool/tst.py\ntool/__init__.py\ntool/xxx_views.py\ntool/xxx.py\ntool/management/__init__.py\ntool/management/commands/scriptor.py\ntool/management/commands/__init__.py\nhammer/urls.py\nhammer/settings.py\nhammer/__init__.py\nhammer/wsgi.py\nhammer/secret_settings.py\naspire/goal_views.py\naspire/project_views.py\naspire/client.py\naspire/admin.py\naspire/models.py\naspire/node.py\naspire/node_views.py\naspire/urls.py\naspire/project.py\naspire/role_views.py\naspire/role.py\naspire/aspire.py\naspire/client_views.py\naspire/doc.py\naspire/__init__.py\naspire/advisor_views.py\naspire/tests.py\naspire/apps.py\naspire/goal.py\naspire/views.py\nbin/cmd.py\nbin/book.py\nbin/user.py\nbin/switches.py\nbin/web.py\nbin/booknotes.py\nbin/days.py\nbin/faceblog.py\nbin/guide.py\nbin/src.py\nbin/vc.py\nbin/hours.py\nbin/text.py\nbin/shell.py\nbin/log.py\nbin/resize.py\nbin/datatype.py\nbin/data.py\nbin/page_tests.py\nbin/files.py\nbin/tool.py\nbin/remote_tests.py\nbin/ntsh.py\nbin/life.py\nbin/score.py\nbin/aspire.py\nbin/doc.py\nbin/hourly.py\nbin/todo.py\nbin/app.py\nbin/spiritual.py\nbin/x.py\nbin/n.py\nbin/__init__.py\nbin/archive.py\nbin/i.py\nbin/music.py\nbin/pandoc.py\nbin/ops.py\nbin/seamanslog.py\nbin/wordpress.py\nsensei/admin.py\nsensei/models.py\nsensei/__init__.py\nsensei/tests.py\nsensei/apps.py\nsensei/views.py\nunc/admin.py\nunc/review.py\nunc/models.py\nunc/sensei.py\nunc/urls.py\nunc/__init__.py\nunc/tests.py\nunc/apps.py\nunc/views.py\nlife/admin.py\nlife/models.py\nlife/urls.py\nlife/life.py\nlife/__init__.py\nlife/tests.py\nlife/apps.py\nlife/views.py\nhealth/health.py\nhealth/admin.py\nhealth/models.py\nhealth/urls.py\nhealth/__init__.py\nhealth/tests.py\nhealth/apps.py\nhealth/views.py\nsuperuser/admin.py\nsuperuser/models.py\nsuperuser/urls.py\nsuperuser/initialize.py\nsuperuser/admin_views.py\nsuperuser/__init__.py\nsuperuser/tests.py\nsuperuser/apps.py\ntasks/models.py\ntasks/urls.py\ntasks/task.py\ntasks/summary.py\ntasks/__init__.py\ntasks/views.py\nguide/urls.py\nguide/__init__.py\nguide/views.py\n
152	unc-files	files(/home/django/Projects/UNC-2018-Spring) --> 1 files (should be between 6400 and 7500)	files(/home/django/Projects/UNC-2018-Spring) --> 1 files (should be between 6400 and 7500)
142	mybook-menu-brain	('/brain/Index', 'zmdi-home', 'Home', 'class=active')\n('/brain/Learn', 'zmdi-storage', 'Learn', None)\n('/brain/Plan', 'zmdi-accounts-alt', 'Plan', None)\n('/brain/Build', 'zmdi-comment-text-alt', 'Build', None)\n('/brain/Teach', 'zmdi-assignment-account', 'Teach', None)	('/brain/Index', 'zmdi-home', 'Home', 'class=active')\n('/brain/Learn', 'zmdi-storage', 'Learn', None)\n('/brain/Plan', 'zmdi-accounts-alt', 'Plan', None)\n('/brain/Build', 'zmdi-comment-text-alt', 'Build', None)\n('/brain/Teach', 'zmdi-assignment-account', 'Teach', None)
133	wordpress-list	wordpress list\nNo directory exists\n	wordpress list\nNo directory exists\n
100	days-month	no output	no output
162	days-schedule	Week 0 - Mon, 08-20\nWeek 1 - Mon, 08-27\nWeek 2 - Mon, 09-03\nWeek 3 - Mon, 09-10\nWeek 4 - Mon, 09-17\nWeek 5 - Mon, 09-24\nWeek 6 - Mon, 10-01\nWeek 7 - Mon, 10-08\nWeek 8 - Mon, 10-15\nWeek 9 - Mon, 10-22\nWeek 10 - Mon, 10-29\nWeek 11 - Mon, 11-05\nWeek 12 - Mon, 11-12\nWeek 13 - Mon, 11-19\nWeek 14 - Mon, 11-26\nWeek 15 - Mon, 12-03\n	Week 0 - Mon, 08-20\nWeek 1 - Mon, 08-27\nWeek 2 - Mon, 09-03\nWeek 3 - Mon, 09-10\nWeek 4 - Mon, 09-17\nWeek 5 - Mon, 09-24\nWeek 6 - Mon, 10-01\nWeek 7 - Mon, 10-08\nWeek 8 - Mon, 10-15\nWeek 9 - Mon, 10-22\nWeek 10 - Mon, 10-29\nWeek 11 - Mon, 11-05\nWeek 12 - Mon, 11-12\nWeek 13 - Mon, 11-19\nWeek 14 - Mon, 11-26\nWeek 15 - Mon, 12-03\n
11	app-classes	bin/__init__.py\n    \nbin/app.py\n    \nbin/aspire.py\n    \nbin/book.py\n    \nbin/booknotes.py\n    \nbin/data.py\n    \nbin/datatype.py\n    \nbin/days.py\n    \nbin/diagrams.py\n    \nbin/doc.py\n    \nbin/faceblog.py\n    \nbin/files.py\n    \nbin/grades.py\n    \nbin/guide.py\n    \nbin/hourly.py\n    \nbin/hours.py\n    \nbin/i.py\n    \nbin/life.py\n    \nbin/log.py\n    \nbin/music.py\n    \nbin/n.py\n    \nbin/ntsh.py\n    \nbin/ops.py\n    \nbin/page_tests.py\n    # class PagesTest(TestCase):\n    class RemoteTest(TestCase):\n    # class RemoteTest(TestCase):\nbin/pandoc.py\n    \nbin/remote_tests.py\n    # class RemoteTest(FunctionalTestCase):\n    # class PythonTest(FunctionalTestCase):\nbin/resize.py\n    \nbin/score.py\n    \nbin/seamanslog.py\n    \nbin/shell.py\n    \nbin/spiritual.py\n    \nbin/src.py\n    \nbin/switches.py\n    \nbin/text.py\n        pattern = r'class (.*)\\(.*\\)'\nbin/todo.py\n    \nbin/tool.py\n    \nbin/user.py\n    \nbin/vc.py\n    \nbin/web.py\n    \nbin/wordpress.py\n    \nbin/x.py\n    \nhammer/__init__.py\n    \nhammer/secret_settings.py\n    \nhammer/settings.py\n    \nhammer/urls.py\n    \nhammer/wsgi.py\n    \nhealth/__init__.py\n    \nhealth/admin.py\n    \nhealth/apps.py\n    class HealthConfig(AppConfig):\nhealth/health.py\n    \nhealth/models.py\n    class HealthScore(models.Model):\nhealth/tests.py\n    \nhealth/urls.py\n    \nhealth/views.py\n    class HealthView(TemplateView):\n    class HealthList(ListView):\n    class HealthEdit(UpdateView):\nlife/__init__.py\n    \nlife/admin.py\n    \nlife/apps.py\n    class LifeConfig(AppConfig):\nlife/life.py\n    \nlife/models.py\n    class Year(models.Model):\n    class Aspect(models.Model):\n    class Experience(models.Model):\nlife/tests.py\n    \nlife/urls.py\n    \nlife/views.py\n    class LifeView(TemplateView):\n    class ExperienceView(ListView):\n    class YearView(ListView):\n    class LifeAdd(LoginRequiredMixin, RedirectView):\n    class LifeEdit(UpdateView):\nmybook/__init__.py\n    \nmybook/admin.py\n    \nmybook/apps.py\n    class MybookConfig(AppConfig):\nmybook/models.py\n    class Author(models.Model):\n    class Book(models.Model):\nmybook/mybook.py\n    \nmybook/mybook_views.py\n    class MyBookDocDisplay(TemplateView):\n    class MyBookPrivateDoc(LoginRequiredMixin, MyBookDocDisplay):\n    class BookNotes(MyBookDocDisplay):\n    class CardView(MyBookDocDisplay):\n    class OutlineView(MyBookDocDisplay):\n    class DailyTask(RedirectView):\n    # class SeamansLog(MyBookDocDisplay):\n    class SeamansLog(RedirectView):\n    class SpiritualSelect(RedirectView):\n    class TabsView(MyBookDocDisplay):\n    class UncDocDisplay(TemplateView):\nmybook/outline.py\n    \nmybook/task.py\n    \nmybook/tests.py\n    \nmybook/urls.py\n    \nsuperuser/__init__.py\n    \nsuperuser/admin.py\n    \nsuperuser/admin_views.py\n    class AdminView(UserPassesTestMixin, TemplateView):\n    class DatabaseView(UserPassesTestMixin, TemplateView):\n    class DocView(UserPassesTestMixin, TemplateView):\n    class LogView(UserPassesTestMixin, TemplateView):\n    class MaterialView(TemplateView):\n    class SurrogateView(UserPassesTestMixin, TemplateView):\n    class TestView(UserPassesTestMixin, ListView):\n    class UsersView(UserPassesTestMixin, ListView):\nsuperuser/apps.py\n    class AdminConfig(AppConfig):\nsuperuser/initialize.py\n    \nsuperuser/models.py\n    class Administrator(models.Model):\nsuperuser/tests.py\n    \nsuperuser/urls.py\n    \ntasks/__init__.py\n    \ntasks/models.py\n    class Task (models.Model):\ntasks/summary.py\n    \ntasks/task.py\n    \ntasks/urls.py\n    \ntasks/views.py\n    class TaskBase(LoginRequiredMixin, ContextMixin):\n    class TaskDelete(DeleteView):\n    class TaskDetail(DetailView):\n    class TaskCreate(CreateView):\n    class TaskUpdate(TaskBase, UpdateView):\n    class TaskHome(TaskBase, TemplateView):\n    class TaskList(TaskBase, ListView):\n    class MyTime(TaskBase, TemplateView):\n    class TimeSummary(TaskBase, TemplateView):\n    class MissingDays(TaskBase, TemplateView):\n    class TaskImport(RedirectView):\n    class TaskExport(TaskBase, TemplateView):\ntest/__init__.py\n    \ntest/app_test.py\n    \ntest/archive_test.py\n    \ntest/aspire_test.py\n    \ntest/booknotes_test.py\n    \ntest/css_test.py\n    \ntest/data_test.py\n    \ntest/doc_test.py\n    \ntest/health_test.py\n    \ntest/hourly_test.py\n    \ntest/i_test.py\n    \ntest/log_test.py\n    \ntest/ops_test.py\n    \ntest/page_test.py\n    \ntest/robot_test.py\n    \ntest/seamanslog_test.py\n    \ntest/system_test.py\n    \ntest/text_test.py\n    \ntest/tst_test.py\n    \ntest/unc_test.py\n    \ntest/user_test.py\n    \ntest/vc_test.py\n    \ntest/wordpress_test.py\n    \ntool/__init__.py\n    \ntool/document.py\n    \ntool/domain.py\n    \ntool/email.py\n    \ntool/log.py\n    \ntool/management/__init__.py\n    \ntool/management/commands/__init__.py\n    \ntool/management/commands/scriptor.py\n    class Command(BaseCommand):\ntool/models.py\n    class Test(models.Model):\n    class Page(models.Model):\n    class Project(models.Model):\ntool/notify.py\n    \ntool/page.py\n    \ntool/project.py\n    class ProjectList(ListView):\n    class ProjectDetail(DetailView):\n    class ProjectCreate(CreateView):\n    class ProjectUpdate(UpdateView):\n    class ProjectDelete(DeleteView):\ntool/robot.py\n    \ntool/tst.py\n    \ntool/urls.py\n    \ntool/user.py\n    \ntool/user_views.py\n    class UserList(ListView):\n    class UserCreate(CreateView):\n    class UserDetail(DetailView):\n    class UserEdit(UpdateView):\n    class UserDelete(DeleteView):\ntool/xxx.py\n    # class Xxx(models.Model):\ntool/xxx_script.py\n    \ntool/xxx_views.py\n    class yyyBase(ContextMixin):\n    class XxxAdd(yyyBase, CreateView):\n    class XxxDelete(yyyBase, DeleteView):\n    class XxxDetail(yyyBase, DetailView):\n    class XxxEdit(yyyBase, UpdateView):\n    class XxxList(yyyBase, ListView):\nunc/__init__.py\n    \nunc/admin.py\n    \nunc/apps.py\n    class UncConfig(AppConfig):\nunc/models.py\n    class Course(models.Model):\n    class Student(models.Model):\n    class Review(models.Model):\nunc/review.py\n    \nunc/sensei.py\n    \nunc/student.py\n    \nunc/tests.py\n    \n	bin/__init__.py\n    \nbin/app.py\n    \nbin/aspire.py\n    \nbin/book.py\n    \nbin/booknotes.py\n    \nbin/data.py\n    \nbin/datatype.py\n    \nbin/days.py\n    \nbin/diagrams.py\n    \nbin/doc.py\n    \nbin/faceblog.py\n    \nbin/files.py\n    \nbin/grades.py\n    \nbin/guide.py\n    \nbin/hourly.py\n    \nbin/hours.py\n    \nbin/i.py\n    \nbin/life.py\n    \nbin/log.py\n    \nbin/music.py\n    \nbin/n.py\n    \nbin/ntsh.py\n    \nbin/ops.py\n    \nbin/page_tests.py\n    # class PagesTest(TestCase):\n    class RemoteTest(TestCase):\n    # class RemoteTest(TestCase):\nbin/pandoc.py\n    \nbin/remote_tests.py\n    # class RemoteTest(FunctionalTestCase):\n    # class PythonTest(FunctionalTestCase):\nbin/resize.py\n    \nbin/score.py\n    \nbin/seamanslog.py\n    \nbin/shell.py\n    \nbin/spiritual.py\n    \nbin/src.py\n    \nbin/switches.py\n    \nbin/text.py\n        pattern = r'class (.*)\\(.*\\)'\nbin/todo.py\n    \nbin/tool.py\n    \nbin/user.py\n    \nbin/vc.py\n    \nbin/web.py\n    \nbin/wordpress.py\n    \nbin/x.py\n    \nhammer/__init__.py\n    \nhammer/secret_settings.py\n    \nhammer/settings.py\n    \nhammer/urls.py\n    \nhammer/wsgi.py\n    \nhealth/__init__.py\n    \nhealth/admin.py\n    \nhealth/apps.py\n    class HealthConfig(AppConfig):\nhealth/health.py\n    \nhealth/models.py\n    class HealthScore(models.Model):\nhealth/tests.py\n    \nhealth/urls.py\n    \nhealth/views.py\n    class HealthView(TemplateView):\n    class HealthList(ListView):\n    class HealthEdit(UpdateView):\nlife/__init__.py\n    \nlife/admin.py\n    \nlife/apps.py\n    class LifeConfig(AppConfig):\nlife/life.py\n    \nlife/models.py\n    class Year(models.Model):\n    class Aspect(models.Model):\n    class Experience(models.Model):\nlife/tests.py\n    \nlife/urls.py\n    \nlife/views.py\n    class LifeView(TemplateView):\n    class ExperienceView(ListView):\n    class YearView(ListView):\n    class LifeAdd(LoginRequiredMixin, RedirectView):\n    class LifeEdit(UpdateView):\nmybook/__init__.py\n    \nmybook/admin.py\n    \nmybook/apps.py\n    class MybookConfig(AppConfig):\nmybook/models.py\n    class Author(models.Model):\n    class Book(models.Model):\nmybook/mybook.py\n    \nmybook/mybook_views.py\n    class MyBookDocDisplay(TemplateView):\n    class MyBookPrivateDoc(LoginRequiredMixin, MyBookDocDisplay):\n    class BookNotes(MyBookDocDisplay):\n    class CardView(MyBookDocDisplay):\n    class OutlineView(MyBookDocDisplay):\n    class DailyTask(RedirectView):\n    # class SeamansLog(MyBookDocDisplay):\n    class SeamansLog(RedirectView):\n    class SpiritualSelect(RedirectView):\n    class TabsView(MyBookDocDisplay):\n    class UncDocDisplay(TemplateView):\nmybook/outline.py\n    \nmybook/task.py\n    \nmybook/tests.py\n    \nmybook/urls.py\n    \nsuperuser/__init__.py\n    \nsuperuser/admin.py\n    \nsuperuser/admin_views.py\n    class AdminView(UserPassesTestMixin, TemplateView):\n    class DatabaseView(UserPassesTestMixin, TemplateView):\n    class DocView(UserPassesTestMixin, TemplateView):\n    class LogView(UserPassesTestMixin, TemplateView):\n    class MaterialView(TemplateView):\n    class SurrogateView(UserPassesTestMixin, TemplateView):\n    class TestView(UserPassesTestMixin, ListView):\n    class UsersView(UserPassesTestMixin, ListView):\nsuperuser/apps.py\n    class AdminConfig(AppConfig):\nsuperuser/initialize.py\n    \nsuperuser/models.py\n    class Administrator(models.Model):\nsuperuser/tests.py\n    \nsuperuser/urls.py\n    \ntasks/__init__.py\n    \ntasks/models.py\n    class Task (models.Model):\ntasks/summary.py\n    \ntasks/task.py\n    \ntasks/urls.py\n    \ntasks/views.py\n    class TaskBase(LoginRequiredMixin, ContextMixin):\n    class TaskDelete(DeleteView):\n    class TaskDetail(DetailView):\n    class TaskCreate(CreateView):\n    class TaskUpdate(TaskBase, UpdateView):\n    class TaskHome(TaskBase, TemplateView):\n    class TaskList(TaskBase, ListView):\n    class MyTime(TaskBase, TemplateView):\n    class TimeSummary(TaskBase, TemplateView):\n    class MissingDays(TaskBase, TemplateView):\n    class TaskImport(RedirectView):\n    class TaskExport(TaskBase, TemplateView):\ntest/__init__.py\n    \ntest/app_test.py\n    \ntest/archive_test.py\n    \ntest/aspire_test.py\n    \ntest/booknotes_test.py\n    \ntest/css_test.py\n    \ntest/data_test.py\n    \ntest/doc_test.py\n    \ntest/health_test.py\n    \ntest/hourly_test.py\n    \ntest/i_test.py\n    \ntest/log_test.py\n    \ntest/ops_test.py\n    \ntest/page_test.py\n    \ntest/robot_test.py\n    \ntest/seamanslog_test.py\n    \ntest/system_test.py\n    \ntest/text_test.py\n    \ntest/tst_test.py\n    \ntest/unc_test.py\n    \ntest/user_test.py\n    \ntest/vc_test.py\n    \ntest/wordpress_test.py\n    \ntool/__init__.py\n    \ntool/document.py\n    \ntool/domain.py\n    \ntool/email.py\n    \ntool/log.py\n    \ntool/management/__init__.py\n    \ntool/management/commands/__init__.py\n    \ntool/management/commands/scriptor.py\n    class Command(BaseCommand):\ntool/models.py\n    class Test(models.Model):\n    class Page(models.Model):\n    class Project(models.Model):\ntool/notify.py\n    \ntool/page.py\n    \ntool/project.py\n    class ProjectList(ListView):\n    class ProjectDetail(DetailView):\n    class ProjectCreate(CreateView):\n    class ProjectUpdate(UpdateView):\n    class ProjectDelete(DeleteView):\ntool/robot.py\n    \ntool/tst.py\n    \ntool/urls.py\n    \ntool/user.py\n    \ntool/user_views.py\n    class UserList(ListView):\n    class UserCreate(CreateView):\n    class UserDetail(DetailView):\n    class UserEdit(UpdateView):\n    class UserDelete(DeleteView):\ntool/xxx.py\n    # class Xxx(models.Model):\ntool/xxx_script.py\n    \ntool/xxx_views.py\n    class yyyBase(ContextMixin):\n    class XxxAdd(yyyBase, CreateView):\n    class XxxDelete(yyyBase, DeleteView):\n    class XxxDetail(yyyBase, DetailView):\n    class XxxEdit(yyyBase, UpdateView):\n    class XxxList(yyyBase, ListView):\nunc/__init__.py\n    \nunc/admin.py\n    \nunc/apps.py\n    class UncConfig(AppConfig):\nunc/models.py\n    class Course(models.Model):\n    class Student(models.Model):\n    class Review(models.Model):\n    class ReviewScore(models.Model):\n    class ReviewerScore(models.Model):\nunc/review.py\n    \nunc/sensei.py\n    \nunc/student.py\n    \nunc/tests.py\n    \n
41	system-ip	shell(ifconfig) --> 23 lines (should be between 51 and 69)	shell(ifconfig) --> 23 lines (should be between 51 and 69)
143	mybook-menu-leverage	('/software/Leverage/Index', 'zmdi-home', 'Home', 'class=active')\n('/software/Leverage/Part1', 'zmdi-storage', 'Leverage', None)\n('/software/Leverage/Part2', 'zmdi-accounts-alt', 'Development', None)\n('/software/Leverage/Part3', 'zmdi-assignment-account', 'Operations', None)\n('/software/Leverage/Part4', 'zmdi-comment-text-alt', 'People', None)	('/software/Leverage/Index', 'zmdi-home', 'Home', 'class=active')\n('/software/Leverage/Part1', 'zmdi-storage', 'Leverage', None)\n('/software/Leverage/Part2', 'zmdi-accounts-alt', 'Development', None)\n('/software/Leverage/Part3', 'zmdi-assignment-account', 'Operations', None)\n('/software/Leverage/Part4', 'zmdi-comment-text-alt', 'People', None)
147	mybook-menu-spiritual	('/spiritual/Home', 'zmdi-home', 'Home', 'class=active')\n('/spiritual/inspire', 'zmdi-cloud-outline', 'Inspire', None)\n('/spiritual/prayers', 'zmdi-comment-outline', 'Pray', None)\n('/spiritual/bible', 'zmdi-local-library', 'Meditate', None)\n('/spiritual/reflect', 'zmdi-key', 'Reflect', None)\n('/spiritual/teaching', 'zmdi-face', 'Learn', None)	('/spiritual/Home', 'zmdi-home', 'Home', 'class=active')\n('/spiritual/inspire', 'zmdi-cloud-outline', 'Inspire', None)\n('/spiritual/prayers', 'zmdi-comment-outline', 'Pray', None)\n('/spiritual/bible', 'zmdi-local-library', 'Meditate', None)\n('/spiritual/reflect', 'zmdi-key', 'Reflect', None)\n('/spiritual/teaching', 'zmdi-face', 'Learn', None)
175	text-signatures	 text_command(options)\n text_help(args=None)\n find_agents(text)\n find_anchors(text)\n find_classes(text)\n find_functions(text)\n find_links(text)\n     link(anchor)\n find_quotes(text)\n find_signatures(text)\n    pattern = r'(.*\\(.*\\))'\n find_urls(text)\n markdown_list_links(host, lines)\n markdown_list_string(mylist)\n text_join(text)\n text_lines(text)\n text_match(match_pattern, doc)\n text_no_match(match_pattern, doc)\n text_outline(text)\n text_outline_string(outline, depth=0)\n text_markdown(outline, depth=1)\n     text_body(lines)\n text_replace(doc, match_pattern, replace_pattern)\n text_title(text)\n text_body(text)\n match_lines(text, pattern)\n match_pattern(text, pattern)\n transform_matches(text, match_pattern, select_pattern)	 text_command(options)\n text_help(args=None)\n find_agents(text)\n find_anchors(text)\n find_classes(text)\n find_functions(text)\n find_links(text)\n     link(anchor)\n find_quotes(text)\n find_signatures(text)\n    pattern = r'(.*\\(.*\\))'\n find_urls(text)\n markdown_list_links(host, lines)\n markdown_list_string(mylist)\n text_join(text)\n text_lines(text)\n text_match(match_pattern, doc)\n text_no_match(match_pattern, doc)\n text_outline(text)\n text_outline_string(outline, depth=0)\n text_markdown(outline, depth=1)\n     text_body(lines)\n text_replace(doc, match_pattern, replace_pattern)\n text_title(text)\n text_body(text)\n match_lines(text, pattern)\n match_pattern(text, pattern)\n transform_matches(text, match_pattern, select_pattern)
82	task-month	   Total      420\nChurch        110\nFun            82\nPeople         58\nHire           47\nGrow           41\nWrite          33\nBusiness       18\nTools          17\nWAM             8\nSign            6\n	   Total      420\nChurch        110\nFun            82\nPeople         58\nHire           47\nGrow           41\nWrite          33\nBusiness       18\nTools          17\nWAM             8\nSign            6\n
28	table-to-text	    a          b          c         \n    1          2          3         \n    4          5          6         \n    7          8          9         	    a          b          c         \n    1          2          3         \n    4          5          6         \n    7          8          9         
15	app-score	\nCode Summary            Files     Lines\n\n    App                   218     16287\n	\nCode Summary            Files     Lines\n\n    App                   218     16287\n
12	app-functions	no output	no output
13	app-html-files	no output	no output
16	app-settings	"""\nDjango settings for Hammer project.\n\n"""\n\nfrom platform import node\nfrom os.path import dirname, join\n\n\nBASE_DIR = dirname(dirname(__file__))\nDOC_ROOT = join(BASE_DIR, 'Documents')\nLOG_DIR = join(BASE_DIR, 'log')\n\n\n# SECURITY WARNING: don't run with debug turned on in production!\nif 'MyBook' == node():\n    DEBUG = False\nelse:\n    DEBUG = True\n    ALLOWED_HOSTS = ['*']\n\n\n# Application definition\nINSTALLED_APPS = [\n    # Django System\n    'django.contrib.admin',\n    'django.contrib.auth',\n    'django.contrib.contenttypes',\n    'django.contrib.humanize',\n    'django.contrib.sessions',\n    'django.contrib.messages',\n    'django.contrib.staticfiles',\n\n    # MyBook\n    'health',\n    'life',\n    'mybook',\n    'superuser',\n    'tasks',\n    'tool',\n    'unc',\n]\n\nMIDDLEWARE_CLASSES = [\n    'django.contrib.sessions.middleware.SessionMiddleware',\n    'django.middleware.common.CommonMiddleware',\n    'django.middleware.csrf.CsrfViewMiddleware',\n    'django.contrib.auth.middleware.AuthenticationMiddleware',\n    'django.contrib.messages.middleware.MessageMiddleware',\n    'django.middleware.clickjacking.XFrameOptionsMiddleware',\n]\n\n# Loading templates\nTEMPLATES = [\n    {\n        'BACKEND': 'django.template.backends.django.DjangoTemplates',\n        'DIRS': [\n            join(BASE_DIR, "templates"),\n        ],\n        'APP_DIRS': True,\n        'OPTIONS': {\n            'context_processors': [\n                # Insert your TEMPLATE_CONTEXT_PROCESSORS here or use this\n                # list if you haven't customized them:\n                'django.contrib.auth.context_processors.auth',\n                'django.template.context_processors.debug',\n                'django.template.context_processors.i18n',\n                'django.template.context_processors.media',\n                'django.template.context_processors.static',\n                'django.template.context_processors.tz',\n                'django.contrib.messages.context_processors.messages',\n            ],\n        },\n    },\n]\n\nROOT_URLCONF = 'hammer.urls'\nLOGIN_URL='/login/'\nLOGIN_REDIRECT_URL = '/'\n\nWSGI_APPLICATION = 'hammer.wsgi.application'\n\nEMAIL_FROM = "mark.seaman@shrinking-world.com"\n\n\n# Secrets\nfrom .secret_settings import DATABASES, SECRET_KEY, EMAIL_HOST, EMAIL_PORT, EMAIL_HOST_USER, EMAIL_HOST_PASSWORD, EMAIL_USE_TLS\n\n\nAUTH_PASSWORD_VALIDATORS = [\n    {\n        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',\n    },\n    {\n        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',\n    },\n    {\n        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',\n    },\n    {\n        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',\n    },\n]\n\n\nLANGUAGE_CODE = 'en-us'\nTIME_ZONE = 'US/Mountain'\nUSE_I18N = False\nUSE_L10N = False\nUSE_TZ = True\n\n\n# Static server\nSTATIC_URL = '/static/'\nSTATICFILES_DIRS = (BASE_DIR + '/static', BASE_DIR + '/docs',)\n\nLOGGING = {\n\n    'version': 1,\n    'disable_existing_loggers': False,\n    'handlers': {\n         'hammer-file': {\n            'level': 'DEBUG',\n            'class': 'logging.FileHandler',\n            'filename': join(BASE_DIR, 'log', 'hammer.log'),\n        },\n        'console': {\n            'level': 'DEBUG',\n            'class': 'logging.StreamHandler',\n        },\n    },\n    'loggers': {\n         'tool': {\n            'handlers': ['hammer-file'],\n        },\n    },\n    'root': {'level': 'INFO'},\n}\n\n\n\nif 'MyBook' in node():\n\n    # Allow Django from all hosts. This snippet is installed from\n    # /var/lib/digitalocean/allow_hosts.py\n\n    import os\n    import netifaces\n\n    # Find out what the IP addresses are at run time\n    # This is necessary because otherwise Gunicorn will reject the connections\n    def ip_addresses():\n        ip_list = []\n        for interface in netifaces.interfaces():\n            addrs = netifaces.ifaddresses(interface)\n            for x in (netifaces.AF_INET, netifaces.AF_INET6):\n                if x in addrs:\n                    ip_list.append(addrs[x][0]['addr'])\n        return ip_list\n\n    # Discover our IP address\n    domains = [\n        'markseaman.info',\n        'markseaman.org',   \n        'seamanslog.com',\n        'seamansguide.com',\n        'shrinking-world.com',\n        'shrinking-world.org',\n        'spiritual-things.org',\n    ]\n    ALLOWED_HOSTS = domains + ip_addresses()\n\n\n	"""\nDjango settings for Hammer project.\n\n"""\n\nfrom platform import node\nfrom os.path import dirname, join\n\n\nBASE_DIR = dirname(dirname(__file__))\nDOC_ROOT = join(BASE_DIR, 'Documents')\nLOG_DIR = join(BASE_DIR, 'log')\n\n\n# SECURITY WARNING: don't run with debug turned on in production!\nif 'MyBook' == node():\n    DEBUG = False\nelse:\n    DEBUG = True\n    ALLOWED_HOSTS = ['*']\n\n\n# Application definition\nINSTALLED_APPS = [\n    # Django System\n    'django.contrib.admin',\n    'django.contrib.auth',\n    'django.contrib.contenttypes',\n    'django.contrib.humanize',\n    'django.contrib.sessions',\n    'django.contrib.messages',\n    'django.contrib.staticfiles',\n\n    # MyBook\n    'health',\n    'life',\n    'mybook',\n    'superuser',\n    'tasks',\n    'tool',\n    'unc',\n]\n\nMIDDLEWARE_CLASSES = [\n    'django.contrib.sessions.middleware.SessionMiddleware',\n    'django.middleware.common.CommonMiddleware',\n    'django.middleware.csrf.CsrfViewMiddleware',\n    'django.contrib.auth.middleware.AuthenticationMiddleware',\n    'django.contrib.messages.middleware.MessageMiddleware',\n    'django.middleware.clickjacking.XFrameOptionsMiddleware',\n]\n\n# Loading templates\nTEMPLATES = [\n    {\n        'BACKEND': 'django.template.backends.django.DjangoTemplates',\n        'DIRS': [\n            join(BASE_DIR, "templates"),\n        ],\n        'APP_DIRS': True,\n        'OPTIONS': {\n            'context_processors': [\n                # Insert your TEMPLATE_CONTEXT_PROCESSORS here or use this\n                # list if you haven't customized them:\n                'django.contrib.auth.context_processors.auth',\n                'django.template.context_processors.debug',\n                'django.template.context_processors.i18n',\n                'django.template.context_processors.media',\n                'django.template.context_processors.static',\n                'django.template.context_processors.tz',\n                'django.contrib.messages.context_processors.messages',\n            ],\n        },\n    },\n]\n\nROOT_URLCONF = 'hammer.urls'\nLOGIN_URL='/login/'\nLOGIN_REDIRECT_URL = '/'\n\nWSGI_APPLICATION = 'hammer.wsgi.application'\n\nEMAIL_FROM = "mark.seaman@shrinking-world.com"\n\n\n# Secrets\nfrom .secret_settings import DATABASES, SECRET_KEY, EMAIL_HOST, EMAIL_PORT, EMAIL_HOST_USER, EMAIL_HOST_PASSWORD, EMAIL_USE_TLS\n\n\nAUTH_PASSWORD_VALIDATORS = [\n    {\n        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',\n    },\n    {\n        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',\n    },\n    {\n        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',\n    },\n    {\n        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',\n    },\n]\n\n\nLANGUAGE_CODE = 'en-us'\nTIME_ZONE = 'US/Mountain'\nUSE_I18N = False\nUSE_L10N = False\nUSE_TZ = True\n\n\n# Static server\nSTATIC_URL = '/static/'\nSTATICFILES_DIRS = (BASE_DIR + '/static', BASE_DIR + '/docs',)\n\nLOGGING = {\n\n    'version': 1,\n    'disable_existing_loggers': False,\n    'handlers': {\n         'hammer-file': {\n            'level': 'DEBUG',\n            'class': 'logging.FileHandler',\n            'filename': join(BASE_DIR, 'log', 'hammer.log'),\n        },\n        'console': {\n            'level': 'DEBUG',\n            'class': 'logging.StreamHandler',\n        },\n    },\n    'loggers': {\n         'tool': {\n            'handlers': ['hammer-file'],\n        },\n    },\n    'root': {'level': 'INFO'},\n}\n\n\n\nif 'MyBook' in node():\n\n    # Allow Django from all hosts. This snippet is installed from\n    # /var/lib/digitalocean/allow_hosts.py\n\n    import os\n    import netifaces\n\n    # Find out what the IP addresses are at run time\n    # This is necessary because otherwise Gunicorn will reject the connections\n    def ip_addresses():\n        ip_list = []\n        for interface in netifaces.interfaces():\n            addrs = netifaces.ifaddresses(interface)\n            for x in (netifaces.AF_INET, netifaces.AF_INET6):\n                if x in addrs:\n                    ip_list.append(addrs[x][0]['addr'])\n        return ip_list\n\n    # Discover our IP address\n    domains = [\n        'markseaman.info',\n        'markseaman.org',   \n        'seamanslog.com',\n        'seamansguide.com',\n        'shrinking-world.com',\n        'shrinking-world.org',\n        'spiritual-things.org',\n    ]\n    ALLOWED_HOSTS = domains + ip_addresses()\n\n\n
24	church-show	no output	no output
17	app-show	no output	no output
18	app-signature	bin/__init__.py\n    \nbin/app.py\n     app_command(options)\n     app_help()\n     app_functions(args)\n     app_classes(args)\n     app_signature(args)\n     app_search_code(files, search_function)\n         print_indented(outline)\n             app_print(filename, children)\n     app_directories()\n     app_path(topic=None)\n     app_score()\n     app_search(args)\n     app_show(args=None)\n     app_source(args=None)\n     app_summary(args=None)\n     kill_server()\n     app_urls()\n         simplify(url)\n     run_server()\nbin/aspire.py\n     aspire_command(options)\n     aspire_help(args=None)\n     aspire_clone(args)\n     aspire_doc_path(doc=None)\n     aspire_docs()\n         count_docs(project)\n     aspire_edit(doc)\n    #  aspire_guide()\n    #     #  article_text(path)\n     text_tail(text)\n    #  aspire_history(args)\n     aspire_hours(args=None)\n     aspire_list(args=None)\n     aspire_local(args)\n     aspire_priority()\n     aspire_progress()\n         text_string(title, body)\n     aspire_projects(args=None)\n     aspire_report(args)\n         report_data(date, path)\n         report_text(data)\n         report_save()\n     aspire_reports()\n     aspire_score(args=None)\n    #  aspire_send()\n    #      article_text(path)\n     aspire_show(args)\n     aspire_todo(args)\n     aspire_web(server, page=None)\n    #  aspire_week()\n    #      project_week_string(project, hours, total)\n    #      weekly_summary()\n    #      weekly_totals()\n    #          summarize(label, times, activities, total)\n    #          gather_data(shell_cmd)\n    #  aspire_week_print()\nbin/book.py\n     book_command(argv)\n     book_build()\n         image_list()\n         book_html()\n         book_epub()\n         book_pdf()\n         book_mobi()\n         book_assemble()\n         book_copy()\n     book_changes()\n     book_commit(argv)\n     book_edit(argv)\n     book_find(words)\n     book_headings(topic=None)\n         find_headings(text, pattern='##')\n         print_headings(topic)\n     book_headlines()\n     book_index()\n         print_index_entry(category, path, title)\n     book_help()\n     nested_list(name, children)\n     book_list()\n     book_outline(topic)\n     book_plan()\n     book_read()\n     book_read_index(part=None)\n     book_status()\n     book_text(chapter=None)\n     chapter_words(chapter)\n     book_calculate_words(label,files)\n     book_word_count(part)\n     book_words()\n     web(page)\nbin/booknotes.py\n     booknotes_command(options)\n     booknotes_help(args=None)\n     booknotes_content(args)\n     booknotes_doc_path(doc=None)\n     booknotes_edit(args)\n     booknotes_excerpt(args)\n         booknotes()\n         excerpt(note)\n     booknotes_list(args)\nbin/data.py\n     data_command(options)\n     data_backup(host)\n     data_count(host)\n     data_help()\n     data_load(host)\n     data_migrate()\n     data_reset()\n     data_save(host)\n         save(server, app=None)\n     data_server()\n     data_sql(host)\n     data_tables()\n     data_prune_tables()\nbin/datatype.py\n     name_replacement(text, directory, datatype)\n     source_code(prototype)\n     convert_code(prototype, code, directory, datatype)\n     datatype_add(args)\n     datatype_command(options)\n     datatype_path(directory, doc=None)\n     datatype_edit(doc)\n     datatype_help(args=None)\nbin/days.py\n     days_command(options)\n     days_help(args=None)\n     date_str(t)\n     day_str(t)\n     days_ago(date,days)\n     days_list(args)\n     days_month(args)\n     days_weeks(num_weeks)\n         days_ahead(date, days)\n         enumerate_weeks(today, days)\n         weekly_schedule(filename, days)\n     enumerate_days(today, days)\n     to_date(s)\n     to_day(s)\n     today()\nbin/diagrams.py\n    \nbin/doc.py\n     doc_command(options)\n     doc_help()\n     doc_content(args)\n     doc_count(dir)\n     doc_directories()\n     doc_edit(args)\n     doc_fix()\n     doc_length(args=None)\n     doc_list(args=None)\n     doc_path(doc=None)\n     doc_pick(args)\n     doc_random_select(directory)\n     doc_redirect(page)\n     doc_score(args)\n     doc_search(args)\n     doc_send(args)\n     doc_send_text(args)\n     doc_show(args=None)\n     doc_show_directory(dir=None)\n     doc_stats(args)\n     doc_summary(args=None)\n     fix_chars(text)\n     doc_test(args)\n     doc_word_count(directory)\n     doc_words(args=None)\n     list_documents(dir=None)\nbin/faceblog.py\n     faceblog_command(options)\n     faceblog_doc_path(doc=None)\n     faceblog_edit(doc=None)\n     faceblog_help(args=None)\n     faceblog_list(args)\n     faceblog_send(doc)\n     faceblog_show(args)\nbin/files.py\n     accumulate_new_lines(accumulator, f2)\n     count_files(directory)\n     create_directory(path)\n     delete_file(filename)\n     do_command(cmd, input=None)\n     encode_text(text, encoding='utf-8')\n     fix_chars(text)\n     grep(pattern,file)\n     is_writable(path)\n     list_files(directory)\n     list_dirs(directory)\n     path_name (relative_filename)\n     print_list(lst)\n     print_list2(lst)\n     read_input()\n     read_json(filename)\n     read_file(filename)\n     read_text(f)\n     recursive_list(d)\n     time_sort_file(d)\n     write_text(filename, text, append=None)\n     write_file(filename, lines, append=None)\nbin/grades.py\n     student_emails()\n    #  student_info(email)\n    #  list_student_info()\nbin/guide.py\n     guide_command(options)\n     guide_help(args=None)\n     guide_add(args)\n     guide_doc_path(course=None, doc=None)\n     guide_create_lesson(course, lesson)\n     lesson_text(outline)\n     guide_edit(course, lesson)\n     guide_list(args)\n     guide_outline(course, lesson)\n         build_outline(text)\n     read_lesson(course, lesson)\n     lesson_parts(course,lesson)\n     read_lines(course, f)\nbin/hourly.py\n     hourly_command(options)\n     hourly_help(args=None)\n     hourly_doc_path(doc=None)\n     hourly_edit()\n     hourly_list()\n     hourly_run()\n         execute(cmd)\n     hourly_show()\nbin/hours.py\n    #  hours_command(options)\n    #  hours_help(args=None)\n    #  activities_work()\n    #  activities_work_client()\n    #  activities_work_nonpaid()\n    #  activities_play()\n    #  activities_public()\n    #  activities_private()\n    #  activities()\n    #  hours_activity(args)\n    #  hours_add(args)\n    #      enumerate_days(today, days)\n    #      to_date(s)\n    #      date_str(t)\n    #      day_str(t)\n    #      days_ago(date,days)\n    #      month_of_days(start)\n    #  hours_days(args)\n    #  hours_doc_path(args)\n    #  hours_edit(args)\n    #  hours_list(args)\n    #  hours_tasks(args)\n    #  append_tasks(events, lines)\n    #      task_text(lines, start, end)\n    #  hours_show(args)\n    #  hours_summary(args)\n    #  hours_work(args)\n    #  is_day(line)\n    #  is_activity(line)\n    #  is_task(line)\n    #  list_events(args)\n    #  list_tasks(text)\n    #  months()\n    #  print_activities(label, times)\n    #  print_days(times, num_days)\n    #  print_score(times)\n    #      show_score(label, activities, ideal_hours)\n    #  print_table(labels, table)\n    #  print_tasks(results, activity=None)\n    #  print_total_hours(results, activity=None)\n    #      select_activity(record, activity)\n    #  print_total(label, times, activities=None, grand_total=None)\n    #  print_totals(label, times, activities=None, grand_total=None)\n    #  print_work(times, num_days)\n    #  total_activity(filename, times={})\n    #  total_columns(table)\n    #  activity_list(filename)\n    #  total_work_days(filename)\n    #  total_days(filename)\n    #  total_time(times, activities=None)\nbin/i.py\n     i_command(options)\n     i_help(args=None)\n     doc_path()\n     i_add(args)\n     i_edit(args)\n     i_list(args)\nbin/life.py\n     life_command(options)\n     life_doc_path(doc=None)\n     life_edit(doc)\n     life_help(args=None)\n     life_list(args)\n     life_publish(args)\n     life_show(args)\n     life_todo(args)\n     life_web(args)\n     life_words(args)\nbin/log.py\n     log_path()\n     log_command(options)\n     log(label,value=None)\n     log_exception()\n     log_clear()\n     log_read()\nbin/music.py\n     music_command(options)\n     music_help(args=None)\n     list_albums(args)\n     list_collections(args)\n     list_du(args)\n     list_tracks(args)\n     music_copy()\n     music_doc_path(doc=None)\n     music_edit(doc)\n     music_collection(name)\n     music_load(args)\n     music_list(args)\n     music_show(args)\n     music_sync(args)\nbin/n.py\n    \nbin/ntsh.py\n     ntsh_command(argv)\n     commit()\n     clean()\n     convert(f1,f2)\n     convert_png(f1,f2)\n     help()\n     hide()\n     list_files(dirs)\n     new_name(name)\n     name(args)\n     notes()\n     reorder(name)\n     status()\n     view()\n     web(page='%s/notes/fav_list' % archive)\n     zip_open()\n     zip_close()\nbin/ops.py\n     ops_command(options)\n     ops_help(cmd=None, args=None)\n     ops_cmd(args)\n     ops_console()\n     ops_deploy()\n     ops_log()\n     ops_restart()\n     ops_root(server=host, cmd='')\n     ops_update(args)\n     remote_command(server, cmd, user='django')\nbin/page_tests.py\n     run_server()\n     webpage_text(browser,url)\n    #      setUp(self)\n    #      tearDown(self)\n    #      assertBetween(self, num, min, max)\n    #      assertLineCount(self, text, min=1, max=10)\n    #      test_pages(self)\n         setUp(self)\n         tearDown(self)\n         test_pages(self)\n        #  test_visit_google(self)\nbin/pandoc.py\n     file_to_html(path, image_path=None)\n         fix_images(text)\n     markdown_to_html(markdown_path, html_path)\n     read_markdown(path)\n     text_to_html(text)\n     title(p1)\n     write_html_file(path, html)\nbin/remote_tests.py\n    #      test_remote_server(self)\n    #      test_host(self)\n    #     #  test_version_control(self)\n    #     #  test_python_version(self)\n    #      test_virtual_env(self)\n    #      test_pip_list(self)\nbin/resize.py\n     save_image_file(filename, image, width, height, imtype)\n     resize_jpeg(filename)\n     resize_png(filename)\n    #  create_thumbnails(infile, photo)\n    #  resize_test()\nbin/score.py\n    #  score_command(options)\n    #  score_doc_path(doc=None)\n    #  score_edit()\n    #  score_help(args=None)\n    #  score_show()\n    #  score_update()\n    #  score_web()\nbin/seamanslog.py\n     seamanslog_command(options)\n     seamanslog_help(args=None)\n     seamanslog_article(args)\n         article_text(path)\n     seamanslog_doc_path(doc=None)\n     seamanslog_edit(doc)\n     seamanslog_list(args)\n     seamanslog_pick()\n     seamanslog_show(args)\n     seamanslog_summary()\n     seamanslog_view(args)\n     seamanslog_web(args)\n     seamanslog_words(args)\nbin/shell.py\n     banner(name)\n     check_dirs(path, min=0, max=0)\n     check_dir_list(path, dir_list)\n     check_files(path, min=0, max=0)\n     check_file_list(path, dir_list)\n     check_lines(label, lines, min=0, max=10)\n     check_shell_lines(cmd, min=0, max=10)\n     differences(answer, correct)\n     dir_list(path)\n     dir_tree_list(path)\n     file_tree_list(path, filetype=None)\n     file_list(path, filetype=None)\n     file_path(d='', f='')\n     filter_types(files, filetype=None)\n     hostname()\n     line_match(word, text)\n     line_exclude(word, text)\n     line_count(path)\n     limit_lines(shell_command, min=None, max=None)\n     read_file(path)\n     shell(cmd)\n         command_line(cmd)\n     word_count(text)\n     write_file(path, text)\nbin/spiritual.py\n     spiritual_command(args)\n     spiritual_help()\n     spiritual_article(args)\n         article_text(path)\n     spiritual_doc_path(doc)\n     spiritual_edit(args)\n     spiritual_list()\n     spiritual_list_files(dir=None)\n     spiritual_pick(args)\n     spiritual_send(args)\n     spiritual_search(args)\n     spiritual_show(args)\n     spiritual_summary()\n     spiritual_test()\n     spiritual_web()\nbin/src.py\n     src_command(options)\n     src_help()\n     differences(f1,f2)\n     list_source_files(d)\n     show_differences(f1,f2)\n     src_base()\n     src_changed()\n     src_common()\n     src_diff(args)\n     src_dir()\n     src_edit(args)\n     src_list()\n     src_missing()\n     src_pull(args)\n     src_push(args)\n     src_same()\n     src_unique()\n     src_update()\nbin/switches.py\n     server_type()\n     server_host(server)\nbin/text.py\n     text_command(options)\n     text_help(args=None)\n     find_agents(text)\n     find_anchors(text)\n     find_classes(text)\n     find_functions(text)\n     find_links(text)\n         link(anchor)\n     find_quotes(text)\n     find_signatures(text)\n        pattern = r'(.*\\(.*\\))'\n     find_urls(text)\n     markdown_list_links(host, lines)\n     markdown_list_string(mylist)\n     text_join(text)\n     text_lines(text)\n     text_match(match_pattern, doc)\n     text_no_match(match_pattern, doc)\n     text_outline(text)\n     text_outline_string(outline, depth=0)\n     text_markdown(outline, depth=1)\n         text_body(lines)\n     text_replace(doc, match_pattern, replace_pattern)\n     text_title(text)\n     text_body(text)\n     match_lines(text, pattern)\n     match_pattern(text, pattern)\n     transform_matches(text, match_pattern, select_pattern)\nbin/todo.py\n     todo_command(options)\n     recent_dates(days=3)\n     edit_task_file(date)\nbin/tool.py\n     tool_command(options)\n     tool_edit(args)\n     tool_help(self)\n     tool_list()\n     tool_length()\n     tool_read(args)\nbin/user.py\n    \nbin/vc.py\n     vc_command(options)\n     vc_help(args=None)\n     git_cmd(cmd)\n     git_filter()\n     vc_commit(args)\n     vc_diff(args)\n     vc_dirs()\n     vc_log(args)\n     vc_pull(args)\n     vc_push(args)\n     vc_status(args)\nbin/web.py\n     web_command(args)\n     web_help()\n     web(page)\n     web_path(topic=None)\nbin/wordpress.py\n     wordpress_command(options)\n     wordpress_help(args=None)\n     wordpress_doc_path(doc=None)\n     wordpress_edit(doc)\n     wordpress_list(args)\n     wordpress_host(args)\n     wordpress_ssh(args)\nbin/x.py\n     execute_command(cmd,args)\n     command_help(cmd,args)\n     command_scriptor(cmd, args)\nhammer/__init__.py\n    \nhammer/secret_settings.py\n    #  database_init()\nhammer/settings.py\n         ip_addresses()\nhammer/urls.py\n    \nhammer/wsgi.py\n    \nhealth/__init__.py\n    \nhealth/admin.py\n    \nhealth/apps.py\n    \nhealth/health.py\n     health_command(options)\n     health_doc_path(doc=None)\n     health_edit(args)\n     health_help(args=None)\n     health_list(args)\n     health_score()\n        #  total(row)\n        #  print_bar(lag,lead,average)\n        #  print_score(row, score)\n     average (num_list)\n     health_import(args)\n     health_web()\nhealth/models.py\n         __unicode__(self)\n         get_absolute_url(self)\n         as_row(self)\n         labels()\nhealth/tests.py\n    \nhealth/urls.py\n    \nhealth/views.py\n    #  health_menu(page)\n     health_settings(page='home')\n         get_context_data(self, **kwargs)\n         get_queryset(self)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n     health_scores(objects)\n         average(num_list)\n         five_star(rating)\n         scores(row)\nlife/__init__.py\n    \nlife/admin.py\n    \nlife/apps.py\n    \nlife/life.py\n     query_labels()\n     query_get(pk)\n     query_year(age)\n     query_experiences(age=None)\n     experiences_lookup_table(age=None)\nlife/models.py\n         __unicode__(self)\n         __unicode__(self)\n         __unicode__(self)\n         get_absolute_url(self)\n     initialize()\nlife/tests.py\n    \nlife/urls.py\n    \nlife/views.py\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_redirect_url(self, *args, **kwargs)\n         get_context_data(self, **kwargs)\nmybook/__init__.py\n    \nmybook/admin.py\n    \nmybook/apps.py\n    \nmybook/models.py\n         __unicode__(self)\n         get_absolute_url(self)\n         as_row(self)\n         labels()\n         values(self)\n         name(self)\n         fields(self)\n         __unicode__(self)\n         get_absolute_url(self)\n         as_row(self)\n         labels()\n         values(self)\n         fields(self)\nmybook/mybook.py\n     mybook_path(page)\n    #  mybook_random_select(directory)\n    #  mybook_redirect(host, page, user)\n    #  mybook_site(title)\n     mybook_site_title(title)\n         site_title_text(page)\n     mybook_content(author, title)\n     main_menu(menu, page=None)\n         menu_active(page, menu_item)\n         menu_entry(page, x)\n         menu_read(menu, page)\n         menu_text(page)\n     booknotes_excerpt(doc)\n         booknotes_doc_path(doc=None)\n         booknotes(doc)\n         excerpt(note)\nmybook/mybook_views.py\n     domain_menu(domain, page)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_redirect_url(self, *args, **kwargs)\n    #      get_context_data(self, **kwargs)\n         get_redirect_url(self, *args, **kwargs)\n         get_redirect_url(self, *args, **kwargs)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\nmybook/outline.py\n     has_kids(text, depth)\n     outline(text)\n     parse_outline(text, tree, depth)\n     print_node(name, depth=1, char='    ')\n     seperator(depth)\n     split_text(text, sep)\n     title(text, depth)\n     read_cards(doc)\n     tabs_data(doc)\n         tab_choice(i,tab)\nmybook/task.py\n     tasks_monthly(year, month)\n     recent_months()\n     months_data_table()\n     tasks_data_table(days)\n     days_data_table(days)\n    #  task_list(task)\n    #  task_list(date)\nmybook/tests.py\n    \nmybook/urls.py\n    \nsuperuser/__init__.py\n    \nsuperuser/admin.py\n     admin_print_list()\n     admin_list()\n     admin_table()\n     admin_detail(a)\n     admin_get(pk)\n     database_info()\n     get_detail_data()\n     is_superuser(user)\n     log_text()\n     requesting_user(user)\n     test_list()\n     test_labels()\n     test_results()\n     test_table()\n     test_text(t)\n     text_head(text, lines=3)\n     text_lines(lines, columns=30)\n     user_detail(user)\n     user_labels()\n     user_table(users)\nsuperuser/admin_views.py\n         get_context_data(self, **kwargs)\n         test_func(self)\n         get_context_data(self, **kwargs)\n         test_func(self)\n         get_context_data(self, **kwargs)\n         test_func(self)\n         get_context_data(self, **kwargs)\n         test_func(self)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         test_func(self)\n         get_queryset(self)\n         get_context_data(self, **kwargs)\n         test_func(self)\n         get_context_data(self, **kwargs)\n         test_func(self)\nsuperuser/apps.py\n    \nsuperuser/initialize.py\n    \nsuperuser/models.py\n         __unicode__(self)\n         as_row(self)\n         labels()\n         values(self)\nsuperuser/tests.py\n    \nsuperuser/urls.py\n    \ntasks/__init__.py\n    \ntasks/models.py\n         __unicode__(self)\n        #  get_absolute_url(self)\n         as_row(self)\n         labels()\ntasks/summary.py\n     activity_summary(activity)\n         active_tab(a, t)\n     activities_work()\n     sort_activity(data)\n     bad_days()\n     bad_days_data(days)\n     combine_work_tasks(table, total)\n     tasks_activity(activity)\n     task_activity_details(activity)\n     task_detail(task)\n     query_hours(task, days)\n     task_filter(tasks, activity)\n     time_data()\n     time_totals(totals)\n         time_total(totals, time)\n     percent(actual, total)\n     percent_totals(totals, subtotals)\n     review_totals(totals, subtotals)\n         percent_difference(actual, total, ideal)\n         task_percents(totals, task, index, ideals)\n     time_filter(tasks, days)\n     task_text_list(tasks)\n         format(t)\n     task_list(days=8)\n     time_summary(days)\n     work_types()\n     write_task_files(tlist)\n     task_import_files()\n         task_details(f)\n         read_task_file(f)\n         new_task(date, name, hours, notes)\ntasks/task.py\n     task_command(self, args)\n     task_help(self)\n     days_ago(days)\n     hourly_total(tasks)\n     monthly_hours_invested(task_type, year, month)\n     last_month_hours_invested(task_type)\n     tasks_last_month()\n     task_data_table()\n     monthly_totals(year, month)\n     full_totals()\n     print_summary(summary, start=None, end=None)\n     recent_weeks()\n     recent_months()\n     sort_totals(categories)\n     task_add(self, args)\n     task_delete(self, args)\n     task_details(query, hours)\n         record(name, hours, total)\n     task_doc_path(args)\n     task_edit(self, args)\n     task_get(self, args)\n     task_import(args)\n     task_history(args)\n         print_task_history(tasks)\n     task_list(self, args)\n     task_month(args)\n    #  task_read_events(args)\n     task_read_health(args)\n     task_rename(args)\n     task_set_name(args, task)\n     task_select(task_type=None, date=None, days=None)\n     task_summary(args)\n     task_totals()\n     task_types()\n     task_print_types()\n     task_web()\n     task_week(args)\n     task_work()\n     tasks_monthly(year, month)\n     tasks_weekly(year, month, day)\n     total_hours_invested(task_type)\n     weekly_hours_invested(task_type, year, month, day)\n     weekly_totals(year, month, day)\n     task_report(year, month)\n         query_month_tasks(year, month)\n         task_entry(task)\n     save_monthly_reports(year)\n         save_report(report, month)\n     fix_tasks()\n     test_tasks()\ntasks/urls.py\n    \ntasks/views.py\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_queryset(self)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_redirect_url(self, *args, **kwargs)\n         get_context_data(self, **kwargs)\ntest/__init__.py\n    \ntest/app_test.py\n     app_classes_test()\n     app_functions_test()\n     app_list_test()\n     app_switches_test()\n     app_settings_test()\n     app_show_test()\n     app_signature_test()\n     app_url_test()\ntest/archive_test.py\n     archive_files_test()\n     archive_dirs_test()\n     archive_nts_test()\n     archive_repo_test()\n         list_archives()\ntest/aspire_test.py\n     aspire_list_test()\n     aspire_show_test()\n    #  aspire_score_test()\n     aspire_report_test()\n     aspire_week_test()\ntest/booknotes_test.py\n     booknotes_list_test()\n     booknotes_lines_test()\ntest/css_test.py\n     css_test()\ntest/data_test.py\n     data_files_test()\n     data_save_test()\n     data_tables_test()\n     data_migrate_test()\ntest/doc_test.py\n     doc_test()\n     doc_help_test()\n     doc_search_test()\n     doc_scan_test()\n     doc_file_test()\n     doc_file_missing_test()\n     doc_consolidate()\n     doc_render_test()\n     doc_encoding_test()\ntest/health_test.py\n     health_list_test()\n     health_score_test()\ntest/hourly_test.py\n     hourly_list_test()\n     hourly_show_test()\ntest/i_test.py\n     i_list_test()\ntest/log_test.py\n     log_length_test()\ntest/ops_test.py\n    #  ops_git_pull_test()\n     ops_help_test()\n     ops_server_test()\n     ops_server_type_test()\n     ops_status_test()\ntest/page_test.py\n     check_page(url, min=1, max=1)\n     page_list_test()\n     page_text_test()\n     page_diff_test()\n     page_sites_test()\ntest/robot_test.py\n     robot_list_test()\n     robot_results_test()\n    #  robot_show_test()\ntest/seamanslog_test.py\n     seamanslog_list_test()\n     seamanslog_show_test()\n     seamanslog_summary_test()\n     seamanslog_words_test()\ntest/system_test.py\n     system_cron_test()\n     system_disk_free_test ()\n     system_files_count_test()\n     system_host_test()\n     system_ip_test()\n     system_pandoc_test()\n     system_python_files_test()\n     system_python_version_test()\n     system_python_virtualenv_test()\ntest/text_test.py\n     text_help_test()\n     text_match_test()\n     text_no_match_test()\n     text_agents_test()\n     text_outline_test()\n     text_markdown_test()\n     text_format_test()\n     text_round_trip_test()\n     text_grep_test()\n     text_findall_test()\n     text_functions_test()\n     text_select_lines_test()\n     text_url_test()\n     text_links_test()\n    #  text_transforms_test()\n    #      transform(test_case)\n     text_signatures_test()\n     text_anchors_test()\n     text_div_test()\ntest/tst_test.py\n     tst_test()\n     tst_time_test()\n    #  remote_server_test()\ntest/unc_test.py\n     unc_files_test()\ntest/user_test.py\n    #  user_import_test()\n    #  user_export_test()\n     user_list_test()\ntest/vc_test.py\n     vc_status_test()\n     vc_pull_test()\ntest/wordpress_test.py\n     wordpress_list_test()\n     wordpress_host_test()\ntool/__init__.py\n    \ntool/document.py\n     doc_cards(page)\n     doc_content(page)\n     doc_dir_exists(title)\n     doc_exists(title)\n     doc_html_text(page, image_path=None)\n     doc_link(title)\n     doc_path(page)\n     domain_doc(domain, page)\ntool/domain.py\n     domain_title(domain)\n     domain_directory(domain)\ntool/email.py\n     email_command(options)\n     email_help()\n     email_args(args, use_html=True)\n     send_support_request(title, text)\n     send_file_email(args)\n     send_doc_email(args)\n     send_text_email(args)\n     send_html_email(args)\n     send_template_message(emailTo, title, template, data={})\ntool/log.py\n     log(text, value=None)\n     log_exception()\n     log_json(text, data)\n     log_file()\n     show_log()\n     log_notifications(title, recipients)\n     log_page(request, parms='')\ntool/management/__init__.py\n    \ntool/management/commands/__init__.py\n    \ntool/management/commands/scriptor.py\n         add_arguments(self, parser)\n         handle(self, *args, **options)\n         help(self)\ntool/models.py\n         __unicode__(self)\n         get_absolute_url(self)\ntool/notify.py\n     notify_test_results()\n     notify_test_email()\ntool/page.py\n     page_command(self, options)\n     page_help(self)\n     page_add(self, args)\n     page_delete(self, args)\n     page_diff(self, args)\n         show_diff(page)\n     page_expect(self, args)\n     page_html(self, args)\n         show_output(page)\n     page_like(self, args)\n         like_page(page)\n     page_list(self)\n     page_lookup(url)\n     page_reset(self)\n     page_results()\n     page_text(self, args)\n         show_output(page)            \ntool/project.py\n     project_add(self, args)\n     project_command(self, options)\n     project_delete(self, args)\n     project_get(self, args)\n     project_help(self)\n     project_list(self)\n     project_lookup(name)\ntool/robot.py\n     robot_command(options)\n     robot_help(args=None)\n     robot_doc_path(doc=None)\n     robot_fetch_page(url)\n     robot_get_page(browser, page)\n     robot_list()\n     robot_login(browser,page)\n     robot_results()\n     robot_run()\ntool/tst.py\n     tst_find()\n     get_module(modulename)\n     test_map(modulename)\n         test_entry(entry)\n         tests(module)\n     tst_command(self, args)\n     test_dictionary()\n         module_list(directory)\n         test_name(module)\n     tst_diff(test_name)\n     tst_edit(self, args)\n     tst_help(self)\n     tst_like(self,args)\n     tst_list(self,args)\n     tst_output(self,args)\n     tst_register(tests)\n     tst_quick_test()\n     tst_results()\n         show_differences(t)\n     tst_run(self,args)\n         run_test(self,test_entry)\n     tst_send(self,args)\ntool/urls.py\n    \ntool/user.py\n     user_command(self, options)\n     user_help()\n     user_add(name, email, password='test')\n     user_delete(args)\n     user_export(self, args)\n     user_get(pk)\n     user_import(self, args)\n     user_list()\n     user_reset(self)\n     add_super_user(name, email, password)\n     user_password(username, password)\n     user_lookup(name, email=None)\n     user_file_path(args)\n     user_fix_name(args)\n     show_users()\n     reset_passwords()\ntool/user_views.py\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\ntool/xxx.py\n    #      __unicode__(self)\n    #      get_absolute_url(self)\n    #      as_row(self)\n    #      labels()\n    #      values(self)\n    #     #  fields(self)\n     xxx_add(name)\n     xxx_delete(pk)\n     xxx_edit(pk, name)\n     xxx_lookup(pk)\n     xxx_get(client, name)\n     xxx_print(objects)\n     xxx_query(select=None)\n     xxx_table(select=None)\ntool/xxx_script.py\n     xxx_command(args)\n     xxx_help(args=None)\n     xxx_list(args=None)\ntool/xxx_views.py\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\nunc/__init__.py\n    \nunc/admin.py\n    \nunc/apps.py\n    \nunc/models.py\n         __unicode__(self)\nunc/review.py\n     allow_review(reviewer, designer, page)\n     calculate_points(student)\n     course_list()\n     create_review(reviewer, designer, page)\n     create_reviews(page, groups)\n     create_sample_courses()\n     requirements(course)\n     requirements_bacs200()\n     requirements_bacs350()\n     count_score(r)\n     review_groups()\n     review_pairs(groups)\n     reviewer_query(reviewer_id)\n     designer_query(designer_id)\n     designer_score(designer_id)\n     designer_scores(designer_id, assignments=None)\n     avg(s)\n     projects(course)\n     reviews_completed(student_id)\n     reviews_done(student_id)\n     reviews_feedback(student_id, page)\n     review_tabs(student_id)\n     reviews_to_do(student_id)\n     reviewer_score(reviewer_id)\n     assignment_page(course, page)\n     reviewer_scores(reviewer_id, assignments)\n     gather_review_scores(course, student=None)\n     student_review_data(student_id)\n     update_review_scores(course)\nunc/sensei.py\n     content_lessons(course)\n     guide_doc_path(doc=None)\n     guide_file(course, doc)\n     guide_schedule(lesson)\n     register_students()\n     add_student(course, name, email, domain)\n     query_students(course, student=None)\n     get_student(id)\n     get_student_email(email)\n     domain_data(course)\n         domains(course)\n     read_student_list()\n     student_test_links(student)\n         url(student, page='')\n     home_link(title)\n     lesson_cards(course, lesson)\n         fix_images(text)\n         lesson_markdown(path)\n         card_text(tab_title, tab_text)\n         card_title(tab_text)\n     lesson_data(course, lesson, text)\n         tab_choice(i, tab)\n         lesson_tabs_data(course, lesson)\n     lesson_info(lesson)\n     link(url, title=None)\n     make_link(href, text=None)\n     main_menu(course, page=None)\n         menu_active(page, menu_item)\n         menu_entry(page, x)\n         menu_read(menu_file)\n     missing_page_info(title)\n     page_info(course, title)\n     read_file(course, doc)\n         no_blank_lines(text)\n     schedule_data(course, table)\n         course_part_data(title, table, first, last)\n         lesson_link(lesson)\n         set_links(table)\n         course_parts(table, course)\n     site_titles(course)\n     slide_content_data(course, lesson)\n         adjust_markdown_headings(markdown)\n         format_slides(course, lesson)\n     test_links(course)\n     view_info(kwargs)\n         view_data(course, title, lesson)\nunc/student.py\n     import_students()\n     list_students()\n     delete_students()\nunc/tests.py\n    \n	bin/__init__.py\n    \nbin/app.py\n     app_command(options)\n     app_help()\n     app_functions(args)\n     app_classes(args)\n     app_signature(args)\n     app_search_code(files, search_function)\n         print_indented(outline)\n             app_print(filename, children)\n     app_directories()\n     app_path(topic=None)\n     app_score()\n     app_search(args)\n     app_show(args=None)\n     app_source(args=None)\n     app_summary(args=None)\n     kill_server()\n     app_urls()\n         simplify(url)\n     run_server()\nbin/aspire.py\n     aspire_command(options)\n     aspire_help(args=None)\n     aspire_clone(args)\n     aspire_doc_path(doc=None)\n     aspire_docs()\n         count_docs(project)\n     aspire_edit(doc)\n    #  aspire_guide()\n    #     #  article_text(path)\n     text_tail(text)\n    #  aspire_history(args)\n     aspire_hours(args=None)\n     aspire_list(args=None)\n     aspire_local(args)\n     aspire_priority()\n     aspire_progress()\n         text_string(title, body)\n     aspire_projects(args=None)\n     aspire_report(args)\n         report_data(date, path)\n         report_text(data)\n         report_save()\n     aspire_reports()\n     aspire_score(args=None)\n    #  aspire_send()\n    #      article_text(path)\n     aspire_show(args)\n     aspire_todo(args)\n     aspire_web(server, page=None)\n    #  aspire_week()\n    #      project_week_string(project, hours, total)\n    #      weekly_summary()\n    #      weekly_totals()\n    #          summarize(label, times, activities, total)\n    #          gather_data(shell_cmd)\n    #  aspire_week_print()\nbin/book.py\n     book_command(argv)\n     book_build()\n         image_list()\n         book_html()\n         book_epub()\n         book_pdf()\n         book_mobi()\n         book_assemble()\n         book_copy()\n     book_changes()\n     book_commit(argv)\n     book_edit(argv)\n     book_find(words)\n     book_headings(topic=None)\n         find_headings(text, pattern='##')\n         print_headings(topic)\n     book_headlines()\n     book_index()\n         print_index_entry(category, path, title)\n     book_help()\n     nested_list(name, children)\n     book_list()\n     book_outline(topic)\n     book_plan()\n     book_read()\n     book_read_index(part=None)\n     book_status()\n     book_text(chapter=None)\n     chapter_words(chapter)\n     book_calculate_words(label,files)\n     book_word_count(part)\n     book_words()\n     web(page)\nbin/booknotes.py\n     booknotes_command(options)\n     booknotes_help(args=None)\n     booknotes_content(args)\n     booknotes_doc_path(doc=None)\n     booknotes_edit(args)\n     booknotes_excerpt(args)\n         booknotes()\n         excerpt(note)\n     booknotes_list(args)\nbin/data.py\n     data_command(options)\n     data_backup(host)\n     data_count(host)\n     data_help()\n     data_load(host)\n     data_migrate()\n     data_reset()\n     data_save(host)\n         save(server, app=None)\n     data_server()\n     data_sql(host)\n     data_tables()\n     data_prune_tables()\nbin/datatype.py\n     name_replacement(text, directory, datatype)\n     source_code(prototype)\n     convert_code(prototype, code, directory, datatype)\n     datatype_add(args)\n     datatype_command(options)\n     datatype_path(directory, doc=None)\n     datatype_edit(doc)\n     datatype_help(args=None)\nbin/days.py\n     days_command(options)\n     days_help(args=None)\n     date_str(t)\n     day_str(t)\n     days_ago(date,days)\n     days_list(args)\n     days_month(args)\n     days_weeks(num_weeks)\n         days_ahead(date, days)\n         enumerate_weeks(today, days)\n         weekly_schedule(filename, days)\n     enumerate_days(today, days)\n     to_date(s)\n     to_day(s)\n     today()\nbin/diagrams.py\n    \nbin/doc.py\n     doc_command(options)\n     doc_help()\n     doc_content(args)\n     doc_count(dir)\n     doc_directories()\n     doc_edit(args)\n     doc_fix()\n     doc_length(args=None)\n     doc_list(args=None)\n     doc_path(doc=None)\n     doc_pick(args)\n     doc_random_select(directory)\n     doc_redirect(page)\n     doc_score(args)\n     doc_search(args)\n     doc_send(args)\n     doc_send_text(args)\n     doc_show(args=None)\n     doc_show_directory(dir=None)\n     doc_stats(args)\n     doc_summary(args=None)\n     fix_chars(text)\n     doc_test(args)\n     doc_word_count(directory)\n     doc_words(args=None)\n     list_documents(dir=None)\nbin/faceblog.py\n     faceblog_command(options)\n     faceblog_doc_path(doc=None)\n     faceblog_edit(doc=None)\n     faceblog_help(args=None)\n     faceblog_list(args)\n     faceblog_send(doc)\n     faceblog_show(args)\nbin/files.py\n     accumulate_new_lines(accumulator, f2)\n     count_files(directory)\n     create_directory(path)\n     delete_file(filename)\n     do_command(cmd, input=None)\n     encode_text(text, encoding='utf-8')\n     fix_chars(text)\n     grep(pattern,file)\n     is_writable(path)\n     list_files(directory)\n     list_dirs(directory)\n     path_name (relative_filename)\n     print_list(lst)\n     print_list2(lst)\n     read_input()\n     read_json(filename)\n     read_file(filename)\n     read_text(f)\n     recursive_list(d)\n     time_sort_file(d)\n     write_text(filename, text, append=None)\n     write_file(filename, lines, append=None)\nbin/grades.py\n     student_emails()\n    #  student_info(email)\n    #  list_student_info()\nbin/guide.py\n     guide_command(options)\n     guide_help(args=None)\n     guide_add(args)\n     guide_doc_path(course=None, doc=None)\n     guide_create_lesson(course, lesson)\n     lesson_text(outline)\n     guide_edit(course, lesson)\n     guide_list(args)\n     guide_outline(course, lesson)\n         build_outline(text)\n     read_lesson(course, lesson)\n     lesson_parts(course,lesson)\n     read_lines(course, f)\nbin/hourly.py\n     hourly_command(options)\n     hourly_help(args=None)\n     hourly_doc_path(doc=None)\n     hourly_edit()\n     hourly_list()\n     hourly_run()\n         execute(cmd)\n     hourly_show()\nbin/hours.py\n    #  hours_command(options)\n    #  hours_help(args=None)\n    #  activities_work()\n    #  activities_work_client()\n    #  activities_work_nonpaid()\n    #  activities_play()\n    #  activities_public()\n    #  activities_private()\n    #  activities()\n    #  hours_activity(args)\n    #  hours_add(args)\n    #      enumerate_days(today, days)\n    #      to_date(s)\n    #      date_str(t)\n    #      day_str(t)\n    #      days_ago(date,days)\n    #      month_of_days(start)\n    #  hours_days(args)\n    #  hours_doc_path(args)\n    #  hours_edit(args)\n    #  hours_list(args)\n    #  hours_tasks(args)\n    #  append_tasks(events, lines)\n    #      task_text(lines, start, end)\n    #  hours_show(args)\n    #  hours_summary(args)\n    #  hours_work(args)\n    #  is_day(line)\n    #  is_activity(line)\n    #  is_task(line)\n    #  list_events(args)\n    #  list_tasks(text)\n    #  months()\n    #  print_activities(label, times)\n    #  print_days(times, num_days)\n    #  print_score(times)\n    #      show_score(label, activities, ideal_hours)\n    #  print_table(labels, table)\n    #  print_tasks(results, activity=None)\n    #  print_total_hours(results, activity=None)\n    #      select_activity(record, activity)\n    #  print_total(label, times, activities=None, grand_total=None)\n    #  print_totals(label, times, activities=None, grand_total=None)\n    #  print_work(times, num_days)\n    #  total_activity(filename, times={})\n    #  total_columns(table)\n    #  activity_list(filename)\n    #  total_work_days(filename)\n    #  total_days(filename)\n    #  total_time(times, activities=None)\nbin/i.py\n     i_command(options)\n     i_help(args=None)\n     doc_path()\n     i_add(args)\n     i_edit(args)\n     i_list(args)\nbin/life.py\n     life_command(options)\n     life_doc_path(doc=None)\n     life_edit(doc)\n     life_help(args=None)\n     life_list(args)\n     life_publish(args)\n     life_show(args)\n     life_todo(args)\n     life_web(args)\n     life_words(args)\nbin/log.py\n     log_path()\n     log_command(options)\n     log(label,value=None)\n     log_exception()\n     log_clear()\n     log_read()\nbin/music.py\n     music_command(options)\n     music_help(args=None)\n     list_albums(args)\n     list_collections(args)\n     list_du(args)\n     list_tracks(args)\n     music_copy()\n     music_doc_path(doc=None)\n     music_edit(doc)\n     music_collection(name)\n     music_load(args)\n     music_list(args)\n     music_show(args)\n     music_sync(args)\nbin/n.py\n    \nbin/ntsh.py\n     ntsh_command(argv)\n     commit()\n     clean()\n     convert(f1,f2)\n     convert_png(f1,f2)\n     help()\n     hide()\n     list_files(dirs)\n     new_name(name)\n     name(args)\n     notes()\n     reorder(name)\n     status()\n     view()\n     web(page='%s/notes/fav_list' % archive)\n     zip_open()\n     zip_close()\nbin/ops.py\n     ops_command(options)\n     ops_help(cmd=None, args=None)\n     ops_cmd(args)\n     ops_console()\n     ops_deploy()\n     ops_log()\n     ops_restart()\n     ops_root(server=host, cmd='')\n     ops_update(args)\n     remote_command(server, cmd, user='django')\nbin/page_tests.py\n     run_server()\n     webpage_text(browser,url)\n    #      setUp(self)\n    #      tearDown(self)\n    #      assertBetween(self, num, min, max)\n    #      assertLineCount(self, text, min=1, max=10)\n    #      test_pages(self)\n         setUp(self)\n         tearDown(self)\n         test_pages(self)\n        #  test_visit_google(self)\nbin/pandoc.py\n     file_to_html(path, image_path=None)\n         fix_images(text)\n     markdown_to_html(markdown_path, html_path)\n     read_markdown(path)\n     text_to_html(text)\n     title(p1)\n     write_html_file(path, html)\nbin/remote_tests.py\n    #      test_remote_server(self)\n    #      test_host(self)\n    #     #  test_version_control(self)\n    #     #  test_python_version(self)\n    #      test_virtual_env(self)\n    #      test_pip_list(self)\nbin/resize.py\n     save_image_file(filename, image, width, height, imtype)\n     resize_jpeg(filename)\n     resize_png(filename)\n    #  create_thumbnails(infile, photo)\n    #  resize_test()\nbin/score.py\n    #  score_command(options)\n    #  score_doc_path(doc=None)\n    #  score_edit()\n    #  score_help(args=None)\n    #  score_show()\n    #  score_update()\n    #  score_web()\nbin/seamanslog.py\n     seamanslog_command(options)\n     seamanslog_help(args=None)\n     seamanslog_article(args)\n         article_text(path)\n     seamanslog_doc_path(doc=None)\n     seamanslog_edit(doc)\n     seamanslog_list(args)\n     seamanslog_pick()\n     seamanslog_show(args)\n     seamanslog_summary()\n     seamanslog_view(args)\n     seamanslog_web(args)\n     seamanslog_words(args)\nbin/shell.py\n     banner(name)\n     check_dirs(path, min=0, max=0)\n     check_dir_list(path, dir_list)\n     check_files(path, min=0, max=0)\n     check_file_list(path, dir_list)\n     check_lines(label, lines, min=0, max=10)\n     check_shell_lines(cmd, min=0, max=10)\n     differences(answer, correct)\n     dir_list(path)\n     dir_tree_list(path)\n     file_tree_list(path, filetype=None)\n     file_list(path, filetype=None)\n     file_path(d='', f='')\n     filter_types(files, filetype=None)\n     hostname()\n     line_match(word, text)\n     line_exclude(word, text)\n     line_count(path)\n     limit_lines(shell_command, min=None, max=None)\n     read_file(path)\n     shell(cmd)\n         command_line(cmd)\n     word_count(text)\n     write_file(path, text)\nbin/spiritual.py\n     spiritual_command(args)\n     spiritual_help()\n     spiritual_article(args)\n         article_text(path)\n     spiritual_doc_path(doc)\n     spiritual_edit(args)\n     spiritual_list()\n     spiritual_list_files(dir=None)\n     spiritual_pick(args)\n     spiritual_send(args)\n     spiritual_search(args)\n     spiritual_show(args)\n     spiritual_summary()\n     spiritual_test()\n     spiritual_web()\nbin/src.py\n     src_command(options)\n     src_help()\n     differences(f1,f2)\n     list_source_files(d)\n     show_differences(f1,f2)\n     src_base()\n     src_changed()\n     src_common()\n     src_diff(args)\n     src_dir()\n     src_edit(args)\n     src_list()\n     src_missing()\n     src_pull(args)\n     src_push(args)\n     src_same()\n     src_unique()\n     src_update()\nbin/switches.py\n     server_type()\n     server_host(server)\nbin/text.py\n     text_command(options)\n     text_help(args=None)\n     find_agents(text)\n     find_anchors(text)\n     find_classes(text)\n     find_functions(text)\n     find_links(text)\n         link(anchor)\n     find_quotes(text)\n     find_signatures(text)\n        pattern = r'(.*\\(.*\\))'\n     find_urls(text)\n     markdown_list_links(host, lines)\n     markdown_list_string(mylist)\n     text_join(text)\n     text_lines(text)\n     text_match(match_pattern, doc)\n     text_no_match(match_pattern, doc)\n     text_outline(text)\n     text_outline_string(outline, depth=0)\n     text_markdown(outline, depth=1)\n         text_body(lines)\n     text_replace(doc, match_pattern, replace_pattern)\n     text_title(text)\n     text_body(text)\n     match_lines(text, pattern)\n     match_pattern(text, pattern)\n     transform_matches(text, match_pattern, select_pattern)\nbin/todo.py\n     todo_command(options)\n     recent_dates(days=3)\n     edit_task_file(date)\nbin/tool.py\n     tool_command(options)\n     tool_edit(args)\n     tool_help(self)\n     tool_list()\n     tool_length()\n     tool_read(args)\nbin/user.py\n    \nbin/vc.py\n     vc_command(options)\n     vc_help(args=None)\n     git_cmd(cmd)\n     git_filter()\n     vc_commit(args)\n     vc_diff(args)\n     vc_dirs()\n     vc_log(args)\n     vc_pull(args)\n     vc_push(args)\n     vc_status(args)\nbin/web.py\n     web_command(args)\n     web_help()\n     web(page)\n     web_path(topic=None)\nbin/wordpress.py\n     wordpress_command(options)\n     wordpress_help(args=None)\n     wordpress_doc_path(doc=None)\n     wordpress_edit(doc)\n     wordpress_list(args)\n     wordpress_host(args)\n     wordpress_ssh(args)\nbin/x.py\n     execute_command(cmd,args)\n     command_help(cmd,args)\n     command_scriptor(cmd, args)\nhammer/__init__.py\n    \nhammer/secret_settings.py\n    #  database_init()\nhammer/settings.py\n         ip_addresses()\nhammer/urls.py\n    \nhammer/wsgi.py\n    \nhealth/__init__.py\n    \nhealth/admin.py\n    \nhealth/apps.py\n    \nhealth/health.py\n     health_command(options)\n     health_doc_path(doc=None)\n     health_edit(args)\n     health_help(args=None)\n     health_list(args)\n     health_score()\n        #  total(row)\n        #  print_bar(lag,lead,average)\n        #  print_score(row, score)\n     average (num_list)\n     health_import(args)\n     health_web()\nhealth/models.py\n         __unicode__(self)\n         get_absolute_url(self)\n         as_row(self)\n         labels()\nhealth/tests.py\n    \nhealth/urls.py\n    \nhealth/views.py\n    #  health_menu(page)\n     health_settings(page='home')\n         get_context_data(self, **kwargs)\n         get_queryset(self)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n     health_scores(objects)\n         average(num_list)\n         five_star(rating)\n         scores(row)\nlife/__init__.py\n    \nlife/admin.py\n    \nlife/apps.py\n    \nlife/life.py\n     query_labels()\n     query_get(pk)\n     query_year(age)\n     query_experiences(age=None)\n     experiences_lookup_table(age=None)\nlife/models.py\n         __unicode__(self)\n         __unicode__(self)\n         __unicode__(self)\n         get_absolute_url(self)\n     initialize()\nlife/tests.py\n    \nlife/urls.py\n    \nlife/views.py\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_redirect_url(self, *args, **kwargs)\n         get_context_data(self, **kwargs)\nmybook/__init__.py\n    \nmybook/admin.py\n    \nmybook/apps.py\n    \nmybook/models.py\n         __unicode__(self)\n         get_absolute_url(self)\n         as_row(self)\n         labels()\n         values(self)\n         name(self)\n         fields(self)\n         __unicode__(self)\n         get_absolute_url(self)\n         as_row(self)\n         labels()\n         values(self)\n         fields(self)\nmybook/mybook.py\n     mybook_path(page)\n    #  mybook_random_select(directory)\n    #  mybook_redirect(host, page, user)\n    #  mybook_site(title)\n     mybook_site_title(title)\n         site_title_text(page)\n     mybook_content(author, title)\n     main_menu(menu, page=None)\n         menu_active(page, menu_item)\n         menu_entry(page, x)\n         menu_read(menu, page)\n         menu_text(page)\n     booknotes_excerpt(doc)\n         booknotes_doc_path(doc=None)\n         booknotes(doc)\n         excerpt(note)\nmybook/mybook_views.py\n     domain_menu(domain, page)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_redirect_url(self, *args, **kwargs)\n    #      get_context_data(self, **kwargs)\n         get_redirect_url(self, *args, **kwargs)\n         get_redirect_url(self, *args, **kwargs)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\nmybook/outline.py\n     has_kids(text, depth)\n     outline(text)\n     parse_outline(text, tree, depth)\n     print_node(name, depth=1, char='    ')\n     seperator(depth)\n     split_text(text, sep)\n     title(text, depth)\n     read_cards(doc)\n     tabs_data(doc)\n         tab_choice(i,tab)\nmybook/task.py\n     tasks_monthly(year, month)\n     recent_months()\n     months_data_table()\n     tasks_data_table(days)\n     days_data_table(days)\n    #  task_list(task)\n    #  task_list(date)\nmybook/tests.py\n    \nmybook/urls.py\n    \nsuperuser/__init__.py\n    \nsuperuser/admin.py\n     admin_print_list()\n     admin_list()\n     admin_table()\n     admin_detail(a)\n     admin_get(pk)\n     database_info()\n     get_detail_data()\n     is_superuser(user)\n     log_text()\n     requesting_user(user)\n     test_list()\n     test_labels()\n     test_results()\n     test_table()\n     test_text(t)\n     text_head(text, lines=3)\n     text_lines(lines, columns=30)\n     user_detail(user)\n     user_labels()\n     user_table(users)\nsuperuser/admin_views.py\n         get_context_data(self, **kwargs)\n         test_func(self)\n         get_context_data(self, **kwargs)\n         test_func(self)\n         get_context_data(self, **kwargs)\n         test_func(self)\n         get_context_data(self, **kwargs)\n         test_func(self)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         test_func(self)\n         get_queryset(self)\n         get_context_data(self, **kwargs)\n         test_func(self)\n         get_context_data(self, **kwargs)\n         test_func(self)\nsuperuser/apps.py\n    \nsuperuser/initialize.py\n    \nsuperuser/models.py\n         __unicode__(self)\n         as_row(self)\n         labels()\n         values(self)\nsuperuser/tests.py\n    \nsuperuser/urls.py\n    \ntasks/__init__.py\n    \ntasks/models.py\n         __unicode__(self)\n        #  get_absolute_url(self)\n         as_row(self)\n         labels()\ntasks/summary.py\n     activity_summary(activity)\n         active_tab(a, t)\n     activities_work()\n     sort_activity(data)\n     bad_days()\n     bad_days_data(days)\n     combine_work_tasks(table, total)\n     tasks_activity(activity)\n     task_activity_details(activity)\n     task_detail(task)\n     query_hours(task, days)\n     task_filter(tasks, activity)\n     time_data()\n     time_totals(totals)\n         time_total(totals, time)\n     percent(actual, total)\n     percent_totals(totals, subtotals)\n     review_totals(totals, subtotals)\n         percent_difference(actual, total, ideal)\n         task_percents(totals, task, index, ideals)\n     time_filter(tasks, days)\n     task_text_list(tasks)\n         format(t)\n     task_list(days=8)\n     time_summary(days)\n     work_types()\n     write_task_files(tlist)\n     task_import_files()\n         task_details(f)\n         read_task_file(f)\n         new_task(date, name, hours, notes)\ntasks/task.py\n     task_command(self, args)\n     task_help(self)\n     days_ago(days)\n     hourly_total(tasks)\n     monthly_hours_invested(task_type, year, month)\n     last_month_hours_invested(task_type)\n     tasks_last_month()\n     task_data_table()\n     monthly_totals(year, month)\n     full_totals()\n     print_summary(summary, start=None, end=None)\n     recent_weeks()\n     recent_months()\n     sort_totals(categories)\n     task_add(self, args)\n     task_delete(self, args)\n     task_details(query, hours)\n         record(name, hours, total)\n     task_doc_path(args)\n     task_edit(self, args)\n     task_get(self, args)\n     task_import(args)\n     task_history(args)\n         print_task_history(tasks)\n     task_list(self, args)\n     task_month(args)\n    #  task_read_events(args)\n     task_read_health(args)\n     task_rename(args)\n     task_set_name(args, task)\n     task_select(task_type=None, date=None, days=None)\n     task_summary(args)\n     task_totals()\n     task_types()\n     task_print_types()\n     task_web()\n     task_week(args)\n     task_work()\n     tasks_monthly(year, month)\n     tasks_weekly(year, month, day)\n     total_hours_invested(task_type)\n     weekly_hours_invested(task_type, year, month, day)\n     weekly_totals(year, month, day)\n     task_report(year, month)\n         query_month_tasks(year, month)\n         task_entry(task)\n     save_monthly_reports(year)\n         save_report(report, month)\n     fix_tasks()\n     test_tasks()\ntasks/urls.py\n    \ntasks/views.py\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_queryset(self)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_redirect_url(self, *args, **kwargs)\n         get_context_data(self, **kwargs)\ntest/__init__.py\n    \ntest/app_test.py\n     app_classes_test()\n     app_functions_test()\n     app_list_test()\n     app_switches_test()\n     app_settings_test()\n     app_show_test()\n     app_signature_test()\n     app_url_test()\ntest/archive_test.py\n     archive_files_test()\n     archive_dirs_test()\n     archive_nts_test()\n     archive_repo_test()\n         list_archives()\ntest/aspire_test.py\n     aspire_list_test()\n     aspire_show_test()\n    #  aspire_score_test()\n     aspire_report_test()\n     aspire_week_test()\ntest/booknotes_test.py\n     booknotes_list_test()\n     booknotes_lines_test()\ntest/css_test.py\n     css_test()\ntest/data_test.py\n     data_files_test()\n     data_save_test()\n     data_tables_test()\n     data_migrate_test()\ntest/doc_test.py\n     doc_test()\n     doc_help_test()\n     doc_search_test()\n     doc_scan_test()\n     doc_file_test()\n     doc_file_missing_test()\n     doc_consolidate()\n     doc_render_test()\n     doc_encoding_test()\ntest/health_test.py\n     health_list_test()\n     health_score_test()\ntest/hourly_test.py\n     hourly_list_test()\n     hourly_show_test()\ntest/i_test.py\n     i_list_test()\ntest/log_test.py\n     log_length_test()\ntest/ops_test.py\n    #  ops_git_pull_test()\n     ops_help_test()\n     ops_server_test()\n     ops_server_type_test()\n     ops_status_test()\ntest/page_test.py\n     check_page(url, min=1, max=1)\n     page_list_test()\n     page_text_test()\n     page_diff_test()\n     page_sites_test()\ntest/robot_test.py\n     robot_list_test()\n     robot_results_test()\n    #  robot_show_test()\ntest/seamanslog_test.py\n     seamanslog_list_test()\n     seamanslog_show_test()\n     seamanslog_summary_test()\n     seamanslog_words_test()\ntest/system_test.py\n     system_cron_test()\n     system_disk_free_test ()\n     system_files_count_test()\n     system_host_test()\n     system_ip_test()\n     system_pandoc_test()\n     system_python_files_test()\n     system_python_version_test()\n     system_python_virtualenv_test()\ntest/text_test.py\n     text_help_test()\n     text_match_test()\n     text_no_match_test()\n     text_agents_test()\n     text_outline_test()\n     text_markdown_test()\n     text_format_test()\n     text_round_trip_test()\n     text_grep_test()\n     text_findall_test()\n     text_functions_test()\n     text_select_lines_test()\n     text_url_test()\n     text_links_test()\n    #  text_transforms_test()\n    #      transform(test_case)\n     text_signatures_test()\n     text_anchors_test()\n     text_div_test()\ntest/tst_test.py\n     tst_test()\n     tst_time_test()\n    #  remote_server_test()\ntest/unc_test.py\n     unc_files_test()\ntest/user_test.py\n    #  user_import_test()\n    #  user_export_test()\n     user_list_test()\ntest/vc_test.py\n     vc_status_test()\n     vc_pull_test()\ntest/wordpress_test.py\n     wordpress_list_test()\n     wordpress_host_test()\ntool/__init__.py\n    \ntool/document.py\n     doc_cards(page)\n     doc_content(page)\n     doc_dir_exists(title)\n     doc_exists(title)\n     doc_html_text(page, image_path=None)\n     doc_link(title)\n     doc_path(page)\n     domain_doc(domain, page)\ntool/domain.py\n     domain_title(domain)\n     domain_directory(domain)\ntool/email.py\n     email_command(options)\n     email_help()\n     email_args(args, use_html=True)\n     send_support_request(title, text)\n     send_file_email(args)\n     send_doc_email(args)\n     send_text_email(args)\n     send_html_email(args)\n     send_template_message(emailTo, title, template, data={})\ntool/log.py\n     log(text, value=None)\n     log_exception()\n     log_json(text, data)\n     log_file()\n     show_log()\n     log_notifications(title, recipients)\n     log_page(request, parms='')\ntool/management/__init__.py\n    \ntool/management/commands/__init__.py\n    \ntool/management/commands/scriptor.py\n         add_arguments(self, parser)\n         handle(self, *args, **options)\n         help(self)\ntool/models.py\n         __unicode__(self)\n         get_absolute_url(self)\ntool/notify.py\n     notify_test_results()\n     notify_test_email()\ntool/page.py\n     page_command(self, options)\n     page_help(self)\n     page_add(self, args)\n     page_delete(self, args)\n     page_diff(self, args)\n         show_diff(page)\n     page_expect(self, args)\n     page_html(self, args)\n         show_output(page)\n     page_like(self, args)\n         like_page(page)\n     page_list(self)\n     page_lookup(url)\n     page_reset(self)\n     page_results()\n     page_text(self, args)\n         show_output(page)            \ntool/project.py\n     project_add(self, args)\n     project_command(self, options)\n     project_delete(self, args)\n     project_get(self, args)\n     project_help(self)\n     project_list(self)\n     project_lookup(name)\ntool/robot.py\n     robot_command(options)\n     robot_help(args=None)\n     robot_doc_path(doc=None)\n     robot_fetch_page(url)\n     robot_get_page(browser, page)\n     robot_list()\n     robot_login(browser,page)\n     robot_results()\n     robot_run()\ntool/tst.py\n     tst_find()\n     get_module(modulename)\n     test_map(modulename)\n         test_entry(entry)\n         tests(module)\n     tst_command(self, args)\n     test_dictionary()\n         module_list(directory)\n         test_name(module)\n     tst_diff(test_name)\n     tst_edit(self, args)\n     tst_help(self)\n     tst_like(self,args)\n     tst_list(self,args)\n     tst_output(self,args)\n     tst_register(tests)\n     tst_quick_test()\n     tst_results()\n         show_differences(t)\n     tst_run(self,args)\n         run_test(self,test_entry)\n     tst_send(self,args)\ntool/urls.py\n    \ntool/user.py\n     user_command(self, options)\n     user_help()\n     user_add(name, email, password='test')\n     user_delete(args)\n     user_export(self, args)\n     user_get(pk)\n     user_import(self, args)\n     user_list()\n     user_reset(self)\n     add_super_user(name, email, password)\n     user_password(username, password)\n     user_lookup(name, email=None)\n     user_file_path(args)\n     user_fix_name(args)\n     show_users()\n     reset_passwords()\ntool/user_views.py\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\ntool/xxx.py\n    #      __unicode__(self)\n    #      get_absolute_url(self)\n    #      as_row(self)\n    #      labels()\n    #      values(self)\n    #     #  fields(self)\n     xxx_add(name)\n     xxx_delete(pk)\n     xxx_edit(pk, name)\n     xxx_lookup(pk)\n     xxx_get(client, name)\n     xxx_print(objects)\n     xxx_query(select=None)\n     xxx_table(select=None)\ntool/xxx_script.py\n     xxx_command(args)\n     xxx_help(args=None)\n     xxx_list(args=None)\ntool/xxx_views.py\n         get_context_data(self, **kwargs)\n         get_context_data(self, **kwargs)\nunc/__init__.py\n    \nunc/admin.py\n    \nunc/apps.py\n    \nunc/models.py\n         __unicode__(self)\nunc/review.py\n     allow_review(reviewer, designer, page)\n     calculate_points(student)\n     course_list()\n     create_review(reviewer, designer, page)\n     create_reviews(page, groups)\n     create_sample_courses()\n     requirements(course)\n     requirements_bacs200()\n     requirements_bacs350()\n     count_score(r)\n     review_groups()\n     review_pairs(groups)\n     reviewer_query(reviewer_id)\n     designer_query(designer_id)\n     designer_score(designer_id)\n     designer_scores(designer_id, assignments=None)\n     avg(s)\n     projects(course)\n     reviews_completed(student_id)\n     reviews_done(student_id)\n     reviews_feedback(student_id, page)\n     review_tabs(student_id)\n     reviews_to_do(student_id)\n     reviewer_score(reviewer_id)\n     assignment_page(course, page)\n     reviewer_scores(reviewer_id, assignments)\n     gather_review_scores(course, student=None)\n     student_review_data(student_id)\n     update_review_scores(course)\nunc/sensei.py\n     content_lessons(course)\n     guide_doc_path(doc=None)\n     guide_file(course, doc)\n     guide_schedule(lesson)\n     register_students()\n     add_student(course, name, email, domain)\n     query_students(course, student=None)\n     get_student(id)\n     get_student_email(email)\n     domain_data(course)\n         domains(course)\n     read_student_list()\n     student_test_links(student)\n         url(student, page='')\n     home_link(title)\n     lesson_cards(course, lesson)\n         fix_images(text)\n         lesson_markdown(path)\n         card_text(tab_title, tab_text)\n         card_title(tab_text)\n     lesson_data(course, lesson, text)\n         tab_choice(i, tab)\n         lesson_tabs_data(course, lesson)\n     lesson_info(lesson)\n     link(url, title=None)\n     make_link(href, text=None)\n     main_menu(course, page=None)\n         menu_active(page, menu_item)\n         menu_entry(page, x)\n         menu_read(menu_file)\n     missing_page_info(title)\n     page_info(course, title)\n     read_file(course, doc)\n         no_blank_lines(text)\n     schedule_data(course, table)\n         course_part_data(title, table, first, last)\n         lesson_link(lesson)\n         set_links(table)\n         course_parts(table, course)\n     site_titles(course)\n     slide_content_data(course, lesson)\n         adjust_markdown_headings(markdown)\n         format_slides(course, lesson)\n     test_links(course)\n     view_info(kwargs)\n         view_data(course, title, lesson)\nunc/student.py\n     import_students()\n     list_students()\n     delete_students()\nunc/tests.py\n    \n
52	score-show	shell(x score show) --> 15 lines (should be between 30 and 35)	shell(x score show) --> 15 lines (should be between 30 and 35)
37	author-summary	no output	no output
22	faceblog-show	no output	no output
53	health-list	                                    Sleep   Weight      Eat  Exercise \nMarkSeaman           2017-04-28         5        2        2        2       \nMarkSeaman           2017-04-27         3        2        3        3       \nMarkSeaman           2017-04-26         3        2        3        3       \nMarkSeaman           2017-04-25         5        2        3        3       \nMarkSeaman           2017-04-24         3        3        2        3       \nMarkSeaman           2017-04-23         5        4        3        3       \nMarkSeaman           2017-04-22         3        4        3        3       \nMarkSeaman           2017-04-21         3        3        4        1       \nMarkSeaman           2017-04-20         3        2        2        2       \nMarkSeaman           2017-04-19         2        1        3        2       \nMarkSeaman           2017-04-18         3        1        2        1       \nMarkSeaman           2017-04-17         5        2        2        1       \nMarkSeaman           2017-04-16         3        4        1        3       \nMarkSeaman           2017-04-15         5        3        3        4       \nMarkSeaman           2017-04-13         5        3        4        4       \nMarkSeaman           2017-04-12         5        3        3        3       \nMarkSeaman           2017-04-11         5        3        3        3       \nMarkSeaman           2017-04-10         5        4        2        4       \nMarkSeaman           2017-04-09         5        2        3        3       \nMarkSeaman           2017-04-08         3        1        4        1       \nMarkSeaman           2017-04-07         5        2        1        4       \nMarkSeaman           2017-04-05         5        3        2        2       \nMarkSeaman           2017-04-04         4        3        2        2       \nMarkSeaman           2017-04-03         4        3        3        4       \nMarkSeaman           2017-04-02         4        3        3        4       \nMarkSeaman           2017-04-01         4        3        3        2       \n	                                    Sleep   Weight      Eat  Exercise \nMarkSeaman           2017-04-28         5        2        2        2       \nMarkSeaman           2017-04-27         3        2        3        3       \nMarkSeaman           2017-04-26         3        2        3        3       \nMarkSeaman           2017-04-25         5        2        3        3       \nMarkSeaman           2017-04-24         3        3        2        3       \nMarkSeaman           2017-04-23         5        4        3        3       \nMarkSeaman           2017-04-22         3        4        3        3       \nMarkSeaman           2017-04-21         3        3        4        1       \nMarkSeaman           2017-04-20         3        2        2        2       \nMarkSeaman           2017-04-19         2        1        3        2       \nMarkSeaman           2017-04-18         3        1        2        1       \nMarkSeaman           2017-04-17         5        2        2        1       \nMarkSeaman           2017-04-16         3        4        1        3       \nMarkSeaman           2017-04-15         5        3        3        4       \nMarkSeaman           2017-04-13         5        3        4        4       \nMarkSeaman           2017-04-12         5        3        3        3       \nMarkSeaman           2017-04-11         5        3        3        3       \nMarkSeaman           2017-04-10         5        4        2        4       \nMarkSeaman           2017-04-09         5        2        3        3       \nMarkSeaman           2017-04-08         3        1        4        1       \nMarkSeaman           2017-04-07         5        2        1        4       \nMarkSeaman           2017-04-05         5        3        2        2       \nMarkSeaman           2017-04-04         4        3        2        2       \nMarkSeaman           2017-04-03         4        3        3        4       \nMarkSeaman           2017-04-02         4        3        3        4       \nMarkSeaman           2017-04-01         4        3        3        2       \n
30	plan-show	no output	no output
32	hourly-show	no output	no output
38	system-disk-free	no output	no output
39	system-files-count	no output	no output
44	system-python-files	no output	no output
46	system-python-virtualenv	/usr/bin/python\n	/usr/bin/python\n
172	text-agents	email: mark@shrinking-world.com, company: Shrinking World, user: Mark Seaman    \nemail: stacie@shrinking-world.com, company: Shrinking World, user: Stacie Seaman  	email: mark@shrinking-world.com, company: Shrinking World, user: Mark Seaman    \nemail: stacie@shrinking-world.com, company: Shrinking World, user: Stacie Seaman  
8	text-no-match	no output	no output
2	vc-status	no output	no output
74	opc-list	\n        Command not found, opc ['list']\n\n        usage: x cmd [args]\n\n        cmd\n\n            app         # Work with application code\n            aspire      # Set personal goals\n            author      # Manage writing content\n            book        # Work with book contents\n            booknotes   # Manage notes for reading\n            cmd         # Manage command scripts\n            collab      # Application collaborator\n            data        # Database scripting\n            doc         # Manage project documents\n            hourly      # Hourly command for maintence\n            hours       # Hours of invested time\n            log         # Manage logs\n            page        # Page Master app\n            plan        # Planning Script\n            ops         # Operations script\n            project     # Projects for clients\n            robot       # Web Robot using Selenium to fetch web pages\n            seamanslog  # Seaman's Log blog\n            spiritual   # Spiritual Things subscriber list\n            software    # Work with software training materials\n            src         # Manage source code\n            staging     # Manage server at Digital Ocean\n            task        # Task Master\n            thot        # Thot recorder\n            todo        # To do list command\n            tool        # Manage django tool scripts\n            tst         # Run tests with expected results\n            web         # Web pages\n            wordpress   # Work with wordpress server at Digital Ocean\n\n        Example: x staging ip\n                 x doc list\n                 x tst run\n        \n	\n        Command not found, opc ['list']\n\n        usage: x cmd [args]\n\n        cmd\n\n            app         # Work with application code\n            aspire      # Set personal goals\n            author      # Manage writing content\n            book        # Work with book contents\n            booknotes   # Manage notes for reading\n            cmd         # Manage command scripts\n            collab      # Application collaborator\n            data        # Database scripting\n            doc         # Manage project documents\n            hourly      # Hourly command for maintence\n            hours       # Hours of invested time\n            log         # Manage logs\n            page        # Page Master app\n            plan        # Planning Script\n            ops         # Operations script\n            project     # Projects for clients\n            robot       # Web Robot using Selenium to fetch web pages\n            seamanslog  # Seaman's Log blog\n            spiritual   # Spiritual Things subscriber list\n            software    # Work with software training materials\n            src         # Manage source code\n            staging     # Manage server at Digital Ocean\n            task        # Task Master\n            thot        # Thot recorder\n            todo        # To do list command\n            tool        # Manage django tool scripts\n            tst         # Run tests with expected results\n            web         # Web pages\n            wordpress   # Work with wordpress server at Digital Ocean\n\n        Example: x staging ip\n                 x doc list\n                 x tst run\n        \n
26	table-from-text	[['a', 'b', 'c'], ['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9']]	[['a', 'b', 'c'], ['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9']]
27	table-sort	    b          92         3         \n    a          25         c         \n    c          8          9         \n    d          5          6         	    b          92         3         \n    a          25         c         \n    c          8          9         \n    d          5          6         
35	author-drafts	no output	no output
21	faceblog-list	faceblog command ['list']\nfaceblog list\nTimeBudget\nRandom\nOpportunity\n10000Days\nToolsSaveTime\nLearningCurve\nImportantWork\nUnfinishedBook\nLifeWork\nReadToLearn\nSiteTitle\nDailyHabits\nCommitments\nExpandContract\nMenu\nHabitualChange\nWorkMindset\nWritingWorkflow\nWhyWork\nMultitasking\nHitler\nLowCostMyth\nBusinessInvestment\nActToLearn\nScaledCommit\nStrengths\nCollaboration\nWritingStages\nPragmaticThinking\nOneImprovement\nSearch\nCareer\nProcessingIdeas\nYourBlogTopic\nIndex\nLifeFun\nLifeThatMatters\nBiggestIdea\nLifePeople\nLifeGrow\nNewYearsResolutions\nGenetics\nInvest20Percent\nCreativeScore\nRuthlessWithWaste\nFoodAndSex\nPessimism\nComputerComplexity\nIdeology\nMaunaKea\nWorkforce\nMyStory\n	faceblog command ['list']\nfaceblog list\nTimeBudget\nRandom\nOpportunity\n10000Days\nToolsSaveTime\nLearningCurve\nImportantWork\nUnfinishedBook\nLifeWork\nReadToLearn\nSiteTitle\nDailyHabits\nCommitments\nExpandContract\nMenu\nHabitualChange\nWorkMindset\nWritingWorkflow\nWhyWork\nMultitasking\nHitler\nLowCostMyth\nBusinessInvestment\nActToLearn\nScaledCommit\nStrengths\nCollaboration\nWritingStages\nPragmaticThinking\nOneImprovement\nSearch\nCareer\nProcessingIdeas\nYourBlogTopic\nIndex\nLifeFun\nLifeThatMatters\nBiggestIdea\nLifePeople\nLifeGrow\nNewYearsResolutions\nGenetics\nInvest20Percent\nCreativeScore\nRuthlessWithWaste\nFoodAndSex\nPessimism\nComputerComplexity\nIdeology\nMaunaKea\nWorkforce\nMyStory\n
170	text-transforms	text_command\ntext_help\nfind_functions\n(.*)\\\nfind_links\nlink\nfind_urls\nmarkdown_list_links\nmarkdown_list_string\ntext_join\ntext_lines\ntext_match\ntext_no_match\ntext_outline\ntext_outline_string\ntext_markdown\ntext_body\ntext_replace\ntext_select\ntext_title\ntext_body\nmatch_lines\nmatch_pattern\ntransform_matches\ntext_command (options)\ntext_help (args=None)\nfind_functions (text)\n(.*)\\ (.*\\)\nfind_links (text)\nlink (anchor)\nfind_urls (text)\nmarkdown_list_links (host, lines)\nmarkdown_list_string (mylist)\ntext_join (text)\ntext_lines (text)\ntext_match (match_pattern, doc)\ntext_no_match (match_pattern, doc)\ntext_outline (text)\ntext_outline_string (outline, depth=0)\ntext_markdown (outline, depth=1)\ntext_body (lines)\ntext_replace (match_pattern, replace_pattern, doc)\ntext_select (selector, doc)\ntext_title (text)\ntext_body (text)\nmatch_lines (text, pattern)\nmatch_pattern (text, pattern)\ntransform_matches (text, match_pattern, select_pattern)	text_command\ntext_help\nfind_functions\n(.*)\\\nfind_links\nlink\nfind_urls\nmarkdown_list_links\nmarkdown_list_string\ntext_join\ntext_lines\ntext_match\ntext_no_match\ntext_outline\ntext_outline_string\ntext_markdown\ntext_body\ntext_replace\ntext_select\ntext_title\ntext_body\nmatch_lines\nmatch_pattern\ntransform_matches\ntext_command (options)\ntext_help (args=None)\nfind_functions (text)\n(.*)\\ (.*\\)\nfind_links (text)\nlink (anchor)\nfind_urls (text)\nmarkdown_list_links (host, lines)\nmarkdown_list_string (mylist)\ntext_join (text)\ntext_lines (text)\ntext_match (match_pattern, doc)\ntext_no_match (match_pattern, doc)\ntext_outline (text)\ntext_outline_string (outline, depth=0)\ntext_markdown (outline, depth=1)\ntext_body (lines)\ntext_replace (match_pattern, replace_pattern, doc)\ntext_select (selector, doc)\ntext_title (text)\ntext_body (text)\nmatch_lines (text, pattern)\nmatch_pattern (text, pattern)\ntransform_matches (text, match_pattern, select_pattern)
178	page-sites	shell(curl -s https://markseaman.info) --> 253 lines (should be between 195 and 230)\nOK - https://markseaman.org\nOK - https://seamansguide.com\nOK - https://seamanslog.com\nOK - https://shrinking-world.com\nOK - https://spiritual-things.org\nOK - https://who2hire.us\nshell(curl -s https://app.who2hire.us/admin) --> 1 lines (should be between 324 and 324)	shell(curl -s https://markseaman.info) --> 256 lines (should be between 195 and 230)\nOK - https://markseaman.org\nOK - https://seamansguide.com\nOK - https://seamanslog.com\nOK - https://shrinking-world.com\nOK - https://spiritual-things.org\nOK - https://who2hire.us\nshell(curl -s https://app.who2hire.us/admin) --> 1 lines (should be between 324 and 324)
48	seamanslog-show	no output	no output
10	text-round-trip	0a1\n> \n10d10\n< \n15d14\n< \n21d19\n< \n23d20\n< \n25d21\n< \n27d22\n< \n29d23\n< \n31d24\n< \n33d25\n< \n35d26\n< \n39d29\n< \n42a33\n>     \n	0a1\n> \n10d10\n< \n15d14\n< \n21d19\n< \n23d20\n< \n25d21\n< \n27d22\n< \n29d23\n< \n31d24\n< \n33d25\n< \n35d26\n< \n39d29\n< \n42a33\n>     \n
121	src-base	/home/django/Projects/Who2Hire\n	/home/django/Projects/Who2Hire\n
122	src-changed	no output	no output
123	src-common	no output	no output
124	src-diff	shell(x src diff) --> 1 lines (should be between 3000 and 4000)	shell(x src diff) --> 1 lines (should be between 3000 and 4000)
125	src-missing	No directory exists\n	No directory exists\n
126	src-same	no output	no output
67	hours-activity	Activity for 2016-08\n\nTotal                       0   100%\n	Activity for 2016-08\n\nTotal                       0   100%\n
33	staging-host	\n        Command not found, staging ['command', 'hostname']\n\n        usage: x cmd [args]\n\n        cmd\n\n            app         # Work with application code\n            aspire      # Set personal goals\n            author      # Manage writing content\n            booknotes   # Manage notes for reading\n            cmd         # Manage command scripts\n            collab      # Application collaborator\n            data        # Database scripting\n            doc         # Manage project documents\n            hourly      # Hourly command for maintence\n            hours       # Hours of invested time\n            log         # Manage logs\n            page        # Page Master app\n            plan        # Planning Script\n            ops         # Operations script\n            project     # Projects for clients\n            robot       # Web Robot using Selenium to fetch web pages\n            seamanslog  # Seaman's Log blog\n            spiritual   # Spiritual Things subscriber list\n            software    # Work with software training materials\n            src         # Manage source code\n            staging     # Manage server at Digital Ocean\n            task        # Task Master\n            thot        # Thot recorder\n            todo        # To do list command\n            tool        # Manage django tool scripts\n            tst         # Run tests with expected results\n            web         # Web pages\n            wordpress   # Work with wordpress server at Digital Ocean\n\n        Example: x staging ip\n                 x doc list\n                 x tst run\n        \n	\n        Command not found, staging ['command', 'hostname']\n\n        usage: x cmd [args]\n\n        cmd\n\n            app         # Work with application code\n            aspire      # Set personal goals\n            author      # Manage writing content\n            booknotes   # Manage notes for reading\n            cmd         # Manage command scripts\n            collab      # Application collaborator\n            data        # Database scripting\n            doc         # Manage project documents\n            hourly      # Hourly command for maintence\n            hours       # Hours of invested time\n            log         # Manage logs\n            page        # Page Master app\n            plan        # Planning Script\n            ops         # Operations script\n            project     # Projects for clients\n            robot       # Web Robot using Selenium to fetch web pages\n            seamanslog  # Seaman's Log blog\n            spiritual   # Spiritual Things subscriber list\n            software    # Work with software training materials\n            src         # Manage source code\n            staging     # Manage server at Digital Ocean\n            task        # Task Master\n            thot        # Thot recorder\n            todo        # To do list command\n            tool        # Manage django tool scripts\n            tst         # Run tests with expected results\n            web         # Web pages\n            wordpress   # Work with wordpress server at Digital Ocean\n\n        Example: x staging ip\n                 x doc list\n                 x tst run\n        \n
165	css	/*  ------------------------------\n    Colors\n------------------------------\n\nBlue            -- #2196F3\nGreen           -- #4caf50\nLight Green     -- #f0fff0\n\n*/\n\n/* ------------------------\n    Elements\n */\n\na {\n    color: green;\n    font-weight: bold;\n}\n\na:hover {\n    font-weight: bolder;\n    text-decoration: underline;\n}\n\nbody {\n    font-size: 18px;\n    color: black;\n}\n\nh1, h2, h3 {\n    margin: 20px 0px;\n    padding: 10px 0px;\n}\n\nh1 {\n    font-size: 32px;\n    color: #2196F3;\n}\n\nh2 {\n    color: green;\n    background-color: white;\n    border: 2px solid green;\n    text-align: center;\n    font-size: 24px;\n    margin-bottom: 20px;\n}\n\nh3 {\n    font-size: 20px;\n}\n\nheader {\n    color: white;\n    background-color: #0a0a0a;\n    padding: 0px;\n    margin: 0px;\n}\n\nheader a {\n    color: white;\n}\n\nheader a:hover {\n    font-weight: 900;\n}\n\nheader h1 {\n    color: yellow;\n    border: none;\n    font-size: 300%;\n    text-shadow: 2px 2px 5px black;\n    padding: 0px;\n    margin: 0px;\n}\n\nheader h2 {\n    color: white;\n    background-color: inherit;\n    border: none;\n    font-size: 150%;\n    text-align: left;\n    width: 100%;\n    text-shadow: 2px 2px 5px grey;\n}\n\nhr {\n    border: solid 1px green;\n}\n\ni {\n    padding: 0px;\n    margin: 10px;\n}\n\nimg {\n    max-width: 800px;\n    box-shadow: 2px 2px 5px gray;\n    border: 1px solid white;\n    margin: 2em;\n    padding: 2em;\n}\n\npre {\n    background-color: #f0fff0;\n    color: #444;\n}\n\ntextarea {\n    min-width: 80%;\n    width: 100%;\n    margin: 0em;\n    height: 20em;\n}\n\ntd {\n    min-width: 8em;\n    margin: 10px;\n}\n\nul {\n    margin-bottom: 1em;\n}\n\nul ul {\n    margin-bottom: 1em;\n}\n\n/* -----------------------------\n    Class\n*/\n\n.btn {\n    background-color: green;\n    /*border: 2px solid white;*/\n    border-radius: 5px;\n    box-shadow: 2px 2px 5px gray;\n    color: white;\n    font-size: 18px;\n    font-weight: bolder;\n    margin: 5px;\n    padding: 5px;\n    text-align: center;\n    width: 150px;\n}\n\n.card {\n    border-radius: 10px;\n    box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.5);\n    padding: 20px;\n    /*max-width: 1000px;*/\n}\n\n.card-header h2 {\n    margin-bottom: 20px;\n}\n\n.footer {\n    margin: auto;\n    /*width: 50%;*/\n}\n\n.inset {\n    background-color: white;\n    box-shadow: -2px -2px 5px grey;\n    padding: 1em;\n    margin: 1em;\n}\n\n.logo {\n    background-color: white;\n    border-radius: 10px;\n    width: 240px;\n    height: 150px;\n    box-shadow: 2px 2px 5px gray;\n    margin: 0px 40px 0px 0px;\n}\n\n.logo-image {\n    box-shadow: none;\n    border: none;\n    width: 220px;\n    height: 100px;\n    margin: 10px;\n    padding: 0px;\n    background: white url("/static/SWS_Globe_small.jpg") no-repeat;\n    text-align: center;\n}\n\n.logo-text {\n    font-size: 18px;\n    font-weight: bolder;\n    color: black;\n    text-align: center;\n}\n\n.main-menu {\n    margin-top: 50px;\n}\n\n.panel {\n    background-color: #eeeeee;\n    box-shadow: 2px 2px 5px grey;\n    padding: 2em;\n}\n\n.show {\n    border: solid 1px yellow;\n    padding: 5px;\n}\n\n.task-notes {\n    background-color: #eeeeee;\n    box-shadow: 2px 2px 5px gray;\n}\n\n.user-btn {\n    background-color: inherit;\n    border: 2px solid white;\n    border-radius: 5px;\n    box-shadow: 2px 2px 5px gray;\n    color: white;\n    /*margin: 5px;*/\n    /*padding: 5px;*/\n    text-align: center;\n    width: 150px;\n}\n\n.user-text * {\n    color: white;\n    padding: 5px;\n    margin: 5px;\n    font-size: 12px;\n}\n\n.user-text a {\n    color: white;\n    font-size: 18px;\n}\n\n.user-text a:hover {\n    color: yellow;\n    font-weight: bolder;\n}\n	/*  ------------------------------\n    Colors\n------------------------------\n\nBlue            -- #2196F3\nGreen           -- #4caf50\nLight Green     -- #f0fff0\n\n*/\n\n/* ------------------------\n    Elements\n */\n\na {\n    color: green;\n    font-weight: bold;\n}\n\na:hover {\n    font-weight: bolder;\n    text-decoration: underline;\n}\n\nbody {\n    font-size: 18px;\n    color: black;\n}\n\nh1, h2, h3 {\n    margin: 20px 0px;\n    padding: 10px 0px;\n}\n\nh1 {\n    font-size: 32px;\n    color: #2196F3;\n}\n\nh2 {\n    color: green;\n    background-color: white;\n    border: 2px solid green;\n    text-align: center;\n    font-size: 24px;\n    margin-bottom: 20px;\n}\n\nh3 {\n    font-size: 20px;\n}\n\nheader {\n    color: white;\n    background-color: #0a0a0a;\n    padding: 0px;\n    margin: 0px;\n}\n\nheader a {\n    color: white;\n}\n\nheader a:hover {\n    font-weight: 900;\n}\n\nheader h1 {\n    color: yellow;\n    border: none;\n    font-size: 300%;\n    text-shadow: 2px 2px 5px black;\n    padding: 0px;\n    margin: 0px;\n}\n\nheader h2 {\n    color: white;\n    background-color: inherit;\n    border: none;\n    font-size: 150%;\n    text-align: left;\n    width: 100%;\n    text-shadow: 2px 2px 5px grey;\n}\n\nhr {\n    border: solid 1px green;\n}\n\ni {\n    padding: 0px;\n    margin: 10px;\n}\n\nimg {\n    max-width: 800px;\n    box-shadow: 2px 2px 5px gray;\n    border: 1px solid white;\n    margin: 2em;\n    padding: 2em;\n}\n\npre {\n    background-color: #f0fff0;\n    color: #444;\n}\n\ntextarea {\n    min-width: 80%;\n    width: 100%;\n    margin: 0em;\n    height: 20em;\n}\n\ntd {\n    min-width: 8em;\n    margin: 10px;\n}\n\nul {\n    margin-bottom: 1em;\n}\n\nul ul {\n    margin-bottom: 1em;\n}\n\n/* -----------------------------\n    Class\n*/\n\n.btn {\n    background-color: green;\n    /*border: 2px solid white;*/\n    border-radius: 5px;\n    box-shadow: 2px 2px 5px gray;\n    color: white;\n    font-size: 18px;\n    font-weight: bolder;\n    margin: 5px;\n    padding: 5px;\n    text-align: center;\n    width: 150px;\n}\n\n.card {\n    border-radius: 10px;\n    box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.5);\n    padding: 20px;\n    /*max-width: 1000px;*/\n}\n\n.card-header h2 {\n    margin-bottom: 20px;\n}\n\n.footer {\n    margin: auto;\n    /*width: 50%;*/\n}\n\n.inset {\n    background-color: white;\n    box-shadow: -2px -2px 5px grey;\n    padding: 1em;\n    margin: 1em;\n}\n\n.logo {\n    background-color: white;\n    border-radius: 10px;\n    width: 240px;\n    height: 150px;\n    box-shadow: 2px 2px 5px gray;\n    margin: 0px 40px 0px 0px;\n}\n\n.logo-image {\n    box-shadow: none;\n    border: none;\n    width: 220px;\n    height: 100px;\n    margin: 10px;\n    padding: 0px;\n    background: white url("/static/SWS_Globe_small.jpg") no-repeat;\n    text-align: center;\n}\n\n.logo-text {\n    font-size: 18px;\n    font-weight: bolder;\n    color: black;\n    text-align: center;\n}\n\n.main-menu {\n    margin-top: 50px;\n}\n\n.panel {\n    background-color: #eeeeee;\n    box-shadow: 2px 2px 5px grey;\n    padding: 2em;\n}\n\n.show {\n    border: solid 1px yellow;\n    padding: 5px;\n}\n\n.task-notes {\n    background-color: #eeeeee;\n    box-shadow: 2px 2px 5px gray;\n}\n\n.user-btn {\n    background-color: inherit;\n    border: 2px solid white;\n    border-radius: 5px;\n    box-shadow: 2px 2px 5px gray;\n    color: white;\n    /*margin: 5px;*/\n    /*padding: 5px;*/\n    text-align: center;\n    width: 150px;\n}\n\n.user-text * {\n    color: white;\n    padding: 5px;\n    margin: 5px;\n    font-size: 12px;\n}\n\n.user-text a {\n    color: white;\n    font-size: 18px;\n}\n\n.user-text a:hover {\n    color: yellow;\n    font-weight: bolder;\n}\n
45	system-python-version	sys.version_info(major=2, minor=7, micro=12, releaselevel='final', serial=0)	sys.version_info(major=2, minor=7, micro=12, releaselevel='final', serial=0)
99	days-list	Days: 15, To: Wed, 03-01\nWed, 02-15\nThu, 02-16\nFri, 02-17\nSat, 02-18\nSun, 02-19\nMon, 02-20\nTue, 02-21\nWed, 02-22\nThu, 02-23\nFri, 02-24\nSat, 02-25\nSun, 02-26\nMon, 02-27\nTue, 02-28\nWed, 03-01\n	Days: 15, To: Wed, 03-01\nWed, 02-15\nThu, 02-16\nFri, 02-17\nSat, 02-18\nSun, 02-19\nMon, 02-20\nTue, 02-21\nWed, 02-22\nThu, 02-23\nFri, 02-24\nSat, 02-25\nSun, 02-26\nMon, 02-27\nTue, 02-28\nWed, 03-01\n
107	budget-show	budget Show\nCategory           Ideal   Actual     Diff\n\nWork                  33       40        7\n\nGrow                  14       10        4\n\nPeople                21       20        1\n\nChurch                14       10        4\n\nFun                   16       20        4\n\n   Variance                             20\n	budget Show\nCategory           Ideal   Actual     Diff\n\nWork                  33       40        7\n\nGrow                  14       10        4\n\nPeople                21       20        1\n\nChurch                14       10        4\n\nFun                   16       20        4\n\n   Variance                             20\n
86	datatype-list	\n        Command not found, datatype ['list']\n\n        usage: x cmd [args]\n\n        cmd\n\n            app         # Work with application code\n            aspire      # Set personal goals\n            author      # Manage writing content\n            book        # Work with book contents\n            booknotes   # Manage notes for reading\n            cmd         # Manage command scripts\n            collab      # Application collaborator\n            data        # Database scripting\n            doc         # Manage project documents\n            hourly      # Hourly command for maintence\n            hours       # Hours of invested time\n            log         # Manage logs\n            page        # Page Master app\n            plan        # Planning Script\n            ops         # Operations script\n            project     # Projects for clients\n            robot       # Web Robot using Selenium to fetch web pages\n            seamanslog  # Seaman's Log blog\n            spiritual   # Spiritual Things subscriber list\n            software    # Work with software training materials\n            src         # Manage source code\n            staging     # Manage server at Digital Ocean\n            task        # Task Master\n            thot        # Thot recorder\n            todo        # To do list command\n            tool        # Manage django tool scripts\n            tst         # Run tests with expected results\n            web         # Web pages\n            wordpress   # Work with wordpress server at Digital Ocean\n\n        Example: x staging ip\n                 x doc list\n                 x tst run\n        \n	\n        Command not found, datatype ['list']\n\n        usage: x cmd [args]\n\n        cmd\n\n            app         # Work with application code\n            aspire      # Set personal goals\n            author      # Manage writing content\n            book        # Work with book contents\n            booknotes   # Manage notes for reading\n            cmd         # Manage command scripts\n            collab      # Application collaborator\n            data        # Database scripting\n            doc         # Manage project documents\n            hourly      # Hourly command for maintence\n            hours       # Hours of invested time\n            log         # Manage logs\n            page        # Page Master app\n            plan        # Planning Script\n            ops         # Operations script\n            project     # Projects for clients\n            robot       # Web Robot using Selenium to fetch web pages\n            seamanslog  # Seaman's Log blog\n            spiritual   # Spiritual Things subscriber list\n            software    # Work with software training materials\n            src         # Manage source code\n            staging     # Manage server at Digital Ocean\n            task        # Task Master\n            thot        # Thot recorder\n            todo        # To do list command\n            tool        # Manage django tool scripts\n            tst         # Run tests with expected results\n            web         # Web pages\n            wordpress   # Work with wordpress server at Digital Ocean\n\n        Example: x staging ip\n                 x doc list\n                 x tst run\n        \n
43	system-pip	Package              Version\n-------------------- -------\nacme                 0.4.1  \nchardet              2.3.0  \nConfigArgParse       0.10.0 \nconfigobj            5.0.6  \ncryptography         1.2.3  \nDjango               1.11   \ndjrill               2.1.0  \ndocopt               0.4.0  \nenum34               1.1.2  \nfuncsigs             0.4    \ngevent               1.1.0  \ngreenlet             0.4.9  \ngunicorn             19.4.5 \nidna                 2.0    \nipaddress            1.0.16 \nletsencrypt          0.4.1  \nmandrill             1.0.57 \nmock                 1.3.0  \nndg-httpsclient      0.4.0  \nnetifaces            0.10.4 \nparsedatetime        1.4    \npbr                  1.8.0  \npip                  18.1   \npsutil               3.4.2  \npsycopg2             2.6.1  \npyasn1               0.1.9  \nPyICU                1.9.2  \npyOpenSSL            0.15.1 \npyRFC3339            1.0    \npython-http-client   2.2.1  \npython2-pythondialog 3.3.0  \npytz                 2014.10\nrequests             2.13.0 \nselenium             3.4.1  \nsendgrid             4.2.0  \nsetuptools           20.7.0 \nsix                  1.10.0 \nSouth                1.0    \nsqlparse             0.1.18 \nstripe               1.51.0 \nurllib3              1.24.1 \nvirtualenv           15.0.1 \nwheel                0.29.0 \nzope.component       4.2.2  \nzope.event           4.2.0  \nzope.hookable        4.0.4  \nzope.interface       4.1.3  \n	Package              Version\n-------------------- -------\nacme                 0.4.1  \nchardet              2.3.0  \nConfigArgParse       0.10.0 \nconfigobj            5.0.6  \ncryptography         1.2.3  \nDjango               1.11   \ndjrill               2.1.0  \ndocopt               0.4.0  \nenum34               1.1.2  \nfuncsigs             0.4    \ngevent               1.1.0  \ngreenlet             0.4.9  \ngunicorn             19.4.5 \nidna                 2.0    \nipaddress            1.0.16 \nletsencrypt          0.4.1  \nmandrill             1.0.57 \nmock                 1.3.0  \nndg-httpsclient      0.4.0  \nnetifaces            0.10.4 \nparsedatetime        1.4    \npbr                  1.8.0  \npip                  18.1   \npsutil               3.4.2  \npsycopg2             2.6.1  \npyasn1               0.1.9  \nPyICU                1.9.2  \npyOpenSSL            0.15.1 \npyRFC3339            1.0    \npython-http-client   2.2.1  \npython2-pythondialog 3.3.0  \npytz                 2014.10\nrequests             2.13.0 \nselenium             3.4.1  \nsendgrid             4.2.0  \nsetuptools           20.7.0 \nsix                  1.10.0 \nSouth                1.0    \nsqlparse             0.1.18 \nstripe               1.51.0 \nurllib3              1.24.1 \nvirtualenv           15.0.1 \nwheel                0.29.0 \nzope.component       4.2.2  \nzope.event           4.2.0  \nzope.hookable        4.0.4  \nzope.interface       4.1.3  \n
140	mybook-menu-aspire	('/aspire/', 'zmdi-home', 'Home', 'class=active')\n('/aspire/Work', 'zmdi-storage', 'Work', None)\n('/aspire/Grow', 'zmdi-accounts-alt', 'Grow', None)\n('/aspire/People', 'zmdi-comment-text-alt', 'People', None)\n('/aspire/Fun', 'zmdi-assignment-account', 'Fun', None)\n('/task/time/8', 'zmdi-time', 'Time', None)	('/aspire/', 'zmdi-home', 'Home', 'class=active')\n('/aspire/Work', 'zmdi-storage', 'Work', None)\n('/aspire/Grow', 'zmdi-accounts-alt', 'Grow', None)\n('/aspire/People', 'zmdi-comment-text-alt', 'People', None)\n('/aspire/Fun', 'zmdi-assignment-account', 'Fun', None)\n('/task/time/8', 'zmdi-time', 'Time', None)
54	health-score	no output	no output
63	ops-help	no output	no output
55	music-list	shell(x music tracks) --> 3 lines (should be between 1000 and 1600)	shell(x music tracks) --> 3 lines (should be between 1000 and 1600)
58	life-index	shell(x life show Index) --> 58 lines (should be between 60 and 70)	shell(x life show Index) --> 58 lines (should be between 60 and 70)
59	life-list	life list\nPeople\nLife\nIndex\nGrowth\nWork\nExperience\nContents\n	life list\nPeople\nLife\nIndex\nGrowth\nWork\nExperience\nContents\n
60	life-show	no output	no output
57	node-self	shell(x node test) --> 26 lines (should be between 36 and 56)	shell(x node test) --> 26 lines (should be between 36 and 56)
62	reuse-show	no output	no output
70	hours-show	Error:  File not found /home/django/MyBook/Documents/info/days/2016-08\n	Error:  File not found /home/django/MyBook/Documents/info/days/2016-08\n
81	task-import	shell(x task import) --> 1 lines (should be between 10 and 800)	shell(x task import) --> 1 lines (should be between 10 and 800)
87	datatype-show	shell(x datatype show) --> 42 lines (should be between 2200 and 2500)	shell(x datatype show) --> 42 lines (should be between 2200 and 2500)
97	cmd-list	cmd.py\nbook.py\nuser.py\nswitches.py\nweb.py\nbooknotes.py\ndays.py\nfaceblog.py\nguide.py\nsrc.py\nvc.py\nhours.py\ntext.py\nshell.py\nlog.py\nresize.py\ndatatype.py\ndata.py\npage_tests.py\nfiles.py\ntool.py\nremote_tests.py\nntsh.py\nlife.py\nscore.py\naspire.py\ndoc.py\nhourly.py\ntodo.py\napp.py\nspiritual.py\nx.py\nn.py\narchive.py\ni.py\nmusic.py\npandoc.py\nops.py\nseamanslog.py\nwordpress.py\n	cmd.py\nbook.py\nuser.py\nswitches.py\nweb.py\nbooknotes.py\ndays.py\nfaceblog.py\nguide.py\nsrc.py\nvc.py\nhours.py\ntext.py\nshell.py\nlog.py\nresize.py\ndatatype.py\ndata.py\npage_tests.py\nfiles.py\ntool.py\nremote_tests.py\nntsh.py\nlife.py\nscore.py\naspire.py\ndoc.py\nhourly.py\ntodo.py\napp.py\nspiritual.py\nx.py\nn.py\narchive.py\ni.py\nmusic.py\npandoc.py\nops.py\nseamanslog.py\nwordpress.py\n
77	data-migrate	Test is DISABLED	Test is DISABLED
78	data-save	Test is DISABLED	Test is DISABLED
98	cmd-show	no output	no output
79	data-tables	Test is DISABLED	Test is DISABLED
89	doc-help	no output	no output
92	doc-search	no output	no output
96	doc	no output	no output
167	text-grep	### fix\n#### list of known problems\n#### issue tracking\n### test\n#### test inventory\n#### tests needed\n### extend\n### improve	### fix\n#### list of known problems\n#### issue tracking\n### test\n#### test inventory\n#### tests needed\n### extend\n### improve
5	text-help	\n        text Command\n\n        usage: x text COMMAND\n\n        COMMAND:\n\n            match - show lines that match\n            no_match - show lines that don't match\n            replace - replace lines\n            select - pattern matching in doc\n\n        \n	\n        text Command\n\n        usage: x text COMMAND\n\n        COMMAND:\n\n            match - show lines that match\n            no_match - show lines that don't match\n            replace - replace lines\n            select - pattern matching in doc\n\n        \n
73	user-list	no output	no output
101	days-show	no output	no output
138	thot-list	Work_Modes: 54 Lines, Root: 0\nthots: 1 Lines, Root: 0\nBuilding_Software: 154 Lines, Root: 499\nThot_Recorder: 35 Lines, Root: 631\nAdvisor: 4 Lines, Root: 0\nJournal: 2 Lines, Root: 0\nCreativity: 31 Lines, Root: 1527\nWho2Hire: 130 Lines, Root: 2090\nToDo: 93 Lines, Root: 3666\nApp_Design: 157 Lines, Root: 3682\nBio_Hammer: 173 Lines, Root: 3764\nGoals: 621 Lines, Root: 3892\n	Work_Modes: 54 Lines, Root: 0\nthots: 1 Lines, Root: 0\nBuilding_Software: 154 Lines, Root: 499\nThot_Recorder: 35 Lines, Root: 631\nAdvisor: 4 Lines, Root: 0\nJournal: 2 Lines, Root: 0\nCreativity: 31 Lines, Root: 1527\nWho2Hire: 130 Lines, Root: 2090\nToDo: 93 Lines, Root: 3666\nApp_Design: 157 Lines, Root: 3682\nBio_Hammer: 173 Lines, Root: 3764\nGoals: 621 Lines, Root: 3892\n
93	doc-show	no output	no output
95	doc-summary	no output	no output
68	hours-add	usage: hours add 2017-01\n	usage: hours add 2017-01\n
90	doc-html	no output	no output
72	hours-work	Date       WAM      Sign     Teach    Business Tools    Hammer   Hire     Write    Aspire  \n	Date       WAM      Sign     Teach    Business Tools    Hammer   Hire     Write    Aspire  \n
83	task-totals	shell(x task totals) --> 16 lines (should be between 10 and 14)	shell(x task totals) --> 16 lines (should be between 10 and 14)
14	app-list	bin/__init__.py\nbin/app.py\nbin/aspire.py\nbin/book.py\nbin/booknotes.py\nbin/data.py\nbin/datatype.py\nbin/days.py\nbin/diagrams.py\nbin/doc.py\nbin/faceblog.py\nbin/files.py\nbin/grades.py\nbin/guide.py\nbin/hourly.py\nbin/hours.py\nbin/i.py\nbin/life.py\nbin/log.py\nbin/music.py\nbin/n.py\nbin/ntsh.py\nbin/ops.py\nbin/page_tests.py\nbin/pandoc.py\nbin/remote_tests.py\nbin/resize.py\nbin/score.py\nbin/seamanslog.py\nbin/shell.py\nbin/spiritual.py\nbin/src.py\nbin/switches.py\nbin/text.py\nbin/todo.py\nbin/tool.py\nbin/user.py\nbin/vc.py\nbin/web.py\nbin/wordpress.py\nbin/x.py\nhammer/__init__.py\nhammer/secret_settings.py\nhammer/settings.py\nhammer/urls.py\nhammer/wsgi.py\nhealth/__init__.py\nhealth/admin.py\nhealth/apps.py\nhealth/health.py\nhealth/models.py\nhealth/tests.py\nhealth/urls.py\nhealth/views.py\nlife/__init__.py\nlife/admin.py\nlife/apps.py\nlife/life.py\nlife/models.py\nlife/tests.py\nlife/urls.py\nlife/views.py\nmybook/__init__.py\nmybook/admin.py\nmybook/apps.py\nmybook/models.py\nmybook/mybook.py\nmybook/mybook_views.py\nmybook/outline.py\nmybook/task.py\nmybook/tests.py\nmybook/urls.py\nsuperuser/__init__.py\nsuperuser/admin.py\nsuperuser/admin_views.py\nsuperuser/apps.py\nsuperuser/initialize.py\nsuperuser/models.py\nsuperuser/tests.py\nsuperuser/urls.py\ntasks/__init__.py\ntasks/models.py\ntasks/summary.py\ntasks/task.py\ntasks/urls.py\ntasks/views.py\ntest/__init__.py\ntest/app_test.py\ntest/archive_test.py\ntest/aspire_test.py\ntest/booknotes_test.py\ntest/css_test.py\ntest/data_test.py\ntest/doc_test.py\ntest/health_test.py\ntest/hourly_test.py\ntest/i_test.py\ntest/log_test.py\ntest/ops_test.py\ntest/page_test.py\ntest/robot_test.py\ntest/seamanslog_test.py\ntest/system_test.py\ntest/text_test.py\ntest/tst_test.py\ntest/unc_test.py\ntest/user_test.py\ntest/vc_test.py\ntest/wordpress_test.py\ntool/__init__.py\ntool/document.py\ntool/domain.py\ntool/email.py\ntool/log.py\ntool/management/__init__.py\ntool/management/commands/__init__.py\ntool/management/commands/scriptor.py\ntool/models.py\ntool/notify.py\ntool/page.py\ntool/project.py\ntool/robot.py\ntool/tst.py\ntool/urls.py\ntool/user.py\ntool/user_views.py\ntool/xxx.py\ntool/xxx_script.py\ntool/xxx_views.py\nunc/__init__.py\nunc/admin.py\nunc/apps.py\nunc/models.py\nunc/review.py\nunc/sensei.py\nunc/student.py\nunc/tests.py\n	bin/__init__.py\nbin/app.py\nbin/aspire.py\nbin/book.py\nbin/booknotes.py\nbin/data.py\nbin/datatype.py\nbin/days.py\nbin/diagrams.py\nbin/doc.py\nbin/faceblog.py\nbin/files.py\nbin/grades.py\nbin/guide.py\nbin/hourly.py\nbin/hours.py\nbin/i.py\nbin/life.py\nbin/log.py\nbin/music.py\nbin/n.py\nbin/ntsh.py\nbin/ops.py\nbin/page_tests.py\nbin/pandoc.py\nbin/remote_tests.py\nbin/resize.py\nbin/score.py\nbin/seamanslog.py\nbin/shell.py\nbin/spiritual.py\nbin/src.py\nbin/switches.py\nbin/text.py\nbin/todo.py\nbin/tool.py\nbin/user.py\nbin/vc.py\nbin/web.py\nbin/wordpress.py\nbin/x.py\nhammer/__init__.py\nhammer/secret_settings.py\nhammer/settings.py\nhammer/urls.py\nhammer/wsgi.py\nhealth/__init__.py\nhealth/admin.py\nhealth/apps.py\nhealth/health.py\nhealth/models.py\nhealth/tests.py\nhealth/urls.py\nhealth/views.py\nlife/__init__.py\nlife/admin.py\nlife/apps.py\nlife/life.py\nlife/models.py\nlife/tests.py\nlife/urls.py\nlife/views.py\nmybook/__init__.py\nmybook/admin.py\nmybook/apps.py\nmybook/models.py\nmybook/mybook.py\nmybook/mybook_views.py\nmybook/outline.py\nmybook/task.py\nmybook/tests.py\nmybook/urls.py\nsuperuser/__init__.py\nsuperuser/admin.py\nsuperuser/admin_views.py\nsuperuser/apps.py\nsuperuser/initialize.py\nsuperuser/models.py\nsuperuser/tests.py\nsuperuser/urls.py\ntasks/__init__.py\ntasks/models.py\ntasks/summary.py\ntasks/task.py\ntasks/urls.py\ntasks/views.py\ntest/__init__.py\ntest/app_test.py\ntest/archive_test.py\ntest/aspire_test.py\ntest/booknotes_test.py\ntest/css_test.py\ntest/data_test.py\ntest/doc_test.py\ntest/health_test.py\ntest/hourly_test.py\ntest/i_test.py\ntest/log_test.py\ntest/ops_test.py\ntest/page_test.py\ntest/robot_test.py\ntest/seamanslog_test.py\ntest/system_test.py\ntest/text_test.py\ntest/tst_test.py\ntest/unc_test.py\ntest/user_test.py\ntest/vc_test.py\ntest/wordpress_test.py\ntool/__init__.py\ntool/document.py\ntool/domain.py\ntool/email.py\ntool/log.py\ntool/management/__init__.py\ntool/management/commands/__init__.py\ntool/management/commands/scriptor.py\ntool/models.py\ntool/notify.py\ntool/page.py\ntool/project.py\ntool/robot.py\ntool/tst.py\ntool/urls.py\ntool/user.py\ntool/user_views.py\ntool/xxx.py\ntool/xxx_script.py\ntool/xxx_views.py\nunc/__init__.py\nunc/admin.py\nunc/apps.py\nunc/models.py\nunc/review.py\nunc/sensei.py\nunc/student.py\nunc/tests.py\n
76	data-files	no output	no output
71	hours-summary	\n\nTime:  2016-08, 2016-09, 2016-10, 2016-11, 2017-01\n\nActivity                Hours   Percent     Ideal   Diff\n\n	\n\nTime:  2016-08, 2016-09, 2016-10, 2016-11, 2017-01\n\nActivity                Hours   Percent     Ideal   Diff\n\n
7	text-match	shell(x text match def mybook/mybook_views.py) --> 2 lines (should be between 12 and 15)	shell(x text match def mybook/mybook_views.py) --> 2 lines (should be between 12 and 15)
176	doc-render	Not your time 7:00	Not your time 9:00
164	i-list	Ideas for Today (brainstorm --> actions)\n\n-----------------------------------------\n\nWork\n\n    Plan\n        gather work in progress\n        use GTD\n        1000 goals\n        \n    Build\n        update Django and Python libraries\n        establish new standard programming context\n        limit log file\n        test private notes \n        create pycharm project for Rest\n        optimize ideas script\n\n    Learn\n        create Writers Notebook\n        continue life story\n        Organize evernotes\n\n    Teach\n        create classroom for BACS 200\n        student registration\n        Select notes for writing topics\n        Seamans Guide to Python Apps\n\nPeople\n\n    follow up\n        Greg Brake\n        Chris Newby\n        Moe, Mehrgan\n\n    Church\n        application notes - thoughts on humility\n        perfectionism\n        overcoming negative feelings\n            turning on the light\n            receiving grace\n            Fear, Anger, Sadness, Shame\n        trust is confidence in character, competence, and compassion\n\nFun\n\n    capture regular TV series to watch\n    vinyl records\n\nGrow\n\n    prayer time\n    organize brain notes\n    think about emotional development\n    establish writing habit\n    analyze finances 2014-2018\n\n\n	Ideas for Today (brainstorm --> actions)\n\n-----------------------------------------\n\nWork\n\n    Plan\n        gather work in progress\n        use GTD\n        1000 goals\n        \n    Build\n        update Django and Python libraries\n        establish new standard programming context\n        limit log file\n        test private notes \n        create pycharm project for Rest\n        optimize ideas script\n\n    Learn\n        create Writers Notebook\n        continue life story\n        Organize evernotes\n\n    Teach\n        create classroom for BACS 200\n        student registration\n        Select notes for writing topics\n        Seamans Guide to Python Apps\n\nPeople\n\n    follow up\n        Greg Brake\n        Chris Newby\n        Moe, Mehrgan\n\n    Church\n        application notes - thoughts on humility\n        perfectionism\n        overcoming negative feelings\n            turning on the light\n            receiving grace\n            Fear, Anger, Sadness, Shame\n        trust is confidence in character, competence, and compassion\n\nFun\n\n    capture regular TV series to watch\n    vinyl records\n\nGrow\n\n    prayer time\n    organize brain notes\n    think about emotional development\n    establish writing habit\n    analyze finances 2014-2018\n\n\n
80	src-list	/home/django/MyBook/manage.py\n/home/django/MyBook/__init__.py\n/home/django/MyBook/mybook/book.py\n/home/django/MyBook/mybook/book_views.py\n/home/django/MyBook/mybook/admin.py\n/home/django/MyBook/mybook/models.py\n/home/django/MyBook/mybook/urls.py\n/home/django/MyBook/mybook/task.py\n/home/django/MyBook/mybook/author.py\n/home/django/MyBook/mybook/mybook.py\n/home/django/MyBook/mybook/__init__.py\n/home/django/MyBook/mybook/info.py\n/home/django/MyBook/mybook/author_views.py\n/home/django/MyBook/mybook/outline.py\n/home/django/MyBook/mybook/tests.py\n/home/django/MyBook/mybook/mybook_views.py\n/home/django/MyBook/mybook/apps.py\n/home/django/MyBook/mybook/chapter.py\n/home/django/MyBook/config/x.py\n/home/django/MyBook/test/mybook_test.py\n/home/django/MyBook/test/seamanslog_test.py\n/home/django/MyBook/test/text_test.py\n/home/django/MyBook/test/doc_test.py\n/home/django/MyBook/test/days_test.py\n/home/django/MyBook/test/tst_test.py\n/home/django/MyBook/test/user_test.py\n/home/django/MyBook/test/ops_test.py\n/home/django/MyBook/test/health_test.py\n/home/django/MyBook/test/src_test.py\n/home/django/MyBook/test/archive_test.py\n/home/django/MyBook/test/cmd_test.py\n/home/django/MyBook/test/page_test.py\n/home/django/MyBook/test/node_test.py\n/home/django/MyBook/test/email_test.py\n/home/django/MyBook/test/system_test.py\n/home/django/MyBook/test/booknotes_test.py\n/home/django/MyBook/test/wordpress_test.py\n/home/django/MyBook/test/unc_test.py\n/home/django/MyBook/test/vc_test.py\n/home/django/MyBook/test/i_test.py\n/home/django/MyBook/test/app_test.py\n/home/django/MyBook/test/music_test.py\n/home/django/MyBook/test/robot_test.py\n/home/django/MyBook/test/css_test.py\n/home/django/MyBook/test/data_test.py\n/home/django/MyBook/test/datatype_test.py\n/home/django/MyBook/test/hourly_test.py\n/home/django/MyBook/test/__init__.py\n/home/django/MyBook/test/aspire_test.py\n/home/django/MyBook/tool/user.py\n/home/django/MyBook/tool/document.py\n/home/django/MyBook/tool/user_views.py\n/home/django/MyBook/tool/robot.py\n/home/django/MyBook/tool/models.py\n/home/django/MyBook/tool/urls.py\n/home/django/MyBook/tool/xxx_script.py\n/home/django/MyBook/tool/log.py\n/home/django/MyBook/tool/project.py\n/home/django/MyBook/tool/email.py\n/home/django/MyBook/tool/domain.py\n/home/django/MyBook/tool/notify.py\n/home/django/MyBook/tool/page.py\n/home/django/MyBook/tool/tst.py\n/home/django/MyBook/tool/__init__.py\n/home/django/MyBook/tool/xxx_views.py\n/home/django/MyBook/tool/xxx.py\n/home/django/MyBook/tool/management/__init__.py\n/home/django/MyBook/tool/management/commands/scriptor.py\n/home/django/MyBook/tool/management/commands/__init__.py\n/home/django/MyBook/hammer/urls.py\n/home/django/MyBook/hammer/settings.py\n/home/django/MyBook/hammer/__init__.py\n/home/django/MyBook/hammer/wsgi.py\n/home/django/MyBook/hammer/secret_settings.py\n/home/django/MyBook/aspire/goal_views.py\n/home/django/MyBook/aspire/project_views.py\n/home/django/MyBook/aspire/client.py\n/home/django/MyBook/aspire/admin.py\n/home/django/MyBook/aspire/models.py\n/home/django/MyBook/aspire/node.py\n/home/django/MyBook/aspire/node_views.py\n/home/django/MyBook/aspire/urls.py\n/home/django/MyBook/aspire/project.py\n/home/django/MyBook/aspire/role_views.py\n/home/django/MyBook/aspire/role.py\n/home/django/MyBook/aspire/aspire.py\n/home/django/MyBook/aspire/client_views.py\n/home/django/MyBook/aspire/doc.py\n/home/django/MyBook/aspire/__init__.py\n/home/django/MyBook/aspire/advisor_views.py\n/home/django/MyBook/aspire/tests.py\n/home/django/MyBook/aspire/apps.py\n/home/django/MyBook/aspire/goal.py\n/home/django/MyBook/aspire/views.py\n/home/django/MyBook/bin/cmd.py\n/home/django/MyBook/bin/book.py\n/home/django/MyBook/bin/user.py\n/home/django/MyBook/bin/switches.py\n/home/django/MyBook/bin/web.py\n/home/django/MyBook/bin/booknotes.py\n/home/django/MyBook/bin/days.py\n/home/django/MyBook/bin/faceblog.py\n/home/django/MyBook/bin/guide.py\n/home/django/MyBook/bin/src.py\n/home/django/MyBook/bin/vc.py\n/home/django/MyBook/bin/hours.py\n/home/django/MyBook/bin/text.py\n/home/django/MyBook/bin/shell.py\n/home/django/MyBook/bin/log.py\n/home/django/MyBook/bin/resize.py\n/home/django/MyBook/bin/datatype.py\n/home/django/MyBook/bin/data.py\n/home/django/MyBook/bin/page_tests.py\n/home/django/MyBook/bin/files.py\n/home/django/MyBook/bin/tool.py\n/home/django/MyBook/bin/remote_tests.py\n/home/django/MyBook/bin/ntsh.py\n/home/django/MyBook/bin/life.py\n/home/django/MyBook/bin/score.py\n/home/django/MyBook/bin/aspire.py\n/home/django/MyBook/bin/doc.py\n/home/django/MyBook/bin/hourly.py\n/home/django/MyBook/bin/todo.py\n/home/django/MyBook/bin/app.py\n/home/django/MyBook/bin/spiritual.py\n/home/django/MyBook/bin/x.py\n/home/django/MyBook/bin/n.py\n/home/django/MyBook/bin/__init__.py\n/home/django/MyBook/bin/archive.py\n/home/django/MyBook/bin/i.py\n/home/django/MyBook/bin/music.py\n/home/django/MyBook/bin/pandoc.py\n/home/django/MyBook/bin/ops.py\n/home/django/MyBook/bin/seamanslog.py\n/home/django/MyBook/bin/wordpress.py\n/home/django/MyBook/sensei/admin.py\n/home/django/MyBook/sensei/models.py\n/home/django/MyBook/sensei/__init__.py\n/home/django/MyBook/sensei/tests.py\n/home/django/MyBook/sensei/apps.py\n/home/django/MyBook/sensei/views.py\n/home/django/MyBook/unc/admin.py\n/home/django/MyBook/unc/review.py\n/home/django/MyBook/unc/models.py\n/home/django/MyBook/unc/sensei.py\n/home/django/MyBook/unc/urls.py\n/home/django/MyBook/unc/__init__.py\n/home/django/MyBook/unc/tests.py\n/home/django/MyBook/unc/apps.py\n/home/django/MyBook/unc/views.py\n/home/django/MyBook/life/admin.py\n/home/django/MyBook/life/models.py\n/home/django/MyBook/life/urls.py\n/home/django/MyBook/life/life.py\n/home/django/MyBook/life/__init__.py\n/home/django/MyBook/life/tests.py\n/home/django/MyBook/life/apps.py\n/home/django/MyBook/life/views.py\n/home/django/MyBook/health/health.py\n/home/django/MyBook/health/admin.py\n/home/django/MyBook/health/models.py\n/home/django/MyBook/health/urls.py\n/home/django/MyBook/health/__init__.py\n/home/django/MyBook/health/tests.py\n/home/django/MyBook/health/apps.py\n/home/django/MyBook/health/views.py\n/home/django/MyBook/superuser/admin.py\n/home/django/MyBook/superuser/models.py\n/home/django/MyBook/superuser/urls.py\n/home/django/MyBook/superuser/initialize.py\n/home/django/MyBook/superuser/admin_views.py\n/home/django/MyBook/superuser/__init__.py\n/home/django/MyBook/superuser/tests.py\n/home/django/MyBook/superuser/apps.py\n/home/django/MyBook/tasks/models.py\n/home/django/MyBook/tasks/urls.py\n/home/django/MyBook/tasks/task.py\n/home/django/MyBook/tasks/summary.py\n/home/django/MyBook/tasks/__init__.py\n/home/django/MyBook/tasks/views.py\n/home/django/MyBook/guide/urls.py\n/home/django/MyBook/guide/__init__.py\n/home/django/MyBook/guide/views.py\n	/home/django/MyBook/manage.py\n/home/django/MyBook/__init__.py\n/home/django/MyBook/mybook/book.py\n/home/django/MyBook/mybook/book_views.py\n/home/django/MyBook/mybook/admin.py\n/home/django/MyBook/mybook/models.py\n/home/django/MyBook/mybook/urls.py\n/home/django/MyBook/mybook/task.py\n/home/django/MyBook/mybook/author.py\n/home/django/MyBook/mybook/mybook.py\n/home/django/MyBook/mybook/__init__.py\n/home/django/MyBook/mybook/info.py\n/home/django/MyBook/mybook/author_views.py\n/home/django/MyBook/mybook/outline.py\n/home/django/MyBook/mybook/tests.py\n/home/django/MyBook/mybook/mybook_views.py\n/home/django/MyBook/mybook/apps.py\n/home/django/MyBook/mybook/chapter.py\n/home/django/MyBook/config/x.py\n/home/django/MyBook/test/mybook_test.py\n/home/django/MyBook/test/seamanslog_test.py\n/home/django/MyBook/test/text_test.py\n/home/django/MyBook/test/doc_test.py\n/home/django/MyBook/test/days_test.py\n/home/django/MyBook/test/tst_test.py\n/home/django/MyBook/test/user_test.py\n/home/django/MyBook/test/ops_test.py\n/home/django/MyBook/test/health_test.py\n/home/django/MyBook/test/src_test.py\n/home/django/MyBook/test/archive_test.py\n/home/django/MyBook/test/cmd_test.py\n/home/django/MyBook/test/page_test.py\n/home/django/MyBook/test/node_test.py\n/home/django/MyBook/test/email_test.py\n/home/django/MyBook/test/system_test.py\n/home/django/MyBook/test/booknotes_test.py\n/home/django/MyBook/test/wordpress_test.py\n/home/django/MyBook/test/unc_test.py\n/home/django/MyBook/test/vc_test.py\n/home/django/MyBook/test/i_test.py\n/home/django/MyBook/test/app_test.py\n/home/django/MyBook/test/music_test.py\n/home/django/MyBook/test/robot_test.py\n/home/django/MyBook/test/css_test.py\n/home/django/MyBook/test/data_test.py\n/home/django/MyBook/test/datatype_test.py\n/home/django/MyBook/test/hourly_test.py\n/home/django/MyBook/test/__init__.py\n/home/django/MyBook/test/aspire_test.py\n/home/django/MyBook/tool/user.py\n/home/django/MyBook/tool/document.py\n/home/django/MyBook/tool/user_views.py\n/home/django/MyBook/tool/robot.py\n/home/django/MyBook/tool/models.py\n/home/django/MyBook/tool/urls.py\n/home/django/MyBook/tool/xxx_script.py\n/home/django/MyBook/tool/log.py\n/home/django/MyBook/tool/project.py\n/home/django/MyBook/tool/email.py\n/home/django/MyBook/tool/domain.py\n/home/django/MyBook/tool/notify.py\n/home/django/MyBook/tool/page.py\n/home/django/MyBook/tool/tst.py\n/home/django/MyBook/tool/__init__.py\n/home/django/MyBook/tool/xxx_views.py\n/home/django/MyBook/tool/xxx.py\n/home/django/MyBook/tool/management/__init__.py\n/home/django/MyBook/tool/management/commands/scriptor.py\n/home/django/MyBook/tool/management/commands/__init__.py\n/home/django/MyBook/hammer/urls.py\n/home/django/MyBook/hammer/settings.py\n/home/django/MyBook/hammer/__init__.py\n/home/django/MyBook/hammer/wsgi.py\n/home/django/MyBook/hammer/secret_settings.py\n/home/django/MyBook/aspire/goal_views.py\n/home/django/MyBook/aspire/project_views.py\n/home/django/MyBook/aspire/client.py\n/home/django/MyBook/aspire/admin.py\n/home/django/MyBook/aspire/models.py\n/home/django/MyBook/aspire/node.py\n/home/django/MyBook/aspire/node_views.py\n/home/django/MyBook/aspire/urls.py\n/home/django/MyBook/aspire/project.py\n/home/django/MyBook/aspire/role_views.py\n/home/django/MyBook/aspire/role.py\n/home/django/MyBook/aspire/aspire.py\n/home/django/MyBook/aspire/client_views.py\n/home/django/MyBook/aspire/doc.py\n/home/django/MyBook/aspire/__init__.py\n/home/django/MyBook/aspire/advisor_views.py\n/home/django/MyBook/aspire/tests.py\n/home/django/MyBook/aspire/apps.py\n/home/django/MyBook/aspire/goal.py\n/home/django/MyBook/aspire/views.py\n/home/django/MyBook/bin/cmd.py\n/home/django/MyBook/bin/book.py\n/home/django/MyBook/bin/user.py\n/home/django/MyBook/bin/switches.py\n/home/django/MyBook/bin/web.py\n/home/django/MyBook/bin/booknotes.py\n/home/django/MyBook/bin/days.py\n/home/django/MyBook/bin/faceblog.py\n/home/django/MyBook/bin/guide.py\n/home/django/MyBook/bin/src.py\n/home/django/MyBook/bin/vc.py\n/home/django/MyBook/bin/hours.py\n/home/django/MyBook/bin/text.py\n/home/django/MyBook/bin/shell.py\n/home/django/MyBook/bin/log.py\n/home/django/MyBook/bin/resize.py\n/home/django/MyBook/bin/datatype.py\n/home/django/MyBook/bin/data.py\n/home/django/MyBook/bin/page_tests.py\n/home/django/MyBook/bin/files.py\n/home/django/MyBook/bin/tool.py\n/home/django/MyBook/bin/remote_tests.py\n/home/django/MyBook/bin/ntsh.py\n/home/django/MyBook/bin/life.py\n/home/django/MyBook/bin/score.py\n/home/django/MyBook/bin/aspire.py\n/home/django/MyBook/bin/doc.py\n/home/django/MyBook/bin/hourly.py\n/home/django/MyBook/bin/todo.py\n/home/django/MyBook/bin/app.py\n/home/django/MyBook/bin/spiritual.py\n/home/django/MyBook/bin/x.py\n/home/django/MyBook/bin/n.py\n/home/django/MyBook/bin/__init__.py\n/home/django/MyBook/bin/archive.py\n/home/django/MyBook/bin/i.py\n/home/django/MyBook/bin/music.py\n/home/django/MyBook/bin/pandoc.py\n/home/django/MyBook/bin/ops.py\n/home/django/MyBook/bin/seamanslog.py\n/home/django/MyBook/bin/wordpress.py\n/home/django/MyBook/sensei/admin.py\n/home/django/MyBook/sensei/models.py\n/home/django/MyBook/sensei/__init__.py\n/home/django/MyBook/sensei/tests.py\n/home/django/MyBook/sensei/apps.py\n/home/django/MyBook/sensei/views.py\n/home/django/MyBook/unc/admin.py\n/home/django/MyBook/unc/review.py\n/home/django/MyBook/unc/models.py\n/home/django/MyBook/unc/sensei.py\n/home/django/MyBook/unc/urls.py\n/home/django/MyBook/unc/__init__.py\n/home/django/MyBook/unc/tests.py\n/home/django/MyBook/unc/apps.py\n/home/django/MyBook/unc/views.py\n/home/django/MyBook/life/admin.py\n/home/django/MyBook/life/models.py\n/home/django/MyBook/life/urls.py\n/home/django/MyBook/life/life.py\n/home/django/MyBook/life/__init__.py\n/home/django/MyBook/life/tests.py\n/home/django/MyBook/life/apps.py\n/home/django/MyBook/life/views.py\n/home/django/MyBook/health/health.py\n/home/django/MyBook/health/admin.py\n/home/django/MyBook/health/models.py\n/home/django/MyBook/health/urls.py\n/home/django/MyBook/health/__init__.py\n/home/django/MyBook/health/tests.py\n/home/django/MyBook/health/apps.py\n/home/django/MyBook/health/views.py\n/home/django/MyBook/superuser/admin.py\n/home/django/MyBook/superuser/models.py\n/home/django/MyBook/superuser/urls.py\n/home/django/MyBook/superuser/initialize.py\n/home/django/MyBook/superuser/admin_views.py\n/home/django/MyBook/superuser/__init__.py\n/home/django/MyBook/superuser/tests.py\n/home/django/MyBook/superuser/apps.py\n/home/django/MyBook/tasks/models.py\n/home/django/MyBook/tasks/urls.py\n/home/django/MyBook/tasks/task.py\n/home/django/MyBook/tasks/summary.py\n/home/django/MyBook/tasks/__init__.py\n/home/django/MyBook/tasks/views.py\n/home/django/MyBook/guide/urls.py\n/home/django/MyBook/guide/__init__.py\n/home/django/MyBook/guide/views.py\n
114	page-diff	no output	no output
4	text-functions	text_command\ntext_help\nfind_agents\nfind_anchors\nfind_classes\nfind_functions\nfind_links\nfind_quotes\nfind_signatures\nfind_urls\nmarkdown_list_links\nmarkdown_list_string\ntext_join\ntext_lines\ntext_match\ntext_no_match\ntext_outline\ntext_outline_string\ntext_markdown\ntext_replace\ntext_title\ntext_body\nmatch_lines\nmatch_pattern\ntransform_matches	text_command\ntext_help\nfind_agents\nfind_anchors\nfind_classes\nfind_functions\nfind_links\nfind_quotes\nfind_signatures\nfind_urls\nmarkdown_list_links\nmarkdown_list_string\ntext_join\ntext_lines\ntext_match\ntext_no_match\ntext_outline\ntext_outline_string\ntext_markdown\ntext_replace\ntext_title\ntext_body\nmatch_lines\nmatch_pattern\ntransform_matches
104	project-list	project list\n	project list\n
106	budget-list	shell(x budget list) --> 121 lines (should be between 120 and 120)	shell(x budget list) --> 121 lines (should be between 120 and 120)
108	budget-total	budget total\nCategory           Total\n\nWork                 139\nGrow                  59\nPeople                89\nChurch                60\nFun                   69\n	budget total\nCategory           Total\n\nWork                 139\nGrow                  59\nPeople                89\nChurch                60\nFun                   69\n
109	aspire-list	shell(x aspire list) --> 42 lines (should be between 250 and 500)	shell(x aspire list) --> 42 lines (should be between 250 and 500)
110	aspire-report	shell(x aspire report) --> 42 lines (should be between 2 and 2)	shell(x aspire report) --> 42 lines (should be between 2 and 2)
112	aspire-show	shell(x aspire show) --> 42 lines (should be between 10 and 20)	shell(x aspire show) --> 42 lines (should be between 10 and 20)
113	aspire-week	shell(x aspire week) --> 42 lines (should be between 15 and 21)	shell(x aspire week) --> 42 lines (should be between 15 and 21)
111	aspire-score	*                   Docs  Words\n* MyBook              23   2074\n* Aspire              27   7812\n* Software            14   2143\n* role                 4     61\n* Life                 3    514\n* Report             193  38194\n* Hire                15   4676\n* Write               34  10278\n* Fun                  3     70\n* Church               8   1630\n* Grow                10    596\n*   Total            334  68048\n	*                   Docs  Words\n* MyBook              23   2074\n* Aspire              27   7812\n* Software            14   2143\n* role                 4     61\n* Life                 3    514\n* Report             193  38194\n* Hire                15   4676\n* Write               34  10278\n* Fun                  3     70\n* Church               8   1630\n* Grow                10    596\n*   Total            334  68048\n
117	software-list	Software list\nMenu\nIndex\nBestPractice/Management\nBestPractice/DevelopmentGoals\nBestPractice/RemainingTasks\nBestPractice/Guarantee\nBestPractice/Process\nBestPractice/FutureTasks\nBestPractice/Payment\nBestPractice/Assessment\nBestPractice/Technology\nBestPractice/Commitment\nBestPractice/EstimatingProjects\nBestPractice/Issues\nBestPractice/Clients\nBestPractice/People\nBestPractice/ReleaseChecklist\nBestPractice/BudgetHours\nBestPractice/Planning\nBestPractice/Engineering\nBestPractice/Productivity\nBestPractice/UserStories\nBestPractice/Index\nBestPractice/Contract\nBestPractice/Risk\nBestPractice/Views\nBestPractice/Experience\nBestPractice/Principles\nBestPractice/Tasks\nBestPractice/DataType\nBestPractice/EngineeringServices\nBestPractice/Proposal\nLeverage/Debt\nLeverage/Part3\nLeverage/Services\nLeverage/Deployment\nLeverage/AppendixC\nLeverage/Menu\nLeverage/Code\nLeverage/Monitoring\nLeverage/Technology\nLeverage/Learning\nLeverage/Knowledge\nLeverage/Part1\nLeverage/Planning\nLeverage/Part2\nLeverage/Part4\nLeverage/Test\nLeverage/Leverage\nLeverage/Preface\nLeverage/Cover\nLeverage/Release\nLeverage/Practices\nLeverage/Index\nLeverage/StartReading\nLeverage/AppendixB\nLeverage/Design\nLeverage/Teamwork\nLeverage/FrontMatter\nLeverage/ApplyingLeverage\nLeverage/Author\nLeverage/AppendixA\nLeverage/Proposal\nLeverage/Chapters\nClient/Today\nClient/Hire-ToDo\nClient/2016-10\nClient/Hire-Done\n	Software list\nMenu\nIndex\nBestPractice/Management\nBestPractice/DevelopmentGoals\nBestPractice/RemainingTasks\nBestPractice/Guarantee\nBestPractice/Process\nBestPractice/FutureTasks\nBestPractice/Payment\nBestPractice/Assessment\nBestPractice/Technology\nBestPractice/Commitment\nBestPractice/EstimatingProjects\nBestPractice/Issues\nBestPractice/Clients\nBestPractice/People\nBestPractice/ReleaseChecklist\nBestPractice/BudgetHours\nBestPractice/Planning\nBestPractice/Engineering\nBestPractice/Productivity\nBestPractice/UserStories\nBestPractice/Index\nBestPractice/Contract\nBestPractice/Risk\nBestPractice/Views\nBestPractice/Experience\nBestPractice/Principles\nBestPractice/Tasks\nBestPractice/DataType\nBestPractice/EngineeringServices\nBestPractice/Proposal\nLeverage/Debt\nLeverage/Part3\nLeverage/Services\nLeverage/Deployment\nLeverage/AppendixC\nLeverage/Menu\nLeverage/Code\nLeverage/Monitoring\nLeverage/Technology\nLeverage/Learning\nLeverage/Knowledge\nLeverage/Part1\nLeverage/Planning\nLeverage/Part2\nLeverage/Part4\nLeverage/Test\nLeverage/Leverage\nLeverage/Preface\nLeverage/Cover\nLeverage/Release\nLeverage/Practices\nLeverage/Index\nLeverage/StartReading\nLeverage/AppendixB\nLeverage/Design\nLeverage/Teamwork\nLeverage/FrontMatter\nLeverage/ApplyingLeverage\nLeverage/Author\nLeverage/AppendixA\nLeverage/Proposal\nLeverage/Chapters\nClient/Today\nClient/Hire-ToDo\nClient/2016-10\nClient/Hire-Done\n
66	ops-status	Ops Command - production status\n\n        ops production ['status']\n\n        usage: x ops COMMAND [ARGS]\n\n        COMMAND:\n\n            command - execute a single command on the remote server\n            console - login to production\n            deploy  - push all changes to staging server\n            log     - show the log on the production server\n            restart - restart the web server\n            root    - show the root console\n            update  - push all files to remote server\n\n        \n	Ops Command - production status\n\n        ops production ['status']\n\n        usage: x ops COMMAND [ARGS]\n\n        COMMAND:\n\n            command - execute a single command on the remote server\n            console - login to production\n            deploy  - push all changes to staging server\n            log     - show the log on the production server\n            restart - restart the web server\n            root    - show the root console\n            update  - push all files to remote server\n\n        \n
29	plan-list	plan list\nSiteTitle\nTo_Do_List\nMenu\nBio_Hammer/Index\nAdvisor/A_Better_Life\nAdvisor/Index\nGoals/Aspirations_(100%)\nGoals/Index\nGoals/Work_(40%)\nJournal/My_Future_Life\nJournal/Index\nWho2Hire/Index\nBuilding_Software/Django_templates\nBuilding_Software/Markdown_Formatter\nBuilding_Software/Database_initialization\nBuilding_Software/Code_generators\nBuilding_Software/Canonical_views\nBuilding_Software/Standard_Theme\nBuilding_Software/User_Registration\nBuilding_Software/Database_Migration\nBuilding_Software/Simple_Application\nBuilding_Software/JavaScript\nBuilding_Software/Command_scripts\nBuilding_Software/Index\nBuilding_Software/Material_Theme\nBuilding_Software/Standard_queries\nBuilding_Software/Django_App_Structure\nBuilding_Software/Database_connection\nBuilding_Software/Views\nBuilding_Software/CSS\nBuilding_Software/URLs\nBuilding_Software/Data_Models\nBuilding_Software/Import/Export\nThot_Recorder/Thot_System_Design_Notes\nThot_Recorder/Index\nCreativity/Creativity_Journal\nCreativity/Index\nApp_Design/Index\nApp_Design/Project_Milestones\nApp_Design/Money_App_Design\nWork_Modes/Index\nToDo/To_Do_List\nToDo/Urgent\nToDo/Index\n	plan list\nSiteTitle\nTo_Do_List\nMenu\nBio_Hammer/Index\nAdvisor/A_Better_Life\nAdvisor/Index\nGoals/Aspirations_(100%)\nGoals/Index\nGoals/Work_(40%)\nJournal/My_Future_Life\nJournal/Index\nWho2Hire/Index\nBuilding_Software/Django_templates\nBuilding_Software/Markdown_Formatter\nBuilding_Software/Database_initialization\nBuilding_Software/Code_generators\nBuilding_Software/Canonical_views\nBuilding_Software/Standard_Theme\nBuilding_Software/User_Registration\nBuilding_Software/Database_Migration\nBuilding_Software/Simple_Application\nBuilding_Software/JavaScript\nBuilding_Software/Command_scripts\nBuilding_Software/Index\nBuilding_Software/Material_Theme\nBuilding_Software/Standard_queries\nBuilding_Software/Django_App_Structure\nBuilding_Software/Database_connection\nBuilding_Software/Views\nBuilding_Software/CSS\nBuilding_Software/URLs\nBuilding_Software/Data_Models\nBuilding_Software/Import/Export\nThot_Recorder/Thot_System_Design_Notes\nThot_Recorder/Index\nCreativity/Creativity_Journal\nCreativity/Index\nApp_Design/Index\nApp_Design/Project_Milestones\nApp_Design/Money_App_Design\nWork_Modes/Index\nToDo/To_Do_List\nToDo/Urgent\nToDo/Index\n
116	page-text	shell(x page text all) --> 1 lines (should be between 400 and 1000)	shell(x page text all) --> 1 lines (should be between 400 and 1000)
129	robot-show	shell(x robot show) --> 2 lines (should be between 20 and 30)	shell(x robot show) --> 2 lines (should be between 20 and 30)
130	robot-results	\n	\n
149	mybook-menu	[('/aspire/', 'zmdi-home', 'Home', 'class=active'), ('/aspire/Work', 'zmdi-storage', 'Work', None), ('/aspire/Grow', 'zmdi-accounts-alt', 'Grow', None), ('/aspire/People', 'zmdi-comment-text-alt', 'People', None), ('/aspire/Fun', 'zmdi-assignment-account', 'Fun', None), ('/task/time', 'zmdi-time', 'Time', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]\n[('/guide/Index', 'zmdi-home', "Seaman's Guide", 'class=active'), ('/guide/HtmlApps/Index.md', 'zmdi-cloud-outline', 'HTML Apps', None), ('/guide/PhpApps/Index.md', 'zmdi-comment-outline', 'PHP Apps', None), ('/guide/Teaching/Index.md', 'zmdi-local-library', 'Teaching Tech', None), ('/Leverage', 'zmdi-assignment-account', 'Software Leverage', None)]\n[('/mybook/info', 'zmdi-home', 'Home', None), ('/info/Work', 'zmdi-storage', 'Work', None), ('/info/Grow', 'zmdi-accounts-alt', 'Grow', None), ('/info/People', 'zmdi-comment-text-alt', 'People', None), ('/info/Fun', 'zmdi-assignment-account', 'Fun', None), ('/task/time', 'zmdi-time', 'Time', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]\n[('https://seamanslog.com/seamanslog/Index', 'zmdi-trending-up', "Seaman's Log", None), ('https://seamanslog.com/seamanslog', 'zmdi-local-library', 'Select Topic', None), ('https://MarkSeaman.org', 'zmdi-face', 'Mark Seaman', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]\n[('/spiritual/Home', 'zmdi-home', 'Home', None), ('/spiritual/inspire', 'zmdi-cloud-outline', 'Inspire', None), ('/spiritual/prayers', 'zmdi-comment-outline', 'Pray', None), ('/spiritual/bible', 'zmdi-local-library', 'Meditate', None), ('/spiritual/reflect', 'zmdi-key', 'Reflect', None), ('/spiritual/teaching', 'zmdi-face', 'Learn', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]	[('/aspire/', 'zmdi-home', 'Home', 'class=active'), ('/aspire/Work', 'zmdi-storage', 'Work', None), ('/aspire/Grow', 'zmdi-accounts-alt', 'Grow', None), ('/aspire/People', 'zmdi-comment-text-alt', 'People', None), ('/aspire/Fun', 'zmdi-assignment-account', 'Fun', None), ('/task/time', 'zmdi-time', 'Time', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]\n[('/guide/Index', 'zmdi-home', "Seaman's Guide", 'class=active'), ('/guide/HtmlApps/Index.md', 'zmdi-cloud-outline', 'HTML Apps', None), ('/guide/PhpApps/Index.md', 'zmdi-comment-outline', 'PHP Apps', None), ('/guide/Teaching/Index.md', 'zmdi-local-library', 'Teaching Tech', None), ('/Leverage', 'zmdi-assignment-account', 'Software Leverage', None)]\n[('/mybook/info', 'zmdi-home', 'Home', None), ('/info/Work', 'zmdi-storage', 'Work', None), ('/info/Grow', 'zmdi-accounts-alt', 'Grow', None), ('/info/People', 'zmdi-comment-text-alt', 'People', None), ('/info/Fun', 'zmdi-assignment-account', 'Fun', None), ('/task/time', 'zmdi-time', 'Time', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]\n[('https://seamanslog.com/seamanslog/Index', 'zmdi-trending-up', "Seaman's Log", None), ('https://seamanslog.com/seamanslog', 'zmdi-local-library', 'Select Topic', None), ('https://MarkSeaman.org', 'zmdi-face', 'Mark Seaman', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]\n[('/spiritual/Home', 'zmdi-home', 'Home', None), ('/spiritual/inspire', 'zmdi-cloud-outline', 'Inspire', None), ('/spiritual/prayers', 'zmdi-comment-outline', 'Pray', None), ('/spiritual/bible', 'zmdi-local-library', 'Meditate', None), ('/spiritual/reflect', 'zmdi-key', 'Reflect', None), ('/spiritual/teaching', 'zmdi-face', 'Learn', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]\n[('https://shrinking-world.com', 'zmdi-home', 'Shrinking World', None), ('https://seamansguide.com', 'zmdi-storage', "Seaman's Guide", None), ('https://MarkSeaman.org', 'zmdi-accounts-alt', 'Mark Seaman', None), ('https://seamanslog.com', 'zmdi-accounts-list', "Seaman's Log", None), ('https://spiritual-things.org', 'zmdi-cloud-outline', 'Spiritual Things', None)]
161	mybook-site-title	['Aspire', 'From Dreams to Reality']\n['Shrinking World', 'Solutions to key problems']\n['Shrinking World', 'Solutions to key problems']\n['Shrinking World', 'Solutions to key problems']\n["Seaman's Guide", 'Learn New Skills']\n['Private Notes', 'Thinking Patterns and Best Practice']\n['Shrinking World', 'Solutions to key problems']\n['Shrinking World', 'Solutions to key problems']\n["Seaman's Log", 'Big Ideas & Deep Thoughts']\n['Shrinking World', 'Solutions to key problems']\n['Shrinking World', 'Solutions to key problems']\n['Spiritual Things', 'Daily Inspiration']\n['Shrinking World', 'Solutions to key problems']\n['Shrinking World', 'Solutions to key problems']\n['Shrinking World', 'Solutions to key problems']	['Aspire', 'From Dreams to Reality']\n['Shrinking World', 'Solutions to key problems']\n['Shrinking World', 'Solutions to key problems']\n['Shrinking World', 'Solutions to key problems']\n["Seaman's Guide", 'Learn New Skills']\n['Private Notes', 'Thinking Patterns and Best Practice']\n['Shrinking World', 'Solutions to key problems']\n['Shrinking World', 'Solutions to key problems']\n["Seaman's Log", 'Big Ideas & Deep Thoughts']\n['Shrinking World', 'Solutions to key problems']\n['Shrinking World', 'Solutions to key problems']\n['Spiritual Things', 'Daily Inspiration']\n['Shrinking World', 'Solutions to key problems']\n['Shrinking World', 'Solutions to key problems']\n['Shrinking World', 'Solutions to key problems']
102	project-export	\n\n        script to manage projects on servers\n\n        usage: x project command\n\n        command\n\n        List:\n            list                - list the configured project\n            get   name          - get a project by name lookup\n\n        Modify:\n            add     name user   - add a new project record\n            delete  name        - remove this project\n            edit    name value  - rename the project\n\n        I/O \n            import              - import all records from a file \n            export              - export all records to a file \n\n        \n	\n\n        script to manage projects on servers\n\n        usage: x project command\n\n        command\n\n        List:\n            list                - list the configured project\n            get   name          - get a project by name lookup\n\n        Modify:\n            add     name user   - add a new project record\n            delete  name        - remove this project\n            edit    name value  - rename the project\n\n        I/O \n            import              - import all records from a file \n            export              - export all records to a file \n\n        \n
151	archive-files	\n--------------------------------------------------------------------------------\n                              archive-files\n--------------------------------------------------------------------------------\nfiles(/home/django/Archive/MyBook-2017) --> 1 files (should be between 5657 and 5660)\nfiles(/home/django/Archive/Documents-2017) --> 1 files (should be between 1293 and 1300)\nfiles(/home/django/Archive/Documents-2016) --> 1 files (should be between 1364 and 1370)\nfiles(/home/django/Archive/Documents-2015) --> 1 files (should be between 3326 and 3326)\nfiles(/home/django/Archive/Documents-2014) --> 1 files (should be between 6095 and 6095)\nfiles(/home/django/Archive/UNC-2017) --> 1 files (should be between 14678 and 14780)\nfiles(/home/django/Archive/rcp) --> 1 files (should be between 39700 and 41000)\n	\n--------------------------------------------------------------------------------\n                              archive-files\n--------------------------------------------------------------------------------\nfiles(/home/django/Archive/MyBook-2017) --> 1 files (should be between 5657 and 5660)\nfiles(/home/django/Archive/Documents-2017) --> 1 files (should be between 1293 and 1300)\nfiles(/home/django/Archive/Documents-2016) --> 1 files (should be between 1364 and 1370)\nfiles(/home/django/Archive/Documents-2015) --> 1 files (should be between 3326 and 3326)\nfiles(/home/django/Archive/Documents-2014) --> 1 files (should be between 6095 and 6095)\nfiles(/home/django/Archive/UNC-2017) --> 1 files (should be between 14678 and 14780)\nfiles(/home/django/Archive/rcp) --> 1 files (should be between 39700 and 41000)\n
118	software-show	no output	no output
119	software-stats	no output	no output
47	seamanslog-list	TimeBudget\nOpportunity\n10000Days\nToolsSaveTime\nLearningCurve\nImportantWork\nUnfinishedBook\nLifeWork\nReadToLearn\nSiteTitle\nDailyHabits\nCommitments\nExpandContract\nMenu\nHabitualChange\nWorkMindset\nWritingWorkflow\nWhyWork\nMultitasking\nHitler\nLowCostMyth\nBusinessInvestment\nActToLearn\nScaledCommit\nStrengths\nCollaboration\nWritingStages\nPragmaticThinking\nOneImprovement\nSearch\nCareer\nProcessingIdeas\nYourBlogTopic\nIndex\nLifeFun\nLifeThatMatters\nBiggestIdea\nLifePeople\nLifeGrow\nNewYearsResolutions\nGenetics\nInvest20Percent\nCreativeScore\nRuthlessWithWaste\nFoodAndSex\nPessimism\nComputerComplexity\nIdeology\nMaunaKea\nWorkforce\nMyStory\n	TimeBudget\nOpportunity\n10000Days\nToolsSaveTime\nLearningCurve\nImportantWork\nUnfinishedBook\nLifeWork\nReadToLearn\nSiteTitle\nDailyHabits\nCommitments\nExpandContract\nMenu\nHabitualChange\nWorkMindset\nWritingWorkflow\nWhyWork\nMultitasking\nHitler\nLowCostMyth\nBusinessInvestment\nActToLearn\nScaledCommit\nStrengths\nCollaboration\nWritingStages\nPragmaticThinking\nOneImprovement\nSearch\nCareer\nProcessingIdeas\nYourBlogTopic\nIndex\nLifeFun\nLifeThatMatters\nBiggestIdea\nLifePeople\nLifeGrow\nNewYearsResolutions\nGenetics\nInvest20Percent\nCreativeScore\nRuthlessWithWaste\nFoodAndSex\nPessimism\nComputerComplexity\nIdeology\nMaunaKea\nWorkforce\nMyStory\n
50	seamanslog-words	   439 seamanslog/TimeBudget\n   203 seamanslog/Opportunity\n   573 seamanslog/10000Days\n   411 seamanslog/ToolsSaveTime\n   547 seamanslog/LearningCurve\n   186 seamanslog/ImportantWork\n   439 seamanslog/UnfinishedBook\n   249 seamanslog/LifeWork\n   502 seamanslog/ReadToLearn\n     8 seamanslog/SiteTitle\n   409 seamanslog/DailyHabits\n   263 seamanslog/Commitments\n   246 seamanslog/ExpandContract\n     7 seamanslog/Menu\n   440 seamanslog/HabitualChange\n   605 seamanslog/WorkMindset\n   340 seamanslog/WritingWorkflow\n   307 seamanslog/WhyWork\n   487 seamanslog/Multitasking\n   324 seamanslog/Hitler\n   211 seamanslog/LowCostMyth\n   541 seamanslog/BusinessInvestment\n   341 seamanslog/ActToLearn\n   439 seamanslog/ScaledCommit\n   454 seamanslog/Strengths\n   356 seamanslog/Collaboration\n   614 seamanslog/WritingStages\n   490 seamanslog/PragmaticThinking\n   354 seamanslog/OneImprovement\n   420 seamanslog/Search\n   478 seamanslog/Career\n   344 seamanslog/ProcessingIdeas\n   284 seamanslog/YourBlogTopic\n    43 seamanslog/Index\n   223 seamanslog/LifeFun\n   109 seamanslog/LifeThatMatters\n    84 seamanslog/BiggestIdea\n   206 seamanslog/LifePeople\n   205 seamanslog/LifeGrow\n   332 seamanslog/NewYearsResolutions\n   262 seamanslog/Genetics\n   642 seamanslog/Invest20Percent\n   137 seamanslog/CreativeScore\n   326 seamanslog/RuthlessWithWaste\n   507 seamanslog/FoodAndSex\n   118 seamanslog/Pessimism\n   497 seamanslog/ComputerComplexity\n   360 seamanslog/Ideology\n   388 seamanslog/MaunaKea\n   192 seamanslog/Workforce\n   183 seamanslog/MyStory\n 17125\n	   439 seamanslog/TimeBudget\n   203 seamanslog/Opportunity\n   573 seamanslog/10000Days\n   411 seamanslog/ToolsSaveTime\n   547 seamanslog/LearningCurve\n   186 seamanslog/ImportantWork\n   439 seamanslog/UnfinishedBook\n   249 seamanslog/LifeWork\n   502 seamanslog/ReadToLearn\n     8 seamanslog/SiteTitle\n   409 seamanslog/DailyHabits\n   263 seamanslog/Commitments\n   246 seamanslog/ExpandContract\n     7 seamanslog/Menu\n   440 seamanslog/HabitualChange\n   605 seamanslog/WorkMindset\n   340 seamanslog/WritingWorkflow\n   307 seamanslog/WhyWork\n   487 seamanslog/Multitasking\n   324 seamanslog/Hitler\n   211 seamanslog/LowCostMyth\n   541 seamanslog/BusinessInvestment\n   341 seamanslog/ActToLearn\n   439 seamanslog/ScaledCommit\n   454 seamanslog/Strengths\n   356 seamanslog/Collaboration\n   614 seamanslog/WritingStages\n   490 seamanslog/PragmaticThinking\n   354 seamanslog/OneImprovement\n   420 seamanslog/Search\n   478 seamanslog/Career\n   344 seamanslog/ProcessingIdeas\n   284 seamanslog/YourBlogTopic\n    43 seamanslog/Index\n   223 seamanslog/LifeFun\n   109 seamanslog/LifeThatMatters\n    84 seamanslog/BiggestIdea\n   206 seamanslog/LifePeople\n   205 seamanslog/LifeGrow\n   332 seamanslog/NewYearsResolutions\n   262 seamanslog/Genetics\n   642 seamanslog/Invest20Percent\n   137 seamanslog/CreativeScore\n   326 seamanslog/RuthlessWithWaste\n   507 seamanslog/FoodAndSex\n   118 seamanslog/Pessimism\n   497 seamanslog/ComputerComplexity\n   360 seamanslog/Ideology\n   388 seamanslog/MaunaKea\n   192 seamanslog/Workforce\n   183 seamanslog/MyStory\n 17125\n
25	table-format	<table class="table table-hover">\n  <th class="palette-Teal-100 bg">X</th>\n  <th class="palette-Teal-100 bg">Y</th>\n  <th class="palette-Teal-100 bg">Z</th>\n  <tr>\n    <td>a</td>\n    <td>b</td>\n    <td>c</td>\n  </tr>\n  <tr>\n    <td>1</td>\n    <td>2</td>\n    <td>3</td>\n  </tr>\n  <tr>\n    <td>4</td>\n    <td>5</td>\n    <td>6</td>\n  </tr>\n  <tr>\n    <td>7</td>\n    <td>8</td>\n    <td>9</td>\n  </tr>\n</table>	<table class="table table-hover">\n  <th class="palette-Teal-100 bg">X</th>\n  <th class="palette-Teal-100 bg">Y</th>\n  <th class="palette-Teal-100 bg">Z</th>\n  <tr>\n    <td>a</td>\n    <td>b</td>\n    <td>c</td>\n  </tr>\n  <tr>\n    <td>1</td>\n    <td>2</td>\n    <td>3</td>\n  </tr>\n  <tr>\n    <td>4</td>\n    <td>5</td>\n    <td>6</td>\n  </tr>\n  <tr>\n    <td>7</td>\n    <td>8</td>\n    <td>9</td>\n  </tr>\n</table>
42	system-pandoc	<h1 id="history-of-activity">History of Activity</h1>\n<p><a href="Today" class="uri">Today</a></p>\n<h2 id="section">2015</h2>\n<ul>\n<li><a href="2015-09">September</a></li>\n<li><a href="2015-10">October</a></li>\n<li><a href="2015-11">November</a></li>\n<li><a href="2015-12">December</a></li>\n</ul>\n<h2 id="section-1">2016</h2>\n<ul>\n<li><a href="2016-01">January</a></li>\n<li><a href="2016-02">February</a></li>\n<li><a href="2016-03">March</a></li>\n<li><a href="2016-04">April</a></li>\n<li><a href="2016-05">May</a></li>\n<li><a href="2016-06">June</a></li>\n<li><a href="2016-07">July</a></li>\n<li><a href="2016-08">August</a></li>\n<li><a href="2016-09">September</a></li>\n<li><a href="2016-10">October</a></li>\n<li><a href="2016-11">November</a></li>\n</ul>\n	<h1 id="history-of-activity">History of Activity</h1>\n<p><a href="Today" class="uri">Today</a></p>\n<h2 id="section">2015</h2>\n<ul>\n<li><a href="2015-09">September</a></li>\n<li><a href="2015-10">October</a></li>\n<li><a href="2015-11">November</a></li>\n<li><a href="2015-12">December</a></li>\n</ul>\n<h2 id="section-1">2016</h2>\n<ul>\n<li><a href="2016-01">January</a></li>\n<li><a href="2016-02">February</a></li>\n<li><a href="2016-03">March</a></li>\n<li><a href="2016-04">April</a></li>\n<li><a href="2016-05">May</a></li>\n<li><a href="2016-06">June</a></li>\n<li><a href="2016-07">July</a></li>\n<li><a href="2016-08">August</a></li>\n<li><a href="2016-09">September</a></li>\n<li><a href="2016-10">October</a></li>\n<li><a href="2016-11">November</a></li>\n</ul>\n
157	system-cron	# Edit this file to introduce tasks to be run by cron.\n# \n# Each task to run has to be defined through a single line\n# indicating with different fields when the task will be run\n# and what command to run for the task\n# \n# To define the time you can provide concrete values for\n# minute (m), hour (h), day of month (dom), month (mon),\n# and day of week (dow) or use '*' in these fields (for 'any').# \n# Notice that tasks will be started based on the cron's system\n# daemon's notion of time and timezones.\n# \n# Output of the crontab jobs (including errors) is sent through\n# email to the user the crontab file belongs to (unless redirected).\n# \n# For example, you can run a backup of all your user accounts\n# at 5 a.m every week with:\n# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/\n# \n# For more information see the manual pages of crontab(5) and cron(8)\n# \n# Crontab\n# m h  dom mon dow   command\n\n0  *  *  * * ~/MyBook/bin/hourly\n	# Edit this file to introduce tasks to be run by cron.\n# \n# Each task to run has to be defined through a single line\n# indicating with different fields when the task will be run\n# and what command to run for the task\n# \n# To define the time you can provide concrete values for\n# minute (m), hour (h), day of month (dom), month (mon),\n# and day of week (dow) or use '*' in these fields (for 'any').# \n# Notice that tasks will be started based on the cron's system\n# daemon's notion of time and timezones.\n# \n# Output of the crontab jobs (including errors) is sent through\n# email to the user the crontab file belongs to (unless redirected).\n# \n# For example, you can run a backup of all your user accounts\n# at 5 a.m every week with:\n# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/\n# \n# For more information see the manual pages of crontab(5) and cron(8)\n# \n# Crontab\n# m h  dom mon dow   command\n\n0  *  *  * * ~/MyBook/bin/hourly\n
3	text-format	Work Activities\n    * These activities are critical to successful work.\n    * Balance the four activities for the best outcomes.\n    * This is a second paragraph\n    * of text.\n    Learn\n        * create deeper understanding of problem\n        * evaluate solution\n\n    Plan\n        * past history\n        * present tasks\n        * future priorities\n\n    Build\n        fix\n            list of known problems\n\n            issue tracking\n\n        test\n            test inventory\n\n            tests needed\n\n        extend\n\n        improve\n\n    Teach\n        * share what you know\n        * invite review\n	Work Activities\n    * These activities are critical to successful work.\n    * Balance the four activities for the best outcomes.\n    * This is a second paragraph\n    * of text.\n    Learn\n        * create deeper understanding of problem\n        * evaluate solution\n\n    Plan\n        * past history\n        * present tasks\n        * future priorities\n\n    Build\n        fix\n            list of known problems\n\n            issue tracking\n\n        test\n            test inventory\n\n            tests needed\n\n        extend\n\n        improve\n\n    Teach\n        * share what you know\n        * invite review\n
9	text-outline	[['Work Activities', [['Learn', [], ['create deeper understanding of problem', 'evaluate solution', '']], ['Plan', [], ['past history', 'present tasks', 'future priorities', '']], ['Build', [['fix', [['list of known problems', [], []], ['issue tracking', [], []]], []], ['test', [['test inventory', [], []], ['tests needed', [], []]], []], ['extend', [], []], ['improve', [], ['']]], []], ['Teach', [], ['share what you know', 'invite review', '', '    ']]], ['', 'These activities are critical to successful work.', 'Balance the four activities for the best outcomes.', '', 'This is a second paragraph', 'of text.', '']]]	[['Work Activities', [['Learn', [], ['create deeper understanding of problem', 'evaluate solution', '']], ['Plan', [], ['past history', 'present tasks', 'future priorities', '']], ['Build', [['fix', [['list of known problems', [], []], ['issue tracking', [], []]], []], ['test', [['test inventory', [], []], ['tests needed', [], []]], []], ['extend', [], []], ['improve', [], ['']]], []], ['Teach', [], ['share what you know', 'invite review', '', '    ']]], ['', 'These activities are critical to successful work.', 'Balance the four activities for the best outcomes.', '', 'This is a second paragraph', 'of text.', '']]]
56	tst	app-classes\napp-functions\napp-html-files\napp-list\napp-score\napp-settings\napp-show\napp-signature\napp-summary\napp-switches\napp-url\narchive-content\narchive-dirs\narchive-files\narchive-nts\narchive-repo\naspire-list\naspire-report\naspire-score\naspire-show\naspire-week\nauthor-drafts\nauthor-score\nauthor-summary\nbooknotes-lines\nbooknotes-list\nbooknotes-show\nbudget-list\nbudget-show\nbudget-total\nchurch-export\nchurch-list\nchurch-show\ncmd-list\ncmd-show\ncss\ndata-files\ndata-migrate\ndata-save\ndata-tables\ndatatype-list\ndatatype-show\ndays-list\ndays-month\ndays-schedule\ndays-show\ndoc\ndoc-encoding\ndoc-file\ndoc-file-missing\ndoc-help\ndoc-html\ndoc-render\ndoc-scan\ndoc-score\ndoc-search\ndoc-show\ndoc-status\ndoc-summary\nemail\nfaceblog-list\nfaceblog-show\nhealth-list\nhealth-score\nhourly-list\nhourly-show\nhours-activity\nhours-add\nhours-days\nhours-show\nhours-summary\nhours-work\ni-list\nlife-index\nlife-list\nlife-show\nlog-length\nmusic-list\nmybook-menu\nmybook-menu-aspire\nmybook-menu-booknotes\nmybook-menu-brain\nmybook-menu-leverage\nmybook-menu-list\nmybook-menu-mybook\nmybook-menu-software\nmybook-menu-spiritual\nmybook-menu-swo\nmybook-redirect\nmybook-site-title\nnode-self\nopc-list\nopc-show\nops-help\nops-server\nops-server-type\nops-status\npage-diff\npage-list\npage-sites\npage-text\nplan-list\nplan-show\nproject-export\nproject-import\nproject-list\nproject-template\nreuse-list\nreuse-show\nrobot-list\nrobot-results\nrobot-show\nscore-list\nscore-show\nseamanslog-list\nseamanslog-show\nseamanslog-summary\nseamanslog-words\nsoftware-list\nsoftware-show\nsoftware-stats\nsoftware-summary\nsrc-base\nsrc-changed\nsrc-common\nsrc-diff\nsrc-list\nsrc-missing\nsrc-same\nsrc-unique\nstaging-host\nstaging-ip\nsystem-cron\nsystem-disk-free\nsystem-files-count\nsystem-host\nsystem-ip\nsystem-pandoc\nsystem-pip\nsystem-python-files\nsystem-python-version\nsystem-python-virtualenv\ntable-format\ntable-from-text\ntable-sort\ntable-to-text\ntask-import\ntask-month\ntask-totals\ntask-week\ntask-work\ntext-agents\ntext-anchors\ntext-div\ntext-findall\ntext-format\ntext-functions\ntext-grep\ntext-help\ntext-links\ntext-markdown\ntext-match\ntext-no-match\ntext-outline\ntext-round-trip\ntext-select-lines\ntext-signatures\ntext-transforms\ntext-url\nthot-list\nthot-show\ntst\ntst-time\nunc-files\nuser-list\nvc-pull\nvc-status\nwordpress-host\nwordpress-list\n	app-classes\napp-functions\napp-html-files\napp-list\napp-score\napp-settings\napp-show\napp-signature\napp-summary\napp-switches\napp-url\narchive-content\narchive-dirs\narchive-files\narchive-nts\narchive-repo\naspire-list\naspire-report\naspire-score\naspire-show\naspire-week\nauthor-drafts\nauthor-score\nauthor-summary\nbooknotes-lines\nbooknotes-list\nbooknotes-show\nbudget-list\nbudget-show\nbudget-total\nchurch-export\nchurch-list\nchurch-show\ncmd-list\ncmd-show\ncss\ndata-files\ndata-migrate\ndata-save\ndata-tables\ndatatype-list\ndatatype-show\ndays-list\ndays-month\ndays-schedule\ndays-show\ndoc\ndoc-encoding\ndoc-file\ndoc-file-missing\ndoc-help\ndoc-html\ndoc-render\ndoc-scan\ndoc-score\ndoc-search\ndoc-show\ndoc-status\ndoc-summary\nemail\nfaceblog-list\nfaceblog-show\nhealth-list\nhealth-score\nhourly-list\nhourly-show\nhours-activity\nhours-add\nhours-days\nhours-show\nhours-summary\nhours-work\ni-list\nlife-index\nlife-list\nlife-show\nlog-length\nmusic-list\nmybook-menu\nmybook-menu-aspire\nmybook-menu-booknotes\nmybook-menu-brain\nmybook-menu-leverage\nmybook-menu-list\nmybook-menu-mybook\nmybook-menu-software\nmybook-menu-spiritual\nmybook-menu-swo\nmybook-redirect\nmybook-site-title\nnode-self\nopc-list\nopc-show\nops-help\nops-server\nops-server-type\nops-status\npage-diff\npage-list\npage-sites\npage-text\nplan-list\nplan-show\nproject-export\nproject-import\nproject-list\nproject-template\nreuse-list\nreuse-show\nrobot-list\nrobot-results\nrobot-show\nscore-list\nscore-show\nseamanslog-list\nseamanslog-show\nseamanslog-summary\nseamanslog-words\nsoftware-list\nsoftware-show\nsoftware-stats\nsoftware-summary\nsrc-base\nsrc-changed\nsrc-common\nsrc-diff\nsrc-list\nsrc-missing\nsrc-same\nsrc-unique\nstaging-host\nstaging-ip\nsystem-cron\nsystem-disk-free\nsystem-files-count\nsystem-host\nsystem-ip\nsystem-pandoc\nsystem-pip\nsystem-python-files\nsystem-python-version\nsystem-python-virtualenv\ntable-format\ntable-from-text\ntable-sort\ntable-to-text\ntask-import\ntask-month\ntask-totals\ntask-week\ntask-work\ntext-agents\ntext-anchors\ntext-div\ntext-findall\ntext-format\ntext-functions\ntext-grep\ntext-help\ntext-links\ntext-markdown\ntext-match\ntext-no-match\ntext-outline\ntext-round-trip\ntext-select-lines\ntext-signatures\ntext-transforms\ntext-url\nthot-list\nthot-show\ntst\ntst-time\nunc-files\nuser-list\nvc-pull\nvc-status\nwordpress-host\nwordpress-list\n
64	ops-server	Ops Command - production server\n\n        ops production ['server']\n\n        usage: x ops COMMAND [ARGS]\n\n        COMMAND:\n\n            command - execute a single command on the remote server\n            console - login to production\n            deploy  - push all changes to staging server\n            log     - show the log on the production server\n            restart - restart the web server\n            root    - show the root console\n            update  - push all files to remote server\n\n        \n	Ops Command - production server\n\n        ops production ['server']\n\n        usage: x ops COMMAND [ARGS]\n\n        COMMAND:\n\n            command - execute a single command on the remote server\n            console - login to production\n            deploy  - push all changes to staging server\n            log     - show the log on the production server\n            restart - restart the web server\n            root    - show the root console\n            update  - push all files to remote server\n\n        \n
128	robot-list	who2hire.us\napp.who2hire.us\napp.who2hire.us/login\napp.who2hire.us/opening_list\nmybookonline.org/software/Leverage/Index\nmybookonline.org/aspire\nmybookonline.org/login\nmybookonline.org/aspire/Index\nmybookonline.org/aspire/MyBook/Index\nshrinking-world.com\nseamansguide.com\nmarkseaman.org\nmarkseaman.info\nmarkseaman.info/login\nmarkseaman.info/task/time\nspiritual-things.org/spiritual/bible/Jer_17_7\n	who2hire.us\napp.who2hire.us\napp.who2hire.us/login\napp.who2hire.us/opening_list\nmybookonline.org/software/Leverage/Index\nmybookonline.org/aspire\nmybookonline.org/login\nmybookonline.org/aspire/Index\nmybookonline.org/aspire/MyBook/Index\nshrinking-world.com\nseamansguide.com\nmarkseaman.org\nmarkseaman.info\nmarkseaman.info/login\nmarkseaman.info/task/time\nspiritual-things.org/spiritual/bible/Jer_17_7\n
\.


--
-- Name: tool_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.tool_test_id_seq', 179, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: health_healthscore_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.health_healthscore
    ADD CONSTRAINT health_healthscore_pkey PRIMARY KEY (id);


--
-- Name: life_aspect_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.life_aspect
    ADD CONSTRAINT life_aspect_pkey PRIMARY KEY (id);


--
-- Name: life_experience_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.life_experience
    ADD CONSTRAINT life_experience_pkey PRIMARY KEY (id);


--
-- Name: life_year_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.life_year
    ADD CONSTRAINT life_year_pkey PRIMARY KEY (id);


--
-- Name: superuser_administrator_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.superuser_administrator
    ADD CONSTRAINT superuser_administrator_pkey PRIMARY KEY (id);


--
-- Name: tasks_task_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.tasks_task
    ADD CONSTRAINT tasks_task_pkey PRIMARY KEY (id);


--
-- Name: tool_page_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.tool_page
    ADD CONSTRAINT tool_page_pkey PRIMARY KEY (id);


--
-- Name: tool_page_url_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.tool_page
    ADD CONSTRAINT tool_page_url_key UNIQUE (url);


--
-- Name: tool_project_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.tool_project
    ADD CONSTRAINT tool_project_pkey PRIMARY KEY (id);


--
-- Name: tool_test_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.tool_test
    ADD CONSTRAINT tool_test_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_group_permissions_0e939a4f ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_group_permissions_8373b171 ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_permission_417f1b1c ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_groups_0e939a4f ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_groups_e8701ad4 ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_user_permissions_8373b171 ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_admin_log_417f1b1c ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_admin_log_e8701ad4 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_session_de54fa62 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: health_healthscore_user_id_0cb2520f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX health_healthscore_user_id_0cb2520f ON public.health_healthscore USING btree (user_id);


--
-- Name: life_experience_aspect_id_55d08d71; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX life_experience_aspect_id_55d08d71 ON public.life_experience USING btree (aspect_id);


--
-- Name: superuser_administrator_8c3b381a; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX superuser_administrator_8c3b381a ON public.superuser_administrator USING btree (surrogate_id);


--
-- Name: superuser_administrator_e8701ad4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX superuser_administrator_e8701ad4 ON public.superuser_administrator USING btree (user_id);


--
-- Name: tool_page_url_dcc809f9_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX tool_page_url_dcc809f9_like ON public.tool_page USING btree (url varchar_pattern_ops);


--
-- Name: tool_project_e8701ad4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX tool_project_e8701ad4 ON public.tool_project USING btree (user_id);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: health_healthscore_user_id_0cb2520f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.health_healthscore
    ADD CONSTRAINT health_healthscore_user_id_0cb2520f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: life_experience_aspect_id_55d08d71_fk_life_aspect_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.life_experience
    ADD CONSTRAINT life_experience_aspect_id_55d08d71_fk_life_aspect_id FOREIGN KEY (aspect_id) REFERENCES public.life_aspect(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: superuser_administrator_surrogate_id_0eb68f34_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.superuser_administrator
    ADD CONSTRAINT superuser_administrator_surrogate_id_0eb68f34_fk_auth_user_id FOREIGN KEY (surrogate_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: superuser_administrator_user_id_56d638ef_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.superuser_administrator
    ADD CONSTRAINT superuser_administrator_user_id_56d638ef_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tool_project_user_id_4389d573_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.tool_project
    ADD CONSTRAINT tool_project_user_id_4389d573_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

