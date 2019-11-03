defmodule ChatWeb.LobbyController do
  use ChatWeb, :controller

  def create(conn, _params) do
    Chat.Lobby.changeset(%Chat.Lobby{}, _params) |> Chat.Repo.insert
  end
end
