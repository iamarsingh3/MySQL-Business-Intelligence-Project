# MySQL-Business-Intelligence-Project

## SQL Query Summary: Understanding SQL Operations

Here we have a series of SQL queries and explanations related to various SQL operations performed on the Maven Movies database were discussed. These queries cover a wide range of tasks and concepts commonly used in SQL data manipulation. Here's a breakdown of what i have learned:

### Basic Retrieval

We started with basic data retrieval using the `SELECT` statement.

### Distinct Values

Learned how to retrieve unique values using the `DISTINCT` keyword.

### Filtering Data

Explored how to filter data using the `WHERE` clause with various operators like `=`, `<>`, `>`, `<`, `>=`, and `<=`.

### Logical Operators

Used `AND` and `OR` operators to combine conditions in `WHERE` clauses.

### Pattern Matching

Introduced the `LIKE` operator for pattern matching in text data.

### Data Aggregation

Discussed how to aggregate data using functions like `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`.

### Grouping Data

Used the `GROUP BY` clause to group data based on specific columns.

### Filtering Grouped Data

The `HAVING` clause allowed us to filter grouped data.

### Sorting Data

Learned how to sort data using the `ORDER BY` clause.

### Conditional Logic

Introduced the `CASE` statement for conditional operations.

### Data Pivot

Briefly touched on data pivot operations for transforming data.

### Pro Tip

Lastly, a pro tip related to pivoting data was provided.




-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



## SQL Join Statements: Understanding Join Types

In SQL, the purpose of using join statements is to enable multi-table querying. Here, we'll explore different types of joins and their use cases.

### Inner Join

An inner join returns matching records from both tables. 

* Assignment 1 (inner join)

### Left Join

A left join preserves all records from the left table and matching records from the right table. 
 
 * Assignment 2 (left join)

### Right Join

A right join returns all records from the right table and matching records from the left table. 

 * Assignment 3 (right join)

### Full Outer Join 

 A full outer join returns all matching records from both tables. MySQL doesn't support full outer joins directly; you can use UNION to achieve it: 
 

### Pro Tips: Handling Join Challenges

If you don't have a key to join two tables, consider using a bridge concept or the UNION ALL concept for combining data from different sources.

### Multi-Condition Join

You can perform multi-condition joins using the WHERE clause or the AND operator within the join condition.

* Assignment 4 (Multi-condition join)

### Union
The UNION operator combines two or more result sets into one, removing duplicate values. 

 * Assignment 5 (Union all)



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                  
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# Mid-Course Project SQL File - Project Requirements

In this section, we outline the SQL queries required to fulfil the requests made in the letter from Joe Scardycat, Lead Underwriter.

## Letter

> Dear Maven Movies Management,
>
> In our review of your policy renewal application, we have realized that your business information has not been updated in a number of years. In order to accurately assess the risk and approve your policy renewal, we will need you to provide all of the following information.
>
> Sincerely,
> Joe Scardycat, Lead Underwriter

## SQL Script

### 1. List of All Staff Members

We need a list of all staff members, including their first and last names, email addresses, and the store identification number where they work.

### 2. Counts of Inventory Items

### 3. Count of Active Customers

### 4. Count of Customer Email Addresses

### 5. Film Offering Diversity

### 6. Replacement Cost of Films

### 7. Payment Processing Insights

### 8. Customer Base Analysis



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                  
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



# Final Project SQL File - Martin Moneybags' Questions

In this section, we outline the SQL queries required to answer the questions posed by Martin Moneybags in his letter.

## Letter

> Dear Maven Movies Management,
> 
> I am excited about the potential acquisition and learning more about your rental business. Please bear with me as I am new to the industry, but I have a number of questions for you. Assuming you can answer them all, and that there are no major surprises, we should be able to move forward with the purchase.
> 
> Best,
> Martin Moneybags

## Questions

### 1. Managers and Store Addresses

### 2. Inventory List

### 3. Inventory Overview by Rating

### 4. Inventory Diversity and Replacement Cost

### 5. Customer Information

### 6. Advisors and Investors

### 7. Customer Spending and Value

### 8. Coverage of Awarded Actors


## These SQL queries answer Martin Moneybags' questions and provide valuable insights into your business. If you have any further questions or need additional information go Final Project SQL File





