-- forecast the dataset
DROP TABLE IF EXISTS vol_forecast;

CREATE TABLE vol_forecast AS
SELECT
	symbol,
    day_date,
    last_close,
    volatility,
    volatility_7,
    LAG(volatility_7) OVER (PARTITION BY symbol ORDER BY day_date) AS vol7_yesterday,
    volume,
    -- forecast
    LEAD(volatility_7) OVER (PARTITION BY symbol ORDER BY day_date) AS next_day_vol
FROM daily_vol;

DELETE FROM vol_forecast
WHERE next_day_vol IS NULL;

SELECT * FROM vol_forecast;

-- sort by vol
SELECT * 
FROM vol_forecast
ORDER BY next_day_vol ASC;