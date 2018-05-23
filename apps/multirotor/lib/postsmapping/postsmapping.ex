defmodule Multirotor.PostsMapping do
  use Ecto.Schema

  import Ecto.Changeset
  schema "postsmapping" do
    field :questionid, :integer
    field :answerid, :integer

  end

end
