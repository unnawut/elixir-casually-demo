defmodule ElixirCasuallyWeb.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
    children = [
      ElixirCasuallyWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: ElixirCasuallyWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    ElixirCasuallyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
