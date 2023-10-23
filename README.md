# Crypto Wallet API

API for querying cryptocurrencies
---

* Ruby version
  - 3.1.2

* Dependencies
  - rails 7.0.8
  - postgresql 15

* Configuration
  - `bundle install`

* Database creation
  - `rails db:create`
* Database initialization
  - `rails db:migrate`

* How to run the api
  - **Create .env on root_path ('/') and add:**
    ```
    API_KEY=
    SECRET_KEY=
    ```
  - **Get a FREE API KEY on CoinsAPI and past env *API_KEY*:** [APIKEY](https://docs.coinapi.io/market-data/rest-api/metadata/list-all-assets)

  - **Generate Secret and past env *SECRET_ENV*:**
    `bundle exec rake secret`

  - **Create coins on db:**
    `rails rest:create_coins`

  - **Requests example present on file:** `test_requests.http` (*Using Rest Client on VSCode*)

* Services (job queues, cache servers, search engines, etc.)
  - `rails rest:create_coins`

* Docs
  - [API Docs](https://documenter.getpostman.com/view/15514870/2s7Z18B1Kc)