defmodule MerryChristmasWeb.Router do
  use MerryChristmasWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MerryChristmasWeb do
    pipe_through :browser

    get "/*route", PageController, :censor_gate
    get "/", PageController, :begone
  end

  # Other scopes may use custom stacks.
  # scope "/api", MerryChristmasWeb do
  #   pipe_through :api
  # end
end
