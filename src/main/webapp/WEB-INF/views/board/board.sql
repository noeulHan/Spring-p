show tables;

create table board2 (
  idx  int  not null auto_increment,	/* 게시글의 고유번호 */
  email			varchar(100),			/* 게시글을 올린사람의 이메일 */
  title			varchar(100) not null,		/* 게시글의 글 제목 */
  content		text not null,						/* 글 내용 */
  wDate			datetime default now(),		/* 글 올린 날짜 */
  readNum		int default 0,						/* 글 조회수 */
  hostIp		varchar(50) not null,			/* 접속 IP 주소 */
  good			int default 0,						/* '좋아요' 횟수 누적처리 */
  mid				varchar(20) not null,			/* 회원 아이디(게시글 조회시 사용) */
  fName			varchar(200),		/* 서버에 저장된 실제 파일명 */
	fSName		varchar(200),  
  primary key(idx)										/* 게시판의 기본키 : 고유번호 */
);


drop table board2;

alter table board add column fName varchar(200) not null;

alter table board add column name varchar(200) not null;

select * from board;

create table boardReply2 (
  idx		int not null auto_increment,	/* 댓글의 고유번호 */
  boardIdx int not null,							/* 원본글의 고유번호(외래키로 지정함) */
  mid      varchar(20) not null,			/* 댓글 올린이의 아이디 */
  wDate    datetime default now(),		/* 댓글쓴 날짜 */
  hostIp   varchar(50) not null,			/* 댓글쓴 PC의 IP */
  content  text				 not null,			/* 댓글 내용 */
  primary key(idx),										/* 주키(기본키)는 idx */
  foreign key(boardIdx) references board(idx)	/* board테이블의 idx를 boardReply테이블의 외래키(boardIdx)로 설정했다. */
  on update cascade				/* 원본테이블에서의 주키의 변경에 영향을 받는다. */
  on delete restrict			/* 원본테이블에서의 주키삭제 시키지 못하게 한다.(삭제시는 에러발생하고 원본키를 삭제하지 못함.) */
);

alter table boardReply2 add column name varchar(200) not null;

productCode

select *,(select categoryMainName from categoryMain2 where categoryMainCode = (select categoryMainCode from dbProduct2 where idx = 5)) 
as categoryMainName from dbProduct2 where idx = 5;


