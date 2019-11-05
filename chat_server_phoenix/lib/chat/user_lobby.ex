defmodule Chat.UserLobby do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Jason.Encoder, only: [:user_id, :lobby_id]}

  schema "user_lobby" do
    field :user_id, :id
    field :lobby_id, :id

    timestamps()
  end

  @doc false
  def changeset(user_lobby, attrs) do
    user_lobby
    |> cast(attrs, [])
    |> validate_required([])
  end
end
