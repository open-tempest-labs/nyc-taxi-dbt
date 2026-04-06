{% macro stage_zea_sources() %}
  {% do run_query("CREATE SCHEMA IF NOT EXISTS zea_http") %}
  {% do run_query("CREATE OR REPLACE VIEW zea_http.yellow_tripdata_2024_01 AS SELECT * FROM read_parquet('https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-01.parquet')") %}
  {% do run_query("CREATE OR REPLACE VIEW zea_http.yellow_tripdata_2024_01 AS SELECT * FROM read_parquet('https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-01.parquet')") %}
  {% do run_query("CREATE OR REPLACE VIEW zea_http.yellow_tripdata_2024_01 AS SELECT * FROM read_parquet('https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-01.parquet')") %}
{% endmacro %}
