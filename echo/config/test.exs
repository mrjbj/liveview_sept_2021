use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :echo, Echo.Repo,
  username: "postgres",
  password: "Ringo!@5",
  database: "echo_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "ubuntu.razzlin.com",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :echo, EchoWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
