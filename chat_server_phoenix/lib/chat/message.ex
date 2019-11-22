defmodule Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]
  @derive {Jason.Encoder, only: [:id, :message, :name, :lobby_id]}

  schema "messages" do
    field :message, :string
    field :name, :string
    field :lobby_id, :id

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:name, :message, :lobby_id])
    |> validate_required([:name, :message, :lobby_id])
  end

  def get_messages(lobby_id) do
    query = from m in Chat.Message,
      where: m.lobby_id == type(^lobby_id, :id),
      select: m
    Chat.Repo.all(query)
  end
end
