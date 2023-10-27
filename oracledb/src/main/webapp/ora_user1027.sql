--1--
select sysdate from dual;

select sysdate,sysdate+1,add_months(sysdate,1) from dual;

select last_day(sysdate) from dual;

select last_day('2022-01-01') from dual;

--년월일 추출
select extract(year from sysdate) from dual;
select extract(month from sysdate) from dual;
select extract(day from sysdate) from dual;

-- 현재부터 특정일까지 기간 계산
select bdate,trunc(sysdate-bdate)||'일' from board;
select bdate,trunc(months_between(sysdate,bdate)) ||'개월' from board;

--날짜 포맷 변경
select sysdate from dual;
select to_char(sysdate,'YYYY-MM-DD AM HH:MI:SS') from dual;
select to_char(sysdate,'YYYY"년" MM"월" DD"일" DAY') from dual;

-- 숫자->문자 형변환 (천단위표시,화폐단위표시)
select 1234500000 from dual;
select to_char(1234500000,'000,000,000,000') from dual; --001,234,500,000(0으로표시)
select to_char(1234500000,'999,999,999,999') from dual; --   1,234,500,000(공백처리)
select trim(to_char(1234500000,'999,999,999,999')) from dual; -- 1,234,500,000(공백제거)
select to_char(1234500000,'L999,999,999,999') from dual; --원화표시(국가별 화폐단위)

-- 특정날짜가 얼마나 지났는지 계산(문자->날짜 형변환)
select add_months('2023-10-01',1) from dual;
select sysdate - '2023-10-01' from dual; --에러
select sysdate - to_date('2023-10-01','YYYY-MM-DD') from dual;

-- nvl(commission_pct,0)
-- manager_id null값에 'ceo'추가
select manager_id from employees;
select to_char(manager_id) from employees;
select nvl(to_char(manager_id),'ceo') from employees;

-- 급여 총액
select sum(salary) from employees;
-- 천단위,$표시
select to_char(sum(salary),'$999,999') from employees;
-- 천단위,\표시
select to_char(avg(salary*1342.32),'L999,999,999') from employees;

--2--

-- 회의

--3--
select max(salary), min(salary) from employees;

select department_id from employees;

select emp_name,max(salary) from employees
where department_id =50
group by emp_name;

select emp_name, salary from employees
where salary = (select max(salary) from employees);

select department_id, max(salary), min(salary) from employees
group by department_id;

select emp_name, max(salary) from employees
group by emp_name;

--count(*) 
select count(*) from employees; --107 (*로 count할 경우 null값 포함)
select count(manager_id) from employees; --106 null값 제외

select id from board;

select emp_name from employees;

select emp_name from employees
where emp_name like '%D%' or emp_name like '%d%' ;

select emp_name from employees
where emp_name  like '%d%' ;

--소문자로 변경후 검색
select emp_name from employees
where lower(emp_name) like '%d%'; --lower : emp_name 소문자로 인식

-- 빈공백 0으로 표시
select to_char(12,'000,000') from dual;
select lpad(12,6,'0') from dual;

select id from board;
select substr(id,3,3) from board;

--20230802 표시
select bdate from board;
select to_char(bdate,'YYYYMMDD') from board;
select substr(to_char(bdate,'YYYYMMDD'),5,2) from board;

select id from board;
select id, instr(id,'ff') from board
where instr(id,'ff') !=0;

select length (id) from board;

-- hire_date (substr) 월출력
select hire_date from employees;
select hire_date, substr(hire_date,4,2) from employees;

-- 이름에서 3번째부터 3개와 입사월을 함께 출력
-- aaa06
select emp_name,hire_date,substr(emp_name,3,3)||substr(hire_date,4,2) from employees;

--4--

select hire_date,last_day(hire_date) from employees;

select * from emp1;

-- 테이블생성 및 복사
create table fboard as select * from board;

select bhit,bhit+100 from board;

update board
set bhit = bhit+100;

select bno, bhit from board;

rollback;

update board
set bhit = bhit+1
where bno = 49;

update fboard
set bhit = 1;

select a.bno, a.bhit, b.bno, b.bhit from fboard a, board b;

commit;

select bno, bhit from board;

update fboard a
set bhit = (select bhit from board b where a.bno=b.bno);

rollback;

desc fboard;

alter table fboard
add userid varchar2(30);

select userid from fboard;

-- id 1번째부터 3글자, bdate의 월 합친 값을 userid에 입력

select substr(id,1,3)||substr(bdate,4,2) from fboard;

update fboard a
set userid = (select substr(id,1,3)||substr(bdate,4,2) from fboard b where a.bno=b.bno);

select userid from fboard;

--5--

desc fboard;

-- 테이블 컬럼명 변경
alter table fboard
rename column userid to uuid;

-- 테이블 컬럼타입 변경
alter table fboard
modify uuid varchar2(40);

-- 테이블 컬럼 추가
alter table fboard
add u_id varchar2(30);

-- 컬럼 삭제
alter table fboard
drop column uuid;

desc fboard;

--drop table emp1;

--drop table emp2;

--테이블 생성 및 복사
create table emp2 as select * from employees;

--테이블명 변경
--rename emp2 to emp02;

desc member;

create table mem (
id varchar2(30) primary key, --not null and unique
pw varchar2(30) not null,
name varchar2(30) not null,
phone varchar2(6),
gender varchar2(1) check(gender in ('M','F')), --M,F만 입력가능
hobby varchar2(80),
mlevel number(2) check(mlevel between 1 and 10), --1~10사이 값만 입력가능
mdate date default sysdate --입력안하면 현재날짜 등록
);

insert into mem values(
'aaa','1111','홍길동','010-1111-1111','M','game',1,sysdate
);

alter table mem
modify phone varchar2(13);

desc mem;

select * from mem;

commit;

insert into mem(id,pw,name) values(
'bbb','1111','유관순'
);

insert into mem(id,pw,name,gender) values(
'ccc','2222','이순신','M'                                     -- check 대소문자구분
);

select * from member;

desc member;

-- switch, if 같은 조건문
-- decode : 같은 값인 경우만 비교 가능함(크다 작다 불가능)

select * from employees;

select department_id from employees;

select department_id, department_name from departments;

-- 10 총무기획 20 마케팅 30 구매/생산부 40 인사부 50 배송부
select department_id from employees;

select department_id, 
decode (department_id,
10,'총무기획부',
20,'마케팅',
30,'구매/생산부',
40,'인사부',
50,'배송부'
)
from employees;

select a.department_id, a.department_name from departments a, employees b
where a.department_id = b.department_id;

--6--

--학생 성적 테이블
create table sscore (
sno number(4) primary key, -- 점수에 부여되는 순번
sid varchar2(20),
total number(3) default 0
);

insert into sscore values(
sscore_seq.nextval,'a1',50
);

insert into sscore values(
sscore_seq.nextval,'a2',90
);

insert into sscore values(
sscore_seq.nextval,'a3',80
);

insert into sscore values(
sscore_seq.nextval,'a4',10
);

insert into sscore values(
sscore_seq.nextval,'a5',100
);

insert into sscore values(
sscore_seq.nextval,'a6',70
);

insert into sscore values(
sscore_seq.nextval,'a7',60
);

insert into sscore values(
sscore_seq.nextval,'a8',30
);

insert into sscore values(
sscore_seq.nextval,'a9',20
);

insert into sscore values(
sscore_seq.nextval,'a10',80
);

commit;

select * from sscore;

select sno,sid,total,decode(total,
10,'F',
20,'F',
30,'F',
40,'F',
50,'F',
60,'D',
70,'C',
80,'B',
90,'A',
100,'A') as hak from sscore;

select avg from stuscore;

select avg, 
case 
when avg>=90 then 'A'
when avg>=80 then 'B'
when avg>=70 then 'C'
when avg>=60 then 'D'
when avg<60 then 'F'
end as hak
from stuscore;

-- 월급 3000 E등급, 4000~5000 D등급, 5000~8000 C등급, 8000~10000 B등급, 10000 이상 A등급

select salary,
case 
when salary>=10000 then 'A'
when salary>=8000 then 'B'
when salary>=5000 then 'C'
when salary>=3000 then 'D'
when salary<3000 then 'E'
end as grade
from employees;

alter table emp02 
add rank varchar2(10);

select * from emp02;

update emp02 a
set rank = (
select 
case 
when salary>=10000 then 'A'
when salary>=8000 then 'B'
when salary>=5000 then 'C'
when salary>=3000 then 'D'
when salary<3000 then 'E'
end rank2
from emp02 b where a.employee_id=b.employee_id);

select salary, rank from emp02;

--7--

-- 사원중에 평균 월급 이하로 받는 사원 출력
-- select 2개이상 사용 : 서브쿼리
select emp_name, salary from employees
where salary <= (select avg(salary) from employees);

select avg(salary) from employees;

select bhit, bhit+100 from fboard;

update fboard
set bhit = 101;

commit;

select bno,bhit from fboard;

select bno,bhit from board;

select a.bhit,b.bhit from fboard a , board b;

update fboard a
set bhit = 
(select bhit from board b where a.bno = b.bno);

--drop table board;

--create table board as select * from fboard;

select bhit from fboard;
select bhit from board;

select a.bhit, b.bhit from fboard a, board b
where a.bno = b.bno;

desc member;

create table nboard(
bno number(4) primary key,
id varchar2(20),
btitle varchar2(1000) not null,
bcontent varchar2(4000),
bdate date,
constraint fk_nboard foreign key(id) references member(id)
--외래키 등록/ 이름 : fk_nboard
);

select * from nboard;
select * from member;

insert into nboard values(
nboard_seq.nextval,'aaa','제목8','내용8',sysdate
);

commit;

select * from member;

select * from nboard;

-- 외래키 등록 해제
alter table nboard
drop constraint fk_nboard;

-- 외래키로 등록 (primary key 테이블의 데이터가 삭제되면 외래키에 있는 데이터도 모두 삭제처리)
alter table nboard
add constraint fk_nboard foreign key(id) references member(id)
on delete cascade;

delete member
where id = 'ddd';

select * from member;
select * from nboard;

--8--

-- 외래키 등록 해제
alter table nboard
drop constraint fk_nboard;

-- 외래키 등록 (primary key테이블의 데이터가 삭제되면 외래키에 있는 데이터의 id만 null값으로 변경)
alter table nboard
add constraint fk_nboard foreign key(id) references member(id)
on delete set null;

delete member
where id='aaa';

select * from nboard;

--커미션 받는 사원수 부서별 파악
select department_id,commission_pct from employees;

select department_id,count(commission_pct) from employees
group by department_id
order by department_id;

-- null값 제외한 row를 검색한 후 그룹함수 적용
select department_id,count(commission_pct) from employees
where commission_pct is not null
group by department_id;


-- 그룹함수에서 그룹함수의 값의 '조건'을 처리하려면  having  명령어 사용 (where 사용 X)
select department_id, count(commission_pct)
from employees
group by department_id
having count(commission_pct) != 0;

-- 부서별로 평균월급 출력
select department_id ,avg(salary) from employees
group by department_id
order by department_id;

-- 부서별 평균이 전체평균 이상인 부서만 출력
select department_id,avg(salary) from employees
group by department_id;

select avg(salary) from employees;

select a.department_id, b.department_name, floor(avg(salary)) from employees a, departments b
where a.department_id = b.department_id
--and a.department_id>=90 --단일함수 조건식
group by a.department_id, b.department_name
having avg(salary)> (select avg(salary) from employees) ; --그룹함수 조건식















