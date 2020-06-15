# Communicare

Latin  
commūnicāre  
*to share, partake, participate in*

Elixir chat/voice/video application

# Dependencies
- Elixir 1.10.3
- Erlang/OTP 23
- Phoenix 1.5.3
- Postgresql 12.3

# Setup notes

https://learnxinyminutes.com/docs/elixir/
https://thoughtbot.com/blog/building-a-phoenix-json-api
http://www.russbrooks.com/2010/11/25/install-postgresql-9-on-os-x


### Postgres

`The database for Api.Repo couldn't be created: FATAL (invalid_authorization_specification): role "postgres" does not exist`
Run `/usr/local/opt/postgres/bin/createuser -s postgres`