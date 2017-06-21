# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :vlogger,
  ecto_repos: [Vlogger.Repo]

# Configures the endpoint
config :vlogger, Vlogger.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "p+vnIoSmeWvWIfBa1jGNc+Bw4WU+bxhO5TpSpcIGZpYuGas5SMOS5/g1LPATBJ88",
  render_errors: [view: Vlogger.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Vlogger.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Config Guardian
config :guardian, Guardian,
 issuer: "Vlogger.#{Mix.env}",
 ttl: {30, :days},
 verify_issuer: true,
 serializer: Vlogger.GuardianSerializer,
 secret_key: "4xrcwLHJSYMEldYJU8AgLfbvpotJFq/No0xO28U41cNsIeeh4QasqfsWksyXSBPy"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
