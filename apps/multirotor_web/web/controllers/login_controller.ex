defmodule Multirotor.LoginController do
  user MultirotorWeb.Web, :controller
  
  def index(conn, _) do
    render conn, "login.html"
  end

  def login(conn, %{"login" => %{"username" => name}}) do
    expriation = 60*60*24*7
    conn
    |> Plug.Conn.put_resp_cookie("user_name", name, max_age: expiration)
    |> redirect(to: "/)"
  end
end
