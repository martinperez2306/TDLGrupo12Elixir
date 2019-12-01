defmodule Chat.Server do
  use GenServer

  # API
  def start_link do
    # We now start the GenServer with a `name` option.
    GenServer.start_link(__MODULE__, [], name: :chat_room)
  end

  def start_link(name) do
    # Instead of passing an atom to the `name` option, we send
    # a tuple. Here we extract this tuple to a private method
    # called `via_tuple` that can be reused in every function
    GenServer.start_link(__MODULE__, [], name: via_tuple(name))
  end

  def add_message(payload, lobby_id) do
    # And the `GenServer` callbacks will accept this tuple the
    # same way it accepts a pid or an atom.
    GenServer.cast(via_tuple(lobby_id), {:add_message, payload})
  end

  def get_messages(room_id) do
    GenServer.call(via_tuple(room_id), :get_messages)
  end

  defp via_tuple(room_id) do
    # And the tuple always follow the same format:
    # {:via, module_name, term}
    {:via, Chat.Registry, {:chat_room, room_id}}
  end

  # SERVER
  def init(messages) do
    {:ok, messages}
  end

  def handle_cast({:add_message, new_message}, messages) do
    # Insert in database
    # {:ok, msg} = Chat.Message.changeset(%Chat.Message{}, new_message) |> Chat.Repo.insert()

    # Cast te new_message received
    message = for {key, val} <- new_message, into: %{}, do: {String.to_atom(key), val}

    case messages do
      [] -> {:noreply, [Map.put_new(message, :id, 0)]}
      [head] -> {:noreply, [Map.put_new(message, :id, head.id + 1) | messages]}
      [head | tail] -> {:noreply, [Map.put_new(message, :id, head.id + 1) | messages]}
    end
  end

  def handle_call(:get_messages, _from, messages) do
    # Chat.Message.get_messages(Integer.to_string(messages.lobby_id))
    {:reply, messages, messages}
  end
end
