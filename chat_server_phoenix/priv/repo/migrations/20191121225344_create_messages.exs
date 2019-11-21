defmodule Chat.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :name, :string
      add :message, :string
      add :lobby_id, references(:lobbies, on_delete: :nothing)

      timestamps()
    end

    create index(:messages, [:lobby_id])
  end
end
