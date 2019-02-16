use Mix.Config

config :elixir_demo_web, ElixirDemoWeb.Endpoint,
  http: [:inet6, port: System.get_env("PORT") || 5000],
  url: [host: "localhost", port: 5000]
