defmodule CatchWeb.RequestsController do
  use CatchWeb, :controller

  def redirection(conn, _params) do
    redirect(conn, to: "/requests")
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, _params) do
    conn
    |> send_resp(200, "")
  end
end
