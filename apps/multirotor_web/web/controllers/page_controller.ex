defmodule MultirotorWeb.PageController do
  use MultirotorWeb.Web, :controller

  def index(conn, _params) do
    post_list = Multirotor.PostQueries.get_top(100)
    render conn, "index.html", posts: post_list
  end

end
