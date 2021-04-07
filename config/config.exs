# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :berries,
  ecto_repos: [Berries.Repo]

# Configures the endpoint
config :berries, BerriesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xdz22WZ6mgS26qfAExQ/d3NLcBJTbCjgqLd2o/amgcjZTr4/HcAbxcxqKyhXI+LR",
  render_errors: [view: BerriesWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Berries.PubSub,
  live_view: [signing_salt: "d8JNCGnS"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
