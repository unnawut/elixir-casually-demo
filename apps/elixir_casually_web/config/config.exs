use Mix.Config

config :elixir_casually_web, ElixirCasuallyWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: ElixirCasuallyWeb.ErrorView, accepts: ~w(json)]

import_config "#{Mix.env()}.exs"
