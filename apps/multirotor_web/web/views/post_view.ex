defmodule MultirotorWeb.PostView do
  use MultirotorWeb.Web, :view

  def format_date(date) do
    {{y,m,d}, _} = Ecto.DateTime.to_erl(date)
    "#{m}/#{d}/#{y}"
  end

end
