# nyc-taxi-dbt

dbt project exported from [ZeaOS](https://github.com/open-tempest-labs/zeaos).

## Quickstart — local dbt + DuckDB

Requires Python 3.12 (dbt does not yet support 3.13/3.14). On macOS:

```bash
brew install pipx python@3.12
pipx install dbt-duckdb --python $(brew --prefix python@3.12)/bin/python3.12
pipx ensurepath   # restart your shell after this
```

Or with a virtual environment:

```bash
python3.12 -m venv .venv && source .venv/bin/activate
pip install dbt-duckdb
```

Then:

```bash
dbt run
dbt test
```

DuckDB reads source Parquet files directly over HTTPS — no warehouse, no data loading, no extra configuration required. Results are materialised into `local.duckdb`.

> **Portability note:** This works out of the box when source data comes from public HTTPS or S3 URLs. If sources were loaded from local files the models will only run on the machine where the session was created. See `zea_export.json` for source URI details.

## Import into dbt Cloud

1. In [dbt Cloud](https://cloud.getdbt.com), create a new project and connect this repository.
2. Configure your warehouse connection in the dbt Cloud UI.
3. For non-DuckDB warehouses, source data must be loaded into your warehouse first — the `{{ source() }}` references in `sources/zea_sources.yml` and model SQL will need to point at warehouse tables rather than HTTPS URLs.
4. For DuckDB in dbt Cloud, models run as-is against public HTTPS sources.

## Lineage

See `zea_export.json` for the full lineage of each model — every load, filter, and SQL transformation recorded by ZeaOS at export time, including source URIs, row counts, and portability status.
