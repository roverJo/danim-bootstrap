drop sequence bus_seq;
create sequence bus_seq nocache;

drop table bus cascade constraint;
create table bus(
	bus_no number primary key,
	operation_time varchar2(100) not null,
	end_area varchar2(100) not null,
	terminal_no number not null,
	price number not null,
	leadtime varchar2(100) not null,
	bustype varchar2(100) not null,
	constraint fk_bus foreign key(terminal_no) references terminal(terminal_no)
)

insert into bus(bus_no,operation_time,end_area,terminal_no,price,leadtime,bustype)
values(bus_seq.nextval,'15시40분','광주',1,15900,'3시간','우등');
insert into bus(bus_no,operation_time,end_area,terminal_no,price,leadtime,bustype)
values(bus_seq.nextval,'16시55분','광주',1,12900,'3시간','일반');
insert into bus(bus_no,operation_time,end_area,terminal_no,price,leadtime,bustype)
values(bus_seq.nextval,'17시20분','인천',1,12900,'3시간','일반');
insert into bus(bus_no,operation_time,end_area,terminal_no,price,leadtime,bustype)
values(bus_seq.nextval,'16시55분','인천',3,12900,'3시간','일반');

