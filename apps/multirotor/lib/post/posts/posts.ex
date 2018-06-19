defmodule Multirotor.Posts do
  import Ecto.Query

  alias Multirotor.{Repo, Post}
  alias Multirotor.{Repo, PostMapping}

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


end
