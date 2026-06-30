drop table if exists zepto;
CREATE table zepto(
sku_id SERIAL primary key,
category varchar(120),
name varchar(150)not null,
mrp numeric(8,2),
discountPercent numeric(5,2),
availableQuantity integer,
discountedSellingPrice numeric(8,2),
weightInGms integer,
outOfStock boolean,
quantity integer
);

-- data exploration
-- count of rows
SELECT COUNT(*) from zepto;

-- sample data view
SELECT * from zepto
limit 10;

-- finding the null values
SELECT * FROM zepto
where name is null
or
category is null
or
mrp is null
or
discountPercent is null
or
availableQuantity is null
or
discountedSellingPrice is null
or
weightInGms is null
or
outOfStock is null
or
quantity is null;

-- different product categories
SELECT DISTINCT category
from zepto
order by category;

-- product in stock vs out of stock
SELECT outOfStock ,count (sku_id)
from zepto
GROUP BY outOfStock;

-- product name present in multiple times
SELECT name,COUNT(sku_id) as "Number od SKUs"
from zepto
GROUP BY name
HAVING COUNT (sku_id)>1
ORDER BY count(sku_id)DESC;

-- data cleaning
-- products with price 0
SELECT * FROM zepto WHERE discountedSellingPrice=0 or mrp=0;

--    so it is unwanted cause nothing is gaven freely
DELETE FROM zepto where mrp=0;

-- while we look into our zepto dataset observe that mrp is high its in thousands convert them to the to the 100 rupees
UPDATE zepto set mrp=mrp/100.0,
discountedSellingPrice=discountedSellingPrice/100.0;

SELECT mrp,discountedSellingPrice FROM zepto

-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name,mrp,discountPercent
FROM zepto
ORDER BY discountPercent DESC
limit 10;

-- Q2. What are the products with high MRP but out of stock?
SELECT DISTINCT name,mrp
from zepto
where outOfStock=TRUE and mrp>300
ORDER BY mrp DESC;

-- Q3. Calculate estimated revenue for each category.
SELECT category,
sum(discountedSellingPrice*availableQuantity) as total_revenue
from zepto
GROUP BY category
ORDER BY total_revenue;

-- Q4. Find all products where MRP is greater than 500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent 
from zepto
WHERE mrp>500 and discountPercent<10
ORDER BY mrp DESC,discountPercent DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(avg(discountPercent),2) AS avg_discount from zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name,weightInGms,discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) as price_per_gram
from zepto
where weightInGms>=100
ORDER BY price_per_gram;

-- Q7. Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name,weightInGms,
CASE WHEN weightInGms<1000 then 'Low'
	WHEN weightInGms<5000 then 'Medim'
	ELSE 'Bulk'
end as weight_category
from zepto
order by weight_category DESC

-- Q8. What is the total inventory weight per category?
SELECT category ,
sum(weightInGms*availableQuantity) as total_weight
from zepto
GROUP BY category
ORDER BY total_weight;

