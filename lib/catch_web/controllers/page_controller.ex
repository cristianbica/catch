defmodule CatchWeb.PageController do
  use CatchWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
