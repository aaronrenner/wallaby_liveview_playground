use Mix.Config

# Configure your database
config :wallaby_liveview_playground, WallabyLiveviewPlayground.Repo,
  username: "postgres",
  password: "postgres",
  database: "wallaby_liveview_playground_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :wallaby_liveview_playground, WallabyLiveviewPlaygroundWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn