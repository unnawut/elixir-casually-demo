defmodule ElixirCasually.RegistrySupervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(_opts) do
    child_specs = [
      ElixirCasually.VoterRegistry,
      ElixirCasually.Counter
    ]

    Supervisor.init(child_specs, strategy: :one_for_one)
  end
end
