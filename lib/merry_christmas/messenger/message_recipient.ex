defmodule MerryChristmas.Messenger.MessageRecipient do
  use Ecto.Schema
  import Ecto.Changeset


  schema "message_recipients" do
    field :name, :string
    field :route, :string
    field :viewed, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(message_recipient, attrs) do
    message_recipient
    |> cast(attrs, [:name, :viewed, :route])
    |> validate_required([:name, :viewed, :route])
  end
end
