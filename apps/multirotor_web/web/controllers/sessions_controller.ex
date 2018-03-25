defmodule MultirotorWeb.SessionsController do
  use MultirotorWeb.Web, :controller

  alias Ueberauth.Strategy.Helpers
  plug Ueberauth

  def new(conn, _params) do
    render conn, "new.html", callback_url: Helpers.callback_url(conn)
  end

  def identity_callback(%{assigns: %{ueberauth_auth: auth}} = conn, _) do
    conn
    |> authenticated(MultirotorUsers.Users.authenticate auth)
  end

  def delete(conn, _params) do
    conn = delete_session(conn,:current_user)
    render conn, "new.html", callback_url: Helpers.callback_url(conn)
  end



  defp authenticated(conn, {:ok, user}) do
    conn
    |> put_flash(:info, "Successfully authenticated.")
    |> put_session(:current_user, user)
    |> redirect(to: "/")
  end

  defp authenticated(conn, {:error, error}) do
    conn
    |> put_flash(:error, error)
    |> redirect(to: "/sessions/new")
  end


end
