defmodule MultirotorUsers.Repo.Migrations.RemoveSaltColumn do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :salt
    end

  end
end
