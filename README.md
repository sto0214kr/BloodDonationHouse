### BloodDonationHouse
  #### 헌혈의 집 프로젝트
  #### 이보름
  
***
  
#### 회원
```
create sequence seq_member_idx;

create table member(
	idx NUMBER(3),
	id VARCHAR2(50) not null,
	pwd VARCHAR2(50) not null,
	name VARCHAR2(50) not null,
	phone VARCHAR2(50) not null,
	email VARCHAR2(50) unique
);
```

|칼럼|설명|
|----|----|
|idx|번호|
|id|아이디|
|pwd|비밀번호|
|name|이름|
|phone|연락처|
|email|이메일|

##### 예시
|idx|id|pwd|name|phone|email|
|----|----|----|----|----|----|
|1|test01|1234|홍길동|010-1111-1111|test@test.com|

#### 공지사항
```
create sequence seq_board_idx;

create table board(
	idx NUMBER(5) primary key,
	title VARCHAR2(100) not null,
	content CLOB,
	writer VARCHAR2(50) not null,
	readnum NUMBER(5) default 0,
	writeday date
);
```

|칼럼|설명|
|----|----|
|idx|번호|
|title|제목|
|content|내용|
|writer|작성자|
|readnum|조회수|
|writeday|작성일|

##### 예시
|idx|title|content|writer|readnum|writeday|
|----|----|----|----|----|----|
|1|제목입니다.|공지사항 내용입니다.|관리자|10|2022-02-01 14:30:30|

#### 리뷰
```
create sequence seq_review_idx;

create table review (
	idx NUMBER(5) primary key,
	member_id VARCHAR2(50) not null,
	name VARCHAR2(50) not null,
	content VARCHAR2(200) not null,
	filename VARCHAR2(200),
	writeday date
);
```

|칼럼|설명|
|----|----|
|idx|번호|
|member_id|회원번호|
|name|이름|
|content|내용|
|filename|파일이름|
|writeday|작성일|

##### 예시
|idx|member_id|name|content|filename|writeday|
|----|----|----|----|----|----|
|1|11|홍길동|한줄 리뷰 평입니다.|photo.jpg|2022-02-01 14:30:30|
