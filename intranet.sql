create database intranet;



CREATE TABLE model(
	mNo		INT PRIMATY KEY	auto_increment,--�Խñ۹�ȣ
	mName	VARCHAR(150) 	NOT NULL,
	price	INT				NOT NULL,
	stock	INT				DEFAULT 0,
	soldout char(1) DEFAULT	'Y',		--�ֵ�ƿ� ���� -> Y ���źҰ��� ��Ȱ��ȭ
	pay     char(1) DEFAULT	'Y',        --���̵Ȱ�-> Y
	pDate	TIMESTAMP default now()
);


