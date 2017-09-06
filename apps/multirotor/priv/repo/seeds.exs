unless(Multirotor.PostQueries.any) do
  Multirotor.PostQueries.create(Multirotor.Posts.changeset(%Multirotor.Posts{}, %{title: "Kiss FC", body: "Is the KissFC awesome?", date: "2017-08-31 09:00:00", userid: 18, type: 0}))
  Multirotor.PostQueries.create(Multirotor.Posts.changeset(%Multirotor.Posts{}, %{title: "Best FC", body: "What is the best FC?", date: "2017-08-31 09:00:00", userid: 1, type: 0}))
  Multirotor.PostQueries.create(Multirotor.Posts.changeset(%Multirotor.Posts{}, %{title: "Kiss FC", body: "Is the KissFC awesome?", date: "2017-08-31 09:00:00", userid: 18, type: 0}))
end
