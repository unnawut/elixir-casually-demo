use Mix.Config

config :load_tester,
  num_clients: 200,
  requests_per_client: 100,
  total_duration: 10,
  target_base_url: System.get_env("TARGET_BASE_URL") || "http://localhost:5000",
  libcluster_topologies: [
    runners: [
      strategy: Cluster.Strategy.Epmd,
      config: [hosts: [:"runner@runner-1", :"runner@runner-2", :"runner@runner-3"]],
      connect: {:net_kernel, :connect_node, []},
      disconnect: {:erlang, :disconnect_node, []},
      list_nodes: {:erlang, :nodes, [:connected]}
    ]
  ]
