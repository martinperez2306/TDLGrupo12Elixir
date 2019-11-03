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
  end

  scope "/lobbies", ChatWeb do
    pipe_through :browser

    get "/", PageController, :lobbies
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChatWeb do
  #   pipe_through :api
  # end
end
