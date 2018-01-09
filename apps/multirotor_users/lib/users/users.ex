defmodule MultirotorUsers.Users do
  use Ecto.Schema

  schema "users" do
    field :name, :string
    field :email, :string
    field :salt, :string
    field :password, :string

    timestamps()
  end
end
