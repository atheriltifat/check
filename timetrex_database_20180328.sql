PGDMP  	                        v            timetrex    9.5.6    9.5.6    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public       timetrex    false    185   0�      ]          0    16445    bank_account 
   TABLE DATA               �   COPY bank_account (id, company_id, user_id, institution, transit, account, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    186   M�      ^          0    16452    branch 
   TABLE DATA               I  COPY branch (id, company_id, status_id, name, address1, address2, city, province, country, postal_code, work_phone, fax_phone, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, manual_id, name_metaphone, longitude, latitude, other_id1, other_id2, other_id3, other_id4, other_id5) FROM stdin;
    public       timetrex    false    187   j�      �          0    18622    break_policy 
   TABLE DATA               �  COPY break_policy (id, company_id, name, type_id, trigger_time, amount, auto_detect_type_id, start_window, window_length, minimum_punch_time, maximum_punch_time, include_break_punch_time, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, include_multiple_breaks, pay_code_id, pay_formula_policy_id, branch_id, department_id, job_id, job_item_id, description) FROM stdin;
    public       timetrex    false    264   �      _          0    16472    company 
   TABLE DATA               �  COPY company (id, parent_id, status_id, product_edition_id, name, short_name, address1, address2, city, province, country, postal_code, work_phone, fax_phone, business_number, originator_id, data_center_id, admin_contact, billing_contact, support_contact, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, enable_second_last_name, ldap_authentication_type_id, ldap_host, ldap_port, ldap_bind_user_name, ldap_bind_password, ldap_base_dn, ldap_bind_attribute, ldap_user_filter, ldap_login_attribute, ldap_group_dn, ldap_group_user_attribute, ldap_group_name, ldap_group_attribute, industry_id, password_policy_type_id, password_minimum_permission_level, password_minimum_strength, password_minimum_length, password_minimum_age, password_maximum_age, name_metaphone, longitude, latitude, other_id1, other_id2, other_id3, other_id4, other_id5, is_setup_complete, migrate_url) FROM stdin;
    public       timetrex    false    188   ��      `          0    16483    company_deduction 
   TABLE DATA               -  COPY company_deduction (id, company_id, status_id, type_id, name, calculation_id, calculation_order, country, province, district, company_value1, company_value2, user_value1, user_value2, user_value3, user_value4, user_value5, user_value6, user_value7, user_value8, user_value9, user_value10, lock_user_value1, lock_user_value2, lock_user_value3, lock_user_value4, lock_user_value5, lock_user_value6, lock_user_value7, lock_user_value8, lock_user_value9, lock_user_value10, pay_stub_entry_account_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, start_date, end_date, minimum_length_of_service, minimum_length_of_service_unit_id, minimum_length_of_service_days, maximum_length_of_service, maximum_length_of_service_unit_id, maximum_length_of_service_days, include_account_amount_type_id, exclude_account_amount_type_id, minimum_user_age, maximum_user_age, company_value3, company_value4, company_value5, company_value6, company_value7, company_value8, company_value9, company_value10, apply_frequency_id, apply_frequency_month, apply_frequency_day_of_month, apply_frequency_day_of_week, apply_frequency_quarter_month, pay_stub_entry_description, length_of_service_contributing_pay_code_policy_id, apply_payroll_run_type_id, legal_entity_id, payroll_remittance_agency_id) FROM stdin;
    public       timetrex    false    189   ��      a          0    16504 (   company_deduction_pay_stub_entry_account 
   TABLE DATA               y   COPY company_deduction_pay_stub_entry_account (id, company_deduction_id, type_id, pay_stub_entry_account_id) FROM stdin;
    public       timetrex    false    190   O�      �          0    18614    company_generic_map 
   TABLE DATA               Y   COPY company_generic_map (id, company_id, object_type_id, object_id, map_id) FROM stdin;
    public       timetrex    false    263   ��      �          0    18988    company_generic_tag 
   TABLE DATA               �   COPY company_generic_tag (id, company_id, object_type_id, name, name_metaphone, description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    272   ��      �          0    19001    company_generic_tag_map 
   TABLE DATA               Q   COPY company_generic_tag_map (id, object_type_id, object_id, tag_id) FROM stdin;
    public       timetrex    false    273   �      �          0    19446    company_setting 
   TABLE DATA               �   COPY company_setting (id, company_id, type_id, name, value, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    287   �      �          0    17195    company_user_count 
   TABLE DATA               |   COPY company_user_count (id, company_id, date_stamp, active_users, inactive_users, deleted_users, created_date) FROM stdin;
    public       timetrex    false    246   ;�      �          0    19721    contributing_pay_code_policy 
   TABLE DATA               �   COPY contributing_pay_code_policy (id, company_id, name, description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    293   n�      �          0    19731    contributing_shift_policy 
   TABLE DATA               �  COPY contributing_shift_policy (id, company_id, name, description, contributing_pay_code_policy_id, filter_start_date, filter_end_date, filter_start_time, filter_end_time, filter_minimum_time, filter_maximum_time, include_shift_type_id, branch_selection_type_id, exclude_default_branch, department_selection_type_id, exclude_default_department, job_group_selection_type_id, job_selection_type_id, exclude_default_job, job_item_group_selection_type_id, job_item_selection_type_id, exclude_default_job_item, sun, mon, tue, wed, thu, fri, sat, include_schedule_shift_type_id, include_holiday_type_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    294   ��      b          0    16510    cron 
   TABLE DATA               �   COPY cron (id, status_id, name, minute, hour, day_of_month, month, day_of_week, command, last_run_date, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    191   �      �          0    18271    currency 
   TABLE DATA               "  COPY currency (id, company_id, status_id, name, iso_code, conversion_rate, auto_update, actual_rate, actual_rate_updated_date, rate_modify_percent, is_base, is_default, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, round_decimal_places) FROM stdin;
    public       timetrex    false    250   ��      �          0    19643    currency_rate 
   TABLE DATA               �   COPY currency_rate (id, currency_id, date_stamp, conversion_rate, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    289    �      c          0    16521 
   department 
   TABLE DATA               �   COPY department (id, company_id, status_id, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, manual_id, name_metaphone, other_id1, other_id2, other_id3, other_id4, other_id5) FROM stdin;
    public       timetrex    false    192   ��      d          0    16532    department_branch 
   TABLE DATA               B   COPY department_branch (id, branch_id, department_id) FROM stdin;
    public       timetrex    false    193   �      e          0    16540    department_branch_user 
   TABLE DATA               L   COPY department_branch_user (id, department_branch_id, user_id) FROM stdin;
    public       timetrex    false    194   5�      �          0    19435    ethnic_group 
   TABLE DATA               �   COPY ethnic_group (id, company_id, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    286   R�      �          0    20173 	   exception 
   TABLE DATA               :  COPY exception (id, user_id, pay_period_id, date_stamp, exception_policy_id, punch_id, punch_control_id, type_id, enable_demerit, authorized, authorization_level, acknowledged_type_id, acknowledged_reason_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, note) FROM stdin;
    public       timetrex    false    299   o�      f          0    16554    exception_policy 
   TABLE DATA                 COPY exception_policy (id, exception_policy_control_id, type_id, severity_id, grace, watch_window, demerit, active, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, enable_authorization, email_notification_id) FROM stdin;
    public       timetrex    false    195   ��      g          0    16562    exception_policy_control 
   TABLE DATA               �   COPY exception_policy_control (id, company_id, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, description) FROM stdin;
    public       timetrex    false    196   |�      h          0    16572    help 
   TABLE DATA               �   COPY help (id, type_id, status_id, heading, body, keywords, private, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    197   ��      i          0    16583 
   help_group 
   TABLE DATA               N   COPY help_group (id, help_group_control_id, help_id, order_value) FROM stdin;
    public       timetrex    false    198   �      j          0    16591    help_group_control 
   TABLE DATA               �   COPY help_group_control (id, script_name, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    199   "�      k          0    16601    hierarchy_control 
   TABLE DATA               �   COPY hierarchy_control (id, company_id, name, description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    200   ?�      �          0    18689    hierarchy_level 
   TABLE DATA               �   COPY hierarchy_level (id, hierarchy_control_id, level, user_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    265   \�      l          0    16611    hierarchy_object_type 
   TABLE DATA               R   COPY hierarchy_object_type (id, hierarchy_control_id, object_type_id) FROM stdin;
    public       timetrex    false    201   y�      m          0    16617    hierarchy_share 
   TABLE DATA               E   COPY hierarchy_share (id, hierarchy_control_id, user_id) FROM stdin;
    public       timetrex    false    202   ��      �          0    18697    hierarchy_user 
   TABLE DATA               D   COPY hierarchy_user (id, hierarchy_control_id, user_id) FROM stdin;
    public       timetrex    false    266   ��      n          0    16642    holiday_policy 
   TABLE DATA               �  COPY holiday_policy (id, company_id, name, type_id, default_schedule_status_id, minimum_employed_days, minimum_worked_period_days, minimum_worked_days, average_time_days, include_over_time, include_paid_absence_time, minimum_time, maximum_time, "time", absence_policy_id, round_interval_policy_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, force_over_time_policy, average_time_worked_days, worked_scheduled_days, minimum_worked_after_period_days, minimum_worked_after_days, worked_after_scheduled_days, paid_absence_as_worked, average_days, contributing_shift_policy_id, eligible_contributing_shift_policy_id, description, shift_on_holiday_type_id, average_time_frequency_type_id) FROM stdin;
    public       timetrex    false    203   ��      o          0    16656     holiday_policy_recurring_holiday 
   TABLE DATA               `   COPY holiday_policy_recurring_holiday (id, holiday_policy_id, recurring_holiday_id) FROM stdin;
    public       timetrex    false    204   }�      p          0    16664    holidays 
   TABLE DATA               �   COPY holidays (id, holiday_policy_id, date_stamp, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    205   ��      �          0    19375    kpi 
   TABLE DATA               �   COPY kpi (id, company_id, status_id, type_id, name, description, minimum_rate, maximum_rate, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    281   ��      �          0    19407 	   kpi_group 
   TABLE DATA               �   COPY kpi_group (id, company_id, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, parent_id) FROM stdin;
    public       timetrex    false    284   ��      �          0    20384    legal_entity 
   TABLE DATA               .  COPY legal_entity (id, company_id, status_id, type_id, classification_code, legal_name, trade_name, address1, address2, country, city, province, postal_code, work_phone, fax_phone, start_date, end_date, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    303   ��      r          0    16684    meal_policy 
   TABLE DATA               ~  COPY meal_policy (id, company_id, name, type_id, amount, trigger_time, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, start_window, window_length, include_lunch_punch_time, auto_detect_type_id, minimum_punch_time, maximum_punch_time, pay_code_id, pay_formula_policy_id, branch_id, department_id, job_id, job_item_id, description) FROM stdin;
    public       timetrex    false    207   ��      s          0    16694    message 
   TABLE DATA               �   COPY message (id, parent_id, object_type_id, object_id, priority_id, status_id, status_date, subject, body, require_ack, ack, ack_date, ack_by, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    208   S�      �          0    18832    message_control 
   TABLE DATA               �   COPY message_control (id, object_type_id, object_id, require_ack, priority_id, subject, body, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    269   p�      �          0    18818    message_recipient 
   TABLE DATA               �   COPY message_recipient (id, user_id, message_sender_id, status_id, status_date, ack, ack_date, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    267   ��      �          0    18825    message_sender 
   TABLE DATA               �   COPY message_sender (id, user_id, parent_id, message_control_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    268   ��      t          0    16705    other_field 
   TABLE DATA               �  COPY other_field (id, company_id, type_id, other_id1, other_id2, other_id3, other_id4, other_id5, other_id6, other_id7, other_id8, other_id9, other_id10, required_other_id1, required_other_id2, required_other_id3, required_other_id4, required_other_id5, required_other_id6, required_other_id7, required_other_id8, required_other_id9, required_other_id10, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    209   ��      u          0    16725    over_time_policy 
   TABLE DATA               �  COPY over_time_policy (id, company_id, name, type_id, trigger_time, rate, accrual_policy_id, accrual_rate, pay_stub_entry_account_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, wage_group_id, pay_code_id, pay_formula_policy_id, contributing_shift_policy_id, branch_selection_type_id, exclude_default_branch, department_selection_type_id, exclude_default_department, job_group_selection_type_id, job_selection_type_id, exclude_default_job, job_item_group_selection_type_id, job_item_selection_type_id, exclude_default_job_item, description, trigger_time_adjust_contributing_shift_policy_id) FROM stdin;
    public       timetrex    false    210   ��      �          0    19675    pay_code 
   TABLE DATA               �   COPY pay_code (id, company_id, name, description, code, type_id, pay_formula_policy_id, pay_stub_entry_account_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    290   ��      �          0    19686    pay_formula_policy 
   TABLE DATA               c  COPY pay_formula_policy (id, company_id, name, description, wage_source_type_id, wage_source_contributing_shift_policy_id, time_source_contributing_shift_policy_id, wage_group_id, pay_type_id, rate, custom_formula, accrual_policy_account_id, accrual_rate, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    291   ��      v          0    16735 
   pay_period 
   TABLE DATA               *  COPY pay_period (id, company_id, pay_period_schedule_id, status_id, is_primary, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, start_date, end_date, transaction_date, advance_end_date, advance_transaction_date, tainted, tainted_by, tainted_date) FROM stdin;
    public       timetrex    false    211   �      w          0    16744    pay_period_schedule 
   TABLE DATA               �  COPY pay_period_schedule (id, company_id, name, description, type_id, primary_date_ldom, primary_transaction_date_ldom, primary_transaction_date_bd, secondary_date_ldom, secondary_transaction_date_ldom, secondary_transaction_date_bd, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, anchor_date, primary_date, primary_transaction_date, secondary_date, secondary_transaction_date, day_start_time, day_continuous_time, start_week_day_id, start_day_of_week, transaction_date, primary_day_of_month, secondary_day_of_month, primary_transaction_day_of_month, secondary_transaction_day_of_month, transaction_date_bd, time_zone, new_day_trigger_time, maximum_shift_time, shift_assigned_day_id, timesheet_verify_before_end_date, timesheet_verify_before_transaction_date, timesheet_verify_notice_before_transaction_date, timesheet_verify_notice_email, annual_pay_periods, timesheet_verify_type_id) FROM stdin;
    public       timetrex    false    212   ��      x          0    16754    pay_period_schedule_user 
   TABLE DATA               P   COPY pay_period_schedule_user (id, pay_period_schedule_id, user_id) FROM stdin;
    public       timetrex    false    213   l�      �          0    17187    pay_period_time_sheet_verify 
   TABLE DATA               �   COPY pay_period_time_sheet_verify (id, pay_period_id, user_id, status_id, authorized, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, authorization_level, user_verified, user_verified_date) FROM stdin;
    public       timetrex    false    245   ��      y          0    16762    pay_stub 
   TABLE DATA                 COPY pay_stub (id, pay_period_id, user_id, status_id, status_date, status_by, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, start_date, end_date, transaction_date, tainted, temp, currency_id, currency_rate, type_id, run_id) FROM stdin;
    public       timetrex    false    214   ��      z          0    16775    pay_stub_amendment 
   TABLE DATA               a  COPY pay_stub_amendment (id, user_id, pay_stub_entry_name_id, status_id, effective_date, rate, units, amount, description, authorized, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, recurring_ps_amendment_id, ytd_adjustment, type_id, percent_amount, percent_amount_entry_name_id, private_description) FROM stdin;
    public       timetrex    false    215   ��      {          0    16789    pay_stub_entry 
   TABLE DATA                 COPY pay_stub_entry (id, pay_stub_id, rate, units, ytd_units, amount, ytd_amount, description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, pay_stub_entry_name_id, pay_stub_amendment_id, user_expense_id) FROM stdin;
    public       timetrex    false    216   ��      |          0    16804    pay_stub_entry_account 
   TABLE DATA                 COPY pay_stub_entry_account (id, company_id, status_id, type_id, ps_order, name, accrual_pay_stub_entry_account_id, debit_account, credit_account, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, accrual_type_id) FROM stdin;
    public       timetrex    false    217   ��      }          0    16814    pay_stub_entry_account_link 
   TABLE DATA               :  COPY pay_stub_entry_account_link (id, company_id, total_gross, total_employee_deduction, total_employer_deduction, total_net_pay, regular_time, monthly_advance, monthly_advance_deduction, employee_cpp, employee_ei, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    218   A�      �          0    20443    pay_stub_transaction 
   TABLE DATA               @  COPY pay_stub_transaction (id, parent_id, pay_stub_id, remittance_source_account_id, remittance_destination_account_id, currency_id, status_id, type_id, currency_rate, amount, transaction_date, confirmation_number, note, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    308   ��      �          0    20394    payroll_remittance_agency 
   TABLE DATA               �  COPY payroll_remittance_agency (id, legal_entity_id, status_id, type_id, name, description, country, province, district, agency_id, primary_identification, secondary_identification, tertiary_identification, user_name, password, contact_user_id, remittance_source_account_id, start_date, end_date, always_week_day_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    304   ��      �          0    20405    payroll_remittance_agency_event 
   TABLE DATA               �  COPY payroll_remittance_agency_event (id, payroll_remittance_agency_id, status_id, type_id, frequency_id, quarter_month, primary_month, primary_day_of_month, secondary_month, secondary_day_of_month, day_of_week, due_date_delay_days, effective_date, reminder_user_id, user_report_data_id, reminder_days, note, last_due_date, due_date, start_date, end_date, next_reminder_date, last_reminder_date, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    305   ��      �          0    18308 
   permission 
   TABLE DATA               �   COPY permission (id, permission_control_id, section, name, value, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    253   ��      �          0    18292    permission_control 
   TABLE DATA               �   COPY permission_control (id, company_id, name, description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, level) FROM stdin;
    public       timetrex    false    251   X;      �          0    18302    permission_user 
   TABLE DATA               F   COPY permission_user (id, permission_control_id, user_id) FROM stdin;
    public       timetrex    false    252   �<      ~          0    16831    policy_group 
   TABLE DATA               �   COPY policy_group (id, company_id, name, exception_policy_control_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, accrual_policy_id, description) FROM stdin;
    public       timetrex    false    219   *>                0    16865    policy_group_user 
   TABLE DATA               B   COPY policy_group_user (id, policy_group_id, user_id) FROM stdin;
    public       timetrex    false    220   �>      �          0    16873    premium_policy 
   TABLE DATA               �  COPY premium_policy (id, company_id, name, type_id, start_date, end_date, start_time, end_time, sun, mon, tue, wed, thu, fri, sat, pay_type_id, rate, accrual_policy_id, accrual_rate, pay_stub_entry_account_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, daily_trigger_time, weekly_trigger_time, minimum_time, maximum_time, include_meal_policy, exclude_default_branch, exclude_default_department, branch_selection_type_id, department_selection_type_id, job_group_selection_type_id, job_selection_type_id, job_item_group_selection_type_id, job_item_selection_type_id, maximum_no_break_time, minimum_break_time, include_partial_punch, wage_group_id, include_break_policy, minimum_time_between_shift, minimum_first_shift_time, minimum_shift_time, include_holiday_type_id, maximum_daily_trigger_time, maximum_weekly_trigger_time, pay_code_id, pay_formula_policy_id, contributing_shift_policy_id, exclude_default_job, exclude_default_job_item, description) FROM stdin;
    public       timetrex    false    221   �>      �          0    18319    premium_policy_branch 
   TABLE DATA               J   COPY premium_policy_branch (id, premium_policy_id, branch_id) FROM stdin;
    public       timetrex    false    254   �>      �          0    18325    premium_policy_department 
   TABLE DATA               R   COPY premium_policy_department (id, premium_policy_id, department_id) FROM stdin;
    public       timetrex    false    255   
?      �          0    16890    punch 
   TABLE DATA                 COPY punch (id, punch_control_id, station_id, type_id, status_id, time_stamp, original_time_stamp, actual_time_stamp, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, transfer, longitude, latitude, position_accuracy, has_image) FROM stdin;
    public       timetrex    false    222   '?      �          0    20118    punch_control 
   TABLE DATA               B  COPY punch_control (id, user_id, pay_period_id, date_stamp, branch_id, department_id, job_id, job_item_id, quantity, bad_quantity, total_time, actual_total_time, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, other_id1, other_id2, other_id3, other_id4, other_id5, note) FROM stdin;
    public       timetrex    false    297   d�      �          0    19288    qualification 
   TABLE DATA               �   COPY qualification (id, type_id, company_id, group_id, name, name_metaphone, description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, source_type_id, visibility_type_id) FROM stdin;
    public       timetrex    false    274   Y�      �          0    19357    qualification_group 
   TABLE DATA               �   COPY qualification_group (id, company_id, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, parent_id) FROM stdin;
    public       timetrex    false    280   v�      �          0    16911    recurring_holiday 
   TABLE DATA                 COPY recurring_holiday (id, company_id, type_id, name, special_day, week_interval, day_of_week, day_of_month, month_int, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, pivot_day_direction_id, always_week_day_id) FROM stdin;
    public       timetrex    false    223   ��      �          0    16922    recurring_ps_amendment 
   TABLE DATA               P  COPY recurring_ps_amendment (id, company_id, status_id, start_date, end_date, frequency_id, name, description, pay_stub_entry_name_id, rate, units, amount, percent_amount, percent_amount_entry_name_id, ps_amendment_description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, type_id) FROM stdin;
    public       timetrex    false    224   ��      �          0    16933    recurring_ps_amendment_user 
   TABLE DATA               V   COPY recurring_ps_amendment_user (id, recurring_ps_amendment_id, user_id) FROM stdin;
    public       timetrex    false    225   ��      �          0    20224    recurring_schedule 
   TABLE DATA               �  COPY recurring_schedule (id, company_id, user_id, recurring_schedule_control_id, date_stamp, status_id, start_time, end_time, schedule_policy_id, absence_policy_id, branch_id, department_id, job_id, job_item_id, total_time, recurring_schedule_template_control_id, auto_fill, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, other_id1, other_id2, other_id3, other_id4, other_id5, note) FROM stdin;
    public       timetrex    false    302   ��      �          0    16939    recurring_schedule_control 
   TABLE DATA               �   COPY recurring_schedule_control (id, company_id, recurring_schedule_template_control_id, start_week, start_date, end_date, auto_fill, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, display_weeks) FROM stdin;
    public       timetrex    false    226   �      �          0    16947    recurring_schedule_template 
   TABLE DATA               h  COPY recurring_schedule_template (id, recurring_schedule_template_control_id, week, sun, mon, tue, wed, thu, fri, sat, start_time, end_time, schedule_policy_id, branch_id, department_id, job_id, job_item_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, status_id, absence_policy_id, open_shift_multiplier) FROM stdin;
    public       timetrex    false    227   $�      �          0    16961 #   recurring_schedule_template_control 
   TABLE DATA               �   COPY recurring_schedule_template_control (id, company_id, name, description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    228   A�      �          0    16971    recurring_schedule_user 
   TABLE DATA               V   COPY recurring_schedule_user (id, recurring_schedule_control_id, user_id) FROM stdin;
    public       timetrex    false    229   ^�      �          0    19700    regular_time_policy 
   TABLE DATA                 COPY regular_time_policy (id, company_id, name, description, contributing_shift_policy_id, calculation_order, pay_formula_policy_id, pay_code_id, branch_selection_type_id, exclude_default_branch, department_selection_type_id, exclude_default_department, job_group_selection_type_id, job_selection_type_id, exclude_default_job, job_item_group_selection_type_id, job_item_selection_type_id, exclude_default_job_item, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    292   {�      �          0    20431    remittance_destination_account 
   TABLE DATA               j  COPY remittance_destination_account (id, remittance_source_account_id, user_id, status_id, type_id, name, description, currency_id, priority, amount_type_id, amount, percent_amount, value1, value2, value3, value4, value5, value6, value7, value8, value9, value10, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    307   �      �          0    20421    remittance_source_account 
   TABLE DATA                 COPY remittance_source_account (id, legal_entity_id, status_id, type_id, country, name, description, data_format_id, currency_id, last_transaction_number, value1, value2, value3, value4, value5, value6, value7, value8, value9, value10, value11, value12, value13, value14, value15, value16, value17, value18, value19, value20, value21, value22, value23, value24, value25, value26, value27, value28, value29, value30, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, company_id) FROM stdin;
    public       timetrex    false    306   2�      �          0    20193    request 
   TABLE DATA               �   COPY request (id, user_id, pay_period_id, date_stamp, type_id, status_id, authorized, authorization_level, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    300   ��      �          0    16986    roe 
   TABLE DATA               O  COPY roe (id, user_id, pay_period_type_id, code_id, first_date, last_date, pay_period_end_date, recall_date, insurable_hours, insurable_earnings, vacation_pay, serial, comments, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, final_pay_stub_end_date, final_pay_stub_transaction_date) FROM stdin;
    public       timetrex    false    230   ��      �          0    16996    round_interval_policy 
   TABLE DATA               g  COPY round_interval_policy (id, company_id, name, punch_type_id, round_type_id, round_interval, strict, grace, minimum, maximum, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, condition_type_id, condition_static_time, condition_static_total_time, condition_start_window, condition_stop_window, description) FROM stdin;
    public       timetrex    false    231   ��      �          0    20143    schedule 
   TABLE DATA               �  COPY schedule (id, company_id, user_id, pay_period_id, date_stamp, status_id, start_time, end_time, schedule_policy_id, absence_policy_id, branch_id, department_id, job_id, job_item_id, total_time, replaced_id, recurring_schedule_template_control_id, auto_fill, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, other_id1, other_id2, other_id3, other_id4, other_id5, note) FROM stdin;
    public       timetrex    false    298   �      �          0    17032    schedule_policy 
   TABLE DATA                 COPY schedule_policy (id, company_id, name, meal_policy_id, over_time_policy_id, partial_shift_absence_policy_id, start_stop_window, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, description, full_shift_absence_policy_id) FROM stdin;
    public       timetrex    false    232   7�      �          0    17042    station 
   TABLE DATA               P  COPY station (id, company_id, status_id, type_id, station_id, source, description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, allowed_date, branch_id, department_id, time_zone, user_group_selection_type_id, branch_selection_type_id, department_selection_type_id, port, user_name, password, poll_frequency, push_frequency, last_punch_time_stamp, last_poll_date, last_poll_status_message, last_push_date, last_push_status_message, user_value_1, user_value_2, user_value_3, user_value_4, user_value_5, partial_push_frequency, last_partial_push_date, last_partial_push_status_message, pull_start_time, pull_end_time, push_start_time, push_end_time, partial_push_start_time, partial_push_end_time, enable_auto_punch_status, mode_flag, work_code_definition, job_id, job_item_id, default_mode_flag) FROM stdin;
    public       timetrex    false    233   ��      �          0    18359    station_branch 
   TABLE DATA               <   COPY station_branch (id, station_id, branch_id) FROM stdin;
    public       timetrex    false    256   {�      �          0    18365    station_department 
   TABLE DATA               D   COPY station_department (id, station_id, department_id) FROM stdin;
    public       timetrex    false    257   ��      �          0    18383    station_exclude_user 
   TABLE DATA               @   COPY station_exclude_user (id, station_id, user_id) FROM stdin;
    public       timetrex    false    260   ��      �          0    18377    station_include_user 
   TABLE DATA               @   COPY station_include_user (id, station_id, user_id) FROM stdin;
    public       timetrex    false    259   ��      �          0    17052    station_user 
   TABLE DATA               8   COPY station_user (id, station_id, user_id) FROM stdin;
    public       timetrex    false    234   ��      �          0    18371    station_user_group 
   TABLE DATA               ?   COPY station_user_group (id, station_id, group_id) FROM stdin;
    public       timetrex    false    258   �      q          0    16674 
   system_log 
   TABLE DATA               _   COPY system_log (id, user_id, object_id, table_name, action_id, description, date) FROM stdin;
    public       timetrex    false    206   )�      �          0    18887    system_log_detail 
   TABLE DATA               T   COPY system_log_detail (id, system_log_id, field, new_value, old_value) FROM stdin;
    public       timetrex    false    270   G�	      �          0    17060    system_setting 
   TABLE DATA               2   COPY system_setting (id, name, value) FROM stdin;
    public       timetrex    false    235   i�      �          0    19425    user_contact 
   TABLE DATA               �  COPY user_contact (id, user_id, status_id, type_id, ethnic_group_id, first_name, middle_name, last_name, sex_id, address1, address2, city, country, province, postal_code, work_phone, work_phone_ext, home_phone, mobile_phone, fax_phone, home_email, work_email, birth_date, sin, note, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, first_name_metaphone, last_name_metaphone) FROM stdin;
    public       timetrex    false    285   ��      �          0    17080 	   user_date 
   TABLE DATA               �   COPY user_date (id, user_id, pay_period_id, date_stamp, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    237   ��      �          0    20080    user_date_total 
   TABLE DATA                 COPY user_date_total (id, user_id, pay_period_id, date_stamp, object_type_id, src_object_id, pay_code_id, punch_control_id, branch_id, department_id, job_id, job_item_id, quantity, bad_quantity, start_type_id, start_time_stamp, end_type_id, end_time_stamp, total_time, actual_total_time, currency_id, currency_rate, base_hourly_rate, hourly_rate, total_time_amount, hourly_rate_with_burden, total_time_amount_with_burden, override, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, note) FROM stdin;
    public       timetrex    false    296   �      �          0    17100    user_deduction 
   TABLE DATA               L  COPY user_deduction (id, user_id, company_deduction_id, user_value1, user_value2, user_value3, user_value4, user_value5, user_value6, user_value7, user_value8, user_value9, user_value10, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, length_of_service_date, start_date, end_date) FROM stdin;
    public       timetrex    false    238   .      �          0    17110    user_default 
   TABLE DATA               s  COPY user_default (id, company_id, pay_period_schedule_id, policy_group_id, employee_number, city, province, country, work_email, work_phone, work_phone_ext, hire_date, title_id, default_branch_id, default_department_id, date_format, time_format, time_unit_format, time_zone, items_per_page, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, start_week_day, language, currency_id, permission_control_id, enable_email_notification_exception, enable_email_notification_message, enable_email_notification_home, enable_email_notification_pay_stub, distance_format, legal_entity_id) FROM stdin;
    public       timetrex    false    239   K      �          0    17120    user_default_company_deduction 
   TABLE DATA               \   COPY user_default_company_deduction (id, user_default_id, company_deduction_id) FROM stdin;
    public       timetrex    false    240   *      �          0    19299    user_education 
   TABLE DATA               �   COPY user_education (id, user_id, qualification_id, institute, major, minor, graduate_date, grade_score, start_date, end_date, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    275   G      �          0    17126    user_generic_data 
   TABLE DATA               �   COPY user_generic_data (id, user_id, script, name, is_default, data, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, company_id) FROM stdin;
    public       timetrex    false    241   d      �          0    18213    user_generic_status 
   TABLE DATA               �   COPY user_generic_status (id, user_id, batch_id, status_id, label, description, link, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    247         �          0    18233 
   user_group 
   TABLE DATA               �   COPY user_group (id, company_id, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, parent_id) FROM stdin;
    public       timetrex    false    248   /      �          0    18538    user_identification 
   TABLE DATA               �   COPY user_identification (id, user_id, type_id, number, value, extra_value, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    261   L      �          0    19333    user_language 
   TABLE DATA               �   COPY user_language (id, user_id, qualification_id, fluency_id, competency_id, description, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    278   4&      �          0    19309    user_license 
   TABLE DATA               �   COPY user_license (id, user_id, qualification_id, license_number, license_issued_date, license_expiry_date, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    276   Q&      �          0    19347    user_membership 
   TABLE DATA               �   COPY user_membership (id, user_id, qualification_id, ownership_id, amount, currency_id, start_date, renewal_date, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    279   n&      �          0    17144    user_preference 
   TABLE DATA               a  COPY user_preference (id, user_id, date_format, time_format, time_unit_format, time_zone, items_per_page, timesheet_view, start_week_day, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, language, enable_email_notification_exception, enable_email_notification_message, enable_email_notification_home, schedule_icalendar_type_id, schedule_icalendar_event_name, schedule_icalendar_alarm1_working, schedule_icalendar_alarm2_working, schedule_icalendar_alarm1_absence, schedule_icalendar_alarm2_absence, schedule_icalendar_alarm1_modified, schedule_icalendar_alarm2_modified, enable_save_timesheet_state, enable_always_blank_timesheet_rows, enable_auto_context_menu, enable_report_open_new_window, user_full_name_format, shortcut_key_sequence, enable_email_notification_pay_stub, default_login_screen, distance_format) FROM stdin;
    public       timetrex    false    242   �&      �          0    18901    user_report_data 
   TABLE DATA               �   COPY user_report_data (id, company_id, user_id, script, name, is_default, description, data, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    271   �(      �          0    19397    user_review 
   TABLE DATA               �   COPY user_review (id, user_review_control_id, kpi_id, rating, note, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    283   	)      �          0    19385    user_review_control 
   TABLE DATA               �   COPY user_review_control (id, user_id, reviewer_user_id, type_id, term_id, severity_id, status_id, start_date, end_date, due_date, rating, note, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    282   &)      �          0    19456    user_setting 
   TABLE DATA               �   COPY user_setting (id, user_id, type_id, name, value, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    288   C)      �          0    19319 
   user_skill 
   TABLE DATA                 COPY user_skill (id, user_id, qualification_id, proficiency_id, experience, description, first_used_date, last_used_date, enable_calc_experience, expiry_date, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    277   `)      �          0    17169 
   user_title 
   TABLE DATA               �   COPY user_title (id, company_id, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, other_id1, other_id2, other_id3, other_id4, other_id5) FROM stdin;
    public       timetrex    false    243   })      �          0    17180 	   user_wage 
   TABLE DATA               �   COPY user_wage (id, user_id, type_id, wage, effective_date, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, weekly_time, labor_burden_percent, note, wage_group_id, hourly_rate) FROM stdin;
    public       timetrex    false    244   �)      �          0    17069    users 
   TABLE DATA               �  COPY users (id, company_id, status_id, user_name, password, password_reset_key, password_reset_date, phone_id, phone_password, first_name, middle_name, last_name, address1, address2, city, province, country, postal_code, work_phone, work_phone_ext, home_phone, mobile_phone, fax_phone, home_email, work_email, birth_date, hire_date, sin, sex_id, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted, labor_standard_industry, title_id, default_branch_id, default_department_id, employee_number, termination_date, note, other_id1, other_id2, other_id3, other_id4, other_id5, group_id, currency_id, second_last_name, longitude, latitude, first_name_metaphone, last_name_metaphone, password_updated_date, last_login_date, ethnic_group_id, default_job_id, default_job_item_id, work_email_is_valid, work_email_is_valid_key, work_email_is_valid_date, home_email_is_valid, home_email_is_valid_key, home_email_is_valid_date, feedback_rating, legal_entity_id) FROM stdin;
    public       timetrex    false    236   *      �          0    18554 
   wage_group 
   TABLE DATA               �   COPY wage_group (id, company_id, name, created_date, created_by, updated_date, updated_by, deleted_date, deleted_by, deleted) FROM stdin;
    public       timetrex    false    262   3      �           1259    20503    absence_policy_id    INDEX     J   CREATE UNIQUE INDEX absence_policy_id ON absence_policy USING btree (id);
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
�0E��],���K�	�I���G�f��MKA��C�aE�]�����6m�LVz�/d�����ĘpBL��L$���|�s�0Uܕ�O�W`�:_�C$.���w�PpY׿.n`C�e<�����P�"���L9�7U<{p      �      xڭ�I�,9�d�]w�&�C��7��~l榊$�E�(*2�$�w71UD�Z�m�<�k+�=[(qw����'�l����U\j�?3�����Oݣ�gٙZ0��Eg����S,�������c�4Ӯ���c�л�.�>�va�`]5#��*΅S���-Y���콭��6�p��]٘���,7/t9SM:ş�TL����g�Ӛ�F�.������J��]Ηz�?]cU�W���#��k��]c�g)n�+]��S�����3˻bJ�+�Zj\y�Pv�Ά����btƄS��1x^�O-/�kXJ؈q�d}ۥ�Z�z��)�tW��{�=��=5S�ImZT�D3]%�;d��=��BX-w,�̂d�l��ɛm34.G盿�U|>��c�s�YӞ����)k�5��m0S�i�]1d�?]�A�=�dG��F?M˾vc��yz��Lc�]Ɇx�?]u$�ss>�sl�;�������vl�^�F��s}ğ�<��3���;b-�z1��b���镮��)>υ�1���~_Y)��<b�6�b���FW����˕5X��S4�;f�m��c�%����%^=Wf�O��mY;gl�}܃�%�����l�:g���g�)>1ea�\nm��� �:_7����٘���jO񱍜��[�dj+q.�K�!�K6����u�J�}�?]���� <6�#�n�n�(�N,�46V��6l45��OW�1�7�l�f��2��L�+vM��Co�o����{�O���0�4�c���+3��Z��}>���)�t`"&Λ��c�3�6fC�s���z�X�)>��s̝��΄b�&0�t�&&\�knյ��s�N��_�e�`�vU���vbg��K#�P��s�O����%8��ZU=�I�������LL(���������C6v�D�\��a\�le���5z@o��yoJ-��<�<|�� =3/�o�_��k��n}���)�]��3Ȗ�;��f���<�3.� ���.b�)>��I�k�M�x�R
kmB�&�y 0��h}���?�g�)�@�}�so�̲���d�� �^�e��c���O���)t�T�d���<�v��;]�z}�c{;\q�U�1&�����8�� ���+?]��'�>�c�m�)����.oj=�7V�,[l��7ع\) "�A�!D�گt�N��l�>��c��|�K�|���c"Ҕu�+F�O��<<�¿Y=/��݉]\�m�x�1�+]�S|�O�6�b���WW���SB�'��}�+zO���ct���pL<#>��?+[m����a��J����*�O |�37B>�wf��N	�_g�������ap���z�lϧ�9x�ڻa����Ĕ���תq�ʂ�c�6{*��6`�@Q�g���=������W�G��*Qe�[Gnⳉ�����J��S|�/�'��O��w�������8�����_��_�Ƅ���H��	���% �:��J��|���T��>�m��?�(y��4s�\��S|8�w�a���z��5?VZ�a�P�.�]|�?ş�UBKՁ 怡X`bNnB(Z��O3�O=�+]�w��� !%|N�@�+���Ю��Ůⳮ��/�w�����'��:��C������L��� ͑PP�t�vXN;��h�B���G�a!,q�0z���ѕ���Ï�p�bcd?�
܄+�dJ\R�eJO�p��=�؜���+`�BXK�\�/��lmID��́1��sQ�\��Z��.�5	degc�7l��u�ق}p�W|�a�8"pB���0}PM��D¨���.�O��Qމ:�4*�hU�Sji�lY8k;��Ν�\N�9�0`�a������O,�K�Q\����JW�፯�bQ-�ZBX�"-;�`���w�;�K�ҕS=��&�U+�&t�.�u�\������� ��_5X'��g�q@ɱ	��[�@��WH߾���ɯ�Ĕ @���~�.�8�G)�
�0��t�O���sE���l�gx�U�]��5r��pO���2x��)>�����]�o gÖ��S���0[��-������x��k�c���va���5�6ZD��^`�l�n�_l�C�5���flx���ߎ�� g�y�\�o��ƞ{z�EI��؝s�1�P�9���F�z�l�)>xc����Y��]�n ���	�rOW��M<�����l@���V4̬-��+����}���;���K� �����8��l�^�؄J�>%d�調��?�˱b�)�ʻ��[���F��B�5��s�U�;���p�{�	�ӳ��J���2����m=o�2c8ş.�9��<�$-�Z%���.�o�-�dz��湌���(�y�ŷBp��V+|��j��7�.��;4����w!��&1����8�cw��;*��J����+��O|�V��ث`�c�`�6mXO9.��sa��O�y��5<<��:BG-��6S�M��3�:����_;�~^������s������<oH�ݽ����+��0@r�����?���q����V�Ӻ�D1��)>6m�)D��]C�\5��;��M�J6��ݝ�w���b�Z:���b!w��0�X�����,�w������ʰa��Y9��a�΂�q�����s���S<�n�Z��`A��Ƀ�Vs۠�`V���w�w6-o��M�s6���_1���^1�+]<�)>1%,�8��D��'C�_�iG�}�m�wgD�z�c�|�\��� �T4B�A֩� 6!��ܝ�O�=�X������Np�i�=�x��ۂW��;��Q_���|���:Ä�&��4-a2b3l�Ѽ�;��ӝ�c���;�۪�:\�.\�=[GKƽg���ƼgD��l{C�b{�A	m��l	����lQ�}���<�����[�@N�	A,b�qN�#Ql��Ç�ܜ��t��z������7)��!��dy�uZ����>�"�'��>q�d{6�*Y��L��)-�U�w�=����\u��L�0Q;� S�d;G�J�(iޝ:w��^^{�%`M�\�5�1:������'�{�+�1�S|���/�7�=�H[!J��:J���	HHWϕS:�7.��M�/�hٍ^�.�Y��o��W>*��N���b$�5
d�kT߫� � b�c�$�]���O��p֘���YA<���̊yS[��^��3�_>�W|1�kU���v��v��6D��/V���]�k�u�V��k�*my�R�s���y�Iw��L=��#)Z���~�q�P���B9��������ɩ��/�jcfHq0�@�Z�=]/�o۲�H���Q�����)�<'�w�[��	��`�Lb'�3�y�ͭ���ؼ��u�̔R�)\��׬6Gl<��z��O�Y�҃�2�|k�~Y�ybޖ����zu�r8�g���i:�N�����]�.�/�F�;� ?��sǱ{ʳ��uU�H�rtyǈ�J����qB_���e F����i�����vPB?Q�p/�ꉕ��e������\�W/� ��;�
i]�"�Ys��j��2��H���� ��
�\���9���5M���U��vA�m�R�3�a����vW>*�_��Sw�[��v�D|�����Vy��\ݧ�V�_x�$�,C� ��0X��|�r�. B��H��~�'~m�9����VHpѰ���e@�Pp��)>~#�	�p`�������������+�(��)��i�ȕ�<�횃��VhAsl�(�}�8�l��WW<u��Xu"v_JR^Mw9�ۚ�� ���9[����s�8Q䀽�n�������٠twXe�w�Q�v��?t9�	���^�
(��'��sw����|�O|�𣬒�z8 �����ze���"X^����)���5��w/3b�.��]m�����&l�v�;�<����� VeW\m`�WUz*{�E��;Ի3�\N���.;p�0^��ʬҝ۰��P[�M�zw������O\�i&Bc��>���O�E@_{��l&=���������i��T^e���8Q�Y�.���S    |�a���_�p��̌���V�ug�b�6 �ܕ���)>{h;�g���3��#�{�Y�����CV��w�� �G������J{��cwUIS��#��w����l���P��R�d���O�j��+��myb�G|�7�Vz|��:H@PX4O@��e�	�1����r�����b�Z{�������4�
�Z	p��~yo^�)>����x����q���/�9�����r8a����C���c�Gu[�XV�F�u@Ʀ�܃j�)����fe�mzG�4�+�'�p}, Ȟw��1��{y�Y�ǽڔ�E,�7��V�JX��m��~�6_����1��a�o;`&W[�w�V�2o��S������@V%��4,��hT�f%�z|��0��3�:u)�z���#t�m<d��L�ǂ�p��랼����6�Aa���-VzY���U�W@��!n���S|�����ҲiΝy��|ec*�*7է�N����L��o�LK��cr�n�.1�1r�Z��;3��o�>������:��@��z�Ndfa	{��
o�RN���ʲ���A��e�Ge�IT[>᪃YW�rN�xpX,��0���uT����aq3`��NUU���;�H�XÚ��a�����Ꚍ���<�� �O)zw���*c�w`��,���rA���t%N��6�S��Ž#���Y�f�X^J	���{s�O���O���@�/J v��b����;]?���o}%!��zp3q�*���A�E��ݛ��m����a\�����=o��;�F �:4�L��;���⳿p�DC��S����Q��Xb�C���UN�ğ��'�a�|�L"u�I�N�tD�Ww��w~�_��jY��=��<��G4�Jڨ��m�ҥ�S|be��=�?�q��Jzߗjt���r�s "��[O4�g "� �v��x���9��ʥ��Us�����������.y�
�x~��M����??�'>��XW�;�!(�;@GQR�K1v�t�컻��f?w
��'3{�^%{�E+����h�(�����>g��Q����I)Ny�����3U�Z�-�2	9w����S|k�����'���J�S8ۧ�����}��E?����T�cm/6Q��acQ���l����w����<B�K+umWp�m)�1����i�������}I ,`'Ȟ[��L�$B�^�����7������<�^us1㞢�e�	7�R�;��Ȑ�K��X���>�^v���a/u�S|l��"X �"�'J��]\�c�7� ��>_��9Ǯ,)n{�<M�C[>��m�ͫ��?�'>��DH�+u0��k+۬��|A:y��z���t��y/f��&�(��n�'�Du������t�?,�'��)y�4h���N7�*��106 �U	����)�����b��3�U�,�}87C%�g��|����\�9ŷ���� E��N0�T��E�]"�~�/u�S|�<�>��բ��1�(Zլ wR�&��� ���s=ov�n�U;!��Z:5���}�S||TnJZW�cS�h�������֌�c�qS��Q�O�y��-��'`����Uv�i��1N��6�q����mF�k��B����*�6���V`v�ӕ�)>~��v�]T�+��N����`��Ӎ.Bl>��oԝ�|L�z����n�] ��������)>�eA���nx�T��d6X.��j:��U�)��X5�{~�pc�x��7�`'� v��>>��u7݋�1|���ޣz: � �S������Ou�S|k��hs���w;
���*6Zf�s��/u�S|8Q�Iy�1)�����S'[�s�0��;���wX��myT��cؘ~�5-54�r�+��[7:�h&��� ���S��Օ �p�K>��.���){�*��7��?�S�-ٮ;]՜����`��" %1^k�a)�rE��M�����ݍ�^RI}��߳Ô;ߛ�}����F|��G|�!���`J��VO"������x�CpD�+,Z���].���M��@�k��H-�T:/Wե�x��z�s���W���i�T�1�ѧ�X� 6�S|�Ms.�ԁ`Qظ����-Tb��o�����fʵ���(�,;����p5��w�N�͏��N]��?��c��TOڜ%���]s0;��-����-Ϩ�o>�7�`b{]��j\<���ޔ��Q__ݏ��rAwa�@�!�Kk\:�#�WԈm���؆7�VJ 5���ԕO���[五�>�F��6������f\E�a��O�9�]�,?Ŵ0*��_5�CE��]���"��3"c�� �s��1���̓IռO�.u�S|k|*6���6ݑ��L�:d��]��:��O������YȬ��Q�E���85��/�}�+������cnD暫W�t3;Ě�w⁽�+��+q�&zQ�u��\;L���=�?�UN�rӳ��&#��ڭ�P�}�5�%�K�������L�f-u�c���4����iC���������۸F\i���*�*��AS鸺A��
���̡�gVG׋�h��S���,��r��/h̼�eO��
s��#��-m�����a��ƭ?��~��o~��ͨw䖧��~�� �[̻%�ˀK]�]��T�2z,��_A��{��o"�Ğ����)�=����H��a@�]���]��#�ww�_ꊧ��jN���w����E(J�vu��P��Ư�RW:ŷF�e�g>v���ܻ� {ݕ�^g��_�;t*���f�np�O ��!eM�_�-cc=�7��$8�QN�\V��5�l��m�ўn�n�)>ئ����Cvj������g {�C.���]�Cp�nT�e�^�Rj��WU��i�����L�KA&*q���]�M�L����r^��;��c&̑�ҫ)v�FWfj��ꉪ2dM�7t�N�R�a�p9&�F�Y� 0&�Z�q��J���G�oK)��{�j���k�'�zRd�����N��c����[��xL�e%a�mwn0N�B:�������ۀ����S�Z�lT�������t�α��+��:�kq��ȪR�5x̜!1���)�8����U��]P��;�4���M=�G�;�7wn���Ŧ��8�1�)��K2]�U�RW8�7;w-�t�w@d��[�X��{W�R
�)�u��M8	��{��ݻ:ԣ�>+��&����}�����es�C9Pl#��u�;���,��i�_=������G�o~႓ʤFpI`6o������_�/����7�o��ܠ[@6�"����sd�Xơ�W�\
�)>{Y�y{L��mT��kPg�]7���.u�S|��v��F�SyX(�:��́�nj?���)>�p�T�2�f+{L������؎fb�w{9fw�o��Q�C���
����>����6!3�}���S|0�̦Y�*��A�K�����hq�g������S|bJօ��Y�{���2��m��>�S�v�˟��cA�����_��6�S�Q�;��؛�rg֧S|��'O�u�#t�õ΍e��
k��*��G}�7�29y-Z`�t���U��&�*;��o��Ǳn��_�bMR�����N�*���*��؆��.���f�BSS��R�FWi���;]�~��T��la[F-5�2��\Q��Y�Z���)�}� cc�������{���W���#��[��+�=�u�� �Q$��e������6�Wb�;,j�^g.��F�}M�n���dF��Iö巁�+^)��{�T�*�Jg�������h������zm��Q�҈z�͔�9��S|���z!8��L�R�;��GajU����䓓ù��[M�	���N���&�%>��~���!G����E�t���AͰ�)>����� �Y��}R#D2Xg�wx�׃�'��Sp��w@W�!5P=��a��Lh�x����{n��p{�Z�O��$�f(HJ	�pƝ����T0Wxݽ�9Z�1���UV[�W�%OqO>�W|    �!�u-ͻ	���F��	6��$�Mp��$���(����I����w�no|cͩ�}i����[�'9u}����x��F��DWw�0g�Oj��5�֘�˲$�UX�'��JW9����d�>K�p�e���"�z� ����n�[�]�JW�9�c��" ����1`��Т��ۮ�X˿�k� /Ã�bK��NL=������eO�͏�!�$���i� +�05���Rؽ7Hk\�r���=h��fĖ�f�ex:���䰌�%��|�˟�ۿW�)�ZiV@p8�����R��U۷�N��G�k*��k��%��6�.��d���ܥ�x�OL�-��O�������΅5J�륫>K�x{��TU`y��bv�,,&���}���'�#>�euN��< 8��U՚8��S�pB���7���b�	9>�����Z�|�L�孾a]�eu�:�'V��TB����;��DA+HX�+���p�˟�+�Fqa���+�)���w����(1�K]���]:[�5���D�Z�b-L�լp�z��O�C�AO�H�\���g@A4F�� ���
r���t�G~/[y� cs�T���MԲn��,��/u�S|�`a"��<ʚ��x�R�)cVM4/1����r���!~>�Z҄��8}��V�/-�OI�Oq��;��/�qX��\��(;�p��s@S�n~ey��|��oh�O�^��DEW7�;O\�T��l6�]ፘ�j'f��A�gR�����p�D�VN�}Wu7 es�oQ��ė���ͼ��֩�#��X����� ���^�������Ė�Y0hV�Ȧ{���W�_�ԯ�`�n�$x��4�&1}G&(�T�V6������?�p�>F����|����N6� 6��0�m��ce~�8����K]�|h I��+V��m�IA�������Ue�����ů���:���=��نJ! �Á�A9S�̋*b�U/�g/�w��a&1���_�]"ZO������i~�m��;�B*|�q��F�i��K�kj�_#�d�f��r�/����h�F߬[�↑MM��j@�N�w3@�?���c\ ��givt�Sk���pJ��Nm�c�U���������J.-UYB��ݬ�<���H�w3@�ӟ�#>8j��-��1}b�2���5�x��ڷ�+�/OO����^h��?�rn�^q�|Xi�3�jh�`�������o���̓z�t�4�9a�:�(J�\�4qЎp��&�#��vP+,���B/ᖦh�d�W�n�dN�����TF��V��ev��H�P�+x�r7+��߹�b��5� �`'��(�R��WU���9�/*Uj9��z��5��Y��q�˙�Oϙ��ލF<C]����=5�4jњ�쀩�aЊ���?l������d�����4{NC�Kc�v,��
�=�?��)�~���H^�\� %]ckH,�x�x�鮇���e|<����s`9���Y��m�ԛKA����C3�]S��������(�ߕC��	�5�"���{�[�3��Ae�������ۅy�7� �S|�F�E������E�WJ[^���+P��N����O����#��A�)�޺ڦ9�d[�kp6���w��?ŷ�F_>��/����k���
3�i;[!����<�d�,�����B� ��0Y�;I��'����?����L�b:W�:��I�y)ܭ�s�_|h�x��T��Vh�:+�٩�����q�?�U�7��͂"����+AuSjMo[���|ȧ����1�[~�_��-Ȉ�,����7��Q`�p�oI�q�����>�Z*�]�9�`[Yw��~)��yd���]��QA�rF�v��Q�ϯt�����G����ՖՍ����z��Gl�J���B����J_W���ւ���\�zL��˝�}4w��=ŷ��tM.��,Hk�b��Px����ݕ�������W�-�ꟾ:(>m,\Cv�Z��V*�O��?�l,������
����&�8 �AS��D������?�{�w?�WZ���s}3g�u�V���QcQ��M�E����ʯ�r��t�V��"i�0-k+'�`�l<�i�w�~s���^a�K����*}0!�P� ���hW���y�'�=�gvE]� ���w�q��S��hW��y��)>�f,`U]�����SU��h%�0�+ҳ�>��?j��BsD]���5ؑ]�+T��>`��o���)��YZ�<(�5@ǷW�M��g�(�����m4Ξ��S�M�n�A����RT���U���^'aW>*�j����66 �� zKl��Ze��e4Y�O�t�\�77�+��>�+�.0�C�em����|U]}�_�(�ş�s_��u{�NE���V[��Y1�kg\�R׃�?�;�0��]ʧ�s�:�f�4h��U� �x�+�|��]fU��� �^��X=P
Kt�l�f�.�NW)���/�#�]�fr�)�]��e�$��t壞YH⛋U�(2�:dɵ�]ę�ARpg��fg��(�8�g�P���+�3"����\��������7tr�s����J�¯���8�_���o���+�r����u��Yͪ��U~3B�ʚ ��A�����=�6���Q����>9)F7o%�+]�����.��*^a��J7j%m�5IM,�K��.��ڪ���p%̹�Zén���q�����+�9��_�����
�LF7R��֬��2R�o�Z�����g��k����%��Ub���t���1�����{�Y��.��ѧ�Q��(êw��a�����s v��E�f��#l.�!��:p��NWɧ���6<ˣ�oJY~�8m]Y��KS,�7�ӳ{���/�׷������}��z8
˘x��z�(������g�����#[i��o�ZRAbUNJl�#nW�~�����Uk�Ն��I*MT(�hZ���]��NW���貥�k�S�DS���2�S]�vuW�|���L�ud���ϸ��1���XE�0���/���/�cע�v��Ո,�A�HP�͸�ΧdN��6J��0p�Q��",M}$|�� ���p�뉕��	��-�P�)jsdw����@P5�uF���6>sr_��>OQ�Eڸ{bg���i����.o��r��<��Q���g~�t?ye�s!7��ѡ�k�N׳�?���A��Ҧ� �R���*�Z��uF�����W��'�=�pxF��V)i�� Amg�	n�c�+�Q���;$|�Nj\�Tӆ۷Cw)�Mn}+s�y�ï7���c�O ��N5`�г���g�Nl�4FOW6����T �T:lD7�F�����$5�"`+G�*V�����_}��%l_��1ze���5]���r5W������o��������E��Vԥ9:8z	��|g��{�O|xJS�ˑ�F<b��,K��X�ks�, p����l�)�����3C�ru;��F�0g��(�^suO�������0Z*��X|n,�p_���HR	�}u����_��������*&/�h^Il�e�,WM)_��d~� _�)q�4tnS�.�*�ř�|��)��M��N�� �B��)(\�Z�;��'~rp��&/n������5���m����z��@VWo�k�T,��w���sQͨ6��g5.��t�b.��+:Ϲӕ�)�=���N���]f}�8Q�c`��zNW�R}xN�Y�hV�[0�A�E�W�s8�*)S�i��=�s~��|%�����j��7������5S蝃��t՜N�%�3Q���^R%�rs�
��  9�����ͮ����׮���a�l���4X�IQ�
q#��q��=ŷ�f,74A��Ft�P& �nu ��j���U�)����6�2鬗/Q!&�u��
��a���9���Ʃ�d�T�P���`�JfsJ<_:qg5�x�o?}��4ô��6 []� rޫ�y�/u������A��d@'�.��TXj������{�W�US���ء�ɧ�D��q����^���*�}>�0@-���[w�s4P��fK���B�>4�'�����c��U�)>��l6���������q��l���    *�����G|�a�����i��V��κL��YX���k���S|��ղ����[3]�z���x:�,�NW̧�`�U��͵����U����`ps�����]����wJ&��WX �,�Z��6/W�l��N��� nwD�1���p�R��1fhH����&�߽������	�)��vԘ�%�p�����~1WZ����'>�l���W����O+��'F�!롅l��wmRS9ŷ�}�E}��F�<���4�eR����ř��o}�O<�7p���Z�$Jԃ޵�"xQo�Bd�[w6��=��6��,ڣ��w�<Z5e�>��R�{P܋\,)�����oN��a��J��	AWA�����f>A�]�/�'�q���n }�yu ���T�Ɩ�w>�g�?���uuP$%��2:�iF��E0�/��������ķL)��U;,�s� �"*��jK�����L����ÑӧY�b�BU�����L�j$4o�̥�=6�_5Y�C,�0boc�+�섶��>l环�W��w��O|�G�OB&��ښ��NM�_W����9Y�@U�2*V��B���ڭ.w����u}9�O|m�O�I����E��kWtMG�!��
9��������4^p&��\��q�˨5%u9��U�9ţ6��A�'� �5�C��>l �����Rt��޵�V?�<��
���R�#���ު�e��<W��9����1'>�7���cw0p�;�����g�ԫwX�/�x�VLkkQ����^	�qέ��UL��������96�-���@�|��[�jb�Ҙ]��BW4O.�W|tm\y�J�U$u�W[x�VUm�s��C��U�)>g)��#�}�ʚ�EC4��wu�]u�e�t���og���0x
ŀ�����X����"|�9�#W_� rU�-�D9�KS՚�{�#Q�\ܵ}�t��'��{ HD MŌ��b[|����������k�#l�E�]��/����`�������s�r�ⳗ����5����R���S�6�7���~�{~8�Swۼ�UԊ����L���M����Μ q�C�`W13��a��Z�b�t�x��F���4Y�+`j 2�.�4!6���S|��V�2�0�j��04�����!��1w�����#Z��be�Ь���N:5W����
�${��+>�S|�r�-5p���$:��u�Pg6��!\�|?���! ���vé׸�qIw���p���������J�`SV~P���u�\<�F�dj�+����~��+��l���wn�d/fV
�?0}3�����y�\�9�����o�o2/Mƈ`���	�*٪Oו�h�)>�k�����uZJ�T�j�R�/؃J�/u�p�/�\mĢ�Cj�o����#|�i.��73%� ��r���Q|�l�t�[��F͸T��d*���]�������O<�!Z݅�`�m)��H��]V�0c�p��#O��'_&�̦i:�d_�6yVpA��ńFC�t˛�R=�)>1����j]�kxO��VBb��^��R��O��6�����S�e���j�	3Uu��1_�/���;����f�6Բn]X���3xbM�<O�+����L��1�ptځ{f�ă����󕂘�)���l���0vZo_-����Ǻ��j"y�K��O�r*��[���1��(a���Y`.�YtW���c��wV�SI#����[����������>\�r��ⳗGO�KĎ�mB3����+xMHW~�o��O|뗛�%������i[OkX>�X�J׻���eku00<B�4��s��,^h�0���׋ŝ���R��Q!ϖԕh��y�ĮM�I����xʟ�֧x�d*��Si�y�f[ſi�U�j|��7 G�Mׁ��4�v��O�Ocrħ�\��|I�ߚ�:kZ9��GP�o5^�D����DVo������S<�IA�K�sR먜PZCW����ڙw��}��[3R���נVp�s�h�UJ�j�7��}��/w�e������9�7�Q���ͪ�)W�B���<�0�n��ee��J����z0���d��U\N�]�z�H~��f!���@�a����_�nRLOW������T5�J�H	0Jc����ξ^�V�w�J>�g�(h��Mbɮd�0����A���E�)�>����M��u��8,���&���W��7��'�32
�=�(^3�K���d;`2ix]�����z��G|{���gt˷�H��p㓪B��l���;]��S|��LTx �vL]�s����^�S.r{P�g�S|g�4v�KV��ec,;LM��F
����]���ķO�To����Y��oU\���_Ҫ��t�?n�'�5#й�X%�hhV^�d;\W�j׭�Z�j�l�)>�l�e1>G,����QE�Jf���ƲÝ��N�w�����F�6�����5�7���睮oϙ���9�_ O�ܬ�T��>4p�(�)�w���N�� Gє�nచߢ#���&#7�V8���7�.���m#H��3��&g�P��z���?�8������Xam��̡qq��"��#mt��ز0=�Ɓ�W�L�?�r/�j�7�0�?��'�s|V�@8F��e�dS�My�涒ُ����џ��A��]��d��5�$(o��������t�lN���PԲh�]�{����7T��U�̾�;��t�hO��%.#�5��A	"II�i�O���%��9��z����H*�&�29Cw��m���\�.5]銏���o�#����:�\�0�S�\�8w�����U�tcO���g�t�f��b�1���)���y��|���ҬV���ԯ,�n����y^���Q��U���[�4�	�A��44Ɍ�����ni�|%�]���G}�猨g���Q�pq]U:Vk�f1��gS��Ŕ��<�WuqynaO���=�9!�yL����W�쏧|ŷ�m��//���-�Ԯ��h<�;^���;������%³�;�6����* _�
��n�0&c�)� �?̀f��ho
$1w�a-���a������� \�L���Q�J���V����W���)�}{�,��.�zP�d3*�X����_�Z{��<e�k�<������Mj�c�ߛ��z���s�'��s+$5�*8Fl�G
\�$͋[}�w;��N�|�w.g0�ǚds<�4���#�*C�W�����+�}�7�s�.�V���̪>�#o�4S����)>��d'k�x�'�U�Z�XK�AC�'���*|9�g���U�u{����(ڲ��U�*{u��/�O|s������h
9������X7����NW��3"���6X����ލmP��
l;��W����[��7�ht���V�^IE�꠾T�핮��)��>��joN��u�XQ�e�E���ڝ�l�)�\���jRg��knt���4=�(��ln���F���{�⹢t�j�j)ZP�,����|ۮ�Kg��_N���9��v��>FR磱��ߨ����f��ć;�%�t���`�0ggp��&�=���s�p�W|�`�QK���CM86�DI#����:����p�����ėy����wf>u�� QvWg���^���o���RE�J<Q1 *~�Ƕ:��E��+�O7�+]�[���U5�f-8PS�-�p.p�ٍ���8��_����J];졾@5�u����?o�|��\���arL����=ݲ8��#y��Vv`6�]��b����w*���^���tۖ=�"n��'G�����Nw�Q�5t?���8�O���[���q�YLU��X\r1W�ů�S|t��Te���}L�Ӣqq��m@�b����wO�'�D�r�v�X͆W@�
A���,Wx�>>�+>>�r`[�,m��d��չ�Ʈt��O�� �T�
�&��&�Ml�C��2eUT�p��m}0�G|�r���V]pl����ي����fW���iN�y��U�4�c&��1!L���:曻 g�_ϙ� 7  ��;�A�ô���ݪ���u�ȑn#�;]��S<fé/ a�6�&s����fRta:��_���)��l]���0�8��V�®q��3+s]��b�?�����	�����4�ƭ��0Q�Ʀ��N58�:K�JY8���Fn?Y��Y3VOQ����]���JW置�S|ϖ�T7ڥ�G��h�[[�͒�XP��_�ş�c��RX��fH=;���0gY`�X�k���q�w��[+�B_���0LͲ��Z��-G5ŵ�y�+�t�O\&���5�I�kk�~�XDv'm�Н1w��9�7�0C�2V�	a[Q�!�c-�tl�0��{"��N�=��D��xPP����]��BU���˸ҕ�;ŷ�.�Vi��dR7��>esf�����x���r��l$0���<��+�uu�����@�/�����S|���L���7t(���gk-kx�W��n�>#��)>��@����+��W?3�C*�4��s�m�D��u��� ����E��)KWeL[}�i��s������z�-\srZ��vQZ�a�-_��߹͟����������?	-�"      \      xڋ���� � �      ]      xڋ���� � �      ^   �   xڕ��
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
י"������u,b�ߗ��{Qd��v����fB������u����H�R���QO{�kB�Ԃu����H~����^3��7�Fz��p��q=��9�B��]��z�ͣ�c�}\?큓rI�vt���VԸ$:Q�Gi��Ꚕ�z���so��ix)�=�͓qIz��Ǔ��&��Ӟ���y�� �������{��_Z��B�7\��<����q˲S�KЛG?��/G4Z��ܛG?��e��k���7ϥn���>�5�z��#.�p�7�����Ͽ���_5�,�      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �   #  xڥ�K��0D��]h�2�r�#��<kے7�z.(�i�������`M&�\���AOS�L`ܣi��ob$L@��2z���(2�媀އ�P� |0�X
Ӎ1J�f`�f|t���~�0���Ō����Ca�-7�C���ٍi)C�A��
���V�+FRI�Z�jk-A�
���q�(���M��\!��Ѳ�i�dB{"0����0��`����)(���I�D)�
����"�ܘh����E�����ʊ!v�;����<.�,��jskh�b�`���u��/���      �   	  xڵ��N1E뙯�%N�$%���r�1hŲ�"�+�]�4�,����h]��Hg��(HzMPu!���i��EHf���蹾|����ou:<Lڡ�&�w_׫�Ƅ(��4�;�/7�}�S����*�.s?��R����P	�"{;F�k�9�K?����!��1WJ�O|,�]z����S� g��x3�Wd�M�xx��ڃ�-*���F��E�*�d�0�{��E� 
(��B$gQ��C�������F���<�ѥ�      �   x  x�ŖKO�0�������G���q�Q418��qBk�vY��U�Vv��v�h]�A !9H%�q �� ;�t4i���j�&+��ǩ�K}���_o��j�x��:�KEf�C�*���Q+����{r�{���cs��;aw�	E�xBㅌ�M���6c�:��37f-@��'����w3TcD#��+�-*�WR`ѨePOd�YPIlP�1��d�2s������K��#���ܚ*��j�'�x
� ��#.�|>�>A�8Nl���$����z^�΍�Q5Mt��ct����$Vv��j��d_b�f� ��eY�%�Bcn�GO�`�>�ʢ�ƭŚ\���A�N��^��|�cJ�#�o��m�u��`X�      b   �  xڽ�]��0������NrHH��q��M;v�ӛ��!��B���&��Ne4�d��{�P$p|��GM����U������h�J�i��ܨ ��r�f�5fM��ō���|E�vmצ�^9����-W#�o:ڧ[��2��v*��!�>�����m����C�mT #(Y���1���1�P��5ܩ S"�6��o|�N�p�7Jn?&�j��B�"�R�����1���{<�>@(���!�zV1�h%����f�.e�R5 �
�(�����y(}J�Im:�	{���$h���ҁN�S�%��:�5s���	�i��M���*b�p*�@ǦUX���"�<�G_�@�PV�>�L&����@R���#��[�}&���x����G�a����Da����u���de"��̓\weSZOc��b`��n��L�4�������9
t⿅�aoa�`F���utT,�g��`&X�թ�2HV��Qa%r�,b���I�~������Q�ص8��|��wQ�OE������X[�ZDX ǔ�2�4!����E(�Һ5}�C�m�'n����?4a<��Rx��7�@2����I�z|V�0��X��ڤ��/��v|�<�?��
�q�2�t����h4�0g�      �   c   x�]JI
�0<��d�����g/����� �,�Y�n���5��>d�Ѹ��$��ޓ&��.l-��$�L�m򂄶�ҧ�Ũ�}N���'=R�ι�#]      �   `  xڥ�M��0 �ur��#!�=�ۀ,���m�$u�h�x�c�1��j;x��	a#,��
���'���I���$F�$�¿�B�q��Ɨ��D���*�I`�"X����%�('��:��CtVT��f�(�
��ڠp(���Q�YQ��7�=z���EG��Էho�I1�(�Bێ�(fE�)v`�\Y3��b�L�6ktĉ
ƳB	�7�=z���،��!5����^`���W̅��)�o���bLࣀ͕�Z,o�I��(L��DG�IFQr
��3�ל��8����Q臊X렫qT9�bm�����y�۝��Pt�
�Ծ������^�?�Cܷ      c   x   xڕ˱�0E���#;m�3v�ԉ�Kc;#,�����[�t.sh6o�:�aU�b��6�Ț��d�ز0�P��	Lf���	\2�0�/u)�9��v���O�.��y^n��]Z/)�7K�4�      d      xڋ���� � �      e      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      f   �  xڭֽn�0 ��yDJ����\�:uя���P*��s��8 XD�$�*�e@M��� �>`��%��Bu��E~�O��z��E�pA��E}`$�}攖��w�n߹�;���@�;(���@��c#0l� ���;;�$҇�d�^�����֢Ef�*22*H�Gm���g0:��;Φ��Sb(Bc��D��)&����r]UP�X���.���@0�"��E"&�4
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
�G��|d���M�Cۃ;�tJ)} ̦+�            xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      x��[�3)�ߟ�W1�"�%�Y�W�.����L����5H��T҄m��1��=]�I ��(��C 7+J�R� Jl��d�UA��Q?DZȐ��&�[���1���������*i���������;V��4�Kw��|��*Ts����������E�R�Az+����������������Ca��U"B���}���#�d^'��Q�_��F�k��\'��~y6�Z�:�_�6�I=��Ȓ9֢�0�"4���fQTDP������q>��T4{��I�d��p>��lr��^EY�XV뫁��(�/����/��m����/��p��$�QV�D�h|�qi��.E�ү��Q|[���_�6�]�}�ɨ�߿�=�7 {�L͸�"�\&�jf܌��F�KB6��ϑ��T�n��˸��Ds��FdI��S������Y��G�A�h�0~����!��#��[ma�"��M�Ek����E>GV��d��b�u+~��"s�&�� �%�Mhm�7H�"�L�u�6[[ҢHO�e� ;��j�����y�xz�方�M��L�QN�Ն܊�];�<�"�d�>��_$�|�}��u�<Avf�z���C4<nL=r��j*п�mq���b_H�Q�%����J'B�Ɩ��O�Z�G:@��/ߥ��\=r����&���?�cr�p�(����n�X�3d��lĿ[6�2�>�n�	���j���廌��Á����en&��ۉI�!�7���t�Y$��q��A'<)�4��oG�qE�΋q!�����_����×�0�4�^���v��ќۆ'l���7�]�.���Vs�-�d�����&]6d��F��d'�j��y}�q<\��en��L?$��^��:�Q�����d����Vt�����miH�DZ�P�dS���"�z4ܿKI��q����{OilN��G��4�nZ��36/nxE&�x�Z���ff�+��E3[�{'����h������ثD#*���3�FhN��h�w��py)��r�s@��'h;�t�����	��e�ح�C�e���#h���6<��6.ѱ?ƃ�������� kbd��L=�n�3�YT��W [�d�����],����c�������N��������үD������,���r�b��e���Z-Y6��#ٵ��%�C���y���6��1��_"���`�\�pn@��n�#�����Q�%p*Y�Hsm#h��'���Erg�E*����#7��-S�� ����B��M֯�u�{w��wG�|��O�>��o[��y�!�'���A�1��W��˙z��A"7t�
r�jn(����RN��Dr��\8�,,�Ń0��m��~LEY(E��ۻM�s���0�H�-�M�e�D����&dQ��Z�6�Qd��}���T�<G��?����a�L�E�'�NVQ;~Ez4|��S7
H��^��*�p��4׳�G��d�DM�wM�ʨ�x_'�l"�L�%�D�WT��am�ɂ�Ej��N�6 �N��t�Z�W!TK�I�m3�J�GZ�A��
�h��0|? ��f8�<=��E�V2|Ճ���*GЮ"%�����c2F�������tЌ����%z����ȹ�Ix���Ď��v_�θ���[�B�B�h\�z��C$B0g�QH�e=\^6���J�l�?�l����.2����%����� ̽a��yE��������YJ,Ch*8��%&3����6�o#kn�&Y�#+�;�. o%pqFV��U$���+��~�x��܀�M�/���L݄t���0�����1�(��$R7�}0|M�4ΰ�B�z�V�Ha�A�Da�9�'���LZ��Q�#/���`�f2q�Z�m��8Yϸ�Y# e���J����բVܨ�=-el�]$���զ�v���a�MV���h�[%d��|�CR����on�\~(��S��"V�Ѥ�����ڈ��,���/k�w�߿g�c�#���\�^����Қ�O��wQ���"l��o��Wh���I����d~4��X�]����h�"^����Q:���3Y90���Ҋg��Ó_E�����o�.\����S�������=���G\:'�Ґ�r�u��wԹ��+���eB5NV�5L�NM��/����mE©�ү�gP���(�!�Y���(������3��O��W�X)
D1�-�vyE�:N�&�$/�u��Qy�J�L����F�ȁr�cK�
#7��E��s!��A��P�'v��~������zNO����!��z�H�y��pT�(kr@�mG�l^�ͼ.��C���6���Q�e��c�(�6��=��DP��I��0y�AI5��3��a�"�EDKS2Z�.^־9M�o[ �a�Ѹm�$)*��"��R��M��c�D\�zчji�e"g�&dQdE��rY#��x�O��>R\}�K%+�&dQ�o�M������v�Cx�<nL}�k����	�L�I9;��R4��wY$��Y]��׆V���l�A1
R>��vq�ېAdGg�6,�v![�0����;SR�Ѓ��r���n��ݚhT��IO}&\�I�)�6�x؞��e?�WJ!#��b��zP�"
�1��x��z0�x����3zX��M�P@�D�rr��E�d�g���F;�w�$G+�����n�ݷ�,�p��7���x�vQ���G�"��K�����:�d���镲�� E�$�����͊<��Nt2����!~�	���.����۰�7��wi��d#\�&Fhu��%�?E�Tz/4tgc����U���"ʣȆ1��1?Ȃ2,RL�Vziס>-���?4J�����髨-��:h����ް��d���{I1�F-�VX-"��>����E.�g4UDV�!�����h�H ~J��Y#P���\���tyQ�M�I?^P_��HV<_��^����p�j*�vY7�`woX�Xg���G��j��AI�f臌ޢ_D�?ѥ�j� �F·�>2`4�W�?'lLyy���ճ�z]��T�>���";6�����	�����R�"��pu���cژ,��������%����r�$�ԇ�v� ܶ5�.ys�]T.9y{�Q5�]×/���z�>�����-/Lϑ����,n^t������d����{˲A��ٵ�f��!
C������uYt H�?$�Z�k� ���0�!��w.�R|��kd7t\���'���o�$~_����.���կ��R��eh/4�F�Pp�FsD�sd��)�$�O&�jѨ�EԹ<Avf�v����wY�������{� *5.�|����I5{�E����٤(��gΗq��H
CI6�E���?
��u`������O���ޛ"Ax��l��1��_ߥ#�WoWb�3��2RX��u�(��"�Y����Y���~?y>��5�B���z�f��F�^��kY�Y�3��hRQ��d{6�o����&ss���o ��}��/��b���Y���>�ʸ��\�z�o�D��d&�|3M��DT�3����h'e�d�d/=rU���(��$���&ņ�e�M�0s���˵����ls"�/T	Odɽ&75J7��@X����a��T�/:�Dv�$�ƎK�<���/g����͵!�ZfR!�-�i�H7(o-P?�crmؼ��^	�H�)r�	^/�Ǥ��Y�3����d� ���Io��	�(�AU�l�QϏx��z�F8�F�3D�'	eF#;}�������O�Ub��C�	^��%y4����V�B�xUS%����&G����|��6�u��[{�׋�G3i�chl�W��;��%WdQ�b{*�~���O���&�.�����^d=�����X�"U�g4�O��O��l�f=��@�""����=��E��4�A4���F2ی"�W����9:�z�/�ߣ��{�H���G�O�c����ъGc��!Mej{l�6;C 2-r��eY�m�����zY�M4Gg�;j�TU~Q�ڗV�    UQ�՛[��7:H�8k9�l�)8����������(��x{v�Ț����������yk"�:[�A�^k�Vɦ���"$۬ҞKX���`�6�7���b��UPG�r��{�FΙF�\D��j {6�z[u8�xt�dM�BX�P� ����1��溑�ܐ�����똞�<�E���I��fk,[dƃXwü��#��t��SzYwC�3�zY�L=�92�:,���ŋ���-�,s��	Gyk1M�M�[䋸&���f�2��Ny�t��{��Y8����Ʒ��p&���'t�K�O�}�E:)Y�xz���2�-�z��7(E�һs��]�O%��*YOɥ�b����C�E���4�[����&u9N-�K%��{�so�H}*ٰJ6�#㨛bV[y��,�2�1���|��G�bܦ�wp^��H�}gmmo��,�m��5���ߞ �"��Ln�s�U��NR�R�$��ky�K��)����ɷH&Y��k�2����	���H��v�dr��ܒ��
�i���D����e��T�f�^���Ğ�c}��,�0��rH��Y�:�iD=/l
3n�U�G���[3��$k/�TL���^�y�[�G]��U�y[�uSq��*���?���@����KbjOTΜd�5��G��w���3d�
!,�qӔ�E}�5͘[��f���樊�|��?C��ꭀ��ǶmO���=���R���d�?�z\�ּ/��/PM=ί� @S�J2o�����k;����rB��+<՟U�ي�v�������k;�[o���F'�^�?m�ޏE	C!0��������M%�V)A(�k:������-2��en��\�Y�'�621�Ԥ���6��g��f�ϫvM�Da)��'Ⱦ��+����k�r�er�?�r�~��E��}}WGXu.��@
2R�a?�
�O�Ei��xo��;6�A$�^��-3n�2�)��o�miO%����f�N��<C�E��x{h�̭5a5�a�5�׆gJC5Y��E�3ɚ���Q������d_�mx1�<=r�en���)p\U;�.��EΔ�_Tx[_Z8��U�q�x��S��	���H#�Q�Lo�.�;�\��I�O�;���k�D V��+�Po���38��f5�O���27ȍ^b ���{�r�MR�޵ju&Y�l�6�O��ϐ}�E&���l�6oTd��%v���C6�O�-�Y�?��_�� �޸�آ{��k,,�0�{��y#L$_̬���"Qq٠���HcO%W�֞=CٝY�'Ⱦ�"soq̽%�en�
M��R�މ�*��TN2�M�H�O%�z��n�@�1�	�/����Ƽ��z��[0��e���E�U���.���]�}'
���&u��}�Ez��3O�1.sKZ
����n ��5��h)�]	�D�N���Xq������3dgƀq����[~�
�eQT�~�m�-Vy�
��&kN%�<�7�����bz�x��k,22k�0c���a�|�i��X;������ɔ�.�T�T���v4N	���E6�	�/�H����#���-2��|�g~d4��b) -g�6��g�իo��@G8�r�O�}�E*^~W���27�zS�ӳ��H��e*� }z�E��G*�d���Y=����7�i��=���H��z�旹!��!1r�E���!$�.�4�T��~d�
�P�(�*�Ⱦ�"���L�vF-s�_-{�h;�j Qi"Q�OJ�U�b��sɮ�>)S�^�+N=�{d_d��ɍ��,G�����];�����Djt"��f�?�He�i��z��e��
��P� ;��8�`��EZ�E��l�R��JsE��(.uk 'ݶ�j����Sɮ��8���1:�'Ⱦ�"���ܬ\榽P�dC�y��SqX�]���e�7g�ד]��riI�WK�2O�}�E2ߺ��#�U��f50�cF�����Sc}�E�x*�՛ޢ7/b{�Y>A�5�������Bm�Vf��Uȕ
>��mi�dWO6%Z'u#m�O�}�EF����ܜ@5+R,�{\���c{�@{�E��"�9߄���{�ˬ׶�~~0��]��l��n��a�(�a�ӑQ�,rt�Au]�����&}�a�2˼�/�j��=�Č|��*H����?���?��ɳ&�?��;j�<���/U��j�D3��2���EW<����#,�jBL���ղ���}<�wa�㸎 Z��z����B��pD_�Cz�;f/w��dW{-i�]"R��ڔ�J�KWB6�������r�*<9[�{��y�G�k�q�G�Яu��H��c�"ӌ4��vT��5�Aݐ�L��L�*Rgfs�v�k�u���Z�x�:���W��{�?z;F�>�ߧ�z�F])9��i'@�;����*���ή��c��P�qVs�TJ*�>LkbnZ#ڋ�����9�<F�Z�1�<�Ee3�����>�1��~0��u�ރ�C��LA-�	D����l�(O��K}/t���nÛ���J��{8H=�zB�v}B�Y�ܛ��f]f�]��t���$���"�S6��t�O�}�E:�y���5#P��;�p���7w��]�}�� ۲ai�L��<��sA�����%�g�0�`��]��)���c����wO�3���fJo�[�����ymB��&Z�P��	^3�q��~0��u��o��?��U� eS��C����Y�+�a���������nX��*�� ��[=�W��c0�a���������
����[/L(���E�&r����\?�����v��WR�����D�OJ�m� O!.!Ʋk�����k��8��8�38e���d�A�	D��3T����V<6/o��p�['��2�ָ'xͬg�>�~����r�i��Is)lu�БQ���o�(�a�27�,��=�W�)+4�S��Ot:�u�����,�d(��K��+�To��Mo�m�e�-�p��T� �=��`�5�T�~��(�xڦ*��nO��Ydz0|��ݹ|7��n��D��4�s�5"�µ�a�&�,��d�^��7��`)�eÛ�.�U$M�$�rG�)c����_wW�zJ����ɑ�{p���gڭ�,�[��M����1}�ܿj�Huo�~�>+mx}����ز��Z�t��dZ S��_D^h�o7m8���C�w��7Yc��̻H��6����d5ԶMd���������98@HG��c��a�c�ׁ��s�F�5�F��R����zxÀ"�R>VL�t� ~x� ������W'����-�lpO��ߋAJ
�@��K��� PIaK��Q��årc�������d-�l�����/�)�i���$9,Xv�x���R�>h���j�""�hE-�9<>�Ȓw��G2M����.�h��]�W�80�V*X��!�������.�8 �a�Q�%��z���zQ\o�Jy�[;�]T�+t	K��Gl>OCC����_���A���[��/���s�6�EQT��J҅��u����|X�o�`,k�f��R��P7Q�	��N'�a��E�����~� '�����az4�M�Ǡ9��	��eJmB���|;�ًȈ��:I�8F8V?�F�X����E�G6�5�U��]���y�"��Gi��zyY�/�����˃�]�r���f^#�Mȸp�޴\סOu���%��� k�U#���/��fy�\=�]z��͞�:}o%i�E9�"-4�"�!d��`��a�V�fy�e�����A@�d
�t��H�����)�!d.�����ɪ �g�,[��*��MQ�K��	��OXv����wY�������WW���
�&�*�9�ȞM揲H6YC60Ɇ3��Y�K"]I��LV�J�~�B������5�U��_]E#��^������e�U��/��6c��l�G��W���|$�ޫ�*�Tk�]�
*�<�ً�zxS�R+\I_�O����j�x��f7WV.��9*͋�hAOȢ�.X�M�j{�:�}��<R\�Y��jܷ�z���X�;?���pR?��Ey�"WϘ�j��l��ӡ7�	�RE���*SZE�d��ϐ�i����S�&sER E�F��Qs=�'��᯹x�'W�^\E    x+���4����?)9D�h��˙�'[�D6J+��]�Jd��W��)]�8j5p�i�`�:[���n��)cɦԒh��m��EQ@ǋ�	�jG��c���_.�v��_'["dQ6z�7)MȢ(
CY�t�0F�`��˕��������T�t,�m�\D~UE��[$��?t`��p�0}9 �݅u������D�d�*�7N[���0�v(�pԾ��Ѓ���Ys��������m�Ӗ3N���z�|�Ev|�h�J*8��	W�L6���I����4�����.�2���	j>��~
��� W��_$�\k�ѿ$;o'dQT(�j��d��e��ɚX�0=Dʶ8!�"' S�P*�#�*�����5�Q:����z۳<�������Pb>d�5����W_'JN��zk�Ɯ�P��/e7!�"��%��Ǭ�~������C������Dp�=ς�� E� ��_�g�`�3w$��K�H6UJ���U��٦l�m;�l#|0|�rcx^W�J����5<��a��E�D��Y֣l֨!�G��/�����֯�EE�c!M�6.x����?�pY#|0��嬔�>�U����-S)i'd�V6!�Q6�X�";������<�(�>�5�
M�P�F����Q+�����R�"�}��y�l}\�g�����%
�N�.i��SY~��Aс��l���>�ޫ�фS�Ԗ�PN5�����_��;���_.�g����Kd��P�:A�M�vQv#�Z�^\?�"�d��d�nF U��Q�	YIQ�!��V�ah������,ϟ���6># ��M��
�(JT��Bt;���uw������*�~�lV%t�j?)@��� 4*���Gجc��l}Ћd�����9[g�(��R����u���/w�G��_&덏"Sy��2LȢ��0Pe=��� %�S�A-����	��f��	�HQ����!}�j��3I��ѭ��AY��W�d��d�"�ߐ�Qs)�~�lă����^* �!�.�Bj�*�VrRC�w�o�F�����D4W4�L�.)I3!���_�o�Q^ג���O�z-�"Y/a�S�@y!�_���!���Y��e��w�!�����Jy��7�א��=Bxw���c�r\�]Yg�[�fM�&�ލ��TD���A��tD���N|4�͏��A�Z$2�р[�E��Zl�Q��Vf;��(Γ��Jї܂��U7Nr{<�e1N�,�����c�L��B�R�uC��"J���l��	�ɲ0����oh�IXCyY�"c��V)\J��&�c�}*��ȴA�>���:�К�����u��Jo1)��ު�կ۬���(N;Nⴻ�_���!7d�k;?����.�T���bD�`ʄ,����~�L��s H�#�Ի�tfd��s � B�_H�`o��e���fr�E�j,��۸8��/p?��a��G��zB��J�!�z&QoY����E���dW�G��#�կ���^��͞n_���`������;h�]�p�w���͝�mxd���:nu�_�,����Y�j��e�ٸmAh�:E��MV�p����-(�X8�BO�WWܜT�ՀJb�Ǚ�]�A���-�Ox1�WO��wj�f=b_����,�� M��^�Gج���A�޺E�5�bM���fM�|��#N
�G��G%WW��D�z�d]^H���BԼ�*S �jtV�ŪlnBEE�F5s��Oa�٨�S��Y$�(}����t{!�cm6��yd��U�EH\���u�$N�������r�O����U�	��K�[�V�ē�Ϧ�}�6Mo�#�g��<����h�h�&/�5�Rrl�(�r��G��F�n�z�z�,�^���ҡ�����q�G��_'�ЏB_�g(n0!�����vye?�fAj)�~�,-��R����5�{�:�o�Y7H�x0��u6*F��~u�%h�x�K��a+���
�{c��?b6�v0�����jP�k�%4o)OV�?��d�����N�\�3�����+Q��ב=xcf���d+����Ͻ���lQj-ms�l�M!:`��^��[�BE�����ʌ���$G��/���W�m$��&<�wJ�H֣v�k����`�k_��w�;��ǟ�m��P����,��Й������G�6��Ƴi"�	0="`H��2֢[A�?�,�I����[%$������~��)���t��"݌��A��`��^�{���k��/���6/��U"��."��^U(/<�ڭ�+i�.��f���h��s����a�ڭ��B?�]J���ΐ
�U"u��U�O�%�ּ���wڃ]��Bg�i�l�S
��I�X��(9�2[OdW�\�R@�t)�0!�"w�����s�d����R{O�tG�i9]����m;$�y��C�B2VO����I(ZZ��I�8��L��N���u]�D���Pj�[��ک�+V7ۣ���WLx!˭J����+/]���=�
1�!���9��s��y�i���I�i%E?P/��e�U�A�@I��U�W=�pY���w˦=��~�^Q#oO���۫N���.���ڭ��D��(j��W폯�8�q��/���r6e8d|������
O�h�`^�?���W�ٽ����0T={#_�?���f����r5P ,��sc��� �z��?��e�:Ɵ��z�f�y�sa��?�0y�1�B��FLwD�V1WztG�KA/����E^�ѽ�h�3^�J��!�C�^����?f����"!M�C]����&?d�
��1�?�D���h�t�*xTҙ.}|���1&/s/
�ˊ�Ӱ!�E�7<��"��C���\��A�}3��t��Y3�ՌE'��C*|
/�y(sJ2Gt%(�[��|D���y�;������ګ�K[/4��a�K[��~��y/���Y��C���"�}��R_�c�G�^����pW,T7�g� S��_�������1�:���ohj_>Z��y�Z�^B�w�ڭċj� �n2���(�G#<������"ep�52��f�2Z���������'�w����:��ꍰ����q~Ŝ�j}>�ЫڂP�wO,����ݯ*8�(�r�Z5�|o��]蠿�9�<��'hj8PJ4U��-�?P�jWM�E��̰��տ��1�鰲?�~G��#��٥d0t�R����l��x��"+��FY>��9T���t\�YK�셦��f�%&䞙kߵXwc��i��L�J�J	����G��p7*=�1M�9�2��b�a��m6�y��g�l=���3��tHA�I��.��ƎD�̇+e���7٠$sv���d�])J��C��.�T�^���rYC����g��x��z�W"����(u�X��+�U��S0�j8��ƭ>�FxwX���m�z����Sdqumԉ.��|v�}B�J���>2�ui�r��������,RL��f�fkmB��*]*5����h��C냲����[�h��EzjU�h�������f����Q��E{�"�ͦ�殺�ۯ>����77#��O�����;oV'U�3���ǒ7�*��G���S����C��<v��;���T�g�K�Lh#.�9QB�a�[���$��x�=j�v�my:��n�9��z/�K~�2�YHje��y!Y��l#���AA������E�Q�ݺ��&�Э���l٬;���'y�rkx����n=Hۻ�nS���Xʒ��ٷ�u7d-��=��I�j�Z�Y���S��F2�"�,svs�J?M֢_i��FN���Zt�B�7������!�ܑ��%����6]Ek�.:���(�s/Sr�-�����0��{=�s~d�
~�,ao#���u�o��|�ޒuL��d���t�#�vi|�6')s%�|��;F8V�Y��,ST��[�h�	�Omv�q	n�ޔ��G��s_�t�L�"�����_�^�~�f{!��7?�o�&Y�$��m6Q$����,"�"ߠz�.�5ᆬf��g�5    գC�"@p��P� �K�!�:��׌�F���7?�d��1���RK��\p�=�^HV���������ՀH)&Yu&Y�p�t^@��q�~rYQ��Ж퐓�6�j9�Ο��'Z�9�^)�x���~_BSper���|���$�;��֭=Oo��x��?G7J�iú*W�����ٮ[~_�O�����7�[~�~�����S�@o�Qe]�+�I�&��!�S��ww�_ጏ��12����Vm3
M�Q|c����_da�p>��l��v"O�Y:oR�V-z��C��"�x(�O��#l85����\&���ofF���6�Ye��z$��dk�0�D�����[����g���g�L=��E�*o�\"!���lP=vOy�ѥ��Yk�,S�dê͂%�=`l�N�(�=�lt�i��� ��R�^蕊�m���كWˊc둬^�YG6k�*�Ӌ(M�@�)�C�Y˴Y�$kW�z��R�Wpɼ��᫁c�e���V����C�'gd�����oq�!6�d=���)
(��%U~!��m62�2�`N��nU5�{c���(���f��'�,�V=�t˴Y��2���4"���P��|o��g*��9�J��,��%S��Qe��3>�ϰ�ȼ�������-Z_l2�/${����&YX%��&"�.M1��d���n�}��{��ݾy/Y�I��E�xF�}+S�1Y�	YEM��x���������7�\�s~���5���]�䌬)��d�+5ַ�7d-�,���*Y�)j%zfd3T�?�d��</��wK��Zŧ�V��ȢQ#^�o��ϰ�Ȼo��W�j�z�^�^���v��։t�|��B�yQ\�dљf#����Ȗ�<%&�6���s��d���^kX�	Y/}�v���"�0D8V�Y/ywW\} �LO^��m�lM�&�Zf�Y{*�5� ��F�!%��0~a�"Z��@ʣlv`yo�c�M��E���q����J������_G���֚1���7d=��?��n��J���yJ6FQ�3dKGy]l����l����\ը�����'�R	�(�㫗;�?�*ˊWg��ZE��r���K_HV/���u!)�$�da�f�&
e&�:#��(�R��A�o�ج�!k�d��d��	ZL�_Hv�f��!�d=��[^�68�^A�Yg6aܥK��lV���$g�T���H�
/${�ͺ��I6�J�
�t�7�sʐl9!��<9m>�7`����f�l�1�F�}!ك}��I��_����"Uv�H�M�)ٰ	E�S��G� ��:�lѕ��zd�y!ك}��I��7ay5�R�Ԫ=F;�ٌ�z%���߀�ׯ�-U*�*����� �_'[�j2=�H��58A-���u�.�n�:&Yw&YJv�&<=Ĥ:�}��̒ar~W����&{)�~�����&$y]��O�cG����bP���*��q���0��9���r�������D3��kS�9�h:NT���Vq�p:l�Yf��<;{;:�Uϻ�a��(�@�X�w{A�Q��5��){{�"+�;@��~�Fm]D�R�4�u�TT/����ae�����n?)����9 �fEP���|*)��D��Q�0~t���4�.�vr��[�J6�&��9�����`�9��l`�L�f�,�8�B�&��F�;����j��B`���d=��g���d���,d~!�l�v5�L��l�9!4�����l��-u��W?�f#�f���k��hA��S�/${�����IV�M��,$5��f��(@�2���3V^� [ ي;���u���6џCOa�Y�],��=�lk�N
t߂ǵ	Y�I��2��Q��������+W`�S���GM���0J�Л~f�B�z����k`����D6,�l�B�rm��)٬���V ��٬�!L��$�m=�{7��^Hv�f��!�d��d5uu�u6�0^P��	��7X���$ydת�th�p���9��8��6ko�&�p6Y�������Y�k@?���g������5����6]L/�I��[}Yn�*&Yu2٬�@ML�Bt���&�퐈n��;h�zwX}���TL���_��2��e	M�����d�D�1ɺ��"T�=9TNM��*,\���f�Y`������+�U�6�^H� ��7d=�,S���V��1��u��"�]�j7�.��с��<2I��z��B3щB�	B��=��o��c�������z����	��f�f���غ��|�Ͳ����IV2��*Y�Т����ɮ��[�3l֭��D���U�Ȃ��"�Kv��Y�$kN'��}n�<�d�Y����@�E{�����ͺ~�Hq��"�&�Vݐez�L�*Y'���Ԏ<%;>���o��_��z�����N���ӭaz�l��kA��z��mJvÿ����:�<A�����'+* 㔛�M�l�Ds��YC�1�2���`m��RO�TR���M D*�^�f��n�z&Y2�u����8y�"O]k>&ǞX�1��0�<���yQL�Z�.��P�0@E�䶽��o� �N��O"�L�ԫ�겎��g�{3��f��Ћ�Z��ՀKV����{�b� �_��d���=�fݍ�2W�h�$�<�*��`.�q,�E$�֛К�ʜ�q��t�GV-(�����k��3g��(�>l-L2gP�����;!s&��H��~9s�*�!P���m��Ë�{.�mGu��㖛�a�#�K������*IW��R���ُ3�H֋㕢���$������k�Q0�����;e���d�̕��0�Z��;�"�	0=�C�Gs���K�Z��8�҂��s�	�a��7��m�\^���N��(
K�Or�e7���@���n����>D��M	��9�tJ���[Zr�.�n��>���$�kC)�����l�"<�G��'�}Tde���:��z�/��K�Ǒj(R%��S��7��+�=%��:�j��Y�p���I��G��lTFӁ����AǴY�$k�mv�����{!�u���J�xkl=�][g3���~r��u�y��c�W��?�f5nI,R\}X�����F��'�T�κ���z��;�c�`�������:��N�TƼ�f��"s5�����U�U�
pԑӀ�������z$��ɖM����B���g�7�<����s\So�('ѕǜ&�d#��o`�-^j�����%CSTvv�|Y��)W�[�Y����^��B��������#Y�j��p���Z�8꧋@@��a_�'x]��n��ٰJ�;%j�,.��zh���#U���.ͽ`�����6*ʆ��6#6#���s��� I&Y�$�|R����l���l�M� �I�Q'=v\���Ȱj[���d���"���:��DE^"9�a��@m�6�Ӈ�l!�F�áP��6��EjНޣ�3Dxg��,sc���n���j�� ��o��[*���G�v�7�]����n�>8���D06	)�87|��"/J��W�wG��+�����sֽ�?���1�kS�?��f��"S�p֣:�_"<�R�v��������a�p�[fq��Y{����ڻ^�n�c{�"���8���ܴ��Á�wf��{�u�i�����]���h2?}��~��M���
5�'g��J��s�%��Lx!��{���ߜ;��L��I�,�l�Bґ2iݦdn@�.}:�~�MV���IV�MV���ԋS5�B�ج�!k�d��]^��O�3��R�&���[�)��Smv����*�I��B��6���5��L��l�&E���[�mJ֠*k/��m5��;�c�ug�5JDW�Ё�n�0.�"�h�t���>-À�{�?*XY�k���^%��������d�/�f�p>7d�I��_�=#h^�D�'�Ҍ��V@��y�͂�!k�d��d�c��`��c�e���:�q�tQ��lS��Q/2l��f���e��g���p����}!�u�U���g�e��nduŀ�V��d	j����Ȏ��͇�vL��L�Ջ�E�Rȏ.���"���*��O����FVNO�Aǥ����n��W    :���I�"rBy�%c��NSa��6�?�Ӝ�<�<�*�K�i�{��o�L3Qɰ{����Y&*�SN��Ɵ����Ϡ)-�?e��$;�)Ȇ�L)���sfw��s��
�쩙]��m����"r������.n��>�W�߅�BVv#W��`�[-P�I��'%7ᆢ����5��W�7?4��'��x�xz�斸U�jO��g�Q<Η'35dL!�3�o��e����-��[n ��@�mfo�i<.��6�����ioQ�f-׆�D�Eޜ�e-�q�R�sKpƾ����s��"��l��Īf�P�D+T���\�ָYϳ�~�[@��=�0��!]dx�,_��?��j)W���xE���Ռo�8yrAh?��q0���`���`�FG�R7m9�q�3F�r� ������Q���S̒��P��詄��}��hT�!�ۛ�������wmM�Ns쇭GnK��9�r,T����<��~�e?���� �����?�9�?��#�%�m��{���6�elo]��4�f����ƀ���~s3����8��_ ��4P�B�%�5Q."�{��d���iX����4p���	��u�š�uetd�0�hh�Y4v��(��`Kυ�qB���	i�5�@��n�]EȆ���$�a��vz�%��b��Ӏ�?�h���i�UQ�����d���"��=������e-lwU��FzN�3�ި�UԆd[F�& ��>m�C}��@�����9|�3�'ƒ�\*)�~�,N��p��Z���0��"�$5�HMB6B�G\;.�l��?�f��H��jq�E���(�T�]6��Tٿ��^��k�����A�a���6[ݚer��� ���q·��A6�c�eꑬ[$[��+��v=�	��d��G�xD��u�z�����d7T�*N��]DV(G7oeSA��K=�_$��S^�@�S�c�]dE0$
�}Y<R{���TD�N�����a�Uqi�L���B?�����w�����:�*���jn��r՜��@8*�S|x7ң?l�<�|�`ą��ު�8RB�?�����a=���������q���W����#7���g�(��[�n(
�������F7���"��L���'�g�PEڨ���>nz������뗹Q�L�T�����*����M��i̸�1��W�Sׂ�Gnn���8OkUt/j����0��°a��
��Eϛ�L�ܒ�x��4�Pr�E���i��w���x�|4|�.ey�#W��M�ЈCx*&��V�UdD��������xK�+����w���:�� C�oC6W+�r��63^(R����%�O�e��^���x�MȖ�����Ud��״�Go��eƮ�{+�Ӗ���ߥ�D��g���SSyH��p�{�	�T{=�hwߝ1��h��c.k���N���W����� ,�د@<�/U!�a-��(��#y�>�@�I����4�HdCZUg�E��\?ח�PJ2bOX�4���$
r�FMh�(���U�8�hЇ�(`�P�E���}��+�J�m��H
��.+��&|�;�q᱂���8�N:����Ec��]"��=d�mBEE�~~�ŝ@Cs^8�4����wV�yB��)� ���<�ح@��**}h��l����B����ڰh��?�TT���%�	��B�~���hDޞ�[�����i���f4pXhrJ�q}=����L��PGv׃η�LA�M�Q؍32��ax��n�)�$��K0��{�d����i8޺�[��"�&T��Jfx���2����h�O���y<�3�N�&loWe��@������q.�4�I���\0Bn�nD�&4��<z�)��Ӡ�%��~�=�,���s۴j�Ut-2��/�l�b�o0�wm�	�S�l���x��H�������	��?R��@�m�y�P������� ��	1�@Ck֞�_��F��EJ�d{���#�ɖp�ȳ���425����j7��چot/����%4�e�)��wia���Z�d5�\��̥q���
��qVQ����6�G�t�@u�R ���3�~�IE59)�<�	�$��(�̐J�h(�:����˛�U�-Q{
bjmRgEJ�����N�3���6W�BT�y�Y:%����m���gI׉�Rt�N�Vn}`������C�u�E�^¦&������<Jޔ^��5���=F�Ř� �ld{��/yC�"*BD���1��{�S��Nv):������M����"��
M}�r>"�h����8ՙ�z"�6׋h�29�t6����K�8(VOOܖ�z�ոK
s�z�]DV(��f|`q�鉛_����,�b%Sf�>Z#_��E�������m.�("=�&�$�
E^��_��	F���ƹz��e�@������ǘ��4Ui2W}B,R�^I|=r�+��t��x��?z���t�"+|�t�{F,��N`L=rS��6*��1[&�P��'�LV�3��j�����pi��Q���8���@čRy�:���g��r��M/qK����Zc!��&�<:#�u?��m���^q��ܒpv��S���.���JO�����s'
�%0������	A�b�(x�u���&���w)cϸ��0�~�w�gȚ�l��է�#�~}�ga6�E�/m0�鸈(���s=!"�Z��80��-ֱ��4Qz��kiR�EUC7�6�3�X28<�_�Ǩk5�<n�h��j5�a��.J��f��x˔aPZ���6���-�"P�zk�
�a�
3$(��.B0��6�<�ƶ�y��7���UDҨH^�[�pCQ��]�rFn N&֋ SO��"�����̥<�q�"+6�^˴����O���>�s1]���=�@�H���3���ͭf<��֛��6�V)�ɧ^����Y��f����]{ބD�B@�9v�/tQ�ƍ���NE�Ac���=�C��O7M�b�R�C�z�EA�B�n�n�{_dꗹ�k����m &�����;�R'�o�k?<}\疳C���B���P��;�8�����p��W0��ܒ�O�ƓK��0G�"�T�t��t��ŉab���[b݄Է(n ���E�.�fB�vW<��㋏����'k����ܢ���/ �a_�]��Z*gpc������zh:Rd��V��ƯoT��.Mj���e�xt`Ư��uM�I��N[6��.
��J�Y�]x�Ӹz�T�ҭ��J#R�;*����j]dD��3<u�������G��͋����u�n����p��➮������.r����^�Fe�eVTئܶ$r?�*���D���1���nD�n^�_�U�t#B��RR+��oN&���nDHW-+<T�0�rB��D�y���]uT��.9\�q�/v#�	�(ٓ|�t#BQ�2'���nD����?��^�-m����wUEO�9�|B7"P�.NL�r7"'�o����7���)�ҕ3�E^'�~�[�J%�^�OU���AQ���E�	�i8��,���4����k�7=^���㯦x��	�i�1��4��:�8���,.�QͲ�(S;>��Π�Yg��.z���ӡ9�,�4�3�^�=e��rM{#Z�߼4�<�~`e=�_;CR�8Gu��q-J�f����R0�B�*?���^s%K�dx&�R~�݄��	g��]���2Y3�h��c�ug����<�x\��d��u��!�x+D8�d=�H�Y��9]䅂����9eX��~��=g�
��g�����@AC�4x��~����;#d��~�?�8����S��kh���q�̎�,�3���b����h����"�Ǉ�{����"+yV������?���W1u��5j��`V�V./�7�xw9\=r��{�^��L���,���-:���V��:*�^��H;�����Ov;��4����;X隈Hn	6S(8/n�	nϟ��Y�g7[F-��"T�\\���QR��K��,�e�C��E�TI�K�_�2?��y��c�{0|�r�x�	W�    ,Zd�!�ܯ��O�^�tu��9�"�f/m����L��D�PtQ���n6��4өIA<aoi,�f����θ�э��wz�7;�EQũI�1�	ܔ��n��dnN�<����Ѻ_� "e�E�	ܴ�̻c���ճ����D�E9��p�洬�c�	�S&0�?���pUSN��y�-zh��錫�v�h�gs67ؔ��]gܠ6�(�9���/ܬ#�� Sv���K���Si�Os[?����!���r����H��F�q�D�ѵ�y&�G��҇�*t�?*՜�nQ����	�ӫg��V��B��JO�{����s61�p���H-2�ka^DY��Knp�y���t\��XE����q��.n�hBpLn�dn)ƌ����\����#]���NX���3�V��j�5B�3+B��k��O�}��鈌���N*���=M��9�?����CC�(��h=�I�Q�U�D5tϠ|}�L���8����?�R��ʌF�U6zzf�Q�z���1�'��hĠЛ���Q���4��)��4��>��&Z�^�L�l���EVl��@���3d`�دD�&�a-��u���B�s���g
~�eҰ��h
M�ޫb��4�cg
~�c�8bOiB��[&E�evH����'] N�)��k��?������C76����K�̓�'�e��9��FԺ�1��i<S8��X�4p�%���WnROh�ȐS"_u�~;S8�;�#�{�7���l����JR�V}�L�I#C#�"J�xJ|���3%0׍p̺��F�;zӲT&4�O�i��v�L��v��������ԌF K���f
0�]��h�lE�nQI�4��g
�Ȥq����ø����O�C۸��5��鶞"���w���5|�~����ەX�Kɵ�vD�=���f�Kt��m�NX���qح`g�����eFp���bb:ab��!��������]j�i�AA{&��d���if�_E�hQ"�3f�<.CC������LAP��,q�_<�<�[���nݨ�@���q�L�I� �\-Jw�}ޕ\DNK�Y9���gk���?���ʶ��NnF#/l�5#7������h����*hj�o��q�Lq���,�-�k]O7c&4PT�؋-�2S��;�Fq�nT*��R��(�	K]����xM�:/y4�/UQ���P�e/�8�g�G��♶q�=�V�P��������@���{*���(�~g
�;V��٥��~�f��Z�t��yv�fe�W�o)�:*��'2�y.���-�M~%��r<����u�	4��?���3cx��Z��-l�uS�E�a{�۱�T������,q�D�>	�y�N��kk��1��7i�� �����ͭF�e]����agȩ$��gĎ�,����x�WZHBS�����XQ�= ��-8��1�yX�V��y��y���v��a��ͩ�p�yC]c]O��s�7Z��������g|`�	0��V�<
��.�q-��۱���_�</ۓ���������UD����b>�����r��6S�,����v��y&7*7r�6h�U�ΤR��o�2 �c�o ����������������w,|B߹��s�ڒ��'����!G��3���Gnv�>�{�E5����}���H����SX�Gj��.h?ur�� Q�V��z8� R2�Q��S�ܢ�":g�"�4����grc�#���4딩!	u{@�Ѝ���|>�|�����7��ܼ£@�6 9��܎>�j`�l0��vo�DH�:���������':P����0"�5|�r�x'y�~�l�f�q��m�d��dy�*�z$��zhTE)�.w���u�B�;��'�,x��,1��d��f��@B^b���uQU]�r��L�%�m��t�Q�� ���y���5��.o#��14����K�y�����62�H<"�	��+�������$��`l:a�0�"�1Q������ⷙmFá��)t2�����t�DE�_��m=ڻ�i<S�Q�H
����Q�V���pq�@���ÈY���=HE�7l�=s<op�wp�Z�w�&?y�T����93.�(����ʒ��q��b.�	�$�2?\��XRD[&[f�����)�*�H$���ߟųVåe	�~�o/Azߊ���x��Rg���l`��ǯ�0/P�<��So��"�"W2<��o���:Z����[����j������r(�o2����V	q�*/ݦoҐ�Js�����Eg�?y;�t9�m?Χ����9����}�:�F���7��!o>kK?�?���R�|ȕ� o6�"~2����\��a4\K��ͭ�@t8����?���L�?y�����:��8)D�~��*}$o�#�'xKIƛ?y�Cު�F[wau�lx#P���_�~�7-���7��o���o�Tb������`�4I�*�=qSDYż?�5�3�W�A;��G�f	!q�kvf<q��|d�ɛ=�&��gJ|T�0#��[@�&O������4���`[�װ>q��1�J(|?o	e9]~�v���n���/l��s]��&ȃ����せ1z�;�o���m�_n��.P7����hߖ�����)oq$�G�
�`�/�v��ѡPC��Q�8�o�Z$lc��	�3����-	�XEx�ͩSސk�8�T������-	k�D�s�r�a��K1��2br�?��p��N�Ѹ��yi��-E/�*�1��Ո��hL�k�޸a�,�<� ��-��5��0�dQ>!ޫ��ޯ����"Ҹ�}Q6�[��/�~��~�6L��-7?-�GfӚ��?�(r#�3K3զ��j��{W߸���Y��Sc���?�A+����ϙ5��P����2Wr��ec�J�AmH\���|i��˥���G1��P��g=I��7����h�Wk������xO�qz7��fP��X���A�А^G�'0��FX�'f�:�Ri�N0��GW6��x��XQ�����J���ޝ��i�7�5�j�=��f7 Mܩ=F�na6�)�~�cu�D���l�J�f�ٮ�a71��ky	xi�cu���@�gfO�ȍ#�gQg����&�Ĳ��U�ZN��?W��J�w�y�Y����ʻ��<^}���o��9k�6�\�I��aMf�Ѻ�rPS����#N0/dJ�OG��b�.e<����_�/���ل�������-�3�]wЦKi�}ì��ԗ�K��w��H	(��3%�JjP���rfM�L�S}�	�ד����/�JƔ��=d��!?���a6%�����B��,ױ�}��q70��A�",B��!2K���(�E~�`tӜ�¬]S���'SZv"	���:p�:�?7/�	*`�|�p�}V�/���V��A)��Y��:�̃�f	�A�5W�I��{��XSb��?(�Vu��w0��a�@���>��C�7�Y�D9��N�s�	��/��Z�x��|J�&���)jQ�U�������~M��;�fd����B(<#�+ԭ����ϼ�p�DK?��S\��J�h��m�Q�x�u�♷d�i���'9���NJ��^m�w.�a�Q��ϼ�Q�Tn��Whv}���+�T�{�4i'�˓Ṿ��Y�(A�h�MU�Y�N�@�`�����E�����T�n�tS��7�T�6��bξ�xs�zm~�ox�{�/�%X�Ϋ(});�*w�{���,�@J�&��DZD�NIcx�^%���6��'Ă����O��Cf�'T�Yνc6�E�7~��p���a�Bk�0>�l+\�<����M̚��{.��o2�1�	b���~*嵃��opq�I�(��i˗�?���"�^����
Q�lm��i�U����%e��������B��=|�Y͗�{c��f����ʎ? [�My�
����ÕKN#4�Y��Ff��z��}?��T�Ee������лE�6@\��*��
t$͈��'n֗��?��)Q�F�?�#f�JT�ï��ۚ�	��}\�_��s*�l
��غ��S圮Jy�o�T���l�=�   �DU�B<ǃΪ��[M�Ƽ�i�j�T�Ǚn��ǃ<g�D�F�xg��ݸ���`أp�C7Ax��L{ ��Eg�ϼ���T���#e���7�s�L����Q�g�7{�'��*[�䚗�����\7`���0[/�3o�q� Au�qzy��@t�d���7�d��y;s������@�\��׽�'Hӯ�����xK�XB<��!o���Y�&b���{
���B1���7Jυ�8B��@cۢ���	R���������F�!�3ox�Y�Ư�n�Ev\�	&(�g�B��	޼,�,�o��ו��9a�*�/��!��Ux`�ZڸE���̛>��TPl�ZYӅ9��rT��$��$|o�Yѹ �3og����kmh�N�ͼV�N��f�ml�&��7{�[2����b��F���������u�♷��;��tr�a�0�bx��J+�^~�S�\�^9��~;f]�+�83�����qg�N��0������O��Cfm�;`�K��6��f����t�۬C�/2%���������o���w����Ȭ^J�<��
=dx�E������� ����L�g�1&��x��S[�gގ����~�o��Q���+�A�W2[���}�S��#��x�b_�q=���%t\�cOP ��BR��?����5'�3o)frpR�3�6�5P�U	���?!ʲ?!
_s�j`�Ӈ�w�_��_�
Y0�jx"k�,k�e�[R�TE���W���٩����؍=5� oI�(TQˢ��,z�iv��ox�����r��^Q�� oF�)�3og����M?���l�&�HG���1����͉:J
�̛u�Y�1,�^%��x#�����i�� o�Fa�V�N�quz�;c[{�_� ��U�	>�NC���!o^�V���p×��N@�L�����kj�-�E#���'oxZ=�b����dF�U���x(������eՃIvK�Ճ��g�X�T}�U�����N���eժ2<�ݡ
ű���S�w*�S�T��ycS�����a������l��A����b&�xKB7�$TS$T�*kK�:���F�B cfi�������;F���z������rܩw��'X��V���(�:Q�'�P�S�N��f�dwc�ީ��?ư� o��z���!�O�;�J�6��Zu�T��W�W� o�d�M����z'T�b�tר[�N ��LB���ϛ5�B���� ͩ
E{��9;]�6�k]A:�~`�Y�B��⽯�˶�h"�Y`�׎���0��ß���[�����t���:9H���d�F�C ������Λ��x���S�Nd�0�H�x��P8�U^si9�Q��Aٽ�:U� ���:]�{/�m,����H�~�2��0/�>�VC����q�oB���z�\��f���nJ�a�ޅ�!��:�&_O��p	sI�Soe�?yK��z��&Vu&��#]�P�_.-���ο�=V��h��f$�O��D]�&_O�B�/f�@����J�����)m6�+3�@��VlZ�&(@�Ki�[xS��B��͟�CT��k��ӭ�/��/��*��&s=��'ox�q�@0jJ�N��Q1��׷���Y��:��TRY(3u��>�V���]��|��d�ɛ?����
�0��#nxs�̼���|CY�~�;E�f
3N�����ʛ ��� f��NCtu᧟�>���g:کd-j��@t|px ���z��/�g�t�[M4�*��r@�᭲��Ӭ��>���=jo����'��E��@�z��<��� ��!ox�[��ǇY��S���9�+���O�&�w�o�-��nƙ[�	��EA ��i����%+�o"�1o�uH�����/��|�4x6E���-=T���җ��%��sc*�Jg�1\*G���K7_�n.������K^��_�B1-����X���"�7>��G�t�snit������eV����/�iͧ _%�W�[����nI������2Q �����믿���ݪ      �      x��}Y�$9��w�]0�\.1'�.��a �yDf���!��K9��]���f
�=X{d�����a���ÎX�	6���]Fu���@���fD��6C��@������ߌ��2�?�ʏ�?n��?��_JpO~w��5.o���k�������'��UGx!Л6�7���?��z��[��0?��O��"
����Yo����_�9=��y>gz�����DF�L
�Fay�s��=g�5%���Fno����Ur	�VE�1�����F1�����
�&�+�8W6)�<G��Is�ʕV�+C�J�s)#��&�B�%��oϕ��ǜ��s����C�I������������5b���#�f�vF2���.���w�g�����cB�m��R<���UZ/8��-9K�g�u���0�J�|t���K�<��>/�/sN/��N�8(�v=������x���-�W>䆖��ѺϷ����#)��Ua?��,�Vd���������5�z��T��O��C�@��[�k�@��߽���s��{.�� ��>'�}��ԡ�D���Q�^��ń�=_�/�����^��ț�+�n�DWu �#ļ��(&RI�4���=��~K	�3�$k�M���q���kG�1QB����/�	��N0�ٿq��E0��S���=�̗������'<����>�i����*�n­Q��o�0~�����7/t�fA�.�;�:��/��Ǩ��\q���� [.�����fL�c��~w�N	��{.Y���{Bb�/�bw�ѯG�Tn�c�$�M7�I$�$��o{��$�z��_���m���������N�ƌ� 4�����M�9��=�b��D�6�����7}@��ҏ�+o�ջ/Ks�q�g?g��|�i�6���"B��Dko��7�;\�Ypn%W&�}D�sǄ4S���s�ni� �(����P�6�d���Z��a�ȷ4�{�s&�������Ɯ-�Z�Q�y�ۻ�.}y�Y�������f�����;�A���cx{m�uc�
�Ǐ�?t�<�^��\�e�>q���;��F��'_?����$:0x�����#��,t�x�F��]��͒�����Rk.���}Yщ�m��(���d���1U�FEߋ�}�/�s�LT|��uǁAs%��⥹2se��bP
�+Ɵ��y�(C�����c���΀]�2r�l���x//��i�K�p�ˀ��3�γ�R�����\4���'���?9n�1.N_��9}5������?��[��E�5ZO�y�I�z���d.����M�-y�զ�[|�e�K�=�L�:���)��V������,��DZ�>o�{���	?���.�n�>ΰ_�f��=��y�9�^ƒH�F�nA�� {����&(+
�d>�w��D_��WL��C8��S�1?Ť�E�/�=ס6�a,<c�A=�*2O|�ٴ���&'ʖ6e��ˎ�Ǧ-��׍�lʦ=ٛ�æ=��i@@VU�>�}��Q��G#C㣹I�N��{~�t́+2���C���]��l�%�/y�6�9fƘ�e�¼��U�q��N�2o��y�/3`�r =��iM06�h���b��2`���H��Z�>��(�G�M����G�F�ܜ`���j�W<��U�W�������yk��d������Z�3��V����SU���n�v/䰇�[�i��1V ;��b�+c��"d���\� =�	u=x���$g�-)���|�O[X�Ñ?�D�U,~JJt	f����� #�c�e�鵸}�M�3�J���;�}9
�zEf_�r�m-�&=h�.�����%�0㓈KF�����b��3��V�f@�h�gY|�����
��2V2*%+Bq�Ђ@����;B�7p�i�	�̦'��/�|_7,�0-DU�CU��%�4����n�Μ��]�5I��'����0C�t~���|���@�H������e��KTL4Zb4��:�y�öMM���Ry�J��7_l.,�m8ჷ�0^4#��|vSc����h�M��a�1�N�/���S�O^���.�2�"&ZCaŜW^��Ed����s�B^��-�c�S%fVo6��b�+�9���m�t�!�#W(��Vq�ʗ"�Vy'�V���#x�����0Y|��]_���{�[�����4e��9���C�3è��?��BS��Z �iTJ�2�����^ǌ�s߷M��ך��^^xz]�J!ʄ0+�\��njy0N����P����@���F�+��܉�wBt}�`t}K�}�S��; �Z1���<-�h����"U��@�K�޾���B����</�������ݯm9�������U�-9_^��l�m�P�Bs����{*�-�o-�U(u(��Oq��q���Z���r�l2�	���Ȟ.u6�����q�-�W�oE��>n`��cp�1�KS�Ȝ3BY؂B�������G�h�Kh��|�x�����w�m��vֳ��g0Z/͉�'��������PM䔢�:�B�r��`*�D%0'�����0љbob�����lF�/���r{�㛰�P��ϕ����g�=A�k��a�������_��`���=�L�t!���Qn��&���'��7�5�8
�Qd6�S��5ߌ��4��:�|a�X�R�C�"ze�Y�
+a��"�,5�R���G��֥����׽�c�H��<˻kL�9&�~�e@����H���.ŃҜV$j8l�Ƿ��W�����<�*S#nE\�b�Pq�Q��@.�![�鉽_���'LA��z �6����zO�W�1
e���r�El���Y�`���zG������6
�_�S�m~���z��U�c���^���F����G�^�+�x~��P�����-�����ݗKG�W��4冭X*���RltM3��y�z��l�}�<幧�P� [�a�]ء2���F�2�}��5�Ҁ��Bb]�������A�_gxts��(
���eK4�t�OeRu����?�'����~����R���'��-�~إe��O��{�R�۫��Sw�Z&�}q��b���a�7V�">8�(�,�%6_�ϼ�(��ܺ��`�M�
/�i�vM�A����]O/���I"u=�'�D]O`�vǨC�ր��!iל�E�:�^T�Em�/ʛ|�"���*��
(^���[:}-[�#���_��zz1s;Hr��_g�3�q��!ֆ͇�wϟ��1�������L�L������u��c��ڤ�,S�}S?��+�6c�2��E�{gM�ه-�^G�`}��#*S�T��_\��Yå�[3w1B��^��?�5�T�<g>d�\/���T�F�ʅBU��C���f��q�5��V��Z�tᢒ|�*�pV���/Υ��~ػ�������i����"���B�,��N�g�"{��u��˖}bQwx��"��:H9�}�M�,�T[�?8�N��{��bʧ�#2C���C�H�m^�e��m�ڗdw���CG�j�p?K�Tz��^��b���0pv�k�{2K���J!���1[���C��$[D�}����Nhb�K�̫�x;a@'�!�w���,0Y�$Otʮ?���s�}v$��ؾ�͢�m:�)!u���п~��y��(C=��E�9,���Kڀܴ�N�Ѳ*ݡx3s3r����y ݜn�Y��(������9��.��sm���=Z�)j��6���ܞ�?�]��S�߉�����~���C���|�w�~k�<���B$��>�B�� �!��N���JDShݎ=Z-OKOs��:�gT��$�����߱��l���	J�Q2�Q2��-���YZFw�=й��>>YI�cٻ�HA^��,�S�Z�}g��������3Ϫ��R�[(�u�y��1)Rp�Н�@tQ�sw��瞹������q��­���ر���&�\{u��DK{	q+Z�AÉ���H]+����9Kr���-�뼃+B9
=�n    \���Ӆ��B��u`������ļdD=ǻ���m�����ϳj̭�qA�}m�۵���1�R�Ɍ�~V�H��%����t޴u�?��kֽf��⭧Yh_v�v�H�G��R�n�����۱��2�βYS��j$G.��ֶ2�޿������S�Η������,}��$���o�g�/�1X��젘�� 7e�0r���)��ޚ�� sg�L��[Pd����A��y ����0Y�J��t�� �Td��$������H�G*���S�0�����󂞳f����M�w�Qu�0k���_6�����A�,��rf�<g̊L[,�,�x��������|p%���9G��e�c(d��hn��A��oF�oC�3>�jX�	mR\5�1��U�=���QLL:Jy��Qt�b$/b($�2�˚���P���5��u��Xw�#�O�g�L�b�%E�>0�N��t��\x���[�|�jV=��4��4���4�\ DFBŠH�?D�!4��2��ٲ���;��s�if��Pmy�������h>	?�h��X�&�u����vF��㪙C����	�ɠ�4�8&�@H�H4#�}��y]��3k)�`�}4��Q���{w��!d�1�cL�,���e��c0�r��2�ޟ��4�:�Ư��=y�%4�g��;��Oy�ȃ�Gv��@�h���mS4�����yh�#�����%Ꟊэ>I1��0�� �x�C�\�b������$�������"���&����s��� �D�1����΄J�"3��4��朖��kǸjkQh��]xl!L��U�qw/*yϭ}=2O8�������#��I^�W������ð}Hѓ݅k��Hp������{�Iᄉ�K˦���k�}(�wX6��O	�RzJGU�-t����i�wч��"B�X�R}x���Їt߳0��S� &ʷ@��7�	�����l�2wC�:��E
"�콤��b���Ef	F�
����Q擘d��l���O����l�����\�f��1 �1 ��c��|�D�fޠ��%h�i��b�|�尊�Z�&�8bj�I�Nʐ+o��}*Z`M�S�M�����Ә6���T���<לNcx��*�؋�u�C5��������Y�qR�W�1�2P
�a4�h&+��D�Iz�[�x�z T��[�C������������60�}G-�bU�Y�F��ۨ/��kp�T���d�U#��!�6��(a>,��5� �S����Z�����Ak����{��������z��i�W3��l�V^̀|z���;���f��庣6��'���X��O�Jʆ��nk�8�.����^�B��V��Κ����Ҙ������V�%��҅(�(����Ծ\�k�TZ��G��D��5��N���&��AnMY�b	>Sz����Չ�h�Zŷ1rЋ�����r\��<"�u�Aŷ����)�6FgW&�"����F��%�W��ɉ���ۿ�L,ǁg�YV���Y�D�6� �]��P�9�Rt�=�Dh��M��cJS׹�Z�<1�Q�)BL)^�'bl"e��1W�T}�61|l�A��I�6Q�!v6�����Y��r��N4���h�gm��cSTT�B}�`2�z{ؿ�	x>ƣ��J_�uU�}�ǲp>�;[8��L4\5�s�Acd8�`e8��7�#_�2k�V��@?��o]�d��7ƙ(�]��ͫ�����!r��|�I����������]��&�I��Tl��� ���M��這�݅��^�W��&:`�nϕ��8R��Xi�����J�7�D_��TiML������T)
Q�E�*Es�Q��ꏮ�9,͖n�d'"'��W�92�i&4�<=�U�r1 ��a�����foK�/[*�e�䌢�%x`��"�L?��٨tU˝��n�f�/�f4\�N%��`2��!3dC�����"�__o�LK�~/�{P��MF� �K�H�z������`50T:�ګH�o��oT6.�U;*2�Dh�OChמ=L���Kp�q�'�Z��~�>_�fYL{� �q���s�`�e��<���(S�C�|k��)���?蝈/������li���|d<>:Ԙc�|�(�~h}�;w�Y�A��d�[¡|���R�|���`����#�m2IB����N7���|��\t�9L���&o���z_3D�2[�z��֣[/�'�[O��͙����l���Ǜ����bN�y'�U�T���l�"\)U�%�P�V���5����+"|V]J��?�LeE����)����ӱ4p\�hU	g)�X�������z�W��c�����o�ʿ��Ȝ8f��O�0Td�B��t���������HuGn��n�����?�1�Y�{fE����}�	����;T~����gN_�RN_j;�����1le2��f����hG�&�e���U 1����j����I�h�U�low�'�]��P��~ǃ?�e�	����:�Ȓ~8���s|�d眄��/��2���\�Fѧ�2|^G��ly���(ƙh�7P��בa��p�/��q�!@���[Z�)��1O��/��ZȜF��`R9LRd�B����̡�=�$r�#��qc�[��&��.�[>�[?��/�d�s�f��9�S��N�3ގ
��Ш<;��]Q�NUn!Ca�*n@	�I�K7,�?nM�mD2F��1��9p��.4�P4܉�K_���ڄ��]r���1|y�W�e*�L�h�sEP���7�+����51��x���#Q�Y��NB�w��6Ü3�|am���',��=�$��eU����`�7C�W6�&x}t:UF0�ٿ���I:�y�����?�����j ��z�F�wC}���_P�"���=�c/.C�k��Q5�?T��x\�H-E��l�(f�TD2BU�"��<�d�N��ɠ�r?N�;��#J*��2�`�cU�ʫ��C����?�j��<��a+d����T��Ī�Ǫ���d�*Z�HՅW;#Jt��9:ݪ��˱~:���b޳��QEZl�nPfC�T-�ZJ�^4\4�GJ��A����*��%��Mԓ�tP"��rQ5�g)9H�&���^,vm)Ze���⻗�������ۣ��5�kpS�̸u�	�R���R|�
Ya숊^����_w���`��u�?��x�{uί�p�%�񲦟P��0�;�����L��)sQ	�"m.�}��}̂����m�7BH�Nk@W?�b���%�9k��x���H��ѯT��X�Y�%c�EJd�1N;t4;Np����8E�h}�9h��gVu@)R����;�rc������ontXfm�uW��-dm�P��r��{zpt�n���?�swj����[��0�b������Ӆ?-F�?��?=y�B2K��e���g�B�E�,�e���*[��qg�~��?��g�Y�)
�{�p!Z�|�����]X�I�p�Dȱs�\Ζl��^(�k��lfKq�]�Q6�i��t�b�pĤX8��E��6�Gd����dn��W7@�@,�C#���M��H�Do�w��Cs��0yI�ϫ�؇�WNT|d�_�C�W��+ܻ��j��@1r;�.&P����M���0>ϴ�ڿ��8H�7���J�9L�9�;�WG����~mU�>�W^�cqB�˨���N����V,��a�*!d��^�Z�뻧�*�C��Y�'�F�HC�7i�o�֧�dB-��Q��C=��(�}����)�����ʪ�.���үϹ�/8c/��m8��g����,~ ��;��c�(���媱�jO�q�ߔ��``N�xB�$�g|�U���ȹ��{�U�Tw7�#��jHc�Zj��AejI�cP��<U��s�~������B��=l��3cAF�깅�F�N�^�+�}1<G�zz��+���W�=�f�\Ħ�������>5P��r�}S�S5�4Pk�=��j�    ���?X��3߬��'-�����OB�[0�gyy��>����"*#��*�1n��F�/�1��4A�	�|u*�x�pd��TT�œ��>�3�_ޔ}=��E$o�!�MH��p�����q�5�N�Y����O/���܇�gfP4(�l��J�p�[�%9Pb�v�!�`����s'k)�XK29��{8��\���1z��8|	k�p���[���c����چ+��׭+oi��A�7����}?�A��g0(��@ǿ�H9�Z��~��`%8������E<�R�f4���Sr�����2��'-��]8�?��&��\nB�oC�s� ��r5a�"�(��"���k/���<�Iw�R�sتS�k�R9�4��<��o�]Q��]�
��\Y��H�9.��th�t����g�h`�vp�|0*�|������O(�9�e���F�,�t��?=�N��*��=9����3�o��k_U���8n�)8nF�'��ad�ˊX|��JV��6D��g�i����k�Gꊧb<U�@3>�|0��qܾ��:������F��/��^h��=͕�͊~��󧠁Wg�w�m�j��Ulǣ3���$�_��3	=3�T�252K���+7ٿs�������b.��c��uu���
=�tN�%|b>E�c�0+�s�~��������zn�\1+s�Bd�X��߶����}#]Y���2���Y/\�	�|��0����~��s�>u-C4<�U�p'�Ԛ/�>]1��Z��\Tϭ�+����z9���6��Q5�O�~
�q���Bo���G���fw�lY�w�]h��;�FP40��}�=�#�&A�uf�����;������>֯~WL)cJ1��ǔH�"8�(��(N�"�`v7aDwaJOFDqP��SVU}�ňHB��r�����r&�t֏�!OE�-ԧ���g��a6q"=�ccVF��h��Ih�7�s��!22�U�9>�b�������.@ύ�������hPȝ@Q̑}��P�!��D�A����f�n�Q�����_V�P���Қ�A��'?̸�8���Y_��������2����i���x`�x����jʨ�����i���"�J�i	l*�o�AQ�U*Ѷ߈*m~��R���r"��`���q�ŉ��q2i�k[No:?��n2Q4?��gL[pR-ӿ��a��N��]��]8�1<�qT�`NC7h�y	/��H����b�q���>U�Y='�`lW*EzI�g+<�?����5��U�%@��T?:E�0�淶�]h��j9�^'r�c��!����)V65�R�k��%�m0���˻%�()����(����[s���h��(�E^�-����{[���5�2I�k�������.]&�լ�î�DF�8�>C�tE��) "w��I+�B�9����JGr��� ��o���7i�m��ctvL�/�y�����=��ُN���G������G�N����ip4u�z��,��N�]'�-��s�%�M��9� M�5E������H�A_z*��=�,�^�)*�NRڠ�kK1�[�mИ�l�}�����!G��魦�xQ�s:[D�O�}��2B���|�`��I�m�/땾��_�%�uD���\��ܑPQn'���-��(�r�@�ݧ��V�]&�ȼ��F�_��[`��!}%~��{��L�kMK	��{�Rf���7ٿ�,��;�O�͹)�b�7 Ks����MVxE�ޫ��Y���̋�܍<�PM�O�'z��Y� ����&i�ʙ��Z�����;�y�?8Fzz-tN�2t�h�:��di0�>���Fǡ"KYZ�tw�Xd�P$Sp�7T�C����lu�9����dK��k�Y$�M��dלŅ
~xzzֵE�~���=�5�p�hn����h���d���,�Pհ��E*`��M���w��
V�o���a|M4�Z�������50ؗ�y�ig�de�/����L���QL�`8�/_-ҽ%�1r��[_�7`	Z�O7��U�b	x��Ca��1�X��:�g����Oў�����8A�O�M�S�%bZ��<t@�X�Ѧ�>ڋ2J�a�FX�^=��Ʊ�/>�^��@״hyu�T`�0'~�R�`���!�%��"��b`i��?��\P0���٠�ī"����= U��O�9�~/iy��_I���=}���,ƨ�T1N�(&��I	��k@�tXp��Rhjj5�l������ƕ�6z���,�o:��q���+KGʷ�4���u\�ƕ>}Ҹ�A`�a`\S��u\�ƉEF賾�d���@���z�T�I1�������$��s��dHb]���'�c1����ݠ}.���+p�Ȅ�����l�<HG����9D�9"7��(T�u�}U���CD�>c���^R�t�,(ے�|y䛃�������@M\v�i��Qtpȃ��h(���eW��B^��u�ƚE�$�eEk��އ�l�k�:t�q�:�p���{=�"s[��ԩ�9�͢�5��L���:����ڻ9����u�>e�1,�<̰@�x���t^�+���{c�&Ad�=�"��g=t��-fO�� �f�Z���R֜����kJ�]ц1b��ZӉZ&k�3�*�N'�tB��9�p���3d��[;~������`З����{V���N�;���u�p��Ms�{���V�,��\�
�?��I��B��q*��l��
'�8���O{�R�T�(Kw�X��xN��TC�������p,t������s�����Z]"��P���h�s�k�@��X�4�A�T��"��I��y�l���b`�r�S;�<�11�4+�:[J%��Z�3�li͊^�<[j� ����α鄂'�?�������)�b�f�5��E4�s%���q�̉*����Y�e�z�[{��f�><�5?`e���,�8d�\M���,�gBR|WjEg������h�P]P��6�q:U�Rq��y1=C�!A������`d�o�H��_�>� i�c��}p��D+�����x��{~AWV�H�GiЫ��9_��!{��_�V���KaY����������A�#@�RK#k�W<��]�~�nz�q}7�.��.xNV��/b@�=^���B��)J��g�S�q3.$�:� ������`J�0X����̘��ex~�},�N� c��<���{9J[�N%5�n�zgչ�9w�O�;UGeތ��hu��s���+��*`��� �&Q��W����+�f%Cb�����sh�5{D�U]'�#'(�t���<)P�V�\8���ܯK���9��ۿų�\騖h�U|ǫb�?q"��5��8�e梥ft"����M���Of�٘D�a��]�;�z�d�v��YQ�}���ƽ��_V�E�p����܀�SHz��g�-k���lyN9d(f+�>o��*[z+��Xt��%�4W�3��u@��YK�@l|�	�N�w�7ٿ�5l�0���**��]��IJH
�
�Bu�������\D�Pb	�&���T���艃�����yH4��o+�k�V���q���?D�����A�3���b�n�n:eY7����3$���?������G�������w���x���ІނW�0�M=�����Q��9�\B�i�gHw�͸�Da�0n�_�}�v1����/���������V����g��$����_H"��Gě�ߛ07W3��{!bjz��9�6������el�v�	�K�mj�q�=�K�C�&��zT�q�(s�K���!	X[d�|�����Í�(܈�k*���(�f���;t��P�_ti�s·����"d�)B
r겏nG]�g����}�<��)�t�7�6� ����٫։�� �dݍMݐu�����2#��S�;/ʴRE{�D\�7��<����oL��rasa�����ºQ#x*|�Hr����[�ޢC+�-
��e�o�)6BJ���a9�xN��M��{��阼����E�G �	  hʂ�NG1)��B�x���2�9@��uQ�z�O�䲐O�B$�uW9c#��\�xF}uS��y������X�~��\[5�MZ���Y�/��c���vL�!�B\9�w��_/ɕ�qæ;�&�N9�����ޝ ���z'x�t0����}��׍���I�S�B>��=�R���{�h��֎�`0=�p��Υ�ݲܾd�()c�=�E	J�eJ�V��(_�gO��gN�2ߛk�깕��d
	o�����f���3�d�.�YS����ۺ����c�P8[����l(h��k(�̰}v��_������).��(��Q�D�f�d����
P���(-+�o�@���e۽jP�s��ֈA�qV�3�4'*;	����CQi�J�/�6Ϣ�'Ͳ�fCum�H1�����ݙ�������py�;�h�����zK�����y�4�YFPe��_5�R�ڇ�p �ByA��1u��ʄQ���f����-���'a�x�mq��2DF�"����w@�td=�nuZ�"�������OƂ���ŨU�Y�;Y����/iG$��S�8fNVU�|DR��*�V�7�]d�L�Eu����4�����sǄ� ��Qg�g�Y�����]�E�g�G��{ng7�f���`dnˇ��Zw�"�����h���RgŘc�*�5��Y1��b��Ȳ�~��F���݋�RF74��֌�
�������Ӌ��� �"mR�����ߠ�?0t���i��j�$��bHv�E���c%�幠��y�%�9�d���s�"=sw��b��$�� <C��h
�N�%�`��X���'����[4�Z���纟�-W��24H��}��'�e�d���)!i�q�� �P��>�17�� ��1wƜ��:Y�a�s�!e��l1�i�1G�_�7�$��g9��(e:F�W���H->+��"���*�@��(���xUw��N��Yx/aG��O�.ţv�1'<���e�.w�[�v$��1ף�܊9���Y������1�`�n�#��jm�1a|Ny���>m��`���B�G�-W��(C'!%m��������ݪ��s�ee7���>nȖL��iI�_�lYdٲ���\�5< �5��s1�L|�\���R��1�����R�{�s?0抰�Fv+@�6�\v8�3��,ss��9'�ϥ�{��sm���w�<g���P�9ܒ-�6��n9M��-�,[Z�����~F<�Qڡ1�1�JtB��#�ҘP'oq7)i̝1'����P��(9���yLO��j�Qcn�͍�K^h]s�Cp)sa)�V(�q6I�q���ْ
�q�17D����8Y��o�aGmk�p0#$cq��9o��������5��XZ�]񖋅�pVP�ٲlɖ�e�`��Cշ1e1��l��{(�^�t:���Z[�jAH����q�K� ����Pcn�\�ie`��u�}&�8 ���1���V�5<f��;<WX[2������9'�qg�=�Ȗ�8�?׎��G��m�F�>(&��w'�Q�>���b.7fo��aG�etP-{�V�PΘC�'����m�9-���4�Ny�IC�nG��!5�� H�3��V T���6�\-�3��T�-_TD�1��W��+��.R���h���#愓�"�8_��J1׎^�.��Pc�c.9a7Qh_v�����s���:c.�:����>��<�h��ea���0��0F��j.#�(�M�џs�cNv��0μ����Xo�r�C9��	��p[N;z(�@��̪���sB��(���Ak/�� -]��4���H���s��C)�����A�9�}.:R��2�ҷ,t!0k>�b֘��BŶ,���#�����0O<i�r���sn��!̺�GT��rz�
o�B^A�v�����2��CqSo�2��ċ�~޲b�P�\�_�f8c�a�	�_6�G�1��i��e���Ҕ���;nⵅ���ve��1�1�1�#[63��c���s���9/�[�뷂>9�t��ʹ�:��L��Y����=�����|�_������g�HJ&��0
����$F��������3��ゼ�Ӝ��R�9���E�&}:����Q8�QXJ+L�����a��@>���3�4愷��wx�ɳ>M���wz������-�.�\6҃����e��/	��E�H���n����C]6�,B�^q�A���I�c��՘;u��<�"d��
!9��e~����:�p�G�B��ԙ���\*'���S�9�f1%c4��߄�-��}���o�BO�EܡΜ��fV�Y:�R�P���0�b���΂�*�ʩ�dX��1���S��x�ݲf�SoTZ[Fa�������Ay��j�V�B��r}ORM0-��8X�p�۩	%�$Q�%c.ז�Bt�%�U�S=�/���,��f�R���Ai�qA�����B�ɲ+�_�P�����?����"$      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �      xڋ���� � �      �   �   x�mNA�0;���AI֦�'8 ���[�������u�يd[&*ʒ*d��]�B�$�������B��i�ښ�������r{ӟV!IS�#BV�6'�v�U�:�S�i����B�z��E	2ok�����7$�<�      �      xڋ���� � �      �   �   xڵ��
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
���� �Ȩ.|�f��~z��R�#�k[�̳*.� ��+˓Ͳչk��<5���z�p*�������޻��u\i���D������f�ڮ�F�XmQ������7�w쏖�/r'V�![t����oB/��ң��^<"��c+Fv���[�I:�6;�W�-�v��ʹ�µ�:�z���_v����	bvw�Y�l�<�J���[-IrE>�	��M�����J$�avG�sH�T���	��^[�r�!/�`xs�A�q[���s�A7�I�c!���1���:�#r�b�a.w��qA&�k�5'���o��b	AT�\�z��6ۻN^L*s�R���+�l�+��$g{`�����յ	���큞�P��Q�߻g;H-�D4Ù�%(��1��ǵ�`W�����6��?f׷JƫG��HͲ�/Ry�ndhc�N�.�Pu�.��%!���q�q�JS��L��IVؙ�,坓�)� }j�0��@g{�\���hxF&��(oʃ��&r�t��*�X뷐�$E"�أ�����Gno~�ͻ���ğ;%A6��i��&�"so`i��S��z�/����E��^���P󡻏��덐	*LY������������/> zY ���?�����Ѳ&_}@�;��,9V�|��S;[���Y�I�h�j�i��_`˩�ު����5=�Vw�$
��\�c����Zh� ��N��_����N��o��%�K�2��g^#o�/�{C1z�Y���V������MA�1k���yN�@��kմ�>- ,(��Y��S�6?IӅD��f�O쟁�0�NH�,���L\=G=me�~�o ���k�hoG=U�1��X�Nh�om�M[Yc�镵�V�4�k��v$�Fױ!��'u2ˬ^R�)m��?Y�P�Y�H��Ed�DѮ�QO�y��2�F,��3/��f�|�G�{��	���Yk������́�;e��,���،�W�UJ���vFeL�\�z�D��{���"����s�*K�z��t��hO�z6�GC�'w��#�<<�a�d�I;פYmfSl�0ì��,�(�G"����խ��RH�:��J�ɺt؃N�K�IAn�M�I��Bn�:w���d�<�[-�,��;�&j���Q��l:�z4H�.��l:�Fv0��I>��l:��q��9y��l:�FE��4��~����-d�9����o�B͒��/5�W�T-���(�m. �4���=ͼ3pv��
O3�ܚ��aK1Lͼp��9ov�|�J3o2��XC|�����E-�ހ��eGK#���Q�ڡ,i�F*V�a_9xɺu��d�-��>�4۔�C�����?��.�������Jl�֙�	��D),-���('
:��v>ZZ'^ET���nXZZ'^�9�5���N�d����_G�}���I�Y�%��}Re&ې���7���0�6�7���eN���2<�|	L\�N��=�S�4���	io�{�3�O�M����xZ�'�n��N:��\�`�#��<gBD��3|mN��*[�C31 Y�Y��������փ= ���!����O�b�mt���J�_~êD3���M�@�~V@�t?S��~VI�j8��g��DӨT�Fq4eϼ$5��!KS��k��
���� y�){�U(�[v��){��Iԩ��N!�ȇ=�Pĸ�b�	z�O��8�_��F�� )�g�
���I�|{����Ϸ�30����xe����Ɇ W����}.$���8��X��g`�E����>��`Rw����/�_�S�|rH/�Gr�,g򐾈>G_\���F�X�@;clP���\��y�P9�K߰��'Y1:l�ǅ���~�/䜨yK�&?��Z�3L���p����M�O_���szr����p�Q�2)[-�.�N���5
�K5,μ���p7Fc�+�xK>C�7[X�
'ކf^��D_#Ͼ�7|�UR)�f��[�C��;��W&��X�'6g��6�H�'�����os�"Ud8=x�6'`��n�k�<}��բ��a4Y��mN�dz4z��3�mN��*�]���@����ItF�����	8�[���Z}�X�֡4�fPZ�ɯ���-{�@^�!"ʥ�xu��k3��͡���
��ʱ)�C|S#�Wλs���T-�d4;���$)�����]�3�=B9�=S�˂��WR��3י�S:�X��'�n�BF��qt]�5G�ᄙ��Ub麮�����	�+e麞xiW%O�t���z��N	������`�<z���Y��'^�����S1=F����*����n��D���yW������
/�6E�QT�=]�3�'�'�e���>�Jʭ���j���ă�@�<]�p3"�64�`�j���)�H�*���>� Lq�q�����kf
�h�8G���	X�[��RR~��r��)���A�b�l��+6��c鎱�?�o�}����������~����\t���i�\
Q40K�I�DKF)��/m����B���]�Y��vʱ�')Һ8<mܷ	��|��6O�m>�^ׄ����^@k�XwJ�d�7��5M4���T̵���϶[�v4����I���q=(gd/�GD�8�$�n��&���l/ȍĵ�&M��� �')�`�y_���g;�e	Qh������\��'�"�l#[���2m�TP5y���Cwyt�¬��I��p�ZH:f�3��\Gs����E�\B�})Y�v�O��0�U��u\�Q@fn���9v9G�1��Ռ:��$ղ�$^�SR��A9#�o<�ۤ���r
$��,�jO�ˣK�jb�_ڵ���\�d�q	H�K�r|a�-��N�f`o��$�ƑȞ��]e{�?!�[��6��T��z�_�m��%$��������+�Y�=(+2����&w��c��!�����v��Iz?�f����������0��Gkl��3r!E	�M�t�~(�s�5y䝢��������Nn�����L�A+���s�~�Ȕ��O�]8�"z��i;Twx�q	^��I q�%�ug����Nn;��RIpF��4�	��2��;��x�b6�R�/�`�'��<�v�l�5��FkOr�IQ��    f�D}�wr��IH9���`~��o����#}�b���JIךk�/�M�9$�Uѯ�y���/n�T&3ꎈ�OJ�H�C�/, ���0��W���i�6��P󓪺c�^+Ƙ�	��Xp�UMd�����μ�+7�����kr8�xYű��K.d�a>X�� ���>�:{HY�8�yC"Q�f��̱��K�$���-�b�3o&�����[z�����Q����6���sO�y*��hiY��!���8�e~R�g��30��K�<S��1��B啨y�	8�}���γO��vC�)J�gY�p�Z�1�;��,^8� ZF��²x��3�`�Q��H��x��MJ$�x/��c#���8���#�p�/:��j�������~��}%Ϫ���|�3�r$���<1�#F|���r�LU�=�Ȣ��Y[/=SU�[K^�7�=��*U�;R�}���TU�����є	#�x��8j��p�Z�LU�
��=�if�S�y��^�	(y��w;���U�p�"�{M����8�$W]�9O��a�K�*��>�4�F�ݘz¬�d�OI� }i��}g2��$%ڭ�|m�Vg�X������/[Kh�6;c��Z��vr���]�c��&�7U89�Ov���IAX5����Mk�G�FWI9m�[Q�����|�:�z���Q��Ԁ�޴V^��a���Mk�%T:������KW�5�1��V:*W��P3�F��Mk��AHH�\�7���>�H��U�|�Zyk����9�|�Zy�쁒�������-�7�+�1�m�7xsSm�6�-�@�Q�S��k���Y�����^(5�	����B���	���^�]`꟭�ы���9y�4���r#]l�L{+p)�̬��$��^�G�:D,h�����_�[�����w�[]�[���]x̎\�4�� G��|�h}`�[���t��0����WT���M�	l��p;R6\�ܒ;�,l@�����A��p@�vIM�3
��w����HU�1&�!�\�A��Q��m�\ECs��d��̳]j�;�$�{Eڴ�����F���j����6&5J���?'z� ��=j��.�c��/\��*���f����_��#u��I���� �|�ʐ�NRǵ��-y׷^:�����)�� ^��]i�/��	7��Ie��pU�h��ҿ�j�/�͋0�|�R\5�L��^7�ֹj�pKd�4-���M�0B&�au.��"�W�i�t���`�1��MR"	:f�y���$R�o�i:�	�v��[�f��:��Wр2�jyC'`b�nf��:�*���vG�]i�����2�]�i��	=�̜xC'`X��q�Ճ�1t&���b�n�u�nnM���e����n9d��i�q1��S(뼀���Y�msD���,�c<�)t�m���CG�h'�̦��s5�`L���B"��1� ;EZ�)\���{�<�r�bk-��v���j-�q��g2��\��8[�f�~��p�Jc(���	w[��Uq,�u�#[��tNh�Еٴk-��ތ	�e+5�;ޜ�x�����z����*\��N���'��e/_����U����Nk�kU�L�tBt3�������7�i�3����NG`��,���VS�kU�L֛DuKn*sU�p�v<���*�8)1��E�k3Z�X`DS�W������q��#�N�lU����(G�>v��z&{Y"X�k\U�\�y����UU/���鬏�>1U�J���]��L;&��MzR$x�˃��
���
�"�����2Y:~a63�I��IJ�h+usϢ-}�|���� ��lc�HN���b�)�����K3L5�
��\7��j�8%Q�`�>�Gw�]�2m�"�j����[��Ԋ��[�[Z�D^��T��(
��+)p�|p�t�1"�!����ʪ���B��M�LU�'5R�H�Ѳ�UU�UU[�������$�JEr�h���>�������E�s�asvAԘ�ROU}�%�x�n���>G%<����RU��S� ?yD�N�	����VŴ��\�h���<U�	
Mm��+��*(B�!):�Uq��TY�����.�%�ʷjg�qt�����鎟�����LI�xO�d[$�f3:i����P N�&���웰HzJ�2��;�m��e�,����\7��T�Ψ#p.肂<��x��0���|nVqkp�����\�<4Y��N�k#��N�����.K%������$dA{�Z�3�i%�hY�R{�UU/�Z����9��UU/��#�_�تj}����ZtV\U�L���;n
�sU�p0$�o��UU/��CZ?��(�U�-�����ض-��U�fW}���.���B^\S�)v�b�S�jY~�"Y�IA�9���U�,�D�5������1Ƽ:�rU$����8+$WEr�2	[���D�U�,�j��f��v�bm6Z�Y�k���%���%�� �Q����ҿ|����f[��*��d�@s�b��H`WD����j�H�O�<�2�a��V�,�$H�s]g��dN�6����|�"Y��%�I�:nJ	�f^ߐ�5���]�9��>��l�x�C8�����<7;�ܺf�B�U�J&8�]>��#L=Ǥ8��B�rRQm�F	\��!���E�i^����8<�߮s�,g�Y�� /�l�x�s���X�U�����J�XW<#��}fk-�9��槐N���ɨy��"�8�#�@�ᴰs�R����R�9�S�S\BO^6ܕd�S\��h��~�KHfy�}��n�"$j~R���K��X���3��p�t�a�Ho���8KfA"��J'���FD?�ݱ�^Ď��=���bD�����3]����9��AE�{NC^;��#R�h�e��h��H.I�0�6u�ws�)���e	h90�i:�u��	�����h�$�-��H'��k���;/��h���ƃv���z��U3G���ڸ�?�K�y��]��}��7dq�����]���/_���+��_�������ݟ��o��?�￧������7іl�ME�P޾}�e2�2.���������/���Q����@�VF���+*}Ru�Y�p�w�Q��G���,6��EҐ��WO����;!Wa�٩���W��h��-|��v��$G�	���O����p⯢x�,;��'iMH6�N�����}��c�z�˔JT<y���<��?�(*^�-�S��Z�#�R�*�(eAkg�f�y�Ƴ�ְ���.��S��fڡI�h訯�5JĒ瀰�W��"�^�w�G^kDTc0[�!��[�dK���y��R��j1*Q��+�]9ӯ�%�k�.����.K#M��[���hQ͑���i9�PՅ�K&�rs��k�����	���MC�y�l4���{���%�^��F��?�"q�q�K����sp�pvsE�=�.�� �\��L>��[0��[��'R���.m+����JW��q��%���g5_�dA&YÝ�J�'Av�V���|����u��Ͳڻ���i�4Ӥե��O�VX��f4Wi�'a氾R�S W'ܜIZ�|�d��uN�L�ƾ���*,K�Z|�ӝ�$9!�{��)�'A6�Q3�,\����?/�	5��VtP�殓;*�{�u����{��iY@"�����<����ԇ�	^X���f��VɽF>��1�S��d��Ύ�$-)4�Lrp|3���eI�����[krW&S{r�of�����g�5	j�СO�"�<Co��7���(���;�R�')�1������fvB�V�y����d��LB�ax\�2�!�B� ^׳r��yg��Y�ѧѐ6����nA4#�����I~D�Kd�fv�A�<�Ja�fv�E�-xx�nvļ���;{�N�2�Ij���l��2~�Q��j�/{3;��(MG��7��nb̄�*�7�/y�]/�ײ|3;�:-4xKٜ�s՛ى�wa挑�=�7�/��Q����,�̼sG�d��O�K
���x[    �8���-w�>	�EȇTڕo|���
�ܣ�\�#Y��~�{o|g`/�l��{|��.(N@��ȝ�e�Hx!%�k�����%'��l�^�u�V�,�L���=	��"�0CS�I��(RpW�*f�l�,lC�Ӆ~��i(تs���\��
�nP-�)���
FV���Gq.P@H �sCO��?�3���������G�bH!��u=�%eS����o������>�{�oo~G�ӛ��m���/�Z�7�����7��������_�������_��޽������>�?}���M~����_����?xW����Z�_?��-}�?��C���w����q���i����8�g�s*���%}��vˊ��	���*��n�w+�O��D�3����{�V�ޭt���C��݇�}���������������JZ��_^d���i_�]�_O��t��(�SE@>�*�ϻ���[(5����t��M1~�-��q�ZE�Z��7�K�/������7�A?g!�n�Rί����2h��.tL�Ba�w�����>�_Q�t�P>�S�]#i���/��_�m�_��������w�I���q�l���yN��6��m2w�����͍JǍ�M�+8�$��F��r�=O ��#����?�k�o_�[��#�/G���k���n�;�������o�	�=��GN7�(��y��!�%�L�=Q��������S���l�s$�P�[�5�J�m(�y�����;��P�����Z�t�X�E���-}�����}_�[~��R��(9���E�� ���2.wQ��^ts�E����)�[7S�ϟ��߾�п����v
�����揷����'C�����釿��w��?��{{���?���'w���8�z����ͮk�l3�b��̤Q�������������û��7d�~��2��[FO�E���#,�$��+���ן���������F���*��m[��o������K����:�>7*]�Ka{��}m�?���?�?�����o�WVx4�����C|�/#���.�)�~=�ܭd��eQ���LU�
�֖��A�}�Vf�2".j#_S@�i��4���y����{qf����3�R�͍^���_o؋݊�nX&at3w��j}��->�Vґ�Y���������IV��������I{QFˤ�%<{����Y$?i����Lw,�y��B��Y�c��rvt#*E�}�q���t��(>z�mf���Y�	�^JR#*i�[�ա�!A�B��uj^Gu|7����R�յ�?~RM�*ͅu�s	�B2��Sqs	d%Ge}��h9#g��=9�L�|��h�5���cvy��������堋г5�}5��OJ¡l7�+�E՘/�i�T��⮛�^�Yu�B�W5�gx�T<㉝]5�K^��.T����WUc�<n����9������%oPd�)�#�j̗��~�Y'w�]U���79��f�KQ��1_�Z{V���Uc��%��Ԡ�h����%/��<�L�t~Ս/yɇY�z�W�^-�Qj�l�tͯ��%�r�~J/��\e?��:�lt�Ҧ-^�K
&f�^V��r�f;����tk6S�w���p!��s�1��y	L*��Y`��cv�ˁ�8aޚ�]�;�^�ɞU3 ��^#� ,��b����3Kh���2|���Ta�u��V�����$�-��l_��ᱻ��8=gNG�����Ƒ'�/jZ����d��M���;)*���v~:�cU�gĀ�}|�dV`��	qgSW%� g���kL�O�å�TJ�\w���4� �s��u��"��ț�Gb'X�O*���N�6]�,kTX�����Ҳ�L�8_ wQ���Ɠ +�oI竑J�)B�EC:K
%����<#�C�O>�����Z�����r���[�����LQW��5���~Y�گ��!E�١ͯ�R/w�~:]&pr�����ziJ�V9���G���M�Uy�t���ץt8�qBnj+7���IY8�f/�|iJ�y	�EEG='���,�9�Z�5������-93u��șn2,�hre��:"�.�,�P�?�`l#7#|G�L���X�;����8�}��Qu~������=�Z���3į�.t��N����e�	)��%Μy�A�ݨ�R�.q��k����Tk9&Μy]R��d8&Μy�JϮl.pL�9��g{�mk��u�3g�dESH�ۘ��ͤ^��颃c�̙�D�B���9&Μy+�3�g��i�����y[%7!Yk�D�3/}����m8&��x11 jHyY2�D�3��Bd��8&��y�zJ͖�c�=��i��f8o�\���ڌK&&��qE�7�Ի�\@9�8owLLzD��W�?���ܔ�m �b"���3p�us�9��-!�m�\��; w�KU2��z$`��	8þ��#���Q����~�X�C!
�&;lCZ+2��n��)�oHkA&/��3v���d2�F8�a3߃q|~�#;����8ֹ W%*������X���� x��q0����鞨��<HE�:Å�]�`�bIX�+�����X���H�����G8cbm@�����X�-YwOJ7�Gb�����h�)�D���еυ�8���oQO�Gb�IS��fX���サ1(���[��m�4l-ڽ2_B}jW�=�V8t6�n��O��ڤJ�6_⼄$��Cz��\�� .��o��i�HO6*p5Oȕ�$v9V3����S'` ӎ�i*����'�ao�I�ک������<$����y���,��j�����s��a���%��{��<��tE;���T�@���+���¬eՑ?�ik��� $�O��;f��y�Hu'��eVʉ7��na.<�RN���9�)Cʳ�J9�6+�]S�eVʉ�{=x�0,�R��G���-�Ųl��j)�p���eVʉW5Ѧřr`��r❓���<Ϭ�/��6O���b�0+���H*H��j���J9��m�R��eVʉ7з̪��ve�f��x��t���,�R�5G�D� Y�d���ؓ{�dZ��g���O"�6�M�g�ywˢ9/��zĵ�Ro.��ߜ���/͢9'*�˴��	X)M"��(8�1��&��\$�#���4{�����k�{��v�����z�`_aa"��[�gx�J��vI���8ä�"&m&���Vՠ��l'��SR����/��hȍ�������}.�"���.�=
�F`E��7.� �&FB[��o\��L:E�o���gY댖	Ђ�<�YF��3��6�<�Y������[�y�Y�Gd_Di�%�q|��\��x��ui�z��|�Wf��@J�����%�&�
ȭ곻��j�.�]��T46q5I�xD�7}�Gի���)�%�#&�3� k�{1�Vņ�^�M�6���g8��v����W�)�0��:�*B��C��y�Uti�]H�3zʨ�o��\NE�����ͷ�X2�g����'}�����rq��i	(����I��Ѵ�GNwη;!�/��&d���OtB6d���${����l+ɽ+ T��Ê�Q�Ɍ����"�5;�A�1�o�1����7EpEΊ�4W�f���'�4`Z�Or��!(����u��шq��1�RH�n]?'�P��C�+�W~$ ����6��Hx��2�{f5�x]ĹK���j\y�Q�\��ӬƕאQ>��]�yf5���~E��o8ˬƕ���٘6�Vxf5�x�%��^1�eV�ʋ\��R��gV�ʋ��9����3�q�͍T�8>+�Y�+o�[(�W��j\y�c�>�3ˬƕ�[a��bR�gV��;<�ԣ���p�˲á��x�oU�yf5����&3$� �Y�+�&Q�`O��c����ί{��AtM̱\��yZ@'�E��}�\��ؚ�k�
�h�[Nn\3�V���@4��0���<E�ڴ)�e�ԲW/��~�e�Բ�*�03�gs�6��E�Q���^�%��e4����j��ތ��t�h��7���oFu&MW��e�[R�>��^
�r�qq���}vF~}�lN�A�香̈́�+Vd:�    �����>.��������>.���n�窎=.D}DF�8�˃N���[��mb���;"��&Z�8<�� ��i�ʝ޴W_��X��v�I�_��kk������Sy>����]G�85N�_ӥ���@��A��T��ꩬ���̞u㚉��F�0���\=�����a����3�_ᶫ��S9'���h�"��z��Xy�!�K� �"L�#j���L[�����/�L�x(S
�K� +´�\�Op�Rr��l�u��y��3���菈_.�W�]��n|6-�l��&��~$E��k���/w܃��0?�V[4}�fƶL�f���0������|���}����M4�]7Rsu�O�$�"�wl#`'�ވQ�?'��ClxiHTN�A�.�	Y�BFӬ���ꂟ��#�w��Z�_.1��m�~r�%Ƃ��zS�J��J�9DtUC���O"1b�,k�+1�9k��V�d�+1d�r��fl��铜(s�z����3��N��n�#��+"Ǹc���NG�sXIM,kV� #��9I*��!8�B^�3�²��Is�%q�&��x�5'^��T�}u���������D��wF�]XCp��^4�H&i�5'^�[2{sN<kN�dU�����e��7�!�P�l_�si���h��2g�5N�#o��"	&j�Y��x�'g�h��5'�EP�L��5'ޑD��d��y�V��L���/�_�.!����{���K�H*o�/}R�C2j���yp�-h���6U�6`�@C����Y�p�S�笞��}���`ii�|_=����o7�i{�pB��>�
��}��g`��/MZ��'�DC�g�U=FJl��^"��k���<��i�D����8'��rCb�ѝ��X�I)F�l���Rb6��ᶃ��X�C�\��v�DB)��;�w�ڪ�k�%��V3���-ȑN3�����95a��n���hQ�vg���/dr%���L|���lAn��3\X���-����@b�"�Cbd4a3~��Y5!�Le����Zb�#�т\�9�)���s7�DZ��J��:�h�3�r��#�XFS|%Ƃ\�����=�Bd�mH&%͕�;N�ed��]�x��:�+0���̑��\��%�1�.��R������|�2W�\����^I��:�0\����pu``=n��q��R�X+�tWM`:/ĩcjrq�R8æ0�+�o�D���4��TJ��Q���e���pJ�8y�jn���X�sJ��N2�?'��5ry$,�_��}R�ջ�X~�#�o�7o�����4�n���O+d-c��z}+Ǐ�dE���i��V�w��n�9�w�mI�����Z�_vF����O�;o+(�zx�>��l���-?��An����|��O"���s�G�<�}�*��,���y��M�T6]޷�L���h�lDE㭕hAp����r�"���~�\o��SW�1�5��r�d8�1��ñ*V�a�ot�S1o߾-�>7��m�C��*6�p܃܄G���Ö�O*��[׮��=-���E;�$��\�*u����W$��í.(:ö1�	�l�������?!#�o�ek�˵����yta�^��k<~E�����7;K^�?!k�P}���\��'d��a1��!��������W�-�d���b��+��ЄlP�mǺ�Z��.C{����_!� g'*l�T{�+��1^Z"�T�
����_F^��r�]�Xv�k�W~�N��^�u�?_1͖~��������ҨM�X{|⥛�2z�u�X��x�Z݂%�e��� ;��˽�����Pk�V����'^_�CdjѲ�=>�m��Է��Y��xᙚ9��W���'ެ�CC��dY{�:�+��t�04���/F��I��e��%E��̲���K���ٗs�=>�VSotQk���+/���R�5��=>�U���s٬_�����k	L���Y��9=�ڄ�cXU#<ƿ��MF�c�"�!46/!�+k�� ��iƖ��ԨrNO����g`��4얍 ֵ�a'��.�
��3=��,���i���aQ�#0�#�ϴ
rF�l�*H�`���'`2amA�X���'`]Evy����k��V	��Դ�U�-����ڝ��k���Hp��lŚ='X\�F��rkp&�<�#���p�·�t��X;lŨ��C�kAiQr#�%yi5z�nYwѬ{���>󞐛h(�/#�}�]�M%�:�0��'d�B>Cm�>�Ȟ�Az]Rl��O���73�g�9�1D#��:�\���Z���H���[��#?�WD�BnAnY�KW��W�-ȴA=�J�rG�(�s31D'�BnAV�1 +��
��6(�����\���P�#߄=}̗�Q����r�c��9}�<�5��x���L���5V�,\D\#s��y�V;���
׸�\H8�rH�q��/I���P#��h	Ͳ��5`In �*��5�qN��X�D�0����ԇ�t�J�bm6�V"X��\��l���D�U�-�ދ�a@I�\\)֎����o#\+�p���P��{���X[�3���8=����oo�dɾz�ߥ��I�������۷���M�2��^[/��qb��z����'e�g�1�V^[/��q	i���g����qf��;OQ=#{����Kul�O+r��2�q��m�iE��>���$��ӊ܈uy�6��"-d��t���I�Oȶwΰ?�Ȫ�:K �5����h��)����mdH�5y���V./�D,��T÷�EJ$��g[�����t��4ƣ����"�"�r�)��2	�`f�b����xD&�mNL��Y�r��LN�P����U�K�T�E�H�E�[U�ʯ�j�	cc�?�H�w��U�'� �\Gg
ϪܕWwѺ��4Ϫܕ���Y��_殭����뜐h�TBL<�rW^���r����]ym�����smU�ʋ��s4���gU�ʛH�&y`�V宼��Mt���%�U�+o5p���gU�����A�*��c�G�N�zv>ۚp~eU��;�͏ν�U��&�p��$'�V宼��+�Zc��gU��k��ɽ�*w��(vozu�U宼�1��V��Y���zr"�).���C{��L�9�7����ٺ:��^[EԲ �f�L.2��8Q�&��]��W�bI"�yϙN\>�F���X�2c&�TgR�Lg���G${%3���0�?�g+ǱS�yi�F�G`?P�e�L�7V`H��oV!2��X��]nh�s)��Û�^[�t�*��@�t����a&�,�,,��=.��0_�`J�6r���L�ĘZ�\��L-����M�R/���n�ݲ��G`��,q���[m��Ut��q)�rq��i	N�l��/�U8!'aԜ)b�\��j�6D�l1ls�="��=����UX��+]u���\�9�R��/��ێ{E&�Z���u|�q���E'0��v�W�*���a�����+��I}���ķFpGd�6mg��|���I#|�O����2�6_����W./���D4� Oh��2C�!tX��+�d�1�0>�/|��L��7>5_�|̠v�>~:C�o��${K@�ͺK��O(�#HUJi\�]+�;��N"ٵ��%���&ٝ��׆��E�	vq�*��p��K|Dհ�k�똒�UaN�1�pw-�F�aq�\�]��#���׹��`ׅ�3��\��,�ʈ�u����D����F�\�����h䞻�Z��9Ӿ2�g�VW�rx&��5���W9� �������#p���ۮ�t�^�UQ�Qǲr��?+QT��?���)?�G|�����,�.B
A�N���_Q�7��o�������_{��û����w�?���ߖ����O��}�M~߾z�O�������w��_�����C�׻�o�_�?�������������\�������_k��|��>���������M��M~�-����[=HG^q�i�,�3h���9E�    �۷oS�I�>Hz{�_ם����X���F[��'9�g��l��^,��0ߋ�ΛK�tK�]�r�kw�3�Ub��f�4���A�+d��L#�g�࣠��smzFNxD|�k�4�K���LW��J*�f�=#��g����e���a)H�N�0����I>Y	�8�/k'�H������4�/R%��d��Z �V�,ȴ7ʠ��Vg��UI8"[�f�t���Jd�1�c�e�|Uɂ9
��.�UɂL�́uCK��dANE(��-�F��dAF^	�4⬚�J�I�"��m4ӿ}Ru��B���� ���L��Л�tE�1�JJ��q�M�9�٣�x�=0μ��j�(�c�3�"�Kr�s�q�Z��L�{`�yI��4G�D���ϼ>	*��8�� �t��N͡Sng�u=0μ�	�"z�ƣƙ�l5'dm9��8�r��R�O{`�ykv��;=;��q��3Q|�;x�=0μ�?_7�Õ=0N�YzRM}�Z4{`е�G^E�*�I��q�Յ.ȴ������K�(�9�\y�=0μN�(B�r��c�3��$��M�9��8�@�w����1��o-�U����x3��
ɘ������h�l�!0n���t��{v� v"!z�e.,����tg��a�P,��N�E:QtHo<������y�����e����ҘZ���2i������2�7��_��u&k��9��K�I[g`�я]k�I[g���Pf�~���NEXQ��Uq,�-0�J�sUp%aT焼��*s�����
F��c���T����8W���4��f����F��끭�X�gۤ[�z�Uq,��
wk��1���IZ�i��h�|�(��,!�_�Io6��^�psBn���M�$�&ܬ�%�#��ka�p�"���|��N�M�Y���pMD0Je�p�"���J'�6�fI�o�E��s"ۄ�Y�������&ܬȦ�P1�)�y}�&ܬ�N�]N���dA�c&D���*Y�c
a�h2��M{L7mi��$�����X�PK]䛻�"�G�hm�J���P�����*Y���1��e����euJ�f_U� �*<��n�jU� �$*@.n����p�X�G���- ,�"�9*�&�Q�8h�p���\��0�!���3�FA�l��S�g�|� ��]$LP�-�(�L^�s�{YS�FA�Y����arJ�5s��.��aK̙�a��˕Q�#� �+��k��s��.��]���xђ��X��R=+b�\���d�V�Uq,���J�c����8&s�	/��qU0mN��Q��Tq,�Y�2f��\����܊�t��c�U��I$*�Uq,�$�-��F�W�q ��ׄJ�����_MwIW�2>_�}�6{t�m�PGym�o�{ �<G���O�"" R�gӆ�ٯf]B�B�YY���JKH�M)�R�s��r���÷_͊��t�b�|�+2�4z�H��I=�Wd:|
�M��[��j����r�8�a�^���£�iVV�T����L��h|�լ��/�?g�ۯfE&�A�4�H�7}fE3� �<�c��62��:ò����K��?"c��	t!��~rq"�8}`�W�-Ȥ�Ӹ/�|�߂܆ew1D��oAVTLMVz����E����L�"+ڛY�Q3c����
��%����[�闬qX���̑CG�)��seW����f�`�����V{�]�N��R�=�5Ϯ@+/Q&(�T���h�%��B{O<��x�Q���&H�]�V�V%��6�gW���wa,Ϯ@/�M"[$�G+yvZy�v�K3-��
��� d@�F���
��<PB?�xvZym�b�-��
�O�uQ��Q��
���@]c4���
��.��`ߜNYW��79aХ���yvZys�!Do���h�%�Y:���yvZykcN\����
���J��yv
�.;�ҷH;��9ϳ+�ʋ.�����1���'Sq��6� n�EEg��s����i�tR�����sq�y��]�V`ؕ39Mf�4�.�#0IӄYy��]�V���=G�c��4�n.Y�Y	ed�M�W��=�^o���V�Y89v��t+0
�gf~޴+�˦[�Q��
��9�4�.�#�vB�˶1(��l�����!�c4�&0?;$���Wj��;��>s�_�C&]�t�Zp���3//��U�-�$��,�p.p�t�L���U�:h��n&[B:Xk:��tp�x��ӹWM� �B���;����͠�A����n)��錻�OT8�vk��Sq��;!G�n�&�o�؊�5�S:�d 4�Yc+r�"dX[�/�[��ۚ���7gzE&��Ѝ+)��f��Ȥ�ǬvϮ��[���5XsY��6klE�~�2�L۬�p������C�k�m�؂<�
ټ�)�W�-�fv*��^��%qE�^�y0�Nj���oAvED�L#�K�"�옕k�|��15{��_����[���!˷�ՊL_Tf���|ǒ�ȕ\W4����mm�"#m�k�6��oA��6��o�j�����xi�3�m#-��I�4?i�pi7��8!-��\��+0�p�kp|����R��\��0�2��ŵ��
�0����_����	R%r��#p)B��)�58� ���!Σd����i���3�L޵�
T�\��G`E��38�WM� �w���󞫦[�M��Ո�:��.����$T�j��;�f���*WM� �,�C�Pp\Ƕ���]�#6�j��`�%�,�O�r�tpI$=����>l��l	��U�j�(��t�-N^�>2�tG`�;�q���5ԪQP��Q��/�����w\$��������3�A�\�w�ِg��\�N�ֵ��2��R�Q�ӏ����	�*��n�7y�ڳ�Ȏ$k�Vl�R��}#��wk�F�O�x�Y&E��F�Oȩ܆�����	�h�P����2rB���'%m�	\��&��$��&$�W�-ȣ��>��T�j�#�UV與3�_�� �,|�Ĉz�U%��7�f|G�U%2>��ܪ|UɂL���r5|UI<"G����^���9�[K���*Y�sqD �$]_�PUlt�����U�i	�C�g�qm�
�9�!�V"c� �@<lc�uA�MH$�Em+�#��t����#_�5�U$]0�6�]��dt�@�4F��dK�4�6�W�/Ȯ���[�r� 2�я���X�/��E�KS��*Y�����ls��/9"��c��a;���\+��t��M>!w#$J�b*Y�G�7ǭ^����KC9�+[U�"�a?��S*Y�Mm֖�^�U%V��."�B6�)�����l_�{����!�k�ZVd��S�7�
|E�](��L�$��pA�Yԙ�L���c�"����s��W.�ŋ\��~��6\��L"�
1���ʫ��>"w-ZG�\z�W.�d57��Ӟ�6<"# �Q�RB�b�"kG߆��b��oAFޭ�lGrN�dA&�"��J���u�d���A��/
[Ub�ȡ
i��|�J��(��b�Jd���>���U%2�$5�T��[�[����o����Ek�>��}�����Hs}9Y�*�b�w}|��蕱_��
$�ر��(��=��L��X-�j9�����j��8�P]Cg�d��*�?G/�j��1T��$_m� �q��k�|��L~�LR�������Ǭ��&\��_�� :s������ 7O
نL|��ܫp���}�W.���dc�9���\^�U�́x���� �B�Y:����c"|�QxdxŲS�6�\&d8^竟�%8-B�uL�o��	9r�בo�Ɗ��?ǒ_�A�(�s$,�,�9%�1�m���������Z��n	�.�U-�\��`�Ρ�!�U-2�0	�/��W��Q�X�Ʋ2�Z�,�Z7�_�A6�d��`,�dK{;g��`b+�d� Ǭ}�����D���6�Fe�ryA�cXQ���|��I�1��]{!�B��@����~�X�P�Ao����Zd�Rs0Y��<	r�b�>�w�&��Lf��3̘���̤�q��V�W    �s���"��?�6���Y1�Q�l|U˂L_d�ZJ���jY��82��"�P�d�H>Mc��-$]��C�2rr�"`�ATŰr��_R
��J�|�+2�m���(l�܊L~�5����r+rG]��E*{���۬�2�b���� 2޼��xPe���u�W)U���+� ���1�EVd4P7&�R��jY����6G�|{|�c�A%�n��N�1V-2��*"�5)��YVd����+rT�btnR|����S�c�iv��-XZ���<���Eb�i��M��r�q,?��L��>gp�r�B�0�<���-��c�b�d�n��Y�ŝ��=������<Ȳ3ۻ��H��_�nAV]��0+8�rzA6e�ȳK|�!Vd�D@:U�>��n���d�|���b��*���:���U0g�?[�nA�F����r�� �	�۬�͌%Ƃܔ�e^�J���͇	�ۓH���yx�Wb+&:�?�2��Ӧ���<ģh8�h����%��h�Wǃ�����Q�i�o�؊���y�V��W�-�V�`nN�o��쒐��܉s\.�d�E4�Y Kx��hsH�W���t,��)�!�l���J���](xK�oa�\�p��,_�� �.����V�+�0��6A2����"7��ڶ�!��t������_c�%$a�]���Y@f{�+Id��ҞC��h���f�|�ޱNe/��E&�z��£cʃ��� {M�x�`�_�����;���� 'C����a�I�}�4Fc-�I�_��+�����TF3�6;����d4d�1x��YP�|��d/�ա�u	�P��'G��J���a�=��
��� d#I:�[���w�ߊ��h�uIO!A���P�4���6vE�N(|Q��>��3�e,N`o�Ì�L�P#�1��8�nA�N���76�A���J
6�� �}�h�����:RH�ᓼ�W�%�=}{�S��d�w=��{O"Aj�@��b�D�t%�9���[�G@��\I�}�ܡ��(ل���Fg�i� k���ь��lH>��ܢ�,�"����Ө�IβϘ�Pv��P�]lW���0��Vs�I�cP����xŊ3��)Aߖ|^��j�cܟcE.^xtHHj�z�Wd2�F?��&���]�XQ�s}��LfR�=t{S�q��J��{r5kCd���{�x�,��w����Aq�W8Z+�,zC�)��qA6N�a&�-]_�mR�v:�]~d��hvA�����ׯ��$#���(cz����њ��l7�ز���K���E+�b9����n�1t��K�B�2	3��t鮓B�q�ۓ �,�F�*?�bq-��swgd}D�h K�o���v��.��Q��?��ȾN����9(f{�I��}Nl{9�<(���|9I�{��=Njδ�=(]�z�L=�cv}��d����}7�7]��j�8�ܲ�,|@ۆ&���;!wrH�kn�kV��)ݒ[�t��U+2޹��Lp�IFSt���Or0��������Ep�qv�I����g�~�8.rZBcQ���_��]/R� ��2��l��sx6|϶?"�/�0K.򍬮�֐�Ȫި�|�.�B)sRu2�O���([y�ٴ.�3�"�Xӓ�InC�%�䠐}�`6�f�e�io��e���rjt&�h��Z����x!x�T�Z�/K���Qc܃,��(�� [a眙�����%���0e��I�k9΢��7���uva/�jU�.a�(���dכ�jAƯ�+rwBd�M��My>Tus�k�i	�6��$��A�B���53�_+���_�?���j������QR�����]���/_���+��_�������ݟ��o��?�￧������7�7j�΄�߾}���{�=�ƛ�Q����/�"܏{�qBe>�����I���<S�>ۓ[�OD%y\"[z�K��A���eNgw��N���wB� �q��>Y�"�D���iǟ�'�.
�����������ۛ�~����=%�gO�p"-� 7��h�^痼/9%?����fa������{&�T��%���G�3���Mk���s�����N���s��u�ttf���s~=o�G���2X���G���"�T��፝>I�)4����<�Y2�ޚ�>��5�x�#<v��6�n�@3䨤1gɗto�$��|ԩ��dw�i�e�/����|�#��zY�����x���Gެ�(5n��C�k��ޫ���+*B?Y��;G��9��+o�9h�.�N��0�oA/y/@
���^�����9����� ��F=,��Ҕ��EP�]�;�p��.fg�K�����)��x�;!�Q$nl��$�W��L���x��>[�o���ߌ���u�&����Ƚ�(��=㮼��k�P)n��e�C*����-�:^B�䁡���+tS���n�w�:^�>����;A$�h074�����l�/��Vي��P�C���9M��M�{g]�z���K��nؕ���5?)�Mp�5��/�G���_���� ]Ѕ�s������T	?� �l@Ⱐ����3af�X@�9�|�;���q�<���!��L(%�9���S�� �ܗ�Ԗ�r��ʋ���&4���V;-IIӿ���R�c`�?�������]�Kj��#A�C�9\��U����,������P�����J�&��I��3��;���NTtMZ��s!#mgR�ʹ깢t���B`¨�7d��^�������7����|+�Ūy�L. �aK\����x�pszq��j�G`�Q����C�.V��.�l���?_��`�v�s���Ԥ+U�L~����\U�����W�]���0D)sNf���dEh!&S㪚�)0!���-�9pU���B;r5��0��:�s�|��dJ���!����#rD��9,5��$��[\��~�?6�a�`�Es�/`4�i}�d�eC(T6�F4�?{��+�q���/ͳ��g��o��,���y��-�j���?�f5�+s�4{g��h��Ѡ�Vճ�reF��v�L���������8UQ��e�\���h�`)�r2e�^�y�Q�4}?������:��ô���ݼ #���JN\��+p�d)`jn�q��`��B��?��j7/�F���6�p��`���D8@:��n^��\ ��^�N^�_Ymco�σ�ռ�@�*�F�\7�TD��b�[����`�*ϫy�N�GqEu<��In��G�<���w�pӕ�p��W���4�L��ŖH���}W���Pŭ�z�W�LG��3���W��9Rs5RB�^�?2�SH�U�us5z��Iʐ߽{�˙.�Q|�usч��β�t��j��I��M�R���m�`���Cn���@K��xn�܎�i3�Y+�A�����pœ!���ȡYf�Z�/d�
��Ń���Oj"B�#����W~:D2j�r�򐟬�yi��X���&��*9�XV'n�}:���ʲ:q�^�َr�>�{ku���d��W�Ű�N�xUe���ٱ�N�x�fvX5M��N�x��S����č�2�����:1�t�����9�V)�Չo�t��-�A��N�x��k3\^��Z����)�Е6�XV'n�%��p�wrgu��[���_�eu��K�dU�����wV'� ��C�1����ĕ�KG�z�V�aY���HW�u<��čW���}`Y���mҬ�Ӟeu�����xI�Չ��BU�oU;�Չo�4�J9���9��g�^C��Ta�C_rG��x�%����O����*چh�d]?|�@��2�o=��r&�eN&QA�Է7`��4jLb�L��}f����o��X7�6��<������7�ߪoo��!B�`��<���Ѻ�Oo��Է7`_�ݞ�`�<�����Z0'�I�Ք0�|��w�K���\pc��x��1�+p-�W6[����%�;zM�^�����}�"W[�
%� t��.q�%`r��D��W[b����T%8����4]M������
�}w    ��\m�84��f���0�k�=OW[b��QО�L\m���G��X��jK\����2����DRZ�� �Zo�j�4Ik~q"K�S��mӆ�ȓ�sr-����5�f=��U�C8$��P���ޡRyK=}!��3�8��9��N{�x���Y?�G�_;�Z@�-�Wwj��<��ZWwj�d��0�cWwj�ND���%��S0�7�qn��՝�g�?�tS���S�ެ3�9���՝Z�����P���؅�x�܍��N-��a��lQ��S0rA<rez�\ݩ8љ?�Ih%��S0]��  ��Ֆ�&�f"�H܍�7����f��:[[b�c;�QW[�
\d��N��-� +�;�ߠ��jK,��	�g5B\m�ؖ��\�t\m�k~i�F�<m����p�Bu����0-��c^lC�pB�t�p㍶��J�J�p�cz�-q���w�y��Ʊ�'�/�k���޽�#��X��=�ʺ�d�u��Y.8�ɏF���A���	���c<L��۟���=��1������U{n����$d��-��A�'�I��H���A���$+f^�<�[ޞ��m��펐��j���<�D��٘�0�����)���^� ]��-��0���N�Oj»�v>�{_���߲=���g��ϼ�]���d�}0��(Y���;2-pM)'ݡ?g�_��/e9�����"���[_p�LĻld�^���٢
�ܶ׾�1\� ��c�I3GfW��2���~�c\���M�,J���PVs�<�ߐ����aH�/���W5�P���/���h�¬>��m6�!r=����#��>)
���~����5���Ͼ��k�֗Q����zN��@�5�|Ē��_�O�? '�L뮼�>�.�<�Kǳ�!��א�RV?j�������k@6dƵ��Y�}R'q���|m)���٢�oJ���P�L�����֎��ͳ�O\���*r��w�j�^[r�dJ�iJk��ֆ�Q��F�ɦ��˧ȥ�9'r߬F���3����~�_л�Qn����/)���=�������}���@���k�s�W|=�w�����~�����'Ϳ}��替��o��_߾��������߾�߾���75�G��|[���?��7�G�����?�����M�VN��Z��Z�*-�l��^����.�C�&Uq%4�KGu�M(&j�+/-�u]sF�	G��>)e1�7�p�=�Q$��·�D�>K�s�p/�骐~���t6d�$�k�AX�z�hi���#��3�KgCMHF)V���ِ#!aZ(��m^�#d���wB��O�+��ɯl���\��N~ך���6ii�kO�(�km4D*� �0?)��=��m �ԓ{�.�l:�O�d�,�LP���O>�Wd��
!��b{��9��%{Vp�ɿ"�B'(�~���mȵ	7M�����+21���^؞�Q]��n�9����:1�]�AO��Y&e�4LR�n��#$��B��mkM㕗��������Q0�;���$�{��'W=�2�d���I4��r�����i���^V;rfN�p����!�)���=̽�ՆL�Aͤ~�"��jCv�h�S�����ڐ}ͺ�s��e�!�������jC�t �����r��=bŘ?g2�M�q�4=1h���ݷ>����ӟ�����O��)l��Ow1�9�z����~�-ȬL����� ���<�_�mv���.=C�4֑��uq]*�ھ�z�I��X��@�5����$E�l:�oθ�g�3�&����N���ly Pdz����
;�eW�5!gG&�cnVg��7Zo�|}�mo£���)��ێ<:YAHgy�7Zo��C��3+��zۑ��v6�8hAp���#-B�^N�2��vd�[�33F<�ɹ���	y��1����f@�0�ҧ��$��fZ�u��{K|�V��,P���\�&�V���䢾�AN���M�'���'d1�x��^��3t��x�\��� ��c��jvd��������~��#�,
.�,�dj@��d�<����#cN�A(w��ԀڐQјg�O(\�B6Wd���D��|+u��ǜ�5���vdc���!�i@�����0�����9��E���l:K+��d�LRɒ�k(�w��Z�-������>AkP��̷Pٓ�-#���R)7WV�3��<&��Ăv�Uؙ��sE��Y��K�q�8ّ�âUiW���!g\1Xg+W+Ƈ�Tɨ�؁%����i�l�d�]M?�|��!�"&$[W+fC�M�	|��V̆<���ǜ��\����!4:?E}R���!k��eț5�mn�C���~O鑥��S�-DU��Ȟ"��?���4��J�5���9��R=2Z蓴�8�O�f�k�$J�y��>�VM���'7[ِ�p��f\;^���} �q\�9a�l�b�����H��cG��=�#�Ŋ�b+W�+hyE�U��6�W��׆\W��*r5�6d�g���������+�fŷ=��y��!#|���ѹ^+r��ї�^��6�!r���0�P���,��A4V�6�Gw4O�����\�3���rk�!����z:ljG.�n���V\�!�Ȟ[�kE��5��yQ��vr����\�l�^+r8A�Eg�3n5�l�"7%�<��Hl��
*�U�l����,��mekx-ȸ_-�Z��$[�kEV��gq���Z�u������Z�Mi���x�7^+2y�yҝ�s:�9~B�\���p�v8v,������y�u���B���ii�_b��Џ���>���ȿ��\�;--x�<CN�dl���mN�cg�q���\0�)���LǨ�HAj��5oWdS�L�������!�E癄dK�����jqv��l���޼���ɔ��[�ȱ��I�)�ּ]�ݯ�a�ؚ�+rQb �?�Rٚ�+r����erl����G�JR'~����ܛ0Y�V���l�m�3�Ff�r�5G?�l�Yζ 33��k�J&T�Z�<\���*����t�P_��&'�'��27@��f�|�,J���r;|�G���ϵ�wd�b
��ɵ�vG&s+��C�ئXn�(��ev�gpސ�y�VO�x�y�Ԇ���:ͥl-W�|C&��%\��d�ý�����W�)�M�ܐKz�b�*S�|C��ckRYW�|C��)�Ĉi$���ܻ��dz��y��(��!���E%g���L�L�L����j�o�=����1$�c�"��ͨ_��L���jًyc��Bb�lQ-����Im�����n����m$鮏`�Pd7�BFW�}G�"D4�;�uxSd�f�Hґk��7z� V��zr���<Yئ�\Z�9udA�yg�ߐ�ɡ�dV�mY��L��3�x�m�C�k����De���ؐGe�k�]+r$���Q�M5��ƥE�����9���oȦ<����ml�d�6��~k�z�w��!�����ؐC�%%�ג� {���9L7�rTY��̣�H����/�K�ݺ�J�%}�ȏ5p�1�x�Nv}�朗褾Yeٞ'���3d��A��<�~GN���!�}[V�Ei�)8K��=+2�L���b���{V�L'��Ѽ��=+rU"��]��F�#7.��a��|jzd2E�w�%[�gE&����k�~ς��H�H��&�~ϊ��c
�2l���4̵B��\��=+���cx�,�V�gE&C+;XK�~ϧ�r@Md�%Y[�gENZ��H��)�z��9�Ɉ������ 'I�A
x�PĲ�ٓw��2>��D�Ⱦ:����U�R:{]_�A|97�NvZ�tx�YX/c�Ov�����mt;����g�a�c	�?�U{��hו��0m}�9�)ӻ�����9���2�4!�r�B��#�1KW�r�"�)\�0��~�L��ΰC*L[� �_��=��9K�����#+EU��5�i�Ț�Ӈ�=3o�s�^ [%�ܓ�LKT^ ;G����,OW�2��������@&�Gc]镩D�pEF�8    ˢN�Qw�j/��-?�򊧫���ǝU�F|��|�\� GM�S�k/�����ш(Q:h�`9���l���قƪ>�&�LY5W�+�K��u�G>$�yg~��(�N����K���h�eu���!$F�d�rCnRh�Q���mِ;�I(�J]6���<�h���:�pGv��X�$7�z��NB��#��N�rC6](�4���ջܐ�yv��s�.7d�=��O�{�K��9��"W�rC�?�,�o�r�.7dBJ����(\�����'��^�wz�r�r��l��]nȽ��VV�Jp�.Wd�/��9�ޥM��L+��l3�W�rCִ�X�~��l9�������j�@��b��H�5��6��!V*f]�*��_�� /k`�z��H�G;��rfs��gs?�!vA-�P�ճT��gPduy�~v�o���s:�<�|[6d�I^r����L{Bl�W�xC�<�~M�l�ޝ��H	-S�t\b�96rcq�*�:�r��=������:�r�t*��8���jCy�-��C�!�!n��{��o�È�a+�6�:�+���^�0Em��!v�\��)x�Sl�N�l����o�]^fA؉�q�C�!���u�c�W�xC��E*'���Zr6;���9^�12��rn��W�O �^���}J~k�C�u�C�5\E��w�e��"����L/W���%WK�֖WF<�S�5 P�Y�c���bv�j�}s�c�^"ǧ��^�g(h��ˆ�F<v�,N�r�z�l�3�P����ؐk6́Qr�x��ȭ	W�L���F<6���m�cA&ދaf��6�|CVP����T�F<6dr]t�����@z�l-9�
��r�xl�.
5�e�=��l���E���O9��9���Y������2�1{��F<6d2�"FC�"׈ǆ\�\��WjlS 6�:��(I��q�xl����4Nz���ؐ���A(�L#�]�F�"2D�,]xG�Y���$�:Rd�]�0GW�W�;�E�L�6���ʃ�b�::ۤԯ;�t]��D���p�d��'�{V`�X��;D�<Cq p�N-�'�e���I��ÆLH�������l�9=�sp�m�aEFs�8����6�"� ����,�;�Ƚ
W�l�fvX��&�����m�!�+2YϣN�4h�a�Y#�q�16l��7dk�Գ�^Hl�+���s�l�+2�(N�'w�a���h%W�6�"��^G�3��ֵo�dc���x�a���ȥ	3�"۰Ê��ճH<�M�ؐ�vNWѳ;��#	gNS؆d-�P��8N���+��Ba
W�'�s|�cd�ᐠݏ�|}?sEdL+���%���0�Nxn����ރ�#��ƀ���#x�cGi˳�r�C���K0��(��ٮV�7H� ���="� ��\#���ܙ�	d�(BG���A�kxX����w�o���l�G�+qNtK|�2�
��şL6�;H� �=�P%�U|��t��Q��,Ȟ��B7��$pW����_�Y�{�2��2�L�o�`A&#�9&��A���<{��0�	�ꅝ�IQ�o�`AnY�Y8_�<�{�r����I�q����/j4.t�AEVN���4�A���1`�f#��]=F6��a/k� �������:{�ywO�N:.�IO,��S����������}��?�g��
u��?�Wv�?ÆL1�V��r�����)6!$��y�5��֋��.���g%�����*�W�֧3&�Iإ&m�������w����V
�ǿ���տ>� �O�� ������ٿG&�W�_��\�?�3{p�-�f�xp���2���2>�W��_z�������߿�����|Y(z�FO�;��밯��?�Df+b'���sy�����Rdl|Z-Gh�E4{Qi�v���zş.��'Ð��������.e��t�����EòEy��H�Km�cVq7��dL9K��Da�j��5��E_N�8?>�?;v�zs����jv�6i��g��`~lM=U|���@|���ԩڑ�Wn��9��Y_�=��!�vT�~��#�A'8�=�{����hJ��*�� w�D���\)���\�:u�}h����?02���
�Uܑ{�#=e�(L��<*Y1�-i0� 7d�����6���#kL7�~��ƸQܑM3c�́��#�!d��cb������
�1� wdrʢ�?'[���2���jO��[5��6��g���L5��X
RXc�L5��F���*g�Tܑ[n��惺��rW����8����T�ܐ��\خ;�����s�?�cx�Gc�ʸ.��c�#�����	�A���O���yv(fE.t��*��(rp��(%��7� ǌ�#����Y�ɝ�������Y��C��Y63��b��.pSQOe���Y�ifL�*t���,�C	3��N���\���B�� ����,Ȋ9L�*����Yӱ/�*R��Y�Q̏.���7sU��B�ybDơ��v�S@n'���,�H�G|C12̃�����7� �u�E�s(fA.E�Dk#�P̂L&g�Sr�|C1r��_"����b�y��Dh'�k���+2F���4��bd�D�����o8F�W�Tl�$.��Ru�j�e���w:�V�z�Z��@��+��(�ujc濹���'�/��/Yݜ���>Y�sJv�2>C��
�k<9��#G�	���u�<4!CiL�kG�Y�vP�����kmC�1��E"�kmC6�m3!���5��!�ȣI�kmCvMh��1b�B��\��B_I���봅9z!�#R�u��L�l�
���xomCΝ�w��U��m�d=;��b�\���-�
�'G=���6dؠk�T�Bې�Gl聒��\Ch�^���t����(�kmC�U���<����7��!?F� X�چ����=�qomC��!��t"��BېC���p6��!�9i�a/[�6�k��9{1fk��:ר߆L��mN
7\�~2�<2$g]�1��Vi��pss0���I���1ߛ3�?BN!Su8{�Ĩp����x�����M0��(�u-�� ߀��"��#��߀ׂL���V�.(��9D�=�T#W��9�����R���ES5�o�kA.Axfy���Z�kI+ېm�+\��#ͤ�q���ׂLwVB�<w����Ȏ��������Z���=�S��o�kA6Z��e#5߀ׂL;���V4߀ׂ�
�c���|^��G+R-��;��d����a���1�rO�|^2��ޠw�T�o�kA&�f�l�X���F���4���Z�{�sj�ɑo�kA��'PBk|^���y3D��^��#
s�Oj��������̦�=U��y��TȘ�!ud�I�zteC>I|mfާ^kX���:B�t0���I�J4���3�g�d��9��>:�"�K���@�LG��U���\�{U���W�6P� 7�vb��O����\�U��Wf�6P�"�J�>�I)�73��+�Ub�9`�y�����e5� �'��@���#��In�́����&Ahl�+rr��y�HP��\�s�����m�����lYy����\�iE��Ɍtl��j����e`d`�\�ɻ������T.�X��gj��l�+��(�Elu(���m�`�~25��@�l�0b�Q�m�rE�F�0_˶�5:yEQ8�������9V����]Ce�\�3��l�����iߥ�/���[]�k�+p���6��"��G� . W��VW�AN&����`-Z��Qt�bmt9{���� ��7�̋N-���h8]�Q��PEŨ�"�rXqC.B�<>��n��@%��T-����7r�$�mϼ9j��D�fV\���xLQ']�o+:}E�M(J�E�a��j�g7d���W�DH	�{'1��Ê+r�"�L$������L�X	Wf����wEV^($`%�۰⊬3!!c���6����r��N*F�a����5Ê'    ô�+��>
=R6�+�ȡ�f�E=��\�y)�d)����Lk�ڜ��$۰�\��:��mX��+r�� z�kI|Êr���yL(�=�xE��v �s{p��V\���x�(��Nfw�d�1�l*�"��)�� ���`�%e߰��0�E��7���d2�+����:F�IX�����7�uA��fQ�9P���L�OZێ��=��c�N):�hO���,�tME�)�NC1]����4�$��s�I�9�4]�F�f��!˴$8�O
C�<�?˓���ȝC�幾-2��}|�ސ���$"��"�{��r���ȵf[�!�]g�4��L��+r��6F�!��5������v;T�g;4�p��l��0oe\�����ҠV��5�!�,�+�NĽ���w�f-�[��ܐ�y��ed�5�!C��( R�m88]�EK���M��@ؿ9�!H�S�\��r�"<՜�ž7�!�(����N�.�ސGf���'=?��ȅ^���q����7d���
��؆�7d�*$�,�pp�����F<��Ķ���0�LG*qoȁ�]�^I-o�8F��<j7m��5��!'�\5.���{#�r��
��D���F:��?�F��U��х=]�fۘ܂\���LR�=�U�0�'+�����Ak�"5�i���h��E�G�o7�@^G�8x�"ۙ�K�1����9��q#+����6�i!��^�Q[�RpӮ)���9Y��܁���.��G�ąN����.ȥ��hDn���.ȴ�g���[��]��%4ٍ�7x� �0�%��o�B�tȕ$�o�vA�F���g�W��.���8�ch|����4[����o�vAv��}���o�vAN�G��od��M�'F,|�����-] ����]�K|ĉ�Y����V��|Φ4���ܕpu^ض��.�É�Y��$�7x{E�d�6�$���킬��3zd]��]���)%�y���pE�)%p���|��2m��	��o�vA&�k̚d#�ۄ��#�EK%*�0��`�I��(���?�Ǐ������P�wr�j���+���~����s����C������?��O_��_��_��O������}������7� ,�o�����o���C�׷�����������������?|�M��Q���������G�����?�����M�VN~\-�>��L"�^��q*{�ݓ��H�Aߛ[�m��g�h����=����|nx��'���̑�{�"G�<5�sQ�5j�1<�#k/F���Ϧ���ߑ]F��o�ix~GvZ��jG�������	���ix~G]48	1���#�_$�Gu2���<!�+r�u��L��4<�#���f$�����ܢPx_�S\s�wd��H3�%0�o�JzXD؁�0��Ȫ��fL���yB�WdZ��U����ll�)5q���^!2�P����wd����fs�4�����L�AC�PR�3��ȹ�1�������wd��
Du����'dsEnI�Y�]Jf�ߑ� #l���ix~C�ӔPrV�g�ߑ��n"�`}f���N���a�(��t� ���M��QQؑ�~�vj��k:8!�+rp�g�@yr�ݪ(��t����v��OQؑ�@Je��o��\ ��>9��p�n��HW�_#o�}����S�\�5BN����WXI�#�|�*T1Sr���z��	�\�4m$��X�G��̅;��et'Ҍ���onu6�B�����
�'a�ͬ������Ş��^�n3�ڨ�P�K������;p��OΆY��ހ�ܫH�M� Y�V���8��}�D��^�3]�=��C���V�B��VMh2��4�O�'�'e!=�a9n������V���ɕ�'d_��.=��z�*F��;Ϭ�,��� )����|�eS��Ngl`y����lI�I����Cvv��g$Ȅ�c�>�	�f�td���k��SC����C��œ��;���1ĳ끊z멱�.ژ3��yj�O}� <�3著H�uK,�Ӎä����"�U��k��<���ّ����A���'E:j���?>��/XG�w~/Գn�h�N4H,y�r&��ZG+�#���3d���X�5
:w���Ƞ_�*3;�>s���"1.�D�H��la��+��"f�:�/�ֵ"93�_���ǜAuv��'Y�OqP瑟��_{N���(8���������=��r�7઄��(Ӎ�ـ[V�����EF��O������:2���.�b�g��q +<1��O��k�Ko������v|��(V���R鍰��4巘ߋ�J�b~Mx��B�Y�Q��];�t��T޽{g�66�N�Q3�u��2�gY:�ȁ8I��O���_�Ah{��F'*��gpB�Y9��3䇇]�5O��y���E��L�S�zG֖V_D��i�!�+�%���b�i�Ύ�1�Ȝ�0�X��#%B�v��Z��#G��ff`�1��ّ�x��i1�3��ّa�:my�-��^�]F�zL�1��ّ�hj%r�F�5:;�Pd&�����FgC�t��2����[��#�*��"�bZ��#%l*�ܳ3��ّ�ƠE�!�����Ȯ�4���Lkt�]�q$c�Z��2��ّ�Vn�k������`����*.�d�'�[��#W+l'ŴFgGnI���P
����d;�;�X�5:��/�Aj���ؓ���5:;���0�]NLktvdr-L��x�h�12}|MEr�Lˊvdц���vd?�Q՗Ӳ�3ga|ƒ#Ӳ����{ >i�~�`Z�eE;r���꩞����"GrRK�ij[::�"�ֆ�"'}�`���`ms"�>{I�@�f��ώ���a[Bm���FY���(���ll��Q��.�� A�%��/�>3w���oTA&r�&�6�Q�99�r��	윢�r�<f�ܓ�����L 
�G�YNQ�tEn�!DĔ#ߨ��ܳHӲ�lc�ȃ�
~Nr.�F���Ie�4����F�dr�4sHb��_��Cp�-I���Jx2:@#献��6��"�	��(u�����#�(>�lc�ȩ	�g��vl��+rј��ۯ:�Q���>oۨ��L�DGJI'Ih7G�Wd��F�Q�O��	9�91f�_��mTEV�1V��8RwG�Wd�q�x�Ѱ��ȶ�6;�7G�WdZ�6Êx�F�W�Y([f9�e�w״�Lw�|�����_���_�ۨ��L�k5��1���ȵ��wɞ�9N|���/�s�m|������9��f�5���e������;���&۔"�������d�nFl�գ��d��r��T7�Xh�gp� V}���P���6?W�ّ�Ph`Xd	\ߖ�4�<����Xh��M�Zg�i�\՘�'a`�gW5fC�^S�55��1+�R���ȓ����1�N����)�j̆lhcH�j8W��1Z�+2�.� �>��U�ِ=14M�`�N5fCC���v�j̆��1��ձ��ؐ�5h����m�ņ<[���9���Uc6�f��o��\����l�:���V�Y�5�@5+Y�\՘Y9:Mt��rUc6d�����Ao�՘6n�\;�9(;2�4�4�U�ِ��0�b�N��ݬ�h���dch��L��+�Y�ِac<���U�ِ3�h�V0ą��!��Q���d���!7����:���9�c�^ȇ�4�s�VdX�#�2h'������WdEC�=�W2�6d��-SC9I��W@ڐ��(��r�6�#;G���p����!c��K�g_���(yx{T��SUT7�����,Z���MBǽ��:{:�-���Sx�v�!7�,��n��E���ʶ�eCF+�V�k�V;Y��گ"��Sl��Y������ζ?ՆLv�F.o��m%����l��a�c��v�"ӵ���ƃd»��yv��c�+��Trt3�Bg[ɲ!c�a�C1�:'ݪ����K*;������NV�ꄛ��l���e�ц(���?����#K״��N��l���"���pR�p�v�"+    :Rg4";���6dM�'^�bO���������F7k'+�KB)Mm��ɊL�ň��bc��h{E��1�����j'+2��i^�UV��Ɋ�?^�t2N�f�dE��h�x���j'+r�BWx%���O�!w���`��V;Y��!��)�T�ډ�&{E�!����W;Y�5m��Ԟu�W;Y����hz�ɭ૝,Ȏ�\Xr���W;Y�	�btm�W;Y����%�:����Q�cd��*�<��(�O�̝N%X(�,��{&ؤ�	6�l�Կ��Ç����s_��������ğh?M��B��.lA���� ʭ�U���B��n&��ݻ@�(�D��v�_Y_e?��5��ODr�C�k�4������7�WYg�g �ÅYخϞ�A.2O�x�F�#w��:.�ĶqE�Vȥh�U#ܐ�y�;���F�!'�w1t�U#ܐ1���㐍�F�!{%\@#�t�^ݫn�>4Za�̶�݆��񞳭���^�3m�1c�p�7���(p��g;�fC��+̡?��p�F�!�il�ɘze�n�#w ��j�+2�	?��x�j�2���;�*r\5B���~����.�7k�2�	�1���F�!�-2ʴ���n���n��v�ې�
�*�W�pC���YD�\�Z������~��ެn�-�ؕ!p�7�N{Y�u�q�d-�jv�a;�fCVYH�q��p�W#ܐ���0��F�![���A��g��^���HiU3��WYsC��V᱅��ʚrttȕi)��憌�~?gq����!�{��F]WYsCn8�`���ʚ2�Ysa�'�^�5��dE/�.3�$V��Â��#� ٓ܍�I��&�=gm�b�!���t1���ݔ����
Պ�D5(�(^!-���P��B��ȩ�+?���W�Z��%;��뙯B� W2��$wRFs�B� �՛@�����
Ղ<��#+7�U���Zf��n_�jA&)��T����U���M��x؛�V�jE&�8�X�o��B�"�e��l"��r�$�|�C�U�Vd��gJg��nU�V�\Ƀ{	"[�ʫ+r%C݁�6�Ulr�b��ϙ�*T+r'��rp��B� �"3�h�Yۦ[�Yy����tX-q�B�"�"l�!7tb�P���{�MZ�� h��";h'8M%��2Y��i2�
Պɢ��9���V�Z�S�N��L�U�Z��O#�&~�P��u�g΃������9�[�ʛ+�H�=Nɶ�nE��7k���l�Yg˱[�jE6��t���n�jEv���j>��S�Z�}
�l�R�U�V���ğY0'3?G+y��"'#�\��2[��l�R@
]r�}����xe���ݻw��jCVC���+kߜ��E�&/B�f����Id\ݷ�kߜQ�3�	����A?R�
*ϟ�,n�yG�b�HuC&�N�G�UYܐ�͘�U��,n�t�Lv-v��-�!��q/k˶?�3'�6�ĩ��L\��Yg:��6����lhc`�M�!qU7dG?����-qU7dOޥi���,nȡ3'Wǚ�*�2Y���We�sE&�;5M;��or�"���)��-�!7%���T�,n�ݓE�:��b�("7�?Ɠ�{����B�q�'���*��v���Qě���$142�e[���5�б���r �߬,n�ވ������nV7���$�ڷ9��E.�:h"r���!gM�.B��l��~���8<WeqC���R�rU�qW��9��$]�*��@�ُ�D@��0�)�@���*�\��Y+r2�������� �LF�Uݐ��nm��3\��-&���؊���+2����ʦrC7�H�2�C�~R�y��!Cԙ��/�+�n�Q�Y8&3_ygAN�����5��O2t�M���\a�LX!��稒p�d�OS`��l����6@�ɪ9�eAV��`B&�W\��#��ş�� [ܽ~ƛ_pAvtĦY�3_pA�\͜�Q:_pA���2�i������ء���b>��S'm;��dD֐J�b�.���뀵���d�f4R1��Ȋ^3��f��2m�Z��������"#D�O䞻u�tE����3t�.���)Wf�\�.�������4_pA&��؃�.�d�?�[�b��r�t$�6Du���rͨ?E��IT�f��+2�
-h�����"��af�-B\u�Y��j3y�0ܐ�s�7���"���p.m[pE&Ќ�kg��Ȯ�1�/�'���:�UWd�1����+2��d�L9�:��L6�281��lu��l��`m<�`w��"��#X+�a���t4Y��޳�F�!�ƨ�!N�lu@{I�v�~��r�lu��L/���7R���ف��I�fEꊜ�UN͍������������;ݥ�c9Bȯ����~��dmΉ��Alv���f��l���u�t�-���j�VL*��P��]��*��ow�"B�ki��rª1G��룺"7Z��W�vC�1�&ie��+��׽M�[k�b7d��j߲~�!�~�]P�b�!vC��L'� u�~�!{#��ij����x�b|��m��d����L/{��@����ܐɨu3��[�vC.]ĝ����~�!7��-��}��nȽ<�;���U�]�����,��$����抬�G����U�ݐ5m�����*W�vC������U�ݐ�'� ��,W�vC�k֠�f��s�o7d��欬��v�ݐ�n��ؒ.l;��h�ȹ	��VW��rՈ��mlgn�-<��OZ߫�nȽ��79��+r�Z�)mؔ��2m!��3��~�!�.�lo�T���k���^�1Uדq^7K��Ý5#/���!�ĨW�yC�Q4(�	��L%�9��M�f�����2�rЏ�f�yC&[�q��}�W���sPk�*9o��~p��Vr^�b�Y��$��nmA�s�1̲�����II�9��yo�����̧;���#xQe�S³������6c�n���v�C/y����2��m�l6+���2��gG;7_�uA�V�h�$���r�Ban�<�ت����-Q��Wm�f�d�^k��=� }�ں �$|E���ں �!,�/d"_�uAv�6��b̆�ں �,�#�|&�߫�.�Q�15�&%_�uAN�,��ԕ�ښ����c�a͑�ں W#�4��ɀ�����%�b�~�嫶.�}=������W�"ɒ˸��Y�{��Yё�&|�$��ں �mk���5[�5]3m���ΑEg�j��0��O�/�U[W� �3x�-[�uE�NTd�z�u�ں"ӑ�����v�ݐ��F���j�\����+���ښ������Reg����8,*��g3�nU[�*т�Aꅭں"�A��J��*߬���&қ��e�Vm]�imSO}d[�!��Vqb�l
[�5]3mk����Q�j���0�$���ޭ�����戳�٪�+r)�_��βU[W䦅��ս�o��#wz��кlu�+rI�m����QxΖM=uM/H��ݻwEZ�C�͇��+k���d��1`^�]�4�$#�����#�5�A��j���:w�Hʟ#_�}�J�#�<Ʒe��eWdģ:��ҋ���J�!�AK�p�:�U%ߐ��͇N��v�*yP��
� 7�U%ߐ�F9D�Z䪒o�1@��W�|CNd�B�#�mO��a

ɼa[��!�(b�bhd[��!ϔMX�Fj�*yP�^L��{8�{�J�"WzU�C\˚�J�!�!4��Y3W�|C6V�ٽ�Q�*��l9�xijp\U��Q-��A.��*��>v�-)��)T�"G����'	W���r�d��45�pU�7d�12��$=2W�|C&c�8�Q��J�!��Ἑeԕ�J�!ӊd��E��U%_���Aʕ�lY:5��j�w��\+W�|C6F��1�h^���2������W�|C&�L��Q߫�o���y ��v�U%ߐc&G
#D}�o�=FNh,���U�Z]�y%;0;���7dbH8䊊����!���thc�(�o�#	��/a�,SaE�    e n�;������hq�%�U�ߐMF�r�oM\�����m�=�g�z:�|���!{'<N��O���+�oȡW>5Ŷ�{C����� �k���[���>B3�X�m�!=N|oݓ5���8,xq&��eA����5���� 兔8A��l5�YÄ��ull5��z�ܫb�e�i��>	Q�eBf�i�k��C��NYtg�[�^����l(9,_M{E�YhdFE{V�|���"�ĝ�Kd;'yCn�<8�5�wl5��� �a��5�+r��z�Y�[M[�+2]�	͞������"�"Z���lc�i��V	9ӏ��x��5��<8�O3�oִWd:M�4�/l5��.��(q,}�մWd2���iϊ�oմW�\�a��$[M[�+2�4M���"�j�+r��y�E�V�^�{dy!s�������F�i�������nDyl�5��2* J>Iv�[�Wd:������
û5��hr�ىga�{5�9h��Ш�w�W�^�c~v�s��մd2�3�g��i/�E�wL�� (p��� � ´1����5���j9;%5Κv�"-�c���j�Wd-��@�6�d�j�2m��yaI�m�!�����X_M{A&à�h�U�մd��WD3���� #$�s=Kv����k��9&BF���,_u�'�!d�qi���#?�#~���ݏ���y!�;]*�������������?���?>|���_����W�����W�����.�o_��?|��7P������7���/��������C���>п}���]����o���?����������������~�՟��|�������W+��i�R��ܷ8�>��LC��� Kr^��ګ�%om����%pJ;�ӻwﺲd\�D��+��'�et���Tr�w���*�H��qoz�x}4o�52�!��f����d�ȑh�ѹ�ّQ������4�dG��̀���&��ȴ,���'5l�&��ȃ|�`fE�b�l�!rG�z:Kvy&�r�"kt�AJO\����&�] �%���ޚl�#[r=�	y���"{+<6_��0M6ّ] 	=He�L�Mvd��ew���4�dGF�A��f�:f�,ryE.E�?�3M6ّ!����3M6ّ�'�q��3M6ّG�L�]d�l�![ځmS�0�i�ɎLN����{�MvdC^�D\)�4ل���i!ۜ�&���>���+��&;r�"hW�q�#'Mo,}0���d��~ӆ�G���&;2�oQ�tg�l�#7-���Z:�d�h}E��6�6��&;�hB#"����7&�l�N���4�&���tg����V�&���d��>SzT���12�D5;�4?fG��e�E�p��@�����փڈ{�cvd�M�,���2͏ّm�y���4?fG�Q�����y���ȴ"�gR�k~̎<�0�3I)t��1���ܔYKl5��B�Wd���|�b��#�������L�cvd��j��ce+��Yӝ�x����,B����𷶩�Gp�#�E6�˥Ng���p3����v�́��X�LYi�eA&g�R�9�"C���K�Iϴ�3Vd�:��赲�X�݆.�Po�o������}�j���X�Mcv�r���X2��ϊ�1�f�ȡ�0�(X�V�_����iV���"����>(5o���+2�x���E��� 7�|�H��+�/�ǝ^���Sy6�^��%*��x$_~A�s�����d���2���0���O��e���T��|e��E2f@9r_��d߅B�R�5��i�1ҝ���%��W�_���*��J��W�_��I��0�Y���r�"M_����2��ܲp1�;���-�/�C
9�`|w|e�+r����1��*_�����{�ĉ��2��l
��q>��d7��)�0��d�r=b<%�(Tw��r ���2(6��d$�E��β���54�]�b��u�2��\^b/7�V�_���{j�ư��W䞄��A���2��<�81�d,�/�Y9*|	�[~E�t�>ơZ�V�O�P�g[7�U���+2}ј�޻�+ïȾQe9J}A�9Za��d<[A�'d2�L$+Y�n,�`��㓢0
���/e��}���k�@�1o |-ݚ7`�_��|�N�ދ��#��������@-��esr��p�!�)��}����\pu;��5�D�ݺ/bK��1.���O�	��ƻ�ҫ�ڮ�vӴ-����w��+�^�Z�)>��]����V�i �����I���9�%ś۵8�����0hUzr�ϐ�*�sG��&]��Q�WV7�ݫv�h��4^�פ�9����ӄ��4�jC.��I�rM�ڐ��R��k�Ն��
G$)砸&]�K}EF�zCh}���ޤ����{Y�&]m�t��4�����]ˆl�p�;��}s�؆��~��\��6dLKP^��\��6���HTi�s�sJ]��|*�L��k�؆�3J, ��5OlC&�K.���m�͋:_?_ٶkِ;�y��DRs�[��ԸE�WR��m�*
�;EJ�ybN�+��B��O�2s�ې�&ϱ�'Q��ې�x�{9ݹ�m�t�2��l�'�!GHu��0��i�؆LG����L\��6d��l�ˍm��S�\�|�0fJ)\��6���ͩS�`ۮeC�3Ԗ1��yb+��Q4�,� ���<�Yur�� �<��x:�����ۄď�m!�oVȞ��Mms�^��I5�π���ڶ!���xe)MqMmې��
3Wt�:�iG�Z��g�!�5�mC.�m�<��ڶ!��vZr'}/�Mmې{u&����ÌS�<YDe��v�Y��2�a�0��mjۆ�#3�|b<�Զ�~Ġ`|�6�mCv�p�~-���W�ŀ�_Nbr�O��^0���{��8u�1	�t�%: �x'\B�������C3��H�o~ƊL��O�7=��g��=>,�,O�֛�3Vd��+��b��� G����$�d�����y��дc�o~Ƃl�,��Ő��g,�>ћf���7?cA(i�^J�|�3��鐃�������H��囟���a.d�<��g,ȭ��ѤP��7?cA&�"m5����g\��ڭ�L�4�o~ƂL�b�-}|�3dc�G�J�'�����X�m��1����7?㚶�\T-�"������1%5���9����Zᛟ� �!
R�)�o~ƂLv��kI|�3�Z��X�t��u{~Ƃ�13���m��i�i$�L��0�m~Ƃ�e-*�)��+��b��ќ�8�Mq�*�ʶ�φ��^�p�m�l�3Vd������g�ȡ	�hVf؎�q����i���Ɍݻ�3Vd���4f�2l�3V�҅����l�3Vd�I�������'z������X��r��Fl�3d2�	�\��m~�������BT�G��+�E#=ӣ$����y��}/6���g�ȞNS�A�nX��+r4t4��=���X�S� Fjl�3Vd��Mݯ��6��A����愆�_�A���3>!+�$��8���1��Z����"����nI�&YJ§� [a�Mrs�g��8����1�nm>�W��!tR��"�[A�TM�����F�D����p���������{	��:���>�g�'Y� {슰s���ܢ���পv0���M���G�='-�D+��Y�&<���mjg�' t�'�	��Y������� &{��d��$X����	��r%����-������8z=y��
��[|�[_��A-@.-Z����d�,6[���	�?��A/��vB`^�{z�CU�cN�{K`�a␝�L_��ܜ�v���Y{��{�ThKQƁA������iy-�����vL7�h� �K�"�m ������[�� ����AQ�o�
L�kLS4�gn��^�Goy�[����>	�=]\z#'��8R.���2��=�c&(W�E��H�����#�����)��_>@�ό��F���&o�k�PY鿈-��PH.ȩ�처g�,�,`��ܮռ͊�� ǂ�FP�K9�||R��f�Q��t��s�/�{ƹ�t+�    D��P��	�p�g���w�(J���Κe�AI��!����V��� �b#?8�� G`�b��ҍ���� ����6[�}zܬ)9I�I�o!;r��'���䇇CǑ�% ;:�f�@�G��et�d'�Y�L�����T3tw�:��H�g�_y0���r���G�hL8{ cEDrUv�?�\^��A��`���+p 3x�����\^�c��p�u֍鹼�S
.y�9z�1����i�g}������}��j_�
w�c��%�I�d5f�,�n��Z.I��T�d�[�>A#�b7�m��u�V`-��N����k�����2�<�7`���>k��cc&�y�.��σy��=湇O2�n]�O�? �
�g���y0o�}<f�hO�,���������Ph��Ƿ9��ْ'-<�D�q�G�=�V�셓��R�"�s��0=�V����*c����V�9g�����SW`2@��z��b~�9�>!a�R�μͱa��z���cp��W`CG�@�Uv��y�k����+l��{�_±a��sR��X�&b�y�Z?���_NC?g�$i��E����Xj�_�K����^��X��D�sQj\_B}N���ZJ=J�q�4a%�z�K�2gc�(��&���ls����:���%\�s#�M�nd��ӥ��1�-C�WY3ORֶ�3�		������=]�h�{H_�!ߵ*,���8
���Tx�c�}l�V�|���h���#q*��T�S���@)?���yyHN��	:��8V�ևO`E����z��&��%�o�_l�Dń�}��z|�~��r�ݙ�\X���%J�@�����~�Y��"�mv�͒�Y�m����¼�
+�
�峃�1��{O���O@���ȴ�����ܫf6�������8�g��8��չ�,�u�F?�>���Y+~�EzB��BM��>��^���[�i�T��Vxd $�����^����̛f�"u�4�ķ֟�?�@�^H32rr5⓺��JVO4X��-�.7�F�vUg~f�����C˔j~�L��fZ�c�EV`:@�F�r}����V��/��݋6;(ut3�'Y��,�q��N��=��� ET��/GV��"+�v6��Z~	��n1���7����\�M����"ӗp&��1+/k[�}	��{%��\,��ϝ[d&�ѣuy�N}�A���^����/q`2!��#{�>�\	�����.�rO����/����{W|F#et+ҁ�M�EV0J��s\WX]��eng>��ܬP�S�̽/�y�K��> �SE�fj��K�gz�iO���%\�Q9�S���
�O����p�R��
�'��f��b!Ky�.�L��^��B���޻,�u#��c�Cs0p�h�Q]��I��2�W[m��PQm����ܔ����%�`�"��?X�_{{����e&��%��ށ�!����U�Wx�W��R���z)Cݥ�
w��4���R"~ �U(��f��� �JW�e��m��.n̠�%�
�O�ޖ�ݚpw�,b��N,}�����{����^U�W<d��>@S�2����ۻ� .ʡ�T�XB�����'�«zO���'b�R��%��<6�ⴁ����ԯ����W?��ĩRII-�%>���_����� ��ןf��÷����_�������7o~�+�g���~|���|��>������ݻ���{������o�O�k��o�o��o�x�����������S����o���^��7�4?���{x��M�|��{���.4��;;���-?�1�11m V�1R��/4���c�_ W��k,�$�# ��c<���$�# ^V�I����=eu��� �LYk����+}<n��	n��q��ƣEϻ���L�� ���.��ѿ��"�xL���^;)�C�����Ć��=;Ƙ���}U"-��3q�ӎ��!(�����e��	p�k.�"~r�C�d���:��v�1%m�(=u �g ~3��|�[���)�G���<�g�:#�/s���K��nՆ~�|�W�
Q�^S.�1�:�� �a�B�E�8� Ui��&3~�{����jL�e��p4V��FBBl#����̇p��f0F�5�}��z������6���e����q`,�����A�=�{�E��]us
��������1��&s�4Tԯ�ͫKH��Ƿ�%~��,�;���������_؞g�Í���������^^=[#^|����S6d��ݤ�����d�y���>@P	��6z=� �K�{��9��!��E�H���2઱�����F�μ�V�!�pqp���������N%r5��wG�ϵ��l�>@R����Ai��u�o8ʁ��
o�e��Qc�(kct��Qc���V(:5���A��� �vtL��J"Dsu��y� UQg��kz��T:R���>�;pL< ϣ�@g�=�G�l��)n��aH�n��U�TmTq���[�������?|�+�0|������C�������7ߘ7��?���>�������k��������wnVx��mx����0���Ic�7�G�f�����p_� ����<Z<Y��+٩F�\ס��	W�7���?|���������>��g���ilE!?�=��g������'�9jF���jQG���V�o|V~r������ ����h��2G�3#g����e����	�6���J�*r)�R�?s�uYФF��������H�Pj��'ȳ�O
�ޮ��=�DM��A0P<���x�J�+���T�ɪ��N�C��"F�G�W��Q�5ڃ�KI�`��.7�������Fr��CXlF�s]�1�.�/5��	r��GMc��c84���]�ap��+W��샜}"��V��WO�GN��ڼ�U�0`��a�6G7�Į5	+�f�n"'����h W��1�b���O
s��!�xuk'���2�R�����vwT���r�\t������Ud<�uX�>�Bߍ�|�WL����kA{mpc����S�{"OX|{���A�K����p��,V����gF��īG@����#VB.�ś��?>xKG$��aR¸3�a�"�B}� f<A^��1��/wncKs�QC�t�#b��f��{y� �)�{��KZjavh��6�M�u�%�U�hdo?7�"�sN��~�a�{�L�0��^izw{0P��z�:���]��Ul��W�kWsUJ8�-X�2c,(�#�u�����2���ba�aQ��*�H��4��r��"��9u�vy��C���> ��(��'yi�򤭗�.��bQx1�J��Gr�l�18m#�z��ԡ�|�+��UdXZF��Q��B���Ⱦ�`�&X�G�'�.͑$߮"G�ri�
�,���-鉦6�����r7�}<>�jaz_�_E�pm�"z+G��^p/Sj`�=^E�N1J	G�'�R��jy~�H�yv�Z� ��B�G�\�0kZH�x��\���|��H�a��sy�tyeq�����q@/�`�^)��\E^MY*��]:��|Ks��r�"�G�`�E�9Er%D�5N����j��6]9���{�&#%�p�������7Fr�LК��󟕤'r0�`�S�'���pC2[ۮ"Ǥz%}0�rÆKˆ5�k��$����p�B[��j0��-��#t�"���A���J?��>��7�����wʽQ6��a���Ӫ]��!��@]��k�<�q����ZT��̆��� ]�x�̆�a���&�̆�2�ڒ�k�l�0Ɔ�fy�Ly"'X�Zld�c�k�lȰ���UEwɵ`6dܒ����,+ׂِ!�I?羜\fCpmq�ݰ�XfC�Ye<p,>Y�̆���)Fr���}���B<��ڔvp@|ۂّm��âr�E~ۂّ��=���\�XfGpc�s���B��#���o�wk����D2mshb-���hhb-k�ȵ�X&��{�̎    �o��A��̎<�ZGӮ�XfG�Cyt��XI��!;�����X�I��#�=����2V��#cl���=�	ۂ�������L�XfG����e'ւّq;���M�̎�&�µ9�z�m�����c�$ւّ�G�z�5� ւّ�>ҜT�#��`�{"mO�}��`v�U��V�`���!{�0](�}6�̎l�`M*k�Z0;2���=�����̎�1��b	yY�̎=\�J��X��'r��&D�C��#����^����mfG�A-�v?�}yۂّ[SU�b�o[0;�J\aO����q�<�2�����_�1���? ~�Jk���A�/D�p�f�0��D���X�(EM�L3�d޾}k�O˯l��V<J�=�A0������'��R�b�\�(�}��,���?D֕��3W<���b���J[2,Gc�t�-��bȹ�E훇[�!W�¢f�>Ku�r+��i��R]/�ܗ�����z1�w0nҤ���^��'�j�7�&�A��#Gc ��;�%��b�0SG�m���z1d��@׫y���^kPcź^9揇d'{��]/��&�&�Y��J|"�ĕ��T-U��Ő�S���'� �^�M��9��|�M׋!����T׋!ð��9�.M��׎��2v���)��b�&�^
�pR]�T�;%�↣'�|Ju��7*P1�X�T׋!cesr!�AU�ˮCNF��n��U�e׋!���]��I]���C��)�J�*Q��Ő�}u3->��W*����J��vM��CC�LU�؊G��W��P�T�kGκ�\M�m�Ju����i�oF��Ő�WcR;a梁^ٷ׍q����ry"G��Bm8e#UOc�))�h)���i���_y>V��Ɛ��}�'%
��i�ee��BoY��Ɛ�P�\/�T=�!O�z{���T=F�'�*밆���]=mG.�����M��ƐmP�6�MhR�4��<~t�.WOc�����E�`E!UOcȸ+l��E��Ɛ����k���em�ȸȄ���U�*$y����F8�+����i��n])�`-�qt5��#h�i6�1^׈#/�#Urv��q�T<姊G���Q����� �+nc-��CvIi�mVR]#�+8?3�$��C�p�^U��C#�5bȩ�d"�QZ�kĐaU�55�b]#�\�kW�Y-���Q�O[����<أ��1�a�Ň�U/��C��]�����C^���x?��.�F;rÊG�uh��F��4��U'��Cv"ZX�$�5��i�6\gS`n�F9�׉�x;J:��1d�������B�w]#�\�JT>(�k\v�r�X��=��F�;�0Q��b��Fy@ntHӥ�FY?M[���s�6g����]�׹R1'z�]׈!�����ӳT׈!;�t�����w]#��3L O�ʐ�1�0�^�[���C��(�6zv��Q�O�y<��S��+Ő˂�ϴ��U��1d��4%��u�ro(�`��vWc�#�6�i��C^I9zhZ[
kG%Z�����e�(�i;��H밎��ˮCv�a҆[R]#��L�x\`�F9�u�i�Ku�r�p�*7O��ц��*n
Ԩ�Fr��0k�FO�v��*֏m6��ц�tT��`�hCƃ���/��ц������5���y�h����{��цWDӆI��X/��ި�y�m+�z�O�6|�p����[�]�G��BZ(1�޾}�`��CܖKp�֣*����5Xx�@a�A@�4��N媿\����F�u�}�Q�T�?�#Ƒ��H��.�ۑ����Q	ࢥ:b��겒�y`L_v�ʧ~m�+����'uO�:b����F�!�c�ɨ����I�#Ɛtxj�e�֣b�p;t�aA�:b�9�4��r�Q1d`�Zf�!�+�x�1?�0&5��C�m��0�B�#�!C�_�ԔR��C���t��1d�_�xk5Hu����7���¢��C�U'��b�:b�S�6D��<a�\M�1�\T��Ң��1䲔�wD���1��T��t��1�^U�qcM��1d��-�]�d�\v��J�h�m�ꈕO�� ��	<	
�1�la��aN�eG�!;|�QR��/;b���&���R1���[��+���:bf�9c���C�����wU=�:b�S�6D$�_fא�1�N��p���eG�!�q�m��:byA�H���Lk������_���˜�#��R�T�'J�����c�[ҴR���_"{��,>~G-��jm9̏��=��zSkc�0S�Q��R�6�sV�JI�4�ZC.KEJ��J��2N\CF��T��!õ����I��V>�kCd\��W�i���1�sEb����������P��� Ukc��*�qW��J.km��,����+Ukc�~�U��U]�jm9e#��ClS�b��Up�7����JY5��#ƻU��GX*����[�^)���FY�3];r��EL���r��I��z���Őamb��*I��e��C��N�-b����Z�J	E�ѵ#��!ڋ�r��fÞ�$��5�vd��k��O�F׎����X+��ڑ�Q�P��)���\��/l���Ő[W7Aˊ]�ѵ#�
.:s�]�ѵ#ό(���&��ڑ!J�������F׆ 0�K\b7b���f�{���Q�ѕ��n�K��LHr���>�CS��r��9Up/>��q��ѵ!��jůދ5�6��[ME�ѵ!צ>/��d��6�6�N��cI7�F�Ӵ#������ktm�u9<TkqE�F�9B��X�F׆lj]x� ��ڐ�Qn�;�\�kCV%�6�X��=���t{�4�F׎�-\l=��kt��%����j<H@�mt��0>�E�Jm�n];rwpm��D�a�!�����U�ѵ#������b�.��V���|�pcN�ѵ#���ã�(��ڑ�R=Q����];��t*�zV[��ѵ#c�~���9�5�vd��R@�$�$��ڑsP�aD�Wkt����0d��b�1dX��JIiS�ѵ#��l'��v�F׎<`4�.l���6�v�e�h�M[�lG�:���RF
Q�ѵ#��"��Y��5��S[Ŏf�ǹ/�#Cl�*!�$�-z"GϹ�t/�(����~�4U'B��۷����V4�?��c�լ��yf�_�!��~r��+9��q�s�|��|�}�
ka�8�F*�xb.��K�R+2dl�<�]�	5�8�E�M���tWM<��R|^�RM<@�O��;Ń�{���Ǒ�Q׊iV��Ǒs�.��I���&G��VC��K��Ǒ��������V;ڡ���j�q��a�@81��x�������2�z�&G�x � ϳƬM<�/��Eh�H5�8���{Ok�%����1B�HG��5�82�|���#��& �'2L\c�zT����Ǒ��F��j�q�U��ϝ�E�j�qd�J��+I��Ǒa�H�ʹ�j�k�1dg����V�P����0�=�u�k�qdTX/�85�8r*�!mO���&GN��TY�'�&G��{4����#W��W9f-����D�+�_�+V5�8��N�_BM<�<!P�Hn�"��c��*�����BM<�l���iV5�8�P�ğ������ڏ�?�I����ߤ�t~;�9�9FN��O�����#Ct�)�T$/T����o���]y�#������Py�#�	��:[*r~"��t����!Td��ȡ:�L�B�A�l=�b�i��.��5l_����Ey�#�=
欂�Ey�#Ǣ��uUޕ�<�ӂ	���A	��� G.�T��m�ʃB��|r3B�A�ܱ�,E����ʃyBtn�͹�9�m�2���C=�!Ƈ!��O�#E3��'�ҩ�j;���>��xH�l�����*�������0:\��T��eGN	G�Ú�b�����O�Y�7�#C����d�����S��=��1Ljf���vd�����zs;2v1�:�yM��܆�(��&��܎�
��Bjm�zs�)��`|�    G_�XonG�Ci�dUr������A���~���monG���Vj��zs;2 �J��U�monG��?����XonG��F��ķ�9���Ҋ��s�v�o{sr�<�������7�#[W'�|�������n)��WK}���vd'��L��܎����6���͙�7���<Q�i����X�s�ש�����7��j�F�7�#� q#� �XonG�;88�1f��m��/�TKIQ�7g����Ր�ܭXonGv.��-��܎���� ��zs;r����M��������Q�XonG.^Y��Gnb���V�)�k�ޜyzs�	L�i����eonGI�H]������v�	an���XonC�Xto�-�b��F��r������8�d�f2b�9���*6���T;8��������3m}�]��7�#��I��
�]�7�#�t5��Y�%֛ۑ�4qq��sۛۑ�ǭXGM�ޜyzsu���=Ik�V�7�!� �L�uq+U�7�#[XH�	G>8þ����.��\�O+֛ۑ��i�e�m�zs;r��`�������SBki(�U9J��=�12,-3.���C���@N^>Lj��{��ԯ����W?��d��RI9O�V>��)_����� ��ןf��÷����_�������7o~�+�����~|���|��������ݻ���{������o�O�k��o�o��o�x���w�~�P������|���_�����[x����������\;����SG��󘆡gW��可���׫���������S��c�ǿ��������ZI�n�TO���!��h�[}�~U$�}�����B#�z�Hc���Z��z��B������I��|�?}��
8+�i�]�	p*���P��^�lͫZd�� �1�
؛��X.;�6�I&���	�ẢpVJ:�% ��͕fk�|����p� EU�l~�/sO��+>�����?�-��:x�����B4G��A�E��*M}0����t���i�,���b��W0]�փ��/	�EE��L	�� �}�Q�E��n����"x.����f�2W�`؃��� �4����^	�8z�ն��ӆ~��O�
����=�{����h�q��j��x��/�8�Fe��U��_؞ ��7�1�@��RQ�ܶ���"�e��U��(:.4�ɼ�8*C>`�S*��p�d�:��� �i3�CJ��5��Z0�ͯ��j�8l�0m,��h����Z��1�d=�j�1�/^ɪ���W��?g�������-�zv�d�73�i���t��)�yA��榑��Ȑ}S�c��ԔQ�-�2�p��r�(CNE���z�x�䤌2d<PI�Gs̬�SFrM*��DMj�(Cn�#u+�RSF�O��
��oOJz�Me��&<�;j|}9etG�ڨ��^��HMe�&��喭��2ʐa@r�\/����2d�@F�
�9KMe����M��9+'e4��D�x Gjr�z]Ne�ESl�(C.K-��n렪��Q����C�rM��r��c��B�r�(C�V9�;�{��2ʐWV�Q����' ��^p��4ݏ&5e�![��(i�� 5e�!��*�^�/RSFr��� ��)�9f<���O�Me�0�vl�Ղ7RSF��Od�o��y�KMeȵaiE̍0Fj�(C���M�JR+RSF�H8l��饦�2�9Tv��e�)�;r��O� ʪRSF��*����(5e4��DvZ-̿��E�)���!���2ʐÀ��S�RSFr
�P��jҗ9�:F���m�ٲ�,W����*䭖.5˕!�m���s��嚃~"���a�{�K�r�+C�NEL�-(�	�reȸ�(���F���#C ������f�2d�����?b�\�[�M�Q����9�a1��J�r��<�cS��1n��ʐ��X�!5˕!����kI�reȀdqh�	�J�re��@(7T�'4˕!���t(3˕!cF6��=�Y�9<}Ǯ3��b���X�lG�uZ���$�'�`^�����nC��*8�V��>�kt5Kk�3ۉy*1Sn��'�Q ��rؿ�����-�.��k��X;qGƢ��'����ډ;r�5-_�b��yx���C���w�ٔAs���Ϸ��yhq(�G�e;qG6Y�LQo�b����V����|f{P�����#��\���x�^�wd�"�Q�Ƌ�w�k"ܣ;�_~�NܑsS{p��X;qG��!�B�!�NܑaMT���H��S[�&�fO2�nۉ;�ʣ��VLb��yee����k'n�V1��v
b����לUs�b���uepw���ډ;2zs�嬵X;1<���+��f��ډ;2�X9#�T;qG��cɊ��ݶwd����E�A��v���Yq)ouk'���+��D+��B����V�E��l�ܶ7�ah�Ն �Nܑa¦�D�gH���#Äm�z]lC�v�4���X;qG����@��ډ;2Lؑd�y�⪝����ؽ��\;qG���ǒ�-E'�Nܑ��	G��&oۉ;���C�b��yu�0e����$���r���׉{r����n'�'2��g�c�����v�� :��[�ډr*[\��%�Nܐ�S�y
�Tk'n�2V���	�7�^�_�3ɵ7d�4%9G+�N���o԰�z�'>�e;qG��k�S�\;qG^pb����k'n�Fc�&.�v�l�*Xݰ�*�Nܑ]U%&�3b��V�f�L�����d�D�U�I�����i�>{R�NL[z%�`e�X�鸎k��K����Uw��6k:� 8!�2�m���/�������؞ g7��+�"���˝�~~7��)�(�[���a�T@�v�Wܔ�,̺�?�
8`��~�?0�\sg��R���R!�Ö������n�����~˳�tnb���n��JS���R��3,<�G5v���!��ҥ���+�3�T�t�x T\r6�� ���*�3d4s�P�J��˳�xn@9�	k�bK�2��T�#�bm�*�3�i���O.G�gȫ(O�[�]�L�#�V�'�'�!U�gȘ�p��H��+�3d�m=���M�2}q��j����*�3��>.��I��]��!Ä��g*y�2=C.YY�W*�$1�LϐɠQW��Rez�ܱѠC�*U�/�?�G���^�T��!/x��>�����;��I��`=�2=C6Si�J�V�Lϐa�d��OMM�Lϐ}���T��!���s�XV�L_\x"�Ŵ^g�S�Lϐ!J.T��.U�g���
7S.Rez�ܚ2X�#[������\�1H����	�,��Y�Lϐ�T��t��L_�#e!O���q���"U�g�%G'1'��]��!ca�c�z���rHp�CS��*�3d��[�:`s�2=C�N-�f�N�Lϐa�	��U�rY.��ť'2<9)S_�R����<��7�6�eю��TwW��M��ϐ��N�zj��������r���3dk�8��vw��쒊�3�G-��/�i�,95���>J��r�/��g:��?C�p/S�CwP��ϐ���QO{�\��2^ ��Xs���3��s7��T����p� J.�a�m���3� �;-nx��ߐ�ָ� ���e��!��&.XiF��ϐ��Et/��gȾ|<���K��2�Y6�Α�����'r
��[d������(�'��xr��nS�w*�����G��l��]=�0%J���e�0�j\q��{�L�=
�̃9��y����6�����Z�	����Tf��4`��N��#{��˚]��#X��:{[P�!���U�u�"�ݑ��\�/{+b�O�p��Ɠ��Po���S��3����#�:y�zҼ���#Ӊ�cγ�|�ݑWz�nٸ)�ݐ���X;ɸ(�ݑ����r8��q����
xm ^[P�!�R��;����kT7W�u@w�!~Ҵ*�ݑ!��,٫����x8��A��mtG��82m�؂���'���`������s*�<��F��!;�a��d�$�ݑM����{����    �.�$/���#���T�XtG��-2�t@����DNNKM�����V�t�\tG.0�J�&�ݑr��"'�ݑ!��Ա6�:�;��j�~e�]���y-�&qU2b�n���4���ڋu@wdxh\�b�q�u@wd۴T�,�u@wdM5n��-b�:�;2����I��#g��p!U��bP���p���mV��#�*Tz��u@wd`���XtG��O�-��\tG^Qi>��I��!�m���g���:�;�u04RǚX��'�������$���#�z�'��<~��9Fe�N,���mtGN�b�8g��:�;r��c��k�����A�\tGnS���ԕX������#�Ͽ���x�<�2�!Mjrm��D.����7��������5��4�~똳���3���o���k Oq���r����JV����/��>w��_|	0�����z%X��WD^?����,ͯ�����p�X�$��K��rd\�P�S�E��ˑQ��<M���y"�<��+����=�2p;،,����c��DYY9	uw92M���y��r��e�VW��ڔU��o��֨�qo�T/���rdx��K�<h$s��d�D�;p�D�r��r�od����F��ˑS�2v8�,���ȅz�b�uP箻ˑk���v����.GnCŅaQ�Q����R�^�y�(����f�Iu���r�>�畓U�Uw�!;�&�j���uw92�GZKd-����ު���Z���rd�����wI�����w��ٯ��q���ˑsP#��Tw�#�,PI-i#	uw92�w$�腺��gX��>a����.G�
vX�:�����yyUp�7G��rx { -���'uw92�/P=iiv����.�E;����]w�#��5�k�	uw9rt���O/���ȩ�A1Y��ˑU�կ�62�]@�Od���~9�.����pm����_�����N2>��s��p�m��^wwuc�p���<�Ԓ��6|�J�E�n̑-����l&��1 �'��� 7��8�����94�pä�����95����s�?^e��Pݘ#��p#
Ս92��q�q��)pW7��0�4|���E�n���c�qT��,��1G����C�;e��c�>F�E�n̑-|�؃��,��,Gv""a$T7��f?M������ƀ�a#�w���#T7��	f,���AՂ�����uv-Wc������Z%���v(�+�ӏ`�7q����ܦ�w��T�d�?ɍ2��IvpQK5ma�z 'wdą�kM�iː��Y��j�2d��A/7�����c�!܊�I5mr4X�
�|;���9A��rp%.��9��[�A��e��駶�ˡ>�g�7M[��X��|+�.մe���O<ʰ]�iː'w��S�iː�`XT��q�e�vG�&�@i�렗�eӖ!�^<�_�����O�{�y�$h����iː��5<�h�H5m2Ķ�ӂTӖ!�2nxQ�'��-C.xx��1���-C��5��Zrk�:��Vs�A�4Ȱ�TӖ!OX�;jח�TӖ!�qg�v#U�i�#����Y�%մe�v@���\;�E|״e�pEb(8��&մe��2�8���M[���j���Ei��׽k�2�\�^���Nj�\��E�j%��վk�2d��4n��~|^6mr�ǯ9�`g���&�<)�� Ƹl�:�t@�Y���c�j��ȸ_�R&o�K5m2��8�[�RM[�����`�C��-C�5gꤚ�9V5h�O��-C�DE��`�kRM[��h-Y%���r�RM[�H$��p�G]6mrG����-մe�c(�FW��.��y9X��CS̒j���MWe+�~�,e�iː�k����H5m�~:�����Q�1RM[���$��0�����RSn:H5m26����VؗM[�Ӵ�ӺzP���iː+Dr����TӖ!w�& ���T��駶������Cja_�<��؜�ڃjQ�M��Z�Њ͚,մeȦCCB^,_��<FvwW1��A��!g��*��Ȧ����?�����B��J%��j���ӯ�U��oￂ��W�i�?|��_�����?��}�淼|�ﾫ��7o���7�ޡC��?̟޽��_���?�}�v�4��������]����w�z����?~����?��=�F��[x����������\9��W�S߂
�j�zD-����W+7��C�!��|��m�cƼFusX�+7���`6��Ї<0�_�����|����3��;:$k��3$h���3Wn��0+��ڦ;�l��s��{��3d[tp��K�Oΐ!�1(��a�T�<d�D��i�H�ĦT��!�Ic#�jO��>9C�	~�:����2�����</'�'g�,�0�<)jz�'g�0/R��[���'����QQӻ>9C^x�>iϭH��wd6�J�U/�'gȶ����D�R}r���JpmR5R}r���6Q�-�'g�04E�f�IM�>y������T��!����.�`���Oΐ�G��sOR}r�ܣ
e��I�ۻ>9CC�A�xf��3dx�B�d��ڿ����6�P䕖T�<��D��j4��T��!;�Nq�.u�>9CV�I�b��3�XT�����
�]��!�\M�B�%J��2�v\W}Э��Or~"�mp���Sw}r�ܝ�4��8���y���9kft�>9C��s`�O�4���wd��ǎ�� ��Oΐ��Тh�����y��,u�R}��'WL\˩F�>9C�pmHh�kJ��rJ*Q����Vnf�y��'�|���c�� ��$U�gȭC�H��AQ��
<CN�6gk��
|��d�gQ7 �1Rx�����0�X~G���J@�Rx�_���j<�
<C�|�8a�a�*��F��Э��3�U"%a�$U����"r�G�Ո�x�
<C.��x���ϐaѳ*�&-U�g��uR���9
<C���*�6�T�!/x��Q�Q�>5��!������
<C�N9B�'�wx��=S�$U�g�%��|��
<C�IY2��[�!7���s��8�Wү�N�}�>v(n�	~$�g�D�>����gf�]e�r�E!��jr�E'�gޑa���,��>�u�n������;����͵�&�gޑ]��C�V���婭Fw �^�ջn��;r���L�����}�9�f¤�l���;2,�=�F���m�yG�I9������ϼ#�	�]���r}��t@��0���b}�y6��/	m���7䤭J��*��>���C���5���;2���a�#�>��r$�=���;2����V�}��t@S�ʣ�X����m�yG.���p���ϼ#�uKBe�3��0awl��y�3��#(�p�p��o��;��¦�n+���7䬽J������婭f�TČ�6O��/��;��ʢ:V˒�3��pE�P�b���;25�cI���͐S�� �+K�b}�9Ϗ�2l	b}��t@s�*r�Z�ϼ#��¸�C�ϼ#�
��گ�����>�+lJ%�����m�yC.�������3�Ȇ�0b��e���;���O�����>sy:��G�h�� �gޑ�P�S2ݒ�3��0����d�A��>󎜫�1��l��3��kWb��F��3oȰ����I���>��!n�vN9;�>s�O�� ӕ&�!J����*Q��Z�T�yG�����q�����mJgZ�8/�gf�޼�mٴ&�gf�!��n�vR}樟h�뵑݊NR}f��[ǲ�5U�>3C���k����33d\Zb����R}f�M�3Qx�T��!�"3e�f���33�A�[Ta�I���~j�������N�>3C�A%� ��R}f��֤F�ͻ/c�#��l��:�����/��w����W�j�X\kU[W�z��mթSHŭ��j��P`��0	���ܑ���a&M������34%��x�l8T���=t�����˥U�OK�Od;Ԡ��~�E���ΐ}D��b��3dX��I-�Z��3�k�H֋��r��NX�-�:    C�V�.���g�=t�^���e�z��<�"Ԕ�$�殇ΐ�ݥlY��T}G��B�E�Ϯ�M�!�Ca�l�z�s�PF�9D�:C�I%<ۮ.�z���&<4���u�r
*S03O�����r�*�s��J��ru�ф=N�@�z���$��G:(�t�Cg�ĭ�E���R=t�<�rXD��R�z�1�'�J�>�L+�Cߑ�	ʽ���rp�=t����$�V�:C����ﲇΐa���R�(�Cg��(�����\��:C��$<�6F���~"��Ҥ*v��3�T0=�$��6C�0��D�J���H+>���z�y��{4�T}GƳV�e�`�f�z�1�'2�_zіx�R=t��ZظȴU��ΐ���B*�YR=t�D4���Ml]m���J��Y�����3�R Ð�b��!Ð�1ʭ�:�zL�Sr߱Uꑾ���1�@��s�Tu�!��q>�yHU�wd, �Q��頥�eu�![����}Z��<Cv�8�|��r�����E�hM�:��9B$�
mK5�����q#Ct]Ŗg�"�\e����ȀD�y5���W��y���c���'�D�M�B=���R�;r�E�ʴ�s0.�V�wdSTuxVb��o��;�C�7��b�����J����f����i̿Q��,V�ߑq�t/�.V�OO�3��W+��:�mu~GF$��2ub����Zq\�I�:�#O�Tp��A��!'[���gP��M*-\�Vk�V/�)n"�Er��F��l��\)�|fk|GvN�A]�m�{�l�Gʱ0U�5�#Ǩ�nͥ*�ߑ.�0�0'�ߑK�(�� �ߑkW��f�b���*Swʡi[��b��y�=7� '��5�#S��I��������%����g����l��xA��Tk|Gv^,�ۆb��9Tei��r����*3�w��tQ�5�#���'o����m���e���j�"޶�w��,�כ��Z�;r��w#ZV�5�#O��=V�or�������,4z�b������Q=�>�Xk|G�A9���FH��wd�^�K�]�5�#�8�:�K��7��w�Qj*� ��5��v"]�W��$�ߑK��Z4T#�ߑ�2fk��Ȱ�^(��ЫXk|G��Mk����(Wq�5ӈ��7�3<4�u��{��5��vb5KY�_�9)�{�ߑai9,���U�5�#��є�����;
ZLڈɊ��wd�(-�~	b��;
N1Jk���5����tr����k*�����b��y8�)�ĜԼ�l��ȳ���>������>~�D#�ߑ�4�@8�?�5�#��9ىs���wd�_o��Z���6��TF� ��5�#CdѨw�9�&�ߑ!0����Xk|G��n$S�'�ߑ![8.���Xk|G���1��`�Z��)T���"�	ӝ�Z�;2A(���Xk|C����-^��Z�;��ʡ�]�A������Ow����)���9�?02E�5�#crפ����Z�����lU�(��0�Z�;2jA���gk���ϑ0,������Ag%��o[�;2&9�Ծ>���|��`h³�<�4ի��'d�f~-�[�ۈ���+?~��������X��V��~����{�U����O���������/�Oo��o�7����}�]}?�y��_�y�}��a�������=�P�������5��������?�{�������o����f����|���x�4���W+v�|� ����U����˪#u�f�ռ}�V�B�E{���*�{���4<X8��r��+���}��6ٻ��3��3xS�>X��3�����k���F�����H�[82�T�4�,47��9O�5�"47�#W���~��~4��˪Bs#8��ʢ�\F�Bs#82�Zl�֟+͍`�KL�
��<��Fpd���8'vۄ�F r|"ã�ȷH�
͍��V�X�x-57�#݁�Q�͍��0S=h���Fp�\UE��e�\͍�������_>����uOoYi|�9�+u77�#cKfC'N�
͍��p;�#��d¾���W�x�r#���͍`��X��4��V��ȶ�/"���-�k�O6Mhn �'r�*tx��Nd���k�X|�6�������^��I͍��0q�[Pu����_*(/�!47�#��\��j8(�q77�#��:���Bs# �<�WV��֚����^�m@������l���ä)47�#;x�&3.#57�#����=9S��Fp�8U����*47�{���*8�t���ah
�D�*��>GnV�H�w�������r��H����1��Ѵ���Fp�>����������O�z��͍ d�D�-Z�YWO:����cdC�~ypMh:G�1��-�s
M�����BJ{���6�q�.�M����HJu�B�98r����1��s ���YݫE��dUr5��#��jh���>��t���J�״���t�"X�Ѱas����-L%	���-B�98�+pY(��9�����0�z��\�A_ܻ�9���W�'>��t��n�S��&4��#��F�m�����kUM����t� s*}Մ�sp� 	CF��t@�OdX��A.M�`�Fc�U�]0B�98�i��4���t����X�xP��r�#���1��=�ǀW�*��W򯚵��o|��}��:m�l�^��z���~f7G�Y�G\t���(r����;f����i����Q{�n����jq�s���Ȱ|XU��9����![X�v��1�\7��'2є[ܴ\7G��3z�GMb���O�+� vM�n����&Q.�P7GN0�i� l����8q�r���ĺ���Sc�/��ˋu�wdX9R�j�b��y�W��f�����s��uٟ�^v�7d����jW�<~����������^���#;���p_cd�n��Od�Tt�>_r��9�W�2�\7GNxmq��E�u�wd Ս�܃�u����F�1�,���m7Gn�Mc����8c{Ͳ�����D�/{Mau,��ߐ��HnQ���X7G6p��kGa�����RiRhb���HS��I���#�8aq*1��u�~"g�6�x+��ߑa��M��)��ߑ$G�wE���#�
,>�z�����FfP�&����9h�z�ԘެX7?�'������� ��ߑ���k���ź�;2~�E��ź�;r��NS��,��n�����b��I���#C`�P�l�Y�n��\�Z���ź��)T�
"9���C���#Äa'n��n��<;��T!4�n��a�Δ�������0a�B�G����*�I��M���vb�	�b���S���ȸ\�	���ĺ�;2L�Wح�,��ߑa��°�ź�;ru*��j�'���n����@g��Yź�;2nx�fg�b���t@#�%,^�bk����k`FL5]���!'��pc�P���ٕ�W�'�9/��;2\�����F�u�w�?�<gcź��)P��a�G�jf��n��\<ax���%~�\,���˻%���<T�}�r���I�wP���|���۷-����`����;(��\�50ƫ�3J�'U�蕰���~��A��Ɩ�F@*�����^I+K;[1�ϛS��'̯���q9OCvU%̄�]n���9�{L�S��cU�aR�;(�s9��!����	����T�O=a�d�H�
�Iͩ`Ȁdn{��T0����n9�^~7��!�C\�ؓA�nNC^N��
��Ԝ��XXZ�I�Rs*2�ҽ\�.Rs*ʧ6���i58�����T0dx�ʃm�*5��!G���]lNCNUuD.AW�9��-�,ړ�|7��!פށ�e'5��|�	������f�؜
�<�r(�5ӛԜ
��kJ�$a�9;2N ��b�؜
�l�K�~�C��S��-*�8a{��T0d�U�9����T����s�)�u��YjNCN�<@�VjNC�X)	�����;`�e���jZ��S�������-5��!��F���9�Ԝ
�7�����hmws*`��D^IY���Im��9;2Z�    u�6���̩`�6��Ŝ`*��!��
�MSjNC����r��S��#<4�3Hͩ`�2V����b�����%�0���I���9+B��~<�1.�T0���9�.lKlNC0��Q�*NjNC^FeR4�I���9�>E��mQ�i �̗) _g��Rr~";���Y�dz�Ma��%�k	���4��������/��0�T0�#�����0�TĂ�2&�i �B�����-5���D���w��㐚��!�b�(5�!O�q����,4�!��J�y�$5dG�&��ԩ�ڔ�a�j�N낗��U�����%4����CQ���m����R:�	GSjC���Tjܣ�4���'RyL/5�!7��p��ᤦ�0�^^!c�%IMa�c���Y��Y�i �<������=��d��Mّ,2-Zy9�b�����7�G[/	�Jp�`=��]%�G�'�$��ɶ"}� O	�i�7�=���ǀ��Pm�Inx�b��A�̀(Om5���z�d�;r�=m��]lĎܓ�O[S�b3 vdA#ո���̀ؑWP�&���9k,1�g'�@B��Q��*,��ĲCŹ!6bGv�1�0]lĎL�������[��rh�̀ؑ�Tk��!��C.A��QX�b3 vd<C�`&�5¸�Q��j�[�R����#Ϧ���9KPĆ\��J�,6bG6 ��T0�:�;2DD�6o��U�!{��й��@v��Q�h��|R���f@����{�r�� 6bG��\L'X��̀ؑ{��������#O�Q�m�L��i'V*���[gb3 vdS^}�s�b�J0d�J�!�2�̀ؑ}T	���]lĎp)Oָ�b3 vd|yG��������T�*<��⸜u��#c�jL�/6��*���ūd�خŊy&U΀ؑ'�H�Rog@���,L����g��Q��_����Ve�'�<�3 vdx��X��,6bG�@q�~e-'�.g@�ȡ)��Z�Ib3 v��T��M���#gu5�T�MlĎ\�+˲i�f@�����G%	��"6bGQy�|V*��΀ؑ�T!�"�T�r���otP-�vĎl�JT�!�,6bGvh�D�������\�	 eZ�$/4�#G��h��*4�#��A35Z�B3 82�W��,���\<48a��f@p�n��4����yT�t�n�Yh ?վ���u�,4�!cJC����^���l^d��f@pd��E�,�U�f@pd�e��!Q]dGƮ��½��f@ �S����Xů�T�f@p��U�C����v+��<��f@pdt�p�UI�2.�1��j`��Oj�_u�wdaPG���$��0K�����o߾-f@ ��qi��zw��D���0���;-ۀ{��_�1���;�3��3`�orw��g�Qe��g�\�2̊(u�_��	zZv�q[��F���\��V�\��ӿ����
t7s�#���d[�f�p�	�)〘Tj��� ���B3W ���Ϥt��t��\��X>B%x�^�f�pd�o������n�
GF�t%
�\��0�:���Yf�
G�~�~T�Ah�
 �'2\�@�A������ܒ� ����\��}��q�֛��yz�0y���f�0d����hN�6�f�pdXA��K�R{wpd略to��; 9=�a���dx�.4s�#G�)0o']%�f�p����ۣ*�w3W8r�0.���I�ܻ�+"�H��f��+o����K�\��DV5:�+Mj�
G����Tb����P�͹����+�k��}��a�m�k�d
�\��xm��n1Qj���*Tt���w3W �<��K��z+4s�#C����y�B3W8r�;�,�rP>�n�
GnYE\�@XT�f�p侔�-�����/G�PW�ڻ�#/xh:����#3s%����2�$:��m	�\�ȶ*��ЂIVh�
G��e
̳��C�;����f�pd���t�Ճ��u�~���TU�XB�m �<��݊Eyp-4ن#C�*��|�lÑa�n��W甚lÑq����rp�}7ن#ú�́e9��lÐ��*%�:Gb�mvd���4���Ն��l��&^�F5<-��^��l�#���L�R�mv�T���5�&���W����j\�N�ّa�Д�7���N�ّa�8.�*ЉM�IOo5����ڊM�ّarՔ��L�l�#��&�sp�~;�fC��`�x#w��r�͎l�rԹ��*6�fGvB/��t�|o'���0�&����d��t>s��'�BZb�mv�od���lb�mv��>�㥖�l�#�!)$�W��r�7�12�gIE;,L�]?Ƽ�!>B�>F�x��;����M���g�3ّ�����A��7ʆl�Q%�Ɖ�3ّ}���rp@|;�dG�%[:��b�LvdX:<�i'S��<���.:1i���������*e���g�#��ĻH+�&6�dG��uߺnb�L6�
W�Z�<��<����!?L Fl�Izډ�$,"�;��3ّ!<�#�O��]�3ّ�U�%�f/6�dGΰ�x�P�&6�dG�����t����3ّ�z���g���_�u:�]�b�Lvd��?,x� 5�dCn�t���Ɠ�<��µɯೊ�3ّ}P�Q�\;�����/,�����w;�$=������F�]�y&;2<❪˄7�r�Ɏ�P�єj���ȣ(��r�s��3ّWT�8|�)7�$?%4�ҫٖ�g�#ۉrҔ"6�dG�i:y�2��<���1��΋�3ّSP�<�pR@�r�Ɏ���x]�IY��y&�ita���(3�����<��u@µ��Yl�Ɏ<��(;�	�v�Ɏ�5��Q�b�L6䡃
�P�(�y&;2\�#F9j�r9�$?����讴x�¾�g�#��:fYfc��<���]��b�Lv��� �4�!6�dG.���A������0��D'���3�O=j�8Q0^Υ{�y&;2f+P�RS��<�yU��/'���<�i۠,������6�ҥZ9�r5�dGv0�Q�It8����QAؖ��g��ڤ�ē�G�y&;rNjxZ��,6�dG.��N�Fl�Ɏ�ㆭ&[?�y;�dG�Vlx �E����ȳ��p�+�c��g���ق�jzm�Dr��LvdX�6:�׮��3ّ��84U��6uّ�z�$��d�\�3ّ�S�VÐQ�m꒟�*"ʲ,Il�Ɏ\�*�����<�V|��~Sp�Ɏ<��$J�����˩��IO��y&O�uS�ᙨ?9x�=9=����Ϡ�"#6���|�j� W</>�?�Q����?_��_(��T������6������{�U����O���������/�Oo��o�7����}�]}?�y��_�y�3h����ӻw�����C�Ƿ��Ο���>��>�߾�߾���]������o�����>�Ǿ8/����~��=�Ӏ+��Z�?����U-b�����s�v��	f���ݿ}�6�9ӈv�j|��]{̳�q[0�>(�8�<��J�,T�5��]{�g�*WZ��z��Ze����ͦb�ժ���9'+ula�m�D�=�w9��<��5
��Uvb���2�4�}��R��6�u��.l��MŐ�vdl��g��MŐ]UZ�Ej6C��ռ���fS1�XT�S?��l*�,�����zg��l*�\�\�G�]{r#	�T�%5��!��,������MŐ!(�t�� _Φb�h�ۄ���T�Y�&��"Ie�����l*�l���ofjR����j�Y�8	>�fS1� CӫoA�R��r�7�xveO:�ͦb��)��b�Sl���C*F/w��T�Y���fT�V��M��T&�60ШAl��<M���l*���,�j&���T;��	;y����MŐa��U��l*�v�-L�ِw�|3��!�9n��6�fS1�Q.�زR��2D��<�خ=V�=a��N�fS1dx7k0�i�Hͦb�=�`��[۵�<�v;`*����k��Tyx#�}8(�t9�jGv�H�Oj
�ͦb��90ć���MŐmH    Sk�R��r0jlf8���Me��n��Ei����MŐ�yq�'Wb���T���d�Bj�)5��!C��#̲Ej6C�	[̍�S�&�ȵ?H��� Ɛa��n�&��gM�i[�`ƶ^jC��u�%��&�1dxT|�����s9�!�\A��B�2L�K��t�%~9�!��$��!5�<kwW�S�pu�&�1���_=8�6b�=��lH�
R���F�9~�� Ɛ�!�ԤzP��r؎`���%�T�	`&�-�I2��0�,{�L��|JnQjC�	���S�kR�2,���dƔ��0��k�tm��� Ɛ���*��HM c�0�z��:�&��g��`�]-V��JM cȰ��4S̐� ƐW��sPQ�"5lG��&�Q��AjC�X�����&i��i*��K�G����:D+hp����F2�2�=f����.;�-Ǖ^[oA��B�/�
�T�7��k���T�-��c��ԙ1�Seq�΍8��ؐ�_ߚ+gfD���F7c<�
壴�I���y!g�-vw����P2�ȭ��o�y8r�JǾ�GE���#S:e
�y"����ȓNõ㱠źy���;Z�Eh��4E���#��Q!�a�y8�蹉�jD�n�L�a��;�T7G��'y�u�pd�|��6źy���{�7G�]�HA���#C���~}�u�p��0���Ɏq��ÑGSƣ8������)��uO�b�<9몚�գ��e7G�V9�]�A����l�g�2��p��]v�p�`�Cǣ�O��e7G�Y��ӟ�ĺy82�y���Z��n�Lqcn��j;�L�[.ؚ�����n�g��{�p7�=p��v�p�1T��Wj�b�<y�o�'�� ��n��ڰ�z�|2 �#Ӂ=��ڗ�Q���#Ӂ= vhn.�n��HE����F2�fӽD:��i���X7G����"��ÑKTngl+����B�-�.h�����n�L�ڷw!����B�[�g3z��y6��l�?��Z���aȕ2���ﲛ�#[�m;��p�趛�#��0�Y�n��׷ҋ�E���#G�%��˄$��Ñe%n�1rA����һ��鬅�F#��ÑkS��������RB1��n�<(+�
�e/v��y9��W�E��<�i\��t����#Ӂ�ܶ,+����B���Si��S���#{����6e�n�L!g�{�[Z���#��;�+��Ñ!J��֌X7G�۠�]�sb�<ώ��ϸK�:V�n�Lv�w��`a�v�pdz��*55#��Ð�Nz���G����f�Fj��y�B�<�3ܓ笳X7G�$3�<Ǔv5��<�������ֈu�p�T1hՇ v�����\ܺ����Ȼ3��v�0.�y8��tF�x�|�͓�ʡ=ŝ{U\b�<����k�����+����-�s|%�����R��r�W��Tn٥���!q�Қ���w�ń�Jtf��
���3��/ZA<�����~�R���m=_���~Q/�O^��m9���)(�������z!'�������-/d
	�m���z!W:ͱi璲T��;��Nբ���z!C��JNQ�논��^)I�L%��zi��%��63�T��Z��z�9�.���H��ɻE��̷���.�r�k������z!g�w�Jua�_�K@.��΢�Iua����7[�
C���+��o�T�yZ����T���m���rA��#��	~��T��f:Jp��ܥ���/�% �E����O�.�r��k��Ӑ��z!Ӂ]�%~�.�2�i��cO�1�ua�������]��܂
�������"r�����W�.�2e|y����R]X/dz6cW��q��#[
�z6[�T��캇 ӥ��^��Xtu� ����^�!�?0AFݤ���/�% Gz@��O�Aw]X/�UE�?���^��'��� Յ�B��6��u,�.�2���a�T�yz�r��������/R  /
�69��TGv�+��+�����]X/d�FM���T��֝�Ȱ�A$wم�B�l��p2��녜��Η~К����^r�c ^�iJua����t�)��Iua��!��- ��?G�p�<t��x80�\6���gUk|��&�8Ƒ���Q���F�Ʊ�)�O�]�q�=5b��z�>kR�c/dOq�ݷ�9K5����"c�JC�j{!Cj�36��T���쉁�լ �8�B��cp\��K5���� �h�Sr�R�c��'�j�=E�q�<�jP2���T�GF~�P���d��]���$p`�)�8�B���v_����q�Lo����\�+�L4��j{!o�.����Ʊr���;�@)p�8�B�V�̴"v���BU�����^�è�A��O�j{!ӁmP(.;��1W��OHa��VS�j{!ӁB�ܒT�����%w�V��:��>`Ojr��*�3(/�~wr�+O�&W9��W	��+$5 �-��z!'L�V�܅)}�s{pV���t*H���I�g�#���.x5-�3ő'/#�h!��L1��绬x?��Lqdz�]�[��z��SP��߭S�b=S�w��9�X�G�^%�/)(�b=S]��B�8��z�82�9vlM�A��۞)�\�g [�I��*W��Ą�WOF�]�Lq�A��X���n{�82n<������U]��VU���z�8�Y�΀kx��z�8���0�@�s�3ő)2Xv�N�g�<�:.�5�5��Lq�A�.�,�3ő!jB�S��<�g�#�����O��\�Lqd(	q T�X�G�s�Q]7b=S�)�̔A8�V�mV�g�!S�I�W#�3ői�hTV}
b=S�l����$�3ő���Ш���X�G������C�g�#�F[*���Di{�3U���B/Ms��\���t`g4���4��Lqd:�FEMnt/�3ő���[P���������w�҈�L1�J�؝��'_�L��:�ҳ�	�$��)�L�v�����۞)��N��z�8rtj��z�`:�m�GF_��_�b'W��=�i����z�82e�y�?��z�3E|Odb�c�'л���`�ٜu��z!��ԉe�)�3ő�[��F��z!ۈ0��|I�L���T�﹍�H�Ly�T'"�����tR=S/�8U�;^6Q�gꅜ�jiuV�g�\�_F��H�L��q���˥����ӧ����X��)���6���.K/���2Ck���T�G���>�z�^��4 �9�e���'�*�[;l��ۗ흗�z!S`Ʈ|�*�3��S@��_]I��z!���\Շ(�3�B��ㆃN/+�3�B�Fպ�1�ö^ȫ(��-�-�e�G�/zr�3�M���'�EMn7<h�q�3�B��Yx�Z�R=S/��p�}���q�#��mJL�;�!�<��'
������_����w����\�У^���ɔ�������w���������_�������L�����o��ݿ�/з�ӟ����������`��?����������������:���_��o��۟����?���?��/���?���������=����?������/��������_�W��v�T�~�^��(q�e@��A��v��VuW��~�<��u���N����<۷X�G��f�\3��_���?�������o�?�+&j�xZ��E)���-i��ƌ5��Wu�V��k�R|)���+&�5-�J� 	.+�{;��CO��_��Sk���Vi�����xZ&�������>����~Q��p#?\��ޯ�j���1go��~��/Ϡ�֢,�V��"�$g�ѭ����3�ov���a��dc�/�`��T��>�����hG�݅��bX6wKgs�-|�3�:���Fk+�Q�n���g@9u�UC��M<
�u������_#��� #�}?EN���y�|)ٹB� ;oF^��`���g�Lz<��(Ln��n"c��ӵ��M�g@�������p�{��{��1MW�    �]"�Dcuk�����3(��YM�c�6�� ��3��&��:�eI|���|�zŸ�D���H��S
����;�21նA���=�M��J����<�&��65�"�kdM�F��@� 	ﮮ�$q����0���ܱ���)��x��k�9�nƗ_��H��ZP��N.1�.?��Um����߹_��3���?��W{�������C_����t�1�a{��Ъ�=����~�B�`o�ӻ�BI�	��0�qQ<Z"ttӟC���G�qK$��x/�̾ m�n��R�9O���O�L�T�D��w�����m7����B�������¾���|j�~a޷��Wuf?��w���G΁�e�j�����\��������17��K��z��~�1�����5B���||�۹z�"�H��{�#��8*g֖���lπi)W���*.rQ3`c�Ue_.��]��-j�7���h/�OZ#�Y�*x �� vy�p�<����������Z=�RÕ�����f[��ݮ/w���/!�FN]��Y��W���o�ղ{��ׇ���CJ���г�K����=vpz�f����KV��=����5�,���E�-u�Ӝ}��֖�h����y]͏&s���)~�[�Us�9O��7
"�6q�5O�=^�\0��W��ִ����~~�I$_���Y"/�A	6^�b�o�$�0�&�$�%t�	\��s�F�B_�_�;Ŧ=�?H��k���K�ZG�o����۲�:c��������x������~PN�)Q̋k�j���n�3ۋ�;��w�F�m/ua�}���������
2�����/K!�̯�~�JA=D�Mտ"G�.���u�T�+r1ʢ�MYыl����};����E6U����	�vJ6^dS��ȃ���X�.���Wd�C?��M("��A�t x��I�l�������G]��n6U��Ly��i�p�6U��OB�F-���}�l����w�V�D6U�����@:�}���W��U5�K��E6U��L�~A��g^"��o��D�h���d�����T�2���;��3O�Mտ"�����"��EvQ�����,���WdZw=�j%�uC��T�+2e|��r5EdSu.�2 ��\"'�Mտ"SV��c�*�C�W�Q��(���Ev(�����[�5Md��/�hn�pS�A��C�F~�V	
',~΃��7;�Evz{����_�饳t�g";�EFY
�v�a��P����B|�;E���;�E����٪١�+2�Yu�����_�)�w�9sLKd��/�0;��a��Ev(���2���Vd�����	=g�Չ�P�9�o4NƱ_�P�9W5vߗR���_�i9jlAd��ȭAe���87;�E��T��O";�od�D��D�8�ʿ W�(����\���P��V
ua
5��P���a7�@c��#n8F���s23�bS���űs��E6U��O�NE��Y��W�l���R�F�ń)���Wd��a�&�Mտ"���OeX/���W䅆��J��"��An�|*i�/���F~
u($Rn+�z�"��E������Ȧ�_�����d}R_��T�+r
h��˨"��E�|��]�l���N��ǰ��l����B�Fy�ϰ���D6U��LQ�J��5"��E^VU̚i�d-_l����������"��E�`H#�o��ZS��ȮS��:FmEdS����u
f�GqM�Mտ"'�JХ���D6U��\<�x�\�T�+2��{�o9����W�>������o�P��ɍ�E6U��<4�@<ʋ�Ȧ�_�!��;�*S�{�#': �����Q��>��������l^V�������������%�>*o~���<T����ȵyq�2(BB��kk���86�0�X�G�(̺�*q�bm^y"�؃�\�GF��\�h��m��}ʣ&��~�(��ő-�=b�3Ɉ�yqd�0�14�j��ȁ@'^?c�X�G�����K=�X�GΑ^��[/��őKW}Vk>�Gݶy٧�k6��d�X�G����f�6/�<)nL[8��X�G&P�{@���X�C� >P�r'�e�G���=0��6/�Ttᚱ�W�@�u��őCP��2]k������6+��ő)0�a+���m^�^����ė}��=G���b֐�:�821����U�3�>Eh(÷��84���L��+�dQ%�g*��δ'2%>S�}�
\��i�����'�Q�:�82�y
�J\�3�#���}�b�L������C�3͆'2�_n_�ِ�:�8r�� !cu�qd�9!l+y�L�ȝ���H9�o;�8�,�"wb��L���ǈk�гXg�}���E�=-K�^n;�8����eu17R��i����зL��4��r��5�XgG��i�9����L���|;'יf����l����egG�s�6kkS�3�#��𞸐�:�823Y�F4b�i�j��P�XgG6Uu�o�J�L����?�9�� ���4���>+�p���wn;�8r��C���@R�i9J���geī�4����}��s�L�ȕ"9�<��XgG�P7�/{#֙f�y�v���,֙Ƒ%���@BrۙƐر�^���u�q�]F���8 .;�8�����L�Q�3�#{��X�ᠹ�mgG�;��(o;Ӝ~"S�m�QR�*o;�82f>`�;�mgG����=jZ7��4�L�ݷu����3�#S���ݳ��XgG�{쾟�-�δ�(DR:���#�u�qd[�E��,��4�L@�����L��z��r^V�3�#K�8d������d�D��K��(�#�D.�ش5�n�^�
�������=f����0[Z���Ц��z����F�xN Z,I�By!�A�(~^h���8�0�X��N�̴�KJ�>�Ҥ��³�\��WjR�t/dʎ��9���w�L�B�����G�j�{!����=�s�L�Bn���]<���l�{!���M��I5Ӆg��L핇ө�T���^Ȇ2n�`��,�L�BF���tA���h��o�,#vf�9nU%F-R�t�Y	-%�!�M^���\��08/�L�BnAu�����䲙��'��x6��f��L�ڽ�6-�L�B�mߴ�sTB/��³J�q�lM��	wn��^�� F�*-�L�B�D����D���L��.����ﲙ�L�x�=�y.�f�r���>)p�5Ӆg��UҨ��椚�^��c��"7g���^ȫ(�� ��&�Lǐ�6N�Od0�T3�?��=�NL�w�t�Yկ��p`��T3�9�����̙v�L�BNIi�Ý��n��^�Y��%
�I5ӽ�)�X2���B�����j��=��>���O^��f��
����@OR�t�hziЬm;���^�u�]FV����Js�~^���L�󈗗k��?���u�~�K5ӽ�)��~�9[q�L�B�F-��x>W�L�B��=�fm&�5ӽ�ik�a�Vהj�{!Ϫ<Sm�)�L�ð_��+{,r?�}�L�B6CŘv�駱�^Ȏr����cIu���i��u�(ՙ�B���2[��L{!'
��oa�&ՙ�B.�q[��TgZp�LIO�����3�^Ƚ�S�kHu�����
�7~Hu�qd���R�:O���u����qKz�TgZp��F-�v�δ2�_��m^R�i/�X(/F_�(ՙ�B��u����.ՙ�B.��ŸC�%ՙ�BnNy�?h-�δ���O5�5�p�-�3테�»`J��L�Ȟ{
�q�s�|�3템��3U�;3-��D��&C�]ӌR�i/dڐz4z�R�i/dz���Xk͒�L^?�i7.-��mbG9`�D0s:�����t���i��P�M;��?��原�@!b��7�P���ȫ;C��L����w3
��4�#%����&�u�q�4U޹�8�m��L�O�Q(�0��:z��4�L!5{w�N�3�#w�6�>�XgG�@و�0��XgG��9�톯K�3�!G:������L�O�QtFDv%H�o;�8��t ���ŉu�q�hUDa�D��:�8r�����    	n;�82��ݾ��ӻ�L�ȵ�Ts3�u����(��RR�b�iyL������˗�iyE�cv���:�r��g�m%oS�3�#���t*Ջu�qd��R\��.v��9PV�v���.֙��D'���ǋu�q䜕ma�
b�i�l�PU�&֙Ƒ[Q%lE�b�iyX����;��4�Lyڊf�AU��3�?�F��g��+Z�3�#S����?rۙƑ� $$���egGF.��4���mgG��g��Gb���4���)2���mgG&�� ���u�q�>��R*���i�eK��Y��4���rp@�0�XgC..��X)��L�O�Q����x��4���j�3وu�q�\U�;�|�b�i�ZUq!�t�b�i��aK{�FLb�i�)�*���}��XgGFV��Smb�i�jG��g.k�L�Ȕ��}�:{�L��W_��/bm^�y�J�"v Y�O�$		=
4�X�G��i4�om�6/���OP���ڼ8rj��3iV�͋#Ϩ��yf���z"/��q[�� �������1��ڼ8��j��)8D�6/�L	�{Djbm^�v�Y=}�k���)���4��j�M�Wxʡ��>���X�G��w�ҳ�U�G��6c�k�d4�e�G�L�1�'k��͋#/
�|��d��e�C�B|�4K:�ݶy���۠����'�e�GvCY�,�.Q�͋#ӳ��Bk���q|��-�k/ۼ8r*�K����m^��{ئ�ҷ�;�%D�xs�鵻S��E�����ۼ��}~���cߡ�P�)�'5����y���㼲��R�\lUS�;��#�I{���PA�ϋ!)�t`���}^�V5pEU��b}^���oyk&��y���k��}�j�K�ϋ#�x�����8������ӊ�y���hҎ]�J+��ő��L��y-�>/��j�32��yqd}�дx��������[�\�b}^���{���;�,<�F�d���܆X�G&���VTj�>/�<&�_X��`~�m�G^�lr���y1ds�	j�b}^�)6B�Ok�Q�|��ő�S	5��z���ȁV`F�=�����	OYoL���șh �ͳ:�>/��y�eW�n"n���Sl�zV���ʝ@Ƒ鱬������8�**��� ���Dn��\�R�=�B��őmUnkb
bMS�6���Ě�By"��<��-z��82-���>Op�4ő�Tz��s4��)�\��Э��X�G�*}K��Y�૦)�<�
sk�Bk����Lk"-�4-��Ő��jAQYCwbMS�R.��_59�5Mqdi����+�m�G��O8Z��bMS���� �4�9'��xŕ �4ő!A�߾(���82�&`8O^U�i�#������bĚ�8���JZOrMS��L��KnŚ��}"�]����fbRMS�-�<V�(]�i�#��ç&�4ő1�����k��ȹ���K�!�5Mq�J!�v�3䫦���7.H�j�M�i�#OK�hR*bMS�iG+p��jk��Ȧ�ւ�t���i�#;O�מrz��]6ME�D�t
4�\Q�i�#G
C͉��i�#�Eh���&�4őr?��N�i�#Ӗ�ᦫ5˝�ő�.
w�ń&�4őmM׸mʝ�
��)����2䚦8���q7��=�5Mqd
���^�UĚ�8rH�i"����5Mq��~��Ě�b|"S"e��p�`��#o�H��ux�M6��<�m�z}���[H�I�K��cO*�]%8I�sWJ[���q��)�L�`A�Ҽ�k���s�e�%i�k�b�A#\G�_�k���L1�����N�i�#��	:��6Mq��	���<Y�i�#G�i�n�=�X�G�A�9��-�4őnJ!����5Mŧp.PF�d�.�4ő�P6a_^'�˦)�m��t���5Mŧ>
�>2��Փɬ�MS9:�P��'7�MS9Qr�}�� �4őKP9n���x�ۦ)�\�h�������i�#�a����RMS驏�Ӫ��"蓆��MSm�w��|p�s�4Ő%=#��<U��)�L�_�J�j�X�G���싥ѫX�GS��`<�m�Tz����" /��82�m��z�r�m���ͩ��'��Ě�8r����؈5Mq�Y��8 ځe���!gm��#��bH驏ʦ��[��@�ȔZZ��K�S��#{:,z�G-ׁđ�)��y[�:�8r�����;ؗo;�82�*�mMI�bH�)�ʔA����Y��&�<E矅��:�r�U%T��Դ�$�lq;^nI�)=�;���N�\�@��a�x`���@�ȝ^:LZ<�fyف��������a��1�uC��P�USKY��#S�����:����f��|����H�{��'0bH��w���:�r�g3P_��)�:���v�ю I��8�$�LR�.�XG���=��j�$�L��+����j�eRz^75�(�8�XGQ�=��"ցđ�R+��=Nƃ\v 1䎫���s'ׁ��W�q���V�ܱM9e!��1u�$���G��z�bH�Fz����@��{�~�y2~��)?��:�unI����$�<t�x�\=Xفđ�S���K��u qd�mu���A�wہđq��)7��.ց���h#�1�W)1�u q�bp��g�m�ȴ���r��趯�!O�TMu�^w�Ѫ�~i���H�y�3��	��\?�R�;H/��^)�O�+�!;�Ӟ.[�:�8rH*��L'B�@��tt�J<�)?��&��f*﹊u qd�dsN�/;�8��jX�*�bHyQ4j�^'������UC�u���z�$�L)E�K&��đSV�l��bH���m�M�A/��$�ܼ�m�b�@��cQD���v����n�Z;�a��g�$�L�r^�ka�XGvC�]Z;)��v q���٢�:�r|"cP�T-ׁĐ����|T�A�������(�%���A���#��[��^�)�'r3*��I���$�����սXCF	��3K�~�H��!�Ir�6��D�	� ά�V�H�|�R�:�8r���/U����$��Q��:8����@*��<�ʻ_�<�Mw��ÑW��÷��bȎҟ^Q�/!���pdH7�!��)_��pd_�����D��v�L�	���k�)扜�rv����v�\�2����"𶝇#������`��y8�>
�"�X;Oy\�P*o�F��R-b�<�T��֭��8����`kJ#���pdz"��}�Q��y82E]���I����'2��i�;ng��v����2�k�b�<yR���� h�v��(m3�u��t��v�(dL�MkU����'�Kj���A���#�
��OP{�b�<9u���o�y8r�j�X[����v�Lo��󼜖;P�<o�B��\�I"u��Ñ����d���pd
a��QRnWo�yr(l�{��T;G�Fy�xk�́t��ÑCV+��3y�����jD�W(đi_��v�4��m��ȴ/�]b�g�_��y82��eK���b�<�y��t��E�|2�����#ۢ,�wJ�r�<�v�0w�����y82��٢�gFk��ȩ~���\;Oy^�'��骛F���#��5����K�I�#Sto��3�`/��G&��J���������v������{��4+�FV�j�.]#L�v�������I���#��^�f�k�)OM	:�6����b�<٣z��}������#G�F17&�l��y8r�JO܅u���y82}�O[�ub��l����?���y�>�i7��$���B�c�W$�`��e;G.(3�=÷'�v��u�uL�)�H��cPz���T��'��о�-b�9��y^ȅ"�|��Q�w�</d������R�</dL���].YK�󼐧���w�:�v���2��)�a��K���#W�M3�6G�P;�����Ї��i��</dO������j�y!�-9��&z�v�2%�~m�;P(�r��;ƅ�t&6�i�y!W��G����\����"/�CK��)�1;�9Y    ��1/dL���9t���ܴ�eA��N�7�l�g_�P�	��D��G5ڍ+F���eo��2���`d;�zc^Ȕ���h����y!Sj��%�[I�7�L�����zc^�����ToL�O}T�=�p��!��B�<1�ٴX�zc^�+����k_�zc8r��������ޘ��5��,#I�Ƽ��e�E9��>�덉��B�$?㮤����7慜�K�~�*��B�SY�_��˗�1/�J	��Gi��zc^�(d/�c�u�BU���n�H��D��u� ��XoG=���7�To����>���y!�����1�To�9.�p�G+�J��D��CQ�Pw�V�7�\�c�=�.I�Ƽ�)��GI9��v��B���n�ޒTo�yLQ�OYK��pd�(�m��ҥzc�~ʡ�-i_i�J�Ƽ���[�^C��y!�Boξ�:��p��BN�ά��zc^�t�D�;N�ޘr����w/��S�5���n�����y!S0�p6g�To�y��䖯RyѺKx�e��Yt�b,-n]�З�1��@��6�I��tC�;�;p��#+�Q��QZ�#/{c�y
��(�NT	��<7�1/�:����J��y!��LG
u�ꍉ橏Zs���hJ.{c򀉇�,~���]o��L
�!h�Y�7��Jc�M�7������^�7�#�b�-��¸�1�L�p����n{c82-��wS���zc8r��/��
�n{c8�D3&Hmi1���0d(A(6�Q�Xo��Od[Џ��moG����݆>�u�B&��f��5'�Ñ����~����\2�o�OP�Xo�	OdZ|��/K�7�#�T"��7�#O�4����zc8򢧌ȠƜ�zc2��t�m�`�����6ӛS�h1bGݼ��Ԉ��N��n��Od�h��J0b�19E��D�բX�	G����X�	G�D�����X�F���W��h�F��ȓά=f~�&�h��������m�	G��Ѡ-I3��oM82� �<0f�6�pdJ���8�|k4��ɩPa ��5	2���DF0Acbk4�ȕ��M�Zk4���i�1b�&�56���W�׍&3�f�D�u��m41�l=�<���M82���y�����ф#�E4���l��ф#Ǭ���q2�ф#g�Zwk�X�	G.�c�l���q�hb���d��r��!�h{��6Mf�5�p�I�얍�X�	G^C%T�˨]�ф!(/6�`2�M82 ѡ�R�k4������a�N�ф#S��1L����M82�i9��1OFC^6�p�B?�.
���M��&�>�a��X�	G����3u�F���bu���� Ŀm4�ȫЧ%��n�5�0�R�.
���M8����R&��1.M8�w(Z"+�Z�ф#��B�MlO��\6�p������K��M�S��¶���X� G�I9�����vգQ��8nM^ߡ~D���۟sC��T��K��7�R0�m-X�F�<�r�k_V�ф#��Z�C�lk4�O�\�K-�ܾ�&�h}VUC��ڷ�&�򩺇խ,�hkVn��u�k4�O}T�FY���d$�m�	Gs�0��O�F�L��ݝ�k3b�&9�Z�*4��M8�u�)E�a�X�	Gv]���#7�F��tQJ�j�j��M8rD��c��(�h��Ӹ�+��w�m�	G���@�����ф#�F���.b�&���ʓ�2�妧�!,��Un"��b�&�,e���J���&�ħvb�&�_���h4�m�	G�Ey���8�s�hb���B�F��΃t��ф#�Y��,�Q�X�	Gn��:�M82N?���H�}ٵ��q�U�^|	b]yu����u����t�zP�|�iY�k�#����>�umpd_�F>��I��ˮ��*{�[kV�k�#����1k�~�]�μ8�O�'n�ˮ��t��-E��U�ump��hK�uA�C�k�#��w�ܐ;�#���=�k�um0d��U��W=h^zݵ���3�fJ�;�=%](FU�������ȉN��2�:h�s۵���PfkzOZ��vmp�J�"�2��� �:��֪X׆{��(�W	@i#�ump�E�A@�'#ֵ��;%R�H�)ֵ���TA�]0)b]٣����~�]�6R��ÆW]�)��	���0ĺ682���Z�V�k�#������ĺ68r�*�Z��b]�ҧ 	I�6�umpd�aۨ�d��e׆{ʡ����eJ(�X�G�^-\���X�GvCy�)���e�G�>m�5E�k�#c(Am�!ֵ����בp ��~�]�)��ذ�ٽ�umpd�����_lb]yRV�!n�%�Z|�L������U墵�Ju��k�E�(^@�f�"��\�~�k��q����� 98�'��Q�k�#G��ؚ�ĺ682j�:W{�	��k�#Ϥ�G�jx���a�PD��Lkb]٠�vj�,ֵ��]�Ň��Oz�_vmpd�PF)��m׆{�`J=����C�m�G�A-�6�ME�k�#WC4�N�X�G��3�-=��\ump���;<h�~۵��)kM����X׆{�`&4��.J���V+3�%i����Ȕ������)ֵ��������F�k�#�>��nu�"������\�c-�ĺ682�cd���.ֵ���3z�*���~�]y6�r�VO���ltW&�}I�ź68���gc�X׆7Od���r'��ĺ68rH�����Lsյ��)�Jn�2U��#��M�[k����m��A��#��B��6b-�>�)nnO>8�n[ 8�\���_�K��@0dk,�b�/Bmb-M�v�����mG�x�3�c��Z 82��m��È�@x�DNhX��<�!���s�?g�I��#7G�L�M�XGQ-H7�0F��#/Ko��>d��ДL��
�x�����/upW�bk��Ⱦ@��A���#hå%�V��#':�0���=�m�Od:��ܒ���Z 8r�*��`nʵ@pd�!���&��<h-�����m���t��}!<������idtf4�l���֩e����m��Od
���#Ȍ\G����45rk��ȴ&v����Z 82=[�bm6���@pd:a�E����-�E��]k���<�GW���b-z،�C�rW0d���#F�7R�-�������(���=��{�ɉ����'r��.���1�ޡZd��q9�Q��9��{���npҫ�m��ߡPػz���tw�N;��	�/=���J��m�K?(�ݶ@p��T�{&�[b-y4:��Cb-y9�V�5�� �
�n���IՉ�@pdT��Z 8��p��H�XG��C�E�ok����K��?�o[ 82��=w�-Y�"<�s�5?g��b-�[�����Z 82:h�-�uC��#/�<�{�,F��!'D]�����XDx�В��i��o���@pd�(�\��ы�@p�@hmLvb-9���A������+�E�U��*�mG�`���iX��+8r�J���`��mDx
�҈ +)U��#ϩb����)�����������l0[}7/�Z��#S*��{^�k������PQ�� <�~9f1[T��	82}�1Ƙb��B];�r�`f�m?G�m�����)�O��;�㹇f�~�<%���m����<1�FG	�+�9�~�\L@;�=~:��pd��3�[K=i^z�O��}P[6֊�pd�i[ �Ki�~���������	�S�n~���NA�H�L�j�S��/��pdzU���%3��	82���y>�'��p�	 ����~�LѐJO��%�O�������KrG*��<�B���=�jb��S��4�X?G����}�׻X?G�����9����
�0���m?GnI%�:F�I�� <��N��������	8��*�M��X?C�/�����fy�O��M��9�����m?G�`����(�O��)驻%��]�� <ur-�-	�z2ⲟ�#g�V`K���p�Ҕ˨
���	8rs��    @���~�ܛҨ�W�X?G��q�U�*��	�S'׷�a��]�J�#��z���\r�.1�-�o�	^ߡ����O<��E�;~�hw��~#+�A�>j���	8��2�-O�b�9F��WQ�_��	82�X��7��ħ����V�v�䯷�A�@�ȸ$�O��)谻��<ķ�yZLE;��[��~�L�)����b�yгY<�6~�O��������]�Ɗ�p�`���ӣX?G���BtS����m?G.Cŉ�+�%�O�¹1��׭S���!Oܪ�>�nU�~�����j�F�'��.��{ە��	�S҅Zs�B,��T��1������'���Gt-�D�~���;��J���#7��nk��'��}*� ҳ��ħ�kRlkQ�/�`��m?C^:R���؜5/��'�Ș��j`Ngm5��	82�"�oIW�b��9�O峕�Ċ�9r���{xۢXq~|�V�T� XŊ�92:��=�.%��|���T�b+���#�g���ӊ�s�9T�x��� V��D^�N��w"U�Xq~�Od̿Ej��Iǹ��|���{�bu]�8�#SQ�,�{��|�L�H�t3Ċ�9r�,gT��b������f�������1=�GU���Ӊ�3d�N��ƭ~��sd����ϙ�\q~�O�@�����+���ɪ^w*��Xq>G�M��jQ�r��s��T���r�$V�ϑ[S��s=���-���ë�����Ċ�cy"����/ͪb����������s�`�ϻ�q���8�#GJ(Pb��D�wY������;O�'����|�L�)��>b�����Y�nbۧXq>G�\��$��+���k(I}ѩ�秇�a9��ڽJ�1b���B���aŊ�9���<��=W��|�L4cחk�b��9�����C��#�N���\9���Vž���H�Pq~��;$���ϹU�q����/��Rrs�#�m9��|�L��؝@�I�s�IO�aV�wY�8�#�K���7z+�g��7�({R���q[�ϑ�Wâ��A�R���=�)묻|t䍹,����S��Y�)/��|�L����2�+��Ȕ�f�v��*V�ϑ�AP �Cb��y�1}1cȞTq~�OdzU��:��f�9P���ܘ�Xq>GvQ�-�����sd?�0�Z	b��9&��t���������j4�fL��K�mq>G�eh���Ŋ�9r3j���Xq>G&�����jŊ�9�4�۾��"V�ϑW�2���b���)��t��]>��sd�U@��./��?G���Q����|�ڧMP�=U�8�#'G?'�[�2b�������n&b�*�9ru��%����)銽���/�=G��r ܅y��*�9�jju%mF�Jw��L�������Jw�l'e�h�d��tOO}v���'��~���9LU���,+V�ΑSTk��ɩ�U�s�<)9F��\�;G�Os�fY�pb������*~�ΈU���
-�FqL�!�\�;G�\b7ɫZ�Jw��MR#�ZmC�ҝ#��\�����t��ѫ���&D�J��T���>=�h]4�Jw�L����IW��Jw�-�ޗ[/b���5>M�L�t�Ȕ�hai�$���t����<�X�{~�Њ�t 죤�mCϑ)��S hQ;�Jw��)<�ۘ}��]V�s�HO��2W�t��i)�F�ҝ#���"T�X�{~ʡ
�K���*�9rGixG�k�U�sdz,��I��ҝ!C���WS�X�;G�x���^��w]�Α]��%�`�X�r~ʡj�Jo�c���z�(���ލ�J��w��*������sE�{���:����:�)�A2��X�;G��e7/�U�ҝ#W�w+8�ҝ#�	�\aN�J��T�ձT�]����귕�y���Ai'-b/+�rC���p"���t��6��Q�z�U�sd7q��~U�ҝ#STp̖Q�X�{~��E�eǐ�&�Jw�\�gW�'��Jw�L�t�n������ҝ#S�ֶ
m�<��Jw��(�ӻKאۆ>?�Q��	�@�F�ҝ#ӫp�쁤�ҝ#�i�G]�Y_��Jw�L����Xj��U�sd���.]�� V�Α�P]��f��V�秤�S>_�t��,V�Α�������4u[�Α)�5;�n��U�3dD-~
�]�ҝ#[�.�0A��=?�Q���hZ�t���`a�֗X�8G�� ^�3M��q����9�+�ȴ��}��+�ȸ�/�n�Q����S�5��7�^+�ȳ�p�t_����n�=v��K�e�8G6�0���Z���9��J���,��q�L�_~�%�be��)隑ά�I%�"V6Α)0�v�O�/��92�On�_���q���0�ApE�l�#C�������9��*��G�k����t�y�~5� V6ΑmR�m˰�be�٭os�OJ/�e�9$�wW�q0�l�#c�J/yX'V6Α)~�s��\E�l�<%]�b���:�u��q�LOd���X��/�-j�TC0S��be���vI<����e��=�=�x��*re���/�rZ�����s�T�+^�be�9��ئ�J/We���6�v��$Ƹ,���i}��+/��<2��ш��sdJ܂�����q�l4&M�x&��*�����k�@'��+��/���l����o��s��{�H��7�7�R��X�j�S�l�#��^���۲������·N�Qܖ�s��T;��Z�l�#W��F+���sd���\�X�8G^��詃�e��R�VTt�-/�l*��8w�Ibe��Yhw4����9�o���6�8��q�	���C�X��q���M)��A7�۲��%Rċ`&��q��=E4����m�8G�I�-�XVn�t��>%����X�8Cv&+v������K~"S����:�+�Ⱦ�����N�G]��s�h���THU�l�#��c��X�8G�vl_��l���9r���KK=є\����D�A%��d$�m�8GC���'V6ΑWT��(9��-g��F�,¢z0��#�uu�vR5�I�'rlЎ#�,N�����r��X3A���LM�c�s�R5�/��)���W�R5�/��Q]�+0H�`'m��+��ۺ�#�[�v���_Ȗ�\LMk�$����~!{�"��2R5�/�P�A�+���j�_��*׶�U��2��	J�r���N�)�
��A������~!SD���9%��2�w��aS�T�yv5��;�W�͑�*T���H�`�����R9ؗ/k��~J��K��q��r�x�(: �T�9R.1P��I�`����K�()�I�`�����J;�}W��B�o:w�e�줟ڢ�)�i���D���D�����Y���Z�o�p9�
tY�͑�A����2e�iOM�=H�`��}Q΢�o�]�;駶(EO���|2R����ac���T��D�.�nR��/�
�{�5���|� ���\��#5���>c"k���\�����mx{qW�Y)��!����j�_��}ƨ�G���N��BK��8[��R5�9�����mOt�w5�/d;	r7��B5�/d���݊0J�`���Ti�p��C|Y��BNQu�*�LU�;�p>@�>�y��r-�tHmÁ����L��ٝ@�Aϝ���j�=�3[���r�6:3�J�`s�H?Є%U���S8WlP�c7�H�`���P!�Q��U����
��M�ON���2���?�$U��BΑ�\�e��T��F�B9�T6�YOdziB�Q����/d:�k�M�S���~!/���Q��R5��ꊝ���e��Z0�@�'T��B�^'�� �J�`�x"��n�����~!C�X���ۂf���J�"p�(V�̑�	k��"V�̑��w��v��f�ܗ���R��
�9�	�A�SlS�d���F!gr�W�>%U�̑)(��	�Z�XA3GvY���i�!V�̑�߻E�r�9vڕ�n�b�
��S��(�+1�(p�����#��a&8��+h��-�9��b+V�̑�qe)m�XA3G��=��i��f��;� +)�D�Y�̑ѯ��Ɲ�;�,h6Oybw^U�m�Q��˂f�L�@�N�,V�̑)d    tۘ��\A3G���XT��A'�ۂf�\�-��b��@�ۚ��
��S��{R��
՟TA3G�������
�9���{���L8wU�̐��)��G��4sd�Q(B����f��J{���F���<ur#4�a���x��f������mM���#��Qj����!��9�h���`��m��y*���*nϢ>�����B儅�mA��;,e!w�2���w��):���`�O])SS���8���
�9�D��ˊ4sd7T�=|�YlS�r@
�Cl�"V�̑��6���%V�l�¹���TN��������
�92=����L-���y8e��?�R�
�򢗮�-:9J.��S��v��Yq$��f��'eo��$��
�9r�jA�� y�*h�ȴ���×��*���@�n�%�4���k5�\����o�9r�7��9�
�9��jA:��A��ۂ�'���l<�-�.V�̑�9�xs`��-h��t�x�e�Q����'�_ʚ2����ҧ�M���n0��9[ew_���XA3GF�8q�z��
�92������ڋ4s�Ur[zp��4[�D��~�4S n��9�J��*G;Ū��ѓ\��I�:�#�@[2"��Xu0GvC���9'V̑�:�7S�:�#��qShK2媃�}"c�=�F��`�\��;ʍWT�����H�x�[�b��yЙ�e���Us��3P���U3d�(l�p���:غ'���?���C������/�O����`�L4���ԁc��:�#S��>�B��`��'e�u4�Xu0G��6ㆣe�Ī��"H�?u�%V̑GU7R�L����˩��	��*V̐��h���$þ���6қ7 �XZ�:�#�
?��E�:؆'2N?T�J	]�:�#S�V�ۣ!�Xu0G���R��b���N��g�f�Ū�9r[�Y�����Us���DM.���񉼼�h��k�b���롬E+���O�L���<�|�0c��߫�do��_�!)���!����;~�M�������J�����o.��`���v�zG/��9r��-�C�:ئ'2�ܺ���On�c�LAG��������bwac��o��9�Ȫ��%�C�:�#S`���1�U3�@O��z[�A���`����8��QNN�:�#���C
��G���98���,�`&�mu0G�H=�)V̑1��`(��S�:�#B�r��&Vl���@'U�}Jp)U̑iCrHs<�s[̑'=����s�U3�#�yH�IUs��%����`��(���8�%V������&Y�:�#G:P&.��mw̑)�n�.ӥ��92\}O�6�UsdZ�[�]��b���)����:�|��F	������Pٶ����2䤡�S�Y�Ԗ#㺵�n�e���rdJR�Q��ߖ�r�aa7�Y���=�s)5��]{Q�Ԗ#�<�;��,Vjˑk�7�}x�R[���)c�A�Ԗ#���(�Ľ-����v���i4�-�uO�\�c�~HT��F���٢4����)Vjˑ)�a���+��ȡ���{$�X�-GNG ��b��9S�k��i���=�s�R�P�s�����y^yZ+VjˑGRv��V�X�-G�tf��`j�m�-C.�&f���Jm92}F���+��Ș45c������=�~%x���+��ȱ+���$/�/GƤ���~�nKm92�o���&���rd�C����Z+���}������~Yj랢�B�&n��/�_��2dH�lA�t'��*G6��Ạ�z��\6���R��w(�.�|�p?�F�;����h-���Jq��A�2�ޖ�rd����ҕ�X�-G�	�`�m+�uO�_��F�MP�1���rd���[դ�Jm9r3*u�~H��Jm921l}T�'k��Ԗ#O��Q2�\�-G��4Ae[�b����k�!ىvF�Ԗ#�Y嶊z�R[��rϦ��y.Km9r��#�R[����-�{�"Vjˑ�T�'\���-�uO�_���ᾧ�6�Jm9r�K��o�bnKm2�<F�g�zTޖ�rd[��>�мX��
�w*↸�6�Jm9rhj�v)�b�Jm92�	����F�9w����m�-G�(7.���ሕ�rd:@f 5;�X��
���c�(F�H��r�e�؃+t�b��y�<�6M����[��{>�n��䶈��g-j<��խr�@�ܮ
����[�O�ܠ"ڭv8�hrY�ʑs��@����V92�$Bu�%�u���`��X�*G��v���;��U�<+���v��խ��pn�@Av�/�?A�U�l���G��U��"d���&V�ʑ�U�H�͊խr�L�Ic�˺U�����y�r0��n�?Uh�~��Q0�w%�u���뷃�X�*GVل��8Q�\֭r��T�{k*A�n�!/:�L�g�	֭rd3ik�\�[�O�r|��/��U�L�_t8��`�*G�Mi�J?�Op[�ʑ�_W�5��V92%����C�n�#�)`Q��_Iխ��j[	���T�X�*G���NhU�����V��Vk�'4n�Q��F�ȆP�J��������������wX��s�)��
�����!��L�U�od�8��@��u�[��!)�c�ăR�mݪOO�d?'Y�k�խr�L�pC�N�;�u��:���N5��V9rkjlO�U�n�#��n^�O�s�u�yR>�w�j�Xݪ�Ь�Q���JU�n�#�I�TM�W��U�L[������V9��@�m�	S�n�#ǌ������u��r����u�!V���yЖ�d��-b2���z�խrdK4�cM+bu�A?�}�8e��V92e�ʝ��[��	y��D�pY�ʑ�I۩�z�]խr�Z��{R�+bu��;�!�lj�[扌�Xo��A��ۺU��<mr�U�#�խ2d^�}_Z�-b9�*~f�{#V�ʑ�T��+�ȁ���1�)V��b��5��Ċ@9r���E���o�@92!U\�P�fŊ@92Eţ,�u+��Өdv���Ċ@�{"�����RE�ٛ@i�f�"P�l)A�K�Љ�rd���v9��Ŋ@92��yW�N2��"P�L�_q�/�VŊ@�"���w�bE���'vV�X(G�BF /�Ŋ@9�W�x��+��+)�������Qnu;dtrE�!<�m��׸��2|[ʑ)��k�	�+��D�c�l�X(GN#-�c߈�r�L�|D0�{+��5~\��4��,O�*;�f[+��#��g ��2�m(G��8����D�|Yʐ��j��NѦ��rdz�t�]�:szY�Ǒ]Q�O3�V>f�a��כ���}�/�U�ϩ޺��NO|����8�+婏��)�����.�@9r���*A�N��#�v�W+�ȴ,��zЌ��#S�^�.�(w.�@9�h�ㆸ䃲�mhx�"mM�y���o�@rҸ�@��$Vʑm@UmK7�X(Gv�>�?Ċ@92�C�c�KE��#�I6Z��!�y)GΙ>;ƌE�4<�~�Uw�t_�X(G�m?Y�)���"P�Low��r2��#�FAX>�s]�D�ګ2�ڨ'O���!�¿'�y3Ŋ@�S�]��j1C��rd���u���X(G��i�����K92m�кZ+�����	f��"����iU��'FJ�2䢗Jx�jhrE���m��V�4>%]%d5�έ(VQɑ�Q~����$ﺢ�#�)�P�l�@�~[Qɑ'�_{�͉tජ2>�F�R��v�E��J�\M��baiN���#;G/h�����J�L/{��CY��UTr��UB��\�����Q�	/y	b��)6�<�h�A���#Sl�2��**9214�ΓV���NŽ�Z��**r�V��/�����O�N��Z4c
·�����o�\�����/7��\�VTrddl0f�8�XE%G����O������@P�v��^�XE%GE���������#/�"����r���d�]�+��)D��J�L���I�)VQɑ����tu�)VQ�z�F�uo�kْ���|'�or\�HJs�[��    %������#3��{��=~��f2�۾���73��fKUTrd�w��o����~���+V'Ǒ[R��t����È�j��z���|}��H�Z��P�;^���T�I���2�)����q��)�@o�%H���mE%C�<�\^`��J�l��c���U���#;�w����**9r�(S�g��XE%G����`}2����2>�����XE%G�[I۱�6V���#�J����ǧXE%C�d"���~�UT���a���΅uS�**92ʽ�� ��**92FO�XL�I���#ӛ��XE%G.C4���v����Ԕ`�T̻��/��J�<��;|��� E%G&�GCҕ���z[Qɐ!Jܝ@Kr�jrd�6A[��XEez�`V@8b�v�)����Ȱ��ۊJ'VQɑs��p.̣�������	�M?�XE%G&?m�=�$9��J�L���-b�b��)�Ys*��G�U�<�Lv�v��K�.V�ȑ]M��̹��'rdGW*�=Yw�S�9r0��iN���9�OR�&g���"g�k��j]�<�#�C�eٝ��\�'rd2�j���+O�Ƚ+�k������D����b���Xybz(w���$�CsY�<�#��b�2��9r��6F�^�<�#����֐+O��hݽ&#ʕ'��D���y�$�<�#��E4��-O���(�v˫�^h��yѧy��nC�<�![cT_��%���9��#�T��b�)=��Vkw��g���92y%������D�bo�֜Xy"G.UقxeK�<�#�&����b�����b]%����D^K�}r�;�ə�����c���D����f����l�cqEw��NevX?M�3v
����s+O��nЙ�Em��_�'rd��h?�[*b�9N��v�i���Sy"��dze�&V�ȑ�:<���m�ȑ�/G��i��9�jaZV�+��'rd�?=Vy��-OdȞ~D�*��+O���lɴ��9/��D��qyWmx��D���J���Y�<�#�9�{9����,O��L J��R+O��#�97�/�܆�3�$�Xy"C{��ƞXr����e�;h���9�#����AS����l�����f��?��9r�W`���tb�9[z���l��92�O>�~'#�/�9rs���>	x[�ȑ{W��=ދ�'��(̤� �3���92��)!�g��V�9���!����m�G�N��(*ok�8�G>z���;ܙ#G�@�d�������B.l{��X'V�Ǒ�%�&ok�8r�����)b�~�.��)�98-V�Ǒl|�<�����q��闄�$�)V뗟����2��߼Y��~�<��Y�m�(V�Ǒ�{�w3^�֏#�L����X�G.N���y����>*�N�߬V�֏#�����*w�3G^Q���6A�֏!�����ur[rd��J��/w�s~��r$�(�&�!V�Ǒ=�@�����qdH)bٮ�����t/�B�'���Z?�ܽZ�^.ӊ����%��"b�-u#V�őW���s�*�@q�L2���/���~���U[-��������8���:���R]z�r�b�~�\͵��-��J�8���*�
��T�G&����f�J��SkT�Ti+��A��ԏ#7��N[!��J�8roh9�7ߖ�q������5���qdzJ�����wY�W��j��h�U˨b�~�:�	�۠�J�82�Qv�3C�ԏ#G2F�im�-��ȉ���q�S�ԏ#�����S�ԯ<�Q&'�t�p�:��ԏ#��f��E�ԏ!7���*���J�8�����v� �-�+O�N�R&<��@�|[�ǑCS	��k�Z�ԏ#��V� z�;ۙ#gr2�V�~�-����>t�̳v�R?��:�o�+���J��S��m�-1Y�ԏ#�]���I�b�~�k��7�YU�n�#[�&��y"�����Ȯ��Ι%V7Ǒ�U>�H���͕�p�c�4qc�Z���8r��Mr�rus��<�~0��n�#wrW;�&�$V7Ǒ�2pOP��bus�)���4�ȭ��ǑMVk�.mֈ��qdg�Cҿ꓁��us��lw��>���8r
�!�R��bus��m�,s�o���Sk4��}O�;�˗us�v�q[�v0��n�#�S�D�:��ˑ�T����2n���4�#�i����n�<�F�����D���8�/8�0�j�n��8r4j��]�U�n�#':�[�Ђ\�G.Vžs%.���q��>M���N��#ӛej�1�q-Z�������g��Jf_��j��~sU�
x}A7�B.d����-��(y��)<�k���q�UiO�+A�n�!/;�E��VO��us98l�ݏ�X�\yj�0++즚'�u�us�[[��8�zzY7Ǒ!CyA�U�_���6i�qּ��n�#�o��̓��usd�M�4	*�7������-��|�yPZ~Y7�B��=�;���2�M�����{!�լ;�n�:������L��&�~�&U7�Bn���`x)�us/d2/V���`�N�}!c�F������8��s�,֦t-U7��}"�w\У����^Ȟ|�����/��^���4V�:�m��B��~qY��˺�2��c]�n�\��H��6Rus/�Q�IhFӔ����=��U>#Q�X�G���� W�KK����U9���6o{!h��V��REh/d�����N�;wEhY�'2��d]`��/��^��]Mg-U��B&�qa P�gR��"�r�j��j'���"�r�?�D��`��e�y5�V�-��D^Ke��b�*B��ΐCQv���"��C�|4��&�e�ٓC�v/� vP�9ni����,B{!����MW�TZ��\�2��ur�,B{!ת��l�襊�^��)]\K��<��u��e\������yJ�qd2�@�i�"�2]m@u�K��6x"��3�����6o{!��B�mE�=�^�q�Z��o�R+-��"��WHm+��7�0��UO�` I�0��gl�v(o�I��!�~�r;�5��D���y��I���G$��X�y�O�Z�U�V�tB�+,�(vN��,�E�� qY��Bv���܊T�9���;Ɩ��в~��B�t/C��\�+Bc�t�B�#Y��+Bc�d�T,P����1d��^����1�Q��ڻ&W�f������@�g�WEh9�ǭ��+��Ȼ,B���)�a��2Ŋ�8�khn����bEh98��;�qP[�Ƒɑ�͍�bEh�)��13l��Yb����ɑ��3�u��q�Av�&���m/�eT�A���XC��qc䘭X�y�В��ɹe�V��#��2v`�=��q�`���OËUtq�XU��䥭XEG�C�a����Vtqd2���ŷ!V�ő�.�0�Kl[�l�R���bm (вXEG�AՉs�ضb/�E��[��Z�*�r6�>��բXEG�Si���t/V�ő}Tf��bjb]�)�ˁ�'�m��^���#����;��,�����Pe�݆�@i{[�ő��4;�N�.^Vtqd���A5��]yT�枙��*��S�W"�dϙ:i�wY�Ő]H�APi���Vtqd�U�}�zHb]��6�d��A���#ӾK���Ķ{!'���X�Z���<us%�m���kX�B�\=����J?�N�����}?{Y���
tO�ݱRSq�;^��j��L?d��q�v��� V�őGS�b�b]�~��A%{��.�L]�s[�C���<�~��(
�+��o+�82�&sZK:�sY�ős�+��J�!V�ő��lě�\E�y*�*��͵҆XEGFy�K��XEG^m�Q�v�ϸ��bȍ�����T���#[dj2Sn[1���gmڑ�䶢�)Bk�(�����R����!��$
�t��.�\���$W�Ők�͗�Wb�*�2��%hWƐ��bȃ0&��!vg�OZ[Nl�jϐ�*�rט���3�o+�8�u���*K���#���r��]9D���b]9NU�'�&���}��:ٍ~wv0��Utq��J�ܖXyG�C��-M��(���h�������(��GaR�)�+���ʣ82Ѧ    �6>O��(����ߩ�h�ʣ829R��܉1b�Q9ћ��E�ݖGq�bU�]�Zb�Q��Eg�v�?�<�>]�n��֮��(�<0��8�3�-���+���tr^1䩗2P'�XyG&���8l���ʣ82�v��;U�<�>]3p�=(��-��ȉ�i�s�B+������@n3�+�����9�C/ˋ�Gq��Uvx���b�Q��� �SW^b�Q���Zz�S�צ���l�o;^��YP�^��{��1/ˣ^_!���W�F���qw��>#���l�>4����<�#��p�v�b�Q9���`�Xy�}ʣV�s�]�:��(�\�j�%Vő�!ƍ5Z�<�#���n_�+������?�6��'rК�8���n��(��ȶ�3�%W�ʣ8�'C�I�<�#��B��+���)�21^(9#Vő�T���.�,���5��;2�v��G��D&ϳ/x)�d��eyGI�6Mp�+�<�r�û1r^1d�R�f#Vő���2��+�b�.��}�r���<�<���,�@��\yC&�+a�E.�ȕG1�TBR-�a�ʣr5�ϝ�>�ktUŐ[Q�#y�l���(�L�xr8�:��(���s�q/OW�j��Ց���K�ֈ#��g �i9%�Z#��v�\��5�ȴ�]š��O�ֈ#��[��0�X��3OdXy�.*��qdz�:L�z����ֈ#ӊ�Oc��ֈ#�e� Bk���ֈ#Ϯ
�~5O�����d�9ܦy�m����.��?͍�X�G&�v�]���X�G&�����,Vkđ�ri\s���ֈ#�5��ދ�9�D��1v�s-r�F��_�\;h�}[kđ�%ZH���;\�#��S��Jr��1do�/ݜ�r;�pdz�֞�O�3�Î��&.�j�e����+��'���{�_�qdG�f÷y�o��Q����	II*b�F9��_�t�`��m�GF�.�Y��q䒔�D�t�5�Ȉ� �͉n�ֈ#�ھE�Q��ȅ'�t��װG�Z#��T�F�s9A��5b�����wң�ֈ#Ӄ��o.3w�Z#���GZu�b�F9L��a,=�j��S7ȷ�&��j�82�պ!���5�ȵ��q�B�;\�#w�����j�8�h���q� Vkđ��[��C��j��S7Ƀ{�^*N�ֈ#�gk3bU�F�Z#�LNj�}@�ub�F9`��A3��qd��,�����5��92Tm���F��(]Ӷ1�X�GnEy����X�Gx��n��j��$�4Z�N�p牜�2h	�3�,�aȦ*7w�5�����,2�ɕ�:����/���G�U�
wr���zV�r�;9h�����+�a�%��s��
w2^���@�U�p�!wt�)�ߜ+��O���ݸ��Ob�;y%Z��EhU�p�!#�����J�pd�UB+��+���~�1��Z��p�P0�gO)�b�;�)�C �8�.z����=>�~6-���L�Wܫ����pd,PE�1|�^�.���=m������cp�I���Ow���U�֮�l��p�?Պ������=��;/d�:~�|R*s}�<����;����pd���ҿ*w�GvCYT�n�X�G&K�!䚗�b�;9��H����
w8rjشK�X�jBa��<��b��pd�<{�mŬ+���y%��&G���<���V'�,V�Ð�6��vի��pdC�lC���(V�Ñ����SRz������������3�\�G&?�n�sT�����*0�?�1.w8r	jAZGb�;�|��
v��&AyL�=��6[���T� 2���7�,���!�*�A�b�;�)B#\�,vR�k������&~:�qY�ÑkD?V����p�#�ui�lu�"V�Ñ�y��xur�;���'V�6_�X�G�U�-[M��U�pd�w��4U�bU0945`e?�����e�[~d���82��P�ګ�QY�)�굡)�=�n�`8rw� ���ZbU0yM@�W:��V�p��G�3G������D�-WÐ-��a�ACRU0OyԠ+��۴�׻��a�1�u�\^�,�L{��n��b��
�!��V%�|V-WÐ�<��u��XLxj�1�ۣ�.VÑ�Tn��g�bU0yZ�D�_��������v�U�U���#���C����1�E9ĝ2"9wU0���0�G�؅�q_������*�DkF�L5��V�0F��U�
�#ӃR͎�n_Ñ�Rj������
��V�
�#�B����*���Sf�]U�
&<�;�Lհ'�N�
�#�4l�_5Ī`82���Q�lbU09&�CaB��/�`8rZ�mIvqrU0�))Y� h�v�������);v���"��*��]�m�;*�#O�~�ѯbU0y���s'᤼�
�5��ϡi��U��DF[���N�
�#���hFa�XG�`���GrU09������`&�mG.n^����U0�6�ܟt�V�
&�'rt�=ZN�,�<��8�VN�]V�p�U�Z���aȆ��+�F/WÑ���QMsb%%�r�c,�XI	G� �]m�$CuYR��l[۷��d&�eI	G���/$��A��ے���6Ŝ�Ҍ��*yX��>�m�'�	чq�|YR���y��\��U���#$����!���pdD>!3���m�i�_�y���p�Hn֦�U�JJ82"��ˮ�-��������(r5Z���!c.zږ|PLw]Rs���b�JJ2ٶz`�WIr%%OdG?bG�+���\� CF�D>�=��D��Pv|��ے�¾BW-�+�G~�/�I	C�FŤw9Q��*����!Nw%%�n總�x������!��H�7��\I	C�V-�<
�^��0dZ�qh�.r%%�'U�`��5�.)���<�2h�T����ے���J��k4�����t��{���񶤄#���O�A���pd�Y�ʁ˒�h���*��X�3�UI	GF�6F.Qnc�L��ǝW�Y���##u��8ΰ�JJ8r'�f���vr%%�LF����mII�O���݃o�+)a�A�������-)��6`���f�JJ8�*��t	��%%9�j����%w[R�T�c��;ȝܖ�p�����	b%%�)�#�GY�~��6�����ߑ53�JJ82��yϝ�C���#�ӓJc�Yb�y��/Q�b��4z�a����m}F|J���tc *�]���Ș�{�N7��382�*�-�V�>�#�A��'�3��38r	�����gpd������������Ş1���nSA��<��;�0�X}G^d7?�˾��`ȉ@wǝ�����gpdK�)�S��X}G�����A��m}F|J��,PS�>�#'O��s�_׀^�gp�<��a��g�iw�\�rh�UF*g^	�Tk�
�/�3^_!}m��C��;^u��ᾎ�~�F!���e���<���Y�Lb��)�Ltt�������g0�l�@���]���L�?7F���������MZ�>�)������EӔ��`ȕhv3�Y�\}C�~N�Y�y���<�Ҹ1r���O�B�9�mU�r�OEW���1��z0���>�!;E������3rp���e�K�>�!�;�v�x�(W����S�ÿ'����L��<�Fc��g���4�-)	I�>�#��\�[�8��38�th�.����&�[�8�X}C�&�����;��#��Sqh
�kR�ٗ�8�?��3�S7W�%�Ƨ?Y��������0�g�b��|��a!�tx����������E�؁#���5v`=��;p�A;p7"�ވ;�����\r?S\;0䦇J8~�E�b���^�|���؁#���G���Ċ8rd-"I�B+v�����X%Y�b���5�V׀;�b�\�r�L�uN�b��ʧ�\c�n�82�'\��F#V���'��N���m�C��χ���u�e�Cz�к!����4�u�Gv^9��3�&6�͑�����rҊi���jo�G�������n���/ŝ�z0�q5�l�(r@i��V�؁#N".��Ċ82y��2�t    ��M�S��{�W&�?�z[����Q>�7.+V���W����Ig��b�<ȣ �w�d�b���k�j����U�G�h�����o��S�6RV����(V���}�84'�7.�82�c�ܪ�S�؁#w���#D�b�<����g�W�驛ˡ�v�b�y���{m�X�G�>����#��6eV�b����J���92��i���)�àH�v���mF���$#a�~�d�؁!cߡ��`ʥX�C�Ky�K�~i�b�<�b��$Hn3
�L�b0>��r�O��2Mٺ�.v/W����C3}�H��6	��3�����*rt��X�`� CNM��G�$W9���S	��I���ʁ��ͭ��y{%I�r�#��V�d��I�ȣ���c�C�r�#/O�p��;�≜�茾[J���l�6K��.ط��-�0ɶ:�ʁl�ȡ(�<���*8r"�؀�j�m8r.�g͎�+8�*�}/�.6!�"�dLQn��Z*?�� w��0b���_�N�چz��4�Ν�:y�:m3��(a�w�����e�@vO䴓�h��X� G&�99�3�mb����[-r�$p�T���b�y,��@k��ȋ~΄����o+�C��,}Fj~�7Ib��f$�p�B��ȁ�Y��s� V9���U���+b���&�e�X�@O�^�Ť�\j���Ӫ�l��R���/��F�$A|Y9�������K���m� G&����� �[9���G2pq��+b�������MD���ȉ&=�6厱��y�1�W9���L�f�U��*8�dA�r��鉼�r1�p ܹ�`Ȟ<��Hh-�Updk��c��AN��r�#��::	�\�*8r0j���/��
8r�h�7�`���4|�O�씙HҸ�Ħ�92��:t[��^n�!7�lr�^n�!���G���%7ϐ���l�����t�P������`R0�S�Z�A��ix��ȃ@���)����ް����4<C�I��H����2�a�
�^��rI�\!���V�z�<%%��cz1Vnz���ӌi7�ևƧU���H�y9��
����6ݾ�~vǫ���6G���l�C�+�����k������ix�MD�1��u�M�sd��ȿG�k�i��KE:tCPs(r�92��#ᒫ'O��4<G�t;�Gȗ����2n�b��4<G�q`���𗧢+ΤlG�`?�N�3��ʁju���Ȇ�_�>�y���A,�;V�%6ϑ}Q~7?�E���9Z��q����4|y*�R�*��Q%�Bl�#�@v���K#6ϑ렵A>��깜�����{)��,6ϑǤ��2Yl�!g�ኻŴ��/OZރqQA�F���Ȯ��+W.����(߷����4<G���mm�j�ix�LW�p|�F��/OZ�+Uc�M[��o��9r�*�����xA9m��1�m[�k��i3d$ivN��2��92=�	�:Oڥ_�i������A3]��929=�hL���ș�Zm��mJϑqY��71�--�ȴ��N&o\�i��<�zJ�N�7EnSz�<�g�xڈ�i3�J&���SnN�#�I{bGf���f����2prK�9��*�j��Zr�����vN�)���X���oX~%�͑�u!IS�܍1�(�T��2� �Ȼv/���#���Cd-�.7�͐�U�J�/��f�}~�eX�9m�<ѱr�0��~��G{\�k��i3dr��.z�>��i3dg>3�Z?�y=�͐=�q���ܜ6C&w�M��g=��rjJCcX]rs��^��n�-I�i���D��m�΃����y�R�XaA�9���	���K�i��i;��1R�����$����9�����N��C�v]��_Ⱦ�w�� �)��^?�;��٥�_���Uh�k1KjN��L��H�]-EjN����#Z~4c�Ԝv�OEW��U*�Rs�/d������%5��B^�>��
IjN�#2#�6����/d[>3!�5^j����sh�{`|^N���0/p�Z;���m����Sd��������/�*5A�BF����Mj������qGZ�� ~!�H�>褯���y���]��R�E?usS��AQZ�z��	�2�~v7oKN�������ݻ�L�y�2�&��9���Y0^^IMw����B�;�ǲsǫ����)��?d�d��A��b��<��YΘ��r�R�/�n�\��;���<��ų���~9A�B^���q��� ��K7500w�&�_�6�^F�x�4��� .�)�\���I����y����IM��Ӥm�����&�_ȴ���E[�� ~!7����gR�E?Պ�e�l�8��1C�Au�ߺ"7A̐נm��G�'6A�@���OuOi'���1C�Sٶ���(7A̐�}�{"��An�8?�â_y�q��� f�)��a2�Y�&�ru��B�'�	b�ܫr�`�ҋ�1C�Ġ�s�M�	⇢+M~���|��&��%����9�	b���ެVƐ� f��K�-��M��'�rj�捼R[�[�~"�un�jܭ,6�ʑ.9��8�Vp;�ʑG#��q�@�x;�ʑ�Wm�Pks�ng[�����,��t1���Ql��##6��gz��l+G��̫�h�ng[�}"���Kl9��n��{�PJj��!;�?��Ϧ�^M�qd:/[P�g�g6�b1]�i�.g[__�)c�'��D�2���c�,��?e��Gݷk1Fl�ո'2�����4��l+Gδ@���TĖ㾐1gO/h~�Ͷr�}Ɩ���V��i�=�<�-�}!OZ ��Kor���?�Q��lb�q9�7Ait��>/��V�l��{v�-]l��#��ܡ��m��a�ew�Uk��V���G;�V��m5�\���>��,6�ʑ!B�]���b����@<�:�m1�B&�^{|�Jr��s[�����meȁ�ӫ��)����&>��U����(7�ʑ]�X$�3V�m��c�w�v;���L�a�K�t_��m���nˠ�(7�ʑ�JM���p���V�L�H�0��A��v��<�;�.�-n~X��V�<�Z=m�)7u�D�d�OU�rS��Te`4�a�.��*tD>��rS��Nw�a^��rS�O�Q�$�dl�`&���%CF���h��^���dȅ�C���BQ�\��;uY�.rw�|�A_��u?uɐq�������<
*f��_\���H5�����%�
E�]�چ�������$.���6J2^Ű���.24����m��d�ޓ��w	����dȠ���y_�.r��Xd��A��۩K���%zl��*�ڐ����իav������%G���&y��K�Lo^�xJRsbS�yY2}�;�Vn�(Cκ)����5Ŧ.�S`�m�t�)v:��c&D��V����hF��em���ȴz͜ն^M]rdz�v���Ħ.92= 7F^I�S���N̍�ٰ�j'�3.�.9��|��Cl�#�]��:�=~;uɐ��c8u�Yn�(G&o���A���%G�Ǖ<b���ڧ:��D�@YKl�#��0�&Ǔ�ؗS��dew�(�`n�.92}��#u�bS����Ѷ������&>(�y@�T'����|����d�U�m
�{IVn	#GF�.4�q��rd:y1᜛(�a,Gv>|�&v��9evS�xRZ~9h���J�D�W�(Ql�#W�+�P���4�ܚ�X�b�;|�XX����ߟ�|}��4�Nڊ�$�q��N�Ť�U����(#�k�U6}��rdH�ѳ����W��izb�.�-a�O�e�F�	�Ƹ$6ȑ�v0<j�Mn�!��G%G���2d�\ͧHMr�9�~�;uY��r_�h��En�)�l3+���Ô�|"wZkv��j�y@�l�
�:̶��2d�Mm��p]n�)��|@�o�����r4t%������2]m-8T�q\�2�Bf�+�9͐�dȵ*��S�;Q�#�뗶X�Y�c�S�����q��Q��Od��-B[���2d��vQ�Z����dc ��    ���d�t��=Q�N#7Ȑ�͊n���Zl�=Eh�~N�p5��J��y@�Ln�A@>gk��92!�=��b�j�':�i_ElR�#���<�!�M�q�T�P�g�I5��q�.��b�j���aD5|�ClR�#ӵ�;�U�ؤG=����^��T���:՘��\	G�q�������O	�4;�U���T{}zlwƣ�L��#��;]u�=2f��*���=���3
Gs��T�ȘY���+�I5���jz�~�Tc���2ڣ��^���j�� c-�$wr9��:���ӧ�Q�T�ȉ>h��Cn'�82���?6��&�82�؁y5�}A9r�mhq����TsOQښYy�5r�r���E�ceܧ���T��>ެq�m��T�Ⱦ~&qT��Na��1}:;�z=��Tsቌ~�f{0�vR�#W2u�ϙ�ؤG�:1�į6�M�q�A��:?��&�82&$�-�ZlR�=�;��E�)L�pVx5�ƑQ^0����&�8�7j����e�&�8rh���Yb�I5�L��é[�r�j�^es ���TKOdچm'��Aˏ�I5�L��!CUL����#����_f2��v��!���jەjMn��lu�t�*�X�*�lѯy�d1Un��!�Nv'���@Py=C�����ˠ��f�r*��qr��h�@7���e�7�v���H��=���<-�xիJht�q�F�F%� ��¹��bȭ}l�fV���b��+mwX�Z���D�C9L�v6��'��Ay��5��92��8��Y-wrGvA�-19�Zr=CŐ鏸G����z��!G2��%�J������菈��M���8r�L��X	.���uw��a*'6Cő;�2��Z��GS�ݯy� 6CőZ�V��-��E�:t8��/�e_��OED.Ƌ�Pqd�Mn�d�r�?r�nR���Ib3T��{���f�82��N�6�-����\���l�r�?r�V��B�k<%�3T��ݎ����G��ʻ�{>��ng�r����G��T�v��#��|�Mwr˾82@w����t�wOd�N�	I+��G&��l�j;�r;�Ñ���h�@s;�Ñ���ƄFn��?usQ�)���El��#ӛ�׶����ȡ�õ�ծ/9�љpW7X�g�{|`_�^� �5�Ժ��{����Y���K�Faȩ}�7���tG.�L~��R[b�=�v5v�z�Ӿ8���	�.8�Ñ���V���tG^�M�5��b�=���Kz}���K��{82(�Z7�����Nה�{r��c\�g��{2bt~,K���a�9+�ݑ����y��9V=�=�r�=�����6��tC^%�Qxy���<�Z��S�[�Đ�F?�����v��!�1V�;*�M�<�Qt��U~�3��tC�K�]o$�{rLʢ0;��{2���Ɍ-�M�0d���N�����鞧���n����_O�0�U4�cd��{��Š��,ߝ�tC���ܝ��r�82�1Ʈ�5Jrs'�P�%Z�;	O�y��Õo������	GƊ�y&M���\���J�1rs'�e�0loO����})"BSzsZ\W>-���������(m����骏���X�I6�<Q����Al�$<^��
�97��N82��ø�m�͝pd�UB;��m�;���FȥJ�Vl�#c.҂�`�i�Ν�����J�����^l�#�o20ǵ��˹�<�x���;�ȟ��ƨ�(6w�U2��.6w�6������N�S�����a[\Nl�#�՛��n���� ��S	ʝp�L�S�!W#�T�#���P�'	�˹���i�O��]Ν������b=��\Νp�P#���f����}"T�c�n�N8r �!�ا�R��G�lUo;xۚ��	G�d�}����۹�ܓe�h�Al�#�g��;�Q�۹����E���0oMn�CdY��]nG�U���%��&"2��n����r�[Q�������`��dF\�dV��e�L?bn84�����T(�gט��}��~^3���J"�!�o�ǞI�܍kE�&�r�@��Ք 7��Y8���En"�!����6����x"O�=
`�)7����#LU���MD<EihXb���TD�ND0�UD&:��&"r2��d\M%�MD0d��	�25E'7���Q��B9���DC�ӽ���v�Ӿ��x��&����ʽ�MD0�9�~�s��ܞ]y�H/l���DC&Þ��}Σ�DCv��OL~v�{vqdZ���k����OyԊI< m�*6��Ӣ�iP�ܩ2��0��\�IE��DG����} �����ȝnӱ[3�$�����c~��T]�N��OE�ZY-H�[<h{;�D������v0��v"�#����ưf��DG&;&�y'�%�Q}�L�jAc�ZC���I�g��p�U��P�Η����\�Z;���TZjd+.����+�ǽPj^N�2����NW��1��P�!�u4���R�pd� �[�>�ب>G�����y�,6�ϐ�8�o�`�ب>G�����T�F��{"����^YlT�#�.��K��ȑ@��^Nr�8r�*��\;�(���ȴ*�%x��88r��[�綖�F��"��JGȵ� 6�ϑ�U���AYlT�#�1cѳ���F��5���R�^b����i��N��>G��������~O�*���ȝϑk�F�ڜAnT�!���.Ïcʍ�3dZ[���ڦ�~|"��zv�~ ���";h���;+�#��&¨�jr[3q��H��x��3�8�@cB�ܨ~z"�D��5�G�r!���.�\�;Gn��:�
�92���ly�|"{� "����4�����{D��o��3�
d?�-ɞ�{��WB��:�S<����(985<�X��9CN+±����3�B7�gFĒ;��#W�9�NV�+|�剌��m_U'2��!r�<�
�Tb"g�+(7�n�$W�ΐ�t/�5�Qp��![z ��qտ"gȮ���↶�RC�I?�ɞ��`>	x]�s䈒F$�F0bC��nӲ`?��Ć�9r����	�ʝ^���'���'6DΑ{���g�'6DΑgTa����!��Tx��B���9C���ƈ;�%�G&��N��D�.��9r.�9(�07Wj�<=U0�練P�Z�"�ȭ�!~9��9G��x+o�wr;�p����A���̻"g��k\(�v�!������u��nR�C��lۄR�����z��#�	�� ���0"G&���)�����?��sFh����x��+D�v�l7��lw��U-7��C6J�ʴ=c�y��f��~��R9��7���'�}@6��3��7sdb(1�J�9�4�m�F�Cl��#������ofș>h�-~�r�����D�8N��f�L/Հ�^sub������4<�),��f��k�l�.h��f��ݦ�~s5I�73d��A�Z�of�AL<غy��f�LG%��JG���(-���e��N�eȻ�$N^9ʶގ73d[1*p7C�r����	-�$�v;�̐�S�������x�S�Vh����ƛrs*!J���r���7��q2��v��!O�\�/�ts���y5�ѵ����ƛ���X:��kr��OZ��dq��
���f�L�.�ȽN�1�r�.�蠏-�	?�2�,oL��3���/>��m�:��PUG�P���{ޖ?���ǻoYL�S�Ƞ����� �}#'Ho�uF�Fo��h�S��g�|1z�F.��?�!4z�F&G{!���AQ���-!�'2f��e����rӑVyW����72"�+V���-!�'2]r�ac-����^����:�j�72�8�~.���7r��M�qrdFo���+����������0>M��&��ߵ!7��`������$z�&�_��P�l��f�IB��od�T�%��K�޾�C!M�,B��od:�}�����-!�'r�F��	����P:�۴x���7rsd�j�������.Ho]�:��<��;(`���o�E��U��P�y��ֱ���~"[K;��z    �yh�e�n1��}y��P��;x�
�x�=֨;^��B�=ͧ����0����rC�9�B��a��P(G�U��<e'6ʑ�ļM��ņB9rIʣ�eծ��rdz|�o���bC��<��U��Ɋ�r�QTN{b��bC�y��R�ڈ�2�Y	x L�bC��4���!��ĆB9�3*��]��P��J{��8��~9j���^gp�9��+rdځ��Aӊ�+rd�:�E����/�9ru�@�^��b��~Ό1O��(6�ȑ��&c?�ܾW4���uZn\�!/M��சT��9���/�ظ"G&�Ǥ-K;k!{5�ȑ����1�A���"G�g6��)��qE�Lo����K�r�E���W?gs��d/�ym�wm�?7�ȿVR����I�x�ɀ�[}d��)t��v�R�r��chL�Z�J,92kI+Wb�D��$�nq�--7���v(= 2	I�Ē#�Mc�4�pR�{;�Ȑ��(8�d��r����0���2�.��yLp\�!�o�\AMD�r��^�Tv�*8����B�:蓰���"C�.��^Qp\�!O�_�M��ܸ��h��x�J_r�t�T�v�(�)7Hǐa� QBr�t����8���ʮ�V��G�A:���'�ZP�/6Hǐ�WV#yRF��c�谢��;����c�tt�n�Dby;H����e���2��k�p�\ ���'�%c����d��~��rh ��{(� �^�=?�������᎗=��7�m��;����bb��c�t��0t�Sn��!���Z�#f�2����AOy�ҕ'r.d'a�ZjQn��!W���]_��Asd2v}A\q�,7Hǐ�9�OIN9��1�iɴCr,g+7HǐWR񵜖��{";Mo���S����l�r�*ތmb�t���I�1�*b�t�/��<2>/�8r�7��QCnG�8r��ؽ�\YG&c(a�n9�~5�ő+m����&6�e�y����� 6�ő��U"h]�b�tj�3p�P&5�ő-���K?0�oG�8�7*l�s4.����}ڎ���~W�9�6�,�ө({*�N���*��/��VƬ-`����e'��s�?d�d4u��]N�x]�xq�j՘;3�؈GnY�-�<�+^�xqd�0� ��؈�uOd��,�z���rċ#�?'L�1���2�n��Y�!6�ő�S.����b#^���0�|��������٨��/���}YC��zʅC�k�F�r#^�lH]vЧʕ�qd:�n������#^�5��Ags[n��2ٝ>� ]
r�Gy&��D����C^���G�]n��)�Pl z[gLr�G�F�vIҊMn��!��֞ua�>b����1�M���82��Zwīj�A����,������{���#^�a��>m9�i���/�;]�l��o���!;��U��"W0e�*�X�֛�B�Y����C�^��3�*7|ĐGUa��#���ɣ7��Tv��=��j��w��>bȆ���s���8�3d�B��>zjᓏ*���L/W0őCSk�,M�r�G�.`lR
An��!�D�:Ƙ��䆏2Y�W�^����,��������br�t��e���b���4��v7.I��<y95��pR"x;�Dκ���I�
��aȻ}3�j�'����2;��O&bގ�0d��~��fȍ�0���Z؁�h<Eِb{�'�̆�O	��_��q=ÿC�+톃��1��t���wU�m���B[�|v�qrc1��$���%7Ð;]X���T��a�3�1�u�A��XC&/�A�E���qOay!�b4���O�����t�����0ő=@84.��\ϑC°xV-���pd���#O]n�G�VY�CuM'6Ñ���-��z��Ÿ�|�Ԏ�<�O#6Ñ;m�M;��v9���gVtW 9���LG��,$z[�`ȕ�]C焆ؾ��G���-��rG򹧎�҃$���Ŀ���!�x�P�682�e�Ĳi�]y8rʡ�'�~:*��h��v�u��;�沆��mq����8E���S�J�	�N��+2���j��R�7�������|s}����%����nRO�:n6�ȍ��ߦ�+������<O:��l0d�9���L82�Q0ƬD+�u6G���'�Y��y����S��RR}w��En�l���
�#S�v��ȕ�2v��)7�����~��(W����>�I�!�w/G���%��CO�Q��hc�.����#�z��`�Q�l����2��z��Q����:��C��.^3�����@�ݍ��F	�wp*�9J��﹨��'���n#��S��v7_�Qn��!�a3��#7J��K$�ܞ��(�S��Q�S��-w�G���"�[�Zގ0�Պ0�f�܎0�9�Gܸ���w;J�D��T�[�4/7J��M��h�e,�Q�l�rM�zMr�O�� �"��i&ɍ0d�b���^�F	2�w�.NAp��!gC7����܊�LW��-Z��r]n�L6F�ݾGr]n��a���6�\��)�#)�Q)��u�2�z7_��h���yj�"���B���-*����uW�\������j�7��q��N�G6%��Cv
��2�m��r3dgU�c�Clr]n���oKKr+82YG�+9EI����8��Wʘ��&��fȹ�����=h�u��f�ը�v�-�do�����gZ�.��f�})��N����,u[��E+��G^M�]o��q9�Yq�����82Y}�\i��?pd���������9x���,��ȑ�ob�W���q��^�X��#�yP0;�Y#W.�E�ܶV�nXq:{�І��h�����w��wU���⎗��`�/��N�$`��}\b�W�L�~�}B��;�##5`v!��_��Ck�VO[�V����dz�L�$��Ș����Y�v/����4[	�3�\a9GUY��u�$���t��'����|�以����g���������u�˞]6T����ȃ6��;�܊y�L&cA,��,�U�����q��X�:�OdC?�oe���2d�`Lܽ�Z�k�3d����]��򤿄w��r�����wi�A��:��t���x�����Ԋ[��\g�?�cSڞr�2��3Ȑ�Q.��A��A�\�j��嶲�ȵ�K���hc�v21����Kb�A�<3�pS���3�ȋ�4� C]�~�![��:aڕ �d��/�{�M��$g�!��֖j���:�9��wZK��d��W�YE�:��hWă=���>>����y˗��L�\�~1���2C����pcL5�k��C�^�!*�r55}��v��^�Mۅ����1�C��:���L����Q�z-r=�'��My�(A�C�gŐ �c��Y�'�od�¹�����r4���K�ʭ��ȉ�_M�r��q�L+wӍU�zV�hǞ�l��Y1�9�H���L��Y�'2=�}	J�r�7qd���V��۞C^�-��y����ȞvpFϛ��J��-ٍ4�)��d|2d�����*O_F��2��P?���_�{v�;]vo��9�*���#G2"��uS��t����.�Maȴ���Rz��0�UB��F��0��>�ڛ�j��P�T'���� ��&ѡ��"��G�D���gi��n
G�Կ_�V�q�U�mZ��6�96�""^!k�n
G��Ϭ�;?'<%�����\�j@�\�РR�c���ȫj�&��w�d=���${��7Ʋ�~��
N�Y������od�A5TZW�;�l=�x�NRm�2�aЩ�Ƴ�7m�r4�ÅH�Rm�rB��-G:��޴��qOdD��tR�q׀~!W��H�� Հ~!72�b��s��ix!/Ze< -�)Հ�ȍ�e����X�(��Od���m@;�q�2���n,�x'Հ~!K�����eژ�D���5꒕k1�5�Fú�:|J��1�4���w���#�6�����e�ګ���̟�S��*�HGmN�͐ɓ�ў1Z���d�f��k�C�͐�@�� �  �Y���4C�tW5��W�r�Q�L���%W��q�/�>��������(CƜA�ˈY�5���+)un��˵F��hhb?����Z�z4t�vV��(CvY�=P'�A:��<��J	�6�P�ū.�5ʿC$Crw�?�C���$w���A�\��?d��IV]�yF�i����-���"شc�%+;Px�j�k�1����o���*�6�r7�!�S�rM;�<?d��rM;�L�<��(�S�iǐ�+y��E�i��#�I6M�֨ւ��AtG*��W�uӎ!��2Qۊ��!�Y�ܛ=|��j8�5���F��Z{&�8K��w��t�B\�RL?d����
T�\;�!gZ�Z�s�(�Nb�x��ΈwK���~"׉�K;�!V��B�N�-��ZlK������;Ӎ^��8��j�ƚb�$����
~����W/d��؁�ȵ�8�m�M�ׯE��Gv��^�b����7>cߊ�_��v�}�2�7h�HߡY�=/��rP	\�܄,Gx����e�5:82�vF�F�r��MmG�L�*0�L��>�+G�kt0�:TZx}tr��ܳJ׫V�����vh��5�F��ԹSlV�ʔkt0d����ˍ��b���Ы��p�d�]�]���s��D�#�E����_!(�0;���zWz甍�?���x�[^K����i3��jaɵ9r2j@8Sc�rm�D�� h�r���DepO�R�\��!�J�>�3.��`ȭ� K��jӻ6C&�$��U�E�����T��K���^����
���Q����5N#�Co�;]��U��)�6�/� �K�����s��!Cv�Ӣ�ޖ%�9dȾ�!�s��2�ДE)EYg�w�C��
�h7r��9-U�~�\}G.Fռ����!C�V���ծS�k��tՐ���0��@[r!��÷�-_y92���1��;�܍J{V�r�wy��tt/�ma�3���	&#�maȫ��v�����1d�1��+���}[���,l�{sr��L��B��<�rv��6t��z����;ez��u�=�W����!;��^��~�-��k�5C�Q�=��%��fȩ��w����1�<�c�.ɽ�2-K��y6I�E͐鈯���8l�T�k��{/�f�(A�m��[���nQ��M����[���ݟ�Y���z���층-jo��z�F��n5b��[�!{��<t��G��CFXi`�R����-U�)��}d���m�Ģ��+�+�G�t��]))�
aș,j�K���{�0dz�;�s=z߽B29XEy.��82]4Ն�JI2_ ߭���B������7U1_!#�)��{��C�#]���}L�G�8r�՞Q�=����
�55��E��A��ʹ^:��I������x��g_V���nn�ly�(��~��&ú���O[�;����<�ws��ރ���7i��7w��8����N�A��좍���S��u��;%Ӄ�;7��M��ӝBf��|8����Ot}�I�3����e�1����*�S1���~��|��Pߍ�7;G6Ae���n	��wY-����\E��6h��	쇬r��V֜?d��E�Ri�rZY�=�;:�g��)�x}����Cmf����W����T�����Bn�ne�0�P*��O��ho#GQ��cSmW���.?5���Ԩ��?f�;��xj�Y��7"7r�-ν�G�>K��r(�i��˗ �
���9y�=���Vݮ����z����J�Ckm0s��?ҝs����_>�<?�o���[m�7��؄D���9�����0�v��o����/`���bW� `�z]�?���Gs�1���WEn_��ط@&{1�o���6���=��(���ux�=[�����C��-�����--�:����g����o����-��g[�2��ȹ`�gŏ�H�-�&l����:������p�w���K+N6`�+�|f_���i��|]��_2*��'������+���������'�լ�z�;�wL�R�5Ω���m��C�ʣF�Z�������+��{��E=R���N��節�T��)�G�E�U��������/��Ͻ��?�����������o�ǿ��������_��6��������?���o�F����������l3���rC����c���m�������
��Y��GM�J�:�(ɿYjk0�%�2���֠k2���ƥ�������[y���+�@��M�7.�i�jn�F�m���A�9�}�'k|i�y��� �k�r]!͜p�o����=���5p�o\�{<�J�x��0�kЂ+yZ��X��RK�� t㿸�o� �Ad ��Dg�ga��˘�U��50����e�-��5H!�}�dz{��Oנ�N������}���9��|2_\���1��DL�]{�bY�T�;��J���ۨ�n���d��kk@��c�5Zٖv�z�w��3E�m%��@/�f4�-��k���� ��Tۃ}Bi��j0����p��j�׭�ن��Ŀډ�LDݲJ[��<���}P�N��T�X�^���1O2��������pStɠ>�k�g��0�Yƙ�� ��go-���W�����k�j���-��r�6�5Υ6�i��TS��+��o���oI	Z�f�:����*_}���l�`�~�#�EUP���,PB,ϯ0у`�����+$�7km���~'�䤚���k��=C�=`����D�e�yc]�źI���5{�:�V��a��o�'��L��͉4$�1�5o����50i�JN�v��NUI��}|BE�Є/���>�8z���@kP��i-�Ec-_t�K��`��	�-�T����ڧ]�dq�U����_[�M0_�\W����k��wѶbW�N�!+2ű��s�/����5�9E������/���vu��_�'}�T�W�j쉽����w_��"O��N�8�~��*XY����<�U.m����d�<y�3�q�C	v��
y������ ir=�>=�"�{ם#{�q�ｧ;ď5\�-�/���ۤX��c���>jb�;m�����?��?�������$;=%��Ͽd���+}�@�����[���6q�ݿ"�]���ַ"����lo��&�&h�,����N,8]�鋄����K�\�{S��Cyn����i����
_�<Q�}v�����'Or�l`�d�R�*e(�Q����j�gnH)M�\B�}�'L��&�]^���4��h5��"&�j�x�C�~]�sPW�-�<����W����'�/�ںl����c���_�6�h%�i%i�A���^�ˌ�9#��<���m1ڭf����=�guz�6�W*�@I��e���5��\ރ�w�,�ޥ�ûfF��5�*H	)^ʩxs�g�ù������p9�V����0���]��:�4��(X�UX$��R��o���9CL�t�C=�q~ ?���      �      xڴ�[�,��&�|�W��ژd3�.�amɦ��fK�Q�n�+�-xjX��u!u��ܑYU'���L��Ԓ��}��p8�"D����&�o�8�,ԐE2^�J�)|�~$+�qpKp_����?�<]ߤb������_"[Y�hv�����!����n�o�I
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
�8� w�Q2-�tגs��7�?H�jik�ҟ����pB�c�.b���	N��J�p��Oܻ,ٲ#Wb���@�o�ΤY[O�4<E��*Zu�e�{�r�973<"�c���a�]�Z��
������ �T�s�QTz��|��~���1+S�58�5.'S¥��d���Ȕ��������2�ms(e{�3����U���m2��^��3f3/������?Ȝ�r2�v�>'���մ�ԫ�_+u�:_�����u��[�^�}6��@���"��Q�42 's�S����<�����'�v���_"Pֶd����=u��"J��T�F� ���w<0�@���j�#o�O\���.穃?�V>���#�_�P"f��L	w %A+\N�d%�7v�.pOd
���Ǯ"W=�Y�W�YHy�x�ǑۯFn%d��m2%�����̼�&.���ѫ �r�G���P������*�R�q���$�p�G�O޶gʹ���d�땨v/`���W�!'������l�Ơ�9$�;5�~G�� �J0�pAI:���H��Ա��m���Է���/x�y��H56�*_�� A��Z�.���*.��/�-�Jz�5��x}D��ʢ��B� �p��f�q��'��ZK}Oo�J�'/�R$��a���^6�0��]�Fyys�o�B|��q;��_�>F�Jz�E���U�Q�����Gy6#M�9iؓ_nl�բ�z�_̑欅.`~�S��b�"X�����"q:���O�h��	�f߈����p�(]��l�/dDħ�4?W=��5�����;dq�g�uFh�>�Q�&0���[.�?���63��aGʉ>6S���_ѠQ�JD�,sÁ��S�[�"�#��p�X\F�����)���o���Vp�̸ؽ%OkT�j��),2��7h��J�	�	5�(�u�7��-��q�q�{�FԨ�߂A���jd�OZ���'��M�{�9.��B�h]���|9�n��	(��I�K��ta��c���h�vzh.�~���'sA޺�
��/��&3M,!���S4��׀x�B��%���.�e�?^���'��_$nzQt\g%�x8#}�x��m��mn_d����OfC��/J�,v��;ek������BG��!~�"V��p!��5�'{������E[\�&�x4#~כ�eGNe$:�Q�9�'��Ŝ�D�H����*��VQǹ�
T2��|��g�"`�"�e�~2	1:�M�ǗN?���l����fd�Hf��vw�%���N�}���&��Ō��X�����O�-l��\�~f#?�%a{�噰p�e;��pYτ�lPO�DI�/�����7I@�pF��d.֜�r�G��Qor�X̎�`���O�����r\ᇡsm�Ӆx��H�~�`�¥��lGಏ*�RSҒ_>��B�gP��?��0��0�s����,<��[|r>�qG�����'V;��(�:���k��(|d��K�u�\��ͽ.{���)Sx�Iz|y��(4� v#�x8#���։'o�<����+�ŬW9���ɰ}Icsme��~sO/�+��[2OF��1Ð�B\Ȩ�lX!���R���{A��]@�lFr�v2PKR�%�i(�g�^;������0?����$R'te��G��~G&)f���<�6���n�7��l�<Og��r�߳����:Z0z�p)SYR�
pY/#�������-�O��(,~��pѝ~|�v��<a ��� .����;r�gI��e��p��L;%:�O���:���6�sř�u3/��Q9C�� <�L)t
6r,�����*���@�'S�"�}��3\F���x��J����7Z:Hz�3�z�(�&�5횥����}�K��e�R��y)M\\Zȼ�=�i���.pj���(�oV��ޔ)�b5ucHp9�n[)#� �D�@�G@���P�d�Y������V�&��W^�R���.�y)�%�Jvd��2�k��9<�kM�zВ��W��#�1O�d�*Xz��j�6C�n�b�HS���MkTZI~�"\��J#j��EȔޤ��%=>���{<���FuR7��w6�H_ޓ0���&,
N�̋~�"�uT]�{�A�6�*�.��u�FIɳ�iEW���	'eΈ~������U�;�kJGi�����?���d�)���ΘcJz�����hs<,4�WE��z�����sb)V4%#�ؓu��Q�7�d���H��5��]1.'��'���o�-\J�u���G9���#Jz|�~�(��𔷄���ĝF�hu�˕-$,,�}���b��ی����K�y��en�uv�t�����?qC��������I'��$=��9����,9�gd|8i��{�ըϥ�"T��r?3��q��'�.�4=y;*^{��d6��j�p�o��*�V��K_��GY/?1	��Ѣ�[�ܚP<��H+�i�'�����&��Ōt���Ix��(Ջ�a(d��6Ee3A�W��<���Ͷ�p�<���7��_\��y.2�Kͮ%=>���?�;�s�2y��[���P��3���N���+5��焙�s�f�9��g�X�1�N��Rljm��N{�'S�:ԹUQ��������!��e
d�7�Kz|,S��IG2���%		��%���Q��t�2%�DN'9�,`�4q)?~��
pOe��4#
N��>��L}35p���&��dJ��<��K���GՄ%=�Y�tM�2�=c�b!?��7��e3e���h3/���z e$�Lk�&�N���*֫1��[X���=WO࢐Cޫ ��=�2�?�I���z{Daq�W%�\=�\�=9��K>YJ=�����bՂ~�e�-������\d|8�,�QYo��_�q���h�k�;��p� p7Y�{f������8���_K�O�b�jQ@!��n�,��G<�\W�n�����9��pޏK__0?�ճq�8?5�|6�S�HUn���E$j�N�{,��K�Φ� �/+��L�`mHz|��iO�o��T��hɶ�n6*��9S�o��bF(y�N�|�����m1i.�Q��<�Г�=.7�j�"j^�rS��[��}�[��r2%\:&�h� �D��L�ˋ�J�c.��e:��Q^��t}䋓�wo�)1ä0�
�y)M\GA�t$�9�L����H�%{�m(T��j��2%\�$#�Kp9�.]��n� �D��L��qJ��sm8�)�s��ȯ��Q������@��,R�*3/������ �L�=��#3��֫Q���U9|�''��V�W�\^N@�1f�wI�/��EA/��[0�GfX�6�&���ʓ���é�K�`�yE���ɰc�'�['��h�2}M�'ąKr)�.+ą�P��9I���}�ZQ�����ь��n�27�8!�Ff6��_�o�bF�����ɰ�Wn}��Gn}����6��6؅o�ipY!.d8�Zc$=�⢠�:%w-�x8#ys�_��<y�_#
[��&!.�Jסn8�aw��t�R���S
AG�
9�{NO���|��
�p�Ή5&N{|)�E�֭VP<�� F�7{B�6����q1[r������a�>OH�Љ�UnZG�mK��$��މ{�6��c��c�/\�05���.+�����!dI�t�tz�~���t��%��^����@�;RC��7��eH�ܓ���}�C�bυŞ��^e�    �M�n��Z0\N�����Hw�L	� y��s'ne���%��s#���m'���h�̼�&��B7�3�Rm%eT���t�ceo���{2�K�	��s=�ed
\�c�"���)�)q`�A���tL�$�v�Um,�l�P�2t}�L�<��&'3/%5���<�=��6�Ӣ`�b�Քid<_�1V��O��3%��L�۹*`��'2%d�G�&Iz�C�j����ʑ�T*b�i��.�M��\4�����"H�7.+Ӻ�t���ѓ�q���(n�#�uJ��pQ0:3��9.#�2\�2�z~��Cҋ"�9�t%�����WHN>%~5j[�Ƕ��EG��s��Qp�'�VqsF�<�+
��{P��vK�w��W!��e���Q�*/��!�}���T��(g�R�I2����*��z�o�bFݘ��Y:�F>�����^�����ͬ���[�/d�x4��������߀|L7R��G���������L����8������
�Ү����s��=@�H��o����������\�lM1K~�������������#�K���o����?��o��Z�|������O�?|�[)�l��}4�0-dB�Z����d����>�3R�E[�0��^Rꖘ�~�������~wf�����|֫Q�RF
�t�����.�D���k`����0=P�������o�.���<��U�>��*�n}{CY�_�p��-	��{ԜQd�ȕ!�T��Q$PL�)Y~���d�� ��B���T�.��7!���by|���H�A7���<̿�&!.�����O����v�����f��������p#|o��B\�	�"�Iz|)�E����%�f�zL _��X�i�Le�2������,����ɰ+m��&θ.~4j�0p����.� Up\V�9F\VI��	1�#
*�����g3b��;ܳ�Β�i�!e�n�����J�>�_1ˇ����Yr��.ۈh�6MyR��6��E{��2B|!cK,�Iz�M��Q��9J�}I�pF�\��4�7������h�!��)�mn5����sH�>�a�g��%
{�E�[B\�t�Kft.+ąL��	U��oBL���zP<���AV�ɱ�*��4vb!.��[m�O����e�c�u6j[p�W�Vą�-_�?�.+ą�aC�]��B�Q�k�Z@�lF��]���K^��4-���7	q1ӳ`�]	��Î+��(d�d��Шn��ҍ(��p��X��Jp��g�2Q�������8~���/�>��\+z��s�c��24J
�����Q6�0��%��3�/\)1g�s\�	f(́�-��æF�N�7?zF���{�bw#�ed
\�k�
py���HӞN�s2�����D�t��Iu��|^��IٽK�`&�#)��y)Q�3��A�{*�yjE��ҙ�64�[CR�^�M�.\{;�X��r2%\�/1pOdJ������$=��L)
ℹ�G#G�W�6�"���3/%���m��ʴw�%?ϯN�����ز�)��'�J�ǒ���)�"��F�{"SBƱ�9%�1+S}(ӱo�<����HS��+�6�3�H��[7'̬�7�%�ޢ �L�V�m��jԼ��QLpHk7WS�Rb�؛��22n��e�\^�@NH5���ǬL�L��=�a�(]y:�9r K��w�����	�y)Q�t��i)	pOe:ّP�f�ؖqg[sS��[�7�_��p9�.�_�d$�'2%dT}��Hz����Ԧ�S����>�F����o�)1SI���y)M�D��T�L]�yf�ؕ��t/��U7eJ��;UbW\N��K�yɝ,<�L	.��=�1+�Ó�um�w�bR���ꇏ���f������a��Kf^J�N�%�]����+m��_W�Y���D�:�̭�����A�p/�e��/dJr��p�_�_z�œ�����%��Eo�ƽ)�b�@�C��$[zV��ݥ�*L��و�[Ԭ������Tg\������*�$�l^������&I���Hq�ּ̫����`��d{S���
R�Y�a�n�x[�\6�(N�ߤ��'��ͫ��'���}��L���o~\F����o�[�-\^�@��R�������G2�%m;�jQ����1�����$S0#�yb+`�1�R���H�!p�dj�o����M�,-4ɹtO�����½�ed
\�{H�_�Opy��#l�_M�z��4��d�):E�2K7�A���۽�\�`F�4������vZ�u�3�R���b�Ք���h��22nX����)p������L�!nǋ[L��lӷAo�R��OGi����z�L���%̼����k����Q�|��9��ә��6�;���ns2.�4�X���Ȕp�I�H����x���a�^�&S7ώ�Ē<[�	�,�ֈý�,46��@����s1�m܈�r�\��%��S�2��2��X%A�:�(:\g�P��ńK)�2@�Z����G|yǽ�����v�px���m�sq4_��ǰ�/�x������Ծ���_[��s&����{Z-���K
�GL\<��d���Ϡ˴��L�F+�Թ���C���O��\n�!\����'�!ӃUL����?��݈s�G�NO<]�,�5��e&�i�Z'̼�&��q���3���6S(�@E����M�����^U��\F��m(<ǟ�Npy��7�׮���L��0�P!f��� Ztw�]23J��̼�&.b�M����4��ل��ή!��<��C�'S��M�!�ed
\���Z��L�\-J�vI�&�0�ҌC����kSt2z��o�m�Lf^J� �ѝ���4�U�4�̮!ԈBL�R�s'���z��)	.'S�E��q�����陂��?�i웣z��+���� �6��ݍ���[e�7�f^J}��6z�L{���į!�ؒ< ӷR��L	7/�^+��dJ�9����Ȕ�+.JO���P�I�po��0�t־�M�Čw;_�����D���>�|�<�L�������j��xs�n&ĵ,�ed
�U�*;./S �.��֒�L���q%L��d isH��F|�L	4�#P��y)��09{���2q3������k�j�S�)SµH�8���)�:�6C�{"SB&o��.���)m��ڝ$m��GŅ�ɔ�)n���y)��L2c��2�la���M?�;�
57�����)-��dJ��;ث�D��L�r�_�2��{���T��t6�x�n޽M�Č2�!)3/%¥�aOI�{*S�B�K��>�F�$?����՝�r�"�=�<X��f��6�}p?q_Ԝ��������Z�㯉E�ڏ(B:��E!N3�p�<�8TTo<�<�k���w$��L�T�+�^1?����|R����gN_K���p3nr��B\�x���Kz|)��U$�(�HݬW��>��B1���g뛄��Q$��!`~2�yk��1���Q��^��|K��R-�����Bnt�
.Iz|)�E��rsX:��B�i����"�s��)Ԇ,#��%���١�P���a�A9�)k���+��jT��4�*\���4��J�{,�OdK�s�H�/��I�������(��HNSz?M_���I3i�d�dF�T;��}�,�/�2 �U^b{	��ö�۠Rq%�[��/m�Q�zwl�*uX��
�����i�z�g�M�a(�/�3�]P�N���#�n�,��۠w���[�w?�Ak�0ˇ����D~#tV7���j)Y�W흕��[2wmw���\q?D���!Z��#
� ����Wb#��m��Óˍ%Ov��VR�_�����ʽ`�;oZ����jXǹV#O��d�������ԏ�G\���>D�73[���_���?% ��@l�n���ٌL�roəY�?遇8�u���?��3��/6�7�ʀ��\i��"�*�rj4�[=�}#��'.����8S�.3�/d�E�$=���O�� �*��O7�-j�aw�|6BXkR���������G@���    �_[��n:��Vw^.^��e�x&���~!R�M��sG�O
��)Iw�܃�p�xVM��D�|l�j�z�ċ��j�,b~�8�^ѥ�5Q`П�!2ά�$�Q�����,�IT���T��Fq2�O���.ݨd�� �Y@_�t���� _-�/
Dvu/�Q�(p�Vbԙ35�Y�m�[*7|2��@�Z�,v��Q���|���8�-�1#{���7"��Z.#�rZ���B|Q����vA�lF�J�;Ɨw�|���#�����l<��*�������a��%�a�<m�P�����jT6O�J����¥Y1�pY!.d�oOL:۫_
qQPU�D/�?�x6#�F�pK���[R�-+⋙��SKY��d�s��d���:d�Q�(�獾%ąK�V�}�B\ȴ\�S����R���`L����3Ҧ��'3R)������*�ӂ����W�`'>n�A9:ז�4`vHv5������^�o�	.�gR6��ד�{��q�Ѩ�_���oE�?۱Y��V#�2׵[��vV���\�;c���2��Υ�8�U�/����%ﲀB� 7�՟n��<99�"^��%��'3Reh����ɰG�r �c`�g���A�WK��.
Sv.�pY!.dT�c��]��R���rM�	(�H�Ҫ'�O~��;�������za>{�b�W�(����sf��.g��[�����q5r�,Aڍ��DK:�l/p�����;�����B�EA��K:�pF�f�#5��k��(o�#��Q�82~2#O�=~��`~2�y�웣K�l7��Q�\NwJ[}�Rj��c�B\�t�����R��b��9.�qA�hF�f}0���W���m^_)�7	q1;܏�Z8a�[�/���ǟ���d��_�(�������;F����\�c5F@��j�u��9��r�#����n^f��v9�{�A����Q��0���O\:��x����Y<>�;��$�W�ǋ�#i�q-�
��A��~j��H�"ntޜ%A�w�f�5Է1^1#��	�a��f?��`�%��i��k�%#ąK�Y�\�B\��!`z���R�����8_�ų�B>��q/,y֓���-�I����옆��ɰ+힪���pîp},0���%ąKǯ��B�F�Z=~����rwmg�nm�t�Ē;�M[|�I���r�f[��Y>l���P6Sg��`�h��.eoD�|�:RU�����J��_��B�/
�DI�(Έ��M��$��M3�/zF�_�Ta1[;�O��kV���0�+�$F���¥-?�=
pY!.� �㧠�_
qQ�']�����-�r\�<9���v�O����5T0?��+%x!w�v\�v5��P�}��-!.\z܈Jg.+ą���]]��R��"�iކ.�x6#Mm{�c2c�|lc �?�K���\
����ɰ=���d�G9�x=W�L���7�HF���Ru\V��ӕzC��K!.�A����q�\�W�i�!�}[�bn�;R���ɰ�Jv3T%7F�ȎF�n�	������
\V�g�Ե�ǗB\� ��Gy8#q.9t�������A��MB��i�<k�0?v�z��#��]h6R%;��g#.\j���\^�@&��<����Z��@���.Jgg$l�f:�`xr*IEwX)�w	��ë[��;Qm!$����
f#*�DG�]�[B\���%pY!.dʂ9��"��?(`�/�x8#m��:U�'�s����޵5/f<Ԓ�O���hS�1��l4�)�Z�>�"pӾ*[.+ą��������ǗB��記�fd�z�4�ḯ`6R�Ɉg��MB\����jf���V�0q��=>���>��O�؈/\����8:������*I�/���h��d��s��3�7e���,O�6E�c�-B|1/!�]��d�MG�y�/���Q���w�P|�ҙ2������'�|=�⢠t��"���3�7����-O�f�����E���.��aY�K�'�~��2�����}d}�w��p-������F��Q%=�⢠ۉJP<���ـ�����s��p�4o�z1���a��s�'�˫�X�H��o���"rj7�"���2U��F�/�:=L՛�_F�/
���}H~��3ⶀDMv�y����lSD�b�r�i�!`~6���h�H/���s:Em���������U�-�����l�����Yi_���W�0�_���t�o�����i���4�[�њ�\���òt���ۏ�5Z/�v�!��Ԗ���To	q�RF�R���.pY!.d�k��%=����X�"�x8#a�{&�����*<�w�&!.fr�,^U�a��i;@؈�V��Hmâ����.\M��8��.+ą�RM0/�=��|i�����U,%s�˅M��t}Ӌ͋�ܺcd�_��O�]��`�RH������E� }�%ą�)j� ��B�i�i+��9�砕����mo���'+x8���y1w��%`�;n6�y��؏�h�'U2���_WeV�s\F�/�j�;I�/���Ȫa����P���'䔩�2��o�!��WfQ:g~2l��*%vI�*�|6r�s�P�%D�6����9�e����
n(�_
qQ�1&�(�x8#��F��<y�")�S�MB\̰Hj��'��{�+kT̃#���Y!]�%ą���]� ��2�\~��R����%ُ�pF�h	=1X��Q�E�T��I��9bD���ɰK�G�AE�R���?ŭ!ַ2��.����d��r�>$=�⢨� �K:�pF�\��Fl���m�8�[�~|2�eA.�	����H!��.�=P&6��~�F\���m��B\�1��Hz|)�EAq��[�-��3�����!}�O���]Bs�����Y>�D��˦��)�5$_��EP���.�-3�縌_Ȩ_ެ�J�/
J-0�WP<����]�q�ըo��Ħ��%?@'ގ�K㊀Y>�=-�B~�h�W�D��Ί���S�2B|!êuNIz|!����aw��	[%o�����3fE���"�sAs^?g��lJ�_�E�xE#:����ue�n�;{�E�{$��(�F������Y�Y<�{|�<[���p�����[�s�g���<�%��{�d���裄�{��_�vxB�$�=N�����_2�Li��(�C��b�L	7#����)p�}��p�k�|"���qM����R�����s�#C���y���Z�_-��J2�(���L~<"z~,#�ܕ��Գ�J��� e&����U��?F�{2���}��$��gu��z8�D��m�����r:���M!�I���ҷJ�ㅌ�[�J�z�����U��SZ�}p�-e!�В�lK����>����~2"��x��9 ��,�]���=�Ƹ7����8a&��g���v�2i�-�]&�7[����� ��ƺM\� .2�Ɛ�� ��P�~��} λ���a�쁧s�4G�n�]6�3�6�
�y)�U�.��
�g2�dS�F� �`��Ȓ�U����)p�Q6G/�ed
ܕ�D./S S�M�Jz�3�������1<e�D��6��ۙm�f^J׬��S�έs��S���f��Q��[�@N���*+&��d
܁��pOdJȴ�Š���?����X��d� �����dJ�i=�73/%���Ȕ9��=�iاq>��ΰ�5��$~;�p2�?Y�U)	.#S�j�6���9./S à-i���g2�(H�Vx�B�¹�K��dC�̼��� �*E�{*�i��H{kC?檸j�ۛ2%\�]t�Hp9�.R����'2%d\)�!��eԴ��{K�)L��紫�ɔ���Rq�	�y)M\G���;�qOe:N�����h��F���gPk���)�R�mq�I��D��L��!��eZ�f�n�z��eӦd�:�M��µ���	3/����� �L�q3Cőĳ�(5Ҕt/�ps5nǁ$	.#S�">G�='    ��L�"�(����z�3��i>hk���"E�4�'f�.��yY���y)M\D��$ѩLM^ᖱ�I�4]�]�M��J���)�"Me:�?�{"SB�G�&��e:N���=���u� �G1o�)1��Y�U��Ki�JD݋ �T��$2'�l�P� }K@�ɔp)�D1aHp9�.����.�d���Kz|(S��p�P���PPj�
򄄏S�o�73Rf�l̬�wୈ?B����4������əvo�"XI��2%\�^M�W��ɔpj��"�=�)!#4�V��c�r��1P�v$'t��P�ͳ�L�������؞0�R���.8R����PB�����s'�٨�s���[rZ�NFಛ�B���MC���P�8/�x�ke�1�CL�6�%7z��]�����Q4�&	�a�@��k���Fy���������e/�Oq��p�z�t\V�@N{�J�Kz�#�s"�97�w̞��(��5��&�4��A�>�̬iW�.Hp���m:FE+��d�шb:��(�;ϖ/\�BL�I�q�����Bds�_��/
|㕹�:��/��T��"���\h䶌F����b�#Ze�Y�3?�oT�����,4�P�͛~K��J|�� ��B��g��]��R���&T�v�g3BF���1X�Fq�߽h�B\���=	����G�#w��3�"�Fi3�<[j񷄸p)oZ���B\ȨsG���R��"!{���32ֱ6v/�������OF,D0�}�t1�G���/H�o�F�����V�$@�=�"p)/S^ӟ��BrGҀ�%=�"(P� D#�x6#���)4K>�FɅ�	̑�)��ϙ��Q�E)��o>�mt{t���A�*&.+ą���{�_
qQ����)�H��/�

��C���MB\�dN�k�|�s�-�jp�`���f3T�;^A�~�� ��'2��3SK��_�h����$&����ٌ8�  ���_����&�����Z�3�5Ι�[��o�H.u�|6��%JǞb鷄�pQ�� �e���)�z�̾y��K!.
�O�\�S<�E��d��Yr��!�yo�b�_�+a{Z�����B����9v5����E�x��ĥˍ2�)�?�E+��%=��}Lv?�XUL���.(�H�lǑ���u5�Z>��-6���()ഀ�ɰ�RTB�,�C>Q�y�ʎ7��֟�m�Q֊p��p)��x#�e��io�v��_w�?̷��T(1�-�te��B��8�Xo���N&}�lq�|t%����.�宻�g)o�#oj�,�l���:ׯ�Y�n@��$��L	7����L	9!^�)I���,��9ܖ��KW��ѐ;]
o�)1ӥDj6	�y)M�P��	pOe:��-�^��P�z�,�L	7"Qʱ��.'S�E(�^� �D���.>���?�)@�[�菃B_�<�;��L�?�)1ǁ�	]��K����+�=�����=���ֶn��a�<�=��\"r卉3\F��mQEM�����?�Hz�3��y�/(�=���:�Q#��%S0�Z��y)M\rQ-���S�ƾJ*&�ѫ��%�-�'S¥M?'�%��L	���K<�?�{"SBN0������2�w����y�y̠��iTȔ��%�w'`�4V��y�6�S�R��s�_�J�:Vt���M��ŕKS\N���WZ�o�'�'2%d<���%=��L�A�V�y��EʉW�Oo�)�<hA��
�Y)���x������4����l��y�X�.5��%��L	�NO�%�=�)!��B4Q��cG`��և2�v�H�C巅�HS��l��dJ�+.QK�y)M\r
,]��S��EW
�����&w@��͓>p)Ysދ��r2%ܺ�PY�{"SBF������?��S�DW
om
Ƀi�v!f<@���y)�fB�$�=�isQ�$�-79�Q�kL=��g�p�}�u\VN�-��.�����@���$On��W���V+��o1�1��l���3k�0?6|�.�c�X�$(���q{{�j���Ii.+ą�!=�"e�<�@B�ܪ���L�.d���h�����ܼ��yG{0ˇ��=fj��"��<+�Q��no�����q��\F�Ȇ�yW�+!�(ȓ~�MB�lF�ݬ����Fs��q�ﹻ1�¶�0ˇM70�o��wƐA�������e��"R��9�=�L�D�y�uW�z����R���'_��J~�g3��6�r���{#���`����L7��:-`~2줬�
�EG{��{52�"�8��[B\��Kn�?�e�����^�%=�⢈?�P<��D^��<y��!WS�$�Ō욚�Y>�AN�~(��CQX�mZ�s�~��e.�/p����� ���?��6�U{��8y )nI���OY�-.��C��Lχ9x#`><��p3]��c�\�LM6O�;�vg]Yl<�Y�֛2%܌�;�Kp9�.�o��8���D�@�[ ?��ǜL��L�BC���x����Gnk�6�3�7�Y��J�pq$���qOe����mca��hT���wWS�E�yG���dJ��Z�pOdJ�d/~?����e:���F�k��兿�x Sb�d!6�
�����ZA
�/t�{*�l63p��=�hn��;�3_�V�b�X	.'S¥c�<^U.cվ�y��s��l�}(�l�J�#��X:���K~O��'3<0w�̼�&�G&���2-}�ee{�'g6RT�"Ŝnʔp��OV�\N��K�^�5-�=�)!�ґJE���tN�A!���ma6R��Wo\M��i��)3+%��ͻ'�=����J!!�ɜE�mu}���[rZ�v�X����>���B�$���Y�E��V���ɡv���z������y�CB���������'���.��L�;gsi?sG'ج�FI0����rPL��|�6m�Y��
|!#sN.U�����N��l�X��(�ӱ�w��3�Ď�E3��-\����'��4�fF��r�ܺ6�i��3]����.�
� ���B0D����r�\�?T�������;"�g/�<��ZJ�_����w1�b�`Og�O���V��rv`�sAxQ�f�%ą[h�:[.+ą�W�{I��
1D{D��[������MW���k�)lG��7	q1��x�����ɰk��r�U��a�Fu���r'��'.nE��\V����-Y��K!.
��L�P<��9���D�Kn�6��,��MB\�4��s0?�<]�(;�a�����X!.�Je��pO�Hȝ<�SJ�bڏ(Rv%�x8#�����©o�����y�����O�.H
�u��1��n����'��{+�f8�(3���1�{7��ڮ$��_��*Z�������m��V�$=��Qf"�UW#�y�y�6�rJ��|X��-f�����9n,\G�D*E��Q��=lE���F�F.#gq��d
\J����\F���xT`�ug��L2Vx�%=�dj�L�����ӥM�&���]2%P�`(� `�4q5%�� �T�*����|�g#��1hwS���	���>��dJ���=T��Ȕ�� cl!Kz�C���룯'��]u��'Sb&�h_̼�&.=K�؛ �L����?�Y����J	������'Sঊ�V����ι�	py�6ZfO��=fe�dZJ��^G���PqZD�w��y��ߜ1�R*[��&Ӌ �����U@�8��{��h�J�;��/\T*���w�{,�Od�R���^������ł�K�^P�O�o�#��?`5r멿�����'3v*����ٰ�YU⋪�%�s���]!.��H�!2��r�0�����O
:��v�>���ĭ�~�G9������OR��~2��6���O�ݻ�[��X�}��ڴG��;I\_�Q�u�X.+ą�ҎQ�/W�E��y)��	������'���%{�k��q1g܄�_0?v�[($��6�|n��NZ9�~S��K/P��K��="!w��ܫ_�����C��'ų�js_�C��'��po5�M+�bF�a[v�p�f�KU#?���(��G�0�    D߹����������~}�KխP;�}=p|gw�����9��E��^��b� �P]�o������_�����d���������4W1��)�?e�sS��6|�s��$v,��U���2��p�=ں����ҭ�)]��G'���k���?�d'��ҏB�.ٿ��i~�G�s`;Zm����2�=�\�[�<���bw�_#+����#/woC���L�*�P���$��OI���QuT���(Q"Vj����ӟ���v��J�{����D��S�Y�}�k4%\���᤭Fjy��ƙ51C	�(�{��Y��B��.\�rqκ���Fȓ���3�B0ˇ=�lT � �����F#��-H׎J�����-	p���ߐ��Z����U؏(�FZ�N�<�:�O}�<yY��1��!����[��[��a�8�clD9�w^�v�6-�w���_�=�_2����R��$����ς2�!A~�)q�����c���g��[,��T	��r���g���	��r������Y��3�?)������BrSY4�O�6�q�'�ߘQٻ[�̼�(��޻��\V�i�ޑP_���>���tC�sSn�酻
��p9��Q_۶,���%�]Q���>(��,p��'#�i���
YJ�2�
��b���	I��h�t=ՐfpO�#�%����{B.>�Q� �"��K�$=�.�xDqA����+�g��Γ����*����!�UJf�m�_=վ1�]!�A0?���5�d5��(*;�M!.F��!2	 ���"Q��9�F@�pF����k�|�Kɏ�yR����(`�_�Tߙ�I�/`~2��3U֢i����Ejx���e9��������������^�!�����;W�ZJ���f����O6�[B_����t��
}!c�pF��K�P�Q��'3>q��P��1����{k�{��V��L��)�"`~6�7S)qJ�%�'�}���~W���ǡ� �D��LU�s�Z��B��9�ˌ$�x8#u6��Aœ��Q��)��w1#3V�V�,v�+�\G��ɩ�*�_G�!�.�</��9.#�2�puN�_�EA%�R6N@�pF�l�Q�4���n��gK�A_�����;��G�{XY9c.�#��u���o|�'D���D0� �"��-WW%=�"(�op���g�N\��)'�+tKOGS߲"��)�bIM��dرO;$��p�!����=���w�ܤȓ��$�e���<P,vHz|)�E����Vų�g�b����z3("�u~ӊf�Rϩ��g�.�-�� U��2Q8�!�pS���CV9~���="!���eHz|C�D1�%�f59��u͒O�Q]�L�߳".f�����9�a�L�Ȏ�����g#�U�/���¥(Δt�B\�HQ��.���A�Ug$m�6�r<y$e��zӊ���&�0?v��5��ŭ��Q[%�.d�	�p�?D� �"���*�_кg��3�g3������KCIzt����oZ3�f��g���`��f)x5��FI=lwl�n�K�j\F�/d�ԛv�r��!�((%ّ�fdn��B"���rUm��pES�[V�3E;Œ���Ѱmh���qϊ#��,�)Q��-!�Re*��s\^�@&׈�����Z���h��mP<����ݕ�`v~FP���wو�eWܳ�Y>l
�v���ba^@��o������!�pSC�Z	.#�2}:%�"��_����	(��\iș�W4*�t��i�{�_��r����'�V��۴����#��>be
EF���E�BՌ ��B���`%=�����l���ጄ�PLR��mQ>:$8��-+⋙�����ɰ=�D�c1�o>�U�:����¥�0�V+�e���LW卹����-J�6'�x8#s9&7��Z���6������q1SA�h�0?���ox�p��3խ"e�*���/��� �"���p��=�"(*r�26�9ų���H���a��W#�E|�ߪ�W��L>��d-`��m.M;d'�d��Fq� �b�V>p��� ��Y��y����틂)F=$gdl^����]	�J}���٭P#`~2�j͘gCԾ3�g��B �;��[������/�V�����37Ehd6o(pBEK�%v7�G��~CF�4�x\�����~D�ڊ��O&�R,iD�Ó�i
������?����o�L���<L����f�5!q��l����*�0�NQh�J�{,�܁4F�ˊh!��0n}=�`�� ���Nyh�.|��K_�	�6�;��o�)�m �lDn}��ܶ��w�ǝ��ײ�j��oɡ�s��Fu�t�#7ٲԗ�HA1�z�٭2Sj�e��(��-Ыd��d��\���*�rg|��x0�7縌x_�(�:�����_��#
�s�I
�
\�9��Σy���S;n%�F3���P��o��,�M��ਙ/4��Db���5�46F�{,���p��C�˘�/d�h3~���+�'=���	��%�Q�{����_�+�"G�V~�Q���q|=~�ii����2#�����
���M�.]tGw���
��b��:.��,d���+��ǜX̱X�n_qY[����hh��{_�	��
�c:_�
�R�\6^��,*�@��5"D����)S�M���%��L��$��;�9�ɚF���޶.z��5��V@�u:~M�i3	���8Ҷ��W�ߦbN
KH0���Z�Y�{���F���'��hT�@�pɌzK�����\V�����+I�/�_��I�
(�pS�j���4GN�G��yZ���/f��ɱ	����ͧ�lV0���u�3j��"p�D{./D ӋC�{���Z��h����wF�lF�d��PZ��ǦQ[�]w/�_��.���;���U�:��_n�?(en
��6�)	pYȚn�����_�h�	z=y���[Ƈ�j���z����/����3m�ul�"MC�ּH��w�@ѯ7�߂�),�~r�.��:�?��_��[jZ���s���BN˓hHz|�,���};�O�4q�J`7׍���&N!�o��J����Ѱ��R@>$k�S�lT7��Ҷ�{B.%�L�u./D ㆲ�,����
��-.kɏ�lF�ކY�mKN�%���rz����q1�=�3?v�v~H�ڹ�d62�kr��w۷p)K�<�4./D #�j��B�p�ɏ�pF��I)��X�8��F,�M��bFŉ>���Ѱc,������(�|�%*uO���Wh�ಆ�B�/�5+�񥡷(p���6qB�pF�b�*Ϟ�Ш�EG�����2�R�ǅ�P\|�=�)X���l.yǔ� �d�	����%=�1�D��߂zoQ<��1	�A�݅�����-�"oַDAj(��<7���l��s�G1׺��v�c}�"��\v�Z�p[��Kz�]�xp�;��ǅT����l��$_�ɋM�oؙ���������[fK*ߖ?fR��� A'	.3��k`]���Ұ����V�Oj8JA
$R'��+?%|���{��֝V����g�̵���hه�3ܓ+�F[!Ƕ��ӴR�4jh]k��3��%��R�����ų>�`r�˯=@F��h���?[{J3����!?�6{����t���J\�ǮI����ޤ�l6g	.3���N� �_{2mۡ��l���lyF�<�ܿ�3������T�賩a����T8pVE�ˮ=c�߶�*�a�Ѩn*���yv~�«hZ\FN/d�6�q9��;\�xD�
B��\rN!�r	�Q62����F�"�s����c�Mѝ���>�Qj��T�7�|k�.��睉�9�e'{!�1��ҽ��o���R//
���6Fœɞ�f �%����)�kQ��&{������3 �}t�����>�5cz���J�=X�{,��7p�N�.cU|"�1��"���
B�j%��a�?���u�ei��|�识Y%VJ>���29�&���9%\�ة�%�ܜ������<    �e���E��(�1�|t<��h�M?�E���y�)��i��l�a�(`f6��k�#������D�؋Es��lT��ZY��L�Ki�c�V����a9�	p���tM�%=��ң��(�Z���VxBSgK�ҿ/=���s)�5���|�����T��D�%�̜�J�&.��_z�<�XI�٥g?�Sm�<�r<�]�KQo[z���F3�< �N�%f+�=[z�ܿ(�d���ݴ�ɚ�u�)S�ըgܝ��)��{�&�嗞����%=��ң3e��x">���4��Z�6�s"CWe%`�4q3*3	�q�dj�״(�UY9�}.4T�17us�.��SM��22.yj͛['��L�L���<�z�3���n��|��G`4��hj��K�`�+��^��Ki�6�i��S�N%��d��D���CO����ʔp�4�$��L	7#�w�L	I(j��P�N�M����ӫ:siݽM��L�@��&`�Dy��ȭ%pOe�:���1�jKgܯggV��;PP�X	.'Ӊ�)����'2%d:�����z�C��2�H\�9^��Q�ÃN�m2%f:��$̼�&.9���� �T��2��dR��3�B�b�w7}���Qo���)��Y�!�=�)!#}Z�_�2-f*�|r忊�(�E7�&�	��4�̼�赇<�J��S�ּ��y9��� PwWӉkw���%���dJ�5H�pOdJȆ�,����L��F����o7�Q��7o;B�S>�0�R����nx���4O��4��8�i�%m.����\M��T�'�&g��L	7�s�n\^���,��ǬLÑL3](8�'6jԐ]/~����5��ḙ|��V�]��<�7d����pQ���k�.7��;P�DI���2���
[]��^@�[Fִ�������hv�{� ��i++693�>.�&k� �d�	#�mT����0�aOޑ���x�OY�ˮ�=��_i}R +�.�Q�<���V2m��[�<����.
����b����s�3?vKێB��ݸg���=ۜ�)D��u�RE�{"DB^Yg�g��_�Ƽ(,�)}P<��6W2�S�'�[����-AZ/f���E��;�g�p��?��f@S�=�����k���9.+ą�By*�_
qQ��9{F�pF���)d�#�v�1�ý��p1#��h�G�V�2����8cx6�"���ݽ�e��w����.k�} �e=J���v^�.2����3��b-m��d|y��)����6H���d��`t��N��=�Y���M�+��v��l2��N��Hz|c��"⭂}]9�x6�����/��Ȣ���%6Hk�}`�"�V���m�Ft�%���|�Z�.����XEY;�#�Მ�B&��Y���?:�O��PZ���@(�yt�}�O֔i��`��2y��������J��_܍��r�J���=���Ұ��h��+�=�ё?QJkGO(E���Q�|T@E|dZ̍<+{s���.R���pO���Lq���?V�st8*�����J���).#S�Re-��9.�� H%&I�t+>�Ҧ�?����#�@��7���ς�˾��=���f��I%\�����).7����`XO�3\~�2�P�"A���S���QQ����(n9߳�o:�,f��H1����p) ;֩��d��i��r��n��ќ�����u��"J^�ˮ9��A�����E���~gO�܉;�J�)�̓wJ��d|�M{�b^iᛄ�ٰ�')s,{�3��D���n
�pQ�#�[��	C�U���[P
9����ٌ��FS��_��Fz��0yһ�3�z�x�̏�M�6��?.p�m�'4K�ʣ��6؅K�v��]���.C��Z���rn�P<����@	b�?4�����]���Ң��>��1?6U`R;�"��~.�~C���~3$i��,���3\��[�q�ZJ�_^@}P�����g�}$ ʻb�g#eɢڿ��s���	��<v��B�U���&\�t��pOf��)s�\����7fJ��?��)����Ȇ�Q�#���u�����Zģr�a���F~��JM�][;�p�f*������0ǯe�=��l���xD�g%U��B:��u�)/�;O^�'�(�w�b�Ō s�2��Y>�nGQ�/��xZ��D,;\B�qC�/�a���p��O��	�&I�O��(��ZUɏ�pF�VQK��}4����g=�E�/f\k��B�W̏�M�����y�e�	�Z��'Dµ�!Ɯ����byEI�����(���ų!S��9�
�W@yTXΘ�b��9�R����Ѱ��R�5s,y��ņ��6�"p��;�n���L�c%>�\��Z��p�5y�}E�lF�����He�ܛm��\�;��b&w�8��^1?vϛF	e���/N3Oa9����\J�T��\�F|!��i,^Kz|z"���#����ጴ�������m����(������;"�vv�Oq�6�� ܛm�R���l��MȨ��a �e��g{Q��GPV@�h�Ӵ��YL�%���4�W s���)X,��+������-�w߱v^�T���f��&�B�#u�U���ߋ�^�R�Z@!�m�:	m.[p�dl~4����4)o����[rdNw�̌��q^����� ��(Di���ٌD=MOZ�[/,yT+IF�ɿ� �b��.���Ѱ��ʉ<5��j�P�Pؼ�"p+�K+��d�ͣI�/����#ٕ�P<����I���F}ZUtx��x�A��l���$�a�<qa�y�۶#@0�|O�������"��d
ם+����Z��@�Y�{ų�E�V�)~|Eo�\R��-�sA�w�̏�ݧ��5m�ձ+b�j3��3��	�xK:~]��eL�2|h�"����4��h�%�8#~m�EEϓ�mP��8����g�OV��,k0�y(zT��lwyp�,��g��ڗ���lEG������l5��܏�����-N���Ahl�|̧mF>ǌ��Fv�R	u��|�/ܕ��E.�ɼ�;���_�ݟ!���B>��͛GQ{N~��9�n-�鷘�/f���Ѱ��'������1�Ǥ��M!����g��qy!r���/kI�/���&���+:�x6#�|oJ�X~|�L����bv����o�{0?���aס��g��(QY�	�.NG�HpY!.���$=��(믇��ٌ����O�'�|~�\w���Ŭ�v�a��W��TJ���<R2���'D�րl5Z��b/d��}����{QЏm���3�7��Qɝ��y�����3���_؜pdaEN��4�����f�(Vd[��䕥)FI��gOpc(Ͷ� ^�����٨"Ru��m(߷F@eS�f0���9�n���u˂ ��d2r�W$=�4�U�N�Zœٞ�y���G��#]��a�ڛ���L�_)� `~4l����;nɞ��G��b�=!7!�o�\^�y�	8Iz|i�,
�sU�g3��_#s��B$W�B\�}�'6��Ey5�̏��C�M�<�i�!��6-oߜ�9!.���{+��d���%=����h�gd�*S��{�}���ǔқ���g�֫��Ѱ�$��65���(�e�1m�	�d<�.k�-dL�HA��KClQ8d�ٌD�O��Ȓ�F֠�p���n�v�x���l��gM�i��Ԛj\~��ו����׳
�������f;�9�T:V~��Ff�<����=��G�	+;۳��t�q�ߚ텋z"�Y.��,d��xv5:��ٽ(��6�'�=q)a�B��Γ�in�T�b�{1��~�g�f����[��7��Q�2�S3�=!�a��Z�����Kz|i�,��R$�8#mM(^��nNj��O���L7�8-`~4lʭ��]���Mf#J��Ǽ��8!�n��B\��md%�7�
�E�lg�o�|w]y�»ҷ ,��=�
L���G�N���uRqG�AU �0�*lvK������z/�e��L�I����=�4���YEų�C    S�]�7�|��
��7�GF� �=�����OO���!\�{���l�nl��׳
��f�*�h������)���~�3��>�ꍰ�X~첱�͠���MG����:��؋��x��DFnbsX*��_����GU �����.%��!+�̓�i������ꏙi�b�U��dض$
L"'�h�i���f(�x�_c8����m�Ysl�\�|�v��f&��e���
��� )\�'��ؿV��@*�'��\��_6��x>�7�m1��^-`>H������p��e��џ����J��F"G+	)`}�%���dǵ��pY9-d*��=#]��<:铂�K3�'�ĭ�#�]��ȓS��5����̖�JC��'�.:�-��h���g��y���9�[���m�a!�+\V����yN��ߗ}R MCQ<���GU������Y8��F�I��	"���GæWI��9{���׋l*7� �¥��{�^�����ۮ���,�>�/��!@���3����.?��3�ۘs����R
�5�#H1�$�����dT��x}M񇢐�+%�x8#v;�A�ui4��j�9�W�S�a.���Ѱ]�[h8�YΜ���b������~�./D ㏲u�_�("}옎&�x8#i���:��qsv��+oܗ�a�g:-Sx��h�A�q4���a���}�z��'D�Ո�tG��ߠ�A�����k�����?��lP<��<N�dw�������΀�/�?�Qo�E���q�=K��Q}�.��7\~��L�,YyI��g=,oPV�f{X�c���O���o���m���_V{$�<l��v�Q�:���֤[�=qI�1	.��Ld�o�\��_�ݓ� ����[Q<�����P�4͒����S|���(�PN�!_1?vS{�R@��htl���^�gvO\��Je�V��'2b/�7I�/��I�,��I:�lF��<���Yr��>�����3�*٬̏��s�4]p��4g��Fy�-��HsB.�/�W������(��A7-���ጌ�%��ѱ�0��Ʊ����=�q�%`~4l;ѭ ���NS�u�!������E��.k�M�c��Ǘ�ؤ���E	��q�Ǖof���f�L����\��E�3w*��-Ey�c;��.�v��h���6��f�%�=��mPP��q�O�G��J+��R�<y�<����kkv�i&�8�k}�D�0�j���!�KFiJ>p�M��hoI�/��?�pN��"�m�q��6��d6�[@���C	��3��b��GÎ���������Q�2}���tO����
B��B2B�l͒_X;(�#0�G3��ɘ�D����*ݩw����a� ���&`~4�\�V�i,�����%��xO��E�/�� �"��(��B\��Z���a{����lF9���ŒY�h3�������X�aS��H�QE���:JX�\m��\r*H5&.c�� '�͹�U�/��B�����3�6�����5R�#�߉�Y�{��1̤�Ewg͚ç��P��n.;�E��i� ��m Ge1�l=��mPP!�l��<���S�A���!jǈ�&,��N��~�9��`�o{l�����g����E�^� ��d���R��Ǘf��Px��M@�d��8-����`��¢l�_2�'3�ee���Ѱ�8�w��[�;E�M���`N��E�d�� �"����OԪǗ�Τ ���TP<�?L�����'��=�y�\_2�'3���"`~4���Q���R̬`��*U��y�'D���r�J��q"�=�Ụ��B<�T4�g3BFL-�+�8���&�ݓ->�a(�@����Ghd:���6�ͭ���w��[��!6�q南�����&Y�^YP<�2�g�k�P#����/�٭���u"ƴ�����F��Q��8�\;}p�vC�2��A>f�GQ�/f�C�b<O7tA!�m�R�0��2���F�%ȶ��f�&7��i:������FykY�w�4惋B┆]�{����*�<���U�D>P��q^���I,��*�����!�1���N��n4r
qٚ���#��[�:f�bN0ڒ;��vkR	W+��2�.3����*�^��E�A&Ӹ�$=>�T�_4�O�-�GX������5J����'��Qf|$ͬ�����E�\�]���T�ҳľ#�.3��u܃ ��T {��bw�e���T���1^Q�t����k�?�cC�r��9�0ηM��Y1�&��/��$�̤w��C���/�;����t������0�<�[<]�Ԭ�+�f�]�7�O�?��BMZ2\6QS]Ӻ)B����������ܵ�
e	.#S�f�dk��k�g��Kz��ړ(L��X�R��h�M��_{r�t���Ag�s�<]C���ܤ7 o��\fR��?9�*��� '�f=Ϋ�]����'�2#FRh��+��d����Oj9�f#No�����mvrHO��{�
�<+�'	.3��%�)���������ϧHz�ݤ�q)�\��3<]������P���ԫ��[��O���y���P����|P��,v��fP��kp�Zvl6Ip��ִ���
����h%=�nCi�'Jn�ȍ�3�A�L��W��?�/�y)\T�q�I��]��PzK�fS��Jm����Ɛ����F(V�[�p�	ZMT\^�@&�2;�%=�N��8i����l��(
���k�o�̨��j0�R"\�D� �]ɴӍ�F�rϮ�}��tsV/q2�E~�$��L��@���Z��>�)gtQ1Jz�ݦ��j��=�9�ti3x�9bxK��A��.`�4p)%[����w)�#�Չ֐�o�},���>���}�2%\�KټKp9�.0k�\~52.�|M����q��gu~���P0�v�2q�S�Q<NT�ٽuFN�9�O�ĥw��"�=�ԉ�GR���pٵg"��S.����_�=�l�\.���dƦ`�t��9��*��,`fև��KKۂ w����Ol���oy4ʛ&���J�'S�R��{+�ed
\�_=�7�.��Ld�`�$=�j�Hm�d8�]u��m�#a���=~BV���v��(Q�xԊ�w�1q�tXu\fR�k�W� �_{���"Ո��wk�VukH������V
�R�.o�=`.xZ�U�̭�E��l�j��y����#�ѩo���M�\�[�����)��+K֭p���Ҕ�w���deZ3��'Q�[$5����r��><�ҭai�Kp�?Vx��%�����)�w<�����_�y�j�n	Q"E���bF��l%��o�p��Lj���0��<��4�=~���ִ{sS�����7uW��L	�f�����ȸ��E��/eJ�f2�Y����Ž��dJ̵/"	�̼�nC�#��+��6O�\2��S��4䟛�_A�L����	.#S��ר���22�[&$=�΄�!o�8�́F>L�����&S<-�H����-�}]r6ݜT�M��֣��T�ʹ����[$��b�$��w&t�m��Ѽ���z����	��0�����Mn���Cql�Op�fo�ȅ� IA�}�d
\�#�U��22.�?�Y�˯=@�����������J�Qڡx�a8RՖ!�=e���rr�G�� �\o����5���T¥����� �_{�| �wJ������RQ�HF��>Kϼ���em=���bf��5����B/p�kϰ�!�?��(�F��7����Vؗ�%.'S��,Y��X{9��iI��\{���M�'u4r�8�/֞�m���S3;�=����1�9����r�J�2L���]�=�<? ����k��NI?�e���~�%����C�TO#/af��m(������cM�3��0���hT(�'j�ߓp�y:�.�e׈d����=����Phl_�S��I0�%ǚ����c�Q�#\�-�}2W�K�(`~6쮆��դ�z
����M!܊'��%�!2��)dI�/���P@��dE�pF<%$$�[^�m    ��b�+Q�fĿv6fp��h��ț������ݑ��NW��B�\�,�"]��B2Jyj�$=���Ȋ&�(g��A�[�y�c�I����0*��|�e�0?v�e32�V0��M!c���!'n?��pYK�v����5I�/�'��e��9f����bF�-ӯ�D�nG�[�Y��1,g<�F���Β�s�\.�[�
��mBn;�`�"���l�B�� 8ţَa��#~��
��{��;4?�/v���93�1����g�w��.�V��:���&�AF��&�����C�`�6�=eM!�m¥�V���;?>�g}�~��f����R9���ٰɸ<�=�b�[@*減�BDNJz&���.�8@+6��$�W�·e�&���8z����?����m�1�?���ޚ�Ѱ}i[��Z�,�/u�д�[Y>�.#��"�=��yI���
x"�(��H��_�J�L�4�͡ʕu��f*�^��Gæk��^g�{9�����w�LN�����E��bd�۸.A�2�>T��T戹�x8#i��.���_�i�)0'�]���,י&���R�[�h��ߜm�E���b�	���){I�o�6(�݀�T��x6���C/�\���FuGT�k��nKAou�J3T4Jc�h���9f�'.AJd^�׸�&3�\�Y}.{��⵳1�QP�h�Z�Q�����äEJO�yrʟ�*ǽ�dvO�<K�t�a�K����[����6��d���Q���
pY!� �"|�$��'N�=H>��q&�X<N������7&��zZ,��L�O��j�b~2���,����7�H9�-�%�[BnQ0l�B��z��ZI�/�8)�Us7E@�pF<U}F&V͓SN~Z?��/	q2g��>���Piާ�2��
!�8�|ok���vP9.+ĉ���zW��b��'�zP<��15�[
<y���tᘗ��_3�3�f%`~2�Jw� P��r\]���!wok��Έ�`��
q"G:V�j%=�\'%�H\�5��q[3HP}4�|֋��iE��Hw�0?�QM,�u��@nW��Z[�'.���*�e�8��+��'�q/Z@�lF���sd�Ȓ#����Ku�>́�?���,��T&�G�d�|#@�q@D��R�ܑ|pi���^�����Ȋz|!���X�gd4�[����t4����wl��E�f#X3?��ÂC�nѥ1䣑��h���[B�����2��e�8��J���ǗB���4&�qM�pF(]9�1�hy4Jc����%!Nf��Z{�|ؔ���S�s�ʅFz���sj��R�jڙ�y���$ܶEI�/����t�F@�pF��	w�u�<���>B��C�?�I�_ߚY>촍s��P;d�9#G�4���]~'��W5DFT.#����&@|��!~((�&Y&yȚ����z�	k&Q�;r�r���s�I���O��k�􍨂�$�D#�y������Ekb��qY!Nd�|]
��e�/�8)�!��ߚ�ጄy���<��B����KBsB.W%�O�]�u[���
f4��nG�ŭ�܈�L>�5.+ĉ���I�/�8)2�jkP<�z�c^g��h,�1��q2ó.�N��d�-���c-�]_�%�<6�V
�.���'2>�%=��@� wZS<��>є��
F�����{yI��w�Z�a�S�Xi)O}	�#����x�9�0B���,}�pY!N��:�$=�"(�5�(�HټBY��_��nP��q2;Eg4vQZ1ˇ���vH��!1�19�M�x�w�p+�$�X��?�*"����B�
Q,���������xx�<S~n��^rz�an�nQb��'�6A��z�T7��ѱ��o��-!N\��H*x.���A���d�����~k�m<�@�_�g3b�f`w&��O#�P��	������˛���
�u��F�ɉ�玴���tO\������|���!���3)(�`�L��5œ��v�:u�S�T]�/���0##�_ٝo1?v�}��G��a�G��z��tK�7���j.+�d���
}^��R����4�Ԋ��ٌ��Bv�KtKh��;+�X�`F k��	���.�Q��(�H����F~��HK��p$Ge|�ָ�?ȝ�_��=�����]@�pF��gvE�9��֩VjᝌYf
�I�	�Z3?v�{�,*�V����4���з�8qI.�k#�e�d��؆I�~��K!N
�0�C(�H�lF��=�䔿ޝEꊅ8�ɇ��̩�,v�/I�2���ru~�"/ɭȐ.�9�&�e��AvHlì�=����.])��" ��X��3h4�N>���w� �0wQ(fQZ3?�ݣ&yF�X`�G#Gi�(�Х[B��5\C�B��p���Kz|)�I!�gdl�8vF��ry�ȣ�^Z?�tO]��G��C&;��r��h4~��"k��ېӪJpy!Ƕ���b���>v��
(����`�t�e^y�#�0o	�(Ψ�g�,�X���f����l���Q��B�.j!�s�\���2���mW=^��(��gƹ�x6#tG��=������{�*�f�>�Չ�`~4l?���jg���"�h�w��Ky�b8=���d��rHz�^�P��<I��H-"����?]���"�q�Y���.����ahZ��wܰG��u�������E����S���Dv�Oi;=�\'���~6�g3�(<W�e��w#3Ol%�S��3�A�!a~4l���E7��[�;�G��bc���H��,�W./D ��<^���qR Cn4�����-�8>f��.���U��5Ofk��!���Î�R��Q6Ŧ���m8�85��EBz������B�b9����Ŋ��H��+	��)?�4�Q�ZD����a�3J1�����a�a{z�I�'��5��41����\�F���B22�$m%=�X?��4/(���t��i�wG���zCm��b7a��㢒��ɰm�n�8��y�����
f��\��'.�I<l�B��9#�Q�|�"N
:�T��ɛ#�����)�>��X~���gV �̏�M,���5���6����xO���[s�\^�@F��_��z|�"N
l��tų�t�BK�s�%�z��m�K�`N��Q�0ˇ��9�C+�Te�"�͡k���w*�n�O�yڪ\F�d�?�]Kz|�"~(p�cP<�����S�/�%�H�D���ʇ�RJ�v�ox��dإ{��B'��
C>�[@>x��-!N��P�O��
q"8��*��o!�}?�����w/�x8#���j7<���dKo�:�Ì��E��d؍4pQ�<���ؠf����-!N\;c|.+ĉ�P�� �%D8�M�Ǎ���q�U8��'7���f �z}I��Z`�I.���.��mE*����٨��߱p�O�F�2B� 㞭;'��Ŋ����N���5_P<���F3�|h,��:�D�\yE�?��l?��`~2lG��#�<����4�Ny�'ĉK��ѧ �=���\��Q��Y��h��Rg�n;و�Cп�]gט�U�Wd���f�
��/��}��h�ۧ�yI��{�R�uL�	p�ug"���I����nm�9���X��?��F�T��Hrg��A��W2ڿ��Lf���̏��u�vds�b�q�]�8��M!7�e�p�ug"��oݫ���k����<����"@شȓ�a�҉�����������u	�����`�F~�Di���L\J����\vٙ��K�Kz�{���
�4�YB�d�n&7�S�:��КW\v/-;�#
����n�w��ܬ�{��q6ڇ��s�S�
��+�|^���L	��Z W=���C��=k��3�7EUb�f��n��r����?�	�/`~4����,5������~��{B.�t�>�=./DB>v8�2'��_<����r�`�����q9�O>�lJԝ��o	̾!    :_��;�t킫��r��� A��ǖqG��J�g� ��D����*�����ӃXt]@�pF�Vɫ'�� wc���/Og�'3i�*Z��h�f��7G�ȑ�ѯ�S�[}O��e|G׸����%��+��k��4s��9��x8#i�)�#��x�8\�̜�[B3VK6*�|�Ǧ����?�s��찄(@��)F���S�3~9k\F�dx3��z|�"������������KG^2O���2ξ�5���|�h��ɰ��v�伓L�8��u3˷�8qi�/�.+ĉL��?�W~���C��Dx�)�Hڂ�+��ˑG2
v��%!Nf����Y�aۚ��6��Qg#�T�Twj&��EH��F��
ȸ��1�z|�"N
����l�g��w��T��˦�bcO�KB��E��]��hؽ�m�d$�);9������-!�R��֚ �"�3�VC��_����������M��jO����n��Z'��uڻ��ɰ�gG���8�$��Қ����<q�%jk��'2��y
Ϋ_����Q�_1���ጐ�9Z�<9�S��V^�d�/U�Y��h�i�+H��vn���2������'D�R��RJ��B2�x/�uI�/W�IA�c9�A�lF<yZ�^���у/��(-���f�6�a�.�+�����hD9d*�췄8q��ρ�W��'2Rf��Kz|�"�B�[և����Y�)jWx��Qs��/	q2#���;�a�9�8l9n})G�<�HqSn
��C��BrG5�.���
�mw���[�q�"K��@D������d��Ә�]l�,vߒ�}��.CJ�F��o�l��#~p�C���2B� W�0�H=�X?m;��x6#T��,�yQ��hh�!'Dz'D��L[oi*�{�ϛFR�r��_�+�c�'D�ҽgև��B2Qt� _����1	(�H�4
��Γ�m��q��-!��"�r9�px�,��4ї!�v}zR��ȃ�Rp[w���..G�������dd���i�z��̛��QD:>�s����3r�T�8��ɏ���́w�S���� s��\�{4:��X`��[�=qQ��x�{���A&?���$I���
Og���d�œ�N������X�q�2%S�+�VfGihr;w6�`~4����t԰���>�S�dѭ�"psE��C����z�M�|���@�$ӂ��ٌ�iE�d��T?�s�ú��[B3�������a�ѿ�������u	�(�3��9�N����+���O?������v��>O]z�{&�?�0�s�^�2�AN;�!�+I����ǩr7c���׾�������h�A��F�F�N�����}n�;�\o6��UT���|E#��#��\�1�\dJ1�q)W�g���Ŧ_�Sf]�2�����/.ۢ$=>�U}6��d��Į��>�U���wH��*-���i��c����� [��>>p��?)	.��4.������H�?H�`��/(�'p�8��3�b�I�t�c~�qr*��\��
?�t�2���$�[�=qi�L^W.;�ל!�z��d2�~F���iM@�d�n�4
}������6�����̴�����ɰ�'��.jS
�^2���=�uo/���=����|���R��9�.pY�Od�Tp6Jz��^��}2X��덥��P����K�'���)��C�`���^�N*�:D�{.7����L���2�)�@�*�z|>���T�fr���CT�/-"����s8/�v�������������و��<��}�[r��,v���E@C�c��o�_���L	�������)��:1gI22�=1Jz|.��_�;�il[�Źe��0�28��dJ�d�:�{f^J�r3ܥL���h��y~u�r�ߥ�Y��͸��\N��Kb*AU�b�$d*��lS���T��j��z�&����P�=���5�3 �n����UaE�����2f\G����d���]��{��ĥ��|X-�e�4�3��b��x���E!++�*�xb[r���}�,�a7�0׮�:R��/�9���ɰS�n�x�	�)�(�2R�������K�Q�]��
q"#� /��/!����QP�tI�
(�H��N7^%��n;��1�%!NfJ��J+�'�.���ВUU:�"�F��"�����{���M
�ƽ�=��-8^�U��
|"W���C�㓍;�gہtCN�a��-�B[g�nʏ��2U����?�;�y;Ɉw��,M�+'=, ��°GsO��ED�JI����H$�Ν�.py�r����|���;��o�vG�,O�7r����c�d�/x�F��Ki�Rv����.e���p\���;QT-�a���7�b=$��L	�Kc=/�v���)!'�d?|���K����(U�n���\�yM��L�������y�=��djFク�XCk4B��3N������ٛ�%.#Sࢢ{�E��˔�+e�+z?$=>�)s�9���}N�,�"噤�x���$�o�6E�g6���zTĹy3q-�0�.��f�p]�c��W�y֩IF���Ye�
R�]����F��hVU�o->`��17#`f��'�\�b�N��\|J'��@0v�6��<R���z�ʔp������)���8�8�b�!d�������\��[|hE%�t��|ܣ�4�ډ�Tݩ8�Q`��J	���+�R��n�ΐA���WW�tQ7eJ�t���j$��L	w��i��.dJ���B����6GŗP�3�tn|��}۽&Sb��1��E+f^Jn�Ǽ؎x܅L��y3��I�uf�Ҽ-Of�w�8q�T6�f�
���D�?w!_�hO
��,�xr�6p�ʬAy͓�7E�z�o�hOf�*�	���6c���G�l���Fa��;��;7)\E&N4E��񃬱{��^���F�Ca�7E�,�x8#��0�3R�o����Ì(Ks^h���ɰ�s�O}�[p6*[�衹sU��k��-��LW�����g�{\V�?�D_�;B?~Ct�f�ҍF�♣m�%�Mf���z������[�����ݸ���/	m�,vK�r���sY�.� �y��.'S\)�(c�q2%�3��z��1H���g����Uܐ�߉�Ȕ�#���,`�D�-� :'�J�4,��E�4�A�Q���=98��aX�2�?d��s��r[��Vl�,�x��Ս�,�g����쬧��{m�3�e����ɰu2Q��ɒ��Ѿ�Y�;ﷄ8qQ2�y'�e�8�񆤏 ���H��g���M@�hF"eO��uO,y�զ*��[B��i��u�a;{�-����G#�5D`(�o	q⒓o���D�7����^��N�����32�WO(]3R���2��KϿ^Up������>P��d4�3>5k[o�i�m�LV�v	.�"���8KV.�" �^��I��x*#����a���t}�H�������SM�?؞�+%o�L�4�}�l�=�f�vrNJ�pُdq&���ǿ�o�3
�b�&
(����%f���Β�F�@M��1����n��4���hDi�hq�ޅ�ĥ���[�%&.�C{�\VE�%��	/{|���?�ǡy��Q����j��gjY��	WW3�i���G���

�v��O\���F��e?�D��F��(���OxRD,�%	(���+��pH�z��wl��a�v�U�ž��ߝ��}s)�m�w.K>��`����_�����#!7S@��Q���
s%u��/~ �?�;s��i��?hu��	��"\Nm�ZH�R�s��1������y��\��OdD�+��������E󗔔�B��#:T��g$�-[�e�w^>�p��i��dؾW;�g�i�������w���2q)�|��8�s�O�
�=�G��e�,>����K|q�q $����˟F(;���_��d��d.F�|z]��M��V� ����?� �]�Y|������L	�B̊uA��ɔp�T�k�܅L	y��ї8�i�d����N%X�n�ͱ�QyM��L�    �e��3/��)�!�]����89��R�ʔ;����U!�us.Ӊ;������t�➰�(�eͅ��Zm�^%=f��d:�(D�sN�t�V�/?Z_��dF�yӣ�������� �]�4ٲ�t��Q�}N6���(�ݓp�y1�\����p�|^?��[
�=��.�xb�:AXM%s]|����!���fKW��g�aGU��c�#�9un]F~p)S]vEpY!Nd\�5�Y���a�CA�s%W+�x8#yӄw��6Q!Ncio-�`6H��0?vrG{6aZ������u��e��E�5�� ��DF�5����[��gg&�nM�lF��(�F�٥a42���#�q2�WX�J��j���'��4Q41�<���r�"�E�N���t\��r�-�9%��on@
�v!��F#�t����������{*X33V��EfO� waAfr��;�-wv���7SQ5!�;7O\�=p�s�2e�.�
����z9)`��$�(O�L<9�Ҿ��~�m�y���~'3�2�'î*�-A0�]�+�
��(Fmn	q��|*�	p�um"�x�V]��ˋ�IA	��?�����-����ē� uW��%!NfK�S)j�a�ͤ���ǝ�G#3z�G��ڸ'.6�^��8p�n�[#��dڸ�B�u�3��XT��h;OGőaM������g~�&`f6׉k��6�
w�q�B��, �a�FnO���[:#���Z��:.�qO�>�Jz|�^�P��olE�d��䢃��ŏF(Q��E�M#a�LJ�fPE#�cG��[}\
φ�&��e��,$�\{^����͇������6p���P"3�h��D�W
�|�}X$h_3?6
���9L�jT��^���'�B�����'2"$ư���Eś�!W���,�)Έ��d�fŒ�qD48���'3J9[��O�}8�7�����F#���W�o	q�:��0����D�����zE��=ZP<���xp�@��o�ݱ�/	q2GP-`~4�t�sHF�Pf��a��_i�ފ8q)wGڭ�"�)����Jz|�"N����]��3��Ձ�� O��ǥZ3o	̰H���kf��������L�>�o�h���K�qF��-��RN���2B� SV�X����_��
�'�jP<��@�/n�"O>�,�J���J}�?̨�ƥ�\3?���D�ZS�`F��S�i_���� w&�x��
q"�@��Q�����I@�lF*]h�e�o�'{�\�zI��9��*SI`��d�~?<%�'K�r���O����-!N\����	pY!Ndrg�G��rE��9�.�x8#e����G�|�
��t���_q2#at�A��h�~�*���n4
[��N��K��!�
py!�R���E=�\'E�y�7��i[mXr�Γ��Ȣ��xK�`>���_������E�Z$�bR����F��y���z�2~��g��$�b�ڮq���2�1�&*I���J ��Jť3s&�i������cڇUQ�Pm�|� ��EP�΄��q�����4k�S;��v�r�����L	�5�j�p9�.��ef[[�2��e�J����4SIG���O��PǠ��dJ̈�ԇ0�R�����.eFO�g*�O{�3�+�[��?��E^�.��dJ���"F���
��z�E0��f=r�g~RG#M�t��YS��,汤a����0���G�ޜT¥��ŗ.��&�p�ȬM�.�H 7d �����y\�徠�����9�kk� ����b+����p5�63�Ok\v��R%�9*+�3㐌Fn�,�����>�p�Zp�5��<I��~�w�ED�*/�(r��esE4�w4ʛ3T����B�~����]��dضm��W���шj.��ˆ[B��xB�L��Y�>���G������S���D-�x6#�K���6ǒ���vPxG�oG��q[��6�3nhd]��s��ٞ�H�T_�5.��Ld:�軤�Wj��ؓ���lܼy�UU�y�4����y��a;ҶG-`~4�������e
~���wt��7�܈}UY./D S�r0E�/z|q���@⍰;���(���/�\��ai~I�`������ɰU����V;�r�F�2J#=p�%ĉ��s�
pY!Nd�ۚ��$=�O!�I���bfƕ|��32���fR���Vj���!6�|��0?v4M�d�9<��t�SPk����K�Vj^pYCl"��E9�����㾟Q�;F9jP<��)M�WI�'�[�8@�����!��b��> 1oj�X��!���ڽ�.R��	p�eg"�McN��KClR��"�x4�ūmGZ8�O޷�������Ɍ<���úf~2�W��w*�	q4=�a�*���E-��^p�pY!Nd�zW�_b��[p�L��5���Z��	;O�g�j��d��,��|�㐡��*��E�T�B#J���Ju�"⃋8����q!~��E6�*��Ŋ���h�q2�g$�T|������NN�I��|
�Ì3�?$̏������3A5h~26�[�:\�%�9h��ȳ�EJ�_��
�8�(���i��ѩ�'�3����"���Nr6	�����އ�*+�t�5�Q��ZI�^�O���mHw���k\F��>AA���CA�m1k	ųG����F�}lt��;��f�wٙ��k�'�V�z�
�.r�Q���X�g�N��8q��2�]k\V��,���!��Ŋ��������<��8�AI�����5y��^�d�KW)N��d��
�*�i��h��"k�	�y�i�.+ĉ�� �\^��rE��@�F�g�n��ͳ�'/�5 v�_�d�3`j^��h�x��l�yl9��X<��E�	��3t�
py!5���s���qR���v/�x8#}�;�%�w ���k?��"��C�.`��n{qjk(W�h�<�t���؈܄b(L�5.#�2��#�f���+⇢��Q3yw�g�o	�a_̈����u��B�0#�X�^��d�JŰ���!���㟆3s�%ĉ��G\�B��t�_x�,{|�"~(�Ș��k��3R7Cn�ѩ�͠��;���f\�&*��=�|�msJ�$T`-4�[@|̮�؈\t��!�e��AF��݊z|�"~(bϥ[XS<��at<�3���(��"��;..?�aǛ��f~4�0�9Lk��`�+������W�܄z8L�5./D S��������bE�Pd	3��?��6��ÞY�ڬz���\���%D0Ӆv��#Ě�ɰGk=��b��e4R�l������Md�����'2�k�$=�\'�rƢ��g$��h���o��u���%!NfrJ]W�a�q,̤�tt��79�䥑؛Bn���8���L�r�C���rE���Ǜ�<n�)�H�����<y�G�����y2Slf�A��d����i�"���n4�{�;���-!N܄�8&Hh��
q"C%�	}����8)P�K���pF�XrH�9��Q�������'3�����a�>A��2VnE��M%�J��Vĉ�q���W���l)�N�]�|�"N
�c�P<��hg�G)ͳ�Qo�Ӄ���KB��H���.`��Z�e�/tXQL�h4ǩ�l�N]�nŋ�Il���L/�2y�.z|�"���͔P<�z>3td0L�8��?EY���?�T��p��5�a[�]�]�sf�|4�1=����x`�\�`r3ײk\V�Y���RI���CA���fj�)��H4?>صZ�|�KG���KB��fZ�f鰵M[�;��X���rh��\���%����Ѡ���Kܿ�.�ɩS��
�T�� S�[rV����_��θ1A����J~?���a��N�� �`�]	��D<u����"�p�w'�p���v/��&�p�,�C������+�1*E���I����~��a���?�����ůw��~�� ��uF�|���
�6�1��ώBq�C���T*��Ɖ�%����7�4%�.�FL�d����/{�{��~Fq�ۢҒ�?�    ���B�ޘՌ��j�g�_��dNdh�V��a�mף�t-o���F�[�.��?�T.(�=p!~�����]��_B��^�7E�j��8�F0�\?�,��b����OבCi?�i�ƆK?��1KЈve�ޘ���?�x</�q��d�J��za�G#=Vb��T�����4n.����3q}B=g'�e8y&_�F��s+O�@�#�en��QF?��Kz�̘r�3�󝸺౹
pY������k=i�Y��h����L	���4sHp9�nG$���.d:��#�]
I��s�jN�5�<k���[����{2%�RY��+f^J�#t6ܕL#����j1s�ц�ܴ�������R֖(���dr��{P������/s�CQ�8�ţ�-ڶu��Ty�uʟ�����/���{�Y��dئY�9J)Rt��hd7S���[B������Q\V�����I�	�鸟Q��o��<��L)�i㳑'O�-�C�$���P"y�aۙ�������m����WvaF����\�b�Y�j�Iz�K�6���BQfʠ���ٌx3lN�r��|4���Q�_	���^T���s4tn���_�R��Б;nA}���tp�&��e:o�2��5S��/����@��\b�)��M�Z�x�x^집���������Ӭd�̏�݂�,�2d�+Gނ�������\�ԽQpy!��o�=%I���h�P �a��5��I������ɇqN��S��-!�Eⓓ0?v?eh*:s䩦����������5�s�O\*1W�r\V�I-t� �%����
�q��M�o<]��������6@ݶ#�K7I�|z���j��I��'�:~��:D�tv��(Q?��w�.F���m��s�N\�����L'2y��~dI���i�5>�y��?��G��R_��d�tCo�!`�4p)t���pW2�%m��b~��DF�0�����=��y���ed
\r�Hs����e
drM��s��6�ɴ�LW(pE	<]ނ�ȥ�ޒ)�Q�����3/�<C�F���i�Y�k�hw�(HQ����'.*57V�K�s�N\�8�]	pY�Nd琒E��d:��VQ�7��J;I�	ɿ$���<��3/��K�𒪻 w%SJ[�Ӂ:��*�0߷p�CC�'S�U�Ab��22.<�U\^�@�*$�D#��w2=��vԚ.;�>P��F���x%F�f��(�3/��K^��`������)�>U�aW��?|ܝ�%Ӊ�P��'	�L'.�<��.+ӉL���|���+�$�u��5+��b� Z�[G��\᧨������E�#k�J�}|�J����Zd��ނA�����SQZ����p>O�}����f
F�%��)��*y*����2s�)���y!��*nǨ�N���¬48L�zKN�|�29p��4q+R����+\VN�L���*��Wr�7�+i˞��HGحF�$��L�Yqo]��K��t���x��J��	��é���:���>��{2.Mz��o������d���22=I������ɔ�G�Z�%E�.�͛�������ɌR���8Z1�R��;�Qf�B����O�۸����
(0��-�N\<�CKp�e:q�aw'�ee:�q�����e����AwF�l����������d�<1�	3+%¥,1�(N���iUi���?J�:�QF*R��{���ոEؽ��)p�Y؟�
��)�-=&�p���w2���u-�4��'�5�t�%S0wd�c��W̼�2��!\D	p2���di�{����h,�H���z.ӉK���c����2��T�/�*�/+ӉL
L��B[��+���ń��<]ؼ�Ռ�K2��tl(�F�=3/��K��Q�&�]�4����;8�Fz�����L��02������L���	ӭ ��)����� ��w2��4뎎P.,>��O�ٗ�l�Ɍ��53/����d�d.+Ӷ�J�m�A��5�a��s���>���2̥��L?�S㌷�ed�A���x$%��2��i�<Og���W�2�0#Um�f^J��G�tܕLC>�jJ.u��XB��ώ�x�ܓ)p鮷�R%��L��Q�<u�qy��JEI���i�	����l�?�ʼ֫�-��N�3/��kI��W�J��h�4B��1X�u�H½�tO���|;��.�ed
܃����L'2���l$=�N��賌�0�O�7M�m���-�����E�������-���� w!SE�/#=��2�=��.�!DK�!hNY	�L'.�L+�.+��c��"�%Ӂ6Ց�77�.�ś֞�ޒ)@����(a�f8	뱸�]�4�J��Ǫ9[o4�|�49����N\
�;k�.q���-���W��L�)k�����4��dGa&��Q&��ԚyK���of+`�D����at�.d:>�1~�pfאѨn�"G�-��\= ����=��ĵt�Z�2��A�I�%������*"��->P�� E9��L'3��W�̬��$�5ܕL�)��o���i�&m}����&n�)���)p�(󰥛 ��)�+~ �Kz��L��%�O�/By���ﯤ���y&P1�Rj�q4�t���i-q��5�ٟ ��+*?[���d
\*����%��L	�Q.��./Ӊ�S���w2%w���6,>�X�2���l��'�V������EZ�=h�B���j����9�l�}Si?+���t���T$��2��t+����qY�Ndʊ�{� 'SCiqq��p�7E���U"P,S�N��荀����5(	�^�pW2���bur��29r����L�K�r�V�����1X[z����դC�����: E*��
w�7���}�z2S�d����R��x�� �]���fjF��?���atS#�;���)pB%}��22.�2�c�py����?�������n��u-<E3Ӥ������l�겱+f^J�R�G�h!Sk}�|bʜAa�9"�䤽߳M'��4ܕ�\��[��2����=fI�����Am.�m��~42�,�]��d:��^�ef\3�R"\Ԃ
�;�
w%ӔGc��ס��,5J��I�۫.�ed
\8�h+��eJ�	[m}��d�rv;�ܶH���H'Tޒ)�g͙#	�y)��гA9|�dJ�c?
.�k���P�v�i�y��~��^�22���{�\^�@&�Rs���;�R���ݸ���-��S�?ޒ)�#�ƴ,`�DE��hfs�.d�����2��{|�]ߒ��m�ʒ�\���Iw\V��at��+��cipꎧ;���O�
��#��L�cQ��Ki�v8E�,�]�4?���g�G�6Md<��K'.�����22.�3����L�l�n����ɔ��4xa;��ސ�!ťyk5����{0�R"\�-��!�J��Q���;���P�<�i��'S�f8ܱ/gK\F��������2r�UI��'S��ʬ��F�.�K0o�&s�O�l0�R���+�I�����)\�u�]��Fc83���M���+��d���2���J��v.+ӉlP�ۊz��L��U ��7�������/�t2ó<+`�D+
��ܕL�zp�ӊ��|k�|_���O\�@jA����x�H�%�
��)�Q����'�@�3��<]��Sʿ%S0(!pT3/��S�v/E���i�d�׭�L+�
W��v�L�k�.����)p����22�"�n%=�N�u��]%���tc������'3��ɱϴ+f^J���f�V���iP�m��*sG�@uF�m鯛oF�������,q�e:q�^�]���t"�}�z���W2U�=ng֟(��c�1���f� ��z,��Y).�ny��J����fL{;(�x���nXo���ݢ��$��L�ې��W./S ��ї�N�n3vx$:�#q4��l�^�����"�暙���=�[� w%S:f6��O��l4:�O�3��c�ĥ8��'�ed
\G�I���e
d�B;���;��5���z�����C�/�ߒ)�#5k0�R"\�#ɋ��dz�����'@?�����    ���Kw9�o:K\F��E�6y6~���ȸ�Ԭi���w2=��	2q�����%ֿu!Ц���vӂ�����%�RY���i4FQ�\�p��h�o��e�.�&.�*�#��s�N\��_�2��T%f��t��d:��f�U[���4�#��N���V���0�R�~�w�J����<d˾p�F�<�鎯߻ޟ��vG���)�ƽã+
py�Y!�I�'S��a��;�:O�f��R�[G�Ɍw�j�����0��45�pW2��*v�s��o$���<�&..��\F��%�l���22�:K\'�\(B�
Sھ�����(`ߒ)�)	n�A��K阩KǷ)ܕL�x���-�z@�Fuk�&���wҟ�A�O���)p��E��I�py���������;��A�N���Q���/����d�2i��.�+fVJ�K5��J�-d�4=M;<RWnrF#3�&=�F�o�t�ҁ$�En�{.�\������L'rD�{ٗ�J��k��)�W_4���[+�d2��x,��y)y�v�ѥ*�]ɔ��!�V:,��Fe�{��ĥ��X�%.#S�"��-N���t"w��}��d���6��	<ݱ)���W.S0c5l�ڊ��m�H���n�pW2E�u�!t�b��7OvT<T�'S�R�~�����)p��M��2r��.��i���d���\���`K7\������L7�i�A��Ki�"oja�~W�+��a�)C�*ѱkHY�|љ{�'���b����L�K�mc�E����	Mv	�2� ,K�9�������L�L2->3/%J�g%�׸�f:�[<p�;�Q"Os�s����ĝ�NY��%�L'.9K� ���D&ߝa�I������w�􍆧�
}p�������>�:���y).�����djU�.�]����n	�S�)S��Y��Ip��J����Ǯpy��̔H�ʂ'S�������˛�������M������t��Ki����e=hW�+�ғ�G�f/�F#�)�s��^��;K�*%�ed
܀�����L�L��sa�[/{��Lð���z
<�ߺ��J��[23y2�Z��������ns�.dZ2�A!w��ۉ��o� ��Mד��
��C�{.ӉK���$�ee:�)!1[����_%�Hc1�������V���[����6��f^J�����c��]ɴi*��Ք�MG#�������j:q;�C��Ȕp�N	�� ��e
d�S.�EI���i�vk���U��,]<Оd��o:�+e'ѬU�b�4p�nG�"�]ɴ'�5�7;v(�65���9�m:q��T��y���L���D%��e
d��)�5�=�N�dJA���<Ճ�xrx�5�QeO%`�df��S�.dZ)�#a�a-��H�M��V�n�t�"��*�=���E�o$�ee:����x�qh��d:�,=�ۛv<�8�UĴ�����P�2�]��Ki�Ę�Z���)%EJ�F��zÏFm�HV�ý���͔�+������L�7�� ���D���Z��'S�i��L��4R+��kix'�A���̬��2��pW2���?�&�8�w4*Ú�WF���?qi(�g	.#S�R\XvE	py����ʞ�����ԇ�
�{��Fq:��d
f�S�
�b�t�I�^�X��J����ڰ��Q�,[E_�%���."5Ip�עވ����)�Q�+�!{�'��X�i�,l� yĴ�ߵ
�2%�D�Rc6V̼�.9�HF��i�~����U^N9��A!;P�w����z��B.q���Z
���e
d��lA���dJ6��M`S����������d�v�0�R�tY��+�V�g���;�9�������e���(�s�"�ed
\r���=��py��R��MH���w2���J�6���n�)�M�����d�뢄������\��dz����H)��SG#�c�.W�=ד��P���)p=~Vl��./ӉL7���������ǺL��M,�F��ί���P��� ^1�R�q:��J�T�d���V�L�@�W^N�^֓�K�g�$��L�[�7/\^�@�Nb�-{��L{.ci�|�cj0󹿶���KIf^J��7������n�;�
5Q� lP�����E���>�.q�e:q=�.�/+ӉL^'�/����W2m��<.��b t�H[d}-��d&��hػ�3/��KN�?Z�����vk䇐{?��Jڰ���'.yo.*.q�2=�:V+\^�@Έmf#�=�N���-4Ĵ��2��"��_��r���Vf^JdB���}�Z�djM�<����9Ce4
�B��~�6��v:��n��������X��22�K:$=�N���9�GWl2%��-����dn��ͼ�b�4p)"�.�]�t��m=�]�M�8��_~�w!5q�Sj6"m�{.Ӊ�Pk� ���D����$=�J�)n5fCY�d�t�[2����g�t��y)E*O�r#�]ɴ��ҳ%�^��FǶ㓺��P��M���ed
\א��py��"يag�'Ӻ������%rm��$�ZF>0+E����b�\Z�rfs��pW2m�l�P��z4�1��{���E�9���/q��"����)�)1U��k�e���is��ѱ���e\���.�&3>��A��K��m��Ol���J��s�GA�f����gk��Cj��[`ql�%.#S�;Ņ56��
��)��#�Kz��L7�\�MseO����:U,ʭ���l2#�ӲǑ3/���$6��
w%�>�{����֜�w+�>�8���G1ۜ��)p�����E+\^�@F���}��dJ5Oˁ|��)5J�i)���O���_�̼��JsF�	.+�ag�Fo^���	����K��N��H�	�gjY]�����S�'
p���>C6�Ya�{=>�i���o��mVa�dr��4�;������������D:>�r~��~�Y^�&�
�����!E_o����
:���r�J��-�n�ָ���A�$�qg|K.z���CHc.��@�����r��)S��|��G�|Y3��q�9�5�j�Q������Y0Y��9���L�p�qZ������L҂5./S S,O��Hz��L�8��8������?��-���&!g3/%�,������]ɔ��� (��E�a&�k�'S�­��(�ed:q)Y����)��hm���;�jCI9�m1����%�ԷdJ�p1͚	�^3�R����Y��]ʴ��᧕^��G�b���L	���Rm��r2%\��):+�B�@�H�%=�R�t�F�}4�Nou[�~O�Č��a����mt�I�����vz('�XlC�u��g�)S�R`m��m�.#S�:��JY����1�Z���dj|���<��R#M��s��� �)���k/`�4p{k��.e:�v�x���L���g펛2�q���.p9��!1um��2��-G��)�FŌ������F%�jz�晪�&3+%¥����.�]���'|����%Ծ���8��T�\F���H`}H�����~M���dj���9tg`
Og��)����L���.I�y)\Eٽw)�a9f������o�ޝS;�M�nG���$��LnQ�x�C���)!�m4F��/eJ���A3����(YZ{��-�sC��$a�4p��F>B�.eJ	�il����R\�h�B
��f�� ��dJ���܅L	9���V���_�4�@��I�,�d�Cчy�Ju���R��E��5�J�yWc�k(��N{��l��p7/���m�+�ed
\�t)./S ���C�������ѻ��2ͻ���jX��t}�r8�~�1�,�o�`�fM�J��T6Ї�[$piǎ�_�r�J�h�{�\�%����9$=>�T�%.7���bp�٨Q	����`
N�̮�o;�=1���ړ�f=���K�<~�����q�\܄��,,p9�n���5�b�!d$v�r\\��˵'�&��9�*4
[�x���b�j��{i����	5���Z�o�=�-8n%.7��[�<�^pk!������� ^  ��ɣ�r�s��i���WI�kr��^�(`f�qTٓ�o��X{t?�-�����~5�둻D��ݒ�ĥK��J����t�62�ӑ���3�Q��$'��L#���~"Ӂ6��TW������(����Ye��vV1��?8�̍���8�voG��tO�����Y���<��{\v��A�w+]������gՐ�����O��K[�p���L�]�4�����of�o��'d��b�z��{�.C��XXSJ���c���Q�2%\����h\N������ �]|&�G5
�[k��s�zN���gAbv�B�B2�q�ɔ�m[�\3�R"\<����F_�Vqx��Z��kL���%����s(.+��|�[�WI����rZko�~FA�@q?�����#����g���W���[��lV�e�0�T-/�w2�*|e���agJ�1�*t��?Q�<: �~K����6:#�e�߉L�}���Bd�P�n��)wE�hF���Vq��4����b���<��>F��Z��"]џg`��FG��L9�/g�.q�N�{���A�Wl���?g[J�rB�a�I�ų�Co	1����l����?�_	��ì�qq��u�,��w_�ߢ1�"���O��Po�X����i&5������tRQ��_B���3��(�����ĭg�?�i�i��]��Pڮ����c�O~�C��{y
Q읂�Ƙ���Ң�Լ�J��5�X%���3E�@�f;dkXj�� 9�L��+���^F�)�x0?�,��83?/�h�����da���p ){� Qd�7��G�ؙ �aH�~n)�т��Xc� ���D�g�� ������� ���      �   N  xڅ��N�0F�ɻL4��Y�H�4�F�$з�H�� ]�����ͱ��a��뭅$j��V9�[Y��KOr�דq�P�a���ɑ���Jz"q�pk�Q4���#��]���px�u��;��ԡ�������|���Ѐ�V�pG�K5�H�ߟk����9];j���ɶ�%_/˾��;]�3Z��=a���y�a�[��9��ϫ\$��{�:����Y��������QB��,���߯��m�'���pZ��9<tD8>4�'p�֯�߮[���6j�����c���)�t���P+5���ڏ~�����v������<�]      �      xڋ���� � �      �      xڋ���� � �      �      x��][r��vV��[H� ��"�
�����pʲ-{t�=�f��D)W�H��[@�+��5�6MW�H��?�כ����Pм�I}������JP�=�'�����M���Ct��a���;�}�����|��ź���짿�+�������;������-�H�s�!���̀���Ǹ?�*T��ܟ�C�!tO�����
��H{5� $AZʩ��4�Y�k&"M˟o������?"-�ћ!9��� i�GP����rSo@�0�UIy~�V�5���8����gm^������FΓ�c���V��D���w�v���OO�i�fX�0ҒG��O���}���W��
��t'T��*��;U�I��h�SD���Kճ������u�|��g}�}��50�d��ZiQ_'f��q���Y�����팏���jv���`F��}}����Ŕ���C��4��6�H�h����J>M�ۙ�ӼFCo�I����C��ğ��ю���'��Q|���_t��i?��������A����:7^���3�~�V��&�#�>�0>���:�KI���ݞΠ�NC���q�^}��f`�a?���p(�NB������~�w�1�ct�k���I��?:���<�_}1#5>N��{v�(�g���?cG�pގ��/_���*����:>5�l�p�^�x�h|�f(�!"_O�p���s1����sH��:큼x��� 놜���s��Ќ��9�c��|ſ˯⭹���ǵ$eй'�$ytγk(>1b���"й� #ݘ���@��"��ƺ{��Y�@��� %>P�E(f`��_â�����ܝ�5���Zz`����1�u�t_
�1l��q�KG�t7EK7�E�^[ə����!�D�z��w�ݘ��&�s1�z�h�>�~���4}	�31���p4�b���RIC��c\i|�(�t��!�6�!��@'�v!SR�<G�V�͔T��A&�AՅ�)9�)�qN����ᵷ`��l�^ilF�QK���;'wiFi7E37:4�Sǃ�V�O�K��Ì"�Y�bF���<�3�i̔���(6�F�3��5�&fPN�
�d(m�B��$#8z�Ͻ)��A��L�GTt�PtGo
�����Al���)d?*��:I��ܱ��1�s�c�=����\�`+�!��9^�{�R������r���9�<�W�E�]1�#��)ړ>0>��"��vI\���� fpd�U8N]���mߩ���'knV��9���+���a���ҕLa�$u%d�V��(]�$���+�
&Kh*��(]�f�
���J�Q�+���0=T���t�JnY�jqR�.lÛU�Ƈm_����,��\��C_帰�n����l»O�{2�Ì�O�K�N�}g��d�U$�'2�'��~u�4�	-�({���M���32Y�He#�X��3����>Q�ܮC��>^'�n���lF`�y)�	1�UOT�a#��^�����O���d��piC-K��ƶ��j�}� \����_	'�,� ��_(iv�iQ_�fD�0�:��{���9Zg��R��3J�UF�*}Q��Ͱ�C��j��H��>��Գ5%B�d��)P[i�1'5��	����cH��� �59_(@�R4ۓ[Wc�_�G����hq��`�W�߷tӘ�����{?���^���h�κ��\��{?���gF`�D�����C J�?��������[� ӵ��{b�Q�+��:���s5�D2��a	��!B�(uW-n���&�\���na䳲��������0���Y� ��wg�<�#��D�#�4>�s���,�fF��:�0#pV����;�{HQi��%i_�W��[J�R����[b71{��F��/��}��s�i��}��J���sr5+0�<�.����z��!+o�T�h���;V9b����dt2�f?r�%��h��A�(�r�5J+G4͙07�u4K�jyD�-;u�Y�@���\���uli�L�It��3�e+D��J��i���"�+>.w�G����M���h�4���L��P��=I頚z�o�Y�^�&$��k�r�qQ���;0$	��Fڱ�TfPu�*�;Q��f��K��Ɛ����+��׌��>��nֲ^6<�M��u����l�ƆS�E���̥��zY���_s>�0#1��3Ga��!��z��,C����1|�
����	M��Yc�[Ϳ���9j�(�Ʌ�Ȁ��ͺ{Nc�м�L7�w:�Z�9UKRpAEg�]�Նe�F(W~��-9Cu#��@��o�W󛤵�%��/��7'�e�f 㶚���O꬚�S��X1����iKd�W�V�u�|�[q���ɆwS;%���y��f�]�2�&�$)�*{��hi]�qA���R ��K���\��}JѲuK�����(���[y=V���ĺ%��e)È�!wX�nɵ^� -č��uK�s�@�26>v��Y��+����I8̨��Hк`oa�D2�|E�b�x|��\E�?��"*|~b��8x�s����Zk�Ћ�w�[�����M�u:I'/my6�E511�[0�z Ԋ[��,tPS4����4V�$+-:�_�q��)K>{��Z��3�_ͨPC�H0��f.���� ˶Y�`���f��k�De��U�z#���2[l̉���2{T��9ʬ4Q	eᏓ ͪ��^&f�fAKF/�W�˦(�Dچ8��ը�@���K�`�?�|^�+L����h��&�u���Y��x��Ԥq/ҢHc3l���������vQkf��6�� I4Hڄ�a�&��R�[�8��Z�ٞj�2͵tt���lf�K��A�;�����̜UvN��H�Q�F-k����	+�O�m^%lowP��ab���
����Rˢ9`iO
2�"��!�W8y��~m`�!��C~њ�vr��$ù�mzc�ag��`UE�#��:�[�}�V��3�j�+� 3������hT[W����
j�<�[�8�B�YS����~1�
���z[�D�
���8ݬ��~�(��f�Qb��{���Wn�˄5;	#�PF������jO�x�)9N�����.��tx�4
�Y��~��Gj��!Y�=]�,��&d.�e�@��n����fi��-D��Y����f��?�4Yٳ`]�?�l9k�([#Q����U��Q���8-9�<�*6������Ih ���x4�e5��اEϱR)mU᠆jq���6�+��!��섌��$t��}�tk�/A�w{�j<s{�齩�G�l�<��p\��=���b���1�c��6�H_�<��tc�j_��Ñ�`�c��e[Q�/Lw��d�]���m+ʄ���@�|#JR�=�$�_W��p&ɛ�-���F�x/�	�I.!Ѣ�ۆ���"D��������0�)C�FGh�@!��l#Jh&���$��ֱFrj�z"E���RƘݲ��b��%%Bm/�;���~Jj�P#B�7����~k�Y�V�W)�V6��N�b�挍y�%[��屵�f����
˖�M�]*;]�|zl����,3���e�P5ö��*����R&�]ď�!{s�Uv˶�d%sML���Vp��9D�Z8�vv�|�X��"����W��4'_<x*�(�myabө.���m+����`(���v6B��V�f�����ɗe5���=��yG[�8�YD��Y8jЃ����H3��uU�]�y/���c�EߓCk&P�P��#��%�+d�Ō���-�1��]>�]����.�`�!�5U��r���iw�6���)�NUe[k����7dU��Q�&Ir�D����M]�ctV{�o�������2Áv�?�����Rk׼���(s�3�C!p�GMi_�9�Y��X�����g�t�d�8�k�/�e+�Jj\�DO����`�uG�F�xԲ�>;��(��A	2��i��vpo�Y�x��)#M�1Ǡ�e�!���2$�Ut�>�V�̆<�b\���^W�v��Ӳ|TG<��%����(;����_��|�_�	zI2O��u   �(�X,=�n>z����|�S��ﯨ�壞��<�R0��^��$����J��Q����1�z{�-��0#f(#��A�˱�Azʉ�ҖN�nF�7ϳ�X$��~V��e	$����{غve	��sU��M�qY�4�\ �����}���Q"|�zw�l��l�.�����	M�ea1��J����6y8F��s
�F������Q�w��~�K����&Wȃ�H4�o-�!����G.��Ժ�=�Ckl�N���N'vypX<ı&/��,ypH�X�`Zi��c���$���-����WA�����=҆�gH�J�^/wn=ik�Ġ��	k�u�i�>C�Q�}/i��t�f��_GvF�qK���{v=fN���(��8�z��C�Uf���mfq�>�����Լ�3k|$B�$'�����D|$Щ6vN�hN���DJ/ �>�*�������0CSG�˂�oZ�4�g�Rg8�:�+���'��$q���yݝ��3,+��&f5� �O��?�3~E�#���Hf�_6�t���윢���������B�&��(X%Up�8-�e>@�i�iG�4?)N#�b(��|�d�ʹ��A����E2m��Ӧ��g�c�i#��O�rqYF���q�e@_��~1n6#SA����DK�*��� ��tհnE�wd-;�E�dʺ���?/7Sh�d��S�
�u�@c&�ʋ�Qb�ȹ%ːUӶFpL�����|9:Ӟi���ǌ`�ͷl�G�������i��(>��$��`X��1(Q]t\�ȷ�I�Z2{\�uE猋)�R	T��I�º��,���� ��δ̴i=o\e,�	��GD�.�b�]I	�+fs��\��9\�5���^�X���@�9��t����뱝��
D��Ӗ##-ҏ&�,_u*W(c�`�5mG�*��7�(�� �����)v�Vrpˌ���U�'��|����#Ө�h�.�aZ�������ӎ�R�fN��g�dB��MAڢkd�/�oA�,������LQ���wrY�;�,�?����;��      �      xڋ���� � �      �   �   x�uP�NA�}_�����tTQ"��i�u$]�>��!�����an�$-���PD	�ŀ���@��e�_�Fu�Pk��H���)a�&��f54��e��t��&}�r<��f`r�C�~D������rzz&x��!ptd�d������*��k=�-������>W�C��Cf����*�G�{�Z�VE�C��m[��y����bB      �      xڋ���� � �      �      xڋ���� � �      �   �  x�ݜ[��6��'�b���������a��hvۗ�{jɛ���%�L�@Jv�0���?��Q���)�A(&!�2��e�B��w�9Ȳ� ���y�/۽V۵UÃޫ���޽���Z���a�𪋯mݸ�=������n�����8���nx�^oV0'��;���a��~q�>ܡCI$g���]�����=Xc���!X�^|�
��bx�`�����g�Ӹ������])��=��Χ�`	������ao{���v?8e�:�_u��Sn/g!�&��ܯG7���Ǉ�a�s�.���p>o�>�w���uhgh�j���Q�v�S�f��D�X�����n ��v(ؗ���<8{ܺ��|�pl�8�m3����}	�3�M!�^�B;�J�xz���}���8_��C��̸�o�����m"� ��@R�
 ^��w�����P�,V��xH�X���#5���?c<NĿ�S1�$��~�i2>��b|���D�x��O��ϓ���k35<�ʇ ݋d�PJ	@0�d0��4��Gb��.���"�71U<�%(�]�E`�B��f |��e	�5�fm�e:�@�����ͣ{��ܸ<�p�O�U��8��% �T��r@��V�7��j{��ڪ�q��W��X���J��X%�W(�m�Mm5/*S[ͷ䩭�;��V�%sj��
0��|JwMf���6ˣ�;�\2j�����wf��m�b)_6�K㯦� saa#�%(ִ�Vk K�p	��l�U���0��}	�5m�M�bC�cK �g���>�veH��P�&[��]��8*@y�MΈ��&gZ��&g:��&gJ��&g*��&gR�k6C�@{���^�#��!�9ۂMJ��M���k)*<�#Z�JP�m��F��0��^� \�&[��e\�s^�
ԶɆ �P�
������5_����ƽ�s^�#8QE'�h���v�ؗ��jW�?���X!'vQ���8������D����/ho^M�)��	�n�2�o�5�(_��sK�u�Q�z�i�I�����^g*@R�3)�5�!�>��
���ی8$�!��x�{�P�9��˦wi��YXT��c%(���6{�C����z�"^�
�vŭ/���^�	��xk�
WpM�l����j���l�E���ˉ>Xݟ���&�����lKN�d��$l2[26�� 	�̦t�l�j�;�X�2�s� ���q6�[6�K㯦$�1U�/A��M6؅%&�_$M��d{x����-���m�-�8�`	Y���k����@�P����&l�=ʁ�����.@��̈J�&3-9i�����L�L�d�$m2��]�f�)��&�M��ġD@��#H6) ^6�K㯦>o{cAJP�m��&��-�JJZp]�l��)'$t	��m�E����k^p]�l/P���-��	�l��Q�l��K)/�ɬ�$l2ے6��0	�̖̄Mf+@�&�)�5�!�0��q��I.�d��m\xڄM�lz��_MQ�N�Ց-A��M6���3��% W������x��d��=�y	��m�9�
w#,K�m�&�lh(-aʗ�dFT�6�i�I��t��MfJf�&3 i������	�EV�Ik�S�a"F1`i�셨o�R��Z6�K㯥����mreJP�k�mv���4���6�"^0�;<S%�ֵ�6�����k�d�x����X��ЀM�H9�l�7.����䌨Llr�%Olr��Llr�dNlr�Llr&��3� � ����d��	�w�J����k/ta�����������_~�����0�w��=�\u[��c��������8��8<vq����2����'��6�|�Ë�A?{a�����bD�|�>��!�_`���_�z��76�9      �      xڋ���� � �      �      xڋ���� � �      �   �  xڝ�[v[9E����^A`�GP?|����Nd[Y��H$���yPYK��,[�c�|d����RH����Ey\q�p�=���#��/Iy�5v�&{NI����+6o���e�`���mZ�^%�JSV̫ϘdJ+�԰��.MG�$m��{�%Q��ʮk�l=O{7/��_��!9���4|��O�����\c{�d��f��?�L�5\}��l��F
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
�@Dי��Tu2m��x�l&�W���M "�<��{E6����<v����jy�D�e�&YQV�5��ty�����6bL�v�bmk�zI�����}?��Bx� 2%      �      xڋ���� � �      �   �  x�՚�NW���O����a}5���	k�F�r��Itbl��⧟CC����ɀi�����U�ַ���j�$Y�簆 ��e�܂9r��,|����H�5I�55��؈�c;9�vbgg�ڢϽ�]�{	^�g�e�d�[=�(���f�pn�Ť)���ƞ�7ʆ�I I=$�TCl;�=֒�h�TS�ǪT�[Z���EP˲ֲ��S�����[l"�·���x>~|��J���7�);�)��	��ґ�<j�"8]Rb���_I/�'����/W��p#�y���w��uI�RVu���������Ѳxt33w=�_x��`���n�EKk�y=�[g���:�u-�h��򮈜n�N~99�� �&g1K���g��50s�.�k�PE9q�`����Sq�����tHh�{U��8E�Ȁi�Z�fU�N�+5i�����c�qMb �Q�Hw�^�? �r~0H����Û�y���*%��>�n����_{?=����/���(p�]B���&�\�5���h%�1��K��G��P��	���6*�R; �ؘ2c��j���=���yt�& ����$��2�e9��lwZ��{�r���������˃���ۛ�yr��ZG�ՋBԺ�����c�?�Gp�BO(�H>��S�=%��	��l�\��$^j�R�@�]td�f�F����X��r:,'�z�#q&g/Bk�Suc���C�間fD�o;#�c���ʐW�G$2gy B~������əB�%(�'J�y�ame�㊢��@��3�p����[�B�"�5�{�ڲ�G��ꮹ�C��J=a��9���\�ww�d*h7Z��R-:ql�2�y�"��a���(H-�x���6�e�������Cפ0L���I��4�7N�C�����wx}{tp+7Xt!z�'�Q0���F�����@)����>P���=#v BSHǏ�M!5Br,����;�:���R6��X�7K����q�ՅQ`����2�Gs�C�ܢ9�,���O�D�Ōh�.Ĵ{C	�>E�����Jb���\/޽[o�f�����nu�_ `P߱�4T�Gxg}�e��l�w��	:+"��g]�Ƒ{�Ui���Dj9�DC�+�{<�G�m^�V�I��GzG���+E���}�V/�t�۶�  �ΐ������s���_I�A�����[���L�4�2���,���81��)�v�9 ���s���D�p�ª>��oڳ����Q�8.��	皒�N���_������)e|e�D�W$���!�e睉�ض�}�3\��Q���`��c�ߘ�_�}<�p�� �?\^�8x�+=W��i���3-g�����f���#�FO9�:�$Gɀ X-V���^JIӛpI���z��eś �Vk�����4�Z�q�0�(�kւ#8�U,�9�EW��ED��_����-5������~z�9����w3�7p�ut����Ώ�����:?�͇�맓/�ç-v:�m�B�GOߺ�g�/i�?6����uz�\ă��kA#:^)�e�y��ͩ]�k}>�):���#����=�4�*�����\M���g��j�w+Cs�&%�^uUY=�V��ш�������1��$��2ZUlWsȈ����I7[S�{X��)|���5u����w���;$�I͌%]#�`5?�e�ǝ@����Ͻ�{�!̻��R� )5"�wW5��AB��(:Ȱ��tT�*�fX��Kɢ��5�bXd)��dm �N~�X��Ա���u�v��U@��9�����f��Rc�}�M�0y��������ש��YM������2M���Ʌ\�|8�;�w[��r.��W����Ғ��?���hI��R���r	�FҴ��Dm��C��cN.Նr��Ao֩h=�M5x/���ns_�u�3(��mX�������r��Xx(�O��wG/��=�x;X�����O�nKZ1��u��SnGV�~�f�~f��5ߓC��!�Ҁ��<����Q�)aoC�E����9u,�&@�\]ٍ�2�R�em�X�i�cl:E��f��؀x�-(3"�͘�NI�r�^�Ϟ��Q�K��?%��(9|s��m�Uf���i9����ks��6R��S����6�D44����
<C�ͳ��.>��gr�:�!�v	�ȩ���3|g��C��)J��%����.�=����>:C��Ts�Α̐@�EPw�d�]�L �s��y�%m���R���oy��-/��G��s��d�ɏ�?{���5ݥ      �      xڋ���� � �     