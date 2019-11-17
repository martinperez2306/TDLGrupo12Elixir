defmodule ChatWeb.Router do
  use ChatWeb, :router

  pipeline :browser do
    plug :accepts, ["html http "]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChatWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/home", HomeController, :index
    post "/login", LoginController, :login
    put "/login", LoginController, :create
    get "/lobbies", PageController, :lobbies
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChatWeb do
  #   pipe_through :api
  # end
  scope "/api", ChatWeb do
    pipe_through :api

    get "/lobbies", LobbyController, :index
    post "/lobbies", LobbyController, :create
    delete "/lobbies/:id", LobbyController, :delete
    #Move create user logic to this controller
    #get "/users", UserController, :index
    #get "/users/:id", UserController, :show
    #post "/user/:id", UserController, :create
    get "/users/:id/lobbies", UserController, :lobbies
    post "/users/:user_id/lobbies", UserController, :create_lobby
    delete "/users/:user_id/lobbies/:lobby_id", UserController, :delete_lobby
  end

end
