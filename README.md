# Barnes & Noble SQL + R Database Project

## Project Title:  
**Barnes & Noble Backend Database System**

## Description:  
This project simulates a backend relational database system for Barnes & Noble, a major bookstore chain. It manages customer interactions, book inventory, orders, and payment data. Designed using SQL and analyzed through R, this project showcases data design, querying, and insights for operational and sales analysis.

## Key Features:
- SQL database design and execution using DBeaver
- ER Diagram and Relational Schema created using ERDPlus
- SQL queries include advanced joins, aggregation, and grouping
- R integration for querying and potential visualization
- SQL `VIEW` to summarize bestselling books

## Files:
- `Barnes&nobels.sql.pdf` — Final project report with SQL queries, explanation, and logic  
- `Barnes&nobels.sql` — Executable SQL file for creating and querying the database  
- `Barnes&nobels.R` — R script for connecting to the database and running queries  
- `ERD plus.png` — ER Diagram created with ERDPlus  
- `Relational_schema.png` — Relational Schema diagram created with ERDPlus

## Requirements:
- **SQL Server / SQLite** (executed via DBeaver)
- **R 4.x**  
  - R packages: `DBI`, `odbc` (or `RSQLite` if local), `dplyr`, `ggplot2` (if used)

## Results:
- Aggregated total customer spend, sales performance by book, and author-book insights
- Created a SQL `VIEW` named `project_Top3_BestSellingBooks` for quick sales analysis
- Used R to connect to SQL and perform select and grouped queries

## Conclusion:
This project demonstrates how to structure a small-scale retail backend system using SQL and visualize or analyze that data using R. It's an excellent example of bridging data engineering and analytics in a practical business setting.

## Contributors:
- **Simran Harjani**  

