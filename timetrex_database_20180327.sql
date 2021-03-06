PGDMP  	    )    -                v            timetrex    9.5.6    9.5.6    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16385    timetrex    DATABASE     �   CREATE DATABASE timetrex WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE timetrex;
             timetrex    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                        3079    12355    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16388    absence_policy    TABLE     -  CREATE TABLE absence_policy (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    type_id integer DEFAULT 0 NOT NULL,
    over_time smallint DEFAULT 0 NOT NULL,
    accrual_policy_id uuid,
    premium_policy_id uuid,
    pay_stub_entry_account_id uuid,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    wage_group_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    rate numeric(9,4),
    accrual_rate numeric(9,4),
    pay_code_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    pay_formula_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    description character varying
);
 "   DROP TABLE public.absence_policy;
       public         timetrex    false    6            �            1259    16399    accrual    TABLE     .  CREATE TABLE accrual (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    accrual_policy_account_id uuid NOT NULL,
    type_id integer NOT NULL,
    user_date_total_id uuid,
    time_stamp timestamp with time zone NOT NULL,
    amount numeric DEFAULT 0 NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    note character varying,
    accrual_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid
);
    DROP TABLE public.accrual;
       public         timetrex    false    6            �            1259    16407    accrual_balance    TABLE     j  CREATE TABLE accrual_balance (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    accrual_policy_account_id uuid NOT NULL,
    balance numeric DEFAULT 0 NOT NULL,
    banked_ytd integer DEFAULT 0 NOT NULL,
    used_ytd integer DEFAULT 0 NOT NULL,
    awarded_ytd integer DEFAULT 0 NOT NULL,
    created_date integer,
    deleted smallint DEFAULT 0 NOT NULL
);
 #   DROP TABLE public.accrual_balance;
       public         timetrex    false    6            �            1259    16418    accrual_policy    TABLE       CREATE TABLE accrual_policy (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    type_id integer NOT NULL,
    minimum_time integer,
    maximum_time integer,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    apply_frequency_id smallint,
    apply_frequency_month smallint,
    apply_frequency_day_of_month smallint,
    apply_frequency_day_of_week smallint,
    milestone_rollover_hire_date smallint,
    milestone_rollover_month smallint,
    milestone_rollover_day_of_month smallint,
    minimum_employed_days integer,
    minimum_employed_days_catchup smallint,
    enable_pay_stub_balance_display smallint DEFAULT 0 NOT NULL,
    apply_frequency_hire_date smallint DEFAULT 0 NOT NULL,
    contributing_shift_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    length_of_service_contributing_pay_code_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    description character varying,
    accrual_policy_account_id uuid,
    apply_frequency_quarter_month smallint DEFAULT 1,
    enable_pro_rate_initial_period smallint DEFAULT 0,
    enable_opening_balance smallint DEFAULT 0
);
 "   DROP TABLE public.accrual_policy;
       public         timetrex    false    6            '           1259    20059    accrual_policy_account    TABLE     �  CREATE TABLE accrual_policy_account (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    description character varying,
    enable_pay_stub_balance_display smallint DEFAULT 0,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 *   DROP TABLE public.accrual_policy_account;
       public         timetrex    false    6            �            1259    18251    accrual_policy_milestone    TABLE     �  CREATE TABLE accrual_policy_milestone (
    id uuid NOT NULL,
    accrual_policy_id uuid NOT NULL,
    length_of_service numeric,
    length_of_service_unit_id smallint,
    length_of_service_days numeric,
    accrual_rate numeric,
    annual_maximum_time integer,
    maximum_time integer,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    rollover_time integer
);
 ,   DROP TABLE public.accrual_policy_milestone;
       public         timetrex    false    6            -           1259    20211    authentication    TABLE     �   CREATE TABLE authentication (
    session_id character varying(40) NOT NULL,
    object_id uuid NOT NULL,
    created_date integer NOT NULL,
    updated_date integer,
    type_id smallint NOT NULL,
    ip_address character varying(45)
);
 "   DROP TABLE public.authentication;
       public         timetrex    false    6            �            1259    16437    authorizations    TABLE     Z  CREATE TABLE authorizations (
    id uuid NOT NULL,
    object_type_id integer NOT NULL,
    object_id uuid NOT NULL,
    authorized smallint DEFAULT 0 NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 "   DROP TABLE public.authorizations;
       public         timetrex    false    6            �            1259    16445    bank_account    TABLE     �  CREATE TABLE bank_account (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    user_id uuid,
    institution character varying(15),
    transit character varying(15) NOT NULL,
    account character varying(50) NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
     DROP TABLE public.bank_account;
       public         timetrex    false    6            �            1259    16452    branch    TABLE     �  CREATE TABLE branch (
    id uuid NOT NULL,
    company_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    status_id integer NOT NULL,
    name character varying,
    address1 character varying,
    address2 character varying,
    city character varying,
    province character varying,
    country character varying,
    postal_code character varying,
    work_phone character varying,
    fax_phone character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    manual_id integer,
    name_metaphone character varying,
    longitude numeric(15,10),
    latitude numeric(15,10),
    other_id1 character varying,
    other_id2 character varying,
    other_id3 character varying,
    other_id4 character varying,
    other_id5 character varying
);
    DROP TABLE public.branch;
       public         timetrex    false    6                       1259    18622    break_policy    TABLE     X  CREATE TABLE break_policy (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    type_id integer NOT NULL,
    trigger_time integer,
    amount integer NOT NULL,
    auto_detect_type_id integer NOT NULL,
    start_window integer,
    window_length integer,
    minimum_punch_time integer,
    maximum_punch_time integer,
    include_break_punch_time smallint,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    include_multiple_breaks smallint,
    pay_code_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    pay_formula_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    branch_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    department_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    job_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    job_item_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    description character varying
);
     DROP TABLE public.break_policy;
       public         timetrex    false    6            �            1259    16472    company    TABLE     �  CREATE TABLE company (
    id uuid NOT NULL,
    parent_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    status_id integer NOT NULL,
    product_edition_id integer NOT NULL,
    name character varying,
    short_name character varying(15),
    address1 character varying,
    address2 character varying,
    city character varying,
    province character varying,
    country character varying,
    postal_code character varying,
    work_phone character varying,
    fax_phone character varying,
    business_number character varying(250),
    originator_id character varying(250),
    data_center_id character varying(250),
    admin_contact uuid,
    billing_contact uuid,
    support_contact uuid,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    enable_second_last_name smallint DEFAULT 0 NOT NULL,
    ldap_authentication_type_id smallint DEFAULT 0,
    ldap_host character varying(100),
    ldap_port integer DEFAULT 389,
    ldap_bind_user_name character varying(100),
    ldap_bind_password character varying(100),
    ldap_base_dn character varying(250),
    ldap_bind_attribute character varying(100),
    ldap_user_filter character varying(250),
    ldap_login_attribute character varying(100),
    ldap_group_dn character varying(250),
    ldap_group_user_attribute character varying(100),
    ldap_group_name character varying(100),
    ldap_group_attribute character varying(250),
    industry_id integer DEFAULT 0,
    password_policy_type_id smallint DEFAULT 0,
    password_minimum_permission_level smallint DEFAULT 10,
    password_minimum_strength smallint DEFAULT 3,
    password_minimum_length smallint DEFAULT 8,
    password_minimum_age smallint DEFAULT 0,
    password_maximum_age smallint DEFAULT 365,
    name_metaphone character varying,
    longitude numeric(15,10),
    latitude numeric(15,10),
    other_id1 character varying,
    other_id2 character varying,
    other_id3 character varying,
    other_id4 character varying,
    other_id5 character varying,
    is_setup_complete smallint DEFAULT 0 NOT NULL,
    migrate_url character varying
);
    DROP TABLE public.company;
       public         timetrex    false    6            �            1259    16483    company_deduction    TABLE       CREATE TABLE company_deduction (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    status_id integer NOT NULL,
    type_id integer NOT NULL,
    name character varying NOT NULL,
    calculation_id integer NOT NULL,
    calculation_order integer DEFAULT 0 NOT NULL,
    country character varying,
    province character varying,
    district character varying,
    company_value1 text,
    company_value2 text,
    user_value1 character varying,
    user_value2 character varying,
    user_value3 character varying,
    user_value4 character varying,
    user_value5 character varying,
    user_value6 character varying,
    user_value7 character varying,
    user_value8 character varying,
    user_value9 character varying,
    user_value10 character varying,
    lock_user_value1 smallint DEFAULT 0 NOT NULL,
    lock_user_value2 smallint DEFAULT 0 NOT NULL,
    lock_user_value3 smallint DEFAULT 0 NOT NULL,
    lock_user_value4 smallint DEFAULT 0 NOT NULL,
    lock_user_value5 smallint DEFAULT 0 NOT NULL,
    lock_user_value6 smallint DEFAULT 0 NOT NULL,
    lock_user_value7 smallint DEFAULT 0 NOT NULL,
    lock_user_value8 smallint DEFAULT 0 NOT NULL,
    lock_user_value9 smallint DEFAULT 0 NOT NULL,
    lock_user_value10 smallint DEFAULT 0 NOT NULL,
    pay_stub_entry_account_id uuid NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    minimum_length_of_service numeric(11,4),
    minimum_length_of_service_unit_id smallint,
    minimum_length_of_service_days numeric(11,4),
    maximum_length_of_service numeric(11,4),
    maximum_length_of_service_unit_id smallint,
    maximum_length_of_service_days numeric(11,4),
    include_account_amount_type_id smallint DEFAULT 10,
    exclude_account_amount_type_id smallint DEFAULT 10,
    minimum_user_age numeric(11,4),
    maximum_user_age numeric(11,4),
    company_value3 text,
    company_value4 text,
    company_value5 text,
    company_value6 text,
    company_value7 text,
    company_value8 text,
    company_value9 text,
    company_value10 text,
    apply_frequency_id smallint DEFAULT 10,
    apply_frequency_month smallint,
    apply_frequency_day_of_month smallint,
    apply_frequency_day_of_week smallint,
    apply_frequency_quarter_month smallint,
    pay_stub_entry_description character varying,
    length_of_service_contributing_pay_code_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    apply_payroll_run_type_id smallint DEFAULT 0,
    legal_entity_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    payroll_remittance_agency_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid
);
 %   DROP TABLE public.company_deduction;
       public         timetrex    false    6            �            1259    16504 (   company_deduction_pay_stub_entry_account    TABLE     �   CREATE TABLE company_deduction_pay_stub_entry_account (
    id uuid NOT NULL,
    company_deduction_id uuid NOT NULL,
    type_id integer NOT NULL,
    pay_stub_entry_account_id uuid NOT NULL
);
 <   DROP TABLE public.company_deduction_pay_stub_entry_account;
       public         timetrex    false    6                       1259    18614    company_generic_map    TABLE     �   CREATE TABLE company_generic_map (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    object_type_id integer NOT NULL,
    object_id uuid,
    map_id uuid
);
 '   DROP TABLE public.company_generic_map;
       public         timetrex    false    6                       1259    18988    company_generic_tag    TABLE     �  CREATE TABLE company_generic_tag (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    object_type_id integer NOT NULL,
    name character varying NOT NULL,
    name_metaphone character varying,
    description character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted integer DEFAULT 0 NOT NULL
);
 '   DROP TABLE public.company_generic_tag;
       public         timetrex    false    6                       1259    19001    company_generic_tag_map    TABLE     �   CREATE TABLE company_generic_tag_map (
    id uuid NOT NULL,
    object_type_id integer NOT NULL,
    object_id uuid,
    tag_id uuid
);
 +   DROP TABLE public.company_generic_tag_map;
       public         timetrex    false    6                       1259    19446    company_setting    TABLE     k  CREATE TABLE company_setting (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    type_id integer NOT NULL,
    name character varying NOT NULL,
    value character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 #   DROP TABLE public.company_setting;
       public         timetrex    false    6            �            1259    17195    company_user_count    TABLE     �   CREATE TABLE company_user_count (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    date_stamp date NOT NULL,
    active_users integer NOT NULL,
    inactive_users integer NOT NULL,
    deleted_users integer NOT NULL,
    created_date integer
);
 &   DROP TABLE public.company_user_count;
       public         timetrex    false    6            %           1259    19721    contributing_pay_code_policy    TABLE     `  CREATE TABLE contributing_pay_code_policy (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    description character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 0   DROP TABLE public.contributing_pay_code_policy;
       public         timetrex    false    6            &           1259    19731    contributing_shift_policy    TABLE     �  CREATE TABLE contributing_shift_policy (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    description character varying,
    contributing_pay_code_policy_id uuid,
    filter_start_date date,
    filter_end_date date,
    filter_start_time time without time zone,
    filter_end_time time without time zone,
    filter_minimum_time integer,
    filter_maximum_time integer,
    include_shift_type_id smallint DEFAULT 0,
    branch_selection_type_id smallint DEFAULT 10,
    exclude_default_branch smallint DEFAULT 0,
    department_selection_type_id smallint DEFAULT 10,
    exclude_default_department smallint DEFAULT 0,
    job_group_selection_type_id smallint DEFAULT 10,
    job_selection_type_id smallint DEFAULT 10,
    exclude_default_job smallint DEFAULT 0,
    job_item_group_selection_type_id smallint DEFAULT 10,
    job_item_selection_type_id smallint DEFAULT 10,
    exclude_default_job_item smallint DEFAULT 0,
    sun smallint DEFAULT 1,
    mon smallint DEFAULT 1,
    tue smallint DEFAULT 1,
    wed smallint DEFAULT 1,
    thu smallint DEFAULT 1,
    fri smallint DEFAULT 1,
    sat smallint DEFAULT 1,
    include_schedule_shift_type_id integer DEFAULT 0,
    include_holiday_type_id integer DEFAULT 10,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 -   DROP TABLE public.contributing_shift_policy;
       public         timetrex    false    6            �            1259    16510    cron    TABLE     Q  CREATE TABLE cron (
    id uuid NOT NULL,
    status_id integer DEFAULT 10 NOT NULL,
    name character varying NOT NULL,
    minute character varying NOT NULL,
    hour character varying NOT NULL,
    day_of_month character varying NOT NULL,
    month character varying NOT NULL,
    day_of_week character varying NOT NULL,
    command character varying NOT NULL,
    last_run_date timestamp with time zone,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.cron;
       public         timetrex    false    6            �            1259    18271    currency    TABLE     �  CREATE TABLE currency (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    status_id integer NOT NULL,
    name character varying NOT NULL,
    iso_code character varying(5) NOT NULL,
    conversion_rate numeric(18,10),
    auto_update smallint,
    actual_rate numeric(18,10),
    actual_rate_updated_date integer,
    rate_modify_percent numeric(18,10),
    is_base smallint DEFAULT 0 NOT NULL,
    is_default smallint DEFAULT 0 NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    round_decimal_places smallint DEFAULT 2 NOT NULL
);
    DROP TABLE public.currency;
       public         timetrex    false    6            !           1259    19643    currency_rate    TABLE     U  CREATE TABLE currency_rate (
    id uuid NOT NULL,
    currency_id uuid NOT NULL,
    date_stamp date NOT NULL,
    conversion_rate numeric(18,10) NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 !   DROP TABLE public.currency_rate;
       public         timetrex    false    6            �            1259    16521 
   department    TABLE     Y  CREATE TABLE department (
    id uuid NOT NULL,
    company_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    status_id integer NOT NULL,
    name character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    manual_id integer,
    name_metaphone character varying,
    other_id1 character varying,
    other_id2 character varying,
    other_id3 character varying,
    other_id4 character varying,
    other_id5 character varying
);
    DROP TABLE public.department;
       public         timetrex    false    6            �            1259    16532    department_branch    TABLE     �   CREATE TABLE department_branch (
    id uuid NOT NULL,
    branch_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    department_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL
);
 %   DROP TABLE public.department_branch;
       public         timetrex    false    6            �            1259    16540    department_branch_user    TABLE     �   CREATE TABLE department_branch_user (
    id uuid NOT NULL,
    department_branch_id uuid NOT NULL,
    user_id uuid NOT NULL
);
 *   DROP TABLE public.department_branch_user;
       public         timetrex    false    6                       1259    19435    ethnic_group    TABLE     Y  CREATE TABLE ethnic_group (
    id uuid NOT NULL,
    company_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    name character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
     DROP TABLE public.ethnic_group;
       public         timetrex    false    6            +           1259    20173 	   exception    TABLE     t  CREATE TABLE exception (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    pay_period_id uuid NOT NULL,
    date_stamp date NOT NULL,
    exception_policy_id uuid NOT NULL,
    punch_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    punch_control_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    type_id smallint NOT NULL,
    enable_demerit smallint DEFAULT 1 NOT NULL,
    authorized smallint DEFAULT 0 NOT NULL,
    authorization_level smallint DEFAULT 99 NOT NULL,
    acknowledged_type_id smallint DEFAULT 0 NOT NULL,
    acknowledged_reason_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    note character varying
);
    DROP TABLE public.exception;
       public         timetrex    false    6            �            1259    16554    exception_policy    TABLE     @  CREATE TABLE exception_policy (
    id uuid NOT NULL,
    exception_policy_control_id uuid NOT NULL,
    type_id character varying(3) NOT NULL,
    severity_id integer NOT NULL,
    grace integer,
    watch_window integer,
    demerit integer,
    active smallint DEFAULT 0 NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    enable_authorization smallint DEFAULT 0 NOT NULL,
    email_notification_id integer DEFAULT 0 NOT NULL
);
 $   DROP TABLE public.exception_policy;
       public         timetrex    false    6            �            1259    16562    exception_policy_control    TABLE     \  CREATE TABLE exception_policy_control (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    description character varying
);
 ,   DROP TABLE public.exception_policy_control;
       public         timetrex    false    6            �            1259    16572    help    TABLE     �  CREATE TABLE help (
    id uuid NOT NULL,
    type_id integer NOT NULL,
    status_id integer NOT NULL,
    heading character varying,
    body text NOT NULL,
    keywords character varying,
    private smallint DEFAULT 0 NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.help;
       public         timetrex    false    6            �            1259    16583 
   help_group    TABLE     �   CREATE TABLE help_group (
    id uuid NOT NULL,
    help_group_control_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    help_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    order_value integer
);
    DROP TABLE public.help_group;
       public         timetrex    false    6            �            1259    16591    help_group_control    TABLE     /  CREATE TABLE help_group_control (
    id uuid NOT NULL,
    script_name character varying,
    name character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 &   DROP TABLE public.help_group_control;
       public         timetrex    false    6            �            1259    16601    hierarchy_control    TABLE     U  CREATE TABLE hierarchy_control (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    description character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 %   DROP TABLE public.hierarchy_control;
       public         timetrex    false    6            	           1259    18689    hierarchy_level    TABLE     K  CREATE TABLE hierarchy_level (
    id uuid NOT NULL,
    hierarchy_control_id uuid NOT NULL,
    level integer NOT NULL,
    user_id uuid NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted integer DEFAULT 0 NOT NULL
);
 #   DROP TABLE public.hierarchy_level;
       public         timetrex    false    6            �            1259    16611    hierarchy_object_type    TABLE     �   CREATE TABLE hierarchy_object_type (
    id uuid NOT NULL,
    hierarchy_control_id uuid NOT NULL,
    object_type_id integer NOT NULL
);
 )   DROP TABLE public.hierarchy_object_type;
       public         timetrex    false    6            �            1259    16617    hierarchy_share    TABLE     �   CREATE TABLE hierarchy_share (
    id uuid NOT NULL,
    hierarchy_control_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    user_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL
);
 #   DROP TABLE public.hierarchy_share;
       public         timetrex    false    6            
           1259    18697    hierarchy_user    TABLE     y   CREATE TABLE hierarchy_user (
    id uuid NOT NULL,
    hierarchy_control_id uuid NOT NULL,
    user_id uuid NOT NULL
);
 "   DROP TABLE public.hierarchy_user;
       public         timetrex    false    6            �            1259    16642    holiday_policy    TABLE     �  CREATE TABLE holiday_policy (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    type_id integer NOT NULL,
    default_schedule_status_id integer NOT NULL,
    minimum_employed_days integer NOT NULL,
    minimum_worked_period_days integer,
    minimum_worked_days integer,
    average_time_days integer,
    include_over_time smallint DEFAULT 0 NOT NULL,
    include_paid_absence_time smallint DEFAULT 0 NOT NULL,
    minimum_time integer,
    maximum_time integer,
    "time" integer,
    absence_policy_id uuid,
    round_interval_policy_id uuid,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    force_over_time_policy smallint DEFAULT 0,
    average_time_worked_days smallint DEFAULT 0,
    worked_scheduled_days smallint DEFAULT 0,
    minimum_worked_after_period_days integer DEFAULT 0,
    minimum_worked_after_days integer DEFAULT 0,
    worked_after_scheduled_days smallint DEFAULT 0,
    paid_absence_as_worked smallint DEFAULT 0,
    average_days integer,
    contributing_shift_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    eligible_contributing_shift_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    description character varying,
    shift_on_holiday_type_id integer DEFAULT 0,
    average_time_frequency_type_id smallint DEFAULT 10
);
 "   DROP TABLE public.holiday_policy;
       public         timetrex    false    6            �            1259    16656     holiday_policy_recurring_holiday    TABLE     �   CREATE TABLE holiday_policy_recurring_holiday (
    id uuid NOT NULL,
    holiday_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    recurring_holiday_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL
);
 4   DROP TABLE public.holiday_policy_recurring_holiday;
       public         timetrex    false    6            �            1259    16664    holidays    TABLE     N  CREATE TABLE holidays (
    id uuid NOT NULL,
    holiday_policy_id uuid NOT NULL,
    date_stamp date NOT NULL,
    name character varying NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.holidays;
       public         timetrex    false    6                       1259    19375    kpi    TABLE     �  CREATE TABLE kpi (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    status_id integer NOT NULL,
    type_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    minimum_rate numeric(9,2),
    maximum_rate numeric(9,2),
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.kpi;
       public         timetrex    false    6                       1259    19407 	   kpi_group    TABLE     s  CREATE TABLE kpi_group (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    parent_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL
);
    DROP TABLE public.kpi_group;
       public         timetrex    false    6            /           1259    20384    legal_entity    TABLE     �  CREATE TABLE legal_entity (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    status_id integer NOT NULL,
    type_id integer NOT NULL,
    classification_code character varying,
    legal_name character varying NOT NULL,
    trade_name character varying NOT NULL,
    address1 character varying,
    address2 character varying,
    country character varying,
    city character varying,
    province character varying,
    postal_code character varying,
    work_phone character varying,
    fax_phone character varying,
    start_date integer,
    end_date integer,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
     DROP TABLE public.legal_entity;
       public         timetrex    false    6            �            1259    16684    meal_policy    TABLE     <  CREATE TABLE meal_policy (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    type_id integer NOT NULL,
    amount integer NOT NULL,
    trigger_time integer,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    start_window integer,
    window_length integer,
    include_lunch_punch_time smallint,
    auto_detect_type_id integer DEFAULT 10 NOT NULL,
    minimum_punch_time integer,
    maximum_punch_time integer,
    pay_code_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    pay_formula_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    branch_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    department_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    job_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    job_item_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    description character varying
);
    DROP TABLE public.meal_policy;
       public         timetrex    false    6            �            1259    16694    message    TABLE     7  CREATE TABLE message (
    id uuid NOT NULL,
    parent_id uuid NOT NULL,
    object_type_id integer NOT NULL,
    object_id uuid NOT NULL,
    priority_id integer NOT NULL,
    status_id integer NOT NULL,
    status_date integer,
    subject character varying,
    body text,
    require_ack smallint DEFAULT 0,
    ack smallint DEFAULT 0,
    ack_date integer,
    ack_by integer,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.message;
       public         timetrex    false    6                       1259    18832    message_control    TABLE     �  CREATE TABLE message_control (
    id uuid NOT NULL,
    object_type_id integer NOT NULL,
    object_id uuid NOT NULL,
    require_ack smallint DEFAULT 0 NOT NULL,
    priority_id smallint DEFAULT 0 NOT NULL,
    subject character varying,
    body text,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 #   DROP TABLE public.message_control;
       public         timetrex    false    6                       1259    18818    message_recipient    TABLE     �  CREATE TABLE message_recipient (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    message_sender_id uuid NOT NULL,
    status_id integer NOT NULL,
    status_date integer,
    ack smallint,
    ack_date integer,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 %   DROP TABLE public.message_recipient;
       public         timetrex    false    6                       1259    18825    message_sender    TABLE     J  CREATE TABLE message_sender (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    parent_id uuid NOT NULL,
    message_control_id uuid NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 "   DROP TABLE public.message_sender;
       public         timetrex    false    6            �            1259    16705    other_field    TABLE       CREATE TABLE other_field (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    type_id integer NOT NULL,
    other_id1 character varying,
    other_id2 character varying,
    other_id3 character varying,
    other_id4 character varying,
    other_id5 character varying,
    other_id6 character varying,
    other_id7 character varying,
    other_id8 character varying,
    other_id9 character varying,
    other_id10 character varying,
    required_other_id1 smallint DEFAULT 0,
    required_other_id2 smallint DEFAULT 0,
    required_other_id3 smallint DEFAULT 0,
    required_other_id4 smallint DEFAULT 0,
    required_other_id5 smallint DEFAULT 0,
    required_other_id6 smallint DEFAULT 0,
    required_other_id7 smallint DEFAULT 0,
    required_other_id8 smallint DEFAULT 0,
    required_other_id9 smallint DEFAULT 0,
    required_other_id10 smallint DEFAULT 0,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.other_field;
       public         timetrex    false    6            �            1259    16725    over_time_policy    TABLE     �  CREATE TABLE over_time_policy (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    type_id integer NOT NULL,
    trigger_time integer NOT NULL,
    rate numeric(9,4) NOT NULL,
    accrual_policy_id uuid,
    accrual_rate numeric(9,4) NOT NULL,
    pay_stub_entry_account_id uuid,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    wage_group_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    pay_code_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    pay_formula_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    contributing_shift_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    branch_selection_type_id smallint DEFAULT 10,
    exclude_default_branch smallint DEFAULT 0,
    department_selection_type_id smallint DEFAULT 10,
    exclude_default_department smallint DEFAULT 0,
    job_group_selection_type_id smallint DEFAULT 10,
    job_selection_type_id smallint DEFAULT 10,
    exclude_default_job smallint DEFAULT 0,
    job_item_group_selection_type_id smallint DEFAULT 10,
    job_item_selection_type_id smallint DEFAULT 10,
    exclude_default_job_item smallint DEFAULT 0,
    description character varying,
    trigger_time_adjust_contributing_shift_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid
);
 $   DROP TABLE public.over_time_policy;
       public         timetrex    false    6            "           1259    19675    pay_code    TABLE     	  CREATE TABLE pay_code (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    description character varying,
    code character varying NOT NULL,
    type_id smallint NOT NULL,
    pay_formula_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    pay_stub_entry_account_id uuid,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.pay_code;
       public         timetrex    false    6            #           1259    19686    pay_formula_policy    TABLE     "  CREATE TABLE pay_formula_policy (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    description character varying,
    wage_source_type_id smallint DEFAULT 10,
    wage_source_contributing_shift_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    time_source_contributing_shift_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    wage_group_id uuid,
    pay_type_id smallint DEFAULT 10,
    rate numeric(9,4),
    custom_formula character varying,
    accrual_policy_account_id uuid,
    accrual_rate numeric(9,4),
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 &   DROP TABLE public.pay_formula_policy;
       public         timetrex    false    6            �            1259    16735 
   pay_period    TABLE     �  CREATE TABLE pay_period (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    pay_period_schedule_id uuid NOT NULL,
    status_id integer NOT NULL,
    is_primary smallint DEFAULT 0 NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    transaction_date timestamp without time zone,
    advance_end_date timestamp without time zone,
    advance_transaction_date timestamp without time zone,
    tainted smallint DEFAULT 0,
    tainted_by uuid,
    tainted_date integer
);
    DROP TABLE public.pay_period;
       public         timetrex    false    6            �            1259    16744    pay_period_schedule    TABLE     �  CREATE TABLE pay_period_schedule (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    description character varying,
    type_id integer NOT NULL,
    primary_date_ldom smallint DEFAULT 0,
    primary_transaction_date_ldom smallint DEFAULT 0,
    primary_transaction_date_bd smallint DEFAULT 0,
    secondary_date_ldom smallint DEFAULT 0,
    secondary_transaction_date_ldom smallint DEFAULT 0,
    secondary_transaction_date_bd smallint DEFAULT 0,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    anchor_date timestamp without time zone,
    primary_date timestamp without time zone,
    primary_transaction_date timestamp without time zone,
    secondary_date timestamp without time zone,
    secondary_transaction_date timestamp without time zone,
    day_start_time integer,
    day_continuous_time integer,
    start_week_day_id integer,
    start_day_of_week smallint,
    transaction_date smallint,
    primary_day_of_month smallint,
    secondary_day_of_month smallint,
    primary_transaction_day_of_month smallint,
    secondary_transaction_day_of_month smallint,
    transaction_date_bd smallint,
    time_zone character varying,
    new_day_trigger_time integer,
    maximum_shift_time integer,
    shift_assigned_day_id integer,
    timesheet_verify_before_end_date integer,
    timesheet_verify_before_transaction_date integer,
    timesheet_verify_notice_before_transaction_date integer,
    timesheet_verify_notice_email integer,
    annual_pay_periods integer,
    timesheet_verify_type_id integer DEFAULT 10
);
 '   DROP TABLE public.pay_period_schedule;
       public         timetrex    false    6            �            1259    16754    pay_period_schedule_user    TABLE     �   CREATE TABLE pay_period_schedule_user (
    id uuid NOT NULL,
    pay_period_schedule_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    user_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL
);
 ,   DROP TABLE public.pay_period_schedule_user;
       public         timetrex    false    6            �            1259    17187    pay_period_time_sheet_verify    TABLE     �  CREATE TABLE pay_period_time_sheet_verify (
    id uuid NOT NULL,
    pay_period_id uuid NOT NULL,
    user_id uuid NOT NULL,
    status_id integer NOT NULL,
    authorized smallint DEFAULT 0 NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    authorization_level smallint DEFAULT 99,
    user_verified smallint DEFAULT 0,
    user_verified_date integer
);
 0   DROP TABLE public.pay_period_time_sheet_verify;
       public         timetrex    false    6            �            1259    16762    pay_stub    TABLE     )  CREATE TABLE pay_stub (
    id uuid NOT NULL,
    pay_period_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    user_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    status_id integer DEFAULT 0 NOT NULL,
    status_date integer,
    status_by uuid,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    transaction_date timestamp without time zone,
    tainted smallint DEFAULT 0 NOT NULL,
    temp smallint DEFAULT 0,
    currency_id uuid,
    currency_rate numeric(18,10),
    type_id smallint DEFAULT 10,
    run_id smallint DEFAULT 1
);
    DROP TABLE public.pay_stub;
       public         timetrex    false    6            �            1259    16775    pay_stub_amendment    TABLE     �  CREATE TABLE pay_stub_amendment (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    pay_stub_entry_name_id uuid NOT NULL,
    status_id integer DEFAULT 10 NOT NULL,
    effective_date integer,
    rate numeric(20,4),
    units numeric(20,4),
    amount numeric(20,4) DEFAULT 0 NOT NULL,
    description character varying,
    authorized smallint DEFAULT 0,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    recurring_ps_amendment_id uuid,
    ytd_adjustment smallint DEFAULT 0,
    type_id integer NOT NULL,
    percent_amount numeric(20,4),
    percent_amount_entry_name_id uuid,
    private_description character varying
);
 &   DROP TABLE public.pay_stub_amendment;
       public         timetrex    false    6            �            1259    16789    pay_stub_entry    TABLE     �  CREATE TABLE pay_stub_entry (
    id uuid NOT NULL,
    pay_stub_id uuid NOT NULL,
    rate numeric(20,4) DEFAULT 0 NOT NULL,
    units numeric(20,4) DEFAULT 0 NOT NULL,
    ytd_units numeric(20,4) DEFAULT 0 NOT NULL,
    amount numeric(20,4) DEFAULT 0 NOT NULL,
    ytd_amount numeric(20,4) DEFAULT 0 NOT NULL,
    description character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    pay_stub_entry_name_id uuid NOT NULL,
    pay_stub_amendment_id uuid,
    user_expense_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid
);
 "   DROP TABLE public.pay_stub_entry;
       public         timetrex    false    6            �            1259    16804    pay_stub_entry_account    TABLE     4  CREATE TABLE pay_stub_entry_account (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    status_id integer NOT NULL,
    type_id integer NOT NULL,
    ps_order integer NOT NULL,
    name character varying NOT NULL,
    accrual_pay_stub_entry_account_id uuid,
    debit_account character varying,
    credit_account character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    accrual_type_id smallint DEFAULT 10
);
 *   DROP TABLE public.pay_stub_entry_account;
       public         timetrex    false    6            �            1259    16814    pay_stub_entry_account_link    TABLE       CREATE TABLE pay_stub_entry_account_link (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    total_gross uuid,
    total_employee_deduction uuid,
    total_employer_deduction uuid,
    total_net_pay uuid,
    regular_time uuid,
    monthly_advance integer,
    monthly_advance_deduction integer,
    employee_cpp uuid,
    employee_ei uuid,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 /   DROP TABLE public.pay_stub_entry_account_link;
       public         timetrex    false    6            4           1259    20443    pay_stub_transaction    TABLE        CREATE TABLE pay_stub_transaction (
    id uuid NOT NULL,
    parent_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    pay_stub_id uuid NOT NULL,
    remittance_source_account_id uuid NOT NULL,
    remittance_destination_account_id uuid NOT NULL,
    currency_id uuid NOT NULL,
    status_id integer NOT NULL,
    type_id integer NOT NULL,
    currency_rate numeric(18,10) DEFAULT 1 NOT NULL,
    amount numeric(18,4) DEFAULT 0 NOT NULL,
    transaction_date timestamp without time zone,
    confirmation_number character varying,
    note character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 (   DROP TABLE public.pay_stub_transaction;
       public         timetrex    false    6            0           1259    20394    payroll_remittance_agency    TABLE     �  CREATE TABLE payroll_remittance_agency (
    id uuid NOT NULL,
    legal_entity_id uuid NOT NULL,
    status_id integer NOT NULL,
    type_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    country character varying,
    province character varying,
    district character varying,
    agency_id character varying NOT NULL,
    primary_identification character varying,
    secondary_identification character varying,
    tertiary_identification character varying,
    user_name character varying,
    password character varying,
    contact_user_id uuid NOT NULL,
    remittance_source_account_id uuid NOT NULL,
    start_date integer,
    end_date integer,
    always_week_day_id smallint DEFAULT 0,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 -   DROP TABLE public.payroll_remittance_agency;
       public         timetrex    false    6            1           1259    20405    payroll_remittance_agency_event    TABLE     >  CREATE TABLE payroll_remittance_agency_event (
    id uuid NOT NULL,
    payroll_remittance_agency_id uuid NOT NULL,
    status_id integer NOT NULL,
    type_id character varying NOT NULL,
    frequency_id integer NOT NULL,
    quarter_month smallint DEFAULT 0,
    primary_month smallint DEFAULT 0,
    primary_day_of_month smallint DEFAULT 0,
    secondary_month smallint DEFAULT 0,
    secondary_day_of_month smallint DEFAULT 0,
    day_of_week smallint DEFAULT 0,
    due_date_delay_days integer,
    effective_date integer,
    reminder_user_id uuid,
    user_report_data_id uuid,
    reminder_days integer,
    note character varying,
    last_due_date timestamp with time zone,
    due_date timestamp with time zone,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    next_reminder_date timestamp with time zone,
    last_reminder_date timestamp with time zone,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 3   DROP TABLE public.payroll_remittance_agency_event;
       public         timetrex    false    6            �            1259    18308 
   permission    TABLE     i  CREATE TABLE permission (
    id uuid NOT NULL,
    permission_control_id uuid NOT NULL,
    section character varying,
    name character varying,
    value character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.permission;
       public         timetrex    false    6            �            1259    18292    permission_control    TABLE     }  CREATE TABLE permission_control (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    level smallint DEFAULT 1
);
 &   DROP TABLE public.permission_control;
       public         timetrex    false    6            �            1259    18302    permission_user    TABLE     {   CREATE TABLE permission_user (
    id uuid NOT NULL,
    permission_control_id uuid NOT NULL,
    user_id uuid NOT NULL
);
 #   DROP TABLE public.permission_user;
       public         timetrex    false    6            �            1259    16831    policy_group    TABLE     �  CREATE TABLE policy_group (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    exception_policy_control_id uuid,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    accrual_policy_id uuid,
    description character varying
);
     DROP TABLE public.policy_group;
       public         timetrex    false    6            �            1259    16865    policy_group_user    TABLE     �   CREATE TABLE policy_group_user (
    id uuid NOT NULL,
    policy_group_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    user_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL
);
 %   DROP TABLE public.policy_group_user;
       public         timetrex    false    6            �            1259    16873    premium_policy    TABLE     �  CREATE TABLE premium_policy (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    type_id integer NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    start_time time without time zone,
    end_time time without time zone,
    sun smallint DEFAULT 0 NOT NULL,
    mon smallint DEFAULT 0 NOT NULL,
    tue smallint DEFAULT 0 NOT NULL,
    wed smallint DEFAULT 0 NOT NULL,
    thu smallint DEFAULT 0 NOT NULL,
    fri smallint DEFAULT 0 NOT NULL,
    sat smallint DEFAULT 0 NOT NULL,
    pay_type_id integer NOT NULL,
    rate numeric(9,4) NOT NULL,
    accrual_policy_id uuid,
    accrual_rate numeric(9,4),
    pay_stub_entry_account_id uuid,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    daily_trigger_time integer,
    weekly_trigger_time integer,
    minimum_time integer,
    maximum_time integer,
    include_meal_policy smallint,
    exclude_default_branch smallint,
    exclude_default_department smallint,
    branch_selection_type_id smallint,
    department_selection_type_id smallint,
    job_group_selection_type_id smallint,
    job_selection_type_id smallint,
    job_item_group_selection_type_id smallint,
    job_item_selection_type_id smallint,
    maximum_no_break_time integer,
    minimum_break_time integer,
    include_partial_punch smallint DEFAULT 0 NOT NULL,
    wage_group_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    include_break_policy smallint DEFAULT 0,
    minimum_time_between_shift integer,
    minimum_first_shift_time integer,
    minimum_shift_time integer,
    include_holiday_type_id integer DEFAULT 10,
    maximum_daily_trigger_time integer DEFAULT 0,
    maximum_weekly_trigger_time integer DEFAULT 0,
    pay_code_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    pay_formula_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    contributing_shift_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    exclude_default_job smallint DEFAULT 0,
    exclude_default_job_item smallint DEFAULT 0,
    description character varying
);
 "   DROP TABLE public.premium_policy;
       public         timetrex    false    6            �            1259    18319    premium_policy_branch    TABLE        CREATE TABLE premium_policy_branch (
    id uuid NOT NULL,
    premium_policy_id uuid NOT NULL,
    branch_id uuid NOT NULL
);
 )   DROP TABLE public.premium_policy_branch;
       public         timetrex    false    6            �            1259    18325    premium_policy_department    TABLE     �   CREATE TABLE premium_policy_department (
    id uuid NOT NULL,
    premium_policy_id uuid NOT NULL,
    department_id uuid NOT NULL
);
 -   DROP TABLE public.premium_policy_department;
       public         timetrex    false    6            �            1259    16890    punch    TABLE     �  CREATE TABLE punch (
    id uuid NOT NULL,
    punch_control_id uuid NOT NULL,
    station_id uuid,
    type_id integer NOT NULL,
    status_id integer NOT NULL,
    time_stamp timestamp with time zone NOT NULL,
    original_time_stamp timestamp with time zone NOT NULL,
    actual_time_stamp timestamp with time zone NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    transfer smallint DEFAULT 0,
    longitude numeric(15,10),
    latitude numeric(15,10),
    position_accuracy integer,
    has_image smallint
);
    DROP TABLE public.punch;
       public         timetrex    false    6            )           1259    20118    punch_control    TABLE       CREATE TABLE punch_control (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    pay_period_id uuid NOT NULL,
    date_stamp date NOT NULL,
    branch_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    department_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    job_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    job_item_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    quantity numeric DEFAULT 0 NOT NULL,
    bad_quantity numeric DEFAULT 0 NOT NULL,
    total_time integer DEFAULT 0 NOT NULL,
    actual_total_time integer DEFAULT 0 NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    other_id1 character varying,
    other_id2 character varying,
    other_id3 character varying,
    other_id4 character varying,
    other_id5 character varying,
    note character varying
);
 !   DROP TABLE public.punch_control;
       public         timetrex    false    6                       1259    19288    qualification    TABLE     =  CREATE TABLE qualification (
    id uuid NOT NULL,
    type_id integer NOT NULL,
    company_id uuid NOT NULL,
    group_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    name character varying NOT NULL,
    name_metaphone character varying,
    description text,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    source_type_id integer DEFAULT 10 NOT NULL,
    visibility_type_id integer DEFAULT 10 NOT NULL
);
 !   DROP TABLE public.qualification;
       public         timetrex    false    6                       1259    19357    qualification_group    TABLE     }  CREATE TABLE qualification_group (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    parent_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL
);
 '   DROP TABLE public.qualification_group;
       public         timetrex    false    6            �            1259    16911    recurring_holiday    TABLE     0  CREATE TABLE recurring_holiday (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    type_id integer NOT NULL,
    name character varying NOT NULL,
    special_day smallint DEFAULT 0 NOT NULL,
    week_interval integer,
    day_of_week integer,
    day_of_month integer,
    month_int integer,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    pivot_day_direction_id integer,
    always_week_day_id integer DEFAULT 0
);
 %   DROP TABLE public.recurring_holiday;
       public         timetrex    false    6            �            1259    16922    recurring_ps_amendment    TABLE     �  CREATE TABLE recurring_ps_amendment (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    status_id integer DEFAULT 10 NOT NULL,
    start_date integer NOT NULL,
    end_date integer,
    frequency_id integer NOT NULL,
    name character varying,
    description character varying,
    pay_stub_entry_name_id uuid NOT NULL,
    rate numeric(20,4),
    units numeric(20,4),
    amount numeric(20,4),
    percent_amount numeric(20,4),
    percent_amount_entry_name_id uuid,
    ps_amendment_description character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    type_id integer NOT NULL
);
 *   DROP TABLE public.recurring_ps_amendment;
       public         timetrex    false    6            �            1259    16933    recurring_ps_amendment_user    TABLE     �   CREATE TABLE recurring_ps_amendment_user (
    id uuid NOT NULL,
    recurring_ps_amendment_id uuid NOT NULL,
    user_id uuid NOT NULL
);
 /   DROP TABLE public.recurring_ps_amendment_user;
       public         timetrex    false    6            .           1259    20224    recurring_schedule    TABLE     �  CREATE TABLE recurring_schedule (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    user_id uuid NOT NULL,
    recurring_schedule_control_id uuid NOT NULL,
    date_stamp date NOT NULL,
    status_id smallint DEFAULT 10 NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    schedule_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    absence_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    branch_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    department_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    job_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    job_item_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    total_time integer DEFAULT 0 NOT NULL,
    recurring_schedule_template_control_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    auto_fill smallint DEFAULT 0 NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    other_id1 character varying,
    other_id2 character varying,
    other_id3 character varying,
    other_id4 character varying,
    other_id5 character varying,
    note character varying
);
 &   DROP TABLE public.recurring_schedule;
       public         timetrex    false    6            �            1259    16939    recurring_schedule_control    TABLE     �  CREATE TABLE recurring_schedule_control (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    recurring_schedule_template_control_id uuid NOT NULL,
    start_week integer NOT NULL,
    start_date date NOT NULL,
    end_date date,
    auto_fill smallint DEFAULT 0 NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    display_weeks smallint DEFAULT 4
);
 .   DROP TABLE public.recurring_schedule_control;
       public         timetrex    false    6            �            1259    16947    recurring_schedule_template    TABLE     �  CREATE TABLE recurring_schedule_template (
    id uuid NOT NULL,
    recurring_schedule_template_control_id uuid NOT NULL,
    week integer NOT NULL,
    sun smallint DEFAULT 0 NOT NULL,
    mon smallint DEFAULT 0 NOT NULL,
    tue smallint DEFAULT 0 NOT NULL,
    wed smallint DEFAULT 0 NOT NULL,
    thu smallint DEFAULT 0 NOT NULL,
    fri smallint DEFAULT 0 NOT NULL,
    sat smallint DEFAULT 0 NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    schedule_policy_id uuid,
    branch_id uuid,
    department_id uuid,
    job_id uuid,
    job_item_id uuid,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    status_id integer DEFAULT 10 NOT NULL,
    absence_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    open_shift_multiplier integer DEFAULT 1
);
 /   DROP TABLE public.recurring_schedule_template;
       public         timetrex    false    6            �            1259    16961 #   recurring_schedule_template_control    TABLE     g  CREATE TABLE recurring_schedule_template_control (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    description character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 7   DROP TABLE public.recurring_schedule_template_control;
       public         timetrex    false    6            �            1259    16971    recurring_schedule_user    TABLE     �   CREATE TABLE recurring_schedule_user (
    id uuid NOT NULL,
    recurring_schedule_control_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    user_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL
);
 +   DROP TABLE public.recurring_schedule_user;
       public         timetrex    false    6            $           1259    19700    regular_time_policy    TABLE     
  CREATE TABLE regular_time_policy (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    description character varying,
    contributing_shift_policy_id uuid NOT NULL,
    calculation_order integer,
    pay_formula_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    pay_code_id uuid,
    branch_selection_type_id smallint DEFAULT 10,
    exclude_default_branch smallint DEFAULT 0,
    department_selection_type_id smallint DEFAULT 10,
    exclude_default_department smallint DEFAULT 0,
    job_group_selection_type_id smallint DEFAULT 10,
    job_selection_type_id smallint DEFAULT 10,
    exclude_default_job smallint DEFAULT 0,
    job_item_group_selection_type_id smallint DEFAULT 10,
    job_item_selection_type_id smallint DEFAULT 10,
    exclude_default_job_item smallint DEFAULT 0,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 '   DROP TABLE public.regular_time_policy;
       public         timetrex    false    6            3           1259    20431    remittance_destination_account    TABLE     �  CREATE TABLE remittance_destination_account (
    id uuid NOT NULL,
    remittance_source_account_id uuid NOT NULL,
    user_id uuid NOT NULL,
    status_id integer NOT NULL,
    type_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    currency_id uuid NOT NULL,
    priority integer NOT NULL,
    amount_type_id integer NOT NULL,
    amount numeric(18,4) DEFAULT 0 NOT NULL,
    percent_amount numeric(18,4) DEFAULT 0 NOT NULL,
    value1 character varying,
    value2 character varying,
    value3 character varying,
    value4 character varying,
    value5 character varying,
    value6 character varying,
    value7 character varying,
    value8 character varying,
    value9 character varying,
    value10 character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 2   DROP TABLE public.remittance_destination_account;
       public         timetrex    false    6            2           1259    20421    remittance_source_account    TABLE     �  CREATE TABLE remittance_source_account (
    id uuid NOT NULL,
    legal_entity_id uuid NOT NULL,
    status_id integer NOT NULL,
    type_id integer NOT NULL,
    country character varying,
    name character varying NOT NULL,
    description text,
    data_format_id integer NOT NULL,
    currency_id uuid NOT NULL,
    last_transaction_number character varying,
    value1 character varying,
    value2 character varying,
    value3 character varying,
    value4 character varying,
    value5 character varying,
    value6 character varying,
    value7 character varying,
    value8 character varying,
    value9 character varying,
    value10 character varying,
    value11 character varying,
    value12 character varying,
    value13 character varying,
    value14 character varying,
    value15 character varying,
    value16 character varying,
    value17 character varying,
    value18 character varying,
    value19 character varying,
    value20 character varying,
    value21 character varying,
    value22 character varying,
    value23 character varying,
    value24 character varying,
    value25 character varying,
    value26 character varying,
    value27 character varying,
    value28 character varying,
    value29 character varying,
    value30 character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    company_id uuid NOT NULL
);
 -   DROP TABLE public.remittance_source_account;
       public         timetrex    false    6            ,           1259    20193    request    TABLE     �  CREATE TABLE request (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    pay_period_id uuid NOT NULL,
    date_stamp date NOT NULL,
    type_id smallint NOT NULL,
    status_id smallint NOT NULL,
    authorized smallint DEFAULT 0 NOT NULL,
    authorization_level smallint DEFAULT 99 NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.request;
       public         timetrex    false    6            �            1259    16986    roe    TABLE     �  CREATE TABLE roe (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    pay_period_type_id integer NOT NULL,
    code_id character varying NOT NULL,
    first_date integer,
    last_date integer,
    pay_period_end_date integer,
    recall_date integer,
    insurable_hours numeric NOT NULL,
    insurable_earnings numeric NOT NULL,
    vacation_pay numeric,
    serial character varying,
    comments character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    final_pay_stub_end_date integer,
    final_pay_stub_transaction_date integer
);
    DROP TABLE public.roe;
       public         timetrex    false    6            �            1259    16996    round_interval_policy    TABLE     G  CREATE TABLE round_interval_policy (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    punch_type_id integer NOT NULL,
    round_type_id integer NOT NULL,
    round_interval integer NOT NULL,
    strict smallint DEFAULT 0 NOT NULL,
    grace integer,
    minimum integer,
    maximum integer,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    condition_type_id smallint DEFAULT 0,
    condition_static_time time without time zone DEFAULT '08:00:00'::time without time zone,
    condition_static_total_time integer DEFAULT 3600,
    condition_start_window integer DEFAULT 900,
    condition_stop_window integer DEFAULT 900,
    description character varying
);
 )   DROP TABLE public.round_interval_policy;
       public         timetrex    false    6            *           1259    20143    schedule    TABLE     �  CREATE TABLE schedule (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    user_id uuid NOT NULL,
    pay_period_id uuid NOT NULL,
    date_stamp date NOT NULL,
    status_id smallint DEFAULT 10 NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    schedule_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    absence_policy_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    branch_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    department_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    job_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    job_item_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    total_time integer DEFAULT 0 NOT NULL,
    replaced_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    recurring_schedule_template_control_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    auto_fill smallint DEFAULT 0 NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    other_id1 character varying,
    other_id2 character varying,
    other_id3 character varying,
    other_id4 character varying,
    other_id5 character varying,
    note character varying
);
    DROP TABLE public.schedule;
       public         timetrex    false    6            �            1259    17032    schedule_policy    TABLE     �  CREATE TABLE schedule_policy (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    meal_policy_id uuid,
    over_time_policy_id uuid,
    partial_shift_absence_policy_id uuid,
    start_stop_window integer,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    description character varying,
    full_shift_absence_policy_id uuid
);
 #   DROP TABLE public.schedule_policy;
       public         timetrex    false    6            �            1259    17042    station    TABLE     �  CREATE TABLE station (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    status_id integer NOT NULL,
    type_id integer NOT NULL,
    station_id character varying NOT NULL,
    source character varying,
    description character varying NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    allowed_date integer,
    branch_id uuid,
    department_id uuid,
    time_zone character varying,
    user_group_selection_type_id smallint,
    branch_selection_type_id smallint,
    department_selection_type_id smallint,
    port integer,
    user_name character varying,
    password character varying,
    poll_frequency integer,
    push_frequency integer,
    last_punch_time_stamp timestamp with time zone,
    last_poll_date integer,
    last_poll_status_message character varying,
    last_push_date integer,
    last_push_status_message character varying,
    user_value_1 character varying,
    user_value_2 character varying,
    user_value_3 character varying,
    user_value_4 character varying,
    user_value_5 character varying,
    partial_push_frequency integer,
    last_partial_push_date integer,
    last_partial_push_status_message character varying,
    pull_start_time timestamp with time zone,
    pull_end_time timestamp with time zone,
    push_start_time timestamp with time zone,
    push_end_time timestamp with time zone,
    partial_push_start_time timestamp with time zone,
    partial_push_end_time timestamp with time zone,
    enable_auto_punch_status smallint DEFAULT 0 NOT NULL,
    mode_flag bigint DEFAULT 1 NOT NULL,
    work_code_definition character varying,
    job_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    job_item_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    default_mode_flag integer DEFAULT 0
);
    DROP TABLE public.station;
       public         timetrex    false    6                        1259    18359    station_branch    TABLE     q   CREATE TABLE station_branch (
    id uuid NOT NULL,
    station_id uuid NOT NULL,
    branch_id uuid NOT NULL
);
 "   DROP TABLE public.station_branch;
       public         timetrex    false    6                       1259    18365    station_department    TABLE     y   CREATE TABLE station_department (
    id uuid NOT NULL,
    station_id uuid NOT NULL,
    department_id uuid NOT NULL
);
 &   DROP TABLE public.station_department;
       public         timetrex    false    6                       1259    18383    station_exclude_user    TABLE     u   CREATE TABLE station_exclude_user (
    id uuid NOT NULL,
    station_id uuid NOT NULL,
    user_id uuid NOT NULL
);
 (   DROP TABLE public.station_exclude_user;
       public         timetrex    false    6                       1259    18377    station_include_user    TABLE     u   CREATE TABLE station_include_user (
    id uuid NOT NULL,
    station_id uuid NOT NULL,
    user_id uuid NOT NULL
);
 (   DROP TABLE public.station_include_user;
       public         timetrex    false    6            �            1259    17052    station_user    TABLE     �   CREATE TABLE station_user (
    id uuid NOT NULL,
    station_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    user_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL
);
     DROP TABLE public.station_user;
       public         timetrex    false    6                       1259    18371    station_user_group    TABLE     t   CREATE TABLE station_user_group (
    id uuid NOT NULL,
    station_id uuid NOT NULL,
    group_id uuid NOT NULL
);
 &   DROP TABLE public.station_user_group;
       public         timetrex    false    6            �            1259    16674 
   system_log    TABLE     �   CREATE TABLE system_log (
    id uuid NOT NULL,
    user_id uuid,
    object_id uuid,
    table_name character varying,
    action_id integer,
    description text,
    date integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.system_log;
       public         timetrex    false    6                       1259    18887    system_log_detail    TABLE     �   CREATE TABLE system_log_detail (
    id uuid NOT NULL,
    system_log_id uuid NOT NULL,
    field character varying(75),
    new_value text,
    old_value text
);
 %   DROP TABLE public.system_log_detail;
       public         timetrex    false    6            �            1259    17060    system_setting    TABLE     x   CREATE TABLE system_setting (
    id uuid NOT NULL,
    name character varying NOT NULL,
    value character varying
);
 "   DROP TABLE public.system_setting;
       public         timetrex    false    6                       1259    19425    user_contact    TABLE     *  CREATE TABLE user_contact (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    status_id integer NOT NULL,
    type_id integer NOT NULL,
    ethnic_group_id uuid NOT NULL,
    first_name character varying,
    middle_name character varying,
    last_name character varying,
    sex_id integer,
    address1 character varying,
    address2 character varying,
    city character varying,
    country character varying,
    province character varying,
    postal_code character varying,
    work_phone character varying,
    work_phone_ext character varying,
    home_phone character varying,
    mobile_phone character varying,
    fax_phone character varying,
    home_email character varying,
    work_email character varying,
    birth_date integer,
    sin character varying,
    note text,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    first_name_metaphone character varying,
    last_name_metaphone character varying
);
     DROP TABLE public.user_contact;
       public         timetrex    false    6            �            1259    17080 	   user_date    TABLE     A  CREATE TABLE user_date (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    pay_period_id uuid NOT NULL,
    date_stamp date NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.user_date;
       public         timetrex    false    6            (           1259    20080    user_date_total    TABLE     �  CREATE TABLE user_date_total (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    pay_period_id uuid NOT NULL,
    date_stamp date NOT NULL,
    object_type_id smallint NOT NULL,
    src_object_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    pay_code_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    punch_control_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    branch_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    department_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    job_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    job_item_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    quantity numeric DEFAULT 0 NOT NULL,
    bad_quantity numeric DEFAULT 0 NOT NULL,
    start_type_id smallint,
    start_time_stamp timestamp with time zone,
    end_type_id smallint,
    end_time_stamp timestamp with time zone,
    total_time integer DEFAULT 0 NOT NULL,
    actual_total_time integer DEFAULT 0,
    currency_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    currency_rate numeric(18,10) DEFAULT 1 NOT NULL,
    base_hourly_rate numeric(18,4) DEFAULT 0,
    hourly_rate numeric(18,4) DEFAULT 0,
    total_time_amount numeric(18,4) DEFAULT 0,
    hourly_rate_with_burden numeric(18,4) DEFAULT 0,
    total_time_amount_with_burden numeric(18,4) DEFAULT 0,
    override smallint DEFAULT 0 NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    note character varying
);
 #   DROP TABLE public.user_date_total;
       public         timetrex    false    6            �            1259    17100    user_deduction    TABLE     �  CREATE TABLE user_deduction (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    company_deduction_id uuid NOT NULL,
    user_value1 character varying,
    user_value2 character varying,
    user_value3 character varying,
    user_value4 character varying,
    user_value5 character varying,
    user_value6 character varying,
    user_value7 character varying,
    user_value8 character varying,
    user_value9 character varying,
    user_value10 character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    length_of_service_date date,
    start_date date,
    end_date date
);
 "   DROP TABLE public.user_deduction;
       public         timetrex    false    6            �            1259    17110    user_default    TABLE     8  CREATE TABLE user_default (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    pay_period_schedule_id uuid,
    policy_group_id uuid,
    employee_number character varying,
    city character varying,
    province character varying,
    country character varying,
    work_email character varying,
    work_phone character varying,
    work_phone_ext character varying,
    hire_date integer,
    title_id uuid,
    default_branch_id uuid,
    default_department_id uuid,
    date_format character varying,
    time_format character varying,
    time_unit_format character varying,
    time_zone character varying,
    items_per_page integer,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    start_week_day integer,
    language character varying(5),
    currency_id uuid,
    permission_control_id uuid,
    enable_email_notification_exception smallint DEFAULT 1 NOT NULL,
    enable_email_notification_message smallint DEFAULT 1 NOT NULL,
    enable_email_notification_home smallint DEFAULT 0 NOT NULL,
    enable_email_notification_pay_stub smallint DEFAULT 1,
    distance_format integer DEFAULT 10 NOT NULL,
    legal_entity_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid
);
     DROP TABLE public.user_default;
       public         timetrex    false    6            �            1259    17120    user_default_company_deduction    TABLE     �   CREATE TABLE user_default_company_deduction (
    id uuid NOT NULL,
    user_default_id uuid NOT NULL,
    company_deduction_id uuid NOT NULL
);
 2   DROP TABLE public.user_default_company_deduction;
       public         timetrex    false    6                       1259    19299    user_education    TABLE       CREATE TABLE user_education (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    qualification_id uuid NOT NULL,
    institute character varying NOT NULL,
    major character varying NOT NULL,
    minor character varying NOT NULL,
    graduate_date integer,
    grade_score character varying,
    start_date integer,
    end_date integer,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 "   DROP TABLE public.user_education;
       public         timetrex    false    6            �            1259    17126    user_generic_data    TABLE     �  CREATE TABLE user_generic_data (
    id uuid NOT NULL,
    user_id uuid,
    script character varying NOT NULL,
    name character varying NOT NULL,
    is_default smallint DEFAULT 0 NOT NULL,
    data text,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    company_id uuid NOT NULL
);
 %   DROP TABLE public.user_generic_data;
       public         timetrex    false    6            �            1259    18213    user_generic_status    TABLE     �  CREATE TABLE user_generic_status (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    batch_id uuid NOT NULL,
    status_id integer NOT NULL,
    label character varying,
    description character varying,
    link character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 '   DROP TABLE public.user_generic_status;
       public         timetrex    false    6            �            1259    18233 
   user_group    TABLE     }  CREATE TABLE user_group (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    parent_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL
);
    DROP TABLE public.user_group;
       public         timetrex    false    6                       1259    18538    user_identification    TABLE     l  CREATE TABLE user_identification (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    type_id integer NOT NULL,
    number integer NOT NULL,
    value text,
    extra_value text,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted integer DEFAULT 0 NOT NULL
);
 '   DROP TABLE public.user_identification;
       public         timetrex    false    6                       1259    19333    user_language    TABLE       CREATE TABLE user_language (
    id uuid NOT NULL,
    user_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    qualification_id uuid NOT NULL,
    fluency_id integer DEFAULT 0 NOT NULL,
    competency_id integer DEFAULT 0 NOT NULL,
    description character varying DEFAULT ''::character varying NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 !   DROP TABLE public.user_language;
       public         timetrex    false    6                       1259    19309    user_license    TABLE     �  CREATE TABLE user_license (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    qualification_id uuid NOT NULL,
    license_number character varying NOT NULL,
    license_issued_date integer,
    license_expiry_date integer,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
     DROP TABLE public.user_license;
       public         timetrex    false    6                       1259    19347    user_membership    TABLE       CREATE TABLE user_membership (
    id uuid NOT NULL,
    user_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    qualification_id uuid NOT NULL,
    ownership_id integer DEFAULT 0 NOT NULL,
    amount numeric(15,2) DEFAULT 0 NOT NULL,
    currency_id uuid NOT NULL,
    start_date integer NOT NULL,
    renewal_date integer NOT NULL,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 #   DROP TABLE public.user_membership;
       public         timetrex    false    6            �            1259    17144    user_preference    TABLE     X  CREATE TABLE user_preference (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    date_format character varying NOT NULL,
    time_format character varying NOT NULL,
    time_unit_format character varying NOT NULL,
    time_zone character varying NOT NULL,
    items_per_page integer,
    timesheet_view integer,
    start_week_day integer,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    language character varying(5),
    enable_email_notification_exception smallint DEFAULT 1 NOT NULL,
    enable_email_notification_message smallint DEFAULT 1 NOT NULL,
    enable_email_notification_home smallint DEFAULT 0 NOT NULL,
    schedule_icalendar_type_id smallint DEFAULT 1 NOT NULL,
    schedule_icalendar_event_name integer DEFAULT 0 NOT NULL,
    schedule_icalendar_alarm1_working integer DEFAULT 3600 NOT NULL,
    schedule_icalendar_alarm2_working integer DEFAULT 0 NOT NULL,
    schedule_icalendar_alarm1_absence integer DEFAULT 0 NOT NULL,
    schedule_icalendar_alarm2_absence integer DEFAULT 0 NOT NULL,
    schedule_icalendar_alarm1_modified integer DEFAULT 7200 NOT NULL,
    schedule_icalendar_alarm2_modified integer DEFAULT 3600 NOT NULL,
    enable_save_timesheet_state smallint DEFAULT 1 NOT NULL,
    enable_always_blank_timesheet_rows smallint DEFAULT 1 NOT NULL,
    enable_auto_context_menu smallint DEFAULT 1 NOT NULL,
    enable_report_open_new_window smallint DEFAULT 1 NOT NULL,
    user_full_name_format smallint DEFAULT 10 NOT NULL,
    shortcut_key_sequence character varying(250) DEFAULT 'CTRL+ALT'::character varying,
    enable_email_notification_pay_stub smallint DEFAULT 1,
    default_login_screen character varying DEFAULT 'Home'::character varying NOT NULL,
    distance_format integer DEFAULT 10 NOT NULL
);
 #   DROP TABLE public.user_preference;
       public         timetrex    false    6                       1259    18901    user_report_data    TABLE     �  CREATE TABLE user_report_data (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    user_id uuid,
    script character varying NOT NULL,
    name character varying NOT NULL,
    is_default smallint DEFAULT 0 NOT NULL,
    description text,
    data text,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 $   DROP TABLE public.user_report_data;
       public         timetrex    false    6                       1259    19397    user_review    TABLE     U  CREATE TABLE user_review (
    id uuid NOT NULL,
    user_review_control_id uuid NOT NULL,
    kpi_id uuid NOT NULL,
    rating numeric(9,2),
    note text,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.user_review;
       public         timetrex    false    6                       1259    19385    user_review_control    TABLE     �  CREATE TABLE user_review_control (
    id uuid NOT NULL,
    user_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    reviewer_user_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    type_id integer NOT NULL,
    term_id integer NOT NULL,
    severity_id integer NOT NULL,
    status_id integer NOT NULL,
    start_date integer NOT NULL,
    end_date integer NOT NULL,
    due_date integer NOT NULL,
    rating numeric(9,2),
    note text,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
 '   DROP TABLE public.user_review_control;
       public         timetrex    false    6                        1259    19456    user_setting    TABLE     e  CREATE TABLE user_setting (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    type_id integer NOT NULL,
    name character varying NOT NULL,
    value character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
     DROP TABLE public.user_setting;
       public         timetrex    false    6                       1259    19319 
   user_skill    TABLE     �  CREATE TABLE user_skill (
    id uuid NOT NULL,
    user_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    qualification_id uuid NOT NULL,
    proficiency_id integer NOT NULL,
    experience integer DEFAULT 0 NOT NULL,
    description character varying DEFAULT ''::character varying NOT NULL,
    first_used_date integer,
    last_used_date integer,
    enable_calc_experience smallint DEFAULT 0 NOT NULL,
    expiry_date integer,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.user_skill;
       public         timetrex    false    6            �            1259    17169 
   user_title    TABLE     �  CREATE TABLE user_title (
    id uuid NOT NULL,
    company_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    name character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    other_id1 character varying,
    other_id2 character varying,
    other_id3 character varying,
    other_id4 character varying,
    other_id5 character varying
);
    DROP TABLE public.user_title;
       public         timetrex    false    6            �            1259    17180 	   user_wage    TABLE       CREATE TABLE user_wage (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    type_id integer NOT NULL,
    wage numeric(20,4) NOT NULL,
    effective_date date,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    weekly_time integer,
    labor_burden_percent numeric,
    note text,
    wage_group_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    hourly_rate numeric(20,4)
);
    DROP TABLE public.user_wage;
       public         timetrex    false    6            �            1259    17069    users    TABLE     �	  CREATE TABLE users (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    status_id integer NOT NULL,
    user_name character varying NOT NULL,
    password character varying NOT NULL,
    password_reset_key character varying,
    password_reset_date integer,
    phone_id character varying,
    phone_password character varying,
    first_name character varying,
    middle_name character varying,
    last_name character varying,
    address1 character varying,
    address2 character varying,
    city character varying,
    province character varying,
    country character varying,
    postal_code character varying,
    work_phone character varying,
    work_phone_ext character varying,
    home_phone character varying,
    mobile_phone character varying,
    fax_phone character varying,
    home_email character varying,
    work_email character varying,
    birth_date integer,
    hire_date integer,
    sin character varying,
    sex_id integer,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted smallint DEFAULT 0 NOT NULL,
    labor_standard_industry integer DEFAULT 0,
    title_id uuid,
    default_branch_id uuid,
    default_department_id uuid,
    employee_number character varying,
    termination_date integer,
    note text,
    other_id1 character varying,
    other_id2 character varying,
    other_id3 character varying,
    other_id4 character varying,
    other_id5 character varying,
    group_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    currency_id uuid,
    second_last_name character varying,
    longitude numeric(15,10),
    latitude numeric(15,10),
    first_name_metaphone character varying,
    last_name_metaphone character varying,
    password_updated_date integer,
    last_login_date integer,
    ethnic_group_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    default_job_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    default_job_item_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
    work_email_is_valid smallint DEFAULT 1,
    work_email_is_valid_key character varying,
    work_email_is_valid_date integer,
    home_email_is_valid smallint DEFAULT 1,
    home_email_is_valid_key character varying,
    home_email_is_valid_date integer,
    feedback_rating smallint,
    legal_entity_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid
);
    DROP TABLE public.users;
       public         timetrex    false    6                       1259    18554 
   wage_group    TABLE     !  CREATE TABLE wage_group (
    id uuid NOT NULL,
    company_id uuid NOT NULL,
    name character varying,
    created_date integer,
    created_by uuid,
    updated_date integer,
    updated_by uuid,
    deleted_date integer,
    deleted_by uuid,
    deleted integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.wage_group;
       public         timetrex    false    6            X          0    16388    absence_policy 
   TABLE DATA               7  COPY absence_policy (id, company_id, name, type_id, over_time, accrual_policy_id, premium_policy_id, pay_stub_entry_account_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, wage_group_id, rate, accrual_rate, pay_code_id, pay_formula_policy_id, description) FROM stdin;
    public       timetrex    false    181   9�      Y          0    16399    accrual 
   TABLE DATA               �   COPY accrual (id, user_id, accrual_policy_account_id, type_id, user_date_total_id, time_stamp, amount, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, note, accrual_policy_id) FROM stdin;
    public       timetrex    false    182   ��      Z          0    16407    accrual_balance 
   TABLE DATA               �   COPY accrual_balance (id, user_id, accrual_policy_account_id, balance, banked_ytd, used_ytd, awarded_ytd, created_date, deleted) FROM stdin;
    public       timetrex    false    183   Ĉ      [          0    16418    accrual_policy 
   TABLE DATA               �  COPY accrual_policy (id, company_id, name, type_id, minimum_time, maximum_time, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, apply_frequency_id, apply_frequency_month, apply_frequency_day_of_month, apply_frequency_day_of_week, milestone_rollover_hire_date, milestone_rollover_month, milestone_rollover_day_of_month, minimum_employed_days, minimum_employed_days_catchup, enable_pay_stub_balance_display, apply_frequency_hire_date, contributing_shift_policy_id, length_of_service_contributing_pay_code_policy_id, description, accrual_policy_account_id, apply_frequency_quarter_month, enable_pro_rate_initial_period, enable_opening_balance) FROM stdin;
    public       timetrex    false    184   �      �          0    20059    accrual_policy_account 
   TABLE DATA               �   COPY accrual_policy_account (id, company_id, name, description, enable_pay_stub_balance_display, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    295   ��      �          0    18251    accrual_policy_milestone 
   TABLE DATA                 COPY accrual_policy_milestone (id, accrual_policy_id, length_of_service, length_of_service_unit_id, length_of_service_days, accrual_rate, annual_maximum_time, maximum_time, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, rollover_time) FROM stdin;
    public       timetrex    false    249   /�      �          0    20211    authentication 
   TABLE DATA               i   COPY authentication (session_id, object_id, created_date, updated_date, type_id, ip_address) FROM stdin;
    public       timetrex    false    301   Պ      \          0    16437    authorizations 
   TABLE DATA               �   COPY authorizations (id, object_type_id, object_id, authorized, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    185   ��      ]          0    16445    bank_account 
   TABLE DATA               �   COPY bank_account (id, company_id, user_id, institution, transit, account, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    186   ��      ^          0    16452    branch 
   TABLE DATA               I  COPY branch (id, company_id, status_id, name, address1, address2, city, province, country, postal_code, work_phone, fax_phone, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, manual_id, name_metaphone, longitude, latitude, other_id1, other_id2, other_id3, other_id4, other_id5) FROM stdin;
    public       timetrex    false    187   ��      �          0    18622    break_policy 
   TABLE DATA               �  COPY break_policy (id, company_id, name, type_id, trigger_time, amount, auto_detect_type_id, start_window, window_length, minimum_punch_time, maximum_punch_time, include_break_punch_time, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, include_multiple_breaks, pay_code_id, pay_formula_policy_id, branch_id, department_id, job_id, job_item_id, description) FROM stdin;
    public       timetrex    false    264   ��      _          0    16472    company 
   TABLE DATA               �  COPY company (id, parent_id, status_id, product_edition_id, name, short_name, address1, address2, city, province, country, postal_code, work_phone, fax_phone, business_number, originator_id, data_center_id, admin_contact, billing_contact, support_contact, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, enable_second_last_name, ldap_authentication_type_id, ldap_host, ldap_port, ldap_bind_user_name, ldap_bind_password, ldap_base_dn, ldap_bind_attribute, ldap_user_filter, ldap_login_attribute, ldap_group_dn, ldap_group_user_attribute, ldap_group_name, ldap_group_attribute, industry_id, password_policy_type_id, password_minimum_permission_level, password_minimum_strength, password_minimum_length, password_minimum_age, password_maximum_age, name_metaphone, longitude, latitude, other_id1, other_id2, other_id3, other_id4, other_id5, is_setup_complete, migrate_url) FROM stdin;
    public       timetrex    false    188   J�      `          0    16483    company_deduction 
   TABLE DATA               -  COPY company_deduction (id, company_id, status_id, type_id, name, calculation_id, calculation_order, country, province, district, company_value1, company_value2, user_value1, user_value2, user_value3, user_value4, user_value5, user_value6, user_value7, user_value8, user_value9, user_value10, lock_user_value1, lock_user_value2, lock_user_value3, lock_user_value4, lock_user_value5, lock_user_value6, lock_user_value7, lock_user_value8, lock_user_value9, lock_user_value10, pay_stub_entry_account_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, start_date, end_date, minimum_length_of_service, minimum_length_of_service_unit_id, minimum_length_of_service_days, maximum_length_of_service, maximum_length_of_service_unit_id, maximum_length_of_service_days, include_account_amount_type_id, exclude_account_amount_type_id, minimum_user_age, maximum_user_age, company_value3, company_value4, company_value5, company_value6, company_value7, company_value8, company_value9, company_value10, apply_frequency_id, apply_frequency_month, apply_frequency_day_of_month, apply_frequency_day_of_week, apply_frequency_quarter_month, pay_stub_entry_description, length_of_service_contributing_pay_code_policy_id, apply_payroll_run_type_id, legal_entity_id, payroll_remittance_agency_id) FROM stdin;
    public       timetrex    false    189   '�      a          0    16504 (   company_deduction_pay_stub_entry_account 
   TABLE DATA               y   COPY company_deduction_pay_stub_entry_account (id, company_deduction_id, type_id, pay_stub_entry_account_id) FROM stdin;
    public       timetrex    false    190   ��      �          0    18614    company_generic_map 
   TABLE DATA               Y   COPY company_generic_map (id, company_id, object_type_id, object_id, map_id) FROM stdin;
    public       timetrex    false    263   ;�      �          0    18988    company_generic_tag 
   TABLE DATA               �   COPY company_generic_tag (id, company_id, object_type_id, name, name_metaphone, description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    272   u�      �          0    19001    company_generic_tag_map 
   TABLE DATA               Q   COPY company_generic_tag_map (id, object_type_id, object_id, tag_id) FROM stdin;
    public       timetrex    false    273   ��      �          0    19446    company_setting 
   TABLE DATA               �   COPY company_setting (id, company_id, type_id, name, value, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    287   ��      �          0    17195    company_user_count 
   TABLE DATA               |   COPY company_user_count (id, company_id, date_stamp, active_users, inactive_users, deleted_users, created_date) FROM stdin;
    public       timetrex    false    246   ��      �          0    19721    contributing_pay_code_policy 
   TABLE DATA               �   COPY contributing_pay_code_policy (id, company_id, name, description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    293   ��      �          0    19731    contributing_shift_policy 
   TABLE DATA               �  COPY contributing_shift_policy (id, company_id, name, description, contributing_pay_code_policy_id, filter_start_date, filter_end_date, filter_start_time, filter_end_time, filter_minimum_time, filter_maximum_time, include_shift_type_id, branch_selection_type_id, exclude_default_branch, department_selection_type_id, exclude_default_department, job_group_selection_type_id, job_selection_type_id, exclude_default_job, job_item_group_selection_type_id, job_item_selection_type_id, exclude_default_job_item, sun, mon, tue, wed, thu, fri, sat, include_schedule_shift_type_id, include_holiday_type_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    294   �      b          0    16510    cron 
   TABLE DATA               �   COPY cron (id, status_id, name, minute, hour, day_of_month, month, day_of_week, command, last_run_date, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    191   ��      �          0    18271    currency 
   TABLE DATA               "  COPY currency (id, company_id, status_id, name, iso_code, conversion_rate, auto_update, actual_rate, actual_rate_updated_date, rate_modify_percent, is_base, is_default, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, round_decimal_places) FROM stdin;
    public       timetrex    false    250   �      �          0    19643    currency_rate 
   TABLE DATA               �   COPY currency_rate (id, currency_id, date_stamp, conversion_rate, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    289   ��      c          0    16521 
   department 
   TABLE DATA               �   COPY department (id, company_id, status_id, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, manual_id, name_metaphone, other_id1, other_id2, other_id3, other_id4, other_id5) FROM stdin;
    public       timetrex    false    192   ��      d          0    16532    department_branch 
   TABLE DATA               B   COPY department_branch (id, branch_id, department_id) FROM stdin;
    public       timetrex    false    193   a�      e          0    16540    department_branch_user 
   TABLE DATA               L   COPY department_branch_user (id, department_branch_id, user_id) FROM stdin;
    public       timetrex    false    194   ~�      �          0    19435    ethnic_group 
   TABLE DATA               �   COPY ethnic_group (id, company_id, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    286   ��      �          0    20173 	   exception 
   TABLE DATA               :  COPY exception (id, user_id, pay_period_id, date_stamp, exception_policy_id, punch_id, punch_control_id, type_id, enable_demerit, authorized, authorization_level, acknowledged_type_id, acknowledged_reason_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, note) FROM stdin;
    public       timetrex    false    299   ��      f          0    16554    exception_policy 
   TABLE DATA                 COPY exception_policy (id, exception_policy_control_id, type_id, severity_id, grace, watch_window, demerit, active, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, enable_authorization, email_notification_id) FROM stdin;
    public       timetrex    false    195   ��      g          0    16562    exception_policy_control 
   TABLE DATA               �   COPY exception_policy_control (id, company_id, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, description) FROM stdin;
    public       timetrex    false    196   ��      h          0    16572    help 
   TABLE DATA               �   COPY help (id, type_id, status_id, heading, body, keywords, private, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    197   1�      i          0    16583 
   help_group 
   TABLE DATA               N   COPY help_group (id, help_group_control_id, help_id, order_value) FROM stdin;
    public       timetrex    false    198   N�      j          0    16591    help_group_control 
   TABLE DATA               �   COPY help_group_control (id, script_name, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    199   k�      k          0    16601    hierarchy_control 
   TABLE DATA               �   COPY hierarchy_control (id, company_id, name, description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    200   ��      �          0    18689    hierarchy_level 
   TABLE DATA               �   COPY hierarchy_level (id, hierarchy_control_id, level, user_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    265   ��      l          0    16611    hierarchy_object_type 
   TABLE DATA               R   COPY hierarchy_object_type (id, hierarchy_control_id, object_type_id) FROM stdin;
    public       timetrex    false    201   ��      m          0    16617    hierarchy_share 
   TABLE DATA               E   COPY hierarchy_share (id, hierarchy_control_id, user_id) FROM stdin;
    public       timetrex    false    202   ��      �          0    18697    hierarchy_user 
   TABLE DATA               D   COPY hierarchy_user (id, hierarchy_control_id, user_id) FROM stdin;
    public       timetrex    false    266   ��      n          0    16642    holiday_policy 
   TABLE DATA               �  COPY holiday_policy (id, company_id, name, type_id, default_schedule_status_id, minimum_employed_days, minimum_worked_period_days, minimum_worked_days, average_time_days, include_over_time, include_paid_absence_time, minimum_time, maximum_time, "time", absence_policy_id, round_interval_policy_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, force_over_time_policy, average_time_worked_days, worked_scheduled_days, minimum_worked_after_period_days, minimum_worked_after_days, worked_after_scheduled_days, paid_absence_as_worked, average_days, contributing_shift_policy_id, eligible_contributing_shift_policy_id, description, shift_on_holiday_type_id, average_time_frequency_type_id) FROM stdin;
    public       timetrex    false    203   �      o          0    16656     holiday_policy_recurring_holiday 
   TABLE DATA               `   COPY holiday_policy_recurring_holiday (id, holiday_policy_id, recurring_holiday_id) FROM stdin;
    public       timetrex    false    204   ��      p          0    16664    holidays 
   TABLE DATA               �   COPY holidays (id, holiday_policy_id, date_stamp, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    205   ��      �          0    19375    kpi 
   TABLE DATA               �   COPY kpi (id, company_id, status_id, type_id, name, description, minimum_rate, maximum_rate, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    281    �      �          0    19407 	   kpi_group 
   TABLE DATA               �   COPY kpi_group (id, company_id, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, parent_id) FROM stdin;
    public       timetrex    false    284   �      �          0    20384    legal_entity 
   TABLE DATA               .  COPY legal_entity (id, company_id, status_id, type_id, classification_code, legal_name, trade_name, address1, address2, country, city, province, postal_code, work_phone, fax_phone, start_date, end_date, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    303   :�      r          0    16684    meal_policy 
   TABLE DATA               ~  COPY meal_policy (id, company_id, name, type_id, amount, trigger_time, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, start_window, window_length, include_lunch_punch_time, auto_detect_type_id, minimum_punch_time, maximum_punch_time, pay_code_id, pay_formula_policy_id, branch_id, department_id, job_id, job_item_id, description) FROM stdin;
    public       timetrex    false    207   ��      s          0    16694    message 
   TABLE DATA               �   COPY message (id, parent_id, object_type_id, object_id, priority_id, status_id, status_date, subject, body, require_ack, ack, ack_date, ack_by, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    208   ��      �          0    18832    message_control 
   TABLE DATA               �   COPY message_control (id, object_type_id, object_id, require_ack, priority_id, subject, body, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    269   ��      �          0    18818    message_recipient 
   TABLE DATA               �   COPY message_recipient (id, user_id, message_sender_id, status_id, status_date, ack, ack_date, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    267   ��      �          0    18825    message_sender 
   TABLE DATA               �   COPY message_sender (id, user_id, parent_id, message_control_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    268   ��      t          0    16705    other_field 
   TABLE DATA               �  COPY other_field (id, company_id, type_id, other_id1, other_id2, other_id3, other_id4, other_id5, other_id6, other_id7, other_id8, other_id9, other_id10, required_other_id1, required_other_id2, required_other_id3, required_other_id4, required_other_id5, required_other_id6, required_other_id7, required_other_id8, required_other_id9, required_other_id10, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    209   �      u          0    16725    over_time_policy 
   TABLE DATA               �  COPY over_time_policy (id, company_id, name, type_id, trigger_time, rate, accrual_policy_id, accrual_rate, pay_stub_entry_account_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, wage_group_id, pay_code_id, pay_formula_policy_id, contributing_shift_policy_id, branch_selection_type_id, exclude_default_branch, department_selection_type_id, exclude_default_department, job_group_selection_type_id, job_selection_type_id, exclude_default_job, job_item_group_selection_type_id, job_item_selection_type_id, exclude_default_job_item, description, trigger_time_adjust_contributing_shift_policy_id) FROM stdin;
    public       timetrex    false    210   -�      �          0    19675    pay_code 
   TABLE DATA               �   COPY pay_code (id, company_id, name, description, code, type_id, pay_formula_policy_id, pay_stub_entry_account_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    290   �      �          0    19686    pay_formula_policy 
   TABLE DATA               c  COPY pay_formula_policy (id, company_id, name, description, wage_source_type_id, wage_source_contributing_shift_policy_id, time_source_contributing_shift_policy_id, wage_group_id, pay_type_id, rate, custom_formula, accrual_policy_account_id, accrual_rate, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    291   ��      v          0    16735 
   pay_period 
   TABLE DATA               *  COPY pay_period (id, company_id, pay_period_schedule_id, status_id, is_primary, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, start_date, end_date, transaction_date, advance_end_date, advance_transaction_date, tainted, tainted_by, tainted_date) FROM stdin;
    public       timetrex    false    211   M�      w          0    16744    pay_period_schedule 
   TABLE DATA               �  COPY pay_period_schedule (id, company_id, name, description, type_id, primary_date_ldom, primary_transaction_date_ldom, primary_transaction_date_bd, secondary_date_ldom, secondary_transaction_date_ldom, secondary_transaction_date_bd, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, anchor_date, primary_date, primary_transaction_date, secondary_date, secondary_transaction_date, day_start_time, day_continuous_time, start_week_day_id, start_day_of_week, transaction_date, primary_day_of_month, secondary_day_of_month, primary_transaction_day_of_month, secondary_transaction_day_of_month, transaction_date_bd, time_zone, new_day_trigger_time, maximum_shift_time, shift_assigned_day_id, timesheet_verify_before_end_date, timesheet_verify_before_transaction_date, timesheet_verify_notice_before_transaction_date, timesheet_verify_notice_email, annual_pay_periods, timesheet_verify_type_id) FROM stdin;
    public       timetrex    false    212   ��      x          0    16754    pay_period_schedule_user 
   TABLE DATA               P   COPY pay_period_schedule_user (id, pay_period_schedule_id, user_id) FROM stdin;
    public       timetrex    false    213   ��      �          0    17187    pay_period_time_sheet_verify 
   TABLE DATA               �   COPY pay_period_time_sheet_verify (id, pay_period_id, user_id, status_id, authorized, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, authorization_level, user_verified, user_verified_date) FROM stdin;
    public       timetrex    false    245   ��      y          0    16762    pay_stub 
   TABLE DATA                 COPY pay_stub (id, pay_period_id, user_id, status_id, status_date, status_by, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, start_date, end_date, transaction_date, tainted, temp, currency_id, currency_rate, type_id, run_id) FROM stdin;
    public       timetrex    false    214   ��      z          0    16775    pay_stub_amendment 
   TABLE DATA               a  COPY pay_stub_amendment (id, user_id, pay_stub_entry_name_id, status_id, effective_date, rate, units, amount, description, authorized, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, recurring_ps_amendment_id, ytd_adjustment, type_id, percent_amount, percent_amount_entry_name_id, private_description) FROM stdin;
    public       timetrex    false    215   �      {          0    16789    pay_stub_entry 
   TABLE DATA                 COPY pay_stub_entry (id, pay_stub_id, rate, units, ytd_units, amount, ytd_amount, description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, pay_stub_entry_name_id, pay_stub_amendment_id, user_expense_id) FROM stdin;
    public       timetrex    false    216   )�      |          0    16804    pay_stub_entry_account 
   TABLE DATA                 COPY pay_stub_entry_account (id, company_id, status_id, type_id, ps_order, name, accrual_pay_stub_entry_account_id, debit_account, credit_account, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, accrual_type_id) FROM stdin;
    public       timetrex    false    217   F�      }          0    16814    pay_stub_entry_account_link 
   TABLE DATA               :  COPY pay_stub_entry_account_link (id, company_id, total_gross, total_employee_deduction, total_employer_deduction, total_net_pay, regular_time, monthly_advance, monthly_advance_deduction, employee_cpp, employee_ei, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    218   ��      �          0    20443    pay_stub_transaction 
   TABLE DATA               @  COPY pay_stub_transaction (id, parent_id, pay_stub_id, remittance_source_account_id, remittance_destination_account_id, currency_id, status_id, type_id, currency_rate, amount, transaction_date, confirmation_number, note, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    308   '�      �          0    20394    payroll_remittance_agency 
   TABLE DATA               �  COPY payroll_remittance_agency (id, legal_entity_id, status_id, type_id, name, description, country, province, district, agency_id, primary_identification, secondary_identification, tertiary_identification, user_name, password, contact_user_id, remittance_source_account_id, start_date, end_date, always_week_day_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    304   D�      �          0    20405    payroll_remittance_agency_event 
   TABLE DATA               �  COPY payroll_remittance_agency_event (id, payroll_remittance_agency_id, status_id, type_id, frequency_id, quarter_month, primary_month, primary_day_of_month, secondary_month, secondary_day_of_month, day_of_week, due_date_delay_days, effective_date, reminder_user_id, user_report_data_id, reminder_days, note, last_due_date, due_date, start_date, end_date, next_reminder_date, last_reminder_date, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    305   �      �          0    18308 
   permission 
   TABLE DATA               �   COPY permission (id, permission_control_id, section, name, value, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    253   �      �          0    18292    permission_control 
   TABLE DATA               �   COPY permission_control (id, company_id, name, description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, level) FROM stdin;
    public       timetrex    false    251   �/      �          0    18302    permission_user 
   TABLE DATA               F   COPY permission_user (id, permission_control_id, user_id) FROM stdin;
    public       timetrex    false    252   �0      ~          0    16831    policy_group 
   TABLE DATA               �   COPY policy_group (id, company_id, name, exception_policy_control_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, accrual_policy_id, description) FROM stdin;
    public       timetrex    false    219   s2                0    16865    policy_group_user 
   TABLE DATA               B   COPY policy_group_user (id, policy_group_id, user_id) FROM stdin;
    public       timetrex    false    220   �2      �          0    16873    premium_policy 
   TABLE DATA               �  COPY premium_policy (id, company_id, name, type_id, start_date, end_date, start_time, end_time, sun, mon, tue, wed, thu, fri, sat, pay_type_id, rate, accrual_policy_id, accrual_rate, pay_stub_entry_account_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, daily_trigger_time, weekly_trigger_time, minimum_time, maximum_time, include_meal_policy, exclude_default_branch, exclude_default_department, branch_selection_type_id, department_selection_type_id, job_group_selection_type_id, job_selection_type_id, job_item_group_selection_type_id, job_item_selection_type_id, maximum_no_break_time, minimum_break_time, include_partial_punch, wage_group_id, include_break_policy, minimum_time_between_shift, minimum_first_shift_time, minimum_shift_time, include_holiday_type_id, maximum_daily_trigger_time, maximum_weekly_trigger_time, pay_code_id, pay_formula_policy_id, contributing_shift_policy_id, exclude_default_job, exclude_default_job_item, description) FROM stdin;
    public       timetrex    false    221   3      �          0    18319    premium_policy_branch 
   TABLE DATA               J   COPY premium_policy_branch (id, premium_policy_id, branch_id) FROM stdin;
    public       timetrex    false    254   63      �          0    18325    premium_policy_department 
   TABLE DATA               R   COPY premium_policy_department (id, premium_policy_id, department_id) FROM stdin;
    public       timetrex    false    255   S3      �          0    16890    punch 
   TABLE DATA                 COPY punch (id, punch_control_id, station_id, type_id, status_id, time_stamp, original_time_stamp, actual_time_stamp, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, transfer, longitude, latitude, position_accuracy, has_image) FROM stdin;
    public       timetrex    false    222   p3      �          0    20118    punch_control 
   TABLE DATA               B  COPY punch_control (id, user_id, pay_period_id, date_stamp, branch_id, department_id, job_id, job_item_id, quantity, bad_quantity, total_time, actual_total_time, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, other_id1, other_id2, other_id3, other_id4, other_id5, note) FROM stdin;
    public       timetrex    false    297   ��      �          0    19288    qualification 
   TABLE DATA               �   COPY qualification (id, type_id, company_id, group_id, name, name_metaphone, description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, source_type_id, visibility_type_id) FROM stdin;
    public       timetrex    false    274   �      �          0    19357    qualification_group 
   TABLE DATA               �   COPY qualification_group (id, company_id, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, parent_id) FROM stdin;
    public       timetrex    false    280   �      �          0    16911    recurring_holiday 
   TABLE DATA                 COPY recurring_holiday (id, company_id, type_id, name, special_day, week_interval, day_of_week, day_of_month, month_int, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, pivot_day_direction_id, always_week_day_id) FROM stdin;
    public       timetrex    false    223   (�      �          0    16922    recurring_ps_amendment 
   TABLE DATA               P  COPY recurring_ps_amendment (id, company_id, status_id, start_date, end_date, frequency_id, name, description, pay_stub_entry_name_id, rate, units, amount, percent_amount, percent_amount_entry_name_id, ps_amendment_description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, type_id) FROM stdin;
    public       timetrex    false    224   E�      �          0    16933    recurring_ps_amendment_user 
   TABLE DATA               V   COPY recurring_ps_amendment_user (id, recurring_ps_amendment_id, user_id) FROM stdin;
    public       timetrex    false    225   b�      �          0    20224    recurring_schedule 
   TABLE DATA               �  COPY recurring_schedule (id, company_id, user_id, recurring_schedule_control_id, date_stamp, status_id, start_time, end_time, schedule_policy_id, absence_policy_id, branch_id, department_id, job_id, job_item_id, total_time, recurring_schedule_template_control_id, auto_fill, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, other_id1, other_id2, other_id3, other_id4, other_id5, note) FROM stdin;
    public       timetrex    false    302   �      �          0    16939    recurring_schedule_control 
   TABLE DATA               �   COPY recurring_schedule_control (id, company_id, recurring_schedule_template_control_id, start_week, start_date, end_date, auto_fill, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, display_weeks) FROM stdin;
    public       timetrex    false    226   ��      �          0    16947    recurring_schedule_template 
   TABLE DATA               h  COPY recurring_schedule_template (id, recurring_schedule_template_control_id, week, sun, mon, tue, wed, thu, fri, sat, start_time, end_time, schedule_policy_id, branch_id, department_id, job_id, job_item_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, status_id, absence_policy_id, open_shift_multiplier) FROM stdin;
    public       timetrex    false    227   ��      �          0    16961 #   recurring_schedule_template_control 
   TABLE DATA               �   COPY recurring_schedule_template_control (id, company_id, name, description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    228   ֲ      �          0    16971    recurring_schedule_user 
   TABLE DATA               V   COPY recurring_schedule_user (id, recurring_schedule_control_id, user_id) FROM stdin;
    public       timetrex    false    229   �      �          0    19700    regular_time_policy 
   TABLE DATA                 COPY regular_time_policy (id, company_id, name, description, contributing_shift_policy_id, calculation_order, pay_formula_policy_id, pay_code_id, branch_selection_type_id, exclude_default_branch, department_selection_type_id, exclude_default_department, job_group_selection_type_id, job_selection_type_id, exclude_default_job, job_item_group_selection_type_id, job_item_selection_type_id, exclude_default_job_item, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    292   �      �          0    20431    remittance_destination_account 
   TABLE DATA               j  COPY remittance_destination_account (id, remittance_source_account_id, user_id, status_id, type_id, name, description, currency_id, priority, amount_type_id, amount, percent_amount, value1, value2, value3, value4, value5, value6, value7, value8, value9, value10, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    307   ��      �          0    20421    remittance_source_account 
   TABLE DATA                 COPY remittance_source_account (id, legal_entity_id, status_id, type_id, country, name, description, data_format_id, currency_id, last_transaction_number, value1, value2, value3, value4, value5, value6, value7, value8, value9, value10, value11, value12, value13, value14, value15, value16, value17, value18, value19, value20, value21, value22, value23, value24, value25, value26, value27, value28, value29, value30, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, company_id) FROM stdin;
    public       timetrex    false    306   ǳ      �          0    20193    request 
   TABLE DATA               �   COPY request (id, user_id, pay_period_id, date_stamp, type_id, status_id, authorized, authorization_level, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    300   X�      �          0    16986    roe 
   TABLE DATA               O  COPY roe (id, user_id, pay_period_type_id, code_id, first_date, last_date, pay_period_end_date, recall_date, insurable_hours, insurable_earnings, vacation_pay, serial, comments, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, final_pay_stub_end_date, final_pay_stub_transaction_date) FROM stdin;
    public       timetrex    false    230   u�      �          0    16996    round_interval_policy 
   TABLE DATA               g  COPY round_interval_policy (id, company_id, name, punch_type_id, round_type_id, round_interval, strict, grace, minimum, maximum, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, condition_type_id, condition_static_time, condition_static_total_time, condition_start_window, condition_stop_window, description) FROM stdin;
    public       timetrex    false    231   ��      �          0    20143    schedule 
   TABLE DATA               �  COPY schedule (id, company_id, user_id, pay_period_id, date_stamp, status_id, start_time, end_time, schedule_policy_id, absence_policy_id, branch_id, department_id, job_id, job_item_id, total_time, replaced_id, recurring_schedule_template_control_id, auto_fill, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, other_id1, other_id2, other_id3, other_id4, other_id5, note) FROM stdin;
    public       timetrex    false    298   ��      �          0    17032    schedule_policy 
   TABLE DATA                 COPY schedule_policy (id, company_id, name, meal_policy_id, over_time_policy_id, partial_shift_absence_policy_id, start_stop_window, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, description, full_shift_absence_policy_id) FROM stdin;
    public       timetrex    false    232   ̴      �          0    17042    station 
   TABLE DATA               P  COPY station (id, company_id, status_id, type_id, station_id, source, description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, allowed_date, branch_id, department_id, time_zone, user_group_selection_type_id, branch_selection_type_id, department_selection_type_id, port, user_name, password, poll_frequency, push_frequency, last_punch_time_stamp, last_poll_date, last_poll_status_message, last_push_date, last_push_status_message, user_value_1, user_value_2, user_value_3, user_value_4, user_value_5, partial_push_frequency, last_partial_push_date, last_partial_push_status_message, pull_start_time, pull_end_time, push_start_time, push_end_time, partial_push_start_time, partial_push_end_time, enable_auto_punch_status, mode_flag, work_code_definition, job_id, job_item_id, default_mode_flag) FROM stdin;
    public       timetrex    false    233   ��      �          0    18359    station_branch 
   TABLE DATA               <   COPY station_branch (id, station_id, branch_id) FROM stdin;
    public       timetrex    false    256   �      �          0    18365    station_department 
   TABLE DATA               D   COPY station_department (id, station_id, department_id) FROM stdin;
    public       timetrex    false    257   -�      �          0    18383    station_exclude_user 
   TABLE DATA               @   COPY station_exclude_user (id, station_id, user_id) FROM stdin;
    public       timetrex    false    260   J�      �          0    18377    station_include_user 
   TABLE DATA               @   COPY station_include_user (id, station_id, user_id) FROM stdin;
    public       timetrex    false    259   g�      �          0    17052    station_user 
   TABLE DATA               8   COPY station_user (id, station_id, user_id) FROM stdin;
    public       timetrex    false    234   ��      �          0    18371    station_user_group 
   TABLE DATA               ?   COPY station_user_group (id, station_id, group_id) FROM stdin;
    public       timetrex    false    258   ��      q          0    16674 
   system_log 
   TABLE DATA               _   COPY system_log (id, user_id, object_id, table_name, action_id, description, date) FROM stdin;
    public       timetrex    false    206   ��      �          0    18887    system_log_detail 
   TABLE DATA               T   COPY system_log_detail (id, system_log_id, field, new_value, old_value) FROM stdin;
    public       timetrex    false    270   ��      �          0    17060    system_setting 
   TABLE DATA               2   COPY system_setting (id, name, value) FROM stdin;
    public       timetrex    false    235   q�	      �          0    19425    user_contact 
   TABLE DATA               �  COPY user_contact (id, user_id, status_id, type_id, ethnic_group_id, first_name, middle_name, last_name, sex_id, address1, address2, city, country, province, postal_code, work_phone, work_phone_ext, home_phone, mobile_phone, fax_phone, home_email, work_email, birth_date, sin, note, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, first_name_metaphone, last_name_metaphone) FROM stdin;
    public       timetrex    false    285   ϵ	      �          0    17080 	   user_date 
   TABLE DATA               �   COPY user_date (id, user_id, pay_period_id, date_stamp, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    237   �	      �          0    20080    user_date_total 
   TABLE DATA                 COPY user_date_total (id, user_id, pay_period_id, date_stamp, object_type_id, src_object_id, pay_code_id, punch_control_id, branch_id, department_id, job_id, job_item_id, quantity, bad_quantity, start_type_id, start_time_stamp, end_type_id, end_time_stamp, total_time, actual_total_time, currency_id, currency_rate, base_hourly_rate, hourly_rate, total_time_amount, hourly_rate_with_burden, total_time_amount_with_burden, override, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, note) FROM stdin;
    public       timetrex    false    296   	�	      �          0    17100    user_deduction 
   TABLE DATA               L  COPY user_deduction (id, user_id, company_deduction_id, user_value1, user_value2, user_value3, user_value4, user_value5, user_value6, user_value7, user_value8, user_value9, user_value10, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, length_of_service_date, start_date, end_date) FROM stdin;
    public       timetrex    false    238   ��	      �          0    17110    user_default 
   TABLE DATA               s  COPY user_default (id, company_id, pay_period_schedule_id, policy_group_id, employee_number, city, province, country, work_email, work_phone, work_phone_ext, hire_date, title_id, default_branch_id, default_department_id, date_format, time_format, time_unit_format, time_zone, items_per_page, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, start_week_day, language, currency_id, permission_control_id, enable_email_notification_exception, enable_email_notification_message, enable_email_notification_home, enable_email_notification_pay_stub, distance_format, legal_entity_id) FROM stdin;
    public       timetrex    false    239   ��	      �          0    17120    user_default_company_deduction 
   TABLE DATA               \   COPY user_default_company_deduction (id, user_default_id, company_deduction_id) FROM stdin;
    public       timetrex    false    240   ��	      �          0    19299    user_education 
   TABLE DATA               �   COPY user_education (id, user_id, qualification_id, institute, major, minor, graduate_date, grade_score, start_date, end_date, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    275   ��	      �          0    17126    user_generic_data 
   TABLE DATA               �   COPY user_generic_data (id, user_id, script, name, is_default, data, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, company_id) FROM stdin;
    public       timetrex    false    241   ��	      �          0    18213    user_generic_status 
   TABLE DATA               �   COPY user_generic_status (id, user_id, batch_id, status_id, label, description, link, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    247   ��	      �          0    18233 
   user_group 
   TABLE DATA               �   COPY user_group (id, company_id, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, parent_id) FROM stdin;
    public       timetrex    false    248   �	      �          0    18538    user_identification 
   TABLE DATA               �   COPY user_identification (id, user_id, type_id, number, value, extra_value, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    261   "�	      �          0    19333    user_language 
   TABLE DATA               �   COPY user_language (id, user_id, qualification_id, fluency_id, competency_id, description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    278   
�	      �          0    19309    user_license 
   TABLE DATA               �   COPY user_license (id, user_id, qualification_id, license_number, license_issued_date, license_expiry_date, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    276   '�	      �          0    19347    user_membership 
   TABLE DATA               �   COPY user_membership (id, user_id, qualification_id, ownership_id, amount, currency_id, start_date, renewal_date, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    279   D�	      �          0    17144    user_preference 
   TABLE DATA               a  COPY user_preference (id, user_id, date_format, time_format, time_unit_format, time_zone, items_per_page, timesheet_view, start_week_day, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, language, enable_email_notification_exception, enable_email_notification_message, enable_email_notification_home, schedule_icalendar_type_id, schedule_icalendar_event_name, schedule_icalendar_alarm1_working, schedule_icalendar_alarm2_working, schedule_icalendar_alarm1_absence, schedule_icalendar_alarm2_absence, schedule_icalendar_alarm1_modified, schedule_icalendar_alarm2_modified, enable_save_timesheet_state, enable_always_blank_timesheet_rows, enable_auto_context_menu, enable_report_open_new_window, user_full_name_format, shortcut_key_sequence, enable_email_notification_pay_stub, default_login_screen, distance_format) FROM stdin;
    public       timetrex    false    242   a�	      �          0    18901    user_report_data 
   TABLE DATA               �   COPY user_report_data (id, company_id, user_id, script, name, is_default, description, data, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    271   ��	      �          0    19397    user_review 
   TABLE DATA               �   COPY user_review (id, user_review_control_id, kpi_id, rating, note, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    283   ��	      �          0    19385    user_review_control 
   TABLE DATA               �   COPY user_review_control (id, user_id, reviewer_user_id, type_id, term_id, severity_id, status_id, start_date, end_date, due_date, rating, note, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    282   ��	      �          0    19456    user_setting 
   TABLE DATA               �   COPY user_setting (id, user_id, type_id, name, value, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    288   �	      �          0    19319 
   user_skill 
   TABLE DATA                 COPY user_skill (id, user_id, qualification_id, proficiency_id, experience, description, first_used_date, last_used_date, enable_calc_experience, expiry_date, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    277   6�	      �          0    17169 
   user_title 
   TABLE DATA               �   COPY user_title (id, company_id, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, other_id1, other_id2, other_id3, other_id4, other_id5) FROM stdin;
    public       timetrex    false    243   S�	      �          0    17180 	   user_wage 
   TABLE DATA               �   COPY user_wage (id, user_id, type_id, wage, effective_date, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, weekly_time, labor_burden_percent, note, wage_group_id, hourly_rate) FROM stdin;
    public       timetrex    false    244   ��	      �          0    17069    users 
   TABLE DATA               �  COPY users (id, company_id, status_id, user_name, password, password_reset_key, password_reset_date, phone_id, phone_password, first_name, middle_name, last_name, address1, address2, city, province, country, postal_code, work_phone, work_phone_ext, home_phone, mobile_phone, fax_phone, home_email, work_email, birth_date, hire_date, sin, sex_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, labor_standard_industry, title_id, default_branch_id, default_department_id, employee_number, termination_date, note, other_id1, other_id2, other_id3, other_id4, other_id5, group_id, currency_id, second_last_name, longitude, latitude, first_name_metaphone, last_name_metaphone, password_updated_date, last_login_date, ethnic_group_id, default_job_id, default_job_item_id, work_email_is_valid, work_email_is_valid_key, work_email_is_valid_date, home_email_is_valid, home_email_is_valid_key, home_email_is_valid_date, feedback_rating, legal_entity_id) FROM stdin;
    public       timetrex    false    236   ��	      �          0    18554 
   wage_group 
   TABLE DATA               �   COPY wage_group (id, company_id, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    262   ��	      �           1259    20503    absence_policy_id    INDEX     J   CREATE UNIQUE INDEX absence_policy_id ON absence_policy USING btree (id);
 %   DROP INDEX public.absence_policy_id;
       public         timetrex    false    181            �           1259    20595    accrual_balance_id    INDEX     L   CREATE UNIQUE INDEX accrual_balance_id ON accrual_balance USING btree (id);
 &   DROP INDEX public.accrual_balance_id;
       public         timetrex    false    183            �           1259    20604    accrual_balance_user_id    INDEX     O   CREATE INDEX accrual_balance_user_id ON accrual_balance USING btree (user_id);
 +   DROP INDEX public.accrual_balance_user_id;
       public         timetrex    false    183            �           1259    20584 
   accrual_id    INDEX     <   CREATE UNIQUE INDEX accrual_id ON accrual USING btree (id);
    DROP INDEX public.accrual_id;
       public         timetrex    false    182            �           1259    20680    accrual_policy_account_id    INDEX     Z   CREATE UNIQUE INDEX accrual_policy_account_id ON accrual_policy_account USING btree (id);
 -   DROP INDEX public.accrual_policy_account_id;
       public         timetrex    false    295            �           1259    20621    accrual_policy_id    INDEX     J   CREATE UNIQUE INDEX accrual_policy_id ON accrual_policy USING btree (id);
 %   DROP INDEX public.accrual_policy_id;
       public         timetrex    false    184            S           1259    20716    accrual_policy_milestone_id    INDEX     ^   CREATE UNIQUE INDEX accrual_policy_milestone_id ON accrual_policy_milestone USING btree (id);
 /   DROP INDEX public.accrual_policy_milestone_id;
       public         timetrex    false    249            �           1259    20585    accrual_user_id    INDEX     ?   CREATE INDEX accrual_user_id ON accrual USING btree (user_id);
 #   DROP INDEX public.accrual_user_id;
       public         timetrex    false    182            �           1259    20214    authenication_session_id    INDEX     Y   CREATE UNIQUE INDEX authenication_session_id ON authentication USING btree (session_id);
 ,   DROP INDEX public.authenication_session_id;
       public         timetrex    false    301            �           1259    20756    authorizations_id    INDEX     J   CREATE UNIQUE INDEX authorizations_id ON authorizations USING btree (id);
 %   DROP INDEX public.authorizations_id;
       public         timetrex    false    185            �           1259    20777    bank_account_id    INDEX     F   CREATE UNIQUE INDEX bank_account_id ON bank_account USING btree (id);
 #   DROP INDEX public.bank_account_id;
       public         timetrex    false    186            �           1259    20802 	   branch_id    INDEX     :   CREATE UNIQUE INDEX branch_id ON branch USING btree (id);
    DROP INDEX public.branch_id;
       public         timetrex    false    187            m           1259    20839    break_policy_id    INDEX     F   CREATE UNIQUE INDEX break_policy_id ON break_policy USING btree (id);
 #   DROP INDEX public.break_policy_id;
       public         timetrex    false    264            �           1259    20933    company_deduction_company_id    INDEX     Y   CREATE INDEX company_deduction_company_id ON company_deduction USING btree (company_id);
 0   DROP INDEX public.company_deduction_company_id;
       public         timetrex    false    189            �           1259    20932    company_deduction_id    INDEX     P   CREATE UNIQUE INDEX company_deduction_id ON company_deduction USING btree (id);
 (   DROP INDEX public.company_deduction_id;
       public         timetrex    false    189            �           1259    20945 +   company_deduction_pay_stub_entry_account_id    INDEX     ~   CREATE UNIQUE INDEX company_deduction_pay_stub_entry_account_id ON company_deduction_pay_stub_entry_account USING btree (id);
 ?   DROP INDEX public.company_deduction_pay_stub_entry_account_id;
       public         timetrex    false    190            k           1259    20959 7   company_generic_map_company_id_object_type_id_object_id    INDEX     �   CREATE INDEX company_generic_map_company_id_object_type_id_object_id ON company_generic_map USING btree (company_id, object_type_id, object_id);
 K   DROP INDEX public.company_generic_map_company_id_object_type_id_object_id;
       public         timetrex    false    263    263    263            l           1259    20958    company_generic_map_id    INDEX     T   CREATE UNIQUE INDEX company_generic_map_id ON company_generic_map USING btree (id);
 *   DROP INDEX public.company_generic_map_id;
       public         timetrex    false    263                       1259    20968    company_generic_tag_company_id    INDEX     ]   CREATE INDEX company_generic_tag_company_id ON company_generic_tag USING btree (company_id);
 2   DROP INDEX public.company_generic_tag_company_id;
       public         timetrex    false    272            �           1259    20967 -   company_generic_tag_company_id_object_type_id    INDEX     |   CREATE INDEX company_generic_tag_company_id_object_type_id ON company_generic_tag USING btree (company_id, object_type_id);
 A   DROP INDEX public.company_generic_tag_company_id_object_type_id;
       public         timetrex    false    272    272            �           1259    20966    company_generic_tag_id    INDEX     T   CREATE UNIQUE INDEX company_generic_tag_id ON company_generic_tag USING btree (id);
 *   DROP INDEX public.company_generic_tag_id;
       public         timetrex    false    272            �           1259    20965    company_generic_tag_map_id    INDEX     X   CREATE UNIQUE INDEX company_generic_tag_map_id ON company_generic_tag USING btree (id);
 .   DROP INDEX public.company_generic_tag_map_id;
       public         timetrex    false    272            �           1259    20979 0   company_generic_tag_map_object_type_id_object_id    INDEX     �   CREATE INDEX company_generic_tag_map_object_type_id_object_id ON company_generic_tag_map USING btree (object_type_id, object_id);
 D   DROP INDEX public.company_generic_tag_map_object_type_id_object_id;
       public         timetrex    false    273    273            �           1259    20923 
   company_id    INDEX     <   CREATE UNIQUE INDEX company_id ON company USING btree (id);
    DROP INDEX public.company_id;
       public         timetrex    false    188            �           1259    20993    company_setting_company_id    INDEX     U   CREATE INDEX company_setting_company_id ON company_setting USING btree (company_id);
 .   DROP INDEX public.company_setting_company_id;
       public         timetrex    false    287            �           1259    20984    company_setting_id    INDEX     L   CREATE UNIQUE INDEX company_setting_id ON company_setting USING btree (id);
 &   DROP INDEX public.company_setting_id;
       public         timetrex    false    287            N           1259    21032 (   company_user_count_company_id_date_stamp    INDEX     r   CREATE INDEX company_user_count_company_id_date_stamp ON company_user_count USING btree (company_id, date_stamp);
 <   DROP INDEX public.company_user_count_company_id_date_stamp;
       public         timetrex    false    246    246            O           1259    21026    company_user_count_id    INDEX     R   CREATE UNIQUE INDEX company_user_count_id ON company_user_count USING btree (id);
 )   DROP INDEX public.company_user_count_id;
       public         timetrex    false    246            �           1259    21038    contributing_pay_code_policy_id    INDEX     f   CREATE UNIQUE INDEX contributing_pay_code_policy_id ON contributing_pay_code_policy USING btree (id);
 3   DROP INDEX public.contributing_pay_code_policy_id;
       public         timetrex    false    293            �           1259    21074    contributing_shift_policy_id    INDEX     `   CREATE UNIQUE INDEX contributing_shift_policy_id ON contributing_shift_policy USING btree (id);
 0   DROP INDEX public.contributing_shift_policy_id;
       public         timetrex    false    294            �           1259    21117    cron_id    INDEX     6   CREATE UNIQUE INDEX cron_id ON cron USING btree (id);
    DROP INDEX public.cron_id;
       public         timetrex    false    191            T           1259    21146    currency_id    INDEX     >   CREATE UNIQUE INDEX currency_id ON currency USING btree (id);
    DROP INDEX public.currency_id;
       public         timetrex    false    250            �           1259    21183 $   currency_rate_currency_id_date_stamp    INDEX     j   CREATE INDEX currency_rate_currency_id_date_stamp ON currency_rate USING btree (currency_id, date_stamp);
 8   DROP INDEX public.currency_rate_currency_id_date_stamp;
       public         timetrex    false    289    289            �           1259    21182    currency_rate_id    INDEX     H   CREATE UNIQUE INDEX currency_rate_id ON currency_rate USING btree (id);
 $   DROP INDEX public.currency_rate_id;
       public         timetrex    false    289            �           1259    21226    department_branch_id    INDEX     P   CREATE UNIQUE INDEX department_branch_id ON department_branch USING btree (id);
 (   DROP INDEX public.department_branch_id;
       public         timetrex    false    193            �           1259    21241    department_branch_user_id    INDEX     Z   CREATE UNIQUE INDEX department_branch_user_id ON department_branch_user USING btree (id);
 -   DROP INDEX public.department_branch_user_id;
       public         timetrex    false    194            �           1259    21189    department_id    INDEX     B   CREATE UNIQUE INDEX department_id ON department USING btree (id);
 !   DROP INDEX public.department_id;
       public         timetrex    false    192            �           1259    21263    ethnic_group_company_id    INDEX     O   CREATE INDEX ethnic_group_company_id ON ethnic_group USING btree (company_id);
 +   DROP INDEX public.ethnic_group_company_id;
       public         timetrex    false    286            �           1259    21254    ethnic_group_id    INDEX     F   CREATE UNIQUE INDEX ethnic_group_id ON ethnic_group USING btree (id);
 #   DROP INDEX public.ethnic_group_id;
       public         timetrex    false    286            �           1259    21297    exception_id    INDEX     @   CREATE UNIQUE INDEX exception_id ON exception USING btree (id);
     DROP INDEX public.exception_id;
       public         timetrex    false    299            �           1259    21299    exception_pay_period_id    INDEX     O   CREATE INDEX exception_pay_period_id ON exception USING btree (pay_period_id);
 +   DROP INDEX public.exception_pay_period_id;
       public         timetrex    false    299            �           1259    19235    exception_policy_active_type_id    INDEX     �   CREATE INDEX exception_policy_active_type_id ON exception_policy USING btree (active, type_id);

ALTER TABLE exception_policy CLUSTER ON exception_policy_active_type_id;
 3   DROP INDEX public.exception_policy_active_type_id;
       public         timetrex    false    195    195            �           1259    21318    exception_policy_control_id    INDEX     ^   CREATE UNIQUE INDEX exception_policy_control_id ON exception_policy_control USING btree (id);
 /   DROP INDEX public.exception_policy_control_id;
       public         timetrex    false    196            �           1259    21312    exception_policy_id    INDEX     N   CREATE UNIQUE INDEX exception_policy_id ON exception_policy USING btree (id);
 '   DROP INDEX public.exception_policy_id;
       public         timetrex    false    195            �           1259    21298    exception_user_id_user_date    INDEX     Y   CREATE INDEX exception_user_id_user_date ON exception USING btree (user_id, date_stamp);
 /   DROP INDEX public.exception_user_id_user_date;
       public         timetrex    false    299    299            �           1259    21398    help_group_control_id    INDEX     R   CREATE UNIQUE INDEX help_group_control_id ON help_group_control USING btree (id);
 )   DROP INDEX public.help_group_control_id;
       public         timetrex    false    199            �           1259    21383    help_group_id    INDEX     B   CREATE UNIQUE INDEX help_group_id ON help_group USING btree (id);
 !   DROP INDEX public.help_group_id;
       public         timetrex    false    198            �           1259    21354    help_id    INDEX     6   CREATE UNIQUE INDEX help_id ON help USING btree (id);
    DROP INDEX public.help_id;
       public         timetrex    false    197            �           1259    21427    hierarchy_control_id    INDEX     P   CREATE UNIQUE INDEX hierarchy_control_id ON hierarchy_control USING btree (id);
 (   DROP INDEX public.hierarchy_control_id;
       public         timetrex    false    200            n           1259    21475 ,   hierarchy_level_hierarchy_control_id_user_id    INDEX     z   CREATE INDEX hierarchy_level_hierarchy_control_id_user_id ON hierarchy_level USING btree (hierarchy_control_id, user_id);
 @   DROP INDEX public.hierarchy_level_hierarchy_control_id_user_id;
       public         timetrex    false    265    265            o           1259    21463    hierarchy_level_id    INDEX     L   CREATE UNIQUE INDEX hierarchy_level_id ON hierarchy_level USING btree (id);
 &   DROP INDEX public.hierarchy_level_id;
       public         timetrex    false    265            �           1259    21496    hierarchy_object_type_id    INDEX     X   CREATE UNIQUE INDEX hierarchy_object_type_id ON hierarchy_object_type USING btree (id);
 ,   DROP INDEX public.hierarchy_object_type_id;
       public         timetrex    false    201            �           1259    21505    hierarchy_share_id    INDEX     L   CREATE UNIQUE INDEX hierarchy_share_id ON hierarchy_share USING btree (id);
 &   DROP INDEX public.hierarchy_share_id;
       public         timetrex    false    202            p           1259    21521 +   hierarchy_user_hierarchy_control_id_user_id    INDEX     x   CREATE INDEX hierarchy_user_hierarchy_control_id_user_id ON hierarchy_user USING btree (hierarchy_control_id, user_id);
 ?   DROP INDEX public.hierarchy_user_hierarchy_control_id_user_id;
       public         timetrex    false    266    266            q           1259    21520    hierarchy_user_id    INDEX     J   CREATE UNIQUE INDEX hierarchy_user_id ON hierarchy_user USING btree (id);
 %   DROP INDEX public.hierarchy_user_id;
       public         timetrex    false    266            �           1259    21527    holiday_policy_id    INDEX     J   CREATE UNIQUE INDEX holiday_policy_id ON holiday_policy USING btree (id);
 %   DROP INDEX public.holiday_policy_id;
       public         timetrex    false    203            �           1259    21595 #   holiday_policy_recurring_holiday_id    INDEX     n   CREATE UNIQUE INDEX holiday_policy_recurring_holiday_id ON holiday_policy_recurring_holiday USING btree (id);
 7   DROP INDEX public.holiday_policy_recurring_holiday_id;
       public         timetrex    false    204            �           1259    18209    holidays_date_stamp    INDEX     G   CREATE INDEX holidays_date_stamp ON holidays USING btree (date_stamp);
 '   DROP INDEX public.holidays_date_stamp;
       public         timetrex    false    205            �           1259    21611    holidays_holiday_policy_id    INDEX     U   CREATE INDEX holidays_holiday_policy_id ON holidays USING btree (holiday_policy_id);
 .   DROP INDEX public.holidays_holiday_policy_id;
       public         timetrex    false    205                        1259    21610    holidays_id    INDEX     >   CREATE UNIQUE INDEX holidays_id ON holidays USING btree (id);
    DROP INDEX public.holidays_id;
       public         timetrex    false    205            �           1259    21630    kpi_company_id    INDEX     =   CREATE INDEX kpi_company_id ON kpi USING btree (company_id);
 "   DROP INDEX public.kpi_company_id;
       public         timetrex    false    281            �           1259    21672    kpi_group_company_id    INDEX     I   CREATE INDEX kpi_group_company_id ON kpi_group USING btree (company_id);
 (   DROP INDEX public.kpi_group_company_id;
       public         timetrex    false    284            �           1259    21663    kpi_group_id    INDEX     @   CREATE UNIQUE INDEX kpi_group_id ON kpi_group USING btree (id);
     DROP INDEX public.kpi_group_id;
       public         timetrex    false    284            �           1259    21621    kpi_id    INDEX     4   CREATE UNIQUE INDEX kpi_id ON kpi USING btree (id);
    DROP INDEX public.kpi_id;
       public         timetrex    false    281            �           1259    21723    legal_entity_company_id    INDEX     O   CREATE INDEX legal_entity_company_id ON legal_entity USING btree (company_id);
 +   DROP INDEX public.legal_entity_company_id;
       public         timetrex    false    303            �           1259    21714    legal_entity_id    INDEX     F   CREATE UNIQUE INDEX legal_entity_id ON legal_entity USING btree (id);
 #   DROP INDEX public.legal_entity_id;
       public         timetrex    false    303                       1259    21756    meal_policy_id    INDEX     D   CREATE UNIQUE INDEX meal_policy_id ON meal_policy USING btree (id);
 "   DROP INDEX public.meal_policy_id;
       public         timetrex    false    207            x           1259    21828    message_control_id    INDEX     L   CREATE UNIQUE INDEX message_control_id ON message_control USING btree (id);
 &   DROP INDEX public.message_control_id;
       public         timetrex    false    269            y           1259    21829 (   message_control_object_type_id_object_id    INDEX     r   CREATE INDEX message_control_object_type_id_object_id ON message_control USING btree (object_type_id, object_id);
 <   DROP INDEX public.message_control_object_type_id_object_id;
       public         timetrex    false    269    269                       1259    21800    message_created_by    INDEX     E   CREATE INDEX message_created_by ON message USING btree (created_by);
 &   DROP INDEX public.message_created_by;
       public         timetrex    false    208                       1259    21799    message_created_by_parent_id    INDEX     Z   CREATE INDEX message_created_by_parent_id ON message USING btree (created_by, parent_id);
 0   DROP INDEX public.message_created_by_parent_id;
       public         timetrex    false    208    208                       1259    21770 
   message_id    INDEX     <   CREATE UNIQUE INDEX message_id ON message USING btree (id);
    DROP INDEX public.message_id;
       public         timetrex    false    208            r           1259    21838    message_recipient_id    INDEX     P   CREATE UNIQUE INDEX message_recipient_id ON message_recipient USING btree (id);
 (   DROP INDEX public.message_recipient_id;
       public         timetrex    false    267            s           1259    21840 #   message_recipient_message_sender_id    INDEX     g   CREATE INDEX message_recipient_message_sender_id ON message_recipient USING btree (message_sender_id);
 7   DROP INDEX public.message_recipient_message_sender_id;
       public         timetrex    false    267            t           1259    21839    message_recipient_user_id    INDEX     S   CREATE INDEX message_recipient_user_id ON message_recipient USING btree (user_id);
 -   DROP INDEX public.message_recipient_user_id;
       public         timetrex    false    267            u           1259    21847    message_sender_id    INDEX     J   CREATE UNIQUE INDEX message_sender_id ON message_sender USING btree (id);
 %   DROP INDEX public.message_sender_id;
       public         timetrex    false    268            v           1259    21849 !   message_sender_message_control_id    INDEX     c   CREATE INDEX message_sender_message_control_id ON message_sender USING btree (message_control_id);
 5   DROP INDEX public.message_sender_message_control_id;
       public         timetrex    false    268            w           1259    21848    message_sender_user_id    INDEX     M   CREATE INDEX message_sender_user_id ON message_sender USING btree (user_id);
 *   DROP INDEX public.message_sender_user_id;
       public         timetrex    false    268            	           1259    21856    other_field_id    INDEX     D   CREATE UNIQUE INDEX other_field_id ON other_field USING btree (id);
 "   DROP INDEX public.other_field_id;
       public         timetrex    false    209            
           1259    21892    over_time_policy_id    INDEX     N   CREATE UNIQUE INDEX over_time_policy_id ON over_time_policy USING btree (id);
 '   DROP INDEX public.over_time_policy_id;
       public         timetrex    false    210            �           1259    21905    pay_code_id    INDEX     >   CREATE UNIQUE INDEX pay_code_id ON pay_code USING btree (id);
    DROP INDEX public.pay_code_id;
       public         timetrex    false    290            �           1259    21914    pay_formula_policy_id    INDEX     R   CREATE UNIQUE INDEX pay_formula_policy_id ON pay_formula_policy USING btree (id);
 )   DROP INDEX public.pay_formula_policy_id;
       public         timetrex    false    291                       1259    21924    pay_period_id    INDEX     B   CREATE UNIQUE INDEX pay_period_id ON pay_period USING btree (id);
 !   DROP INDEX public.pay_period_id;
       public         timetrex    false    211                       1259    21925 !   pay_period_pay_period_schedule_id    INDEX     c   CREATE INDEX pay_period_pay_period_schedule_id ON pay_period USING btree (pay_period_schedule_id);
 5   DROP INDEX public.pay_period_pay_period_schedule_id;
       public         timetrex    false    211                       1259    21931    pay_period_schedule_id    INDEX     T   CREATE UNIQUE INDEX pay_period_schedule_id ON pay_period_schedule USING btree (id);
 *   DROP INDEX public.pay_period_schedule_id;
       public         timetrex    false    212                       1259    21939    pay_period_schedule_user_id    INDEX     ^   CREATE UNIQUE INDEX pay_period_schedule_user_id ON pay_period_schedule_user USING btree (id);
 /   DROP INDEX public.pay_period_schedule_user_id;
       public         timetrex    false    213                       1259    21940 /   pay_period_schedule_user_pay_period_schedule_id    INDEX        CREATE INDEX pay_period_schedule_user_pay_period_schedule_id ON pay_period_schedule_user USING btree (pay_period_schedule_id);
 C   DROP INDEX public.pay_period_schedule_user_pay_period_schedule_id;
       public         timetrex    false    213                       1259    21941     pay_period_schedule_user_user_id    INDEX     a   CREATE INDEX pay_period_schedule_user_user_id ON pay_period_schedule_user USING btree (user_id);
 4   DROP INDEX public.pay_period_schedule_user_user_id;
       public         timetrex    false    213            L           1259    21950    pay_period_time_sheet_verify_id    INDEX     f   CREATE UNIQUE INDEX pay_period_time_sheet_verify_id ON pay_period_time_sheet_verify USING btree (id);
 3   DROP INDEX public.pay_period_time_sheet_verify_id;
       public         timetrex    false    245            M           1259    21951 2   pay_period_time_sheet_verify_user_id_pay_period_id    INDEX     �   CREATE INDEX pay_period_time_sheet_verify_user_id_pay_period_id ON pay_period_time_sheet_verify USING btree (user_id, pay_period_id);
 F   DROP INDEX public.pay_period_time_sheet_verify_user_id_pay_period_id;
       public         timetrex    false    245    245                       1259    21968    pay_stub_amendment_id    INDEX     R   CREATE UNIQUE INDEX pay_stub_amendment_id ON pay_stub_amendment USING btree (id);
 )   DROP INDEX public.pay_stub_amendment_id;
       public         timetrex    false    215                       1259    21969    pay_stub_amendment_user_id    INDEX     U   CREATE INDEX pay_stub_amendment_user_id ON pay_stub_amendment USING btree (user_id);
 .   DROP INDEX public.pay_stub_amendment_user_id;
       public         timetrex    false    215                       1259    21992 !   pay_stub_entry_account_company_id    INDEX     c   CREATE INDEX pay_stub_entry_account_company_id ON pay_stub_entry_account USING btree (company_id);
 5   DROP INDEX public.pay_stub_entry_account_company_id;
       public         timetrex    false    217                       1259    21991    pay_stub_entry_account_id    INDEX     Z   CREATE UNIQUE INDEX pay_stub_entry_account_id ON pay_stub_entry_account USING btree (id);
 -   DROP INDEX public.pay_stub_entry_account_id;
       public         timetrex    false    217                       1259    22001    pay_stub_entry_account_link_id    INDEX     d   CREATE UNIQUE INDEX pay_stub_entry_account_link_id ON pay_stub_entry_account_link USING btree (id);
 2   DROP INDEX public.pay_stub_entry_account_link_id;
       public         timetrex    false    218                       1259    21978    pay_stub_entry_id    INDEX     J   CREATE UNIQUE INDEX pay_stub_entry_id ON pay_stub_entry USING btree (id);
 %   DROP INDEX public.pay_stub_entry_id;
       public         timetrex    false    216                       1259    21980    pay_stub_entry_name_id    INDEX     \   CREATE INDEX pay_stub_entry_name_id ON pay_stub_entry USING btree (pay_stub_entry_name_id);
 *   DROP INDEX public.pay_stub_entry_name_id;
       public         timetrex    false    216                       1259    21979    pay_stub_entry_pay_stub_id    INDEX     U   CREATE INDEX pay_stub_entry_pay_stub_id ON pay_stub_entry USING btree (pay_stub_id);
 .   DROP INDEX public.pay_stub_entry_pay_stub_id;
       public         timetrex    false    216                       1259    21957    pay_stub_id    INDEX     >   CREATE UNIQUE INDEX pay_stub_id ON pay_stub USING btree (id);
    DROP INDEX public.pay_stub_id;
       public         timetrex    false    214            �           1259    22022    pay_stub_transaction_id    INDEX     V   CREATE UNIQUE INDEX pay_stub_transaction_id ON pay_stub_transaction USING btree (id);
 +   DROP INDEX public.pay_stub_transaction_id;
       public         timetrex    false    308            �           1259    22023     pay_stub_transaction_pay_stub_id    INDEX     a   CREATE INDEX pay_stub_transaction_pay_stub_id ON pay_stub_transaction USING btree (pay_stub_id);
 4   DROP INDEX public.pay_stub_transaction_pay_stub_id;
       public         timetrex    false    308            �           1259    22024 1   pay_stub_transaction_remittance_source_account_id    INDEX     �   CREATE INDEX pay_stub_transaction_remittance_source_account_id ON pay_stub_transaction USING btree (remittance_source_account_id);
 E   DROP INDEX public.pay_stub_transaction_remittance_source_account_id;
       public         timetrex    false    308                       1259    21959    pay_stub_user_id_pay_period_id    INDEX     ^   CREATE INDEX pay_stub_user_id_pay_period_id ON pay_stub USING btree (user_id, pay_period_id);
 2   DROP INDEX public.pay_stub_user_id_pay_period_id;
       public         timetrex    false    214    214                       1259    21958 %   pay_stub_user_id_pay_period_id_run_id    INDEX     �   CREATE UNIQUE INDEX pay_stub_user_id_pay_period_id_run_id ON pay_stub USING btree (user_id, pay_period_id, run_id) WHERE ((deleted = 0) AND (temp = 0));
 9   DROP INDEX public.pay_stub_user_id_pay_period_id_run_id;
       public         timetrex    false    214    214    214    214    214            �           1259    22093 "   payroll_remittance_agency_event_id    INDEX     l   CREATE UNIQUE INDEX payroll_remittance_agency_event_id ON payroll_remittance_agency_event USING btree (id);
 6   DROP INDEX public.payroll_remittance_agency_event_id;
       public         timetrex    false    305            �           1259    22102 <   payroll_remittance_agency_event_payroll_remittance_agency_id    INDEX     �   CREATE INDEX payroll_remittance_agency_event_payroll_remittance_agency_id ON payroll_remittance_agency_event USING btree (payroll_remittance_agency_id);
 P   DROP INDEX public.payroll_remittance_agency_event_payroll_remittance_agency_id;
       public         timetrex    false    305            �           1259    22035    payroll_remittance_agency_id    INDEX     `   CREATE UNIQUE INDEX payroll_remittance_agency_id ON payroll_remittance_agency USING btree (id);
 0   DROP INDEX public.payroll_remittance_agency_id;
       public         timetrex    false    304            �           1259    22044 )   payroll_remittance_agency_legal_entity_id    INDEX     s   CREATE INDEX payroll_remittance_agency_legal_entity_id ON payroll_remittance_agency USING btree (legal_entity_id);
 =   DROP INDEX public.payroll_remittance_agency_legal_entity_id;
       public         timetrex    false    304            U           1259    22162    permission_control_company_id    INDEX     [   CREATE INDEX permission_control_company_id ON permission_control USING btree (company_id);
 1   DROP INDEX public.permission_control_company_id;
       public         timetrex    false    251            V           1259    22161    permission_control_id    INDEX     R   CREATE UNIQUE INDEX permission_control_id ON permission_control USING btree (id);
 )   DROP INDEX public.permission_control_id;
       public         timetrex    false    251            Z           1259    22151    permission_id    INDEX     B   CREATE UNIQUE INDEX permission_id ON permission USING btree (id);
 !   DROP INDEX public.permission_id;
       public         timetrex    false    253            [           1259    22152     permission_permission_control_id    INDEX     a   CREATE INDEX permission_permission_control_id ON permission USING btree (permission_control_id);
 4   DROP INDEX public.permission_permission_control_id;
       public         timetrex    false    253            W           1259    22171    permission_user_id    INDEX     L   CREATE UNIQUE INDEX permission_user_id ON permission_user USING btree (id);
 &   DROP INDEX public.permission_user_id;
       public         timetrex    false    252            X           1259    22172 %   permission_user_permission_control_id    INDEX     k   CREATE INDEX permission_user_permission_control_id ON permission_user USING btree (permission_control_id);
 9   DROP INDEX public.permission_user_permission_control_id;
       public         timetrex    false    252            Y           1259    22173    permission_user_user_id    INDEX     O   CREATE INDEX permission_user_user_id ON permission_user USING btree (user_id);
 +   DROP INDEX public.permission_user_user_id;
       public         timetrex    false    252                       1259    22180    policy_group_id    INDEX     F   CREATE UNIQUE INDEX policy_group_id ON policy_group USING btree (id);
 #   DROP INDEX public.policy_group_id;
       public         timetrex    false    219                       1259    22188    policy_group_user_id    INDEX     P   CREATE UNIQUE INDEX policy_group_user_id ON policy_group_user USING btree (id);
 (   DROP INDEX public.policy_group_user_id;
       public         timetrex    false    220                       1259    22189 !   policy_group_user_policy_group_id    INDEX     c   CREATE INDEX policy_group_user_policy_group_id ON policy_group_user USING btree (policy_group_id);
 5   DROP INDEX public.policy_group_user_policy_group_id;
       public         timetrex    false    220                       1259    22190    policy_group_user_user_id    INDEX     S   CREATE INDEX policy_group_user_user_id ON policy_group_user USING btree (user_id);
 -   DROP INDEX public.policy_group_user_user_id;
       public         timetrex    false    220            \           1259    22281    premium_policy_branch_id    INDEX     X   CREATE UNIQUE INDEX premium_policy_branch_id ON premium_policy_branch USING btree (id);
 ,   DROP INDEX public.premium_policy_branch_id;
       public         timetrex    false    254            ]           1259    22294    premium_policy_department_id    INDEX     `   CREATE UNIQUE INDEX premium_policy_department_id ON premium_policy_department USING btree (id);
 0   DROP INDEX public.premium_policy_department_id;
       public         timetrex    false    255                        1259    22199    premium_policy_id    INDEX     J   CREATE UNIQUE INDEX premium_policy_id ON premium_policy USING btree (id);
 %   DROP INDEX public.premium_policy_id;
       public         timetrex    false    221            �           1259    22320    punch_control_branch_id    INDEX     O   CREATE INDEX punch_control_branch_id ON punch_control USING btree (branch_id);
 +   DROP INDEX public.punch_control_branch_id;
       public         timetrex    false    297            �           1259    22321    punch_control_department_id    INDEX     W   CREATE INDEX punch_control_department_id ON punch_control USING btree (department_id);
 /   DROP INDEX public.punch_control_department_id;
       public         timetrex    false    297            �           1259    22317    punch_control_id    INDEX     H   CREATE UNIQUE INDEX punch_control_id ON punch_control USING btree (id);
 $   DROP INDEX public.punch_control_id;
       public         timetrex    false    297            �           1259    22322    punch_control_job_id    INDEX     I   CREATE INDEX punch_control_job_id ON punch_control USING btree (job_id);
 (   DROP INDEX public.punch_control_job_id;
       public         timetrex    false    297            �           1259    22323    punch_control_job_item_id    INDEX     S   CREATE INDEX punch_control_job_item_id ON punch_control USING btree (job_item_id);
 -   DROP INDEX public.punch_control_job_item_id;
       public         timetrex    false    297            �           1259    22319    punch_control_pay_period_id    INDEX     W   CREATE INDEX punch_control_pay_period_id ON punch_control USING btree (pay_period_id);
 /   DROP INDEX public.punch_control_pay_period_id;
       public         timetrex    false    297            �           1259    22318    punch_control_user_id_user_date    INDEX     a   CREATE INDEX punch_control_user_id_user_date ON punch_control USING btree (user_id, date_stamp);
 3   DROP INDEX public.punch_control_user_id_user_date;
       public         timetrex    false    297    297            !           1259    19592    punch_has_image    INDEX     ?   CREATE INDEX punch_has_image ON punch USING btree (has_image);
 #   DROP INDEX public.punch_has_image;
       public         timetrex    false    222            "           1259    22307    punch_id    INDEX     8   CREATE UNIQUE INDEX punch_id ON punch USING btree (id);
    DROP INDEX public.punch_id;
       public         timetrex    false    222            #           1259    22309    punch_punch_control_id    INDEX     M   CREATE INDEX punch_punch_control_id ON punch USING btree (punch_control_id);
 *   DROP INDEX public.punch_punch_control_id;
       public         timetrex    false    222            $           1259    22308    punch_punch_control_status_id    INDEX     z   CREATE UNIQUE INDEX punch_punch_control_status_id ON punch USING btree (punch_control_id, status_id) WHERE (deleted = 0);
 1   DROP INDEX public.punch_punch_control_status_id;
       public         timetrex    false    222    222    222            �           1259    22342    qualification_company_id    INDEX     Q   CREATE INDEX qualification_company_id ON qualification USING btree (company_id);
 ,   DROP INDEX public.qualification_company_id;
       public         timetrex    false    274            �           1259    22362    qualification_group_company_id    INDEX     ]   CREATE INDEX qualification_group_company_id ON qualification_group USING btree (company_id);
 2   DROP INDEX public.qualification_group_company_id;
       public         timetrex    false    280            �           1259    22353    qualification_group_id    INDEX     T   CREATE UNIQUE INDEX qualification_group_id ON qualification_group USING btree (id);
 *   DROP INDEX public.qualification_group_id;
       public         timetrex    false    280            �           1259    22341    qualification_id    INDEX     H   CREATE UNIQUE INDEX qualification_id ON qualification USING btree (id);
 $   DROP INDEX public.qualification_id;
       public         timetrex    false    274            �           1259    19465    qualification_type_id    INDEX     K   CREATE INDEX qualification_type_id ON qualification USING btree (type_id);
 )   DROP INDEX public.qualification_type_id;
       public         timetrex    false    274            %           1259    22413    recurring_holiday_company_id    INDEX     Y   CREATE INDEX recurring_holiday_company_id ON recurring_holiday USING btree (company_id);
 0   DROP INDEX public.recurring_holiday_company_id;
       public         timetrex    false    223            &           1259    22404    recurring_holiday_id    INDEX     P   CREATE UNIQUE INDEX recurring_holiday_id ON recurring_holiday USING btree (id);
 (   DROP INDEX public.recurring_holiday_id;
       public         timetrex    false    223            '           1259    22446    recurring_ps_amendment_id    INDEX     Z   CREATE UNIQUE INDEX recurring_ps_amendment_id ON recurring_ps_amendment USING btree (id);
 -   DROP INDEX public.recurring_ps_amendment_id;
       public         timetrex    false    224            (           1259    22496    recurring_ps_amendment_user_id    INDEX     d   CREATE UNIQUE INDEX recurring_ps_amendment_user_id ON recurring_ps_amendment_user USING btree (id);
 2   DROP INDEX public.recurring_ps_amendment_user_id;
       public         timetrex    false    225            �           1259    22510    recurring_schedule_company_id    INDEX     [   CREATE INDEX recurring_schedule_company_id ON recurring_schedule USING btree (company_id);
 1   DROP INDEX public.recurring_schedule_company_id;
       public         timetrex    false    302            )           1259    22530    recurring_schedule_control_id    INDEX     b   CREATE UNIQUE INDEX recurring_schedule_control_id ON recurring_schedule_control USING btree (id);
 1   DROP INDEX public.recurring_schedule_control_id;
       public         timetrex    false    226            �           1259    22509    recurring_schedule_id    INDEX     R   CREATE UNIQUE INDEX recurring_schedule_id ON recurring_schedule USING btree (id);
 )   DROP INDEX public.recurring_schedule_id;
       public         timetrex    false    302            -           1259    22552 0   recurring_schedule_recurring_schedule_control_id    INDEX     �   CREATE INDEX recurring_schedule_recurring_schedule_control_id ON recurring_schedule_user USING btree (recurring_schedule_control_id);
 D   DROP INDEX public.recurring_schedule_recurring_schedule_control_id;
       public         timetrex    false    229            �           1259    22512 2   recurring_schedule_recurring_schedule_control_id_b    INDEX     �   CREATE INDEX recurring_schedule_recurring_schedule_control_id_b ON recurring_schedule USING btree (recurring_schedule_control_id);
 F   DROP INDEX public.recurring_schedule_recurring_schedule_control_id_b;
       public         timetrex    false    302            ,           1259    22543 &   recurring_schedule_template_control_id    INDEX     t   CREATE UNIQUE INDEX recurring_schedule_template_control_id ON recurring_schedule_template_control USING btree (id);
 :   DROP INDEX public.recurring_schedule_template_control_id;
       public         timetrex    false    228            *           1259    22535    recurring_schedule_template_id    INDEX     d   CREATE UNIQUE INDEX recurring_schedule_template_id ON recurring_schedule_template USING btree (id);
 2   DROP INDEX public.recurring_schedule_template_id;
       public         timetrex    false    227            +           1259    22536 8   recurring_schedule_template_schedule_template_control_id    INDEX     �   CREATE INDEX recurring_schedule_template_schedule_template_control_id ON recurring_schedule_template USING btree (recurring_schedule_template_control_id);
 L   DROP INDEX public.recurring_schedule_template_schedule_template_control_id;
       public         timetrex    false    227            .           1259    22551    recurring_schedule_user_id    INDEX     \   CREATE UNIQUE INDEX recurring_schedule_user_id ON recurring_schedule_user USING btree (id);
 .   DROP INDEX public.recurring_schedule_user_id;
       public         timetrex    false    229            �           1259    22511 $   recurring_schedule_user_id_user_date    INDEX     k   CREATE INDEX recurring_schedule_user_id_user_date ON recurring_schedule USING btree (user_id, date_stamp);
 8   DROP INDEX public.recurring_schedule_user_id_user_date;
       public         timetrex    false    302    302            /           1259    22553    recurring_schedule_user_user_id    INDEX     _   CREATE INDEX recurring_schedule_user_user_id ON recurring_schedule_user USING btree (user_id);
 3   DROP INDEX public.recurring_schedule_user_user_id;
       public         timetrex    false    229            �           1259    22562    regular_time_policy_id    INDEX     T   CREATE UNIQUE INDEX regular_time_policy_id ON regular_time_policy USING btree (id);
 *   DROP INDEX public.regular_time_policy_id;
       public         timetrex    false    292            �           1259    22571 !   remittance_destination_account_id    INDEX     j   CREATE UNIQUE INDEX remittance_destination_account_id ON remittance_destination_account USING btree (id);
 5   DROP INDEX public.remittance_destination_account_id;
       public         timetrex    false    307            �           1259    22581 ;   remittance_destination_account_remittance_source_account_id    INDEX     �   CREATE INDEX remittance_destination_account_remittance_source_account_id ON remittance_destination_account USING btree (remittance_source_account_id);
 O   DROP INDEX public.remittance_destination_account_remittance_source_account_id;
       public         timetrex    false    307            �           1259    22591 &   remittance_destination_account_user_id    INDEX     m   CREATE INDEX remittance_destination_account_user_id ON remittance_destination_account USING btree (user_id);
 :   DROP INDEX public.remittance_destination_account_user_id;
       public         timetrex    false    307            �           1259    22637    remittance_source_account_id    INDEX     `   CREATE UNIQUE INDEX remittance_source_account_id ON remittance_source_account USING btree (id);
 0   DROP INDEX public.remittance_source_account_id;
       public         timetrex    false    306            �           1259    22646 )   remittance_source_account_legal_entity_id    INDEX     s   CREATE INDEX remittance_source_account_legal_entity_id ON remittance_source_account USING btree (legal_entity_id);
 =   DROP INDEX public.remittance_source_account_legal_entity_id;
       public         timetrex    false    306            �           1259    22687 
   request_id    INDEX     <   CREATE UNIQUE INDEX request_id ON request USING btree (id);
    DROP INDEX public.request_id;
       public         timetrex    false    300            �           1259    22689    request_pay_period_id    INDEX     K   CREATE INDEX request_pay_period_id ON request USING btree (pay_period_id);
 )   DROP INDEX public.request_pay_period_id;
       public         timetrex    false    300            �           1259    20204    request_status_id    INDEX     C   CREATE INDEX request_status_id ON request USING btree (status_id);
 %   DROP INDEX public.request_status_id;
       public         timetrex    false    300            �           1259    20203    request_type_id    INDEX     ?   CREATE INDEX request_type_id ON request USING btree (type_id);
 #   DROP INDEX public.request_type_id;
       public         timetrex    false    300            �           1259    22688    request_user_id_user_date    INDEX     U   CREATE INDEX request_user_id_user_date ON request USING btree (user_id, date_stamp);
 -   DROP INDEX public.request_user_id_user_date;
       public         timetrex    false    300    300            0           1259    22698    roe_id    INDEX     4   CREATE UNIQUE INDEX roe_id ON roe USING btree (id);
    DROP INDEX public.roe_id;
       public         timetrex    false    230            1           1259    22734    round_interval_policy_id    INDEX     X   CREATE UNIQUE INDEX round_interval_policy_id ON round_interval_policy USING btree (id);
 ,   DROP INDEX public.round_interval_policy_id;
       public         timetrex    false    231            �           1259    22774    schedule_branch_id    INDEX     E   CREATE INDEX schedule_branch_id ON schedule USING btree (branch_id);
 &   DROP INDEX public.schedule_branch_id;
       public         timetrex    false    298            �           1259    22771    schedule_company_id    INDEX     G   CREATE INDEX schedule_company_id ON schedule USING btree (company_id);
 '   DROP INDEX public.schedule_company_id;
       public         timetrex    false    298            �           1259    22779 7   schedule_company_recurring_schedule_template_control_id    INDEX     �   CREATE INDEX schedule_company_recurring_schedule_template_control_id ON schedule USING btree (recurring_schedule_template_control_id);
 K   DROP INDEX public.schedule_company_recurring_schedule_template_control_id;
       public         timetrex    false    298            �           1259    22775    schedule_department_id    INDEX     M   CREATE INDEX schedule_department_id ON schedule USING btree (department_id);
 *   DROP INDEX public.schedule_department_id;
       public         timetrex    false    298            �           1259    22770    schedule_id    INDEX     >   CREATE UNIQUE INDEX schedule_id ON schedule USING btree (id);
    DROP INDEX public.schedule_id;
       public         timetrex    false    298            �           1259    22776    schedule_job_id    INDEX     ?   CREATE INDEX schedule_job_id ON schedule USING btree (job_id);
 #   DROP INDEX public.schedule_job_id;
       public         timetrex    false    298            �           1259    22777    schedule_job_item_id    INDEX     I   CREATE INDEX schedule_job_item_id ON schedule USING btree (job_item_id);
 (   DROP INDEX public.schedule_job_item_id;
       public         timetrex    false    298            �           1259    22773    schedule_pay_period_id    INDEX     M   CREATE INDEX schedule_pay_period_id ON schedule USING btree (pay_period_id);
 *   DROP INDEX public.schedule_pay_period_id;
       public         timetrex    false    298            2           1259    22804    schedule_policy_id    INDEX     L   CREATE UNIQUE INDEX schedule_policy_id ON schedule_policy USING btree (id);
 &   DROP INDEX public.schedule_policy_id;
       public         timetrex    false    232            �           1259    22778    schedule_replaced_id    INDEX     I   CREATE INDEX schedule_replaced_id ON schedule USING btree (replaced_id);
 (   DROP INDEX public.schedule_replaced_id;
       public         timetrex    false    298            �           1259    22772    schedule_user_id_user_date    INDEX     W   CREATE INDEX schedule_user_id_user_date ON schedule USING btree (user_id, date_stamp);
 .   DROP INDEX public.schedule_user_id_user_date;
       public         timetrex    false    298    298            ^           1259    22828    station_branch_id    INDEX     J   CREATE UNIQUE INDEX station_branch_id ON station_branch USING btree (id);
 %   DROP INDEX public.station_branch_id;
       public         timetrex    false    256            _           1259    22834    station_branch_station_id    INDEX     S   CREATE INDEX station_branch_station_id ON station_branch USING btree (station_id);
 -   DROP INDEX public.station_branch_station_id;
       public         timetrex    false    256            3           1259    22815    station_company_id    INDEX     E   CREATE INDEX station_company_id ON station USING btree (company_id);
 &   DROP INDEX public.station_company_id;
       public         timetrex    false    233            4           1259    22814    station_company_id_station_id    INDEX     \   CREATE INDEX station_company_id_station_id ON station USING btree (company_id, station_id);
 1   DROP INDEX public.station_company_id_station_id;
       public         timetrex    false    233    233            5           1259    22813 $   station_company_id_status_id_type_id    INDEX     k   CREATE INDEX station_company_id_status_id_type_id ON station USING btree (company_id, status_id, type_id);
 8   DROP INDEX public.station_company_id_status_id_type_id;
       public         timetrex    false    233    233    233            `           1259    22845    station_department_id    INDEX     R   CREATE UNIQUE INDEX station_department_id ON station_department USING btree (id);
 )   DROP INDEX public.station_department_id;
       public         timetrex    false    257            a           1259    22851    station_department_station_id    INDEX     [   CREATE INDEX station_department_station_id ON station_department USING btree (station_id);
 1   DROP INDEX public.station_department_station_id;
       public         timetrex    false    257            f           1259    22862    station_exclude_user_id    INDEX     V   CREATE UNIQUE INDEX station_exclude_user_id ON station_exclude_user USING btree (id);
 +   DROP INDEX public.station_exclude_user_id;
       public         timetrex    false    260            g           1259    22868    station_exclude_user_station_id    INDEX     _   CREATE INDEX station_exclude_user_station_id ON station_exclude_user USING btree (station_id);
 3   DROP INDEX public.station_exclude_user_station_id;
       public         timetrex    false    260            6           1259    22812 
   station_id    INDEX     <   CREATE UNIQUE INDEX station_id ON station USING btree (id);
    DROP INDEX public.station_id;
       public         timetrex    false    233            d           1259    22879    station_include_user_id    INDEX     V   CREATE UNIQUE INDEX station_include_user_id ON station_include_user USING btree (id);
 +   DROP INDEX public.station_include_user_id;
       public         timetrex    false    259            e           1259    22885    station_include_user_station_id    INDEX     _   CREATE INDEX station_include_user_station_id ON station_include_user USING btree (station_id);
 3   DROP INDEX public.station_include_user_station_id;
       public         timetrex    false    259            b           1259    22911    station_user_group_id    INDEX     R   CREATE UNIQUE INDEX station_user_group_id ON station_user_group USING btree (id);
 )   DROP INDEX public.station_user_group_id;
       public         timetrex    false    258            c           1259    22917    station_user_group_station_id    INDEX     [   CREATE INDEX station_user_group_station_id ON station_user_group USING btree (station_id);
 1   DROP INDEX public.station_user_group_station_id;
       public         timetrex    false    258            7           1259    22896    station_user_id    INDEX     F   CREATE UNIQUE INDEX station_user_id ON station_user USING btree (id);
 #   DROP INDEX public.station_user_id;
       public         timetrex    false    234            z           1259    22942    system_log_detail_id    INDEX     P   CREATE UNIQUE INDEX system_log_detail_id ON system_log_detail USING btree (id);
 (   DROP INDEX public.system_log_detail_id;
       public         timetrex    false    270            {           1259    22943    system_log_detail_system_log_id    INDEX     _   CREATE INDEX system_log_detail_system_log_id ON system_log_detail USING btree (system_log_id);
 3   DROP INDEX public.system_log_detail_system_log_id;
       public         timetrex    false    270                       1259    22928    system_log_id    INDEX     B   CREATE UNIQUE INDEX system_log_id ON system_log USING btree (id);
 !   DROP INDEX public.system_log_id;
       public         timetrex    false    206                       1259    22931    system_log_object_id_table_name    INDEX     `   CREATE INDEX system_log_object_id_table_name ON system_log USING btree (object_id, table_name);
 3   DROP INDEX public.system_log_object_id_table_name;
       public         timetrex    false    206    206                       1259    22929    system_log_user_id_date    INDEX     P   CREATE INDEX system_log_user_id_date ON system_log USING btree (user_id, date);
 +   DROP INDEX public.system_log_user_id_date;
       public         timetrex    false    206    206                       1259    22930 '   system_log_user_id_table_name_action_id    INDEX     q   CREATE INDEX system_log_user_id_table_name_action_id ON system_log USING btree (user_id, table_name, action_id);
 ;   DROP INDEX public.system_log_user_id_table_name_action_id;
       public         timetrex    false    206    206    206            8           1259    22952    system_setting_id    INDEX     J   CREATE UNIQUE INDEX system_setting_id ON system_setting USING btree (id);
 %   DROP INDEX public.system_setting_id;
       public         timetrex    false    235            �           1259    22960    user_contact_id    INDEX     F   CREATE UNIQUE INDEX user_contact_id ON user_contact USING btree (id);
 #   DROP INDEX public.user_contact_id;
       public         timetrex    false    285            �           1259    22969    user_contact_user_id    INDEX     I   CREATE INDEX user_contact_user_id ON user_contact USING btree (user_id);
 (   DROP INDEX public.user_contact_user_id;
       public         timetrex    false    285            ;           1259    17299    user_date_date_stamp    INDEX     I   CREATE INDEX user_date_date_stamp ON user_date USING btree (date_stamp);
 (   DROP INDEX public.user_date_date_stamp;
       public         timetrex    false    237            <           1259    23016    user_date_id    INDEX     @   CREATE UNIQUE INDEX user_date_id ON user_date USING btree (id);
     DROP INDEX public.user_date_id;
       public         timetrex    false    237            =           1259    23035    user_date_pay_period_id    INDEX     O   CREATE INDEX user_date_pay_period_id ON user_date USING btree (pay_period_id);
 +   DROP INDEX public.user_date_pay_period_id;
       public         timetrex    false    237            �           1259    23072    user_date_total_branch_id    INDEX     S   CREATE INDEX user_date_total_branch_id ON user_date_total USING btree (branch_id);
 -   DROP INDEX public.user_date_total_branch_id;
       public         timetrex    false    296            �           1259    23073    user_date_total_department_id    INDEX     [   CREATE INDEX user_date_total_department_id ON user_date_total USING btree (department_id);
 1   DROP INDEX public.user_date_total_department_id;
       public         timetrex    false    296            �           1259    23068    user_date_total_id    INDEX     L   CREATE UNIQUE INDEX user_date_total_id ON user_date_total USING btree (id);
 &   DROP INDEX public.user_date_total_id;
       public         timetrex    false    296            �           1259    23074    user_date_total_job_id    INDEX     M   CREATE INDEX user_date_total_job_id ON user_date_total USING btree (job_id);
 *   DROP INDEX public.user_date_total_job_id;
       public         timetrex    false    296            �           1259    23075    user_date_total_job_item_id    INDEX     W   CREATE INDEX user_date_total_job_item_id ON user_date_total USING btree (job_item_id);
 /   DROP INDEX public.user_date_total_job_item_id;
       public         timetrex    false    296            �           1259    20108    user_date_total_object_type_id    INDEX     ]   CREATE INDEX user_date_total_object_type_id ON user_date_total USING btree (object_type_id);
 2   DROP INDEX public.user_date_total_object_type_id;
       public         timetrex    false    296            �           1259    23071    user_date_total_pay_code_id    INDEX     W   CREATE INDEX user_date_total_pay_code_id ON user_date_total USING btree (pay_code_id);
 /   DROP INDEX public.user_date_total_pay_code_id;
       public         timetrex    false    296            �           1259    23070    user_date_total_pay_period_id    INDEX     [   CREATE INDEX user_date_total_pay_period_id ON user_date_total USING btree (pay_period_id);
 1   DROP INDEX public.user_date_total_pay_period_id;
       public         timetrex    false    296            �           1259    23069 !   user_date_total_user_id_user_date    INDEX     e   CREATE INDEX user_date_total_user_id_user_date ON user_date_total USING btree (user_id, date_stamp);
 5   DROP INDEX public.user_date_total_user_id_user_date;
       public         timetrex    false    296    296            >           1259    23026    user_date_user_id    INDEX     C   CREATE INDEX user_date_user_id ON user_date USING btree (user_id);
 %   DROP INDEX public.user_date_user_id;
       public         timetrex    false    237            ?           1259    23025 #   user_date_user_id_user_date_deleted    INDEX     q   CREATE UNIQUE INDEX user_date_user_id_user_date_deleted ON user_date USING btree (user_id, date_stamp, deleted);
 7   DROP INDEX public.user_date_user_id_user_date_deleted;
       public         timetrex    false    237    237    237            @           1259    23100 #   user_deduction_company_deduction_id    INDEX     g   CREATE INDEX user_deduction_company_deduction_id ON user_deduction USING btree (company_deduction_id);
 7   DROP INDEX public.user_deduction_company_deduction_id;
       public         timetrex    false    238            A           1259    23099    user_deduction_id    INDEX     J   CREATE UNIQUE INDEX user_deduction_id ON user_deduction USING btree (id);
 %   DROP INDEX public.user_deduction_id;
       public         timetrex    false    238            C           1259    23202 !   user_default_company_deduction_id    INDEX     j   CREATE UNIQUE INDEX user_default_company_deduction_id ON user_default_company_deduction USING btree (id);
 5   DROP INDEX public.user_default_company_deduction_id;
       public         timetrex    false    240            B           1259    23109    user_default_id    INDEX     F   CREATE UNIQUE INDEX user_default_id ON user_default USING btree (id);
 #   DROP INDEX public.user_default_id;
       public         timetrex    false    239            �           1259    23215    user_education_id    INDEX     J   CREATE UNIQUE INDEX user_education_id ON user_education USING btree (id);
 %   DROP INDEX public.user_education_id;
       public         timetrex    false    275            �           1259    23235    user_education_qualification_id    INDEX     _   CREATE INDEX user_education_qualification_id ON user_education USING btree (qualification_id);
 3   DROP INDEX public.user_education_qualification_id;
       public         timetrex    false    275            �           1259    23225    user_education_user_id    INDEX     M   CREATE INDEX user_education_user_id ON user_education USING btree (user_id);
 *   DROP INDEX public.user_education_user_id;
       public         timetrex    false    275            D           1259    23274    user_generic_data_company_id    INDEX     Y   CREATE INDEX user_generic_data_company_id ON user_generic_data USING btree (company_id);
 0   DROP INDEX public.user_generic_data_company_id;
       public         timetrex    false    241            E           1259    23272    user_generic_data_id    INDEX     P   CREATE UNIQUE INDEX user_generic_data_id ON user_generic_data USING btree (id);
 (   DROP INDEX public.user_generic_data_id;
       public         timetrex    false    241            F           1259    23273    user_generic_data_user_id    INDEX     S   CREATE INDEX user_generic_data_user_id ON user_generic_data USING btree (user_id);
 -   DROP INDEX public.user_generic_data_user_id;
       public         timetrex    false    241            P           1259    23284    user_generic_status_id    INDEX     T   CREATE UNIQUE INDEX user_generic_status_id ON user_generic_status USING btree (id);
 *   DROP INDEX public.user_generic_status_id;
       public         timetrex    false    247            Q           1259    23285 $   user_generic_status_user_id_batch_id    INDEX     j   CREATE INDEX user_generic_status_user_id_batch_id ON user_generic_status USING btree (user_id, batch_id);
 8   DROP INDEX public.user_generic_status_user_id_batch_id;
       public         timetrex    false    247    247            R           1259    23294    user_group_id    INDEX     B   CREATE UNIQUE INDEX user_group_id ON user_group USING btree (id);
 !   DROP INDEX public.user_group_id;
       public         timetrex    false    248            9           1259    23753    user_id    INDEX     7   CREATE UNIQUE INDEX user_id ON users USING btree (id);
    DROP INDEX public.user_id;
       public         timetrex    false    236            h           1259    23303    user_identification_id    INDEX     T   CREATE UNIQUE INDEX user_identification_id ON user_identification USING btree (id);
 *   DROP INDEX public.user_identification_id;
       public         timetrex    false    261            i           1259    23304    user_identification_user_id    INDEX     W   CREATE INDEX user_identification_user_id ON user_identification USING btree (user_id);
 /   DROP INDEX public.user_identification_user_id;
       public         timetrex    false    261            �           1259    23313    user_language_id    INDEX     H   CREATE UNIQUE INDEX user_language_id ON user_language USING btree (id);
 $   DROP INDEX public.user_language_id;
       public         timetrex    false    278            �           1259    23334    user_language_qualification_id    INDEX     ]   CREATE INDEX user_language_qualification_id ON user_language USING btree (qualification_id);
 2   DROP INDEX public.user_language_qualification_id;
       public         timetrex    false    278            �           1259    23323    user_language_user_id    INDEX     K   CREATE INDEX user_language_user_id ON user_language USING btree (user_id);
 )   DROP INDEX public.user_language_user_id;
       public         timetrex    false    278            �           1259    23371    user_license_id    INDEX     F   CREATE UNIQUE INDEX user_license_id ON user_license USING btree (id);
 #   DROP INDEX public.user_license_id;
       public         timetrex    false    276            �           1259    23391    user_license_qualification_id    INDEX     [   CREATE INDEX user_license_qualification_id ON user_license USING btree (qualification_id);
 1   DROP INDEX public.user_license_qualification_id;
       public         timetrex    false    276            �           1259    23381    user_license_user_id    INDEX     I   CREATE INDEX user_license_user_id ON user_license USING btree (user_id);
 (   DROP INDEX public.user_license_user_id;
       public         timetrex    false    276            �           1259    23428    user_membership_id    INDEX     L   CREATE UNIQUE INDEX user_membership_id ON user_membership USING btree (id);
 &   DROP INDEX public.user_membership_id;
       public         timetrex    false    279            �           1259    23443     user_membership_qualification_id    INDEX     a   CREATE INDEX user_membership_qualification_id ON user_membership USING btree (qualification_id);
 4   DROP INDEX public.user_membership_qualification_id;
       public         timetrex    false    279            �           1259    23435    user_membership_user_id    INDEX     O   CREATE INDEX user_membership_user_id ON user_membership USING btree (user_id);
 +   DROP INDEX public.user_membership_user_id;
       public         timetrex    false    279            G           1259    23474    user_preference_id    INDEX     L   CREATE UNIQUE INDEX user_preference_id ON user_preference USING btree (id);
 &   DROP INDEX public.user_preference_id;
       public         timetrex    false    242            H           1259    23475    user_preference_user_id_ukey    INDEX     [   CREATE UNIQUE INDEX user_preference_user_id_ukey ON user_preference USING btree (user_id);
 0   DROP INDEX public.user_preference_user_id_ukey;
       public         timetrex    false    242            |           1259    23485    user_report_data_company_id    INDEX     W   CREATE INDEX user_report_data_company_id ON user_report_data USING btree (company_id);
 /   DROP INDEX public.user_report_data_company_id;
       public         timetrex    false    271            }           1259    23484    user_report_data_id    INDEX     N   CREATE UNIQUE INDEX user_report_data_id ON user_report_data USING btree (id);
 '   DROP INDEX public.user_report_data_id;
       public         timetrex    false    271            ~           1259    23486    user_report_data_user_id    INDEX     Q   CREATE INDEX user_report_data_user_id ON user_report_data USING btree (user_id);
 ,   DROP INDEX public.user_report_data_user_id;
       public         timetrex    false    271            �           1259    23553    user_review_control_id    INDEX     T   CREATE UNIQUE INDEX user_review_control_id ON user_review_control USING btree (id);
 *   DROP INDEX public.user_review_control_id;
       public         timetrex    false    282            �           1259    23562    user_review_control_user_id    INDEX     W   CREATE INDEX user_review_control_user_id ON user_review_control USING btree (user_id);
 /   DROP INDEX public.user_review_control_user_id;
       public         timetrex    false    282            �           1259    23496    user_review_id    INDEX     D   CREATE UNIQUE INDEX user_review_id ON user_review USING btree (id);
 "   DROP INDEX public.user_review_id;
       public         timetrex    false    283            �           1259    23516    user_review_kpi_id    INDEX     E   CREATE INDEX user_review_kpi_id ON user_review USING btree (kpi_id);
 &   DROP INDEX public.user_review_kpi_id;
       public         timetrex    false    283            �           1259    23506 "   user_review_user_review_control_id    INDEX     e   CREATE INDEX user_review_user_review_control_id ON user_review USING btree (user_review_control_id);
 6   DROP INDEX public.user_review_user_review_control_id;
       public         timetrex    false    283            �           1259    23605    user_setting_id    INDEX     F   CREATE UNIQUE INDEX user_setting_id ON user_setting USING btree (id);
 #   DROP INDEX public.user_setting_id;
       public         timetrex    false    288            �           1259    23614    user_setting_user_id    INDEX     I   CREATE INDEX user_setting_user_id ON user_setting USING btree (user_id);
 (   DROP INDEX public.user_setting_user_id;
       public         timetrex    false    288            �           1259    23647    user_skill_id    INDEX     B   CREATE UNIQUE INDEX user_skill_id ON user_skill USING btree (id);
 !   DROP INDEX public.user_skill_id;
       public         timetrex    false    277            �           1259    23668    user_skill_qualification_id    INDEX     W   CREATE INDEX user_skill_qualification_id ON user_skill USING btree (qualification_id);
 /   DROP INDEX public.user_skill_qualification_id;
       public         timetrex    false    277            �           1259    23657    user_skill_user_id    INDEX     E   CREATE INDEX user_skill_user_id ON user_skill USING btree (user_id);
 &   DROP INDEX public.user_skill_user_id;
       public         timetrex    false    277            I           1259    23705    user_title_id    INDEX     B   CREATE UNIQUE INDEX user_title_id ON user_title USING btree (id);
 !   DROP INDEX public.user_title_id;
       public         timetrex    false    243            J           1259    23742    user_wage_id    INDEX     @   CREATE UNIQUE INDEX user_wage_id ON user_wage USING btree (id);
     DROP INDEX public.user_wage_id;
       public         timetrex    false    244            K           1259    23743     user_wage_user_id_effective_date    INDEX     b   CREATE INDEX user_wage_user_id_effective_date ON user_wage USING btree (user_id, effective_date);
 4   DROP INDEX public.user_wage_user_id_effective_date;
       public         timetrex    false    244    244            :           1259    23754    users_company_id    INDEX     A   CREATE INDEX users_company_id ON users USING btree (company_id);
 $   DROP INDEX public.users_company_id;
       public         timetrex    false    236            j           1259    23768    wage_group_id    INDEX     B   CREATE UNIQUE INDEX wage_group_id ON wage_group USING btree (id);
 !   DROP INDEX public.wage_group_id;
       public         timetrex    false    262            X   ^  xڽ��j�0E��Wx�.T4�,Kˆ,�.B!}l�=LM�Ғ��&��E���0��ܣ;2@�Baˬr5]sfږ� ^�����	LǙ���^t���!'���ⴡ�TF5������b���,wi�nI���?���^_̓���T)�ga�-lCG���k0U�}�<���J���qG��m:��e@���&T��S��"�V���6�3�������~�︹�D����
2�I44V
�@��nחӇ���Xh�.���ĐĬ�!��bT���nq]5�E Hd�D,;�9\҅�͠Ͷ����g��}�E�P�ޅ4 ��(> �Z��      Y      xڋ���� � �      Z      xڋ���� � �      [   �   x��P�
1<��Ij[���"x�K�Ma�����Ǻ�ě�!�0$�)��*��D=�D̠Tb��]64�\$`�#p	�*ڧ>����84ݶ��CYK���t#��D���ƺ>����3�Z��tS��i�jgRa`����PvC��@$�dEH�E��[Yk/�.w�      �   �   xڝ�;
AD�Sx���v>=�0Q�6���"�&� n���zDM8h��%�'DPe�jP�����߈�pA��e9����;�t3�ɐ!Ϙ)D���Z��'h�R�m��E�<mb')��x�X�>�e���>2XJ      �   �   xڵ�A
�0E��],���K�	�I���G�f��MKA��C�aE�]�����6m�LVz�/d�����ĘpBL��L$���|�s�0Uܕ�O�W`�:_�C$.���w�PpY׿.n`C�e<�����P�"���L9�7U<{p      �      xڭ�I�$;�d�]w�&�C��7��~l榊$��ѧ���p71UD�����V�c��Bس�w�q��]]q�o�����]ť��3S�qk���=����lq�Pt6��M>a1����c�'c��v�4mӇޭu���;���Vq.��g˷dM�o�����ڜ�y>wec��kT�ܼ��L5�?[��TWk���5э8]p����Ε>Z77��/��?[cU�W���#��k��]c�g)n�+[���l�l�Y͙�]1%͕V-5��k(�vgC���s[1:c�	�f�W�S�˄��60���o���B+W�UB8�ϖq�ڸ��s��S3u�Ԧ�4OTq�UR��CF;�>��j��e�I�M'o�U�и�o��V������瘳�=Wi7S�jk3,�`����7�b���?[�E�=�dG��F?M˾vc��yz��Lc�[Ɇx�:��9�S�9�Y�����Z�r;6g�|#��>�g+����z~ǎXC�;�^L컘9a�wze��p��1f���++}QDنQl�����>�>�\Y�jEc}�c6�F�=�Z��B��se��O�h��9c���l��܍�_�`J�9{�W�8�N�䔅��V��y�z&�x�|�SL��fc�w��=��9+�����V�\v�hC΁�l|c~�ƕ-~��?[���� =6�#�n�n�(�N<�,6F��7l45��g+����3�L��m&���&An�7�7^_��^��䓭�5�:��x�f�ʌ.���j���z�t-L��y��t||�����chavq�֛]W�k>��=�����L(�l� M�mb"D��V];_=W���b.��#�������;�pu�Xz!�:��+�|����hcU�$&�J��w3mb0��f.�㮞�y�L��}�p�Iø�����5z�n��yoJ-'|�K>�ڡ ����7�Ǽ���z�[��&nxkJ>�c��`��2uǞ�lװ�'�c�ţ����E<�ck��`�6�4��)���&�lR�� C���W��>�k�0�H�"�۝{3f��w&���j.{g�_?>Y�S��EvH��av��8���l=�����v�4�ګzcL.��eIq�x��HmW~���O |�ǒ��S�?[��z�7W�,_l��7ع\)2�A�!E�گlA�N�p6N�B���1~f>�%i>�U�1�iʺ��?ᓿ���l��oVϋhewbr�&�|\��������&�",	}�����cw{J��$��olE��	>?FWz\���3����2�f	im~%ݮl�O��W�}B�3�����3�6wJ�:�$t�w�e?ᣗ�!�J���=����Yk�	�7��֓S>��U�D-��6��'m�TJ�l����ren{����"��W�G��*Ye�[Gnҳ������J��>�˗���ŧ�჻ ���#a�^ō�ίt�/|c"\J&���g�	�� p��xe�pB�F6��0�g��-я4J�3G>��=W�ᄏ���#mt8Z� ����J�3Lj5��zc��'��Z%�T`��&��&����4#��Ӹ��~k_���)ᳺ�^��VFv�@f�v��u�|񿵯/|�r�DD��iZ߃?�Bav!�#����z���~8V[�,�D��>
��"X�a�<s+��+[�y��h�bcd>�
ܤ+�fJ^�R�eJO�pñ=�؜���ć�0���I-֗TJ���$�r����9�.��5VKz�E�&����l��1�n8[����'&��!�!֋�ׇ�$O$��
�����O��N�q�Q�F���RK+d��Y[�Q͐t�l�r�g}��ц��V�R�?1l.5Fq-��K0p�+[��7���Z
Z<H����DZv0���N�lw��te+�z��&�U+�&t�.���\������� ���o����P���8���R�-G���+�o_����>9%�f,��K.�N�Q����&L�4�+[�S��y��s��-���
��ܹF�ZܬUO48�3�ЪZ��M�x6jy�2U�{�1%.�ٲ)�/���#n]�3�5�Hӌ����"�����eCt�'|�MDM��2v�����~;2b���s�?���=��Z������;�cz�HsU~�x�\��>|c����Y�B]�n ����x�rOW��M<��}�m6$Q�𐁂*f�B!F���_���o�����*p�;>��2[�16��q�OI�7��o}�>y9V�2�]yW{ �c��>1��?Ȱf�y.�ju'|�7�'���8=�j��j))#�K����&/�01��l�Ω��I'i��*�4�wi~3n�$�k�7�el6'||���M��
�!�[���]��F�ߔ�W�����>�A��Nb 4!�	��L�wT�n����;�W���|�^��ث����p�6mX�H9!��uq��O�����@e��rr���&Mߙ����_����?/k����b�9�ݢ�F\
�7"�n�������;H��l����O��z¢屠���.4Q�6�p����Z�(��k����^{�3���f���������.6���*
*q�]C"�E�\�1o��R~{�_��<��X�cn��ʡ��:w�M���o��W�`L�ػY�Bd�7<��YGd&Z[�m�J�Y�F�o�q4ߙ��IbF69���
B&|��c�{�\�l�4'|rJX>Cp���3HO���Dӎ������ֈ���x���.�i�A&֪hD�ìS5>AlB`��;[!��]�X������Nr�i�=�x���BW��=��Q_��e�w����aBn�YF|��4�&�h�ݭ}��N��F%��5�����O��ђq��?[�1��98���XǞpPR�7[B-���/2[�l�w�6�>�>�w���I2!I�E�4#�i$�-�z�h��5��N���`.�~~�r����L��Y�E0���Q��S+��>Q.0�I��� ۳U�R�guLi�¼��	���s�ŋ3e$o�Pd��J��������y�~��	�����KĚ4�bk
c�VI�MsmO
5��V��~'|����(D4�=��H[J��:J@��	IHWϕS:ᛗ��&��c��Ʈ'��KϷ�̫�`{'|���E��X����j"�8���7ImWuD>��{�3�t+d�'��1ojk��˻|���g�c�V��:m���>j7�mCF)�b��L��޽��_{mu����іG��E�87�_�gP�TqW�Q��>{Iٲ�m��#X�c��������_7�>ǧ��_���̈�`�1��
s,�^�߶e-�wU+����;<�S�xN��X���D�1Ȯ��N�g��J�[O�����u�ΔR�)\�$�HԬ6Gn<��x��O��W���b�5v���<�?o˄Fof�j�Z�9����f�!DPo�)dk�F5ǋ�8�Q��7�'|�8v�Au�x�V�
�\�.o�SE�w�=N���\�b���Z����;��i$���"��\���-C��\�t�rh�2xa(o�Y[H���Κ>~����D�"�6t�6<r���v2,x|ju.j��>�k�B��-��B�H�g\��!�����bT��9��հS{�[��v�D~������Vu��\��؇V�_|�$�,#� ��0��|�r�,�B��H���~ᓿ��sx!�#$�h��u��2$xNK*��	�O܈y�4�C�{��f*�&%(�%`m���7�r��5���TG�]s�U�
-�`��U���o��ڊ��!z�V���KEʫi/'@x[����v�YgK՗>{�Cڻ��{o	I)O��*wGU�~WU�n'|���a&L�in��U`�p��'=���[�w���Џ�JV��@�OCl�g@�U��;�dy�OdR6'|k�kZa�^f2�hm,�ڂHm���N�6��v�?u�֋�� VeWBm`�WUy*{�E��;Ի5�\N��e��b�Rʉd�
��mX�K���&V��C���|ᓗs���X":A�Of-hF#����^�x�8�IO��>���:��!��B�ʫl8�&j;K`��:Z�'v�
�G����q<    �����\�����U�?�3�����|��(;�/92��Б"k{���|U�H��y�}�{pd*:�|���o=vWU4��:���O��e'H P�m�jDU�%��~jUӰ�_�^o˓+?�Yߨ[��!��0qAa�<	Y���'t��ޮ���Ό|��j�abbWXj���+$Kd%l�����y�'|������R��#�;6^�s�����p��O��C��c�G�[�XV���F�uH@Ʀ�ڃj�	�zlK�r�6�#s�ϓI[�>dϻ�ԘO��^�g��	��6�ˈM;3�J�e��z�_�����6(�x �Cfr����x�nE<�f�=����\�	du�#�FB%��@*׬"_o�/w� &��]3�S�B��9*:B���#6��dx,nw���[��g/���
K�(�b���j�Y�ydJ��w��;��>���Ms�����D@,WiW��>�t�7�2�&��R(-���!�ɻ�����j��o���Z}H�G����աP9�8+�������ߨ���ᇪ����a��U�GU�IV[>��YW�rN'<4,hf��R���:����a	3p��N��<ᛗ;�H�XÚ��a��1���5=�վyx�±�R��Bױ��{lߡ5���*ʅh����L8��mx�nI�{G�/*c���T��Tw��.��=���I��_T@�F%���S*y�w�~����JR���"n� U)>* ��ҋ4D��7���|��Q\��3S'��>���,j�7qw���z�g~�Ɇ��1����=cQ���D��e���
�?��'���|վ\"u�I�MشDH�W{��~��o�p��Z��m�
G'"d%	mTr�6^���>�2lk����} %��Kgtӂ����7� 8D:�{�h�� F�!8P�ȟx���9��*���Us�gmyC
u�������.y�J�D~��M�����8��\����j������(ƥ;Z:�w��^�{f?{J��'3{�^G��V��!ŗ��1xU�͗}�`?�=�j��SR���͡�g�f��[�e�r�ζ�N���/�?<��V�"� �O�l��*�Sw�)�Y��#�שs�5���dd}�fG�E�7��e{�����5^|�8Ha.��q�\!D��R��V��K?�'|�r�K�E&A���{n�db�'	
�B(���߾�|��*WH07t�`{������.{Mh�����	_~�%Cc,iJc�GF�;�DzمQc����O��FE� �e'BzO��7֫��.<r�dol!D}*��Օ9Ǯ*)n{�<M�C[>�m�ͫ��?��w"%�:��ƵUm�u�|CA6y���D��z/f��&�(��m�'�D�~-*��+\ي\���)y�2h���N;�:ĩe`l@�
r/m������bT�3��QY��pn�J�|	�Dw��&s�����-� !���pҩCF�vI��9z���N��y|X٫EK�c�Q�:��I=���p���z�̺9��5�\�D`h�jii,�|S��1O�Ĩ�T����M�i�3$jffZ36�=��Տ�|��f��ޞ����V�ͦ�6a�8�6���K[��/���r7��
0�N��Q���B�띭lO�č��ɧ.fQͮ�:��C�&f���N7�H���Oܨ;�|��:�,^T�W�Mw2��&g�ڪ'|����1З݈����l�:��|H�i���V-'|�!�j"���V�����78oҁi��ؕ-�Ĩr���^���r����:�pX�b}5o/�j+��=�?F���@�_��Q�<u�bce6?�h��V9ᣉ�Vʃ�I�X�eEt�:�ZМc�i.�a�'|�a�j��1��VB>�a���״��dw(ȥ�p���脢��sm�4H����
"������wX�	�x�D?��콫dBPݼ7[�(O-�d��lUs��N5�].DH"Fb��Z�R��>^q�����ލ�^RI}���3�T;�ޛ�}�~����F|��>��e|�0%�u�'�S�Y�dOx��!82�-����ǖ�+�uS��4�c��{R<���u���V<�3^�\C~2��jz�g�;����,�@��	_nӜ�Du��X&.cG�.v��X:�7�[�@�b3��t�Ǩ�,;����p5��w�N��G�a����؟L��
�q*�'mΆ������;��u�-����-Ϩ�o>�7�`bz]ōj\<�GoJ��(������k��������륆5.����(�5b+8��FՇ�`���l.m���p�\�
�'ڨu��r��ӌ��t��x�>� �+�委��a�As��浨��uW�~���F�c��V�dx=Nb�u�y8����ڥ�p���O��V]�֦=�ԗ�[���W��Z`����	�����9��չ</m�v�6�1N,�Kn_�J'|ߡxy̍�\s�J�n�b�T3�N:���V�R%.�D�#����@�k�i�؇����	�sRnz���Dcd|�R��Jߣ��d�r����/?\ʹm�R�9�i*��8z�6���:_�/kN����kĕ�Q���
o��Y4U�����M}���`�t�H�;?g��ݡ3K��\�3/m���ң]`.:tDW��m��G�>lS۸�����?��G�ٌzGnEJ�귮�1ɿż[�����O��j�x�s(�����t�w/��M�������V8�ۃ�ϋTm�V��k[���<�zwg���x��Vs��%��L�e,"Q���C��d.8~u���	�3�n�b48��@�d���݆�k���:����'|�ҩ�b�S����?��N��M44�~������ogIhH�,����.#kx�Xa۠�=��ݤ>ܦ����Cvj�������g{�C.�n����-�X7���F�E)5������4�Gk�[��$U�ԆJ��6�&|&��\N9/w��O���	s$��j�&��U��pC��DU�&��n�V����j��J�ìk@�O-�8om�>�Q��R���^���󵣓Z=)�\����N��1sj�魎�x\�ea�mwn(N�@:���1������T�DP��lt~� IZ{����c�+��9�kq���:��k�Z
�9#bnm��<����u�����?w�iʩ��D�o��lW�M)x�'	�c�S���d�NV�K[�o=v0>�ZV���@Țj�d����2�t����F!�h��jS�wu�GU	|V�SM�ݕ��N���es�C5PL#��u�;��g,��Hi�_=����Y�G�o~���I��t%�ټU�*a��~������,��nrCnA�ta|�8��#��0����2�N��e5�	�1U<B�1�J�A��v�8Ti����O��ϫ�D�/��A��T>Du��1���ݜ�4��'|����e6��V�N�.��kc;��[����	�:�ևL�	��3|d:�mRf���V�'|8�̦Y�*��!�K�����h	�`������>9%k��Ǭ�=�ӌKL�6
�M�Ʃ]����O��X��'3w��)�M�Ώ���~�MV����	�8���g\��p��sc�̻�B�º�)��Q_��U&���B���S�:���
̆��w�7l��x�х�X�bMR�����N�*���*'||�fu]jb3ƀ���)bl�~��h��5w�?���t^[�¶�ZjreXm5��")���.m��}� �c�A�'���{����)��G�������=���� �Q$��f������6�Wb�;.j�;^g-��F�~M�n���dF/���m�o��W�R�	�}�T���Jk���������ф�勿���F=|�6����)s���B�)�Bpp���-w�'F�jU����擓#�0�[M�	���N��y��V?���G����E�t�j�AͰ�	���B���Z��֬��>������;>�������)���;�-C����<��a��Lh��xi���]�q}�=G�����~
}�.(H*	���$�;[��3F��z\������Ҍ��孪��b/u�{�پ��_F8ֵt�MP�6,4:�N    �q��1L���%�'|�T2��vP�&�6� ߵ����5�����r��,����%��w�Yp~Hw8=$]!ܽÜ�	�2�,�k>�1u/�"�xWQ�h{D+]�H۷ϒ=�,-҉��-�ڶʌ����;��Qo�v�+]u�/�F#�E����c�##�E�}e�]�����6]2��	�ŔNG;y0�tdB�V��Җ=�[CbHx���`U��԰ښ���aZ�Җ;�������Zv�s,�әUE+�eW-��K[��o�^Ŧ4kh�tX�����7vJI�Wm�>W8�ۏ��t���1,N�t$�t�g%먑��]ڊ'|r�o!M�{�v�=�t.$h�Qa8Z/]�Y2���{�>�Ru�k�?��k�`�1��@<�{ݝAx�?�y.�u�M��9$����Ig>uN�A��F?�XL�6"�gQ���[k�ϙ����� ����nP'|r�NT��j�3�N�B�B���}���	�\�u��ں��R8Z+{�9�|�����N�h=���¯<$&2�2oha��f-��ӥ�x��U=#M��>Dct7d�с�}i+���e*o`l���N-a}���[:ma��	�5X���5��f�^�T�1�&������V9�~H�O��,t3A߻�U��KK�s�x]�Oq��;��/��pX�@M�(�Xv yr�%���������o�o��=>�z��%+����y2�z��g���o��ޡvr���y&5;��kY�0�K�!�a����wu��lN����hMb�+)��+n�a��<"�����~���;@?��9�`0Q����Rt��<�錽ZV���Uܯo�>���<I^0�<ͧIL_䑀�1ձ�I�p �����4��������������Ʉ�8�&�z|�̏tg�6�~i˞���ԋ�b��b]]�?�0�Y��_w�~���Z�R6��>��QD�ppmX�T;�����3���_��2�����X���.�'A�����i~�m��BT����u���.������q$sw�+'|u���GC6��Vݺ7�l�F����{wh�'|�<��J~�fGw;����Mi�שMul�������=�Pt��KK�,�[�n�b��~V��
��;@�ӟ��u�-��q}r�*��5�z��ڷ�+�/OO�/|y/�\�}97s��V>�t�3�j��vy���߳f7O�]�M���	w�$M��鎢�՝&�N��aB:�,m�²:�� Z�%���8���}7�_2'|�:,7#�dF�Oӂ2�Jm�B(�"K��+�C��{+f�kq!��N~7�	Pѥ�a�]��l�	�{�_tT��L�ݓ��43fM��5.�|z�|�7�u�Ꚏ��ɧQ��df�L]�����S��m���_.}O���LO��4$�tM֎EuZ��'��}�B:��:��5J TA	R�6�.��/5 /=���>���Q*Q&��?�?�Sj��Q0�o���ys���o<4�d�u�C��^󸞪y ���r�W=���'|{�~�̭�A�1pt������ۅy7d ��|�ۢ��ʖ��E�WI[^���+T��N����O��b�V�0��co]m�i���uq6���w��?�{�F_>���/����kH�i3�i;S!�٪��o�^�2�etb~J��\��G��'��z�����<��f�n�� 1��O-�w��Լ����9s� ]�qhs+4�W��٩S1��=���D��U�7	���B"����;V��M�5�m�_��!��/C`b�����[��@��'��op����oI��T!Co;z`�T�	��-
�����l=�R�y�i�
B*w�E��,g��a��ũ���֯>�>1�8?t?�^mY��>s�4u S�q��-]�r������Q����4�Z0�|�KU�)f���@͝�bO���,]7�d�5�V�JI$
:����ݕ��Ĩ|�+w�O�O_�6�Kv�Z��T��s���V�������t�ٚ�� ��L��s4;_�o��������z�e�1�7�[�k庻5����Z�,�_���W�����I�AӲ�r����t����߽K_��WX�a�Bz}0!�Q�!��]�Ѯ��w��|{��슺!��W?t�t�S$$�N.�]�
�Q��'|��XЪ�>-=t��Ns\U|G+��\Ũ�����o��@
����j�Ŏ�2B��-��Wq#d�N��fi��׀�^'n*�<�G�\>�|7~h�q���N	6���.�,U�*�@���\E=m�v����||cC���Do��hX��6��nV#��9�=�����o����ʵ���iY[���Su��\}��_�(�ş�ٯ�꺽���_�*�-A�]1�kg\�����?�0��]���s�:��i�hVa6@|㝭`�	޻̪N�V�b��z�6�켙�͚]ꝭRN��/�#�]���RS@�6�)�"ґ�R�U�z�B��o-V%�x�d�%��"u�g�.�B;�uw�M��%'|�S)�v��F$�ߚ��2�@������)�8������/�z�ڏ3�C_jI����g��)'|��p�-X��
$_�7#b��	��:�߰��2�'�fT?<��;@�ۧ&�h��|e뉽_��bz�╶��t���QҶ�Y���»�oز)���S���9�Vk8��&�C�`a����?�·�V�Kտ�^ѕ�hGʖb՚5X�CT������	�Y���]D�h�*1��R��_Ř�|��g֪�k�K�f�)y�t5ʰ:�;���������:��;Au�E'�>�@�\$Bڽ��f����O���mx�G��T��tqں��ݗ�\oz�g�j=�_Z�o�{�)N��t/�h�1����1pu�����ɕ%F��RS�!P����U�pR�p+q������>~��6[mؼ1���DŢ�n˲=C���c��J���-[z���P?��C45Ȍ/��0�UoWwe�·g��#�'p'%~�[h�O�W]�s������/|9v-*i���1[]��?,��ی+��|J�/�QфE���ҧai�#�{w�� ����[O��gM zn�*OQ�#���i�U�Xgt�������>|��)��H�pO�,��>-��ՠ��M��QN��'|�u�]���'��O^Y�l�͠�h��5sg�����tu�*���k�F�|�`{-��:#S|\���;��ߞi<#In��4�t Amg�	m�e�����O��;$b�Nj\�t���o��R���V���_o�?��c�O ��N5��ȳ���g�Nn�5FOW>��'|k* l::l$7��F�����$5�"a�F�*W�����_}��&l_��qzU���u�NVu��^i�c��z]��c�n��궢.���ѡ�K�W���޳��)M�/Gj��lfYr�C\�K�` W}�]�6��m�<3�(W���@�o���r�x��5W�D����ON���L���F���"HׂH*�ü�־���ߞ����b��ͫ�-2L����!�\��o����LC�6�k# ꄃ�8�����7eޭ���	�,�����[�vg^�$�OmY����;[9��_��t���t�Y�a[-�j�v]�������G}�.�;�M��Y]��s:Artb-��+ZϹ���	��jh���̈́.$�>��8Q�c`~��zNW�R}xN��W4��.��E�E��J�pN��La��~�\�����6*�19�\��6D�w��WםB�=��V���]Z��+�%��Yn.m�@{$��c�[�������]���2}}!-�mԡ���J6)�U!a��9��r�'|�݌�nгCW#:m(��S�Z��V��\�*�o-��2LZ��K�@�I|�2�Bϊ�0]ي֜�]�q:�3[:�P�����*fs*<_9q�5�x·��>�}�a�H����R9�u�y�/m������0St2��w��g*,��Ӆ���{�W�US�'|�P���w2p鄋�m~�^�ژ*��|\q�Zl=�{�f�h���͖ԋ���}�
�8�����V�'|86��lf5�J��:�&䪳i�ǫ�R�� �  ���w�r"O���[�z;k3Ūga��j��x�O���):�nw+C;l�t��	0F�v�h-��;[1��� ��+#t��W�!,�Ȭ���|��5ol'|lg[�[2�wO����pq��KL�r�����o?x�##�1�(�k��R�E�1C��Λ�l���;`��)K�����hF��[�-�@k��Jk��7��Άj �z������{���ZȦ�z��&1����K/�kWu������nL��L���X3���=�����6uS+�D�zȻVW�/��Y�Lu���s�'||Ce˒=��yw�G��,�G��T���K��J��[�>m���;*r"�u kFzU���(ȍ��W���o^vFXCw7��Ｚ��N]��tލ)a�b������uuX"%��ct6XӌbI�:���_2��o�S����<��7�}n�Ԋ�,v�-��w��w����GN�f�j��������4���aB�f�\����u&Kw��u�����v"[��d�s'��+[�{�����$�')��A�����ں����
��l%�	�{�BA��etXU��H�h�������?���D?�����G�9Q5J�uS�]�5-U�|g+�t��'����Rxљ��r]7��]F�)��ɕ��	����V<IrPt!Q3Z�����H��O)Ew�w����9�3���_+�:b�Z��*Q���sտ;��832�$���������f7u��x��;�ŗg+&���(��P���8�VH�(�|�����໎i�:cH"^>N�-t5�Ee�.�ra+���[�P��
�aI��޺Uu���9L�!��*��ZJA���o!_���cѥ���wu�]u�e�l��·�3�P��0D
�����"��X����|�9�Q��n ���I��ѥ[՚�{�#Y�\�}�t���'���z I�D MŌ�3��6���	O{�?����NKغyw��w���;s���*�R�7������wMo.�X�m�@��=0>�%i������7���m�	ߺʜ V�C勂R�c�t��z����
�?�,F]��~�K��3Nj�1�6�t?Al��V�'|8��ib�Z�I'�{P�X����񟏹��|8��#hi���C��,ݲ��lu Y�K�5�2�=�+{��� �1����T>ԱB��tU���k�q�/|b�&�C������ƍ�.H��i�}���̩�O��!�Ϛ*�*З�+��a*I5�E�]�7��	��)_��}�J`r޹�ct13Rh���_��/̫�rϚ�>�H1�ɼt[E���O��V��V���lE�O�̯57�dN�T��d)I7T3��p��u���V'|��j#�R[{�:Qm���Ks邼}sϣ��\N���)�l	�v��d�RH���<�t��j�*A۟8�O]��擿��9W���x�2Tk���z]!_��T�O��e�����S�Q?_5*_����.���P+�'|�(�4_Y��b��[�m��q
K�~���
?��og0}�O�W�ñiaG�t8�#$�_)1��k�8K�^�0-OT��K��p;��y5@�����'|��8TFOL�1��(a��χ@�oݕ����?����teR�ԙQ�v���ݝ��A�>\�r���#�Z�E,;B�D�8[γ��a4��k�;>�;�{.������:ӧ�S�"��<�]��V�:[����������������o�R      \      xڋ���� � �      ]      xڋ���� � �      ^   �   xڕ��
�@E�ٯ�Ff&��li:	��H���4���b:�T���2W�B�Ն��+���r�ђe��K>Θ�3��&����_Oi��� ����� 	w���`'�;Ǥ�t�.�Ԗs����4�p{�?��g��Lgc��<�      �   �   x��91E��.F���`N�&�	�/Ȱ���DE��U�����Ub=PK�}������g�f�!�Ȥ2�t	��O��L���/��n�f� �.���v�����2̙�+�j�ۗ��Iw�IQ�,������o��
��ɗ���)�<      _   �   xڭPK
�@]�����'f��J�~Vn���E����VED.L!	��1�"_�\
V�\ZK�Fd��|��b�8 9��.���	�8�yɹ�d6ũo}���͡>�����G$,S�X�ϑ
��4a'a�x�LK��P�g�½3�c�U�iG���{�d~�S����f�v�',2�ps4YH��<�f��؛h7���
�Mk�      `   �   xڍO1�0��W�W���s��������IE[��H�'K�N�;��Y�:�J!(H�kt��sgh!�x� �^������q8��#�nix�|DӞ
���m��׀��6�]zt+�ꠍe�m�.U���i�q����[N;c�"��=hr��L�m+k��w^�      a   K   x�]ʱ� �:�B߇���A�����1�U��ţZ�4��8q[�(��[2�p7�_���Ŋ)�Ec{t�D� �"r      �   *  xڽ�K�ݸ���^���^2�s�K@�)�ղp�S��3i�5�@��v�KuAKv@�� F�`ڑj0��k����t����*�q�vmhv�N�������'���L�ò��b:�r��k�qa�C�&�LMT�JP�3PV�X��4�Fs��>CN��{=�yT��V1JXp"�O��X!��d-4ic����?��ck�66z"N��%�-��}�ئ�%Z���K�_�V�x�q��J��jpQ	kA������j�LZL�:X#�'����~#�|�4�Uw�i
7i��7�Hob�7�����L�5OV�߰|L4�#-T���� ���cu���Zϱ��x\���8`�@4�A	K"���R�=�%%,���	�����%���$�'���PK���wD2i�O�58���Scؤ>��d�!,�X�{�:X�͇�|f�՝��$�:,�[u4�k{��-��i�`X�[Ʃ�%�	��]:X2�"�Z�"%/%kIT>gJz/�;��3��Ǉ|�[��D�u��%�-ª��f��ȷ�S�O�=Qf-�n�L<(���%qy���.��s,t��Z�W�a�A1i孢�f��$.OX�P�T��:X"�'���Vױ�,:���"t�D�)(a)繜b'���n���'����8��$�EX9+(���D�5ap�S��ZD�@LJ_�N��`�b��M��
�P Ȥ��D2����D�X2�J;�� l��������f��??�~㊔(�}^�Ϲ\ =*\�����u����7ѼMB���?�����qQNV�����^z���e>_2�w�Q��k�*c���n�>]G_�'������2� �q.��kB�-���o��ĕY�����S{a�ʧ5X^�*��U�2^B��/�j��l1�[{���j_ۛ4�ڏ���`KS2��kB2,��t-.�#Hp�{�/����ǂ-jqeX�%�Xs�E�s�s�^�}|�%ѯ�`������Di<s��ܛ�����]g�{�	1�Lq��H��1W�%��Q���Q!��:�W��^�� �>��5����U��V�E�����u����5:�%K�鞫� γ۫j�.r���vs�~"5u�1��Ik;��.=ӽN�
�7����:�ָ�Gw����f���h�#e�3�Ep�#�F��L-.��*����:��7���:<*�_�U��7�}[מ����ӎ��9�"M���w��(D�|W,*a=ԗ.� #G�_8�ES ok%�xh-����^���^�L�α�S6��5(���TOJX"��;��6x%,�"zG�3c��X�#P�YRMg�HX1����J�?�y�ɣ�`=�T��?�����}f"6}?|}��ǥ,��J�O,�/O1��`=Uz�L<PLÃ�A� ���y�����������$r��u�ۊ+N	K"���{�jZSK����2h�����|�$c�u��E���1a9t��j�HY	K��J�w��Ģ�%�|�s`�|��c-�@t��ٹn�
�O#Hqڡou(W}�X%,�oQ��w���̷8���SS��D壃2/��c�h!�1=��n�w�k��ķ���f�Z��ȷ+�g�J֒�a��S�/%,��n����r.�_=W [k�y"a�p5�9%,��Wp�uk}A�DX2��WS�*X�蔰p�~-,QtJOL��ԣ="r\O�5ݙ����A]C	K�[�ĉ���1��$��X�N.���D +��:��%�B�YuBT��	a�2λ��X"����6���G��C�c���u/�5�����_�J�8�b�0��u�X�z��>���3�6r���x�m��Ǖ��-{��HIX��p�����t{�S���^=���Bg_��\3!��>����{�s}j/J��lŉ��7���{M��׽y�L�k��,�����{�&x��ʈ]��7o�4-,�7�WW ��z�ͻ��_^��z�>���圕����Q�K�s@�_���z�>xz��Lk�xл���1�co���IG�.I��N���ԛwq%��$�:�x��ЛwqU}�a��So��5`eN�C��z���:m
�{R�E�ZǇ޼��Sh���ڵ��7���`w�;}��z�ͻ�*=w�\�Z\Ͻy.��W�����&�\�(��B=��m�	��i��l��ج}�C���SfQ�z�/9��p��2��9V���+��ҡ����{\�X�e/��{�Jm�����%${f-���;����ķ�Ty����h#mR���kQ�c��g��"�n-�i#6%����
�u�d-AI�f�0'�����&�S8g��ʻ�����>1��һ��7[N�����w������]��>�ܵ�u����3�P	K"�ܼ�쥆��%�Sn���U�d.OX�sO�oCK��~�>+^�A�O|=_e����®ʎҔ�$�a��<���K��V�|hP�Z"���l�Jǹ����z:���ȍ�o�K�[|�y���d�� -.�uӕ�%Qy�rzI��{n��ds?��)��[�Y	K�[��G��D㔬%��p{D�F(��D����יQ	K���\�\s8ߪ�k�e�1��ֲ\��+aI\>U��&8����	k�'��UK�V�\\_� DX��4[��א���2� W<1�v��5v��X��%ѭ���q)�)aIt��b���*aI��0�qTG%�	D�&�m�XT�d�-@|�Y��f�H p�"���W���o=J������s�����5�f�]j6_������ᘫs/P�xܛ�7��z�\*,����|n�B��3�樷�f
י"������u,b�ߗ��{Qd��v����fB������u����H�R���QO{�kB�Ԃu����H~����^3��7�Fz��p��q=��9�B��]��z�ͣ�c�}\?큓rI�vt���VԸ$:Q�Gi��Ꚕ�z���so��ix)�=�͓qIz��Ǔ��&��Ӟ���y�� �������{��_Z��B�7\��<����q˲S�KЛG?��/G4Z��ܛG?��e��k���7ϥn���>�5�z��#.�p�7�����Ͽ���_5�,�      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �     xڥ�Kn�0б�*�`�^:�/�_B�KR�c+R&F��-��NX�t4�°h�&(d�=C��񈡩���0�D	�#e����Pe�� =|L�Q$>!��t1F�
欱��!;����qVǛ�V��@��U��))z��f�s��B��\���ߌ�徴���Eg$�X�QV�{�1��B�J��֝m��L!���	����L;�����?L�. J�/�H�n�0�
p����X�}M�=
��.��bW����8�?��&      �   	  xڵ��N1E뙯�%N�$%���r�1hŲ�"�+�]�4�,����h]��Hg��(HzMPu!���i��EHf���蹾|����ou:<Lڡ�&�w_׫�Ƅ(��4�;�/7�}�S����*�.s?��R����P	�"{;F�k�9�K?����!��1WJ�O|,�]z����S� g��x3�Wd�M�xx��ڃ�-*���F��E�*�d�0�{��E� 
(��B$gQ��C�������F���<�ѥ�      �   x  x�ŖKO�0�������G���q�Q418��qBk�vY��U�Vv��v�h]�A !9H%�q �� ;�t4i���j�&+��ǩ�K}���_o��j�x��:�KEf�C�*���Q+����{r�{���cs��;aw�	E�xBㅌ�M���6c�:��37f-@��'����w3TcD#��+�-*�WR`ѨePOd�YPIlP�1��d�2s������K��#���ܚ*��j�'�x
� ��#.�|>�>A�8Nl���$����z^�΍�Q5Mt��ct����$Vv��j��d_b�f� ��eY�%�Bcn�GO�`�>�ʢ�ƭŚ\���A�N��^��|�cJ�#�o��m�u��`X�      b     xڽ�Ms�0���Wp�&#�%��Ɛ���C�L/������S�}%��8%��1�]�y���w�$p|��x����u�O�7��A��"O�0ޮ�Ny$׻�)C��1�hR>_���;���0���6���q['Jxq���h�n��Y�{~�q������u���ؚ�[x���GgdcK;Z�6`�M�=gL���O���S ��[��_��96����B	 cq^��'-)�Hw�\MF���*2�QlHF4��� Q"��s,�f�t�7���a�LI �]�ZM��-��h�PԐ ���ָ�C�/�)O� ��vy�N1Vy�l���WZ0^k�
�ؤKB14z PS=�������<]��W(ˑ�(�!%ה+y�̏��o�=����x�`�NU�MK���kW9xO9�D�clj�h\�|lƮ��jJ�II�Ly)�0	�j-Ӯ÷8@m�E�۞!
�(��L�jh�T� )V��#��W�c&�I��
��y7�a�I��Da�5�a���n�+�Hr5q��Ҫ�9��g�©;)����y�"���(���P�Oj�`�8��sҪ~�ط�ȵ� ��V�jw��қ1���H˛lj:��l��i�GK�3⬷�nu�t�E���L�F��?�!�:      �   c   x�]JI
�0<��d�����g/����� �,�Y�n���5��>d�Ѹ��$��ޓ&��.l-��$�L�m򂄶�ҧ�Ũ�}N���'=R�ι�#]      �   ;  xڥ��m�0�s��DIKt�\DY��*m�$u|hh������e�Q����@��0 ՚�Ra?ѽ�D�,J�>1R 9��%�*�2�.����W�B��1�M#
�)+��?���W7HR
�Q�7.�,��T�����
��Xn�{z����D��л������n���^hkE�)6`���"��������
���D�8�`�+�p>স��9���vz�Q�{
AWX��1��a��<K��酢v�k��G��b9P�'E>P42'�Y"
�)�t6p�|#�b���i���(����yY�O�M��      c   x   xڕ˱�0E���#;m�3v�ԉ�Kc;#,�����[�t.sh6o�:�aU�b��6�Ț��d�ز0�P��	Lf���	\2�0�/u)�9��v���O�.��y^n��]Z/)�7K�4�      d      xڋ���� � �      e      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      f   �  xڭֽn�0 ��yDJ����\�:uя���P*��s��8 XD�$�*�e@M��� �>`��%��Bu��E~�O��z��E�pA��E}`$�}攖��w�n߹�;���@�;(���@��c#0l� ���;;�$҇�d�^�����֢Ef�*22*H�Gm���g0:��;Φ��Sb(Bc��D��)&����r]UP�X���.���@0�"��E"&�4
���V$��'�l��o8OAc �~�{E��j��F7��ܑ�Xad�ٹ��f_p�_m���pG`J���6.���.q�����(fC�� �-���	�L�����r5�h){A�Vf�F��3t�v���Ҭ��v-�H:Ei.Vb2^�Q�G� ����c1	�  �6�����($�.9g'W�E�z�,��x\PAߨ��YJ�+��U����sZ��-w�����0�|�9�N�9�      g   \   x�]�1
�0 ��/�$�i�;��.�i'G��� (Gԕ�h)I��A'�1�rs�N,��ڬ�i飞��hf�!KJ���z�[�L���<�      h      xڋ���� � �      i      xڋ���� � �      j      xڋ���� � �      k      xڋ���� � �      �      xڋ���� � �      l      xڋ���� � �      m      xڋ���� � �      �      xڋ���� � �      n   �   x�}��
�0�s�{�H�n1}A��.�ڂ d;�흢�!ʟK��!��
D)I3��R S�PcM��л�B��!hjt]:�+�NCơ�Nծ��S��a4M{x�aU|�]�R���ŭ�{�a���V��E��	�Q~�����	m���� �RJ'      o      xڋ���� � �      p      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �   �   x�m��
�0F盧��7?�ɨ�T�E�.i�b�thU��kQT8�w8|D�k���m�M@r`�)q�h���i&�u��'�"\���m����y��XO��v��ecs��i��y���p,��pP�����'�4�0���j-�x ��8�      r   �   x��1�0E��\��v'�C�tI�T0Ѝ���PQ�V��H���#*�%ΐ<&(��NS�B�D��'E��� pF�{���y9��%�����Tu���ċ����p�-�5ö��.D����~/��ȣ~�4������������iN�}�X��ǣ�����      s      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      t      xڋ���� � �      u   �   x�퐱j�0�g�)�g��%��t�(�n]�ȶLC�d��G����RZ�9�I�ӯ��9�va��L
=E\00,�S<i�$��`e=��\R���T>���J� 
R���8���w��~�X�ݽ��Y6ۏd9���k�&9oR��$�_T$�������o
^7l��y���߳r��\'c����F?�<[��ϧ�&Œ!���۪(�����      �   �  x�ŗMO�@��ɯȑ��w��cQ������ٯbA�*uh��;(%I}�V�eY��ѳ��;k΃9F��:��10���Q2ɵ����9h�h���G��K߹uf�q���#ث��D�6c�h��B�|�?�W����L�ߞn�}��ePD�a�,��u���޴��{2���[8(�h�p��K ��%�~���89`&�4��p.�w�s9:۩�;��AS6mC��*���`��0G�ϰ��cX%��?V??��WS��5�9u&h�b=��hW-�����a
�]hE$�Y-Q�Lz6��0JR��E;"B%E0ޤ{ƫ0/��O�Ǔ��'҆��V�qz�T�<k�����e-`�3�؅q��%�"g�0��S���P��.m�lR��������o��e��۠?�3�@�Am�>��������sY������d��rN�Ҍ��'���}�wՀ��j]-W�zgˇ�㯔�zڟ6����%�j�3�7B�2e��5��X����\�&_z�d���4�A����aQm7��7���l�O���6�\��7*;?�k�t2	��^eܧ�
ױ��r��5&YP���8zGOG��6D���)Mq���V�r�Mu�?9(����8o��&�� ��.�z_�HK#c�ũ-��������hV<      �   l  x���;O�0 �9���"���1�.��@�
-��q��(b��H�E�t�s�.wA��K������<��L��6�� ^ (����i�|����%�y�,a��ܾV�A���)���3��B��k�쎁�Ozd8h�Z�JG�����4�	`��!9EU����o��u���c6�u�� E�К\'	��%x5��q�B��DH�4~]��ƀ��н0��@���@RW�L莥������l���پֻ1̊_�)	��������e
��n^���l̻Y�F0\�"�H3�h�\!"��j���&���J�~�$�M����̮�nFVG!������J�,M�O3K9      v   �   x�ݐA
� E�z�^`ʟ1�L�d�����Bi"�t[�(|�|�M%+���~쁩��U��坊$&���
K0B6PI-M;�����[����e۫M�~���;pV���x�;	�h=��gc���֌n���G��gK�ϖ����z�޿ 8���      w   �   xڍ���0���)�(�����Nn�!M�ɱ��1��������QV��`�d�L�D���{C�#�,�	A���.��~�����1ͧ�gm�6���p.���Ņ�ߝ�������A�V_z/�J}�DK5�Oi}8��r�L������Km�����YB�      x      xڋ���� � �      �      xڋ���� � �      y      xڋ���� � �      z      xڋ���� � �      {      xڋ���� � �      |   4  xڭ�Ko�6�����)h,H���c�M��Aj�n{Hz ��-D��F��3��ʯu��Z,�H,��H�Aǉ)����F��j[X
�H�d�����Nu��B�'�����\O�飫�����\�}~�m� ��U�2�%�pݏ[��������\iF�a�?[��߷���Zh@3%qV0i ����ǟgՉ�G����TS����8��9s�j�/`�Y,�"MpN�r0���h�i����CWW��[�P^` �� ��\V�׵�rZ`4+�����B�hǕ�8��bp�珖�?'���4���<� �ht��)F���p`�\#�+�L3��R� ���uMSCյ���@F�l�S�?�@��.:_-8��	`�5R�5%�"����S?,!q��0��(�i�GTBN�v�w��jƘS�Y�A��I�IPRM��T��X�\�9�8@OSF���ãNBS�
6Vz&7,�b�!���Mt
-��8D絙��Y�g�ck����%���"���l��M}��iG��F9Mˊڄ|�J��h�iq�'��0���A�8c�)�ص���M��c���I�ю d������5y��U���t�7���"�>_>�f.i�d�`�\/я�S;�}�`r�!W�*V0�����f�9�?h��,���Ln�o51�irvS�Et9m�]���Go� *-:��J@f���j�Y|�A;�W�E���g��Nȗ���4��� sɑ�:`�Ex���e��2��>w��T,�2<��EŐ�E�Ɋ ���`�/em=�9E�rWC�����S9Y����ȒJ�Xc�3X����i�SS����z�����<2&�t�mNd{d�*[�#}P�����f�t��l�����ޯ��1h�B��3Oh�웑��y���v:��bi���eYx�ę޳l���� �`��mER e���ˀ�s�˩i�F��Ԏ�z��Ć��c��K'��]���;wE<���kǾ�S��0dS�@��8���h�;xܮQ����|����},/�G����4��)ˀ�<�ɿ&7ニ��?�������w�=Q�      }   �   x�u�AC!��.4��x���o@��G�����	�d�������@F�`�9,�b5WT�~ ��A'�	b�P��i�z�B%�G�#��Y�!��i�,6T$NP�m����u2�^���թ�m��h�z��ϔ��L)�[�U�      �      xڋ���� � �      �   �   x�Ő�� ���{���A�{�%��e�����Mf'/6H[����`x���<�b�lA�ȓEK�̊�C6�V$	a��7� 4��-�s��s�)�"�n�;�U��/��-��xE�LNBq��Y��"gPZaoK]Wۛ�c�"6��!0���
 �? ��� Ɠ��	��s5      �      xڋ���� � �      �      xڵ�َ]9����K4�Ҭ���s�@@��\1TV�ӷ�m;�N;�)�D:a쏋�(J���Ʉ2�����J#��q�P���d�?�W�
�W���ۿ��������Ç����8�9��!������?����B}>��' }y����ގ.���{�6�������OMu}j+	��~�,�f��|4-��Syz���Q��ҏ�z��|��u�~-	�҅�FC=|TX�xs+��5��U���L�V����&���8֯����Ǉ�[࣍]���δ?�?�?�Ǜ�~��>��r;dRx�ڮt���������������'�a!�oN'���M������)����x,���2vZ���95]F�ˡ�UʖyO��n�ɘ�ˁ;2v�O�`Đۮ��_�|s7��C���ewRx���t`�?=�9��PPd�����P|d&�v3���=H�c��G�4{���l����<�"
B�f �%�Z�@��f蛴 �{�இM�/��O)"��q��e<=C�ǆI�or86���1`��I4�#e��W��~7L�aȻ�&�[`ԫ��~�̪�.���s�u�|�7�F������
�-�Bn���_�?><��W��ݑ��V9�B(��I9�2(��4��agX��ȷލ���Nݱ�R��)����z8X�F���G�%#n��I�y(���v|��S��[�4�gT���}�~~ ܥ�'V��^���'E�:��r\M��;�S�ft��nP���,����R��\���5?���4���|�0T慅@�8�Vx��\=8 K�/��ˡ}��Į砆��<>ߍ{Yt�ͱ#y��ɨݐ7Q��Bj�����Lƥ���踴��Rn1�=iݩ�b�{�Ze}V��~��dߴ+� �\s�Ѕ�b|�D��lh�tj��7�-n�9��� T��v-U���G��Rx�43!��,tI�z�eP��H#D��eX:۬G�|G}�/U|���/�B��G
\р��2�JQ�dd��3����`p���o6];���(�B�R��Еb둣^� �ќ�k���}�mk�Z6X���o��ks�AM�37�G�t�61v�Љ,�^Ȝ�e"�s�Th�'mR�0V�D���"��:o�הiq��q�U���������}}s��"D[��HP��ٲ�q</��4ǣ�=iw�c38�O�6t���Ӌ�SG�z�h�2�=�+�����x}�O!�B�4����#M0�K� ne�D���=p'��v�n�����M�:�Fn��r���.]��%�b<���P�*�L���Z�
?SqJo
�����Q�j =�/]���X.�d�
��a&z�e!�5�"d<����ʁBi�x�h��埞_*gǓo��
���K�i.t��YF����4Ti��*?��U�+6dZ���v�_��-��y�l�R��n��)_a�O�7��^`��^�d��i�M�/f�tϟ�	���e�� ����H!�K��)����kb����=�#�%SLiz�=�%���5���J�5�׫_B!s0�R:L���&�8A�c����t��6v�dˮ��o�����E"!:<�s��<��.����W�+���p��rwWe�j�cR�ZJ!>�$.E����d��AOF-��Ϳ�,�fʼR:��pZ����ԐN��&{�%������g<�R��6>�s��0TȠ@�"����p}��A����ll���PӁ���~6��&{����H:o.6X���mH�v#�h����x"}в�I��hgǳ�R^�v��0���M�~.��䈉���n�V��d��|��%naB69�#�{��2z����@?���n��L J�s����&$q�Z͗����+�C(�!9}�1�V��B�+~�& =
�G��u{yz~��n�/w��%u��g�%t&���X���Bz��3�sl��#Q"�
���<�Hs����4
����S����Ipz>��{�B(��y�m�����������+��t[����l�鬛e��E����fa�n#;J���=@��ȮqRZ�,�D��孀+��#$*�7�o$� ��W��[H&J����{s(�r���� �d* /��B�@r%��˦q�rr������3xbC�B*�F���f��o4d�F�r�sdp65岃�v���siصB���R�L�o��Y8h���`�	Q��bWk���*F&�Պ�g~9�qN=w���|Ri�	e+�M�2���w�e�օlzV�*r ���r{3o~cZ��EkIM����hWw��&���M];7����zN�ƃ�������G|�<���� �KxB�48����Kڢ:�˃7}�N����+���4�&�:�/�x�0q��_h���k1�Z�|%��i���:=����{���xz��|��� ���kcƶQ d�<�ڡ\�hAĮ�?Q�M�/�Sf9v���ۛ63���u4V�z�j��g��}^��q�N��7����%SK�]����v����QE����|O�؜w������P�d�xr�<��ۅl����y���-V��&�q!yZ��2_=٬�����p�(5y7
�S�I�F}=�L�'�ƑyM5>�kv��:�+Ǵ[4��e�e��˸��2��㻅d��R��n����������Lژc_��E�`ߵ��b��(����\;�(u� ��k��l��M ��F�lm��5��3dǱo  !<��i�9
�L�m����d:��xA+��H{���.�\9�CM�{?����>z���S�G=_���He���^��?��v  �9cjq�@z�X���[у�e��z�g��FΎ����r�1;(�%�طуŒK yr�F��r?NT���T�.��AA��OzڔөP.0_��U[�X�o�������%E�B -
it՗ʐ��m$xz<U�Թ��sr>����{���(�PN{�`��y�6M�����op.S��v��9���p�/sG����R�L�nm�mQ��g,P%���KW�Jn-�"����"���S��ydt�jr4���uT�TO�|��󬃮İs��E��6�	��oǇr{=�o�AuS5�Z졅�l���VK����$}S	g����tPō�Zߐg:��FrY:�@ǆ��&h��:�Z�T:�.��@Nᆫ�S��^�V�52��G�*̜Z�`��O���랂��\��d��u�+q��Z��`��]� �<�!��ݥ ��2F�Pj������l���	���&@���Xn����t��ԩ^I��t,�oj�W�W}*b��
om�P.UYy�-ןno��)�P��� �2��]�����3�a6������3��68��� �;C�:%!���>��ޔ="�mp҅f����KmpR���?��:z0��~?�#6ȱ��N<�EuR��2ʔ[Y��{F� _J'ՓH3T�b;�4�<T<����$v^P���g7;�U�(�hۤ�U�(��D�U��2��� +7b�n��IR/�2�������l������Jf]l�\(.�s�����U�ʑv����p��\A�U��a�C��pup��9�VI��Hb�
XB�*��(�����wXdֹĠ7o	{{�s1�f��+i`a«*�/�$�)I.�2�VI�fʯ��f��͔����鰈͔�ȭ`�n1�@��bt��ݸ�܅��HV��="�����O�=|�E�ӹ�ᣩ�G@l������Gl��}r���\N��?<>�|¬�ۦԡ���r�k��ߐ�G�	la���Ŷ�h�Р\�oȈ�u>	��6�??�ԗg*-��(?�^�\�[�-��
M���nI�V9�<L���������\ϸ]�jO�ō�Q�Fn$�1���Oϭ����4t�|̽
����ϱ���"�T*�RCt[�@��u�G�zp}x�-�����\�p�M2�M38n#7	 6J.��ҶA�c��ul 1��iw	�R_�Jk�0��G�Nϗ ���X����b�+��;�rã�nuB������o+8t7ʭ    ��gA��k��بE=����`��uJ:��*[ld��5A�^����b:r�[G������J�.61CU(���o�R3|��!��V�R#3Tl$���d��WmP���}gl�5d�ȭ�Z��3�t��Q�s��nѽ��,��ˣܩ`��t�r��;~ww@͋��˭.ѱ�îS�e�m�{iW����Z[��.�=��Bo��2�K�`��Un0Ѧ/�7*�VsHz������6�7h]lot�����;6bo�2����4�Oco�6���x��M��-�7{Ю0@�ֿ׺���1���Գ{�'��0P�χ����6�e�O;�p��Y˾
��!�-��aKĲ
�ѷ��]"Ψi��<պЩ�_]�5��\X�oȭ-po��w��G��
V���[�L4������q�� =�������)�R&r��2|��[����.�9��S����.��J�o't���7ʘ��B��/��p��m��͓,��N�J�[�R��5�C��*��u=�m�+��y)ۅ�����'G!qr��X�59
���P0���N:T1Y�]�%9�Y#P�g&`G�R��p"AH���3���8��V����Ӧ��۔�L�<�kM��R�K���El�\m�_+ZZ�`�)��}"���mQF\:(��#�/\�=S0��,�Tl��&�F�bK�<�b�[�/PČm
t��U��sN�����X�G,ht�%���Yn�|����+�d�Us��ƾR�ؖ��\2:,b̓����H�?���y3n;fX��*��-6-Oak�J'�K���Ӻ������ �g�`��<ű�A��i<��,W	.����5�D�͋"��9Wl]\]�a�G_iZl\�.���\�m-���L��u5����_rW�څ{~'�ӟO����n^-�Ʌ_B#7��q�_@����M�=P�(��-
�{���P��R:���*|��:�ʷM^K����?e�����8���?>�P��~�S�B\zs�qҀ�mR�4ϴ��ޤv�G�A�o�{ؓ�1����g@�:��i�3n�G]�#��_u���_/��0�ť��9V�����q�S��br'�cN����m��r�'}��;u���V`ЪO�˨ �n<=����{���6]Rp!�>+?b��ԪO~�{�(1,C�������;��a
s�"џ��}�ߛ�j��ij��B@V��)p�[zN��9\胭aU'ļ>�`a��J|�b̥�ʏ+�����w��r��ip*�����z��R?i�kW6>�:o柗l���c<���_�����������!�z/�	[�-����r��];P�GU��ٟ�XEdn�3���+�0���՟�,~?����!�{��3v��{9����	�E�p#�S/���nepϭN��dp:�Χ�4�^�g˩ڬ�k�V�^�S-�\���R�Z7��S�
�Z|CKgp| <���Z}�����=_���@�{ġ<��_L=��+��!�4��R舿c��[�d�rϿ������N�zc��
_.���+��|/�V��S(x�ЯNKPS:
&âR���D��S�v�/�{�7�����/<�K�S����+�~e.�us�B��v��i2=�ga����bs��X��#3���%��A еZz�]cGD����˙&+���q2x	C��RCsT��gO���D�ܗ_]��z��vT&�����5�r,�Ư��&̪W
���S�
�Ԫ���dB�(1,���lҌ.hX~�s�a�H�R�W��F��i��i^�|G>�RX\Og���
.��ώ�%�Jaq��Z�1+��_��� K�G��eE���O.�94`�yD*�]R|�h��fQ���S!����F��JM*r��1#�������j�<`>xu��􈶑-��^�tZ�顴�:���f�]��dtd��f��1���n����RI����"W7�m�J�{�F�T�"��͂�vG�w28gs�#�{�J>�ү!W7�N��R��Ӆ��X�gǱ`����S�9�S\U�jStR�Ӏ�P�PW�l��
6_U-q(r)������ݫ�h�呆X�B�d\�#���J�_�pv�<��]�NOS�o/���"��?9�����:=�> P쪊���Y�$�P�d *7����?UlgD��3u-�%"<E]9�uS�^<xU���G�ѢB��-�M��2����V�ܳ)���K@Tq�w���=՛�;�|4�[�T���|Z���~�����R���=%'�_�M~�`%���9u"�n�%��Ep�A���ջ�M��p���.��Ϲ,>�|`Q;�N��Fo7 ������jSK�/_[� ~rc��A (h["dڀ��^/�@����s�y���je�V��N .��<FRp�ig*�k
�t�Nmg�1�e����OH��wI�ad�[
��y6��6Ж5���.���|O}��4�&H�N��8w2�jl�������eq�圾P2����Μt�e���0N�Iaj>X��ܥ�Z�%#^����z��p�0:=cn��UtB.��i����`6{�Z���Oy!0W�.k�Ь��ڱ��j��i��[�C���O~�6��OC��p�{��U慭��J�N^&�ILө�\zwN�D�L-����9	����!&��w�Q��
.�T���~��
�ԧ�H�{@�|�ܺc�G��y����%0=_J��Z���=lM�4�U�"��d���t�G�}IOp���1I�x�;\h.'�rKm�q�t.�F�#w��B*q5ҟ��|'��|һ��� �m:s��z�Zuh�1L�+�S���[�~7�d��pv����$sU
H�|0AwQ��%V�
��b�S�(0V��J�t ����	�ħR���c	�����a@;JU�.��&�iJ60��A��G6:28�+��*�']��K\�Ҙ�1t\ A������Y�����hӹ=p+�7~��7����t�S�k{�^o\b����k@�.�9M'���t����ڸ�	�h�(��K�,�[��Y�r��*g �������~r���x�]$u��L�a��M�`��ɩC�`�I5O�6|o6��M�N?���g��3�s�<�8z�q`��,l�'p��0����AW�%6�U~q?�0�:�S,��[��].ރ�{��f�7����#6Y�P�XX����ts?�.
�1��F
�������e��t��ܫR�/�+�O/ww�Q�L9#�i�����R�-�NHjX���jY�o�M;��)�Mg��tt�Z���1��J)Vm�(].��:%~[������2?Z���n/O�w�����q�K~@���%M,)hfTS�]R�b�%@��\���<rXR>�.~�P�`�΃2l�ĴA=�o�?�巟�ݧ��< =��J(�e����7�y�0Rs=�i�~� !V{ϭ�w�o�������,����Y��\�3����D
��K�©�M��,)m�C�d��͒�����r��W�٣�FU�V-\l�6B�G-��<��q���Y��b0ǘZ>lw�Sb[4���kmxn�MC����8O�X5]jy�; ���o��C���|H[�-ǖ:֦e�~�`ǯG���w�6���	=���  ��fܮ! D��Þo�w��︎�-Q���|���O�z�x���Ba��{�#s�Nb9��N~�/eva�������̸i 	
�B{�~�p :w �#�ۛ6���^��S���@{�Ţ�g~��֩�c�U�ȼtʝ�4Z:8���(&��;`��rvj�[���������H�r	���=lO�����f{��	u��:�t�G�6�+����ޔ�F�y,�߲ױ�Yۥt��k��1iE�i����tr5��G� �s�wx=�wu<>}��M�hSgg������3�l������<w(��	J�q� ��ϖ�?l�8�s���������?ƾ� ���h�9xջ-�^���Ε���t�(w�w�_�bP�$TjC�rd�~=JW���_x+I�'v���J��jH}�  P��j��� ��	�,���4�u1��=    A�t�7���Tr�gv���rI�R����dvg��,n�S��r�m���Xp�vjk��8uJ�Ԅ!���q�#��>�l�k�t�����gSr������c�p�x���eGю7f�K���U=l�#ҍGl�D�Hx0�z���[�^Ef%|{�&�s�̪��H���:/���|�2�ʛ��������ɭ��P����Rצ�ޘ忀�eQ��C��Ty���d.���Z�T����Ozr�Ϫǣ���([ZR�տ~!�l[@*�:n�����Ծ�oԗx���������&%e���@���l��A���UW_RP݇�z�I�WW_"P����׉�UW_x>�Joi��TW_l~�{v�D���]YFΚ����*�>t3L���.����j��'��g����%@����� �l�ZlnD��	��Z��c��p,����.��/K���7J��!�uUy#�\��[��7�Pd�/��c�6 ���W��U�첂9�-��
���j5U}I:&8.87e�o��x�#��P}�ڲQ�A�f�E1�i�K�J�e5٪U�m�Ki4�W8 �
>o���Ɓ2+�L�Gq�P��������f����,�v��4o��U~+��S�a��`N���5�9N��7���ۊ��i���iC�gl]tt`X�)
8�a��$�z(���^����#�y6d�/|�Σ��"M3�E��9j��)�k�ߋV��r��-�+zU˚1ī@'7ɴ�2/,
�r_�5l8
�ӽb��/�I]p.)8롆C�R� ����&'�R����c�w~��i�Z�;�v&�~#T��7�X\Jd+fvr�1���A�k��o���)��~�܃D�z�j֌��>���a�`�7'�:�3ilj����om�/��D:{S���oa"�g�Qa�1�Z�2,u�I�!���H��&n�\�Yf����
,u��R�J�*%#�ֵw��L]����jg���id*�TR�Zu���Ӣ����ݥ���~7Y��o貚օ��Y(�|mn2h�j\��GˠT�����ML���L��`�eˢRJ�
�p*�H�@�<)+]"j��R��PE˖xy�r�0lٲ�t̗z��h˖x�萢m:6�0��|
ctd�]�̝�c�х-[��AN��H˖x�O~%h)[�,���{�V��_@�Dʖ-N�j�a7}�����;*Ԏ�lY���'N9ͤ�נ(4�_L��8�R�n�������(��3Wu^�j ]����;�r	��Z
��dr����2-C�΅��r`eP~6�~	���p8s]al�Pt�Ydr�)@3w{7�tu��/-�~q �,y=i8�o�G�EY��`�ȿa��ܒ��L����@�ߒ����٠3\e7�Etʘ��.�����Ϊ3cV
>�\X�SB-8V�g	.���!��p� ܃)�C)����^ԵC�dT��M-�']��s���$4�p�T"<����}R��p��K�F�4�p��h;woa)��p�4?���ꆳ��@�2vI!�!,�+/��mc�D���)չK
0^��ӑ"��dg7�%K�@9�fY ;���&�Y��vz��R�=@��R�Z��n4^g�L1��F&�/u��0H2A�����o �(t�R�c��Cq���{�0v0���tr��1;�)��}�8 ��K
n[Q��#xb���S�a�>���i��tX��ѐ��)��sD.*�:ZD�,*]*��37-\:�vZ?�`�	��Ki8�ֱ���԰�Q�g~����c�12�e�=v�^F����=Z������3ms�Eo�E��t�L���H��\i~��lP!1us���6!.5�$6�2��>&��Bl{ ����m 2(n�D�L/��Ҧ�������5�4M�>xN�0z������/�7%KtBCqU�����<�	�7�A�W��uua��>0�u�N��� ��Ӟ�v�( 2�]p:�-��|�\���2:����?ގ-]U��M:fR�cKT���Wӡ�}^�Щ?�x��zsMK�]�k���y�jǶ��㛹G�r~;蚻�s��	�%Ĝwh@F�
]����e�8�<�{�	�B��<p�#M���k�U���F;�b�*�	]�ꆋM��c���;�ޚA�q`^s�~�u��z�\5�ܢy��<7����2.'����ny����-�����Sbi�ul�K}۠L��Ͼ�-vp��䜇ۡx�ˍJL�����#�ET�4 �����.�m� ����i�"PTe�ܤ<Q0��>��T�Ćǲx��E�d�n��.�����*�$5Y���l>��Ӵ\�K�߉�Z..O��ݢz�|�W'W��-� @ 
4��f� "P��j�ݢ��7y9�M_/�����?X������	���[-.^�\��=��<�
'���'�9� �^������+N�6���%_��:%`�f�|�H���LS��"����R2|���\lG��{%[�|"n��J�v��*�tM6�-p�M����v���|)|�Q��9(,�>6�_���n������75mQ��Q���
kzwf���Y.*��w��QD��B�{w��dx��V���v��'S�-�;4p��֋��B�ޝ�l���BG���X����/>Uq.��S÷^1�������G)Շ�X��h��%��b�oY�����-���Ͼ������^^S���6��no�����&:u*�*w P��E�ޝ�蔭�����2���I���\"p-�7�G�w�·�uۓ
���\lz!�ݩ��"b5\�=F��ʈ��ʵ��&cR�{F�T׻s���9L�������h=6 ]�]3d���#1K���\s�  tb�D��,i�] __Z�]������s�f�dp���l���"x?9�$"޻sq-�H
.�p:�\�-MX�h:muS7C����8!��#�m��ע1-Ы���VI��Y�ܕ*���U��\���p��\ٻ��ک硱q���"S9�r@qػ�_MjPV�t�a�A��|�)�X���d�0��{w.n�-��
.�F�Bq�+�����a�揢wg���j>r���8)���G�􌬋n)�q(�h��E�t�����w�b7n/��KQ�f����o���qu��bi�hȲ)���o�΢�\�}��_��W��w�Bs��XU��@�MQH]�Y����	�H����3ƕ9�(���X�Z��КE�J���,F��2*���ۙ�[�k�G�ݹ��k�BA��w�O�D�#*�R�m��Iͭi?V�A���Χk�W޻s��6_�&j��7g�/���U�;�Q�K�M��{\����DPwL:oU9�2���ɞz5˰�N�F���\�Ds)A���ޝLM��4M�:K�X���������bR��}�7�@�v� ˝��6Yyt��4�JU5�`g��4e�~7Y��	���4���&)�474P��d���ePzb��mj�a�0Ɨ`�ޝ���o�B�Dh|-s�0V�D�ޯ���*zw��xҕ_��U�΅�5$�[ػs�)��%(ـÌ �RNt��PؗG�х�;�#!���ޝ>��ю=p#�'Ci�g��28'�7�I�N��:=��e�|y��~��9.�<�i�I.]��f���Jѻs����V9�ky���_pM�h ��lU�j }i
]��;��|�Z�j�eH���S5�"d��>��X�R1��F�x����e6I�B�R�M��R�6��\�tz�[��/��J�k7�~y�[.���	�a��U�RϞ��o�p���+��x��;��qiQ-]�k#����>�\������Xm��qը�U���B޻s	�B)J�;���{c�
��ݹd�?�>\ݻs	�m���hzw��U8�Y�R��;�U���HF)��w��N��MSݻs	���\�.!�h�sK7w�]RHc������m,�ȡ�k�r@��zw�I��n蘟�ٻs�Bg�5�m�,���@Q/:@�zw.9���
c� !V;�5L�n�0��N��;F$ȴ'饹�0H2A.V;�o �(\�jv�9��W��{D g���=RHȤ+��f�$�8 �    ����6�xƲ�w璃3*����ݹ��<�<�}�!�s�����q�I�g����h�ޝ>.vN-\6��yT��*Z0����xz�ֱ�r��sL-��g��J�U��w�"�s�B�+t/#w�c�~��ElC%�R�����;���GCM����/�Q�ņf"�9��Kݻs�ik�3�c6��\4z�kӹE���1��O%o � ���3�]C �@���ܢ:p�F{n�z<����/�ޝ��JjӜ�x�ǳ��ᖭj���Y�ݘ�6h�y�p!��|��9���y��>0�%���̦1 $�B��Ǵm ��Ej}�т���k����~��]�9޻s�ic�"^��ݹ����Ⴝ;�Z�Չ�#S��\�F;�����;O���ٲC��<��ԗ�E� ߑ�}�A�H��!pC��C2r��T�l{�]Ʈ\�)����ޝM-�JF��z�ȕ�\F�ݹ���g�JM#�-RFWR�A����c�^�������A� �Sf�a����D��k�A��2��nJm����)r8nS��I�O'�ޝ��/�D����eʨ]�;�x�L���l;Ftu��I�	W�W��t<L�gͮa D�7����o  !��X٤�P}���4�;']�Q	ҁG�x��E���lO��K�_�2T��&��_��95�C�r��U�KI�t5�|�7�L[T��JG��y� �h\�϶�k �Kn�oс��X�ϛ�^���4�7eX�����-[�)�m�«b ��\@.�T�C����N�0�Bo��ޝ�z؋B��|�]F�˱�l��)����I>��{e@ΕlP�3�w�BR��b;|s��W���SR���iR���s�ޝ�9��5�;>Rf��Q;��\�r��뮮w��nNjƷ�X���+�:��?xE9ݕ����\��}e��r��w'�ia�~vYӻ�����ڠ�+�ޝ֮؄r-��=����|�c�;	zY�l �X�N�v��pv�B�|Q������Tq�IT��J����wR�����L�Q�x�w'	��6~��L0�kߚ7�����q�B6Ѫ�-�Γ�Y��+o5Ahz�^�}Y�@�ޝD��\܆S�Ѫޝ$啔�t���I"t�sV�n��ޝk�~�D�����;�M/4�q���.#������y����f���M����q�O�`dQ��D:c�������Q�M�@���4��c� �l�\l��[��ʗGJK z�]�ܡ}䜎D����] ]Ֆ���]�5r�0���&-��\���Ǧ��=%�Y�Ꭱ��T�Ur8��S䜦,u4���N�c"��OڎE�5#�x7k��Um
0��,Yu�o<5x�u�]ɥ�JII�n �9G:��u%8m@K+���|.���y([��X���*�w�dY�,�&ǵe"��;��^H�p:Z#-��8�,]#ܤ�5��7��!pr�*����.�k�C�gl]�q�ɤ�J��&ⱁ.���ᤈ`@��x�s�ڜ��@o��4QC�N���̻��ϕ�W�&��W��c�BG��-�f�ya!P��BV(�WV"z��2���ri������㩆#�:H �����&'�v�d�v�g��頜�`���d\�)dY�Ꭱ��
�G�
.�=u*�zX�5������=H��3���_q�PS���т��̭8jS�F:����i�h໩B�+�L���t�8ˠ����{K�c(a��B�;Ў��[��B�s(���,��ħ*�RgY<���%#��˓���[݀��gE�PB7ڭ���Г���S�p9���A�ت���v4���Z6X�P�c�W���)�_���e�J���Smb2���D�l�c袶�N�\M0Z$�\���C��)����?�J�H��5��u%t��ː�Pu%v˔����8��I�t�"��S6y:���eC�K���}��c(���F(�X�1������nepj˖m�{�N���s���srSo��k@�Pz�h8�A����k�脲O��[�Zr�-���w�qT9�S4 �e������t�h,�`J���Y�t�T ���W��?�+�fn� �H�C	\i�|ր�P{�C�CKP��A�O����b�5��ۨ]�!/*W�<�D��T�-��󤗒�a�m{[��8�"��GmoK��_Uˁ����!�a���˒�k�r��k�DTP��d���d�[�4��{FK$�1\���k�d�8>�Н��a/�g�6���M��K�60�_g/l����T�l�KBP����!��a����<�Q
�7�%!,o�jP
�n�K��}ӛZ�a/	@uu֯iP4�%)*��`�^��;t娕@ѰwIᨏJ)>i�3��}� ���/q�v>��%�k��g��?��D"P��Z���jن4��ڴJ1�(�郖-LN�K��z	�=gǙܕ��~<޴���LCO&iWZ��;elG	���-�CƎ\�ڌ��=�+��;�v|�y�|w��dP��6��_#CS�̌��<�[y�m��ѕ3��o�K+t�@�Á	.=>��I>�8βK�L$�A�ٶI!=		T�?�l��r��!{�vI�z:i�=c+�Ɔ�K�H'9}�,��F��(�p����k\�t�;ړ0twQ���Z@㍕����7�LJ�����0H"A�MB7!�ړ(�4�8�gp ��<?.��D�Tǳƚ�H!u �p+�X6�r���h|C���B}�A-gs�i�I���OJ���FCƧ���Z�92	V\�|��+��	�x'\�.������rj����ӵN�ul����C�64�'	��_y��Ȟ��<����wxu��e�B��2t��lhOtz�}uj�t��I�=��j���*W�3��U��V$N�=E5�T*d�tm�ohOpi�� �f9kҕ]C �@��պ�E"t���8ڦ����|�	�
�hhOx��Y����q��؛-vy-sR�t����F����S��^��j�ꝺ��K�N���m� ��׷��IG��.�J,~�d�L��޲)�����(nhOp��k�Z���q��ҡ�}ްTX(�O�<��t����A7xO�W5�'~ᜟ�h�w�|�%n�? =�/ю�'��+~l�=�Yn��;�О�����ц��ʹ�9\�a��mR���ܩ�4���ܥ<����pu��c�׸x^/z�����t*���Q�h�����7|��{�Ph͎=�2���i����pC��=���Mun`܂s��Mۡx��W�
#��*ړԱ���7 0�MZ�U~'�lhO"�1��y�@ȅ�T�'u�~nhO�H�V}�m��+56m���=�'��VM��?ǹV�������������I�y�뭪�=	@g�)X�E��|w}pq�g �x����Yv ��D�:��Ё^ix�7�'8%��eeA�ٸ�2T�O�Оxt[&t' oh���6.%�P�"~,ЭK
P���=a3e�{�mhOX:��G-��7�3�,G��Ja(�Wt\i���I����:��퉝��(�oihO�ƷD1*�@N��S�c1�E����§�s�Ʃol.'K�YʘJ<<�S��~|�5�'p�����n���vW���E�24�6��Z��>�*E�p��"��/!�X@�P*�����{��Ɉ����O��R}��*.�Ys�<�V����(��n���)��C����7Ϙ���3$-\l`�.JrnSK���şt�
���o�/-\���^P|C�i��*,�z8VZ�r��ʭjzJ#�'J�ZS=�!*�>T~֘�l�?�3�JU�R��;�$ǧ�x��5O��T>)�T6� ���������9w���?���m 0�f��y�������l�n������\�
� �ڢ�d�,��F���CC��z��ws�t,��~P���Y������P��Ru���r�����aq`������� ���w���=|��u��6�F@ly�p�벇�� ׫�J��*uJB�?��A��J�s�Al��Qx>��×���|�������{�z�����h����,x|� ^  �A�=R���< �餞��A����դ>�)���h����)~�Й�K�����5��S�z��X
�q�,�|ȏE��[�:ޤ@�{22\"p�@5���b�\BPffm�4�Z�������i4�C �!.:��(��t�ҕo6#nѽ��N��M)�t����50ڝ�+��*Z>�{hS�$�|^�VIĶx�Ӻæ�bH��'vŢ'?�urY�^�V1 35g��Ū+J����Hr(<��[�Tb�*��LM��unCj���e���a������b�V13�.�JRy�q߹�b��n��9�Ć�U�WuzŗZ��ת��M# 5EK3�����.������?�.�      �   :  xڽ�=o�0�9��p�ωgd��-V��4RH��T��7�J	�ҴE�`K�l?�3��B�L�9(o9�����<E-L��PZ�!����n[TE�j�E(ϓ\eI�z�Z����O[hу����*q�����^4u`�eg����Z߰YU���ҩ���)iA�k�_���'
�%J� �_��e�����{��4�� Xk����ӂ�PEnЗ�Azu X70�}��J|���n��B�4(�c���o��¹�ؤ�MG%�w�}�b�q%���j�J���@����@5�z�u�Q���8� ~.\�      �   x  xڥ�M��0���0��.�$��AݓE{c��կ���CDKJ�-��0�,�m02I�_�Gd��rE��l�Cy���/��#2�����u�d��0g�F�_g��S���tr�\3��"t<�ET��)� �E $)*�Aw����,<p]��b���I�	.w�`8Sd��Ɲ�d�@g{�k���9��8�Yw25�<��y��=�!~��da6v2�?�����Zn�%�g;�jO�f���8�a{w%�����{�۸�4&���#�N*t����Q�q"�~U<?��I�P�4qy�*r�q&��C�7��@(���0��
�\�p���Yw����y���ZTÞ$3:�j�p���������G_G      ~   y   x�]�K
�@DיS�-�=I ���d�U$����]D��WET�enP��� 6�28�q��+��,F����������cY�Z_?;��
�G��|d���M�Cۃ;�tJ)} ̦+�            xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      x��[�+)��{�=����6��5�=���C0�!lw�\�Z	R��T�w��}�����g9���ڢ1
'7+
H) :%6U}�Ҫ����"-dLRdͭH^�G���?����i���F(����J�����t��=+��4:H���R�y��Z�}�s���E�Sջ"�VR+�����������o�Cq��5�������G@^9ʼN�����V��p�0}��^zy��l��u�<m~�zB�,�%s�E5a�EhV��͢����''��!6����x�jS`�~��z�k��� R@��G? {e��"���W-�Q�_��B�o���9��v?)���H�I�e�Jd�&��'�Y�Q�R���;�o�q�(����j�p�aT�׺'�ƹ�v�f�t�8\&�jf܌���&1�����Z*Y�@�g��sR��Bkc��$��+��H[S
�,�����N�h�0~���.��#��[m�"7D�+�$���<���|��
?�*&Y�$�W���E�,�M4ם��-6����\\zYϴY�j��%-��/Q�	����ƀq ����#7��-o�Ut`b 9�Vr+�v���Q�%k��d�"�2���!\g�dg�ǀ_9��qc�[\�V�P��%~�	7�����ڣ,�KV��Y/�N�
�-_� ;�Ȁt�_�K[8�z����&���(Cr�p�(����n�X�3d��,��-��w�[{���"�z4|�.��s8p�V���DQ�H2�u�YȈǤS>�"�d��ϐ�:�I��l�;:�+|p!`�-��W�������,�G:͸Wd���3�s���M(��o�K�!��r���?~���I��i��m�	��{5m��<�����x�>�en"�LH�ɽ�5�t�Aǣ���d������?$C#c�Ґ,����ɦl��"�z4ܿKIg#�~�������ؼ�9��*Li����dgl^:��&/8�W�-]^Y�uf�+��E3[�{'����h������ثD����3�Fl^��i���py)��r�s@��'j;�t����o���ڲh��ߡ�3n�����y�HT�p>ѱ�s�1C�>���` ˯g��~�>#��E�}Egːl�_=�A�G���>���~�;�zz.^"�K�vN@0t�g��f�/6
k�y����f�O��Z�l��G�k�)�K6�R]�'���m��c@��8��q��1r�[�=�9Z���pC�=z���e�\�ΝJV/�ş�E�Z2���if�ܙ|k����0���,q��Ժ�?��+_h��Ɇ���w�W���/����G~�m�x� �0Bxb[�d�y0|�﹜��`�$rC'��!7�6�"+*�/���QK$�����ȺE�x�]8Q�]ڏɢ(���S�����?7��y�S�d�"�d[FKDhYm~BEh��n#�>����=�����h2���<:L.�Cr��	��UԎ_�_9��qc��F�6Ћ�6[E���z����:���/�E$�]ӡ���$�M��t[� ����k�MօhX�v��k �N�_-yȫ����ٶ�H%�����E� �F�a4�|�}?  �#OO�{`�JBF���Iz�#hW���B�1	�X�G��ID:jF�K�C�SNHF��S��{���Ď��v_���Ȣ�[�B�B�h\�z��!��3�($e��./���I%q��O&��0���.fxxI��+��� ̽a��y��H���V�,%�!4�P��ɸY��e����57d���u+�;�.N
�J�Ì���C+ ���+��~�x��1�97W|����2u�K��0�"JBS�`�쟃�H�8[���5��x�J
��ZM"uD�a�؞H|Z�3i�?SD�^Z3S�]���-k����r��q��Ft����{W��w������F!����Ev��W��}�.�w��7Yi�ח�=�`��@'������%�6�.����P|Q��]ENXMG��w��k#n"a�>��]���������s�Qj�"HJk�H�"����m��O��+��f���n�=��A����G�0�fE����t���Gf�rd&+�Ϣ��'��m���#�W��Wh�p�z4|]�@k=ۭ�{�#��tN2�!����Q�:>��f^�	՜��aB�uj:J���O��VD �:/�jy�ik�Br����W��SG��+�`o�2<�^I�JQ ��n�+��ix�x8��0r'y��{����[V�fz�p*�h���)�ZzW�y7/Z���	�
}uu{b���a��?�����Y����HA�w�4Zp��eMh������˾��%B��y����f�a�/JB�̠z{L��Fݽ���?1	���rL^�$��E�q�0z�"�Ҕ����7�)�m�:��0�QضY���A���m)R�&Eʳ|"��G��C���e"g�'dQdE��rY7F8����}���h�JV�MȢ�ߤ	�������v�C<nL}�k������h�(�rv$�ۥh¿�wY���)���˯��-��=�f�b�|Fo��\�1;�=��۰,ۅl���ON��LIc@�����NV��wwk�Qn'=�m�|pE&E���p؞��e?�WJ1#��b��zPB��A�~�v=�?�A����[��M�X����W��4N����G��n�P�����w��.R��w�^��d�u��@�����,4��G_�*E�Ǘ��a��u&D�*a��+e�A�VIOoi�y����d��ٷC��5��]�Ɂ��q�g!n�	�ߥ�/��p=�-���Q3�K���l��^h���h5!۫���Eȣ��1��1?�:eX��z��ҮC}
Z2���(��*B�������e���{�6|��
l�%���t[a� r�C���7��(^�O0UDV�!�������H ~J��Y#P�D�\���tQ�Mp̍d/���/_n$+����f����V�p�j*�vY?�`woX�Xg���G���j��QI�f�;�E���K��Ad�"��,}d��,R\����1Y�T�W��z�u]D��R-�d�:���8��?�'Ld�n��J��&����^��dQ䩅%�x��(g��חk&)�>,�`Q�mkB]��&d��\.r
���jʻ�/_��`��|}\�g��� Lϑ����,n^t������da�����˃e� W��Z[�Z�a(�?�0��."����C���6«��?d|���!����Fv����w�r�	���[:��x����K29p�kł;�TD�t�K��(����E��/�D*0Ɇ���Z�hT�t.O��Y�z0��]V�8p�p��^=�J��0_��fR�e�l��?E6)
���e\x�"���o���G�uc�����Y���h���S�*����H.>Av6��Ѓ�������ەX�����V�~�<����tx8��~DP^��'����\��Rh��zB�,r�(B>�z-+��>�Ȉ&��A�g3�F�k�Wn27�y�������@��=�@�9���g?N�}0��qyU	������\�Q�%�܄[h��ֻ����}�����,��=��G����?D7ʳF�*�h��I��mG�&��1s�3�k����E$_4��Ȓ{Mn*H7�޸�4����\�����Dv�$�ƎK�<���g����͵!�ZfR!��4H��������1�6l^�~���H�)r��	^/�Ϥ���(tg���d�pD#Y��f=�xQ^����
�QϏx��z"�F<�F�3D�'�ʌF��b�dx���O�U D�������Q�Gc��!�l�.�W5�Q ��^6��v.��jۄ��A3o�	^/�ͤ�����o�J�2<�\��h��T
�6�џ���M8��J[SO�z��8&w\�%�!RzF��DI�t:��m��>��S�p�w=�O�z��&�p�Eh���6��Ȣ����r�N��pË���c�g$�V�G�O�c����ъGc��!Mej{l�6;C 2-r��eY�m�����zY�M4Og�;j�TU~Q��    �V�U���ͭ��7:H�����ʿ�i��nn�?ti)� "������fjmG�@n��U�F��5�_�-v� S����dS��J�mVi�'���zJ�~ٛJKF1��*��n��wŽf#��#_.��p5�=S����;�8�U��Ў�k,O�}����xs��en�^�D��5�'*ϟh����e����-2�A�;�qއ��� ����F�ߐL��GV/�EBl�̱K+?�C��b�4��,4�)o����E��[dr�<n�.s��W�[�0�[,d�)�'o���L��}O�:�Ql:�b� ���R�������en[:��3�g�\)ޝ#m�H}*٠V�J.��s��Y�fr�<nQ.sS�P�8f�Zd�Jh����f��T�q�lDG�S7Ŭ���Y�ercz;�|֎�O� ���}�n1Rx�Y[���I�wֶrُ�fE��g�'Ⱦ�"���bղ��T��1Iq�Z��R'z
>7��w�-2�IV/��x��?	�cz{��k,R1�%��`�[2"�Z�5M����@�w1�]iN%k��ը�4���Y�ar�����v��ӈz^�gܪuT�����n͌>��[{��b�(5��*���*�x�j֯:��*�����W���A���z9=�R{�r�$3Ĩ�g?���FN�![OUݒ�7M	^�G�Zӌ�5�j�B/�k��8�'��3d/�ފ���ض퉵q����[ʛ����W�+ߚ��T!S��ɢ��]������:��u3�ڎ�v�������@��c�mF����z,��6�o#�ڎ�6�幾�	�W�O۴�cQ�PL�}�nݙ���M%�T)�P����	�/ZE�����27�x.ܬ
n��ԤӇ�6��3ɂY��}>QXJ��	�����;3s��I�̍2��������|Q%*�P��V�Kv5P;���p�d��'�"��Ln�7��;6;�H��U[fܜ�x�����Y�=��j����wJ��Y$0�����2�ք�Ԕ��i��P�)�d	�m	g�5����:`}�K1�'Ⱦ�۬��@����-s=N���YtypZ�L)�Eŷ��ug��j9n�3��`J�<A�5i$3*�����|����4I���D�Ë��6OĹU{J&ᨷT����p��Ǎ�Gn~��vȍ^b����r�MR��޵ju&Y�l�6�/O���!�"��Ln��m�"mި�>�K씛��l���[�o��p&ٰl��z�"c���X��<n�y�n�[0� �2����!\-��*�m�4�T��J������� ���̽�3��h���*4�Kuz'�,"P9��lz�EZ}*�ջ��t���� �"�&7��enTn����9�[.���(��]O%���D�(4�c��i�O�5�'��<,sKZ
��f7W��{��.�t�D�^��F���dzl���3��c@��8�j�s��/�dEhYկB�q�.�]��ê��ɚS�.���U�bov1�m�G�5	� ̘)��F�Px��k��ᱱҁ<��H�N%��k��J�L�.��'Ⱦ�"��O���27����M���`\F�������,�$�W������g1榟 ��T��,���enޡ�Mq^��#�&q�T�A��.����T22�F&��5�\#��o���{d_c���3��-,sCms���7�:�Ƙ��,��Sɮ���Uw	�9�P�G�5�|�f�7j��h��D�IV�J��R:�r��;����25�핻`��#�"�&7���ٓr�"�wm�3�;e����D�J|�E��#�eZ��Z��-F�-c(�[��ٙE�Ѓ�?�i��z��JQ�+e�9��@�ԭ��tێ��'��]ݵq�'
�ctjO�}�E:&7��f�27��'��n�����e�.��9k���?�KK�нZڔy��k,�������*/\oV�q��RP}j��H��]��-z�ۃ��	������N�f�j[�y;W!W*����Y��Sɮ�l
X/<u#�m�O�}�E��y:7����	�������4��e��Cd#9��C�}�O�a��ڶ������˳�������B4l�b��Mrc:2j�E��>����~TѤ�7L^f�=�F���M��w��@��4�PQ�Qf�����wL�5�����Q;�	}�a��GU�&���I��.���Q$=��a�Tj`r����z�����Վ��h���^�!Ms<�#����3{�{fG ��kI���B�զdU�\X���^�/��{T��٪�S��=�^Í?�~�UG�:�f�\s��܎jۻf�S7d5��>����l.ю��a��.��Z�OR��U�j;@xo�GoGp2���4W��QWJN�@n������D��\g�x�1�O��8����?*%@�Ӛ��ֈ�����51'�R@�hT���3^T�1SI���Y���ᯯc�d��@ϸe�j�'4�z��uGyrl^�3x��Mt�4_��Dɹ���3�'����z�b���NӬkÌ�+\']A�C*�=I�Sds�Q��<8��d_b�^k�� n���}�N�!\#j�͝@��"��]�d[�NXZ#S+3�$�\��h8t	�Y�z0|������?�1Z�J�ֻ'癿��3��g��V>./�~^�����VjTB{���z���}�����ilU8Z���c�!Q���,ŕ�0��?��Re��i7,�ZWQ�
��ի܆1����gD���z�_D��ƆG��&�^NȢH	#����w��fno����|9��땔�dqv{Q���s��5 P�K(�V��9�����S���0�S�Z�J�U��@dZxC5	�9j�c������{�ET���������G�ׯS�\^��!r;i.ŭ��:2���]�Me=l^憗e��*�6e��~�q3��N'�1��~4|]���]}I�ze��-^��M��R�̰����j��G�l�F�J6,�e�O�T%9��	�3��c@���;�����ޛ��:�frnB�F�^�v;l�d�u�T�K/yh��~��J���MQ�*��RR����1�G��/��U���k�?or���\���v�,��V�"r¦D�I��>[�_5z��7l�_��6��Yl�wl�sd�P:�(��T���Q���M"�a��ΰ�&k̟�y)��ƽ�٘�ƃڶ��(�����E�gt�.����1��������ɹz��Y#b��[�v=�a@Q)��n\^%8�?|�r��Ib')d�#�d��b���� R���d1�TR�Rz:��w�T~�s>�~���E��2bS�E4%<���$�ˮp�{�����l�Z���:3XQ��Q�O(�� ��H��}9�e_����o��J喹et�(�%��q��(�rأ�Er�����x�A�[�R����N~U�]�Rl��������뗃a9@\�Sk�z�V���9�܅��v�JWXI�xж.�p����M��ڦ�z�Ժ4�M�j"����h�js� `������8L������3��Я]��&4��񏓓o�6{�^��G��1����A�b�b�����֐W-Wwi��睋�!����_��/��w�ՃS��y��6-\ƅ����}���Q�*\2(+���_5B�x�B*j����٥Z��)�3�V�vX��*�BQ@S.�B���� �a�~جU�e�<�2Y\B}�N�����N�1Qo+S�C�*\6��UQ���Y�^�U��g/���b�d��.$�Ѓ�ﲁǁ��jq篾*�
�*Pn�~Ud�&GY$�l�!�d�dq���%@W�x@5�U�Ҧ߫���G����*�ӯ����wй��D�nز�*}�M���([�����48gy>W��Z�5Ϯt�S��ED=�)b����/�;������l���}���wV.�9G*͋�h���E]�қ����u6�>��rmy���%�4�KոoE��*Q?�w~��V�I�h�:=�VE��1�Ռ��p�C'nvn�*�>'�U������!K�8��Q�'��M�:��p�
>���:�'��᯹y�'W�^    \E�V�˓)����?)9D�h��˙�'[�D��Ԉ.~%��������)]�w�j������u�B��n��+cɦԒh��6�Ȣ(��EׄQ��Ȇ1���/��u;�֯�-�(��&dQ�P�EV-E6�>��r�y���%�Ţ*�'�,K�6�.�����"Aw��j���~�7L_���0�_a��}�:�&$U��~��va<�PN���%=ހ_�����l��z���Y�6�.;m9�t����gNףȎ/�_IE�z?���f!���/��9�0��"R"�^��ǃ^��>A͇�O9iy6��k�*ߚ��/�>�	Y���rQ}�(yd��u�j��H��(��e
J�YeX�<[�F�IK��Ro{�ǾT�o{
�C�Y3~�~<|�u@r�W��[�Hr���_�~BEN�J�X&�Ά1����/��#�կ�������<�>LV��@�1�����ܑ�� �"�T)ɶvWu\��"2Tf��Y��(�q�����ˍ�yQ\�*�"�߂kxZUà��ȋL���G٬QC����_n#�E��_'�
�c!M�6.x9QU/��Qd���/g����ѯ����n�JaH;!۶�	I���B=��x�?��r�yQ\=��?[��z�j��}�Q+�����R�"c����<�<�V��jqz�p�®�E�{*�or=(:pџ˺�c��M8%Km��T��*���������`���R)�^I�D6�*C'h��!�.*�n�_K}�}��Ë�G�_��l8�l��G� d��E�%"k�g����Q��ey�|��m�3��������X݄,�Ub�P�";:l��!��[�֯��ª�U�'�d�(
��B��6��&[�"Y����<Ef���.�h���=h�u����ח{�#��/�&��T^)��&dQDe��^��g��#����B�v¹��jzB(� �^�<��X�LR<=�U�5*+\��!Y�7Y#���7d���E��_%x�Ut��K$��"+���Bm�!'�8Dxw��,0�S�>�E� �\�3e��$̈́,�"~a�E�Gy]K6%�?e뵔�d�t�Ёrߜ+/$�k5�n�p>|CV�r����e�fd�f(k�R���M�5dq~���%뙤<�fW�YꖸYӨ	G�w#'-Q�E4tPk!�%�k�bԼ�L=�n�R��m#����"-�$��R�%��/oՏ��Y��<c���s��"�p�d�{�����Ev���O�[���/Y��3�-2	k(/kSdla|��"�K)�ڀ?�pѧB��2��-ڬW�	�)��'���PVz�I�3l��VE�~�f}��Dq�0���p�:���x�ͮ����l���vɧ�%4#bp�LȢH�J���g��4<RL��]AgF6j< /
"4��d�V]�<�L��Ln��T���t7 '��\:|@p0�̡'����"h�g��%ګ	Y)Ѩ,A�%|Ygx���5�4ы�����k���P �Q������ٵ[ygQ�~��نGV�����WG���κ��:�!Xm������:��ƭSD	m���	�]~т�Հ+�~u5��I\�$v�0Μ�"@�¾�X?�� F^=�ޫE�m�}7~b�(
�iJU�}���x6��[�h���^l���!Ll�t�7�+[?�Yq�l=(��8���[o����|R �;�2���F7a]���'dQTDjT3�����e���z��"�F�[!R�W���k�� ��2��d���V���I�F)Q5=���>�~4�"�zK�[�V�ē�Ϧ-}�6�7ϑ�3|�<���i�h�&� �5�Rrl�(�rA���Q�[A��i�H�A��|i�P^H��u�x�#�ԯ�M�G�/�377!�����ve?�f��<R\�YZB}�(7ӫkJ��uV߮�~���`X��,(F��~u�%h�x�K��a+���
�{c��?b�X;OOd��jP�o�%4o)OV�?���I�����N�\�7���t\핍�������1�
��E������^y{L��(���9u���� �1mp��N�-B�@ka)�0�2� ݂�)|�T�`� |�<^{�wx�Fmi"P}�4�d=j�ѿv7�V�˻���z���3���� �!Г�A����������80�q8sϦ	�m��@�d�(Sa-������<�iтUBR�i�A�H��ߝ�Ml^����g�P�:E_Ek�G�ߛ�.^���x�Ttj"�LQ%r��"rB�ܫ
���"Ͼv��J:�K9�9�"#�F��G�
ڰx��?�rS�?�]J���ΐ
�U�:���'�Rk�J��{�]��Bg�i�l�S
���$g����(9�2[OdW�\�RD�t)�8!�"�:���s�d����R{O���i9]���m;$�y��G�B2VO����I(<ZZ��Ij���
OE����𺮆tA"[�S(5vͭ�x��?�U�f{T���G�ܪ��ݼ�
�ӅKt[�񢇂^� R4��0y��x�;׋�CM۔N�@+)���CxY&/{ �"ڎpԐ4m�����G.+���nٴg�߯�4�T;J����z</���i���G��e��F�}���
^�3������R�M�_����^NU��ҙW�/���lv/������&UC���W폯ख़��1�|�K���ؿ�"��?��:>��e�:Ɵ�@=�{3�<L������
�;��嘼�1�bJ#�;�a�����#ꥠ?�W`�
��"/��^I��/��Rlt��~/�����"P_��&�.�b��m��~E����W����<]�
�t�K� �?F��e��E�wYу}6d���rZ���>2��x�z�L��#]�n��x5c�ɧ󐊟y�ǜ��̀��y�:��(
B:oo?�����^^{��xi�������xikqS�C��z<o��\�����;T�)�=�/+�%?}�O�噼�1���&�����ԅ/����Cx1�/8��B�\w������
E�����G��¿��n�#^TC�Q��(!�xAȢ���T{�W�rL^��)������d5�)Ъw͔^���u�?Q������ԩ}�`���=t���S�����c�	��-
�z��2�������U�)����V�'��nW�t���x�k���45(%�*s���?P�jWM�"E���n�/$���c��ae�����G��'�K�`�ĥL-+٬w�=���0��|ƙ8T���4,۬��D�B�jf�s�̵�Z���YɴYy��F%L��O�kt��_D��������Ҝh�aP��ްU�6ޥ�� [����љTJz��{���B�߱'�< ���J�!�;��lT�9�y�U�h��9)J���I�]d�6��o�� ��·��/w�G���z%r��C��� K?z���4u
�P�� �q�����߾�S�Ӷ�	�����)���6�D{U>;�>!Q��~녏����W��{�?�Y���,RL��f�fkmB9<9U�T�jx3t�q5�6���e��;�/�����Ԫ����	}�+Iͪ7���=�,��^E��MO�Kq�_}�onF����Ł��wެ^$��g��3��%n�UXO�N��S����C��<v��{�_N*�3��V&�h^��_r���(�8I{5�b�ڭ�x[�;�c�Rl}���%?H��,�
�2�Ѽ���E���7~PT<���'��H�C�[�0a�a�������� �5c'}>��$�_n�W �-�i{w�mJ�KY�`�}YC�2�ڳɚ��6�U��5��{��h$�.�Nސe�n��O���Z�+��ɘY��T���4շ��7d�;W�D�2����h��Eǡ�uEr�eJ����ax�7v��^/8�9?��QŰL�����������7r�p>lo�z&Y2�\s�ܑd;�4��p����*d�ƎN�� �}d�e��z�ƣ����f���Kp���l�<ꖟ�2�a�2��Oo���o~Ia�Œ3�ɮ���pC�0�&Y�l�E�t��zn�x���|�»l����IV�I    � Ԁ��� у�EwQ�����Cuj��]����o~6�z�cꝲK-9.�r��z,�{!Y��ߎ���?V"��dՙd���������"��DE�-�!'m��rx�?�?�O��]s�9�Rj��S���������S��H/)Ij�-?:=�[{������-�شa]��(���Ёl�-�_�O�M���7�[~�~����������ʺ(W���M��C槂�ww�}� ��12�ћ�Vm3
M�S|c����_d��|��(9�D��{�tޤ�Z� ��:����p�H[<����Yǩ!��Go�2�l/}3c4�d����*s��#��� [ӄ�� ����
�m�b����z��2�H�-�lTy�	���f����{�>�f��,�L=���6�,��c�vzG���d�k��2W'�m���b�T<l�t���XV�[�d���z�YC���oL/�,4����Yg-�f-��]%��R��O�d_<�,s�u~�l���=t|rF�*�)j��Sb��I60�.�`@Q@��.���n��$�<�y�z�UՈ[�5#���"��ן`�xZ��-�f��˔VT2ӈ�RbI/${�b���z��*Y������L�V\DQ�����a�����j`W��/6�sq/${��F��F&Y�J6�M �.M���l2Q�H���|ĽA�n߼�,���"Y<#ྕ�똬ۄ,�@���z<˃Ȏ������ER̛l����J��P��]�䌬)��d�+5ַ��7d-�,���*Y�)j��3��U�?�e���</���K��ZuN��z[�0#�F�xU���>�f�w��կ��B'�b���.����p����u��Eq��EgJ��l�j3#[6G�)0���Y<ϟ�_'dԸ��Z�*L�����?���!����?�ɻ����d����`ԶN��$j��e&������]���n��Pz���.*�UZ�<�f�����w���Y��z�d��T�����:��N�֌N�u�!�d��du�"*5���)Y Q�3dKGy]l����l68��������O
���(�㫗;�?�*ˊWg��ZE��s���K	/$��������g��L�n�f�&
e&�:#��(�R��A�o��l�!k�d��d�w"4H.����j}C60�&Y��Pmp*���3��l��K���٬R7d��;�l��|�GrT�B�ج�!�d�d��IG�i(�S�d��IO��k��3��7�ds��A�5���=�7p�0�2�k1�Pe���T����P�@;A�>�7pR1ɪ��])X�G&��=�7p�2�2�&.�TʒZ�ة�fD�+�B��#|ft<_�N�T-�ثHv�/${�o�x��|�:ي�U��!F��oP���^��Eֺ��I֟I�҇���@1��m_Ex<��@��ߕ�������A��_�$���n��.���$��S�+��Ti��J�a\2t:���cix9�L�Z��ZN��^q��)��/��U�����N���!��ޖggo�W�P��[7��}eiK���c/�5�!�X󌞲��,�:z��4��è��(_��f��E*�� ��ae����`�~R|=���9 �fET�+�|*)��Dֺ�n���e>�3�|���\}�z�,�&��9������8Xs>����$�d�2Y�!𔅠�Ȃŝ_��A5Ge!���[��I60��U�	��SS��d~!�l�v5 &Y8�lN�n�4nF6QԖ�T˫�a�������Z&�Z�:xC*��d�Y�!+�d��dK�BR�0�ՠPG���g���A�� �w0�{5��:#[m�_����g��v5�L��d��Y:)�}�&dQ�'�^�$lG��;?F8V?_�"󞚧�?j?G�! �D���g6/$����ܾF�OOd��f+d/�fm���J�or|�͆��I�1�²͢GP�w3�B��6k���$�&�����P�x5@���&$:��`�f�Ixdת�th�p���9��8��6ko�F&�x6Y�������Y�k@?�F��g������5����6]L/�I��[}Yo�*&Yu2٬���F7��EF$ӛ��C"��^��a�}�R1�S�~y��.Kh�;��^&�c5 R�I֟N�zȡ�jJ6Ta�Ű��ln�:&Yw6Y��xE�
�f��`���l`�e���J�C_ǝ!.� �%�v���x�ˁI��׋��/
&�y\�� ��mV�·oV����#Ȫ&��u6�6�PT��E�Q6�&�o�J&Y�$�V�Z���n7W_Hv�f�"�a�~���I�Z��Z����[�{ɮ�!6k�d��dq���ҁǼ���6������z��<i�۬��wL/bo"k�Y���ԯ���:��J��S��3��&<�&��ǟ_��t��<�����/��4z�.�w�ަd7�M��=��d��o�M��Ɋ
�x�gd5�,@�cn��"n�z&Y�~���mZXꉜJ*S��	瀊�׷٬�7d�l8�l�.�� �W�.
Ե��cr�U#���g0x^S�V��z<�(���Er�^H��o c��a�ӟu�;S1�j������Y�ތ+��j�"�b#��$w�j�%+�u��{�b� �B����Jo/${����e�`�$�<�*��`.�q,�E$�֛К��9��)2��Y�NgY�[L��-l1s��`������$sEQxJjN �	�3��#�3����Dv��Ptl�^DF�\�ՉS�[n·Տ\.e</7��_�$]�VH����0Π�"Y/�W��$������k�Q4�����{e���d�̕��0�Z���w\Ef��`�u�.y��b�`�OƑ��)��>��1.x�����KU"7��%a��I�Pvp�� �7�~p�fw�����7%���T�)���ܺȡ%��¨N���q��a�$	\@8� ����O(���d�*�O8�(`e���:��:oL��%G�q��Tɢ��"�'x��sO�<��F�ڬi'�:y�F��/7����~�Mڠgڬg�5�6�QB�X�!�u���J�xkl=�][g3���~r��u���!�+Iԟ`��$)�>.V�Bs�ɉF��'�T������z��;�g�`���X]g}�x^�x*c^i��`�\��X�j��W�<u�4.��f��x��l=���d�&��^d|��u썳��d�^�Ŋt�9��7�It�1'����,��.�6��R���\24Eeg��'�՞�r���U���ܯ�J/${�?�lv�ɆU�u�-Mϡ�Q?]䄫6���Ks�M�:W��D�7�ŧ��nc�HY}�ץ�� �{�u�W�FE��p�fd�f��4�H�?`5@R�I�0�.�"���R�P
�u6�&Jt�I�Q'=v\���Ȱj[���d�S����l��l�"/@No��'�EtL����b�B���X��q��ꢈ5םޣ�3Dxg��,sc���n���j�� ��o��[*����Z�8�o>�3�R����\}�r�+�hl(�x?|�� J��W�wG��+W����sֽ�?���뵏�w��^���k�)O8�Q�/p)M;�vq�]B����?��-�8p�Ѭ�FWQ|�]/z7ͱ�u��\��znZp80�ެ�~/���<m�!����"]M�O�6����������L��N����e�"7_H���2v|��7�NКIV3ɚe�MUH:R&�۔l���%`HG���JuCV1ɪ��j�T�zq��_H� ��7d��a��˫������<#�Ե	l���z�fݩ6�LV�k���-������|M�,��=��I@�vt�M��@e�EB����v�L��L�F	�%	���.���M�{.էe}o�G+��`��|�׫dq�S5�^ X����E֌·�Y�$�ԯ���q���4#��W�ּ�f��!k�d��d#�c��`�pC�3�2�~y���Y�(�M�)���io���u�2�ڳ�.���PLվ��ͪ�� 0�2�k72��b��V��d	j����Ȏ��͇���d�dki'���]���E���U6�>���wX9Q<�v���j��=    �P�Ó�E�
���m;(;M�a�|���N�A�����d/I�@�t�߂�f��a��_�+�LT7N9��pf&�JDpO<sMia��)�P'�i���l�ʔ���>ovG�>��Ѭpˁ��ek�жߟ."/j�{�������?q%�]x,de7r���-r��Ua��I�O��(��f���p�-�M�m��-z7���%nU��s��g��%��LSL���hyٷ<=r�U{�͉�)���6���4so��^coƝio W��kC{"�"o^Ͳ�k���ܒ;c_��Y�9}��-5"�j�E^�BU\���m��<���W�%�(�����c?��,£ �����`���l�Zʕ�!.AQk�Fg5�$E�\�O�vF^S@L���Z�-G5.w���[nq �`ؘq0J�⁘z��Y�C6'T�}�P4���/Q��2�b�c{��_'�;��][Ӭ��a�ے�m^��J S� 3��Q��;�մ��=����g�cl=r[��6!H���ifW���E8O�7�v754V�����/��a��@�hlN;�VH��&�EDw�t���y=�X�C��7��7�ZQFG�� �rm4��n�%Ql�0&4Jښ�@�w����h��ߥQ�lx^nM���m�Y2-.f{=���g���9]�**lQh�9I&�J."�?���Q�[��젅���J�����r�����ڐl��(h���ۧs�/�B���p�[���G�;�b,�˥�������l���u?Ic.�*�����C�� ����wĵ���f��#l�n!���T���,���tG��*��?�����:�^����F���4��j��,��M�٬�|��d�yY���E��+���mד��-^��}d�#*�����{M>�_'��P+�T����P�n�ʦ>�,ǗzJ�H�K����6�\�d�ȊhH���.�H����R:�&�w㬊�HorO�8���fP�����������yU�UTs����ۨ��U䄧�_����H���0
y4|�:�#.��V�đ���H���㸊��<=�{vqsr\����������.rYg�y�-�	7EQ{��K��f�Ǎ�Gnn�[Q�\��
3n(�6*��A��M�=�r��b|�27ʖ�@������"+J���ߛƌ�z0|�9u-�z���Y��VE��&L���)�����-T�7o�2�pK*��ҨB�	7�G��M��	�3n���������\�"7�F"P1������"#=��w��4�[�_�������`8��=�Q�\�p�{����B����/>���Jsx����6![�"Rlo�a������_��=z���(3p0v��[���X]��.�&�<KtM���C]��>�MȦ��i��}w��ߣ�+�I����{;��^E���S'�p�e��h�@�����a-��(���<͐O��%��n�]F�����*�3�"�Bm�����i(%�',��C�_��\�Q(����'�p�G��Chg�P�E���}��+�J�m��H
��.+��z�w��߸��XA��"�������h��?�����Cf�Mh����O��hh�� G�����$���6OhXb4e�z�*�#�6v��@/��J
[���R[h��՞@]���4�%l�=P��Ј*V���gz=������G4��FO�ϔ4���B�S�����i�/g�ЀB�}:�f3EZ4IGa?��<���y_��h$hI��KnX��*�_ݑmL�B���y��n�]N�7�z�T2��E��W�=EK}`z�p�g�p;	���]�8��"�+A���\�#h8&w��r�ud��h��X�8�T^O��K���{4pY4}Q�iն��Zd��/�l�b�o0�wm��S�l���x��H�������	��?R��@�o�y�P�������pt�!�@Ck֞�_��P�"�z��q@��@�F�%�Ax��[��F��=|!W�'4rB���E=ܼ����=e��.�(lD_4S��Ƒ��"���2_A�2�*��?����$]Ä��:k)��x
�v���$����g~B#I�7
=3���	4�g�a������*�FԞ��Z�ԙ@�&羧��Lh�����j1�?K�D=��m���,�:�^j���n�6Df�<�[9=TZ�Ƚ�K���5�R�}C�G)�r�b�f����(�s%��l��	%ObPDE����V>"��;c}Ot
S��.E��ڞb���p�[dY��^�G����)Nuf��Ȯ��"�K��s�v�~D�%q�)VOOܖ�z���K
s=��."+��y퀃��Y�xz���%��7K�Xɔ�Y����Wp�`Xܘz���m�'�7�'�V(
B���O�0���6��7X䖍w�o�$E�>��P���J���b�bd�J�둛^�G��U����gM�N�(�"�@7�g�bP*���#7��m�bN�^��e�EY2�dU=���)[���6��0���|��t��Q*�U'�0X�\=r�Kܒh�D���XLe��I���Hh�9�}�*�[���En��pv��S���."@g�'W��������{�n脠�b�(x�u�@W�^�ػǱg�EVM?��;�3d��P�k���֋W�>׳0��"��67�鸈(���s=!"�Z��80��-ֱ�4Qz��oiR�EUC7�6�3�X28<�_�Ǩk5�<n�h��j5�a��.J��f��x˔qPZ���6��ۭcE���ޭ��*t��	*̐\��w���'���)5���;����En�"�FE�"l0�"��]�rFn N&֋ SO��"��Z��̥<�q�"+6�^˴����O���>�s1]���=�H�H���3�9&7w6�����Zo�bڄ[����zQZ�O�f��e�oKw�y=�r�a��}���5n��w*Zs=��1G"��x�#�i�Ӗ���n(�
m�-��9��"S��]�|�P=m���C������	����O��r�h@Բ(tm�E@��)���]���|��[�<���_斄�x�7�\�����ѦJ�{Χ�܂S�&��-�%�M�H}���8�û����L�lw�K=����}��נxN���U�~)��_D����R9�+F��_��C�)�"S_�j�4~}�tiR�{y_6�Gw��uw@t]��$�F��-�at]Ez^��̬O�����i\=n�z�VM�H������[�.2�P��:�	]u�evO���.q�h0xz��a���a�H	O��	�t�X冾�v��w��27*+�)���m�mK"���R��ќ��3�y&7�؍H�-������nD(�"QjBj%�p���d{B�ڍi�eE��j��]NHM���� �画 ���p����؍H&D�dORyҍEY eNf��	݈$�;W@7"��[ھ/�I7"I慠� 3�|B7"�x]����nD^
D�LmI3n���S��/gp^'�~�[�J%B/������A\R�@G}BoN�;K�7M��e<�Z�M�W�.
����f8�7�4�՛f��A�O1"����j�]E���m�x�:�0�wi�SFFg�͹d9���)%������5�h���n�����#+s�	�����y�SD�k e�u��(p-�h�c��!Ta6l���H����L<���	Yu��u����e�f���(��� �s1�yn�D���u��!�y�w��׀��F=�s�(��R�N��a����w��M ���r9W3��"<���A�3h�ֽ��=6C�FH��~�?�8����S��kh���q�̎�,�7�--V�|,5������"�Ǉ�{����"+yV������?���W1u���HT0+Q+��ۛU�����E{���W�%�j2>��h{�\�<���Y\RG��˸ig]s��B���n'؛�>�z�V�&"��[���
΃�<�������/����f�Q˷C��;m��C��Ee��p�E��v�7�h�*�z���Z�'�=o�rlz��_n�7��   1�Yr�"��oҬ�6�D]:�xcN�H���6w�\zo�KK�e(�����M�tjR '�-N˼�䮀k�3.~t#���N�@QTqjR�%Dw7%�[y8��W8O%=��0Z�KP��XOভe�s�ͯ����qg�'����ã�Ӳ�]'�o^�ȼ��'s�UMQ`8��7��O�3�
���0��lnnS��Kt�qs�	Oα������:r`�0�ή�qq�
�;�V�4��3�x����ܩ�h+�N$Տa�θ_"�����:y���y�xa�U��T�9t�@����	��E�W��{�(*c�������,��g�������M�*�Zd&7��ye��.�����a�ޠ��ɛ����]���t�3����%�yz�7gڄ���(�>�j&����;�z��!�}�x�ߕ�� ��]��N���g�3��h�
�jy6�P��E��"�k��'��YW<��$��==S���g1�i �ХR�.lO������4���������?w\{�      �      x��[r�:������'�G�_x��?�Pv��>�W�$9�eVwTDGC�L�$A���7� � !-nl~PM.y�_~�a��ue��-#��<{�^���[�O����s|��{�o����Ӎ^��1�KI���n��.����������V6!�q���#"���M;�����F����-�Zȏ}��>B�w՞���������xO"�<�Fz�s�,F���,��ï�9�+�<�n���9���{�[��o�$�n���o�7Y�^q�>��o��V��-�,��+.ּ�ʹWz�^�ȸWƓ�ˌ�J؁�|΃o�+ӗ_s.z�j�}��^�������-��1"�7��s��~'1���?Bv��w�g��Q���c�>���*�i�^�������l�:��=7`�[���W�y�+^�p.G��(���)��.8���;�c�5簯�k�^��O/����7�����G�}����ï��=P�"�&����=plP%ꁨ?��D�s��<��l�-��y���,<tz�J�vϕ/��Ȱ�Ԟ��>��\�PG����A�o�����(�����>=f�7�W��f�f���������!$�K���HB��� ��m�3I�GTJ2�I%{n�;�[\�X;Q�q���&�D�M��:�����C�T��z����\p_�s����������XB+ڂ܄[�����a�0�ɽ+n^س!~7ٿ��:���/k��-�yL�˚K)�a���gk'�!�7آ��Z���l�_�s��}����{@hA~=j�p�n{Y+I~ӝwɲ��OŲ���{��O�Hj,�?����K-�!υ�3��g+�]����<Xw�L��s��{�Rq�{���x��;����4��5���\}�����x|��"����,�6F��	!�*���{��!έJ�l�'ĳkn�!�B	��	��o��dq��!"�o��s-CC$���&���K��7xB�(G��l���=MB�[l�dK0r���&�w�\�)��m����Y�d�r���Y�$��8���	�����˶�ڗS��{n�]q��^�{e�ֽ��{e9��(E����Weϫ�|M`2�;���ߡ|�ad��$`Խ�u\��$�_������������g�]����{��r���B��}��.!xf7K�P�Yj�u��G7=�����T�l��5m+���>$���D��ٝ�5˵+���x.Զ<7;1�<��'{N�:���[�۶	*#c��������,�9��n�.����ҿ|�u���4~rOKl��� hG&���˘� �L}})�rb�����3�M{i��Fz�9��%��=-�ep8:�M9�����.�/J~��\��|�1I�����d�m�x��}dE!�YvKOi����v]Y�� 7n{[}dG��s��5H�z��E3*�8Tt6��4��j	b�]_{�\%8�D��>��_�h��K^�m�9�!�{�_
^�s��뗱-�=g��s��=g|��0ʆ�j�1��~{
䲑�v�s��I�F�G���#/�X	bv�&"�"�8�F�¾�o�W�M����b��=�e����s�ʉb��ʉ�k�f�@�*���Υ��Mo�ތ���tEϙ
Pi�
pX��=g��z�b1���K�(F��4��o�93
�64����Em]��F����u>��z#�����M�a��Wt����J҉���j9�Z��]*�f_��9�I�J�EVM~&T#�c0�U�����{�a����x���r��o򀻄y� ��E�̮K���W��7
�w)���\�t����� $�)��&��S�y� ����zhd��%UK�=w�Z�*����Y��2�fYM�6�RU=��';�P����'��+��(�|�N<
�Zsʡ�b�����?bK����K��4N�~H�',��W�[*Ͻ�w�#�5�=yn��O>��<��~cy�
��-���<�DI޴���̇�#�}H��?��U����زU1�U�*xK1 +�T�jq)�\�,Tpq�f�.���,<� �xS%nQ��FkgD��酮��kv.�N�R(�:#�����vBأ�}���5k-��W4�^��!;!�U��mi�����D�4�
�+������
�<wP��H�'S�-o ��(��N�q~���z"����d�~E�7����i���Ž!�����=~����w?v?�_-���g=�7��t�qR��,�^��*���뚓������p�d~xȃ��A�EsZ��
�]����'g��K��c�*��-�WH��R�h���_h��5ǥ���~	��_�%�/cTp\ڦ*qq��2zws��T7�3x�dW���;�^�3O#6ڗ��/���W��n���:�W�M���|A���@����`��~�M���ַ�M��W  �"��O&,5�Y *7e��V ^�o/�@YL��kĸz-����Z�bQ#s1����$�{A�u�/b��"��%�u���`x��T)�Pw�lPF��/�7��Q#�@��ueX��b�sW�?����D�^����7WY�4��Ӝ�/�Ev�V4�������+財*$�,���óg�CD�S��bÏLn�'�������PUɠ�wtx~ܬ@�K���?/֤SȺS�1��k�^���>���݄�A�+����Z��~��J�'O�ҵ�{	6�V��\K���DM����P�Tb��<�s��2y�a�z��a�y��ك����n�g:������*����?}��H�:�K6����V�#�KVS��\v�U�����}�;�.�U؃�=G��Қ�6��SF�:���5r{uQ+�q_Ss�n������wqtاz�_�^���������[��Y�w�F��W���?�|S��}�@݁F�U{b_�����e����ޢ?e�?c�!��A���)���拜FE�lTT�dr���k�V*ǥphD�F ^��k�!G�km��饽�ɲ�����I��y��ꉼ�������J�n ������^V�GV}��N\��zY��{��5<��5m���j"6���e���h�Mޑ�>]2�m0��]�	W/��@_\�A��J�!�f�b�Ϋ�n��zJ_�ԭ��������Y�5䌺5hԭ�+��c���VǶ恽��ӗ���@.\�խ���H��Rn�p|��'�5���H����.�/TpeR�.�:������]]N0���k���]�tdNrj;x�6������"�����S֒��#��t2�6�b���r��F���Tz��%�;T���Y�����Sf���F�-$�G���e9�2��Y��s"NJ��i�TnU�'&�b�1����-��x�@��O\���]	���-�������ػV�v����ϙ�7ԑ����Tc�5��`Su�eS��o�x��1�X���1yKv6��/ 7}�;T򪣵-��Fb^Lnǐ|e���|�I��q��_����9��ו�%���:i��E-��̟������I���Ր����/=���8�q�P�Y��F����.���l$iOO�`��di�v_}Y�h#1����4�x��.لqU�*2Łb�S0QK9�+�;����>I}��P2�H��gS2J�a�]ZnMwz�s-S/b��|Ǵ�IAx��S�z�}�������+eܣ��G
F�z��-ƼH�ɡo�1��s�˔sg��O��߼{�@ν�]����SHZ��]�\{s&������RZ�A�g4����'sK̖=0����|�A���lEL~�К+-ʧ���F�p�,�Z
]Z��UY���aoCӋ�-kb�ܷ�eAm�)�~��*�!˙�U-z�n��9]�M+㢕t�c�q?�x�k�3���b��u���ڀ:0@ܕ���kSp	�y. ��i.W+������m�J���r"����%��\�������--r� ��9�Z�=���p�t��o:�VH}heK�R�O+�K��"hI?��s8��M$�����c��    ]�ОT�$�l,.���y������	�d�v�bqg2k��1�ئ��	�}�g�5��m A̪^7z_��D�u/���r�� ���z3z1��(��T�}^ܡr��:���5�����7��(ՙ/n�k����D��6�Ӛ[�a\ȓ|�yzњ5w��}qb�`�
iӃz./z텁
F*|25��wM!�����Yo.�Xo�O�7OZ*��J
PZ���R�HK�+X_*��t�왗�֗�8��(�aoEb��MB���D��:9�7f�y[��q��Y�u}2w�=F��	ta�x2�[�� eK�l��Y4զ}9��8� g�T�j�Щ�-��d�m��1�'����rnoR�?���Χ���JKeF��qܽ�ZI�����i��ϲ�td�bX��g��}���g�.���&w���G�R禜��[��ZqF{�]������SP�������$3{��>_q��W"���Rq��z���$�?"Q���cڭ�d�UYr\z�햍�M����H"7�kլ`
� ��I��a��.�	�~�][�S͑��1�,P79�a* �.�M*�R�����6ć�M�:�&*�Xʢn��F�ȝ��> ��oA�`�7Q4�Q7(�
�X�U�Wx�V�؛��O��S��I�2��|-kV��%w��hOxz�־��v`�=��W��T���W���Wt��45FSZ
E���M�F�T9���tx%�LI���/R��&�~6)0�.�Nfઊ���U%�U�\lU/�}v|��J��V5Oc����ٍ�T��5�{�&c�v�XBG�tZX{��q
7U�^���UF�	�F3����Y�Y���E:Er0iY�j�Os�4����y	Z��ޫZ�k^�Ae�z�9(�"ս^�uֱVPj��<��=)�t˙,��?&�d�Z֒�{zǖh;Y���>^���[LZ�J~閿t~ś;��%�_U�{QϹ�/��_���/<}#&�V�8_����Ki)�/OK�^:Q��ޮ���ZK�D(`�N�sL�mx���-���\�mG�@N#�V�bn�f�&��=�rz�^�`sA�_ss07�)̍�UPP��u�$%:-](bO9�����?��ʶ!О5���E LZʢ��ZJ��Rw�JG:w�/D�m�o!��ǜ[n�ƁX�΍��[2rnxZ+@y)�-�������K�o�Km����.���̟�R�iFW�RZKSe"�s�Sٖ�ZZ�굴��#���P^*�"�&���<=��|�n��&껪n�З��K����z��l��J��2�Ӏ�9Z�Ӫ4:g�J'o�J�����(�U�U��@�*�L'{Z,3�st.��FE.�Y�DW�<҃q3��2n��z��a�?L��Z�-:��}���$��ү�do`@��0�d�Q��qvr��r�J�7QJ�w{�\����(��k/cEʸ��nb�^���[�\�̱�O���bc�Н�-�w�C����ҕ�]$�ڥ��qi�BWjS��TW�㪳�MyoS;G�u�TIaU,�����3����9��O����幗Zp6֚m���N��eY򐪞^~o�U��m�b�x������\�HJWa���yʄ�	�>��>��N,��ˌcщ�X�tb�&�P�&Jȑ�f�y[q��m�ͺRt�����V������;�՞� �be �D��qy� ��FJeg#������p��Z)�����Rt3)u~C�MN7m���-M0}�M��D�5*�����HU�v�-��W�-}�M.%AL����Ÿ�?�qSަH�!a��w8n�B6y��7�3����:���^q�Yf���M�^���R���^r���+��h�I�LO"�4��)QI�ĸ�@�b,7U���t��Ul-�*�[������iJ`+�u�W٫|��q�^�<�6%���?�J[u	�"q�n~�z��)���Q��L�&=P�/׭���bSe�껀���X�_A����y��m眅����0U;o�xι�r�����EU���Ϧ����(���n�9��	��	4y�[֩9�ˋ���kL�ٜ��~))!��f�0q��S�������M��C����nyN�l��U�sL{f��wE$�(5y���Y�d<�Qo���f���4{�?ab���Y�3i�:g��iN`�9	w�V'�3�s�9���9�=��v�(߅i��#���=�B�b���b���}tt�l��jVu{���G2�ldP��A�z_��%�Ks���6=zS2�zY�sF�ӓ�cyd(��%��Us�	=���q8C�d�1�:v@,:d���N+�g0�Y�9��޾x�{��A���ߗ�6���weJM$���#r������$����Py�69��Av�{5��kHoƖ�B�����ҵ�=��UA��������@��K-�S<߁	&���O6��ϓ�	\�F�Tޜ��IF_��H��W`�������A2��'%�)�����p���9��搻��۲���4PH~����3Ł��"���$L�)4.K�ꥃ���&��r�=� ��f�iկ� s�F�D�~UNd�Ey8zg~R�]�Spe�X�����w�'6D�&���9��坖�������)������<�d�>�������_[6�[*GeҖ�#N+_���q���A�%,�� �s��]Ϭ@�QMF�E<Nn.��4������CnN�|�e�5�兛3vP��S����Gyp� �P�,���U]�J�e2<iW1F�-C̋�OqF��?��9X��!��
�x���UE#�Z����I߱C��b��_��{0<�u�ex���\������ɌP�"�����x������Y�|�!/Tվ���[�n�i�Ϊ [����T%��.�,���"�<��$��^j���<�(��iR�i�JtF���G	�^B�����m[{���0G��Wx�OW�^�%�`�_�m�/�W�w���X��c�t�\L��p���߄c&���n%��G��h.@��i�nNN+9�������'��k�5m�bF��H�nRѼJu� z�}N�LXW6r�ŪÃ�� p���1T=���	�'(�|q���
)J\���+�����Q�HS��
��ށY������$A�I���$Ȭ��rK��v�}�^G--|�Z�dxF���5G��s0<����q�w/���f�D$�4A~�V?�	��VȔ�*X֕���[��������$�ʃ��!��\_:퓎�&�@i*�j�<E}�M�ҟ���Mx���y��	<ac�TU\� GE��X�I�\���J�>�<����)�]�W�6u΁�Vc���J:���m�W4�^��Y'c/�lJõ�-vx��-�M����=�b���Cp>m������T�W�m���`�S�[`Yx1R\L��TY�?b���[5��Cל��k��)#�X޺���pI�4ǈo���D��3h�I�l�e�>.���(�LOQӝ-�ݽ,�����f�)��FƝ�4�������.L������ȧ+I��p�M���H�R�nu�@�J�
e���s�3���a���S�z�/����*����#	���Mk'�Ӯ��l^��Y۰t��MJ�I"j<_i��!$�O��}U���L&�#˼��*�J��2P�"Z��<�����	��I�1�Ӛ7��8�N���I�;s��ۢ�DC��^/wf�9��;��	<0�3Cg�X���O�3qRL��d��k8��J�5#�Xsl����5w^� y�г
q^�9c�v�zcm���FYx^	��-��5W�q͕�^s�)OO^����X�o���!W�h�5�Fwx�j���Ο��莹&���Uלr9�1�S����\�w_�˙k�o���-��5W�_s�mr�W��������+��},��~���7%ܲEK�D�]E�)'E!5�5;FZ��rR1=G5L�YN,�����/�C�L���I�� uN&Pm��=5	�lԒ*7ٿ��x`�tRϥ��.ǒy�3�t����0�T�����L�d�l����%�S5thy�;��Ȝ�����9Z!���e�qY��
Y�U����#�9Pɜ�r�53.�ɲ`��_\B� 4  ��Z��2���1���ޅ|G�;x�t��"0�E'*m���D^E'j&7���U+���L�fZ�#S&�jϘ/�X6��������X˻*�WU,ǈ�Va胜�Rl��$,єy����'ۦFe�K��9S5�r5��Ě/��6V���쿼�C���$�:�C�ǰ�^Z���qwW݋.�{���>�t���{i��0)��i9J�Jܾ�ΰ���B����FZ4��{Up����þ���b0*;�k�6���3���]*���M�Y����h�:p�h�洪YZm
�4��n��jV�r!�����6��K��耾���լ�LM�����[ԉL���CJ����-���9���<U	��_��	{������U�Ȼ̡���ޫ|?�-*Ȉ)���S�q��j�=�Q�aKIK!��^e4���Ǜ�?�{�z����\�z���^�(Ag��J���^�v�]V����6X���0V���'ѵ!gV� uN�.�|Gp	=�]6�+e�B!@��{ ᚁs�|���|MZ�j�Խ��E宛���u/ӤRS�Һ��B��d��pV�+{���t�+���<s�i[]CG�$��'�M�NM���)Y�ql��&S�mjb@���xE��5�tC?Xuī΢u���T7�ڟ��7�,�uYn��ڛ��O������RK26�E�CM�3� �yӽ��H�-�k�'zh}�>$ܛ`��幙P���x�~-����x_E�ע%=G6ym"�2��E���>�-9k��`��%���.�����Qn�%� ��+����������;�C��έF��»`*h�L�\����"��������<�)�꛼)R��-�����O��hKG�GUP�Q�+E;S�1?'E�3�P<��]�������H�w%��9�Ӊ�5�r���VV�Oq9��pY�)a<��%�q �
Y�З����lB���l�?=�|�&�5�D�?h[��#7Q���tY~6*��M۳���|G��M�@�;�d���&6
�v�r��r��H.?%71<���"�N\��,�7�Q�P�!�@):.j�\Q)0f��^ט��+
=%��7�L]��'7{�&i�<��1d��(���z��u�e���
�Ѷ����:�{b�a������Gցn�"���+��(�R�F�j]`��e�`XJ��0Z���8QY0�Qð�&���EU�#��uC�k����8���?��rI�k��R��E3���S�E-9@�!��RLme4��"B�w#Y$��:��v��_�	��`i�0ٿ�K�r�ژ8�_�	�}�����ٌ8����$����x�!��E!�n6��oj�C&YG����<�y�yK��饷$��ҫ!t'qZ	N_�+s�����1p��T�JˆO��-2w��Lܫ}:�E��g#hc`�ur���V+7�S� ��j�u��C]�����4�Sr���;���?G�����*����^����h�'�:�>�#f�M9緥V~��G�T�o����m43Mv6ұy�+�pd�1�ƌ��YsAΤ��3z�)�oT��U�=�[V^(7�nTr�q�M7���/�ݱsY.5��g?sq�"�}
޴�Ğ/`!z�W�7�q�G�/��B\r�ҁ�� a�%֍�Q�:0�ޣ�<ŶFk���n
��n��b(;��f�eybS��7�N?�΁θ�]U���7��p-���v���o��f-��,�T�)n5�T�_���{0������y�ʭ�Qs���u��.ƛ�Q��g��G��r�04di�[�.���Zz��=
��.:]�"���Sm悥�hqFs�٢?���Ѣ��}��u+z%�SgW~^��tj�=X��R���I��d;��ͩ�>��O�m}:m}:N�%��T��{�+.ѸĒ�����%Q�	&�>��K4.	�mqI��$�^s�I9�g��e*xɆ����g��>|>k'q}���F(�EE(���ⴭ7e?�2��漣'�V�`1K,�f �R|Q�c���	9'�A|���yq���O�;^�6�l������'����7��o�KYy���J��2��y����W��
�g�3�����;WW�D�����H�M�EYS�����=vK���f�_�N���i���o����BzN����b���b�V�W3��J#>���ޖ�}�~��J�,+ũ��{g�؏;�BJ7�I��m jOeQ��2��;=Gƹ ��M���odܳl���v�rO����wve�!��*H�ή��
����vv��7a]I�EY$A	�Eҿ��r�Yt�ٵɱ5v ���+�qx�� �d���(&�7a�N�?�ܥ�S��t�R~�^�酦�+9�&n:�bw�$	�A�a����/+)~���Xs�9PX' Ɩ֚;֜M�:[�#�K���\�L�q_����<�ib�ڟU?<7B�TG��~�\�y��sx~�ep^"Bʔ�7��$썞+6�]�9_��w)Wl��9�#�y.���`��!��c2��R߬�d����>_�M�fUȡ�"���犭w�;��A��u�j�cyN=W��%:�n�>\�9�b�ؒ�֖��%�缭�!]�<v��*�������vK��s�<Q����Z��=�yyNެ����-�����\%�hƙ����荞3�s���h)��3n��z��<��5�W���B&�DP.�M�%��d�]�T�.�����[�x���F2�Jf�P��O��k��C� ���W�
�pr���ie�ϑq�4]
^�9��@����Zs/�3��1��@�E<���-K_���s�[���-�]�pF��x?�s����stIޒ7ϱ��c_:K�猕U�h�_�Q� (A��ʡ�x�v�Q��-)�+<��moE���-��c��k.�+<'��Weι�>��s��k��[V�;T�'A�r(��3z�[^R�-mPw�-��*��d�=wE��܎��T�.�}y��1B��[A:ϡ0��ө�`u�}��w�\ 2���xɜ����K�9��qmeF���ƕd�t?n�����	�*���:<GV���Ȍ��y9�P��my��\�z�1�+�׽��:Ge�����s�}]����������m�      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �   �   x�mNA�0;���AI֦�'8 ���[�������u�يd[&*ʒ*d��]�B�$�������B��i�ښ�������r{ӟV!IS�#BV�6'�v�U�:�S�i����B�z��E	2ok�����7$�<�      �      xڋ���� � �      �   �   xڵ��
1�g�]\l'q���A�ܒ��
}���.�v.h��B��D�[rG���W��Z%6i�S�Pc!,��W�@�.��}{>^7���18��a���/q*��1���摢�&�϶�C�`�G�      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �   �   xڭ��
�0���{�h��#�z�=�.mWQ�	��oe��M��#DY؆DGZ3��d�4ڠQ�pl�bK �Jh4R��s��Ni���#6d}筳��z��W��8��#��J�nK���p\D� i��Y��O�i�u\,�`ʵ����WiܻfX)�n�܈      �   ~  x�ՓKO1��ɯ��zr}m_۰B,�DɦH�?�(Iժ��3�Ii)���u��:^|>�R�H����Șm��
EFyL35�b-��3H_�`�A�irFe(`C�)��Z�T;�P�NN���Ѵm\�
��M�t߶by-�ҧ�ߓ9�������N��na��4�����Wމ�Y�������Mw�2T=Vʓ��i�c3e�aXh
���=M�sx@�L��rL�^�~/������G�C{�i>�p2�2���3/���Q BN�;�}�P���1��3`'���1FKMF�W������h�����QI/���ϖ���mE��j׭E���_w��~9=p����h�Hku_ݿ-��o���?�>;�      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      q      x��}YodǕ��W$��~M�K=P��z�v�dwc �XUl��j.�ʿ~Ή�r�2�$3nfE`��d����g_˖k_��,�@3%6:J2K�K*���+z���������I�X[(	���I��/����������������Տ��������fu�)�������|^��?��o�����	��_�����v�y!� $3;"�g�g�?�__��x���kA� ��\��I�X�I��I���'�����껳r~��_������N�ɐ��@ܠM�&C Bo9�����E>�kd7~�z�X� ��5���6|
/r�k��^dD���὿ 4S�7�4yB%������@�%Z ���N����}>�:�����}�m��x�����4^�Ň�{��A�IT�@At��L�茬h��͓.�Ǔ�+������?��������W7?|���C����zf �<p�i��T��h�=�S��xry	7�}<?��8?E���׋��OoVo�Ǔ���+`����ZG�e��ӯ�~�t��������y��3��ys&|)�b��h�������: G_|�r�;�y�#�d���{�AF�ܔ`R'yK�;a�I��AR4|tP�S0��U%�7˂T���Q=����Ue���A*�=�2�N�t�@[���A�[��l'HC���NT\d �i�I�;Az�\�lYd&��KRVt���x��.��/��jTց��ӄ���Q�4HIx��+;Ar�3�g�4O�E.,�ns��	�mm%��H(h;)�y���{W儠K��$14E�t� X ̽�K�Ip�|��1ߩqX���K� ΉF{3���	>�t���⒤��Ѯ�N��D�<Y�Һ���:5���'iYZNrO8C���%��Y��p���u��+T.-��X݇:�9��8�L�[ZN
D�(8h'%#J��Y-Re�g�$X�q<�}i��00J�;/��C�ѫ���\b8�>tړ"��.n``w�"X�^J&"C������d�X�d֩A��Ǆ��X��H	.�@�Du�E)����vi����v���-5�l6K�$(C��ǋ�S�=*z�1,Γ��X����82x��N�� �J�舅����B$C9����d�Oh�z�	���Da�0HC�� 9�.��Dcv	8|鋣<pŗ�{A��A���-2j\���@R0JI���½Ɣ#���
4����K���Q-����f�S<.�yi��X�4u����7��qޟ����	��/��G�U
�(�j<H�ɞ:��q��mL��O9]G̕���ߝ���W�C�Y��ܟ���O1���a@�Z$YQ�`�A������ߺ�'x�s����g4���
ܲ�qq~z�~�!�?�&�߭��d��|�-^�!��^}���G� g�	.v*/�[��u9/ �Z��h�)!�k�[F>:^e�`HR�X@P8����&(�vA���:T�It:%������S /����O�'�!���O��^R�8��~�p�Z-&�1�����T�L�\e�<��b�b{w��#�>Xwh�?���˫�����۟�~��߬�@���������c'���:�}28�rN��L_����M8<��2��,��CcĂ�>� �0?f��˰|$<��'|:�]#N1�b|c�u=��R�}�D<�V�l��N�1׃R�����
)cX�mМX�w}�',�
�O��>�V^��0��)�.����B���,DM(F�]���	ƀQ'�ʲ��c�7_�1չ�T��у�ڜ�z�ޑ����e!&±(��n^���(��,
��g�aj/:e���KT�"��'F��}�:��k�┲e_tPk��#�T�A!b�rY��L4z�T'DCxͥg��\i��BvN���&�Ć��x��-�o�7�.%:�I�(�)�Sow�c0怊-t�\#�X*�ʦ��s��u�9|錨D���Ɔ�3p�5K�;���>2I���(x��ٯNVN |�4��x"S4��8�#K�=e��N��c *�N�I��T��(v����M�{#kِT��ܝ:�&��,�V(b 3�,�w�S�(����)��T^���}���u�"��gY9P�;�Lt-�K�3_��2�3+k
���*��ٖ�����^o�aw8p��e�`D'�~5@�v�7r�6J��	�Ùjj�e�����[l(�����ƒ�X�b�'J�Ò�N8�Ȁʘ�0O�]]��kl<|�mb+~3���o'����,	�������7���28\�V�ϳ��yFc<m�}B���<FFe���RZ�M�[�KC.X4��^��oĲ��)����5P�k�j\�?�����X���*�r 1�ۛ�biȖ$�I��Z d�mX�O�;���Lu
9d��(z�T6s�^��� 1�W��Z��Q�.Ȗ�|����Cv�0T >wv�h�3���_��#uJ'�CG�8Y���'��1�?�� ��2K�;c�V0m�	,یưN�p�6���ׇc�a����3,��P	���`4�Ѝ-����+��I?��\p �V#��Ӱ��h���^�}��ϒ���Q���>A���Wg����]K�O��X_�z:�Zt� ��6�(�	8�'P�����VĦ�}.D�j\��M�Dh1���EG}�f���!�Ŷ�2`�p��.rR*���h���	Iu��\��E>AK�a����1�Z�'��x��%01)	z�/aT��u-C�zh�������hT�Qs�4���:��Ŏ�w�֮�Һ�ċ�9g��@(�˼��0�gU��>tE�nhE� �{E;��YUg��� @��ڟ���-�+�fC��ʵs��"�|}�/�_�o6����ۛ]�)HC9�������ur&���� �+|��jX�u�C�p��9�t�spb���lq6Ԑ�M�=�K�â��-;с#T�z�|\���T�~�7��6��xB�k�|8�+���	��$����\�x3L��`���{��2A���X�0ϰr�����`L��Y���� ��V��^XdO�o�3z?�t}:e�o��x��w���K�)���9n���,_���_��x�����l1z�]m�.��G@4�0O�M�I�Z7�篢��B��";���]���@�wJ8!�	���I9�0�hd�r���Q�)8�%#�+6w�+�At.�����?�&��������lLA���;�M�Vd��ϟ����nI�V7��c���ZV������ju��1�`"a.�yE� ����[q�(x"k�o�n��s�7Í��y��MC�������-�ZԢ�s^咀� �bD��:�1�����?9�|�����	8��`x�'��:�V�q^���˳O`���&q��p�{��?����O���c��.�'��p���r�����.5Q��c�'p�qo��1T��8���g�Jﮁi�ͱA������I�`�Z��P�������{�	����X7�	�1�����k}ac�ܿ�߾�����u����/�����ġ!H6�Jz/V�:ʬ�q����c�9�Ba�O��OBV���c���������2��c�8�5z��0���݂ĳ�u�L�>��p�f9�٧�(�g[�&�x���ǀ�fߏr����拓r�h�&"�z9A�N��ՎU�`��:��3�W]��nfb�m��c?\<��a��l_덁�$}� �X7%�/��&;�NCh�[;�I��JЏ'gO�h�	�تEE�% ��#���k�l�|Ķ���e�x寮��/>o{�h��ho�p;�����R �[�;g�)0y��C��������넠_
�]û����c/�;ⱇ�9e�F|ѫ߿{�����A��?�×E���%+P�_�/�{ű���c��Ka�u)�g@��:���.����1��*Qgp�/v���Ǻf�iv��h�D`Ko�l	�O�,6����eoL�]�}    3,�Ǝvs�\�f��l��]fH+}lFk{�H
6t8cʠ�E�I`v����SI�h];��#�/������>��������s��G��m��:��ta%��O���HZ�gY�M�yu)¼���&��z�� ���:@O�l�D�/�X�XTk�s}�+�$��C�^�I����$����wo���Gp�6��Y}�//=�H�?�\�J{�\��Rc}��I�H���vޑ_���"�|�.�����ݷ/��<%�����-���-�-0�a8=�꾄!<I�j���m|�
���{pX�N���i#x�ېTK2S�Ex�&�������g��������啯���O.��p�`�� �k�J�yH5��5��� 6���O?_�����'_Cv`J�J<����A�6�7I�`@M~�}/�{� W��~�o�[�;oV�y�
��G�ެ~�͛�~B�o���~���S�B~=9�:��7��\�?}�'gW?��6%а����y�����X���8��U�dғ%��c�_-dM��L��LbA2E��Oj�O���=%��C(�M(�,?��qM;����^@-VW�A;v���g�UwSK/H���B��ڧi4�L�NbSu��<K�,��Y����8w��غ���woVoްӦ�g jA�V��1�llQN�h���믍�*�"lJ���r�fp�poi0|U
��օ˪�Xz���)yg��#*��]��n����7r��O����U~��[B�L\ͱ�Vz��c�nB�e��M�xW�_}��w�@ou���6V'�]RnV~��F3~�??�������uT���e�n?�����R����Xs�O��R1����5�b>�;pG,��1a}a�K��|�W�_�U�p�B?l�~�B�g�U�Y����4?͚��[� �{v��Hra��?�O�/�s@Zj���u�^�mo�Cλr��?ܻ�),�9&A4;�%t��+ܻ�:��������u{dlI��-p�����%k�8F�긂D�C%�M%���z�Q'�TFW;1�N���q�n��=D^@���,�:�]�=Ѭ�bKzC���u�����ӋY���k��|�������@W�z�ô�6}ۅz;�zM���)�$N�uIu} �ĄX�?���ZEuq��#�NoVܒ?� OZ1������Wߞ��?do�[��~��v��~�G�S0��-��r�S#C��Vo����_��7�!H���E�]��`���ĺ!��PF����Z����S?���N���V콜��p8R�v�KUl���y�s���
+�/`ì�ñu/|u>"q��K󻻿�����K(��*G@��X3�|f���&��}��sʆ�j�1
��|F����ڌy!|7FKuin��qu�jY� �<v���!Y°̗y���-3�u�����Cc�ز0G������t�C����qZ�jϞ����m-s�h����|}� ��A�W;1���eaK�pg�K���T���Z7������moY��t��J�L�B��e�J�`�ıZɿ%7�,�(#�\��~V|Y����9N�[�12�����o��dV�R�/��閅9`G.�p����H��)��h��<ҧYT���;���$I	g>�,�+�'����}wݼ�fu;;�.k��w������T{o�f<�Mo?}:����Q�]��|��YQ���|��,����V�z������ �� �L��{=���Ƴ�R@���Ѵt�%�k�eDJ���Ə���8�<�X����p~�Nΰ�d�׳�Ϗ�c��q�^�p��2v;�"��}�H�Tu88e��]�==���G�{bc-���_��w��BQh�1<)u��l�w��p���w6��6�TKѤ> �-4��P�urR'�#*�1�F�۶�Z)tryu���|�%y+�qo!�KN ��j.�n�^���$+R]��9����ͱj�V=�%2�ɟ��@��Imt�{�� k�q��G��`j���5MT�YS0��D<	�l'n��[Zfv�^<Δ�����Љw��L.����?�ZL1bK$ǰ�0��cX��O�/h���@����QubiR�m�y]E/F6~��c&Sp���&Iͱ�O��g1~Y���23���]r�ˢ��f8�:j"�
�ִ�b$�]��@��!�pms0!
��2-`��
ؘv�L�h����g4X�=�]NZf�R��(C>�[ߞ��a�]�h�>#�㦴�e c2Vd�eQ�c�3�	�R�K�����o�F�����wnI�� s�LM���� ?���!���`	w�q�O�lb��p��l�`�&'���U����@J� ����~a
L�d�e!Vw����5���/��8��<_^��������WoOO���Y��$����+��QvIxx��0�"��L>�-4x�5A��#J ��7+&n[��r_��$������F4�='�� rހ�	��S|���c��X;p�N
\�}�TX���[y�LJY"u�<v�^[gm�2~��\NkS_�5Jʭl��p��<v,���b��L���;��$��T�������:믷���
��8�*G�{m���ݟ�mP�ɞR��$pDJM���f�M��l���J�`>ۆ�:����*,�t��t�^C�[�0����[��$֬`�|������?�-.�Z\��%��%K_���#��Z4�E�ɶ~�#ڢ�K�S�;����+K���[���5|��>p7�}�%p�R�8��n��t��XH��������'���g'����� |��N��/½[�jS��)��O�D�wq>5�k2��-�;?�'���ǘ�O�A�͵*�<��W YQ�ɐ��+Y�$�������@��?^��!�-�B�T�������9�@Qo������`75P��\���'��ó��ua�5)t��Q/�ۑ���-�D{���%���->����������r�?�9ߢ��5�p%:�X�%X��8q�9�c��>*��u�%c��)����p	�L��-r��"�I�K�A;���^�`p�n�/���FςyP�m����{�߅����-2��Yy�z|�lݕ���ёT-ZUJ���s8�<�圻�	����`��aG�5=��I�$��Hyg�x니�"1���=x�I�hT��3���}�������Sh\��ToU_��xHKD�����я4++#�͌��q��d���N��'s�0,�u9�lgl{�QNx%�,�5�;��2z����J�ާ��2#�I�P�2��g�eN.Vo�puqb�4��0��N�нߌQ4��P(�m�QO� �1D畻]���	���6v��x���R,E/��l�=�"�t#e5/�:�T}� ���c����N]���)��_�B�O�8:j��a~��s@�鍮�ͱ�~�KGH9��s��#l���ɀ^��6��ԓb�?�k�g��@��rL�C͢g�Y���=/h��3̍����f����j���:ڰ����ׅ-�r���#.��{���;�-�w�5��}�O[%V�[�����p��e|�܉%�޳�A8�e`ԗ�#G�}b�d��P�_�mp�4 ��!�8^ת"G��2�e)�֩H�A�������i0�p�4�� [Xd̻Ӡ>IEQ��y�S�;-o*���t8��� �9 X�8�=;�C���Xov���$Uf�#��r��#�^��A��y�>�N=�UI�r'�)!$ԥ�S8��1�]��jh�8��i�˞�Ob��لr� _��pk_-u�qX�k!�H�A'���G�H����y�{�yd�2� 7g�� �����[�g�����"!�,���IR��ch*[7.d7�����%���|�脜����+J�^��E!�WN�j/IeS6��vV�Oi�%qU �$z^<��Hk�[�^bS�4; �46�l���ZȱN��JŐ�h��$l�7�{�96��ډ,Y����`�.�f��q��������-dP�Eԁ��X     �Xy^K��2fJ�
�zU�h:���,�O<���Y�C.,���1������6�'/��I��KCr��јR|�Va0+ƕ�EJ*v4L�hh)+>|�r4�I���Zf7L�DI�9H�P7��Qo�rr�)a����Gs��i+gw@�c5f#�-E'�X"���\�0�AΌh��	6��g���$��"�y�,�D�mB�Q��2�jT��#��%a5vmxW�5����;&����b��M�F�uAք��j�ѩ�j@.�S��0Fr��a�Ȕ��'�cFY4 ������n ��Li�5	���J�A��$d���9/��4Fꎪ�N�� i���KR���9�XHԮFID�c������y�D`�Sм�i(�	�]�̋� [��O�A��9d����l��#�6��&�jM� �	�ؗ�)��B��D���<�55�,QgOY���hb}a_y����h��`QG�Hb��8x� ��rV���le6>U���7n��?sb1�1K�8T�KLem3�en2��
j�H�nU����n����.L��]�\���C�+��#���\ŤKA���:j�9�f�b�[#��ƈ¨�5=1|-Dy��;��}���0�k;�t�C�P�N�颹�$9�+J�9 �\������28u7$�aQ�jYr���u�rPOeYa� R9w$��#R�
;��T ��B6�0�ng�GK|p�H(���!�A�x�d��;(d�/����A=�9���u�[�Gn^Z7��<��n מ�ǹ ƅl'�%��$��t��	)��i#�S^]���we<���0z�F�yk���5�
�hyy������i��A�z�"pi��X=������pw5�!BvL�|N����o��2r�6H~��;���+��Z����]b�	d��]�B�b��do�2�d
�X��8�X�V���L{ �Ѡ�C��[���h ���'�g�%��h�� �o��O�25I��\:���� �L!�������G������vLu٫�B֊KB���D����C���q�1��Da���@�x9�g�#�8�Ȧ��:{V�-d��K�Cv�H ��q�N���{V���r�H!E���K_
��
>�*l!;��}k��#��	�.J�~XU�B�h�֙A�	�I����I�j�ra�c���9���m#&�ު��C�am�+�AvDé?h}��qTß��WȜ�&�qz$�Aqk�S��
�
���0rdU�@֖}� �ud[�Д�ͼg-�A![��j�bǞ���B=�쁗���e!�$ƶ�&��5��ůU�5L�a��&�����q�t9$B���I;�뭜�Č+��Y�[q���H ��41���Bz
��Bb���8=�\�k�K���o�2����c�8��'1�pZL����88�f�ƕx-�kW�d~$�����ȁ%^Y�'���qD(�-���A�2t�j���W�8�i]{���� ��p[3M�6ҖBB�7B�6�5�&�F'#�v1�[ȞPV��G�x�������!gF����.�䢈�u����'��d��W�5�|�l��������ڋĳ,����4�Gr-�$��T�#�΋Æ٠T9��&?G��>p��M!kMV�!��⣁ln3|*�ze���]Ňjf�<�@��*��.�n�,�G룤#al���6�c��A��$�H��w8���e���mĴ����X[
�H	��gP��8珅�#wJ{ld9��% mlҬ���36oB��6����zu.�A�� kh=Y�=sI�h��Nm�d�m���%����š��;�$(�R��\����¨�������d噐�)�N;����)�r���q�wL\�Ob8�-Ȑ��!Ą�s�,V4�e�� |R*�1�8�脎������q/��� G��z<�^�xU��Z#�5��U��+�J����E)YC�HD�e%�=�~H�h��y���Wev Ɉ�Z�A�nYi�~:����I���-�^i�is O
�j�A�N�]�/��Y@Τ(�D�bòIY�_\q�y5�2�fآd�a�NȹAB@χ!����5������JJ�$KҨ]��SS� ��.��]2���k�oZ\ ɩ@j ���u��{���$�)F�>�[E|���Hs3�G��1�"EԺ�"V3ȅ0����a%j�3b*��W�B�S�AZ6���^�r�$)Z��c��"�<L9X�s�� "P�R�e�|�	�u&PK�τj���k��w�R^/S��-��[��As���$�x�����2��!��R�@ާ�m!�T86=hs$��$�̵��>��2w�
�#�?�"�ͫV�=��e��`�hǪq!�{�2�L��3��ٯ��i3�JM�k	4¢`ړ��3�g�-a
Ň���{�x-d˰F��Hy$��&����z\!�BH��V�\�rT7Mڱ�#�~ɒ��#?�J�D
���1vY��@R]٨d\ؒvS!}_k��
�s��ǻN��vL���� ��0HCV�5�eD�D
�+ُ2�������ʹ!$^��ԖE��@�p������Yⵐ'��j�4�%}_���5��:��	s!�	�`�o-T�9�!��z%l�¥"���t&����nw�F�)2\E���4�O�b�tK/�v�\���2��N��	��'�Ik���p��\ם�$a�1xm���Ao�]o���h [J�c��1+�2`P�)��Q�3��A��x�З�: dp(�#��~�<��*Ȇh�Hw$�ƩЅ�LF��yb�ق��U�.�CZD��.�f\O�T�g\�nh��:���QL�`q�3.��6��7�����u�z������U���1B�\YX�� ;�kg�j��`��:�	d���~0�ð����,X���̀�u$+ɂ2aXM�Ba�����@v�p\��U�j=���uзS�0r��������f�BS���U��8����iwm�1�MiP�]�bC�k�'`��EfY/l�i?,x~�(ʉ`��e�v .�{����z�r~�2�d�I�	Vy$���E�=`�U�� Kp�Q]�$̑@��o��U�� k���-\d5.d6�l�0	f����3�p�6�����f�}$�1n�aTI'�@�05��vODo���	��&��d��0�Y�&� &K���x*���!�m�n�<MpD��5a�d�l��i)H�`K����Qrb��Ʊj"â���3j��C�����3��
��.%s�c��y�%�=$#�/\���z.�:��w�$�+���{�ny�u�2��#�����a�2&pYX|1������.�$n��g�u��딗���2�a1? zZX�`Ӱzf�Bq�
�����)Y�Y�s9 ͽ����ͦN�a��9hXx~�r {�-�~T�k��1�j��tP�	�L��' ��s� gMJ��T��#�\��$�t�XF����֘q#	�x���@�(l�s&�Q��d�HR5��¨n��tDFD��W}7�U"|���@6��+/��(�.ȑ$찦ǃ��ꕷ��}��t��\7�5�c0����� 2蕈c��G9bQ{�����s� �<�Xl��H gC,*0���� �)�
̮���8 ZH����=%�{48搹&,�M��@ޣ�1�,<qhp��
�����e!T�z�fŃB��g�c���Q�֨L�B��щE��෤�un���� ���!�q�2h��������v
�s�<5��Ց@z=1�y���d��x�T̑@�K��n\��@.�(LW����6�r�T���>���@f�D�{�X���pS������	d�MrӲ�l���ˎ=����H���XP��_�u�/���2X�B�dat��Hd�bA�̱Pق��5�^���w��py��F	�`��Ӎ�<��!�r�D2\��{�~���h!�|���lp�����c��4��&a7�    ��2v*bI�y7���B.;�d�T:�ܖ��b�)���hu�C����$wD8,�()kp���I=�����
�BɡpbHN	d#H�x�7\�Bm�5��cB����.iJ����dܪPp2�ae\U�@�աh
�/X~@�I��y�4�Z���ӺH�ӫڶb1����\��Bߘ��
�r!��=���B攓X�"+�8�̙��2����2<�V�ݵyߪ��,�͆(]������8)u���l\��@���Qz$��'ܬ9p`U(��mZe��ӛ�,"\*r>���[����%98Vy��lf�z���+�q,��ތ�Wȸ���@�f`��Ӻ������+d�52��DøB��\)8)�Ӑ��`�(��l�z\�"���4G���b������;�S8���$w$�^e����v-dA�
,�7���eKc� ���d03(�7�b\��@�q8�=�>G���q1'^k�:!�Q8��q�:�ߖ)�B�>.�A�҄�:��H�n!��[��!�#�x��*�WS�X���3���I�:��gs$�����G����q	i���N�^�c�ځ�$^���夎�|�!�I�o��Z��C|Hz�v	�p$�Cb�j-5pQ	d)	���$��=�����8���^��`��z�f�-��������E�Mr@S��D7p����3�Z��ir<�p��Z�|$w�	�$�gK�m�2�x��8�i� �!�V�c��i9 Ztq�<��-�R���OӸ�8x�kVo}����q��H���F}>�t+ ��)ґpI�8�;p�)�������f/��ʕwrI���)RT�<=�n^"wl�fhNW�vMO���'R��0�]���Ǔ:�=��J���4���#�{�W��֜�`�i��%�L��M��B
3Jқ�Ȇ/��}u�/��h�3��_b�xq~���_}�[��W'g?���o���<�Y=�	��?���f��o���^��]��~��ӇO�������[�����OW�O����O?E���$���o1�a��_�~��!_]_��'%������Z9��$��o�Ð�j����"J��k(�����j�Q�
�؄����oW:�K�'q� ��r�]�JOD�� qlA����������cS@� �T�qȼ2�c���	j?��u��`�!<���g1��9�����.��ESzWLW�vM��i5 �_�jI~K�ȀF��i��8{�֜ZF�SK�ID�.��+��Բ��ZF�(�I��aS�{�e�ԢlAj�M���._�����V�1�㏑L\
��Cg��Z�L��Lba���O�P�!8�g��P��PjY~�@\\ �?���$����RC���M��t7����;��ߜ_?n+�iĦ4Җ���P�=qT�mEݲ�6Ƌk��)~�_}�\|J.L�+l`������VtI����U�n �?����+1�V*|a��|8�R�����R�����Gr�����Uee�Pr̾T�eD�����N��}��:Gt�m������˫���e�BJ���c�����w��w�@����ן~��)�/��sZ��?���[�����U�y�ϋ�k�p;�w���4�����+z��"����E�����1�#�Ȋ�Zd��<� �a�F8��1�����/0p����bY����I�ؒ�[�п���Kf�D$ic5�'$�yNg)*�n*�em�㇜�O�Nʓ�g�Ѥ�z�9Mm�������f4�@��Ev�U�ͩe����f�%NG�.YŬ޹���I,|,�H�"���t�KF/O�>�ww߾|�z{��>��~<9[��ʩ[WBqpNS&�6.��^����:y�n�t)��V`	���U�6��b��T��$պ������W�j�{�ªHI���9������^�(居��a�-y@-����i&̣�uz�֜Z��S�k���u���֜Z��[��Wp�8�ć��+�P��S+���K�20˸}���%彜�$#����H7����]���NriJbɌD��&�_���Z��S�~[�Fb0N�� �ji}O-\ɔ���-N�Wjͩe��ykM8��Po"{��7��R~bҸ�0K"-��*���RK�;j9"��$�gĨW{����w��D��jC�8pރ9���
#(���-S۝���o>��˟�/���^0�wK�@�7�H���"^]�9�8�������s`�50��Z��9l ��~��$QQ^�z��-`'�&�G\���8��1P#�U�k:m^CM���%�ؑ�8�aLl�x�֌Z�>`1	�����I��R�{���2�hL���	xH-s��$eX	 ��0�1mj�/�4�Q}�g���_-(�>�h
|�~�����{�[�|����=��J���5a2��#��'g7_7���7�v��w�!��%��"ڳ����5���;�!ݟf#�̓���6�pE�h��$I�)1�������I,����W����^�F��={CmN�+�ہu�^�/�@�!�aB0�g�}}��I�V7�e7�:�$��^��;}���,w�o��;y���EZ��������â(�-رZ��9�ݏ�O�0��J����ҟz���|��7�4�+�[c���[���*��ؤ��,6�GA������r�ќ�i�xp4I�k�,�Σ	"�
��Q���mE�L0M��U̵�V��  e�I���7�RkF-#突H��/G	��ӈ1(+��P�I34�:)*���a"�����J�7�[g�4�y��Q'�Ѽ�Dy7��Qt������4 T8�*m����0bW2�,7cd��,^2	@b$YwD��,>,V���9�DbݯTQ�0iR1��He��R�?��`t�&X��Sx,�@���&�O$45UK>,�x��Űy4��t��X��Sa}4����K����N��y����ʺ��{&��B�r$Q`J2�<.�4�S���*'$���#��A��0F�h�%
#36��2�MJ����� ��X�d��J��r\�{j�CWS5���lnb�9q���z<sᜑ�A�G�۶��B[x�o#*d�_9�~������x1���l{Ǹ%�� [ �]0�����O�DH,�՜����h��oOLm�F��'��X��eJ*>�"�zh*X�E9�c*����j�*��w(��z��[�d�خ�<��7{}�?�������Z�u1a;O �B�+�a�m�T3̞������`潘�,�1���0�m���`LT�E���U�����|[��x|j`9u�7�B�)8�ݞo�hN 	?7��9��l8բ�\eխ&,��`T���D�kZt�@�u���Y-.�Z������y,��226���X0�mEqп5��7�1�:H\<�d#ꂬ�}yª�AP+:���κ`J��8��
��k�5��M�KJ%ٜ �_Q�850�5���(X�n�3}T�$o�rTH��BD���P���s�|�DX\4�JCk'1���`��L��D���'%�}"c::������Ps,t6��w0Kw�;؏�%��6V�!7��s����h������d�+�vֹjJ�hC�f��[TD�����=�����|d�k0'�!TP�}�q	rxé<$�3�{�H���B�AM�[\綘q�.�_赎����'ّ}�)fA�8>$Pc��F
��U�A�u�������y��ȼ����&7������`����:�YuY׏�tl��,㈶��{�2w.9�m��1xT����m���MN	}:J��ȱ��'��e�x��%�J�$=�@d�x�ϝT��Z�h���2�	
q�G�+;�ƁMlk1�_ܶi0GA��Ie9��j0'��Z3�hX5�3bF��ndۦ�\a�y��2��b���Xs�^�#�g�8(���ؑ��]Wg+}$�,'G�u��~準h���~̀����#�O2�)<� �	�֕�x�ن�Sx�Qzd���$Z�    KҼM{�f�H���Z֫�9�� jY�:1� ���:ÙxH��D��Z�\'��q�h�-nC6�##
K-چl0�ܦT�Qdb`��`�z�Dg~g�:��n4�uUgنtf�1�ظ�r`�7Ŭ�#�v�c���w��\+.QƆ0r�C�YD�y]gG�W6���8���̎�*�I(����r#%��L8�����91�NQrC�{��&����,g�v�2�w��j:�>P	�B��r4��!�T���b�oVu~�-�����7Ü�[�Dg�TeK8n� 5�I��H�m���711�)|^�V�a�����
~ܺ������Nyܺ�ftƚ��m�N�a�XYb�7_	�0�,P�gfU��f��$4�O��XZ7��Ǆ5�|`�Yc�)�6X3��h0N�G��66��"7�lHԿN�x,r�qB)�|�7�|8��.���VH�"7'��X��al�~�)�]��cG'�}"͓1�z��18X,�\�����>Ѵ�����ڦ.}�$���Xm����1?�'Qb�-y`�k0�BD�����N4,��O68}H�s�6���N&V?�ˬ�֋�D-fC<rh0�l�4���5I�m�҂݋=�4ҁm����P���ȶʹ*��qʊ�m����b7�3Il�4���#�7ϮE�4�A�Z;��X�5���4�/|������ӻk���!��ȺstD�����c�u��7���Ⱥl����2�7�y4Ő���V�8���b�4u���^�gۢ��%H՚�uA��{Z�Kҁ�"�<��N_\���t"ks�� �A��rܳԜ��ƻ:U��YI�T������N��g��|�TW�	,8�ؗ�+W���� o�-�c�$���t��>3�.aпБl�5�=�Yc<�ґ��sȤ��w�����s,����X�c�T��ܖ3�����c�\pt��F��7����^ii��Zq���m��3�;:����,3|`�<�����G�������\���IR��/7�%�Rk��X>7�51UW0J;�|n0omQ;�|n0×:`��N�n����45>oh8��ߏ9:Rp�AH���s���+O��4I�E��y�w��=��h��97�'�\�$�L$+dٳ�ٞ��;-���B�/�M1{�8�����A����^��Y����';��s� 
rq���Im����6d�Y f��UC���_��,��b�ېf�	�8��j�N��=}�1��w��#���	�:�
>��`���5<�f�6d�ف݋�<\���kC6�AJ�Id�Vܯ&o0���s)ŁuJ����/̍�S̉��CoO�~uJ���R��Ι!�)���DZ�9g�:e�;�K!�b�jHn`�2��#֐[ѹud�:���2��N@�f`��`�	/NOqq`��`��Z��:'"?۷�ǌ=>��Z&Ԑ��>1�-�^�Z���2ZE�
�a�XJC����K��=��%�au�s,�M;~dݸ���Z�^��=�^vNX�
A_j���CR݃�,(W]�|��թ�E�,K�aNDbO�5b�XJ�9$�k�E�q�U�0ǌ��j,e���3̙�q;����9�ag�=߯�� �̶��g�vo��	���R�k��i"��N���Di\���,	��0p>��,%�u�۽-f%��y�\7�b֒��˼��دl0�N�I������Dbn�	;p�Z��	�p^����\���`�+Sg��<�l0C(~�흁�_=8���Q�kw}��Z�I��?����Ճ�q8�%I3�l0x�����M��a�1'Եu^�r���g%(�h��V����R�;��ki #��̪�|l���\�7��=�v�%`����80�5�q�q�C���4'����y��~��-�H�`:�&�CFi�`��1�s$��|���ն�M$*a�B��{|Z�`�Z[g�9���`v�D���E��j0Q{ە�����5cm3x�D�9�k=[��������(7��j\[}���r$we:*��m1�@\D�"��1�)�L��΂�#��f�ֵ�{���3�ܑ�;�@wˁuw�YxB��6���Z��y���9��`V캺;/</�Ŭ1X��-��3F&̟�d��Ӿь1X�K~���7���DYw7��#��6V������z�w��ݯ�n0'�/��|>L����<aB�7��ց�X����1���0�wY����_�/���V������ӓ��_n1���<^c�5m�ϳ,�{��?���X}�&TaSN���͓$��ב�!��'	c��>�zs�]�&�	����'�W��7��sa����h�-B�1+6��Q��BER�3�$X���[�i`Ťi6`AR¥�>nL�lN����L��Sb	���>���l"j@�s��^,��S����7�����.���ԟ�~����R#�T���Ir=�E�������X�f���*rr_���� �,`�r���֤R�J�m�O½���䰋�r�wa�懢�S�`?g6wv'$ ��-ic�	��8��-Ҽ�/�PJ�{x*�H��:ג��1N�tr�z{vr�,)�Q��H�g��9`�A��$�w��Sq���6o\R��r`b�R�彍;���B�c���X����1�S�{����.\�'A�J�֐B��"�9cA�W�/��lc��`�-�Zwe�}����@����,TY	�B�"K�h�PVn�{KyO���t4�C��)���3[qf��0�B�	��q�b�h����/�X���^I����1�_�?��}�;uyy���#-ka�)�B�yR Fa���C_�9��О��B�D�X뙡Ao�#�������� Y&�CJi~�+L~/�(
~���r��:9�y�|k�o����9OX}s<KoV����O?aa��.�o?���ç���zr�u�-�n�W�������꧟�?��q}����?!%/���n�C���8�OJ@<zG-9��������ͣfV1��-��x0|�_z�5�v�ѩuh�:�������	^=D��ОU����I丬#��b�hz�m�Ⱥ��Y,���
�7��Ѫ�:��|����p%��S�n�0O�]Ӏ��V�E(�0w���SZu?g��=x�e^���])� ���D.v���Im��b�u��JM��R�Y*�f�!�������/ 9N�vL�C�����3[s�hP���o���i���Ꮤ�=�K/V��#p$Ny�Kb�������ۏ'gpaѻYb�>&�6Vhj_H� F9�����	p���S����B��zʆd�n�Š�#�"�C�5��zM��=��;�n�N'�$p�N������Ðe6YYSw�g|R*y΃�QR-�4P�(�>��0=�j���K~neskZ<R���]]�C��H��/��)�uS/V��Z׼�؛#�)C�6(�� 杈�&\`8
�'컠TGʸ�G��x���� ۩�i��4��ܑaMOf}�;˒�� ��Ҟ ���(1���?��)�Nڠ���U����{P�gM�)���Ϫ�?������x�ك�k%ਲ਼�`.�����Q�.�3c��^�Q�.`� ��:j:��UĬ���/ �;w�f�M�����v�f����uV��:��=�ޗQg�?�bX����G�����'��܍,󠵛0{�G��~�����&	mu�b`�m���#���_����	7$b &�0��n0�DT-��������l$�s�p�۸�{��0���&]�������z.�L���������)���fx�{�j����{'-*,� 6K6��n0�Lf��v`��`���G���~��Fh�`�*7��ǂ�;�kъ����cN �HA�!w_ј���q�d���,'�J��ĝc�dJ5
P,Mϴ����hً��~�h�kN���)�!�D|��yf�K{��D�'��KfIu���=R@+��7����T��x����6NZ9��`�%�R�Qa`?���{=�4�t��5�q��F��m0    ��+e�2~`?��l��"	���{�~��S���8^��:��Տk1�H�AO�w�߫�b�������~\�lHt�����Z�Y�kA�7��q-�bIB�0�=��n03����Κ2��n1�o�`*e\�m��`DK�������[�`5��xg,e���Ŭ��A����d]���(Xw7��'��[�Ο��='.�o�BXw7��'B�c����s����*�uw�9[\��u~��[��l1c)5bV�#��"i�kظ��3Ĩ:3K�c��92�ox�c#�$�ՇY�:	��
'l̟>�b�/�ĺ�2�2D[j��B��@���u���i�����A?^�gu�+n���:�J���M�A�-�g��a���o�MVa���J5�KI�7�P\.%�.�p41O:�O*��#�@ZBj�U�<X#�RiyT���4G�ҵ2?YX�Tz:9lp&�<�v��>]�/�Y�ͩ��}��Y�B
O<�V .����O5����jf��l}v��W�|�������F8�T�1���37��]���B5�f�m�"�ŪNY�h;���U��d�;�R��Nو#�(�!�|�L��#j]h�L
i6�d�:�h�&�-	�;T��W�8�H����܏�C��p�R(zo���Pk��B5�b�t ���~0�o+�5,�(�,��s�çͳ}�A�'����̓�^@-��^{q�޺�{�;���G���+�1g(�G!��a���74w�\J��O���>��n4x���������Y��r�Q�}�"Lq�R�ug٨�|�Y��d���gN�e_u��#�W[�4+�:�5�W�h��+�J;�W��qsH0y=���)�ݻ}�8I��4Ŗ��jR;�k�;"<�^�A��g�3%ļ��⩐�1�A7f+�D�,I�l�B���0����E;��1�7:D}<Rp�N�T��(s`Q����a����Daǵ5���X���Z��E��pX�ޢ�Ey�k���Ϛ�e=[��I�������okl�����z�A�~nO/˞��3�΃������Y��H�Y.2}H�;��8�ƺ�y�C��5?��3� M8�4<cqت��	8�5¨U/3�`����ǝ0Ü"����V��0�BV`��Z���C�YPN���
놭z�afj]�璍�V��0sK$��<���e�ԡ�U\��z�a�>)ԙEzت�fW����z�a6%��s��~uw��*l?�뵩�����(������O1�@h�*.�������+�����3nҨ���<��n0�|6�eh���s��ehXwO1Kj�v��t`��`f��u���uw���淶��u��b�AԸN�a�?g��0�[��{ꀘ5'�N:�[�9�l�upsP�X0[KlƘL2n��c��\,��Zf�@K]�!u9L�q'�r��x��We��)a��g=fՙ�ʢXR6�]s
�{��Yh�O�Ob8[3ʆ�=G��(\���d:�C/����>��G��1����:(I�1��{&|U�	D�FM��Z�\0��E���f���<��	���K�)f���y�U�C�%��q�!f�63n\���$Q��{�K4����h���b�%���^�U��h0�/S�L�8.�`�C��E�K4�� :ש�z�´�RS��i�i�3�̮o�u|�z�3��T'��Sh0�DD�g�"Xw7���H���9�3���Oݻ�\�g�k�����������hV�в��_[�KUD���^?))�T�UJ��kJ���9���03w{ͬd��`�`�͘�TawH�+
�݌�6�Z{L�s�}w�2W������s#�Rܞ�<�n��ɧ�}s��`�͘GU1����݌y���nK����Ig:w�7g��0��FF'wrv�����%١:$q���f�y�~>�$�~�1#��;��S��g%���h���]�LL!���>�9S̏u�5�Ϲ�=gn��V�ŋ�݄rJV��v�&z��J_�R��s7�z�4�7/���=�4�
�����"�_P��ku�	�yW����[i�,w�J>�=��~�g���h'R�Y�6��d
2�)}x�3g54�:��Nj���0fړ��
g���0f� ��7�.���1{��=�����?�9d�"��-�������=���'���3#��p��:ɽ�����w�wx�y��g����\(r�8s�J���w��?�y������o����3+�7��2�����"�J�)t5�ɝ>��7hJ{7r}7gFfA�$�wsf���ԧ��{}7c�Q�׍�)��n�L1Қ�#�:�݌���}��!��s�d��A�V�^�}��(Ũlq��{}7c�IE�V��`�͘;^��S�Un�3h���3��<����\m�r� ��j�����f3(��Fn�^k+0�`m݅ӏa�Yy�M+��Wэy��ҨiGﾍ��q�4vGP[��δ=4�����u��<��SNtq��;�S�M'���ٚ��]����b]������P�jh���k��_�;X�h(BK�s'a7����/R��{�eN1Kl����ϬW�Hy�J�!ڹ���}_T����AF�źK#�I�B��J��0���L��z{�M^����x�ft�GÎU�V��?i�])|ފc�Nmw=wL�M1̩_� ���ڙz�J��}'���xu�g�ƕG�����*�y�3�0Զ�ւ�s޼C����l98h�(*�>�T̴95�6뭹r�-iW�OT��t �`w7�:*��OʯE�)���[|��KV)P���3�GLR���٪'��� ����N��hũ�l�X��}v�?VT�+�:� WwXwcb��㕙6���zx�ycb��0�*����IL�3��"�W.�JML�3w���a�Ӎ��wf:}��܇����+�ft�R�o�P��j$*VT��l�n�ٰR�Ĝ���^��S�R���ީ�KI��qoLL�3��qǩU��f̱��n�=��3�H*��}�3}Il�)C6�}7c����GKj���17z����HF���W�^�K0:ѧ(�w3���0�Y���}7c�K��> ޸�w_��vjY��:x���1�����y��nƌ�(�я�Q�@��M0z�o��ɌƸY��R:�\��ё����}
sJ0�+8���W��Μ�*h���uOa.[B(���]ޙQ��њ�R�.�̝NDy7��)�<���S)T�:ς~��Z��
���k(���ra�ƫ:�`���M�3{�"�^:[y����m��e?�P��|���$���H�1����Ck��U:��o���7+���J�d�Sv�k�CV�[Q��7��a� т�EC��p�Љ����؏�E�1��c�u\r�39s��`�q���39s#�j�n����grf�}G󦖓�{�əG��w+��\$g�]��f�zh����y-:�"�I)˽�d��Xe0*�bH��Hg��������Erf?��bvߖ��L�L_�v��U/�>�3��e�gְ�`�͘s�P�/[�`�͘ˠx{�f��n�ܴ�u�Q��vWf�p��UOs���n�<�ZxPb�}7c�Iu\7��`�͘�$1���S��2oe��U��"9�Y������>���3�M��c�{}7c�^h�j�Mn^�]kAzH*b`|9��̱Rd�1G�����i(���M�f
j���0J������)��#e�����{cx+7Gƙ{V3�v�I�͑q�YT�w_#�E�k]I_]���M�	^�+��K%4�n��y=�l��s�׵�f^��YɹH��3m@����@�`�:�����s@��%�'
��4Qb�7�5]_v�^���e�%s����s�ך�і�;"��ȯ�'��N�_�����#�{|�4�]��c̣�ABdp����U|տ�O]�1_Mf���p�d�ݞE9��|�J���.h��ƌyy5� �~x7x��y�E�D�����ޘ1S�g�٧&���Z2���
����7f�tzs�gV+���;s*h�琜�e���p??�|o̘S'ǃSA9d��ޘ1gt�@mE�F�1c���    ��w���-�;.N21�݌�����e�n�<��赗M\ʙ�����-z�z�+��V-�~�ɾ�1�oj�^�^�͘m"�����!�w3fW�؃RbI�}���b���-X�ь`�͘�T�b`|�Y��f����~F��f�h��?͢󧌙�<��������\�eq�Ab�?e�m�
r
�>�v�co4k�O3ō�׊wQ.��VƬ�(�w���!���o��o��ݿ�/�S�ңlxM�/����?��Ͽ#g�������姟��G������~�'�������?�����㏸K��?Ͽ�����O���~��������_����/�������/?���?������������'���}�������g��AK���jue-T�}N���+3}��� ��rҾ3[�R�-rh�)����wc���OYg�dz��Zn��3�F�
c��S�ɲU����^n�ٛ+sF_w�����8sqj���z�:ר��>�x�:�U��7m��d&ϙ'�5�ݝ��N���9|3ٕ�Y�-��u�N�߫D`k`tWf�0��H�E�TU@k�_O��蜸���{�����<�l��}3�p�m�U�mJ(�3W�R�SB��@���K�Dxc��� �������(�{��h�f38s�ʡ�5����f38sL*9X/���lgN�pw<���lg�C��aΙ*7����Waᆯ#7��ݕ��'Fs�M��lg�[TV��nǷf38�5�}ߤ���L�kg�g�r���R��r�'����,2[=1�`�͘�U���[�n��)v��[���_�T*�O����1�9R����(F���1��;:��w������m�p�&�w3��N!F�}7cF=���{�s/���]Q��<�Ҿ!w��ܬ�Wfz�~�'��y�����������sfp�s}�E�NL��Yp'l��0�:�ɚ�)�~����jk��e��*����	��̙�{-��F�:�+sN��۶�3c.�3�7��w��<5c�X��������P$�c֦ޛ�e�t
�vۺ��|���z�>μ1�U@G�fs|���~�p��te6ųx۝d= cv蚼-�����<g�K��Itt��Q��y��]��4tS��;f#���wk�T��5���櫣��wg�3��N�~��t�wc�����&�UoS�_����zwjE�3}?��lܞ�;k�pg�Ą3��a`̸�xM�\�5��|Mu��c	΃\�)�Q��J?̑ݛa����%�V)ݛa̶���Q-�$8)
��2�Aʕ9e��/UVݞa�ѫ��x����y�L���	;�>�As�����a���<cF��p��V�s�jl��G�3�u��>_M���1��Ǝ7����Z�fQ�*����nμ�9��
�2�h��f+�s��9�u�-v�����V�͙]R6�	'���[}7g�U��EU����a��:�$�g&Ҿ�g]�\=@���D���I��0�4�u���ݭ���I\��o������p��p��Tٝݧ�Oa&���A��`�I50�"�*��{��h$Sȧ4L��K�:3f�1�n�䧬3}��}��<͛3O�:�hH�)�w2ig���<5gN�h��:�ro��3�"jZ8��ޛ��� �W�x�fõF#5���tr�3c�C�GG���3c�b�����nܻ��$?;��9���Y[�1��2>'w|�L�FE�[j^�"�5�B�6��i���+:�}�߫	�ZzU(8a�t'�'%U,�P)�^���/��̹�&x�1���8���UON����\��UOYu�a������a�lݧ��w���Մ>�����83j��~��	��͙�\���K�7qfԾ����|c�^����7]k+�����3A��z;�Tpo��ʌ��ڼ�~��N��힖C��f��2=V��C
��͙}Sn��S킻ws�0Ui��컯u
%
𐋌:�݌9qg�Q`!�w3�UHk߀H�݌�N�e:ɾ�1�꘶uD��[��݌yX�v�V_������qc-�}7c^YՁ	TzH֊\�d�nD�).ɾ�1��©�I֊0f��/�Y���3����՜{
s O�����u�9%�V�t��)̹��p'N��ޮ�`̸��lr<-$\k4:7ԕ�X�`c�����k�$�b_=H�Cֹi�ʾ���?d����w��Y��ͺ�lE6��d`3_k��A���&8�Θ�R}���)x�gFohr��Fpn�1���C?��$��s��EL�Krn�1�	?��U��)� ���ښ���w��^��F��Z�Z;�r�8�F]徃�yv��C���w�1#���#���sr���Ө�oRJs"g�t�u���0496z��o�{59�7�a�"�u���1]�6[�U�D�~AR�"�ҭ����ʿ&ǜ�(蓆�k��O]uGk��i�f����a-|�hM�sT�n���r�z��ә��=��ܼg���޽p�ܼgNV����]n^�3�4r��N��gFwDQ�x/7���݁�ݷ0&�y=Όj��̒��83�*B(8��}�9�D/\�����̋Vw�{�V����$O��׫q5���1[���Z#xM��<��h��ͩ5�݌9T�u��Y��8���{��]^��f��u��ݣU���3����8����w3�p��MY��f��IRCx8��y���<g*�޵�
�AÙia|�w�K��8�L'��q��{Uݪoa�K�.ȃ�^��l�*cϝ�Z���3ہ"�ӽ�̞��.O/X��'���Q^�v��s�'{>�XE�V�3��V��k����y��lMN|�:Wz��M����u��`�JmQ�&�3����V��-��<贌�٧$W���	�H:t�z�x�yfM���v���Y?��3Y8m�峇��{� ��V��>f�X�z �L1�@���z��éb~��V[�v�1G��_w�-=�nd����݃l7�d�ͱ�v����$��Qgl73������
��yP����u�9Z�cf��J�&4׃��7j�Jk�O��gh�l76���
e���>�5@U�|�#?�_��K��w��7�p
���[�����w�1�@�{W����V�<�xd��g�z�j@q֎�]�}ST�5G�׏�>q�Aq/�{�Kp��1'��H��󧌙b�]�ۼ��?e�%)����͟2f�:�A,16��S�ܦ���[�1r�I_��%k��ŰAn��3�;^z��(8ʙWV�m��$7ʘ��]�7����O9��3��%Nn��3SL�1���9��n��1���-��9sH�>��!�w'se��]؝#sr}7gNCy���9�k��9s^j�i�m	�݌�����,�w3�{	�nB�}7c��e��l�e���1Os�>���U�yE5rd9,���R��Nΰ#	�řQ���\�z
�s�O�h�����uD��g�B����2������#���)�g8���L�7�g��G�ܕ���j���d�jr8s��wD�맬3E��ME7����pJ��=�n�q�U��F�=�yq�j��]Ř��JkܙO+X�ę)F�	��<�\C�Wf�Q��;�\g�x����pf̭Ό�>�@�*W���)\m���f�9s��S�����5�ۅ�.1
�u��5r@�����w��;��{�qf�7�镟Z��c�+��q� Z���2�TǼ�:�l��Y*j\��3��oל�3�2v]v�]d��(��4j������G����!��,��䌅F }'�'E�w���̽j��_�U�S�RN�wc�N���g*�$�zҖ_�_�w�)NXs����n��2t𹥛�֘�1w��mBvIp��1����� 3	�S3f�v-��i��{�Ԍ��d�S���I�:�����=f���2G=(�F�����f���9?�}�]p��1;X�=�pN߽yj���s��<�3Sw?�:��<5c�t*ؽ�z<7�3��ڞ��컯��Љ����3�m[��̲�n��2�g|��Z��f̽)�f9�7��193�զ}��`�͘�,�_�0:
��W椽J7Ma    V���1�D���mIև_���Ս[�c�`�͘������]��f������F�z-���	1���)�)+_�O�g�q�� M�b)��0S:�θ�ܙޮ�b��*owm��r���!�����S�rd�j�83�,o}���>q���;ן��Y[r\x۵d�g6QՎA�!E�z-�L1R�|���-���&1oC�ru�1R\;2��.��!Gz�cG�F��]pf�y��-�
��ř1!a[��\�g.c?�aЂu��"�<w>�f�3wKGf��(z����ë�[�������y&2x�cӂ��F#��J�ʈ�9}7��+s��fi�}�83��Z�bfl���j�z#L'�>3潋�Z�	�ό9Tew?ݳ`�̘�$?��{�m�9si�u{���/.-7[q��<�ōB��>G���|��/_k>
���_����乕1h��C���|U��_@���=���;�1/ķ�y���>��n������]�^i������`$5�ٝS�Gk�ޘ�*;�f�������V5#xVf��VT��������pfo���?�PGt��3��F��Ӑ��̱���)X���5f��"W����zڜgWݪ��7$�����z �ܢZan�r�����Jz���M��3S���)�K�݌auFdS�`>cnڡl`�S��ʙ�Wq?Qsس�^�͘]"&�n��`�͘}UZ�}�<�:_k4����FV��3�G4fI�b��9s�_��}��s	������n�\��[��`-gn]��<u��uq��̜�>���0O���q]��������s7 ����:�l��~q���;�u�G3�>��v����,xV&g���v��$y�#g�Ӊ���u�o�IZ}4OYgZ��a��6���]k4v�=�֟iE>��:\B�9� ߬a�-����<��r�V�1����	��߬ạ�f�h%k�3����M^p�8�<��Z��qR�V�1��®��~֊\k4��j-�t�kE��ʢ�um>�ό�O5��u��l�3}�@�{�g1����1�f�?�8�]|�}f�9ѹOT�!�>3�R�
��:�Iʙ	g,�W�s��>�k�v��5tv	�qǙ�G��n=�*�8����lE���Od^]Ԓ7d
?ECu�<1��ẻ�)Q3WX���[��LƖ�)�}n�{5�|¢�:v��wz����7go�L�keΘn�=�W��c�iЋ�{�9�"ݙ:�ȡ������"��ᾡU��)�^>Z3��_������.8s����[<c�3N���y�'�V�g��v�a�ru�yD��f�I��\�����~�^p�CƼ�Pz��^���[u���E4��.
�ę)[��+>G���쓊�W�<�s}��3�¡U��]�ݺ�'�=q�8:����b����,Ap�C�\ҫ�����n�\ɪFd�h�͘q�R��s-�w3�A'��w� �w3fZ];q�s��݌yUp�[�v�}���H�
zۍ6�ne���g��>���n�첲�o���n��r[�dV��?��a���!6�h?���I����CΜɓ�f�d�?��<nD2��8��93�H9 G+�9\�;B���$�}�8�H��h,z/W�Ǚ�����C����I8w���ƸWϙjr��?�̖�g��^�S��S�5׬�;Y�9���|�7���p�U��y8��Μ�*gX[�\Mg�K,�)r59�Vy /����ݫ��̘���<��krs�jL�[��
��+��,�&�2��3c&���Z'+X�Θ1�r�mϮ	�ș�9�h�$�g�l;�ϸ��g1����1{��.UpZ���{VnH��g��K��͙��f����0s���0~�YȘ��}/Zkx
sM(<y7��k��5Zg��γџɌ��=�$��9Z�cfg�G��>f��Զ�����l�6U����T����֦��D�:n�8�?�O2J7L�l�ܬ�� ���.L��3�������z���@��g�z����������&0�7�~�6�3G�0���9�[s)�u{�Vnb�-dծ��T)Y���7f�&#�9^�;�-o�c��-����y5��6�X}g���cH�X}�3���чX}�3�����̨��[ޘ�dhSK�V���hse&����=�X}�3�=�~%h-�w�1�N.��݌�DU��Y��n�\�n�bA��f̍�~�s���݌������G�}��2O�4|J�3
�݌yEe���kI��W栋�荙��;x��f̆�(�Iɇ�|��f�v��������^�͘�S���S���9D0q%g��)��ڃ���y��]�������Oa��6��C�Y���\)�E���}
s�����7A��L�1���a����ܪ�|c��g��埲Θ����C�9j��>w�f��<��jڣI�S��q�f[UJ�~'��>�1�A{c��9�e|��鍙���Z��j�ޘ��f�e�T�j�ޘSV�욣�y�wj�ޘ)h�]\0b�Oo���:��,V�D���܆Ҩ���p2�ڧ7fr'��Z]��3c�^�{6�&�>3��n�֡O��>_��nh����`�̘�|�B:����1;�fR4{ػ�^�|��c���������1�I��=3�-���1'��Ψwhru�o�9)]v֙�0���G+>D�:�7�:�I�ɋU۽1���pkM�:_5�i���*��9�3cF��7Z�M�1s6Cu�;�،D�&l��'����/_�/~�>��m��� ��������a�'�-�Nm��˲��Q��xU&���Sv^����5�u��1����.�y�g���%�p�h�,�N��5���K�E�>�sv���W�:"�\2���sH� 3f/-��uD��N�C��,V���1�H&���[�WGĘgU�≖���j@^C��#��;cT����:"�l�Z#�d.JGĘ]Vfן�����}[�ܒ`�͘�"ӊj?$��0�dUp��������1��U���3�Hwݥ'�w�k���X�}��p�o�ݜ}�17�x]��n�<���~DM����3��a����[}7g^�tPC��\�͘+���+���3�.�9%i��iߘс� F�V��\k4��Jo[�b�����a��.��y
s2j�>9ZG�zZΌ�Cx���\fD6{��
r�Ӿ1��+s��rgͿ1��;�I�:_�� �Y�9�	^g�L1R��TV�����#i��j��!���.�[ܴ\�g�S9�1�Qk�93z�iD�mL�3�(>8���j�8s�*5��y��Wcf��}�wn=�i��՘q�<�B-L���՘q�j�E78�[�3���k:k���ό�W�P;Цu��3cF� �g��$�>3�e��x�N/�>_k����a�GX��3c6I���;�i�ό�6:wW��-N�}f�n���n��(�>3������\�i9s,��=�"��0�٤�;�{�6�3�i�=m�!X�j���:�կ�C�B�3��\ط�z	��2ެ㬾�3�ƬJ�}Ͽ�C���Vy\mT���h/ϙ]TuBg�j�n�Z3�*��#�-���讑_�^����"��ո��g��>��d��6�w@�h���/H��)�y�1�ޝǘ��,�<���O"����{�|流�z���i�~A��	��ŏ�Z�17e���"x��3YӾ�R�ܳ�\+	�phO)��2g�]�=�U-W�Ř�F%��1�]�^�1��[�9�ܪ��Z��%z���f��Z���m`�z���Z�9v�o�L��뵮��I_ס�l�P�w�^�1���k��&X�Ř�C�/��݌�Ή�A����Xd���+R�nƼ��ٳk��Uk�tV>��a��g%pfC��	��.�w3f;!�ܧ'�w3fO>e�]���n���z ?�`�͘c�=�OZ��f̩��J�s^�v�Χ�h���Uk��U3VJ8����-*;n�O�-w�93�Hu��[���1T�{^�ru˜� ̞e�N�ԟ�\5Y����7�j�934?�!S[�\0g�]ٵ�#�U�:�+3��ho4S�3c�'������-s�HL�9����?�9u�w�Ѵ`-g���A�v2Y���3רB�Z�.Xk͙�    8[5{VWr����+sJo~XE���3��br��S���1�T������n-g����ݥ6�Z>Ό;�]��47�gƌi=u�����3c��5[���]�)��s��+
�ό�b݂�q�Yp?|�L��̈E[\Ù�#w������7�g�L�V�6�g�ܫ����*U��e�<&�>� ;k�¼�p�Y]��zZ{�ZWK{O��{�/�zZ�L�A���qr����6��V&f��F�L;���S�3y��|�������萷�4����SVk׿�^����P��V����w1_4�5Pf&�zP�s����b)Pl���/_��t�6d�V�߫iw���0������F�^9�������o��N�Ӫrrwg^N���ϢF�$�4��go�g��Jhi������pa����}2��T�=��a_�[uq�9꥜���g����̖V9��8�n]���uG�zj(il�?�3��l����S�.�3�v[�� ���Q��3Q�^�.�3�"4��� WǙKU�"��S�����詛���5��8w��ݨf�<�ip�.�3��<��Z˂��sf�ػwqMI��μ&1��͟���+s2��q�f�`M;g�ITd�k��݌�U���n�L1��z ��`�}��ƈ���D��3�Hmυ9����݌�<�}��L���sfzs,�!�t���sj�����pΌ{��_+��Ȍ~q(�.���n}���':n���|s֙�������9�Y�CcF��)�����gw��j�9�Oo�^x�)Wk͙C�0����@��u�e��ua<e������i�\}����(4R�#����)̵��w����н�IΌ��ږ����#*��Mvg=���Lr�Y(F���Q����̋N�O4w-W3ɘ��xq��A�f��+��AwQ�>�^�$g���V�v����9x�N��lz����1Ǥ��&g�!�>3�T)<�:�R�gƜ����X��3c�8��Nf��H7�g��<�A�,�\����=�ܮ�6��3cƝ���v���1D�8ř��ŷ��s�Y��{���f�U�Q��߫��v����ʕ�j�9�w��B�.���W�P�HX�k�9s*���D�JLƜ�
荐m�ß3��4��V�=�93�3��k=�c��wj��D�Oy�S�h5�>��I���|�-�w1_�t�f�Z�T}�k��	��������b�kt�|��k��/wy��ޏ��~��u��f;���R����Sv^2��T��٪'MG�����U����h���7?U]�С珮xc���-Վ)Wș3�cvk���?��ը��W�S���3C�����\�!g���1�2Y���3��j�_flr���y55Pk�֡��V�!c�z�����ѷ��U�߭W�<[t�k83�V�w�'����Ⳇ����b�����h�5g�����$@Ð[\;��i[���	�}�U��T��R\�3�������n�Lg��ֶ�S��f̫�r7m��l�0�ճ����nƌ�5�;��`�͘�.�=��G�����(go��yR��n��jm��M�{�s�TU,�wH�1�y*����ru���Z���E��)+�7����[�ϙ{�����p�#�s��Pmg/l-r5�������%e��v�<�Wn��Ͱ�!�<MR�옿ק��mh����ru��w,z֧�3���#�r��r�����ފ��-����jS93�HM�`j����U�>w���$�	֦r�j�Bk�^�6�3ӚD�{�r���Vm*g���oik
֦r��)���h��զr�Ԋ;o�%��+��N�W�;Y����_&*�>R�%���1�.�}����ό�u�]��jH�ό�/���si���1G�t��p!
�ό9E
�wԻ�`�̘sU��՛!W�ϙ�|����մ/z�C�ќ���W�̙;�>�*�L�v�n�3��fte�[�̳)�v/����9�a���w�W�|en���U&�U�rf(3�O�z��h�e,���
������%�!�n0fz��hUk�v�1'�Bq����Ɯ�
h���Y���c.U�H=������s�>U��1�J�ј1̱fq%4�h�6h_'�����h�r]���MD����8�>��
���!��
�����{
b^�;�1��B�8�(2�O*ʥ����3W�t߳2��	(��j���`̖����^(Y�Γ1����ص!X�ɘ)��k�Rf��d�p��IQ�<߁3'�b�S�:Ϡ��9����C���:O�\�G"�$7l��<93�Zh��8��y�Γ3#A��j��ќyd�4�RPp/V�ə�*w���%W�ə��0��q�\�.���֮Z�>��ݜ����}�w���߂Y�5�.�ws�U�~�aV���1�k��8Q�݌�8
5�.�v�͘�9��O���ݖ1/5��,~sVB�CW��e�o���ș��-��[.I����������l?�?���Z7*�=�谴�ް�12�Ϟ1�RnX���B��Ӻ��O��0��}���-��̆�P��
�?�#�1>1�&x�g��W0��3�+s���]F9��p�XU�E�J�-�9Ԑ��mMnYg&�:ʖ�'���3רz�����s��w�Q3���é�vi�NrK1��2�-\/�-?���Zzd�\y2g��S�̰�,W�̙)���5�#˕'sf?^қ���+O��D2����7�����;m��W7#W�̙sV�}��"W�̙�&u�%YS�<�3����l�3��^�]*'�>3���x}�l��*l�aN�}�2]н�i�����l�Z��v�S�}f���ǂ�O}6��f�̘�Wn�bؔ�g��rH����R�Ln[o���a�?�Fs�ɕ�s�B�i@�����U��T�����2p������,�̴M�]�8�r��3����WÌre���"��˂k<��1GcUB��^�ϰ�"?�Ԟ����Un�R���I��c�(��N��3�}��`�1�Q���eg����v�Xj��93�N,Z[�8�S�+A��j���l����V���o,Ӊ�5S�L�U���|p(n�����2�p�z':�Z'�xV0�t��Da���ނ���=��x�;�1۬����l�-ş;��
�O\u�U��ՎM��=�}��խ�y�gF�	���d/X�˘��ުr(]�W�˘)�P�T{�Z�n�o���S2��=r�P�u�ԗ3g�{X�S�ԗ3��Ǌ<�,�������Ѝ�2��: �ED<J�3��<�d��r���y��C�0g�i93���]�vI��6^��٠�V@孾�3#6{Ey�%���n�L~�Ծ�-.��̞�3F���`�͘�Sc���I��f�)���M��	�݌9w2Ͱ�6&����GIID���U��f��<|
ٺ&�w3�N;�Hws*���1����%����G]I��ʭ+a�E�W�ړ~
�����)���3;��.��Cf�j�iS��B�9�ܺ�Lk�ҷ����Z�7����LKd�ַd��0��D��i��>e�)�5����N�׹�>#�ۼ�$��/�R\m�s�)����񡝓���̫���\Dk�sՃNq���1��Zsfk�7~7�r�֜������Z�֚3ӹ�/�uzY�Zk��
S��[-Wk�:��(���M��~�Wk͙3��=Z��.�>3�RT����|l�3�}�J%
�ό������Z�<�98���g�<��.��.�V�17mȪ�_��Q*�Z;�LP�B�ߣ�QW����T���P�֕pf7Uڪ�x��3��λ�r��v���l��մs�TUAR%ǰ�j�9s��n%�Zr5��Z;@�+z�8[�f�j�9sC��+X�Ι{U#!V�(�<&��x����� ("ÛsV�|�ݸ2w��;7��C�F7t�B�Tm�����F�]���y�.�n\����8w�[WCP&��zx
s�d�02��)�"�3���^���S��y��jC�ϩA8g&�����?����樹�-�Kui}��%㮪8	}��9����N�B�Nqgc�铪rqw�27�y��pIL��(x�]��ItBF�ב%�O�*T�C)��pن    ���e��<ҽ[�:>���y�r�%�)X�̘�@���\sę}R�� :@-��e�L���ڮ����[N�ځ�!|sG�i��-sf��@�Xg
ru˜�$�_5t���-sfz�7�%g'W�̙�T���5I�n�3KK�����[��3����$+W�̙)���9���b}w��;L�^n��E�h �l�i������qf^���Ip�g&�U�M�ѩ�v�͘��1������1C=�v%� �w3f��O��Cp�p��̒ɪ"���smjĢ{��݌�L�F�N�Q���L'W37��r�w8��j�xԶ�C����=�s=�S�]�ÙM%&�"�\s����55��qfo�l�i�S�CP.��1\sęcV�l���rka8s�jD䩏z}�:�԰�E���u�^����r�w83���i]n�����7̋E�4/��v�<֫O{	��մsf�H��,t����ܵj!;���[�Ι#��s�C���3S��P"�g�r5휙b���QEK�9�̘"����,XӞ�_:j��ʂ�3cNGfܙW/�>3�<)s{V�l�s�* ��E�}f���k��R�`�̘;��}��̠{�3c��gdnV��3c^F9(�Z7A�}��;t�9́���G��~�3S���7���)�v*m��@>Dl� g�i���An� g�5��,x�g��8�ʭ�̉p�+	Fn�@JW沓c���Vn� g�=�N9������v��޸�n0�ޔ��'����f����RvA�;��{�c&����O��6�m����K1R��*Cz!�~'�+3�Hm�R�s<��[Up�*�t��;�9De��<�[�[E��)F�n�{��u�)D����3׹���VV��Z�sf2a�S������.�G��A����˗0]%Gh,Zm���J����k�>��II���͓��~�-{�J:�|�λ2;z/���g��З~�!��W��҂��t��2P����]õ�Kp��p�l����`}8cv�)w��֣ݫg̾�Q7�-6����aЩ@o-�������9��p֭�pΜ��[!��V}8g.U9̓j���p��'d/��\�[��ye+f�:��ó�2�7�\dN:�Շ3f�X5`���Q����&�>b���nΌ>9�Yg��\�͙�~�X)9L���1�̀f��&�w3f��c KhC��f̩�����\ە학޼��%FJ�}7c�&����*�w3�ȧ��.
�݌�b��{Px��n�L1����a��uR�� B����Oa�-�;���:)ΌӉ�7����3�+349w�e�uR��[�Q���I��́��;����[sęc�P�uuz�5G��քpw=Z}�:�l�B\��Sֹ�>���[�8soj��s�]0��!�7�3�=ɭ��t:���](x�c���iԱ�Ԋ���l:�9�B�"�v�3�{^I�Qn� g������l�ͽ���Ï!�9�W�p��Ȫ"�V\�[;���|�[���3c.���oRrl�s���o�Z�<)�ܪҘ�P�Y�����1��q�i�iSo�όy0K=۬��k�@���^�eN���ʜt~���8��g�l���IQSJr�8�3���g2�@Ʃ F�Nn�gU-�')��5�9N�b��ϓ�̴׾�g������ځT�u��ɳɭ��̵��	z�[������i�i���q�A��s.Y��`̓���<O�3��,�'�g؍��Zڞnϓ��ځl�������J�;���N�3#��m�=�M|&3��s��g3q�H�G�\���#Μ��?�����$�"�����Qɪ�?�i�?��J��t?߼7�p���|���昹�i�2����qǰL���\��}�SM��:��b�ל�td�铢��#ޚ7���~E`�0��[�{wg���
��q���O�*�� �3W=�t��q;�7Z%D���}^C��ܕK;j�\>gN#��[���qft�۹�T�\>g�Y��L@�E��3��
��I��3��f�Y�:|μ
^?غl���˵v��^xkS�\CǙ�Q��C�����.(�f��V#W�ϙ)���L6$$���93��������ƙ�~0��Z�{}�U�^�U5��h��&�^�6׿s�\$n��<۔3�����]��Lj�=�U���ʌk��-�/�}7c6E�];0F컯����a�e��M9�o(tF�tN���1��ي��ʭG��	����s�3d?�9z����G�̅p����`�>�5��㶤�֣q�T��7BOaE5�,A˭���s`P!r
Z˭�b̝����
�!�in��S���������z4�솊n���g���>�����؝�[����Wz�E��Μ�
8����qfL���~#����e����[���hp�����˖%�F�3w:���1Y�5��b��Y�Mw�5t���aZ딣`�|e����3���WrfC��և{��g�lF��X/�>3f�ʻF#��y7�g�Lh��W�`�̘��s��ׂ`�̘S�X�n����>_5�#W�B�O9;w�[�ƙ�Tk+J��OanVt�/�L{wo-g�Au�
�>w��0��b$��n�9���pf�H�7��Mn-c����I���Z�rՇO��f�^��Z�L1�3���Y67���*��ҋN�v�1S�d�ʹV��`�t�(��h�-�v�1��t�}�g~�3�F�t�����~��(]�vo1���ʵ>aR��Nq.��0w�bD�ǘ��q��p�z�
��ƙgQ�e�r��vq�5^=���Vp�ʕ/�G���<���uj�}��˓݀�!cҌ��l�U�BT����ܺ�7��T�/���S�t����G!n��7��Hq�J�(-Zk�L`�g�V1�nVIEO�ݗ/_t6�E_G�c��V�?�}��������=����5��I��<[��o�����O?��?����R3��_�/!�����������#SU��������::t�.�ͳ��k��x��W<С �c՞��˯~�#w��oY�(2��OCG���)-����7�5m;c�BK��iҋ����Ck�R&nuyuwcB-�M��<�������:F�2�4�1IS�*�����z���+�퐸jt)�r�}�#���(���V�%���jFO��Zt����x�[u�F=zj�����-�[}*�j��+������CߚL;[qtG����wu7�x4�O��z�c\W��
[W?8���A�
s���_1#����^�<�����Q_�0�2�E/��uK���M+�J�\�ܘ�w��m�[� ��-�ء��F<#����o�gS�e�=-�9䐘v�s_���b�A�b�bƎ�LƗ9k�9����Dk�{s}���oj-Fen)��5nɌ��\����g�FD��+g�m�!�:M��[q����*�oN�����4J����#ENܔ��oj,d�]��vFM[�b�3�ۆ���Cl�ň�S�#�	��%.W��UAm��Vl�ňgQ	�G����W�}���*6�w=��T�jF��Yj�=��g���&���>P����p�s��)q�hg��H"��!�����N��ԃ~F�-����F�暁�xxQ��Ω�������˝��?���r_��Rw'nA�SŊ��Sko����D�O\q̃���p�@7��^ჳ�oē�Q��f��ؖ���1A�� �A��>s$��-'^YE�iXh���B��>_���.6���w�\���wi|O=�bn�9�����ڵ5��"'���@5UMb}6#��փL���]����[yI��"�P��ǉϻyW�+1m��v��gEB�ă�t�,27��O�LK�1��ē��&�u�߭T�k M������Sk*�oms�_��v���m�g�I���ٺ>ӫN�Uż�R���7S}L�pǠ��o����#F�ɚ2�{~`��8?���A.����Ҟa��E�����~u�j� ����v�.�����!3ݸY�Ęk�;7���ƶ��F�����ؖC��R+���m1��{j�v��(    �Z�1GWՁ����p�9�y�'����+1Z �]�׻����*�{ZN��x٠��6����h���}N�]������l+�*{�f�������������i�����60���en=���^��Q4{�cĥ*p�1�V)���#��[���G�9�T����?���x��C�$,�1N܂���>�zqϪ�r��Ş��hj`vKq�����8,�d֣���h��NY��ĥ,�-����V����3�J�㈡+;�6f�oK��2��xZ�o����i{��~�w������?����/?��ˆ�&j��ˊq\�?[�G��$o��KnZ����-�oƊ=20b?1s	ՙ�1FQ����������'��G��3�<�#鵛+�g�y%aC|a��7/]�kQq2���:#n]5���-��7�wz_�ǔO:v���jD2��(R�k�����h�`l�a��l�����k`���Ѓ��%}R���5|������Qk㚽��u��иD1r�#)�يӮM�Qb{�s��4Z��öb�c�K�S�]�wr����׼~-��=�3���/�i!�Q���Al{N��km3>�8��&����͇uF!۾&[e=��9���ؽ%7�ǈ{Pc��Ju�=?�+�Hj9�/c�MZ3b�Ը�+I��F�(ۥ)��=�_������P�Fr��B����"����^(��j==�VX��wc���#l�I��� Q�]��W�X���Rm'N]�s;,��Vp�ṕ�3��95��A���'��d7)�>C�~|�򥵠K6������ގ�5p�� )@����tV:���γ�5��_*��u��v�м��n�V�6s��y+��z�i���cU��M���8)[q���X)'��5`�ڞ�AL��Z��{������֭����B�r�w�QlI��WbZ�f�nz�A�P`���t��}'NܳZ+�;3�'N<���b��x81�ׯCN�X]#FK�=�'V�ʉMR�a����Nlie���Np���x�n�O�9wZ7FL~#�X�Z7F�Z%��-ԝ֍�����k�1Z�g��&���Q�x�W�b�#�S�}���<ú�y:�X>��?�d���^�iQ,潢`���o���l�1� ��!~�����] 4��ۀ�s�(�q$�?��r��|�
�7� &���O�{g�`�uM}�踀����p/�ϯ�Z�};8���HBYS�$�v/s���x��?c��~Mr�^f��nb�J�ٕB8����^朕�r�T��A_�� n��r/3&d�۷C���zW���:?��^��S��}l�G�Ie��1������]b=b�1)�^5��2��a2�bG�p�[ U�A�����Q}�����:�g��lݭ[�'*��0�[��i��;O�߮����d��>t;���]����4���1S�_'��d���1G:��+df���1�����5)�݌������6���1��=N�5�}7cn����Q���C�Nٸe ��݌��Ŋ���u����PNXè�2��R���V8}��v��n��EvK�ff[��t6�?���Qr�J9a��/)����}ź}w�I�fWf�}��f~?�W�����RJ�^�D8�[M�9�����'������t� ��'q��s���u���un({�ɳ�~�LGxU�.�I�^�>��S��Oa�V���@�q��STk����2��Dtyڣu��������p���Y�NK�����hYy���0��t:I((k���dtP)£��e�7�%����>'���8��Y۽̾Rx�b~���s��V�o^�0�@#�VO�Č	.	j-�z/srJ��JmG{#[T~P߼�9��u�Or���te.]9$٫V�}f��0S�.,U�}f�d����ֿ]�,�>3f���3ŢZ�}f̳������+����;�?�`�̘�B�s@'y���3c����jڣ�U٠���]n�2��jДgOa^���G1R.#�Qp��ü�9f�v+��Q����g �=j/�2'4�h{J�Q�_\h��`�Z��2�|
����`�����N�^暕�{�;b��"��k���uZ"�&�8�5��j�S�n�w�+�0�>9�>��<��{��v�1/��x�M��ƕ��o`���c�N4R*�h�v�1�D�n@���a}WJ��k��槪P�����1*�w��9�^f������-�7�(�h�;��~kf�G34�y��<�)-�7�=C��{��߳O[�G>�����Z�q/3�#t�u���u;mr�y33Y��u������<�rМ��S���*�,-������N��e�sM���1[��vs�yt����nd�֭�9we*nJ�+�_����ǿ��w�����n�T��헿d����������������O?��������/�?��O����?֟�~������Q�������?�ӟ��������������_���c���_~������/?������OhG��_�~�������?�7Z:���/o�j�E_�j�Vz%
�q�뫽�T��? Y��n�9rw�_ޢ�b�Pƽ�i���ߙ�Sk�㚼T��;s-*�-}�V����R��ǵ#U���<���4�v(�Q���<Ex��;x�ܝ������;��ýq�����G� ��bK�ޙ-yl\gթ�T��;��c&B�T��;s��7'G��A�L�0cBV��
���i�k�5�~0\���z\JN������.��A�ḓ*ủh?Ș�T���N^N�d�ӽf�}#������':�{����3v���2�{� c��L�j����*b�Wf�Ӹ6,�>��liF	U5�J-�zgS�=L��愎L��˽%T��9��9�%�����q�v&ѿ�靹!\��>�$�w�#s�2���t�uI�Ό�li�c�1���3y�}]�YZ���7f���xn&�f��2`��ZV��l�
{�s[V���B���
R�
ޙCTf��i�-�"�|e���@ް\�ZV��L�����rR�
ޙ��Ǌ{�9Ŗ�3׬��e��H-+xgn]9�_%�E�g�L��5{~�ׂ�3c�^��s�vS�}.W�E�q�[���+��C����%#�>3f4g�;�f�`�̘4;�����g���+��!&���1��Vx�a���w��U�+��>�9eǞkЌ��k��j��*{u�jR�7ޙ�U:��Ѫ��w���>[�&�|�r�.+HQj��;3�f�L�Uz9�W��eP:�7��'�0��c,&K���l�2�(�n0f�~��-U+�n0fz�	_���n��9~m�|���f�����U��g�ZB��\��V�����3�k�� ,T�Ij�1�+3�A�=B�����2�w���Di<�H]j��;��@�[�e2��k(�_SR�C��1F�}g��x�~66*7��i���g�*q8-����l�z��rV�|g�1�+3Y��j�]�
�'Q,�i�������S��@6*5�t�c���:fR��{ �oZ�L�jT3��ps�R��EXq'��n�L����Mrܜ�[�5�CO�n�<P����:�u���3���8��
p{e^S�=�X�*W�͘�qJw�gۣ\7g&k�v8�z�+��̎pvh6�+����%En�A��A�q�Q���� cNE�]8���Õ9���:c�A�\�K�Y�΂� cnd�1���A��!��;!��A�<�)�������y9�b��pA��2;�Sp����2f�����r�[���Y�
��ɜ��ʹ���'�� ��)����Sb�[�ę)��ˌ�0��؞���L��TZg؍X�S�)6������ޥ׺]9�k�_������a�������ꨡcC8N��z9��Qs+@�5xC0�o=k,�E�3�nQ�OO掦T��o=�-
��#��7�uoy�s�8�܎�^򜽶*`�qv��-d��&�Rp&����_2ۮ��sЭ�+�sf�Go�E��r��O�(��9:�G����9�z}Α�\��3S,�E�I��ϙi���c�+�s�� �l�$W    ��̭)����\��3���G�<�.�g�<��ݺrV��<�WVz7/����O�@oN�g��L��3e���3��1��"f�ج��̘)���R�g�h�O`�{9>3��T�ȑ(-�[��r��}Jg�8~�L��PUB\D��i��r�!�-����^�����E�y���L�Eng^��j�^nc��I[v���E��T\YAĬYp�x$D;����v6��r�`����W�[7s�L?�Lҽ7sDA��[Y'8n0�lU��;�0��\���f��B&�\;m??�I�����uf�g�g�8��p�h��"����b�<��E�qMn�
g^�n🧕[������][�;C�s��Fk�%�9��B�C����n<N`���)m
^όsb�>k�z���3W�v}������wHvՅ�S��~���d��a��U��3����Xl�[�{�%	�z��9g���ų4o�J��)�'���/*J�+�3fګ� sh+���3��k���z��9g�U\��<O���!�����/x�g��~�Pռ�r����sZ���[�r�s�\��=��t	��0fJ�"�:d�2q�FߔUm\�ę�T��<��Ma�3ٗXC�7�1��.�J9�uw�)O�Bo;-B�����<���hw�F�D&���m`�i+��)��w�qYX\,rl83�1;��N&�.d��)*�<zX8��眫
xsr4InQg.S�ݨ%O/��)����?�+�-
��#*��G-oa�UY�572q�E�n�kɔ�0�jhm��v���<犋
��:�[�3�v ����-

O����N>8+��-�D:p�UC,�sfz_��d/rEy�\���R\�rEy�\�Zvg	g�WwEy�ܪr����-xJ	g�S��}J<��}W�O��N�42�b�����<g^���x:zF��<cn��,Ak�S�8���."nt��g��P|�}�<�ލό�'�w#�����̘�Ұqb�3m�E��j���S�npU�nD{�5�n|��%�Y����̙��c�_G�[ę���S�soa���Ο����	�y�ń%t��L�yM��}�8�0v� !>�>l:�-H���)����r8�Ô?LaM��-H���H(�4g���c��sΟ��9������]��}zK�ȴ��.;+��e�(K� ���.8n<���h=O� �l�����q��[���sw��8���瑩3��0/O80��nr?�Й��~�Z���pf�U�P���u]-���Ψ����͐[���9��r�������3cU�ݨşMB���s��pC���3c��r��wϳ��_����{m�5�[�ę[QY��q'���_�H�g���N����f�K�����Wk��u��GO���ݨ��5���B&�<(�6�;���� a�"y2�!X:��k|:���\�1Oc��ď�J�+�sf���G6U�tΙ)­=ɭNu�*�sf����kiI�tΙ���h3�%W:�O�&t�D:�f�+�s��X�ÎlS3��cXf�n
��0fZ{;1�!
.d���0��4S�owG��z�~S�ʙ=2�
.db�K��Tbn��)ς�e�g�J=�v���T	���%��q�#r6�-���!)Zx�a�-d��q�o�sп�w�3S���f�|��(IE4=�q
���	�6J��%('���]��j1Kn!gAE\b�1�[�gQ��0ϟu�[ę�Ta��g�R�=��6�� K�������������Է<g�o����a��B�����ŎbD>��~���EAq
��9s*�'��Gߔ�r?g.N��2u�r?g�I�}0㋓+�s��Ԃd���T��r?g��/�		��ry2O�r�g�g��e��1/��@=�)X�2z:8��*8>3fK��o
����g�Lo^ƙyIQ�?��
83�U�)��
?��"7>'�dN�?(H�Fn|��9*mq�s�P�v|�̥*�q�8���X�\�@d?�%���3w�E�e�b]{3J,�rm<E�3��74H�gߔ�E�!�e�̰�Q$�d�|�DU�Y�Qpf�q��7�E�����_��Y���"
�L����W����)*��������V�E�g6���cL/l� 9n�'s�*h�E},��cF�_�He�,8n0�aTD�h�l���B&�<�^��k*�a^���s�1��b����ĺ<ڒ[���x�-�.�X�3;��%�<u'�'�o*&�9s.&�̔鷅�tX0vw=3�䕳�z��gƜ�J(�-�������Md�u�-�z2�f�jf�S���ߤO������H��(��O9�~��d�:����of
"(
�G�_}1��
^Ȭ}+�ۧ�_(��ᴁ���s�ʶ���V���sʪ|`�hbE�/�<�6A��RE�/��Tn�ً忘1���1L-V��b����p��MQ�>�ߦS. .s�忘WR�z˟��D}S��]��QP�cW�)����۝GO���o
cv������w�)���B��XS�7�1���n^�M�M)O��>c��?,���Ma������D���\�ʻ�S�N�7�1�"$���Ջ-��b�Y�}��[|��<�ʘ�\�I'���W_�˩�v���K����.X��W�)F�ݽl��'9�o����h���[|����gje	޿��э����}1o���-
�b�AU�#�uv����\*�H}��Y�s6Ofz�����κx^-d�b���oa���Lݝu:�*�1ϥ|�қ+�s�I+���w^�}
g�|���u�������L�M��)N�r�}J����QлU�r�3}I�VٜI3W��/�8T�Sw��b��/fJ#-��E�$8>3�B��n����31L)i����s��X�4�i���)F�QT�w�����1ϡ
�:����X�d^�R����Z��IH3�L�Z��l���v���[���wp7xZYlA�3�i$4�S�l�Of�7FCwv��؂�/f�7���R�;EꋹD�v�3r�H}1�w�{��&��鋹����!8n0�Ai$�Azq�[���j�`hտ&n���ڡt~9n<��m�>�2g�ӗ�c�U	h�^������+��:+��Z�Ō�2&N�`�[�cRńE�5ĹZ��Ŝm��^r�H}1ʑt�׫U��6�'3E���) �Z����PȄ�?���̘�Vz��֙�g�<��!-!����U���/���l����}w\^l!���*"Gjv�5�����i�
�z��)%�Dep!�N�K�=���E��p5��[�ę�wH'��N�tΙ)�ӻ�^�$W:��1�4�|d�J眙6r��V͐+�s�hY���\�3o5�X)G��9g�z��7wXDqU:O�����qpPC�+�sf���eN�*�s�E�������]����S�5���H��0fԂ�XZ\˙}Uym��u����o�L՛)��R���)��a�\˙�?}��z�Ss�*E�LSs�����v-��*��GU���B&�<:-@��r���v!g^�3.��䮍�����Q����)����8�iJg�Է0ӗĚ] �ܢ �L��&�ƨ���'n5�6�9�Os�fƒ[`Ù�S�h���-Ϲd����I`���y2ׁ�N�E�:��-
��ݪ��N��y$�3�R����wEy�<��+[�r��pfO�8�w��!��B&�lh�v�C������6U*�q�-��ܟ퓙�n�)9�"W����+��޹��kw�~�3����,W��̔��;��!8>3f��~��ع%8n0��`&�%n�F	�9���d&\������'�8L�i-D�q�1����8�9�7��0� �g�uA��0[Ga
��p(�_��9�ˊ��8�7N��ϙ��?f�Ogȕ��2G��'�N�EA�9���S�Y����9�w�Z�^Z��ϙq�����o�ݸ��)�Zc\ę{U�"�ſ%n����Zl|K�X�^���'�q�Y�uV� n����l�Z�Q�TT/fG+�n�!��0��8��EpgQ{���ng�K���~m�Qpf�)4g,��E�Y���E�����_^ό��{�3����    ��U�a]#	^όyD�־�8kX���<&��|�7�EA���}��n�v���\�Wb�.
2�Y�~��-%�H'�}+1Ge�>B�ZnQg6��#V}������	�Ώ�kqreh��-�{E�+Cs�`�<*x�gƛ����24g�0���.x�g.A%�����М�6Z�q'LE�͙�>��2���� BcއwYp�g�U����fS��`G�M0K�7�ɜ)�������M�l��o�p���o
c��\X�Z2e����[gZ��,H��wtp�s9�Zy��S����Z\D��3=��N(bl8s�*���x�6��U��Mt�c��l��1^p�
c�Ul
�<)�<�~��]q�&�"�X�1ӫ���W|�5��"]�Փ5r?8��ʣXu)�-��̞��w��%��!^d�/��[�sr���$�Z��p�U�]�i���	�Њи�����93���F��Ϻ��-��̘"����n��pf��zٍZ�+�s�7]i/����������(ϙMU�����ػ�|y$T=��8�`sW���ު�v3�"9>3搔�}J��	��9�;��DԳi���c�1��(������Wc���X�øQ�mGeP�g�L��m�����Yܸ[�R�Eu8�p^W����y&����.��<g^#�7��+�3f�TS�/Z'Q\�9�ʢ0�z#���3��iwNI��;��Rg�p*��+ʗgAB������$��q�1��\���M��c�C��{�՝���+ec}�F���QΏ3�Z%O��̽Q�i���1)��#_�Y���b��,Hh+R����k{	s�]�w3�!� �3c)�i`�g�)w8�*"�k#E�	����q��	.H��a�Q��y�z���gje���n|��E��`)�]ό����Qz<u�37�t� ����ܓ�mO��g���tg���Wl�~�(f��=F����T��*�j��pf��A��:��9C�`.F�͘�����U�]�r��������\�3������,CsfO���%֒+Csfʕ<����$W��̉6 	WO�pz�U�3�B�b��En�g�$���eN��1�ڳ�������,H=SN��+����̘)�4iOV9��w7>3�e>bD��w��y�����S���j�}T_O���N+3��7q�-H��~@ߛ�(�X�<f�Ą7G+�X�3ǡ��r�6s��`�#�~0������|s�/��q�	�z�c�����*�d
�o�G�e�Z+�����?'1!.����jg^(��q����LV^�|cX���l�Or�r��|1{�E�g��/�)3�O �G+C1�F;"d	�7��*_��?S�R7b�U�~$������J�_�5+�s$ZU�t��ܺ��/V�t����sbՂX���yz5��Ԙ�X���yUU-b�6Cp|~0�{�T��瘂�}2[4�][Qp�`�.�R�'VZ���w��@�vk��������Ɯ�j�/[[��ż�: ����G�>�U�J�_�����vV�wU:w�=���wH:r�r��|1���\�9�-V�b^�#�ު�J����gJvOb��/f3��qL�����y���i��%q�����w�����L8=��Fg����cNF���%8n0�>�7s���#�{_-��b&&�F ��[��S���[��3��G�8�l�b�~�Ó��9�oJ.����9��FE��~�6���_�&�QѤ-.�g�l)����%�X��y��׬��hO���Yϱ+�wÅ��8�̄�-4���/:����~�X��p��.Dn����;�Qŝ0����7�U��KQ5��+�Ŋ�_�$�w���Ŋ�_��Rb�;C�.V,�b��~ǆ��Ċ�_�+��1�5�.V,��N7U�"f]�X����d����G9� V,�bއJ[�<�t����g��&����̘	gY�9�Y��1'�����I��3�]���̘�/��h�Ԝ��̘�����7i��9?��S�Aj�	�όydյ�8Y����L�O�i05����\���=���%� ����Dit���%k�۪&~�ur�����[J��.&��˓9$U��7N�V��(��cWA��y��-�8���E$0���{ʟn�s-��Z}�s�)ΑJ;;@��s^���1u�[Da��yV��آš�¼&ƌ�/j�\��1C���q����l����<�|���3�F��]�ܜ�^���Q�rn���e����9s"L#/%T��y$��X����*W���h�Q>O��g�ܒ���z�q�1����+<9�q�1O��A6f���μ�
��lb��F��I�'�5�q�)�Gz�̾O)��-��̎�E�1�+�-̾��nʝR���*i���)%_̉�E[��ӭ�$��3cje[8c�r�|1��+����l��]��<��HG��9rn�ܣ�;O����i�J�̧��ƌ��s�:-8n<���F�o|�ξ.��l
}!��^70 ;L�K҂��S�O>(�*/��Qp�P��{؞�[�#�$��V�.W����)3�n���d��o�e�\Q�3W�yZD����Ey�L��P7�YS�_����#��(x=?Ң�7s�����Y/�#�����g�L_�����&��-���.)�'!/�Z[Ԩ0Om�W?�~��V�/0R������P6�N/�`�ڈ^E�X̙�n�ytu�b�y��95bBE��,sfzi��]��\�9s���"a
m��9s˴9�[��B��b1g���We#����*��=�%8�1�E�þ��1Ǻ�(_�S[�V��"7�lis�*�j��Xǘ]��W�s@z����&8�1f�;�:�ś�"7�L���~�I��Ey�\N�?w/���<Ey�"#`w�N6���(8s���� ���3��{w��r8�rj�k[��\uV��sk�8�jmMu�t��-3E���-N'W�7OQ����;��h�\��3cL�I�H�-ϙpw��:�k�s*��.xg.�ݗ�)��0ST�rRk�
�ts���X%�!���>��:�
��g_��"
�<e�8m%˕�s��q���g�]�3���~�aA�U�3ۥ��ԻKreh��r�Xe�	(weh�L8MK>��~7>s�D�hO���OQ��H��.��Vp�`�u�s��`���c���y���r�`��W#\<u�3��:T�V�&�-H�O��iB���5�6�1�PJreh�L���wS�)X��̴�Nuw�ւeh�L�Am�6\,Cs��i⾻K�����e���lB�]�>�ަ2������(83�$=������c�=l���M�q��<tV%��Lq	��٢ ��Cp�`�n��9��<u�>�����y�8s�]�+�9���Kf�q�����#ݕ�9sA��)�pB�U�3ӿ����mV�tΙ{U)!B�3Q��tn���Ki��m���̘�S��=)�^�O�I�n���Qpf3h�����K��t������"
��11/�&�gޗkUم�X��j��Q#��5��^����b�@=���QpfJ���6�����)cb����/W,����q�1{�+s�JQl�J;^��Ŝ�MZ�mO�Xr�b�<�Z��*���3�D_^�9'���3S��r:!�n�x��؁�v��$8n0fT���u���U�v7��%��LI�X�[j\�����}!T�����S�-�t�p��U�3�&l5F�[�`�b�Ni��şt��]���[���5�%xm0f�X�E�{[���P=�ik��¼�Q�"
'W�2'�+�(�.;�\�-�Y���43�:5��9���;�����<�)Z���)C�sf̴�ǞDQ�:C��9���T�YW��r?g��;�E��oa��@����[�e�1�k8�N�gk�rAc�r�}�8�܂����7��q-��93��8Z��A�7D̦��+sf�7����nV�X̙i�V��吽\��3��ykJ]n|�̔o�J�Z���<��U�)S��c�Q�����]��e�����S83���ƺ��ΌP    r8�����yT]�M"�[�1ˡ�F ����C�NV�c��j�Ŝ��Yu�-s�b1g�������9s(�iX�L�+s�8�K���"x�g�����eϦ)�2n�D.���`�{2�N�nȊ���雵��63����w�O-8n0�Y�m�s�5
��y-�1u���M��Ϙ�ʣ0�ٳ�q��?�]R-����7g���Z�0%V���Ѫ��B�rnΜ����l��]��3��9����_�gz��֭��������FMz^���<�*�0Ku	^όyaJ��U+r��A��O%�gn��=�}��$|���1����������O
�h�!�k8g6K��G�M�]�93d�?-X��̾���Q�+V��������\I��'sr*Tt��˕t93���`�uʕt9s�����{73%d�t�������݁���yT��@�X�o�s����2����S���A�TM���c��	~R7rn�L�£&�,�����95�Mi���m��3S�^+������c�=�՟t��-ʻ�J������f�������[���2�y�������i�yvep�_��r�s�Ӭ� �D�_򜣡o��E˙d���l��E�Q�(�w�,����������G��(c�Y���_�+�sfz��v�E�`��1S�h��LF��˘kVO'�&Y�e�S��S$���)pǁ3�Mr%]�<�g�CY1˕t9���:ld��gƜ����Aםܸ��mTń��*7npf��kw�M/�	mC��f�����S���ުS73�7��<���`J	��+��0W��V��,x� gnS�]��S]��.g^��_��b%]�<	Jnȕt�S�Nw�i7�4r%]Ɯ��B�}ɕt9��]��'�g�����]W��,��c��P�H�E�q�1Ǩ<
zK=˟72��cŝ	����S:�yяÙ�7s��ܾY?jx[��̭|�1Z�a�S�}�vԈ��͙���_7I�͙WR���c�+C3梇�{�[0��~�l��qc�"x=?Ey��Җ�u��h��zf̾*���XZ�zf�Qu�sQ��1'�.|����+�s�)��8q{�{�T,��jW���_�>�}@E��7��;�i�1�3r�W�\��H���Z��ʙmZ��lA��꟢|�U�=Rj�"Wx��c��-���\�3clP�64�!Wxe�c���o�73���|�!8n0fgU�G��^_7�O��A�4�]��S�����a�$-���3�#����T��q�1���Ԑ�\�3S6�!p��\Q�3��� G���9s����tR�oY�z8���9g��v����O
z�3?:�A�m�6��9g6EE������[f;�����7g��vD�7gZ:�ֳ|δ;�8�k&��<gz}�1��l�+�����J���)�u��%s�3�j�,b2f"��a=�wW�����׿gB�]Q�3�J?dO��K��ʘע�6�s1E���d�&|�w&�]^�r�E���+�e�1��
?rvS��ʘ�/:�j肻�s�>E���q�1��z��7s1���\�[�F͟��zt�q;n��܏����-Z�]�9�J����w���3��e�[�W��J��֐+�2�a��}G�3��ʙi���"N7�+�rf�T�8GjA��ʙ=1���Д�
��Y�0"}Ph��vWx��	�q2��7sZqo�\���:e�ZȂEy�L;|��7����q�1c>�,����7&�B���>ǍgA�X���8�Z!˕���7��1�~��*�GK63��9�Kju���j�Ŝ�w
S{�i�r�b����w�~V�|W,��)��h]ɂ��S*ӡ�2�g�L��E�&x=3�攭zwg���3cƴ��|6���(ϙi��TϜ@��ģ얶��(��,vwv�nɕG9�t���]�oa�$�؆��T��+c^��Y\�{r�u[xO�Y�ܖ�Z�r�W��.A��S��ʙ}U�c��&Wx��8L�;�O%ݻ� cN�rĺ�N��}sVn"aJ���,���˖6oy)�-uOhA�;�,HX=R:��ɘ W,�̔�ytx�G$X:��s�!���|[:2g�V؄�yX|�����)��]Lx2���͙�V}W$c��L�	��"X���L_���^�[�SS#�N3g2�]�3Ӯ١8����eh�\��{\o��-Ϲ�O����s8O��Y���7g�A\��Ë�����L�����.9�J����Eq� N��J��:�ܞ60�\�3���R�q�/V�����`�g^�ʣ�9:�tn�D���(g����srY�<��̹�>e�E�,�2�j��?��"���1�H�ϼ�r�����¡�&#8n0f���z�V�ƌ�ԝ#5=�iܰ���d`Ou��l�j��aВnƌ��}���{�����;h�$���(c�x:8�M����<ʘ�RSJ�Z�<ʘKU>l	�P�+�2fz&	wm�Z�<���g�7���Q�<���g�[�ȍ�y����gt������dͣk��^n��̦S.
Q��ظ���U:�=�ּ$n8U�h�hV7̓�Va�(H�v��93��9�S�[��ǭ��8�J����~R�E��˙�D�@���
��J���*��t���+�r�Q�d�ɜ!_^���<���s8;������^;��v+x=3fS�7[�.K�zf�v�g���\�3{��ck�g~]� ����J�_� =/Ƕ��onw��ishw7�j�ʣ��pt�X��+�rf�r�r����9���ZŶ(W��H�,~\�E�<ʙ��M���Npg�N����\���yd�!�y��w��Q�6m_�"[�o��w�A�d6I�eܜ�vJ�qp��+psf��3�n�Q��͙iE����t���F�*l	,�*W���i��?ג�-��+_�9'B�eh�\�
���_E0�S�m*�Uo�\��3ʑ�׫�\��3��)̫ʹ�<�5T���B�w<�h�������М�6���]��2S�8���Y� ��|p���_rn��M��.�k8g����ٮA}+brf�;��'@�)W���5+�.˴��rEL���q﻽\�3Ck?i�u�+bƧ('�V�}�5�g��|�g��/Ǎ's�(���D��ƌ� �odo����]�X�w�z7s0*%�9u��č�*nO�;�[ݕ��S�O�+���t��\�';������B\�zg�%/���%*(k.�"&c�K��w06�]�9��j��-uI1�*�3�"Y�~2g=�	�ϽG�q�)�gt�]��Sr�`�.���9����J.��Cp�`�q*�)m-8n0f,ŭC1�7s)��b��+C��(��T�컶\���z�"G�N��ʙ�Te?g�wY��˩�[����ጹ茶�8˵V��ʙ�Pn`
k�%�8Cq��A�z~��Vq��X� A�zf̔��=m��ݵ]^ό�v�c�@,E��͙sPn���u�Ϭ�n��B�*p�E9���tة���<TBǵ\}zs5* �n �ʣ��E�v��`�\y�3����#Kj�+���(�&�ɷ�5<˕G93}����Y����dF�Mw�s�a���1�IIR�4�K�3�Z�%�b�K�s�7/��->X��+gC���������|M��ayRa[����c��}Xtwm0�Ұ,��� W,�����d0�y3m	���{��93&��i��-̋�3�n҆Ep7���Λ�Jo��PN�+�rf�7F�����/y���Z_�����˧&��Y�Ŝ9L�!G:;�%sr�aJIY�˕�8s�ʶ������]�3��:��q�����|kF�-��l�J���c�X��3�\��3S�p�Rz6r�F�<�Q_�6�\��1w����ۢ�ழ��Te�����r|f̖��OZm	�OQ�{�G�9�*8n0��`�9���9vZ�w���Ɯ�Q��8������pkK�+s�ڕ�ݞ�}3��vm�U�J��)����@�f�+5rf�oj4ĩ��R#c:���Bi�\��3S��"��)w�F�l�i�f泂��R#g��    s�^�5/����"�κ�_�O�|�E��X��	��K��Һ�"
�\
��hlaϺ�^���N�מ����iE|��e�`��1c~�B�����yN�1寘`ˣO�i����:=��i���J����Q�L�����ֳi��Q�L_��(&p_^ό9 ��Z/Y�����y�[�-��#���CϷ��>��'W��O���oߵ�#:u��8a-�ԫ2��/�T��߶�F,v�}��G+��䊘��[��>��\�3S�gp�Pb
rEL�<;ZL�9/W�d���n��d�O��2A�])[�|�z^��Y�yX��,�ܿ�ڃQ[��3%yq����ʣ��t�A5{R=v[,��i)7��WKr�b�Li��<E��qDQ̐�J���-wW-�ޔ����}�ÂZ;M�+�r�YT���-���6��ޟ]��^��Eʟ=;��qWx��6+������]��������J8�(�'��nvO��wa��[��d��.X\����"�jϺ���93���眃�.˜�5Uv�l�`A�3Sj��z��+r�io�g��XA�3��*���h�\A0?���R ݱ�u�rA�lݧ� �����Q���Q�Cp�`�~P"���8��73��k��wHn�`̔�Ć/n���S|��yM��Fx2WC9?���
�t93N�N�tKoa�:�SdrA�<ͧ(���\�� șW����u(�^����@�.�9�5*�-C��`�OfTC^G+;�9�G1!DL������_�u��Y�q�1'�<�d�|֩�r�`̹�kwY�̔�v�J�[���k��������^��.K���ӓytz��n���¼�������+b2杁�7��.�"&g6��鼦�䊘���nD����+brfT���9�f=�����4������q)��f���3c�G���4
^ό�d�Z��`��1׮��g��̓If*ӑ!�r����/�P��G�K���yeTsrp�[fJn�	�,Q��ɘ)�kkwY6Z��ɘ��Ͳ;F���"t2�-	^������(펦���]P�s%rر��k�W�1��6ZE��ɘ�R�3eL�%]Ɯ�ZhwN�,�2�ܔGǈ�k��6�~2���� X/Wx����s@��L����L��+�r�1U�褛N���e^d���+�2�iE��Ϻ/ܕG93FJ�w��!�9�'�3*Tt@�gc�/?g�죊�+�S��ʙC���g��[�)89X�-�,W��9(;v���ъw%]�\ZZ��a�r%]��*�`=���v�)�㺬�;�L��+�q��.�	��8�*j�}�?�^vW�c�QOe�ޞK���:�v�Ux���r|f̎"pr.�%q#z��p��{���<E�H_���`3g�.��L�L�7�7s��V%�W�q�1W�?�]4�
���Ez:{�Gnoa����S��+�q�YUڧ��v��]y��q���e{��+�1�d����w��������Cp�_��*��^����g���܂�99�q�Y��/��O��iQp�x���=}.�v,�7s3J�݅?;߸7sO��L�����<�2h�R��r�Wμ�J���5�K���� Α(��R#g6Si��ؼw�-O�<�*.nϘ��F�쓊�O�ʕ93}�*�:1G#^ό9�O�[�6�e=�r��Ί���Al�i����r=S@6�Wr%���i��P��̯k*&���ٯJ�_�@@C $Lv�Fxu��>�]i},�r��o���R#g^Fy!��\��1�r"s����b��"Y���tm�5�s��-k��?.8g,���t^(����X�3S���X�x7n����N�y��QP�/�8�zYe��T,$�x����]i�M�]p�W�<�"�������2ϥ�Gu�>��.��OQ��6Twh}�/�"&c6I��+��9S�������}��ҷ�#'	��ʙCRս�[��8�q������*Ɯ�J���«�OQ�i��W��c�U������>+�Z����ܝ��zH�z+�}1��Ic�ĊA����</�}J+�q�>���ښ V\�b6��}0��������(�l��s���c�F��n����73���Y$܍�9v5�u&�]�����7�(8n0�����d���sj�i0�k�]�(�0���;寊k_̣*��F?+̻*�}1ϥt��Ϧ�\�8s״O�)�X�Xq틙r����aܸ*�}1ۡ��dց������Jnw����S����txm&W�q�1Gz���J7�����, ��ނ���K��wm�{�q�1�Jo�������q�1Iܻ�zV|uU�b����f3?E�>�Z(���l��UA�3o	g��u����	j4LVi9���m�L��h�)U�b�F9�����[�s���.�=]?\ϔoԁ��-�pM�wǵ^�O���e��WZ����\�H���3�.;c�]8�M���h*�})۝XA�y��ݞ�oa���(����e��ydZ�8Bnq����)H%���^�v�Ҏp��K��4���7�+z����v�k�ɕG��)��P�b��/�T���H0oY����z�F��R��i��1Xݬ�0���Dh�^n��/��>�Zv�f~�� ѻ�<J��J�_̃�nÁ�9)uUj�b�`4y�Ƽ�9/�W�m�<��j@�ӱ� ��v�����|��JW��Y�r�S�_!~N<j?��,�2���l�8K�G3=����>�`	�1��\�W�.��s�1nl�%Xc�m}Ff�
(�%0�L;*� 8$ˣOQ~ͪtܝ����1�ׯ�����`��8�>��Fp�`�6�s�����y+�`N�	��9��8�J|Gܨ:e�^X��Qƌ}P��w8�lw���'3����"�[�sM*���x&'ݕ�8s���rS�+�q�a�@O����+�q�鋋X��:'ݕ�8�j�Vܵ� ��!g6zї`�
�w�y2[�Ɩ9Ґ7�+*�}&�����P��ky	��9Z���		g��/�Ɯ��v��%X:�̹����,X����w'�.h������*ĵ���v��75�,'���v��Bs���pB*V���Ӻ>�*r��rf����N3��u?\���O7��lx�z�c	�|w/Y��g���hg������a(��Q��r�Q�Lˢ{�B�����?�����<��8L(Dǵ�#ӝ?t�I8���ː+r��T@�PN'���A�L�ڠ�B�%��9��B�cd�x�s��3��4��v��>ڥ=*T��i��I��u�|o����Q����o����mU~o�ur�F��Z{Ozs�q��Ӑ+5r�H��*8�`��d��\
v��� șmZ��?�H9s�ʠcD�g��/�3��]��׷<�aU�f�6˕9�L�E.��~�*��t�c�9�7F-�_����1M|2���v�19��۾ŵd�
U��rݰňr���Přc�tj��Z�BgNU�#Y���y)_����
U��z��>��q9>�'3�xLu���q�1�A�x�7���e���7�J��Z�fOEp�x2�Ԛ(�4�����۾�<�,X��̎2���MpO��̾����܍�3Sֻ�����BcNQ�/���q�}��e�.�gƩF�MO�,T1��U�[j�I�PŘ{UEA��!8n<E�0�2k���Sp�`�˩��%y/8n<����q�d���^���V�Ǐ+�J1�sʢ@��U��쳲h�P�ٹ�e��1S\J��p��%s
*�=���}�����浵����g� g{ST,br�1Z��C��ƙ;�罞�1oY�Ӫ�)R������(>;�m�K�s�Qww�2��������w7�-�,W��̮�����CO��=,	������"��/0U�{�x��Կ���u�t2���ՂP]lrA����r_ɴ�����?������@ҥt��m����%S��������Q&�w��_g�_�������/�������h����_�������_�?��?����_�
���2��/�������Q��?��?����    ���7���������׿��/�m��?��o��}���>������ο��?�?������׿��~֠���ߞ�Pf��
�����S���K�(�/�JL\b������}VF�:�ȸ��o�\	�3wJ���6T��0g��J!�'g�����/a��)��Gg��J�L)�ڱ���0�N�o�c�+'ڧ��=m�8�r�bF'@l����-��vu���3�ϙ>z5�~�*9s�*�ڮ�i�.��6e]�#��\Ɉ3�׋�����+�r����ͩF�j��yV՜�h����\�y-�W%{���s1�gE��6�$��2g�EU�נ�\��M
sxs�Y|�+sq�@�n�ݥ��`I�3Gʟ���`y�>J�����e�q�1S�p(��?k7sM���}6��r�`̭�q*�S73;��r[���3�Q��d2�¼=b\ޕ�쳰���v֙�}W�����gJ���\��5���ݍsʕ�83>�a�\��We.���(��-Z�2g��cx�W}M܀7�"��7���Ҿx���qr掉8�7Up_Ό��;ຢ���'1u0��Ǎ's��1&��N��
���te�笠���R�O�I?+�,�=���2�/��%P������(�%PƜ����P�Y��ei�1�|�6%�r�̥ Hco��[�sE��9���/�sw�g�s�gy�������ȟ}7-�%Xe̳+�N�-�~�}U���e��n7ί_`~��V���P�����ƥU[��ݓ��4
9
�[�����P=j],�1fJ���Ц���uA�1�Ӊc_��.Xd̄�1"�j/x��{VFt������Iw�۲g��ݻ-��T�������%}}�|W���c���ԞT'���� �e��\q�3�;�p�D����83e63&���q��(?4�,�}��?g�l*����-	�ə�ā�<L|3}q�>��N�n�L߬
�;���
��9.�6���0�� ș����r4��g.������g���{�����,�L�>��{p��V,r�W��,�K$g�C��C�����d�ڢ��I���t�b]��%qc:�šX��&x\�{����fw��̂��rf�7::ze�$��L�Nv1aZre;�L�F�wt�-̔o�v�,X��̴ �@q,}��>��c�ҎPY��㞢�U9Lu��_p�H�<��[�C�nƼ(����N��9��j�͜w��̔<&��W�b1g��M	[�%qc�|�Z9�9n<E�E�����Y���q�1ӏ��Im�q�1��,N`��S�lǙ�TJug�L�d�NŭA�.x\7gYuLH!</W���s���������C�oZc����y�Bg6���.r;;���������H^9�7j�3<�O�-�9`���]� ș)3jg2c9sZD����do�:
��=��
���Ni(՞t\�-�}1S:Y�S$��v��\Z"\i-X�b�ͩ�Հf�\َ3�@)uN�ȕ�8�A������]�)3��hE���d6�P~��5��0�{� ���Z~2;��ťl)�-̾|�s���s�J��I�Ǚ�>�P���oyΔic��O��\�r�0:�u�,�1�Fk�@x�����{R1�1xU�lW�̣+5�ֳ�qY�{2[mTڣ�ֲ�e;�l�*�7J>�sY�a̶��=r��C���c�F�|6��4Ø�<�%���KٻҌ�O��h[��?�*W�����OڱJj|�̅vq9����q�J�U��q�37��Rc+�e;�<�~�U���1�m_�/�q�<�פ=,Zk�Y�k�����O�[����2�\i�3���u���d����2��yN��g����:�t~W���i	r��K3�>�����w� ��g�|�"n4�����)ߨ�z�٪����K�`��X�v���h�k��!8n0�5��Md����7��*b��%q��D�m��ݵ�׼{2cf��o��oa���9�a�Իrg�|#��SYuʕ�8sʡ+N�U�[�\���ה+'qf�pӺ�?�Y�m���`�Qp7>��è��&���yF�rQ�A��zf̫)��8�9<��1=)�i&z��y2�^
���������t{��W��;~�&(�� ���I��f4z�r�5�L�#`�Q�����g�$o`K�J��Fx2Ǥ
����,W�̩6�K#˙�Q����8sM�XW�*�~�ܺ�]��aǵ�Bgơ6�U�cd9��*�-�5�]��S���XhH[�����9�,6���*W�̔o���j�[�)�����`1�1�O
	U�}	#˙)�aw{JU��ƙ)���D
%v���()��	�6����kPc��N��ܚ�[�0�`�1����r1�,�0fڹ�ݽ,y��c^�����K�F2��2NRtO/�Ɇ����Y'��q�)�'Wi3�wn��+c�K鈜N+8n0��y��>�rYc̩(���ե�0�����
�.(���OW-ځ[�
cnI�=�e�cd�S�O��n�<�`�1�K3#�m)�Ƽ���O)�L�,�<��n���N`Yr�`̄���p�3r�cv�r~�I.��č�29��or�Fx��Hx����,�n���)P� ����=%w�K`��������-̴����&W������g���>�y���C,6g�)wE����{�"��e%-W�a�%�(�-�L����3���Tu��3cvA{��K�s�Eu����LOw���w����)��Oۓ��d"$�#����k_�@Rfw)M��,c��o�?U��B93����
3�J`��:��dcڿ�em4
|��&'W������~W���0OG���]�PřWQ��z!����)s�7�\�*��I�Y� UFÚ/�9�rgv���w��oy�~(��;5��9S����d��\��3��1Ԩ��oa�]Tb弦\ɀ3W��)eǔ+�q�F$�6+������S�}(��re�L���ϹX�2g^I��N3f�2cn���Pʐ+spf��{��Lre��Z��n>�V��3�ݹ�:�q�)�7�7��sx�t9n0f�{�)��r�<���,\Ip�`̕rQ��=��ܒ�薚��r�*�LaN㼮�a��<=m_�~��
O��aEX�H�Yp"�����+"TԂe�l-�1���?���%�!�4k�`��1{�XčQ�
�̴�4��/�=E"��l<b8<E���r(�!�,8n0fZ�vw��1����s��������q�1��B�r�(��c�8&��ϺK^�3e�f��g��?d��b[(�����4�凥oJ����ъ��Q�X`n3
�f�o��=v�,G�,�0fl����D�_��(�Ἦ����L;����;|��,��������zn^%�#e�e�+�=��A�,�q�e��&>�V$�߽:��ld��5�h������iiW$g�c�ר#�k�u�c^��WIp�*�<uS}�k��LI�EbZ�<�3���u��|3��}%���q��YQ1cVzK���8s�j�Ϛ}{�s.F�Uc�oy�5�#NO��jqf\ޠ�����T�Y��Z�߽��O��N��ܪ�r�*ƌf>m�����Arf��wa�[,Tqf�N�gcd������"�"W���!*�q�6���8�Qy~,#��V|�򋶟��P	�9��g�\�Z��Q�7s�j���U���p��;�y�Bg��vQP,Tq�Y(C^�B~K�X��:!��N3w�'s�wf��\т�ݓ����b,E	����Ҹk/��bgN������9f�p�E_\�� 9s�7D�qV`sW����+��Y�ƻbg�E�]D��7���Q���L9��y�?��uV�t9n0f�7���˴`��3S���8
1�1N��1X묳����mVR#%�V��ę)�p��=�%�9<�)�+v�H�řc�\t��g{��
gN�cv/�g�G<*n��ٷ���)��?����o�/�sk�����e=S��*�)ed��9>�'ō]��\���j�l�s~/W�b�VO5t�^�?t{&p��mW�j�_�US�c��o�$w�    ��w[���W�rgF����F�rE�LI��H�Z7oa�$oa�y�	��ÙcVuo�����ӓ3��H�d�]�8s1���l,�0�TA���l}�s��I������LI����!X�a�3+�MKI�������`�g�J�/��w��X��� WNb�v*��i7�`9�1{tN�[2H�%���=�f�,0�8T��Su��%�L�M�����c.Y�}D��,�'3������g�L���C�|73e�uy'9n0f���G��z7�̞��i�k���c6�3ʹ4�^7��*b�By�,�0fo�/
�pV�|�9�'sh*���K�9�r��"�)W2�̙���^Ͼ�w%�\��(�,��*V2��h�K�Z�$ݻ�g�Q���q�w%�<*�����d�돽U�Fp�x2�U��%��9����MQGu�2]���BN��RV���;e�%�t6��r�`��Bq�Τ���g�D7�?�r���OQ>��9�+���+sp�R����`9�3ש��_t�*W������ ��5
�98��*����;���L��ZD��K�3����Ί6/��(MR:�$%�u������}���8��nO��-�n<�N'�ebF�4��*'�_��Q����u�������8��(W��̡PtEYӾ�9.�Ђ!�������LIު8�֣���4��W��Pҳ:L���Q�r��J\$�����sU�
gu����<�JW"�
�Ƙ�Nf$�m����ٔO��\�6 w/�9��*D$L��B�蓞�	�r����֚�>������nsɽ��̱+�7�����(ބ�Q�������56�(Y�=g�U5��&�˽��̔�G\�Rw!��#+��
}���S�Os�>�S��Ǎ's�V��c8��n�`̴�"��s;k�~9n0f���RΪ!/����	�#��g��{�����OQ>'O�nt�=�w�1��~:�I}3E�fqc�:^��g��Ч|aϘ{R	�8�[/�1���s�-�1/G��������Z|j�©������lA�4�]�8�3�o���&8n0f���}V y�g&��%]S�����Q#�9w#�g�������xs!����lwY�x��p�z�iɢc�A��4S�`1�1#�{d�n��Ƽ���Xmk/Yϕ�ȫ��Ug����+}����X��d=W�VL�~,��(_=�rqΤƻ�g�L���'_M���������J,�mo(_���B���[�)Y�3�'�l n(�9/��ِ�a�^���t#W��̭�� ���-��O�������guB�N���ܝU'\~Ό�Ҥ�/8�,�0榇:���}�Ekk�o&ɽ���.�1���,W���~����r��-�B��:�r���	LU߃���%���oΜ;>���N�4Ù�SIc������pfzs�>��Apw�܇r[2�g��r|f��*�E���[��J*bG��ٷ�r�x������ښ�Z�yO6�+8/���m�ю{�"8n0fߔn�ra��+�pf�cF���o�~s
*�.�:	���̔o8�g��o_~�(���"��_~sf�f�/Wκx޽��̽�;����*��3�n9`�t�E�μ����҂G�1��g�e�-�$n3�٧l�՗č����oNrCp�x�򃲹����q��cCy���-8n0f�2FD�5s6�sQg_����2�.sN;��g�|�\$ǳ�ﻒg�|#�ݹ�,��A~��cL��b\/}^K�yA�G7>{�M��z~2O�7��7Ŝ�/�g�l��u3����I�F�w�N_��'�{؜j,�0�>J@��tRPP���b�+�<���!�%v���Ow�/�H�o�:�`��1#Y�H>|oa΋"էm�,F0fH3-��,F0�VT�-=�0oyΐf��}>�N��s�A�<wEr,s0�U�͟v�U0�:a�&6 �)<��3[J�-.8M����{Xf>;��,�0���0�[��/�s,��y�!�"�1��Ʈ��u�Hf��a�F+� �"�Y��*�"5g�a._$3f�+��g��3c�̨➰�Q��<#*��*�kg^�s!Ԇ���ƃyhcp�f��7���6py��7�~2���G@9�uW��������
�0G�;">�U(�9U�4.�iW(�"�3�2d����L��ze�=���^$s�V�FAB�˽H.������%Ђ�<��wg��c^I����%8n<�����0��q�1S6���4�w{�����#��I�0~�~p_b�	U��}2GG)��Y��9�OAB�#����E�7G��=g�-��8H��l83�@Ĥ�X�{aϙ�o�¾���Rw/�93�̹����L�F�Qu�I����C�������gƌ#$��-)%��1���F���P8��ʷ���<�C����M�*�|�M-TTT��\1�3�jLI�q�-�ѫ ��������8���_�<���ݥ7c�w�ı�&`@��1s-ɡ�������j�N���@>�����Wuuu}֡'p愲Q��t�}n�gF�+��Ap��#s	*.ٰm^g�\�2q��6Qnbg�FyK�ک��"�#*����3�r�Y��J�s���������W�Z#xg���5���<��.��I��)xg��ɹ2��ܠ,g�V�zs_	���u!Zߔ��,c�4R��W����1/��m���ި	�(+��'�A<27�����k�{��`�xpu���F#Xo0f��"u��%�#��Eź��l�K871�1#�[Ր���0�S��J��1�'e3������ʦ#3�I�t#B�*8(˘�S������AYƜA�W������E�W��#x8sE�L��5썾=Yo0f
��:s�v��q��BO{��7&~��B�
����4(��S��`�deP 9�$9	�1;�º]��#�ϪQg�bB�
s�ȤW���7cF)^��7�#K83��~u��+B>9�}L�Pդ"�Ҍ�<�/���)P��`�,ό��3e�JĽ¼��1w���x�xyS�FE�����s�A龺��)8��1��$��a3v�o�P4�����.�9���*�$Cp�I�xF7�{�$��y��q��j��s��c��V)�^f���KTE����uF#�j:`�����9g\R����0C��5�����1�q��P�e/`jbD�Ǌ��".�
��NM��c�U�A�1�憞�cF#����Y��d���`���8�U��V�ڋp�1ۡ8K���rj���;�N�f�`�|�NH!�@���G��7sD��թ����cFm��Jʂ�cƓ�r!ۘ��\�*4>����ܬ��]2�0�&�1����M�*̣)�F�W�p}L���(GI�%��j�;f�ZTטB�cV�mSٓ-��Ʃ�;f�w+ �fsZl��9D*T�d]�8�#�^�����*z���)����d�qL��F+����ʥ"�O���c�S�F�y�(�d����S��5Zq��y���A|b�����d��qf0��h��,6��1�l~��I����;fוu�+��b�w����{�L���cT)�ϡ^E�SU�� �ɣ��g<l���*�\��cy��cr?a7k,��b#��J4K�L��b� �Y��L<71�=@�jR�-;/9�͙��y���*���6[�HN�82mT$[��Wa��3eV����6�4u_�R���ҫU�߻���:V'�TZ�Yp�cF�h�}I1	N2`�i*7��4�����k��B6��3^UVYr�#�2����k�@������{�����xr��1@󆴪�����e"i� ���r��82Wc�A�d��Mʭ�%z�z�1��:��;%'0�`��\��!O��9��\�9��89`ϘSës^c)�`�cEEC�pɭ"�%�s��Pg�LN{��B�\QoP��u�����4��{�Ip��1��\]�f�x�<7���G�f���|2�g�z������U����p��
�ԍ��&Wopf?դq    60c��78sD+c����s�g��JZAY��}�9Oe׍hD�{Όw
�ӌ�"�����*�I�P�*���r�6�̴�N�ܠ,g��,_�����xs�AE�e�{ٹAY���Ql"�`."���(IW�%�=P��k���=K��c�|G�0��ao����̘�2Zq�2K��d���Ke�K܌�Λ�_��S����\RnC��1{����Z?齖D��93�
�2#�E�KU�2vKurG�1��-�Fܔ�2�H�o�\q�B�X��G���:���sf:`�(���g��D�pV����8��*Q��
{��so��­.��9s�R�H���qf�z�g2{�ƹ�7s�N	O�HnB�7��d�̘��Z.�V���7sd�+]�k���`�u�%����E��`��+�p��lȓ�c��޴s�F�<PoLmь$[tt����$��f/Xx2�b��QWRc�Up��1����J��Up��1�7���n�xc�x���{PN�1f�K�f��X�3�=����c.�:E��>��?�SmUQo��<Yo0f<��!]���7���2ɿa�� Gf��hA�}�$_�ƌ;���f�;�z�1ۮ*�j�+
:9�͘��� u���	fNG搕m� �Kp2�ؕ%�q��ѷ'8s�J̓^p5g��%������E�F�u�tyƻ[�$��{��<��.A0k��̣*�N9�].3����*dj����9�Ȩ_ߌ��ZYV�o���d�e���֩'�93��\�J��0;�n��ܛ){r �1{T|]�WQ?�q�Z�#���
cNF9�Z�i�����9*���(8�͘�*M-\�$'8�Ři*+�A�7�� cn�ͽ�G�b̽(��f�^��A,ƌw����f���XGf���'�K����V��J0K6<�V�̸0i]��^E�z�3��,%���\���Uѐ�� �z�3S��(�,8�͙Ɍ$w,����sɜ���� �3�#32�J���^�ڹA,�ܜ�1�y����9s�t_��ܙ�w̸��P 9g�U���i� ')L���� �i���r�X��N+1���b��=2{�F'n��ߜ9�[�O5���s�c�CC��	���sF��M�H���;�O���cF٫��ij��oΌ�_��j��EOfvG��UČo��B�<�j4���B�1{QM-�y\�˙�T�R���`!gv^�F���E��{��,��co��#�IM���-W���%s�u�>Y���95�^ݬ���7g��u����!��U���ܹ�o� �nV�w��1�d����j�؆�,g��_G�|�Wan]��6�<[�3��$]h}rɜy���Z���s����g��pd�F�UmC�BrB��5��K6��/
(2[{�!�������ɜ99<	ȁ{��N�ό9��l�}���H�S�J	�}����z�X��W)[��J'��ܲ*+ �6������w܃��t{����c�N�S���InP��QùD�{m�Wa6��87�V���݂ߠ�ZԞ:V'D�@[�k֩���qrʫ�F1f�7����WCr�߹�6�O1f��'WP� Xo0��Y3��W�ho�5ϲ� Xo�#���n�{I`'��<��]Zp��Ƒ9鈢�������4e�= ��9gvF�u�ѯ��J�j!����c��ٚ���H>&�SN�j!3t��7Ɯ���Vu��r��1CQ��j�Zr �1�$]�o��N���T_���_�����N`1�����0$�����#s�x�Zm�cw{�A$�dod�˩�d��D5�
�@��c�*�o�U�~S[��2�:�9��t�"��kkpnP�3{�j��LSnP�3T|4'&����s�+�9yOA*vT��Μ�X�)�[[sf�P�����;VTdr��- ��W8sK�%�h��l���3c��k�������h��ʬ��'�#3�鳣
N3�`���QͭB��.(++3L�z�XQ�&Q���ĵs��W*]5��@2gF{ç�N0:��Ό�����'���\�r���m/A���
g�Qi��^b\�˙[�U5��K�87���	�os8�����y'Ɇ7A��82S�[�c�@��`�xj����\������Ӯ��"Xo0f�𵒍T���� �O^Uz�	n��%%�W��/�pr��ng7��WaFQ^a��Z����xG�뛲�,gFau\�k�~n�3���\�{� �bqf\�Ho8���1Q�j
�U$��5gƝy@J��Ι���v��`yf�x��-�?��rf� M&]�\�����(�S~�lbAY� ]�x3{��8����%9}S���N9s
�iJW�Ap�bΜi����{�w'8��	u^�Vf����@c���$Թ���89P����C���ƞl��`̨��o(%�:��h28w= �z�174�Z�㵗5�~f�d�Ѽ�\����hh�J@�]t��XQA��L�}�o��cF�D�2�� 'cNFy�/U����3�:]hK�l�{n��1CC�ƯL�p�jUt�o�T0斕Y�z$8��7�̺[#8P���Q�����&8Pqd�:��)=9�N�l*�3���utr��1���i Yu����T�I��k荎8��`����'�cuBG{#�u�{�'�ƌ�F�˿��9�d����}1u�%��\����L5�����%�%�Խ$�G2��&�����!�<^�i,En����1Q~�-n��qMO�!�l�>�Pb��3�-0PA�{��ΕgΌ'v_MZ��W�g\�NSUK��*򜂂���}��<��|�N�p�c�� <S��<6�U������ '�bT��숂g��1Ge����*�h|���r����2I��V�3�"L�d�N�L틩mc�{-��T0橇2��Vv���:�¾Ľ*�s�X�0]Vگ9Ep'g�Mu���KK�s�j/�'p洲P���{�1�S�a�ü�,��G_��y�=XǭM4�)����X�0;��$����*�#���m�,��x���g�&����<�1��J��"x�)g�QE��9u�N��j�4��K@9��ϙ��Jm��I^����#s$�����d��SS!�3Z�!=Yo0f�ԝ�*�6��\����n�T!��e/Xo0f$�WeJnQ˙{P�B��~�1��4�Z�����;����X\��lP?�5��
�uʙ-�����%�\a�����,j+8�CV	�io������MI�gz�<��M�u٤!X����A��,9XȘ�FEE��u8Y�ss��)9	���������)s��)�U_��bݹ�B� �ڠ��݋�y���/zW1��P7����y�������ۑ��m����g̦��f�Ng;�ӑ7M��>�g-��Ϙ}PnU��,9�Ƙ�IR��N����T��5�d��u}� ����A ��J�`����6�N�	ރ��ܼ
����?y2f��\$#��UQ��b�c*M�o��pf�W:M�70�s�u�3fCML%'i��6��vU���ެ\9ׁΘ=~>������h��)�*ʁG�ot%T��y<';�3�}u���@?Yo0f@k��vU Yo0�R�Y�1��x��7shҭ�IY�LYΌ��L'n�{�>������go��<Uo}d������׎�� c�ƿ��lg�
3Z��,H�m9��NIZp��3��s͔�i3Xxj��3Ǥ�!�s(��95�VǈT%˳92�!
pV�mu93�Y�F<���̘Q"u���%�3c�h%Co��x��# E�6�xƎ��SO���6�w@Q!2�rP���_��<]�����X�1δ��'�t�LP!��{-/�u�{dF#o9���M��3���>�׮�\:gE*Ip�gF#of
p���� c&#����*{�<OA�<z����o:+)���ZT!3�D��ౢ"�5��2��Yz������i�}�#�gQnes�=�ҹ�h��T�,�j����̔%�h����S�ќ��{")�S�3�3���S�Z�[ƅcEE���)XhA�3�1�L\    I�gpr��Qͭ9^{][N���8��H�|�73ޖ�'�9���=Yo0�֕��1"���a��N��Ͷ9Yo+*���rFg�7���Б9����vQ�-Wa�F,���Ǚ�� U5չ�lw�ӟ1#i�do�"��$g���Mt���8sJ�Q�4�Ր��Oa�7�W�p�<3��N@���	�gƌ�4�V-In5ə;���()�A,ƌ�z%5z��ٮ���@�xr�?�U}�������Ge(e6����>2g|��]U���8��*���q
ne��y̓ǂ(g4c��L�j��ך�dg4c�]M�;Oރ�9�wo��&x2�Lm��lm����29���lC��=�&�/��Ru���	��`Љ��v���7\�b3{�d�_+��j�v��AG�(a�^[����ٔ_ڽV�m�8�E��UQ!���3{�J����!ױ{�N� *j�:��;vs$+a����Ɍ9[�m���W5qfH*i��!���4�v�(�f���73�����?�~��;�y
V���x�N ���uﮒ��s�ۉ_���f����&*��(x�g�UA �7M'ׁΙ�Ԉ�S�*��u�sf<I�n��ﵹ;ׁΙQ�}�%T��3�ni�1"L�Uz��_��Hc��Z�3c.I5jN4�M�<3�ڔ^��Z\�ęQ��'���A���:��SBw�U�T�fA��<���k%;�3n!J��f��h�l��ҩ%Qڛ{t�3:3���e�0m��:�9��Z2>b\!ę��@�#��q�9Ne�
b��<�׹匶�\E�!#��^�U�eW�,l��S��_���q,�\��ܓ�{��NRΌ6�[�r��5Ϙ�6�iHox�NR�l��v�-�u�rf[U��MGr����eWp��1��$=f�7��Wk>�3�8s�AՐ��'��LW�@]f��73�5�u�<�3��KD{ps>��z�17�U����U�F�ʴ���^p����P��983\��k���@{����ь�$��J\mÙ�����DC:
vF3fҪ�SG��h�LVs"���*�L����Y��
��c�9�(�K+Sn�ș��h���Sp�g&O%���K289�kW��d�9���L_��prp�? ����>h��^���O�(8k�3�N�՚W�p�QQІ�1;v�̔?j�0�V�`�.c������ao���|�N6Ӡ
��\�3c�C�h��(x�g��qT^����1Ǥ"�~*e����NƜ^�M�0�Uޤ��3v82�U�T�n�d��:aԂ&�J2��gTp�n�)���^���G�<"nz��IT0fjZL�*�c��p<2O��B��$*3�a����>��jVV�^6��z�X�0�gj��fP�\���ců#�M��73Z	uU�7-x&g�Ò�.B��g̥�\A�n�U�U~�Y {��Nv�2f�o����<z�c73�ѰS��ٽ��u�~`�JS~�[].��`����lH �-g��2��#� W�gbvC�%����*���kf�M�#�OK�`Mi�T$sdF,��F�/�ׁ�_ �T�= �T���:I9s�ʕ�Ŷ9���̫&��U����e�U����u�rf�F�x�-�8sw��fgnW����OG]�UdUt(�FAK�{`6d�E�:���:�9�-ʯ��l�U��T.�3z#�yǙ)3���@��F9�yǙ�D��:f����hY2����Ό�F5m�����퍰�n�7�\�]rGf�7�r*�!Yo0f�7<�ւ����t�u{-N���rM�ح{ôO�Gf�;/Qu�*�eg�����ԋ�j�Z����v��:Г?2��r��N��
sL�P��2A� pΜP��>X[���3�Q�F3�dW'pf�Kz.'i\���+��Ϲ��~�<w�t[-jc,���<�(1��=]w�<3f����`y>2;cșDI3Apug�^�A�l�Zz&zf��5�N� I�FC�h��@w��^���吪��ɜ���r�]�����98�-K��Cp|����,ځ�̩���~�&��V9����c.	O:�L��ь�������q� ��u���Ɏ0ƌR<)�o��yV���_�=��F�l�����a�ْ�N���f;�sa�١V��p{�mNv�1f?UX'��K�8Yo0���\ث�8Yo0�*�-Zڸ���S9r�C�*z�8��r
���\���*'
���u��q}��9�y8�����0��r�lѽD���G�@C�W���{�sfk�$OJ�]��1�t�u��d�#�}}��:
nWř�8Y	U�N��̘S@]G����u'�3c���UY��U��iW�;�sͪ�?����4��-+�tѩt� ����d�IvF3�f�!�� \��ޚ�������2�nh(n�{��u�2��"�:�E�9���]_e��*�l�B5K%NYp67g�W��ɹq�U���'7���9s��4�Z�	䛏1[e�u��JP�u*qfH��U����̥+k�0��,�s�J���l�3���83�v�W;��ƌM��*��荤��t�r�
����k����$�͙mQ�RvM_��7��ʇeA&#Xo0��P�`ar��9�ꬡ�~�����䧠�o0P�:�83 ��U���_�:!���#���k�z��3�L,:qk�U��3�V^-!t��	�y4������"���p4`��/"��$��ą��E�9ۦ���6Q[�3:�25 ���:�U'�N��T�S��S����U��9��JP�ܱ��S��ޱ��:s �K�M�Kv�2f4���{�d�\g�:]iu6�#���fE;}�$e�h�啱������h��%�e*��9V'�^T����J�Nv�0�1���'i��#3h�zZC�G�a�&�z�e� �AØm��;e�4�CD93���	�}���v9�J���Ʊ:�U-�Kxܛ�3�\[���`����R�Z���t���73b�RbD�kWu��`�-��,�-/8s��:�l�ٮ�F�Է�i�C�1ӿh�,]�mO�Ov�1f�5����J�c̖�pW��[��c������py�� ݭ6[�>R�c�%�7j�U�L�%ϭ�U�@�L�z/�d��:������n��|_x�Y�K7';v�TJ`Kt�#�yǙ��}e��qf�73�&�G���r8�Jgc�
3�XKѡ�6���u8����$��U��P���e�=I93JD�kHݐ�$=V'T��\�~/z���1#�2'K-I���1'���ג�Ad�9G+XVr�+c&�e�V7%;I3^0R���W�x�h ��-����X�P;~���\�\���Q�]\m�`')cn:�%�?���78�����V����T!T�^��#�}@��IW�$�gF��V[ɭ�X���ހ�7F/r�J���fb�.8��3U5���K,όeh�[i���9s���b]��<��k�RKuW��1��F�^�s��p�N�ڪ	���z{~��\h��˞�$�{����G��pt����\AЧ`�g6ż
]���׭�ک�u�qfU��D��a�Hf�^:~k(��293u����V��3��r���R��ǒ���*u�ęK�oZ�A��r{�ܜ��Z^D\6˙;e�'���;9��2;����1픡�1�n�$}����@-��7P7�d���7���J���}�șQ
;��W_�`�cNF9Gm:�1Wa�f��:�7��dc��U�T�WQq���1#S&�?��;hs��E�_��@Nv�+*�A�UR-xxg�5��Ș'eF��]��4�l���fʨ���,�)����Z��pd̔4��α{I`&8�	+�ƹ����ҠY�j v�qfd�M"�K��X2�S�ٕA#���3'P�����_<�9�hB�l|	g��������K8c�Y���w{��'_�s�*�� �Kv�1f�Ʈ�P�MpI5g�I�D�'���K��$w^©�E�M��z�1�UiO%!{��O���y5��%Zo0f��pH+c�	��e��c�(Yo0愲�~��#�F.�W����^����0Լ    ����~}$su��5�V���פ�U��$;;s�*VJ�@O���1O��bn^rvՑ��b��U5�"�l��?~l�[ ��Tq9�˞~>Y���*P�"�$Y�s�s�lQ�.	v�1f*��;l�!o�7�jTR���\�{�D����8��������+�IU�S�1�9�,˅qf4�R%�A�$b�\�*�oNor/�x���U6�ޯ^no�;�AY�4 +v��;f��I6��4�S/���jd
�sʐ�[���&��%���^l��;f���Mg
��ް/Z�!z�A��0G�h�%ϳ��9%
�S��^���z�1��Θ�l�~��`�x�s�P���;�厙��XjŠ����̭�z���?�qp�<�j�-X�ހ�SQ���%��U�(w��3��/�����єj�y
�g�LC6V�>��U�9���O����3���V9���D�6z��ҩ���ݑ^�H
�ɱ��(V�L�d�;�v� �^��-��pϜ�Lv��Wa.M����U+�rȘ�T��]��_s��SSՏ�Q�CƌF���������k*�&'i�.�rȘMP@  KO����m��ʒA��`�n��W�l��cN��S��7sLj��Ɯ�J�>��9��LC�G���(��91��\�j~��{�[OfGf|��ĩ��_���5�lHv*1�	��l��'_�AT���t��p�L�n�Q\y�� �l���{�<�դ� �s��9��W���S�<3�Ur�I���Nv*1�\�ԫM�^@m��,��j,/�T�̩� ߤ��Rx���m/:Xe�D� ^�E�1��7i�I�E�1��W�`�]u�L����	�/Z�y��_�{���ֱ$$̬)�ܼ䬟#sԝn.��3
��پkl���a�.*G�z��$Xo0f_T_{��*Xo0�L���7'�>PoD�2���v�z�Xs�c�2I������o��*�ի�Vy�f�s/��!`M�����2�>��t=���J�^h��P�lAr�đ9�jL�.ً�s��є�_�^Oғ��XQAbѩ�{{���1{<)�17��3cA}����<�AØ#��V�M@�YU3���<�A� �A,�c�.����Q7t�3�Hd߳��cF#O�%��9_�suʭ�q.�2�2��R���,��+~] ���sf��@��j�`')c�:(Cc�v�P��9��V����E�`&w]�s�"{0{����2���Xƒq�Dr�A�I��3���ʮ2�^����"e�B����x�Ҕ�	Spo�;��meN�����f�E�����}(4�-�$X��e,�$���l�&��,�Gf<h��R�bt,ό�T��V73�O�g�l��q��^/�s���;-��^&�j�2���:{n6��De窓��>~����/:M˺uto�/-�_�	}�*����ɨI#Q�NM��X�9��&�tF�1C�=H����ΌL�S�0m��=Ș[�p�Β{*q�
bYق�*{�����P�E�`As2T�l�u��,T+��j���cZ��R�����ʏd�VM�Wi/��ŘCƯ#��)'_�s�J{j^���(�9Tyu&h�/Z��ҫ/C��*�\�*�N��gI�cK�Sy���Z$;�s����t�%��GR�z��Y�`�c�U��my�}Dj������Yw0��Bu8yJ� ��v*��2twf��E�c$_Z��n�t	�,��#g�c���K�KḆ��K��g�
��0f\����3cNi�!����̘�"-��]s��<��ӥ���sm*�5f;I��3�nT�t���_�cK�3E�L�/-�y���(>��Kˑ�iZ�U��7���Kc�^�՗�ɗp��@ŕ�ْ��<S��k���t��st�R�D)�/�-PG�svs��cK���x�lf8�|	g�0U^{O�=[�Q�d���{	g@}Q���<�B�����L.
�U�����2,�^ s�j�5.�� �<��@��S��1ψ��0z\D���7�V`/��dy>��t3�[�V������S��z2��3cF�p��*̽C���!c]�[�뢯�-�佒��/ �9'י�l|`��Ԥ12�ਲ=��t\���PG|�����R�%�Wp�'AZ���7�\y��c�+
v\D��v�+�F����0YEO��ݳEϽ�rf[���9o^hS��^�x����j�6�m�����<멦%�qf�Y���j�ν �c��5��0�E;Ͻ p�ʚ�pU�E�Ͻ p��T�&�=e�Hـ�<M����Ud�4Ձ�Q|vW��f�.�)�ș;j8���
���c��M�kB��h'c^*c59�Vp�1g6�Z)�_�*ؘf�6���N�1͘qM:9I���*��J�s��*��+��m$��e���r���ԓ�1��ר�q�{�O�2���4�~wdu�IE�����^�DW��:���F��TF�1͘k������4c�VQ�3<���=�<pռ��ګ�������!����]�U���l����rN�/Z����N��*�~*�d#�u�?�0e����k�l�2�U�k�^�ݓSƜizE^
��q�B������*X�Ñ��γ�7�����4�(K���9s��U��ƙ'�3c��LTz3��P���Zr�w��D[6��E;νh�(�VJw4{s�O6L93�U�k�׼
�ud���hrf��^�)y���Gf�pCN�#����5J����)��%����9W�j��U�����Vshy���Q� 0 ��c�h��F���(�\#/���3Ѫ�:�FcF#�6rǦ&Y���x��=��;��p���Σ,��U��ډbA�X��"�l�S��Q!6��p������[7��x&iJ��ַs/-�� >�[��_��"��X$_ 3�^X�4�i��i>2g�G�i����̀��N1�*�R\ƭ��� cn��a���z枕+upF�cMe�!�&���!�L���Җ ��Q[���$_ ���_��,X�3���Wj����ȘQ"`�g[�U�9��k���^M�#噪g�2��|`�h�v*	�u/K:~�+���B|�  �⚁	��9͘��h���<�2��4u�/9����Q^,�M#��=�`**�i�<@MR"u�z�9�]9ӛ�������j�ۃ� �l�j��ٳ	6>83��>�L�)���K������Kp�H3������O�gƜ2�w����Zpf4��Ξ�<R��Q3�e��Z�\�j�D'[�9�	� �<�r�1}� �5�9a<h���_����~`��nK���[��R�dc���G�Y����N6��̪����*�UǪR*e�;ę�U��եm
>��Kʐ'��,8��3���)u�I>�3�C3��|�s��X;���z��nև�+όC�{4L�<3fh*�V-=H�h1��n�-<�`Ô1��9��l���%�eo빆)���уan=RoPz����4�LQ�*��go���O��ởH�w�|�����?����Y�.�h���-젶_�>����7��T���S�VcFa�}���=��XU5�����Sp�$gFK4:�Z��Rb�.���� 8A�3��
�$�]p�g�խu�
���<�%�
��7oݏ�g�ѭ]syFKtD��o�7pǢ,J������[���y�Ѿ7L�����ҿ
'O��{�t� �`Կ��/zU�n�Hr|�1#nj$ܶ��0ӱ���_-��1']�$��	�wƙqaz��lQ�Ø�Ί�'�ߙ;V�%���7�p̙CGN�0�\�ř���Єb+��ߨ���^F���dhPL��4�i�y�L��i�'�s������ɍUkȂr�������0��:O�F�S��>V�%鼚��)�[ØGQ���)xg���(�ޔ�������3V�$���E�9��*��T�E�9�9�gy򒽈<g�Ԭv�;�W�琔�\�{��'��P�I%���fw�`ED��l�/m| 3>��rtS,����nћ
qe�>�s�f    �[W��0���D%B7���<��Ū����� Ę+ey���W�g4���2f��<�1����"�hL�5�"�~yF��k���3�N>ȏU��)ъZ�ԱW�c��k�j��܃�?�T���^&	V"��8"!�ڍ�0Srj� �I�73f���ԕ�K;Y�1fhwĵΒ�'������LY�D����8b�y$x3��{���S�O���46o��/U5M�(#ի�m��wt^��"�4������3�EX��+���J�����{Ӿ*�wӚY��<���{����޾=��s�������T�9sʯ�{�˫9sË7)뚌`%񛠮^E��r�Iy�t������F��!�#��."�D�j[�,�E�b��+��^�a�4|��;��=��1����ӛ:�c�D�썭^��M�W%z���y935��QB�Ds�j�^�a�*뜂J������3+�y�x���3d�*E�\�5�r�A�����f��� ��A�!���]��Q�N}�IҶڦ�y�ٌ*���S���5��;e�:ȝ�cƝgVr�S��c�3�nY}%ʞ���FeՌ�|��� ���:m�U�/��*\�٫lHJy7�ϔ�lHʛ�TӎVj�
��4��r&�b�T"գe����\���<���aJ�z�K���=(���=+Mm������5�j�jm=.i�Ǿx�Ss2���I��9U����^�{sک�)�r�s�
�`�p��)��&?RP�}7����^��Z4{��#����,���*v
G͡(�%*ߖ7�?H��ET&t�i�]EPjQm��2c3�,��$rh�?PPjû$���Ǯ���W���I����io��+֧�>�K��?�}����?��;�������o���?|���oͫ��ߐ�2]���|?^�i�N��_�}uڐc�P�|��7��!�&��_����-���[�h�k`q�mK��k��Ԋ��'��R7���_�_^���ؙo�?��w^u��Rl���
�V��A�j��~|��L�|S}e0��gz}������C���g��t�DlޔP���0e|j��悇��J03>�تN�m;�ݗ3E$e��E��\�m�H�j�ĞfOe"�Zܙ�4)�F��5�K��k�^z:��K�c�Q�[�?�$�UK>-���I���"����×'�\Ͱ��z~ab$F�:7"�Vo�T ��]9�x��Gn�<|�"�h�jM��F��3~zZ�޶�߀�� �)��J�|:$���}������LbەN�,�=����R�KF�gSǚ'����Ŧ�1Y��T�v&1�n�-}l�%�[�NEC6b�p	��_Hފ�n�H�?�[6��b�#Fi(Bu�j7F���J�X �(V�1�f�̣�o�r�#�<�*1���
`�#��!Q1�kS�Cn3�cn�{�A���r`?=&;%䘥+3I��i��K;>>� ��um�7�|~�҇�:m���}��I�5�V^Xfl�^��'��v�`����%�e��Sґ=@U%�y�O��࡚א���tzڹ|�<�آ�x�'�f��<"^�R���2*C�1�f1>��ax3]��,�y�a@Q��_�Q���m |�z)�<O�,�������+Ó]A�g�N9�HP˓#I~â�	d��n�>p�kR��{�~2���H���Btz���ꎹ)M��k��*�Қ2�D�X���;�^d�����]�4�@&�.��$���S��|#�ɘKL����{dw\O<�omk�'9�kR���VJ�� �sM�6$��Ǚ��S4���ES5��¹����-�jRl�{চ��@���'�3�d�VѪ�9Uܝ$�e\��@K��ܟ�ϔ�!s	��n�ӯ�\5䥢��=��\�G�NMk��w�SO�����忠��C%Hh���d���<g��?��h?�}�ÿ��G��W����W_�	�x�_~�߾�����&��/o�����������f�����_x�z���}y���?��������������7� ~�?�^�q�����M�N��Z�X�^�=��M���n_��xv�\��{���]^ѝ4����=s�<NJ�ܩ�y,��R�W�;��OV_w�3+pyŐ�"̠� Ա�|�ʽc6]��&��u�������̠��%��Cz̆t�YtΌw!X��n�����-�*̾Q>���;`Nސ�9<�Ws��)�s��!�U�Z�׹�层��n�4�"̉�ե��U��rI��V��/q'�w�u��7�/������i �"(���i��1�v��@S~i���軂ҭ�j��і�4w���j�6^8e�����`-{����]���'�UT�;��;2;�d��q���oa����eʚ7i��go()�S`����r�R��� ��J�L��O��CH�Lxi�=sŗL��0 WR8�GF���iZ�]��#��{�mm�%zн���=�T1���#<FR�q��1'�����r%�3�׭6n��s��{1=x�-�2��cV}ORo�֪�1��	��.}4����h֩��_W�~���6��8����Ҭ���6�������{�C��ƛ�?�__&�ᗫ-S�xA(n�d��D��^&��B�%���q�fW�q��朅
�^V���o� ���{���W�5݅(�ӧ?g���j�\����x�?����O��kԴ�
���9k�k/+Q�o����@yj�_��r��r*g��9���I��)��^8I����߽)o]����_��#�ŷ�����ݟ�7�����Z����+Uҵ�l����a�'t�(�3
��ړ�6����_r�������b�L�>���]7�r��z��a��j�\������_��~��6��P�;}�]5Y?^�tX-(�Iy����/W랗T�)����������w?���Rts����W��^����=B���������7���&���_�_�?3~w|�P��4��L��Q��I`�3����������׿~�f�?�~3�?����0��	w7���p�o~�<P����ɿ�1~��ݿ�7�*���x��<�x�f۶��K�\�G	��7��&c�T(�MRU�}E�K�R�^���Vן�_F����Oy=�~z��a�j*V*����l��%�?��_�}[~h���J�?����3������~Ҙ�Umg��v����/��l��E+��(|f���J���~"�*�yݩ0g~(�y?���?����ٜ�w�P~���|�_���?�����ד\U��b��J�W�7=;��_ک7�M�Ԇ�����7���K���Hj�?j��9�wo7�w DeJ��h9 >���Uw�����݀���*M-*�O���;4xm��@نCߦ���u�>Z-8�V�3�Z�d��s5��~i�5,��*�,�����mL�	����5�gp�Խ�5�

���g�6�Or4��B��7T�����Ґ������?��&�W�`�L������������'�'�t��s>��!��1�g�G���~��|Rc�[+U�AUGU��~ե�Z��.�7��鸆h��]��Ϙ){�7�����~N\��IL��}h��`���R������K��~X*fTe�������X�j39H�j���Jr�����)�^��~��p �I�1Sܳ'��>�4b�>;�����|��u�\��|���Wm��x��l�H	>ƐU�R�pޝ���	��3���JT�c���m_�K{z��#X��������?��?��n>��q*�^e�ӭ���O�Շ}Rhp`�4�ڣ{��|z�� #���<3Z�0@�L��6#��`��z��@Sל�\�#���K�3u����8E9�����?�ߟp���=��h�FM���t��������_+Q%r2�����$j:cV�qy9w���A��+�=w��F;�c�cE���u�'��c��3�?���)�|"�����-��o��\�W��Go2�o�)��;C3\K��<v�$���h����ۛ4�7��2��_�����X��P�z�������V��z    �+|�hx����:i�#�߈�~0 g�|7һO�*R�U0O�g���|Z�s��s���J�� a�bQ�*sj��Bv{3栬��������_y\o���L��5t	��3,��}x��P��FZ������G˫���?�<�����-�#���2Og�����$�� �~RQ)%jb�ƾ�]D5�D=�>�Z�S�%�@�WCי�u�q����Y�_� >�AlީFb�p�Qk�)ep�3;{8�Ml�n%��!�
WPl��� ��k�3���3���^�T��RŘ���GV�V��Ս�Ssz<���#�	g>$"?�]r��tE���cK��5������t��𸡢�xLƪh r+�_�X�k�)GK��%uYh�u�t�OE���B*U
y��ȏ�Oz���g��V��/'�*q�T��ꜿyD���4��?>N�t�a����m5��_#�wG	���p����kPe��*�}�1<�^�}��&�SG<G1�:���>Z-c?H�IP���R��Z��e͇�*�zh�IMr�6�w���r!�	VJ���I�9<O{[�qZUi] ��R�,�|}�}L������M�d .~���1�����L��y�N��I�Ʊ��dh��Bn�%CEG��4�p��6����u��I�#O�Y����RtT��?��M 2~[s@��=F0���T��Ee5b��k)�G��P``���wky�_|�Z
�Tn��k�Ҩ����G���{S����d4`���.�_�W�Cʵ���D	{q�����>Z��!��9�+y��Y=�@n�����ĸ��+(��9������|����������[�O���ByK�=t4��5���j}HHrQ��DMܪU��Z�V�������fL�5�y�O�W��Ʃl���ҿz�?^��E��jN2{�I�&g�r6��3C��-�	1D֋��rn����f���C�ۢ�7�	����a&���aMB�"�*Oyfx��ej��a�z���YӨ�{l!��㮙]�9���5 <}?���#������s����|�܋mP�
x�g':�����-��˥��5��T��h������s8�U���@	�5}~��������E����|P�JN�ag����m܋-��	>���������_)���j~�/���i �9qɆ��ۇ�p���7����[�_��� 'T��y.O'�}���$�9)y�>���~�����-������x�M+�#���o��/�g;���Nw�I�5ɭ>��^��n���"វ���>�=�G�#�di�Xc]�Š��f>g�Z����Q-��W���>���4%�?y��+��)�	�W���V��`���E��Tz�_r����DuM��a���x�x�8N�nA���B7a%gR�������2��z���ｷ�_�݂��ɻ%�'�!0��<ƌ'����h�n�:��:і~���OPU�*1���=��ʶ�ձ��Q�y��H�ԟ��*RR�P}���J���}>F6��Q�=����O�g�L�UM�Lswx���CD���g�qn�^��V������=Ѧ[ك�d����
��ܭ`�c�h9��C{��٦e������Ψ��r6�F+O��ru������� .֫����44�,���t�x��2�U�9�M�*I�E��uN�ZgҜ�8����R�Ho�b%��%�jkh�@���.Bk�nD�ƞ}�5hUeKkП�w��[rPG�O���=�T�Z��`Kc�Q�J-p�n%��gPq���:=r�g�M��\6m�TI����?s9�������g����L$�,'�,`�f(ʸ����ّ��c�	��"��:M��\�\E6|�U��$kk82�NNE�Q��]��Uy���nD��mo��a�ȟ������lۆ�����z�'O���y<�s�O�{�S4{��4%��ڻ\�c�A�)��#���g6�J�O�7O]��;�Ѡ��6�_~{�_�.��msǜT_��r�/�Leѕ�,K��g���שCb�/�죊�f�n���EBP��2eA\D�#5�F3:ث�s�-��6M�<�#s�ʓ=Vmp��1CP��h�͓��ϔ}�fH�)���D�� ȳ�J����YF���gې|�sY����;̢<y�k'GG�D��+'��tɋ&�0VN�؋�D\&\��Wݲ'�o[�qSn�jdl���ې�y⃥�W��3�1۩��s���\ƌ�'�sLE�˘�W�j<���	����9F�^7Q��3JD!)#���Ci�!����>n�&�P�̫���_�vJ쇄c�@�o�4}����Aƌ'	���sv�2W��:�i˦|�T��T��q�Zh]%��Þ�M���J��z��ڗ���?�7/]`Н���>�-{p���g��rQ>�T�������&�=��6�Lm�ȫ`6e��c�wd6V�F�̖�����5*QQ���3cv�z����A�<3f�=k������:�PoLjы���4���.�U�`�v���{0[�g�jw��)��䩴�3�s�/g|� ձ��&^E���X�A|�
3����1��|e�����*�3��c�E�ۀ��+>��*�����]E6������s�9c�f<!���*�L�,5���3��A�X����O�WOڻ�|����r� ]��n��_D�$���������1;�fIk��e֙|Z���C�|��#s�7��G��E`��%.���3>9�ĪFǫ�F�J/Gm��*����4Ң�)�v˘י��ܦ<����E� x3��60�~��vۋ^��Rhn��C�1W�	
�8��D�Un�%.s�t�,L���4R�xdF�]q���c�7:'y>��e��L��fU	Y�0�y(�jbҦ'��*^����uR�*o�!���$��)4/��a�֪����"J$���j��븊�^9*��1���sp��<�Y�U֙�s�n`�U�u2�/��=c�3��^NY'� d�k�(�Q|�R֜9*�蛆��7$c�Aո� %ɖ5c��T�9��U�o��jzr�~�uF�h�)D'�Je���n_�a�P�\���_��a�
Xf��pSq~�F���0�����[u�Wِx�J_N�*�T�+#k�E��45(�ۢ�\��4�x9%�� ���6䳬'�ܕ&���&Y���hS�spf[�jS��*xC2f�?���VҦ�\o��6$�������U�M�P��K�*�~�V��i�n����
c�s��3��'	w������ce���V%���W���B�!��?[���${Kr�W���ȷ�IP��G���኿��[vVg�K@��6]j�D���-�w��(���W*��d�}RV���A���B��y��}�z����ºCW����)Sͳ�R�gm�i�=����~|�_A�^��>$?9L�7�9�&jk��?p�{V��i��oGM����ܯ/Z��gET�}6��T�(\@wo�������xoj�xd2��-�m.�3u&\�oӒ\�tD�Q��r�<f�m!W��x� �݌�{-�,g��r��8�ܾ��g�����;<�@���f4)?go�;dP����pdk���7c�go���Ϋ�V�I�A�Ij #o������H����{������NU����[�ף{�����ًn{�Ѱ�x���6ޢ�!�֯��;p.'�ߋ�<d/��T�	i`�`���a�Z��WNO��J�y�����GW��9�OAF��x\Wp
��G�'
�:�R��0 �4��/"�PU/s��^e���y�G3�Ş��LjTIfv��8l�+؎|G���)M����)y�Iȑ�f����*XJ2�RUEI{��ϻ�Α�nU��j%�|̒oJI�P٭<c��ɭ��F��zH�|�M��Dh�lѺ=ӛ����P��H��lr|�g�Vs�;)'��K{6�=�� ��P�j7�:3P�F��e=���UyC�B��1�vy������Ub13{���*m�R�:�0�3�J���Dd����/~m�I^�5��|���a��?@����b���    e���{kn��c���^���.� �m��M:���{dP������"b�^K�j�.�L9��;�{�`l!��W��h��$��Sq�t=c�C {W�ո�#���C ����L<4M�-)�翶�I^Y�����K+���� Ml����e��Gȸ�Vw�����<(E����5w/��������>��!�12��L�:ejԏ�}��}��ۋ ���a*���^d3&C +�3�EvG�դ=X��6�[�HC�	�������q��N�]iRVޑm�F�h�����.{]3졙ܣ..ږ�3��qbQA��ڱa�O���dϿ�M)I�{ �2�Q��Rw�rF���N:��9��P�v\�U��JEI�{B�T)+ڕ�5L�ۻ~�&y���2&n�� W��%���&��w�x'��U;�� ���e�g.��FV��J��h�I>wBN�?F�=9~@����6Z5���)Cm�'u-�~q0�_�_^�����}G|��#,[$�M|���;en����$q�f*(}��P�E���P��$=�v,�x�d-Ʈт��8����>aA~������}����̧�b|���������n��3���{���Je����r~�Z�������SRwG�r�����b�I\<���/q2�K��u��}�!���&<o�Gk�*��5�6&�O��L�ϗ��{�S��	�+�ʰ�l>A|��
ɽ�\ޏ��jT+^˓�6N`���s�gW&K��[l�5�2=�L��5��!$���w�q��J�����zo�F���޻�Xr$������p7�qGh4��^�����HvO����~��+#"����qq��A��~>�0��Í��z�ki ������p^æ��������c=��>��Vqɞ�m�o�I#:Hw�QҦ� =SX�Q8ű
�]Q��0�����1e����<fr
��$���=uAͥ��ɺ:��lr�bѶ�@�u��2K�Jdjq���N�ҝ���ժ"�1Q{�k��L� ���y���n��LuZ݀=;��K�LR]B�G��;\�0K[��!pW�W��G�I�M���s�
3�Nx���G��4P�8���V�K�Y*1e�v�����1{�H�@��K�_={H1�H1{ֹ5��q)��[�h�R�@�}�N���z�;{N�nU��p�c�.�1g�[�����R�7P=e%��	gR=�Y�]˜Εz��Xֹ��Kuwa�k��T��Jj/lQ�1צ��2���(/�	���Z��7z��c�y�`�M�6�9�c�i�o1r��#�va6O��o�f�${Ō%i�=E�K6�m�-�D�(Cڛ���&�U�Z�h�T�2�[@��r�g,�u���W�]�MW�����G"1xJm���c��yǬ�۾<o��T�	�ч~l�x���jNH=����؆�h�����w*�4}�r��\1�XJ
�PƦrE϶9�eR���V�,�lBmXч�۳]ӠDqNd�����$�ߗ��|����F�Te�+z�����Xcn��W)�P���UI;a��To�-T��0=O�� �jbw�g��\�S��셳t��P{/hG�\�{Ya��-2?*6z������Թ�=��?oD��È ��(�aˍ������#��m�m���Ya�E�7#��3ۧzlg�s���]�a����r0^���%oL�T�A��
6��6���!3<p7%����6i|7��5��i��Ԑҗ{˯�yd�m�T�2g��)��r&�MV(_;6O�|�J}]���!q��+��3�^.l'�0��mVt��K�����l���H5J�V��Np2� a6��쫗����?
o����8s��(�AFV�ɤ"c.l��0'���`�z�9�;$�u1��5�]b.YY�s�bsm*��%�st�4椓�Ѩ���=m��
@�Z�d�V����✳>��W4@TZ���ҫ|�QF�n�fӝ�����^r9��Q8�v�d�`�]�ST���w���{S�-o���v�.~�PT���m�5f��/�RA��=���r(^]��4��=���2֍F{{a{l�����b�P�7���ד|��/j����>щ�Q��"���r%�s�ʣ�(WƼ�O�V��;��7wa�w��d���[څ��fh��v�T��ٲ�<*M�3�Bg�vR�S�=�F�Ŝ��P`��ݯX�3�hh�Q:*�]�yg�_N>̩&�Ǫ#��
H>I�"���Y���z�-���C��U+�6��Uى%���xG���HޞG�U7�����&�'�+}d�1�Cf#���E�	=,"y���S#2���@�V5��Ͳ]���p��rU��t��I�m��.:6�|�˛E��4��m��]�L-&��-'�:��CB��:nh�v�Qy[���<Je�l�`���`W7��d��&�em�f��.�g��$�k�Te[;�����B����A.�F� ����ŗ�=��u�'7��Z�2�s�G�YZcf��!̈́���`���_Y�}E�(23��aՔ�[bv"7�ؑ�.�+̞�s�5��F�6����C���)���n�Ͷo0��أ�_���Ѱ�l��9�U ��bZaf+�-�B]�¼�����2"��]�7V����)�����s���îks�{^o��b�M&��Oh��⯙F�{���ta?�(��#~q��[��-�Aܕc�B��@��$���3���!�5bN^��g�.����gG\DG�S4�g�j���X=(%L�������>{G�g1��y�8Kp�6����;)����=⮣*�;)�ϰRĆN_���z�4)�ϰ����yf(�1X�u���<bYz��^�� Lm�Ȓ<M�&��n�S[`� �M��Y�;Us�����βk�Goc�C�R}�]X�y��$�=�79�"-������{/�^%������#�ȢS]6��l�~dZ�b��u�7̖��?�����hވ1�D NbL��h�����`4o�c��e=�a��+z1�d}=%�4tkE��0����+ -i�F�qc`F��'�ԃ����E:4�^�o7�l���-�T�b8g��1��*k�2�xb�C�ٞ���x��d��(��n�NLl�j�,�{ǝ��j�1��Tj�Or,��H�?�z�R��Y<v�_�v�`��X_,�a��ш���eK��:��8�<�I��
��!�~p��3dpRUT����`NV9Y6�C��P�f�đ@`C�C�6��Q}��it��-��d�G��f�3�D����Ҟ��#*bK����{�>l0��Բ�%���'b��u��Rk�;�a��:es�N_6%��,i�,6����)�f�;�]xl�3{�C�%�QxC^�+�l�0o�sb�2���.��0g� d����Q0����R�ڝc��anJ��P��&��W����EOl+��fw�X2dB,{ca..h ��,[\b�iz'���5M垱0G+�Q%YB���YZ#�*{x%��n��,E��c�9�Gq�2��0�~YoC��'������8zz��EvA��c f����:��9\1����u�┯�>�V]n�(���5��B.{�ohP��P�w+MX��$��u�����_J#�W7
�wv!�}�5�&C�e��4G�V���0��L����(���s7(Y���=z��s�ńb7�m�[c�Z���%��.��`�2�6]7��ƌE�,V�'�(������8{a�0K��*���Zwa�Xal't��#{7�cR8Z�3�.�3��1�΄��u�xk�L� r��[c�vG7F}{z�h��h�
��{Xb�:Ȃl;7��μ����_�Q�ֲ�n�t��J��id<
fL�K=х=�f+�QC�ӣ`��qz$�[|�Y�PzQ�G#���t'��'ֿ�h�7���|*Ԏ�.�W�#q�'�/�%z5�;���Q3Ȧ�/
�W���1@�A,M@y�ñ�1hU�<��@?�e{�	��.��h���,�e��/�b�1���
~U^V�Pt�,�F�X��!�1��@�#�'���]��튩KT4�l�@���)�q�I�    �>��ᓪf��溦_��8K�`��ɒ��`�GnA
J�?��6�����wa�ο�X?P��]��a,n��"ݘ[���;�-�`�nPy�#�z��2'�l4�4	''��XrUm��a��S���Xș�ob��;K��2�nE�`��s��L���U�tJ*tt�aX$7�-(7J���I�Qu=�5Z ��2+�ƫl�ɺ�s�$�(eyc}�W,N�>���ˠN���AA[ce�ٺ�8eC�TA�jA��@��Ti����e����AQ��15躡��
�B�&�Q���c� �3�^�*����M�V!	����S���J2�*�����Տ-�)^� a��4�
�e2\wG�3��>H�S�pq�3Zh�i�Qx�%k1h�Lʝ��*y���e=6�����ju!?
�R� я.[��I9K��w�t�� l0�&	U�#�֗-@�`��%��.���F��')\�7�QQ�ڲ��x"ot˄!�s��-�XcN:��,�I�_3.1iM�i|ant�]=6��(�$k�B�֪>��kv�hW�]P�/n���\�^^��9�t�;�9&��CdhS	������aLgvX�w�J�'"�$�W	�L_#=�8Y-��|��"9��M�$��xL
������E�73	�9ON�\��q�bvɎ�n�9�a
1�\�M�.Ǚ!��a<�E��f	�MJ�����,�x���&7������e�����������������M
����Oń?���������w+���������������5'��~�1�T�����ۿ�E>������/��_�>�����Ol���i�~��e�ۏ��O���/������V������/��������˯⟩L5�D���HɃ��[�b.�3À/!��e�b�=��Ʊ>Ͱ/h4�%bUn�L���H��L�I�y[��;6��S�}��@����8�����[�G��g��2csh���0�����%s���:P*86�ZC��&4�}�@��[Ѐ�ӠSg�擼�"u�tVj�R�7��>��@��Z�[̀ʂ�|Q�9��Imj�#ÙT�����K�I�aI�8�ܨ�sQ�����{��Y`���շ�6�3f����M�#�U�=[����RΈ��TEv�ʣ�?��c�w�G�lo.��5(�ɫm1���4�R��(�kb%>��w�|cK�,���U�������Ad]�ˎ"�b6L���Ax�@dI��%�(��6X�1���y�-fiF�My�����3����?b����gbf{�JH��U�j�9.1G'���`����{D��U�j[�=�}���9we�hESu���
s5LbQz�M�v��ω�b�ű܈�K�Le�^��ι:���8��O��x��M�e0����%�f��D�<�ޚeG�w�t~���)�������ǿ�wi���Ͽ��1𹔨+�?^ܻ��%�͡�֙��w�eƪ�6��5Ɲ)W4`������d�q��2I��a���R<�������W˧]���I���2����)�⊪� o���0��LR(I�T����.��3�@��{Ř],��φ6�A%!d'\�q�WA:����S<_)d���/k@l0{Âi�`��������Qݮn�抖�K�v�o+��$x� 2���b���K��e���!˚��Ǯ���`������x�0�s�d�Ebw���*/s�b��Qx���XS)�G���d�t�Jg�9]��ܲre�[鏂����Ҙbt�v/������m"Lp�0�3�N;'�p����"PEB]8ų��H�)�G�_���]{�`.C.cI��E��L�PZ�c%wa�~�9I��(�t�s�I{y�>=
f�l�D;��|�t�se���.��u������e�%k�#F!��sr�Q0���ދ��GhV�!�`%e�3���9,1cQG�_=)&3��\7�N䵻/�b���";�eL��i*W�C�H����R׶�Rq���*^�{��5���7,;I|���v�����II������%��������/z������b2�/cy�i@�����-G�m�,/���Y�JS���D�����2����r"͙>E�%��A�o`�����i �54�ʔ:J��~�Y+Cfe[C��ݕM�,���ޖ�A {��42D�������?�>Z� �9$坈-�u�׃�%�q��&D^Q�3d�m�hw�,��|�ٲ&��u�YB��zi!J��=d��@�9W8G�LBN�9�٥��=?���������
�W�o�hQ�e-����v��=M⿟^�v�� �j)�� �C��H�m��|W����@��g�@��v��f���Y��!g���1�(=�
�_��v��U��!� ���v�����b�?�;��5�^:*H&MJ�j�L��
ѬT�[�o���ɜ�;G���/!����`����^A�o�эAB�A CPZԹ��d$գ��T�m"}.�.�WV��%k�6:����:Mn�޿�^YA��j�#\�$H�Mj7�v�����R�,[�+��x��4����/!��GX�Y}]���̐���3�[�B.� o�#]W� W�r���>��U�4)�u��
r�
�X���$/��N�2,�q%���+��g��H<�&yS�J/�u">�a�1����@���j+K��#,!���F#���ْJc�Y�K�d��ˀ�d�$/Cc���b�rW���/أD�\8������ �$�ǀ��ƏR�Gy�1*��
��U��B&��R����">R�X����YK:*��L���Ư��w�><�s�"Β<�r u1�a�┕��L�9.!��h���]X�� ���8/yj�P��5A̮�oq���� $�<�HW����1 �X�[����x�,4�Ʊ3�MB~��w?c;�U�U	�|y:)���$J����=��S�I+�I��R	�}�?L)����SH>�%�I+��p9�b���&���t��|��Wk��m�.iP�"S��1����@U��[e2_�����r��	�r��9,S��V�o!7խ,�k�΁���m�T�]�?t��5��F�\����_~I?��ݿ���?��?����5��j�(�a��/�o'ie�T�@�G>+�W�$�)�~�?�-&�R�$]%�&���c_�r�%u >O��{��d�*I�i��ϡ������خƖq��7b 4|��P�n��<��iϗԁ�?ˇ��	��H�4RF�����_J�B��AG��P���9�����L*���1�I������4o�$R�����T��</�Px���y�����_�C}��f��䢌4!�E�r)]ő6��k�%��_Q��vm�!�.Y@v��Ø�*,\ѿ+U��1�؊�ɷ�E�l�:���੣~� 9Y&4�����Ix��V�ߙo5=�w�.�������
� ܖz�%���D�F��I�ar�L�J�����W��^�d�K��X�oʖ����I��$�ۥ�
r�À찤��S�PX��kP=K�b���k4m�tBo4l����hf^
�ً��,�,���]�ؾd'��o'9e�(���X鴁,�TX�Z�zd��*d�8��@�3��e6�/��K������OJ{�N��o"�ۥ�
2*�Jcd2xI۩2�ȟ�K(�N&Eg�I!Do�N�>O�4``�����/e��UHcj�[V��N:-b��TPv�o�X&/��0�cc�� G�epcj�$�09;�=�L��'b��a�	����R�fWP�H$h�6�M$�tZA�X��RK��+J'k���X:�s1Rq�P�v�t�O���@� �ˠb��K��s�L�.,�`�����E�MI4yf�(p1+���3SJ���j΁3�QB�E9�ܥ�E��gj�S���]�!^U�_��_�
�,A⢣1T_�c������?$/�wf��?�ٙ���d�(L3���W2����j}$�A�����	S�������h�)��4�NJ*�xSJx�#
����./�?-�>�J��.TM��C��3�^��IC    ��0�B����z\n�Pyr�4�N�j5�@�c���|5}4g/B{h��2�_>nƉj�;�|9*�:Z|�*go �<s=F[6�.��r �4N��I;ˮ֘1>#�^�a�1��c����v����P�gB"w��r�����q�M�a�>�cVNfsR0��e���Pe�D[�����,�H�|qڄ���Ͽ�����"^�`����oǟ0�����߰�������L�}�ӇZ���~��X�(Oq'T����F����� �1 ���r�o�+�s^�O[Ȭiʘ+P�e���,���|H�r51�+>�z��7�yc�au��jr��p]�� ��т��ǀl�\e�u��b�"�V�M�-x	\�u�)�m������EuF6I��e;���$�r��z���(pX*�����Ǣ;\��֐�m~�2K�"Sy�����i�RE���}9���hVpl��L��l���&e�g.�V�[d*������.5�RC����c�=������� [e��24�/Y���'��M7T$cPj�J.֤��WD�����R�s��[�$��#��lм�]�n/ �0�G��
0�Lt<6c�����zO�@�9�N���үf���m�����?��>��J[�}����W ۧ�
�
M�3���E��|���e�K�S7����ʴ���y�8]A��feF�M�	�(��`M��X���9��e��J`t�`�(�hiTc�3��O
R $'}y���v�(�d����T�`\�>M�O))6=+M7�e�X�3�[ ��D�T��[b��U�!��K�NU<��ج4=��[��^� 6<pL��SJ�Ob-�z�Y��KY�<d�f�����r�n��vȲ��R��4Grt
�L\�	�#��K���q�e��k�c��r��*�)��gd��.I�A {wK!Q��[�&Ƙ��H^|�dk�����
!�
TUR��rU.�B�����:���2��i�7co 7d�F����^�c���S4HM�s��IU1��Sz}.��6>57��k�܇K:)l:�sH>�%���0���7�*�1Z�wPI�T��%�ɝ9@���<��Z;�bj�x�w�h��iLQ5ɲ�<��'eeP�v �`a�����6�$�	q���JϜ�Ya9��1z��� ��2E�m=\��6u��K`-�Ka���C�����P�%ȳ�i�g�.�IV�2Jk��/em������/t]��@� ���=?'U�f<×�݇�9(=Zu�s�eeH����M�rV^�����pI)�Հ���}ȵ+j#sU�9�1	9�^T��˹��P�C����Ѡ@�a)�|Q.y����z�lN�4
�5^����!�.��}�:�d�ᯪT��&��p	Β��aO4���A�D��c��z_S�>\b��fD{:��\�1+�#�?�O"eǰ�`ͱ֟�%��.�3t7�{
��=�-i��X��d��h�,��� #�ژM��K�����{� ��/l��cS��<����2�i��xJ!Jm�m:�fPni�(��
;��F2�fa;�=���
O�� 3��
Ҧ�}���Y����H��ϚKK�z�'�R0�]}� X��0rb���� ��Ci24�2,�|"�;�_� �9b�Nu��I��uIʮۃU�[����m�e��I�U�"�l7NΪ�-�|
�����09*�NޥDC(��y�*.�C�ę�+�����j��H���Y8�!{�U��4�nK�ߗ�z�^ҫ妌����ɾ�0��L�̊H�!�l���q�0�В�.��踚����ZW�J��X�}���n�Z�'*r?�/��Pdl��
�g��Jc�fÓ �dV��P�]�4�\�U\�qI�+�������>�7����|9gH�)�p�����S3���m��Ȏk	hRڽ���������3μ>��,l<,���,�c�|֓�I��|���-n� �Ҳ�7�΁3�I���2���-�A�gF�
�R�ǤI�3���7�Ǽ)��
UA�g����J}�(_AN��؍�@��5�L�Kv�W�yؙ���t��B��)�Dt�H�Ld��IA�ؤ�βw�/��7�ŝ�i�U$���7:V�o �R�*@82�@��6��12����.�C��[�+�t�P��j���oNk�!jPl��9��iOg�1����p$��֖Z�>Q��D:�*�(nۻީeL���b�Ǯ�e)<,�� ���ݠW��s����H��ۆ�w�2�Ȅ'jUB�^HS��N��@����Yv'�#0Crᗗ������w�������bhYj�r�������J��%-��	mz��3j�'ju�M�7)���\��%�.����r@&v�
��b*���/X�wR����uX�]�?�`h��+)�R�Ȣߓyaϩ?���#��.Kb����f�Z�H��j�S�ǟ���_'S����c25����O�X�4��`�z?�Hq�O�G�&�
v'�M�iB�c��_�Ǐ�����j���S�/�zP���ދ��4�����7V����_O���F$!==���}<=��4�Qߕ����ß���?��.��A3�IMdV]���ѻM&9����}��G����>���~�ȇ�I�*�R�l�����zZ�#���k���3��v������-��q֪4$#�Xi �w*ނij����~.�G����IYz���U0
ܢ����S��kp�A.���'��ί��:)�iv?�WU
�l(܇�?������?|����~��~d���߮a�vVvҊ�Z��*K��dv^��_��g�(n�K�NلM��)`8mҘ#M��C��Ơ���\XPɸ����A�S�,LS)k������_h����HUA�$m��������E��M�˄����Y6�����nQvה��A�њ�o�Q��*H����ML����v),	�p�^ܥl��~ZU0~�ͺ1o���!;�.`Y�����9��(�6�|�� w�E&������e&戵К����%�\/Ŧ�+��>��бS�G:��{���pu6<Q�E���y]�_Q�z�µ�ғ�<��1�xL&��N��_Ҁ@YiL�!��������w"2\:X�:\F6*V��pUI������8J;��SQYF�$��L���ɠ��ͭ��bQǈ힎Uh[�A�<ֶ���d�}�^�i��>䚔��	�n�a�IȾ��ns�.9њ�T�R���`�P|O-��*K�����gc��g{9�l�
3o.�ܢ���g}Y�[C�zL����ڕ5F�iޜ2A�@F�dPG�U�+�dRՎ����w��+�R�[5?�C~Y��AyL����16*���J����Ia�&L�H{�����B��~��e3_���9>�/PT�=�
���c\CvLs'C�2�䂐}Rv:�6�$���אC�H�ؽ�Q ��ѹi�di����2Iۧ<?v/��R��򛟪!�Ln#{��*�ǈ;h����H�@��^��W��U!�m̡<d)$C<Ì���c\A�A��P�l5���KA�;=FY�P��/��.�&2]$֩+=�VU�:j��ٽ�2��7�ϡ�6Z�*��d\~*˲Z�������{)�q���q���,0��94�d�$�v�X|�s�b�3�\6k��(�^,��2�I���Mx�KX�&�XN�ӌ��'��o���&pn�w��7A�	M^@+�����c�n[�MU�j�އs ��Z؏�x���L����E/]iV���� ��;�ΧW4���.R��|�*�d�|p��O%-/  3��#֞��w�H�kҢm���9F��$z�'��mc��M2M������i�y�-v:�Md�����Q {�|�y��9�1	��QZ��dp0c�l+�A�B\V8���" 3�4y����r�/�FL}Ƚ����u<�}ݕ�W���`o{��$�T;�f6���m�<��&8KscTM#/�ۃ�	{�1��Bs�_�F��&�p,�����9�&]�޲�U���tɪT�5��@!�1�
�J.,�wzl�>� ��!�    ����y3N�
���n�h+�|��@Q�H�	R�� *�cF\��rw:�� ���؊�g��a<�M�[]��4#%��^I󷋧d��U�v#�����i2`v��8�Uj�FΆ�%w�W�!�O�ܥ����;B���.q�4fI��I}�
یhᓜrV���v��87�j���>� �v��<yP1���Ҏ�� �@�)�=�� W�*P�`�KZ>���%F_$=QzK�B �MO��[�Q	�%=�'y�Ź�Ŧ���]<�<����U1ȯW_\��6��xH��P�m����!�rؐ9��uL�2}�d�KR���Ǌ�-�̐���&M��9|���*ri�Ƙ�ܒgS"����e[� ����#��|�����d9Y�e?x&�9�J����g ߕ�אKd�Z
FJ���_P�x���\ 1S�%�=��&8Ms6)�P
M6i�c��L��k��;�IK*�4��94�a��-Z�<J�m)���Q�(��n���՗fb-͹���E���o��d�����$6��:I�p'=,�ns� �[fƬ�.@*K�"�r���LJ;)ȃ�ρ��k6ʎ��� ���F��gw��rd���ͱ�!��J����S��mZ4�1�S���S�rRV�-�����IQ��?��т%.��`]圛����2�X���\P��Ɔ?��`�@f��˺��z<��{ �'���z�E��wB^�2� ����c\��f���0y�W���M�-d��4��h�仲�2�s����$� % 7H���oD:�C�I6I��I8��KN��h��NIGd��86�ҭ�U��'��S	���>�HT>	U����v^�Ғ�bX] ݊�S�u��~�ف|�+��H��c��0�8��ͧ�O�3F]�-��K��:dj&��޴��u4�6@(�6���$Y6d�vN��S1z�T�(2'LF��~U��@�N�4l����s!�')��H��ʘp-&�2��_Vx��V�*�����܏�ș9����A �����r�f �, �(���,�F���=��8Cs�,aU�dPE��_�ޅ9�Go�l�d�1a���[g�N��[� �<��,�	ON�]�1U�o-�y���^���*|�m��@Q���Lp�ڨ[�Y�[���s �dk+;�^�L����ѕ�����vq�z�GS�a2�w>����:�b(�P,��|6k{������ASOe��^�ݦ.e�e���ebBtP�}*[Ȥ�H��]}է��l{��t��C�)Ƞ|`ڀ�̹��tz�S2h�JmV��;Ab��N�-�ਫ਼L�_{�l���W�E�G]��U�IEA�ٱ²��3�3j���n`?)��#���}�ї��?Oi��c��	���;wm�Ÿ>sWRE����K���Z[j����`�-���]rZ�v9�as�5�Αd��� ��>��i�4�Q�a<����o���/�'�?�=�o�������2bk'����J�S�N�yف�"������l!T(�o���~_�`9�*FZ��D{˛c��թ��|}ɮO�l�ds���j)B���jK]�^���AD� �|6�{W~�����U m.��Q����
SAD[��`�����,�.+�֐�$�2�3�Ě�{�5d4
�@.�_V �!3kd(vl�^���Đ��M���,�O��Ӟ*:������I���3�4�E�'���a��I�%����N������t�S4n�^�,��T��2t���*���]5=��̒�ߖ��rUj���N*�9V���@6�����\U�n ��4����&!��l8�=��C}^��c2���.�d>�T(ϔR�E~���db R=f���|O���,�� ���`�}���I2�c��3��)?6�Y~�.���0���c�HL�h��_H��1i�g@�e�_l���q��A�Q��=<�ct^�0zw&�I���g�MJ93=�cR�6vs�:�/�� � �.@�i�1ٟ��{��� c��u9{���0b@�u9{���("ϕ4I���w�l��f;>�Ip���Q�fY�q��l"e�a��Ky��;�I���2{���|�MX�4e����r�3CR,���N�\�3p�-i�"�NE�Sq7>�o����n/�Th27��������l����9Y�3�� �
F��ߓ����i[й{�J$��m���Y��O�aIvi�u��Ob�b�p��T��l/P����N^ U���ڱ�i������ ����=��2[�Q��	��C�)�l��f��"�H>^�u,�謍�a3Q�桇���>��bx���t�L��I�iD5��׍f�7�s2�0����*˘ج���p٪���3:��7���=3ի��dd��f��0�$�(]�%���dg����ң�������ݑ$���+9����rT���̹/go ���J���ܗ�7�kUl�����$�_0"� #r{�����Rw�6���Ʋ��c�3��S٤��%շ�s�_�F� kd{+{�e�����|�M6PEU�OW��SH�7֔&$��"�^lm6C;��`��v�t[k������ߵǣ}\tK�[_���vI$���q��h3����Av����|��@�9�MSR�H����]{�:bjŧ�R��,V�"����3���G�=����VQ�c@\���+9���|���s2�*M���kl_g�u/������h㍁ܬaM�S�G�KT��H|�:�����u���>������A��c�g��@iJ�hѠcA<�\T�"��9�arU@TQ���r#,�F����(���;�
yZҀ�H�����	�g��Ls՘�~*�x*�����R��<L^�*�J���T��ٜ�|
Q�W}*ȬuIBi��~�'!�4֥"^M�0��_Vx� 
�8�e�#?{;w�ײ�ۍ�-�(�4�3��!Ǧ��MO̓�_�x� \_���@���94�d�MV΋�N�_Q�eX��Xs�i=�)���v&ս�zI�7,�-�0%Q�$���v`K���5�t=�@T]fx�dp����jM�C�3�햡&��ρs����
?i�
�5l��	8Z^ yl��q�������rSFF��$�yi��_`5Qk�e�˳_P���vK��qI��*��LZ�*rRm���h��|�����')�,n�I�/��O[���TbN��09ǿ6�1[{ɹBds�.C�2�e_O��6c��T���_$;3X�5Oz*�xT�Hf\���+���"z9��Ŏ(��y*|RP�K������_����%=@�����0� Ǌ��$�����xd��\-��'Ν��{�KݳM �zt�<���?��>��Jп���O���g\���ퟟ�>��i�Gl����\n�m��T�Q���hF���ء�0^���#���̂���t�Sئ��w��w�F&s�H�c��ǧZ��L	���E�����p�Op���
R����5�w��4v�+lѫ^��6�+�e�������Y�Ñ���R���YA&/��Fe��ל�g�o�H(I��x��"8t;��m`I6��k/ge��.�dU��`Soa^o/�P����m�� ���I�Aj�=�Un��_�s �d%&�����d���i��u{��Ӧ�tB���q��%۬�(�n!�|=��; 뻝����A��K�;紿��v��/>&��1x�,v!Y�q+��㴑����A+!Ϣ�-�BfH:H�}��d�@��2�t:�ʓ�+��J�:�rɾ6C���\w(a�bRp.;[����]�����u�J��~���I�HJ�b�x�ǽ�Ϧ<��jk�įU!	�l~���:X24~�����{�)B�~j�ڝ�r�
���1@�0�ȟ�Q�/||�Yti�;�vaj=m$je�N\�8��k&U���:r:��һ�`ɺBYװ�+9x�����%U����n'Ee�)�8���V��������e$�5~7�NY����-K|�*��ݔ�e���T�e���s�<�dҏx
���*�y�䀜��4O6]V�, �r�Jnv(��`��!FCՇ(    ]T��զ؝�mm�4`��T6�>!��IQas>k9V��E���μ'k�ib���$'sTƐ�c;ڶ��o����)B��cT]�cN�2��[�DlR�ԇ��a�i�,8GMUDS.*�����>8/*���0*H�Jb)�wg>s3d��o�r�y���6M���Q��&�t��2�['R=���TvK-���[Q�a�K�-��7������:����
�2ݦ�m�Ϩe�V�,��ds���{�֖Z`��U��I�0�7z����8B�
[�

�n����i?~�s�E(%����O��ª����7?����?�G����_����.����Q������+�8��u<�+��_[����o���5��~�/U�+�Ϛ�K^��s0̯Oϡ�4 �U���w��Z�������?�.�zW�B/k�~���~���u�پs�3jE��Z�c�l&J�	��`X� l��e��?���nʩ{_j�+L'Y�D�PcU%�1 b0�k����6r��b�V�<�h���כ���Av�ˬ����Dwz=�̐p���'��=�^�,!g�l��u��wz=�\�
 -zb�]�^� ��z�4�Y^~!S�GdJ��g�i%Θ��	u�[�i��b�c��Ğ�sߢ̦t���N�{R��0?1=�Է�t�]o2�6�$c��r�#Rn��(a(m�9���$g4�NH8����(mUTR{Ɔ���8�`�$�_���#�)�������c1�p�4c���Y�AL��E�$��`�%�����K���sH>�%�U���5�8�.����Y6��Z@*|~�z��~�A��('�k��W��u^�Ϡc1Ʊm �,�a�ų�
-���4@ݒ�QyB�_r���w�K��� ��;O����NX�O4���륵K� dG*3A��	l����rm��N8k�4�M�>�����I�
��@����o-D0�%�"�A��j��Y:���b
G}=�Uc͌	�@�9ȥ�k�� >Q�W�j�E�m��"-��fZ���w�O��A忕��f>[��-J�e�p�K�x)[�Q�>:�B�*�m c���rݿs��IM�X�t�P��'�,��=�Y;;����.=�`=V8y�+�R�#���p].YAvl�ıc����F��Yc����k	�����[��P�c�`h�?�G/�;��ݛK���B�hƿ2Y�{����{2�r�!	Ui�� ����%��o%-)��$��i�	�I��.�%����l��[!�d�܇K��|.�ΜC�).I
{�}	{Sh��$���� �el�����~�9�L�5�&(;�b7���j{\�횹�WI��|��*T#4k�f/]�Q���!������϶
�3C�r�˘����O ���<q=&K6�A��Dk�Qe,c��ߓP3p��[4�ZOD�1/a/�SQՎ`嚑ɀAB�z��du������NP�%�N�H�
Ɖx�8)*S�(�nv����-�&�1����I�N�0$�_ܱ������u,�s ��$M�V6�G�/Y�E�1F�"-�����۞�����-i��ee;�|6>)�^G[Q<��,*��_��R-��T������C_�3�lN�8��E_��iʻ1!e��׷Qyr!�
�8�暦��ܒ��mI;� �`an;7�VK��n���4�F���J��L����{���ka	T��'��>���}�Ƅ��ɓ$���7�����%@���{9v�Fr$�cr��ی�~"�;��(�1I����+���%�O��$�W26����M٥Hq�]{��ְhh�]{Y�1�b�:I�,H<Ƃ���%*�֜�%ӌ���۱�#��
�����I�/�"x�)��oU����o>��S\��)+�F׽�i9���S�+bKBf�JZ�N��q)#b �m�Ԝ��V��>�
�H�Jչ6f�S�J*s<�V�B����	�9�ar�T���4�Or�J�y>v���KH��w��-%� ��ٺ��6��P.��jc�!��3}T�s �,d6ΝlM������}"���NQ���xc[��϶�pII�s����y9��a�ˊ�d6<�(��g
�^�$�%���%1�9$��V�4l}=����i�4�8�2�M������`b{s�9�K��y�%x���w.�*=�T��K�qKuPbp)5I��B���D;����B WA�Q�`"�1NboQ�Sd��=-�+�����j��/Q�Q=�����2U%1����@�I�E��"��<�%��J�T*>�����
Q$$�Λ��|�ݫJc����0_,���@J;�A�e��*�[�Iw[ʘ֔�����1�f
:�h0�Pٕ]��㐓Xw���B�Ǧ�]>�~�l�o�K��_��,Ї�~9��%]5\��� {m� ��3-�o��4d*PnDy*�gߎ�����1�q0ڬ�G�E�P5��$�Bf�a��V᪌��Qy�B�^�ʰ�L��ω���Z�x���o�����{}�q��AA����2�
r���~��S��)�ǘ"[���Q)-�C�I.����E�zϗ��1zd.{�Ɣ �c"�9e# �%23���kř��'U�E%��;���>u�0��7,�j]_r�ğ�q ��N}�Tk�\��@�9ȅ_�BD���;_RW�6��1���w5t���~"ߕ������o?~��Ͽ����_����j������]Q�.ީ�+L��Á���j�s�k����������Z��PkUa��-�K.��=ap�7KQ�v!a�^�)5���o��-i�+��&�q��I�I�/�z��3�{[�,ChX��O�ת�;��c��rW!�E��&!#;r.�խ�_UR/ Gv��)/��䣾/c�1�힢���QI�I�'q����-dKg��U�d��-BBX�}�><�����
���YV�$��.>c|zj�$��(�V0*k�Wŗ!.9��l�.&������8v�z�!�Q��K�3�Q��N�B9)5�GQFu�6�_r<�w��Q�43�j��
�p?���Q���*z$��92�A�2�AJ⳽�P�����RЇ�Lr5�\��Kt�4Hi�쒓Zg�5�G�񖓊?��{e��W�'�g1Ve˚����j����e_�
26-Ӧ�C�Yȍ��2:Im�]U�Aּ�ˇ��xu7z��9\�v;mٱ�$C^J��r�r&�W����x�����6������OrI@��
咃�u����P��A�t0�M��ޫuI/i��R������'�TŏRewO����F����2�?(�Qm�`��������ρs�)�<C��q�咃�Spf�?U��P���kF�3A�%�R-.����hc�����4�|�A�S����F:�᎞hp�n#l�����#[��������di�̚K��09�R�� $=pS/�u�TrRƍ�O��[o�O�	��@~����� �E���v|�$PH��J�0d]�v���i�T�v�����[�j�'��j-�f��O�d������6A�^<�-��J��/h}�w���h�^��@�g�/� K�[֪��>&s_�5��o��ț�Q�7𻫒|�����O{� �KWE^���W��1�o����2�N�lp�䵱Ƒ�����]���t���n(��j���vn�	�-h�LTvL(����|���J��&:\�>9E�T�?~�*#�Y�'�[�%}���w��̄�u��C}d���Z�[�x�.ޗK�.�������$�V�9$�p�@��T�rX�yUw���t�����k���/�$����w����/��b�w��Q���r�; C-r���s C��K���E�l��.TdŰ�A,*HKJ..̰9��T鞤�~.�wK�dn�䒞�/+�t<���d1�e@��zd��4ʆ#�.�_
[��!��d�B��b�纩;_�1vI��c�V����'5�X��w9��X�x)Ƭ���e>~��\����I2�"�gJXO���� ���4gB.,=�4?E),�+c�A��k�R�"W[�eI�����2g-���c3lʎ�ξ�K��
��z*ڎ�F��1�,��� ��    27)��e�s���6��Y�WO>�?C�^~�̩����2�P����A ����_�e{9�I�C%�c����pL$1��K�T�D ]Vl!d�c
2e套>6�+���ڬ�WYe�I�"� �r��HFY��]�ޒnh���H�c�l$ �b�f�{�+�eZ��=g,������q{��jW
eP���y"����Ql ��0B��0��ޔ3c���������Jdq*�d隀�bk*Kl�eN\��5O�]`��ծw�ʄNa|�Y���'�vm��*��E�W?�!��K�K����ci�#�#��;ڬ���5�-i��%1r&��q�,�'�w���3�Iy)4�aKg�l��f7�A��1���s �$�
^���"��}���}���M9�N"�ᴄ�{M��,xd���cj���W�ew��hg-st�4(l���7e��l|�ăqX��g�1�N��R;�&��m!w���9�\ρs����G���{�����Ki��H� [)ڗ�/�i�w�m�l��43���$6���鎡Z���Ϩ����r���_t<��l ;��.�Z/�R֐!+�n�K^I�I�L�P;6J�e샂p�iy����4z�s*��$�居�U�� �~]�����6�����(�Y��2��R��6��^V4`���(�\�^J�䋍MdpO���JEz�F_��6���ƊK��@f��ǀ�d�y�	%��"|d#���pP����7���W�UI��\�Jai�.co 7ёqd��� Ca�_6	��Y�$N���.U�0��l��\jJκ��[cKz+= ��S�zO4(ؼ�(�J�^r@k�h�U鞄��˓�{�K���)��*{V�2�2ú|Kiߋ���B@/Cm�P^w��$~R8TY��,�e@+�xd���%�i�J�B��0%��>i��"�ܵ�&�;_JqI�B�����M�9�$�S)q���s�8�S���&�vU��@���Xh�ʣ@n$�d���,�
�z)˫��WTT,�;�4d7�~U�G�+�Q�,!�1���
A�SG^'������DƂ;��8Gr0ɩ���Kvp��3�^���۫�y�?�	{�#����,�<�L�q��^���cq���}*����M�'��}��c��>�>�5Jޟ&!�N�j�Zig����K
3ŧYS�Z�i��w�%d��<�&���,�r�d��x�2�ִ�1�\Ci%�NqIҲ�I���gCY�`�T�f
�Nk�2�M��E�$������ϊ����2�L��a�9�a�s����%\���X�m2��E�ޙ�V�^5NO�F�A]�v��B�q�����R��1����{��l�U�n�����?� �e;j���f<�!{���ʢL;-2f��{��R���K��M^X7�}N��>f���j��%�}��.��U��(�i�Կl���:}@g��0E��n�K�b�Z��׾��?р���j��lv��� ��>��vD�?�t��'���&Bdiܓi�"5�˖ʫ�fP=X�����9�s�?/A~���J�����㯿����y�BFʌ�x2���mS����}�q�c��>��a����hވ1�T$��K��hU�#9����n=�ə��W�n��߈fw!�ۜ�b��6k�KOU�[��c�'�'Y��G�@�@d�"��p���g�ɟ=F�ErL��Y&�A��8Ə��g��s6EP���Ҟ_�y�'�,��.c|~%����3@�9,å������y	�m�\�O�C;�JB���f�$���2�$�w�>?o� d�D�k������B�t�}�v�+�L�w(����\ω�hQI�< ܚd��ZU�[�4���u2Ƭ�=�Ը����� �g���U��t=�<���
���y�	��ğ)T`_�e�8^��̔���kT����l��f]�|Ѯ���T��5�T�)��*��9f�j
���݁+�I�T5�q�G�)��T'����G�31���©�n�L������z!�)؋�^^f�2 �T���h��x�O��ŧj{��*7fn'�&�=� ��M��%��Ƙȟ67�O����5�;�\ψ�����k=�KR�UC�M��{�Hh�P�R�p��*-�2�L�[���lT����L������'0�o����O�P����m�S��r��=1C'�%��d%| mzÉ���?����'���?S6���6��3E~�8m!�Hᤢ�$�G�$s�7U��r�O �`��Bhw����@�H�!v�:�M�'yhFw>,qb��_�������-8��]���\��>�:���%��df���1��Jk���Bm6vŢ4`j�
KҰ4[jE�cH�	�϶Ӱ)��Q��4]�20���@�,��O�����Ƌ+�
G�!����� Sd�ӌ)��IHl-�r]��	r$���0�ےA��c�Dvy��*4������
�����,�eu�'�F�7՞4��;�����ğ)������mа�� G��qWՔdry�@jw)OC��g�	M��Zw�r��\�N��L��� �F�O�F��g���$��D������)�@>�`��������x'ѝ���5�l��OG�7����k	���2��G�zV�ڀ�k],_��&'#�ȗ�V��?��c�șV�X˝D>yJ�2�<N���%���J�76sωm�אR�AUu46r+O��܃I�T���k�N5�3#�~��?p�L��8�o� g.�2�_J���� W,t���*�I_тw>˖+�WXRi�H�aC�QMqOWY���sn�q�ѓȍr�:x�'�F���$}�A����s��2��4��^d�O����Y��-�rcOoCM3���.�F���j���{�f)�����JЩ/_0�@nZ�kɥ���i�w�,f��C�RY���G�zF�B�T)�a[b�,y��7Q1���1�h��Y;y��>�ʱHSL�2b�\�O*��g�	%�y�j�_��<J����O��'X���=�9s�@��>��dZ/�0"Ē=�X�`�ZW�t��Œ��-ףw.��(6��6^��|�OR`�T�p��i��~.A�e<����cJFW�5e����sJi��(@^qe�����
.p���ӥ �gc�� o�{6x�FJ�Gm��w��JK	R�GiI
�${�Һ�����pZZxCi�����Ç�S�_��������K����X�%YD���y�_O�^ZJ<�.��hd-Hu�*-�>I�A���g��3��JK	��E���t*�:�uA畴�&�7iER��A�n¿��ky��Q��=H�-�J�*�tP�\6���������w���ǉ���P��B��Q�՛��ޖ���D	�?|����_޾�?�����_�7d������S3pARv�UI�>�S�ERDod�o8п�W�r�>���r�D\���rVZB�PZ_��M��������w�D*��VL��!�\�9TBO�I��P}�ybA����Ԡ;U�?)�vZP����O��;B�?~&�iE�g�+�i�ii�J����?���G�x��|�Zd�ž{ɤI'����uh��N������^�qE�7�����v!y�%�з�s�5��m�����5����ݟ�V���<
�1;O_�{��[	j:�x[��u��~�?|C#�ʿ�qq������8S�G���$������v'��߽�O��?>��͟�_��������?l��,���b�b��T��I	چ��p �r�\������.��ͻ)�@��m�=���p�E��-��Li�l%�]�*F�1�����6�7����\�Ҋ�R�/h���V�R��R7�ֿ�}��[|��G#)#�S�O����<�.�Kz�N�-��k�J��<���[��<C���������vb��3Y:'8�B�f��H�E0�A4��4�t��X�z���s��T�΍�-s��������w�|4�I)8H��М<K?-%�����}-��P���m�h"I>s+�d��Nm'���L��JGe�(����    \x�qxV^�I^�2�)�T^]ӵ�W�$������,Ê��8�h�c��PJA}1Dc9�A��`�8B�|�Ǜ��K���hmq!x��%٢�wPJ!8'�2�Nxfy����$��JV��𷦿�M���� L_��~� ��=`�����\Ap�bJ������"�<�1,I��z��KOi
eJ�a�1ڔ�jJ�[*ɾ}X�|6z�~`���{����#���6�I��:ysA���XSv�ɍ��:ĸ����[/�������@O��᜾>B9<K�y.@��`{����YpMb����"�C�X�S�(L��|�)�A�����۪Iȟ0���Q|�᛺��'OI���O�׌f��ē���1+y��,�g��ì�"s�+�nN��/�Q��[��J��;$?�}��ȃ��G��Q����<���:gC7�
u���m��=�Ytb���Y�@�`�yk�<�J-�UL�%�B�p�[�o��Z�<�*H9�V:CN�ZL���I	��|�w���_�H��M.<?���&������B�q��@����ܢ����4Xߗ#�r)OB&�ֿ�p=�)�ԩom��Lƚ��g�S��FI��tT���ʀ����ǐg>���Q���x�M��ݻ��p5�d5��R~�O�YN���A� {�[�ZV�G�Qҧ�{�r^V�u�BN/�|_v0&!WG*��o1��&�:�A�TmM [ ;�2S�ꧣx}#�E}x��ԩH?�|�ϴ_�k_An���4�8�s-�rt���D�)�gZ�� {�W�~Rʟ�ow���
�v	��.�/;&GN��ْ���w��d��+	�s��$�ODo'�"���D�%�G��D�i�QKfɪV�QNi��1 �^8C?-���Vtڜ��s�8[�'Iސγ}g^�]�`,׸mqs�}�ƛ��3�I�r��c��} �9�VWE*k�ù֙��0�Wv��]����xn[��7�o�y��{\~|����������U����ꒋ�d��B�ؾ֤l��RPv��g��^$縡5�fN=ɐb�eW�5�7U�=�t�C'�$~	�OCr{��Y��Cn�}� �_U�w����d�A�Gʓ�������m^r�}�`.�H�`�����	��z�*�[T�ƄU�����FO
�����L���xKX^ʀj��x=B����=Bn(Vɬ���=@ndB�BbuY�!KJ^� ����$�*�=�n�5�V]�\��Zl��O�Y24�d+Y��������FkBD�;h��ڄ���yQ��m�eʔГ�7��Z�N��^�-~-�t�Tg�{���d�����{Ȗ����j�Z�dޞ^4Sx�eC�dK���jƬj�w��u�{&�}��d��^&Ț��[�?���9%���į�`A��
��4�35ͽ�����5������ȧ��Y�3%}��|�:��9	������S�q��$y�Wi�Ƀ�B�i��?�eՊ��ٞVG�;��Q�h�B�6������!g;h�۠���'����!�N#��}����L6�e��9(H�;�Qf�'R�[7�Bc������������44Ѡ\r���Tj��n2I��id4G�i�72�RBFV�R'. ����iy���dz��A�߰`��/
9�4i��8��A���E2�>��dc($�5K-.���j�c�}��e�MYo�ѫ�`�FV�d�H9u��IJ'��6��)����\(.�u~���s�Dg5e����fĔʪ����"�p9;��Hy�S����!�%w���-Fg��)v��g�R-V�+7ne@��c(3��$�����3�{�?S���A���OҠ�������=B�x��Z�d�YV�G�*@f� �[V�G�Q'��b5�>crɊw��	u�x&џ����휝�ʪ1B�w������A����CΐӼF+_��tn����3�q�U����N_�g��q�\��֩��8���̢��r0�7Dq{���v�vgA�^��M�?�_�l� 3nK�E/{PF�́`4���2�l��5����� #d^Jǥ���{!R���]�B����8��g��O5z�vFύ��/�_��u���y��=C����*`�SԖ���Q`|��eY�7B�q?J<(�e])oæ��i��5�{�7��t���J9��|���V7g��3�����2�)�k����~ѳ}�����⧮Xϴ W��B��o!/D��5�1���B�r���� �9��r��U���"Hٹ�N�&=-����HL�9�|j�aG8�BL巺3gZ#ו�&*�o��z����{�[z��xJCvj�B�η1����u�� Y9P�ͭ��HY�ܚ�6�)��Q�~�
�j��}�����R/ ]gG*/�l��ws��&!�>�4#hw������gJ6b��m�NWK�Y�=*�HY���'�P� (��},���;u�MORPk�<�N�k�H��µ���S��̵��
�세�����xy�jr�����]}���M�aã�}6l`%_ٔ�K�#*nk�/j4s.��*UM9`��O]f$Y$`f������;��$
}
/������)����pa�fR��i6XsSB�k��D���+;�*V�Xe��}�|�~��bP ��9X�dА��V�K���)���[�zP��[��6���-�O
�ל��NT�=��7cy��'�Nn��m�{� i�	`U��r� S��Wc_O����;�%A�"�}�������e3A��M���|@��:�K3���(B*HIi�[M
�H�f�|m�>�A.ld����L)�qGep�f�`u']��l�����wo����?�w�g�v�-���x�0	?Ar|�?��p�:��8Bᖂ�{�b7G��Wn�ϒ�6����j5�	&�̡xf҉>K���,�?�&F��Tec��:g�$�;��;QMv�I�����a����^����j�Gl(�i�S�E�d��Rt+�$�j��� �*vU�Q�H���4!��l����#_�d�V4��`*�j&^�b�p��Pjy���u�]�y�&d��$^+���N�h����q�J1�$|��.���7
߹i�)����ⴰ������fp�X6h�u����T@�O��� ;T����1䙦ȕ*ƚj,�L�F/���"�t�y��2�,�}�S_���(i�V��y�h��g� th&�kh�*�doj�v��$S�{�ڪ�1��VS4���'�Ύ8Rr(:s�����T���#k�o~�g�˲#2E\�گ�U�맣^è��R���������߶�,�2J��n��"���
���|MHZ�)AР�*�ج�"��*�g��N���Id�Tgӈ�z����걏�r-�KF�
�Uz��^ZF>�"�BUP}��$�*���H>�Ҋ�E6�	�0�WM��>I+�/L�DƵ�_x�j�Y^�<^��LA>IIY����x���"i���U���N9���NZ�?J��%%��ȿ�����ca�X4x�ڍ9�Wi����IZjh����V���+y��x�Rz�Z��eE��麒�y:]Zrd�S}��_IK�'i.��[⑘�i�"����{�������߽�XR\g����ͷ����7�$�?�|������o�=�����#��oC�
�TPD���"��+����������+�C���
A�j����S����!���
�&P��n��E�J�JZZ>��{n��5���ū#��rO���!9r���Z����y�l�\/5I�^�u%-|����mM�-T^����OҢ8ŕ�>x�zW5��=-U�d�2��3�,��:X���PA��lE�W�x-/�t�,DW%��J��
�����L�Cj�Bs��g�k q%��Tgr��FǪ7g�׻�+i�S��e��ihܭ�-�Jk/-D�U@T���K�=	���'�g@�*D�	M�Y�-�D���NYߞmg��d�/����)�w��񧡡�y�ks#��@�-^����b���O}^��:@fҬ$�k�v%-�T:��6n�cbE��0?ק~ijD�    ,�����T�Y�Z������^d�ex�鰂&9eu3�?���VC�
���/|��&3�
�;��C��h������g�@_AV2�F�r�y#�W�����ⷕR���-���
�o�w�;nP��63���dT~!�D�,��NB�o�i�d���<Z����AQ��� ��T��<�*X�O�x��#nW�񾈯�S��z��{^(O*�S8W�l_SC��yJ��{`/�l,�a�ZZO7>@P5�H}���Wi��e���\,���C��mZq�S�`�	��X��]u�\��tN��� X<�j;>8|y����:8�=i��~���袜��)ɝh@�t^#n`�E�k2�\!� ?��K�%:��"�E6�d��B��鈽����B\X�&�����M"v2<p��g�x>����_�1�1UA�S+�{�Uȶ�&E��q5��I��ʀ>H.��I;Uiw�Ѝ77P~��O�8T�?���D�@�q�|���n�'��?wUp�����ً������/�`��T��cjZ��u�K�MK� Er6�pXY`ϋ'b�f�a���uGe���,72=�f�K^ B2\�)�������`�(KV���7�G��ݙ\��+*�%��5��$N~�)Ma.�R��+��?��������佳�Sg�,�*����'n��N�|��HY_n氲��5���w�˅|�l�e-z@�Vm��c�c�/�&�X�(2A*뤜M���������6Jf+����heR�)���z�Q_�a�
��{���x&��j���ހ9�z��W#���Ҁ�0&�Y�-l�̕b_��]�(m1��Ż�L��y>���
3>0�N8�x����pO�Ӟ�UсN%���Ѵ�\��$�̎��'%�㱋 �i��(���q�t��ן$��(mn�]|3��@>�C��k�կ'Ȇˑ��@�<�\�M����!NL�F\��
q&��!��ҚW{�U��d�Lo�W{�MC�9��%�.��4�+
ˢ�\.���M����ʍ���A9_l�MIդ����^�b{nXg=	��� L=�A��S�JV��ނY��{}�Y�jQs�C\�/��tU���o��V�#�*pY����ܪ)��&�6��Me]ԥ��&��^�,�Rw�y��o�ͺ-�R��~����إ\��#������glj�I��O�+5�e���2�����$���"�K�W/PA�:kW-��1GRշ��y)����+�A8|)�3���o��G	3n1Sd��s���uaG�M���9�&j����QB�6(V���O��t���[�"U����m���,��#Q�c���Öt��_ �p�.�Qpc��<�V�Zؐ��to���f;rΔ�#U_��}�A')ĺr1#���=Sy)r������0;��a��%�,N	���1�ArJ�aE�U�/B`��%�V0T��-�K���d`e�S͔��9,+�~�!�>�ay�}�;��fae1{P�ݕ�這�ʱOM���!0[�q%��RΆ��a�(S����vS�S�(�R�3����^�٠`&�.f+�:�-�-d�3�z���t:�����Jv��U�Vb�M��Nv�A������6�d3N�-���������Z�9xN(�U��Uׅ�Y&����M�ΟkH�F��a�W.Uy��l-��ok[�l�] �i�+��3o�R�v��~�s(���˘�Ŝ���\!V��t���X�v�w�Q�l��]SdP"�7�9'�J ��i��d��l�<��N�������߶����l�".]07�����)��!�b�����U���wX#f��r�f��!0k���L&�%:8��(x�.��^�z[A��ɸ�n�E���Eg2�,���(��Ʋ(��:8`&�'\gI(u�yE���Z
���R	�S!���� ��� 9
?e�|&�N��۹���<�!�"'_ ���Ylo̌�#��4+����s�L�/Đ2��J���U\ؐn������%�6�f�.F.;j#f̺�g�e����n�c�
oQO�/�2bv,���vc��=(�a�})v#
�ٛ�^��H�t����.+`Y� �&�\�+R>������դm�}(	$o��W�_h�BA�i�-�͟��/Р�vm���!f�t�����s5�!�i���s#8\11�|��Ō�qC��rY~��G�/�ɞ�s�Y�y�}�F�`�4t��4��/��-����V�}l�<fW�*�&����ǈ9P�+{�1�ܴ<`F��X��+ۺ3y�,c�嶰�0S��y�
�V�4I��|9�,c؂	�5�l84n��)�Ƨ:d=g;y�S+���;��{2L#Hm�k���ޖ��#��7H�I���s$S���^,lH̔s�ui�ʍ�f@�ޤ�t�ڀ�D��3��P�4�m�$y,�̐:�4���CtL��֭4��������f����>�cƇ�v�e��}1�*�1���9e��g)tG���N%&�E0����q���VEɹ�6�/8
JS�)l�\�h���I0�o�I�);�(Y����Y=5�_@)�L-�Lԓ/@����(q�^�fv3\��+����u%�l��-ܴ<b��B��Lj�J�\C:`v�2��ʓA#fO��7���r�@w��]6WXWt�	3XvHN؅�39���g�J��@w���>m�szw�)���^yf�\D^���3�D�ԙ�Wη��(�1�/5#�)f��5n�zIJ2�-(Ü5�S:xgU����O��� Lv�90�⤹"Avro�������.�;����_�xT7�G�DW��t�,d�MBW6�f$�_��_��sL��$�����9U(�O�pp�*�Ns�-� �̔F�Θ�N���A�������s�� �^880KW�O���1��4#��bv��T?8`6�軵��m-#f��i>������v
������f����+9�%'�ɠa�%H�x�^�䊰%e%�aR�QY�)�A�s��҃ ^4�;7�_��O�O��]���zjb���s�$Ią�G��d�+(�1�L��dRmᡒ�Ш�A�����!0S�eR�kD��	ŀY;0�� ��	ŀ�����(��	ŀ�liV|
�$u˹	ŀ���3oNJ�,�P�����K]8�0�>�+NR����C��s5�3�:��1�|Yu��5��s�$g�)��¾{�L�$G��.̊3`n�)���I[��#�RJ,��%A��P�/ZR�|��i��F�!Lo%�Sv�i�
՜K���W��v�i9���O��FA㿄�6�ffD'C�S�������դs�d��~���~�!0c �U߉�9F�1�e:��ʷ*f
��E��-O��V$ޜ���'A�j@�>x���IЀ��
��=��I�s�rB��'AfY~[aV�}�y�L�n�>�rǀ�n:�^,��k�l=��p��t�(��]�#ѭ�s>b&?y./��E墕Q9n��iT���	���m�AJ��B=	!��\���7� �������|�s�w�։��i�<�Zx��Ȋ+�bev�3�ע�a%��P6nf("�'��'~r����t�,�>Ht]7q1+6W��-�u����d��C�#fC'�i6I�n�1;	�\���ʈ�?lčS�g'n#��x�7kN�u7T[̤�[�P+�n�6b&8��Ix�is���T>(�0؈�P��*��-ሹzН�S�;|F�-�`� ��1��R$g�z�*��NWY�R��%��
�C6+)��dSoe`�NgP��-!=Ƀj���О�l�/P�5��(��0�yJ ]�,o�l�-�P�dׅ��G�.Ab��X�Ur��+�޺���+SG�(�q�|�+�o���%�g8�����s
�M/R��p�i��sW9u��q�ds�\
YU�N�C�<��(&࿔.�ln1k����M}��l�I�.��F�p��Yg
t���؅o	G    �#�e?�h'�v��)�E���>q�<f���-��:bH	 �ԇ��%�	��_��/��#Ţ}d�ɕ�sI`e����Ѧ"�BG����PVv��a��A����5��)��#-z>O��rn�� ��m�1�8�
���vB�<`�}����ʷ�f��q3m�J�YW0��eZxC��J�,�$�ʆt�L�RQ��Ӻ�,��p��fd�p�췘)�6�5G��p�<`�
�[R��愥�s� �	3�N��Y_
��UY8A0��`��;�e�sE:� {kN�̍b$ÑM�r�y�ي�c�|;����y����8�L�O,zs�b�J�ь V��0�Ȼ0�lǢf�\��n�[�3bJs�GŅ׵���V�\Y���]v:�꼲���y����Z�Ǔ�AY�{��V�)�mj��Zb.X��������k-�H ���[o�ԏ�d&���0�����)�$(p0��!07�s��%���!�bv����<�pa�����,��h����Y[�#�t��I�������e�z+�c�da�`F�ugcw���[L�.��sP�+�ԥ��&�;�hA1��Z6��a��R(Np٤~�9����ݲI�s���]9����0W
��Wr0U�I��1���Z׹�}��i�^ ��]�֭;��L�	/� Ty��y���#��M�e��f�@Y�&�l�����^��,�~_�D�������,u��W���B����!z�anS�rzǶl�E=��`��r6�����q��2d�*v���(^f�2�3���ǈ�sn`Zg�+eaC:`�L�Ƴ�ֶ�逹9�/:7��%1
fJ'�A�nw��$mW��P���1�@�1�|jX�1`6��o�'Y�-D������L�ʅ��C��ląf�.i-�g�p!b�*�ή�^�1`�D'�1/\�0'�sA���p!b;���Ȧ�+��p!b�\�n�SrU�'��L�K۾�)��c�-�n�yolJ�/��%��}<*؅c����u��.��m��_:~��,��֊v�Q|��f�Tu�a����œ�h/MT��M��?�
�_���O�� ��'����BV���͋'#f�Ȼn�+�33��*��t��,4B�+O��p�֗ͬkH�%Ź\�v���v4k���k;��œ-�(4&%[.��%� ���&��-��U��{��<�\<0�����.�����pr\�x2`v
w`���œ3%��=ȡ-\<َ9��Ʌ�^o���œ3E6��L�$���œ3GF<�u0O̩AS,�<7�ur�d�\4� wٵ��c���䫱-����D�;|��m�<e�9	���R��\Vl�?���{��Y8O0ʭz� %�b�Ƕ�5�l��?��6K�Z)S��� ��"�P��zR ܩ?�<��3�@���/�� ��y��S7/���Ś��G��t�
%�\�w��N5�f�|��L�Ǻ�!ݎf�d m?�^.lH�|����&�p�g�\�el'	+.��k�lF?���܂�s_C�]I�_��3`�,|��e�πY�L=�R����&}ᕣ)�u�*�܎fdß���ݺ�3}Q�QB�b].�f�YJvj���-����%�Ʉ��c;#f�M��)j݂ψ9��J��'�WO-����B)յ��u>#�"	��[`�}r�C��#0�:�⣖us�3}G��B��`�\Ec�p��.ܕ4b�J�ј]x�k�lx�n�X;>�xf��KeC#�T��"�!M&N'Ѳ+G�T���R<_J�]�ѓȞA�rnW�T�dhȦ$�<�L+̂ʭ�T#� ��N���]I#f$��o��)�3��*�[����9Sp���_����3��Lc锅�T#f:��jL��F�-�j|��CZ�H5`��F8��MP]�H%��U��D�3�n�jĬ=(�;";����"Ոٰ;`8I���Tf��l��ji+�����)"��Z�H5`�	��+j�0�̈%������[�0G�f�(�g�p�j;NR^0�(q�"Հ���Gneu��UCk���iѺE�s�����P�Ncn"��\I>˅����|���*�����Y[�'�s��,�n'>�H�<%�����)jv}�)��_��������o� E.��VU���4������?Y���Ϛ�������#�����s����<�^���O�7��ǯ��.=��w�?��}������O��Y�y��>���1����_�������m����\�ƅ�����?������R!щGi���0���L�I=�]";d�����>�K3e����;QC�[UQ��C��2�'�^d�:le��åX���D2lL���0K�t޽�?����U���/�DW@[&�к�6��Bn��w ���t��>���"{�޽��9v��
�Ю�����Ç�S�_��������ĲP�hY*}�J?�^}�+Z�K�-5�M�dYf���M�Z�Y� �IR�'�	�s;~���}g��)�niY�WR���_�9��H�����7
YnjY���z(�(��,{Ȥ������Hyr!G��[ �rl�l�L��2v�z�e~%6^3H��+8�ոf飞|��<(�˥��A�H[�x��e9�F��W8��8I�<F��YfH$_�����*-�P?IK�.���s7��b�A9�uS3��9w�!��h��x,�@��V�H�����qwwy�7��/B�6��)¸��t�� ��P k~R�7[MFW��G��->� Y�BNl���^�E#��Qn�IV_I@��<��>�`뉃����~�K��9@�'�ǹW�܃��������$\X4��C�P�2��S����KO�X=(!�Fn<	�NR�<(�)O�G����Y��7Wiup�$���dL^3W����v�%A1�վ��8z���=H��m}���c��ϷU�	!s��o*(�4Iu��i���!���c��>��d����o'���N��8%�}r���1IK�^�+|�Կ�>�)⦠!s��[\�>��X1���=7($B�1ج�A���&�Z��M���Qz���;[
7�Ons���$��N�$~sa�
���;ȝ���!��] ��
DT�c�6RjJ(�zke�2�[�<�g�"���ȓŚ�Մ'�O� �� 7΢n4e���1��ZdZ���!���_�K��X^aM�닀�JEp|��1�%/�B��)tՋLʭe�%���Ț)�����̭���rӓ�����t�t	w�?P�{N��SZd�Z[o��!W�=3j:��)W�)8���-�B ��ͺ|[��}�4�l��ֵ���sU�DӼ�N�Y��9�8l��Vy�E�s����$W6ճMϷ�G#�
ٳ=��N�`\~��}����Fq��se]��B֢��}�{})�	���� �_��5����,պ���#��!�������&�Z���
؄z�	5+�(;9lB��sX�+N}6��ҩgg>ogB�I���s3�?����ɨomBG�|/﹒׵G�"�r�m��Bv[�Ձ.}�U�uM� ��˕&��5�[ȆG=��K��Q�i�t�,�ɑi]��VњO&G�Y}'���z�S����d��3~M}6�h��Q�S���#(�u	v2p6�1O]?v��V�L)&S��Tں&t�D��/2Ȫ_$��� S�'��-8���.sj[�r�y��!��bLB�<�im|�[��?}�8q������
.�Р�Xhv�γ #de.�Q��B �
�vB�������J���J)s�O4z#d���wN`�n
�Fo��4�!ҩ)�g�2��˾�j�,��x�������
�����},�> �r���j�� c�V��kA�Ƀc"�t]ׂ�C��F�� 3�L�h:�s�S��z"����`�0�;����Z����QǦ.}3�+�2�Q	C�{�(��PG%����i?y�?uG{�:�}��\-�2��l�i�GJw��-����b��\�<}"�]�l��    u��M�6�I)���g{�
��޷��v���g�nx��ު{!�jP}���� ��~�A�d�<�(Q���'J+��e�O����'i��f��А3��8��o�HZB�JK�J��R���~S߽�������w#��"��+W����Ĥ�Ťo|�>�<��~k�����^��vo%(;-({���'����?���_?.-��V*����9�X�MK��PZ~_����_>�e~�Q���^�EL�p�¿��НK��F&�1�+{Eb�:���������<����?���?jy@�ӛ���B���<�����fo{�IH�~�?|C'>�ʿ���q��2��Ƨ[9h1���-��J�P�H6�i��D��q��6�';�@s�[̡�#-5--uCi������ŷ?|܌�;���%�^)K��֣A%��D\�Eߎ�$=Y݀x!,��������P��}����T����7�^~BQ���	d������򷿾��~��������l�;���+�,Y_��'�;(��k>��#�����D���{W��/o���O�����^���/z�3h0�����?�5~������w�}J��Q.�|׭�d��cy˘�k:��Џ)�(��,�KN�d�����mc�o�����C�������Ee6�B�)6�!?��~\^�*���Wo����16p�b[��+�d��I>�KS�>���Zd�e����l�����܋<>���LV��|/�K|=1W'�NL�����f��$��.9�e^3�r(��feR"�C��V��3T
I2��0�.OR���޴n@�Nf�t-�W���N�_�n_��)g���8����{�zKn�g (<���q��/��f!��#e�VT�
ݪ��K���*�beA.)V����<�ͬR������o1XucU�bP��#���]�܍��+��P�ȕ������8_�]!��4����]+�h��Wٶu��9Y�X�A�v.le@)���F1V?���I\c�n|��v��v�^ ˇ���^�C<�2���!��P(���8�[ȥ1
ߓ�@�3�f�uv���>c
2����5�2�5���1>8�$-&��-C(��>/��31�fɄUA���/.mƪ&��,��C����e���4f�JI��'��=dsG�Ŝ�?u뙨���;':$\I�:���i��K?XTY����]�\Boa�Iȟ��fN�ٝ��w�
S�-�}�~�<A� �V`�q9��p���9�v^��Ӂ_�*X���*�rd�l)d'��檼N>�"e�V�t�Έ���@���ϧ����?⻇���9u�� �B���i��C���kh�����b37��gVS���a��I��J�]K>a�����dN]5d<�����X����{}y<x�� �?Y+OT�-��x�%�(����A{�A?8���'�� �X��+)��T���y�cO\ʢj<v�����'s��x&5�%�k6��[ɤU��ߢ����|��6v'�>qv���{�q=������5�9�� *����U�d\�I݋�" ��~ZV��0�r���/A�H�L0�sf����k��M��YZT�Z���?v����`��%z;Q��Or_pj��/>b�Pr~�$`��hh�G��~����2��9�Z�} �YȞ�d�
�VT�M32�����YԆE���^V��F��P�φ��kf�ɪ2�@#]���>v7��
b��֪2@�d�5 o�U�rJ�����}�<�rw��_sۖ�2&���J��^D�Ti���n��A�í���xx���M������P�.�L��٪2@�v�|�_d^���֤���@��Cg[j]��9�0���_8��:�0\�gܓ�L���K���kS��Ssu)I	�����:�q-/J/�U�Rv�;�Z|=]W�rO���/R�南�G�*�������"Ǐ�'��q���Wi��%͓�43�i(��!��_�e��O�2���c,�-ԫ�F^���K���9�޷龞.��z:]J��V�*�5溒��������L�-�W�Һ��}��1#���+ص���%e�,��h�$�|����r�?ʫY}��^�z��ki=�����.J��}3)�{���1=S��nj/��!��c�M��w8�`u�B�\@-ռ�́��W.�9�g�����p�y�TsS�?Y���V�;
-�����I��>BN�ا˪X���).锦���$�O\|�wR������G�S'��U�܎D��\�M%�F�
���
7PV2�!�C�r���ne`ľ3���3�O����L��t����o��	��GN{�=7�9�L�щ���[^�_A&#��#�v'�j2f��|J�KjJ.�%�mH���d�%2*��	���2���u�/%'?[��/}���XS��kJ6�<C�1/�ؑ���b�/ES��WU�(_�Z�`�'�$y��	gR�x �N��Fo��U�������2P��x�-e;���I�B��pw����g�d'�{���I�ۺ�d����-���#+��n�y;Y4s���<�:h�Y dq/D�h���5�٪��X�Sn2�=*=�ԄZ���h�A�rVg�kr�%���]�4ذB��ؘ2�2Bn��Q��Ք2�~������r�`|���eHY��gp5ly)��AJ��;v�0�����[.�i��[���U"Ug�
�1!������f�:�pЉ��S��c9Nڟ�AR_si�u�=~�k�R������*���m`tr�J c4jUS��eH��#�UM�rBh����v��19���B[�9��=�eΟc�q݃��~F!6's��%�/��1۔�ʙ�ScU6��FJo[�A�qIswG�vJ9��&�W���4c��H�C� ]=]�G�b�Β���=@�<�ɽ�Z�2lu݃���� �^lB�߱�0Ȕ\$��I�u� 9;����%��2���y\�[G��s�ڐ�E�W:FO���t�Q��,2��JEM}6ǎ�[�S�-��Uz2�w|7�Qh��(�c:�[�'#��@��R\���_����׵G�P.#0Mܲ�h�LI`�������iȉ�.��kz�l��s�М�R��u�� �J���Nׅ��-d�,�<hbŒ+�����R��Ɩ����ce���od���cel^N}6O�X��\ԧ&�n������$�^���e�L
�i�X���$x��= #�ffh�M�ۣ2Ǥ����r�)�JL�NJo^�Y.Ro=)^�{��wT�Ip���(��Y�B�p N��K
�=�d�M�5/Ѭ�
1�d=��(h:��((�z���� �@i���v.#	N־9͈SS��==����<I\V�b}�oz*� Ӊ���:d�5��� {��"�sMh�B����
�Zׄ�9o�y� dXׄ�3)]�Բ��G��!W>K�Z�_��y�02��r�e�
J�������C�@���RV?�B�dXD��[�yI�T���3E01��M��Pރ�#�A����)φ����9�e:��1⏤�L�m�Zׄ��+n��&t�LV(g�2�˲&�o��0���$B�5�#��ZvTM�eM��Q4�u�?�˪� 92_v/)ۖU�2�&�e�H�e��ƾ��j�2�/���P��H��߶�0��O�Ű������K��ǉg]A�r��'���V��9'm�Ѡk�A�иi5��]�$.Sv�f�h��lG�@����pw)7�>�Mw�l���A��UY��>B���r�MTV�k������K"l��Z�-d�@ɔT�5��� +���E�u�� YW(�g�j��Ӑ�o����Z���+���eX�ԥ&��׵��ļQ�0�׵�d����<��T'Z��*��t�痌UrQ���Xσ��Y![J�K�F'��2(��;���,�)������ŹM�x�?�b��>N���%��M��+ȍ�;yŪՁ=�F�v_x_.j�w�����;DQV�~�CVd�5���{�ڃ,�o5�Z}���I6��t�բq��3�}��    v�>Fn2yT[��D΍&�k��!�i<>U�]���)��{���u�� � 9�M5�u�� 9{P��+�e/ 	2n!S�#E'm�K�;�B^7Gy�6�HoU$�&mmM�á�V����E��N�ГH�̡[U��;��S8�,�j���TG5B�`��0���Z����S�׵�d��3�x�٬k��^@�mT�^|1��rp �@9
!���#d��s㪯rY�1B���P�l�~��v�L�@�7*�e���$r%��%_�5r#d
�2�kG�5rd�0�������[�2����ږu�� Y�9�m]#�Y�pA1�g�%��EL���j,A2eD,Z��Q�uG�q[��%�-�ͱ�'�1�%Q�rf�q�?+5��.;�?@��0���q�y�_�~�A-�F��Ab�Ƥڲ�j����ۨ�e� �K&sf��5����4��Y6����2��o�}ӫ:�dJ�'�ή�� {:�\�OJ����i�!�����^ � c�)��۶��rr��i�F�=�L���BiV�&��Ж���#��ֵ��f�5>څu��rІ�5���%�Q�����Q9ǜs�R��)@���ArԽ��	N ��f}p��%y�b�'���	<�UO�)Y�q]�:B��:վ]v��2���B�v]G5@�x�T����j��ꥅ	M�u� �(h����:�r��J���i]G�7�Q"xї�i��� P�Ӑ)�ܦ��@�):4��0�ǲvy�l��ԜY�.�Ɇ�`�e�]�.�C k-s<��A(��B���˒Rm]�<@N4w]��źvy���@f����e��r��������b��2f�8na��D5�Zl<��20
"ߎG1A�ߟ�+^A���=����3��|XP�I�L�u�|�5@{Ȗ"�/q}]׷�1vM	"��[�).�7����d2��ۃ�ô�ou[ȥ��4-ʸpqn�����5�Xطn!'rT�j�a!Ժ�u�,3�&.��Z7� k����i���+��L u�+亮d�l+4�����<~�+(<�7뺒2
Њ9]�.�����ImY�|6@N�����,.���#�>�k�®d��Y�N5W�LӢ��#Uv�s���+�RN��iڶ�-+C�ʽav�0��$u�v)e{��Ԉ?]vFY����q����o S2�8�I��u}� �IH|1��{(��=L�G�p�6@�;�8�f]ߺm�㍙.qӣ�~]�:@N��0Pz]�:@��D11Nw�] �
6�+a:�eӴrS�9�|VԺ�d���Sո�+ �5���빞��+��v�B1F���
Vu%#dc��׬�n�6B��@�첮d��2x.���M�F�|]Y{�̬�o!kI�����3���Y6&00�#�������\���f�~�����#��)1�}6z����W|H����mf���T�t�+`�$~��ls7� �A�@����nf9B�
Lg��˒w�!��\v�w�&�9�e9v�]��8��:-���!G%���\;Ȉ�9M[��k9VR��A(����[�Y��-�W�ٙ��8h��,�뺒r%#��4�庮d��`o�6���J�����1Yn.e]W2@V�ގg���d�L�3E��­�J�V@K�~3���]��Bv
-�v%d��xA��LC�\ī�7�nM
�/�P���	���RZ��a
����C���j��$Ų˨I����3��l'�I�����	�r�dx�\$d�70���� �"��r�[��oZK5����C�&�kN�`�Ґ	�?YE\7� ��'æ�u#��n�C����u#��5�lf�f��(�=g!D�n3@���Dߪ�ںɰ�BFɴ�\��q]W2@���._ܺ�d��"%�l1�-�Jȹ��`�캮d�\��F/��-�����a��ͺݰd+8��F1�-s�+�[Ȥ쥚~��.�Ykh��P�L�qv2<@6<qS�U�DjrR�7򦆰殩ڬO�G�ZP�Nq�wE%�c��h�8	���2w�_L�~�����' ���ߓ-���w"�8�AΠyu=z�5,;Ȥ��"���F�X.U̓�<g]!l!S���S�u	�w�s��<N�rݠk�\h��e��r�8��l�e� g��yJA��l�5B����]6!S�h�iօ]	n!�	fv�X�]{��L�Xi�k�ͭ�J����0��\�~�+ �B�%�M/�JȼX�M�r���r,��e F�n)x��% [S,q�6�r����~����ݹ��s�-��?B�H1H(�u.�gFlPo6���s��e|�C뻽������u���˛�|���	��l��L2�)'���E+,JW,�H�}vUIt����)Q���xy�2�����'��a��$J��-ʟY
���̞�FgR���t�dX�K!#d���<"�e�W�NO��Iz,Q-���QCQL��òk�w�#�c&�hӺ��#�T��1��_Gȅ�4��Uaٵ];�5�ʬ4%��e��
(ޚ�X���UJ��:)$a�-�������Q��/��u�y�͉uK!#d�H�FVJXו��!���}��~���2�$9Ɛ�K+Ou%d2��۷��wWr%�H�#O�"�u��E�ɁU��_��a��Yw>UL�Bȥ��(�.�y�R� �I:|��Z^�䰅��S��#4�O�:	�"�P��x��������{�^Ɏ����ߢ��$�~ᛡ��33��<0�js,6	�9����V�\Qlj7+k�rC�ۭ�f�o劌����_�9D�"�dS.�Iwz��������s������?οy��������%���/�������_�O?�_ɿrkwBK\��?�����P�wA
#��u=�R������/��~���I�{��w��]�,��?��ʷ�����w���W_� ȿ����������C���_����������ӷ�����������?����}���%���{���Ï?��/i��PZ��H�K��{g��b���ҋ�A�)2��)2��h{�s�kP���{'-�K��W���0��=wPH��:��DDqB���W�`�Ȟ<Ĳ8��d�����T�¶5����]2LL����CVYx��]}�;d��!aX���5��ub��ݖ�M�v?΁�2��F�mӰ��N!6d��w�C�dX�9�'�]�`wȴ"e�G}��%9W���;�m��L �C��w��rsdm�9�l{��82R4��m�`wȣ��;;j��QrD�
W����۾G	C�h0�I˲�QM��jL��0�2��t?��V��!#��#���a0�s�!
��D��k����Ι7�{���?�C��e��	:�J�\�GP��%=��k@��@l/ڕ^��"�O�]�93�s��E�1ӕ���I1)��r`�#+�@EO�a_k���d��ƺ��5n����p�a���g�&��/n�b��gȶ�9�a�o��;d� г�K�k�3� %,�����8C�I�ya0���gȩaY��|�};����I!���}��\��ٽr�k��G	CnUX�H���Qɠ�)Y�l|���4�S ���=J2���#'�;��Qu��,%�{�0d3���Fv��(qGd�i��Q�ln��C���ྍ�q`�!�$B�����aȴ��L��q��a�s�� �2����C.���QRCxMP`yΒ���;�h���(�o���d��y|2��J�C(���?Kͤnk�p�ix��E���#�x�d��9:�|����e��|���="�"�Aۏ�雙����;dZ�:s��RK�'��w�Չ2���K�'��w���Vt��.��(G�35�t�?�|�1z���s(:[A>1����4ĭ�A�cI����2��/��i'�̐��uC����=�2CFh����ѣ=�2C]�6���W/3�d��s���גc�9��o��yߣ��Km�Θ�G	CnF��ٔ>,!�׸C�cZ�2��.!�׸CUT �]/!���ȁ�d]q��LYB>1�q���H�L�,�~��5�阕����XB>1���S    68��g}ů4��l�lT����w]�qw����IO#H݋�fyս�I����{���>��fs˾�3C�2�v!s��̐ɲ�� H`��3C&ˮ#]*e[���r��+��tU��(C&ˮx�t���5F��Q���Wʾq�<��zU�W/���LB��籯^fȚ|A���7���2	�Kz�l���e��p
���W/3d?�O���A����9Z2�Q ����f��"9(�	~�$`Ȩ6����3�	2�t�ѕa;A���[�˵�}����_+��#H����ШТ�6�	��IiL��upy�ƨB%��o���+�#x�g��L�^��!�[O�h����Ⱥ�:u���͑-�"�^羖GvAd-i�L��(S���U橖G�JTt,�ӕ�[Xv9Ua3ƴ�����:"2��#!7Vr�a��L
r_��#�.fQ�j����#r���uB]1����Y�^�ny_�̐��6�B�}�2C�Nx��I'��^�Gd�DE3�}����Ȟ�!�U��m�qsd���Nu%�x��͑ɝ�
4Y�m=n�L~�1���J���7G&	����e[��#� �#X[�1�=c4��kyk�#�۔��y������2�{7C36�k�2������ZvGd���m�:��o�>GVY���Qjn_ˎ!�.��ń[�RN��2*�"�P���CvE�X������"`DE�~ߚ*{��(Q	��0{��1GN��y1�ǾJ�!%���5\�W�1��4r&\�}�CnY�����}�C�h���ʾ���J#BC�V岯�z���*�1'����1G֕<WhS����+C&��Y�Ӿ�+C&m|��W�}�v_�o��
����=���~@�/��#�`����ww�N����j[ˎ!��5�}�$��H"g�y	}_3�X�R�=	����q��L���r�|g���>��꾾 C&K#jXv�m���8"7Y0��׾�^fȰpp�,�}�C6�V�/�}����B�N��oQG�����Pb��*9���M���j��dȱ��o��侾 C&1n3y�Wڐ��2dL�A����d�\_�!C�m{�o����
�F6F�~*�n�2䡐�N/^��.��W��W������LV�}�$���@@�G���]va-l��7�3dM�3*&r���Xqd�j
�i��I��q������I�6]@d4����E=1�;��cŐ~�LRq�jy���he�,*�S5C.M(���6�1��@G��U���W��u�2�0�uS�n��M�X!1�Svr[Ǌ#k+,�oF�x/x�cő����Ê/x�cő1(z�L���cőI�,Tj�}��s���u��d�����ƍ�56�Y^u/���m�ֱ��!YQJ�꾥49afb|��6rǺ�����c5ʶfG.d)Lˮk���đkA�4�rl�Xq�N�����q�;n�<<	�.�K��~Nʂ��sjc���s�İ�,)\b�9i��h�C7�z)N�阍����[�Ƒ]���*/]L���0d2����O�Rr�"�ڐ�}S9r"YF�[��Kaȹ!�OۯI�f/;)*�*E�ON�@
�!�\~Ѵ�,�߬�z1btt�;��F��3 �66���UQPc�Z4��y(�=6�T��GdEz#��}�!�k�3d��g�������b`<Q��_c�)�if��q���m�L\�����}��.�*���ϐ��_�.�k�3�{��G�w�G�Y�9����/&r!�
�޲�Δ��M���<�}3�8r¸Y|gW[���T�[?��珐I��.,�D<� ��]�٣ ԍ�#���c�c�=��Y�l�F��;�#�"��s����*�ڴ���~����cTڷ�G��T��/���,"�Z��l?��Ҙ�G��~�G�܄u�#�s��~f�U��d������rs� �����~f�d)tk]�{��̐i��W+�϶���Fia���Ik���Y:�a�l�N��`Ř�>ë`fyգH��S�����Ⱥ�o� ��m{��#2�Π�g��0���	V������ȁ�]d|����2��1
��)�@YN]xL�HI���2F� 37b޶�(C�Y�8Ìf�,�xDn��)��m�Q��+u��-6��ʉ!c`@n0FM���Ye�U�t�5F��X�����v7�N)oN�G0$�W�թ}OC����2EY7>��t �9J`�f�u���ٙ��k٥#29�������0d���Ę�Ɖ�9U1ԼK���rd��f��c�ײc�աm�t�꾖Cn	��Y�oc�ܛH�Qy�{뙖�?T�8'��~��l�ZvYy��p�嶖G����l2�vǝ���q�KUN3�=B�ݭd^�0��N>�����w���N8Zd�7g�#��;
\ӏ��eǑ}#����]D0�EIūF���g��}�$��r��W�	�L	��Uh�0qd� Ø����k&1d� #*��m,G�cai0���b�^vQ��ӧV�<��k��ͤ� E�4��I�}[��!;1f���Ny��:�6�Y�o�g���f6c,y�0#GvZ�0�������͙�S���`�!��י���ҍ#�Ng7h�p��9��̢����9r	�`��`��6Ǳ�ʣQ��~}�}m�ܺn~�]�r�A~!��5��a�����Ne_�Κ�U��k�l6>Z�BZ丱�qD��X"�/�~�Uj�:۱��{3rdc�B�ÔJ�� g�6��_y����8C�/*u&�ۍ�c�U��Z����� g��m �f�CN�X)�)sm5��i�ٴvvЀ=�3W�0t[=͑}�J���=2i灙��r�Un
��8�ƾ#`8rG������2�*x,�����J�H���)��sH92��v�o0����s�6����^��Sc�5/7�R�����G D�J�M�h�Y]u�C�ѩ��}gPpdgi˃F�-�콨��yO;Z9Dl~��R]�h���+"�~-hp��r,΋i`D,z��}��qd䐚�u�X�{��	�"������Hu�e����l�z��,t���6�0�q�1Gn�v"�O���i��j��G���o�2Z�Kl���5�t�%�Wc6F]CO'���t����	�U���M����M�A"�Sd����:��i�](����^d���U�U�r�1�Uz�TU�}����82)5WYV���c�Ŋ��R�������'~���/��_ c�rd�]��/)�E���_8��?����y�o�~O�+_���O�������}��w���믱k�����_�����/߼����w��O柾�߼����5��������j���7߽����{���Ï?��oj�r��Պl�����q=
Cn^K;([��="2}Q�n��ʊ>	��y��!ЛExJ��M��U�"!A$w�o�,�LFf��i����C媟����ɪ#}Τ��� ��[�]!�jM��Ct����5<_�$�^ȀM�k~�v|D�p�|��F�}�#C�MH��%?6��aȱ�I\g����r*h܌�C�É�t!^�SC��{Q<cy;fE��!�k�v��@͆��_D�+�i3����=��;�m_*�5
����8^#(˲]m"d�,��x���v��K[�S���<K��K�:�1��kV}QP�tA����VȽ�� ���OgR��K�Gy�ᛚO�BI��������|�Ի���	��?���}����c���7��}��ҧ�b��#�/��27�[���Y�����{��_�<���k���1�C�}t>~�ƼU)�ǯzX�L<��=�p̟����a9G�ٿ�CV�f��G�i;��d��\�hi/��q�t�{ƹ���v��䚺�u�9���(8�����^)�P`h�^�S:�t5�@>=��7�g�2�S�N�)�]���G1�)c;K����Y�G�a���ۢ�*�T���`�ѱG ����-q�����o7>��^�X��z�3�#I�����Ѐ�������4����UDP�ِq��(n�H&����t6�e���8{    �v�K�P�O�<v�&��q�6#f�C}\��̠#�nD�ܳ��Ŏ�=��h��b���$�s��_ �N��Ю�� �U䐅DbpN���SBl�vcSo��N)�Ls��ӊ��;�k`���%��#�aI�,�3���~�2	�|x:���Z�ߍ����ǿ���w��F�lP����Ȩ�V.��D^I7�"\�����r��1
,���@Ȥ��O��v��A`�E�r$%�V�Y�G���2B}�p��#V���VR?��f��èl�����!�pv�c��'9�g?�!O�ܜ��Q��8��ǐ�>�j��qd�DD{��>]Ŀ!�iB�9��K�#S�"7_d�¥���f�hf�zϱG�4�XW���,(w�E����"�Mҷ��(��4��e�#+#���+�8?�Y�m�d�)'�,J�+s%~����U�B!�ؕ�G/����.j����6N:-�G!@/ڞ���q"�YG�颤��)l��N��W�LaI�yd�&>h
+k�k�Q��ˋ�ӊ�P�����O6��A�������[�wMԆ�3bz��{�\E��%35�Y?�l�ȩ���H��S��Ѹᜪ9ZW��&�b��;���j�8������J#y���ԝ���psދ	v���J�	���w
G&���:��0�p�� E�Bt����*�'u�0���w�ܩ�igG�=X���U9�)���7�;���X���&i�tWf'��ک����g�#�6�죍�����on�\��(�H����2K�� Vr�nn�L�>�o2�H0������b)[&<f��������x|j����a}�kP�Psf@�kƆ/M�9���T}��Q� v��}77Gb��`����R�6n��хp䡅� ���W��bofV�$��
e�F	�q�L6T�è�"Y�FG�Кk�9fS���)*����	��,]'�'9�c��+�����I��M��}w
G�6�)#��G9\��*�/��	4�3e�Ye�v̻��z��l�V��T4�j}�L��s�5�e<��Aa˕,gfoڹ�\������!5Dr�����E�D�����x����I�99 {���q�*���[�W1d�Xa�x$a_}Đ��6�t{��d��895."�����E��R���Ƃq�x��k0:�t�t������u7o�����Y�z�k�p�l�#��sBbLA��H=���E?w;�!�H'�H-�%���>֭dW3}6�;��2Cn��n���8.�ʴ"rbkpk�o�t����#о�ker~�1��>�h_d���l{�DF�4���_��m��MH��"���P�z�pYer<��)Z���od���A��B�:y��ƛ*������"Ȗ$r�u��mDv�4�Җ�.��P���YB~��ۑ?�~�f��F���;X��{A�^�����WAN�01�ZC~+�4�N䡣gT�I_eջp�D/j��!����LYs�ތ��&(D��Ԍ&_�K.)A+l(����߳�F����B^��@�I︛��顳��Yg�`��2��[��H�m�ě�{�A�3:^�"�2ߦ��l�!+�.)h�d� �:"{�J�k\�e��Ioڐ��ʅ�T�V�譖��t��;Ѭ��NIJ�9n��x�N��Ax��:����Dj��;�#�d�Ls�)�|��g}Hz�*/#������v�^ڤL�%7�eߤ���e{xs���1c���K���沞�W��ܜ?=�'������>.����9r���������kWg%���nn�l����W�7�`,#������H;�j}�2�P\���%yh2�R�
�#s\�E�X���pa����S�������nn���H6` �mA.�T��#@��ʸ%W�^��}U(CnE��p����
="Wh�Mb.=l��ۨLL-�
��DO�Wѱ)���*��@��4�Q�6G�����̩*���i A={��N���v��B���#�L�>�,�"��H�Q�dwYe:V�I�V�EV9*�2����}�>C&$����KZN-����B�S�:��W%�_Ѓ�`�{X��4+$�Wd���ڴ�2����'k}���N���}Ŏ#�H�����Gy(Q��Ũz_}tDn�
g�,�����w5�9+�^C0f9~IQ���I���3R¾�q�xm>���5��e��}oZӦ��.%�uF���A�� a$a����0hpA�ʹ������E��v����1z��3Gv������}�C�U�4'3貯>bȅ�3��I�"��)$0#\��kd��pD�M7�؝e�!/쬜�icY>"w�9����������l�>B�u���?'��y�d�x����l%�>�y�}�\E���f��Ȥ��@�r���ȑ���tu	���ȑc$˕��'-9EQ�<�L]u���cJ]�j_�`z�d���f�]C~���z�?Ba�T��F��Ud�N=����͐�8��F�+w٦�upFc]��?[�1�aD�{J��`x)-y-��/!^*ZjTLe��*��C{�ңG m�nMo�E���\��"Ⱥ���͛/"��!*c��r	��"�9Ůl|��#2Ʉri%,!����L�A�����b�v4˫n�Hȍ�>_DP�WT��O5�}�#C�/�zf��v�U&ߣ�* �e�x#o���Y~x���UV��g5p��v�]�1��G��v$_Q�2��ţ�T��d������e���F�~S��"������L��o\�&(�֡�c�E�sQP�B~�Gڑ���ɏ��O���?_������]���?���_��{������O����������W����ջ��z�o����W�~�����/�_~�?}�������!����/�O�w������a������_]�������������/�~����xO��h����?��%�!21'#㞽�my��Aʅj��4��֤Gǁ��k0����H�R
}�qv��ɹ��8������w%��ȯh;O��=�֝#'m��Z���#�Ud�D8UQ�-����<m��b� �Z/-Tc����r�ɒ�h���a)��>��?s ͓�8�v
�w�΋B�VE��NG�����)�Z�`����)9h�08')_�����9�٥&�-k�+MN'��3S�l��d]T��<gsW%FH��V�\yH��U1������#��H������;�#�|c�˰�"�݈fg-WsA&q��/2�}���6�(�����u�
c8�����0�7E&9y�I���[��$��+�-�|y3��e9U%Ɵ��0�e+��Gn��NlZ���rpt�`m\A�Y�:� �Ҋ_(�,������ �aϬzt�oY�j)�Jz���05�:lS#?�`kг�v�V��͑{�!�6W}�
M����T�K/�7�;4hC��'���k! D6�_�פc�t>��8()&wd:��D�P���#�l��-�� �Y^F�I�9��p�U���ܓ�9çv�칵��&5����L�����j���k��P~΋X��%�k��{�Ɲ��Qć(�[�G����D����ʑk���^!^��/�q�C���!� �F9oQ��L���C� ��K�>"�.���o�}W�!�H˂�F}<�vjwլ����Q���Z)���m�TlBUg�vkw5!���̹��ȳTNɸ��CH���l��#���I76��r"�&��=*�LH2A��Z��sU�9"W�h��W��FCn�\Vl���k��2r��c�ou	�hR���yq�]C0�n�7��4�eR��Q�n)�p�k��1��y���5�]�(���A�'5:[е�z��#?i�d�%ې�����7��q䈁Ÿ���9`�$��H�"�1	�eI��U(CFv	.�K�9�ǐ��A��b2ũg+C���>�T���ȍ6���T���$|	��ڲ�,�[��Q�����&o�����^���f���7=+2W�4=}�\E3�e������X:kMY�܎wȤ�bhszӚ`�������qIK��g-w�dB7��5K��g-wȤ��`�/f_Y6G�H�6���W�r�� ���    k��V����b��UȊ����5z�,����6�6^D��خh��������Sdt�WO3�fD���Tl��i�ܓ'��^C�Ga̔��!�E�P��LN���F��3��e��E@>c�km�����񂻄qAF������m�l,&�"]ʾz�![/���O�S�4CvA� ���E�G�`Rf�׌�7(NSz>�<�m���k���M���._DP Md�z���IR(�v{zQO�N�d%d9KW��c�tfb�9��,��y;����?��t9�x�U���b����p�Ծ�!�"����W�0�^�
���bL��r�Ӷco�9���^#�fuՇʕ�x�k�v�Zx\v��h6�L�+���ͻ���7sAϒ����Pl*�������v�Ť/"(:��Ͳ��Fb�i��Y���a^�ꋂ2fxn*�x�uU��|ͪ��՗_~Y�,�I4���?�R�sT�xng�SK���IMT$�g��� ����9�w��=�E�",Z.���sS���"�kկA֫�I�)�����Lչ���g�V��S�=���;�i��D�s�qk��[��J7z�N��$v��ձȯD��ղ�g���|ߙ|���;�!����w5���Wyy���z�v�Y��J�;�H��������_���ѡ�\��cd~�#�{�bN�ܜ?�ff����)�
���� ;+̼�A���t^kL�ʕ}�C�M8�l��T�YemJ�	MnB�U��ӌ��<GU+2$-'c��٘-���t�Y$�vN�XK?W�82폄v�im�����!w�6��������p�c>SJ*_c���"b6BQ�_c��n��+.�l�Bc�&��I�{�L�2���Q�P�N�|�g��.�P��(r�T?N�Yk`����KHYzz�{�"2.D�pT�nn��%�<�����9����z�`,#��4��Q4�"���p��-���Z�t�7�����V�`�Q�[ĳ��2���s���xv:��!���Hk��94��l�f�:򜿠��������Q�W�s<�!c�άj�Z��y�b��/"����c�`�(*�s�(�">�2��!�mC�#r2"�:����\L���UՈ�貲C���x���k@NI�(F:��^��p�0[o�S��8U"f�je��䏷,�rx�{r�L'z��̾��#�*���oql��8ro"�F(}d�Z6/�����G��Y�Ӑ�.[�W����6���}c�FW��y�+����X�~E�-�>IWq=P�"�͢�#� }-^?|��5�N(���Q�Bg�\??s��8�	��O��d��a�"$����V��E�����"�([�G�[K�7����8"֦���V�LFW��^h�z�2䖄����ȯ�~�Ƚ�	f1�}�)8򨢖0-�~��ge�m��?]a�ő�	��_�C�59:-O�NO�����o>|��k�����������볣-���^��v��wKU&o�C/d��c&>!�G�fa�ZM�y������sdz�r��,C�U�k�1穯_ +2�c�G�B�������3ڊZ�f��i��/�M���p嗐O�~�l#f��6m_Y�Gd����Q�.��2C�Y�5��d.,!��c�̣�?��n���=m�W}�w�Y�6."�Q	7{���R�N��׵�}�4C��ߧ�gʾz�!����l~S�"�����wYnds$�,�oz=SO'�I�9������TAy�Xk��B�>�5c������Y���v^��}�4CVR Q��{�}�4C�$��hN�����l�9ZE���'g)=e�(�b:��k4�Y^u/�̋U�\DPl��Q�$
{⢐���9��h���}�\�h	�a3�W۾&oe�>Q�8�����8�_<p�sd���B�1\�v�Oe�>l�j���@�H�u=o�A8r17s/'�摿Y�t�v$wס�(��x�Y^�(\Kpw���l������v��ᇥ���*��;{�l����\��xK�ق�,ۭ�#�UsA��6|�7YC~#�4A����2S_�ꋂR�B�v�[�*U����$��C�2�jϣ�JA�R��1�� *�S4K)|�I^8Xx����D�T���odW��5X��o0�wF#=3��F���|��Y�"Ӊ+�����G���|�3Y��n�C�"��;�� j��x,v��ѻ��ҫSw
������Vthº�N��)�w��;�!gM�<�����U^F�E�47w۲�Zu>�k�\����ν�d|ta�V����u������'.\nÞ����W���_�����E�C�M��@F��P�de�2	�B��Ȫ��G�&�=�ѯ�u�{��\�ԡ�BWeKR%��\n���l|����cms_��6#}4N�G���И�����G�dg`�}��nn�a�#\�u��*'R� mY�܅DP��.�ʵ&'́�;Ņ`��^�YP<����t�E���=E���	���,M]�R@l,
ʉ�͑�aD��Տ� �L;�1�����wq�vlU8�ޗ��kd�,�����7{A��[�|d��C�6H,k�o��Β�&�0��1gy�U���nݷE>޶Ԧ�h���Z���.����hn&����U7k��t¸6�&(�vt�mM9�B�5��L��H�ޏ�s��:�.נ��U�ٹ���5\�'3�I�~�3���q��"	[�=�g�}�p9r��5sNE��A֫ȣ�� ��WR��w\e�M4�z�����XZͦ���N�Gma�����zMҌ"@U5�}��;原�U��RIv����G��;��|�<D�ö;�#[G�gJ��5�������v�X���ɓ}���ۚ���������	�-����^[��M!��O�܊�7A+���v�r�Na�Y���[�/�\
N@�<h{d2��Bc��W�����]U�-��c�����6�������~35̿B�`W�-H��U����D!���wT��{5�v�9��Ed�p��,�|�"�ɖU]8�dR����'U�P�Q�k/S�VkQ>c��{�L�K�]Ne�����B�X˾����PhL����
C&9�h!�.���-�X➹U%�`�K5��b���5�nZ��az\'����O~-�>)�f�Տ�_�'�Ps�WZif�!���7�Y��.��D�N#��5�<W1d
�W��� [+|�-{b�W1dEA��wV��7r6QD���#�����ǛG��܈����Ъ�����M%�M�q<�.�נ)��#���ㆤ��GjN���߉0[�h/"v-�
ͳ�D�B2򖃚E���^:a1W9w�����*��k?�,�Y7���E��u�L*j U.�Es�u�,iU����������o]�G0���#�hC(���[��2��Z�'���'�'��g�.�m�����0d���������\�h4ʎ� �*,�d��W�2䎶oWTk���U�yኚ� �k��*rP����r�:
�A�6��E��,�����6�s����:z^��v�����ٴ�6���)�{� ��ZF��" =-�J�㳑O܎w��Α �9/�������,���yf+�/"�f����dp��rS%�V����=����NI�y@��(=���Qx���Eڋ�vN�����+��L�C�i�eU�*=�\��(}��
CnUD�/>��F'd�A�5��U~#���J�?�%�f{A��zNm��ȕ�s�sDi�א��i����k(�J^KDjk	F_d�MA-.�5K��ĸgj���8Ð���l�G�&�lgA�얻�QÐ��%�]�w;2d��C���*��x�EnCYD~#����m�J��]eգ}�K�q䘅R����"�1UB\��U~+��4�NMT9�ۋf�G<�˯�qAAADF6I_��7�rO��n�n٧�U_�7`>�햬*���cE���-�2�+Q�G�Gi�kf���j�*��\�F�/�$,'؃��?�������C�O��:Kn!���݆��$_��W��2�9�|�Ά�d]�1I�s�<��ig�����    ֠��7���^[w"Wt��n��*|�s��X�_µnr���S��!�^K��Nɰr氈��kV���1�����Iz��f��]���g�V��c�V�xs�5pA�jC�ajK�-;w+V/^�S77�'�j��z��i��4������3�i���9�ݴq{���&�(��Fy�:��2r	�I�P�g�nM�d#i���CkUm-�������>�X��y��d\;Fr�¢(9�\O�G��<7�੮�B���;����Gn�9���l���4"$D����#������zS��#�L?ƬI��	�ϗ�Ed�ɯp3}��;�����I�Ǔ�e�P� �7���=��n��O�G��uT�ٕ<���#G&� #��8����܎�fQ���*��2���^&9�������Y�g"�8跕{��"�fy՝p吴�אm����	C�+�񈬓��\�zq���)���-ú��"%h�W�^jDYIn�"�b��Q��!��Ҝ&(k5f�������L�W�X�h��ˏ��O���?_�����񝜍��~I�/��B;��?����y�o�~O�+_���O�������}��w�����r�����_�����/߼����w��O柾�߼����5��������j�������ݻ�~��=}S���]-���v�$+~^=�-CRfW�i9t�����T�Nΐ�iI�=���k���:/���IYX����=.26���O�g�@[�� �@��1�����{dO'����%��#�5�1z`�B�ݲ ��>�=�Ћ+�SFK�����=>zw�b8��6�^�%I�O*��Y����Kǝ���1B����IS�9��=9Hw��t�[�l�S8�S���Eջ׬�*�!�_g\�����[��ސ��jѭ�`dZ?���̱��x���R8�>)���}�����}��EC����&
'���{�2d����>>��/E�}��ْL8?�"�o���#c<ͫ��x/�S��A+�0�"�ۏk��Gǔ鐇����r!�פ��^���P�������7�J���Z.Ϲbǐ�t� .�Ӿ��!�$j J��"ȹ��.�y���`�#rUBv�ηZ/�ɗ���'�����ǁ��9��7߉0�gT�}o�@b���*�����|TC��.j��gi�{䠄ͳ�K�"�#2��f�H]�h?Q�#�(�M�U�� ��QGᔮ ��-l�t��#	Xu_#�fu�Y�jZl�_DP��]s��"ȍ��e���F�4�n$�s΀S�*�N�Z"?��v�^Цj��	ʛ�i�B
���U�/:-��WfNI��c��T��B��G��_j�\��i�y0��|�5�C���A�����&�E��y7������P��V��'?�H���ɍ������.�Y�"g�*�Ͳk�e����ӗ�����1e$W]�]���&�Qs`sk��v�QrIe</HG���[�ь#w���E0�P���0�4}� ���i�Ѿf�W�5�>���-o[���]�Z�k����5on���r�"ums��� �)*��W�����gܢԕ��g��\�ȳ=U��"�d�6ĆK]�4x)rk��u��:Q���X����-ӏr��>\
���H�o�$��Q}���3���T�� ݸ�ڌ	��Y.��.pO�Gw�Mȹ�G.ۊG���ϲF�����.���2B���B�.N&��FT�κ�8�E���ٔ�eREheƆ%���n���Mv�Pu\��D�!S��
�\�\����*���NA#��t��	�g/,g��q�a�A!YJN�����V!g��R��K�UGr�Ɇ��>b�����^#ˏ �#��" '+�]��BΘG����Q�'5l/)��Z����%h�\�J=��S��5�\4D���m��~v���x�=e�ߴRv�)����D��w��
����"x��Yu�U��
���T���*���6��]U�2�D�qw� �5�G��l���EV9)�Y��װ��`JldŦ�"�hO�Ur��\>��q�B2v�����IRh� ͉9߿����*?�E��D6�U�[`�d��9.u8��
e��
;��u�X1��i��t�Y�Q�Hr��B����e�����`8�1|��/��&�2�u�Qr� �#�7���˦m�=E�IM-�A �O�[����ր�\��.���ks1	�f5Hɧ����I7g �t�KF��<,���Z�!�*��a���U��@��'z߳�� �Sp�վ7�w�d�4X0����`p��D+����j��b\��a�;dm?&w��/��v�����H�6�����L�&��α��.M3�fnޭfx��L����|Ђ\�^�Ś�oO�&�
u�,�K���l�Ov��;�#=���}*���@�W���Qqd:Q��q4�.�ʥ�vS����iZ��Q."��|�l=��b�#�6����-�oQr� �[����\)A�}e�!k%̬���+�@������m��ٮ{��SY��Ա�Q�}؂ak�ps?���^[��^�4u���Iͱ���E�&�Ff����G�����e��leȘ9��h��Ae��9�f�sm��2C.UH�d�Z1y��g�(]C��师`t#�������b�#���g�ƾ�9�*,��Y������hm���v��!�<�b7�e{Dv�<K�}n��\��*m�����u�÷H|��r�c�h����EkO6�4K%��s0�+�����M���a#�܅���h���`���p%\��le�%��f�f�Ye���MUk}wD��Ԝ)վ����mV��X�gTG�$�K�L���]YUap��2�]YA�+�HM���KV�4pf-5��,;t��^%���~�P�P0��)��[�:��ϭG�(�aѬ(�={�g�Z��i��u-ui)�К��1�Z�h�k@�����������1FAŖ�+�!~���3R8p\P�8�ȳz%�]�2�Su�������9af1~]L��`TB�H�����`4/�����{�n�}N\I���Ig㭢65��BA�%|����I�3���mSG��$�:�1�}�C��nu����}e�!�!|�1%o7u�	�J��"m0N�njI�=o6��ɧ-!G��i�� 'z|��[W�L[�~�i~Rw����g�M��{
���!M�<�}�6�#�,�̀���k0�6D�8[k����yX�n����`8�t���U��le���fNf��,;co���f_s�6r�O�2'����cȮ	3`'���=J2�>h�t��n?�	�u�J���D�MB�&_D00����s��g�-5}[Ҏ���ɹ�}~�̚n�7!:R~���5	��(Aqv�w��c=+C�=���]���ټҭb~���c����~��y�T�U�kt1dU1���B�ׂa�Ȋ��L�o|���#]ϲ�z�pIX�2y?�2��aά�j�+��L�w7H����k�0d:j�-!B�w�1�pAȹ�}�.�\�$��)c^t�-#�!r��5���!�Z*|��E���B#�}��,�o�o��f[��y �s�l�@�*�w�܈V$:�����Q�a��5�F`�̗�L�@v�l(��g:w�Q�9|;˼Ə�(5��d����_a�}��9z�ԧ�նFGNY�'�}��?W�� qpf&���!W{k�^jnۚ�E���$��me�!�"��c����9�"�$3�Y~���J\���FG��VJ����:�d�0):/��o9�A�Gd������đ�NX��t�j���H�(9�}�C�Q��������a�%	����U�jc��jR�Y��#>:��~:"EsN*K*(�0���ǩ>�a��ND���D�5~#&D{/��>C��P'�{�76ΐ����\۲��Ð�M�KJ�^�pdc��댵���Zc�93G�k0dW��ָJ�"���-;��ov~:f�'�*	�no?���p�L�d���Ő3R�\�V����yr�d�aPlq}_��!��:���c�[z�
���    �e�<���*-Vm�9��gYn��rru_����,��վnCvZ�*Qny5eZ�.De1�6H�eъ�m��ilh���kkz�Mˡ����be;�5�=?����];�"!5� �=�M�ȉL[9s���8C�Z�[�Xط�4��3��"rm��)�m'2d:��	�R�W0r�(��o�
GFdd�$R�א�"�h�&�ol�0dU���@'�5�_��ر6^�[P����=�%�q���nCvQxF
yc7�!�J��lzk��nC�e��H�1�}�2CNVX�<��� ��9
�YI1�x�Q�m�v1���1d�l���1�A>����}>��pj{��Ȟ�n��
�R��u=7��xسdk`��k_�蝟T��c�:2���Y�<K�O�>�۴��B'�AI��{�9��C�f�-U��^	�h�}�J�tL®�r�c��-���1�<�j9�����?��8�!R��h���,�@��\r�]��g9/ m��~Pm���X,�:�N<"7i��s�4l�\�2�c2zS$�vbsnW���~D4jɶ�]=�;d�?�u��gy��h��8��D%w���Ƨ�7e��T���N�����r��| ۴�g�1���8�$'�~�W���㠵E��2BڳWu���mNjr��$� 6�̐��"!�zRMD�]��3I�TD��$���-D�=8�!�#��"t�k�<�'a%���{��_ �1��Vl�l�;d�| d�ƶ���2�Z�aT�m�Z�w��:eGңS�"�A<�%�}�.�L����H����r��x�m��������-�T�9���rS"MF�}M[�ܭh��f%��dg�##�1��d��u�2�kC^T�f��!�����i_�̐Q2˜u/�Pr�~��[��jDvYxĢRni[g�#�ڌ0��=o�sdhc\�n���0GN$�C��Gj	�қ�d�^f-�'Cy��]����l�3e��$\���'�ט�Jί�<��QG����rK�p�һC.Z�9s�J�8�^�rm�>%Y}z��g#�h��!���捹�t��������,��ڕ}㈜%[��2��yf��V�,��O��!�����F	ɮh�W�r�d�ϡr-�m�-�;dء�`�>�|�/x��P�7���,��F>���vD&K��	-�%�}�;�ԅ�s�-�~g*9�\��33|��,�ȕ����ܶ�#�.$��T�������u������~'���H/42�Kz	�D_�Ye�� [������QGd݅�8 r�kf)I�!b�[��}A�F�h�L�WOsd'r�J���-L~�l��9Z��~�Ȯߊ�ca[��#KF��C���S��"��P�>�^(��L��&U��������ȕ^'"�In�Xq��iz޾�}+���vƨ�n_��\�&��{���f�ʋ�f�%��+�L��c�����.B�l�����=+sD&�\�����}+��=-�ÍU��:V9$�fZ��;V96QV,:�EBͰ7G8�a��X�{Ǌ=BRt ����k�qd+�B L9���̐I<��͡�ީ�(C.U���h�p�UnE�ER����Lk�ʟH��+y�P&��W���8"7IH��������4tV��0dC�n���tl�0dK����}����&h���^
CN�9s�Wҧ�����s�f��z)9�[��غ��Ka�$��Ǎ�2��T��7�Rr��*����YȒî�Ey���#켍��5��Y^�!揗^;�3CZ����7�R��]��/�(��]�13�>�N\7M��ő�������� g�֋bq ���ųM~��P}!������친�pi��9�KDW������g�)"��V�7���ϐ3hpaW�׳5F8"��(:�}M~�L�I�y����&?C��Y1e�}M~�L��d����?"4��r�+��?{�M��I��-�}1��ަJ�ZǾfG�B�M�}_c�!��!-�ۋ �:;t��Q�+ǂ�A�r�&oa�Ӑ!{2F��䗯s'��!ӱ�������r"�C�F
:�k?3�L�����X���r�b�>3�}�g�\�hx������8,�u�.%�}�g�<�f�n�n_�����̢$�ϲ�}�g��:}��.��k?3d��0��*�ouvb���3���Gp��ٳ`�R�;�,\�]J۸���)�3�n�e�t:;�	��Ѣ����hR_,;���LgXG�Uj5mk�rd��*M�Ҷ�(GΚ6|�����(G.$����b�י�(G�A�A�U�eΑ[�#夦��1ʑ{w)����1ʑG�~��e[c�!�9�@Wc[cԪ#2�Ͼ�~V+zy�Z�9�Ҙ�[9�G�_U��K7�3ɬ��FO/�*Զ�(G6��;��i_=͐��6&l�0#GvAX�R����C�y����ײcȁ��n�Ҷ�C�30�4ϰ}��92���y�}s��>"�.��-�Z�ײc�e�1�^J��eǐ��יpf鸯eǐ��m�g�ײc�È:;�����F������~�5��#8:���~Q����Q����%��&�[��>���ȑ�L����k&1d�D$`b�޶fC6]�饨��$sD�C��e۹���Đi��6��}�782�V�Yʱ��Đ�!eN�mi_3�!'/�IE�}�,p�i��̍��I���9jv��`�"J���� �,�C��$�=m�W�т���n\�͑��ց|��L�G�.I~�z�����d��9��W���a&���B%$�9���9�2B��f��������U��*n|�Ɛ�%���r���`�6�0;���o�4GvQ��l�����ٓ}�f���%�A;3W��ms8��Lil"�_���982���L�Ŷ�*=�L��#��]���9)d� X�6CF�̚1��ks0��m���"�\�0F��� g�-��e̾8C�������@u�3�_�=���ʏMk��%�p �0����?��#(%4�*��qdG�^�-�"�:�!9���2���ou�����6�qk�70dWy�-��� �ȴi�,�,;g0dZ�<�lǾ�iȐ�~�>~*���i�Ip�B��:Z`�Rf�Y��C�#:��8�����G�Y��i��@H���GC&��d�ҧ�{�0db�4Ht��{�0�V��Ԛ����ha�t�9ܯ����#��Y��ε��2IpF=aly�^3����j3���<�=��-ٳ����=��]���z����!ӛ�a�l�c���g�D7��i�L[g^(��Ӿz�!{#��!����9X�o#a6�i������ʫ�o�rr��y��/ν�J��O�>�TO� |��_�,���S���]�U�^.���.��J��@��p�"J��[Qu����m\��/3��̾J�!�KLU��:1��;v#��GBKh��_�A��-�/g��=��K#lE��PW�3de�´���B^�A��$��Z���� �xa����[��i������f��K�xo�����h�W���;G�2ZAUh�(�E�#Kf���m�ݱ�G�c��K�/
D�y��Nގw��>�yn�u4����HY)#�I��ш���K��D�*.JT�V��s��<c��ʶ1S��#ٞA�^#(˲�����yԋJuA���ߺ��\D��c��䐻�w���#�/���;�����A9"[9˷�̎��,�4���ؘ6�R��@�����|��%����j����ջ��R���?�'�������������������;��1���K�_~�e�a�TC�2����������� i�d��"��zt>~R����I�S�K^8���S���>�"�7�G�1.$a���;������ؤ>m�?Y�"�N��l�������)���S.%�h���(Z���j~�N�]͊Y�K�-��=ιP��;%�����������+�Bn��)�j�R�<��)�3� ?=������<����N*o����:�e�	���Z]k�	�=~�@��1�d��k#�#dFD6��67ZJֆ����E~'"r�rk��ͭ��սg���    �n=�G���W��	w3���G݃�]�@+m�b�_��.��bUK��k�'3ODd�%#�9��$[]"K�Hss���g�_�r�
e6��B��p|�2�sq��=$Òdi��cUF��Qt�cu��ۣ�j,�^�ީ�G+$��������?b�VLW�Gk��J���nҼʽ&9�r�M�BH�?����Br%�E&c28�	]��
'?�x�f?�	]�X� ���@�Mh �9�@�Ie���Rf{ZS��ۄ�x�κ'Y%�ñ��p�$Oɺ�UM���t�o�ͫ)+�-(+�?�M1�i�V$;i�`#Q~!$3��X��]|!�AVA�T���$�.I�A�1��hb��"9w�P*��ӌV_��4�i��>�z�u�u�m�W<�]UV��cV�/�tz
|��VECU�h��BĮ�QX.�Ӛ�%���㝼���k:'$Y�'�5��yM�[�Q7Z;V̯*�+���a$�^�-[<�8S��p��
�z�
�U��M��:p�U�%7�k�Ʉ��Q�x��B#���b�2� ������/��hd|4����\�T�ş��$;��X(p����VE�@��s�児�27�	]��Q�a�C5��%��NO���F��l��R��ϴ �'2�c��6F�_�`PnI�n����}��z���~w�o��M�8�o�[��/~W>�Gu�����|����=�֛�����ͷ|�O������?����,��������?������������O�?������ӻ�>���������V?�o����;�������O~�S�m��U����_���\�U�0��YU���}zW��_�Q��$,��K�2��[Uu�F祸�E���an�r���w?��J��/�����'��_�?K�x�A����_�k�-����9,��^���1�o�C<�V���pa��Z��#��i����2H�N�(�5��U��-�N",��GƵ�ElI���,�	���/�$���tK$����AY91��y!�9�/2�N� �_kL9`�ik�qu���@کnc�p�W$3�Er����FoEr�ӂ�6�+�+��W]bwi^��"���^FXj�"�"�Y5�"=�^�"<�寴�_����7K��Y�A�[-KF���BH6 Skc�9���ߝ^o[+/��et
@VP�y�l�$s�RO�.�?D�W��.iA�G*��!����a�'Ułd��B���2	�����d_����x��\UYA��p	�[�}���$�����B�N������!9�*��Q���P@���W;�&ۉ�Sڳ2�FP�i��҄�B~!���rc�أ$��j�����Z2p���bWAV�lW��>1��ós+�䔕���Ӫ)g�t�#�f���;vr���6�s6��%JV5���y���KI�����b�-�YI��W#���F2�?Ȑ�ؙ�/�)ƿ���ptag�!��S̨��)�f;�h
&�B��o��D �,��[SV< �|O�3��IZ vc){�tUMY�ߔ+'k��o��f���)Q9/�R�|�b�T��*��m�|�d�H�G��B�r��V ��[ҕ����"8����.y����Q���᪕� �����r�藵�$�O.׃�{���#�K+��d����/gϡ�+�9X�&Ũ��ʽ"�V��>�o#GI&�U����)��r�i&_Lg{T�g�x���w�#��$EF�Ms����t
Fsa{�+{���Q�d��W�W$�U^f�r�/�d�W�R|pv�`cE�7��Q/�8�=Z���c�WG�B#�yw�DiFڳ�����{K�r�+2�T-�7�~�Y����;�_[�X�`.lB��7i�;�+���
�H Myf��"��燦@�/��Q,�~N��kBW$����N� *�M#B�X_��-��p��@�Mʜ�Ӧ[�{kd�`mfȝB&�d!��˚����@�?$z�q�z���j�j�W��ڗS3n��*��dY�#�9L�H��TC��d�ߴʽ"9;���"7�F��s����^�`ԢR�c��Z�܍2y��z^�X��Y���!�A�#�ku=�
;*�6;LM[����d�v�fl�1�>'�ʍYP�/����Q��O�i��үU�:P̥+�k�;� �ü�hEr`+���8	�K���:�%Ѥy�ъ��A���5;�`�Hfߊy��}!����zk�������^�m��A���$�]2�p`=�75�����U��#tt��tt��#\O�$sD��k��H��:�I�Uu+P��c$_Q�$�0;�:��B�x�>�D���V0��2�k�)�1��
�`�q��v��dqR�H9��W_x�i������Q;o��F�0�ǥ�����dY�$U��m�WW$7P݌n�h_�{8��S�/��Ng�����
/��9��,GJ�
�Wzh/��� F�v�(��!���Q��/D�1ɞiV����]��֙��q��-Ȋd*�S˓�ׂ�H^A��q����]���G`�e��\�g�6�zQ�4Wv��p;ٖҴl�O��Br�l<ڀr���9('Pndk>����_ҡ����0*c}!����)�]~!$W�@�p�>�l�%ɜ�x�cM�,�W[I.�j�G��fz���6����:X�>�A餼LG�V�A���{@P��'�[����o��C�J��S��T�I�Ii��&�+᛹�����w�>�sc�Z#L����V��	X'���"����kqe��/N�9��"d�����P�d�	�,�l����0Y�T���cp���׵|Y���P��^9��{w���Y,�g�|Mp<eb䛝U�WǨ�i*���s�/E�윹��[� �"S�cq��T���0�31��*[\Gg\�ћ!UG��L�֖[>��%����@�>jy]}!�
����5�
A��m��t1��Y�H_�A􌘧DnaV։^����P󔜍����Ֆ �%��IV$�p�WN�����@|�p�V[\�ڲ5�+���Y2��A�9�R�|Y��G$'�A��R�6$�A��@��|2Uz���.{��M��`K�Pg�M��\����
�O����Ҫ��.�|N_r]�����oG�jh�E=aӧ܀�w��/�
F$I��WO���.
G����gl�s�^���1�̨#CiJ����nX=h�9��Pv�Ȋ����øv��rQ�
vzw9qo9�X�Ȋ����*�H��;��R~ ظ^��~Ԝ���gk�0Hx��/
���*��*�B�S(��jǘ���αlu���k���y��̞='��(1mg�_���9��*4���~m���<�웊&7�΃v�H�s��P�@d�6���4��:K�TE��d��Y{������{�K�Z����~NP`�LJX��̖^s�e��U�)*�����p�斿�6�O�����C��\�+.��>j�S��u��X�>�4p����af]�Ud">|`*��3����c�E�[ ����_I�(�Y�V�ͯ�z�/��_Uy`�B�_��_y��	\��:@��	l�<_�R9��;b'��.��+��1&��1�)�P j恷��hи�v�,������+�RZ3zoG����J������x��o�;���<.�baY��TǗ���\����U��~���ݟ��_�O�3���������tw�H�����?�7��?��!�wzq����]�pR�3$��Ig�����(����$N��UlZ���nw��C*Y��PkmQ�P��\5���_%��KqN�GJ�3�oƃ/��u��沊�XUd4Ot�5C�>�;#걕u���@۱�Wn9�1>��&��$�`������E�N�κ���Y1�â�X��tg�m>t�i�η
���3 �̃ğb�^��^��$ƀ_HL��� ��`J�4ݨ�X\��׹����6��n_7�3h���!
��gL���`|)��ȓ�]��ý�_�_��~�����?�m� �l?��e�_���1ɜ�V�]
�9�9�$7�U����n��=$�bN�    iՊ��ɷ4_�����3���t���y~� Wy�|D0�*��FO���	�)s�����ރ/�H,��!���F"�G8��s\�R�����A<�;��y���*N�ӁE�ϲ��lS�!Y�	�<��r`��{C2[o�dA������%_��T�R�C���AA�&Z�I���~��k�&���z��N��7�v���ng@��0����ٶ�[7N_B�V���\��ٿ5n!v[������e�/���{��.oH��ˤ�!�z#����e�����ߥyUM1�b*�t��5��bK�Uw��ީ)dV<��n���!M�/�n>�u��4�/4eCC����O+v[���[�h�� Yz�����K�C�j��ȟ�cTv�w�J���x���}��6����Z���^�e�����KMiY�������U�O�~N��*��@څFcy8x��������~?x>��N� %� �߆`8F�,��I��T}d�bMmat>��tӦ��߭&v�N�S�c����H;�*��U��U�����Y�< �!�D�jsY5Y�"B�fU��&eYM�S���!�1�n�� �ߔ�h#ո:B�yرZ�ZA�#��'r�����Q��џ~��_O ����4���2�'w���W�4����:����%]����&��8B}�2Y��x��]u�L..x���lY(�3%D�)8\��GeR8��{��S-/�@oT����}ڥ��B���}@#�5�T"�>=�I#�5��nQ�>�u�HaMp�
��"����C��g�?��s��f�x����:�WA��R��62�����ब���ZpN����*v��IezCp�8��_7��������J�6"rP�se2���M}"�1��alY���x��c{ ������m8~HD�������z�u��E�k���Z�vF���TI�ׇF�g+v�?(��6R�9@�l\p���@�0L�_2����b��Ǿ�`8Bp	L��+��^JD�� -Ѐ���6�aZ\�����WL�G�̭�q��VEn\J}��y�-�gnY�|2�����2�r�|P��6x��A�`Wg�MXt�����lK�\��E�g�\8�:�r���Nu�L%��W��*��*(�kR&�E�P_'���Z���&]�����g��@������gN�r�+kfs2qƆ4�,�uʶ	|���Y�s�}i���3JM���|p@v��h|ɫ (�9nG��&��6���O��+h���UC�%9��$�D3/�vIre�%8Q9>��j:�k�Q�.�>k��rɠ]E��R�I-/8�޿���v.�P��Uԉ���Bd�N����l�a���0�-R�k���=����vյ���p��4��>?�Z�K��U��^|�`��F(���V��V�\4�ؒ�
M:�f�>�$g������K!��Z�������!��Nt4���U5^̭�ޒ����S_��ks�[�\l���?��~��e�7��U�M��"�^��:xy�0n���7��`T\0J�Ȗr�:5�3�]	��_~���_��-�Knq�gG#K��ٱ�c��Kb��;G������*�GKՋ�T�)��uj��pJ��J���|�������*�����$=f�����}�_J�Rq��`�%�.�>��MB����ƛ?�o�}���wg�[~��`�$X:�V2�d�,�]i��q��wY�9��\-^)�Ї}I��[e��sL��e� � �s���MJZ-]�[p�[pa��N���XX�(%Ecyy��5d}�[x�V��+-p~T��!�n0F�B��~Du1n��_~��c��_�G�$%���O�����������?|:������[}�?��O+�=-�����K���{UeLz�h����g��w?��1��Ç��>���~l?}����sǸ���<�,W���c������R$�*�;H�cЈ�x���7F���p������?X̒U��إ�O�^�I�ȯ���0����:�TNt�z%�O����s��H��Z�=v�&x@�+|1�CU�d����F�G#ۈ�U��t�v(J��u���o+`~ɴ�5%ss�5�|̭38k JϪ%����Uqϐ�l��!��c�O���[[nY8s�* ��53�F���bV٢AE��&M�~cz��av�w	��\2TR'�/,p:.�iݔ�ט��:��4|{N�_��>���/~����H����=�׏�^�qӦ�S�$��b�"fKh�(۔�wa�U��U����W1FI�C�jȟ��L�?��P�Ǵ͑A��g�1��*f�)��Y%e�=X���D��:��ww�{dE,~��{���c�"lc�g�c��/�~jۛ4���,|��S|A̛�C�9Ԙ�b�{�sD]��#���#2#b�����h� |m��i=��������6�;�&��}���w9�m&ItO���j���1���O��gs��P�![�)�ί�	t�ʸl�H�����V�����Pp������'T�I��r�&��d���xX(A���J+k�iJ%������^��\�fSF*���S	|\��#j>�i�B�S.n�)����*B��Y�=ڽ�/<�uX�v���㻜�TU�Ju�ιc �<LǙ�.�W>q,�HLx �t�|����&�l='�2�`��������eTG	���c�^��h+������61���P��N?��,���p�28�P�?Rq����$�ad�o����̘J����3��E��얺�P&,2���u�kʄya�n>y��c;��a��g�Z/�\O��C��U���M���ڳV*;��-Gф�d�kX�(��~������,n�z}��[>w�����4�u���<L6��F�,g���_~k�h]��g��.e�K����}ý��C�y���!���%���p��W�K6�K#ˁZ/=aE��ȟ���@dK��"H+YvY��!)=��<G�����*HY
�#�kQ6�����nu���()����|C2+�ؑ^���;!������/d�6�;%(=��oe9dyjV��<U,�m�Yc�g��(%Mn�F<4�Ak��Z,�ꛎLx����[X�MVN�PpD׭��jc��v:�T��S���Uj�畚��ZЪ�PÔ2��y�MI�iS�f�oL/���,K{g�1(��dW��/9��+�~͒�dՓ�Ƥ�'�3��]�$�%8�U6��PoC0�'�����O���mJ,W�2V�=~l/�,�f�I��5��<H�s�,��}?���K��<�@��X�c}�]fN�%��'����M�]RO6��)@�kx��'�mV:�>con��g|.�G[ٰ���ݿ�U�_o�8�de��Z�+�O&
��к1;�LX`¢���t�-� ԧy�֞�0Y"�%!�COx��9��N!��Z��K�6U���w���,�\g�K�|t�U&�=�v3S�f�}o���q�����5��Wi	WW���� 򴣯��K�>+��@*K��g�x�OV������6��*%oI����J��i�59�t2�%=+����4����}*bJY�����h�N:���'Wg������ :�T�m�9�)[Ȑ�S�΂MI,^uM��B����{�f9�JnT�zE�i�VB2 �R�:�^�!BK���>9����<�
����yo�q��$fO�|�)����Ν�6r�{������ ����H�$!�@�]��)���EJ ���$�jJ�4��S���͒�a1j4��,(;X�)_�L��E��g����>|��MX�����"[���Hg�zi�2�]-�߫}�AT�a��`ύaE9�qA��T�o"��Je�Z���?zu;�Z����u���p�Ҕ3�p�)��Ɵ�Ό�gS$��E����9�A��r9�M�SFg�6��K�E�w�����A
 �����eC�����ـo�Sesw�j��1�w��    ����6WT�l�k���+��t��9]��E�i�Qhޮ~{��~E8O�0�,Z&O����*]�����yԥ��IVh�
��喬��oun��z�*��hr��F^&�MfAZ
���*��uSV5���}!�8zl�����\�}3�̃� �yP1N��)8�)�C1j�6�����{�R��氓Q�eFς��:�{%����B�~���W�f�{�GN��ཋr�j��/�:��]��!k��Z�����p��X�g��=b;a�Ĳݛz4�_][l�V;������$c�)�Z$���
:�=�Beߵ= ��_�f�287kUcum�0�6��O��C���(83���՜��J�{���{{b�ڱ��k�(2gd��0�{^iR��5���x����6�[`J�Xmǀ-���~i���Y�_�އY�<8�S�E��	.ω8T@`d��Y�cmꔩ�b2Ҹ�֚3�)ֱ����l����5��;4�]���^D}�Ab3�������dC��� ���8k�ڵ�W���̃�9ut^b%�,����cȱ�,� t����I;y�5�y� �]K��)� [��˪-"�z��Uo��y/�r�Sp��`A�9� ��)pT��J�l;[Id�(�D�b���W�#�]��S� ��Cr^C��� -6Y�k���ȸe�@!�o�I*�,�C�K��r�ʏ:X�WĦ�B��j��IV*�Z����A�^���46�����~��V�G�˧~H̋K�������<��B����'Y����l�����-Jޜ�9�߿l��O�>v^P=��耽�
��3�A��-)����4�����5v��������)ƪ:`�q;,�����w��?��C�L"��l��H�>HdR�E�_&�<��ֵ�@�m� ���49a��8�2�4M~ ��%�3�Gܙ����&�Pۜ��š��!�ucz#��]5�utg ��-�-*�حI��jxu[�`�Yk"�jv�Q��>�OD����#��D�S�MQM;C}���EM_��(�Sv@���LETC�9|�Gvg����rд�[I�̔���|])k��R Ӽ��<�N�`�������ɡ��	G�l=�.&�k���6.i����E������)-؟1�)����ԡ����#v�,�������r�Hw%�x�G�C9�lE+N�Q��)M��s�s̠�)�c&^g8W��u�tAg���������-�_��+F�T�2(�sP�,����������h ����q6��Ӝ�%�g����0e���3�䄭gi��w_�eg����}�.'�!XN�$�)���v�5N������w%#ݚ9�oH��S���>�6�T{���}�t��r��2F_w�m�B�y���$5���p]���D1�c\��+��^x�n��<��G*-M��d�a=���S �ƪ��`�<>ARN0�#=��d�i,��k�ZA�)��In�, U�c����!�Қ���S�#��^���6Ի�W�j����R �G�be���*]/&����������1�Hy��5�[][p]�xD>
�Y��9t�5�%vi�9V����N:�̃$~-�aN��b@���"5}��Ɓ�)N��3�q�<辐B�ct`�FŔ9y'��3��FH�'�g)D��"�)nT�A���~4���r ����K�����6�}�?w؍�yAt؟���*7b���;�K�������������WvǙrGp�����qbωqU5��x�9Kkn�PN��:@(�Z<�|��:�%ZR0�t�~@�ǗH�x��d/gT�[gWI�te%����8�ߝ�Il��QYl�?�;���Jn�!�tQU�m��ï]�
.	���sN�G�b��s3�h��d���U��,Y���g<���.֏�z��Gb�T(�cf�K��x�6g�[��پ�9��ݘ�+�8n[��jDQ�Pw6��^][�5�XaKG�-�hf�����xmm�_�ح6%N�`�;�>�F��x�)ڝ׆@�k�Q����m0�^I-$vGq�~���]L�m�:(��4	{��!��Y�	씬$$>OɃ�9%��ؿ5i�̿�7�>�!�p��
D8�1�����o���]yY^��т������C��*8 �]���ɴ����úW���fD:8I���$�̅�Я���^���%6 v ~��T��ԓ]H}*&(�T��6e֚���@� ;`
g�����zr��zRU@G(�?�ٰk!�$�v��QS^�D@H���4��l�{�-�յ5΄��Sk��bqm�؊�͍��)�+4�����eKV
������!u0��C�D�DۢI�Xik�,�g�I�]�d�#ƚ�^O!ɶk@$�:�\8�Ŵ���:�/�B��Eױ㤙9;��gK�s��n{��U�P��s���=�A�O�(�ܒ����:�_������IU�h�[a@/�����\�m�������r�^�K����9W��d֝���u��)��I��g�{s�?�_U�������g]�E[�h��hd��a�!_���(�%q
4e��uRC���2�4��3�^�Cz�6��ە�2id����3(�=\��׬�Q��C�)�J	T�A����,��qE�g���6����3���:���HR���9�[�U�gr��+�w�
͉��!K��?��"T[�����q��ʒ�QA �f����%\����o�t@!�Ό�&c�g6-�$CU6��6�6.��ѯ��Y_[v��5���)�<gH�;u�Yݪ,�#c1�����ڬ����)�I�`��ơnU]2��qJ#��u�.��ӈҩ������ޮs�k��$�>F�-�kk��*�-�	;�z�ݹl��4��N>��{����y.��\�uҖ���u[Qu���L��"��=C�{ߦ��5TJ{��`\[h��4"���jK��/��Ҏ8I��;&7%���-��ߢ8�lɦ`c�&oa��U$)/��I��#��uWy��`)W�6�}Tn�2�}LY�]��Ώ�T��%c���f�*�L�������@��n�����S��rT-�3�6����5�^���Оy���T��Z`JGa{�#Ǻc,%��3͘�[=Ȇ�P�,�cmؔ�);1o�s�����և�� �7�p:.�G&2��!��ќ�ؕ n���u�����~�ƷX#&EQZ�=�B*<*L�f�3��p�/㔉씐
�%0��&���wɐ)��7��ݴA�]
WR���*1�g68/3�����4�<���U�<�x�-�[[�L/�+�V8̭pAn}_��_[��������odU�
��(A%k^�w��{��H����c\&��3i�P]�S3��2�mΔ�-U�|�xl�W"�����y(���7#���di�8!��-����p��s����˅Jg�8ncYY�)� �a4�dFf�)90��E�w��l�r^eo��>X�K͔�ڻiajI��?�a?:����J�:��n������m����߹c�Ðx'��e�����5p{�/��n5f8ߑ<� �����nAF�U�20i��&j�p�ܴ؉�P�]wj����Nd y껷�<�Qh�.Jr�kc�Ɖ� ��2�yG��E���Q�-��0��\�{�-�յu%��l㣞v���B�%>s��!�"-K=V�7`�,�ɟ���1�e�Vu=@,�Em�t&D+sN��5���٩���R7�s�)=��]�����W(�5��3^[B��9Cg�ʃm�Z���A^�Y^E�$b��{����-��D2>���Ϲs��SJ%�C�Z�e{� ��Mt�_yBie�ʴ8��kk��_N��ܔ9z'��A����56h�N�H{2+#���Z���mV|�յ�$��$җ)��
ٔXCB#Yp<#�P�}mnь�Z3�8�SN�$�-I�.r.26������c�;�K���(��,�F�Дr�\�&�\s�ct$��r$g	�^�K����(c%�O��h�)�r@-/��W�eFTP�s.bF'��    J�Vr=��y�u��Z���;��=:� �[p�1*+�L�\zrkqm�:T�V���'��Ob��TO "�K�-e�e4z=p�듌+ӱy��Nn-���$Ԡ���"�NA��(K�T��u��i{g��e�|7��c��w���`L%���3R^�s�s���L2ϙ�pv$�]���.Ac�=� �攕����\�	|��@�$C�h���b��V�˃s�NR`8;�lN*����ѣ��s���g�q8ú�D}��V8��MZ��@UW�k�प�s��Z\T��8c��Y��\�
���+��n���r��3����xdc> ���Q�@3�F����~���uezMp�wC���2�&�V��b��������7'h��`(�n##���B	��ۗ!#�pJ,�I�����D�E�D<> �*���a�<���F�.�ܜ���#k�J��j�S�|�!ԾF��%��O���E�k�RPI@?��	��	���˟c=xT���.�y�J��'���nC0!�j�\���v҂%� ��p��k��d`o�_򠳔I�*c8�'���lp��%����u^�iTx�&{� Q��+��j�%X^+G���9�dC���%q�����!����|��zRۛ��y�r,�L R�B5����}���m���m��Х�4: \Q� *�$�����i�����Gs�6�T��)�zK0Ze�Ԩ
�)�zK��e$2�X���H"��	V�����ؘ!ƈ�f�Ҙ�Z�^:�t���F�%<)�$��PT�_��3���5�� U�t֤|,��/ɨnK��r�݆hCp09,/ǽ�i�6SP$5��]��m��l���4D�SRz��'з��C�&�lA
�E���*,�Y>Y�����rہr�������N����������`�hN-\\��6�{�sW��5�-��RV���R�ۮ̈\�@d>VC�v�~���c�OJ���*�K��Q�C]K�U�����[麉�ud�#^QK�Yn#"�d�+���c"�T0V��c���S�+���8u��q�����=�,xU8���5Wu4)KW��6�X2�Jև���xC*�1xS�D�/������&ʎV����T[ʳ`a������`��$-���|�a'��[TU�	�����������K�l���|K+��-�&�h� )�$����`Zh�@�8��-�y�/1�4K�_��n�vP.4�hu����"j5< (����e5xCp�򑤀��j�`��^���ކÇ�H��B�M�b\��)3���RT��*;���]'_����-Jt�5R�:�6��K�I�ȃ/��2�F�6<X��0R^h������DG%c����u����x�:�3�Ŀ�1���V�֠9k�Q��zQY�3��`h�9���e��t��sN;%���rҭ
�K �g�A�%V�R32<�S@Ϯ
�z/�9� %=O�z:f�A�V'2�EhCv��G�,Cպ��A�{t%s�*Ylݞ�k�+0A�	֞ј9�eO��^8�g��%S�B�	������A�y�-�OW�s�A�Ĩ]�>�Ƚb;�� c�)3>�3z�Iy+�&��y �ՄP�1+�i�Oʲ1#���;���G1oوv)m���5���t�{n'{�)/p��^�s+.��,�X�V�N{o�z��(+	d�&6��]q㿎�{��������� �Mg��oI�(�)�� x��{��[�낼��)-Rb[�Ctm@S���Z9�Ȼ#:�|��ޣ�_$�w8�UNу,�z HS&�:�B-;��w���Q�<�gb��3���@�ƪ9	��&@!�����N���3��vLU>��2��)���k�Ȯ�-^��X�nx{�Aն*�5�ӎs�E2'3����C������[��h�O��'7��>V�g��B�ƙ�5�P����v� ��-Jm(Jc��)y��!����rI���OC�{y`6�{����<e�P����<�,7׮+u mv��~�#��;�����U�f=e�dm�l���fr�n'�]���T��[�t��o̓L_R��H| ��v��9W���A8ǉV:C8p��g��V��<��E�<�)�E���:e}�0�LN���̦�`��5{"�3���k�8>��F��Oi9 R]S�򀡄hB���E�y��&˷ߥ�]��A8��>Hm�Y�A�Ђ��|�i/܂�T� ����)#J�*ZS��i�_��ifj�N<ԊO<�IEylͰ��y�%�(g����3ϣ���s�ţt��B�=�S^�똢�b�c��]E5c���mH�c$�T9�b�́F*s�	���k�X�#fbo�w�,x�9rpI<z{��|��:'��ѧ��[�'=:�Tl��m"<@Qf�${.�*[��i�R�k�UU6$�u���d@߆�I�gH�\L�h�.�^t�.6�(�����9(dd�J[?�I)����\U��@�����@�����|�㥵{C�4Z��ҧ��5�ΩP��7�v�I��e��L���`$9s����J,_s�mN��9���cU�L�Nٿ`}��$����\|p��	�����%��.Ém:"����!���L�������������<@TI��S���;�+�����䓈���Ɏ�Dຒ�uV�!��PX�f5���.ȓ-�vY>D2��دL`(i�����?��xQ���P
;m(E��A���H��{�m�KA6pȤ~m���vaC)����%8x v�}��w��ݐ�d�KjA�M��nH�tZ����ǆnH.Q�N�|�f���kT]*nٴ<�ݐ̄��Y���m�� �V������OA������6��K΄%e�Ʈ�4�1�%��(��)�z���KY�.(E/�����o��J�4����BA~���fKrPA`?ReV�I/I�M�h~��yC������7��`�7$�~��>L:oH更n _�6��ߐ��]�2����IN&z�h��mo�]ga�I��'��j�v&(�X\� W�5��R�s�_~aO�x����r0�Q�D�� ��P�/���U��ܬ�jKr�ʢ �o&�T[�[e������SmI���Q�JǪW�T��E�#��/;6,�I=Ֆdӕñ�ɻ��ڒ���i�����$g�Y ��_ڦ�5�!A��	2c�jj!&݊.�:WZ�$�*-5��h������Bfj��T%H�G��%���ђ�n����CS~b�������d�WQ=�Vp����{�t�@��5�<[��*[m8x�op���jK�U�Ʀp��|� ǚ���Թɧv��k8k�Q�	����k8�MQ9�>�@�I�n��!��(?(�t��k8��ʝJ����p6$ۢd\����k���w�t�m��M!��FL�6V����+���R|!V���J�3��X��ʑ���\^��#T	t*��V�-I����҈�Z��	8N��l�T����^���`U�S}�ۘ<�����C�f�&dEr�N6��`a^�"��/2���^�	��Rw<��8��c�M�e�+}�GL|ф:|�����>6!]���V�����:	�^�>�?)�R��l��G�$Y�%
ɵ���(�G�����ru��~���lg�4��
��+�+��V�$=��"�v�^J�Ń\�J'���_n��-y9���m��N� x!���K#�5I�J'�I�_��'�3Įo�P�� (�Ef,�c�-A7�+2(�k�R��������%*�%��TӒ�M3���\Rʕj�~`�B��D���h�ش�J���	����'>~)��W¤��y+㐦��
��NG0��MMɖ�a�g»�b֚�5P]VÐ�>�֘h]���_9P�!;-�_sڧ5֟�-� [����y��o�FÆ�鲀�x[��O`���� U��ȌUyʕ������/��=b����Z������f�?�e�x����z�[Zϖ�f�W�m�����!�ci����t+�dR    ����Sk��P�Q����S{+��_�я��z��_���ΝZ��{� +���,S�Sޣ�����:/�X�f��s����{ds��Ǯ\���GYC�cyu)��~tm�����i�����)Ն|WZ 655� ��+��6k��&�ǄX�}m�<d�JPe�!>�=� o��([]�k�V�ާ�5�\c"�PJ��%�4 /��켶h�PT�a���6�8w9_�U�c!.]��b&P���T�f����a��9��2B����nР�ymp��)��K��:Njq,t��A(=��H�٪�m��೮�=)���zPt��#�p�_��cX9|���X�T����nײ�����J*]'K>� �p �ʭ���%�P��d�\N��9�p���{�	F!Ұ��b���.�����Ft��W`�v��g��g�K��Ԅ�U7e��q�k�=ӊaV'�J��Z��[�Q��������-	���*е��ŵ1�h���u�ܾ���ƌ+���=̠R0)-~����[�����VsJ*XyT��ܳޭ5Г9�Q�56;v��ǝ/8���/5PĹ���kl���?o�G�n��9��r�b8c,A�L��v�U�	� ��ޤX1�ȃ�i�sL����snԼv�����YȁX�޲�fJ9H�ד�M�h��T��ʸW�Oѩld����;�����$�ޯ[]<�=Vù�xd���$#�I ˸ǎ�]�<���}�nu��SC�)��ޣQ(˯]�ssm���F�8���|��k����9I;Lidd�3���hum]i�=������� �Ҙ!�qʶ�޵�ֱ��2��\��	R����k�k�^��6�I���.�m�uI�=F[^K"ۤ��CI���"�U�8�m*[
)��˄"r,��A`v
���`}'�/H��	����K�����`,2� ��#_��JS����`MN��S�[16�"�*]R"�&�#�@�ؔ��.�vm��矖dl;�2�6!������<�j�%g�#W��k>.��qR
ylc=���@a��%�⵱� �]RO�m�V��`-�U,�lzᤚr�P��{�-��6�u����z���е���Y>Ƴ��Nͨm���r6�\�H���%B����h�|Ͷ�4��R�I}��5���z��.mKD~ʗܠ#��/�IH�5��unh ��׶�q]�.�-�V\ѷm����>�m�5�~w��3�b�N� B��M�����B�I �k�G]Z����@n)�l���dφ����Zțq�PJ�ə)���M��{�}4c�'@��;�%�\^Y�f��7i$��6� ��u�G�&���e/�X�=%$����Z��{����E��QʑM����+t@�'�P������=��JSڎ-�9��/���7P�,�l���RyΙ6mZl�Y��d9G��19ja�!���'e�<W��'�O_�*H&���ծ��w?����0ex��r����"�������V&��;�s>�gf���X��v7z��!�g�HX���~�*�9����#s��GG��_���ٷKU}�8D����q��,�1wKNS�M0WvrƢ�qg�Ķ�<�^L���k<ri�%��lɀ�4D���O�+�<�Q���t����]e�~&v2S�-�=(L��)ц`�֣��$�iJC�%�#k�ܘ�r���Cs�Y�/4.�^ۂ��F���0�X*z�����\�룋�^����V����.�n�A\�Z�O+�������rO_J���P�%7���Y����~���������K'����]r��c�ٵk���!���^FTA�p��WZ	ەpA��}�*m��������_jy�E˳�r낼-u;qR�&x˭x6���d�#�6��{m��/k�K�_�E,����}m���9�/m.��H���}x�s�,��uG6�`e=�����L�i<�&��~��	��]�p�������a�;�(wYy�#��S�?�Wӯ_��R���Z��9)��������ֿsT���?}�B����2�<PJ����a���e%��R>|J����T~�?�Ev�d�((���t�;@}I��[M��Y��������*�3�����C�v�8s.ȭ{�K�������TX�d�	C@e)t��>����*�)����߹D1*_E6�w�_��~���Q8%�؟��p�?~�ӱ�����7��ǟ����|H�����[}�?��OK�ϐz�~�y�k��_�����f��3�G���O�ÿ�Ç��>���~����c��ÙS� �m+�����������<�O��?�g� e����qD@A�L������dD�=K迟�KJ��Ra��I�,m[L�7/V-�RMTֈ@��:a�4��
0�����95�Sr�g2�x7@h}�&���]�NA;��-Y+u'1B�f�c;���L�tmNPМ(8��k����<0�����]�U���ؾ��z�RPu,� m�U���%�ɳʇ�@���*�ٜ��`�1��(3��\�Sֱ�,9�FØ����<�ZL���]��ʠ�0��n�'�ա��Z��,k����������߿������!�3S{Ģ\��ח�G�G����{�4��x	���r[ph�Z��:�e������؀��i��g�<���}C�o9N_*
� �/���Kpa�7p��hZKx� �5s�3��zK2�5_�nC2#�j��ω���gT��	Ekp�` Q��B&��s;Uře_Fi�R_�'̫G}旕mF`��qF�1\ǐ<�����]�!4�w����< ��4�2J ��V I��g+þ���i�<؛��.�QƤ�oX�'����N�H�Q3kDaK-+aT
�m�i~|7����wh�Id'�i���DZUř'4��D��q<U��%��~�K~ؽǤeM$+]�n|`���K�4G1Rr�C�^_>B�~y�h�Mc!wl�`O�h4\4b�Ê��i�����ȄW��$g�ϱc;Y����@f����ι��w�ձ��Q`�������}�9Y���A��*M怤�/Y-��C���o�[=���}��)�'�|�q����G$WE}��l4�)���#	�s��!�Or\��Qaߏ��jE7$ۦp,?O�R�lE�$'�,~�k<�(���x�0q�¨�^���V�c�I�E���Y�Uʔ`i:v]K�ݠ�x.�����}��ף�x��_*���0�n�0��U,�y�����,���J���>�k`����%�����g���},ʜ^:b���K��J����Ǌ�>�qIraˉQ:x2����5(�˗2i�%��S��j�I�%ɕ�@Y���:N�M6Zd��b,�M��3{��#8�3�$xX�x�,�J[?Z��A�3f��9d�=��>$�G�a'�2���h2����G�R�M�_��1j��G����6������� ����c�S�_*�jJ�:����Fö�R���{m��j����.|��3��U�R���*n�P9]Ï���4फ़�E��[���.�*�fb6$35y �{�1xn���Vn�����d�MK|���M�鴰-B��Q��$�ͷm�J�v��vC2ǴQ�sLjf�n$7��>�v�>�zovR59f����^����N���.y��
�LK�;�}�s�,qr,�x+��Kz�~z����c���us��7iw�<*/������3}�f�����nC3��eT�U�үu�m��¹tՔO�y��f��«b�v0����KlH��⡡w;�K~Ƀ�[||2���{y�0k~��}s�1�*OAqp�A��t�.���)��2���8kX�!Y@�h,�N�V 7$��6�	�~!\f���3x!\���s�5x!,If���&�@�ϲ�I.F�i�u���+�*�߹:�5�X����a
zTa۔p�X���L �S.�8ٽEZ�3-O��=���/9��%%�׍(��
��u�?xfA��dsو`C2�{V��i#��T��(���Y}ՆdN�,
5�&ɧ�r�l��xf�/��EP�ΐ��5"ؐ\���ohֈ`Crk�?{o�k�m�	^g~��{
�fQw�'�`ix줯ůH�    -�eɉ��Tq�z�"�,�,}�����yX��z��zJH�Co�5N���g�L�C��T��ޕ�L����,v-�!W���(ֶ'�)%�V���d�%4��L?�I��dn���~�r�9�ǧ�&�מ����-U;
������3�b.�9`Պ�O�v����n�z������ʬۗ�H� ���{>,!� 9�5,.A
����O��+�V�w~WV4C $_�EYpSV4C��!]��A����D��3��E�Zy�ܻ��{6�+��!g/d�m�]o�f�%���J\۔{ΐk��k��{�_^�܊�엱��)]� ل�n��1lJ�G�!�HT�7Fm��&��j�]ڨ�Y���\x�ݖC�Q)#9C�&њN*O�tt�I�j���Q�йz�zřЗ�5�~���ů���m+��H�^�k��̧���?�W�77-r35�E��yĉbDlI��:�˖�H%���C��T��4&Myy@��'O�s�`�N�������KF@�*�4��?�z�a(׉$�,�kPB�pʩ�V/=`�\n�9�S�V/͘-��^�V�k켊م�S��zK5�3��X��+`h�M�	��<�^6 �jxD�j�w�/%ڰ���������K��Vd!��� �%NjHO>�3�(rf�Tk���O�	��)�\�םq/�3y}d��ذ�fo�b�:�y�q��w����ϕ�Iq��Lq�Hز����@�>����E �)/���4u�ӓI(��v9.u�%b���e1�ӟL~(�I�72�^[�-�|��u3���"�#�l\����$�������54��'��_}U��󟾽���x0�:�ϙ�W[�7PAg�0V׹h
ބ�j��d�RR����H��F�|!W�_�uu"��of~����_�Z��yD�q���;\��,.����K8�y=,�o ��-����ѿ�~3`�N���f�@ny-�$'3}ǳڸ)��`5n���19Ƃ�������+?Z�ᷚk-����c�Yå�YԴ������@���,��d��\�u�9_|LF��ߟث|��� gGn��3���\���4c�[9�%�#/X�����s3F����`ri�C��e�G��:rs��s=.�J �>M��� ��<�V��s=�z��Uoz�G���KaG���=�#`JL��&\s�?K��gFd�D�I�͔�[v�}Ē	����i��\�O�['���h���J>4p�n�	)�r]ᷙ+��fX��e�o^@%v1�I��u3�(J�w��Ԟ�h�%�7[�=��43Vs���#� 7)�i]�Y�f/��ka9+�T�Lʹ�*b)�,�/����K�I��NzN�Yy�ۀ���]4����s���󗒫WzN�y��m\�ڟ�e^\@2�Ȏ����s�Bv�1���`L�Yٖ���o����sN���Gn��==��\��h���R�9�M䮾�~͡[l% S�WVnY�k4�5�#��xg��b�U5����`�6�(��G�p�G�/E!#�do/����Dk�h�B^\�A�������	p�"T.��g�=]���V1��i���7�3�O�n���J��3W(z�������TX�Z�M]�X�!�c�~��X�,"�B@JuKUߖx�TЩpmCe�M��سi�1�h�r���+?}����CB���Xy\����~,^���~	��>36̀�0|�v��_�&���j3����&� B� ׹��&�1����_���&���/�NWꞱi��0���^��46M�37Tt�Fk^�֖ �rAĮ��q˪�rv(���X"�I��y���`z|� b���+U��KJX�̛X���`:-�<��_� E4�/%���t���u�uA���`:NJD���7�#଄���|�4���������ϯ���������pmB�>G����t�*��<Vs�4��)����c��5~xp)|/�E���cgE�6EYP{QV�:74�A'��UGT���l������L��������`�3n(BsQ5�~f��#�?r��4�� [:���v�{F�	�SB��^��pi�� w=J.H������G�AR0��j6��3�Fl�_V��g�� C��Bp{F�	0Ő��yn�'����x�^8� Ǭ4:\��7�R���F{�k�5H������;{YaM8��Ằ��Kǂ��p�C�қ�yY~V>�kТu1G��O����bS&��6�']l�k�ز)]���+�rٔ��������Zؔ�������1 nJW� ����M����L�[AmJWF���FL�۔���+�5���d5�ҕp�$֭Ȳ�&�-FK�ͳ�S��c@�CC���.]�V�BI6��-0�K�KC+YV癸p��kn�5WO_��x�A#2g��~銖��M�KN�K٨?�"J%�1)�0n !;�0���������t�Y��r-�D�`���`�7
�P�M���$
��!K���l�G2�Ti�r�	��[QgTk�Q�M�Q�.�sܔ���y�f`P�n�FG�E�Х���ltXN�!�M���Z�����y�Yj�G�aړ�R]
EgШxb��!��B�E��,�w�!�1ŭ.�Â��/Q��r{%!����,r�������i�g�p^��C��6�L��-K�mOB8&�<\�=	��v��~l6���7�7~��)!�w�2����?Y�=	���0fE�nJ'��	�W���#�`�W�lӧ�$�#`%��as~OB8���](E,{�	�&/��Ǧ^�%� 	�׺�Ԗ���,�l�E�Jˁ(����T�Y������=+?Zѡ
˟KQ¥vZ���I�ti��
�xx*�� Rʇ�ʦvLYI�)h�ޔ���\�g>�¶�6��`X��ʃݔ�N��M��徐����}!�kjX+ù�����27}`� 3!l�w:�)� &���9k�)�!��w[6�)�k�!mcǼ)����2`Sx<'5~W;���'5��k������7�'{K]doȐ��w�MJ�6���Kc-m@���NX�vY�[Y{���KGT=��飍�ʫ1�҆jR�#�OQ���K/�O��Q�����w�����KGT=`NAx�( �-7Q���@��˴W��[��f��K��>���bP���Z�����ĳ�Zse����[��������AQ��O��]R�-C �fyK�5kP(��:/]jN��?[��~6�o�Fi*���x�g�_����&�.�l�Xs��,k� vQK��g�&H#�k��K�A�b �O'��xr����@���.�S�/)�Rڋ���,|X �Ч�Z��[*ui�֞xY� 8�}h�S:dL?F�g�m�n���"%�1�u������$�g��-/	p8vZ(��l��p쭰��F����:����l�e��3`J��c�t���e�8j���A�-/g�H���c۳g��(�����g%\�2�h��,�N��礸��e���(t������v�����L.�tk�s�)���\M>4�ݔ!��*$�|2G�d�`�F�>���K^��|��
��s}eI��<7�2!\�f� W���1=3G�'�󳹄��#L����?)L{�`~��۳cL9��o����9��HF2Q.Ů�&��	(<R5�g���:�4��gm*/8�p���{���W]�+�=s�	0� �-*���-s�	0�#��Ě̞9��ζ�9�>�#L������|�3G� WG0��WF�_�#L���5��$|�|;`}�j��y��~�ƹA� y ����PQ�,K<��D��W�Y����V~�.��S�lܥIʹ� T�]h��-�pdW�6�S��	p�5ǌfӤf�ӳ.�]��pT��}�M�̀Q	��A�6MjF��krYwLEm���pL�M�~T��4�-��T���iR3�Z(\�RۦI���[�\ΔîI� ���Q�kk��/LjF���n94������0w֔E%����    0?���x�rӤfLXM�i]�4��0 nl��J�4�V��2�.�>�8!��w��,?��1V��a1hor� P9��Y�9����1|6֒�ĭk�������UBz��-��%�c�8��Y�8	�y/�if�/�)iJ����\iL�2� -dc}Uq�,ll��<Ykش�l����c�Sz새l�����&�!���b�F�3� C��ˡ�{ή�� Z�3�Ҧ�g`:щ�:)R�=�0c�p�Rf�V�٫:fv�%]��Y���3b����왅M�Y��Bϝ6}Z� �no�t˥Wea#�,���e*�m��M�����P:���8:t�Ǣ?��|hܳ���A��>u�$9wT>�Zq�Z���M����}����������_(��){��l/��������R�+�w(f|�� �t�Y�<w)a�}J��6�՗j�L��QX�?&���K��d!����/�,W
���x)1����̰���8��5���ֻ΀�S�B�Qmy)1��y������.%f�艪��׹�@M쎀)>:`��s�w���ӟ)�GSM[^J̀)?�}G�{��̀+Y���eS{Ԝ��+٥�喗�H��_J�5ů�.%f��(L��j�ly)1�N��U[��-/%f��E�X�▗�[ò����RbL,V�PR��ly)1��vT ���3��ef�Q#�&�X��B�.w
a�<�����(���k6)5]P��y��G �v�-�h�%#xT��.�s�@�He�Vt�����k"xn�;n�j���5��ưq\���#��-�k��M��pη��h�n�玀a��$�7��s�hz��T��#����~�l���A���&��ڜ���0�*�L2*n��ZuL9��23LJm�玀)G��)!n�玀��0I�M͸0�� �W,�զy�8��dAV�զy��Z ���K��p�����Z�{�#`�h�gaڦy��]h�c=V��/�s�>Ζ�z���I�� ��o�O���|�.��V%p;=�&�lLFg������d�l@�4��4�ʔ��%EΠ�{�+�� "��U)�- T�3o����4Ǧ�4O��h��B�환O��o��+�ۦ���豫|�YM�31� s+Ѝʤ=s��p5³�{̺환O������L�G�J���M��k��|�������A:�FӇ|�M�	�1���:왘O�����g;�M�'��C���\�����k"u�uzW��L�'�tԲ�F�=s��0�p�è��31� ��L�!m�{&�`.�ɜ����䕉�����,@jW$^�L�'���)ȕI!o�� ��T0���,w�I �e��Bó��4.jB+�r�&A�CmQ��V��60+��K�2d�^���/e���ܻ�y	E�M�dX\�B�ҧ�ϥ��d������B9�rt�$��r!�'�B�Ⱥ������;|>��A��+5y)�^�Î[z'Vv�x�z�߉��4[�zC��� P�J3�j� ?r ��Ù��X�G���{hφ쏐��Ȍ6ɸ4�2"����hu)d��<9�����܄���Y�>z<_
��*���~Q(Y�������=�0�FJ&�p߸r�B��Φ�3[��g�0���^H��>��2�5��R���ڹG�hwx��Q�ᰃ���u�Y��\[&�Ot͗H�"������aԥQ�R��3zc���z\���Ũɘ���$�U���z��<�������Քo��H��rۘ�Aj����}����;��$�y_+�+�Tn�PZ}5� �4BK��#sޖX��i��'U.��_M�Gȝ��.��%�#dEa%Vځf[b=B�`�|u��S��~ːY%�w�����!��K��m.p�Et`D��ڸl)�ꌓ�TY"f��8�	���Iv��`"-�/0�[�ӿ�(D��e���h!qｴ�Kp"�B��Uv;A�2 ׻��6� �*J������{�\�����&�����g��}VfYy/��>������w����m��Y7�Yj8:kwe�dʂ5���۲�	��Cf���v��=m��q����w��S����5{2�[Gj�w%�d�-���2�v%��d.�V�*8'?.���y���(�v��M�
m��E�]�D�M���X��n� ٝK_�p�h!�%R1-x��%)4� �ri�BK���Ƚr{�b���D��i�|j�� 9ô2���k���"�^[`Sb=C&/�X�7V�މ�)I�4�/�Jz'Vfz�kigl��̐������i�2A6�kơ_h¦��Yq��ʦ�U^!k�4�Ԁ�4}�!�E��y4�i�2C�tr���W�i�2C��;�.-����c,CF�ѯ-p�6�!�ZN_�^P��6�:BNB���vy.�[ߜ�����G=�?���g�԰�,<�'�5~ڼ��#d-�P�[Xdܵ�e�L*t�kH�2;���Q"�.�Y6�� ����:�yVvIXٻ�]ޕ?O�=e)���*��y��m��v���!�@L�/󚭻��	2��}<��iW2��9BN�B ��P5~1� E9?eՕ��k���:!��ғܖ�N���9�E�fA��b2:B6��wt�b�Fay6;���@F�d4|)��_���ZB�K�mjg�J�������9����;T�;��A����Xْw�8A�}��=BvM�.�ڬߗ����{N_!������eH����������)�2�2�&1��6fvdn'��*��ev�b����o�}�� �ᡫ��Tb^���r�"�kƕ�[�� ���fv�������t��������̩�K��䠀��C+��XY���Q��l|9M �*��kF�����Id�V�����]K��DF��"t��Id߄���5�Ҥr ��s&�p�|9M�G�PE��XX�˗Ӥr����Uj�^�r�4@f��7��i� 9��cE�Ğ�4�,��DQ��\��_c�%0�>��-(��)��U�g#Z��O�#�Ҥ2@+>D�뾜c�\2�h(k���f����PԾ������>89o|53@VF��ȓ@��9������Υ��r�2m\3]H�r�2���&U��r��cu.�w���doDf��X�j(�t ��E����]���5��,[=�ʺ�k��C�����l�ȐXt�+�Ɨdru�SM���o  st�������G�G�2��� >@.����Ѫ}� �&�GhB۸jf�ܲP��r\����GȬ�p+�ĕ�\�%'�����^��%aX�9���N7�ju%�.��\�a�<�)r)��Qk�o4 Ő�)f�h8@f��/o������i��`r�s�� �v���\��ȁd�f4����2�����7Ng�Q�������&mh�Fpu4�@���C�"u"�lu
���k�ߔ�9���)nܞ0@�@���Z	�$�d��`�d�Ih)Q��H�}C�>vq�o�m�mC��EѸ� ��mC� 9�(|�zh�#�N�	��/qK׵�eZB"���P�K��Y�zc"�N��~z���W _���#d�L}ċ�V�`�l�fzh�����6���	���Ӂ�\�g)�;�Ӟ��wx`��v�3����>�i~m��5N!��o[r���2�Ȧ�ᵶ�� GnW��ܮ�No��F���)�}�� �rťgf�_������P��vJ�eN/;�z����5d��Qz�R�m2�Ń�G&���F�DK�t����6�"��e{���`�h��v�3=��@V�m�_t�tƃ��	M��-m��8�U�SH%�{Ț���Z�� ٰHz�UJ�Ze�ˎ��B��A��E7��Ǒ�8d~��6���mq������K���\��V^�<�V��0S�5?5�(��3S?��I7��7-ono�]��lc|';%(Q"_�j�
ً�!�-�O�)?�8>-�p�,{���>o���F1Ux0Zz��c�@KC� ���_��r&�ւ�''hpG�"����B��_J�ڧx�d�������    ���X���T�s'̐)u�|w+*N�Y�Av������|�FyQ3�%Tz��B���owQș����}t��rv#ZJ+��TM���<��6p2��.�ߧ7ga1Q,�t^o����,�W"�i/%Og���=�/�����#�nN��u�mA}#U��LB�{b����=�K��A[���gl6hQ�5��sï��s:ԤY%P�Ϩ��^;�j�>����_>!}�P����ͳ�>&?����[���!Cqib:��}��,����LQ�v���8��w����k)_����=s��p��_
Udϯ.å��a	����zAx඄$+� ��g��D�*���@�k�}q�:�pW
aK�ࡨ�5��1i�"��8yX��G�"r�*����l��$��"�k�<�K ���� P�%D��K�cy�a�!�G�%w=,��3{��k��9)����wڒ>�6iK�W#�%�W�4ɇ��ۘx�A���^���2})�	8&{�e��h�q���K Nd�7n���2�����7i��=AVDk;sT��z�'�|��h�{��X�\�a�l���!W�<(�j��(��REU�Y~n��U�n}br];����?�Z���.i\�6�����%���EW)��e��B���.i�lț�^C��.i�l���0�+ۺ�2�����Ju�[��	���tEdŸ���CW.N�2Wr3��-G�g8�g����`�$�h,[Z�"�/Y�'nhڵ^��o�Ä{��E}I�K�67��s���K�J#��z�	�v�x܏kjW/:A6Np�ƚ���^t�l���V�v��d�8��V���r�� S�aJsE��"�k�\j�����,Ri�bqx6��0��ans4�n_�+�>��>�z{~��%�����&�a��@��_���'�^�Ǝ$5���!s���Eg���'���d\nz[�<A2�%��u�#d����~[�?B�*?S�_x��X��sen���e�W�*��ˎU��(0)��Z�'c����8VN�Ó�φ���`</VMKPZXn~IF���������sc��,,G�¶�Kd������u�kc�٤[u}Z�a��*g�2>���Qɰk�� ;d!fe�Ǫ	�G����Vv�Ud:�N�ڿ��-B.��D��.�k���r]Xxb]�/K�m�����P������*
�(�	r/Ī�G*���䣄��?����6��>� {Ts�|��ⲵ�����ǯ�������^�������	{y�yw�v2��A�9����|��Zp�]��I�̰�AL>Xk�Vwk9:�%���RK���l-�wk�ݦW����?�`����"�Ҽ����e���쥥���O���U�!ϓ�>vY��wWI�[dOh�GT|��2wk�Q(��Kh���fki}�߃*N�z��R;�,Ƭk�(K��nݪ�%b���s�]Z�G�$��l��q�@F�^�9E����������g� V��6��-m���<檴ʡ���a56��o���l@�'0���r˂J M��Ԝ7<�R�O�0Z�b��$�>����?PPb����6�u�)a�!Uw��n�n�Dcm�fKx���r�k�+ ʆ��"5>�Mg.��Mm��:FE;?X���e���P��g�}�h�J���,�����Z�r����86�`�,E�Ӻ�PD�D�I��f���2	���m�d�J��N9�x� ��A9��?�XpK�I��L	���d�
Q:	�Y���� dS��V�{��"K���7 [б(�ڝ����������gl��h�ᢕB���`3�I�h(Y�� ���e��ݲ\�` S��E{@Jr�.��M�dw�%T+4�F�[6��``� N|�ςnX�%Z�>�2�n�j([l�6�؏��,ۨ{�M����j�ʖ�;�&+U�+r�)ő�X��q���1�&A���b���<��/���I�) ��T��9JS8�9�5w��:��A�*l�9�7E!�QUz���"Ii�$w�M�8E	:��Y�^T��]���o�R*f�k��	��3�}�U�d8�4C�8�Y��B��ܤE6��@$˭piO���D���J���'�!��js�m����l@�����nCt�j�La�a���6,Ҝ�!1��Z� ��)�~���sػ�S�BegE�#j��wL%#*�P2Q�1E��ѝ�V}nm$��k�+���m�k)�jT��Ţ�6�(��_X�9_!�eJ�"�m[zO�զ��o��-���Vs�9��O���\��\���X����j�OB/؞[=n���%xb\$�����n�P�����oһ~fN���!W�p�zjZ�Y�� Y�?T���j<@6Z�Nj۞����6aMg뺂w�l���F�ы������4%%�Y�� ��yǺ�X�۳�}�L���=�\�Ӣ�@�$4k�`��5�ż��3�&lt��f�kh� ��u�A�Z&��RJ�D��� �5���i��2A�Fd�(}�����2YD��/P`��2A�0�<�,�]C�9"K)�9_������T�,l���bx��6�Vo´>VϚ}�� � ˷S��}�� 95!Y� P�}�� 9W�`�\߉�.E���n!�?]���>\!�w�[��Y��b����C��G�)�q�qzg��2���.�e�ޥNo�����U���� S�r�C����Ⱥ�6f���"Sw�� �*�Պ�8����mf�g>�-]�`~��ӶR�a7���YvzNѶ��~6��0]P��N<�Mi߉	PX�5Յ���� @�sC0�\+8~���BZX���8.{��E��ksM��8�b}G�rr�Gw���,|����8���Hȅ��/V�~�q��_��ٿH�ʬZ=�=GGT���m�}ƊX[x'{�j�ˆ��k�y�:y[���Æ)�5eyo� t�R~Mq��vt��_h�E���V�|l2���t\^�(�MU�^���TW��<�YԵۀ�=B��K�Q�� �����kK��%T�u���'��W[��sK�&��R�d����o�|�|�C�fb����!ܲ�N�$[֪�]#��H�jJ�ɓ��9ڀvZ3�_�f�ݾD��uM��Zn���鰀��%p�Xx|T����/��KX8,3d����v=,d�n{�Y�/��d+�UMϊE�}(�=v5�55KG��[7��J5-i�����c�B��|!ؓ�0����\%Y�mtЖ�M*j�j��}Q��Q��N�V�Nvv8w�A�P��n��0��ډ��)P�B�}`���Z�\qx�����6(D��<�V!���S\E� ��Jy@��9�9�X䈈�mД�By~{��u.��MJ��Jk�X�@�$!آ�u���|/t��>O��� sqp�V`e+p|էۖ;�L)K��UO>�Gih�xeN�i?O~"D]���z:��藅(}m7]�r�eJ�֓����3����h�\4'��Dd�Ǥ�Ҽd�k�$8E���n�Zj�k.LU�����1�����E5�.���6�{D��I�H�GYx�e�,�d![���}@Y��g��Y��z.,�M�LX������j�O�/�ڇ)���.E���� �RD�|��q˳� ��#��^a�������g}�U����]�bq�}`RT��5Ǯ҂%�L�)_'m�A�m`���S���#���	�x
e_�+׈�o���
�1�:5��$�;�%�)���.m�Ϟ#
��EYw��R�G��X��E�Y�)�� А]�W��AP�6p����"�2�R�@���ǝ�]55��j#�>���z�wPL�2��0�m����#<�����2���4�Eu{���Fj�^C8�g��� e���є��F5%+�	�\XU�>�r�.��j�c�&{�&��E�[��b,9S*�-���S�@9�I}'n~�۠:K��A/�ڒ}�4 -�8�w��-��u��<k��6h>�fp|+Q�ޒ����'������<F
��V��� >��,,�g&�����D��V��fo�M����r	�`��P.�ܾDޕ��(m��    ���KH����������"������V@��^r�ΐ3
[Y{C���k���Ѡ�D݅��7m�E�}X6���� �#!&k:+����\؏Ĝ>�5[��Z�2�As�l:p�ie�x :��DɯJ��Еh�;ڀV؋�Xp��K�>��<3܅/�X�KK��%x-<�KtZ��K��.n+����b�{�(H�>�	7w3�P��3d���n�Ydn�K%�M��9���k��"d�@^4q�6���1��u�9Q��z�\ �,!Kљ��rMۯT��VK!�t8s\8��:H|��l]���%�y,��#�.�9�@�9�MZ[�iB��o�c���h�f�m�!{Dͽ�
��9#䠅�v�d��6�88B&�� ���9#䨅,������%�M�@�Ic�vZڵ-7Oӽ��Ω��hI�ϗ��A���� 9���
�$�d���?&�rA��b2A�D�q�Jĵ�~�� �����`w� 3�*����d?��<�fz^��±*4�t�9����XT2���q$���`mc�G�%�.$���q��*Z�0E�k��y�%@�&t5���m�ju��qv�=���r�B��5D��do�������[a�}^���vax�\��HGGr��+��/�(�
�s�#����w�s�F!`�k���㹸Q�#N�L�l�|�*�Q�[��5A����l
�`�r�чx������م���,J��Q��ӳ/�%P���vyq	@�S�����3�(pr� �vd�Y{�(�/^P�p�Fy��
�K -B���EV�� {֙��������H�^��
�|kX�6Xci'�E���Qa��;�+?})���|��EMKPZ�ҧ^j���p�uu��Ҫ��!����V���^�]�=VW�-��Q��X�L9��샱�U.�=,�p�j��,ɛ��F_"Nژ�;מ{X��˸�J��F/.��&��&ç'�	r�����Շe�L���qVby��!�8U�yc��[j�4�"�R�����u�Xh]N���x�-g�,CL+���K(Z�.��=��ޜ��(�$��4�K �o�Z���p��o�������� �����|O�	�l,+�qo�ːc�C������/��.�>7_��q�W��/�@������Z��t?y"c���SW�x~?�ds�DΫ���
SkO��kP�e�Ur�\���6�yVM)���
9pު���x÷�����������[:��m�ސ!��"��xZ��&�I��q	Q(e��}�F1�V'4=l�(�v�(�A����,���B?oͮ{��Ս�R�{��Z�b�GVh&�H7�J�^DV����5�p#��}�)��h�k�#*n���A�2:�S�����@�nZ�3��Tr����/a�����W殏Kp�fʱ��%�O�x��s�ȉ��r���k �U�M�
� ~q�p�.W�a��⬊W�U�Y"ڌk��U�>����7u�Qͨ1��UR�kP�eԮKL��r�|jX�
O��e)��_����o�����b��w����'ݪ>����F�kw�V�&����k�e�Yp��\U�����1�7�>�%s2n۠�6�J�>,ʖ��j�c�Y�����m���{J8�~�j��ζ��@xnܞ!�p<4�]����F�n p��o��2d�&��Y��&r�R��G�%��S�i��i����U���Jy:՘Q[��p����Ƅ���<-U���*j%�%Z�{��-��?��K���
+���S��H�j/��K(��u���?��e&MP��dM2���z�R�4�f2O&��GvC��~�	��Ќ�$(�-�=w?��@|�-��������[�i#��y"ȳ�嗭�h�#j��?}��=��F�n���幃���̎�+�FX>�������������߱}8����@���H�?(!�������_규�������~�����ٟv}r��:��%K��6rFe�/N[�|��L�=���O� o�+-+�WC)\#�"ay�������?��O�������&�GG���;��W�gj����\��˜����kr����_�)s�p0Wq��Ȳ8�в��}§/�6.�@9�hv�̨~�-�����ӿ 
�a����O�I}q��'����c%F�N,��o�ZN�r����iC����5�h8���������0�ӕl�"`��i��\���j�pM�E��c���snx.�,?��א·�Z�g�������'���Z�Ru�܅��������O�ֿ|������I���ɉ�r����ε�o�v^���<I�������7�����[���_[�H���L�g�����������_�Z�Yw��6ҏ��sH�|i�
X�e��7�j�x�r)%�s��I�y�Ӟ/\�Ȯ4�"?v̼c���cȦ�\$n�r˹��dj�Y"��/�eI:a��88�c>O��٠i+$��Χs6��D����S�Z���p�����ad
�y�E�h�p�G/�p)d�&���2+��2iaX3	�;?�~��#ג.@N5*aRb�/��H�7����(c�B�kY����+{�.�~/��U�M$���&�K!�򲓫�]���o#���)�K!S��U��w	r�QX~TN��26����O̖��{�0qdr܋�ll67�P���d�?��&��ljm�g�/E�߹�G��Z7�xXV�K���V?�'E�ՔSX\��������[o���fw~�$�8{b���=��L�}�`ŐC�%��&�>��ZȄ���R��J�lGȑ����®�k��V�d+�Vz��xM����4�J�&ȄA���I�J�&�%��c��ڕxM�kN1%@�]�� 9u1N"b��5�o�2��p�D�v�6��7䗹��Ը���D<�(��T���4q�I��G��)Rjm�*�t|:O!Wр�M�<i�^x�_��˓��;�n*ؗ'�yv#��r���I���Zჟ���'�G2�<��˓�UE�\�ܗ'��z�v��#d��=��
���"��U�cܗ'�u��ޫ ��Idg���hdx�8~(t���V�=7�����a2�_lJ�۞[����ൎ'��6���<�酼���LQ�t�5 X5��ܮ|����#�gra�=��N�A��|����	r�J"�*�fWz;A���z7�3�^N���GAN7]ە�N�K*�RR�Jo'�5���~�JoGȑ�>x�Jt�v��`�21Dٕ�dɻ��	�F���@ۗ�N�Mo�o~Wz;Av�&מX�%{�'v������|�PH�zҖve���m��Y�1��|�\�_��箐�_�UW�vqN(�2LԳ�� �k�Z�"�lt�\�h�϶��/ �&Tfj'6��l���'����/`�dmE(].��}�� �����`���Q{�L�A2��p_6:@&46p�Mհ/ s���Cc���F�,/��\Ĥݾlt��p<�'�V�e�d�BE�t;��2kX�>�V��Fȹ	�)7��{ş���@vwȨȇ��q`�99
�&2d�1��'�s�k��Я�,�q���f� g!Y^	�n�.&�#���1���~[=B�D:ҭ�b�j�	r+Bq���%�dM��2�]ö���h�c�ض%�#dc霳���z�l���%�-�m����ܧ�m��?A�E���
2�m���A^T&n�FG���!�,��e�#d:*� �Py5�#�\m��Uы�(�|"YYV�d6j��F�5P���W��B�̲ٓhܥ�,��-� �J�;����vd��õ��J$��v�f�b���V����vG�Fz�����n���=s�+-~WS���[����vdӄ��c
bi_j珐��X��
a_j7@�N��oV����n�@�����/� �6�ˑ꫞��!S�m�������0�=a����.��nX�V�ا�ɳ�U���k��y_j7@�$ �~	�þ<i�L�L|9��<i�\�(��_��/O
G�tTR��R}5O:B�R	k9"�l��IdeX    �[�kݗ'�ɇ�Mf�+�2Q|��P�˓�6�ĳ~���[8B�?�x�f*�I��r���x�2w-E?K~��V+/��aZ�>,6�zM?ÓF�N`[*[ۗ'��HWˣt��Q���CqB�ܾj*��I�3�X�%�������K:�ŉ�����I� �KI��8�}I� �%�˜�&m�%G�Nr��B���~-�G�Z��e�$h�����	5}�I񋡄7������q^X���y/	�f��Q���� �K:Ȗ ��5�Ծ|�쵐<2�۷r��ا�Ie�>@����{Y���+d�B�x�{u��9Q�E����F�rn�@¼m!W��,�`�>Bn���. �VK8�h,(����W�5��̨S��5��,�=	�{��Nۆ�2��gfh)��m8!SX	���k=B���21jϕ3)�}IG��_�B��o8TG�.�ĵ�;mM#d�)7귲��dbG������{�>B�=Qx�T�y5M1��4bkW'���H�7�t/��a��Nܡ�����e��R|D���o��9�`��kcJ��-���s����
�D}�\�@���[�7��)	H��X��Ɩ#���o:�E�7��U�O����!�c�2�\[�5�[�t��Erf��l'�qN⾎z�L�4q��HO_�Ȗzscrm�}8��<m��2��ᨃ�B*����Q�|C ҡXi+Ȳ�� C��U�J�
��>�ӫ����*��^�haV�N���}N����шָ��z��� '/�tID[��z�LT�W�b������ǵ�ŷw��jb>�W��9}�y�Zh7��~դ�e�G����K�ֿҰ�Ot��9����S��4	�o9���=����.d�l�|����9�Ou!��p�����N�e�gY}
����<�h����NΣgU~�� ��<� 
'2��Ud���O������#*������������1��۬��l(]l�S�P���f�~�L�v^�S7�Q[ P�ܛ�	�kvʙ�=B����9�ժ!Sʫ,?o׊�_�Sx�������ŝ�<�,������#~�?����A�ayb�Vݪ·��
�����7�@,���k�������_����/��?�/�s�@������/��W_��w�����������?�?�}�����?�����?}�����o����~Y�o�W�|���ۯ�n�}A����o�w����Bf��L��l�>��ɍo��1�]6�}��2�!�������;���e�)k�����+����ӗv��ⲵ�����ǯ�������^������o~rw����y�h��>�=}��Z ��3Ml�k�h�q���
"��T���I7�q�!�L^»�ͥ/��B��A@Fr#��h���`��4��ee�L��'@'W��цkH�[�Xנ��"��S��̐�<���-$�	�^�L�E��iA����B��t!��g���q���fc�P׀�'���R��;e�rX���z�!E(�O��_b�%�d`õA�W%�SnS�����J5R(H��}�rI�8
���6��@#�7ڿ��"�����_�����7�����b������"L[��>C&�:õa�>AJbMN�p0��h���@{��X�Ž)�Q����G��=8
�h'ڛ���1P�zp��2i�)��}�.j��������Nz��6�4F����V�y��x���;_.���XD���{�2Ϋ���O-,�6?B�y�G���m���6�h���w�Ǖn�+=8C�GȆO)�g�Ӟ�21v�Y.����E�!����o��/u�UB
�¢M�#�H�4 s:�F��l��x��Ge\��B��Ӥl��j7:�!��P�_\C��i��<ٍN��(<b��]���9ajW �e[7:@fMAS��*�u�#d���|��s�!3K��!��˲��E�(�������KL>��V��I���p,����������75U�)N]]�:�5���8I<�h�J)O+M~a���K����QW�����s��@��sKV���89C����sI���r���w�a�5NN�U#+�Ø
���	�Q\i�?����	2Y�9ߟ��qr��y��+&��c��w�>��ϙ�1XeS|S5ч����h������\�R���r�lr�g�/i~��e���ʅ!X=�!�����@a��h��>t?B�I��E�6V3dp�pa*��7V3�H�u;Ђ�4X͐��]'@�M�AVGȴ�<$t�m�fȹ��a�Vj�/V3�D˜:W(�qr���Қ�2v	(�c|�l��y�
J&a*�x6�F���-�+(�Rl�/QZ���܄vu|����L\��L\\C�	�|����ًЫ��U�����d��Eo���#dPBj!S���r4"a����u��N4d7�W.6.��#��:�bQ���r���.��5�r%e�>2+I�[��"��7^%��US>�<�Ӊ3}~}��Q9( ����ׇk���CZ���8�����S��4�G��x8�Τ^�\̛���<U��f`���h��!��2�	r������uW�2A� �L��ֵ��9Bfy�[��ZL������l�+���+s� i�����+s� �3,��T^�����5X�[A,�k�Y6{EwyL#�u�d�'�����z���ͅD(�}8j�R����k|'�XB��]�����G�ă��]75���h�.�n+c"N��yZ���<e��O�z�ÕY6{�E֢)q_�7@N���� _��ș2]g�u_�7@fA˳�Cn���5-�Rr|^���
��9=N��z&k�}ɝ�X���Ox�	re�e~��}]���Z�k��Jl�؅���W������|�ҡ'��!�����^����{��B�J������5��!P�2p*�Ȍ�miv�֞��=�G�I����L��� �բM����>���c� L�-	�B+�l�Dv�`+co^��M�u�aex�k7�m�q�fm��;6ϫ�������7����e�,onlȝ��K�Nv��D�˛��SAw�N�L�h�}���1��N�OV�?dӖ�OJZo팠���/����J���M-c<ڠ��~W.l����}�(m����0���Z\��p���ś3�E+�W���@֋�����Y�Z�_ʢv�Fi�Swʗ2����q	��e�P�j�2�K�_!]{'�) Kߛ-��UI4L�!�}Ԡ�5h�}�A�_D�܄��L
?�%����_#t�1͵ڇ�fkY����6�c���N���������"���iw��]�r�����BOn<E�`���l-����F�z�+�3���h\c�2���C����?W���?���R����A��P(��}��o���/�[΍~�?��q{c�����o�0��>�W���+Kx����j���ӷ�����?��M	�EK�(��V��㐄7o��e��փ���Z��N���F��G �X��^E�l>�Fbl)ȣ���uD�sy�[j�&��J钮���L�*��ş��Rl�tX5֖v�ATJ�dS����k�C�\�ޞ���A.�
y�	�Q|Zm��}���j�A��M�%4��֢9k0wxVbW|���2�a0&CF�וl�J�T��'m��L���������;ڠ�u�,�A>@_��h���&��J�VdǷeP���g�9�֑�(<��!V�U>ik?_�4~�AQ+���Qt���.eY�~:+�U��M������jP�(���y/��>�+���T�a��Շ����}�ֺߧW���s7U�и�H_)5GU1�L�;d�l���H�FyE?���oUT��?ݾdE�&�X�Sg��/�<�.>.��Tz�炢e�Rl�����g���p+ k `��n��dW�O_��u��,e󚍱���?�pQ}��<�p-?��T'$�ϑ�\,[��J�:x�yh�20��B;7P�l����
\�¥ާ�9������2�K]��x�    zO�]\B�l�������e��I+�����r�"�w���/�������������	r�ލ|��Ҟ󦽼Yq�E��X��E�"=U�yQc�7DX�_)�NzQuO��������j���F_*"�ȏ��Z"<.AK�E�])�.oF�->׋ΐ)a���Z��&�ډ�_�S����Xy(Uw��J�2BՇ&�Rw��do��{��k��"�қ�=W}��QQ��lX��y!���g�ly�0��Ӧ���?K�FՒBR�l���`��T�.X� ���I�;��jt���1L�K(tNm
��%H���/E��&'ȠE�	8�5�L�)R8�
71�}!�r2����`�09A� B����&'�%$�|��ar��h��7h�"�����,���@R{^�5)�	�E��$�By�q`��X��N�|9�SX��z#P5�^��%A����-��w��$}~r�� ��v]S��m�98.�`�8�N 
����m���9V��+	`��U#db7幺0T��X5B�A�>2���m�!#p�qUx��[��%/^��b�[�;���M�A4���5E�����bO�W����ۀ��M�)��ї2����L�6�z��%p�MW�7�-.�d]*l����}j�OcǪ	r���E�N s�o/���v��.)�eor�5���3?X '�ua����u����7�v�d�D�=\Uyqx�p���S侗�k��� ��4��.�W?Z\�ҍ��^��6��ﭖ�c����Ӕ��`��@�'r0JA�M��d��ޒ���@nF4���`�">�|��N���KT#���3dJo%�Jƴ��|m$�!���o"ڻM#��&�m\g��l�gȮ��=~Z�4ϐ)7׹��1�V0�<I0�q	VH� +��M~�,[n�;*އ��$2~P�������\T��Z�xp�� ')\�'ʰ ez�� g#L�'ʇ
���� �Ȩ.|�f��~z��R�#�k[�̳*.� ��+˓Ͳչk��<5���z�p*�������޹��u���B�G���i��/M�������Ti,�����3ܲ�H)���Z܀� ����9�\ȹě�u���j������#Z����I;��;k����M�u�����:g*�a	V�o����v�W�nE����j�ٹ[-	�$D�x����fav�}5'���d��� �������P�2BQ���ͱ�;�eBV���U��D6�gL���q�#r6��0��q@����kNTkz�8!^����<d�(1Iy�����NQ�>s�>�ޮ��l8V��A�v��"�烒�&�^���Lg_�������P��fXc�x�y~Os��T��6����ͮt����FA��:��LBmو�%!��Nr�y�N�k�U����%!jDq�����Tz!S�ɀ���B���(�<|ߖ����3��aq	��İ���$��@|�Gy����CέR�1n	�2$��=�O����ϱ����W���.	��K�(�.�]+����ܽ^����w�/��;�d�L2���%^�@������� �M�4������o����D 5bx�OHmq��۲"��A�;�,x�V���Z���S�[��T�l��ͫ�����KĪj�:�*������A�(�{r�
u�F_��B�_p���(�?�i��n�_��^"�>O�μZܔ_��M�љ�D����
�>�]�E���#�����>~-�r�ڧ�a	�鵋+%j�K�$�<�Ԭ���L?�g|��uK�?�������ԧHx�bO�	X��v��h���Z9�W����ɡ(#r�
�Y�m�/��lGp����P�R%�0��%y��RZ��@�2��.�'�,��l>�NͼN�ވbKw楸S7��^~�o�`xfrT��g?,�z� �>{���P����J�JJiX@�`���΋P��KM=ӮN���*���U���0�2Re��iW'`M�����gK�7���4�k��4���m
����u�9.R���5ٚ���w���~��!?�m22��xV"�Œ�D_��.�͓sw�S�&�đ�(н�*��3�����UA��6ͼ�������m�xm!?��YI>��m�x]���Nn�6M�A����&���x9w��C.~�7e���)�K�<��qYA��0�)�@���8�g�y3��niiO7o."�bSқ�ypm�c�7�R�{��77o�t�>�g/g2ΐ_r�����i[lI&-yj�4dI
�X)�y��%cG4�y�<NK�%}�,[ל���CgyZ֩����9]BI��O�ͱ�K��=����-���-=��7I�;��v>zZ�
$ߒ�����&^�J�_ f��Ӛx�=i=�?�z���(���6K,��R�ԓ���Wz�������<��v�@йq���gz�30a��@��am�T��
���N���f�xO�M=�	�H�:B�%�==�	�0��Qy{�C� L~�;��A<{_�d���T_t��Y�Q����x���2 6��Cte!��_�иmtj���J�~�YB�=�5�E~O��W@&<ϕ��ׁ�UR%�]ٙ�(�+���;��3/i�{i�ҕ�x9X�wu3+ �seg^ɥb����ѕ�yB�f?�R>E?����֊i�һ)���}`weN-��I��z��Kپ ��|7�g�� lA��d�o�30g:�����Rv�N��&n�z���T�6F����=S����!���t�g`�4r�]�-�t�_r�3�& ��(���C�"�\��Ϗk��Jy��6^>3V�b��uP�r,���k�/h�}�څ��n�O��~Jp���eNl3t=1V�x���&kv�Xa��Z��\��2V�xC�ƭL�R�c�����B����	3/�}�ܵV��&�T�E��Ť-c���p3/�q	.�G�=�׿�BJ�=IO�%�!��۷~+�L8�`�ظ8����B���?�3c�8f�.����L�Z�*=�b��m&`� qà��3�����J��-F�il3�W��
���
��\<ɝc�m��f�|볓J��QkK�ʧ�_J�ِ|΍gi��r�5\.۳�\���L��;�J�[1I~�+�!>sޝUFe�H>�A��&�K���P�Cי�Alꚫ�D���WR8�k�M`ؕ6�-C׉�j��8#�����*���͂�Rq�]G^�����ޕ?o�N�$U��'IX�e�:��A	���-C׉W� y�n��2t�x��w�>�>�w�7dȪgH&��+�&�K߻2�V��<L �-���P{v����Q�jO�1S�r�����'�,�x�n �=C�	�h����AljO��.����jO�̓N�s��3��)3��h�q�[���̷f�)a��~:�/���-D�Z�=���p�n O���~�����:ׯ�T_�~�W���v�)�^^}���)�$��/ђ�)t�6a��}!k��t/ǒ+�X�K��.o���m�:#S�R��S��O��5a����n��J��S�����.P8�>b��6V���v��A�q	F�Ӄl�U�u�����m̓ ��6��g��{{@.���i��[A�/I�Pb�/�s������(v7CZ�ǹX�r�����}���Lb�MM\�wW)�
��*���ѫ�Ǳ�@p�c�+�*>�8�����}	��!���'�ȳ0��V�m�����k�C��-i>�Q�]ݨyo����#J��F���wܻ� �]7ʄ������W�!�ܪ��&�>�\��"�v�%pZr��Ҷ�rF���f��A֖Tvdl�{�=r�u_-��2�]��z��a	��x�e�v�Lș�1��w����͕�nb��1�\4)=���e������6S�xn�����%8н�G)�:�3r"C���\�d}Wdk�.�+E���%p�N,��JY�G����J#�yn��L�x��Y���:G#����'�<.�I�<	$��d�n�~�lA��ˊ�T�ȾQ@�=��<��9X�'��5��,���4ń�77q'��e�;ȱ�o�� {��.؛$�k��˔`D    ���[{��t�/no�í������Q�s�<_Hi�ѣU2�g��r�{�x*Q�����K��}���� �pz� ���l�4Z��d�R�'ֱ�k��>� ��f^Y jٵvܱ`�XX�>� ��f^�9�����;̼B����ٱ�xÑ�yȽ��1r�b���#�b��� 3/���=�[��f�H��r0���X�l��V훫��p�)/�pX@e9�ۮ�KZ�_�g�����t�>հ�`�	�'�6y)�=���t^D?���'`&i��Uip[/��F�l�z'�-�f`�D�B35mY�0�H,<�ȯd$\X�0�|�(��3p������p��d`#���r��h�Ts;Yo
��
�3��K1��i�VgE�M-���ƌ��o���D6z��c��T��YP����mj�G`c(����]e�G`K��<�X75�#�+Px4%��=M�X~8�z�{��J%祦z& t<Zޮ4��T�ـ��5хm�!� m�t��<�g__�Ta�p���6��X�g%/���}�@q�����PW&s�/I(���\Z����<��T������n�3x��ՙ�nb@���򤒼�ZDv:���d%��_�`d/.��7���o���Jq��@���;�Mk�u�M{��թW�i��<����Qp�7���Pi�כ�i���p�[���|�£quhA�<�ĞoZ#o� X+��7}�y��Z�\��oZ#o�P;1�=ߴF��Y��Q���5��)��7�M�>�m��;}3m6�%^O�Q�]��k��P��8��v���C�/񆖾��7(����M�88�s0�s�^���nc���jӋ�8%�=������#pn7ȯk��/�����{A�����bo�K�ޅG���K/��@?�q>x0�oz�7+	�#i.mz�7S��"��je��S,�"�I�9���w}sC{��~�A���Þk�u�-�G�9�%TȜ�C�}��d�5�X���p9f(��#Y���H}o���6)�9mZ�r�>���mل�k���#���I�m�����^ќrP�^��%aT��c��wiWG 6��1����֒9�|ɃbWG v�֕!����k�8��o�tܮ��?c���A<�M����cۻ�	ivu��,!)~I�����? ���D)w�t0i����і���; $�(���jR�����\4�+E�ϸ����X�1�˛:C#0�I
N�Q�=��,#�T��/q�t�	��aŭk�����)��܀2�l�t�&`b�g5��34�*���vE�]�M���y��6��i���=�t���t�&`�4{�F�ڞ��L���:��*��,� \
��j�
�������aZ�����(����y��3{ᶾ�ы'�^`�Z{�-�h;���������,؞M#����y�_���]���J��� u������)'�m���s���B����As=Y�]��8(�u�[k8p�3����M�-}��p����-JZ�t��ܕY�k/Z��{3O0MK�9w�x���a2J�w5�0	'vg(횭5�
��Ғ�|��>g�A"?�����ך��bi���X���T��9�س�65�x&��p9<.5u��T��	�n�E�]M� ����d����c F	M�ea�ڌ���h(����>׋'/9���j[S= G���������_|Y�-���8gh��������i�^nj��87����6�0�Ȑ�^l�>1��2��\/�L��T�n �����J�H�R -�E[X��E[j�|��eŞ�F1eSC2�{���C ������7�|#p0�r݈�nj�F`DȦO0�>�{�\�E�Z����[��PrS�7��D^����\��.�����Q����U�e���T.�`���L5}��i�d%ҩ�Z���Hu\�ҼYN+M�4$3��������l��z麫���zH\c�R�{��	�e.��b�4�p��x��Z��+M��0q~r��p��q���տp�и��2�i�'`6���žj�����C\`H���j8�N��g�T\6�rx�����jq\ m�,z���T�3�ӫˤش�L�Jn6�P�i�'`� ]�=M��
Nz�`6�ߛ�ɷ𒁵ٴY��,�\ס�i���G���
��E�����ɷ��c1rW�6 ��*��������"O����{}ҍ�� ���0ys��E�#���}r������P���zWS= +	��bFteWS= kǉ��cʶ�Z�M���&宦z &{��;.z�v5��פ�o-zWS= �/Ҹ>eE�]�� �	|�Zbٷ���95;����qdu%���B�+�<���������s �ʻ��<��������4h��fv5$p�Q�WH⮆������2��!�e�~co�jm �
|����^���OzI�`�iӴ6^��%�%����>RmkH`����'�Ԯ�d �	��J%㮆���(�K}V������j����!���fu$����5$p��<�B�E-A�A������ :�O�1wz#ы��*+��ܮjn ����&���Ps�S%���*B���cR�T���\m�-�]��!��i� �/r��EЖ�+ת�q��3�Y�p�([/J�C�Y��6����e�����l�5`������m��Xsp#��!��d�{2j\u���sd�5���+�z�C��5�/�����:����]B��z\�M�|Rq�-O��=m��-�@p�f��=�nX@����������1gG8���� ��m�4'IQ7��G�:��A��7����Nb�-��g�,��䠹�Cf{�-B�+�#6q�hǋ�HNP�*,:w'C��EbB��7&-��)���)�քa	�r��Ӵz��Fr��s/��̓ ��o:�=^;hL�6hl^B��9Q[�;I]�I��U�G�`{��?�K�Gy��U�o_}���8����~|�����/��/���	����~��/������?�ӗ/�I�d�Ih�^�|�X<)�_�k�s�o�/~�;u���Z��}^Q�K�YF!��#�>���%�;���_\BT�9t�Ϟ���7!g0�׍��Y?�**�#r��v�Cпdi�=�=a��2������?Cr�C0���_R��8��X��]�� �[��\�)$d~����<���x[��/ɤũ�J��FJ}o"�V��]��(��{�6_�++DݧV�ŴC���h�����4�%�a+�����7x%��k��FC���K�!:�[�4	��$��$��Z�
�ɭ��]Y]��%���1����.R!K��7�����[͆kUf��������%�B�>�Ȯ�nq�@�����3y�����}{��KQ��!`1��K_*$d���k�[>t��q<��i�,. ��'����ݞL����_���Z�z"�-gq	X�T<�+U�>/�.�ਂ�70��GVN)�A�m�8D%����L�:��fQ�FI�4�4ST��q����%�X��U�����K�<p�`�L�\� ��|=���L�����y'���
�����I&d
��}��A�u�䨞y�5��]��K( ��\�6�^�:��������Y�N� ���15Y�T�3p�ĩk=��.mMŸk���F>����T�H\�H<�0dp�9%���Y�'�$�˗/��U��t�h�3�̜UGP�g�1�r�ѡ/�&���v�ټ�
�6�veVJ���ʣ��+��7�	������]��*2)��������~]��^�f�>�G�v�EN��aA�-��f6��߉o�S���l��t�n)m�f6�r�-��0/vļ���Ys�mr��$����l�"��Q�k5����M��p�M�Җof�*�z�����KQ���k�|3�x�ż)-N����l�ut�1R����l���u.CE�̖of��#/j0�Ą�>��oI�F:�Nҗ� �  j���r�ߴ ��ˬ�k����+>�}�ov z�Z�}��p����Jb�}Y���QH
��7>g�q	ڂ4�[���R#r�髷�l����Tydr�$��I&���1�)|�i}��oZ l�>Ÿ�]��l	�à��C '�u*60"�]�~D gy��rn�)���������Aۏ�E��C�*��4_�7߽�������j�����z�;��^��w����Z۷�������ݗ�|Û�?�Կ}�����}������o���_xK����۷����|��_���*�������|��K��o_|]����5��Br?K�/�R�%�q2��7s*�gi	��{iȝ@?P����5K+��Ҳ}r������%-\��(��뷯޾��s��O�u���������P�_�� *����}5��wI˽�]�)��E@.~�󳴼��ť���\����㳴��潴H<�|�j؟I�+�gi	��{iU���@��l6���W�YϓP@j�x�#I��%䪼�<Q^_������Wߕ�+&��꣘Lh`z!�����^�>�~���£����{�#���]�=w?}Mo��?��W%��i�9��8��f�,i�ei����?�7����_�P,##2����8}��k<w���������͏�/�����qYKJ�+a��FSI�l ř[������	d��5���HZ߼��o~���8�      �      xڴ�[�,��&�|�W��ژd3�.�amɦ��fK�Q�n�+�-xjX��u!u��ܑYU'���L��Ԓ��}��p8�"D����&�o�8�,ԐE2^�J�)|�~$+�qpKp_����?�<]ߤb������_"[Y�hv�����!����n�o�I
7���FϠ��w�ß����տ������_|xjq��!��L�Ǉ������mۇ�gBs�C~�s��m�[�N9� �)=�'��O_�?����>~�������������[,�mU��Q�I9�e�"9�/�e�>|�m7ܜO>����CK(�\pU`��C�S���!��Vc~Q�X�/�?]��p_>	����;�Pa��*EGq��ˏ���V��ȮL����w�~�@�}�Y�7Ou��ȡ��0��@���]��z������ؚ�)x�د�*���bf¦�����&��1�����p}��n��ן�c���Q�)a�P�i�#(f+4N|y|�����1�A*W6���?8f����	>�l��O��F']�K
�nґ��b� �5!�H~Ua���t�0 �[�ə����S&qJ�$���Ǣ6���4AJp���ѧ����`e�`:�F64��Xl�I���lG�|�g{E`52u#.�>#k�W�`����KP�MgpZ���G�.6L���|�E���?Ѓ�F����� � ��	�1��
)����3�L��A��e�̬z�.:���G��ܿ܅�����`�I�^ON��D.��lO��G��ʂ;3.j����O7�?6��(���t�˙ꯗ��;���<�F�H[^eQ
�g#�*���ߔ��~xl�K�ˋW���s��0�CT[NR��hiT;L��q;�����	��b<?>�l�2`�#h�Ûȗ�XB�0��#-�KQg�`�Z���yNeJ&�A&m��7X������_n���7�ãy&
��🞮SQ	bl4�KR2�S7��>�������t����|���W�*�	>w�4���<��#�^�<� ?u֠��L�9��RS�����b��{�F�,����B��� �ь�7��Z��&Zg�O�B��p��C�&4ze�@��>��ew��i����,��g0Qݬ�B35З �-;1��	�8F�Ƣ�m�|�� ���:��A�.4jXRJ�v��!�d�Qm����%�0��#�`I���[�\������J4��E$m�t��DF6F-�����$�)T`�9o�j]d̐����u4���n�i�.2y�˰J�����=M�/Dfj`[��F��DF4��1p�O�B���זC�.2n�p�ِ:"c;�VM�n����uwZ�7�0�K�P���"�7v��|�����M�9Ƒ��&:�5�	td���|��*	�0s��E'�����::!��Y���.:�
n"]=I"�FlqF�R�*:7�,�`��$���LdT�S�䓤�P�M�C�.-��2hz�:k���=U[�]Z�pou���q���������u~���|�=��R�ohd���@V0`j��|��*�a�5�jUh�4�3\�N����\X�
 ;��f���A�8���0pQh���L߼�tTl�����~'2����':w��*48F��C�.2z0')z_�&�6q��dK��#wG��ě���E�����S�h�̰&�MZtk�3�SH�ci����S謅x��t�c"��ϙi�1��S��;3/#�;�,�,��[�,�v~�8�a��wr35�0묝��y�Zz�F�>���a	>?w��b�/����,=�Y�23��#��`�����;�86,�+��w�#��0�p$��+�|�U��#T��̠Z�<L}bg��!�9&��.29:xb���:������ŉ�E��M�����.�<>��b�ѴF��w���l�ν�F�R|6~���l�L٪�L D6��..���8�owr���j�@�,�`�g�������S7�WU����NhLyAE0Er����wT2&ПR2ץF��z��#x�O��XTۥ� ���\J�����f���g�ΏB������N�a`�I�i���xw��4�)�P��+T�"S� ���؃�*{��[��"S���;����a��w�sK` 9����7��c^0�u��::�_
9�E���qaP��l����y�Z`�v0 c��<Y�[P�1���]di\�?f�����|���秫�n�}�^�7�A�*5�n} F�Ɏ��F���g�*6���ž���X�V	����uA
�4| z��&�TWv�vA*��J�c4�ȴ \H�p9Z.
�7ņ��}A*4��Or��N�t�I?��| H��B
��B����.Hy�Z?���P���q��vA*�n!R�tdZ� �E2pQ���f�W�zi�<� �<�03މ�i ��`%k�D�ˏ�%���79v��4�I��+���b"����7��	=��D&%��f�H
�jn�����~ȏwW��<�ps{�u�4�jcZ4��hn O�]��2���)�4��ۑp�ui��Op\K�ėSTp���v}Ȑ�fE'�F��	p1=�;n5�c�I�D�&�b`�7X����I�c���eP��,�@�N�:os4�d�����-S�>�M�wH�e�ԇ�rG���A[���l����ha��khdZ�
.��\�B㾿�]}��1|�U�3!o�c[���9?���%8����L�����40DGQ�A@���f�m�L��yo��iq)�`��y��qQ\�����y�O� AjZq��	��@�X�`J�ay� Z�B�~[�S$���!A<�S#mX�0�����=��#8=��1�i�)��V��x��us���������s?��>I�;�d�6��@>�/�����l�J���u�Y�4��d:�2�� �N�<c�ȴ�\Q��cҸ(?���o�>�윂�k@�d����@��XFOc�����h�)��\g&�쨩��9��/Rb�k����%H�ґJy?b�`���d�nu-"����0h^�H��`��?���C�ȳH�e )<Oe-�����C_�f��K�F�5t�)�����Pz�[�=>`��@�����w�?h"�w=h�w�+�i�2������3)�R���R�X�V2]V�ú.���S �s�N��^'/��ۀ<�Sv��42-����[w݉
�
������4����jm�_�����)�)'�q����x�Ԇa׿EG���!��ǰ�-���292-�ty*����� 5)̔4�dwn ����γ;�| �M�-%����-#���1RcU73���8Q���v��T�*E����d���'2-�w�7�h9��1PZx���$I��L�2���9�acJ�'���@r���@
���Kf��ʱ���k�eYB��� {@��f�t�4�~ĺ���sǏL���������6l�w�Չi��_eV����!; ������Ũ�(�`:K	uF����� C&F��/��#�ȳ��ץl�B�(;ǉ�v�����<2�����H��3g��"���~z~	Pq�����zL��[J`z�a�FcLX��c�����bqbR�$h��2�PMm��'���J���@#��G���`/�M}��J5�M$����S+M��<��l�c���Gٱ���ba��	�{'z)M>cL���sA�4]N�������	\������j�f0̝[�5��l�z|xzj��{���w��5�����	{���W23�D�,:�	�S���mo%�ɞ���f �+�k�q�:I�4�&C�������ﴑm '��X�t�.g1'(�f��ͷX��l�Ȼi��( c|�9��rn�{͘#��/���ȵR{�Т�߭�;F��ra��Δ��~��������E��g��G�4�Lkt3U    �Ż
6���8ȴ�@�r�M3�f�}�}���P!�#��	/-� tX��xvh�����4A�s8��ե���@t��q��-Ӣ��2Tq��Ȥ�	�P=�+����^����p�l���\�;1J4A������;�%�<>�'+τ�)���HX�Ϋ�)^�������%��ʼ��1$�ӻ{��6�콌�ݰ�Lצ��p���q<���c,7���%��A�;��?�2<���2\4]�{���v9��=ՠ�^�o������벪?��|���ֺf8���˿����Oe�0Չ�����O�������/��ԏ(�>�u�$g�D,{$.��&�4��d��wpdp%Xm9�F�\�UX�m���6W��0\���c1��AEҋ`T�w��~�f���M�~�ݷ�����5E��I1x����3x���^cn�@�R�}nm�k2�
�=G���/e{^���O�Qњh0@W�}b0���h�$��g�Ժ�������ЛKWӇ~�=�\���d,��:�442i�.FF��������\��b���>>����L�8ӽP:Lo��欃a\�����n�!�ȗ.`����q��z0��t�j�`�p^�'Ĺ�Y�t��rw�p�(��`��[��?�hoE�㦥��\tV��ᶲ��@>��P��%gE�%ƕ��`�3�p(G��R�>��, W6.�2�X�Yvb�i�|[��M�[�uQ��n��G�Rv$�7!d�`ܼ;I�
4v�ɝw^��/Y�^I�����aB]2nMJ \l�rb�>\<��D�&տ�0�K�����.�c��Q� ��3�|�S(�ꝢT4���m~z~��׏��?���ǛG�y<5�N#��wcǫ�D�<�u�U;X�T4�j5 :Ì�:60=��;����s��L�঎[�fz��gh2#�s樛r���ر�O��zc��1���Y�C��kΚ�k,��if��=�:c8���A���c��xAG6
SBpXL�d8��T2�������^��Ւ煶Pʍݣ84cC5�VCb�ԙ{�iUN��I����5���ٷ�V���b2���4�Ӫ��h�n��@v��� z,�JX%0����N*�����2(N;�Ҡ�Vu*�8LX�V�t��sʰ�;���0��W�Y�c8E&l9�K����i���,l�w]�kȓj�'Q�d�3>�����KW� e�����c�pR��e:�Q���i�l,կg}ϸ8�k:'����.���Š�����uM�K�"W�����6��R��T1���"���ժ]Z8��빉�M;}�h��Vic����՝p>/kzdX�n��@F~��?����N�/���:K ;B��Y���4�I��f�.�ˁ�0���߈����� Q�e�zC�6�p�,�]�r�@Ũ��yߢQ�����*tR݀� b�D��|O���0�˿�jb0��`CL��6�'c�L-LlЩFc�g;U�ܩ����&�h��Q�� ;T{D1��ϳn��s�`׹8�낚f�l������X���[l�	��9���T95������Ll�.B������Y�`1ա�C�v���.1֨U��ZD����W��&zx�9������<3X�j���L0�������,�/f\c��:9���wσ������TY�9�HѤ���m#�W��o�?�G����m�H��>vB0h�� Hx������n/R�4�|���4�0��gx;V���u��H�f�EiC�t5�}7:` 6�� v�i��zC18��(��ހ�=K;��4��zC�����~�[p��Ǚ>���-G����� �~ɂ�_��m�X������@�Q�:�Vh̕5/��fy��`ȵ&G�$z�G�K����eޘ� 8>������7`����E��o����f���.�w/����-�R/���v���M�(
+�[�4��n�x�7���O��|��j�,�ة�H��{p��K�3��⧢6"z%�ڢ`�B���8���b�f��5s_@�!R�vd.R��%4�D_��Ǧxp��/�1�Q<��/l�֧l�0P�=��i�NEF�r�awяrr�q\N<B�8\��X�0Vp+:����j�G��(�Iw�u��(_�m:b�<	*-�8���ˉ����E�9���G�Z��N�}�0`)��~�������4��_T�f�̊�J�0�;a0d�6B��H-Z�����8$fVt^M��X��PN��ẛ��̠����B1K5TW^��}�� ��������� j�}�����A�`��ʝҸ�223D�:w�vz<HV��E�8�e$��b?w����ՙk?H�TfL'x��#�]�(�}����+mtiXZ<
.�Ӆ��]7Dğf��$
f�01Ǳ�t7��:Y{���X�c���S���.��sG�i�nz���a�Tv����т��=_~̀%�q��;��4�x�a�|��0'�x�$c�c�c]<�h��ڵB2�'Ўt�V�-����T����²@c_oGK�V��˷X,���Ā%�Uą?����.(����9�v0�TT3c'�0�Z���#��D�
�Tۣ���Xx�2,Xz#�!��_ ����	`��a�������ԪN㢇	;�fӰ�A������?������C������o?|�C�|�L!K.��[j��nz0Xx��g�c]�΃�1��o-.q��m�؃��G���<�V�~)���QUY���0u�yhl������1��N�S'���%5+�N��(-g*.��]��@�;vJ}�`��[uֿΏ���jA��e�S(�F������k ���9J��Rp�ڪ�ÙƽԲ���FH�sޒ�]3B�}�O��rҭ�L7��V�����j�%,�C�C\\F����V�Qk��]�`e�:��lya��Xܐ�j���k^���,	ɸ�M}��m�aF]7��__�Z2Rpь��`�R;q�,8���۱q�[~��y�E��K穚\���=j-���Ϳ}��X�t�nB߁��&B	�9K܋-M�]l��5i�v塝�7G 4����ց�9^@��I�LwPI}
�8aP��t�u}:��G���ڂ`�������cU�Z9(h3엥wu1��W^jZ��}���W��m#uot���S:tBX��˴�߯������R�8�R��YP
�9��Y����	
YM�f5E/[-©�!���Ǉ_E�J3�r�7c����9v�G���ݍ._�y�����<��*<壊�,N@�.�q|�6�[�il��4n�k$�-
���ɐ�l�Mg[�%2ŚmH�	�F�=m�j}ּS��L�A�9C�VQL'|AY��8�h)�8�su��eeGr WeE��_�A`��|)������3�v�'�F(�ɜ�'1'ikF;���/H���|��p�~ʷ����y�-�tG]��_˅���	�p�7OD#b9��yT,]F��Y��hu�q��p�y��{���y�(�bv[��~�?>>�|��e1Ȥ��\Y�6�d��<��>OS��"�B��7)!��E����
��gD �t���	�O�i}�j�6F���|�	��e�َ�At��+d��!2�N�|i� K��h�\Y�I�&ˉ��dG{�*���S;�U>M�����	��}��m�儽�I�3�M��#B�؏�1��{��:��贽d�};�I{� ,#���13�����)��d9m����֙s�P�rc�v�+�,S�=��tֵ�"f̒�v�T�Ҁ��8w��0"LQ� ��Gt�"�����D'��B^M�R����z:�µ�K]۬'&ˉ{��JM�Lm!�BUXl� :g����]R8�lP�"(:���v���������F��.NƈN؃�����14h��`!�~Q*'�i{�j�k����1;Mg&ˉ{�b��9�[�b9�]l�9    #R_�=	��F� ?eK�*L�4��������Gt"���3���-YȠT��t���i[2��DaZ4�k#6ZB`���%�.yf���T`qcu��v����xou���d#���i�SR?(�������6��m�yH�gF���v^��qwm9�줝���*1�6��.��r����Z�9�[��0[����ul�D�[a���Щ<ѱ��6������+j�n�2"��tZOgD'l�B��wiR�7��u�TZ0�Nۀ�z<�f&�F��ћ�V���X3VA���n�����C�I5�
j�l��v��9á<a#�j�`����F,#��H��a�脍X�v�3��čX�f,�*$�촍\I+5�k#ԫ�R�L�7��8�Н߷n��P���:T�>˘�}v�P���G�	��J?�����n�;�tFt�F,D��20�N܈@/�^'�i�paP��	��smdw����d9q#��F�C���v��8VÈ��@P�"��6�1�S�e��X�v߫�#ª��vO�h���Rϰ�Jf�I[�1�&�V���g9m� !\�{ŧ�n�����.M�����	�f���Ft�h�W��2^yq�P5��{5�a��%����nXP)%�OI�Bt$���@��-��>�u=�1)�~�BӐ��K�4R� ;o����a�j��w�U���jo隻&M���!N��ȌD�Nu|�4�9@���r�E9�È��G����P[���0�T`0p��c���a�6ě�au���xPW-���hrC��V����S8��:w^i�G�3/��^<S��3tQk��s��4��t����@��M�MXS���|�v�'�����
���:���������n�X��{�3͢�Ycq؎M��rʂ���	툋qn���I��z]��@%������R^��m��ď9����~�S���3�h�}��|����sN�w�l�@}P��tv������)�x΄}a�?}�Y��&�O��k���	 �q������h=�k�Lݠ�
/�q�zAj�!�!��n"S,!��c'�o��)��&wZ�GԀ0�y�EmM�4�}-�{���7M�0B�f��2V|<fǴֱ��ԙ�<�=�� v�����bf����t�y����]��ܦl*4�NB_�M�~�on?_�?���S�b�/�ts���o~�qߛ��� _��J�.����*�N�{�:���pp/N2�C�ⲻ�%�즆�:I�Ṿ�[/����R�� [��MN�=�@P�ؐV
�}�����Ʊ�P:��!�����@Җ��1�s���aaE��˖�V8�g�R�x,!$[:��&+M��'\�����G*Lٞ�9wS��`�g��uF����u��a�RH;`;���r,���n�c��P�3�/6�m��?��X����<Dn c�ap��\�����uw�AV�H'5w8�V�'���M����'�!�?$�T�|'6,�/���)7u��t�f!j�� � Dx�Y%�\���;���5�5 -RϜQa-��/�3��p����ﶆ4M`�������l���}� �������������Gr�5�n����	$�n=H�W���P�R�.m�ף�RG�[~� ��Ut�ހ��) ��̀�m
��� �H�Q��n��J��Iq������Jg��B5I��] �CBm	7Xl4jC�n	��	�-�:zw���v�[����BtR�mKL`�z�S�Z���{0'�������C����p7�uB;iW�m{�pX|�]4�c۞($P�+�Y�3�D1>���'Nrp�㒵�6�M3�-���:
��~z����O�����O����j�b�X�4��-��3�XDg�W�pU�c#TY��DG�wX6}���>������8b�Q�ttL�rnf�o��<�Qch-J2q������k ��7}���ČO��4x�\�j�7���Y��ǎ��An3b>P���1B��Ώ����/7�,�Z;٥�ˉ��@[<;���^'�M4p-�u<�4�S�9?�<nz���:ױ�h�_�s����oaC(��;U��Gs�q�<3@S���(�n����8����������rS��t�����.[�B������.-�e4X��t�R�h^%vj�bǨ�}�-��W�3�/�{	hr.lBb���r��q�Ҡ{�mM����JqDi���Z����<,�� �_Ub�h���ͫ��.���<�ܾ�l������Bb[�k��c�):`�_��5a�=�쫢m�z|��lK��<XV�e�:,>>��|��r�8߭���fȠ���ӯln@)pEMja��u+�.@z��K��V8>e6��{91�W�B��V	�'<�
��nS��4��.\���v�<m���0�F3X���j1u7w�sT,��	Cӯ�R-�^4K`��u/�nv��/�����Ug�g`��R�����^ X�&�	Ҡa�Pp�w��2G�6��2ak,�^(�aļ)1v.��0Z��~�3��{F��j��1�׽`�ؾg�Ѹ]�`,p1wUi쵽 ����w^�ixj/ ,��K�H oV%��m[X$x���d���4h쑒z!�\J�9����V(�Y�TKt��h^��|�kF��n+ v�2���ݽ�6����-�M��Z�$�4��@�#Cz3!�2.ů�V�h�qGEѣy�%�����K�ܮ�����g�/K
*�cQS�ꐲ�j_	oc`���4E���@�j�������e	�qa�N4%=�WYr\,�*,�+����Q�d�}Y*ؘ⟭b`��4W��Y��{Y�؄e�;&pG�6:ފ�n��:�p\��7�E��&`x�2Og4�"�u7���a���҂���}�u����Y2�ۮb ��;J���pgs�G��$mآ�P`��l�0|=� ������-�0F�ؿ�.6Gp���ױ���M<v�h�/����6脕���Іa1��O��'v���R��ΐ��B�wf��xxt*h�� ���?�ʖ1�W�����g���-`�vQ�'��m� ��W�IK!��&��1s@IU[`!yۻ���Rk�0M[�Ъ�|��1�b�u��a4p��d��^j�,����m煓�}/��5��g�s�6 lx����m�P��)�`b����&.c�KO�N�X�[��E��p7�;"Vt���4�{��v�
�@��}{8ZY�8�Y�g�����w���n�h����c#ӣy�_S7�]�d����/YMYg:n���d�g]2��M�/YK8[�8�A﯂+ ���/Z���B3�z��9!��)�X,�:��M]��u��B����3��} �X�ą���퇃��1��v>�����&�A?�]���϶p#6\�9��u�|�A0h�}`k܂�z�av�����1Ѝ tBs�Ѽ�����������˯�13����`�Z+ZJ0��}P@!z5��Y��}07p!!���e:��u�#�Ѝ�:4�>��.�K���j�G��_�yF��C���������_�]'	���ޖv-R:1?4v 6��)s�M��{,�N@K]�M��A�ήCY	,��]Y*����F�h^eij��{O��ۗ���ǘ^83ؗ���E摃M�R��ڎ��"OÒ�TV�bѦN��Ƀ�ѕ�ue��Σ�'��h^eI6p1�6{����R�F�.,g�}Y*ؐ�r�Y��&��
5����РIR#ܣ�<q$i��<����UB��C��	�0�������]��3���~-���ԩ_���
,`Cɣn�"��X���m'N�Ʈ+��U ��x�iXJdg�+��3�A�%x���uRͮ�i`��U��.�VW��ۗ%��d`�e�`'xǊ�2�IY*���l%ݨ�Kʒ���N/�i�����:>a4	Y6Md��U�dK�_F�/K[����ui�,l�k�a`�R _    �qf��$	��:���$m=Hmֶ�/}���b,��ӯ+�e4�>9uʸУyX���.��qp�k��*(����<&�O^2�	������gJ
���C/ު#I[֗���<^@z��P��F��h\{s'D�ͫ��.��I�q�[��1��/�P��^�� �XS��sd��[`'|��Ա�H�V�M��ב��<Q>l��{�a��Kl�ǔu��^`�-\賔�����!6��L'ր��l��.�^t�rilB`(6-t�2@I�]��^w\�s.�gƚ��$�р�㔛��Kҿ�.>��I�q������$���ݗ�z������NcWI�tv���"g�{��0�Js&c����޴��;���{��U�*�<�~��C�C���I2fkN��k���[�j��O�Vs������y�_�H%;�ޘ�YT�.91F��P�H��Џ�0���i�k��`'��E1���a������X�C��ʩG3|z|��澡�3�\g{Ҹ��|w�������X�56y�ˢ:��4�c��y~����l���|� �CK�A��&�&b5R`�Ͼ��~��%矠�~�ⶬN���n��o�󇣙L��p��L�d���	Qi����L2�1�X�?|�ˑ��:���62�p-�w�h\r� .�Ig�������O��$��f��Ɂ(��q��|)��C�o c5-c%z�=]ʏן ^����0ˀO�9_/�w��C�<|n�c͸�p�M�P:r���o��j�'(�k��¿��<�9Dkz�]Lw��i�Z|o�����1�<p��*���1JbL3gCUC�����L)7�r� �qYQBa��Z�3�����?�ީ��@j��رP��x�������?�Ђ�F���o��L��N<���	$��]��.?=�rh�ޙN�D!�n}z~	MF������a��pw�}�d7�+k��Fʏ��J�!y�G�>���Î��1҆����H\�婜h����������}�R� cz�~o����.����`FKڢ=�����~�W����/d�rw��*8D�,�33hp��p�������������]�/��i"���5j��.a�U\��$F���)=u%>�������>����������A�ad+bm�lq��!�e�G���P6�-��0���"��W��6k倞�&��:u����DƔw����Z;7s�k�;���	�x����-s���{U��[�O2:S�L��z���TN�c�n��;�u{��k@�G�K$�|�P�F�3�s�,T�8��7�+��b�Ap?�i�Vh��99gt��X�c�+�&��i���!0�O��+%�)tn��l[ٕ0c�D2҅GHXٕ�m8o�E�V���k����AB̽��Y�hy����g��,�X6\���nno��ޙ#�p�&���˧Oe��FPDyT���]C��h��y��s���c�������= >�o�ˠÿ�~!�ˏ�0C�0Rb�+�W��C��ۮ���������ڷ��*�g��F;�t��}s�����5��/g9�3cXp>��Aaj7&[!��xs�?�)�|�$�8�p������?AbTQF_������@��r�|x��������.C����p�v�1�Qs$+���t�[��S�#�g���dѳi����dXKr�RnTp�s��!=}S�^.�i�s7���ǜ��! `�|�j=�Jd�1�n߾Bs��t>��텅sv�\OO$�H�Q����u���ǜ^n��X�e�p��@�#[�`<} m��+2^�UG_t�Q��v/P��8��"ߧ7���x5�#���ukDj�7� :S� �_�>��F(���a`���zY�(�@z��	j͆�N<���X��X#pc�w�8M�_���� hc�*ц�'�$�Y���8
,�Ϭ��S���������˭|����w�D�O���ח��6�(�4���s�=��4����3��U�ْfM��!A������f��)&���qT�SU.��qR��8bA��tq�#ZAM#{��"�����+\��6���]Bb0ֵ�����~f����y�OT�#����!�U^_�r������q����'m(D�ʡs��k���2��o��~���n���<]�����o�(dV:�n[�T�C$Zs��������yD���8}6���y0�ݧ�a�aS[���ʔ�ve-���}���m���䈅A�[G�@�tM���u��iX9;��k�3�©��lb{n<,r0�0�+L�/}q�È�_���u���WE��r�l�c�T�~�߭�m�Bډ���@=oݤ�C]&Ҿ���eN]7?,�&j��8�0��
I��rfL'_Dkݾ�� n��qb���c��+���ٝ�cU��Q�4�Kh�U�>�"_~4����X]�"":c rL�q.���ƅ���-�p���3^;��c ]�.��e5N��2$�N4Ha���i��0^�+p�A>N�d��1��_���������N�N����S~~�T>��.\�'w�6��́�(�Q��+��r��(�g���$�k�GnИ��?��*.�w���K^�+r�jI'Ow��-�w���;:�mQ��E��1(��hZ۲}<֡����>��t�a^��+3&�Z=1���/UW��豒qk���C���δ�5a�~��f��(g4$GM�Y�o�e�V|�/�X|q)g��`�湽��GqW����K�.��@�XT�1F@l�=��c��g���b?�_��O�}� �(��i��0rq�M
�I��0��wы�>��2y9����V2��㠩WT,�΄�#�^�!P�g���" �p����" _q��T�����ʁ%m&)زA+�����C��b�s������b�`1bI��M���|y�֑�b]�!cXc�O>w�>s3���tRG&i�N��+<������yB.<��J���ڥ�֦������2���8���C���9zt'��߰�v��
����^�(s�����WJȲq�V�l�����e�%l���2b\�T�e<��{e�ؠ�q��U�,�lr�'������|��>�L�#��rT��frE����M��L7������?&�XYz� 84��ۉ��b>�����#����#g�����ۓ��q2Gκ���
EG�%�*i%Wd��rRr�J���D7�v`���+��ⱒ�v��ʁ� �&Ǫ�\�ݧ�)9�J���j�d8����A=���M���H�V��e�v����9�1kxY�a0SVr�MYj� �[��*8��}+��c��q4\����# ����3=}+��㳬���M+�Bc���+t�J��{�13�VrEG�xL��=�J��	kz*}Qʶ��#� �|�o$���y9V�xQƆ�\��)Ʀ�#!|U="%7D�eq���z����Q�L+y?��)Y# ��=2���).�7+٧ba��<5�g��"ۅ�V��dx��
�%;�_d��ܶ��w2��+k��ߞl7lۥ:�V��FޣB�Q��M�G%l�=r�0GV�6��k!O�7m�=n�8�yd��ȯp�g�p�s���{���b�:�F޳�<G�ٿ�)�尔I�JG��$����,��(9�,[:�1cu��x��3�m�=p�����g#�£��D|�F��'��Lͅ'm�=6a���Ak�ӳ���hGk�а�w�����+�=y���6r�c#����C��6�����\��e#�	���]l�Mش���
|��e<���lU��Y�sT����OU#u֖�A@{������\G E"�Q�1�F��P�Ӧ�0��l����������W�"�x4ˠ8*e����Q�0�����N�#|G��E[8�o���Ag>�U���-Sy��}�&�@%MeDV����m*W\�Ō��O�%L��H%G�6�ʕc�tW'��re��N���Zw��1�+��    ����g��itâ��H$p�F�(��0q��TV�|D��]eFwr�5��2�+��t��}S��ϸ�������֬WŅ�ʕ ��γ�LO�T���i��h��B����o*Wxt�.�eك��=�A�5g��n*W�<�*l�I�6�w�o������\��Uc�(c�T.@~�SlE�l�j��i��筥6n��\�f��\�T�#@�B�%{# M�/9ޘ���f*��sΏ�~��ϗ�4�3&�)3h��\��hp`���x�;s���-�\K�%���� �L�`��,r�dޡfܧ��J�̈G���`��m���B�k���%L��3vL���`2W	nH�82�j2W�n�����2�+������a?OC�f��O�Ø#��l�qÄvM^�5f�B۞�%�)��C]%?�� ��;x�1=2��&s�wu�<�c2W��hu���d���}6��M��Bc6�pD�o2Wx8P�W�k2Wtp::�'��&��5YsYʶ�\	�d���(!a2W�EÚYQƆɌl�U�&=p=�sT��4��yb&�\.�e����?�"g��u\F�H��"cܙ���V��n£�xsנ@ŚH�ף82�M�%l��c����?��o��G�8��j+����z� ����L劊O-"*i*Wd(��Gғ�En��;�j�s��0�+.�uJ*�S9܈��abp��ʕA`^���L���ɜ�u���ڣ�l�H�<�a�� {�6qd*���a��(��W�1���J̔�\��(��ྩ��_0S�3���r���V���*|�T�Xr,ۅ3=}S��G|,	��i���n�9ԃ����5N���\�1sWΆ�~�����ҦA_��m*#a O��)R!a*WFP�6�S��AU+�e����#�ª�v$�
�K}(F���uP��|��i*Wd(���C~�qw�ӝzzHH1��qEb����XBI�Q�x�Ag�ޅaP����g�Yږ�\Q��e�����C�]6p�ۆr�u�S���K���j��:��`;����\�l/ږ#%gʕ�M������}� u�.H��T��K�s�C���j0-�s-��%��2�w��5�o(WxܢV����\��#�]Y��ʕ ���̙�C��������Vv&�t�P���L'��t劎��ș���J�!�FċR��JO��yYB�P�1�����(c�PF6�>��f�9�z�˽<�ӯH?5��G��-�Ѐ8�P�#ȵ`��i(W�Z���X�!��(����lQ`�G>�c��� ~�|�������1�]���>bj��\����-+y��`7��@%�䊌�լ8�m+���-*$͑o�J��XYh�Ll��+��ZǑ�x�8V��C�;Gϲ�+���������z�&x>i�\�aXP2+Vr�Fp��0O+����3����+0:��m�o%Wx	� o��V�>�ӆ��w��J�^�H^l��ӷ�+>v�d���4��
m46I�辕\�ѥ��W�|�Jޡ��	g�O��+%^�Bt�l[ɕ�F�.JHXɕ�CY.��EVre�bf��U��RiPX!{!B��GqE-0i/j%�G�Жmw^a%߀"v���j_<̏7�e!�n:��ҕ�(&��84��1�Aa����׾�oh��[�"��W�-삚��t�,��o��{Tl�3gJ;y����Ƒ��M;y���EQ'Έ�v��kQ㽏�j'�r,�������g�&\��hWf�o'��g��p���g)_#�
�����(��1�R��d�6J��\c6�M	or��m'���x� ���{x�ָ��(��{v��b���𤝼'��>!9�޵�_��Чʏl��������O5g�{v�>�2K��б�_�!�0y�}�S��=%֠OD�.e�N�BS1/��(a�N�3.�� ʋ2��;��x���	=GU/��� �� �	����-� �G1ٷ.B
��宎uS\����A`�٣V��.B{\��N	C�����c�����t*��ؤ��[�Q�Oq���KčC�%��<�(����9^��3�ڲ��!�3���1i��E$�g��d9p�<�d�����4p��H�n����B�	��g�	��Bƺ#�U\�W
��;��ݧ8o�C*f�.3�"����yӡ?�\i�ύ-�
.�Ҁ뱍��\R�U� ��q\�
�����V:N��nV�IE�QP+eDNe�tZ'�b0���i)�+@�'G�;�����÷qB�+n�(�h-�-��v�#�TeyA#�O��iPD<7���3W�j؃1��n�������ó�����P�k|�\dSD�(�Κ�
�$9uh&�2�ui=uq)\h묈\RI�3��Έ7�Ы"ȝKS�'C��P<Q���	J\HIVflL��`>糗9,����y�Q��񇭺�����-Aqp�^q!��F����Ȩ~�f�đ��&��=�⼕���'�;�<B� ��änRI.s�grݘ�$��$�q����X�1rp)\�1��0pI%Y�56�3g�d(0t؎�Aq��<�ۧ,-C�#��ǡ���$+3�b��c�����0f��iB`�G2(0�v���pT�3�з���W\L�%a�q	%�GpVy�ӿ2�C/Kڢ���oH��̕Ne�����\�Q����r�T{�$�}�%��X;�/�E��؛AˍB�P#x8��%l����3p	-�G����Y#� D�"�6n�eP�'DE*d�ϋI��.��L�"ZrǬFl�1Y3��� �� ��Ĝ�Ġ���axtS�w��8�-�����\BK�"cn?Q&teć.�iQ@�s;Fř+=C�h,�lh�y(���C�;-)���$��P�	�	�?�È����)Ew�3Q
����pQ���\BMN\X��)
a��r&�<)�K�WO�Q�\��Q�{f�*$�`����Эԯ#��(B<�T[��{\t`���
nK���j`QU������#{���w>�a, ����?��}�_���4�d6%j�ʏ�0NX����	�(n{�+��}7!�}\B��"C`��=għN�-�F�sD��ݏ��n����F�3O`i��2����c���\���qb���I��'C��Q,$�"�	�el��C��zM�����K���1����v��V4�3��t��Q{�#�,X�~E?����8x絣�T~�Q�o�M�ڶ��kdM��K,)�ε�^b��*�"[lgK/io�䒊֒t8�2ۙ S6�a�42C�;�5������X4��yf9#��;G.4=
�D��Mn���n�2*.!���~g1%.�y*r�ps�L�&��t����t�أ�)�aX�yfx;�)�a���`��dL��%\(�c�u\jIWEl'���Ad(���9#&�tj.i0�Ƙ߉V��#		�6���<Ȍ} RtfR; nX�50p{���;C���B1H�4�9���qDF�Yrp	1E\ �Rrpi̓�`�y�̜�&�V@E@��w6�.�]N�����B�(�^��no`ǺL�Tv��6��En\S��^X��Rk
�-rb�Ҫ�kP�s���t.�\�9@� ��s�C��e�R=Ȍ�q'"��L�����$��z�ە�[i��`�	2Plr�F1\�Ho�f�Rb
���un\�����d��b
/����!e�Fm�Z�Q=�F~���Al:`i�,���O1b����荅K-*����U܎�d��eā3bjQ��%=�\ٽ�,M'k-Ig}1���&�`&��^vvd�vu�b��@����\~4A�����p���G=qp)1\��;�#����D�wa�w�ʈO�~���%mC��}�uS`�%�}`0ӢTp���b�#��z1bG�D�i����L�xcL�SŅ���o����`���A>z:S�6(�^�(3��7���%��&������5k<�Q�1������F�V    ��..?JE� :`mї��@v+I�@�-�*�{o#�<�w��G#��xU�+��N%�y+�g(�����Jk3x�O�^m\i�5X��uq��\�;k�R\R�Ud����g�V)�kN�8s�C�{AEz�+�m�phаUYe�ذ�d�9��H��*fj�O��E�	�����+�m��x�9�0pIUV��K����8p�Z	����Aq�JϘ�K�$/?2���������<D�M=jٚ!:�ðR� eHg.%C�0M+H.�$+2ʐ#�8�o�!�����bP�'C�|	|��ѻچA��Mp�/�$+3�pN�CO����a�)�AceC$���r+��yKH��as��2�#Ce5o�����ݻ#�cҧ�W���Z�N�3�}*�\���SkZ�lUf�}�T��F,�6�T�G;�G��wA��C�àMZ���t�Q�&��q�\U\x�
��(�����#c���%g�G�>���d�ߧ8G����9l�O�$�S1���0��\h��P��MDbQ���ϞY�����ء �^�7O�=��G�Ypp�^q�J��%gE�#��g_�b�-
.2͚�s����#x���'�<#.��z�J\�T.1��K�t���b����"C�n�x�J�1D�p�⼕^�`����E��48G�<����4f��s>ۍB�%˹JY��#83f�7	xŅ.2�*n[�+.������pI��b�&�8#^=�w�`�z��)�\i�w�+xA���HT�����WfPvnN�s>۫�`0"Q�X~�c�݆M��n�I��]ܶ�W\��aT\R�+�TwΈ���zI����D�k�⬕�c��Ⰽ)��ˏ�Ab�!��5���,#�����e*����&���h�Ii�"�M�W\�)����qn��4F+2��=ՙ~e��nZ���՚Aq�J�?�ir�S�4�ImrI�A�>���	���+�8ծ�r�.���L�ػ��n����J.�$+rD�b^8#� C@E�7�I9O��,d�9�x�|��p`�.�$+��uf�g�!e'˖3�ѧ���\���arܐD�ǅ�on$Μܖ��q!E�&"\��K���B$얕S!;R��D�8�u�6j�S�H��c���6��!���FVp��G\|0�%����#2<v��xPZ19�1�y,r�+�0���(`|ܢ���X�^��mO�w��"1pɉ���Ri��$�/H�0-�k%�Y�a��YA�+��6�1
E����1�0}-����*�j-��K,)�b/�('.a�"�E:��1�����B�U{G0���`0�\&<v�w%o�a07c��ۧ���%��ϲRĠPC�9�*>�y��n*���Rb
�X�����5���rFbɜ�(�қ�
��4],�P�:��������,T��AFr�M�d�v�~�U�b�o���%�q(ag<�V=��	�ΈO;M�v��L�4���`"*�_H� �@UǢ�L�ą��V�����9�A`�$H�&�g�1R��p-�e�1�p	1E\,�>Z������HK��3bRL疘"�/'=�}���|�4J9�����g���M}�rӅ����0�#���т�4�HLܮ��<x�G�K��ڄaƝs��4�BV�S.pp)�\|ŏ�����? éf�1)��)�ecY�<y����L�S`��M�Ǟ�L��B�/��b�����'xk��%���2D���ML�bO����K�)�BP��e��""cM�@ ��&�j�kb�,���M���Rb����PfZ�
��T�����rJ)Ȭ��ҳ� ��d�y����X�{��Rb
�����)"��b"ݜ���R�VG�����l�U�b��6E�y�Ӊ�L���gGc�]1uz�0�uJ��r�&xtM[�)�¡�8sp)1\9��3ގ�2lX?����)1UcSL�ծ1y��!s��bD�a�d��Q�@�7�������0i�\R���_�l9�Ԓ.��x����8DVX
0���K*�K�l%|�T�I���`�< �٢'d
fR; .͛�0p���|��^%��?�X�cR[H|ױX-�qp)1\o"��܎��P]�3�Ŵh.	��L�T[��sp)1�%/hOH�����[���%Ŵn�Ѓ� K8'�Gj�H�ݲE��q�)ꈐ�>.!N�ȸi���ʈ��l
�nH�9�O��G\?LK����;!aa�����>�x��3s?�:%d]�P�?�����_`���{���v6�<Wq��rɃ3�)�o�pc�T�S���ί"E;HH	��������q�nLyc����ڛ����S~�yH��},��|t��{⡩{���]FC��ᚙ�ˮ��z.f�3RC'���Ml��*�r��͇t�,vuF�/V-�d��aB��>���# ��%@R�s%�ޗ+���>�����5_4g������眯�_�BQ5�'�`��r���\?�+��:�������W���(L��fΚ�Â��;u/��A����>~�i!g���*��������}���JtS3vr�����7�1�v->���,뻆����Oן>>��IH��=̵8 �$L�3�_vvwpgl1`��܌�Y�����|�$��)���O�o#gm�Y�U:��6�ڍfX�>����?.m��?�t3�	/��|��|���|� �{���3�AT����;��!>7��sf�������7W_5���H\�����=��a�X�Y�`uzn�AWTA?`/��q?�@#�ӟh@c�M�%��9�=�eu�	G�F�2N	�̔yy|��%矊���ο���z���6_�;s{}��|��D�|�p���'�OMJl�.����OO0�-B�L�tQB0���_B�Q�`�/�����}
�,��|_U�a\�<�M��}⏊��mδ��#@v�d�G@X�{d(�� ���ӗF���@�����cy_[a�^1��[ǏO��k|��*s�p���>��cQQ�	���r���BޣB6�u���JX�{d����� �,�W\p�hˑ������(3sv�����05�,28V,�=��Oc��:�B޳�G2䉳6�ݨ�������7䘺2�اZ�)@��
��u*O涅��
��p>�g!��!��+33�{��	;�9+V�IyO0�@H���,�=>�jg�o�����
��pV�g!�����4|�Bޣg����=�B�SB���.eçlY�;B4C\r�M��D"����G�M�Q�.׶��W�iH��FH,�ڟ�?r�2J,���Id��B�]�.a���:��eye�_���q*�s��m4�A���r�(�G�$�)���)]$��oKK
f�g�A��@-D���]i��n��<�7\�9i���|��y�Jrp��<o���f�8#>p٤@��ř+�k7,k�D��a��;��_�3Կ*Z2@sQg�'���E]Z�F!ܥ��\J�
n��N��>.�%��ؔ�G��!
xAsY[�yBTN�)�hvf�ӈ�`Pђ{f��T�l�`fv�e��ACBoM��Zd���aa�x��
��:(y�ge0��p>���\5��q���ȿ�b��ج�����WdHõc����E�iۢ�h+��p�7�m��		a�2�$�ѻ�'�%nկ�p��9r���l1�!�V���h��Jr���nĎ��G�5\B�7�wpTܶa�����N3lu���5�Lr�J�2�	�m���E�K|/QWp5ƒ.�Ҁ%>�Ҟ��*��	s3g�V��;��f��5�3W:Zc�MG�m��e3R]J�!3D�9�f�Y�=�b1A�m׹��HB]�n=mp�u��7f.!��WQ+g��*Cd�@,3l9#^p��XQ�s&引�°(�����5M~X�6��ܼq�W�b01rp��\��g��*Cd|�2qF�a����D���VZB^1x�u�|�2Ȅ�oc��*CfhH�yYc>��{L\Z��(Tup��C    �Lg�p��X���";�U�	��XX3�A��z8�2�⼕.�,Ё�2ꏠ��2)�H�q���KϬ�R+��'KR܎*dlzo���F
�w�&��̕VEW�]/4�G2�1��MSe�oJ>k�`>���a'|��� J�
0Y6Ze��ѣ=:.!��k0�Ŏ\Z�!2n�<eΈ�)�����y+�0: �XB����4�B|���y��R+��4ϒ�K�2D��D�G���0ǙAq�JGt0�M4�RNT8V������q�>[�iPd��I�|�7	>R���#.<���Wq	G\bhY�UYE�Pyg�����t����~!�����.=��F��Zߢ�8ߤv�`
�����RJ�%u����ψ�W�x���Z\�����I;Ɨ=b��<�L�CQ�w~pչ�3E��f��xJ�
��)Y���eI�/�4��p�U7g�7Vf$^x;�_E�һL$����ɷ>�5sJ�mcW(G��zx��
.ve6d	�Qpp��S4:��)�nb��?W�%ټ�)qo�{�{2�d��0��a���E~���4q;mlT.o���z�J��3M"���8��37g��r�Y�+���h��]u�2e$�QF&K�3ɷ>;��P�57�����7���|@�\ʃ���.���"k����d<(�"��s��&9/qo���_���>j��\4e��mu�I��L�҉ŞM��M�x�Kz|a�I9�?$��9�vne�!Ҳ�K�fn�<���2H����] ��g�9�~��J���į��ܺ|���(8���7/��da.P�Y��+8Dl�l��7�����J��^$��AȤ�ř��p�K+g	��ip�4�.o�@V(֗���f�D��r��9Ӊܺ�r�m�/R61:���2HF�d&��ɷ>;ʴ�E�5i�!�m^��[P�T�o;.��ઓ�@{��M�"�OԒ?Wp�@a�.�����j�y2�[�/�Y�3*�嬮�4�/7��;.3��"�u�_07\ޔ-2�d$Q���4D ���$qs�;�����s3rme��*�����c~�ɷ>{~��
�nDv'\b���
q���������q��rJ��M�"#��)���s���d-�}�FĽ���~y��7��Z�:�M���q��&n�4.o�@�$�u�H\�i���b�@�͙��|�E@mF.���S-�2e$�"�65-�|볛m�HM�2mY�m�P�<:s��_m�$\F�����˛2�{C�� ��s�\o��6"��4mQM�mf�*K�����E�n�?���L7!�BV.o�@Δ��h#��&HG�M��9���Qp>���Q�)跙2H��V ��gG*�y���xnZg#5t���@�s�^�J���s�O�z�^�
}A�[�����,�4?'��B�~��t5�G�&e�$����Ǡ7�}a$�Q�<Os��BIN���{�s�G����P�PR���"��eL�G#�,�)7�����}��֌��h~.
���w��D�T��5ZN�GF�l�G�~�*j>7��\��`�=�1���b\�Kz��ܚ��G"���l��#��������$���|�Hx3�>7y����ʛ_B�_��N$�z�_���{�MN�(�S3��5&"Yp����u�$�"�r
N\$Q5������&I�/(8���_������r���/��.5�)α	$B�=������~s��F���NuQ�����F�	�S"��*�B��J�j��������D �2��≈{J���� ��e^���O$��h�O�(uP�H�������n������)�|?/)���>�S�}����CR\.k%�����M��
�Dh:Y�$�{3����">v�X��P��]&��.���j�R5%�r3M\�ler>Ღl�I-K�C��3M"�pJ*���9���(U����ܑϕ0G�ɔ-�p��^$�?��Le�����d.d�(>�+�k��{ɝ􀞐�i����~��Ȇ�|��ɝ���������<Q��|IϿ�w�[���N������)������U8%
�#�������5��1��'S�-��*"����O��s<� �3DԌ����?����d�z�}����M��(ǳ�?dl��2�9�H�p�a܊���8���\�t͹4q(��^����|��"�s(�Ҋ=UGF���3ɨ⦚H~���f��'mr<������.�or<��#�NJ��r<�. oڧ��&��>]��R���=��t���79���Bt�C��s<��#�G*F@1������(o� ���t�;W��V��r<�.72o�į9�H+(�=$6뎩����O�K-�OE#C����&z���V�Q�K=�Ǫ�Fv~!����OnGN=��	�љ��܃���.|�ۉ�S̓ܓ;s���֜�d�����QZ���f��a�ΆO���Ow��W]U!�sn@�s9B�t)��k�7L��g\N��kqU�d��s�S�2�p�h$.(��׍��"qO��?Nl�"sk�F�T�9���R�)��]��H���z�׀�	��`��:�C��K��>��I=ov\F��E� ���.o%�Z�����C������S��٘4�h4�iD�����J�y��!ۖ�y�k�)կ�:��m(����)q�A�Te\�J.2~vg�����r�+g��=%�rW�����q��j�=׻������"�|볝�+�r4���9_�Gsɩ��� {�E\F���TF%{-��V����2�?Wp��cXg��"����6ʆ3jp�Ы(�ŋ3M܄:r�J��L7�Y�q=�sySr!G�X���f�DPJ�ؘK���{3m)�2����� %gQ�;��}�)�d$�Sc$���0��gS`��anI�u��|����V:*�%\F���G�`B\�\ޔ��L�.I��+8D��Y��[3Ou8$ұ��uх9��ҷ��L�Kq4Y'/�23.��.4r��M���\�i�?�i�����O7g�������YJA��ƻL$S�R�H����T��䏓���Fu���2P��?���q�1�����xGI���p[G���JK���Vtc��L;�t�\�8ՙ��Po�~����_��c�Z�[�l�l4�@�a�_���[�x�$	��%X\d�(�9y�em�"�0��E=�j	��Pʖ�!q�:����P�AVx"s[�5�S��ӑ��;�Ƣ)4Aáz��JD\$�#-�rJD\�6���]N>�x�频��D$����_+��{J4��K�ҳ��c��ٖx]2�殂@�ϦJ����bT�fm6ʔ( ��5�Gm�.���:��*��� �����<�?Wp��W�h����q��q(�����]���"C���\��j�� �Dĥ���r�p9%"�@Z�Q\�J.rG쫨��h�t�j���(���C���t4��X�|Ӧ{I�X�H���y�*m"��0³�GVЪ���[Q��.�����A�=	����� Y5�?Wp������FĽ��P���Ԑ�Y$�6Ӕ;le������4qչ}r�qyS���ZB�2�$BӒd�)qs��������A��2e$���:��[�M.#x�J���������{^*��ɵ8�(�2
.^�Si.o�
�����"�h�*qo�[��
�@U~�Z��q�6��'��i���E+�r3M\J��f>x.o�@n+�����L�$34�	Dܜ�A�#��f��q"	��˻L$���Z"��g�e����p�:�y�!�~�K
��dr�)C�}��܎�_pYS��(Qq��m��*�����R�Dܛ�B{\�����q�+j\�i���a�9K��L��J|k.k���Y���&�v�t���3]��h��.Z�Q���[|S��O�(b�E��%��lKkȓ���UD��<|�߻�r�0�8�)�2
.���.o�@�������|����ڊ@Ľ�F�>��X_�`�<�e&�řF;�M��f�W�,�Q��M�"�    �Yj��3�4��f���9��pq��5(��cP�=�sI�cGy$�����Z�b�3��D���]�NĄ�"�2
��'>���˛2����{o{�\�!��o�f��;�f:��xvt~�=,`��zr�Ͱ��[.7��"�v�.o�@��%�"��&?-�3���������i=�]Ր޶+�d��o�$����*Z5M��js��</��/.�O��{�e\������d솚3�?Wp����)��{3=w��\�64��~�n�ŋ�o�:��/�u��r��&.=���M)Y#������LCD�}�t��L��Ax�4������d���L$���] ��gGE�pQ�-'���FSG;��5o�ŭ��q+�w V���)[�jB�����/tKs����v��d������5R}�xq���_mA��f��P2�Y�㲦l��y������L��vg��9��h	L�f.�F�X�&S�$WD�.�|�]L+
*6�`6�G���I��K�E�I�e\��9OIyS2좷�?Wp��u�-L�qo�3g��9V���i�����LO�Ñ��o�[.7���+t7��)n��MD��񅙆zCRl��N�͙��@*�>4/<�b�J��z�\�Q���.�|�Ӵ6����G��S���㢂��pY�^�o�������qyS�	ȗ_%=����J��<0�qs��\iP�4*N���̮?y��r���>ECRe8�ϕ��O�.�q]~�UK��ׯl���Fd�	�Hz|A� ��%�߬nD�ҡ|�SƓ���7�����Yn$!�a��@���^'%
/>������4�'\�X[\:�aD\F��u��g�v\�H��|φtn{�\���#o-Dܛ�Ч��CE�G.�yTD*g���#4�C̖��4q�]pyS���MZ��3=ET
$��d��{3=�E���x�sOd-��w��.��4VL�w>;��CJ��c6�<&�v��w�▸����X��6$���;.k�����T����/ش+-������R�G:V8���.F/.��gϺyl��L���S�q;.k���!I���m�/�4��-�iC ��LO�rdc���>(a��!��&S�ꤵ��,�|���u��>��F�� ����f\�#�2
n��rl���7e �
yc=��=~��k���7�>��ę��NT�&��'�qq���W�ːp��&.��E6�Ď˛�E&g�ƣn{|a�IDš$�7g��X�73]�L8I�w�2H��RU�@��n�n>-��ku����?���]����5u�e\�fi���)N������C%y��7��{3��ʱ]l�G.��,���/�4q� ���-��i�R툢yӻ��d*]1�����L����U2(7gznJ"Qb��il6���ٹ$;T�;�@��Ύ
'���af�p�� wmW�����8���/n��l�,ದ�LkY�Q��
�DP��}��7��F!��R���8��\�i�"�.�N�[.7�ĵ+�.��)� w��Ȓ_�i�ߴ�N ��L�#S$C�}#<����?�汶$㩦x#�|볋s���0�~r6�A�y,n@��%\F����dٻ��7e��(�(��s��D���f�ى�7�A����n�g#��t�e�_�i�Ү��$\n�����I�_ޔ�L�*)��Y�=�0�$� =J��LO���ݺNʅ��_�m����[sH������(SY�ٞ��1�r!�zͻ\wRJ��o�r+��"�LOA�eM����Iz�M��}$Ie�މ�5��T�����؁F��M�k��ͣ(U�@�+�<X��mo�Q���.�#����[.�C��Cr������E�K�lY�m���DD��F6Q�N�=�D��l �l4wgEj�w��.�Tz1�	k'��g��!�mݓ٨�M�ܼ]Tpp�t�S�e܊�:�py#	2�{������/tt����NĽ��i���x�:�R����ř&.�$f+�r3M\��u��)[dZ���$=�0�$�#� ��qs��J֛5[���^+9Y��E#7e�L���N ��gSBz��5#�wܳQ=΄�f�F/.rX�ie�\F�������7e �GW���=~��і�x��5�m.U> >�<����M��.)7�"�N.3��fZZZ�.o��~K��+����x9i6��N�͙�GE�D_6�W��:3����vI�xF�J ��gW���!�?w����:Օ|1BaqW�a%��
��M#����)� 㚙u2�����/�F"5���Nĭ�6s2-�+�̭�W��͵���%��y��.3ӋKW�^Y)[� SƖ����LCD�w�7gz���CE،\:�@�����%�"��i�o}v�'K̜�d��Q��	�9\{�_ܢP��H���/.]��y�w\ޔ�L���S�?Wp���̰7�;�f�S^iz�)��ldO�r�u{q���������L���ZK��)�!��r��3�AQ ��L�cP�2����]õ�z׮lI���l^�d�g�iŌ����+��XC#w8D��q%��g�ʼ?=�>R�O��2��\Ɣ� w����77񑈀��Ln��y}p�a⯘7̏F*&��샂��E��ʩ����LVl4:C>�)]r{���k�J�����_%����dD[%&1�_P�)Oj��,qO���{=���V��I�j૯���էd�>Q6	$���l�J�3���<�3�<Z�����IrL��'\F��%��Zpy+��	���"�f)ufϵqo�ݴ��?ʰ�s��V�Q�\�i�"v�d%�r3M\���<
{.o�@�)r2!�Oz|a�I�r�2��ߛi��х^��F�=�x���]��;��"�|�)C��+�	�
EuC[�qJ�k
n����.���&�o-���UՄW�]��+8D��W�M ��LO��*�g�Du4��f�.n����w��$�r3M\�\w3�syS��/c���f���9G���9�a]�$U*/�����7m�)��L8&	$���:�b�1�:��њ
�����6�jʸ�����Eړ�˛2�Q��t%��s_"��Bk/qo��� zt�gW~F�<8�����L�П�0$\n���$d�8�7e �c5V��3M":��#qs�ˡ�5i����ܚҷg�)�d����o}v?)��>��n`5+9�����.�m$\F����LN��M�x��1Jz�\�!�R�R%�ro�U>*2������Q=[O}q���0#��p��&.B�+���dT|s�L�z|a�ID\��`ߜ�1�F�`63B>�p�j�]��$#�>ב�o}���\�Ȍ��i���g��f�)8�� <��p�P�l.~y��M�v%�:%=~��A9��2y�Dܛ��S�Éf�W	#�C9$�zW.�ҙ$\n����	E�7e 5�S��3M"(Qvn#Dܜ�iP
��6§AqT�ι�.S����
$��lGQ�nf�n���p��
2��k����+�隄�X��x���%�˚�EF�Z���O|�@�%�ro�M��]r'*gd��p$��o�^�iⒷBκK��L�#{�qYS�AF���%=�0�$�
Pg%�}s��q�z7e#�'�VL���ŦlI��d��"�|�����Xً:GNu���������uˑI�e\$H]��M��"������CD\�^ ��LS�h\��5F�#����zd�LI�ݩ%\n�'wP`���b��MȈ=?c����L�r�-���fzꯥb)&�T�C�)��.S���	$�?�S=�ph*uS���Gq.���`~r��FV�{��#�䒎$Jt�:�1e?Ȕ>B�&���
��y$�GHe�E�?*�����N�O�F�?�5@�IxL�|9�E�V������)�>��E@W���X�O2N����}��W�҄��L�7jT�z�������^"���{��o���ߧ|r32*%��������ƈ~j�1i�Ѩ���#]y���Ec���=�Q�O2�����Y�tr��|f&    ^b/B�d�)�&"�������I���{�Q�Vm{O>�O��0E�dVw'7��9�>	����)�����2��
����~>FV�C��Y��*�+9>���̉)'������)N	�����Q� I�_X;&��|x��R'+��Dٷ�&W�k.�l�\~�@���Q�"��ske%ש�~
^�¼�>�>����< ��n��)���n�!$#�<i+��Y,p3�@��ܝ5\l��ev {��e�n�u����ѳ=�7ܸ��K�xso�$��?��m)������N!%I�9kh�k��"Qb��*�ß��F�w^r���b�\M��_\��F�e~���,�%=~m����g:i�i��cF��o��\�/���xp.vlp�C�'�A�5������J�,%v�k�(K�t)��'�T#+�%\f���1ʦ:��x�)�t>S������z�3�֍���}�ո�0�L��R��R�p���+J'��Ȩ�ف���Ձ7�%�t�Gu��q�7탖d����@2�WY\6����n�A>���1��nt6��8�ۮ�)��c�$\FM�S�pY��ȅ�(g��ǯ�iD�--���|H:F"q-�w�)$#��%�̫�������S�>w��C�.s��l�瞝��Bq��\�c�!	�QSp�����˫)�䯖jʒ�����~�MC ?gf#�F�|m�7�91X	���/.-6����s�el��{2�)���2F?�l/.Z��My�q~IFivߢ@2�^\���ob��؇�b<�9s��l䏆����55�+{S��2j
.j���\^M�l�y��b$=~MMSLG;�מ��4�D��B��.5�d�1�	$�4�x��
�;5����"k�4�ٽ�#F<k�k��Ņ��Y��˨)���(�^\v[d�k��}���4�iC]Fx��>R(�@�|�K��p�-�I��~q������U�3Iz����՝H�d�14�������Ò��>
$3��ť+i�*�n�C$���w��ٴ��͵�!���m��zl�y5�q5]܎��pY���H����ֶǯ�i�y�p�Y���Rm(����_xp����J����KY1�����LnX����:���5a{�ŕ�k����r@n �~�єS ��/�x���wc���f)q1����qR��4�yIM����6^�}��\J��:����q��zJl{����X���@)`���FS��.�O\M����fn�e\d|u�
��}Xd:fU��ǯ�;�:P��dhT����||��'��	$s�ap��-��ܝ}h9��E¾����Fa9��毹�,.�Z�	�QSp�w|py����D��xIM��8)=]�����<*�uI�zi��ri'O	���/.*��\�>,2�nM��_x3��/��g�	�D�]�dK2�vʞ=��$3���E݁�����9���p���`�q�յמ����uJ������g͞�v\�>,r��c��ǯ���������lT�㣛'n���s9E�	���/.�{-�/o@�ʔ��$��?�3!u����ƮƼ�>@2j�_�����.�4%�n�C��rkH��>�3���F�Z�v���tP/�}��r�)��n��a��v\�>,2�D�����%5-�\6Qܻ����:]�Ң���/��O)�Q{�e~qW�7-��a��"�Y��m�_x���Z��O����2Ӌ�Ò����8�d�7.R��fܝ}H���Z�u���a)�SҶ_SSp����!�2j
.v��J��} �C�̶��kj�B8���p(�H�vտgo?�����t���~I����p2�=�⮪������)��
�e(�sy�rET{[��17��?��V�ܚ���Ё7��r��utY�s���ɜy ��6+wcz*��>;��\����B;�6 �KAd�N̆Em����K���Ɏ˚�EVX�\���%�S)��Z(�p���(�2��z�[�)$0���yU�\���^�ݩ)"=�(�Y��Fx��|s�d�)���⣑p5�@�VM���d�줪$=~MM�܇T��lLY:�����RSH�[��^ �W%�W3�����4�q耭��T��D=���j
..��N	�Q�ť��U�_^MAF�ѐ���/-��{uhJ�Kb�hM�U]�Y\l�Sq���R�����w\v����<c���:�zPDv��h�_[��]AK2BpB���o\�S,�_6܍}h䡙*�,�N�Q<,���ƨ��R�S���t�}���\\�>,2�x4�B���Kj:Iun��Ӳ{�٨|d62_� ��7��'�W~�I�i&f�8E'\�^s�^\\H�%\fN����ɲi#v\��,2%���]��=f�ݣ9��;�R7_��%��ez�dJM�ɜy �^������0�:[o�v��:Wɦs�\$ǎ�	�QSp)E,l�ӎ˛�Q}�4I���Ԕrr^���2�|�nq2B�'�-�xp-\�Y��� #gV;��ǯ|��|s��1hT*R��w�A�O�Q �����F�m�CW�5���
9}\T�خهť�Tٲ[�-���..�:Ѽ���L�þ�o{���v;�Ձ<;�c�f�vZ�K���,nDJV'�2n��fkN�e���^��6��8�b��Ċ��N�ο�jcI��V^ ���K7)e���C<?����k62�CH�o暚����� �\FM�5����v\�>�L�T���m�_S�8O'��ơ4/���4e|� �OG�:�����E�w�ro6*����ڜ��<[���r�9]�S�\�􀌧>�f���LR[?�ـ54���Q����@2<�Rɜy 7 Y��l�ݙ��>n)�Y�a��.��y��޷�AإI����Kn�QE	�7= $���%5jnm*�k6\n6
�B��o�f�Q��B&�>��E��e�^���}X��<͞��=~u�g��U���xq�����,�K2�H��d�7�?A>���6�a��PN˺��Fn�t,���,.~m5�.��ࢮ��Z���t���|���55�=���u���ºU���k�$�q�4-�̫q静+�����4u8g#6Y� ��PP��]-.�Ɠu\�r5]܆?�.�� ��xR6Hz�����JaSel��ц=��.W�%��O��yU�\GW[���qwj�{9��*�T2����M���Aoq�'Y6��˨)����㲻�E�[&��s���Ԕr�zʤ{�;USA�h۵7��Ł�v'�2n&/P�>�} u����_x򺦛���J�QS���R�-ɨ�X|H�~Ë�w[[\�>̱<CYo�i���Q6�uR��e����ԙ�O�����KW�3U�\�>� #H.DI�_PS���Mq�Pq�g�TZD<�K%�>��@*q%��p���:}*.c>�S�l����Ձ�l�9<=/.�"��M�B>%�N#U0{]2�a���u��>8*�M�1yT�WAOS%5����\�P�K������D`*�\�>,2*��*��kj�:4�UO���!��4��c�������3������*��+�� �ɠ��ǯ�>�X��yq�Qn	�K�f�.�S{��o\��͈��>��M�q��Lq�8�s^SSpQZ�� �2j
.-c9+���a���U��ǯ�i;���$u&�C�9O�ɠ�������<Z�%\f��E�YiJ����a]�I�_x7w�����Q^����]��;n]�D2�w�v�*���ði����j:lX"�2��\�~ɹJ���..�Fpy� rGe=$=~IMU�G���F�(��]�4��K#�;+�>��E.��$\�>|��=I�_������H@05�Q��&��$�U}�$3����5TLp7�A��g:��ٴ�HM��>ҵ����k/U�e�\��+�/k>ȃNZ�Kz����5���[ŋ�GEY�w�(������C&�;v�\,+7B��ڕ��Z�Pz��RpQd��"��dO/�܅���SM������qżD~4JHj�f'�[H��go	v�9�     .��O�#����	sJ�^rd �2�Q~��T����V곭Z�e�܆�u��a��-���Jz���&kW�d�k���^�nixum��E�a�E�e���D,�
.o@�5WEB~y��a�Tq�Ƌ���9��� ��ݴ�!�����|t��|��>�QWe����[�0�����eq�.\K�p57Û����qy���ED=~MM��R���O�CjT6���g�6����^�e\�9����} y`Y巄��:��
o������>���]��qf�C"���k񜯝���]��{�6���?tMNƸ���H�2�	�QSp���!���d��͕�_���55�bh�Te���气8,~˲�<�fNi	�xp������ �Rs��:�~Zw����F�y<���m��⳺H�~��'		��L{��>h��H��9�����5��k��Ņ�sE�}����"[���ڇE68`�*��Kj��#��I�6n��Ý�\;_,��ƭE	�xp=(p��{.k>�xC.Y��W��.~Ұqe���[6s�}X�Qh��$�������<����tߧ|B`*g�5��5Tx)��7"`�	�QSp6���Ҏ���q�y����kjJ�����dI� Q���K�絋���n]�&�2O\�l'�(�� ���6C��W>�(��D^\�g�wo*��)�)=���o\B�������P	2����?ܻ�*��\���1x�e�\:%g$\�>�p�z�l{����I:3yV8�<�y��¦굁��BU�e\�gY�S����p��˶ǯ| ��{ž_�Q\ge�e ��
����o\���]��ه0�-��:�UӐ�a��]{�_\Z�s`�Z[.�����d�Q�_�>����s�z���NQs;B���R��C�?�r��G#g��;D�(x�y닖��+ֻ��L)��R1����ћ�OU�cvJӣ)�>	 sوK�����[9A��ddQr�7�N2g��~�W�wgy]˓?it�C��~;�pj
.��%Z	�QSp� ����[����;�]�_SS�K:�q4~KH��.<q��~sO��rO�Dv���;.o@Fn�a��ǯ|8�+�o�MsD������\���J ��Q�}9�qw�!�ms���YvG����W�55��M��'\FM�����py� �ЛҿOz�������⢕��� O���d���F��.7��]w:������#�䚖��Ձ����P�����b���Z����[R��o�����ܭ}tTG���2j�"�������6�q	�SS��ML������DFLz�o�w=~MM�4Ƕ +�c]��� ף���܊')6�k�e\xl�\�>�ܑO�W�]�_x{�H�x���8{: �l�f ���c�I ����3wl��>�P�_g�Q��^ɻ�/#��G�&�rjJ\*8wc�sy� r��VP����Ӿ4*+W��ǳQ��\(�<qq���u~����0��wc@�c�N��:�~ji�p�����)-4�6�@���Hf�ĥ���Mp�����a�<��2m�Q񬭺������㘕�˩)qr�#�n�C��>H�wI�_T�R���"�_�R�Ĭ������Ϯ�yU�܈���55����'vE�� �g����*�G����>V���kp�.kM�ξPm{���*��i���"�l��������T�����)���Do%l�s
�ǈx��n>vLY���Ӌ������3��yƢ_Hb��f�����v�]�"�"L%�.3[.�Eĥ���-��n��C��"��-"à\A���E�20�vBW^��"H��z�^���~�$��lwέ[���yZ�|6�Gr(��m7P�jN�eq���Bj�Hz�M��H=�Fە@��ye��ܹ�!��`ߎf�rdT&���^��/ɖ~�F;��[��S9B��:��`6ʇ��4�2�,.��yJ���7�قp��z��ԥ+'��s�E�\qo��=lxTVx1�AM�|ѵjq�ajP�p��&n	�m2.o�@�H�糤�f":J�h���3=�/Fi��l�������2e��VY�(�|�ð��Ps+rc>�c'�k�v���	�C�p+��RQ4!��)[d�u��Y�=������av_�qs�3�C�+5����OZ���륟��|�m�
|bdɳ��;Ԩiu��TW0�*�r:D\:�:+�\dz�-���_�!����%"����'���F慻���_͸�H.��J�H���S��qR�}Ί��H͵��(���.]E�����X�?������/2n��$=~|��x�׈9�>��܊��V�٨��]i,.=_$Ӳ��<��[���q��i��
��_�����E��f#�K^����$�U�D�d�uq��O��~;���6�>�D�1��,'��A�~��2�rΙ��c��Ԕ�Hy��g����L,|b�m�_T�)$"	����<�����u��)R�5zN��<�S�����)�\����e	��R�RR�جp7���fm*Jz�N�8��^ ��@4B����z�ܰ<$��	Ti�d�:�_NSܭ�I���i!��h��@��]TS��=B����˩)q�=6%������<Dn���E���4Q��xq���!�/�MMI2��)6=�N2�J�[�zѻ��QӦ�&�=�8�=�F��zB����)�~k�e�i�+�=����9ɩ3��DP�i}D|{KɃ}����?�����9��3�Q;�_%�ߵ�[�I�Ja=Xv�o}v��Y��_Y%��ԡ��M���][\r�)��D���2���}%����"*u>1��@���9S��9���!u~û�ɧ<96�N���ͷ��AvX֝�SvBC/��+W
���1���X�����U��
�ȸ�Q�Kz�x��s�~�pOҘ*�L�Eyx���9�/�ȣ��z;;��⺸E�p�p7wos�7���x�l�����JR\SS����.���E���%�ݨ)���٣�Ǭ���j���Q(���*"��)�D|[�%��A���@xɼ*e2���A�e�4*sTJ�ȃd�h-�hD�xHN���Կ��[����w��iˋ%�IK�:�O�w�p�*�>�Ios�y������"��M���|�_~�������/���)��?��I��$?��hT�m|1_��o%I';�8�?��e(������<2+�^�tĔ(�����C��hڕ�Pe��s�����=�K������N��ǩ<ty��/���N�H���~
D|� ���vZS�t�_}��Y���L��#��a��t�:ν*��I$Y��s�nm��$�<����(��m�>�S�5���!����?���Ͽ��)��%��#Dd�}�B��h��Da����?�����S�q�b9�ܥ�n�'�}�gh�EЃ�?��B�������6�?r��P��|ls�H��������׿�����4|gJ�:�����gB�/�����w��������L�'��0�����0��ӹ���&�=��%J�aa�g�J�Ϳ�����6o�����������w�,*�_�_��������@�#eĊ�IT���������_~�d��u>��H����2������\ZY��|>���]1KFG�s�]:f�vH�o���]J伖x����4J�C��i�G�\~y|���.���X�乘�����?�_�)�1���^���	�������?���x���`9<�v}��N��o��_��#<� <<�]����_��)���VL����2�i
�|:-���I?��E�?��������qr�g�_��������ؿ����΂])~��o������Ms�?�trx.�Z�����?�?�_��O���o��_j�&���������c]�gy��?���O�G���y���������C����To���������&1z&펩vf�|!�9���ˠQȫd縰�1w�b�y~Jr����i�۰e�����%mw�����4�W�]R��?���    ��>V4*G����]p���K�8��dJO��?�����%�������ȇ������
�D �9ɠ�O�ĝK�丙��ߕA.��/��?��8.ze�s�XX������-��m��7*z6cv�{.s��A��Zތ����D��~�g���E}���T����y�H��Hv�Cr�{���2�$�?���+z@�z|Z���`�h/(�.����ϸ���u��k=���Iه"t���F�.n�KJ��죑:�DJ��]2��[�H���tH�%i�8��&[=\�OM�uH��0��3.�� S	��!��sE���V��\��DH#>��á�J�hZ��A[�}�s���_�?�|ﳣ:⒵�#�n��s/�߹�JZ�p9'nDE�ǗO��7�?�4�y� ���X�a"��t��*(��0��Q8ݛ术�4q_��)���JdxK=܍)�6w�UI�/�tB1*��D�͙�G�4#��{�N����m��$SXC1�0�I���F�c��;�F���W�U����R~�؝�p7���&���*�gI��+8D������7��@��.���̍��D��0;.�4q)�I�NK��L�|i��C��M�xNo&Iz|a�I��Ξ"�ʹ�G�3e�>�r���c��]��r.'�|�k��h:O*��U�zm��P�� ��%\N����Ƞ���1eD�H������DPY�\���7�#�Ő
������(�Uk�8�ĥ=@�2.7��u4Vewc�@�'{��w=�0�$���.:���3](�#y���7�Qhӛc�o3e$��s�#$��l;��)�-��s;7ɖ�R��p
.EZOY%\F��m�y���d
h�
n%=~���I�����5��G�������;�Q��I��.�4�aq5I��L��$�Q)�7e��qY$=~>�A~��7#qo��=J�˝����)s�0��}we�LϲsΪ@���M��?`7�a��Y��pQ6[/�r
>>�����˛2�3]��(�
N"
���c�Fĭ��*L8=�5��������Fw�f\���k%\f������ZpyS2�
~�����R�����7g�'Eեȯ�����z���␛2H�B=%� �|�+�ZwO���y�m��J�U_R��Eւ3f	���/.�����eM�"7���2�/��Q}M�����
��n��[�����;��_�7E�e\��q��eYd�����kT9���Y�����)�k�ťۃ�{�p��_\��<���<�wu�Jz���'r��so��<S�%(L6��05*8	�x�"��%%��d$��ֶ�/����x���$KÝoZږ������R��b�)�r��gq��BZ�6���4��{�"nq�H�s�p5� ��nm��} �~ �D	�E5%w����;/n��ð��]j
��%�!d%�4��Aw�.�ݪi��쟇f�1jd��on�ϋjJ\D.��K���א95	��5�"5{���j̡=
��=u��],�MMI2� �d�d^�&��(�nմ�U�5Yֹ��� �zQM��Q�"i	�SS�:��h܍5����{���55Mg��E�U�<�F'�$+�<�8��xp�=d�	�py����bE��W>�&�<���MH/1s�ۻ�$S|de$s�ap.�����i�irF&��4jd��C���ĭ(���˩)q��7-����NnȾI�_TS��`�4&���F����\��p�Y��\T:����D�s���O{����ã>����lG
�Z�fH2
��������p�-I��ڇ�o;�����q�Қ�E5%.9|w����Ԕ���y4wc���!�_s�z�����^�Mav�W���a���mjJ�qi�MH�UI�D�٦(�n�tT7�[��WE�r��r����3��"[�c5]\Zl������<�ǚ����;'~��Q�W�;w"�&���*R��?��T����{���g����Eź��F�<�9m\�"��j��.�Eĥ7�bpYc���M I�/h�p�oF���E-͟4��k��G
'u0�a�?$����F Y���8)m^C�#����*��Gt��ۅG�nW��tLL��#��j��k��ӟp�A�(3ǏWs�Gm���g���8'�g�>5*��3P���l�d(�q�A��QA<��M�'�B�w��M*qQ85�.�2k�'�־r%���I5��᤺2-J�0/���I��ߒB��Nq���Q�\�pF��y�e�h�g�}D�fXv2��_�Ք�T�9�%\NM��ח�$܍�!r�csS����)�2"�9�}4Bn��-�?W�I��l����s�c�A��l@Rد�������아�M*q�t�3�������0їOz��y8���\ 3����$q��6�C���]Hf�q�
2�p��g��N�V�/9�QF7���e�%�bp��˩)q)C`ve��Cdd&Kz���6}D*���$#���	��4ަ�$y�3��I �W%�RtL+Q�ݨiu�>NL�i�hUrq�3����N�K�Ę�pYuZd��L��g=�vN���+yH:��4�~���/�Q	R���&���h/���N���vh�9c�i���TTڡ�n.��ōV�}����4�:x�]�� �4*I��)x�D �f�͙.�ʯrT�^�9���>������h��"F�#�,�����J��t����a���.�D�5� X]pY+��t��;�'=��D$�crL����#PQ�ڌ�;\�bW��7Y�%��j�@����a����8�6�����<�Q��ஜh?����$�G
��%[�;�e�e��'������7O�:��I�qs��l��"�x��
��_�9+IE��WZơ�(J	.�}��fz���H���`�pE�e��'���i�%�$:�@�=%�fzS�����m����B+�)�9���K�v;���<Q��������(�F����'��}<%�G
�ɥ�Hs/�\�J~����h$�(8�Gz$���e�^�͙�I.��<�Z�M�\���hΟ�$�Ut�F~�X4�s}�g8�E%"�����xa=�rJD\\Л*�/c%?�i�R�_P"����c���E�S��}ut ��p���C��ϷX�Oɴ��V5��;���9�I]�q6�GŝV�W�?��D�X��c_\�(>�\V�W��<%=~�ϊHJM=&{�_*�7�Pߒ��SrC���"~r�~��.�7�m-\.�.sK�l�v�3S��N�&T���3�U�E�+�ٓ����ӏD���*!O`n�6�f��-�Fu�<(F�v�&�]���ei��>{��9Q|�Vx�����p&sQ������QD"c�w�(��E$��
D�3��-�C+|��O��X�����Xc�HQ ��g���z��s;��h�CT:;5�/�LWQ�t	�Qpp5!)	���f���U�����C��`"������9⅛~���V_�i��˘$\n����<c3<�7e�L�1����f�D�(G+7g��-��FT		1m�)#��~)y��{�Mv��A�ĂQ�:��EA��i6X'.]��ڵ��)8q�vJN-	�SFd�qI�WI�/(8D�ߵ�fzn��ipɱ�{8��b���L�ͅ���r��&.��&g���1eD.p�wV��3M"*�]t��9�m��t�������j��}��$S$w�
$���1պD�֔�d�3`��K��m�3m���(8�(j��-�˛�E�4�*��s���;.��j'��LsTr����1���n�rN��L���W	��i���Q�,������Iz|a�ID��w�7g:��2`(�7R�Ȑ���m��5j��U ��g��12mt疏L��ŀDU�%_\J\����c_\r��F+�5e�ܡ ��t���
���~g��Nĝ;-ܥņ��X᳑oH�`3��O�g��:#a����s�P4�_�!⪆\~]��t������=��    ��\d�gϥI�/��@&S.�^�=����pbP��ڔ����Th���%�\e��I ��gO�1e\=I4�d��p��E�O���Y��C��Twc$��T����DP�OI��-��6!i��M�ld=���#�ݡ�$~亝�hu��^�!⦕��K��7c�Ւ��1�D�������_�!�hϐ�=�'rG�	Eo��j�7�$��
)$���8�?����v�Q�b���v׎J�KY���^�e܄"vgpy#�Ȩ/�����"2(�Dĭ�N*�C1����{����
�ɩ^\��P�d���-��ip#L��.o�@N��뇤��gz� w���w"n�4^ [1l煗� �k��,7e��Q�q7g��[���=4.�-��4����M�k����ܝ�p���Q��M�"w<��z�\�!���(�fz΃��5n�ώy� 皤��4q�/��qJ��LGW��˛2��@2b����L���N.
DܜiXl#���	wv]���w�2H���J$���[94=Ud8S6���O�[N6F�Y&2���r+��>�PV�eM�oq�Iz�T�����K�Dܹ���)����M�f�;MGE���8�ą#^(N��f���
^�.k�>�4�g6�_�i���2���3�fc���w�(H>V���t�$�eC֪$���R�"sk���${���vє�K��1/�2
N�xb[��˛2�鏲RZ���
	����h�֏It�Ə�yV��ث3M�AI��.7ӓ�P�Y� ��d��T�$=�0�$B�G1$�Dܛ���J�p�]�� ����K2=6�o�.I��ٍ�a��z�S��h.�BU����q��q+��F�:	M�e|��׸e+�1�c��x�I��OW��?5Ev�|�le������+Kn*�����b�z&��R��7��,ಫ��S8{j��޶�씚�S��Q��v3@~U�?�����$��F2�$3aP��(�C�E�݄X5J#�=NA�s�l���Q��RڔOn�@9	�QSp)�H1�	���9�ς��l{�����T�斷�H��:W��\N�`��������p���������ǯ�����k5���\>�e ��P��o��+8:wk���A���h1Y�U��xQM�K!�1y�SSp�F8%wc��+����E5usk�rS�͇x�m��j�oSS����Y'�d^��K��Aew��������P82�9��S-]R��E�Eޚ:-r���ɞ=�=�v��#�M.�sމ�s;3��P�^�Q6�GpTm�چ-�+�({��I����ǹN��x�mvg#��/�׮*��kݚ��(8��:r�kێ�.닌�
�;I��+8DPq��)q��>�eZڑ��y�e���G�~-K���98��]4�3g�E%".��d�J%�rJD\�I��f��$Ȕ"�$��%�"<���"�)Q��fi�|��*��7lI�B���.�,��ix��j�C�g���=J��˥W�O.������p)�'�~��<%\�J~�)��7I��(���BN�\���zHܩ\����Ӎ��i�|��Ʌkwf\g�p��&.�y֐\Ɣ� �ϒ��x��3M"���!qo�%�B�jëٴ���Ȓ	�I�)�ar8�%���y.h�͑�Ь�6�(g�R���ĭ
D���)8q��9d	wc�@��BU%��w��D��(="�-Z-ڒ6��ܒƇ�ۏc��eՁ�L�i4�{��:D\�7�%\N���΄���#Id�
(�Iz|A�H�Ds�ߋ��Cc�g�.%��#�ͦkH���rџ�}���H��ٺ�vX�6�S�٨�#.�z��/)��zZSs�.k��^NӐ���j�DD�T�!�mٚk~�~����B��pCo������ύ�<Z#�y�^�?�Tu.+%�>����'R7H���� ��!�,�1{�������Q�y������Կ�A��/.�g�D\n��[�����������ՁOǠ�QuŋKGS?�����oY��������KG���p�u��Q�*�"'����4�Ք���7��p95%.�R$�����Dn(��E#�*Ն���v@hb຿f������[�p����A�Ii�����K"vǲ��o�HOH��xq��	ϋ���>@r�u/{��������{�h�)�n샥�6/5&�;�Ä�<C׎�K.�)�*ಿc����$��;���@���͝�;6Zs8��kYg#=�\d���M��$�U�q$��l�;@��F^K8���s�r�O�O#�r
N\����
���\d��쒄|E�I��Ӓ�w��[?���x�u�
h�u~�of�_llf�j:�%����c%�X�/�q��Z�Bʟp9".�
��H��ih#��"t�K���{:4��2�mf�uV�q�M�/K2eE��L	$��옻9B!oLo�i���a
g������2ُ.�>V�n�n^���/r'?�ꕤ��2<�TN�;�Aei�yq�TM�{@�xQ^�yU��@2��[\��6�
��Me6g�-�h���l䎆h�oI�8u".�q�(]�e��E&��Ԃ���^����C+^ ��5���UUs�`��+�I��[A��B�AQc
$���T���>$�cߙR-s#��1�%{��(����p+�o�A���/r©�=Cn{��^�G^��K��ɰ�c4�xʨ_J���C�O�%����J� ]p7�2��?*垝{7���ᰘ��_R����}� ���"���}Hz��^��|$���ֻ@ĝ�h���6d�+�
O��䐓���{���Y)�{�N��.�xS��m�'��T3�I��k�ťl��.�2
.9_�%\�^.r�u�)��s����	D�9ILn;�%��73=]T3;�jx���O��\�=\�hlO=���(Q�H1����ɶI���!O3{��qy+�Ȉ�ۨ����Dt<X���;��H�#�$4�ٮ�7�dʺ9wKC ��g���1:�4{m3Q�CD�\�U..bR6�c�2�k'B�RpY_d\�g��m�c�����I��_:&��t4z(�!�7��K�5��������R�����]�RK�J^��gB��(�����+	~>�H�Gﴯsu�$S������'=�f/U|$��}�q�ً�o�������=s+�F�����{v���-�δ�|볓M��;'<��A�~���|p=%Q��6	�Qpp�9�3��{.���$�eH�L��'=~��K*��(!_���ȡ4�bx�u���M��*鯼��q�����龧 �U%�ܲ�9)#�rJD\�(re��\�J��Q��$I�/(� =M%I:O��?��ȧ�~��B�ũ{��]��B��R�w>{��lG�s�>�c��S*1_R�ŭ8A2�O��|q[�8�﹬�\d\r�Oz�M��$>I�U�y�v�N�\<Y+�F���k�ß����f2y�Q�����F��oJE]Ԣ�(�髑p9-��N�\�L.29L�1�����D脵CD��"������|��$j_��Uɔ<'�gH���ْ�+�G��n&g#G��tb������[Q��]���
�����{.����H���$=��:};|�T���	�I��F�P"φy�bm��ѣ͟*�T�����b�@Z][�����^����)q�<}�Lݠ=�]�٢vI�ssj��9%oR�h�͇����t)νɆ,ɍ�7"���If.={������P�.R��6��s�@�ȏ:��)�t'�\.���6��\�􀼞w����55uѓ_8�x��C�Jz~�q�1=n��!-�i��pc�O8�wqN'ן�wt~H�ܜ����� ��d��l]Iz�Ωy8�s}Xo�ռ�<UH#�w{��d*5�u�Hf�qI�JsI�ݙrx������<-��Bg�5y9����D��h�e�܎Ju�m͎˛�)�L��^a�����SU~L1'^��[\D�v=������ ������:�+T�*��S���U���4���]�J��M�
y�s������pN�61������e����d    L�-Z �5�E�2{Vwkzz�k��e�M�?�/C����;w�t�j^��Ԕ�����4wcz@&#����E5�u�+1�^�ȍ7l�$N\��J�m]b��n#��I{�i�.n{��v�"�2�J��^�&-��dΕ^�c�	�?��@�Y+z��Qy�|Io�=��С�@2g���}9� ��l*��c��<�=�,ɚ�jJ܈b�g�p95%.����.o{@����$!���:PuI�Ƕ��p̭ ��>5%���+p�H�Uir�:m<�p7jZ[u���N��Գ��P)���N���vY��qYuZd�֖"���q���x�] ��-����9m/�����ԛ�wI^& J$�?�|q�4���x�8'�jD+]7�+����6�ٞp+���m���(�����О�G�,n:Ύ��\x��h�i���L?%+d.I"Y���0	�.���[���=��![�����࣪�p)�'�b��z�����(�'م��?�1�p;4,R<���\ْ\������P������RF6�|ό�����d����8q��[��k!+���jl�>��(�*}γ���@�ϹS1�w��/\<u���KM��3H1(�A�MlT!��E�tM����{���2E��ލ����B;U��Jg=��Lk�BA�T���!K�����)�"3�l�G��K̴�&.�P쑃{ S7��g{{6��K�Z�KrB\#1I�0\RNy����������Qhp#��r3'���aa;67z�&�$az~H��,a�-3��<vN������Դ>���Ƃ����\�	����g�{�/\H��h\R��`u��z{{97�ic/'R_�WQ�N��)���W��bƪ��q�	��p�z���=��5�5g��|I�`��ܨal�4꒜���֬4���B�2JN{N�?��[�JW?��c8*���e�t��Ǫs��xJ����������"���R�^�����4�py�?�R����CH��9��	��o,����	.!�/�)�#�ǔ�T�@R\h�P4�ܛ�(S�����1ky
����io���R�'���Ԑ��g���D`�F��0���p+��X����2�K)rz�a/}�Q�u�=wG���O	��<I>�l^B��>��������;�]\U�.+E���梠]7���\�O������p-sY��%�����.pzL�˸����@ff86ڧ}7
oG�}Ho������Lش�7�E���=���^r������ma
�6\��k�Sc��rB�*!'CT���{��13�����ᘸJ'C0qH���h���Ԝ�/2��@.Ŏ���=�4$��q����4ְ��W��~�Z�$6gǸ��Ȑ2"5�����߅��Q�az�J1(�s�ӱV�%�ݫRr|�����=�}��	��^���b��z��EL(�/	�u�l���`���~��\zr����!���>"�	����F�D�!�-l���c�O�b�_%�
���\���_!l��>K���~{�P�{���a�TY(���O:�r��\1ID��#��n�^��		�{��K��݃�s�\ԇ8���9#���n ��$k���7`�"�4���y�����E��K��0t}�-��W��[��R}��.� D"���B��L���>�%�F4��<�Q��ɞ����4���d�p�w����t�;l�����2]�xKЕ��x/S�����kS��9�� ���z�oֲ�Iq�:9�N��jΕkb��-riq�K�zD�p�TN��O%F����7�3(���b��ƌ�Z��uŊE�C&i1[���̿���o�̵&�[�B�c�Z�eC�K�q���ѤM:��x�B��҉��c\R�s&Y2=Ņ����3�.��-M�VeĒ��q��G�\�� N�/f��]4~(�ڠ"���sFqp�AE\����\ro��!�[ɑ�crB�*ҹu:t�'ϧ�������Cv9���K����i|>�H���bƋ$����X�,\H$��\rAd��sX`!���cc�2�k��,�ʩ��u�r�K�7rAo�}.��̞��(*F��c�N(��'�&%*F����`Y0VM��1c~ "����c��W1x��r���\���;g��������������O�S���b�&y�˪�A	g6����?N2�~�bhu������.���y�K~By��`8=��Y>��,�8u /�'��F�L�R�b�q�����-=Q����"G%��}�<%��(��.+�c9-\,c��9yNpI9-dx�9����EvzG���g�wL����4�p4y]a�_?��Ŝ�%��`���9�}R�tӦ*�|6�� �K��B��nJ6rp�_�x�Qug�K�7r���rz�)𸣨�)m����{#=�<����$���Ü^�C����G���0�B�dqP����/jp�ř��=å4��l����%��B�*fTm�_�P��k���i�Ѻ�2U�&J8ڕ!>d$��CN��[b0��	���V��j��ld��x^�.�������`�pw�������1.!�7rE�}t�Y��E��tvD�(F]�=^P\�m��ҁ2���m(9e�9�$w!���@��҉����} �	.1ｑ�G��19�f;�suU2��E�[���lu������<J�0�y��る�\�.�O��� �`����f#� KW�L�O��LaMrp)�.s{���W���8=��LGL�J^|:��h�����~T߾�LK)-��2�#�c��ڠ ��Zw����h<iJ��p1D��pǸ��2d���O]���J-�������	ŝ%��������A�k5gN8,K�<���\��6�ǎ%M{	^5�*J�����_�m8�����Mb�;w/����}�.9�/�J�dN�?��s��7G"�0�? /�b�TH��P�����ُ�)���_ݜ�[���ҙ���J5��K�p�W6��#\�J��^�N�/�(0?���AqODs� ���N��AHt�u.<d%3�C-3��<v���a�P4�lTE��eWƥ����;���|�:H�$�S�c\R��{�4�z�2lV�YI-,ƾrn�F��S���=�t�{�&ߑ�E'�F�KFq�D�S����20pəo!�Үd%9=&�4m�Tϑ�:�.Y���
��)���AЁ��
fb5�pajM��(���2c�,n���q�����vQ����z.%S��B�7.mz�/GI.�{�C�Z5�0S��b!J��F~L�����<==b&��<,G)�#�z3��ǃ�A~�P-Fc �����7b!B���Cd8�#�TNz�}�W�
����>�)n�Y<d�n�;���驥�bn��y�`�?6���>?kX{d�ͽ^��z%��7�g��L��N�o\HB�;1��#cͲ��ǔ�t�W�4m��h��,M7Ʉ�W�3(of��#�ykӾpW����%�e����R�������Wz� ���j���Ǹ���a6�8ȟ�2�-��t=2(��
�rÄ'�����7����b�WI3���p�v7\��:���%^��o�ct�������BY*���X
�|�g=&��������F�["I櫑����Soof,�W�g0om���|����2
�
�82u��ZWJXuIN�c�"f����B^�W<��^:-7Z����w��B��$��|5�s�a
M�>������A���w;A���l��	ꝙ�'*�c�	{�pW�c�w/��^jQ���%�B����L�K8��˄�߰�DW���"�j,g���\�XpA&�`&l����e���R�/�����l4w`�,撜.z������2�l{�8=���fK���v�K�c8
\���t�8�1BU~7�l�.f��dd0�;M���,��H�����;b
i.��7.z�%"	�	�N�o܆^�Z3p	���;��&    �OzL����8"�	.�j�50�z�t�b^�����1�֦�qfF%���qI{�`g�����5Sok6�
G�^����AK�i!L@L�'=���f�yQX\�G�O�����a6�^PK���:�2Τ�������`�?v�� Na0M���	S����5��^�q�1��˦�����͠�����B���"<�NzL����DJP��Y�.���y&B�͌n.���3om��`������lv*V�����vp��4LX=�t!�;��%�	�������H���s��;
Nc_鄂m87k�%
痉&�j������b�,{�V�`�?v.&3#w���j���x/�%|���ci{�3ܝ�߸���������/dئ��0�z�!�?b��(��js��#ޓ%M��;^+�	O�������c�>ܸ/�u�#�>yQD7���߯��p)�B�w�:�%��2�ߺwz?��M��D4\/(M$s)Q.ڿW�dZ�7s�I;8�w۷E�������QX��E}w�"�pʕ9�{�/\t'	��_�J.�v����{���L�}�����HW�n�T����؁���~س�Z�u����$2&����fQC��As#��!.�!�+��`��Fr!�w�o���
L�|eP��P�B�S��#�f#���y�H.f�	�0��<v�s_���w]��j��GJ�|�X��qp�_��l.���B�
o&Xob���S�/�Qr`!�����h�**��kG�쌔�C�>�2���$��z��0.���1C�\jL�iz3\r�{!7:v���Ԙ:����-� m��t���x9��C6d1+<ʍ���=�x�jt�P��K������A��8>��F�u�S�&Ӊ�%f�m��K�p�'�f��D�&-9=��L�.˪Wi����5�t��04�|�)́�����3*Y/)�B�����RC
�X�,���=�<�����TN��!��!����3/�һQ�Đݎ�,0w,�����;p��"���@���1$r�FJ{mU�?Is0��2E\�Cʍ�q�Җ�����L��Q�	8k��	S�a��ش}J�ȼ��g0�R\�3��{0pd���=�z�=ٹ���/��KrZ��䡓�.)���g�%�z��IrG1`�RzeP��-M�<�b
o�5M�D��[����~3V�H:2��<vkjL�CT�#7�Qe�k��Ր�$�\��{�/\��kd����BFOH;8ȟ�[
,JӭgP��i�rxceIr�Wu��F��0e�ȸ9J���� e��h��("�հP-�v�K�pa��FspI+����ܕN�/�( EcTY1(��t1�luQ䜈��W��m%sǓ���w��n� �P�l��Ĵ���KGi���������М�e��_�s����1��t�U�D��L-�����tȗ&���6XDpSI�Q36��=Gc�%��pWΔ�9�Ę".&Jq�}�.9�-dpUN�XN��1�1����[	���F�c!�g*�|1��[v���X�/܈�V�a���?`H e�ԉĞ�"���Q�E�.$JF[.%S�(����M"��М�P���{�nM>xA���y��1�s������m4jO\R�C����=����UQ6z�|���8���Op	9��̑�5N�?�j����\��p^
͂�MT�([�`�U�8��H^�/fX^Ϗ�1��<�����������H���_��T{�]Kv���w/��k�.)���14IN�I{��p�� 54�-%G�9�!̥�b��b�sj����i���}���{�[�S��c���FA(I��{1BN7����.)�����m���������Q�gA$��P�1��]�U�&�+�,ES��b��9Q)�`���s�Ob@���%�����Y^:�y�V,�N.q�_�m��e.�z#C
��
�S���(�B��7G���z�4y��yp���f㯚.�ci���#���	��B�GR#rp).,�b���KZ�rźƕ��"
�N*��=�i�#z�{l4�0���Y�Ŝ0SJ��;��s��:L���a6Jk�Ztu�V�|�b1������jV=.)��Av���W��/�6�ʉ4�>(T�4���� F�;t��3�-U��F�3i��B\��E;.5�����}h\r�[Ȑ�*v�A���nǴfQ!!d�Dd�F	��D=�C6d1[8���0�����u��2��{�S蹧��!�8H�>���k�^�)�v�k��)�B(e�����3��Āy���e��xet��W1<�7�9�3��-52�i)M\�-T4�1.%�����k�K��ϒ��i�q�g.X�/\����rOp�V���v�7t�㏥��R��F��A�^� n��5���>��jd��t���/掹Z���N��<v(�������g5�s=�U��KB\���?V���۵/d�xFZ�=�b�Q@v���UO(��l�P�M%���p�s	q1,-o���cG�`���l47�8]�v!��.\�'gw/���n�i_:�����{b�	r����C��3m�<�bI�٨@����S�o1[X�׃WH3���u<�ec�L�ю��8tg�5��_cuo�.�p!mvZsp)�.�[��0pI;�����;����i��td��7VO��M��3���!�Y�.1�i).��QE�L��~�R�������dJ}IN���b�?�%崐a�-�N�?�ugw��tfPܙ�&nY˅$����5��'+�~sX�k��|籫q��!�w>���G���p�6P#2p��w!c��\
��B�rG�����#RE��&���Q�mA�n<$��<��t��	~�nf��"Ѷt6RBJ�_�Z.M�ڸn8�{�.\�T��m�vt![�7����r�L�	��b�k9��"T�VX��J�Q���My.q^>��C
���Г��RC
�����%-"x�Cz�cjH��i�+�^l~�tp�m*����Ŭ1'r�fb5�pz9i.�Қ_QQz8z����j$�P_�RZ_�
�<qq�K�鍌�|5��>����&��;O(��a��>tg5�s��1��3܋9����;���c['�p��D��X������$ą���qpI!.d�������B�vG��AqsD�H��],o�	�T�$Z�b���rf0���m�2RQ(�伈	|�H��0$�k.�fz#C�_��sz�]�6���Nq�����戌iwz�[����x����������c�07�ڕH�Ȱ�:A�֗��p5����%���a�\)���
qQ@>�TTaP��9AbB��M���q��!!"s�p�^���O��<�I�M��EJ0�Q��mp�q���.8y�9��r��{����
qQ��֑AqoD:T��O��@��Y�L��CB\�X���`��ؾu#9g�(r�>�,�|!��i��8�{��pq+Z5�X{��!�e��szL�?�q,$/$&b:�ta���!�-f,1���N����7nZٍ9��z��[-BĲG^R��H�i!]�)��"���8��L��a<��)"C��DDq������ɴ[��6�hd~:�K?���|���������ąk������4Q�h����ȁ�rV�]�)�t�3��K�qatM���˅�a:M���L�_�le
2��3�j�钨�X��L'�@�������U���P���Y,ѡ��F��a���{G�p!�L&RB��R2\��٫a�����9��8=��LS���"��N�F���W��4�W��X#�����U�	W��=�)$#���� �P`C���L3�]8��L=�w���CϚn9=��L�-b�Ny@�!�9F��d
̰ě�W�`��4q^���=�i,nZjt���lW%�d��$��1 �H.)��E`?w1�z|��_;�uO(�lj'�X唲�&�"@E���S{    ydF���Zn�;���M�G̙K���(
��ҡ]�k7�R���K
q!C��2�C�N��;g7G�=p�%Mބ�Iۇ���Fa6����Ǟk%/���	_ClT^��^9�y�b�S��:�%��B���fV�?�h��s��}ڮ�{#����G1��I��$If�����g0�y���\����(��H���Ԓ���|�b�x�*w/��[1Z�8
>�%�����'=��
��v��hL4�� p�SzHo�KP���U���q��<����5�D�
�X�b#(���s�(S�E�NG��R2\� ���c���C�O�q�cR�q+S8Y���;�n���p�1�3Ƭ��̴�&.�dRo��{(�a�1��a� �P�L3ɹQ9��L�b���{ S@�4����1%S��2VԎ� ����*A�zN��I��,��LKi�b.�3�@��M�c�r����[�$���s�k�$�f��rZ��>���������(Vy	�w�a�*pĸ�(I���XX��ܟ��b����`���=�i 0�F�B����@�����M8k����|�±P�1pI����JN�I{�6�r"Y���^�	�f�������!0�	��p�l�+�����|�MQAj5����~E�i�<���K�i!�QW���{�'�Q3��ᘸQ��8A<_/m��w17�|M�r����ݖ{��X��C�F����y#^��߸�z��p	!��!^=�}�ܳ��_X��*�7Gĉ�;-i�7��Q����3�D��1��6)!3i�'`^�`ƀ={�)�[��{_H�w/��[�^�\R��᧾�xt�cr��܏#�
��;M����ehs�!�-ftK�1����7c��X���?�����k��<y�"-�E��Ójb�z�K�p!CIV]3pd
���]����i��4A�<���������1�s�R-�$�'̤� �}����{ S7`�2��r5�o���0.�i�,@c5���B��u��������H����ڱ3(��o|���H(���l�.N�C�]�
��Ja0�y����`*<Ek�� ������r���P�����p=����%��q;�������Vm�esY	��7��n6���}|Ho��:Jof¦-\8c��.i/�P�0������-��$���q��G�Ǹ���ȸ���g=�����(�<&RS�↹ \M,Ⱁ�w���73!�����c��!k���`I���^D����Ǖ��7.�µ�w/����-\R�9�18=&�����Hg^���*�n6*xw�]xHo�R��b&l��m+��a���\c3�U"D��`��U9.��Ҫ0p��p���U���?J�)<��["��1�=Ñ�0f�77�$�F�����+�1*��|籛5M����z�Q�����6�������k��h����?���s�� c�`���tb��.���������������c�R�Kt�e�O����j�Q��S��z���_��E�ee4���������I����_����J��<�����������]�b�#���)Y­9�*�m8��#����a��<#�I����ȯ:A������ƅ�%��	��`�qќ(����|#7���YF����}�B�2�J4��i����c�73�,�2��9�[��1��=�%��!�oc�=���i#f+��p�&��%��	ӧy�T����o�;
�`���P�'"��V	i�$ɻ�/���w1���������P��,lŌ~+��(�x�R�_��ˠ@Y�����y�LN��	1Ϳ�Q�s����P���\�r��z]��S����E��Jw�<���c7��}U���l4�)��vI��; e�܊v.)ą�jh����_���I3(n���� �G��4C��|t����CBD��������l%T�UhL�Q��[�Q�=SuB�pq�۬\B�o�u]�I��z�}j^�(0����P����T,����T
�����b6���e3���ps�>�fHT���Q���|�����������W�~�}���B��o(\�e�����#m��!�1�Ͻ2f�J�$^�b�d*����Ij�$[�9N�,�Ql���.����5��ݮ=Oq?�׮�����oȘ�r����������NY<����HA5X��'�Կ�+�X�`��{�vLtn-��S�����C"�ض� ^��x����2\<��rp)�.�Ƽ��8�=�) �[N}�_��{����G/�"�v;_�?y�p���)0�f��g̴�&.��1�G2�2�
�=%J�mA#�
e~�=�d���="����).!S�����W�g��L2|�f{Wz�cJ�jkM�L�BΑG�����V��9b��m��3-���0*K�L���� �k��F�o�B�]�)�Bwn�~�K�p����=�) ��k�<i�=������V�����}a{��ը@��l�zL��9�RJ��LK����g��t.��:��G=��I����.㛢9��Lf�X�Y�pd����GN�(S�צ EO7���`%��ckSd6
kzh3-��;�њ� ���A��n�c���u���Pi���w�EE.!�72xMC`,���O7���~Qt�u�A���n�+^%�D��j�p���xD�o��C,Z���<vmڊ�qh9:�|62���NփR\pn��)�^��d�2w��2B}m����{���*b-w�͑��DXh]h�(�5ߋ;�VSL�w'��xܠ�AB�����wQD01a��n<���\Ι�KZɅl��F-�_Rtc��{"�V����џ5$~��hE>\�uB�rʑ�|��C5��
e�g#3�(F��qaU�ƅ|�����|�&�*=��B���X=ޯ*�_*}�*)��zA&E�ŹU ��?�~/�8���г�S�&D�$���fJ)/���!q���K�)�bͽ*%���2:�f�8=��T���9�[m��Ί��ih�Y��%5��X�/\��M�5��N�U8c���.�سQ�x(��E�ΟL:�z��R2\�[����Ș���-���2-^x([�z9x?���UX��)0��d��LKi�f!ӆ�K�2�,��bL~�ia��<(��W��޸�`����%��Fp�����c����C�?�#�(�k��K�8S�H���/\�����\  ���`���9�6���9E��Fu�*��KB\�x �`��B\���d���w!z����?+͠�5"Ej�0�OrD�T�Y<�j�!!.f��F�Y3�y�:u�:O��76js���>�KB\�pb��m\R�/d���X=�b�Q���+�AqoD 6Ϻ$���FO,ۇ������K��|籛IqM�Q*��ɯ��$Յ��7�{�֎����ն��%��!�_ɵrzL� ?/���1!HW4�\#�yv2N>��������ꈙX�-\�jc\`�� \�I���s���z���vQ�������\J���)j���*�g2�ǤL�V�U� ~+�hZ,���2L=&S`�	'I�̴�&���V1pe:	C;����\qc.��;��2\\��^9��L˰kc�2d�ͰQqzL�4ne��,�2�t3E��G��3�Q��`���p"��g��2�s�U�r/�pn�FӜ�%]hW|i߸�,�M�\BNodt��rz���SK��~�E�$�6��,� @
��iL�=���I>�:&�M��`#XNe�y���}3c������cg�����A>��6%�.	q�̸�3�8#[������� (ư�p��9/�ވ(9w�p�f���'�A��bF�DM3�y��sYW�Y�N��FiE5��'����'�x�D����|�ba����B6�#,�ǔ��&j���
�?/~. 1�#�U���b�`�<Zd0��������-=�=��1�T�L YӃ3E0�����2    \(jRt�\J��.v{�םǸ����7���L�4P2��8��ѩJӅ�DSb0���:���3-��!�%Z��=�i�:�M#f���ۚ�f�
��&��U׋&׭G���2��4�8=>��E�O>*��q�0�ULO4y&��k����Zu����cc��U96���2@���E!"n�Si�����q�:�����Ș�6���P�f]Z�+���h���j�l�85��6��"wqW�_��7P�`Ǹ���BƝ�� ؝ �Ύ�L���n���M�&w�F��g�e�������c+����/��j!�1��7.���c�9�{�/� ����s\R���)��?�N RJC��$�bO�{:�?]�����2E.2�F#k��L#�.���F�|Op�Q\LHa�c�����R���o��d��� ��HA��2�|Ȋ,f�P�ӱc��
�����\�\r�?�C�j�Kū�����2\ĺ���)��Y ���q�"�Y�6qzL]BX��i�s�.����@֪����!S`�!�2�i)M��2���=�i������>��JC%�o/�i�z�����%崐a���a���b�w�]zh�;��In_��s�$y��ٰ��%<������P��|籇~eĊ�W�|�����Ƭ��$ą۱x]J\R�MV����!*��0r]����bT<�R�I,�V�xH������3����<���3��84�]x�M꣼0q�qq��b�w'�.�DU8������M��x;qK�$B:=_P������"FO���%������q̼�\߸��(b�{�KN�𳹖����� {6�X��T{Q����fK����R2\��22pd
�~�mzN�)�j����\|0�#��2g��}h~~3cdgs��LK	�_S&|��qdjUQ���h�����|�p��m�$����U�d��rZ�躧�lZS��=y�w�7�����L��b#7?��;n�~s�D*�3��<��CC��ct�l����:��%!.\H09����%����?����ǩ��;
p�̶T��	��F�|5���\�������Bq�1�o=6�P�bxe}OMx�XϽ^[_.\���.!p�U�+ޛc��Gd\_�88=���r�ia`c]��F
<��j�)�!3^�����p���Lܾ�5��JU{6���C_�)�:̩���)��K���=�) ��o��c��r����Pߥ�N����+%�c2�[��<������%Dd�8�=�i0���1�%S��lT�G����$���QV��%��BX��qz|:�/�SW��Aqg~&�WiI��2��R��bF�	4�|�S�Q@8�Ȟ<C������E�.�˅[����9�{��p���_�pn]� ��^N�,$�uN�tS柵y�^.�d��a06m�f<a��{`/S}b�ve�o��;:�K�޸�r8H�����P�.SNz|�Q�Z'������x�L��#�"�%^�<�Z�����;�=�U�w��xrU�堭�nX�������������?���?������B+L�f���l�O�"K�$�������p	��72LR�����ܣ�Q@�Lԙ��;�>q�h-b��H�gQ��w�R>$�Ō����#�߼�������jv�BzŜ�ɕ<}�U��pn��tܝ~߸�
*�g.a��Ȑ*]9=�o��{S�Af��K]Iӡ;+ҹW3���~5�
�۩HzhT���v��qqL'�F_l��S�՘c�9.a���a��j���S#�cڔ(_q��j�,����̈of ��0����/\t�S�'"Wt�g]��{�c-bE����pY^���䄸�g6{����������߽�秿��SC%��?�!�k-�Q}�UI)Y?��/2�BV���w�ȩځ�|�����莚�����­����q�_��!#|�qI�/������n���ɉ�0��������?T~��{�ؕb06m�b�]���^����r������)ՅKrBܤ�4����%�TYc�2[9=>��)z�̠�c8\LZE*�.)a4^oe��~3|99t�`����<L�j�$�EӘ�!�KB\�P����vm!�}#qz�]�6�����Rn����&X⽒�����pO�Ō��H�oۘ���BM\��b-�J�v��x�H�M����S�,\B����Z�%.�_D^��MrzL�c����	��an��7Le����t�/���Jd'G�0"T��P�%�zm�p5^�IǸ�_��ba���Ǣ���Uɡ�c;b�v�{�u$�l$Q���bێŌ�L���df�,��K���!&=3���g�D���ED�cᮊ��pp�
^�������%�a/d,��9�?;�&깝��I75����z������X���Gu6�K_�pqT��j�U��5X
��Kڥ��J���cj���&R��)��4]��+�<c&�A�@.0�����U��B2p�j5�	:�R���(��tR�vIN�9����X��(�����wG�vG�F�r(�LsJeb����y��Z���~s����w���t]֎:�h~��%�/��'��½��/��k+�H��u6����6���hft'dS�����`##4ԘH)\I����p�ڌ���>�/\������1.񱾑1($Ɠ�m��K�ۏHAD����A�!�ԟq@}3�p�t̼��o\�SX���Ǹ��߁)~� ������4�X�T_����T����^�x����'�o������ow��0�}a(�<�7��C�]�3]��`���Pp�ہf�`��.'�j�K�r��4�Q���8��G����Gd�����������E�	:+�.�5,?Kx�^.f�J��I3e��y$%��^�P�p��������%
�6}IN�`x�\RN"_�����{�7�m���#�;�c�B��Ă[�&�C����؇�̘E;Y�1�yl��Z=R%<��\�;ܟ(uI���tP\R���uJ���M�)�.lW��roD�~��DeI�I�0m_z�p��c�j��;����G�%�䀂�Ň=1q/\����	�^�/a�|�Ǹ�����̰z��C.D�̳p^d��p+������a�J2����p�PwRǸ�|B%�G���"�~�vMN1�e.qf���'i�{|j/��rx���1[�9Ӭ�7�������~3�%�^1���9���cu� )���V���_2��M�Ճ��W��E_��%�4��Bu��I�p��H]ht,���t]H�:���w9�E�Jb�W��D�`T_U��x�X<�U��U��qI�����]֑��Ms�N���%��j�7����Ŝ�8z31�p!Y�o��{0�U+;�N�]��g6jP��L�$��[�pU.i$2:���8=>qw���^�cPܙ�UF8ܟ�jH�������bwC��|�GA��0���l�D��y��KB\��z�\Ү!���K����뭹f�Q��U#OX�(n�H�8�h�>�:d�l�Ex3�o\�.2�_oAn���������\��`�|^&��~����߸��j�������"�I��0�odH�Bf*9��<����^�w�n6Z)��G���-���}�I���(`����UjT#粬\jT6��6N	���1ob���L+/�����+%ң:YXG�=��i&��P%9���5�7�֟�r�K����j*��%U����$�V�f$.��z������:D1����)0��eϠ�Os�ی��G��c���)v�І��Ō�i��|�똛
�x�����h��W����5�M�)�����4b*��K���$Uv��?8u@��*����g#�Q��ȧ��nٞ�̔MC\����c�{iҴ
*��y塑���e�A    ^��Ӻ�b����2| aXN�O����P��������GI��"�����w1'���|籝+v�X_�JMܳ,^���KB\��Ij�5��%��>�H~��=>�xS@y�Ԉ��c��#���,���Q���^ꩉ{1c&7e5���>�@Y�:�v
}6����Ŝ����i����2�*P�(�Պ��&������"w��,\,.=H�}�K�� v/�����	v`�j9xAs�P�-髷�淆7(���fB��R��7n\�RY�ԨnB7&�H���~>�����a�p�HQ�����(.fj��ż���3��Z�XR&I���1J<�v��{�V�hsIN���3�4�GZH�z�E[N�OWu�N���Aqg2��^T�gA��n6K��S��Ō�M��P���,h,%�٨	��bR�$ą�NC�(.i�2Fh��9=>]�-
�>�2���Fc�7s��$��$��Z=$�Ōq>��&:f>\�8f��tdRi�ta�Ѩ��̼p�7%km8���.�1���qIS���G������[���o�c�D��FQ6����zk�V�� ��S)l$��Z{qT�����R�
�PB;=��]Bdt~H�pz����D���`�I�Dś��:E[��kh3�&Z�ݪ�`��������<�iv���FPڣg╠�7n�\Ķ��0o伲�$N�O�����Q��iq�������K��Lsof��<��w{C���ʊa��(
c�G^�u|�vpL�\�Np�G܄N>�5.)��:��� j��\��y�#jV�E8;-������!GW��1�	��p�\Pl���14���"�\������;6�KrZ���&�]�rZ�`��&&����O��%��1q��p��T�4ynqKL�!�.f�"�4���c�d!��gC�|6�L}���5��p1�� ��Ǹ�:��+L�8�I�O��o
����4�G7Gċ!1� qo�j�V�^�����3����P�4�/5��FJx(�W�����p�0'����4yy`K�9=>5yH� !S��ʎ)�(m��	6��F�O����>���\V�v�;��A0*�%O��FP�� b��D\��t�*w/p�u=�#����_�]&:��?8(A$�I�$M��� ܴ�vWJ�wsU�`E��E�q��^U��ā�����Fp�İ.9A��aMM���%�d�
�&J$�f#��tmhY�Ōeb�.fbq�pa˞�N܃�	s��+l*z��g#�2`}Q���E���\J��;�����=0>�G��Yo���Z!!�pN�άZ1����L����*3-����;o��{ Ӫ,��A�hl4?t4��ڶ`�b���<���B���ǧ��E����q^ʝU���!�ir/�^_�Z�-f��
!3��<v��_�^9��?=���1 !_���w�0p�������(9=>ݟ.
ȽUs��#b��XnӐo�1�?2ϱ���S�"]��|�?q��
>w	��=�l E=��K3��]��qpp�
F܆�~��\Ҕ.d������?��'Ҵ\�����`Q��Sw�-ц�"J�N������n����k�Ԩ.^K{���]z!wLB68=�Ѷ``fH��ʹ��F��%��@Ёa�Rk3�&Z���[���%�[m�ˮ_���)����Gb啨�7.D�G���0od($\�b��$J�M���[�c
�4��A��M�Xoa#?a-���ڛ�@8���|�U�N�g4�X�`�����lƩKB\�X���Ǹ�2���D��I�O��(�<���L@e�h����4��_mxH���$�f�c�D�\�I�NܯFz�~��X�����o��~=z�F�"�M����5�r|$������!*��/
��rp��������������l������oLU�S �dK2�w6������vHIǶ����W��+�N� 9��W�DipƟT����X��~O�z�UNv��<g��`��*M�v��>Ϝ���x�UΟZҶ9�LM��&�(�v�U;fݲ�p�3�o��z���s(.��	������e�F�:\*~��gr�;C�6�Z����f*N����&!��)�D�����k���-��cT�
�;�='n?կ���l��i�o~���Q��K
q!c�Җ��S!.
��}�W:��9"EH(5Td<�$ƀ#W�CB\��SKf0�y�b�m�u�+y��81���'����
�iw/�����+K��%��F�IV�7�3�o2~&�y!�W��B~Oب��G��Cz[�k^6�`���µx]`;�8�Y?�3OX��y{6Z	}�\��pa�k�\J����%l�ɞ�����i�Oe:�?f`4b4�97�0�c2���ql�fZJ��U��v8�^��K�L�l4�c�!�u�$�����5��K�i!�C�=rz�mZO)�DP�}V�3�;���M�`��P�&���K���d�w1�TQ������,��t�p��+6�Ӕ�;/r����G{Ϝ3\B�/d�4����'=>�����{#G?��I>-R�zK��G��b^'
����*N�`"������&��&]�����q��[.)ą�9r]���
)���J�AqsD�����ɝ���뇄��!�?Y���.B��!c���'l��"�Y�++�7n��8�;��q!~#}�%\B�o䄵���x���z��D���$�����Bgt������Sq���]�q1�LR��K� �g%͕�ǔӃĞ�T���.�p��6Dj0p)�.�/�\�2d���T��P�qw���4]��p�1��A�7:����ĵȟ"�P���,zI�i6���/#��2\���}��R2\�忕g�����F��?��ܸ<�ϕ6޳�����ZyL�����ŇΘI).:R��2�)έ'��:��y62�k<��+�%�8�����(_����1��˨�m�3�;˰���ii���QX��\{��.f�v&[g0�yl)�Jۨw���*�Z�d�s��������׿���G�����G���80�($�#B��I�È�Ď�	7Z.)���)H������W�wF=�C��J��o��-y�b�3����c�ާ�^�7�!�g�$��D��%!.ܶ�f.)ą�!̭r�υ�( �0Ŗ7Gd�% δh{0"�,J,���ڃ-f�����I�;�= Q�B�	[(�;�Os�i�V�2:O�{.)�2������S!.
�L�Ž1JTL��t%��'ް�@��!!.fLdݵb0���.\�MB&�=�Quա�P�.Ā�H�COpw���E��R���2��Ǔ����.*��ZE����B��b�3ۥ73���H���k7�fǸ�v	~���?K�S��(�,�d�*S�Eo��<��)�B���	o�c��2F��9=��L���b'n3^���N���d
���≕�13-���CC���qe�{H��ՠI칓�� �3�5��s����d
�x^��b����ܤ���e_��r����s�_�)�1��Wf�dcc0�R����+����2MM480K� {6���ݥ�(S��)4�h9��L����{ S@�����?�i�Aq��4���F�Y!��1���3&�̴�&.|�1D��=�iU�Pb���T5W�XšuMN���~�.-'D��1J����&�M��Ս��[�����46�\����$��w{$��3^�d��wۂ�m�w^r�V��Q��ֆV��n_Y���B�R�\���T�/
��AqsD���ٗ�6a,�R	q1c��Z4���c{3_g�ע���l�kUi�.	q����2���9=>���<��戴�ӂy����Q�������h1C�b��1�o=v��U����Fr`��oׄ��+?��������)�#9o���=T��P`��;��cD�ͻ*4�N[�G$���%���a�=V��t�	    %�|4�<ڹ	N�P:������`��pi�.f�/�x�K�B.���N�?�N�;
XĔ9w�;B�n���C4��bѰ+����p��`g�P�.-�D�l�D3�~�S�v����7DJ�Sܽ�.t�Dbᒓ�B�XӲ�ďv���7��H��m^?	�#�~Ŀ������"�oڇ`�+E_Չ�[�ht��R�
��U690pI��B^4�����*����Q�Y�폾ӣ:)��Szh���q��g0��k�*����?k� �	)Z����(�Q4sM���qn&O�q	�"���r;¥��B�lu�IN�f|4�k��*I�i�.l���{������M���,7�$O����s���\rL���9�Ԙ��������a�b����S�S�S�"7uɠ�?y>ſ��o~Z �җ�8 � ���R8ߦ!��G��L���{�dsb��4ۅ�c���\a4,�RF��������K�C\J��۰�U����3B5���m��9�Г�l���T
�1�s�̞�0�i)P>����#�ֹH��R1%�ND�!��];n_�@��C�#\ZN��:�p���F��^wNY&nvҋ ]j�[��O��,�.�$����c�[
�g����H�ݷ���+�ko�����q	!��S�@�����p2!�c�{#ҡ�R�:I�!���TS�!���%f�c�;��s.£`*q�� |��^�KB\����V��%���!F<�υ�(*�6����9"C��k��ɇ������d��"����H�q�|籓�j��)��sVU�n�%!.\L)mSb��B\Ƞ�2����
qQ4\�����-F��+����k�o�^8��*���s�,|����ʌq#�V���^W�"���� ������)^�OlnT��BƋ���ǧB\xf���Y��FĨ��*�t�|~ ˹�"2,��I[|��~�9�9��B��>�b5J�L�a/X�/�U��k�^�_�x�R�>�g=>��d����=��9"C���:W�.\$�i���3�*�0��<v�s���H��Fq���+�%!.\����K
q!C�}��qz|*�E��dj?G�P��.�J�X%M�D���'��3V|.�1�ُ�/�)?�/wRe;���^�*���0�;e��x1�%w#�7n�R�Y�Np��BV(�}d�Y���2.�0G�	��w#����zds���1mXT��I�nX	G�:eğM�DT�B�y6�	�tQ���Wi���d
�a�+��2�.8�9=��LM
�׃A�����呪;��1:�mE�1�R��<�焑�{(�i����A[��(�@�GA��!�4W6��K�p�#����	�L>�1<��?���"�7gR�6޳��dc��d
���K`0�R��xL�a��2M�9H\��gz�.�V�ih�C��q!��.�p��3p	9����2潓�Y��W�_S��w"'�e��ɃvG�s�V� �g����9a6��a��ؐ�s�v%R0���(��.
qf���o9�����P&�}⛳�)��G7�A�}D�l?����Ք1�Gd��0������N���~���>���'��;c]��.�;OcN2
}��E!f,`wL��u�{ D@�0���g�g=� D,#b�������p��[��*\��I�"0'�r�<���cC���[vyPI�u���&D�E�}��3\Z����f��)��Š�9"]T�b����ۜ%�iV�����/��V��b+�΋f�<.�߸P?~~7��{ �eZ%F 8N�/)��,Eà�9"Mp,�8��FU�Kr�?&D`��w�N1���=!�|X��da�v`52�� �7���W�.^��dOp���_�s�''=>�"`1K��<Վ�A8�W��f���B
�\czd�R�<�p�0�#�g�2�a�\[����[��Kf��ZXȘ�|�I�z|��E>^%�33�P��B��./}��&~7J���D����ZQ�qP�E!�؜m�5- .L����������v�EN�ϵ��+(�$�9�K=q��X�D�J�w���w�	�B"� $^=��(f� �4���č��/{.�D���I%���Z@��wo��--X�����bR�ɳ�+�>맴 Ez����+�:�~Q���[w�����Z@d2���Nz|���pnCaP��d�m �L'�g�0�D��ia�{*��JP!y�Ů�E- .�C�ԕ�{�@�%�GN�/h)&{��{ZCȊ��|5Ҙ�C��|+­�u����݂�/���?R���Kk��m������7�P�[Z��u�'��&��g��+�Ǵ ���K�[��Z��K�-p~�nNI�kB�*��4��������ku��) u~L)3(n��BwK
�&w"�N��k�1޽X�`��ر�}���l�W�<6H%�`굓��^t9�������x��U���\�H����P��{_Ir#2�� ^��SBDf,iJc0�z�4̜��5k�<�	�U��\�����8�(\Z��la�[�c���)p���`P�� 
�iI��Y[c�i�"2c2L�~�9��.���~�^�Մ����vM���J�u\Z����sm���s!.
X�4ɡ�7"s[h%���J�h-��(6?&Dd�cE:���cWoW��,i�U����w�l�&D�ł���s\Z��l�p�VN�υ�n�����#� <B���#T�ˑ�!!"3����̷�f؊�J�zAv��k�zM��k�>�7���������Jrz|.D���1RNR�7Gd�48��@�.&H�
Vە�)!"s�$��1�o=�0���N>�0i�[t�ׄ���f�ub��BD�iw����\��g]�7Gd�Uk��i�>���:�SBD�޲��͒�w;�RE�������Q���{��F\�&��+��B�*l��^��T���4�AqoD�/,��Hr<��u�zjj^��Cmb0�zlm�\���n��u6�s;i���f.^�k���""CW��qz|.D��{��E伔�#�2,�*e��]�8kO	�1LKџ��Ǟ�3�q���-��/^��e��&D�5c^;�""C4m������BD
W0[�cP���Ωcsl�ISs�^܅/Dd��؃ܯ1�zl%�!1xT���ܴ�%`V*�=l���IQ���� ������c�2r�DqsD��p��{.4��
0��G%v����e�+���c�y1/�K���Z,)�	q1�j��K�fg���s!"��eh���#��k,5G����ј��+��\W���`���)*a��4Hr"��E���ׄ��3=V������A�&wN�υ��r���#ⅎX�<ٝ��Px�b�S�P��s���[�]|yݬ4�b6�?`�(�H	q�*�l��2d^r5qz|.D�� ;E�*Q��9=yx#�E&��W�UH�1!"3��u}f0�z�6kȺ["m� x��qF6��]�T���� �""�e���BD
<+�]3(n�H��R4y�_�=%Dd�2�YV3��$��2��I�rlW�֒�� �7.��5��%��F�\Q�Hq��!~Qt̝ˡ`�K]�}
���A�ϕ���u�$"o��Pվd�	3��!C&aоԴ����2�~1�+��޸��Q�ǸD��f�X����z�M�ч��������<��9"c���]����;�,����~)��`����+��&\���LA��=�;d�Tk�����o\�NR�0����'���z���I�ٮ`��r�t^4L��l~8��H�����Go\��Y4��>ƥ�'��i�J�n1���i���v��^~�B]߹	Kܽ��B������U�z�a/��R�g��{��P����}pR#^_�|$Iݛ�C6��[��;�픯�b���/׼���Z��Bq�/\�������p1�el���_Ȑ,-V8=��K���^.�io�;�H�n��ц���3�#ꭝ06m�Z���4��^:3dk�����49���    �J��/܊G���p)�.l��h�LK��Q8=�d��V�r��ؾ�ʻ�7�C|L���+]h�������tZ%3pd�3���l���F>z���p��GV���rZȰ�D]���փ�;
(���t���6q��a�{�%M>'WKeU�C�E�^��T��Ɲ�tp�V5M�F�5���"'��2��v���|����U;�%�B�7��uC�zL�K�6�r"�0�+Ƀ�_�e��m1'�Z���Lش���RO��{Y�H���XN�ڮ�F���+撜.V��"�'���2��$5<�ǟ���( �k��3(����_Ny��_��h'��~3Ν�53��58y1:ƴ�k��Fz��:�2q�O��0	��*w����j����BvG�ypZ�s��#��$�<�FX�"u�����J"�:���z�*��J���J"皨Q�������P�t�pVg�_;���\�4�eN�?t��/���t:�������nﴴ�)�m^a��3fD�G�M2�{�>S�nI���ł�@���|�P3�@������n���ʒ�w͢&���&�_����4Pu�q��z�M7�ؙ�B�P����f�hr������7I�/�(�r�	���c-��sך���*|!ߊ��"1#[ݡ��&-?����|6�cyIF(��;+4�Y���(̜}�����B#��Z@qoDFc�9��B4Eo�.���SBs��h���[�m�۴!!��d���(˄=�5!��ͧ�� �"�ɽ)��$=�,DP�~?ۢ7G$o�R�<y�42,��,"��al7A�|米Ru�?ieo�a��̱E��z�����5	��'.�R��qY�O�#�r���=��og7�4�A����[�(��v�������ߡ#�.ү\H,t��lT.����ʑ&����|���+R2�^i.�o�A�y\� �c�N�4��䓍��F#��q�C6d2cy����|zf��%�14Y�˞���Z��K~Xl�b���tQ���fk��r2%\܊��p�����K�����1�2�,6<�U4����c2%f��;3/��㕓�!�]�T+�5E�4���+͌w�-	6#S�$�Y���t�R�#S� ��)��1�������T����ɥ-���th9hT~J�`6p�A��Ki�R����c��R��6���@�6��Ȟ���P�t���Kp9���SZ��.dJ�g&�1���_�t�����G�]�<ꛆ��)1[�.�$`�4p�R�C����3[���)v�F ��w�+S¥���,��dJ�n��܅L	���!z_�Թmwp0��5���RF=&SbFg������E�b&W�\F�u��?�j-R��y�id���K�~>���!c�
�S9��| ��Ӓ��|�Y���rc�t^zP1q��LG����L��Oy����`QM��=v��`���r�4fG޵�B$\T�+6pO��!w�A��C���t5=��}RL���>Q��ѸS���B,A{[�cB$f�W#af��g�Q�4T���>\?��)yo�G��3�"j4�.�e�DV�O�����3
��x+�;:+��Qg�>�t��H����?���LK����'f�c�������)9�10x7��N���ѩ$%�=�7Rf瞂 ��>vVI���z��J�K���A*[#7���z�F��y~ =5����V�O��U��R7��1%�H������#.7���7���_���hs���S���)].ZzA6���2��M~Ć��=�7-`>]��p�9{7�p�E���U🋭s����R����H�d
\�Z+�%	.#S�"7�ڝ �7=@���K�����=�ic�q���X�P�W��O��4+W������Isb��'be�7���t�]>���!��-�詜^�t�X�l���^Ȥ�r^��c�/����("�]@�fQ[�lGQ�孤�/�a.(�8yrJ��Q�s�>�%s�i3m0�z�8��`���y�ˌ�AʩkBn��g�YR�qy!���U�?��L��	(n�HJ !��x��$J�xJ�`Χ%Z/1�{��-���+9J�H>�v�(D�E�}�\f�Bƛh}���M�ꔂ��TRP���%�����hGAs��cB,/o*����oۘߟv�O���V���p+t��̀[wJ\��MdJH�u�����@A��ٔC@!?, �����͵yO0/X8��B�0�{�O��Jg��V;(����		Z��Y�.�d:���Jz|A�D�.��{#2x���Zq<y_�~V#���kG��[�M��s�Fg�yFm���!�xM��EUx� ��x��DS$=�,DP ���M@qsD�f�B�lǓ����۞A���5�����t;�ų��jlgG�g�'pg�����'����=������L	�nA�c����ߧ'�d�A�BC����l�ͳȋ௽x��Y�� �e^���8�?���d|�~O������ $"4�.n����w߿�i�Q��泣�?��ֻ�;���T%�"ڏ���9���.ʔp�<I��ɔp�\����~����d�A��/e:��kT�����H÷���L����d����������E秚.+�N2�'P��Ӄ��HSu(���"��pQ����^�����>��ג�9mO(��!��.�/i&n�"�H��x�<�R��Y[�aF������cW5'��tc���L�	uFR�\f�}!�uY�$=~��O)h�S�P�;�h��77�BN���ǄH̘��if�Pk�*��۩Xwcj[K���%�M\�"�m��n";� �J���nRx,�uPܑ� ��t��O����q��tW,���w��.a�8�ɕ��ǘ������/\��d����A�c��%=�h�&��U���戌�af��'/[�|�٤�����<QY�{f��!��B�[P�7���,��K���W��Hp���d�S?��=^ۻ�(P���
��􏟸E��z���Q��@��ٟ�a�l	1�(`��ش/����i��؆�@��5!:7�H
g��'�p���dKz�T��㵽����#�iL�'��#b
%׽��Q	 K�)!�S~�Q���w~��
EQ����?��,�^J��d\�D�Q���; �YU!Hz���M
T8.Q@qKf~(;ٹ�O<�+z|�����Li�⡃���c�A���<��O�A�D�kB.����2U�͋z��ށ�B���#R6O���O?�i�JF`�yJ�`��/�n^b^ػ�Ø��[����i�7mB�k2.9��� ��w@������~��g{����j�-�EO2HKz�<y�v
'ζ��df8���̷��W*�~�ꕉ�)g�/
�p+e*{I\��Yc帋z���M
dH/U@qsD�xɞ�x��E�����"�g�wu慽˕�iQ�M'*�(8��k2n�C�� ��w@&��v%=�l�@�K���T�d��R����>-a����4�)��̈�+�+	�Ǧ��5��7����	K������]*-pY!N�aBNKz�Q�����H:sDʦ�åTv�qPZ)�w~���fC�
�����cU�G9�r�Fe�ڍ]ε���[Q�.;�N�FC�4����x'Ł�]��{#��O�裱��y�%L����1SXB���+fn�U��˱r�H!�Och�6���.�������{!#7Z+��{��@�u`�wk
���f}���5��c���B��="�3��B7�[�M���R�#�>�K�䳾&D�6���_���w/d:�H%�z��޽(:��ϝ?P���h�jYĶ�χhc��V~J�`6H㡒�ya���������Fz�Z:R�]�&3­����py{dK���ǟ�(����?PܒY� G�Ǔ�ͣ�{2�)��y&��[�]���)�v�|��ݕ��?��t�����Ȕ4v�B��ǟ�Q��X�(n�H�*
ru�x��r��O	�q��4f��MQ    D�^�=�Z2�4����d6q��� �e��Dƽh�]���2�ʞQP�S�VBqGf�ܓ��sK�%Wz�p���){7�g�̷�Ը��PÃ��F��E��|m��L�c�{��B�ƧS��ǟ�
�zjJ	(n�H�<e�������"m`�O	��JY	�o=v��'v�TV0���Jd[�&D�f�i)	py!y:p�&��g!��"߃5��#7����]~��ؑ�3�Ǆf���u0�z���V�"�48; ��6ׄ\��}py!�p���"(<�� ��9"mYD��ױ/��T�SBsCz����Ǧ��ێJ��7��B#i:.��!�&�F��񅬨��9�����B|QP��R7�5Žiz�揹��6v�C�;�s!���<���[�]����y:��(m�ެ�ׄ\M�}c� �"�mv�$=�,�I�(�n7G��"L%�[C%r�SB$fl\S�A�|籭�!G�e1�!����j��]F�������\��åE.+��L�c�����Q��_�-��D���ū�t~��Vm�H����!�~��Vs�t��#\yO�ڐ�"?{	.3���b�12��k\���K��!ugCJ��;y��t��Jb#�k���l�U�j�Yp�\$j��p��m�YR�0���-)�e�qL*�k2%\T�+�+\F���j��\�� i˓J�gy������.^��<&�d�Z�<L�����IF~(��\�)p�
ˮHp�!.�*�#py�d�s�����Y��Ƣ(!��]��������<ey��Q��t3g�K���� wey��3�P�����֨�_̾^�)�K��$��L�K-�d����I�Do�;�Ce���V�R#�g��x�򴮷J3}j��%f#�EM鋓	pQ���]��)pia�[,\�� 9��6I���<���jFf�}� n�����7���v�(Y#r�6��dU�د)p�&�{.3�i����C
d\�*ޮ�z�ݐv��Wz���e�Y�OM&`&���-؂�3��m
��� w1��},^;]Y�Z89�Ft�J��oF�L'.�ɕ��\��a�lZ��N&��1�RV��&���:���t���K,��L'3���n+W̬����\�ܕLǿ�dO���L?���Z��'S��Y��Jp���-	py����0)/��w2Uǘ`��ɕ]�*j���\� ��ƈ�]�Db���6
*�w�qnH�KK����2C
�:��^��N���{I�Kz��9�ܦ��	a������j�<`>(�
��|��Y��e%W+�]Y���:�2�ߛ�}�'��޶{�L-=J[)	.#S�R���\���(S�z���;�c��<�D.U�n4����]]�;��,u��f���B���{��)p�X��(�.3�����.��-�.~����;����-6UX��:��t������!жϰ�C��Y��{�3U���+����u�<읝�~�e����&S�z�U#�ed
\��&���2�	��$=����1�z\��N��Ȣ2�ۅ2oy蠴�yn�?H;�0#�l�8���m	~��R:؝��xK���-�D��kS�gy��cJf��Zj�:�Mڧ��'39�G������'q'�1���pW�'���J!=���0�f��5���H�L��_ٛ�%.#S�R��;�.oy9��a$=��򄬷9m`��@��y%��5OӞGȠ�7j��:�k��N���Ke��)p�G��$��-��"G~�[��;�͘��V9x�a�-"�t~��Yǲ�����/��gpW�����N�5�?n�F����X�.��^%��L	���pq~���-���&V~J_��;�C�6as�zQ����w�1�3
�w~q�`�4pɂ�}�ܕL�0
�����bS#G��\< .j�*�%��L�����[./S SM�Q�cN�:��4�g�t�����)$"�N=%S0�ef̼�.*ɦ��K�~3��_�t��{D���� ��N��ɔp)a�xL	�B���Rs��)�#P�*�e���#�^��`FX�퇀���������.�]�tX�M#�ue=��L�8����yp2U(	.#S��y}6-py����2�'���fgz�>�h�����M����\��53/������&�]�4��lclx�T�.�T�(S'����
��)��d��fr���)!�dj�����2Mm�%"R�9��Q�OT��)1{Zn8�)f��Ki��{�J���i�4s��R�Z����o.M�L�O�>�\N��Ka�˟��]Ȕ�Q��w�^��K��8^P>;��g#�������i�If^J���Ɵ1.p�2mm,����J�9�"�vq�܊���%��L	y,�BL<�B�@��C�%��ʴ�oƾ�k��H�ǞBk�ɔ�)�F���y).�E+�]�4��mN!	��d:�Mwx8V{IN�19.+����U��HǱN;����n���N���͔si�O�6��JNO����P�77���t��'gÒ��)��,�xI���*$Z)�B�����J{I�/�BY@qsD���ʡ�����
(Gr��x1�u`�Ê��c�|���0[�	��$�+t����'p��Q���s�O\=㓣 ��D6���$���m���=���2��<�hT)�����n}2�$*�wb��L��\5S�F����k�7�5d�5�(!m����'.�y4{
��edZ���;2Le	./S ӇU{���w2-{���:'��n��c��O��'3�E�̼�.\}����Lǋ�V��Y��zhD1e3c����.Mz�0��ָ��� w:h��M�I�Qt�ʒ���7��I7M���<��R��ly���Ŝ���0�k�{��i8.
K>��J��v��
�p�j���5�B��L���3۾=~b<���쫀��8�NХ-ȀFv����|J��Lix�e�6���<��w�j?���h�b��bQ�����ȵ�D��G�'��(I�?
qR�A���К���m�O!qNphT��������ҥ63�ow�����*W\4R��r1Ǖ��������2�.�_���A���Q�cn}h���Ha۩�pl����,J�͗|Ǐ����;H�yRK��^R��ɫI��)p�R���o��[$ ��t��.�1;��lH�r����h���ܦ~��>�d��8�2{03��K�C�ϼ w��7M�y �c��DS���eJ���'��Kp9�.�� ��<@6Ⱦb���_�T�1T�bч��M�t���c2%fr�`�x�̼����)?3/p2�P�"�G����F�?�c˒.�i�b�Q�!�e�4�n�s����:,���A�T��{�;밁7M+�t�ʓ�MU|��)�Nf���;��Ǯ꧀u-�%�P��~Q���r��7�B���lUE��B$
��fv����9"~s�xr7�,X1���9��B��[��-��#�����X�t\�`'.E���!��Hȉ.�#W��C�?qR ��n7G$n[�G�<l��fL�`���%''`��أ�A.�=%���MQ�~)��E.])�� �ݐLd��)���HT�)ׅy��#b6��n���a�>���)!��U:�]�F)���VњrM�ʹ�����Z 2�G����&م䳀��ȶfh������Vw�ҡЄ��w���K<��O S�x\<ß��ɑ���������Y���Z�*6X�--�=m�R$��'�Z�<�O-ٳ�~�����*n���f
�k�����.�=���E��Ȯ�W��"h"���J^�c�����2dw���g�?G�w��.��W	.��	7�Q.�qOd�"�%=���ۄ���/^|�*dfr~�[#fr��]y3s3q)�<�fu��8��޸��3c��w4��\�6���x�	.#S�R�hm���a"㆚��[��;�Rp^G(�?,KG)���>�d.�x�%��U��r/�p�ʔ����(��\�����ǇL�A�_5Bމ�}}�>������.`f�a¥����.�C
�`ΰ��'?�&�(S¥C�    �+.'S�u��9� wa��	��V��/e:V�ҵ��F��#j�_<�RcKM�˽x�šA]���]�B��1Q��/_� A��
?�F��:s��c�����P{0��0�V�G��.�e��l�et��9���(o�ju$��Ƽp�˹�<��e��2n��?���^�E��H{�
�^�pC�
�`B�A�9�Yw����Ō�V�&�Ǧe�vH���I��}V��	7���Tl��"!�JJ`rf}��!E�r�U���c�GZ��76�
JS�Ǆ8��2H�U̷��~LW���W��E�R�5!��,��py!YQ�	�⤠L(�I(n�H�tBb>�x�iC���w`�\�`.�ػ)�{���V���c'�#7��/
�pݙtBk\f��BFz�]I�/���3�5k��#R��P�3-�\�jFbB���L���
���똚=B�{�״ \�C+=5.� W$�m^���Z EC�&��--TC�	��م35
B��<���fDh
��B��>wA�����Bע w�B6� _�Q��(�C@qO-�7��]��c�ڑm�����b��%���WF����F�kZ .������L�T�qhI�?k([��5�--������9;�����q���i�����(`��خ۱��y����h�Q�+e`^�)/��\�79y�\v5>��/��%=�⸋�J�v�@(�6�nX�LN5ž�Q�^<�R֥��$��^<�R�RX��pY�2��q�9Kz�틯[R�����t�QQ�]H��dFi�^���9��t\�6��9�ߕ�#r�Q�3�h��e�%�N\�q�kw���2�����r\�>Ld���9Iz��L=RDi$����v:�)���/�pqb��r/:Q.���Y��a"S4Uڍ�����7E���өy+[|��b2#���%f�&\��\��5��>�0S�'Wy�&?��t"|�(S�%w�T���r2%�##㸤��@�VW*Kz��L���5u^��jUS���W��R��S��r/�pCEu�(�]�B����*��/���pCBś�J��<*@���1k����7L��~H�ܥ}hf������x4�p���_�)	�4=�$��L	���sڻ w!S ��k�!��2mn�Ѓ�_�F��[]�2%�D��G�f^J�
)Q�G�܅LK��x��Yc����՝� oY 9M��p)���t3�Qgug����ǸxFQ�JH��;�ny�rR<y�4LT�!�Nf�<V�6m�|��h�)xK;��$�g2��õ�w�?Y�Q��q"�/TI�߄8��'8$6�}EqsD��`��fYrg�L�����d&W��t0�{�a�SG�K��Kc�(�_�=^��͊6�Y7.;�Nd�ԯ�U²��HHE�����P>u�n/��c߄���xL�Č��{>�\��+*a0���,�����ew��d��Օ �����h�j�~��g���@Ņ�
(n�,��i��͇<y�T��B���h�ͩ���|�m��ѻ~Q�O��d]�.�@�p�8��o��Z ��s����0C#Je,y�>&Ȃ�������XR�I�|��X{�%�f�
%!W>�����KÔ����"���vg%=�,DP��ވ��!����Y�lt�=%���Z�-���F�:�[F��5- ��E6�5.o�� ߂v/��g-�bf��Q@qK5������ՖQL�-5�-3+���[�����Ͳ��f��ҩO��ډ����R��B����"(�2��k�Žqt#X��B����$��SB$�ZG��I^1�y��w?w�{M5�ӄT��/�N\�������\��>rN^��κ��)!4I��#]gN�tR�܁�g�:�o)Ҙԝ����M��~�,�hdP��~qH	^K��\nH�Of�#� ��Y�r:$=f�Ԟ�0��1�Z������S���Lb�Ϳ�3s�>qqڼ���2/�Y(���m���(�<��~�L�;�����22.��J�Gw��[ 7$�q�7�L�Oc�K��������f6�|�> �n���"\����l���} 2�j��}��߾��5�0��?B���4�?�������f�&\�K�*�]ڇ�,�	>���%FTO3�L	�B��l^�r2.���=�%܅} d
�@	�2=ȝك<���FpC*���/�pq	x�(��^<�tT�U����ˇ=k%��/�m���M�ӵ�9T���1�@�	�s0��0���_l�pW����N�Tb�D�"<H�Eg���l��_��p��.?�UU�����8S���;�Ve��� �x�mC��l�
���q�	�y)\7��� w)S(�=�>�h����^/ʔp)�D,�����dJ�4[ǝ_�.p2%d�p����K��9��hd�����dJ̴*J�J�y)\�:�:	p2�ݩ���Uٛ�N�i���#SFN��ϣg��p�U�D��U��,��ہd�g(ϙ������ ����7�Ē;���Օ�����d��?����c��X�]�V�F*wQ���蔢	�B����§C��B$��L�{��)d��Ccg�N!]粮�ǄH̸(�*����y�A�ba�Ј�=!+T��|��te<_׸��B��To�=� �
�df���9"c{@;��j����h{�C�P	�:��ƍ�f��ݲG�\c/j�p�7(ҥ���-rox�,��-��#M_�P���P@�T�q�?�<�i�@������y0��옍w�Y��z)��q���[��Z 2���������Z <|�����\�tGm�xsa�wA�A-�͐�k6��o=��)1?"�;A靶�t�e��&D�6��8� �Y)��q�߲����'EG��"��9"e;���ň�-�a�hӞ�_]E�nv�Ԩ�W�u�A[��騼�X��F	�86�&Iz|AD�8�޽����~��)?M��J
q��?�b&��w	��6�"�h����l���ֽ�kB$\�p�$���L�+i�%=�,DPP"�l�.��9"��6��'O?~-o�r!s��2U�|�#�WF"�����͒ȵ!w�t��"B��.q�>q=m�Z�\v֝Ȱ��yI��sW�v�����kɟ�sthd*궺p��O�L߇�M�{��'nAZ
��e��q��Hz��'�#�е�<]�v���Gxj{<���!���C�.-�K1]��x��1c-�+�=ل�`��X�nG�m�$��L�O�N[��=6Z��a"���3��z��L�ћ;��(�R�v�
^�k/��V�n�2/�~��	9���.o��_�����֐ݟs��iT����9"�6&3��Ҋf�� we�0&�T�c�j�\�~'�`eJ�T[#�%��L	��@�\�> 9��ZMZ��/eJ^4d@Sh�LG�43{�>�e_��I�����\��.ŗE�X�=��>2m��%�_����:q1�P#��X�c���#�eee��7L��駤� wiZ��I�x�F�fg��|q� \�P�h\�r2%�����.dJ�T+#�$=�R�-m�V�s��Ƥ�QR�?&Sb�����"`�4p��z	�R�G�*����������2?i��d����)pi�u�.dJ�Ȭ�����K���-�R����������L�����r0�R�t��n����fI�����UAR
smU\��LCಫ���i�4Q��ݟQ������;�g�:���śk�NGcݠ��d�ۙZ0�{�h�עp�ΒǱq���)��nQpK�M��"!���ʿ
z|A�D�t��H^�������׊'���a,^"1�9�(`���Ðvd��ىp4jc�D�d��H��;Yr��D6p�
����H���](�HW['W�R�g�)AQ���:�Zx㏙�8�Ύ�����a��pq�س�.� �ϣPA�?k�es>��`��L!c�;5S#qk��B�i,=Q�59n^�(�&��*/-�'n��GA�{�����s��N|9S	�Do�|A�����}%o���y��(S^�    �ެ_<���I�{��r/�pqy��!�e?��#�v��x�
t��o_�ؓQ��������2Ji�طF�Ǽ��ff�3q;RR�$�]�*)�!a�o�wL�fV÷�ݜL�K{T�Kp���b)4.o����&A�R�Mс Y����Fa��P��ڋ/�p��C�˽x�MX��$����)aIL�Kz��ϣ	������E���?'3�;��7L�k�R����).bQٯ��S��k׮A&.��g��~�� ɀ�\KN
���~�+�;kɦ�ٲApA��\�Tf���)�Nf�����]1�zl��fq)�;�َFc�M��i��<'n��J����Lv-7v�����>���c�7G$�)�]����
J�'���\��=,_1�{�D7+t��</��و��OG�(D�E�WY<��N�w	�!i=��rsD�f)_n���m3Jy��1!P7�O٥ˊ�K�=~E�bw�s��>iV��\&I�k�K�R�&E���Ȕ0��vHz�Yf���M�E@qKfv[� ��~FԨ���1O]q�Mɱi�L(��J��)Q{��E���.?�9#�>I�/h��-��������)}���jݏ�Mf?KG��+Έ�f���0���3-�MI�H�(j��7J@&w��.��!�Ǎ�-��#�f�}���!O�6>%D�¦;R1gv�冠*����\CW���a�+\^��s�����@Ayl�)��rK�2kR�����#/�[��;Z�
^��
������7*7��~��hԆ�$7�~\q�}��D�l��{&��<HN��̺/dʺ�;���C��8I#�1,
�踝�#W�
?��a�LNb�QM�E�H�"'�q����CJ�GC5T-��4�qBޛ ��Y??�Ǒ���R}:�C��2��I�����gr����4�5���7�K�\�p�~F4	ok4���)]�)�R1�TT��r2%�D�І����]XBƽ���ɴ� ��:��US�ZQ�I�k/�pr�{&�\���Bwr3U��� kx��(��/���%��ӵ-�-<e�<�w�0s�0p�'ɦC���5��[:�;�;��F;���P.ʔp���L֊��L	7�^�j.o&2�A�%=�R�c=��V:4/��H�
׶���ȡ�l��r/�p+�����@Ȕ-��T%=��ŏ�;B/�Զ�#�\���b�\�0��0�ҽS�.��xQ�G����F*+dN�e:~|A���r2%\\=r�5k܅L���'G���K���7�#�tj�Ee�s���"�^�������`���Q����N�n~����h4� ���Kr��sխw.;�Ld��}̒���h{F��xWN@q��c�-Pݮ�y���<nY?���L9�s�E�|ﱏ8�ڢcOzF����皻(D���
G�.�H����$=� D� ǬҊ���6/�c6�'�5ȁd1�1!3R��P̷���!)��ɲ1��Y����%!��q�� �"�q�nm����'	�G	��i�q����u^YĠ�SB3��(�5��>�4�"wÒf먁�_\�M\JQR�܅	��I�/�(�U��#��Nqo1���5Z�Sݺ�ǄH�T"0����<��K�B'r�*�[=&(�i�(�ډp+-%R�U�{.���B�t�=.+�d�fg����Vƞle,�[����?�h4��^��!�M�6SbE3�ݘ�����
w����y�AyGee�t��Ós�v"7q; �f%��Lͮ�҆�&+\^�@F���K�����)�^PY�x=�G#_;�G@�Z=(��Ki�"E�� w)S�6o����D�=���eJ�1p�Hp9�.���.��B��0z�Jz��L�~�����/(o�.�˞�c2%f�PPv��t��Ki�5�l�{��R���vG����u�򞈓�)���M\N�����a�B���ZK�(�)S���������щ9��dJ����C��K��乳�p2�il���j`4*c?p �2\�����_�pY9� wLN��M��g43%/��n�&�����]KN�Cn�ܱ�d6
�C�|����t�q�R��Z��J���Z��ִ�B����r�F��7!:{FaQU�I^ʽ1v3'�9��fXc����xH���@y[��6�l�AYj�VU�ј{)�|N��:p����(�e/���D��]�"(#����c.��a=Ш�[CI����B3e��=Z3��)�8S>;Z��٣Q����xMf�E��aO'W��̀\�����(Ȕ��:�(n�̅�y
�I*/�\�\A0��ĕB�Qb�����顑�������{��'$\���g{�"�og��k\fN}!c٨�@�=f�
�m� $*聴B���O���{��xiӏrJF9��E��'_���~qH	���n$�ܐ�@�tI���#Զ�ʉz�i:��g�d��?���g��7�bb>�>�1�k��-��OBW�,/��?�Y�3#A�L*�F�&,._�)�FlҺ��r2%\
�N{��.,!�֡[#��2V�;sv,��F�����O��@ep'��^<�� *E����L�H9�(��/�����x�S���#��Čئޢ�����K/�&�]�O͎\����W����N�.�i��RF��~�Y#8������^��Y��B�J��:jB��X�`f%��b}H���z#`���Mm�?#\����c����	�"�7}��]���
8��%=��]�CAF�;'��9"�'=kы77��șx���SJE���9��,2]��z:FV�h�E!WalN��N�Y#+f˒"(Pv�-��9"�Ԓ��xr�z�P�ڟڷO���LHܚ�;�n����|�O�5f�?!5���d��^�\^f@F�Tۺ�ǟeFjOHt�dF7�EœY����n��=&3sdJE����9�p�/��'.քMY�B��J�9TI�/h�(�i��	(�i�����u��Ǧ�vݟ�B�5*J�M�,���6E	U�bB���m��	����ᅋ|�G��2��2E��̔������-�������1��u�9s�iT~n��1J/f���x8����o�ʎ5�gn�B#�5�SY���������̀L��;������`�dFk�[2�%l�RdB������uH5>%30��nF�|�ikp/�xr�j�&"��5!�Ž�b��q��������GI�?(�Sx!.(n�H�LF���x�i��&=%D?V%��+�o�;���pM�-�i��	py- ��I�?k�@Y���[Z��������Q�"Rz�`���=�,��UZ3�z���A��4v�Am��]�ׄ\�RV������Q�>GI�?qR�ۖI^���9"a,)���O�)�=j�ا�f�1�Z�|�ct���̥NF#����RJ/\d3W&py!9!z&��b��j�ۛ��戤�����<�,
�.:<&D0S��1�;����w�ȍa�珍Fq�ȏ����T�/\����C�q�����ڒ����/�4}���i�B����n�4���tᙻ�3Yı:-fn[:~es�ZA���>�͉�(;���d\���m��2�A�G��x_����ǚ��ln��c�)��m�ތDB�)�9:����DV�� � ���� \ʊ���\f�{!��tt����(<�CP�҂�}hs߱���:*;��3��M��ۚ��co鰇c�O<x3�po/�}�E���Ĥ�qy!a�!uI�?qR����#���`��h��-P����SB3�&"�Hp�|���� �Ɯ̠Q�f���5!n۱��F����9�A�|A��@M .BwMqsD�Xc�z,���e"�����(2ʥ `���t:�p&u�`,�7K���X
'D�����Q�����N�3s�����/
��I�4��{b�g�"c�4���t<65��*\D�����cWsl�r�ZX!R�\����ׄ܊
_:
py!����6I�߄��!ľ�b�V    ��vܙ���Q�*E%��i�Ϊ��c��&�o���'�)iv#T�Rľ8��Df�3����;�}$uP�x���:q4jc��Yf�D>qgZnV�+\V��!��H���Sѭ��Q��{#2�648i�Βk�r���	q2S-��0��n{�e��r��*��X�(;����y�"݌o"�3��p�z(y�p�����[-�k=�"��R�N�H�P9�����)�k/����uH\����c�˿x gd&*�7�݋�Ð�䏟4ss�Fm���+��� ��K����d���˼x�R�p����9���L�)��U���%��������}�q�����?j-m�ڕf5�y�#;��׆�(�ҝ��2C
��ɤv[����3�ř4�z�ݷ�Z[����+[�K�T�3���C� ̧������.��?�c�PHt��{F4�(����&S���EKp�ya����T}4򗖧+�T;B���<	/�-���<j7fs��e�8�<Q��O�kC:q+V�i�����E|D*� ��<�r~��ڴe���<i��<�q<��*�̌��^R�4�0���,!\��K�^��$�$�̐�!�f.?�@�4��bY���!���ffc�~��P-J?4�L��̌���H���C���L��vSQ(LaF42�����;�+S�}vQ�����/I�	p��d"w*��r�����d ����q��6e�M�C��/fJјl�f^JעƧ�ܕLu�[�>��}[�(P�T�E��Sw��Z�22��;�4#��e
dD�[%=�Κ��LCb���ty�T� �d��)�«u0�R�?Ϊy�YܕL�O����egF��SB�
�]�)py�S%��L�� îhW��L�\�V'��w2�Y��2D�.o������b�/fLHe�0�R���x&9�w%S�3�]j�����ʒ�����)p�9'�ed
\8u����L��Uo7A���dj��,�N���zm$X:��c_��u4)�J��r/�p20�+�.�) 2��:-z߾x�5\�;~�F�#-�zlS f���\��7L�T'��dqW���?4b{�e��t�jA P�v�3q��k�e���)pQ<��K���e
dl
�U�'Sr�84��tm��Ƿb�r��y��(`��h���3ܥL�`W*ؔ[c�5�x�o��Y�.
:�NIp9�nFN����rQȉ�%=�R�)�w��Z��A�h�C/fi��&}��Ki�Zy�ܥL�p2������Q���TU�(S�u��nJ��ɔpQT��]���)!Ģz+��2=�fj���Fj����N�1�3����u3/%J�����+�z�)5���,652��]\�u9�)\F��%��B{���Ȟ�o�W=�d�OO���d�x��3k:���L	TS��\0�R���..6�ܥL}#W;x�;6j��������t����7F����������2��w~i���2���������M58���O�!Sb��a��0�R�?�*��ܥL��y�������ѹFz˷�ʔp��T���K\N���5�� w!SBF��#xI�9�s*ӱ�5Hm��rcP�6�1�s���޺������]���%�+�V�6���ٷU]�%��u��L�K�Ws���W��L���8s$./S wx��[�U�9�Z{&��)S/�q�*�F��]{̚�9��r��3/�����g�B��	Yʈ�����u�Hp�k��ӵ�vV��,�SXK	{�����=�3
�S:gw����V�-�Yr��BY�S��!�NfJ76��U�|�s��:��,y>h�c�tQ��[ӫ w!DB���wI�߅�(�Z���Ȋ�ވ��dɞ���>q�u��	q0G��%̷[)J.��[s�h���J�õ���E!@g� �"!��ra7X�"(~�.��9"��xRaO���#�PM���fT���ӊ��c�O��.Y��%�j�M�[���	��V%.�қȴ�+����
��ͪ(n����*�f^|�Q>h��U~L�Č"���!]1s�(�)��8��Y{��-�C�̀�f�`/��ed�2��=^����@1�-���̴96E�a���h������)��!�AN{%���V�=x�x��.ja�v�9�� w�B��!~����-������@)..pY?4j�3n�S�.��2|���׌iф��
����@��^U�py- �e���ǟ�0)��|(�--���E���+~D����c� 0#�
M�,�>4�)�%��EfU�F�<�qd�^�KiSKk��L�/\{�L��Y运錮D�l���'i��$H��	 �������U$���L�(�ZH�Ll�Y)F�.)�Rl�hT%�ܐ.�2�q:_�26�LUtJ͇�����!MmLS��-���F�`}�ɝ�b�_�!`>=�|�:L��q��=����9��#w&�Fc�4W:��2%\KWM���������uf��׸�C���C�=�N����В+�t��t���Bk.�~�"x�HF�˼x�Rʼ{'����=��d%=��ŇYw��/X�1��0�e	3�S5�� e��8Y
r�AۋR"�B��c<<>�rR"܊2�p�o�)�u���K)e�����<�hd��D*�\�_��������^<�&�����&�<x�Iz�틏�I������TP�����7L�85����o�p+m��^��9���e��~�G#�����\��)�"j�/��.'S�����%�]Ȕ����hћ�R��m�.�]��6��;(��T3@�"C�_�53/���q!�� ���QdH۶{��󺙳Q�i9�rag���U�����rD��y��O=�}��>���̜�~�K ��泘/K�y���Z��f����o=v�c��u����5Ju�ׄܙ?�|���b�l��������g!N���N@qsD�V(T5x�cs�����SB$抺��Y�����V����r�{�+��p=#��7���"!#�ʄ*��!E�R�p�{#2�1�@x�0�q�2K%W�cB$f�'f�|`����8<��a��BD���:_"p��̇]�{�����Kz�.�xF2�5���3r����}8�V�#��B3|]��f���y,a૟�Y?ִ
%(�����n�G��]���!��o��U�/���%��'�:f6ʇ�Bf��%��8v�Ɍ���ϯ!?0/d����n�������h�̀��y�V./3 �}[�C�����@A���d6�����>,+3j��<KO��$�s0/d��k!d�i�C屘V8�~+s���1�JM��2r
�i�����Q�/��R�J@qKfٕ��L�7�7G+�T�c�Y0'��U�|籋��R��8�d4ʛ��V<.������Ȕm���|�z�}�M��nO&2.僒 3��_Z�>��H}N�5khhc=v��r��G��2���"�H��#��Ѯ�ܲcY��p�!%\���~pY�5��D2E�cvH�鐎3�%�~,膑#�ù�L�d�c��03Ǯ�����.�t�S��}� �x��NT� �~M����޴��)pi��������A�e�gy(/�BH�~~�1����&^�<.�-D�Ѓ��~ә�����p���Jp�!%\�`����ȅF+Q���<.�m�p�`O"G�Aґ0��OYbF��R�$`f��"�ŵ*�]Z���c҆�<%l	���hY��?��O��L	���MM���<�Lۅ����iy���Ζsw�T�t,�������٫㗛�ȓ�M-��CJ�	ά�Kp�!%\�H-J���<�L��R�N��/-�Ѝ�˸�V/�nʠ����Yb&g�l\0�ցp��"+'�]Z�N�M谠j�{�<J^�]�)��{,� ��dJ��LT�.dJ��[M-Kz��ԟʴ�}ێ���x4ک�E1�<&Sb&'�ܜ0�R��(�%o��L����r��u��F�J*��^� p�B������L��6x�u.3A��5�q�s�=>����Uo2��%&�L_Y��HQ���    ���'H�Q�[��X*� ��OpB���.jrW�%�ܐ.�L�d�\��WUQ��!էC��T�y5r�68.���V{0c=fP�p��4R����8̬u \�9:��	p��'���F&դX��Hy
Q�_���IP�`��p9��/�y�?�.,!#쒉���/-9�Хl�͂.���nڡ�)1�DSu�3/��K[�g%�ee)?��{x1���F�X&��؇��p+�4�$�e��BF�9�Vڧ�]�Fqз����5���~��=����#b�Ϝ���q#QWc�2�z���(0)��}����R���kBn�U\q\^�@�{����=�,DP��I����}D��3��-������cv�q���#��9Sڮ��K`��إo���S>2K^��-�ԕ,�p���0�dk\f�B��W��ǿ��w{BqP������ވT3��lE��%j��u}L��L�<٪ `��.F�����j�2x�&}�}�Q�4�м�>O���EZ{���.c�^�����	����@`d�����A�;vƁ	$�K��p�7g�����q�^��`?���J�m�!��8f�4�r;�^8���K˨xx%�=�\�w%�{N|�=��#���]�c�,ϼ��M��iK���D���L��^�"���;���N�4
s!2�-��m��*�"[�Q��T�%&}^^������R�$WvI��5�K��AMu�s)�{����s�=1[�aF�]����l���I����,�����g&��y2�1NN�Q��ը�.�t��P�l����2���a����r k�칷ǧe{Ҙ9)u�{5�6�W�yd���LU)b;�&���Ki�RM����.eJ6��|e�j�24�=.ʔpQQ��$��dJ�4�e��B��Li%�.�1kM�LC�:� .�g�.ϔ4�8��L��rq䢪��������^|�<�B�MUO�(5���=��ۼ#snIN�%�\���&2
L0��?����"���ɶ���;k�[6_(���ȓ籃$�طb�b�Nf�c���w��F�d/����htl�Ѻ�-Ɗ�ĭp��^�ˮ'rC�Ֆ%=~�?����zI���1ә�X�i�|4B^��6͉�8�q��٥؊�	>�jl��z�S�f���@��w�%fUW����u������)ɜ���7��S��(�&y)o2�}k�Q�PZ��������Gk�.f��#E�+�y�fF�r�����.mkt-���M�lD�3ZrW}U�t$#T`�{\f���LB��Iz�&�d�(ox+������H��!j���11��}}L��\p�Wv���s��g_B,c"B]��V��l���=:|M��\������V����\�Hf��Hz|�Q���b��6*�s��S�����U;�?r��KO��1^Q�K��<��C��/)�V���Kp�!%\�eמ���9��#�&hI��!��C:�$����� �������?����̧��.VY��L�\v���+0�q,��=�����u��\8�׋ ��Y��.A�=R���䍀��\0p�L/U�y�lt�8�婵�d�Ԏc��;�=Tk�qy6�{�ш\|fJ�x�^N\��Gy���|��H�+�e��2*����2��ˁ�ͧ�̰/^�����=���6�iu2�fƦ�'��K?�u�wa/�/qkX���X���Sq�b��(S¥ �����r2%\�6v��e��D��񪋤ǬLөLKނ.���y�a�Q����L�A({�f^J�BPw'��]�t��*B��=X��ȕ�[sQ��K���E��ɔp�H(6�����+��Eo����Oe�(m(��<��L�{���ɔ���Y�.`�4p��b)�p2-����'����V���{�$���T�.+��I��hI��V�J�Q ?Yb���2l�-������h4�"�C��̸�I&	��<v�l���3�m�)�[�g�^N܂tч���|�V�#�V��
|"7ԣcO���R��ˁ4~�{���tn����ԁ�d���� `fl���������qY{i�n���ei�.f#�5�{�y����;���,�e��B���������ΟQPhI��NlM!7�O�=t��t���z$��fl`��f�c����Dީ�O�F�g-��Wց/\��Ȍ����U��q��������?]^9��s�}������c=s8�g���YeV�_̘���;C��ƱM��~����Fv���]��R�%[� ��x/d�ت5�����I���?}��a�q�p�w6�c�����a����(b�f�c����[("-{{:��F��lڽ�	���������c�R,%��(��;��;{B��h��m<��Ee�����Pd�Q;�;��������?��������`�o������A��P�)�g#����^��|����@���|`��*�Or���-J�I�«4{	�EJ�����;ӫ�X����|<��.lz8�r��{f��I�����0�z�_���AN��|�ډn�4�ϖ~f�_���,^��_(1�c>pun��Y�ظ�Ŏ�q�O�g�2q���%!�����?ǳTۯFy��=e}�����\?��ȑ.�N�?��M�^�Q$�l���x������?z����9�����lk�!`�/p�A>>� ��`� S`\T{�|:����FѶiFI��{o����Ȓ�}kI�KxB0��3'`�?6��s������ԌFG�U�b������LJ�,��#.#�2ܿ�.A~"e�>����F@qsDܦ�0d�;;K��������Υ��!ku��w�+��l�ᒿ~��M;�%���=���AVT[*4'��?w�c�l����y����$�5��W�����y����<�^xl+`�?��v��8������Fj��hw!����1��\F�/���}^^�S��'FAA�9����@qsD⦑F��Kƞ5ã�w�?̹ �2	��<v� Oȁ|��w6
�N��I��2�� �� �2�y��$=�%DK�(O(�<-� O\�lKG	���2�����>����.!���B+�X��Ȍ�� ���>�^}�z��U�{����"/��i�.k�~���8w8����U�ߕ��{s��Hi�(kM{�.m�����?��iX��]��7�1<��=�ҧS��.*�页�ԁ����pY�0��U�h$=>T��ݝju[��%��ӹ�QDb~K�*�2&�%�p����ٽ�\�,��	p�;��ZT��g�k��`G�����J �\�'m���2���u�ಶg"��S��s���p"Ӂ4�H@bÂ����Y�G��/f�9���y)����eZ�2c\R�,�%�y��l~j���BJ�?�p��Dk\FN/d�z��Jz�a���@&Ű�|�
\:�ƶ@<y�:%l�y�����L3kN5	��7�u�a}%��-eZ���C�P��|I���L�Ysu��ǿ�h}<�((��P��(}B�ϫ L�av�A��#������{I|`�\Wqy����q������쌹���h�SҺ�屻�6��1M���))��j�����/\M��bOE�{v$��ո��\�H��L�?�k'��ɒ��v����B*���;[���H�b5�>rU�bF���Y������jtJ	pϗ,??k��0Q�[���@�쪺(S�ŷ��jE|��dJ�(+Bv�{܅LǏ�N��r���_��P�2����A=��m2�ɔ�U}���Y)����v�J�E���£�s��W�h����L�'Ȯ<vSU�����RR��2������We:ekIQeS�ȡ�"4�ێԌ������Z�/@�_�����'�O�;fhfͿ�w�_��?k������|Gv�-L�k�|9�	��󪍽�@�8,9���Ya;z��������w����_ǿ�������a7���T�巶�������+��\}T�'�B��)�憋��g�^+�+
@�>7�k��+�XC�U��<���pj� ��`2�{��%=���
��(������V    2[����l�v|�<��o�p��5%�N�y�و�Gߡ�Ky�^��.}���E�P����*� �Tը8fa�F�m%,�taf}�β�=pY��l3.wI�?�μ(Pj����#��)c�@e�y�L1�$����H�em0�;�e��愃�|>�Q����ާp�_ԩ]���\Q8�K�߄�=���?7�(�[m4'x�G��V����ŌSF�����q�7^�ۧ���q��L���7ܨ�.+.�2B|!'T��I���BL�>�@�����c�lpOfx�D�xt�����U!��)�ʠ��[G�X%�cZ6���b��ܨ�>F�6�)����!�[	cv�N��}�S�\n�>~�
�8� w�Q2-�tגs��7�?H�jik�ҟ����pB�c�.b���	N��J�p��_ܻ�ز#�bϭ���A�N�7��8/� ��`�[hK��ߛ1X���U�Y���zX�@�� 'G��}#.�L粣�*�\3�>��9���ǬL	��B�D��L	�B~�)Z�{"SBFpNvF���Է͡�����F����d:A���3f3/������?Ȝ�r2�v�>'���մ�ԫ�_+u�:_�����u�c�^��>�m~���q��ըl�������~�t\��
��E�W;��[��/(k[�]����:il%��q*�W#_���;�_�	��A5�7�'�Zey� ������S>���#�_�P"f��M��@J�V$��L锈��0��=�)Ο&=v��1������B�[�ǋ>��~5r+!K�o�)1�0'�`�4q��&�^���?R��z\��_.`T����˥(�7���?2���x�8S�]���Of2�D�{�|�n.���9qƶ��f#5��!�ߩ�;��.�W�����J�����G¤��q���^?K}K���������Tc�q+���
�Qۭ�}�R
���+�B.(����_�]��G�T�х�6Kf��w���k-m�=�i+Y̞��K�0ˇݶ�zٜô2�J4�˛�|s@?����9�(�e��B��1V��/B������(�I~�g3B����=���f�ZtPo�9Ҝ�����bJR�^k��|F��H�s���4� A������.�p�������t����_���x@Qw�,n���ጼ���Gb5
��`��c�'3=��b��Y>�H9��f
rЛcխDd�27(?q;E�5/�=�w=��!�e��l�@ُ�r�z|ߒ���3�b�j�<�Q���Oa�A�A���WJ�HH�H��FAĨ�9nA}�c��+�#7�F���8�m����?iE����S41�I縌{�n�1tI����|R��'���'.��`��c���h�vzh.�~���'sA޺�
��/��&3�XB���h4���� 7���K�f��]��<���!0O�=�H����0g%�x8#}�x��m��mn_t41�-�OfC��/J�,v��;ek������BG��!~�"V��p!��5̓�Jz|����Y\�&�x4#~כ�eGNe$:�Q�9�'��Ŝ�D�H����*��VQǹ�
T2��|��g�"`�"�e�~2	1:�M�ǗN?���+�$I���<"��V���|�;9��bқ�~3�cU�'N?շ�$�s�s�����{����g�¥��X�"�e=�A=!%=���"`�$���˓�Xs��Q�5rF��b1;ʃ�Z0?1�9���C�l��A�G|�j�q�}�R�e��
p�G���l�)iI�/U@�w�3(I��H��t�9��~S��->9�̰���s����NGn�M�B̌�h6
���Ro������ �eM��2��^��Ǘ&�E�����Hg`�x�F�� �o2!.f���ɗ�O��K�k+,��{z�^��ߒy2B\�ȏ���BF�g�
�ǗB��rF��g3�˶��$�X򜶁�z��Y,���������-�I�N��
�G��~G&)f��|ۆ�{:�������E7���m��@����h/fľ�V̇�@/\�T�T�\�ˈ�lj*fdn�� 52
�_���\t��֮p�'�68�"��0rG��,��L�n?�i�D�8�Ǔ�|<�ί��M��\q�q]��K)~T��'+�{&S
��9���vl�R��O ܓ)p��>��.#S�j��D%��e
d����L��)ʷI��]�t�Q��"��wɔ@��l\*z3/����a��K�S����ɀS+�k�F�|�b���L	��C��ɔp�JQ�'22<�����2�� �em࿊�Ƞn�P�m2M}�)�8�肙�yW�##�=��\�,ΐ���<UZr���4q�?�m�N�
'�x\�`5j��W�D1��?�)�����V�_����\iD-�=���қ�2������c�����N����FI��{|2ׄE�	�y�O\����pO?���^Eޅ1���� )y�7O���p0*E�{��I�3���-�2;�CE����Q���l����2rϔ��bg�1%=��J�W�9��"Y�_����I��9�+���L��:AȨ��H2�׉By$\ؚ�O׮����ә��o�-\J�u���G9���#Jz|�~�(��𔷄���ĝ�*��,��+[HXXv�&����J��#g�T�V����B����!~ↀ5E	py�# ӓNL�Iz|�s�EA�Yr�(���p���v�ըϥ�"T��r?3��q��'�.�4=y;*^{��d6��jX�uͷ܏�[e�؏������B��OL�|�~�(�j�[3��3B�iE4���a3��4����~����R19	ϙ�zQ9l��u`Ӧ�l� ��j|���p#v�m"\&�p)�Mq���|���L�R�kI���D���P�<a�-C�@�Q��Mw�Of򕍚��s��� n�\��Kܳt,ژm��m�6�6z�	7�=ܓ)p�ܪ(�ed
\TTk���22ʎ�%=>���ä#�jc璃��|�j��(�~:r�h"��J0�R�����b��2�v#
N��>��L}35p���&��dJ��<��K���GՄ%=�Y�tM�2�{���B~BoZo�f���f^J�@�H���0��;���U�Wc����*��{���E!��W�{�/d:�8$=�������J(�z���{r~/��|6��z6����bՂ~�e�-������\d|82�ͨ�7G�/���j4�5ҝ���H��,�=3�DFZ�t}��%��'tD1pjQ@!�l7l��#�|�+d[-��%u�'3\������O�m�l�=�O�#���T+�@�uG?q�����|�R��yF����B�]��6$=>Lմ�?ܷ�@*jk��d[K7Cf�����J�0�j��5p[LZ��eß�6o>�de��;����ܔ)�8}��'��L	���)�!�=�)!S�򢼒��K|g�C��oA}���<]�������dJ�8R�l̼�&�� C���T�c�`H$��=�6*�}=��2%\�$#�Kp9�.��s�^�{"SB���8��u����6ʔ�ܹuw�W�٨��~uz~ Sb)r�����č�s�C�{&��摙����(����ߓpQu+��	./' ��߻�Ǘ��EA/��[0�Gǰ>Ϝ�|��n+O�g#��.��Y��'ÎmޜV4l1�g�I��k�=!.\�KqnpY!.d�:v�Iz�5��������f��v3��1��	q62�^��}�3*���O�]�r�.>r��ldW>�yٿ��.\x;͓� ��B�#�5F��K!.
J�Sr���3�7G��%�̓��5���)o�b�du�	�����f 3Kq;7�N)�+�0��.�*����"��ȝ{�8���ZV�$�x8#���o���m�-�m+�b��lWY���a�>oH�Ѝ�UnZG�mK��$��ލ{�6��c��c�/\�05�a���BF�����?�qO:���~SY��Ȓ�c/�Mzh��)�!`f�W�R� ��*3z��Py��sa�g�D�WY'    sS�������)�f$"�]�{"SB.H�䇤�܍ۅC�v�C٣2n�~��vcY�P�v^��Ki�����ɔj+)���Į�c+{c�-ޓ)p]�Lx�����)p=��YC�./S S�����?��g�L�MV��t�Bi���]2�@���̼��N��-��T���O��5�eWSj���x|=��2�w8��(��d
��U��=�)!�<J4I���T�m�gW���R3O+|u�m2%��h̼�A�	pY��m��W'��d�s�Fq+�x�Sz����љY,�q9���Җ���_\�^��a�+��� ܾBr�a(�Q�=��o/:B���#\��0?��{�3J���\Qރ�[B\����
�.+ą��UyI�����`@��J���TJ2I�8�܎Fe��L��7	q1#�n�E�,v#K�}�q^�����ͬ���[�/d�x4��������_�|L)u�w	�����_���CG��p*w����x�]������r���*�Y	�������������p�ؚb���������k�9�?$6�G.���������ӿ����:��2���!""wIߟH�^�R��o�hDaZȄ����+$u����_}�w<����8a8�o���-1u����3�g'��<�J����Y�FyK)�ҵk�/\��+3���B�����o���|@Ang(w�s�o
�Y�F�8V�� [����e�~1��ʷ$`~2�y-PsF�A"W��S�+G�@1]�d��#��
\V��^'S��߄��C���1g��!!�xr7��8��7	q17x�V/`~2�P4��cE���7�m�8�iK�7���.+ą�`�N��K!.
���P<�c�1�|ubb��y'e2�}�&�bƳ���'î�q��8��Ѩm��U6�[B\�pT�	pY!.�a�4�b�GTr%%c�f��mw���Β�y�Cʢ��7	q1�V9|v�b�;l{Ky���]:>#�Q�4�I����/\d�Y���-�T'��7!F{D���(��%��s9F���x��RF��[��b�����,`~2l��]h ���!��ږ(�=�n	q���/����2U�K&TI��	1�C
�>�Q@�lF�YQ��&ǒ�l���؉���;�o�0?v�z�	O���٨m�!\�[.�|���g������bP��" ]���g3R��Ș�sO,y՛Ӵ��$��Lς�v%`�;����-����Q�=��Q���R��裕�	���e� ��'2�U5�/q�����_�=| ͹V�Ɲ�����-eh���-z{1�l�a��K�g�_�Rb�:��.��P�E[��M����o~�L�Kv�bw#�ed
\�k�
py���H�<�$=�d�5�����"U��<��ҧ��{�L�L'���.`�D����	�L��Kg�mh������؛2%\��v~�8��dJ�5^b��Ȕ�Ƀ!�Iz�C�R
�	s7̏F8e_��d��.���6̼��ǻ��]�{*���o��<�:�F��b���L�$*yK�\N���l���L	�甤ǬL��LǾY�����g#M�����dJ��"U�9af�D����{��3�Zm�AުQ�r�F1�!��\M�K�eboJ�������
py�9!դn��2�G2%�{��FQ��t~s�@�F�)�����	�y)Q�t2�����2�ّP�f�ؖ.qw[sS��[�7�_��p9�.�_�d$�'2%dT}��Hz����Ԧ�S����>�F����o�)1SI���y)M�D��T�L]�yf�ؕ��d��Ū�2%\�*�+	.'S�%׼�N��D����?�`Oz����o]�����x���<���M�Lf�r�������ĥ�|�j�r��J�7��;h)�pV#7?��(s+=p�n�6�p�����\�0��Ǘ���^.A@�$��-+9hI�<oś�qo�_��a�}��dKϪ����
��|6�j�5��dk~�"��~��8/�¥��	.�!gd��I��dkR�+�5�y��<��/�ޔ�~1���dV�|��3�� ��/J���7�h����j�j���$!m��'S�"�߃��)p)�[��s��)�ɀ_���s25�H���m��ZTi�ts�(|@w�7��Hg��
g̼�&.<z�3���e�cw�bS#KMr.ݓ)pm�p�q��l)��	./S {����Y�Y��#���6E��\Sf��8(:;~�[�e
fH�:�Y)n��Y'�=�)%�jpN.�]M�Qh(��-�/#S����)Hp�w�/�HZ����v���$���6}�*ePJ�t����)�w��/Z��K�p;J�f�L��G8��\=���l������6'S�RN��e�縌L	7P!�����L����ov���g2u���I,ɳ����Rj�8�{�Bc3�k�8��Q�ƀE����.y8E�� ����Q��*	�ս�E��:㭀B~/&\Jo�����j�7]=��;�:��VS��Yák5��N��h���ǰ�/�x�������}oz�?����L��u+��GvZ-���K
�GL\<��d���� cZ�{{L�F+�Թ���C���O��\n�!\����'�!ӃUL����?;ͻ�ƏH��x��Y$jZ��D�K���h�0�R��j��p�d��L���K�Ot4�mJWuO��%��t��22nC�9��v���Ƚ!�v���g�$?/#�bV<��
�Ew��%S0�D��I��Ki�"f�	�L���Mx���B��~�1�{2.^�t\F������E����բh���g2�\�q��V�tm�AF�x@������I��Ki�"d�7��S�ƺ�����5�Q��V�u���pQo�:%��dJ��3N����"=S����2�}sT��x�x�����6��+�U6~�?a��W�l���ʴ�M!�AM�B�-�2}+��ʔp����\N��[�c��L	��Pz�Ȝ���2�HB��x㷅������m2%f����̼�&Z�����;�q�d��_����P���0ƛ�>p3�A\�\F��]�����22��)i-���dJ	W�d�N�6�4�j�wɔ@9呻���RZ	���Y�{*�7#���GM簆��9��2%\�T�CKp9��C�h3�'2%d�6�����0��V����@Җ
|T\x�L��r��8����RZ�$�1V�{*S����#�ӯ�Qs�ݎp-|�r�\N������JpOdJ�T � �%~(�y���{L�_Mg�������dJ�(C�0�R"\�����2%O*����l��@���MQ�Y*�a)�!��ȃ�(n6yn����E�Ip�}p?�ɻ.�%=��X4���"��H�[�4���ˍCE�Ɠϋ��ϜGb�_̴O���R��a۹o�Q�Oj�y������-!.�K�5\V�/�xI�/��A��du�����
��'3R(���l}�3�d�2�O�=�cm��;��|6�s�k��o	q�R��X���B\ȍ.X�%I�/��(�\nKG_Q�3M WQ�_�y��/7�ڐeĶ�D�2;�껀Y<l�(�8e�}z�> _�
Ց��P�k!~�ғfVY	p����l�8���B��(�x�����ٌ�4倠������o�4��~K6�Of�J�Ü�W��a�:V�
�KΞGB��m�6�T\	�9�V��K�v����۾�@x��e�B���<�z�g�M�a(�/�3�]P�N���#�n�,��۠w���[�w?�Ak�0ˇ����D~#tW7�'��(R����;+��d�lw���\q?D���!Z��#
� ����W�Cp����'�K��f3R���!����w?Ε{�,v޴�aհ�s-�F�BK�\�nD�~�JS?�q��K�����lM���� ������g32�Ƚ%gf9�h���׽�o�����h�����W�\�J[��W�S������<�9�>q)GgǙj/p��~!�/�� ���tR�W�|�A>hQ�����Z���}<݆7�8�TW    w�ڂFvӑ�[=�y�x�R����s\�$�B$�����؟d�)Iw�܃�p�xVM��D�|l�j�z�ċ��j�,b~�8��"��5Qp�?yC d�YSI����7��%RYP��
�T��Fq2�O���.YT�UZ��,�/d2�d?$�W��]�K~�
ܾ�u�N�F�|V`MzK�Of�d�%��a�m�n�L�so<>��Q�]3b�7�����m�
p!���ʐ$=���lL���g32W�1����ѝF���f�) E�U_?��̄���.����yf�խ�+,�Fe������-!.\���� ��B&{{b��^��R����2&z��9ų�g�W�d��!�>�%�`߲"��)�?���O�=� ʈA�Ru\�l5
���ѷ��pi�ʶ�\V����y�s�_
qQ �I�~A�pF�b�U�dF*�����7	q1�>-�v�,��Ǎ6(G��Rޖ� �ɮF0� ������>�e�Lʦڼ�zr}Oy?�3��+�i�[����vl�;�Ո���u�V#;O;��e�.��ĝ9���2��Υ�8�U�/����%ﲀB� 7�՟,w�x��O��ߒF���24c3<g~2�{��H���(la��Ւ�%ą��Ԇ��3\V�����pW=�⢠�F��g�mi��'���P�X�s���0>{�	1�+f�AM����Y<�˙�����c9�2�Fn�%hbB��"~⒃hIǛ��?�a3p�Kz|.�_����g�l�<Rs;6��Fy3	\�zǕ�y�����a��g�Ѳmܴ�F�#p9�)m��K��R�A��
q!�-+�����X�ţ����PT�>^W#�x}���$���`�p�,?��Ξ�>�\$gO�,�BFQ��x|_�j��co�(ȅ>Vc�~��6[WH�c�)�>RO�_m��l�#�'��<.���I�Cz�a��ĥ�K��)�/p������M�|�x�(<�V�R���/�K���f��4-���F��YT*pgj�[C}��3�\��0?v�o�S���P����Ь�F\2B\��X��q��.+ą��7I�/��(�����/(����t��{aɳ��F��&!.f��c�'î�{��������(��-!.\�~e?� �"�5B����U�/��(�k�k+�x8#vk˥K'�ܙ�h��Ǜ���)�h�u��ö۞e3�uF��-�u)�x#��ס��\F����T�M���B|Qx$J*]@�pF<�m&��nSi�g�w��L��C��dغf�XeO�!_�$�0���.m�Q�Q��
q!g�?]��R���<�r�(g�o������)������?�bF��P]��d�v����ܽ�q���(oC!��˷��p�q#*���r��zwu��K!.�L�y���ٌ4����̹ �c���]B\��R8���O��)V��t���s��TK-}�d��p�,U'�e���;����_
qQ2bg��C��������߷5/憼#�
��;�d7CUrcd��hdȂ�L���T�B\ȸۥ�%=�⢰�Y$?���s�!;�3'�۾g�7	q��mW�QF��h�]�y[�pG�v��H}��H��q�R�l���B29.摕���Bj�7vQ:�x8#a�4��ÓSI*�a���%D0k�n-`~2�D����:z�+���t]�w�n	q�j��K�B\Ȕs~?E��K!~P��;���ጴI��T���i��{�ּ��TPK0?vN�M�#ưs��$�$k��pK��M��l��2r�c��_
񃢣bbP<����y.���}���LF<S�o�b���T0ˇ��������e��yQE~�p��¥��X���/p!��k������B�/�Lfi8�x8#~SϽ���nST1�P�"��b��O��tT���b�`�Հ0�^'�'.�)s<�zp��
q!�zb����Ü'�.�x8#~s��H���n6
����[����p��\2?��ܠؕ�ܴ�F�#�s����k����,�e���5�*��Y'R(]@�pF�f��_.����Ӽ�c�Ōb��9ן3?�_^��Bǉ����m�-�"�vs+�|�h/S�lD�BΨ��T����eD���h�؇�Gy8#nH�dw͑��n��7E�/f*יF�gÞ߈F���
K>�CQ�V��ΊH���oA��̘���lq������tV��٘�q����L�zE#���J�IAV~�%�����M[(��֠Q��8�ּ�,�b&���.`~2l?��\h���E�|6R[�++S�%ąK�J9ʻ�e����&#Kz|)�E��6E@�pF²{&�����*<�w�&!.fr�,^U�a��i;@؈�V��Hmâ����.\M��p�����B^�&��֋_
���FB�pF�*���9��¦PU������Ln�12ׯs�'�.en0F)$��~��h�"p������Ո�Y��
q!�6��R����s�J@�pF�7�Gj���
�Žkk^��>A	��Î��sC�*G"��'��I����p����U�������Z�N��!�(�j� �x8#�e��`�	9e*��z��C�/�ăY�Ι�ۅ�J�]���!�����.�o	���B�1�7縬�^�E��K!.
<��g������O��HW��T{�3N$�z�a�=ڕ5*����F�lV�@Wo	q�fx~� �e���L?��E=�⢠�@I��<�*ZBO֟�r�m��U)o�b�s�<g~2��}Pѫ�#���FqkH����!#ą��a�8��.+ą\��I�/��(** ��?��>W|:#�Px����-Y?>��X�Kw�'��!RF�}��q�����;#.\d��]pY!.�wc$=�⢠8��-���qS�����>��o�.!����s�Y�,v�t�e�t�)�5$_��EP���.l��s\F�/d�/oV�|%�����gdl�j��~\m5�۠:�)�o��Љ�#�Ҹ"`�;oCϓ�F!�Q��4�+H"�rgE|�z	�)
p!��q�uNIz|!����aw��	[%o�����;fE���"�sAs_?g��lJ�_�E�xE#�����ue�n�;{�E�{$��2�w#�e�BF���,�=>H���q���k��D����3OWW���[��|2��d�Q��=y�?I;<�S�'F\f��f�4�j�?����x1N�����݇]����Ⱦ�E�ǵg>�Q�ٸ&��L�?����dj���A���y���Z�_O��d�WQ���G��xD��XFZ�+ӷ�gg�p)�A�L��.7���-~� �dV	���I����h��p�<]�����r:���M!�I���ҷJ����f�p��:U	.3���������[�B(p�%=�ٖB���>����~2"��x��9 ��,�]���=�Ƹ7�����a&��g���v�2i�-�]&�7[����� ��ƺM\� .2�Ɛ�� ��P�~��} λ���e�쁧s�6G'�ڻ�T`ΔK��*`��V�8�+P\����ә�5����F�<�ʷ���L����9z	.#S஼0%
py��bl�V����ϕ,�	l���t��Y8�ێ�`���l�0�R��f(����tn��,O��ך��G�o9�.b��� ��)p�/�=�)!���.��P�S"��c5'?��\���o�)1��0�̼����#S���L�a���w�]�����&�ۅ��)��r?�JIp�W�l�����22�%��L�����h��+�!���d`<�3d�Z��K���W)�S��3ʎ��A�g���\W�s{S�����.	.'S�E�� �D���R��P�A��}o�?
S�D��9��m2%f*�T�mf^J�n=��y�S�΋�G����_k6�5��nn����/��dJ�t[�?�=�)!S�GvqHz�C�V���x:Gٴ)�No���p����􄙗��U��U�{&�8����J��M�iJ��l�����B���)p���מ    \^��G��Z��Xg=��L�<>h����E�LixO��]2�:7/`�4q�Z�dD�25y�[Ʋ�gHj��_tq7eJ�+U�/\N���4��D�<�L	�Z\����?��8iJ���|��׉�żM�Č�g�W3/���*u/�S�����ɜ|Գ�Bi��-1'S¥ń!��dJ��Z�n�����T���P�J��̡L�ǥ����		�n�f73Rf�l̬�wୈ�B����4������ə��FE��VweJ����^	.'S�5��֊ �D��� и[I��eʽZ�@�ڑl�Й�K�7��2%f��[o�=a�4qQ]p� �=����41!3a�nγQ��:��jn�i�T8Q��n���қ���.f/
:@�⼀≯���l1��$����6wd�w1�h�M�'�v��?#�n]���	<s�=ߝ�'}��Oq��p�z�t\V�@N{�J�Kz����D�snPQ�Q��kL�Mzhƅ�j}���Y���\���e�t��*V�铱��t��(�;ϖ/\2!&�$�8�e��L!�9vI�/�����ص�)�p=�n�Hm&!�-����{\r_�xD�L9�s�'���
��2u�9�(T~���¥�q�$�e������2t=�⢰	U����ٌСe��,y�[����^4b!.f�����O�]�#ڑ�c�[g��r�-��[B\��7-q�B�qY!.d�9�#Iz|)�E����E���Z����F}U���'#"��>pt1�G���/H�o�F�����V�$@�=�"p)/S^ӟ��BrGҀ�%=�"(P� D#�x6#���)4K>�FɅ�	̑�S��2�3?v�L+�R�a��|6��������A�*&.+ą���{�_
qQ��=��S<���_2�	
��C���MB\�t��i�f���"[,��&�$&��f$�jw��>p���+.#�Od��g���E���PA�
$�ILh�9ųq�@���ӛ�&�����,ڙ���O����7�p$�:C>���cO��[B\��y�k�B\ȔD=wf߼����'E��)�͈"+#��{�,��s����7	q1�/[��0��=O�����B��q��}D�Ģn�E�q��Ô �X��ȍ�|��Y�>&�Q�*&��{g$l���~���M-J��3���()ഀ�ɰ�RTB�N$^�|6�\�H�o���?I۾�>��|�RDu�F��
|!����%=>6w�?�7s�B*����-�te��B��8�Xo���N&}�lq�|d���uw�r�n�Y���ț-�=%�]����6+S��>����)����7��=�)!'�+9%���W��T7k99��tu��ӥ�6�3%R�I��Ki⎀R�N�{*�Q�o�&�2�����fI7eJ��R���p9�.B����'2%�`�P��P�T ������y�w���&Sb������R[֓V�{&S=o�{�6��m�
��Ly�{2.�D��&�p��D5./S wD��"���d�睿�4�p���d�FZ�K�`^��S0�R���Zv���2�}�TLL!�W#�#J�[�N��K�~N*Kp9�.=/�x"�D���p�rF��ʔ�-o{���5�,�Ө<�)1�Kf�N��Ki�z���m��2�"(	�2�:�Nu�Ƞ��M���ɥ)	.'S��+��7���2�`[Ғ�P�t���V��S5���T��&S�yЂ֫0�R���x������4����lYy��<_�L	���\N��K��\���Ȕ�Qx!�(��#��C�C�v��?������l���A6�}2%���%̼�&.9��w�L�Е�?��p�; ���M���9�EKp9�n]W�,�=�)!�D�PC���t��P�+�?m
��1Ҿ� f<@���y)23��z���4��(T�S�����(�5�Y�9-�eo�N���i!���%=�4�/
�*�IB�Ē(�����Z��}����]w���Yۭ��ɰ��`���b)�|���~��텫��;&���2r���Kz�E����	-s���32E�7��yr��5���{r�~2w��A�,v����|wC�yW�C��n��}�SX*�U.p!~ �0�]I����� O��6	ų��f�_(e5����|���Ō�ݝ�Y>l����eԯޙ��-�����;���E�c9�=�L�D�y�uW�z����R���'_��J~�g3��6�r���{#���`����L��R�0?vR�n�⢣=����y"����[B\��Kn�?�e�����^�%=�⢈?�P<��D^��<y��!WS�$�Ō욚�Y>�AN�~(��KQX�mZ�s�~��e���G�F�fwI��l���t6�̩���?p� R�<�R�����[��C��Lχ9x#`>���p3��챿�.{��?�7�E���,6��,��M�n����%��L	�ʷ�v[~�{"S ��/�1'S{,өА��<(^��w�#��{�L����,bf�D���s� 縧2cs�ɶ����4*�v뻫)�x�μ#]�r2%܆g���'2%d:/~�����e:���F�k��兿�x Sb�tBl�	�����ZA
�/t�{*�l63`�c��h4w�@V��N���U0+��dJ�tm�׫*�eN�/dC�d��8q�c6�>�i�[�בD�t,�]��%�'����of^J�#���S��������3)*M�bN7eJ��������)�ҳWlMpOdJȨt�R����2�SePȫf~[��,�ꍫ)17�6%`f�\:���	pOd��RH�k2w"S����BJ�-9-\�j��\VN��g�z����.��@M+V@��R;��f=B]�`���!!s�M�]�tO��[�akx�e��;si?sG7ج�FI0����rPL��|�6m�Y��
|!#sN.U�����N��l�X��(�ӱ�w��3�Ď�E3��-\����'��<,�͌���`�um6j�J�t��[rZ��+P�3\VN9� 2��Ǘ��@���%O�(�I�=k����k)1~��
K��Ō��1�1?v�Z}"�ʝ��;�7�-!.�B���
pY!.d�r�Kz�U�!�#��:�g�o���'�\�Ma;�F�I�����Kg��g�O�]��'�\Pu��lT�A.w�O��*��B\�m�lɒ_
qQ�6e���ٌ���P'*Xr����fq7o�b������ٰ��rE���;�m����
�p��U*��p�{"DB��a�R�����~D1�:�+�����o�6�N}����f��-�<y��邤�_��s���u0?v�[Y��\ث�l��
sc�,��ڮ$��_��*Z�������m��V�$=��Uf"�UW#�y�y�6�rJ��|X��-f������n,\G�D*E��U��=lE���F�F.#gq��d
\J����\F���xT`�ug��L2Vx�%=�dj�L�����ӥM�&���]2%P�pP�A��Ki�jJ22��S��L�W���<,�A��2%\�Hp�Y���)ᢪ�P]�{"SB�����,��e��z����d�v��W|�L���E�"`�4q�Y2���g2-���)�J-�UJ�,��)�{2n�Hya%��L��ᜫ� ��)�qF��m��ǬLݑLK)����~�*nB����C�b��7g̼��Vv���"��d:#C�<���θ�CI�rǛ����A%��.p���LY
b?�߫���Q�X�q	�
�ma���y����Fn=����r[�d�N�0?�0�J|Qձ�c~�����+D�cI�{"DBƲP�f_�����IA7�܎��]P<���U���('3>\1��I��Of�m��|��dؽ{�Z����7�M{TO�����^��B\�+����rE\(���P<������Zxr?Ϲt��Z�iE\���c���a���B��kc���馕c�7�H�������!r�-�y����劸(�>t	{P<���6G�9�|�8�Vcߴ".f��e0�m��T5�1H���4
�n�    ���������Z����'{�T�
�C���wv��+8{��]T�����(�����z���������o���O����������YT�K��)S��-��k���?%�c��
ؿ��q��p�����}=���n� N�ȸ�jD��{믅�����\�K?
��d��S���ρ�h���~�8�Dr�n��Ls/��ݥ~��|�SƏ�ܽ���2�l@�h��?%Y'Q��ǫQ�D���k�ͧ?%��v��J�{����D��S�Y�}�k4%\���᤭Fjy����ib��P ����%�x[]�~��u+<����'%�!�7f;�*`�{^٨@�Abs[���F~�[���~�-d��-	p����!�Q�� ��W!��QP��\��Gy8#t!���ny�c��-B|1#�4㷘���q^&��4�x�y5��۴h�1�Of�|ew��~��ݘ�.�)�Ip���ς2�!A~�)q��V��X��3~�-�i��`9��ų��g��x9�Dn��g������c�~�x!��,H�'q��}��ǫ�]�O�̼�(��޻��\V�i�ޑP_���>���tC�sSn�酻
��p9��Q_۶,���%�]Q���>(��,p��'#�i���
YJ�2�
��b���	I��h�d�jH3�'ϑS����o�=!�(C����%�o�b<��0�E@�pF�J�Yv���m�����Y~��*%3�B��WO�o�uW�`P�φ=?y�D4��_���2�ʎvS��G�� �D��L�?���7�Ht朗e#�x8#s]�{��5O>�%��G�<���fs��ԯw����$݋0?v�*kѴZ���"	5<�J���������O��+� �����;W�ZJ���f����O6�[B_��a�:�e����G8#���?(P�(hœ��ms�[阃���{k�{��V��L��)�"`~6�7S)qJ�%�7�}���~W���ǡ� �D��LU�s�Z��B��9�ˌ$�x8#u6��Aœ��Q��)��w1#3V�V�,v�+�\G��ɩ�*�_G�!�.�</��9.#�2�puN�_�EA%�R6N@�pF�l�Q�4���n�̳%���A_����c���a�=���1͑Sκ�h�7��"pCG"�]���䎖���_��78+�9����o���
Y���`�[V�3%S,�I��;�y�%1\c�g��dϤ��!7)�$�!	pY!~ ��_
qQ /��U@�lF�]����������f�ߴ"�٢�s*���ٰe��$H��LqH-�"��U�ߪ.pO�Hȫpp��"Q4F	ųAM�}]���xܨ.n����Y�A�T�<t��d�5�7���l�~���l��K����p)�3%��2RT��Kz|)�EaP�DU��I[���O�A��F�޴".f���a̏�]"m�;j~q+�l�VIù�{B$�D��;%��d�������B��٥��ٌ$��BG�Q٥�$�2�`��V��۲�Q�,�앙LCu��,�F��(������ҭ� ���2�����\��B�/
�DIvdų�䮐���\U[�$\�T����L�N�d#`~4lڦ�qܳ��m(�̔(���[�2���9./D �kDT�Kz|-DPP�E�6
(��HT��JN0;?#(�H���Έ�eWܳ�Y>l
�v�'�¼����%�ϥ�B|ᦆj�\F�/d�tJ�E��!�(
{�uP<����&�3��hT(� �i�{�/fz9M�v�a�]�m�����#��>be
EF���E�BՌ ��B���`%=�����l���ጄ�PLRΌ5�(�D����L6��&`~2lO<�X���Fz��&�p�"L��
pY!~ ���1&��_
qQТks��32�cr�+�e�|n3�,��oZ3�Fi�a����w
��Ѩn)T���\x��\���L������AQ�˗9#�S<��y-�T�9��~5R[�����xE\��ZL�f�����<��体l:^�(.�R̝���"���]�2B|!+8�2�=�p�}QP"Ũ���ጌ�ë@������"�\�oq�}1��c�O�]��n��w��l4WDr�re��)����je.�8�;c)B#�yC�*�[�_�(i��!�=�d�2������4��#
�V��,�x2��bI#�l�<Σɸ|������#��?�(�2/��m���� ������i6�ێ�n� �\�(�_%�=��@�#�eE���^l���s0�}�R�yO�<4O>J���ӝf�7��6Z6"�>�Fn�Q�;�����k��E5�޷�P݊���Q�2�C��M�,��3RP��G�Fvk��)5��QM�f��U2�D2Tm���h�[���p�<��9.#�2J��3����G�����d��B��o�,�y4ϓ�yk�U�k4�o_�~�6��R�d����x�Q$_%�۝��A��1�c-\�˴\���BF�6�wI��~��C\ߝ���ſ�����"9��㘍������OK���$�y���7�G�pU���o��p���q��+\N,��Q���슳��P�WhA�9��c��ݾ�X[����hh��{_�	��
�c:_�
�R�\6^��,*�@��5"D����)S�M���%��L��$��;�9�ɚF���޶.z��5��V@�u:~M�i3	���8Ҷ��W�ߦbN
KH0���Z�Y�{���F���'�C4*[�@�dF��Ӆ[P�@u.�Ӆ\��ѕ����,2�Zœ�T�Z�ĥ8͑��#��r��!�Ŭ�996�a���4���
����N6��=!��O���B2�8ĺ'I����F+����(��Ȝ��J+<��4j빋��]C���ڥ9x�a�6��P�����%��M!ц=%.{��&Rڃ�����7!�B�� /�x8#y���\�<y^�y�Q�����^�V+�4n͋TO~��jI��Laɿ��v�ĕ�9��Ȑ��~�nn�i�6k�A��.k9-O�!��ųȋ"���|P<Q��M+��\7NfdM����|��WB�h̏�M��!Y��Bg���F�^�	��3����e1Y����[\֒�ٌX������KP7;�����b�a�{(>g~4����
���s[�ld���u�ڷp)K߼�4./D #�j��B��5����S&����q6"��X�z�'��GÎ�|��;��Fy�3.Q�{B.�B�� �=�-d��R\��_�����&N(���A^�ٻU2t��z�O��u�%�l�
Vj�9ۄK��1e'�=�mBF���{I�o�6Q�D��[�f{�Ei�Fdw!j���1}ˣ��[� 5��t��ld�F�9ߣ����E����XE���m� �ݼ2�l��sf]̺i~\H������V)H�5��(Ѵ����J
�H܁p6r�ؒʷ叙T�")@�I��L*��.��\viX�jys+I��'5� �������>�o���֝V��Ϙ����hه�3��z����c[���iZ�cjh]k��3��%��R�����ų>�`r�˯=@F��h���?[{J3����!?�6{����t���J\�ǮI����ޤ�l6g	.3���N� �_{2mۡ��l���lyF�<�ܿ�3������T�賩a����T8p�� �]{�T�m�U(RØѨn*�T��<;�p�U4O\FN/d�6�q9���\�xD�
B��\rN!?���lt��b�?����k�&�56E6���}0���H��6oj��d/\r��;�s��N�B��h�VK�^��M��J��(���O&{��yX y,�l�dO�_���6�sd�O������s_�l�W��yZ�76�.YW���c-\��3ub.p�S�'2]l*���TAHZ�99����{�a,�����0��J�'���[&G�dT�9���;����S�u8)29<�q� 4  �a!z*&Jz�:��eD�vQF#r}�}
�y�~12 ���ƿp-|��8�sܓC��,�"�b�ܪ6�-D�V���'S�R��X���22nCX�j\~�2��c٣��?[zTU�!��
Oh�l�Q���G�Q�w.���#;Y�W=nN�K�(K�^���)p��h��Q�q���������]z��9����.�+��ٕA�������m0s�p�_b�ܳ�G����N��=?9���3��voʔp5�w'��dJ���	p��g!�Z޴��?[zt�̺O�'?|�G�ŷV�M�Ĝ蠫�0�R������g25�kZު���>*Θ���C�B武Ip��<���['��L�L���<�z�3���n��|��W`4��hj��K�`�+��^��Ki�6�i��S�N%��d��D���CO����ʔp�4�$��L	7#�w�L	I(j��P�N�M����ӫ:siݽM��L�@��&`�Dy��[K���4�Mu�"�	�D�-�q�ޝY��@AYc%��L'��خ{��Ȕ���>��e��"as�Lg�����dJ�tI#H�y)M\r
K5u�Le2��ɤ��g�
�2�Ŭ�n��둣�t	.'S�Y�!�=�)!#}Z�_�2-f*�|r忊�(�E7�&�	��4�̼�赇<�J��S�ּ��y9��� PwWӉkw���%���dJ�5H�pOdJȆ�,����L��F����o7�Q��7o�B�S>�0�R����nx���4�ii4�q�ӞK�\�KK����(O�M�p�.,�s�n\^���,��ǬLÑL3](��76jԐ]/~����5��2�V>Jl+ˮ�y^�2�Ts���EQ�5���T�(r�$�孌��|���V=����ꖑ5-���h472���$ /f�ʊMN�̮�K����!�=Y{�c�lvc���wB&C�'��i�v<Ч,�e׈����wI�/��>)��e��(O�Èa+����-K�VpU���w1�F���ϙ���mG�`�nܳQ��m��"��ܭT����W�������1/
J�g�͕�������V<B�}|K�֋e(t��'Ît�Y� \������Дx�+d�"��?��
q!�P�J��ǗB\�b�Z��(Έ[Y�3�Lp�ݮ<�y�w�.fd�M��h��P�2w������7ywϴ\���Ț��pٓ�2^֣�*l�E�Ȑ9TP<��Lki#-'��[%O������AZ�g� E��,v����q��ܜm�]!��pOf����u=���7f�("�*�ו3�g��-���<�R��,�+�^b�����Y$�j����و.�tnk7����K#{�<�=V��E�����g��浐�C9u��y��]�'��(�V�d g�<	�߾�'k�<��`��2y��������J��_܍��r�J���=���Ұ��h�������ʟ(���'��S���S>*�"�2-�F���Ɯ13�򅋔��ܓ+*S�#����)Ŝ���r2.L	�5���22.U�B����k��Tb���GV�6=���E�n^�"'U��E<]X��_����@�4�oN*�.f`݅Oq�I%���z����k�Q�B	�מ2/���B�ݝ�@q3���M~��d1#7G�A�̮�K�ѰN�g�'kON���(�YQ��;��1(��nDQ�\v�X�	��_�EF�>�-�Q<9�NܱU
WLIg��S
$�o�;�J�$�φM>H�cY+�l�>��{�)D�E	��n)g�'B$dlMWI�/�<�r>��g32MIx#ot���ܱq�I�27.f\����3?6����������,%+�^��`.��e�w./D S�hY��k!�˹�Z@�lF��%H�����g�#���wy,.fJ�#�hv��h�T�I�dE�Y��\���Rۗ�fH���;Yfo�g��Io!S�Aj)Iz|i���'�)Έ�H �wŒ�F�҉j�VR�77�2Wq
��<v��B�U���&\�t��pOf��)s�\����7fJ��?��)����Ȇ�Q�+����������7 E      �   N  xڅ��N�0F�ɻL4��Y�H�4�F�$з�H�� ]�����ͱ��a��뭅$j��V9�[Y��KOr�דq�P�a���ɑ���Jz"q�pk�Q4���#��]���px�u��;��ԡ�������|���Ѐ�V�pG�K5�H�ߟk����9];j���ɶ�%_/˾��;]�3Z��=a���y�a�[��9��ϫ\$��{�:����Y��������QB��,���߯��m�'���pZ��9<tD8>4�'p�֯�߮[���6j�����c���)�t���P+5���ڏ~�����v������<�]      �      xڋ���� � �      �      xڋ���� � �      �      x��][r7�vV��)�� R�����/a ʲ-�j���4c��qɥ4%5ԧA���GJ�>���@j�B�-d4h�+���"����j V��/2_���o>9c#���5Ǿ��"��3 �"w�>p�������g�/^����O�W��U�~~�����?�,9��8�c���o���?�����Pu�>��Hs0�i(��3H���jFu�i���賥��f��7����|���V�Bb� � ��7�Ɯ�yzv�1�BZ:iӌ��a�C���^�������2_�v2�002{�_֓u����4��Cl^�A���O@ګd�� -���|~���~��ޮ85�D�q�>���z�c��:��G+�x���u���>���b�|�1_G�^_G����B	Qַ���:5#�#���l���έ����Q���V�j��n7����4�o�G�O ͹�6�ȣ��4bvἓO���vV�4���r�����Ө�g���6��?q�V�{#��|D�Eg��~�'�PRt7·�d5���o�`) p��M�G7�Q��|	�v:(K͂��\8]��:������?��rŹ�;�v��ؑ��W	�"ۼ ����$k<:�t�-�BPe��Q:Ӧ���aB���zv�]�ѡ��&�c�G�,��=qز`�;������^�'��O���\�wږ;�z�L:���BxP��GX\C�,���n����A'$#e�"�?B ���^�sO�\Z�h	0Uqh���)�7 &5�[��_q��u0/P�}�D3��(�c�T��yL��{1�R����y̰$��MO�lI�J��]���)8�Q����a��G�3$L���Rv�U�����-�i����=�*d}���G$���R��ҦH��9�c��\H;��@�D=�_Ubh^L@Qo�*%�q�imF�RJ*%��(%�D	��������ibF$���@���C�76,�W����GQ�}A��Z1����Mkh�>JX�[>J��+k{�'����`Pt�Zp�� ��M�5CB��7̛�!e=�S�	�'�'+r��8�E��}�V�q�}��+�2Ռ>_��3�߉>zB�K����͌�&�����)�]��QE.�9Y�!Rl-��>�ö�^l5h��Fz�w��>,M�z��T�����1�5�%#�*]����e�a�ӌ.O�����q1�#��$D���ޱ��J7B-��({:�ϝ�ҍ�B�|Q3r��v��[~�=����?�]B�0 �1jb�svT1#
�XSu1����{�ǌ�ux���"�DV����@��mubR���Rp/���N�n�N<���ي�����:1#I��q��z-��p/S�Ga��M�����Jp�ד5|�q��qi����Y�GD�i_=.�QO�&����Q=.�;�8���Ct.u��u��8���ӥ�=���Ez�%p&�[�qw�[�L�
�c��0�ꁎ@����3qo�2�蒿��)�7�=���.Ȭ���zoҞz�4�x�'l��Q)�18\��)=|5��)p���f��nj�J`A��9���ퟋ�к�3��?�Z1�32��Ŏ#�y5C۷z�pY���;��"�5~N� ��^��	��݌ЍV��,/Å�c.�q]z�Uܶ���J�6��w�u9�+v;�_8�/x2�0�u�
HV�A�۞�$/�3$��ݰ�?s�-�%�_���M;����q~�&��w��u����Wu���K��<݊���mb�Wm��N�.���7�Q}gZ�T��}{;�"?��� ws��?��rk�[*�c�xh�Fq���f���Zҕ_8�_8�/���?���@���Lu�V��A{��V?��K��G�Es����:��|0zzзmk�M���t9�x~��)鏫��ѿ�Ftܪ
`�O4��7��Y�a�~�s��cY�`fGTT�J�fD�G�!����"-�i��-�5���p�v�I���o#���I�.����)t�81��(t.�B��C�~�1���S��8Dv�F�l�f�������U�J�	��]�Q��htZvA����H#��TN��	���C�]9Y��!Z�iIm�7=�	��u�In?f�&��f�Y��G�����;�����,��C���eښ ߓ��>��A�vjK=֣��=��=Z�ԁC$宥>	7�ib� @]�O@/��Q�i��*���4N�֧eʮuN.֫��Q�-�UU�r�T涓O�>Z/��������ж�i7:���b޼�7S��t��;\o�u}x\�%����}���YGũ�/���we?֞��O�l<!��&�Q�@�Rߎ�o���C�\��Ť�=�\�i�#�a��~�<�͙��{-��qD'wZ��`���2���zB�'�8?�3���[����n�.���xg��3�F�A
�65��g�r���iºm� ;��1V�Е;8�;`��r����Gd��v�[NI~@�:i�|�?���;��?9��C	�Be��,�ms%����?_:����%��Y��c�2.(�mk�2W��ϙ����_�-8����+���Hw���q����Dk/��ƑU��F�B��e��l�4���W��K8���N�>��,͉="��f�m[a�O`C3\tK8Va����0��i��mYB%�͑b���e	̫*�T���Ղ��okl�W{	��9���Q�ȍ����ew�������L	;M���ƻ����v����x���U2V��N�xg֝��I��d�|�@��$q�ZV�}�N�N�kt��4��̏�����F\��)���*�d�ŷ+Ni���t��ꑲ�M���c �n��eS,kwxiu���ju;����T��ij�l�����\}�����Eߣ�h
��Ã���/�����f�m6�M�/U嘪b�_�{-�M1�t�/�ȮB�I�)t�8�3�"���41�w ��6r?��Ҟ��}1�U]�k7D_�l�.�iS
d�=��o��~��&s�h���¼1sp��EkL�^s��Y�@+�CEȳyl�R���ej�^�a�બ24��kږ9ȽW0U�!��F��3Gf�4�Y�QY����1��I%���Ucr�Ƅ.6�)G
�ӬN	)���[$�P�6�	6\H;�[$-ꗤD�&	��֘�ȸ-�I���0���Gfk+4'��;�(?�G��O�h:ؖ'��L�i�g���<m�K��Ӧ�}vS� �0�C��Z�Yy;;B_Z�q-#.�2�20Yߜ�W�`	�,]��_Z�3Z��}f�8ћ��0����N�2��@�A�v�.��:5qe4��X�gޮ7�Ov�YWU�3�\�U�P�2vZ�L��zT5��F5{���Wֹ1�rAO�+�����qz��[q�9�&���N��ⶭ�(�TH�*��W�A_+p�''�k֌W��-�Hɠ�X�'�I�b��t��"�ǈ'�&�9[TW��8�G���S�4�F���x>C<i!�r�V�g��FCWtQ�{���v�Z�]�'-'���xWҜlQLܖx�\%��"�ǈ��5��"U3��v���t~{ӿiӌ2
���Ę�Oʽ��)Z�gb��;�C� �@��B�]�1��tܵ�C��E��P�%]��
9���5����V *S-�i_��	��:c�x1գL�0�:*���j��+�������4Chv�mV>mX�fu�$^����qD�\<xTO�\���uD����m:�w5ۛy(4^��c��0��;XitZ��!���-+�66jv��\�� +����"N�nh5�~���9q��[D��ӎ�i�(NC�b�����k7�?��е�G��"o��;�c��y�j��1Ci� ��B�1m�l����v�[2g_|X��RF�u��
Q�p�<U��k��]y�ߑ�`�9
��}�ܓ</	7s�#8���c�U��!�D��l�#P34�Ve�,�A�s���Am&��>
q_�Y��QY�wqσ���uM9R��>"����*9F�j��k�<�{��n��,�B l   �E���LiP�������ӡ_5�!�ܡ���}��r�H�6�~��j|؏y�o�x^�`��S������k/�D���Ý���������?��^��      �      xڋ���� � �      �   �   x�uP�NA�}_�����tTQ"��i�u$]�>��!�����an�$-���PD	�ŀ���@��e�_�Fu�Pk��H���)a�&��f54��e��t��&}�r<��f`r�C�~D������rzz&x��!ptd�d������*��k=�-������>W�C��Cf����*�G�{�Z�VE�C��m[��y����bB      �      xڋ���� � �      �      xڋ���� � �      �     x�ݜ�n7@��W�jl�>�U�v�ES �c@�3 [�Fj����r�6��Q��tIP�W�rf���)�A(&!�2��e�B���1Ȳ� ���i���V��ʪ�Vo��.^�7�.Ԓ,�K��]|o������=�t�݇�����:췫��;7�v��K_'�n�}3��n��^��7�/P��$�����͍�"���k�8ۋO����(���@A+KP��/���������N���"����!��q�e� [ KiK ��C����W�޿t�~=�_vw�C./g!�&�ޗ������n����9Qp`�{�R�],mm�Z�Z�t�9��ή���I�I�j���zc/��P;�K�1��6�cm�=�6|�ಙS�B�K���r�Ɛ/�P�J%L	���n�������.҇!PRf��3��]��e"� �ׁ�F@�
��ǟ�սZ��Y,�=�!!c�	V��D�S��q"�)���$���O�����D�S%:Ƴd|���x��O_�63P��Y�|ҽH�PM �� �L��[3�z$N[���s)�pS�C_�bݭY&g�_0���w]� \sk�&^�C�
Dy	�����ͭs���w�qȥ���-�������|(İx��;���wj������q�J?��T���*a�*@9m�ll�yQ�j�%�m5�aƶ�/�c[�W����S�k2Cx��(lô<*�C�-�F�xN@�I�d���6� ���Ӗ77�l�066�`Z�bM�l�6��� \�&[��93*ڗ�[�&��!6�/1��z6�*^�CkW�)�m�U����8�Qʧ�䄨�lr�%�lr�Ìlr�d�lr��lr"��f3�!���g�T�`8A��lRR|���ƟKQA�I��BU�bm�l0D�����6�"^.�F��"U��M6؄��T ,u�_�Ϲ��/�����|�:l��H��e�כ����=SK�|��H���kb��?#�4���WW�[�B{�j*M	�M�u{�1�0^����<G�3��댣$�:�r�z��!I��T��^gR�k4C0�}�	X�+D�ǌ8$�!��x�=�	��^���Ӗ77�l�,l�T������u��=�!Hx\pM�n/D�m��֗�[W���M<ڡ \�&��kl���"���l�� }�r�V���O�ɬ�$l2ے6��0	�̖̄Mf+@�&�)�5�!�Z��k�D�xN�2�Ԡ9n�&1b�-on����:�
�%(ֶ�� �����Z⋤i]�loؘ���<��\��m�E��,!+��um�=�(�4���ۄM�G9��Qp�(ϱɌ�$m2Ӓ�6��0I�̤̔Mf*@�&3)�5�!a��B`���T��AJT��AZ�I�i˛6���q��R�bm�l04>����% ׵��
�rBB��[�&[l��{�K �k��� �X<�%�6a�-R"
�M^�K�t�̊J�&�-9a�����l�L�d�$l2��]��a coG�I��H�9���}��M�$a�-on��%@�x��l	��m�A���0�k_pe�l��m�*���M6�#q��� \�&�ë 1�	b�e	�m�d����%,@y�MfD%i������L�I�d�d&m2S�6�I����^�iE\��>�=�A�(,���^��6)eȪӖ77�\��4t<&W�ź6�&`�ܙf�� \�&[ċ��	O�T	�um�M��E�����6�&^)b�:V�<4`�-R�2�}ʧ�䄨�lr�%�lr�Ìlr�d�lr��lr"���2��7WWW� �}�      �      xڋ���� � �      �      xڋ���� � �      �   �  xڝ�[v[9E����^A`�GP?|����Nd[Y��H$���yPYK��,[�c�|d����RH����Ey\q�p�=���#��/Iy�5v�&{NI����+6o���e�`���mZ�^%�JSV̫ϘdJ+�԰��.MG�$m��{�%Q��ʮk�l=O{7/��_��!9���4|��O�����\c{�d��f��?�L�5\}��l��F
�Ϲ�KB*Q�O�i5��t��R�����X�9��1�������C��l���GZJ�3[�u��3��Kn��BL����&>��vbw�a�w�'v�����~�5�b7$���H�l��8��t�C/�����g��{�q�i��{�8�%��MV����f��Z��.a�ڛ�@[�f��g.<�9=`W�=�^���]�d�r遥���bw�ƾ�=�r������2,s�2%{�z-�+]4�JM�aJI�u����|T.^k�EӘ�[����ik�lX�"��Z��J^xz߽ƕ�z�΂�����oإ�e�~����%Y�����`�g�O�j���Ô�i�"�5�oeD�B{�3�k��)��Է5ݱ�ilk�[rF�u��Rm+�<s���\ُ}g�&v�]�J�z9K�X��+�ԋc>3��v��r�+���H3��֡4
���>(�P���C2{�!\�iO@Q��M�����%T�cS�U�Y�T� ����,����X�-�^���]��/�X����P��Saf��g�1��&�=�������F���m�!uT�ɹ���\���c�X�ճLe&�Ngˈj��`P�gu�i^�%I���Roa�r�7��:���ݟ�nd)܏�fy��Y��gCTV*6R�j��f&#d�s��%�)LG��� 9�n��n���ŤL���=�������R̽GﾚI�8�Հp�#v~of_���ݶ��v�������n�7��Z�a��c��DW`��ÞL�//�Yi�F���-��H{2�4X�i��;�D��ζ{�(̤�vƒ��b�SQ]�U�?̬�;ؽ^�;�~�2?�e=׊S���0����;T��a�cDK@D7���\3s�ȉF��ݴYݓ�o��8���j8��d$�d�N���̞O��7<"-.�a.�w|�.�x���a�c�k����]��H+�\��nU�=%�)5����-���Gm���#�h^���蹄N8���
�t$�������

GP�@�>`�jzm�w�?ag�C-�]�W]���])�~<J���̒��_���"o��G)c��c�Kl��H��B�;/!�,2D��C�R��Ơ��1|aE�eI��`#� ��� ��?�$�\���w��`W���+	�q�S�NQ��S��S�ۇ�FL�Y�I���QfQW\�1l�AD{`��2��a�q��h1HL:��*d|u��x8f4�+�2G�VƲ@| �dȿ�+���^����m��.MGB	JocG�.�A��6��1��c:�v�?��ߑ�#����c�H��$كDRxȔf�&ї��6�.9q���>�g��hH=cW)�7v5�������NkMDUt�����0M�t�̡/�E&��Ʋ���hBĴc]�h��ke���VZV���4Lm̐ڢ]�T|��H��c����Z_[���o��Ӂ��Y�o��&�b+`�P�̋�U�QF ����zt29������`�w@��dO�xN)IFp�,i8F�]<���f~#�l>�1;����^[���/�E\���:1����B�m�x7�'x��ي����r��a'���ZΥ���D�P�m��[t�-�ۃ�c�m/�(����pJ�.f��NC����a�w�ac�G�)&3������P�aPRF�hӑ��<����
3�8�����p���VФ�ԩ
��>�i:>�:	y�ٹ	&4'�J�����]���n�7체~���V����H��a&�k���ٵK[PZ���ό*��Lb����l�j�����r\L���IW-�b� Nd9j��8�mh�1?`'^[���o�aA�R�����ۙ,��0�-"��jؒ�z_a��e<X]���Mg�X@��gT�k�e����NE®�C������K:��*���/x�G켾���߰Vq5��Y���ޘF���)�1�8ڹu),Vv�l�3��:0,X�� �a`5��h�<Y#�a�p��~��(���kk��vn+��V+�\\�#�����_���BcRO����3�>��\-�8�i&�tNt�`�S`�P�26����e
15�U�A��#"�T;��I�Ɗ$wWf��ʠ�Hw��	Ã�`�zʍF�\�(cm^^tv{��ȝ\q��v�H��㻞��m��~��W,��f��`l�4"��:x�['J'�-��������%�o�d��C�}��mn\�
y���>��\��Ǿ����?��n�'�\�E&������7.�V7�/Q�׹u/qg�(/�R�'�����F�!�F^��Z�Je���{d���0'N`����PM{�u<���i�z��n��n_[��b���Vk6u9���9��*\R�8wq�9� 
�{9��A0�M�s<WTQϵ��W���(�q�c�fA
���`$�6���� =H�7v��-�^���]�Kg�W	'W�~�g?��8�i���T+�`��^�@z\�c��;ppt6X���9���c K"sbR#��m��+zj��έI[�i���q���{��H���c�`�z�7�j��H �E��E�<�m���>���[ oE�����_�ļ� ˬxr�P�3�]޳����0���Cx9�X��ad-E|#v��#��G�<����_�c\u�s��Xo�}��qZ[�NO��>׻}OG"1#Y�1B���g�L��N1��6F�x�����3��Ya?aGf��
�9�@U������Xj����|�y��3v��b���C�J�p�ǎ�͞�xޓ7'�l(?D2���C���zr.C�b&a�54�a��q��D#�J��,&�\��-@6��8]m���r���V�7�F�*����v�8�*�V�mSXȄY���UvD��'�����0�,�u���=��tj���;.R�&�U"��*!k�S0�G�$���|���ݩ��Y�b>�j'���v��\�J�9!�Z􍄙�T�8��*#l��tǼS����SD3���D�D��7������S�C�1# ��|W�Oo����w=���_��������������ҁv      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �   Q  x�ŗ;�A��ͯ�G{��u'����@)���P@ÿǛ�b�v��Ц�$�Ό�س�Ȏ�Bge�!��\ʮ.���h�M��:<�����ǻ�����������y��<�[h��P�$GG�Ka��v��p�ש..������ڶ���������Fo�|���X%h�m1�2�
�%�y��Z��5ܿB�n�?\�jh�_?ٻm�>CKh�}V�9���e8�>���q[�
5�K�1+#a����?\Fp�@�-VD䆌@�A�nP�2-�'e����!5;��l/7dp`W�Z&�fe�S2v�ː�+t_m�n����A��R.����)���e���,N�Qo�h���[#M?M$ϕ�n�p���=ZTutC��@����&e&?#c?���2[�m��xC�r	����0#��E��[��{���l����qS�
������IL1����+#{HX
��~�z�[2.���!뎚�dxd�Ɍ	�P�y�69h�̨EƆ��
Ck3�9��q!NȘ�>@�BBT�+��Rc� ]����v���wfl����B��K��?J�Ӌ����A�      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �   r   xڕ�K
�@Dי��Tu2m��x�l&�W���M "�<��{E6����<v����jy�D�e�&YQV�5��ty�����6bL�v�bmk�zI�����}?��Bx� 2%      �      xڋ���� � �      �   �  x�՚�n7���O��XU$������d,$-rS��&�l��d?�J#E2��4�J�x<ӣ�鮮��u{�z�Xx���#��*k��;O��B�XGZW������NN����٧���j	�c`
����L|"�Ǡ�5s%�.�b(��7!��|�zs��=�8:N=��D����������)���+�/�[���EP˲ֲ��S�����[l�$>DMyn<?�_(�K���o��S�.��{&p�rG&���L�t�8���+���t���������/܈dx{���ݾz]��U|F"p-����|������]���6�=�g��e�E���Y<����z]�kn��򮈜n�N~99�� �&o�9`�eQ�%Q�^kӚ,VJ]4I�k���|PEꇚ��s���%��qR�V�YD�;�k܆�^)i�qMb �Q��ƻr����r~0H����Û�y��D��%��>t7J��㯽��������A�t���1�R}��|��Unm��~Lf��G�P�5�n�G�g��jCjGN�Lحw�ZND�s4�U�
 {[_�rtײ\E�;-HĽh����F����r����r�����<9Zh�Ce,���(�~����������
Y]�-��gO�<B7=������*�1�g��Y(����
~�Uk��)���r2��k���:{ZD���uJ*O���0#�~�����+C^�o%��@��𯃋�7�3��OP`O
ռ�am%�㊢��@��3�p��đ[���&�Gk���e-�V�]s�2d�E�1��뢹��	�F�	��H�(�j�ٓq7�8 w����"����KL���,{?�߇�5^�B0E��w'e�Ҏ�qRJu����ۣ�[������\G���֪n��v�l>؇S�l@��;)z�v ✦�"���M!5B�NP]�Q<�|�I��ሣ���Jk=�\}�3K)�{4�)����Rˡ���KT^̈��BL�7���P��
��$��0A~0���ݻ���Vn�����M�V�
���;������,�3���.`��A�<�r6��V�Gp�`E]�1$78�끱'�{����h�'{�w�Q�	��8���9Dk��a�L?�m
���O�xw�y.w��W��h��t�{G��7��M<����Cm%Ku7:N�>oʩoN ���
��I�ԉ� ���j�RBMz�Z�^%����� ҝxA��豻*�4sJ_99�+�ކ�`�n�o�4�md����mTb.���	7��WrϼG�ez H���/^��J�բZ�|� �L��y?�v���$���)�Z���d���bU�;�����4�	�TzI�k�,c�`4HZ��8W3�xj�b����@�|���s��Pٲ��Z�j<���z�����}���~���O�6�}A�?��YG�?^>����~������|��~:�:|�b'��v-t����}r�K����g�r����b���\�iuy���]瑏7�vi�������^ZV4�1i�U-����*W��n%D�>�<V��ʍ��^񊪬M+�̈��h�t�z�4�Y�WB��v5����o���t��S����e��?���ۆ߇+�'53�dU��ja^ˊ�;��S?���{��$c�w郥�Rj(�u_E�ȑcv;:Ȱ��b:*Y�
,I�K�,�=�5�lX$.��dm ���HZ�	�c )��p��7W-o����3c���>J����7���ͫ��/����_�2\g5����e�����D��\ȕ͇�Ͱ�y�z+�2=}����(-�:�*�������Q�b.1�h��T4��f;4J�Ys�6�[�z��Z���Ҥ�O#xP��m�˶�W�k�����-e�
�o]�Ňr��`y����Ѷ�8���2�i�mI+�y]G�?u��wd��'kv�g�hP�=y4��.x���D��RM�6����0|(^��1Û a���B~�YյY�ƍэTU����/���b⍷�̈�6c�;%9��{-!w��|�w���(	E�ᛣeo�P�2�]��� I� �6�ki#�� 9�a�Y�mJXb��Q�=���3h�l����p�%�?;/"�S��<o� ����9x�wl{+���)ZrJ�����s�Ay��XO5����	�\uWL�ܵ��	���>7�3��P�Zj��-v�������Vv��L?���gϞ��4ݯ      �      xڋ���� � �     