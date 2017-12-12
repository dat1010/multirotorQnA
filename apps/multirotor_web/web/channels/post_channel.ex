defmodule Multirotor.PostChannel do
  use Phoenix.Channel 

  def join("post:" <> post_id, _message, socket) when post_id <= 0 do
    {:error, %{reason: "invalid post id"}}
  end 

  def join("post:" <> post_id, _message, socket) do
    {:ok, socket}
  end

  def send_update(post) do
    payload = %{ 
      "quantity" => post.quantity_available
    }

    MultirotorWeb.Endpoint.broadcast("post:#{post.id}", "update_quantity", payload)
  end
  
end
