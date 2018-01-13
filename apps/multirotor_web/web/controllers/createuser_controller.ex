defmodule MultirotorWeb.CreateUserController do
  use MultirotorWeb.Web, :controller

  def createuser(conn, _params) do
    render conn, "createuser.html"
  end 

end

