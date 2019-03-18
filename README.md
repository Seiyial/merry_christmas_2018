# MerryChristmas

Merry Christmas Tool.
Create your Merry Christmas recipients and they'll get to see a pretty snowing page that says merry christmas on any device.

This page is accessible via a link. Each link will be different for every recipient, and resultantly the page shows something customised (their name). `Link` and `name` and be manually and differently set.

For now recipients can only be created on manually on the console.

### Setup

1. Provide the credentials of database access at `config/prod.secret.exs`. Postgres 10 supported.

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
