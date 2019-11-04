defmodule ChatWeb.LoginController do
  use ChatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def login(conn, params) do
    data = if params != %{} do # if come from web
      {:ok, data} = Jason.encode(params)
      data
    else #else if come from postman
      {:ok, data, _conn_details} = Plug.Conn.read_body(conn) #Decoe from body
      data
    end

    case {Chat.User.get(data)} do
      {nil} -> # if the user doesn`t exist
        json conn |> put_status(:bad_request), %{errors: ["Invalid Password"] }
      {user} -> # otherwise redirect to home
        redirect(conn, to: "/home")
      end
  end

  def create(conn, params) do
    {:ok, data, _conn_details} = Plug.Conn.read_body(conn)

    case Chat.User.create(data) do
      {:ok, user} ->
        json conn |> put_status(:created), user
      {:error, _changeset} ->
        json conn |> put_status(:bad_request), %{errors: ["unable to create user"] }
    end
  end

  # def update(conn, %{"email" => email} = params) do
  #   user = Repo.get(Chat.User, email)
  #   if user do
  #     changeset = Chat.User.changeset(user, params)
  #     case Repo.update(changeset) do
  #       {:ok, user} ->
  #         json conn |> put_status(:ok), user
  #       {:error, result} ->
  #         json conn |> put_status(:bad_request),
  #           %{errors: ["bad update"] }
  #     end
  #   else
  #     json conn |> put_status(:not_found),
  #                  %{errors: ["invalid user"] }
  #   end
  # end
#
end

