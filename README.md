# DBT Playground

This project is intended as a DBT playground.

## Setup

First, create a test database by running the following command:

```bash
docker run --rm -e POSTGRES_PASSWORD=mysecretpassword -e POSTGRES_DB=dbtest -p 5432:5432 postgres
```

To stop the test database press `CTRL+C`.

Next step is to configure DBT connection. To do that paste the following text into `~/.dbt/profiles.yml`.
```
agent_dbt:
  outputs:

    dev:
      type: postgres
      threads: 4
      host: localhost
      port: 5432
      user: postgres
      pass: mysecretpassword
      dbname: dbtest
      schema: public

  target: dev
```

Save the file and execute `dbt run`.

