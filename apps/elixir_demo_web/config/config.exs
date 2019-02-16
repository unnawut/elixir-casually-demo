use Mix.Config

config :elixir_demo_web, ElixirDemoWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: ElixirDemoWeb.ErrorView, accepts: ~w(json)]

import_config "#{Mix.env()}.exs"
