# 📊 Stock Market Analysis & ETL Pipeline

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.10-blue?logo=python">
  <img src="https://img.shields.io/badge/MySQL-8.0-orange?logo=mysql">
  <img src="https://img.shields.io/badge/Matplotlib-Visualization-green">
  <img src="https://img.shields.io/badge/Project-Completed-brightgreen">
</p>

---

## 🚀 Project Overview

This project analyzes historical stock market data to uncover trading patterns, evaluate company performance, and generate business insights using a complete Data Engineering pipeline.

- Python-based ETL processing  
- Data cleaning & business rule validation  
- MySQL data modeling & analytics  
- Technical indicators (Volatility, Moving Averages)  
- Business insights generation  
- Data visualization dashboards  

---

## 🏗️ Architecture / ETL Pipeline Flow

```text
CSV Files (Raw / Dirty Data)
        ↓
Python ETL (Pandas)
   • Deduplication
   • Missing value handling
   • Business rule validation
   • Trend classification
        ↓
MySQL Clean Tables (DDL + Constraints)
        ↓
SQL Analytics Queries
        ↓
Matplotlib Dashboards
        ↓
Business Insights
```

---

## 🛠️ Tech Stack

| Technology | Purpose |
|------------|----------|
| Python | Data Processing & ETL |
| Pandas | Data Cleaning & Transformation |
| NumPy | Numerical Calculations |
| MySQL | Data Storage & SQL Analytics |
| Matplotlib | Data Visualization |
| Logging | Error Tracking |
| Exception Handling | Robust Pipeline |

---

## 📂 Project Structure

```text
Stock-Analysis/
│
├── data/                   # Raw CSV files
├── notebooks/              # Jupyter Notebook (.ipynb)
├── sql/                    # MySQL DDL & Queries
├── images/                 # Generated visualizations
├── requirements.txt
└── README.md
```

---

## 📌 Problem Statement

### 🔹 Technical Analysis
- Plot daily closing price trends per stock
- Identify highest volatility stock
- Analyze volume vs price movement correlation
- Calculate 7-day moving average
- Calculate 30-day moving average

### 🔹 Business Insights
- Best performing stock by average returns
- Days with abnormal volume spikes
- UP vs DOWN trend ratio per company

---

## ⚙️ Business Rules Implemented

### 1️⃣ Missing Value Treatment

| Column        | Rule |
|--------------|------|
| close_price  | Replace with median close_price per stock |
| volume       | Replace with 0 |
| high_price   | Replace with max(open_price, close_price) |
| low_price    | Replace with min(open_price, close_price) |

---

### 2️⃣ Price Sanity Checks

- high_price ≥ open_price AND close_price  
- low_price ≤ open_price AND close_price  
- If violated → auto-corrected automatically  

---

### 3️⃣ Trend Classification

| Condition | Trend |
|-----------|-------|
| daily_return > 0 | UP |
| daily_return < 0 | DOWN |
| daily_return = 0 | NO_CHANGE |

---

## 📊 Key Metrics Calculated

- Daily Return
- Volatility (Standard Deviation of Returns)
- Moving Averages (7-day & 30-day)
- Volume Spikes
- Trend Ratios

---

## 🖼️ Sample Visualizations

### 📈 Daily Closing Price Trend

![Daily Trend](images/daily_trend.png)

---

### 📉 Moving Averages (7-Day & 30-Day)

![Moving Average](images/moving_average.png)

---

### 📊 Volume vs Price Correlation

![Volume Correlation](images/volume_correlation.png)

---

## 🧮 Example SQL Queries

### 🔹 Highest Volatility Stock

```sql
SELECT stock_name,
       STDDEV(daily_return) AS volatility
FROM stock_data
GROUP BY stock_name
ORDER BY volatility DESC
LIMIT 1;
```

---

### 🔹 Best Performing Stock by Average Return

```sql
SELECT stock_name,
       AVG(daily_return) AS avg_return
FROM stock_data
GROUP BY stock_name
ORDER BY avg_return DESC;
```

---

### 🔹 UP vs DOWN Trend Ratio

```sql
SELECT stock_name,
       SUM(CASE WHEN trend='UP' THEN 1 ELSE 0 END) /
       SUM(CASE WHEN trend='DOWN' THEN 1 ELSE 0 END) AS up_down_ratio
FROM stock_data
GROUP BY stock_name;
```

---

## 🧪 How to Run This Project

### 1️⃣ Clone Repository

```bash
git clone https://github.com/yourusername/stock-analysis.git
cd stock-analysis
```

### 2️⃣ Install Dependencies

```bash
pip install -r requirements.txt
```

### 3️⃣ Run Jupyter Notebook

```bash
jupyter notebook
```

### 4️⃣ Setup MySQL

- Create database
- Execute DDL scripts
- Load cleaned dataset
- Run analytics queries

---

## 📦 requirements.txt

```text
pandas
numpy
matplotlib
mysql-connector-python
seaborn
```

---

## 📈 Outcome

- Cleaned & validated stock dataset
- SQL analytical reports
- Technical analysis dashboards
- Business insight summary
- End-to-end ETL pipeline implementation

---

## 🚀 Future Enhancements

- Add ARIMA / LSTM forecasting
- Build interactive dashboard using Streamlit
- Automate ETL using Apache Airflow
- Deploy on AWS / GCP
- Integrate real-time stock API

---

## 👨‍💻 Author

**Bellamkonda Satya Sai Venkateswarlu**  
Data Engineering | Financial Analytics | Python | SQL  

---

## ⭐ Support

If you found this project helpful, give it a ⭐ on GitHub!
