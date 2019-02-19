use Mix.Config

config :elixir_casually_web, ElixirCasuallyWeb.Endpoint,
  http: [port: 5000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []
