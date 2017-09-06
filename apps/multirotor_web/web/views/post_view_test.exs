defmodule MultirotorWeb.PostViewTest do
  use MultirotorWeb.ConnCase, async: true
  @tag current: true
  test "Should convert a date to M/D/YY format" do
    date = Ecto.DateTime.from_erl({{2017, 12, 03}, {00,00,00}})
    formatted = Multirotor.PostView.format_date(date)
    assert formatted == "12/3/2017" 
  end



end

