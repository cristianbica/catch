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
    plug :accepts, ["json", "html", "xml", "*"]
  end

  scope "/requests", CatchWeb do
    pipe_through :browser

    resources "/", RequestController, only: [:index, :show, :delete], as: "request"
  end

  scope "/", CatchWeb do
    pipe_through :incoming

    get "/", RequestController, :redirection
    match :*, "/*path", RequestController, :create
  end
end
