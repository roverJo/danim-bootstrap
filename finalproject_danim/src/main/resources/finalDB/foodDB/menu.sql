drop sequence foodmenu_seq;
create sequence foodmenu_seq nocache;

drop table foodmenu;
create table foodmenu(
	menu_no number primary key,
	food_picture varchar2(100) not null,
	price number not null,
	food_name varchar2(100) not null,
	foodshop_no number not null,
	constraint fk_foodmenu_bestfood foreign key(foodshop_no) references bestfood(foodshop_no)
)

insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'닭꼬치.jpg',3000,'닭꼬치',1);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'핫바.jpg',2500,'핫바',1);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'핫도그.jpg',2000,'핫도그',1);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'족발.jpg',15000,'족발',2);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'냉채족발.jpg',20000,'냉채족발',2);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'광어',25000,'광어',3);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'새우.jpg',14000,'새우',3);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'모듬회.jpg',35000,'모듬회',3);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'오뎅.jpg',1500,'오뎅',4);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'떡볶이.jpg',2500,'떡볶이',4);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'라볶이.jpg',3000,'라볶이',4);

select *from foodmenu;

