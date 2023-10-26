--1--
--사번이 홀수인 사원을 출력
select * from employees
where mod(employee_id,2)=1;

select * from board;

desc board;

-- 현재 날짜 출력
select sysdate from dual;

select * from board
order by bno desc;

insert into board values(
board_seq.nextval,'게시글 등록2','게시글 내용입니다.2',sysdate,'ccc',board_seq.currval,0,0,1,'3.jpg');

select * from board
order by bno desc;

commit;

select sysdate-1 어제,sysdate 오늘, sysdate+1 내일 from dual;

select bno,btitle,bdate from board
order by bdate desc;

--현재날짜 기준 5일이전 게시글 출력
select sysdate-5 from dual;

select bno,btitle,bdate from board
where bdate > sysdate-5
order by bdate desc;

--employees 입사일에서 현재 날짜까지 기간 출력(소수점 절사)
select employee_id,emp_name,hire_date,salary,department_id,trunc(sysdate-hire_date) "기간" from employees;

--다가오는 요일 출력(nextday()활용)
select next_day(sysdate,'일요일') from dual;

select next_day(sysdate,'목') from dual;

--일1 월2 화3.... 토7
select next_day(sysdate,7) from dual;

--입력한 날의 마지막일 출력
select last_day(sysdate) from dual;
select last_day('20231101')from dual;
select last_day('20020201')from dual;

-- add_months
select add_months(sysdate,-2) from dual;
select add_months(sysdate,+12) from dual;
select add_months('20220101',+6) from dual;

-- 현재달에서 입사한 달까지의 개월수
select round(months_between(sysdate,hire_date))||'개월' from employees;

-- 현재부터 1년동안 게시글이 작성된 글을 출력 board사용
select bno,btitle,bdate from board
where sysdate-bdate<365
order by bdate asc;

select bno,btitle,bdate from board
where add_months(sysdate,-12)<bdate
order by bdate asc;

select bno,btitle,bdate from board
where bdate > (sysdate-365)
order by bdate asc;

--2--
-- 현재부터 6개월동안 게시글이 작성된 글을 출력 board사용
select bno,btitle,bdate from board
where add_months(sysdate,-6)<bdate
order by bdate asc;

-- 날짜 중 년도만, 달만, 일만 출력(extract()활용)
select extract(year from bdate) from board;
select extract(month from bdate) from board;
select extract(day from bdate) from board;

--- 3,5,7월에 작성한 게시글 출력
select bno,btitle,bdate from board
where extract(month from bdate) in (3,5,7)
order by bdate asc;

-- 날짜 round, trunc
select bno,btitle,bdate from board;
select bdate,round(bdate,'month'),trunc(bdate,'month') from board;

-- to_date는 형변환 함수
select round(to_date('2023-02-15'),'month') from dual; --23/02/01
select round(to_date('2023-02-16'),'month') from dual; --23/03/01

-- to_char 날짜 -> 문자형 변환
select bdate from board;

select to_char(bdate,'YYYY-MM-DD DY HH:MI:SS') from board --DY:*, DAY: *요일
order by bdate desc;

select bno,btitle,bcontent,to_char(bdate,'YYYY"년" MM"월" DD"일"')  bdate,bgroup,bstep,bindent,bhit,bfile from board;

--입사일 (2023-11-01 화요일) 표시 출력
select employee_id,emp_name,to_char(hire_date,'YYYY-MM-DD DAY') from employees;

select to_char(bdate,'YYYY-MM-DD DAY HH24:MI:SS') from board
order by bdate desc;

select to_char(bdate,'YYYY-MM-DD DAY AM HH:MI:SS') from board
order by bdate desc;

-- 문자형 변환함수
-- 숫자를 문자로
select to_char(1234567890) from dual;
select to_char(1234567890,'9,999,999,999') from dual;
select to_char(1234567890,'999,999,999,999') from dual; --앞자리 공백처리
select to_char(1234567890,'09,999,999,999') from dual;  --앞자리 0으로 채움
select to_char(1234567890,'L9,999,999,999') from dual;  -- L:국가별 화폐표시
select to_char(1234567890,'$9,999,999,999') from dual;  --$:$표시

--3--
select to_char(123,'0000000000') from dual;
select to_char(123456,'999,999,999') from dual;
select trim(to_char(123456,'999,999,999')) from dual; --trim : 앞뒤 공백제거

-- salary 달러표시,천단위표시
-- salary*1342 원화표시,천단위표시, 소수점1자리까지 표시
select salary, to_char(salary,'$999,999'), salary*1342.42, to_char(round(salary*1342.42,1),'L999,999,999.9') from employees;

-- 12345 총 9자리 표시, 빈공백은 0으로 채움
select to_char(12345,'000000000') from dual;
-- 12345 총9자리 표시, 천단위 표시, 빈공백 제거
select trim(to_char(12345,'999,999,999')) from dual;

-- board 테이블에서 bdate와 비교해서 20231023 숫자와 같은날 입력한 게시글 출력
select bno,btitle,bdate from board
where bdate = '20231023';

select bno,btitle,bdate from board
where bdate = to_date('20231023','YYYYMMDD');

-- 숫자 20200101부터 현재까지 기간이 얼마나 지났는지 출력
select trunc(sysdate - to_date('20200101','YYYYMMDD')) from dual;

--태어날 날부터 현재까지 며칠 지났는지 계산
select trunc(sysdate - to_date('19880101','YYYYMMDD')) from dual;

-- 개월수 계산
select trunc(months_between(sysdate, to_date('19880101','YYYYMMDD'))) from dual;

-- 문자를 숫자로 형변환
-- 문자20,000 과 문자10,000의 차이를 출력
select to_number('20,000','99,999') from dual;
select to_number('10,000','99,999') from dual;

select to_number('20,000','99,999') - to_number('10,000','99,999') from dual;

select emp_name,to_char(salary,'$999,999') from employees;

-- 연봉 + 커미션포함
-- 월급 * 12 + (월급 *12 * 커미션) 연봉으로 표기 출력
select 
employee_id,
emp_name,
salary,
salary*12, 
((salary*12)+(salary*12*nvl(commission_pct,0))) "연봉" 
from employees;

--4--

select manager_id from employees
where manager_id is null;

select manager_id from employees;

--null 0으로 표시
select nvl(manager_id,0) from employees;

-- null ceo로 표시 (숫자를 문자로 형변환후 표시)
select nvl(to_char(manager_id),'ceo') from employees;

-- 그룹함수
-- 게시글 조회수 총합 출력
select trim(to_char(sum(bhit),'999,999')) from board;

-- 게시글 조회수 평균 출력
select trim(to_char(avg(bhit),'999,999')) from board;

-- 월급 평균(소수점 2째자리 반올림)
select round(avg(salary),2) from employees;

-- 단일함수를 그룹함수와 함께 출력 안됨.
select emp_name, avg(salary) from employees; --에러

-- min 최소값, max 최대값
select min(salary),max(salary),avg(salary),count(*) from employees;

-- 부서번호가 50인 사원들의 월급 합계,평균
select sum(salary),avg(salary) from employees
where department_id=50;

-- 그룹
select department_id,sum(salary),avg(salary)
from employees
group by department_id
order by department_id asc;

-- board 날짜별 게시글 개수 출력
select bdate,count(btitle) from board
group by bdate
order by bdate desc;

-- 년도의 월별 개수 출력
select to_char(bdate,'YYYYMM') from board;

select count(*) from board;

select count(bno) from board;

select to_char(bdate,'YYYYMM') "년월", count(to_char(bdate,'YYYYMM')) "년월별 개수" from board
group by to_char(bdate,'YYYYMM')
order by to_char(bdate,'YYYYMM');

-- 날짜 중 년도만, 달만, 일만 출력(extract()활용)
select extract(year from bdate) from board;
select extract(month from bdate) from board;
select extract(day from bdate) from board;


--년도와 상관없이 월별 게시글수 출력
select extract(month from bdate),count(extract(month from bdate))
from board
group by extract(month from bdate)
order by extract (month from bdate);

--5--
select count(*) from employees;
select count(employee_id) from employees; -- 107
select count(manager_id) from employees;  --106 : null값 제외

--단일함수 사용은 group by 절에 추가해서 사용해야 함.
select department_id,count(*) from employees
group by department_id
order by department_id;

-- 조회수가 가장 낮은 게시글을 출력
select min(bhit) from board;

select bno,btitle,min(bhit) from board
group by bno,btitle;

select * from board
where bhit= (select min(bhit) from board);

-- 조회수가 가장 높은 게시글 출력
select * from board
where bhit= (select max(bhit) from board);

-- [문자함수] --
select emp_name from employees;

-- si 가 포함된 이름 출력 (대소문자 구분X)
select emp_name from employees
where emp_name like '%si%' or emp_name like '%SI%' or emp_name like '%Si%' or emp_name like'%sI%'; 

select emp_name from employees
where emp_name like '%da%' or emp_name like '%DA%' or emp_name like '%Da%' or emp_name like'%dA%';

select emp_name from employees
where lower(emp_name) like ('%da%');

select emp_name from employees
where upper(emp_name) like ('%DA%');

-- employees에서 이름을 대문자로 출력
select upper(emp_name) from employees;

-- 자리수를 만들어서 지정한 문자를 채워 출력
select lpad(12345,10,'0') from dual;
select rpad(12345,10,'#') from dual;

-- 12345 10자리로 천단위 표시 와 원화 표시 추가 출력 (빈공백은 0으로 표시)
select to_char(12345,'L0,000,000,000') from dual;

--ltrim:왼쪽공백제거, rtrim:오른쪽공백제거, trim:모든공백제거
select trim ('  abc  def c   ') from dual; -- 문자사이 공백은 제거안됨

select * from employees;

--job_id asst->ss ->i
select job_id,replace(job_id,'SS','I') from employees;

-- job_id 안에 있는 공백제거
select emp_name,replace(emp_name,' ','') from employees;

select replace('  abc   def   c   ',' ','') from dual;

select job_id from emp2;

-- SH_CLERK 변경해서 저장

select replace(job_id,'SH_CLERK','CLERK') from emp2;

update emp2
set job_id = 'CLERK'
where job_id = 'SH_CLERK';

rollback;

-- substr
-- 4번째부터 이름 3글자 가져옴
select emp_name,substr(emp_name,4,3) from employees;

--6--

select emp_name, substr(emp_name,1,5) from employees;

-- 이름 앞에서부터 5글자(입사년도) 출력  : ex)Donal(2007)
select substr(emp_name,1,5) || '(' || extract(year from hire_date) || ')' from employees;
select substr(emp_name,1,5) || '(' || to_char(hire_date,'YYYY') || ')' from employees;

-- 입사일이 06월인 사람중 이름에 d가 들어가있는 사원출력
select emp_name, hire_date from employees
where extract(month from hire_date) = 6 
and emp_name like '%d%';

update emp2 a
set job_id = (select replace(job_id,'CL','CLERK') j_id from emp2 b where a.employee_id = b.employee_id);

update board
set bhit=1;

select bhit from board;

rollback;

select bno,bhit,bhit+100 from board;

update board a
set bhit = (select bhit+100 from board b where a.bno=b.bno);

select bhit from board;

select job_id from emp2;

select employee_id, job_id, replace(job_id,'SH_CLERK','CLERK') from emp2;

update emp2 a
set job_id = (select replace(job_id,'SH_CLERK','CLERK') from emp2 b where a.employee_id=b.employee_id);

rollback;

-- 게시글의 날짜를 1씩 증가해서 update
select bno, bdate, bdate+1 from board;

update board a
set bdate = (select bdate+1 from board b where a.bno=b.bno);

select bdate from board;

rollback;

select b.bno,bdate+1 from board b where b.bno>0;
select a.bno,b.bno,a.bdate,b.bdate+1 from board a , board b;

--7--

select * from stuscore;

update stuscore
set rank = 0;

commit;

select * from stuscore;

select b_num,b_rank from
(select stunum b_num,rank() over (order by total desc) b_rank from stuscore);

update stuscore a
set rank=(select b_rank from
(select stunum b_num,rank() over (order by total desc) b_rank from stuscore) b where a.stunum=b_num);

select length(emp_name),emp_name from employees;

select avg(length(emp_name)) from employees;

select substr(emp_name,1,12) from employees;

-- 전화번호 5번째부터 3개, 이름 첫번째에서 5번째까지 2개를 함께 출력
select substr(phone_number,5,3)||', '||substr(emp_name,1,5) from employees;

-- instr 찾고자 하는 위치값 리턴함수
select * from employees;

select instr(emp_name,'o') from employees
where employee_id=198;

select instr(emp_name,' ')from employees;

select emp_name, instr(emp_name,' '),instr(emp_name,' ')+1 from employees;

-- 첫번째 공백이후부터 이름가져오기
select substr(emp_name, instr(emp_name,' ')+1) from employees;

-- 첫번째 공백전까지 이름가져오기
select substr(emp_name,1, instr(emp_name,' ')-1) from employees;

select substr('8801010-1101111',1,instr('8801010-1101111','-')-1) from dual; --주민번호 앞자리
select substr('8801010-1101111',instr('8801010-1101111','-')+1) from dual;  --주민번호 뒷자리

-- phone_number 첫번째점 기준 나누기
select substr(phone_number,1,instr(phone_number,'.')-1) from employees;
select substr(phone_number,instr(phone_number,'.')+1) from employees;

--8--

-- phone_number 두번째점 기준 뒷자리
select phone_number from employees;
select instr( phone_number,'.',instr(phone_number,'.')+1 ) from employees;
select instr( phone_number,'.',1,2 ) from employees;

select substr(phone_number, instr( phone_number,'.', instr(phone_number,'.')+1 )+1) from employees;

select instr('123.456.789','.') from dual;

select instr('123.456.789.000','.',1,1) from dual; --첫번째 숫자 : 시작위치, 두번째 숫자: .의 두번째 위치값
select instr('123.456.789.000','.',1,2) from dual;
select instr('123.456.789.000','.',1,3) from dual;
select instr('123.456.789.000','.',-1,1) from dual; -- -1: 끝에서부터 찾기

select * from member;
--전화번호 '-' 기준으로 나누기 출력
select instr(phone,'-') from member;
select instr(phone,'-',1,2) from member;

select substr(phone, 1, instr(phone,'-')-1) from member; --1번째
select substr(phone, instr(phone,'-')+1, (instr(phone,'-',1,2)-instr(phone,'-')-1)) from member; --2번째
select substr(phone, instr(phone,'-',1,2) +1) from member; --3번째

select phone_number from employees;

--폰번호에서 123포함되어 있는 폰번호 출력
select phone_number from employees
where phone_number like '%123%';

-- 부서별 최대월급을 출력
select department_id, count(*), max(salary), min(salary) from employees 
group by department_id
order by department_id;

select emp_name, to_char(hire_date,'YYYY"년 "MM"월 "DD"일 "DAY') from employees;

commit;


















