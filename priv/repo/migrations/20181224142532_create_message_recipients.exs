defmodule MerryChristmas.Repo.Migrations.CreateMessageRecipients do
  use Ecto.Migration

  def change do
    create table(:message_recipients) do
      add :name, :string
      add :viewed, :boolean, default: false, null: false
      add :route, :string

      timestamps()
    end

  end
end
