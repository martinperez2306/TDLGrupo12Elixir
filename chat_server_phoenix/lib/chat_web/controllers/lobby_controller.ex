defmodule ChatWeb.LobbyController do
  use ChatWeb, :controller

  def index(conn, %{"user_id" => user_id}) do
    lobbies = []
    user_lobbies = Chat.UserLobby.get_user_lobbies(user_id)
      |> Enum.map(fn ul -> Map.from_struct(ul) end)
    user_lobbies = Enum.map(user_lobbies, fn x ->
      Map.merge(x, Map.from_struct(Chat.Lobby.get_lobby(x[:lobby_id]))) end)
    user_lobbies = Enum.filter(user_lobbies, fn ul -> ul[:enable] == true end)
    #Enum of lobbies must be %{lobby_name, lobby_id}
    lobbies = Enum.map(user_lobbies, &{&1.name, &1.id})
    render(conn, "index.html", lobbies: lobbies)
  end

  def show(conn, %{"id" => lobby_id}) do
    render(conn, "show.html", messages: Chat.Message.get_messages(lobby_id))
  end
end
