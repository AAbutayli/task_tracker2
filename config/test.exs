use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :task_tracker2, TaskTracker2Web.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :task_tracker2, TaskTracker2.Repo,
username: "task_tracker2p2",
password: "Aen2paiy7isu",
  database: "task_tracker2p2_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
