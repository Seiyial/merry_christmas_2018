# MerryChristmas

Merry Christmas Tool.
Create your Merry Christmas recipients and they'll get to see a pretty snowing page that says merry christmas on any device.

This page is accessible via a link. Each link will be different for every recipient, and resultantly the page shows something customised (their name). `Link` and `name` and be manually and differently set.

For now recipients can only be created on manually on the console.

### Setup

0. Ensure Elixir and Node is installed in your system.
1. Procure some credentials of database access. Postgres 10 supported.
2. Get the source code

```bash
$ git clone git@github.com:Seiyial/merry_christmas_2018.git MerryChristmas
$ cd MerryChristmas
```

3. Setup

```bash
$ export MIX_ENV=prod
$ mix deps.get
$ mix phx.gen.secret
# COPY the output
$ touch config/prod.secret.exs
$ cat config/prod.secret.exs.example > config/prod.secret.exs

$ vim config/prod.secret.exs
# PASTE the output of `mix phx.gen.secret` in the `secret_key_base` field
# PROVIDE your database access credentials in the config ... Repo fields
# `pool` can be kept as is

$ cd assets && npm install && npm run deploy && cd ..
$ MIX_ENV=prod PORT=8001 mix phx.digest
$ PORT=8001 mix phx.server

# if it is working, CTRL+C twice and
$ elixir --detached -S mix phx.server
```

4. Using `NGINX` or `iptables` or whichever is suitable, route your URL to `localhost:8001`. If you would like to use another port, edit the `8001` in `config/prod.exs` to your desired port number, stop the server (`lsof -wni :8001` to show process PID, `kill -9 xxxxx` with xxxxx as the PID to stop it), rebuild and run the project (`rm -rf _build` to clear build files then `$ export MIX_ENV=prod` and run the last 2 $ lines of the setup again)
5. Create people

```bash
$ export MIX_ENV=prod
$ iex -S mix
iex> Messenger.create_recipient("Lim Say Hao", "sayhao")
# The `/sayhao` route will now display a ONE-TIME Merry Christmas message addressing `Lim Say Hao`.
# NOTE: FB AND TELEGRAM LINK PREVIEWS WILL DO AN ACCESS OF THE ROUTE, EXPIRING THE ONE-TIME ACCESS. After generating the link preview, see the instructions below to set it to unviewed.
# needless to say, replace "Lim Say Hao" with the text name of your recipient that you'd like the page to display,
# and replace "sayhao" with the route you'd like for this recipient (without the /).

# if you opened it out of curiosity, need to test or etc, you can enable it back again
iex> Messenger.set_unviewed("sayhao")

# if you want to disable it outright
iex> Messenger.set_viewed("sayhao")

# if you want to check if someone or some bot (e.g. link previewer) accessed it already
iex> Messenger.valid_and_unviewed?("sayhao")
```

