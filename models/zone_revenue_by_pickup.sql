{{ config(materialized='table') }}

SELECT PULocationID, COUNT(*) AS trips, ROUND(SUM(fare_amount), 2) AS total_fare, ROUND(AVG(tip_amount), 2) AS avg_tip FROM {{ ref('long_trips') }} GROUP BY PULocationID ORDER BY total_fare DESC
