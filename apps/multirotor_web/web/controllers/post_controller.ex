defmodule MultirotorWeb.PostController do
  use MultirotorWeb.Web, :controller

  def show(conn, %{"id" => id}) do
    post = Multirotor.PostQueries.get_by_id(id)
    |> IO.inspect()
    render conn, "details.html", posts: post
  end

  def list(conn, _params) do
    post_list = Multirotor.PostQueries.get_all
    render conn, "list.html", posts: post_list
  end


end
