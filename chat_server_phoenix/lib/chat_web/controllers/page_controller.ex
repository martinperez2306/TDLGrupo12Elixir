defmodule ChatWeb.PageController do
  use ChatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
  
  def lobbies(conn, _params) do
    render(conn, "lobbies.html")
  end
end
