drop sequence terminal_seq;
create sequence terminal_seq nocache;

drop table terminal cascade constraint;
create table terminal(
	terminal_no number primary key,
	terminal_name varchar2(100) not null,
	area_name varchar2(100) not null,
	constraint fk_terminal foreign key(area_name) references area(area_name)
)

insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'용산터미널','서울특별시');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'서울터미널','서울특별시');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'강남터미널','서울특별시');


insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'인천터미널','인천광역시');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'인투터미널','인천광역시');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'인삼터미널','인천광역시');


