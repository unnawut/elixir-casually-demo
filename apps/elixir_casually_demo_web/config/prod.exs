use Mix.Config

config :elixir_casually_demo_web, ElixirCasuallyDemoWeb.Endpoint,
  http: [:inet6, port: System.get_env("PORT") || 5000],
  url: [host: "localhost", port: 5000]
