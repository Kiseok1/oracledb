--1--
select * from employees;

select salary,salary + 100,salary-100 from employees;

select sysdate,sysdate+365 from dual; --dual 임시더미테이블

select 1+3 from dual;

-- 문자 '3'을 사칙연산을 하면 숫자로 자동변환
select 1+'3' from dual;

-- 문자 'a'는 사칙연산하면 에러
select 1+'a' from dual;

-- 문자는 사칙연산을 할 수 없음
select 'a'+'b' from dual;

-- 문자결합은 ||, concat()
select 'a'||'b' from dual;
select concat('a','b') from dual;

select * from employees;

-- emp_name(email) 출력
-- Donald OConnell(DOCONNEL)
select emp_name||'('||email||')' as u_nicid from employees;
select concat( concat( concat( emp_name,'(' ) ,email ) , ')' ) from employees;

select employee_id,emp_name,hire_date from employees
order by hire_date asc
;

-- 00/01/01 이후 입사자 출력
-- 00/01/01, 00-01-01, 2000-01-01 모두 같은 형태
select * from employees
where hire_date>= '2000-01-01'
order by hire_date asc
;

select * from employees
order by salary desc;

-- 행 카운트
select count(*) from employees;

--
select max(salary) from employees;

select * from employees
where salary=24000;

-- 이중쿼리
select * from employees
where salary=(select max(salary) from employees);

-- is null
select * from employees
where commission_pct is not null;

-- 부서번호가 80이상인 사원 출력 
select * from employees
where department_id >=80
order by department_id asc;

-- 부서번호가 80이상인 사원제외 출력
select * from employees
where not department_id= 80
order by department_id;

-- <> != not
select * from employees
where department_id <> 80
order by department_id;

-- 부서번호가 50번이면서 급여 6000이상 사원 출력
select * from employees
where department_id = 50 and salary>=6000;

--2--
-- 2000이상 3000이하
select * from employees
where salary>=2000 and salary<=3000;

-- between a and b (a,b 포함)
select * from employees
where salary between 2000 and 3000;

-- salary 평균 : avg활용
select avg(salary) from employees;

-- salary 평균 이하인 사원 출력
select * from employees
where salary<=(select avg(salary) from employees)
order by salary desc;

-- 급여 3000,4000,6000 검색
select * from employees
where salary=3000 or salary=4000 or  salary=6000;

select * from employees
where salary in(3000,4000,6000);

-- 사번 101,151,200 사번과 급여 출력
select employee_id,salary from employees
where employee_id in(101,151,200);

select employee_id,salary from employees
where employee_id=101 or employee_id=151 or employee_id=200;

-- 급여 2000미만 3000초과 사원 출력
select * from employees
where salary<2000 or salary>3000;

select * from employees
where salary not between 2000 and 3000;

-- 입사일 00/01/01 ~ 00/12/31 출력
select * from employees
where hire_date>='00/01/01' and hire_date<='00/12/31';

select * from employees
where hire_date between '00/01/01' and '00/12/31';

select emp_name from employees;

-- S로 시작되는 이름 출력
select emp_name from employees
where emp_name like 'S%';

-- n으로 끝나는 이름 출력
select emp_name from employees
where emp_name like '%n';

-- e포함된 이름 출력
select emp_name from employees
where emp_name like '%e%';

--3

select * from board;

-- bcontent faucibus 단어가 들어가 있는 게시글을 출력
select * from board
where bcontent like '%faucibus%';

-- bcontent 'ven' 개수 -262
-- btitle 'ven' 개수 -21
-- btitle 또는 bcontent 컬럼에 ven 들어간 게시글 출력 -280

select * from board
where btitle like '%ven%';

select * from board
where bcontent like '%ven%';

select bcontent from board
where btitle like '%ven%' or bcontent like '%ven%';

-- bcontent n으로 시작하는 4글자이상 단어가 있는 게시글을 출력
select bcontent from board
where bcontent like '% n___ %';

select emp_name from employees
where emp_name like 'P__ %';

select emp_name from employees
where emp_name like '%Lo_____';

select * from employees
where emp_name like 'D%';

select * from employees
where emp_name like '%a%';

--4--
-- 두번째 글자가 a인 사원 이름을 출력
select * from employees
where emp_name like '_a%';

-- 급여를 낮은순부터 출력
select emp_name,salary from employees
order by salary desc;

select employee_id,emp_name,job_id,hire_date from employees
order by hire_date desc;

select employee_id,emp_name,job_id,hire_date from employees
order by emp_name desc;

-- 부서번호 순차정렬 , 이름 역순 정렬
select employee_id,emp_name,department_id,job_id,hire_date,salary from employees
order by department_id asc, emp_name desc;

-- 급여 순차, 입사일 역순 정렬
select employee_id,emp_name,department_id,job_id,hire_date,salary from employees
order by salary asc, hire_date desc;

-- abs : 절대값
select -10,abs(-10) "절대값" from dual;

-- floor : 버림
select 10.54578, floor(10.54578) from dual;

-- trunc(값,버림위치) : 특정자리 버림
select 10.54578, trunc(10.54578,2),floor(10.54578) from dual;

-- round : 특정자리 반올림
select 10.54578, round(10.54578), round(10.54578,3) from dual;

select * from stuscore;
select stunum,name,kor,math,kor+math,round((kor+math)/2) from stuscore;

-- 급여를 원화로 환산 1342.32 소수점 3자리 반올림해서 출력
-- 사번, 사원명, 급여, 환산급여, 환산급여 3자리 반올림 
select 
employee_id,
emp_name,
salary,
salary*1342.32,
round(salary*1342.32,2)
from employees;

-- 입사일과 현재날짜의 차이 출력
-- 소수점 3째자리에서 반올림
select round(sysdate-hire_date,2) from employees;

-- 입사일에서 현재까지 걸린일자를 출력
-- 소수점자리는 반올림, 일을 년으로 환산해서 출력
select emp_name, floor(round(sysdate-hire_date)/365) sdate from employees
order by sdate asc;

--5--
select * from member;

select * from employees;

-- 나머지 함수
select mod(27,2), mod (27,5), mod(27,7) from dual;

-- employees 사번이 홀수 사원 출력
select * from employees
where mod(employee_id,2)=1
order by employee_id asc;

-- manager_id가 짝수인 사원을 출력하시오
-- 사번,사원명,입사일,월급,관리자번호,부서번호
select employee_id,emp_name,hire_date,salary,manager_id,department_id from employees
where mod(manager_id,2)=0
order by employee_id asc;

select bhit from board;

select avg(bhit) from board;

--평균조회수 2자리에서 반올림 출력
select round(avg(bhit),2) from board;

--평균조회수 소수점 버림 출력
select floor(avg(bhit)) from board;

--평균보다 높은 조회수 게시글 출력
select * from board
where bhit >= (select avg(bhit) from board) ;

-- 형변환 
select to_char(salary,'999,999'),to_char(round(salary*1342.32),'999,999,999') from employees;

--시퀀스
create sequence member_seq
start with 1
increment by 1
minvalue 1
maxvalue 99999
nocycle
nocache
;

create sequence board_seq
start with 1001
increment by 1
minvalue 1
maxvalue 99999
nocycle
nocache
;

select * from board
order by bno desc;

insert into board values(
board_seq.nextval,'제목','내용',sysdate,'aaa',board_seq.currval, 0, 0, 1, '1.jpg'
);

commit;

--6--

select board_seq.currval from dual;
select board_seq.nextval from dual;

select member_seq.nextval from dual;

-- dept_seq 시작 10, 증분 10
create sequence dept_seq2
start with 10
increment by 10
minvalue 10
maxvalue 9990
nocycle
nocache
;

select dept_seq.nextval from dual;

desc stuscore;

select * from stuscore;

--delete stuscore;

commit;

select * from stuscore
order by total desc;

select stunum, rank() over(order by total desc) m_rank , rank
from stuscore;

update stuscore set rank=1 
where stunum=1;

select * from stuscore;

--delete stuscore;

commit;

--7--

select stunum, rank() over(order by total desc) m_rank , rank
from stuscore;

update stuscore set rank=1 
where stunum=1;

-- total을 기준으로 역순정렬해서 등수를 출력
select stunum, rank() over (order by total desc) from stuscore;

select * from stuscore a, member b;

select employee_id,emp_name,a.department_id, department_name,parent_id 
from employees a, departments b
where a.department_id = b.department_id
;

select department_id, department_name from departments;

select * from departments;

update stuscore a 
set rank=1 
where stunum=1;

--emp2
select * from emp2;

update emp2 set manager_id = '';

--drop table emp2;

--테이블 복사
create table emp2 as select * from employees;

select * from emp2;

update emp2 set manager_id= '';

commit;

update (select a.manager_id a_m, b.manager_id b_m
from emp2 a,employees b
where a.employee_id = b.employee_id)
set a_m = b_m 
;

select manager_id from employees;

select a.manager_id a_m, b.manager_id b_m
from emp2 a,employees b
where a.employee_id = b.employee_id;

--1. emp2의 사원번호와 employees 사원번호 일치시킴
select *
from emp2 a , employees b
where a.employee_id = b.employee_id;
--2. emp2의 관리자번호와 employees의 관리자번호를 검색
select a.manager_id, b.manager_id
from emp2 a , employees b
where a.employee_id = b.employee_id;
--3. employees 관리자번호를 emp2의 관리자번호에 입력시킴
update (select a.manager_id a_m, b.manager_id b_m
from emp2 a,employees b
where a.employee_id = b.employee_id)
set a_m = b_m 
;

--8--

update stuscore 
set rank = 1;

select * from stuscore;

update stuscore a
set rank = (
select b_rank from
(select stunum b_num, rank() over (order by total desc) as b_rank from stuscore) b
where a.stunum=b.b_num
);

-- 1. total 기준 등수지정후 출력 (b로 지정 / 임시테이블 b)
select stunum, rank() over (order by total desc) from stuscore;

-- 2. 별칭 지정 (임시테이블b의 stunum : b_num , 임시테이블b의 rank : b_rank)  
select stunum b_num, rank() over (order by total desc) as b_rank from stuscore;

-- 3. 
update stuscore a     --테이블 stuscore 업데이트
set rank =              -- rank 컬럼 지정 (아래 지정된 b_rank를 rank로 복사)
(select b_rank from    
(select stunum b_num, rank() over (order by total desc) as b_rank from stuscore) b
where a.stunum=b.b_num  -- stunum과 b_num일치
);


commit;

create sequence emp_seq
start with 1
increment by 1
minvalue 1
maxvalue 100000
nocycle
nocache;

create table emp1(
empno number(4) primary key,
ename varchar2(10),
hiredate date
);

insert into emp1 values(
emp_seq.nextval,'홍길동',sysdate);

insert into emp1 values(
emp_seq.nextval,'유관순',sysdate);

insert into emp1 values(
emp_seq.nextval,'이순신',sysdate);

insert into emp1 values(
emp_seq.nextval,'홍길자',sysdate);

insert into emp1 values(
emp_seq.nextval,'홍길순',sysdate);

select * from emp1;

commit;

select employee_id,emp_name,job_id,hire_date from employees
order by hire_date desc;





























