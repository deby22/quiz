use Mix.Config

config :mastery_persistence, MasteryPersistence.Repo,
  username: "postgres",
  password: "postgres",
  database: "mastery_dev",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
