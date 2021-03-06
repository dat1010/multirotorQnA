defmodule Multirotor.Post do
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
    field :parentid, :integer

    timestamps()
  end

  @required_fields ~w{title body date userid type}a
  @optional_fields ~w{votes views}a

  def changeset(post, params \\ %{}) do
    post
    |> cast(params, [:title, :body, :votes, :date, :views, :userid, :type, :parentid])
    |> validate_required([:title, :body, :date, :userid, :type])
    #|> validate_required(@required_fields)
  end

  def answer_changeset(post, params\\ %{}) do
    post
    |> cast(params, [:title, :body, :votes, :date, :views, :userid, :type, :parentid])
    |> validate_required([ :body, :date, :userid, :type])
  end

 #|> validate_change(:date, &must_be_future/2)
 #For example purposes
  

end
