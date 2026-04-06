{{ config(materialized='table') }}

SELECT payment_type, ROUND(AVG(tip_amount), 2) AS avg_tip, COUNT(*) AS trips FROM {{ source('zea_http', 'yellow_tripdata_2024_01') }} GROUP BY payment_type ORDER BY avg_tip DESC
