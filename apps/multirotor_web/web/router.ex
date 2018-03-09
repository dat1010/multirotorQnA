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

    get "/login", LoginController, :index
    post "/login", LoginController, :login
    get "/user", UserController, :show
    get "/user/new", UserController, :create
    post "/user/new", UserController, :add
    get "/user/new", UserController, :add
  end

  scope "/sessions", MultirotorWeb do
    pipe_through [:browser]
    get "/new", SessionsController, :new
    post "/identity/callback", SessionsController,  
                                     :identity_callback
  end


  # Other scopes may use custom stacks.
  # scope "/api", MultirotorWeb do
  #   pipe_through :api
  # end
end
