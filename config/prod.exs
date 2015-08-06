use Mix.Config

config :bakeoff, Bakeoff.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: System.get_env("HOST"), port: 80],
  cache_static_manifest: "priv/static/manifest.json"

config :logger, level: :info

config :bakeoff, Bakeoff.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")

config :bakeoff, Bakeoff.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  size: 20 # The amount of database connections in the pool
