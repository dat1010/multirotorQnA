defmodule Multirotor.PostQueries do
  import Ecto.Query

  alias Multirotor.{Repo, Posts}
  alias Multirotor.{Repo, PostsMapping}

  def any do
    Repo.one(from e in Posts, select: count(e.id)) != 0
  end

  def get_all do
    query = from p in Posts,
            where: p.type == 1
    Repo.all(query)
  end

  def get_top(count) do
    query = from p in Posts,
            where: p.type == 1,
            order_by: [desc: :inserted_at], limit: ^count
    Repo.all(query)
  end

  def get_answers(questionid) do
    query = from p in Posts,
      inner_join: pm in PostsMapping, on: pm.answerid == p.id,
      where: pm.questionid == ^questionid
    Repo.all(query)
  end

  def get_all_by_userid(userid) do
    query = from p in Posts,
            where: p.userid == ^userid

    Repo.all(query)
  end

  def get_by_id(id) do
    Repo.get(Posts, id)
  end

  def create(post) do
    Repo.insert(post)
  end

end
