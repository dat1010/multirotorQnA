defmodule Multirotor.Repo.Migrations.AddParentidToPosts do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :parentid, :integer
    end

  end
end
