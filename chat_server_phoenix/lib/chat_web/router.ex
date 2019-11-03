defmodule ChatWeb.Router do
  use ChatWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChatWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/lobbies", ChatWeb do
    pipe_through :browser

    get "/", PageController, :lobbies
  end

  scope "/api", ChatWeb do
    pipe_through :api
    get "/lobbies", LobbyController, :index
    post "/lobbies", LobbyController, :create
    delete "/lobbies/:id", LobbyController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChatWeb do
  #   pipe_through :api
  # end
end
