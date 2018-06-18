defmodule MultirotorUser.UserQueries do
  import Ecto.Query

  alias MultirotorUser.{Repo, User}

  def get_by_id(id) do
    Repo.get(User, id)
  end

  def create(user) do
    Repo.insert(user)
  end

  def get_by_email(email) do
    Repo.get_by(User, email: email)
  end



end
