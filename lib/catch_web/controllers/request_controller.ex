defmodule CatchWeb.RequestController do
  use CatchWeb, :controller

  alias Catch.Requests
  alias Catch.Requests.Request

  def redirection(conn, _params) do
    conn
    |> redirect(to: Routes.request_path(conn, :index))
  end

  def index(conn, _params) do
    requests = Requests.list_requests()
    render(conn, "index.html", requests: requests)
  end

  def create(conn, params) do
    request_params = %{
      "verb" => conn.method,
      "path" => conn.request_path,
      "content_type" => "x",
      "params" => conn.params,
      "headers" => %{ "headers" => Enum.map(conn.req_headers, &Tuple.to_list/1) }
    }
    case Requests.create_request(request_params) do
      {:ok, request} ->
        conn
        |> send_resp(200, "")

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> send_resp(426, changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    request = Requests.get_request!(id)
    render(conn, "show.html", request: request)
  end

  def delete(conn, %{"id" => id}) do
    request = Requests.get_request!(id)
    {:ok, _request} = Requests.delete_request(request)

    conn
    |> put_flash(:info, "Request deleted successfully.")
    |> redirect(to: Routes.request_path(conn, :index))
  end
end
