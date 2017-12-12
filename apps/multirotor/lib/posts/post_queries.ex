defmodule Multirotor.PostQueries do
  import Ecto.Query

  alias Multirotor.{Repo, Posts}

  def any do
    Repo.one(from e in Posts, select: count(e.id)) != 0
  end

  def get_all do
    Repo.all(from Posts)
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


  def decrease_quantity(id, quantity) do
    post = Repo.get!(Posts, id)
    changes = Ecto.Changeset.change post, quantity_available:
    post.quantity_available - String.to_integer(quantity)
    Repo.update changes
  end

end
