drop sequence food_seq;
create sequence food_seq nocache;

drop table bestfood cascade constraint;
create table bestfood(
	foodshop_no number primary key,
	shopname varchar2(100) not null,
	shop_add varchar2(100) not null,
	foodtype varchar2(100) not null,
	main_price number not null,
	main_food varchar2(100) not null,
	hits number default 0,
	area_name varchar2(100) not null,
	detailarea_name varchar2(100) not null,
	local_area varchar2(100) not null,
	main_menu_picture varchar2(100) not null,
	constraint fk_bestfood_detailarea foreign key(area_name,detailarea_name) references detailarea(area_name,detailarea_name)
)

--음식점 추가
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'강남닭꼬치','서울시 강남구 아이유빌딩 1층','분식',3000,'닭꼬치','서울특별시','서울','강남구','닭꼬치1.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'원조불족발','서울시 강남구 2호선 지하철안','한식',15000,'족발','서울특별시','서울','강서구','족발1.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'해운대횟집','부산광역시 해운대구 820-1번지','일식',25000,'광어','부산광역시','부산','해운대구','광어1.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'붉은오뎅','부산광역시 중구 중앙빌딩 3층','분식',1500,'오뎅','부산광역시','부산','중구','오뎅1.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'한번밥상','서울특별시 강남구 지하철역','한식',14500,'점심상','서울특별시','서울','영등포구','점심상1.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'특별짜장','서초구 102번지 2번길','중식',5000,'짜장면','서울특별시','서울','서초구','짜장면1.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'맛나는백반집','서울특별시 이태원 125번지','한식',5500,'백반','서울특별시','서울','중구','백반1.jpg');
--음식 완료

-- 새로 등록시 위에 음식 완료 까지만 사용
------------------------------------------------------------------------------------------
--테이블 수정
alter table bestfood rename column food_no to foodshop_no;
alter table bestfood drop(price);
alter table bestfood local_area varchar2(100) not null,

alter table bestfood add(main_price number);
alter table bestfood add(main_food varchar2(100));
alter table bestfood add(hits number);


delete from bestfood;


select *from bestfood;

select food_no,shopname,shop_add,foodtype,price,area_name,detailarea_name from bestfood
where detailarea_name ='중구'

select food_no,shopname,shop_add,foodtype,price,area_name,detailarea_name from bestfood
 		where food_no=1

select foodshop_no,shopname,shop_add,foodtype,area_name,detailarea_name,main_price,main_food from bestfood
where detailarea_name ='강남' and foodtype='한식';

update bestfood set hits=hits+1 where foodshop_no=1;

select foodshop_no,shopname,shop_add,foodtype,area_name,detailarea_name,main_price,main_food
from bestfood 
where shopname='강남닭꼬치' and area_name='서울특별시' and detailarea_name='서울';


