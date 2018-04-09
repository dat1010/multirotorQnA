defmodule MultirotorUsers.Users do
  use Ecto.Schema

  import Ecto.Changeset


  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string
    field :password_hash, :string

    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name, :email, :password])
    |> MultirotorUsers.UserValidation.put_pass_hash()
  end
 end
