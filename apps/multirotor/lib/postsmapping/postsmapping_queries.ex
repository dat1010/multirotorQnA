defmodule Multirotor.PostsMappingQueries do
  import Ecto.Query
  alias Multirotor.{Repo, Posts}
  alias Multirotor.{Repo,PostsMapping}

  def create(postsmapping) do
    Repo.insert(postsmapping)
  end

  def get_answers(questionid) do
    query = from p in Posts,
      inner_join: pm in PostsMapping, on: pm.answerid == p.id,
      where: pm.questionid == ^questionid
    Repo.all(query)
  end


end
