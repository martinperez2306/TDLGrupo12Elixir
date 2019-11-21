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
    |> cast(attrs, [:name, :message])
    |> validate_required([:name, :message])
  end

  def get_messages(lobby_id) do
    query = from m in "messages",
      where: m.lobby_id == type(^lobby_id, :integer),
      select: {m.id, m.message, m.name, m.lobby_id}
    Chat.Repo.all(query)
  end
end
