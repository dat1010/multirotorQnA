defmodule MultirotorWeb.PostController do
  use MultirotorWeb.Web, :controller
  alias Multirotor.{Posts,Posts}


  plug MultirotorWeb.AuthorizedPlug when action in [:create]

  def show(conn, %{"id" => id}) do
    post = Posts.get_by_id(id)
    changeset = Posts.create_answer() 
    answerList = Posts.get_by_parent_id(id)

    render conn, "details.html", post: post, changeset: changeset, answerList: answerList
  end

  def index(conn, _params) do
    post_index = Posts.get_all
    render conn, "list.html", posts: post_index
  end

  def new(conn, %{errors: errors}) do
    render conn, "create.html", changeset: errors
  end

  def new(conn, _params) do
    changeset = Posts.create_post()
    render conn, "create.html", changeset: changeset
  end

  def create(conn, %{"post" => post}) do
    current_user = get_session(conn, :current_user)
    changeset = Posts.map_answer(post,nil, current_user.id, 1)
    case Posts.create changeset do
      {:ok, %{id: id}} -> redirect conn, to: post_path(conn, :show, id)
      {:error, reasons} -> new conn, %{errors: reasons}
    end
  end

  def answer(conn, %{"post" => post}) do
    current_user = get_session(conn, :current_user)

    parent_id = Map.get(conn.path_params,"id")
    changeset = Posts.map_answer(post, parent_id, current_user.id,2)
  
    case Posts.create changeset do
      {:ok, _param} -> redirect conn, to: post_path(conn, :show, parent_id)
      {:error, reasons} -> new conn, %{errors: reasons}
    end
  end

end
