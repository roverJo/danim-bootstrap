drop sequence station_seq;
create sequence station_seq nocache;

drop table station cascade constraint;
create table station(
	station_no number primary key,
	station_name varchar2(100) not null,
	area_name varchar2(100) not null,
	constraint fk_station foreign key(area_name) references area(area_name)
)

insert into station(station_no,station_name,area_name)
values(station_seq.nextval,'용산역','서울특별시');
insert into station(station_no,station_name,area_name)
values(station_seq.nextval,'서울역','서울특별시');
insert into station(station_no,station_name,area_name)
values(station_seq.nextval,'강남역','서울특별시');

select *from station