defmodule MultirotorWeb.UserController do
  use MultirotorWeb.Web, :controller

  def show(conn, _params) do
    #text conn, "create"
    render conn, "user.html"
  end 

  def new(conn, %{errors: errors}) do
    render conn, "create.html", changeset: errors
  end

  def new(conn, _params) do
    changeset = MultirotorUser.User.changeset(%MultirotorUser.User{},%{})
    render conn, "create.html", changeset: changeset
  end

  def create(conn, %{"users" => user}) do
    MultirotorUser.User.changeset(%MultirotorUser.User{}, user)
    |> MultirotorUser.UserQueries.create
    render conn, "user.html"
  end

end

