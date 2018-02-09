defmodule MultirotorUsers.UserQueries do
  import Ecto.Query

  alias MultirotorUsers.{Repo, Users}

  def get_by_id(id) do
    Repo.get(Users, id)
  end

  def create(user) do
    Repo.insert(user)
  end

end
