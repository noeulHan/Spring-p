show tables;

create table visit (
  visitDate datetime not null default now(),
  visitCount			int  not null default 1
);

create table member2 (
  idx		int not null auto_increment,	/* 회원 고유번호 */
  name			varchar(20) not null,			/* 회원 성명 */
  birthday	datetime		default now(),/* 생일 */
  tel				varchar(20),							/* 전화번호(010-1234-5678) */
  mid		varchar(20) not null,					/* 회원 아이디(중복불허) */
  pwd		varchar(100) not null,				/* 비밀번호(암호화처리) */
  email			varchar(50) not null,			/* 이메일 */
  address   varchar(100),							/* 주소 */
  content		text,											/* 자기소개 */
  userDel   char(2) default 'NO',			/* 회원 탈퇴 신청 여부(OK:탈퇴신청한회원, NO:현재가입중인회원) */
  startDate datetime default now(),		/* 최초 가입일 */
  lastDate 	datetime default now(),		/* 마지막 접속일 */
  todayCnt	int default 0,						/* 오늘 방문한 횟수 */
  point			int default 100,					/* 회원가입포인트(최초 100, 방문시마다 1포인트 증가) */
  level 		int default 1,						/* 1:준회원, 2:정회원, 3:우수회원 (4:운영자) 0:관리자 */
  primary key(idx, mid)
);

drop table member2;