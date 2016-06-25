---------comment table 추가(1차)---------
drop sequence comment_seq;
create sequence comment_seq nocache;

drop table commcomment cascade constraint;
create table commcomment(
	comment_no number primary key,
	comm_no number not null,
	id varchar2(100) not null,
	content clob not null,
	constraint fk_comment_id foreign key(id) references member(id) on delete cascade,
	constraint fk_comment_no foreign key(comm_no) references community(comm_no) on delete cascade
)

---------reply table 추가(1차)---------
drop sequence comment_reply_seq;
create sequence comment_reply_seq nocache;

drop table replycomment cascade constraint;
create table replycomment(
	reply_no number primary key,
	comment_no number not null,
	comm_no number not null,
	id varchar2(100) not null,
	content clob not null,
	constraint fk_reply_no foreign key(comment_no) references commcomment(comment_no),
	constraint fk_reply_id foreign key(id) references member(id) on delete cascade,
	constraint fk_reply_no2 foreign key(comm_no) references community(comm_no) on delete cascade
)

-- commcomment(댓글) table insert하고 select해서 확인해주세요
insert into commcomment(comment_no,comm_no,id,content) values(comment_seq.nextval,1,'java','댓글이에여');
insert into commcomment(comment_no,comm_no,id,content) values(comment_seq.nextval,1,'admin','댓글이에여');

select * from commcomment;

-- commcomment(댓글) table insert하고 select해서 확인해주세요
insert into replycomment(reply_no,comment_no,comm_no,id,content) values(comment_reply_seq.nextval,1,1,'test','대댓글22');
insert into replycomment(reply_no,comment_no,comm_no,id,content) values(comment_reply_seq.nextval,1,1,'test','대댓글');

select * from replycomment;
