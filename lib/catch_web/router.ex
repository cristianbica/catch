defmodule CatchWeb.Router do
  use CatchWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :incoming do
    plug :accepts, ["*"]
  end

  scope "/requests", CatchWeb do
    pipe_through :browser

    get "/", RequestsController, :index
  end

  scope "/", CatchWeb do
    pipe_through :incoming

    get "/", RequestsController, :redirection
    get "/*path", RequestsController, :create, as: :create_request
  end
end
