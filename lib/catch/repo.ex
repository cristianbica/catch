defmodule Catch.Repo do
  use Ecto.Repo,
    otp_app: :catch,
    adapter: Ecto.Adapters.Postgres
end
