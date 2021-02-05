use Mix.Config

config :mastery_persistence, MasteryPersistence.Repo,
  username: "postgres",
  # database: "postgres",
  password: "postgres",
  # hostname: "localhost",
  database: "mastery_dev",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  show_sensitive_data_on_connection_error: true,
