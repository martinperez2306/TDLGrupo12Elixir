defmodule ChatWeb.LoginController do
  use ChatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end



  def handler(conn, params) do
    {:ok, data, _conn_details} = Plug.Conn.read_body(conn) #Decoe from body

    # TODO - CRUD email
    redirect(conn, to: "/home")

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

