# Load required libraries
library(DBI)         # Provides dbConnect
library(RMySQL)      # MySQL driver
library(rstudioapi)  # For password prompt
library(dplyr)

# Establish the connection
con1 <- dbConnect(
  RMySQL::MySQL(),
  host = "dbcourse-unh.cykbzjtad3ic.us-east-1.rds.amazonaws.com",
  user = "student308",  # or "instructor" if appropriate
  password = rstudioapi::askForPassword("Database password:"),
  dbname = "DBstudent308"
)

dbListTables(con1)
con <- dbConnect(
  RMySQL::MySQL(),
  host = "dbcourse-unh.cykbzjtad3ic.us-east-1.rds.amazonaws.com",
  user = "student308",
  password = rstudioapi::askForPassword("Database password:"),
  dbname = "DBstudent308"
)

# Read data from all required tables
customers <- dbReadTable(con, "project_Customer")
orders <- dbReadTable(con, "project_Orders")
authors <- dbReadTable(con, "project_Author")
payments <- dbReadTable(con, "project_Payment")
books <- dbReadTable(con, "project_Book")

#Query 1: Customers and their Orders
# -------------------------------
customer_orders <- customers %>%
  inner_join(orders, by = "CustomerID") %>%
  select(Name, Email, OrderID)

print(customer_orders)

# -------------------------------
# Query 2: Authors and Books
# -------------------------------
author_books <- authors %>%
  inner_join(books, by = "AuthorID") %>%
  select(First_name, Last_name, Title)

print(author_books)

# -------------------------------
# Query 3: Total Amount Paid per Customer (Name + Email)
# -------------------------------
total_paid <- customers %>%
  inner_join(orders, by = "CustomerID") %>%
  inner_join(payments, by = "OrderID") %>%
  inner_join(books, by = "BookID") %>%
  group_by(Name, Email) %>%
  summarise(TotalSpent = sum(Price), .groups = "drop")

print(total_paid)

# -------------------------------
# Query 4: Each Book's Sales and Revenue
# -------------------------------
book_sales <- books %>%
  inner_join(payments, by = "BookID") %>%
  group_by(Title) %>%
  summarise(
    TimesPurchased = n(),
    TotalRevenue = sum(Price),
    .groups = "drop"
  )

print(book_sales)

# -------------------------------
# Query 5: Total Amount Spent per Customer (Name only)
# -------------------------------
amount_spent <- customers %>%
  inner_join(orders, by = "CustomerID") %>%
  inner_join(payments, by = "OrderID") %>%
  inner_join(books, by = "BookID") %>%
  group_by(Name) %>%
  summarise(TotalAmountSpent = sum(Price), .groups = "drop")

print(amount_spent)

# --- Close DB Connection ---
dbDisconnect(con)