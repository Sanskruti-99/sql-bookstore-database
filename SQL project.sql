use online_bookstore;

select * from books;
select * from customers;
select * from orders;

-- Basic Queries --
-- Q1 Retrive all books in the "fiction" genre
select * from books
where genre = 'Fiction';

-- Q2 Find all books published after the year 1950
select * from books
where Published_Year >1950;

-- Q3 list all customer from Canada
select * from customers
where country = 'canada';

-- Q4 show order placed in nov 2023
select * from orders
where Order_Date between '2023-11-01' and '2023-11-30';

-- Q5 retrive the total stocks of books available
select sum(stock) as total_stock
from books;

 -- Q6 find the detail of most expensive book
 select * from books
 order by price desc
 limit 1;
 
 -- Q7 show all customers who ordered more than 1 quantity of book
 select * from orders
 where quantity > 1;
 
 -- Q8 retrive all orders where total amt exceeds $20
 select * from orders
 where Total_Amount > 20; 
 
-- Q9  list all the genre available in books table
select distinct genre from books;

-- Q10 find the book with lowest stock
select * from books
order by stock 
limit 1;

-- Q11 calculate the total revenue generated from all order
select sum(Total_Amount) as total_revenue
from orders;

-- Advanced Queries --
-- Q1 Retrieve the total number of books sold for each genre
select b.Genre,sum(o.quantity) as total_book_sold
from books b join orders o
on b.Book_ID = o.Book_ID
group by b.Genre;

-- Q2 Find the average price of books in the "Fantasy" genre
select avg(price)
from books
where genre = 'Fantasy';

-- Q3 List customers who have placed at least 2 orders
select o.customer_id, c.name, count(o.Order_id) AS ORDER_COUNT
from orders o
join customers c on o.customer_id=c.customer_id
group by o.customer_id, c.name
having count(Order_id) >=2;

-- Q4 Find the most frequently ordered book
select o.book_id, b.title, count(o.order_id) as order_count
from books b join orders o
on o.Book_ID = b.Book_ID
group by o.Book_ID,b.Title
having order_count >2;

-- Q5 Show the top 3 most expensive books of 'Fantasy' Genre
select * from books
where genre = 'fantasy'
order by price desc
limit 3;

-- Q6 Retrieve the total quantity of books sold by each author
select b.author, sum(o.quantity) as Total_Books_Sold
from orders o join books b 
on o.book_id=b.book_id
group by b.Author;

-- Q7  List the cities where customers who spent over $30 are located
select distinct city,o.total_amount 
from customers c join orders o 
on c.Customer_ID =  o.Customer_ID
where o.Total_Amount > 30 ;

-- Q8 Find the customer who spent the most on orders
select c.customer_id, c.name, sum(o.total_amount) AS Total_Spent
from orders o join customers c 
on o.customer_id=c.customer_id
group by c.customer_id, c.name
order by Total_spent Desc LIMIT 1;

-- Q9 Calculate the stock remaining after fulfilling all orders


