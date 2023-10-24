create table member(
id varchar2(20),
pw varchar2(20),
name varchar2(30),
gender varchar2(1),
age number,
birth varchar2(13),
phone varchar2(13),
rdate date
);

insert into member values(
'aaa','1111','ȫ�浿','M',20,'1990-01-01','010-1111-1111',sysdate
);