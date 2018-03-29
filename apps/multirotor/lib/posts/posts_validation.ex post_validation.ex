defmodule Multirotor.PostsValidation do

  def must_be_future(_, value) do
    Ecto.DateTime.compare(value, Ecto.DateTime.utc)
    |> get_error
  end

  def get_error(comparison) when comparison == :lt, do: [date: "Cannot be in the past"]
  def get_error(_), do: []

end

