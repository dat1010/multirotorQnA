defmodule MultirotorUsers.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do

    create table(:users) do
      add :name, :string, size: 70
      add :email, :string, size: 255
      add :salt, :string, size: 255
      add :password, :string, size: 255

      timestamps()  
    end
  end
end
