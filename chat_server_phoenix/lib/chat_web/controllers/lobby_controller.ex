defmodule ChatWeb.LobbyController do
  use ChatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def get(conn, _params) do
    lobbies = Chat.Lobby.get_lobbies() |> Enum.map(&Map.take(&1, [:id, :name, :enable]))
    json(conn, lobbies)
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
