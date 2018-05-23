defmodule Multirotor.PostsMappingQuieries do
  import Ecto.Query
  alias Multirotor.{Repo,PostsMapping}

  def create(postsmapping) do
    Repo.insert(postsmapping)
  end
end
