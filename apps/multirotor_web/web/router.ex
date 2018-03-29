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
    get "posts/", PostController, :index
    get "post/new", PostController, :new 
    post "post/new", PostController, :create
    get "posts/:id", PostController, :show
    post "posts/:id", PostController, :answer


    get "/user", UserController, :show
    get "/user/new", UserController, :new
    post "/user/new", UserController, :create
    get "/user/new", UserController, :add
  end

  scope "/sessions", MultirotorWeb do
    pipe_through [:browser]
    get "/new", SessionsController, :new
    get "/delete", SessionsController, :delete
    post "/identity/callback", SessionsController,  
                                     :identity_callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", MultirotorWeb do
  #   pipe_through :api
  # end
end
