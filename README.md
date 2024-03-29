# The Standard Model - Experimental

A testing ground for potential new features and implementations for The Standard Model.

**[`dbt docs`](https://thedatamaverick.github.io/TheStandardModel-Experimental/)**

[![YAMLLint](https://github.com/TheDataMaverick/TheStandardModel-Experimental/actions/workflows/yamllint.yml/badge.svg)](https://github.com/TheDataMaverick/TheStandardModel-Experimental/actions/workflows/yamllint.yml)
[![SQLFluff](https://github.com/TheDataMaverick/TheStandardModel-Experimental/actions/workflows/sqlfluff.yml/badge.svg)](https://github.com/TheDataMaverick/TheStandardModel-Experimental/actions/workflows/sqlfluff.yml)
[![Deploy dbt models to Snowflake](https://github.com/TheDataMaverick/TheStandardModel-Experimental/actions/workflows/dbt_deploy.yml/badge.svg)](https://github.com/TheDataMaverick/TheStandardModel-Experimental/actions/workflows/dbt_deploy.yml)
[![CI test new and modified models](https://github.com/TheDataMaverick/TheStandardModel-Experimental/actions/workflows/dbt_ci.yml/badge.svg)](https://github.com/TheDataMaverick/TheStandardModel-Experimental/actions/workflows/dbt_ci.yml)
[![CD clean up and deploy to production](https://github.com/TheDataMaverick/TheStandardModel-Experimental/actions/workflows/dbt_cd.yml/badge.svg)](https://github.com/TheDataMaverick/TheStandardModel-Experimental/actions/workflows/dbt_cd.yml)

## Setup Instructions

### Snowflake

```sql
use role useradmin;

create role if not exists dbt comment = 'For dbt development and production';

grant role dbt to role useradmin;

grant role dbt to user <user>; -- do this for all developers

create user if not exists github_action comment = 'For running dbt via GitHub Action';
grant role dbt to user github_action;


use role sysadmin;

create or replace warehouse dbt 
    comment = 'For dbt development and production' 
    warehouse_size = 'x-small' 
    auto_resume = true 
    auto_suspend = 60;

grant usage on warehouse dbt to role dbt;

create database if not exists maverick;

grant usage on database maverick to role dbt;
grant create schema on database maverick to role dbt;
```

### Development

Create file `.dbt/profiles.yml` with the following content:

```yaml
maverick:
  target: development
  outputs:
    development:
      type: snowflake
      account: <account> examples: xyz.europe-west4.gcp, xyz.eu-central-1
      user: <user>
      role: dbt
      password: <user_password>
      database: maverick
      warehouse: dbt
      schema: dev_<user>
      threads: 16
      client_session_keep_alive: false
    production:
      type: snowflake
      account: <account> examples: xyz.europe-west4.gcp, xyz.eu-central-1
      user: <user>
      role: dbt
      password: <user_password>
      database: maverick
      warehouse: dbt
      schema: datawarehouse
      threads: 16
      client_session_keep_alive: false
```

Create file `.devcontainer/.env.gituser.zsh` with the following content:

```bash
git config --global user.email "<email>"
git config --global user.name "<name>"
```

### GitHub Action

**Set the following secrets in the GitHub repository:**

```text
DBT_SNOWFLAKE_ACCOUNT: <account> examples: xyz.europe-west4.gcp, xyz.eu-central-1
DBT_SNOWFLAKE_PASSWORD: <github_action_password>
```

**Set the following variables in the GitHub repository:**

```text
DBT_PROFILE_NAME: maverick
DBT_PROJECT_FOLDER: maverick
DBT_SNOWFLAKE_DATABASE: maverick
DBT_SNOWFLAKE_PRODUCTION_SCHEMA: datawarehouse
DBT_SNOWFLAKE_ROLE: dbt
DBT_SNOWFLAKE_THREADS: 16
DBT_SNOWFLAKE_USER: github_action
DBT_SNOWFLAKE_WAREHOUSE: dbt
```

**Location of GitHub Action secrets and variables:**

![Location of GitHub Action secrets and variables:](https://github.com/TheDataMaverick/TheStandardModel-Experimental/assets/7769335/6ee05fcf-cb3e-4290-a944-bb0749042abb)

### GitHub Pages

**Enable GitHub Pages:**

![Enable GitHub Pages](https://github.com/TheDataMaverick/TheStandardModel-Experimental/assets/7769335/5fb72e7c-ccbd-451c-a586-928061ee3d88)

**Remove rule:**

![Remove rule](https://github.com/TheDataMaverick/TheStandardModel-Experimental/assets/7769335/ae166a3e-ff75-4c92-ba87-1a0688d33f75.png)
