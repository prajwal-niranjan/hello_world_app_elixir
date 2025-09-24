import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hello_world_app, HelloWorldAppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "JXyzyvcGqVEkqifIwHQBptu4WZ/l3ia5ECKqC0QQ8udyP+00Fj2L+gD0jwJzy4Zh",
  server: false

# In test we don't send emails
config :hello_world_app, HelloWorldApp.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
