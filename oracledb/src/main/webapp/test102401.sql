select * from member;

drop table member;

create table member (
id     VARCHAR2(20) PRIMARY KEY,
pw     VARCHAR2(20),
name   VARCHAR2(20),
phone  VARCHAR2(20),
gender VARCHAR2(6),
hobby  VARCHAR2(80)
);

insert into member (id,pw,name,phone,gender,hobby) values(
'aaa','1111','ȫ�浿','010-1111-1111','M','game'
);

insert into member values(
'bbb','1111','������','010-2222-2222','F','golf'
);

insert into member values(
'ccc','1111','�̼���','010-3333-3333','M','swim'
);

insert into member values(
'ddd','1111','������','010-4444-4444','M','cook'
);

select * from member;

commit;

delete member where id='ddd';

select * from member;

commit;

update member set pw='1234' where id='ccc';

select * from member;

commit;