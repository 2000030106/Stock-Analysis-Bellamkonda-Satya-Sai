### Stock-Analysis-Bellamkonda-Satya-Sai







Stock Market Analysis – Python and SQL  Project



Project Overview:



This project analyzes historical stock market data to:



Identify trading patterns



Perform technical analysis



Generate business insights



Apply data cleaning using business rules



Build SQL analytics queries



Visualize trends using Python



----------------------------------------------------------



Project Architecture (ETL Flow)



Raw CSV Files (Dirty Data)

&nbsp;       ↓

Python ETL (Pandas)

&nbsp;  - Deduplication

&nbsp;  - Null handling

&nbsp;  - Business rule implementation

&nbsp;  - Data validation

&nbsp;       ↓

MySQL Clean Tables

&nbsp;  - DDL

&nbsp;  - Constraints

&nbsp;       ↓

SQL Analytics

&nbsp;       ↓

Matplotlib Visualizations

&nbsp;       ↓

Business Insights





------------------------------------------------

Tools \& Technologies Used



| Category | Tools Used |

|----------|------------|

| Programming | Python |

| Libraries | Pandas, Matplotlib, Seaborn |

| Database | MySQL |

| Concepts | ETL, Window Functions, Data Validation, Time Series Analysis |

----------------------------------------------------------------

Step-by-Step Implementation Process





Step 1: Data Collection



Collected historical stock market CSV files.



Data contains:



open\_price



close\_price



high\_price



low\_price



volume



stock\_symbol



date





Step 2: Data Cleaning \& ETL using Python (Pandas)





1\. Deduplication



Removed duplicate records using:



df.drop\_duplicates(inplace=True)





2\. Missing Value Treatment (Business Rules Applied)

close\_price	- Replaced with median close\_price per stock

volume	- Replaced with 0

high\_price- Replaced with max(open\_price, close\_price)

low\_price- Replaced with min(open\_price, close\_price)





3.Price Sanity Checks



Ensured:



high\_price ≥ open\_price AND close\_price



low\_price ≤ open\_price AND close\_price



If violated:



Auto-corrected using max() and min() logic.





4\.

Daily Return Calculation

df\['daily\_return'] = (df\['close\_price'] - df\['open\_price']) / df\['open\_price']



5\. Trend Classification

daily\_return > 0	UP

daily\_return < 0	DOWN

daily\_return = 0	NO\_CHANGE



Step 3: Load Clean Data into MySQL



Created clean MySQL tables with constraints.



Used DDL with:



NOT NULL



CHECK constraints



Proper datatypes



Primary keys



CREATE TABLE stocks\_clean (

&nbsp;   stock\_symbol VARCHAR(10),

&nbsp;   trade\_date DATE,

&nbsp;   open\_price DECIMAL(10,2),

&nbsp;   close\_price DECIMAL(10,2),

&nbsp;   high\_price DECIMAL(10,2),

&nbsp;   low\_price DECIMAL(10,2),

&nbsp;   volume BIGINT,

&nbsp;   daily\_return DECIMAL(10,4),

&nbsp;   trend VARCHAR(10)

);





Step 4: SQL Technical Analysis Queries

1️⃣ Plot Daily Closing Price Trends per Stock



Extracted stock-wise date and close\_price



Used Matplotlib for line charts



2️⃣ Identify Highest Volatility Stock



Volatility calculated 



3️⃣ Volume vs Price Movement Correlation



Used correlation logic in Python to check:



Whether higher volume leads to larger price changes



4️⃣ Moving Averages (7-day \& 30-day)



Step 5: Data Visualization



Used:



Matplotlib



Seaborn



Visualizations Created:



Daily closing price trend



Moving averages comparison



Volatility comparison



Volume spike detection



---------------------------------------



Business Insights Generated

1️⃣ Best Performing Stock



Identified using highest average daily returns.



2️⃣ Abnormal Volume Spike Days



Days where





volume > 2 × average\_volume



if gets nothing in graph we have to us ethis:

volume > 2 × average\_volume

3️⃣ UP vs DOWN Trend Ratio per Company



Compared number of UP days vs DOWN days



Determined overall stock strength







Final Outcome:



Cleaned and validated stock dataset



Built MySQL analytics tables



Generated SQL-driven insights



Created visual dashboards



Derived business-level investment insights



