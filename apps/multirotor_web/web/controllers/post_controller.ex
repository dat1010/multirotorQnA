defmodule MultirotorWeb.PostController do
  use MultirotorWeb.Web, :controller

  plug MultirotorWeb.AuthorizedPlug when action in [:create]

  def show(conn, %{"id" => id}) do
    post = Multirotor.PostQueries.get_by_id(id)
    render conn, "details.html", posts: post
  end

  def list(conn, _params) do
    post_list = Multirotor.PostQueries.get_all
    render conn, "list.html", posts: post_list
  end


  def create(conn, %{errors: errors}) do
    render conn, "create.html", changeset: errors
  end

  def create(conn, _params) do
    changeset = Multirotor.Posts.changeset(%Multirotor.Posts{}, %{})
    render conn, "create.html", changeset: changeset
  end

  def add(conn, %{"posts" => posts}) do
    #posts = Map.put(posts, :date, "2017-08-31 09:00:00") 

    #Need to find a better way to do this. Maybe a function
    posts = Map.put(posts, "date", Ecto.DateTime.utc) 
    posts = Map.put(posts, "type", 1)
    current_user = get_session(conn, :current_user)
    posts = Map.put(posts, "userid", current_user.id)
    
    changeset = Multirotor.Posts.changeset(%Multirotor.Posts{}, posts)

    case Multirotor.PostQueries.create changeset do
      {:ok, %{id: id}} -> redirect conn, to: post_path(conn, :show, id)
      {:error, reasons} -> create conn, %{errors: reasons}
    end
  end

 

end
