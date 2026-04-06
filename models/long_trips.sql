{{ config(materialized='table') }}

SELECT * FROM (SELECT * FROM {{ source('zea_http', 'yellow_tripdata_2024_01') }}) _z WHERE trip_distance > 2.0
