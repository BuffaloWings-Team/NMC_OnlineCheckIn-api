# OnlineCheckIn API

API to store and retrieve confidential development files (configuration, credentials)

## Routes

All routes return Json

- GET  `/`: Root route shows if Web API is running
- GET  `api/v1/accounts/[username]`: Get account details
- POST  `api/v1/accounts`: Create a new account
- GET  `api/v1/households/[house_id]/members/[member_id]`: Get a member
- GET  `api/v1/households/[house_id]/members`: Get list of members for household
- POST `api/v1/households/[house_id]/members`: Upload member for a household
- GET  `api/v1/households/[house_id]`: Get information about a household
- GET  `api/v1/households`: Get list of all household
- POST `api/v1/households`: Create new household

## Install

Install this API by cloning the *relevant branch* and use bundler to install specified gems from `Gemfile.lock`:

```shell
bundle install
```

Setup development database once:

```shell
rake db:migrate
```

## Test

Setup test database once:

```shell
RACK_ENV=test rake db:migrate
```

Run the test specification script in `Rakefile`:

```shell
rake spec
```

## Develop/Debug

Add fake data to the development database to work on this project:

```shell
rake db:seed
```

## Execute

Launch the API using:

```shell
rake run:dev
```

## Release check

Before submitting pull requests, please check if specs, style, and dependency audits pass (will need to be online to update dependency database):

```shell
rake release?
```

## Test

Setup test database once:

```shell
RACK_ENV=test rake db:migrate
```

Run the test specification script in `Rakefile`:

```shell
rake spec
```

## Develop/Debug

Add fake data to the development database to work on this project:

```shell
rake db:seed
```

## Execute

Launch the API using:

```shell
rackup
```

## Release check

Before submitting pull requests, please check if specs, style, and dependency audits pass (will need to be online to update dependency database):

```shell
rake release?
```