defmodule MerryChristmasWeb.PageController do
  use MerryChristmasWeb, :controller
  alias MerryChristmas.Messenger

  def begone(conn, _params) do
    redirect(conn, external: "https://seiyianworks.io")
  end

  def censor_gate(conn, %{"route" => [route]}) do
    route
    |> Messenger.valid_and_unviewed?
    |> case do
    		%Messenger.MessageRecipient{} = mr ->
    			Messenger.set_viewed(mr)
    			render conn, "index.html", name: Map.get(mr, :name)
    		_ ->
    			redirect conn, external: "https://seiyianworks.io"
    end
  end
end
