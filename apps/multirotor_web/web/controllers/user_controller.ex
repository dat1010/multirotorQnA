defmodule MultirotorWeb.UserController do
  use MultirotorWeb.Web, :controller

  alias MultirotorUser.Accounts

  def show(conn, _params) do
    render conn, "user.html"
  end 

  def new(conn, %{errors: errors}) do
    render conn, "create.html", changeset: errors
  end

  def new(conn, _params) do
    changeset =  Accounts.change_user
    render conn, "create.html", changeset: changeset
  end

  def create(conn, %{"users" => user}) do
    Accounts.create(user)
    render conn, "user.html"
  end

end

