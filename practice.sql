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




