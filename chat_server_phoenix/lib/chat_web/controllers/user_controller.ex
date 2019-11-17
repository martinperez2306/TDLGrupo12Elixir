defmodule ChatWeb.UserController do
  use ChatWeb, :controller

  def lobbies(conn, _params) do
    user_lobbies = Chat.UserLobby.get_user_lobbies()
    json conn, user_lobbies
  end

  def create_lobby(conn, %{"lobby_id" => lobby_id, "user_id" => user_id} = params) do
      changeset = Chat.UserLobby.changeset(%Chat.UserLobby{},params)
      case Chat.Repo.insert(changeset) do
        {:ok, _user_lobby} ->
          json conn |> put_status(:created),%{ok: "Successful Operation"}
          {:error, _changeset} ->
            json conn |> put_status(:bad_request), %{errors: ["Unable to create user lobby"] }
      end
  end

  def delete_lobby(conn, %{"id" => id}) do
    user_lobby = Chat.UserLobby.get_user_lobby(id)
    with {:ok, %Chat.UserLobby{}} <- Chat.UserLobby.delete_user_lobby(user_lobby) do
    send_resp(conn, :no_content, "")
    end
  end

end
