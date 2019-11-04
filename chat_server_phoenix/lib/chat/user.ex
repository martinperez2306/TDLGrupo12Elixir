defmodule Chat.User do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Jason.Encoder, only: [:email, :pass]}

  @primary_key {:id, :id, autogenerate: true}
  @foreign_key_type :id
  schema "users" do
    field :email, :string
    field :pass, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :pass])
    |> validate_required([:email, :pass])
  end
end
