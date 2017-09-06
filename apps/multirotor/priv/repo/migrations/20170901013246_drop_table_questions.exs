defmodule Multirotor.Repo.Migrations.DropTableQuestions do
  use Ecto.Migration

  def change do
    drop table(:questions)
  end
end
