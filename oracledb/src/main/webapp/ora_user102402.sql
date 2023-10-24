select * from departments;

select * from departments order by manager_id asc;

--employees ���̺��� employee_id�� ���� (order by)
select * from employees order by employee_id desc;

--���� (where)
select * from employees where employee_id>=200;

select * from employees 
where employee_id>=190 and employee_id<=205;

--salary 5000�̻��� ����� salary������ �˻��Ͻÿ�
select * from employees
where salary>=5000 
order by salary asc;

--employee ���, �̸�, ����, �μ�,���޼����� ����Ͻÿ�
select employee_id,emp_name,job_id,department_id,salary from employees
order by salary asc;

--���̺��� ������ ����
create table emp2 as select * from employees;

select * from emp2;

-- �÷� Ÿ��
desc emp2;

-- �÷� �̸� ����
alter table emp2 rename column emp_name to e_name;

-- �÷� ������Ÿ��,���� ����
-- ���� �������� Ÿ���̳� ũ�⿡ ���ϸ� ���� �ȵ�(ex : email varchar2->number �Ұ���)
alter table emp2 modify email varchar2(50);

-- �÷� ����
alter table emp2 drop column create_date;

-- �÷� �߰�
alter table emp2 add create_date date; 

--�÷����� ����
alter table emp2 modify update_date invisible;
alter table emp2 modify update_date visible;
select * from emp2;

-- �÷��� �����͸� ����
insert into emp2 select * from employees
;

select * from emp2;

-- �̸�, �޿�, �Ի��� ���
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

-- ��Ī���� : as (as������ ������)
select salary,salary*12 as y_salary, salary*12*1342  k_salary from employees;

select * from employees;

-- ���� nvl(����,0) null�ΰ�� 0���� ǥ��
select salary, salary*12,commission_pct from employees;

select 
salary, 
salary*12 as "����",
(salary*12)*nvl(commission_pct,0) as "�μ�Ƽ��", --null ���Ѵ�� ����ϹǷ� nvl����Ͽ� 0���� ����ϰԲ�
(salary*12)+(salary*12)*nvl(commission_pct,0) as "��������" from employees;

select nvl(manager_id,0) from employees;

-- ���,����,����,Ŀ�̼�,����,����+Ŀ�̼� ���

desc emp2;

select employee_id,salary,job_id,
nvl(commission_pct,0) as commission,
salary*12 as y_salary,
(salary*12)+salary*12*nvl(commission_pct,0) as c_salary
from emp2;

select * from employees where salary=6000;

-- Ŀ�̼��� null�� ����� ����Ͻÿ� (null �� is null)
-- select * from employees where commission_pct = null;  x
select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;


--�μ���ȣ �μ��� ���
desc departments;

select department_id as "�μ���ȣ", department_name as "�μ���" from departments
where department_id<=40;

-- ����Ÿ�� �ٿ��� ��� (||,concaat)
select emp_name || ' is a ' || job_id from employees;

select concat(concat(emp_name,' is a '),job_id) as con_name from employees;

select * from stuscore;

select kor,eng,math,kor+eng+math,(kor+eng+math)/3 from stuscore;

--�ߺ����� distinct
select distinct department_id from employees order by department_id asc;

select distinct job_id from employees order by job_id;

-- ������ 3000,6000,7000 ���
select * from employees 
where salary=3000 or salary=6000 or salary=7000;

select * from employees 
where salary>=3000 and salary<=10000
order by salary desc;

-- ������ 5000������ ������� +1000 ������ �λ��ؼ� ����Ͻÿ�
select emp_name,salary,salary+1000 "�λ�",(salary+1000)*1342 "��ȭ" from employees
where salary<=5000 ; 

--�μ���ȣ�� 10,30,50 �� �����ȣ,����̸�,�μ���ȣ,����,����,�Ի����� ���
desc employees;

select employee_id "�����ȣ",emp_name "����̸�",department_id "�μ���",job_id "����",salary "����",hire_date "�Ի���" 
from employees
where department_id=10 or department_id=30 or department_id=50
order by department_id asc, employee_id asc -- �տ� �ִ� ������ �켱���� (1����:department_id, 2����:employee_id)
;

select * from employees;

--4000�̻� 8000����
--�Ի����� 2003/09/01 ���� ����� ���
select employee_id "�����ȣ",emp_name "����̸�",salary "�޿�",hire_date "�Ի���",department_id "�μ���ȣ"
from employees
where salary>=4000 and salary<=8000 
and hire_date>'03/09/01';

commit;






















