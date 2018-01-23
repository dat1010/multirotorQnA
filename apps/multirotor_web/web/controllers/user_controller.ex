defmodule MultirotorWeb.UserController do
  use MultirotorWeb.Web, :controller

  def show(conn, _params) do
    #text conn, "create  "
    render conn, "user.html"
  end 

  def create(conn, %{errors: errors}) do
    render conn, "create.html", changeset: errors
  end

  def create(conn, _params) do
    render conn, "create.html"
  end

end

