defmodule ChatWeb.ChatChannel do
  use ChatWeb, :channel

  def join("chat:" <> room, payload, socket) do
    if authorized?(payload) do
      send(self(), {:after_join, room})
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def handle_info({:after_join, room}, socket) do
    Chat.Supervisor.start_room(room)
    {:noreply, socket} # :noreply
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    Chat.Message.changeset(%Chat.Message{}, payload) |> Chat.Repo.insert
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (chat_room:lobby).
  def handle_in("shout", payload, socket) do
    # Cast the paylod to struct with atoms
    payload_casted = for {key, val} <- payload, into: %{}, do: {String.to_atom(key), val}

    # Add message to lobby
    msg = Chat.Server.add_message(payload, payload_casted.lobby_id)

    # Get last message (with id) and broadcast to everyone
    broadcast(socket, "shout", Map.put_new(payload, :id, msg.id))

    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
