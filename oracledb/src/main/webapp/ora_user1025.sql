--1--
select * from employees;

select salary,salary + 100,salary-100 from employees;

select sysdate,sysdate+365 from dual; --dual �ӽô������̺�

select 1+3 from dual;

-- ���� '3'�� ��Ģ������ �ϸ� ���ڷ� �ڵ���ȯ
select 1+'3' from dual;

-- ���� 'a'�� ��Ģ�����ϸ� ����
select 1+'a' from dual;

-- ���ڴ� ��Ģ������ �� �� ����
select 'a'+'b' from dual;

-- ���ڰ����� ||, concat()
select 'a'||'b' from dual;
select concat('a','b') from dual;

select * from employees;

-- emp_name(email) ���
-- Donald OConnell(DOCONNEL)
select emp_name||'('||email||')' as u_nicid from employees;
select concat( concat( concat( emp_name,'(' ) ,email ) , ')' ) from employees;

select employee_id,emp_name,hire_date from employees
order by hire_date asc
;

-- 00/01/01 ���� �Ի��� ���
-- 00/01/01, 00-01-01, 2000-01-01 ��� ���� ����
select * from employees
where hire_date>= '2000-01-01'
order by hire_date asc
;

select * from employees
order by salary desc;

-- �� ī��Ʈ
select count(*) from employees;

--
select max(salary) from employees;

select * from employees
where salary=24000;

-- ��������
select * from employees
where salary=(select max(salary) from employees);

-- is null
select * from employees
where commission_pct is not null;

-- �μ���ȣ�� 80�̻��� ��� ��� 
select * from employees
where department_id >=80
order by department_id asc;

-- �μ���ȣ�� 80�̻��� ������� ���
select * from employees
where not department_id= 80
order by department_id;

-- <> != not
select * from employees
where department_id <> 80
order by department_id;

-- �μ���ȣ�� 50���̸鼭 �޿� 6000�̻� ��� ���
select * from employees
where department_id = 50 and salary>=6000;

--2--
-- 2000�̻� 3000����
select * from employees
where salary>=2000 and salary<=3000;

-- between a and b (a,b ����)
select * from employees
where salary between 2000 and 3000;

-- salary ��� : avgȰ��
select avg(salary) from employees;

-- salary ��� ������ ��� ���
select * from employees
where salary<=(select avg(salary) from employees)
order by salary desc;

-- �޿� 3000,4000,6000 �˻�
select * from employees
where salary=3000 or salary=4000 or  salary=6000;

select * from employees
where salary in(3000,4000,6000);

-- ��� 101,151,200 ����� �޿� ���
select employee_id,salary from employees
where employee_id in(101,151,200);

select employee_id,salary from employees
where employee_id=101 or employee_id=151 or employee_id=200;

-- �޿� 2000�̸� 3000�ʰ� ��� ���
select * from employees
where salary<2000 or salary>3000;

select * from employees
where salary not between 2000 and 3000;

-- �Ի��� 00/01/01 ~ 00/12/31 ���
select * from employees
where hire_date>='00/01/01' and hire_date<='00/12/31';

select * from employees
where hire_date between '00/01/01' and '00/12/31';

select emp_name from employees;

-- S�� ���۵Ǵ� �̸� ���
select emp_name from employees
where emp_name like 'S%';

-- n���� ������ �̸� ���
select emp_name from employees
where emp_name like '%n';

-- e���Ե� �̸� ���
select emp_name from employees
where emp_name like '%e%';

--3

select * from board;

-- bcontent faucibus �ܾ �� �ִ� �Խñ��� ���
select * from board
where bcontent like '%faucibus%';

-- bcontent 'ven' ���� -262
-- btitle 'ven' ���� -21
-- btitle �Ǵ� bcontent �÷��� ven �� �Խñ� ��� -280

select * from board
where btitle like '%ven%';

select * from board
where bcontent like '%ven%';

select bcontent from board
where btitle like '%ven%' or bcontent like '%ven%';

-- bcontent n���� �����ϴ� 4�����̻� �ܾ �ִ� �Խñ��� ���
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
-- �ι�° ���ڰ� a�� ��� �̸��� ���
select * from employees
where emp_name like '_a%';

-- �޿��� ���������� ���
select emp_name,salary from employees
order by salary desc;

select employee_id,emp_name,job_id,hire_date from employees
order by hire_date desc;

select employee_id,emp_name,job_id,hire_date from employees
order by emp_name desc;

-- �μ���ȣ �������� , �̸� ���� ����
select employee_id,emp_name,department_id,job_id,hire_date,salary from employees
order by department_id asc, emp_name desc;

-- �޿� ����, �Ի��� ���� ����
select employee_id,emp_name,department_id,job_id,hire_date,salary from employees
order by salary asc, hire_date desc;

-- abs : ���밪
select -10,abs(-10) "���밪" from dual;

-- floor : ����
select 10.54578, floor(10.54578) from dual;

-- trunc(��,������ġ) : Ư���ڸ� ����
select 10.54578, trunc(10.54578,2),floor(10.54578) from dual;

-- round : Ư���ڸ� �ݿø�
select 10.54578, round(10.54578), round(10.54578,3) from dual;

select * from stuscore;
select stunum,name,kor,math,kor+math,round((kor+math)/2) from stuscore;

-- �޿��� ��ȭ�� ȯ�� 1342.32 �Ҽ��� 3�ڸ� �ݿø��ؼ� ���
-- ���, �����, �޿�, ȯ��޿�, ȯ��޿� 3�ڸ� �ݿø� 
select 
employee_id,
emp_name,
salary,
salary*1342.32,
round(salary*1342.32,2)
from employees;

-- �Ի��ϰ� ���糯¥�� ���� ���
-- �Ҽ��� 3°�ڸ����� �ݿø�
select round(sysdate-hire_date,2) from employees;

-- �Ի��Ͽ��� ������� �ɸ����ڸ� ���
-- �Ҽ����ڸ��� �ݿø�, ���� ������ ȯ���ؼ� ���
select emp_name, floor(round(sysdate-hire_date)/365) sdate from employees
order by sdate asc;

--5--
select * from member;

select * from employees;

-- ������ �Լ�
select mod(27,2), mod (27,5), mod(27,7) from dual;

-- employees ����� Ȧ�� ��� ���
select * from employees
where mod(employee_id,2)=1
order by employee_id asc;

-- manager_id�� ¦���� ����� ����Ͻÿ�
-- ���,�����,�Ի���,����,�����ڹ�ȣ,�μ���ȣ
select employee_id,emp_name,hire_date,salary,manager_id,department_id from employees
where mod(manager_id,2)=0
order by employee_id asc;

select bhit from board;

select avg(bhit) from board;

--�����ȸ�� 2�ڸ����� �ݿø� ���
select round(avg(bhit),2) from board;

--�����ȸ�� �Ҽ��� ���� ���
select floor(avg(bhit)) from board;

--��պ��� ���� ��ȸ�� �Խñ� ���
select * from board
where bhit >= (select avg(bhit) from board) ;

-- ����ȯ 
select to_char(salary,'999,999'),to_char(round(salary*1342.32),'999,999,999') from employees;

--������
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
board_seq.nextval,'����','����',sysdate,'aaa',board_seq.currval, 0, 0, 1, '1.jpg'
);

commit;

--6--

select board_seq.currval from dual;
select board_seq.nextval from dual;

select member_seq.nextval from dual;

-- dept_seq ���� 10, ���� 10
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

-- total�� �������� ���������ؼ� ����� ���
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

--���̺� ����
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

--1. emp2�� �����ȣ�� employees �����ȣ ��ġ��Ŵ
select *
from emp2 a , employees b
where a.employee_id = b.employee_id;
--2. emp2�� �����ڹ�ȣ�� employees�� �����ڹ�ȣ�� �˻�
select a.manager_id, b.manager_id
from emp2 a , employees b
where a.employee_id = b.employee_id;
--3. employees �����ڹ�ȣ�� emp2�� �����ڹ�ȣ�� �Է½�Ŵ
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

-- 1. total ���� ��������� ��� (b�� ���� / �ӽ����̺� b)
select stunum, rank() over (order by total desc) from stuscore;

-- 2. ��Ī ���� (�ӽ����̺�b�� stunum : b_num , �ӽ����̺�b�� rank : b_rank)  
select stunum b_num, rank() over (order by total desc) as b_rank from stuscore;

-- 3. 
update stuscore a     --���̺� stuscore ������Ʈ
set rank =              -- rank �÷� ���� (�Ʒ� ������ b_rank�� rank�� ����)
(select b_rank from    
(select stunum b_num, rank() over (order by total desc) as b_rank from stuscore) b
where a.stunum=b.b_num  -- stunum�� b_num��ġ
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
emp_seq.nextval,'ȫ�浿',sysdate);

insert into emp1 values(
emp_seq.nextval,'������',sysdate);

insert into emp1 values(
emp_seq.nextval,'�̼���',sysdate);

insert into emp1 values(
emp_seq.nextval,'ȫ����',sysdate);

insert into emp1 values(
emp_seq.nextval,'ȫ���',sysdate);

select * from emp1;

commit;

select employee_id,emp_name,job_id,hire_date from employees
order by hire_date desc;





























