defmodule Multirotor.Repo.Migrations.AddQuestionsTable do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :title, :string, size: 100
      add :body, :string, size: 255
      add :votes, :integer
      add :date, :utc_datetime
      add :views, :integer
      add :userid, :integer

      timestamps
    end
  end
end
