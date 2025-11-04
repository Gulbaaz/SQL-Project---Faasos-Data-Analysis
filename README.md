# 🍔 SQL Project — Faasos Online Food Delivery Analysis  

### 🧾 Project Overview  
This project analyzes a simulated **Faasos online food delivery dataset** to explore customer behavior, order patterns, and driver performance.  
The dataset includes information about **orders, customers, drivers, ingredients, and recipes**, enabling end-to-end SQL practice — from data cleaning to analytical insights.  

---

### 📂 Repository Structure  
SQL-Project---Faasos
│
├── 01_Data/
│ └── faasos_dataset.sql # SQL script to create and populate all tables
│
├── 02_SQL_Queries/
│ └── faasos_queries.sql # All analytical SQL questions with solutions
│
├── 03_Outputs/
│ └── results_summary.txt # Summary of findings and insights
│
└── README.md # Project documentation

---

### 🧠 Problem Statements  
The project answers the following key business and analytical questions using SQL:  

1. How many rolls were ordered?  
2. How many unique customer orders were made?  
3. How many successful orders were delivered by each driver?  
4. How many of each type of roll were delivered?  
5. How many veg and non-veg rolls were ordered by each customer?  
6. What was the maximum number of rolls delivered in a single order?  
7. For each customer, how many delivered rolls had at least one change and how many had none?  
8. How many rolls were delivered that had both exclusions and extras?  
9. What was the total number of rolls ordered for each hour of the day?  
10. What was the number of orders for each day of the week?  
11. What was the average time in minutes it took for each driver to arrive at Faasos HQ for pickup?  
12. Is there any relationship between the number of rolls and how long the order takes to prepare?  
13. What was the average distance travelled for each customer?  

---

### 🧩 SQL Concepts Used  
- **JOINS (INNER, LEFT, RIGHT)**  
- **CTEs and Subqueries**  
- **CASE Statements**  
- **Window Functions** (`ROW_NUMBER()`, `RANK()`, etc.)  
- **String Functions** for data cleaning (`REPLACE`, `SUBSTRING_INDEX`, etc.)  
- **Aggregate Functions** (`COUNT`, `SUM`, `AVG`)  
- **GROUP BY and HAVING Clauses**  
- **Date & Time Functions** (`HOUR()`, `DAYNAME()`, etc.)  

---

### 📊 Insights Summary  
- Non-veg rolls had higher order frequency compared to veg rolls.  
- Evening hours saw the highest ordering activity.  
- A few drivers completed the majority of successful deliveries.  
- Several customers customized their orders, showing strong demand for personalized food options.  
- Average delivery time generally increased with distance, but efficiency varied between drivers.  
- The dataset helps simulate a real-world delivery business, ideal for SQL learners practicing analytics-oriented queries.  

---

### ⚙️ Tools & Technologies  
- **Database:** MySQL  
- **Language:** SQL  
- **IDE:** MySQL Workbench / VS Code  
- **Version Control:** Git & GitHub  

---

### 🚀 How to Run the Project  
1. Clone this repository:  
   ```bash
   git clone https://github.com/Gulbaaz/SQL-Project---Faasos.git
2. Open MySQL Workbench (or any SQL IDE).
3. Run the script from 01_Data/faasos_dataset.sql to create and populate tables.
4. Execute the queries from 02_SQL_Queries/faasos_queries.sql.
5. Review insights in 03_Outputs/results_summary.txt.

---

### 🧑‍💻 Author

Gulbaaz
📍 Delhi, India
💼 Data Analyst | SQL | Python | Power BI
🔗 [LinkedIn Profile](https://www.linkedin.com/in/gulbaaz/)

---

bas itna hi. formatting clean hai, emojis optional hain — chahe toh hata bhi sakte ho agar minimal look chahiye.



