use Mix.Config

config :mastery_persistence, MasteryPersistence.Repo,
  username: "postgres",
  # database: "postgres",
  password: "postgres",
  # hostname: "localhost"
  show_sensitive_data_on_connection_error: true,
  database: "mastery_dev",
  hostname: "localhost"

config :mastery, :persistence_fn, &MasteryPersistence.record_response/2
