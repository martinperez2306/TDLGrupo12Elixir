defmodule ChatWeb.LobbyController do
  use ChatWeb, :controller

  def index(conn, _params) do
    lobbies = Chat.Repo.all(Chat.Lobby) |> Enum.map(&Map.take(&1,[:id, :name, :enable]))
    json conn, lobbies
  end

  def create(conn, params) do
      changeset = Chat.Lobby.changeset(%Chat.Lobby{},params)
      case Chat.Repo.insert(changeset) do
        {:ok, _lobby} ->
          json conn |> put_status(:created),%{ok: "Successful Operation"}
          {:error, _changeset} ->
            json conn |> put_status(:bad_request), %{errors: ["Unable to create lobby"] }
      end
  end

end
