defmodule Chat.Lobby do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "lobbies" do
    field :enable, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(lobby, attrs) do
    lobbie
    |> cast(attrs, [:name, :enable])
    |> validate_required([:name, :enable])
  end

  def get_lobbies() do
    Chat.Repo.all(Chat.Lobby)
  end
end
