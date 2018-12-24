defmodule MerryChristmas.Repo do
  use Ecto.Repo,
    otp_app: :merry_christmas,
    adapter: Ecto.Adapters.Postgres
end
