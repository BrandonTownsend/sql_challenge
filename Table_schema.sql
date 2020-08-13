-- Table: public.departments

-- DROP TABLE public.departments;

CREATE TABLE public.departments
(
    dept_no character varying(4) COLLATE pg_catalog."default" NOT NULL,
    dept_name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT departments_pkey PRIMARY KEY (dept_no)
)

TABLESPACE pg_default;

ALTER TABLE public.departments
    OWNER to brandontownsend;

    -- Table: public.dept_emp

-- DROP TABLE public.dept_emp;

CREATE TABLE public.dept_emp
(
    emp_no integer NOT NULL,
    dept_no character varying(4) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT dept_manager2_dept_no_fkey FOREIGN KEY (dept_no)
        REFERENCES public.departments (dept_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT dept_manager2_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

-- Table: public.dept_manager

-- DROP TABLE public.dept_manager;

CREATE TABLE public.dept_manager
(
    dept_no character varying(4) COLLATE pg_catalog."default" NOT NULL,
    emp_no integer NOT NULL,
    CONSTRAINT dept_manager_pkey PRIMARY KEY (dept_no, emp_no),
    CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no)
        REFERENCES public.departments (dept_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

-- Table: public.employees

-- DROP TABLE public.employees;

CREATE TABLE public.employees
(
    emp_no integer NOT NULL,
    emp_title_id character varying(10) COLLATE pg_catalog."default",
    birth_date character varying(10) COLLATE pg_catalog."default" NOT NULL,
    first_name character varying COLLATE pg_catalog."default" NOT NULL,
    last_name character varying COLLATE pg_catalog."default" NOT NULL,
    sex character varying(1) COLLATE pg_catalog."default" NOT NULL,
    hire_date character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT employees_pkey PRIMARY KEY (emp_no),
    CONSTRAINT title_fkey FOREIGN KEY (emp_title_id)
        REFERENCES public.titles (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

-- Table: public.salaries

-- DROP TABLE public.salaries;

CREATE TABLE public.salaries
(
    emp_no integer NOT NULL,
    salary integer NOT NULL,
    CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

-- Table: public.titles

-- DROP TABLE public.titles;

CREATE TABLE public.titles
(
    id character varying COLLATE pg_catalog."default" NOT NULL,
    title character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT titles_pkey PRIMARY KEY (id)
)


