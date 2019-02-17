defmodule ElixirCasuallyDemoWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :elixir_casually_demo_web

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug ElixirCasuallyDemoWeb.Router
end
