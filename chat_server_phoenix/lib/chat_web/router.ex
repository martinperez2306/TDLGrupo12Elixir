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

  scope "/users", ChatWeb do
    pipe_through(:browser)

    get("/", UserController, :index)
  end

  scope "/lobbies", ChatWeb do
    pipe_through(:browser)

    get("/", LobbyController, :index)
    get("/:id", LobbyController, :show)
  end

  scope "/api", ChatWeb do
    pipe_through(:api)
    get("/lobbies", LobbyApiController, :index)
    post("/lobbies", LobbyApiController, :create)
    delete("/lobbies/:id", LobbyApiController, :delete)
    #Move create user logic to this controller
    #get "/users", UserController, :index
    #get "/users/:id", UserController, :show
    #post "/user/:id", UserController, :create
    get("/users/:id/lobbies", UserApiController, :lobbies)
    post("/users/:user_id/lobbies", UserApiController, :create_lobby)
    delete("/users/:user_id/lobbies/:lobby_id", UserApiController, :delete_lobby)
  end

end
