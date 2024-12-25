PGDMP                      |            medical_center    17.2    17.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    18623    medical_center    DATABASE     �   CREATE DATABASE medical_center WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE medical_center;
                     postgres    false            �            1259    18625    Admins    TABLE     �   CREATE TABLE public."Admins" (
    id integer NOT NULL,
    login character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Admins";
       public         heap r       postgres    false            �            1259    18624    Admins_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Admins_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Admins_id_seq";
       public               postgres    false    218            �           0    0    Admins_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Admins_id_seq" OWNED BY public."Admins".id;
          public               postgres    false    217            �            1259    18719    Appointments    TABLE     7  CREATE TABLE public."Appointments" (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    "doctorId" integer NOT NULL,
    "patientId" integer NOT NULL,
    "serviceId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 "   DROP TABLE public."Appointments";
       public         heap r       postgres    false            �            1259    18718    Appointments_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Appointments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Appointments_id_seq";
       public               postgres    false    232            �           0    0    Appointments_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Appointments_id_seq" OWNED BY public."Appointments".id;
          public               postgres    false    231            �            1259    18647    Departments    TABLE     �   CREATE TABLE public."Departments" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 !   DROP TABLE public."Departments";
       public         heap r       postgres    false            �            1259    18646    Departments_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Departments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Departments_id_seq";
       public               postgres    false    222            �           0    0    Departments_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Departments_id_seq" OWNED BY public."Departments".id;
          public               postgres    false    221            �            1259    18700 	   Diagnoses    TABLE     7  CREATE TABLE public."Diagnoses" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    conclusion character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "patientId" integer NOT NULL,
    "doctorId" integer NOT NULL
);
    DROP TABLE public."Diagnoses";
       public         heap r       postgres    false            �            1259    18699    Diagnoses_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Diagnoses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Diagnoses_id_seq";
       public               postgres    false    230            �           0    0    Diagnoses_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Diagnoses_id_seq" OWNED BY public."Diagnoses".id;
          public               postgres    false    229            �            1259    18672    DoctorSchedules    TABLE     L  CREATE TABLE public."DoctorSchedules" (
    id integer NOT NULL,
    "dayOfWeek" integer NOT NULL,
    "startTime" time without time zone NOT NULL,
    "endTime" time without time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "doctorId" integer NOT NULL
);
 %   DROP TABLE public."DoctorSchedules";
       public         heap r       postgres    false            �            1259    18671    DoctorSchedules_id_seq    SEQUENCE     �   CREATE SEQUENCE public."DoctorSchedules_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."DoctorSchedules_id_seq";
       public               postgres    false    226            �           0    0    DoctorSchedules_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."DoctorSchedules_id_seq" OWNED BY public."DoctorSchedules".id;
          public               postgres    false    225            �            1259    18656    Doctors    TABLE     �  CREATE TABLE public."Doctors" (
    id integer NOT NULL,
    login character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "firstName" character varying(255) NOT NULL,
    "lastName" character varying(255) NOT NULL,
    specialization character varying(255) NOT NULL,
    photo character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "departmentId" integer NOT NULL
);
    DROP TABLE public."Doctors";
       public         heap r       postgres    false            �            1259    18655    Doctors_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Doctors_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Doctors_id_seq";
       public               postgres    false    224            �           0    0    Doctors_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Doctors_id_seq" OWNED BY public."Doctors".id;
          public               postgres    false    223            �            1259    18636    Patients    TABLE     �  CREATE TABLE public."Patients" (
    id integer NOT NULL,
    login character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "firstName" character varying(255) NOT NULL,
    "lastName" character varying(255) NOT NULL,
    "phoneNumber" character varying(255),
    address character varying(255),
    age integer NOT NULL,
    photo character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Patients";
       public         heap r       postgres    false            �            1259    18635    Patients_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Patients_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Patients_id_seq";
       public               postgres    false    220            �           0    0    Patients_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Patients_id_seq" OWNED BY public."Patients".id;
          public               postgres    false    219            �            1259    18684    Services    TABLE     8  CREATE TABLE public."Services" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price double precision NOT NULL,
    photo character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "departmentId" integer NOT NULL
);
    DROP TABLE public."Services";
       public         heap r       postgres    false            �            1259    18683    Services_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Services_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Services_id_seq";
       public               postgres    false    228            �           0    0    Services_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Services_id_seq" OWNED BY public."Services".id;
          public               postgres    false    227            D           2604    18628 	   Admins id    DEFAULT     j   ALTER TABLE ONLY public."Admins" ALTER COLUMN id SET DEFAULT nextval('public."Admins_id_seq"'::regclass);
 :   ALTER TABLE public."Admins" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217    218            K           2604    18722    Appointments id    DEFAULT     v   ALTER TABLE ONLY public."Appointments" ALTER COLUMN id SET DEFAULT nextval('public."Appointments_id_seq"'::regclass);
 @   ALTER TABLE public."Appointments" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    232    231    232            F           2604    18650    Departments id    DEFAULT     t   ALTER TABLE ONLY public."Departments" ALTER COLUMN id SET DEFAULT nextval('public."Departments_id_seq"'::regclass);
 ?   ALTER TABLE public."Departments" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    222    222            J           2604    18703    Diagnoses id    DEFAULT     p   ALTER TABLE ONLY public."Diagnoses" ALTER COLUMN id SET DEFAULT nextval('public."Diagnoses_id_seq"'::regclass);
 =   ALTER TABLE public."Diagnoses" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    229    230    230            H           2604    18675    DoctorSchedules id    DEFAULT     |   ALTER TABLE ONLY public."DoctorSchedules" ALTER COLUMN id SET DEFAULT nextval('public."DoctorSchedules_id_seq"'::regclass);
 C   ALTER TABLE public."DoctorSchedules" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    226    225    226            G           2604    18659 
   Doctors id    DEFAULT     l   ALTER TABLE ONLY public."Doctors" ALTER COLUMN id SET DEFAULT nextval('public."Doctors_id_seq"'::regclass);
 ;   ALTER TABLE public."Doctors" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    223    224            E           2604    18639    Patients id    DEFAULT     n   ALTER TABLE ONLY public."Patients" ALTER COLUMN id SET DEFAULT nextval('public."Patients_id_seq"'::regclass);
 <   ALTER TABLE public."Patients" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            I           2604    18687    Services id    DEFAULT     n   ALTER TABLE ONLY public."Services" ALTER COLUMN id SET DEFAULT nextval('public."Services_id_seq"'::regclass);
 <   ALTER TABLE public."Services" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    228    227    228            �          0    18625    Admins 
   TABLE DATA           Q   COPY public."Admins" (id, login, password, "createdAt", "updatedAt") FROM stdin;
    public               postgres    false    218   ��       �          0    18719    Appointments 
   TABLE DATA           r   COPY public."Appointments" (id, date, "doctorId", "patientId", "serviceId", "createdAt", "updatedAt") FROM stdin;
    public               postgres    false    232   ��       �          0    18647    Departments 
   TABLE DATA           K   COPY public."Departments" (id, name, "createdAt", "updatedAt") FROM stdin;
    public               postgres    false    222   �       �          0    18700 	   Diagnoses 
   TABLE DATA           n   COPY public."Diagnoses" (id, name, conclusion, "createdAt", "updatedAt", "patientId", "doctorId") FROM stdin;
    public               postgres    false    230   ޺       �          0    18672    DoctorSchedules 
   TABLE DATA           z   COPY public."DoctorSchedules" (id, "dayOfWeek", "startTime", "endTime", "createdAt", "updatedAt", "doctorId") FROM stdin;
    public               postgres    false    226   *�       �          0    18656    Doctors 
   TABLE DATA           �   COPY public."Doctors" (id, login, password, "firstName", "lastName", specialization, photo, "createdAt", "updatedAt", "departmentId") FROM stdin;
    public               postgres    false    224   ��       �          0    18636    Patients 
   TABLE DATA           �   COPY public."Patients" (id, login, password, "firstName", "lastName", "phoneNumber", address, age, photo, "createdAt", "updatedAt") FROM stdin;
    public               postgres    false    220   �       �          0    18684    Services 
   TABLE DATA           f   COPY public."Services" (id, name, price, photo, "createdAt", "updatedAt", "departmentId") FROM stdin;
    public               postgres    false    228   $�       �           0    0    Admins_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Admins_id_seq"', 3, true);
          public               postgres    false    217            �           0    0    Appointments_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Appointments_id_seq"', 4, true);
          public               postgres    false    231            �           0    0    Departments_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Departments_id_seq"', 5, true);
          public               postgres    false    221            �           0    0    Diagnoses_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Diagnoses_id_seq"', 3, true);
          public               postgres    false    229            �           0    0    DoctorSchedules_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."DoctorSchedules_id_seq"', 5, true);
          public               postgres    false    225            �           0    0    Doctors_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Doctors_id_seq"', 2, true);
          public               postgres    false    223            �           0    0    Patients_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Patients_id_seq"', 3, true);
          public               postgres    false    219            �           0    0    Services_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Services_id_seq"', 5, true);
          public               postgres    false    227            M           2606    20597    Admins Admins_login_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Admins"
    ADD CONSTRAINT "Admins_login_key" UNIQUE (login);
 E   ALTER TABLE ONLY public."Admins" DROP CONSTRAINT "Admins_login_key";
       public                 postgres    false    218            O           2606    20599    Admins Admins_login_key1 
   CONSTRAINT     X   ALTER TABLE ONLY public."Admins"
    ADD CONSTRAINT "Admins_login_key1" UNIQUE (login);
 F   ALTER TABLE ONLY public."Admins" DROP CONSTRAINT "Admins_login_key1";
       public                 postgres    false    218            Q           2606    20613    Admins Admins_login_key10 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Admins"
    ADD CONSTRAINT "Admins_login_key10" UNIQUE (login);
 G   ALTER TABLE ONLY public."Admins" DROP CONSTRAINT "Admins_login_key10";
       public                 postgres    false    218            S           2606    20591    Admins Admins_login_key11 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Admins"
    ADD CONSTRAINT "Admins_login_key11" UNIQUE (login);
 G   ALTER TABLE ONLY public."Admins" DROP CONSTRAINT "Admins_login_key11";
       public                 postgres    false    218            U           2606    20615    Admins Admins_login_key12 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Admins"
    ADD CONSTRAINT "Admins_login_key12" UNIQUE (login);
 G   ALTER TABLE ONLY public."Admins" DROP CONSTRAINT "Admins_login_key12";
       public                 postgres    false    218            W           2606    20589    Admins Admins_login_key13 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Admins"
    ADD CONSTRAINT "Admins_login_key13" UNIQUE (login);
 G   ALTER TABLE ONLY public."Admins" DROP CONSTRAINT "Admins_login_key13";
       public                 postgres    false    218            Y           2606    20587    Admins Admins_login_key14 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Admins"
    ADD CONSTRAINT "Admins_login_key14" UNIQUE (login);
 G   ALTER TABLE ONLY public."Admins" DROP CONSTRAINT "Admins_login_key14";
       public                 postgres    false    218            [           2606    20601    Admins Admins_login_key2 
   CONSTRAINT     X   ALTER TABLE ONLY public."Admins"
    ADD CONSTRAINT "Admins_login_key2" UNIQUE (login);
 F   ALTER TABLE ONLY public."Admins" DROP CONSTRAINT "Admins_login_key2";
       public                 postgres    false    218            ]           2606    20603    Admins Admins_login_key3 
   CONSTRAINT     X   ALTER TABLE ONLY public."Admins"
    ADD CONSTRAINT "Admins_login_key3" UNIQUE (login);
 F   ALTER TABLE ONLY public."Admins" DROP CONSTRAINT "Admins_login_key3";
       public                 postgres    false    218            _           2606    20605    Admins Admins_login_key4 
   CONSTRAINT     X   ALTER TABLE ONLY public."Admins"
    ADD CONSTRAINT "Admins_login_key4" UNIQUE (login);
 F   ALTER TABLE ONLY public."Admins" DROP CONSTRAINT "Admins_login_key4";
       public                 postgres    false    218            a           2606    20595    Admins Admins_login_key5 
   CONSTRAINT     X   ALTER TABLE ONLY public."Admins"
    ADD CONSTRAINT "Admins_login_key5" UNIQUE (login);
 F   ALTER TABLE ONLY public."Admins" DROP CONSTRAINT "Admins_login_key5";
       public                 postgres    false    218            c           2606    20607    Admins Admins_login_key6 
   CONSTRAINT     X   ALTER TABLE ONLY public."Admins"
    ADD CONSTRAINT "Admins_login_key6" UNIQUE (login);
 F   ALTER TABLE ONLY public."Admins" DROP CONSTRAINT "Admins_login_key6";
       public                 postgres    false    218            e           2606    20609    Admins Admins_login_key7 
   CONSTRAINT     X   ALTER TABLE ONLY public."Admins"
    ADD CONSTRAINT "Admins_login_key7" UNIQUE (login);
 F   ALTER TABLE ONLY public."Admins" DROP CONSTRAINT "Admins_login_key7";
       public                 postgres    false    218            g           2606    20593    Admins Admins_login_key8 
   CONSTRAINT     X   ALTER TABLE ONLY public."Admins"
    ADD CONSTRAINT "Admins_login_key8" UNIQUE (login);
 F   ALTER TABLE ONLY public."Admins" DROP CONSTRAINT "Admins_login_key8";
       public                 postgres    false    218            i           2606    20611    Admins Admins_login_key9 
   CONSTRAINT     X   ALTER TABLE ONLY public."Admins"
    ADD CONSTRAINT "Admins_login_key9" UNIQUE (login);
 F   ALTER TABLE ONLY public."Admins" DROP CONSTRAINT "Admins_login_key9";
       public                 postgres    false    218            k           2606    18632    Admins Admins_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Admins"
    ADD CONSTRAINT "Admins_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Admins" DROP CONSTRAINT "Admins_pkey";
       public                 postgres    false    218            �           2606    18724    Appointments Appointments_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Appointments"
    ADD CONSTRAINT "Appointments_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Appointments" DROP CONSTRAINT "Appointments_pkey";
       public                 postgres    false    232            �           2606    20661     Departments Departments_name_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_name_key" UNIQUE (name);
 N   ALTER TABLE ONLY public."Departments" DROP CONSTRAINT "Departments_name_key";
       public                 postgres    false    222            �           2606    20663 !   Departments Departments_name_key1 
   CONSTRAINT     `   ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_name_key1" UNIQUE (name);
 O   ALTER TABLE ONLY public."Departments" DROP CONSTRAINT "Departments_name_key1";
       public                 postgres    false    222            �           2606    20677 "   Departments Departments_name_key10 
   CONSTRAINT     a   ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_name_key10" UNIQUE (name);
 P   ALTER TABLE ONLY public."Departments" DROP CONSTRAINT "Departments_name_key10";
       public                 postgres    false    222            �           2606    20655 "   Departments Departments_name_key11 
   CONSTRAINT     a   ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_name_key11" UNIQUE (name);
 P   ALTER TABLE ONLY public."Departments" DROP CONSTRAINT "Departments_name_key11";
       public                 postgres    false    222            �           2606    20679 "   Departments Departments_name_key12 
   CONSTRAINT     a   ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_name_key12" UNIQUE (name);
 P   ALTER TABLE ONLY public."Departments" DROP CONSTRAINT "Departments_name_key12";
       public                 postgres    false    222            �           2606    20653 "   Departments Departments_name_key13 
   CONSTRAINT     a   ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_name_key13" UNIQUE (name);
 P   ALTER TABLE ONLY public."Departments" DROP CONSTRAINT "Departments_name_key13";
       public                 postgres    false    222            �           2606    20651 "   Departments Departments_name_key14 
   CONSTRAINT     a   ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_name_key14" UNIQUE (name);
 P   ALTER TABLE ONLY public."Departments" DROP CONSTRAINT "Departments_name_key14";
       public                 postgres    false    222            �           2606    20665 !   Departments Departments_name_key2 
   CONSTRAINT     `   ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_name_key2" UNIQUE (name);
 O   ALTER TABLE ONLY public."Departments" DROP CONSTRAINT "Departments_name_key2";
       public                 postgres    false    222            �           2606    20667 !   Departments Departments_name_key3 
   CONSTRAINT     `   ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_name_key3" UNIQUE (name);
 O   ALTER TABLE ONLY public."Departments" DROP CONSTRAINT "Departments_name_key3";
       public                 postgres    false    222            �           2606    20669 !   Departments Departments_name_key4 
   CONSTRAINT     `   ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_name_key4" UNIQUE (name);
 O   ALTER TABLE ONLY public."Departments" DROP CONSTRAINT "Departments_name_key4";
       public                 postgres    false    222            �           2606    20659 !   Departments Departments_name_key5 
   CONSTRAINT     `   ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_name_key5" UNIQUE (name);
 O   ALTER TABLE ONLY public."Departments" DROP CONSTRAINT "Departments_name_key5";
       public                 postgres    false    222            �           2606    20671 !   Departments Departments_name_key6 
   CONSTRAINT     `   ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_name_key6" UNIQUE (name);
 O   ALTER TABLE ONLY public."Departments" DROP CONSTRAINT "Departments_name_key6";
       public                 postgres    false    222            �           2606    20657 !   Departments Departments_name_key7 
   CONSTRAINT     `   ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_name_key7" UNIQUE (name);
 O   ALTER TABLE ONLY public."Departments" DROP CONSTRAINT "Departments_name_key7";
       public                 postgres    false    222            �           2606    20673 !   Departments Departments_name_key8 
   CONSTRAINT     `   ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_name_key8" UNIQUE (name);
 O   ALTER TABLE ONLY public."Departments" DROP CONSTRAINT "Departments_name_key8";
       public                 postgres    false    222            �           2606    20675 !   Departments Departments_name_key9 
   CONSTRAINT     `   ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_name_key9" UNIQUE (name);
 O   ALTER TABLE ONLY public."Departments" DROP CONSTRAINT "Departments_name_key9";
       public                 postgres    false    222            �           2606    18652    Departments Departments_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Departments" DROP CONSTRAINT "Departments_pkey";
       public                 postgres    false    222            �           2606    18707    Diagnoses Diagnoses_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Diagnoses"
    ADD CONSTRAINT "Diagnoses_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Diagnoses" DROP CONSTRAINT "Diagnoses_pkey";
       public                 postgres    false    230            �           2606    18677 $   DoctorSchedules DoctorSchedules_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."DoctorSchedules"
    ADD CONSTRAINT "DoctorSchedules_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."DoctorSchedules" DROP CONSTRAINT "DoctorSchedules_pkey";
       public                 postgres    false    226            �           2606    20695    Doctors Doctors_login_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Doctors"
    ADD CONSTRAINT "Doctors_login_key" UNIQUE (login);
 G   ALTER TABLE ONLY public."Doctors" DROP CONSTRAINT "Doctors_login_key";
       public                 postgres    false    224            �           2606    20697    Doctors Doctors_login_key1 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Doctors"
    ADD CONSTRAINT "Doctors_login_key1" UNIQUE (login);
 H   ALTER TABLE ONLY public."Doctors" DROP CONSTRAINT "Doctors_login_key1";
       public                 postgres    false    224            �           2606    20709    Doctors Doctors_login_key10 
   CONSTRAINT     [   ALTER TABLE ONLY public."Doctors"
    ADD CONSTRAINT "Doctors_login_key10" UNIQUE (login);
 I   ALTER TABLE ONLY public."Doctors" DROP CONSTRAINT "Doctors_login_key10";
       public                 postgres    false    224            �           2606    20687    Doctors Doctors_login_key11 
   CONSTRAINT     [   ALTER TABLE ONLY public."Doctors"
    ADD CONSTRAINT "Doctors_login_key11" UNIQUE (login);
 I   ALTER TABLE ONLY public."Doctors" DROP CONSTRAINT "Doctors_login_key11";
       public                 postgres    false    224            �           2606    20711    Doctors Doctors_login_key12 
   CONSTRAINT     [   ALTER TABLE ONLY public."Doctors"
    ADD CONSTRAINT "Doctors_login_key12" UNIQUE (login);
 I   ALTER TABLE ONLY public."Doctors" DROP CONSTRAINT "Doctors_login_key12";
       public                 postgres    false    224            �           2606    20685    Doctors Doctors_login_key13 
   CONSTRAINT     [   ALTER TABLE ONLY public."Doctors"
    ADD CONSTRAINT "Doctors_login_key13" UNIQUE (login);
 I   ALTER TABLE ONLY public."Doctors" DROP CONSTRAINT "Doctors_login_key13";
       public                 postgres    false    224            �           2606    20683    Doctors Doctors_login_key14 
   CONSTRAINT     [   ALTER TABLE ONLY public."Doctors"
    ADD CONSTRAINT "Doctors_login_key14" UNIQUE (login);
 I   ALTER TABLE ONLY public."Doctors" DROP CONSTRAINT "Doctors_login_key14";
       public                 postgres    false    224            �           2606    20699    Doctors Doctors_login_key2 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Doctors"
    ADD CONSTRAINT "Doctors_login_key2" UNIQUE (login);
 H   ALTER TABLE ONLY public."Doctors" DROP CONSTRAINT "Doctors_login_key2";
       public                 postgres    false    224            �           2606    20701    Doctors Doctors_login_key3 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Doctors"
    ADD CONSTRAINT "Doctors_login_key3" UNIQUE (login);
 H   ALTER TABLE ONLY public."Doctors" DROP CONSTRAINT "Doctors_login_key3";
       public                 postgres    false    224            �           2606    20703    Doctors Doctors_login_key4 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Doctors"
    ADD CONSTRAINT "Doctors_login_key4" UNIQUE (login);
 H   ALTER TABLE ONLY public."Doctors" DROP CONSTRAINT "Doctors_login_key4";
       public                 postgres    false    224            �           2606    20693    Doctors Doctors_login_key5 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Doctors"
    ADD CONSTRAINT "Doctors_login_key5" UNIQUE (login);
 H   ALTER TABLE ONLY public."Doctors" DROP CONSTRAINT "Doctors_login_key5";
       public                 postgres    false    224            �           2606    20691    Doctors Doctors_login_key6 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Doctors"
    ADD CONSTRAINT "Doctors_login_key6" UNIQUE (login);
 H   ALTER TABLE ONLY public."Doctors" DROP CONSTRAINT "Doctors_login_key6";
       public                 postgres    false    224            �           2606    20705    Doctors Doctors_login_key7 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Doctors"
    ADD CONSTRAINT "Doctors_login_key7" UNIQUE (login);
 H   ALTER TABLE ONLY public."Doctors" DROP CONSTRAINT "Doctors_login_key7";
       public                 postgres    false    224            �           2606    20689    Doctors Doctors_login_key8 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Doctors"
    ADD CONSTRAINT "Doctors_login_key8" UNIQUE (login);
 H   ALTER TABLE ONLY public."Doctors" DROP CONSTRAINT "Doctors_login_key8";
       public                 postgres    false    224            �           2606    20707    Doctors Doctors_login_key9 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Doctors"
    ADD CONSTRAINT "Doctors_login_key9" UNIQUE (login);
 H   ALTER TABLE ONLY public."Doctors" DROP CONSTRAINT "Doctors_login_key9";
       public                 postgres    false    224            �           2606    18663    Doctors Doctors_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Doctors"
    ADD CONSTRAINT "Doctors_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Doctors" DROP CONSTRAINT "Doctors_pkey";
       public                 postgres    false    224            m           2606    20629    Patients Patients_login_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Patients"
    ADD CONSTRAINT "Patients_login_key" UNIQUE (login);
 I   ALTER TABLE ONLY public."Patients" DROP CONSTRAINT "Patients_login_key";
       public                 postgres    false    220            o           2606    20631    Patients Patients_login_key1 
   CONSTRAINT     \   ALTER TABLE ONLY public."Patients"
    ADD CONSTRAINT "Patients_login_key1" UNIQUE (login);
 J   ALTER TABLE ONLY public."Patients" DROP CONSTRAINT "Patients_login_key1";
       public                 postgres    false    220            q           2606    20645    Patients Patients_login_key10 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Patients"
    ADD CONSTRAINT "Patients_login_key10" UNIQUE (login);
 K   ALTER TABLE ONLY public."Patients" DROP CONSTRAINT "Patients_login_key10";
       public                 postgres    false    220            s           2606    20623    Patients Patients_login_key11 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Patients"
    ADD CONSTRAINT "Patients_login_key11" UNIQUE (login);
 K   ALTER TABLE ONLY public."Patients" DROP CONSTRAINT "Patients_login_key11";
       public                 postgres    false    220            u           2606    20647    Patients Patients_login_key12 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Patients"
    ADD CONSTRAINT "Patients_login_key12" UNIQUE (login);
 K   ALTER TABLE ONLY public."Patients" DROP CONSTRAINT "Patients_login_key12";
       public                 postgres    false    220            w           2606    20621    Patients Patients_login_key13 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Patients"
    ADD CONSTRAINT "Patients_login_key13" UNIQUE (login);
 K   ALTER TABLE ONLY public."Patients" DROP CONSTRAINT "Patients_login_key13";
       public                 postgres    false    220            y           2606    20619    Patients Patients_login_key14 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Patients"
    ADD CONSTRAINT "Patients_login_key14" UNIQUE (login);
 K   ALTER TABLE ONLY public."Patients" DROP CONSTRAINT "Patients_login_key14";
       public                 postgres    false    220            {           2606    20633    Patients Patients_login_key2 
   CONSTRAINT     \   ALTER TABLE ONLY public."Patients"
    ADD CONSTRAINT "Patients_login_key2" UNIQUE (login);
 J   ALTER TABLE ONLY public."Patients" DROP CONSTRAINT "Patients_login_key2";
       public                 postgres    false    220            }           2606    20635    Patients Patients_login_key3 
   CONSTRAINT     \   ALTER TABLE ONLY public."Patients"
    ADD CONSTRAINT "Patients_login_key3" UNIQUE (login);
 J   ALTER TABLE ONLY public."Patients" DROP CONSTRAINT "Patients_login_key3";
       public                 postgres    false    220                       2606    20637    Patients Patients_login_key4 
   CONSTRAINT     \   ALTER TABLE ONLY public."Patients"
    ADD CONSTRAINT "Patients_login_key4" UNIQUE (login);
 J   ALTER TABLE ONLY public."Patients" DROP CONSTRAINT "Patients_login_key4";
       public                 postgres    false    220            �           2606    20627    Patients Patients_login_key5 
   CONSTRAINT     \   ALTER TABLE ONLY public."Patients"
    ADD CONSTRAINT "Patients_login_key5" UNIQUE (login);
 J   ALTER TABLE ONLY public."Patients" DROP CONSTRAINT "Patients_login_key5";
       public                 postgres    false    220            �           2606    20639    Patients Patients_login_key6 
   CONSTRAINT     \   ALTER TABLE ONLY public."Patients"
    ADD CONSTRAINT "Patients_login_key6" UNIQUE (login);
 J   ALTER TABLE ONLY public."Patients" DROP CONSTRAINT "Patients_login_key6";
       public                 postgres    false    220            �           2606    20625    Patients Patients_login_key7 
   CONSTRAINT     \   ALTER TABLE ONLY public."Patients"
    ADD CONSTRAINT "Patients_login_key7" UNIQUE (login);
 J   ALTER TABLE ONLY public."Patients" DROP CONSTRAINT "Patients_login_key7";
       public                 postgres    false    220            �           2606    20641    Patients Patients_login_key8 
   CONSTRAINT     \   ALTER TABLE ONLY public."Patients"
    ADD CONSTRAINT "Patients_login_key8" UNIQUE (login);
 J   ALTER TABLE ONLY public."Patients" DROP CONSTRAINT "Patients_login_key8";
       public                 postgres    false    220            �           2606    20643    Patients Patients_login_key9 
   CONSTRAINT     \   ALTER TABLE ONLY public."Patients"
    ADD CONSTRAINT "Patients_login_key9" UNIQUE (login);
 J   ALTER TABLE ONLY public."Patients" DROP CONSTRAINT "Patients_login_key9";
       public                 postgres    false    220            �           2606    18643    Patients Patients_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Patients"
    ADD CONSTRAINT "Patients_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Patients" DROP CONSTRAINT "Patients_pkey";
       public                 postgres    false    220            �           2606    20735    Services Services_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_name_key" UNIQUE (name);
 H   ALTER TABLE ONLY public."Services" DROP CONSTRAINT "Services_name_key";
       public                 postgres    false    228            �           2606    20737    Services Services_name_key1 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_name_key1" UNIQUE (name);
 I   ALTER TABLE ONLY public."Services" DROP CONSTRAINT "Services_name_key1";
       public                 postgres    false    228            �           2606    20751    Services Services_name_key10 
   CONSTRAINT     [   ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_name_key10" UNIQUE (name);
 J   ALTER TABLE ONLY public."Services" DROP CONSTRAINT "Services_name_key10";
       public                 postgres    false    228            �           2606    20729    Services Services_name_key11 
   CONSTRAINT     [   ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_name_key11" UNIQUE (name);
 J   ALTER TABLE ONLY public."Services" DROP CONSTRAINT "Services_name_key11";
       public                 postgres    false    228            �           2606    20727    Services Services_name_key12 
   CONSTRAINT     [   ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_name_key12" UNIQUE (name);
 J   ALTER TABLE ONLY public."Services" DROP CONSTRAINT "Services_name_key12";
       public                 postgres    false    228            �           2606    20753    Services Services_name_key13 
   CONSTRAINT     [   ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_name_key13" UNIQUE (name);
 J   ALTER TABLE ONLY public."Services" DROP CONSTRAINT "Services_name_key13";
       public                 postgres    false    228            �           2606    20725    Services Services_name_key14 
   CONSTRAINT     [   ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_name_key14" UNIQUE (name);
 J   ALTER TABLE ONLY public."Services" DROP CONSTRAINT "Services_name_key14";
       public                 postgres    false    228            �           2606    20739    Services Services_name_key2 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_name_key2" UNIQUE (name);
 I   ALTER TABLE ONLY public."Services" DROP CONSTRAINT "Services_name_key2";
       public                 postgres    false    228            �           2606    20741    Services Services_name_key3 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_name_key3" UNIQUE (name);
 I   ALTER TABLE ONLY public."Services" DROP CONSTRAINT "Services_name_key3";
       public                 postgres    false    228            �           2606    20743    Services Services_name_key4 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_name_key4" UNIQUE (name);
 I   ALTER TABLE ONLY public."Services" DROP CONSTRAINT "Services_name_key4";
       public                 postgres    false    228            �           2606    20733    Services Services_name_key5 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_name_key5" UNIQUE (name);
 I   ALTER TABLE ONLY public."Services" DROP CONSTRAINT "Services_name_key5";
       public                 postgres    false    228            �           2606    20745    Services Services_name_key6 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_name_key6" UNIQUE (name);
 I   ALTER TABLE ONLY public."Services" DROP CONSTRAINT "Services_name_key6";
       public                 postgres    false    228            �           2606    20747    Services Services_name_key7 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_name_key7" UNIQUE (name);
 I   ALTER TABLE ONLY public."Services" DROP CONSTRAINT "Services_name_key7";
       public                 postgres    false    228            �           2606    20731    Services Services_name_key8 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_name_key8" UNIQUE (name);
 I   ALTER TABLE ONLY public."Services" DROP CONSTRAINT "Services_name_key8";
       public                 postgres    false    228            �           2606    20749    Services Services_name_key9 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_name_key9" UNIQUE (name);
 I   ALTER TABLE ONLY public."Services" DROP CONSTRAINT "Services_name_key9";
       public                 postgres    false    228            �           2606    18691    Services Services_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Services" DROP CONSTRAINT "Services_pkey";
       public                 postgres    false    228            �           2606    20769 '   Appointments Appointments_doctorId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Appointments"
    ADD CONSTRAINT "Appointments_doctorId_fkey" FOREIGN KEY ("doctorId") REFERENCES public."Doctors"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public."Appointments" DROP CONSTRAINT "Appointments_doctorId_fkey";
       public               postgres    false    4811    232    224            �           2606    20774 (   Appointments Appointments_patientId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Appointments"
    ADD CONSTRAINT "Appointments_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES public."Patients"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public."Appointments" DROP CONSTRAINT "Appointments_patientId_fkey";
       public               postgres    false    220    232    4747            �           2606    20779 (   Appointments Appointments_serviceId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Appointments"
    ADD CONSTRAINT "Appointments_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES public."Services"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public."Appointments" DROP CONSTRAINT "Appointments_serviceId_fkey";
       public               postgres    false    4845    232    228            �           2606    20764 !   Diagnoses Diagnoses_doctorId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Diagnoses"
    ADD CONSTRAINT "Diagnoses_doctorId_fkey" FOREIGN KEY ("doctorId") REFERENCES public."Doctors"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public."Diagnoses" DROP CONSTRAINT "Diagnoses_doctorId_fkey";
       public               postgres    false    224    4811    230            �           2606    20759 "   Diagnoses Diagnoses_patientId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Diagnoses"
    ADD CONSTRAINT "Diagnoses_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES public."Patients"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public."Diagnoses" DROP CONSTRAINT "Diagnoses_patientId_fkey";
       public               postgres    false    4747    220    230            �           2606    20717 -   DoctorSchedules DoctorSchedules_doctorId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."DoctorSchedules"
    ADD CONSTRAINT "DoctorSchedules_doctorId_fkey" FOREIGN KEY ("doctorId") REFERENCES public."Doctors"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public."DoctorSchedules" DROP CONSTRAINT "DoctorSchedules_doctorId_fkey";
       public               postgres    false    224    4811    226            �           2606    20712 !   Doctors Doctors_departmentId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Doctors"
    ADD CONSTRAINT "Doctors_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES public."Departments"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public."Doctors" DROP CONSTRAINT "Doctors_departmentId_fkey";
       public               postgres    false    224    4779    222            �           2606    20754 #   Services Services_departmentId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES public."Departments"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public."Services" DROP CONSTRAINT "Services_departmentId_fkey";
       public               postgres    false    228    4779    222            �   �   x�}��N�0  �3}
�̺� ��@��0��)���0�]�V`>����o<�k|+^���c���G�)?3e*�$م}���%vo9��.����&l���4��1�dB�A�i;�&�׈�C��kr�����9�m��eR���}��]��
hw8���m뻋�����g@>�AbF�ݿ��M/w����e��}q|���s��L��ˍ��<m�4c�mB:�g0s�����x� �w\�_�      �   a   x�}̻�0��:�"="��x���GA�����3Q�+��3,LCuQK��Aˊ@��ᛤ���4.�­Tp��$ޱf�,�G����}H�""�b.      �   �   x�u�M
�0��u��KCfۚ�x���v����?�(=×+֢�"$�2aX�:�aJ��k�ĈKYR�D���u�ى��d#��Y;�H6�"rA��x~�ό��L�.�Uآ�M$��h�AΉ�f�w]"��A8����8��i7@�Mv���&��v��q\c�s����DsMDOs��      �   <  x�mQ[n�@�ޜ��-��&��p��!�!����*�!4��`ߨ�Ej�Ǳg<v�?��N
�sCRr#w����*[�߼��,�W�惔���}:p~�=�8��<�lg7q�_J(���>�w>Ւ3.�?As�V�yϵT
M$�����ւ{4l�&������0ˇ#;L�W���TK�;���Me��Uz)e���>B��zjk�U�?��a`K�����2'n���,؈��3K]�!%��-�[�
�c�qs� %�� ��� zP��R8X����!<@!)n'��x��c�+w;+��hb�(�N� �      �   y   x����	�@EѵT���BO��jq�ud �$�؁�\t�����a{�+l5[L�L%��~Q� �[�"DGlN�D/�ɯ4_�
Y�I�ۏvL��GK���T�$pR�km~��N��ޅ����F�      �   P  x�}��N�@���z3��e����m�Ԇ֚�IC� maq��&ƳW_���/���5j�3�2_23�
������t�^�d�i�v���x�(�sT�cD��,����:L�v���ު�Tm��j��f�����M�zey�
&D'@Æ:[F1+Y(/�P@ a	"	�=ZPkaMƆ���,("�_�}���^ڬc����xسԅ���hb���v���xtS�{��4,~Ƿ��?
�·��JS��?@�����2��Eт�3�ABT� R^Po)��R�%�$�|��^-�Tʓx���P��r�'�o�dQ_MO��      �     x�}��n�@���Sx�.���3��ٕDKKhP%4c�l�`ժ�}Շ��.���7�R��՝{��H���J,R�S%"�Q�Cܰ��u��*W��71^u��#�ʤ������t<i��pv{}]ۛ��	a&��یs�l�ȍ&�ˇ�g�S>���y����V0�J~O#1H��<f�rD	%�������O�Q�FIc�c �I9��;Q4��p�;"���S �1�5�d(1�'��GRa�v\Z,x�nv���'fo�j��4�W�޹xը`�z֚W���/^���X��e����͕=�[ys��t����{2Xp�-�b=?���P�Z���A�g�J��?���]�����Ǜ�ѯ��%�����n'��b��A}��'g�>I+��U�n6�"�ɻ�'y'7rs�����3�2���C �؀��9�0�㹿�$Z��j��3r�H�3��U�#Z�s=q�+����f�l�$6�Y���(�ֿ%�����/��*o      �   y  x����J�@��٧�]���?M�w��P�Ԫ��R϶O����gH��hh��f���(JI(%Yvg?��}����{��}�@�9^]w���qwt�?펛C�t;&TT|y�MF=~1�yRH� ِ�K���t�eGB�Kʧ{F���I��{|i��c�+,�\c��O��iEL	5�%"�P�B�*�.6��i3�}E+����kZ�;�.m�"҆S�*���t%*��·sbOJ�n|:�������c�L�q�>q�ɇ������`+�iq��$ä�Bs����Iv\�r_���>�Oէ�5|*�-�T��b��gZ�)��{;�K��	�*b/ʘ�h<�n%dK�����{QghfyK���N8c�a;Fc     