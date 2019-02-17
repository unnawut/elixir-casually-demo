use Mix.Config

config :elixir_casually_demo_web, ElixirCasuallyDemoWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: ElixirCasuallyDemoWeb.ErrorView, accepts: ~w(json)]

import_config "#{Mix.env()}.exs"
