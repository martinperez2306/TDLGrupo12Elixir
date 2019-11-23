defmodule ChatWeb.LobbyController do
  use ChatWeb, :controller

# Una forma de conseguir los lobbies de un usuario en el query param
# http://localhost/lobbies?user_id=1
#  def index(conn, %{"user_id" => user_id}) do
#    lobbies = []
#    user_lobbies = Chat.UserLobby.get_user_lobbies(user_id)
#      |> Enum.map(fn ul -> Map.from_struct(ul) end)
#    user_lobbies = Enum.map(user_lobbies, fn x ->
#      Map.merge(x, Map.from_struct(Chat.Lobby.get_lobby(x[:lobby_id]))) end)
#    user_lobbies = Enum.filter(user_lobbies, fn ul -> ul[:enable] == true end)
#    #Enum of lobbies must be %{lobby_name, lobby_id}
#    lobbies = Enum.map(user_lobbies, &{&1.name, &1.id})
#    render(conn, "index.html", lobbies: lobbies)
#  end

  ##Show only the enabled chat lobbies to FrontEnd
  def index(conn, _params) do
    lobbies = Chat.Lobby.get_lobbies(true)
    #Enum of lobbies must be %{lobby_name, lobby_id}
    lobbies = Enum.map(lobbies, &{&1.name, &1.id})
    render(conn, "index.html", lobbies: lobbies)
  end

  def show(conn, %{"id" => lobby_id}) do
    messages = Chat.Message.get_messages(lobby_id)
    render(conn, "show.html", messages: messages)
  end

  def create(conn, params) do
    changeset = Chat.Lobby.changeset(%Chat.Lobby{}, params)

    case Chat.Repo.insert(changeset) do
      {:ok, _lobby} ->
        json(conn |> put_status(:created), %{ok: "Successful Operation"})

      {:error, _changeset} ->
        json(conn |> put_status(:bad_request), %{errors: ["Unable to create lobby"]})
    end
  end

  def delete(conn, %{"id" => id}) do
    lobby = Chat.Lobby.get_lobby(id, true)

    with {:ok, %Chat.Lobby{}} <- Chat.Lobby.delete_lobby(lobby) do
      send_resp(conn, :no_content, "")
    end
  end
end
