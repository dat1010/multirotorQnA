defmodule Multirotor.Posts do
  import Ecto.Query

  alias Multirotor.{Repo, Post}

  def answer_type do
    2
  end
  def question_type do
    1
  end

  def any do
    Repo.one(from e in Post, select: count(e.id)) != 0
  end

  def get_all do
    query = from p in Post,
            where: p.type == 1
    Repo.all(query)
  end

  def get_top(count) do
    query = from p in Post,
            where: p.type == 1,
            order_by: [desc: :inserted_at], limit: ^count
    Repo.all(query)
  end

  def get_all_by_userid(userid) do
    query = from p in Post,
            where: p.userid == ^userid
    Repo.all(query)
  end

  def get_by_id(id) do
    Repo.get(Post, id)
  end

  def create(post) do
    Repo.insert(post)
  end

  def get_by_parent_id(parent_id) do
    query = from p in Post,
             where: p.parentid == ^parent_id
    Repo.all(query)
  end

  def map_answer(posts, parent_id, user_id, type) do
    posts = Map.put(posts, "date", Ecto.DateTime.utc) 
    posts = Map.put(posts, "type", type)
    posts = Map.put(posts, "userid", user_id)
    posts = Map.put(posts, "parentid", parent_id)
    case type do
      1 -> Post.changeset(%Post{}, posts)
      2 -> Post.answer_changeset(%Post{}, posts)
    end
  end

  def create_post() do
    Post.changeset(%Post{}, %{})
  end

  def create_answer() do
    Post.changeset(%Post{}, %{type: "answer"})
  end


end
