// Bai 2356
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;

// Bai 1378
SELECT
    COALESCE(EU.unique_id, NULL) AS unique_id,
    E.name
FROM
    Employees E
LEFT JOIN
    EmployeeUNI EU
ON
    E.id = EU.id;

// Bai 1683
SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;

//Bai 1795
SELECT product_id, 'store1' AS store, store1 AS price
FROM Products
WHERE store1 IS NOT NULL

UNION ALL

SELECT product_id, 'store2' AS store, store2 AS price
FROM Products
WHERE store2 IS NOT NULL

UNION ALL

SELECT product_id, 'store3' AS store, store3 AS price
FROM Products
WHERE store3 IS NOT NULL;

//Bai 1587
SELECT
    u.name,
    SUM(t.amount) AS balance
FROM
    Users u
JOIN
    Transactions t
ON
    u.account = t.account
GROUP BY
    u.name
HAVING
    SUM(t.amount) > 10000;

// Bai 627
UPDATE Salary
SET sex = CASE
            WHEN sex = 'm' THEN 'f'
            WHEN sex = 'f' THEN 'm'
          END;

// Bai 1068
SELECT
    p.product_name,
    s.year,
    s.price
FROM
    Sales s JOIN Product p ON s.product_id = p.product_id

// Bai 1581
SELECT
    v.customer_id,
    COUNT(v.visit_id) AS count_no_trans
FROM
    Visits v
LEFT JOIN
    Transactions t
ON
    v.visit_id = t.visit_id
GROUP BY
    v.customer_id
HAVING
    COUNT(t.transaction_id) = 0;

// Bai 1581
WITH NoTransactionVisits AS (
  SELECT v.customer_id
  FROM Visits v
  LEFT JOIN Transactions t ON v.visit_id = t.visit_id
  WHERE t.transaction_id IS NULL
)

SELECT
  customer_id,
  COUNT(*) AS count_no_trans
FROM
  NoTransactionVisits
GROUP BY
  customer_id;

// Bai 1179
SELECT
    id,
    MAX(CASE WHEN month = 'Jan' THEN revenue END) AS Jan_Revenue,
    MAX(CASE WHEN month = 'Feb' THEN revenue END) AS Feb_Revenue,
    MAX(CASE WHEN month = 'Mar' THEN revenue END) AS Mar_Revenue,
    MAX(CASE WHEN month = 'Apr' THEN revenue END) AS Apr_Revenue,
    MAX(CASE WHEN month = 'May' THEN revenue END) AS May_Revenue,
    MAX(CASE WHEN month = 'Jun' THEN revenue END) AS Jun_Revenue,
    MAX(CASE WHEN month = 'Jul' THEN revenue END) AS Jul_Revenue,
    MAX(CASE WHEN month = 'Aug' THEN revenue END) AS Aug_Revenue,
    MAX(CASE WHEN month = 'Sep' THEN revenue END) AS Sep_Revenue,
    MAX(CASE WHEN month = 'Oct' THEN revenue END) AS Oct_Revenue,
    MAX(CASE WHEN month = 'Nov' THEN revenue END) AS Nov_Revenue,
    MAX(CASE WHEN month = 'Dec' THEN revenue END) AS Dec_Revenue
FROM Department
GROUP BY id
ORDER BY id;

// Bai 1484
SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;

// Bai 1890
SELECT
    user_id,
    MAX(time_stamp) AS last_stamp
FROM
    Logins
WHERE
    YEAR(time_stamp) = 2020
GROUP BY
    user_id;

// Bai 1251
SELECT
    p.product_id,
    ROUND(
        SUM(us.units * p.price) / SUM(us.units),
        2
    ) AS average_price
FROM Prices p
LEFT JOIN UnitsSold us
    ON p.product_id = us.product_id
    AND us.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id
ORDER BY p.product_id;

// Bai 1789
SELECT employee_id,
       COALESCE(
           (SELECT department_id
            FROM Employee e
            WHERE e.employee_id = emp.employee_id
              AND e.primary_flag = 'Y'
            LIMIT 1),
           (SELECT department_id
            FROM Employee e
            WHERE e.employee_id = emp.employee_id
            LIMIT 1)
       ) AS department_id
FROM Employee emp
GROUP BY employee_id;