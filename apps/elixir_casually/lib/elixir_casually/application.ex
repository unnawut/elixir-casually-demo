defmodule ElixirCasually.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    _ = :ets.new(:voters, [:set, :public, :named_table])
    _ = :ets.new(:counter, [:set, :public, :named_table])

    children = [
      ElixirCasually.RegistrySupervisor,
      ElixirCasually.PeriodicInspector
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: ElixirCasually.Supervisor)
  end
end
