defmodule Multirotor.Repo.Migrations.AddPostsTable do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string, size: 100
      add :body, :string, size: 1000
      add :votes, :integer
      add :date, :utc_datetime
      add :views, :integer
      add :userid, :integer

      timestamps
    end
  end
end
