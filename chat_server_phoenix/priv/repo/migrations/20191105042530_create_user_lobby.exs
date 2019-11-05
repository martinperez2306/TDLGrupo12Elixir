defmodule Chat.Repo.Migrations.CreateUserLobby do
  use Ecto.Migration

  def change do
    create table(:user_lobby) do
      add :user_id, references(:users, on_delete: :nothing)
      add :lobby_id, references(:lobbies, on_delete: :nothing)

      timestamps()
    end

    create index(:user_lobby, [:user_id])
    create index(:user_lobby, [:lobby_id])
  end
end
