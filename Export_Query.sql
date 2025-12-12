-- export query
SELECT *
INTO OUTFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\volatility_forecast.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM vol_forecast;

SHOW VARIABLES LIKE 'secure_file_priv';