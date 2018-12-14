defmodule TaskTracker2Web.Router do
  use TaskTracker2Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug TaskTracker2Web.Plugs.FetchSession
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :ajax do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_flash
    plug TaskTracker2Web.Plugs.FetchSession # FIXME: "FetchUser"
  end

  scope "/", TaskTracker2Web do
    pipe_through :browser

    get "/", PageController, :index
    resources "/tasks", TaskController
    resources "/users", UserController
    resources "/sessions", SessionController, only: [:create, :delete], singleton: true
  end

  # Other scopes may use custom stacks.
  # scope "/api", TaskTracker2Web do
  #   pipe_through :api
  # end

  scope "/ajax", TaskTracker2Web do
    pipe_through :ajax
    resources "/timeblocks", TimeblockController, except: [:new, :edit]
  end
end
