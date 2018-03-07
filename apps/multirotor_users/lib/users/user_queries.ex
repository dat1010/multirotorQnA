defmodule MultirotorUsers.UserQueries do
  import Ecto.Query

  alias MultirotorUsers.{Repo, Users}

  def get_by_id(id) do
    Repo.get(Users, id)
  end

  def create(user) do
    Repo.insert(user)
  end

  def get_by_email(email) do
    query = from u in Users,
            where: u.email == ^email
    Repo.all(query)
  end



end
