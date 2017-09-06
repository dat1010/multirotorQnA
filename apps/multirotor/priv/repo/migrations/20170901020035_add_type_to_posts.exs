defmodule Multirotor.Repo.Migrations.AddTypeToPosts do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :type, :integer
    end
  end
end
