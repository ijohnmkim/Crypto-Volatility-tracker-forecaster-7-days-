-- this file is to calculate the daily returns and volatility of cryptos in the database
DROP TABLE IF EXISTS daily_vol;

CREATE TABLE daily_vol AS
WITH daily_log AS (
	SELECT
		symbol,
		day_date,
		last_close,
        volume,
		LOG(last_close / LAG(last_close) OVER (PARTITION BY symbol ORDER BY day_date)) AS log_return
	FROM daily_agg
)
SELECT
	symbol,
    day_date,
    last_close,
    volume,
    STDDEV_SAMP(log_return) OVER (PARTITION BY symbol ORDER BY day_date) AS volatility,
    STDDEV_SAMP(log_return) OVER (PARTITION BY symbol ORDER BY day_date ROWS 6 PRECEDING) AS volatility_7 -- not necessary???
FROM daily_log
ORDER BY symbol, day_date;

SELECT * FROM daily_vol;

-- sort by volatility today
SELECT *
FROM daily_vol
ORDER BY volatility ASC;