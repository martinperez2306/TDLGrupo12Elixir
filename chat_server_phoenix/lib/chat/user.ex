defmodule Chat.User do
  use Ecto.Schema
  use ExActor.GenServer
  use GenServer

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

  def start(%{:pass => pass, :user => user}) do
    Agent.start_link(fn -> %{pass: pass, user:  user} end)
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

  # API
  def start_link do
    # We now start the GenServer with a `name` option.
    GenServer.start_link(__MODULE__, [], name: :chat_room)
  end
  # And our function doesn't need to receive the pid anymore,
  # as we can reference the process with its unique name.
  def add_message(message) do
    GenServer.cast(:chat_room, {:add_message, message})
  end
  def get_messages do
    GenServer.call(:chat_room, :get_messages)
  end

  # SERVER
  def init(messages) do
    {:ok, messages}
  end
  def handle_cast({:add_message, new_message}, messages) do
    {:noreply, [new_message | messages]}
  end
  def handle_call(:get_messages, _from, messages) do
    {:reply, messages, messages}
  end

end
