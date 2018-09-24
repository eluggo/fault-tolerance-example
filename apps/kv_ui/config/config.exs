# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :kv_ui,
  ecto_repos: [KvUi.Repo]

# Configures the endpoint
config :kv_ui, KvUi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "i1vX217BFkly/2YH12ZaiFsbuAFLUR8F2Z+H+KXIUJYvGeRgVzGU50mWncycRnjL",
  render_errors: [view: KvUi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: KvUi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
