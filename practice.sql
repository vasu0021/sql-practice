-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME> :-

select FIRST_NAME AS WORKER_NAME
FROM Worker;

-- Q-2. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

SELECT DISTINCT department
FROM Worker;

-- Q-3. Write an SQL query to show the last 5 record from a table. 

SELECT * 
FROM Worker
order by Worker_id desc  
LIMIT 5;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table. 

SELECT substring(FIRST_NAME,1,3) AS THREE_CHAR_NAME
FROM worker;

-- Q5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Satish’ from Worker table.

-- Method.1 [locate] 
SELECT locate('a',FIRST_NAME) AS Position_of_a
FROM Worker
WHERE FIRST_NAME = 'Satish';
 
-- Method.2 [INSTR]
SELECT INSTR(FIRST_NAME,'a') AS Position_of_a
FROM Worker
WHERE FIRST_NAME = 'Satish'; 

-- Q6. Write an SQL query to print the name of employees having the highest salary in each department. 

SELECT FIRST_NAME, DEPARTMENT, SALARY
FROM Worker
WHERE (DEPARTMENT,SALARY) IN (
	SELECT DEPARTMENT, MAX(SALARY)
    FROM Worker
    GROUP BY DEPARTMENT
);

-- Q-7. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.

SELECT rtrim(FIRST_NAME)
FROM Worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length. 

SELECT DISTINCT(DEPARTMENT) AS Deparment_Name, length(DEPARTMENT) AS Length
FROM Worker;

-- Q-9. Write an SQL query to fetch nth max salaries from a table. 

-- Method 1: LIMIT + OFFSET:-
 
SELECT DISTINCT SALARY
FROM Worker
ORDER BY SALARY DESC
LIMIT 1 OFFSET 1;

-- Method 2: Subquery:-

SELECT MAX(salary)
FROM Worker AS Nth_salary
WHERE salary < (
	SELECT MAX(salary)
	FROM Worker
);

-- Q-10. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’. 

SELECT replace(FIRST_NAME,'a','A')
FROM Worker;

-- Case Sensitivity 
SELECT replace(lower(FIRST_NAME),'a','A')
FROM Worker;

--  Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

SELECT * FROM WORKER
ORDER BY FIRST_NAME asc, DEPARTMENT desc;

-- Q-12. Write an SQL query to fetch the names of workers who earn the highest salary. 

SELECT FIRST_NAME
from worker
WHERE salary = (
	SELECT max(salary)
    from Worker
);

-- Q-13. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table. 

-- Method 1:
SELECT *
FROM Worker
WHERE FIRST_NAME NOT IN ('Vipul','Satish');

-- Q-14. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

SELECT *
FROM Worker
WHERE FIRST_NAME LIKE '_____h';

-- Q-15. Write a query to validate Email of Employee. 

SELECT Email
FROM Worker
WHERE Email LIKE '%@%.%';

-- Q-16. Write an SQL query to print details of the Workers who have joined in Feb’2014.

SELECT *
FROM Worker
WHERE MONTH(JOINING_DATE) = 2
AND YEAR(JOINING_DATE) = 2014;

-- Q-17. Write an SQL query to fetch duplicate records having matching data in some fields of a table. 

SELECT FIRST_NAME, count(*)
FROM worker
group by FIRST_NAME
HAVING COUNT(*) > 1;

-- Q-18. How to remove duplicate rows from Employees table.

DELETE FROM Worker
WHERE WORKER_ID NOT IN (
    SELECT MIN(WORKER_ID)
    FROM Worker
    GROUP BY FIRST_NAME
);













