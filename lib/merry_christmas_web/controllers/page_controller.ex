defmodule MerryChristmasWeb.PageController do
  use MerryChristmasWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
