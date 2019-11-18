defmodule ChatWeb.LobbyController do
  use ChatWeb, :controller

  def index(conn, %{"user_id" => user_id}) do
    #Enum of lobbies must be %{lobby_name, lobby_id}
    lobbies = []
    user_lobbies = Chat.UserLobby.get_users_lobbies()
      |> Enum.map(fn ul -> Map.from_struct(ul) end)
    user_lobbies = Enum.map(user_lobbies, fn x ->
      Map.merge(x, Map.from_struct(Chat.Lobby.get_lobby(x[:lobby_id]))) end)
    lobbies = Enum.map(user_lobbies, &{&1.name, &1.id})
    render(conn, "index.html", lobbies: lobbies)
  end
end
