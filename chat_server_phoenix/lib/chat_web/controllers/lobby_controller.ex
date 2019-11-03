defmodule ChatWeb.LobbyController do
  use ChatWeb, :controller

  def index(conn, _params) do
    lobbies = []
    Chat.Repo.all(Chat.Lobby)
    |> Enum.each(fn msg -> push(conn,"lobbies", %{
        id: msg.id,
        name: msg.name,
        enable: msg.enable,
      }) end)
    #json conn, lobbies
  end

  def create(conn, params) do
      changeset = Chat.Lobby.changeset(%Chat.Lobby{},params)
      case Chat.Repo.insert(changeset) do
        {:ok, lobby} ->
          json conn |> put_status(:created),%{ok: "Successful Operation"}
          {:error, _changeset} ->
            json conn |> put_status(:bad_request), %{errors: ["Unable to create lobby"] }
      end
  end

end
