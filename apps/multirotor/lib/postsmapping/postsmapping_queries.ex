defmodule Multirotor.PostMappingQueries do
  import Ecto.Query
  alias Multirotor.{Repo, Post}
  alias Multirotor.{Repo,PostMapping}

  def create(postsmapping) do
    Repo.insert(postsmapping)
  end

  def get_answers(questionid) do
    query = from p in Post,
      inner_join: pm in PostMapping, on: pm.answerid == p.id,
      where: pm.questionid == ^questionid
    Repo.all(query)
  end


end
