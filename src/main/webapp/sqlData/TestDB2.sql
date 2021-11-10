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










