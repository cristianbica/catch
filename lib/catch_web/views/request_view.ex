defmodule CatchWeb.RequestView do
  use CatchWeb, :view

  defp request_headers(request) do
    request.headers["headers"]
    # |> Enum.filter fn h -> h[0] == ""
    |> Enum.map(&Enum.join(&1, ": "))
    |> Enum.join("\n")
  end
end
