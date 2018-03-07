defmodule MultirotorUsers.Repo.Migrations.AddPasswordHashToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :password_hash, :string, size: 1000
    end

  end
end
