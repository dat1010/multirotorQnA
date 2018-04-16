defmodule Multirotor.Repo.Migrations.AddPostsMappingTable do
  use Ecto.Migration

  def change do
    create table(:postsmapping) do
      add :questionid, :integer
      add :answerid, :integer 
    end
  end
end
