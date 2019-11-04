defmodule Chat.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :id, primary_key: true
      add :email, :string
      add :pass, :string

      timestamps()
    end

  end
end
