--drop table member;

CREATE TABLE member (
    id     VARCHAR2(20) PRIMARY KEY,
    pw     VARCHAR2(20),
    name   VARCHAR2(20),
    phone  VARCHAR2(20),
    gender VARCHAR2(6),
    hobby  VARCHAR2(80)
);

INSERT INTO member (
    id,
    pw,
    name,
    phone,
    gender,
    hobby
) VALUES (
    'aaa',
    '1111',
    '홍길동',
    '010-1111-1111',
    'M',
    'game,golf,run'
);

INSERT INTO member VALUES (
    'bbb',
    '1111',
    '유관순',
    '010-2222-2222',
    'F',
    'golf,book'
);

INSERT INTO member VALUES (
    'ccc',
    '1111',
    '이순신',
    '010-3333-3333',
    'M',
    'cook,book'
);

INSERT INTO member VALUES (
    'ddd',
    '1111',
    '강감찬',
    '010-4444-4444',
    'M',
    'game,run,book'
);

COMMIT;

SELECT
    *
FROM
    member;

DELETE member
WHERE
    id = 'ccc';

SELECT
    *
FROM
    member;

UPDATE member
SET
    phone = '010-3333-3333'
WHERE
    id = 'ddd';
--drop table member;

CREATE TABLE member (
    id     VARCHAR2(20) PRIMARY KEY,
    pw     VARCHAR2(20),
    name   VARCHAR2(20),
    phone  VARCHAR2(20),
    gender VARCHAR2(6),
    hobby  VARCHAR2(80)
);

INSERT INTO member (
    id,
    pw,
    name,
    phone,
    gender,
    hobby
) VALUES (
    'aaa',
    '1111',
    '홍길동',
    '010-1111-1111',
    'M',
    'game,golf,run'
);

INSERT INTO member VALUES (
    'bbb',
    '1111',
    '유관순',
    '010-2222-2222',
    'F',
    'golf,book'
);

INSERT INTO member VALUES (
    'ccc',
    '1111',
    '이순신',
    '010-3333-3333',
    'M',
    'cook,book'
);

INSERT INTO member VALUES (
    'ddd',
    '1111',
    '강감찬',
    '010-4444-4444',
    'M',
    'game,run,book'
);

INSERT INTO member VALUES (
    'eee',
    '2222',
    '김구',
    '010-5555-5555',
    'M',
    'golf,book,cook'
);

COMMIT;

SELECT
    *
FROM
    member;

DELETE member
WHERE
    id = 'ccc';

INSERT INTO member VALUES (
    'ccc',
    '1111',
    '이순신',
    '010-3333-3333',
    'M',
    'cook,book'
);

INSERT INTO member VALUES (
    'bbb',
    '1111',
    '유관순',
    '010-2222-2222',
    'F',
    'golf,book'
);

INSERT INTO member (
    id,
    pw,
    name,
    phone,
    gender,
    hobby
) VALUES (
    'aaa',
    '1111',
    '홍길동',
    '010-1111-1111',
    'M',
    'game,golf,run'
);

COMMIT;

SELECT
    *
FROM
    member;

SELECT
    *
FROM
    tab; --모든테이블 보여줌

desc member;

desc employees;

select create_date from employees;

select * from member;

select id,name from member;

select * from member;

select * from employees;

select emp_name,employee_id,salary*1342*12,commission_pct from employees order by salary desc; --asc 낮은순 desc 높은순

desc employees;

--sysdate : 현재날짜 출력, round 반올림
select hire_date,sysdate,round(sysdate-hire_date) from employees;

--중복방지 : distinct
select distinct department_id from employees order by department_id asc; 

select * from departments;

desc stuscore;

select emp_name from employees;

--변수,테이블명,컬럼명은 대소문자 구별없음, 데이터값은 대소문자 구별함.
select emp_name from employees where emp_name='Donald OConnell';

select emp_name from employees where emp_name='Donald Oconnell';

select emp_name from employees where EMP_name='Donald OConnell';