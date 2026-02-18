use stockanalysisp1;

desc stock_prices;

#Technical Analysis: Write Queries using MYSQL Tables Data 

#1.Plot daily closing price trends per stock

SELECT symbol, date, close_price FROM stock_prices ORDER BY symbol, date;

#2.Identify highest volatility stock

SELECT symbol, STDDEV(daily_return) AS volatility FROM stock_prices GROUP BY symbol ORDER BY volatility DESC LIMIT 1;

#3.Volume vs price movement correlation

SELECT symbol, volume, daily_return FROM stock_prices;

#4.Moving averages (7-day, 30-day)

SELECT symbol,date,close_price,AVG(close_price) OVER ( PARTITION BY symbol ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW ) AS MA_7, AVG(close_price) OVER ( PARTITION BY symbol ORDER BY date ROWS BETWEEN 29 PRECEDING AND CURRENT ROW ) AS MA_30 FROM stock_prices ORDER BY symbol, date;

#Business Insights


#1.Best Performing Stock by Average Returns

SELECT symbol, AVG(daily_return) AS avg_return
FROM stock_prices
GROUP BY symbol
ORDER BY avg_return DESC;


#2.Days With Abnormal Volume Spikes

# Define spike = Volume > (Mean + 2 * Std Dev)

SELECT symbol, date, volume
FROM stock_prices
WHERE volume >
(
    SELECT AVG(volume) + 2 * STDDEV(volume)
    FROM stock_prices
);

SELECT symbol, date, volume
FROM stock_prices
WHERE volume >
(
    SELECT AVG(volume) + 1.5 * STDDEV(volume)
    FROM stock_prices
);


#3.UP vs DOWN Trend Ratio Per Company

SELECT symbol,
SUM(CASE WHEN trend = 'UP' THEN 1 ELSE 0 END) AS up_days,
SUM(CASE WHEN trend = 'DOWN' THEN 1 ELSE 0 END) AS down_days
FROM stock_prices
GROUP BY symbol;

ALTER TABLE stock_prices 
MODIFY symbol VARCHAR(10);

ALTER TABLE stock_prices
MODIFY date DATE;

CREATE INDEX idx_symbol_date ON stock_prices(symbol, date);
