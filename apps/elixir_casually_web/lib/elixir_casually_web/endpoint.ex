defmodule ElixirCasuallyWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :elixir_casually_web

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
