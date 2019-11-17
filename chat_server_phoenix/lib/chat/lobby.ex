defmodule Chat.Lobby do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Jason.Encoder, only: [:id, :enable, :name]}

  schema "lobbies" do
    field :enable, :boolean, default: true
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(lobby, attrs) do
    lobby
    |> cast(attrs, [:name, :enable])
    |> validate_required([:name, :enable])
  end

  def get_lobbies() do
    Chat.Repo.all(Chat.Lobby)
  end

  def get_lobby(id) do
    Chat.Repo.get!(Chat.Lobby, id)
  end

  def get_lobby(id, enable) do
    Chat.Repo.get_by!(Chat.Lobby, [id: id, enable: enable])
  end

  def create_lobby(params) do
    changeset = Chat.Lobby.changeset(%Chat.Lobby{},params)
    Chat.Repo.insert(changeset)
  end

  def delete_lobby(%Chat.Lobby{} = lobby) do
    lobby = Ecto.Changeset.change lobby, enable: false
    case Chat.Repo.update lobby do
      {:ok, lobby}       -> {:ok, lobby}
      {:error, changeset} -> {:error, changeset}
    end
  end

end
