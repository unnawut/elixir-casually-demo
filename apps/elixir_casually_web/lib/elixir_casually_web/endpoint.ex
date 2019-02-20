defmodule ElixirCasuallyWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :elixir_casually_web

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/slides/",
    from: {:elixir_casually_web, "priv/slides"},
    gzip: false

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug(
    Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison
  )

  plug ElixirCasuallyWeb.Router
end
