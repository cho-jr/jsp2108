/* testDB2 */
/* 책 정보 테이블 */
create table books (
	bookId 		int not null auto_increment primary key, /* 책 고유 번호 */
	bookName	varchar(20) not null, 					/* 책 이름 */
	publisher 	varchar(20) not null, 					/* 출판사명 */
	price 		int										/* 책가격 (정가) */
	/* pr imary key(bookId, bookName) */
);

insert into books values (1,'축구의 역사','굿스포츠',7000);
insert into books values (2,'축구아는 여자','나무수',13000);
insert into books values (3,'축구의 이해','대한미디어',22000);
insert into books values (4,'골프 바이블','대한미디어',35000);
insert into books values (5,'피겨 교본','굿스포츠',8000);
insert into books values (6,'역도 단계별기술','굿스포츠',6000);
insert into books values (7,'야구의 추억','이상미디어',20000);
insert into books values (8,'야구를 부탁해','이상미디어',13000);
insert into books values (9,'올림픽 이야기','삼성당',7500);
insert into books values (10,'Olympic Champions','Pearson',13000);
insert into books values (11,'자바의 정석','도우출판사',30000);
insert into books values (12,'포토샵 CS6','제우미디어',25000);
insert into books values (13,'노인과 바다','이상미디어',13000);
insert into books values (14,'C#','삼성당',22000);
insert into books values (15,'전산세무2급','제우미디어',15000);
insert into books values (16,'반응형웹','ICOX',28000);
insert into books values (17,'파이썬따라잡기','이상미디어',22000);
insert into books values (18,'이젠나도자바','삼성당',19000);
insert into books values (19,'구기종목 정복','굿스포츠',9900);
insert into books values (20,'컬러리스트길잡이','나무수',31000);

select * from books;

/* 갯수를 구하는 함수 count() */
-- 전체 책의 권수는?
select count(*) from books;

-- 전체 책의 권수는?(단, 열 이름을 '총 권수'라고 지정하시오. )
select count(*) as '총 권수' from books;

-- 삼성당 출판사의 개수는?
select count(*) '삼성당 출판사 개수' from books where publisher = '삼성당';

-- 전체 책의 가격 합계 ( 열이름 : 총 가격)
select sum(price) as '총가격' from books;
select format(sum(price), 0) as '총가격' from books;	// 3자리마다 콤마

--'삼성당' 출판사의 전체 책 평균? (열 이름 : 삼성당 책 가격 평균)
select format(avg(price), 1) '삼성당 책 가격 평균'from books where publisher = '삼성당';

-- 책 가격이 2만원 이상인 책 가격의 전체 금액 합계
select format(sum(price), 0) from books where price >= 20000;

-- 가장 비싼 책과 가장 싼 책의 가격을 출력하시오
select max(price), min(price) from books;

-- 출판사가 '굿스포츠' 또는 '대한미디어'인 도서 검색( 두 가지 방법 사용)
select * from books where publisher in('대한미디어', '굿스포츠');
select * from books where publisher = '굿스포츠' or publisher = '대한미디어';

-- 출판사가 '굿스포츠' 또는 '대한미디어'가 아닌 도서 검색( 두 가지 방법 사용)
select * from books where publisher != '굿스포츠' and publisher != '대한미디어';
select * from books where publisher not in('대한미디어', '굿스포츠');

-- 도서 이름 중에서 '축구'가 포함된 출판사를 검색
select bookName, publisher from books where bookName like '%축구%';

-- 도서 이름의 왼쪽 두번쨰 위치에 '구'라는 문자열을 갖는 도서를 모두 검색하세요. 
select * from books where bookName like '_구%';

-- '축구' 포함 도서중 가격 20000원 이상 검색
select * from books where bookName like '%축구%' and price >= 20000;

-- 도서를 가격 순으로 검색하되, 가격이 같으면 이름 순으로 내림차순 검색 하시오
select * from books order by price asc , bookName desc;

-- 도서 테이블에서 모든 출판사를 검색하시오(중복 허용) - 출판사 필드만 검색
select publisher from books;

-- 도서 테이블에서 모든 출판사를 검색하시오(중복 불허) - 출판사 필드만 검색
select distinct publisher from books;

/* 그룹으로 묶어서 작업 처리 : group by ~ having(조건 : having 집계 함수)
 * group by 뒤의 검색 조건 필드를 select절의 필드로 적어준다. 
 * 또한, select 절에선 group by 뒤의 검색 조건 필드를 집계 함수와 함께 사용할 수 있다. 
 *  
 */
-- 도서 테이블에서 모든 출판사를 검색하시오(중복 불허 : group by 사용) - 출판사 필드만 검색
select publisher from books group by publisher;	 -- 오름차순 정렬

-- 책을 납품한 출판사의 납품한 책 총 권수는?
select publisher, count(publisher) from books group by publisher;

-- 출판사 별로 책 가격의 전체 합계와 평균
select publisher, sum(price), avg(price) from books group by publisher;

-- 출판사 별로 책 가격중 최고 가격과 최저 가격의 책을 출력
select publisher, format(max(price), 0) '최고', format(min(price), 0) '최저' from books group by publisher;


-- 책 한 권의 가격이 2만원 이상인 책을 납품한 출판사는? (중복 불허)
select publisher, price from books where price >= 20000 group by publisher ;
select distinct publisher from books where price >= 20000 ;

-- 책을 납품한 회수가 2회 이상인 출판사
select publisher, count(publisher) from books group by publisher having count(publisher)>=2 order by count(publisher) desc;

-- 책을 2번 이상 납품한 출판사의 책 충, 최고 가격인 책의 이름과 출판사명을 출력하시오. 
select publisher, max(price) from books group by publisher having count(publisher)>=2;

/* 한계치 적용한 출력 ? limit 처음 인덱스, 개수*/
--  처음부터 10권의 책을 보여주시오
select * from books limit 0, 10;

-- 책 자료 중 2번째부처 5건을 보여주시오
select * from books limit 2, 5;

-- 책 가격이 가강 높은 순으로 5건 출력
select * from books order by price desc limit 0, 5;


/* -------------------다중 테이블 활용하기-------------------------------- */
-- 주문자 (고객) 테이블 : customer
create table customer  (
	custId 	int not null auto_increment primary key, 
	name 	varchar(20) not null, 
	address	varchar(30) not null, 
	phone 	varchar(15)
);


-- customer(고객정보 등록)
INSERT INTO customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');  
INSERT INTO customer VALUES (3, '김말숙', '대한민국 강원도', '000-7000-0001');
INSERT INTO customer VALUES (4, '손흥민', '영국 토트넘', '000-8000-0001');
INSERT INTO customer VALUES (5, '박세리', '대한민국 대전',  null);
INSERT INTO customer VALUES (6, '이순신', '대한민국 아산',  '');



/* 주문 테이블 */ 
-- on update cascade : 원본 테이블의 데이터 변경시 참조테이블이 영향을 받는다. 
-- on delete restrict : 원본 테이블의 데이터 삭제시 참조 테이블이 영향을 받는다. 
-- 						(참조 테이블에서 참조를 하고 있다면 삭제 불가)
create table orders (
	orderId		int not null auto_increment, /* 주문 고유 번호 */
	custId		int not null, 						/* 고객 (주문자) 아이디 */
	bookId		int not null, 						/* 책 고유 번호 */
	salePrice	int not null, 			/* 책 할인 가격(실제 판매 가격) */
	orderDate	timestamp, 				/* 주문 날짜 */
	primary key(orderId), 				/* 주키 : orderId */
	foreign key(custId) references customer(custId) on update cascade on delete restrict, 	/* 외래키 */
	foreign key(bookId) references books(bookId) on update cascade on delete restrict		/* 외래키 */
);

-- orders(주문정보) 데이터 생성
INSERT INTO orders VALUES (1, 1, 1, 6000, '2009-07-01'); 
INSERT INTO orders VALUES (2, 1, 3, 21000, '2018-02-03');
INSERT INTO orders VALUES (3, 2, 5, 8000, '2021-05-03'); 
INSERT INTO orders VALUES (4, 3, 6, 6000, '2020-06-04'); 
INSERT INTO orders VALUES (5, 4, 7, 20000, '2019-11-05');
INSERT INTO orders VALUES (6, 1, 2, 12000, '2021-09-07');
INSERT INTO orders VALUES (7, 4, 8, 13000, '2019-03-07');
INSERT INTO orders VALUES (8, 3, 10, 12000, '2018-07-08'); 
INSERT INTO orders VALUES (9, 2, 10, 9000, '2019-05-09'); 
INSERT INTO orders VALUES (10, 3, 11, 27000, '2020-06-15');
INSERT INTO orders VALUES (11, 2, 13, 11000, '2021-06-18');
INSERT INTO orders VALUES (12, 3, 15, 13000, '2021-08-20');
INSERT INTO orders VALUES (13, 6, 18, 19000, '2021-10-10'); 
INSERT INTO orders VALUES (14, 6, 16, 27000, '2021-11-20');
INSERT INTO orders VALUES (15, 3, 20, 30000, '2021-11-20');
INSERT INTO orders VALUES (16, 4, 16, 26000, '2021-11-25');
INSERT INTO orders VALUES (17, 4, 8, 13000, '2021-06-10');
INSERT INTO orders VALUES (18, 6, 8, 12000, '2021-06-10');
INSERT INTO orders VALUES (19, 2, 15, 13000, '2021-07-12');
INSERT INTO orders VALUES (20, 2, 17, 22000, '2021-10-15');


select * from orders;
select * from books;
select * from customer;

delete from customer where custId = 5;	-- 원본 테이블에 없는 값이라서 삭제 가능 
delete from customer where custId = 6;	-- 원본 테이블에 있는 값이라서 삭제 불가능 restrict

delete from books where bookId = 4;

update books

-- customer 테이블의 전화번호가 null인 자료
select * from customer where phone is null;

-- 고객 별로 주문한 도서의 총 수량과 총 판매액을 구하시오. 이 때 '고객 아이디'도 출력하시오. 
select custId, count(*), sum(salePrice) from orders group by custId;

-- 도서 가격이 8천원 이상인 도서를 구매한 고객에 대하여 주문 도서의 총 수량을 구하시오.
--2권 이상 구매한 고객만, 아이디 출력
select custId, count(*), sum(salePrice) 
from orders 
where salePrice >=8000  group by custId having count(*) >= 4;

/* -----------------------------------------JOIN - 다중 테이블 응용-------------------------------------------- */
/* 고객 테이블과 주문 테이블을 조건 없이 연결하여 출력해보자 */
SELECT * FROM customer, orders;
SELECT * FROM customer cc, orders oo;		-- 두 테이블의 필드 모두 사용 가능

-- 제약 조건 없이 고객 테이블과  주문 테이블 검색
SELECT oo.custId AS 주문번호, cc.name AS 주문자 FROM customer cc, orders oo;	

-- 고객명과 해당 고객이 주문한 사항을 모두 출력하시오
SELECT cc.name, oo.orderId, oo.salePrice, oo.orderDate FROM customer cc, orders oo WHERE oo.custId = cc.custId;	

-- 고객과 해당 고객이 주문한 정보에 대한 자료를 출력하되, 고객 번호순으로 출력하시오. 
SELECT cc.custId, cc.name, oo.orderId, oo.salePrice, oo.orderDate FROM customer cc, orders oo WHERE oo.custId = cc.custId ORDER BY oo.custId;	

-- 고객명과 해당 고객이 주문한 도서의 판매가격을 검색하시오( 출력 : 고객명, 판매가격)
SELECT name, salePrice FROM customer, orders WHERE customer.custId = orders.custId;

-- 고객명과 고객이 주문한 도서 이름을 출력하시오(3개 테이블 조인)
SELECT cc.name, bb.bookName, bb.bookId FROM books bb, customer cc, orders oo
WHERE oo.custId = cc.custId and oo.bookId = bb.bookId;

-- 실제 판매 가격이 2만원 이상인 도서를 주문한 고객 명, 도서명, 판매 정가
SELECT cc.name, bb.bookName, bb.price FROM books bb, customer cc, orders oo
WHERE oo.custId = cc.custId and oo.bookId = bb.bookId and oo.salePrice >=20000;

-- 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하여 출력하시오. (출력: 고객명, 총 판매액)
SELECT cc.name 고객명, SUM(oo.salePrice) 총판매액 FROM customer cc, orders oo
WHERE oo.custId = cc.custId group by cc.name order by cc.name;

SELECT name 고객, format(sum(salePrice), 0) 누적구매금액 FROM customer, orders 
WHERE customer.custId = orders.custId GROUP BY name;

-- 고객 모두에 대하여 책을 주문한 내역 출력 ( 책 구매하지 않은 회원도 출력) -  Left JOIN	!!
-- 고객은 모두(주테이블) + 책 주문내역(보조)
SELECT cc.name, oo.bookId from customer cc left join orders oo
on cc.custId = oo.custId;

/* 구매한 책에 대하여 책을 주문한 고객 내역 출력(구매된 정보 모두 출력) -Right JOIN */

SELECT cc.name, oo.bookId, oo.orderId from customer cc right join orders oo
on cc.custId = oo.custId;

/* outer Join : 많이 안씀 (left join 가장 많이 씀) 
 * 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서 판매 가격을 출력*/

SELECT cc.name, oo.salePrice
FROM customer cc LEFT OUTER JOIN orders oo
ON cc.custId = oo.custId;


/* -------------------- 부속 질의(Sub Query) -------------------- */
-- 가장 비싼도서의 이름과 정가 출력
select bookName, max(price) from books;
select bookName, price from books ;

select bookName, price from books where price = (select max(price) from books);

/* 도서를 구매한 적이 있는 고객의 이름을 출력하세요 */
select name from customer where custId in (select custId from orders);

/*  출판사 '대한미디어'의 책을 구매한 고객 이름 출력
 */

select name from customer where custId in 
(select custId from orders where bookId in 
(select bookid from books where publisher = '대한미디어'));
-- 조인 없이 각 테이블에서 연산 후 값 가져옴

select name, publisher from customer, orders, books 
where customer.custId = orders.custId 
and books.bookId = orders.bookId 
and publisher = '대한미디어';

/* 도서를 구매하지 않은 고객의 이름을 출력하시오*/ 
select name from customer where custId not in(select custId from orders);


select count(*) from orders where custId = 1;
select orderId from orders where orderDate <='2019-07-04' or orderDate >= '2020-06-05';
select * from orders order by orderDate;


select name, address from customer where name like '김%아';


SELECT cc.custId 고객아이디, cc.name 고객명, count(*) 총수량 ,SUM(oo.salePrice) 총판매액 FROM customer cc, orders oo
WHERE oo.custId = cc.custId group by cc.name order by cc.name;




select cc.custId 고객아이디, count(*) 총수량 from customer cc, orders oo, books bb
where cc.custId = oo.custId and bb.bookId = oo.bookId 
group by cc.custid having count(*)>=4;



select bb.bookName 책이름, oo.salePrice 책구매가격, bb.price-oo.salePrice 차이
from orders oo, books bb 
where bb.bookId = oo.bookId and custId = (select custId from customer where name = '박지성');  


select name, format(sum(salePrice), 0) from customer cc, orders oo
where cc.custId = oo.custId
group by name;


select max(bb.price-oo.salePrice) from books bb, orders oo
where bb.bookId = oo.bookId;
select * from orders where 


select * from books bb, orders oo
where bb.bookId = oo.bookId order by bb.price-oo.salePrice desc limit 0, 1;


select cc.name 고객명, format(sum(oo.salePrice), 0) from customer cc left join orders oo
on cc.custId = oo.custId
group by cc.name;

select  format(avg(select sum(oo.salePrice) from customer cc left join orders oo
on cc.custId = oo.custId
group by cc.name), 0);



select sum(oo.salePrice) from customer cc left join orders oo
on cc.custId = oo.custId
group by cc.name;






