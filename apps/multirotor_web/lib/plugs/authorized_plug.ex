defmodule MultirotorWeb.AuthorizedPlug do
  import Plug.Conn
  import Phoenix.Controller

  def init(opts) do
    opts
  end

  def call(conn, _) do 
    current_user = get_session(conn, :current_user)
    authorize_user(conn, current_user)
  end


  defp authorize_user(conn, nil) do
    conn
    |> redirect(to: "/sessions/new")
    |> halt
  end

  defp authorize_user(conn,_) do
    conn
  end
  
  #defp authorize_user(conn, user_name, name) when user_name === name do
  #  conn
  #end

  #defp authorize_user(conn, _, _), do: authorize_user(conn, nil, nil)
end
