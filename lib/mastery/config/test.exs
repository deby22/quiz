use Mix.Config

config :mastery_persistence, MasteryPersistence.Repo,
  username: "postgres",
  database: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
