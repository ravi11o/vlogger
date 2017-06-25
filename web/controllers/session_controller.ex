defmodule Vlogger.SessionController do
  use Vlogger.Web, :controller

  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]
  alias Vlogger.User

  def new(conn, _) do
    conn
    |> render("new.html")
  end

  def create(conn, %{"session" => %{"username" => username, "password" => password}}) do
    case login_by_username_and_password(conn, username, password) do
      {:ok, conn} -> 
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: page_path(conn, :index))

      {:error, _reason, conn} -> 
        conn
        |> put_flash(:error, "Invalid Email/Password Combination")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> Guardian.Plug.sign_out
    |> redirect(to: page_path(conn, :index))
  end

  defp login_by_username_and_password(conn, username, password) do
    user = Repo.get_by(User, username: username)

    cond do
      user && checkpw(password, user.password_hash) -> 
        {:ok, login(conn, user)}
      user -> 
        {:error, :unauthorized, conn}
      true ->
        dummy_checkpw()
        {:error, :not_found, conn}
    end
  end

  defp login(conn, user) do
    Guardian.Plug.sign_in(conn, user, :token)
  end
end