defmodule MultirotorWeb.Router do
  use MultirotorWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end


  scope "/", MultirotorWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/posts", PostController, :list
    get "/posts/new", PostController, :create 
    post "/posts/new", PostController, :add
    get "/posts/:id", PostController, :show
    post "posts/:id/reserve", PostController, :reserve

    get "/login", LoginController, :index
    post "/login", LoginController, :login

  end


  # Other scopes may use custom stacks.
  # scope "/api", MultirotorWeb do
  #   pipe_through :api
  # end
end
