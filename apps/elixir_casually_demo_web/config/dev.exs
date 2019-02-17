use Mix.Config

config :elixir_casually_demo_web, ElixirCasuallyDemoWeb.Endpoint,
  http: [port: 5000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []
