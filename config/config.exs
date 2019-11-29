# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :catch,
  ecto_repos: [Catch.Repo]

# Configures the endpoint
config :catch, CatchWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3tDmIulBgHdxboVuvb0OunHLHuiJpd/8toM+ovarL9RNQWzZj1iA46x8LI7oB5G1",
  render_errors: [view: CatchWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Catch.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
