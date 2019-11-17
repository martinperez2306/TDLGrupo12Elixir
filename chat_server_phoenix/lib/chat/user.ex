defmodule Chat.User do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Jason.Encoder, only: [:email, :pass]}

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

  def create(attrs \\ %{}) do
    attrs = Jason.decode!(attrs)
    %Chat.User{}
    |> Chat.User.changeset(attrs)
    |> Chat.Repo.insert()
  end

  def get(attrs \\ %{}) do
    # convert from string struct to atom struct
    user = for {key, val} <- Jason.decode!(attrs), into: %{}, do: {String.to_atom(key), val}
    pass = user.pass

    # Get from repo the user
    case Chat.Repo.get_by(Chat.User, email: user.email) do
      nil ->
        Chat.User.create(attrs)
        Chat.Repo.get_by(Chat.User, email: user.email).id
      %Chat.User{id: id ,pass: ^pass} -> id
      _ -> nil
    end
  end

end
