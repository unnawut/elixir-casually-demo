defmodule LoadTester.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
    topologies = Application.get_env(:load_tester, :libcluster_topologies)

    children = [
      {Cluster.Supervisor, [topologies, [name: LoadTester.ClusterSupervisor]]},
      {LoadTester, name: LoadTester},
    ]

    children =
      case System.get_env("RUNNER_MASTER") do
        nil -> children
        _ -> [{Chaperon.Master, []} | children]
      end

    opts = [strategy: :one_for_one, name: LoadTester.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
