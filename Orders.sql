


--Problem A - Insert 5 new orders using your name as customer and make sure to order Diaper and Beer.

CREATE TABLE "030320".orders (
   ID serial NOT NULL PRIMARY KEY,
   info json NOT NULL
);
INSERT INTO "030320".orders (info)
VALUES
   (
      '{ "customer": "John Doe", "items": {"product": "Beer","qty": 6}}'
      ),
   (
      '{ "customer": "Lily Bush", "items": {"product": "Diaper","qty": 24}}'
   ),
   (
      '{ "customer": "Josh William", "items": {"product": "Toy Car","qty": 1}}'
   ),
   (
      '{ "customer": "Mary Clark", "items": {"product": "Toy Train","qty": 2}}'
   ),
      (
      '{ "customer": "Mary Clark", "items": {"product": "Beer","qty": 4}}'
   );
   
--Problem B - Find out who bought diaper and Beer.
SELECT 
info ->> 'customer' AS "Who bought Diaper and Beer?" 
FROM "030320".orders WHERE info -> 'items' ->> 'product' = 'Beer' 

UNION 

SELECT 
info ->> 'customer' FROM "030320".orders 
WHERE info -> 'items' ->> 'product' = 'Diaper


 

 --Problem C - who bought the least item?
 
 SELECT info ->> 'customer' AS "Bought Least Item", 
info -> 'items' ->> 'product' AS "Product Item", 
MIN ( CAST( info -> 'items' ->> 'qty' AS INTEGER)) AS "Bought" 
FROM "030320".orders 
GROUP BY info ->> 'customer', info -> 'items' ->> 'product' 
LIMIT 1



 --Problem D - who bought the most item?

SELECT info ->> 'customer' AS "Bought Most Item", 
info -> 'items' ->> 'product' AS "Product Item", 
MAX ( CAST( info -> 'items' ->> 'qty' AS INTEGER)) AS "Bought" 
FROM "030320".orders 
GROUP BY info ->> 'customer', info -> 'items' ->> 'product', info -> 'items' ->> 'qty'
ORDER BY CAST(info -> 'items' ->> 'qty' AS INTEGER) DESC
LIMIT 1


 --Problem E - Create a function that will return the total products based on qty.
 SELECT
   SUM (
      CAST (
         info -> 'items' ->> 'qty' AS INTEGER
      )
   )
   FROM
   "030320".orders