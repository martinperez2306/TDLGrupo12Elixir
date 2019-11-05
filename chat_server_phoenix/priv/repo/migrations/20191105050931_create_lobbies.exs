defmodule Chat.Repo.Migrations.CreateLobbies do
  use Ecto.Migration

  def change do
    create table(:lobbies) do
      add :name, :string
      add :enable, :boolean, default: true, null: false

      timestamps()
    end

  end
end
