defmodule Chat.User do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Jason.Encoder, only: [:email, :pass]}

  schema "user" do
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

  def create(attrs \\ %{}) do
    attrs = Jason.decode!(attrs)
    %Chat.User{}
    |> Chat.User.changeset(attrs)
    |> Chat.Repo.insert()
  end
end

