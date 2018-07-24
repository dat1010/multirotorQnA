defmodule MultirotorUser.Accounts do
import Ecto.Query

  alias MultirotorUser.{Repo, User}

  def get_by_id(id) do
    Repo.get(User, id)
  end

  def create(user) do
    %User{}
    |> User.changeset(user)
    |> Repo.insert
  end

  def get_by_email(email) do
    Repo.get_by(User, email: email)
  end

  def change_user() do
    %User{}
    |> User.changeset(%{})
  end


end
