# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :multidatabase,
  ecto_repos: [Multidatabase.Repo, Multidatabase.RepoTwo, Multidatabase.RepoThree]

# Configures the endpoint
config :multidatabase, MultidatabaseWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "omm4lKkRLFAOzzK0f+9Ab6sixESk/6yMIgwxu6HesJYOFSxhKsmqPKW4QQSvhl8g",
  render_errors: [view: MultidatabaseWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Multidatabase.PubSub,
  live_view: [signing_salt: "BNaVjRUC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
