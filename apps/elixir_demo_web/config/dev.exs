use Mix.Config

config :elixir_demo_web, ElixirDemoWeb.Endpoint,
  http: [port: 5000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []
