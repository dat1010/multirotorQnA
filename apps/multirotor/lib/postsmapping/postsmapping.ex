defmodule Multirotor.PostMapping do
  use Ecto.Schema

  import Ecto.Changeset
  schema "postsmapping" do
    field :questionid, :integer
    field :answerid, :integer
  end

  def changeset(postmapping, params \\ %{}) do
    postmapping
    |> cast(params,[:questionid, :answerid])
  end
end
