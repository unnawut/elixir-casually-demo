defmodule LoadTester.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
    topologies = Application.get_env(:load_tester, :libcluster_topologies)

    children = [
      {Cluster.Supervisor, [topologies, [name: LoadTester.ClusterSupervisor]]},
    ]

    opts = [strategy: :one_for_one, name: LoadTester.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
