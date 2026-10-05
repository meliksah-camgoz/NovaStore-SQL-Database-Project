# 🛒 NovaStore – E-Commerce Database Management System

NovaStore is a relational database project developed for an e-commerce scenario using **MySQL**.

The project focuses on database design, table relationships, data management and SQL queries used to analyze customers, products and orders.

## 📌 Project Overview

The database is designed to manage the core data of an e-commerce platform:

- Product categories
- Products and stock information
- Customers
- Orders
- Order details

The project demonstrates both fundamental and intermediate SQL concepts, including **DDL, DML, JOIN, GROUP BY, aggregate functions, date functions and VIEWs**.

---

## 🛠️ Technologies

- **MySQL**
- **MySQL Workbench**
- **SQL**

---

## 🗄️ Database Structure

The project contains 5 relational tables:

| Table | Description |
|---|---|
| `Categories` | Stores product categories |
| `Products` | Stores product, price and stock information |
| `Customers` | Stores customer information |
| `Orders` | Stores customer orders |
| `OrderDetails` | Stores products included in each order |

### Table Relationships

```text
Categories
    │
    └── Products
          │
          └── OrderDetails
                    │
Orders ─────────────┘
   │
   └── Customers
```

The relationships are established using **Primary Key (PK)** and **Foreign Key (FK)** constraints.

---

## 📊 Project Data

The database contains sample e-commerce data:

| Data | Count |
|---|---:|
| Categories | 5 |
| Products | 50 |
| Customers | 6 |
| Orders | 8 |
| Order Details | 16 |

There are **10 products in each category**.

### Product Categories

- Electronics
- Computers
- Phones
- Cosmetics
- Home & Living

---

## 🔍 SQL Operations

The project includes examples of:

### Basic Queries

- `SELECT`
- `WHERE`
- `ORDER BY`

### Relational Queries

- `INNER JOIN`
- `LEFT JOIN`

### Aggregation

- `COUNT()`
- `SUM()`
- `GROUP BY`

### Date Operations

- `DATEDIFF()`
- `CURDATE()`

### Database Objects

- `CREATE DATABASE`
- `CREATE TABLE`
- `PRIMARY KEY`
- `FOREIGN KEY`
- `CREATE VIEW`

---

## 👨‍💻 Example Queries

### Products with Low Stock

```sql
SELECT
    ProductID,
    ProductName,
    Price,
    Stock
FROM Products
WHERE Stock < 20
ORDER BY Stock ASC;
```

### Customer Orders

```sql
SELECT
    c.CustomerID,
    c.FullName AS Musteri,
    c.City AS Sehir,
    o.OrderID,
    o.OrderDate AS SiparisTarihi,
    o.TotalAmount AS SiparisTutari
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
ORDER BY o.OrderDate;
```

### Customer Revenue

```sql
SELECT
    c.CustomerID,
    c.FullName AS Musteri,
    SUM(o.TotalAmount) AS ToplamCiro
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FullName
ORDER BY ToplamCiro DESC;
```

---

## 👁️ VIEW

The project includes a reusable SQL VIEW named:

```text
vw_OrderDetails
```

This VIEW combines customer, order and product information and provides details such as:

- Customer
- City
- Order date
- Product
- Quantity
- Unit price
- Subtotal
- Order total

Example:

```sql
SELECT *
FROM vw_OrderDetails
ORDER BY OrderID;
```

---

## 💾 Database Backup

A MySQL database export is also included as a backup of the project database.

The exported `.sql` file can be used to recreate the database structure and data.

---

## 📁 Project Structure

```text
NovaStore-SQL-Database-Project/
│
├── README.md
│
├── sql/
│   └── NovaStoreDB_Odev.sql
│
├── backup/
│   └── NovaStoreDB_Backup.sql
│
├── report/
│   └── NovaStore_Veritabani_Proje_Raporu.docx
│
└── screenshots/
    ├── stock-query.png
    ├── customer-orders.png
    ├── customer-products.png
    ├── category-products.png
    ├── customer-revenue.png
    ├── order-date-analysis.png
    └── order-details-view.png
```

---

## 🚀 How to Run

1. Install **MySQL** and **MySQL Workbench**.
2. Clone or download this repository.
3. Open the SQL file:

```text
sql/NovaStoreDB_Odev.sql
```

4. Open it in MySQL Workbench.
5. Execute the script.
6. The `NovaStoreDB` database and its tables will be created automatically.

After installation, the database can be selected with:

```sql
USE NovaStoreDB;
```

---

## 🎯 Learning Objectives

This project was developed to practice:

- Relational database design
- Primary and Foreign Keys
- Database normalization concepts
- SQL data insertion
- Data querying
- Table relationships
- JOIN operations
- Aggregate functions
- Grouping and filtering
- Date calculations
- SQL VIEW creation
- Database backup and export

---

## 👤 Author

**Melikşah Camgöz**

Computer Technology and Information Systems

---

⭐ This project was developed as a database learning project and demonstrates practical SQL and relational database concepts.