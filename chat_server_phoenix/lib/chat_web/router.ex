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

  ### Utils Commands
  ###
  ### mix phx.routes
  ### List of route paths for controllers and static / dinamyc content or logic

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
    get("/:id", LobbyController, :show)
    post("/", LobbyController, :create)
    delete("/:id", LobbyController, :delete)
  end

  scope "/api", ChatWeb do
    pipe_through(:api)
    #User Api Example
    #get "/users", UserController, :index
    #get "/users/:id", UserController, :show
    #post "/user/:id", UserController, :create
  end

end
