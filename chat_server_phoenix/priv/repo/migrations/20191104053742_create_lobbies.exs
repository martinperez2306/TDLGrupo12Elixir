defmodule Chat.Repo.Migrations.CreateLobbies do
  use Ecto.Migration

  def change do
    create table(:lobbies, primary_key: false) do
      add :id, :id, primary_key: true
      add :name, :string
      add :enable, :boolean, default: true, null: false

      timestamps()
    end

  end
end
