defmodule Vlogger.AuthenticateUser do

  import Phoenix.Controller
  alias Vlogger.Router.Helpers

  def authenticate_user(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access that page")
      |> redirect(to: Helpers.session_path(conn, :new))
    end
  end
end
