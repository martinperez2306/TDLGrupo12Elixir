defmodule ChatWeb.Router do
  use ChatWeb, :router

  pipeline :browser do
    plug(:accepts, ["html http "])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", ChatWeb do
    pipe_through(:browser)

    get("/", LoginController, :index)
  end

  scope "/login", ChatWeb do
    pipe_through(:browser)

    get("/", LoginController, :index)
    post("/", LoginController, :login)
    put("/", LoginController, :create)
  end

  scope "/lobbies", ChatWeb do
    pipe_through(:browser)

    get("/", LobbyController, :index)
  end

  scope "/api", ChatWeb do
    pipe_through(:api)
    get("/lobbies", LobbyController, :index)
    post("/lobbies", LobbyController, :create)
    delete("/lobbies/:id", LobbyController, :delete)
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChatWeb do
  #   pipe_through :api
  # end
end
