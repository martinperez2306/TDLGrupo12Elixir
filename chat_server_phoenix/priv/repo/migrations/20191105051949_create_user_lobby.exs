defmodule Chat.Repo.Migrations.CreateUserLobby do
  use Ecto.Migration

  def change do
    create table(:user_lobby, primary_key: false) do
      add :user_id, references(:users, on_delete: :nothing), primary_key: true
      add :lobby_id, references(:lobbies, on_delete: :nothing), primary_key: true

      timestamps()
    end

    create index(:user_lobby, [:user_id])
    create index(:user_lobby, [:lobby_id])
  end
end
