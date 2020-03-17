defmodule WallabyLiveviewPlaygroundWeb.Router do
  use WallabyLiveviewPlaygroundWeb, :router

  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :liveview do
    plug :put_root_layout, {WallabyLiveviewPlaygroundWeb.LayoutView, "root.html"}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WallabyLiveviewPlaygroundWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController
  end

  scope "/", WallabyLiveviewPlaygroundWeb do
    pipe_through [:browser, :liveview]
    live "/users_live", UserListLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", WallabyLiveviewPlaygroundWeb do
  #   pipe_through :api
  # end
end
