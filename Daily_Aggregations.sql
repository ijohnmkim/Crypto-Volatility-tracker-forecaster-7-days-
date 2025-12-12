DROP TABLE IF EXISTS daily_agg;

SELECT * FROM `crypto_volatility_dec2025_final_2025-12-09`;

CREATE TABLE daily_agg AS
	SELECT
		symbol,
        DATE(timestamp) AS day_date,
        MIN(low) AS daily_low,
        MAX(high) AS daily_high,
		MIN(open) AS first_open,
        MAX(close) AS last_close,
        SUM(volume) AS volume
FROM `crypto_volatility_dec2025_final_2025-12-09`
GROUP BY symbol, DATE(timestamp)
ORDER BY symbol, day_date;

SELECT * FROM daily_agg;