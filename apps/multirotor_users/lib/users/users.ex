defmodule MultirotorUsers.Users do
  use Ecto.Schema

  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :salt, :string
    field :password, :string

    timestamps()
  end


  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name, :email, :salt, :password])
  end
end
