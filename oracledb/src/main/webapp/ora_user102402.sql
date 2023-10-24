select * from departments;

select * from departments order by manager_id asc;

--employees 테이블에서 employee_id로 정렬 (order by)
select * from employees order by employee_id desc;

--조건 (where)
select * from employees where employee_id>=200;

select * from employees 
where employee_id>=190 and employee_id<=205;

--salary 5000이상인 사원을 salary순으로 검색하시오
select * from employees
where salary>=5000 
order by salary asc;

--employee 사번, 이름, 직급, 부서,월급순으로 출력하시오
select employee_id,emp_name,job_id,department_id,salary from employees
order by salary asc;

--테이블의 데이터 복사
create table emp2 as select * from employees;

select * from emp2;

-- 컬럼 타입
desc emp2;

-- 컬럼 이름 변경
alter table emp2 rename column emp_name to e_name;

-- 컬럼 데이터타입,길이 변경
-- 기존 데이터의 타입이나 크기에 반하면 변경 안됨(ex : email varchar2->number 불가능)
alter table emp2 modify email varchar2(50);

-- 컬럼 삭제
alter table emp2 drop column create_date;

-- 컬럼 추가
alter table emp2 add create_date date; 

--컬럼순서 변경
alter table emp2 modify update_date invisible;
alter table emp2 modify update_date visible;
select * from emp2;

-- 컬럼의 데이터만 복사
insert into emp2 select * from employees
;

select * from emp2;

-- 이름, 급여, 입사일 출력
select emp_name,salary,hire_date from emp2 order by emp_name asc;

desc emp2;

alter table emp2 modify salary invisible; 
alter table emp2 modify manager_id invisible; 
alter table emp2 modify commission_pct invisible; 
alter table emp2 modify retire_date invisible; 
alter table emp2 modify department_id invisible; 
alter table emp2 modify job_id invisible;

select  * from emp2;

alter table emp2 modify salary visible;
alter table emp2 modify manager_id visible;
alter table emp2 modify commission_pct visible;
alter table emp2 modify retire_date visible;
alter table emp2 modify department_id visible;
alter table emp2 modify job_id visible;

select * from emp2;

desc emp2;

-- 별칭선언 : as (as생략이 가능함)
select salary,salary*12 as y_salary, salary*12*1342  k_salary from employees;

select * from employees;

-- 연봉 nvl(변수,0) null인경우 0으로 표시
select salary, salary*12,commission_pct from employees;

select 
salary, 
salary*12 as "연봉",
(salary*12)*nvl(commission_pct,0) as "인센티브", --null 무한대로 계산하므로 nvl사용하여 0으로 취급하게끔
(salary*12)+(salary*12)*nvl(commission_pct,0) as "실제연봉" from employees;

select nvl(manager_id,0) from employees;

-- 사번,월급,직급,커미션,연봉,연봉+커미션 출력

desc emp2;

select employee_id,salary,job_id,
nvl(commission_pct,0) as commission,
salary*12 as y_salary,
(salary*12)+salary*12*nvl(commission_pct,0) as c_salary
from emp2;

select * from employees where salary=6000;

-- 커미션이 null인 사람만 출력하시오 (null 비교 is null)
-- select * from employees where commission_pct = null;  x
select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;


--부서번호 부서명 출력
desc departments;

select department_id as "부서번호", department_name as "부서명" from departments
where department_id<=40;

-- 문자타입 붙여서 출력 (||,concaat)
select emp_name || ' is a ' || job_id from employees;

select concat(concat(emp_name,' is a '),job_id) as con_name from employees;

select * from stuscore;

select kor,eng,math,kor+eng+math,(kor+eng+math)/3 from stuscore;

--중복제거 distinct
select distinct department_id from employees order by department_id asc;

select distinct job_id from employees order by job_id;

-- 월급이 3000,6000,7000 출력
select * from employees 
where salary=3000 or salary=6000 or salary=7000;

select * from employees 
where salary>=3000 and salary<=10000
order by salary desc;

-- 월급이 5000이하인 사람에게 +1000 월급을 인상해서 출력하시오
select emp_name,salary,salary+1000 "인상",(salary+1000)*1342 "원화" from employees
where salary<=5000 ; 

--부서번호가 10,30,50 인 사원번호,사원이름,부서번호,직급,월급,입사일을 출력
desc employees;

select employee_id "사원번호",emp_name "사원이름",department_id "부서명",job_id "직급",salary "월급",hire_date "입사일" 
from employees
where department_id=10 or department_id=30 or department_id=50
order by department_id asc, employee_id asc -- 앞에 있는 기준이 우선순위 (1순위:department_id, 2순위:employee_id)
;

select * from employees;

--4000이상 8000이하
--입사일이 2003/09/01 이후 사원만 출력
select employee_id "사원번호",emp_name "사원이름",salary "급여",hire_date "입사일",department_id "부서번호"
from employees
where salary>=4000 and salary<=8000 
and hire_date>'03/09/01';

commit;






















