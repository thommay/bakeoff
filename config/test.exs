use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bakeoff, Bakeoff.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :bakeoff, Bakeoff.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "bakeoff_test",
  size: 1 # Use a single connection for transactional tests
