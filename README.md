# sql_project_retail-_sale
# 🛒 Retail Sales Data Analysis Using SQL

## 📌 Project Overview

This project focuses on analyzing a **retail sales dataset using SQL** to extract meaningful business insights from transactional data.

The analysis covers **sales performance, customer behavior, product categories, gender-wise transactions, monthly sales trends, top customers, and order patterns by time of day**.

The primary objective is to demonstrate how SQL can be used to transform raw transactional data into actionable business insights and answer real-world business questions.

---

## 🎯 Project Objectives

The project aims to:

* Explore and understand retail transaction data.
* Calculate overall sales and customer metrics.
* Analyze sales performance across different product categories.
* Understand customer purchasing behavior.
* Compare transactions across genders and categories.
* Identify the best-performing month in each year.
* Identify the top customers based on total sales.
* Calculate unique customers by category.
* Analyze order volume across different shifts of the day.
* Practice SQL techniques used in real-world data analytics.

---

## 🗂️ Dataset

The analysis is performed on a retail sales table named:

```sql
retail_sales
```

The dataset contains transactional information such as:

* Transaction ID
* Sale Date
* Sale Time
* Customer ID
* Gender
* Age
* Product Category
* Quantity
* Price Per Unit
* Cost of Goods Sold (COGS)
* Total Sale

---

## 🔎 Data Exploration

The project begins with basic exploratory analysis to understand the dataset.

### Total Number of Sales

```sql
SELECT COUNT(*) AS total_sale
FROM retail_sales;
```

### Number of Unique Customers

```sql
SELECT COUNT(DISTINCT customer_id) AS no_customer
FROM retail_sales;
```

### Available Product Categories

```sql
SELECT DISTINCT category
FROM retail_sales;
```

These initial queries help establish a basic understanding of the size of the dataset, customer base, and available product categories.

---

# 📊 Business Questions & SQL Analysis

The project answers **10 practical business questions** using SQL.

## 1. Sales on a Specific Date

**Business Question:**
Retrieve all sales transactions made on **November 5, 2022**.

```sql
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';
```

**Business Use:**
Useful for analyzing daily sales activity and investigating transaction patterns on specific dates.

---

## 2. Clothing Sales Analysis

**Business Question:**
Identify Clothing transactions with high quantities during November 2022.

```sql
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND DATE_FORMAT(sale_date, '%Y-%M') = '2022-11'
  AND quantiy >= 4;
```

**Business Use:**
Can help identify high-volume clothing purchases and understand demand during a particular period.

> **Note:** The current SQL uses `quantiy`. If the actual column is named `quantity`, this should be corrected.

---

## 3. Sales by Product Category

**Business Question:**
Calculate total sales and number of orders for each category.

```sql
SELECT
    category,
    SUM(total_sale) AS net_sale,
```
