use Mix.Config

config :mastery_persistence, MasteryPersistence.Repo,
  username: "postgres",
  database: "postgres",
  password: "postgres",
  hostname: "localhost"

config :mastery, :persistence_fn, &MasteryPersistence.record_response/2
