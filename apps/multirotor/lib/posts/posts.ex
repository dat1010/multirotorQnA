defmodule Multirotor.Posts do
  use Ecto.Schema

  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :body, :string
    field :votes, :integer, default: 0
    field :date, Ecto.DateTime
    field :views, :integer, default: 0
    field :userid, :integer
    field :type, :integer

    timestamps
  end

  @required_fields ~w(title,body,date,userid,type)a
  @optional_fields ~w(votes,views)a


  def changeset(post, params \\ %{}) do
    post
    |> cast(params, [:title, :body, :votes, :date, :views, :userid, :type])
    |> validate_required([:title, :body, :date, :userid, :type])

    #|> validate_required(@required_fields)

  end
#|> validate_change(:date, &must_be_future/2)
 #For example purposes
  defp must_be_future(_, value) do
    Ecto.DateTime.compare(value, Ecto.DateTime.utc)
    |> get_error
  end

  defp get_error(comparison) when comparison == :lt, do: [date: "Cannot be in the past"]
  defp get_error(_), do: []


end
