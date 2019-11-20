defmodule Chat.UserLobby do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]
  @derive {Jason.Encoder, only: [:user_id, :lobby_id]}

  @primary_key false
  schema "user_lobby" do
    field :user_id, :id, primary_key: true
    field :lobby_id, :id, primary_key: true

    timestamps()
  end

  @doc false
  def changeset(user_lobby, attrs) do
    user_lobby
    |> cast(attrs, [])
    |> validate_required([])
  end

  def get_users_lobbies() do
    Chat.Repo.all(Chat.UserLobby)
  end

  def get_user_lobby(user_id, lobby_id) do
    Chat.Repo.get_by!(Chat.UserLobby, [user_id: user_id, lobby_id: lobby_id])
  end

  def get_user_lobbies(user_id) do
    query = from ul in "user_lobby",
          where: ul.user_id == type(^user_id, :integer),
          select: ul
    Chat.Repo.all(Chat.UserLobby)
  end

  def delete_lobby(%Chat.UserLobby{} = user_lobby) do
   Caht.Repo.delete(user_lobby)
  end

end
