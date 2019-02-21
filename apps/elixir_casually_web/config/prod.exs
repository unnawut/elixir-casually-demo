use Mix.Config

config :elixir_casually_web, ElixirCasuallyWeb.Endpoint,
  http: [:inet6, port: System.get_env("PORT") || 5000],
  url: [host: "localhost", port: 5000],
  code_reloader: true
