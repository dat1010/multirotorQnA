# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :multirotor_web, MultirotorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8Nn6eg9hNDAbq8b3T76zjJue8EkG5Evva3scDxFjv5v9Pw+F7Sas5NMut3QqCkAb",
  render_errors: [view: MultirotorWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MultirotorWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
