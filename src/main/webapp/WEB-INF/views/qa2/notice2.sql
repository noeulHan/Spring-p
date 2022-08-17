show tables;

create table notice2 (
  idx  int  not null auto_increment,	/* 게시글의 고유번호 */
  caseone		text not null,						/* 글 내용 */
  title			varchar(100) not null,		/* 게시글의 글 제목 */
  content		text not null,						/* 글 내용 */
  primary key(idx)										/* 게시판의 기본키 : 고유번호 */
);

drop table notice2;
desc notice;

insert into board2 values (default,'관리맨','게시판 서비스를 시작합니다.','cjsk1126@naver.com','http://blog.daum.net/cjsk1126','이곳은 게시판입니다.',default,default,'192.168.50.20',default,'admin');
select * from board2;

select * from board2 where idx = 5-1;	/* 현재글이 5번글인경우 */
select * from board2 where idx = 1-1;	/* 현재글이 1번글인경우 */
select * from board2 where idx = 27-1;
select * from board2 where idx = 27+1;

select * from board2 where idx > 5 limit 1;  /* 다음글 */
select * from board2 where idx < 5 order by idx desc limit 1;  /* 이전글 */
select idx,title from board2 where  idx in (
      (select idx from board2 where idx > 5 limit 1),
      (select idx from board2 where idx < 5 order by idx desc limit 1)
      );
      
select min(idx) from board2;

/* 
   DATEDIFF(날짜1, 날짜2) : '날짜1 - 날짜2'의 결과를 반환한다.
   TIMESTAMPDIFF(단위, 날짜1, 날짜2) :  '날짜2 - 날짜1'의 결과를 반환한다.
     단위: YEAR(년)/QUARTER(분기)/MONTH(월)/WEEK(주)/DAY(일)/HOUR(시)/MINUTE(분)/SECOND(초)
   : 결과를 숫자로 반환한다.
*/
SELECT DATEDIFF('2022-06-22', '2022-06-01');
SELECT DATEDIFF(NOW(), '2022-06-01');

/* 'DATE_ADD'/'DATE_SUB' 결과를 날짜로 반환 */
SELECT DATE_ADD(NOW(), INTERVAL 1 DAY);
SELECT DATE_SUB(NOW(), INTERVAL 1 DAY);

SELECT * FROM board order by idx desc;
SELECT * FROM board WHERE wDate > DATE_SUB(NOW(), INTERVAL 2 DAY) order by idx desc;

SELECT TIMESTAMPDIFF(YEAR, '2022-06-23', '2022-06-22');
SELECT TIMESTAMPDIFF(MONTH, '2022-05-23', '2022-06-23');
SELECT TIMESTAMPDIFF(MONTH, '2022-06-22', '2022-06-23');
SELECT TIMESTAMPDIFF(MONTH, '2022-05-22', NOW());
SELECT TIMESTAMPDIFF(DAY, '2022-05-22', NOW());
SELECT TIMESTAMPDIFF(DAY, '2022-06-22', NOW());
SELECT TIMESTAMPDIFF(HOUR, '2022-06-22', NOW());
SELECT TIMESTAMPDIFF(MINUTE, '2022-06-22', NOW());
SELECT TIMESTAMPDIFF(MINUTE, '2022-06-22', NOW()) / 60;
SELECT TIMESTAMPDIFF(MINUTE, '2022-06-22', NOW()) / (60 * 24);

select *,cast(TIMESTAMPDIFF(MINUTE, wDate, NOW()) / 60 as signed integer) AS diffTime  from board2 order by idx desc limit 0,10;


