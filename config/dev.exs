import Config

config :hello_world_app, HelloWorldAppWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  secret_key_base: "dev_secret"
