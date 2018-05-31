defmodule MultirotorWeb.PostController do
  use MultirotorWeb.Web, :controller

  plug MultirotorWeb.AuthorizedPlug when action in [:create]

  def show(conn, %{"id" => id}) do
    post = Multirotor.PostQueries.get_by_id(id)
    changeset = Multirotor.Posts.changeset(%Multirotor.Posts{}, %{type: "answer"})
    answerList = Multirotor.PostsMappingQueries.get_answers(id)

    render conn, "details.html", post: post, changeset: changeset, answerList: answerList
  end

  def index(conn, _params) do
    post_index = Multirotor.PostQueries.get_all
    render conn, "list.html", posts: post_index
  end

  def new(conn, %{errors: errors}) do
    render conn, "create.html", changeset: errors
  end

  def new(conn, _params) do
    changeset = Multirotor.Posts.changeset(%Multirotor.Posts{}, %{})
    render conn, "create.html", changeset: changeset
  end

  def create(conn, %{"posts" => posts}) do
    current_user = get_session(conn, :current_user)

    changeset = Multirotor.Posts.map_answer(posts, current_user.id, 1)
    case Multirotor.PostQueries.create changeset do
      {:ok, %{id: id}} -> redirect conn, to: post_path(conn, :show, id)
      {:error, reasons} -> new conn, %{errors: reasons}
    end
  end

  def answer(conn, %{"posts" => posts}) do
    current_user = get_session(conn, :current_user)

    changeset = Multirotor.Posts.map_answer(posts,current_user.id,2)
    #TODO how to clean up this nested case statment
    case Multirotor.PostQueries.create changeset do
      {:ok, %{id: id}} ->
        questionid = Map.get(conn.path_params,"id")
        mappingChangeset = Multirotor.PostsMapping.changeset(%Multirotor.PostsMapping{}, %{answerid: id, questionid: questionid})
        case Multirotor.PostsMappingQueries.create mappingChangeset do
          {:ok, %{id: id}} ->
            redirect conn, to: post_path(conn, :show, questionid)
          {:error, reasons} -> new conn, %{errors: reasons}
        end  
      {:error, reasons} -> 
        new conn, %{errors: reasons}
    end
  end

end
