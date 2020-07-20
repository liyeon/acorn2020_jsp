CREATE TABLE board_gallery(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100),
	caption VARCHAR2(100),
	imagePath VARCHAR2(100),
	regdate DATE 
);

CREATE SEQUENCE board_gqllery_seq;

--upload된 파일의 정보를 저장 할 테이블
CREATE TABLE board_file(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100) NOT NULL,
	title VARCHAR2(100) NOT NULL,
	orgFileName VARCHAR2(100) NOT NULL, -- 원본 파일 명
	saveFileName VARCHAR2(100) NOT NULL, --서버에 실제로 저장된 파일 명
	
	--왜 두개로 관리하냐 클라이언트가 업로드 하는 파일을 하나의 폴더에다 저장하면 똑같은 파일명이 나올 수 있게 때문에
	--파일명이 겹치지 않도록 파일명을 바꿔서 저장 할 것
	fileSize NUMBER NOT NULL,
	regdate DATE
);

CREATE SEQUENCE board_file_seq;

--null 이면 기본 이미지 아니면 이미지 경로 저장

-- 사용자(회원) 정보를 저장할 테이블
CREATE TABLE users(
	id VARCHAR2(100) PRIMARY KEY,
	pwd VARCHAR2(100) NOT NULL,
	email VARCHAR2(100), 
	profile VARCHAR2(100), -- 프로필 이미지 경로를 저장할 칼럼
	regdate DATE
);
