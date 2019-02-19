use Mix.Config

config :libcluster,
  debug: true

config :load_tester,
  num_clients: 200,
  requests_per_client: 100,
  total_duration: 10,
  target_base_url: "http://server-1:5000",
  libcluster_topologies: [
    load_runners: [
      strategy: Cluster.Strategy.Gossip,
      connect: {:net_kernel, :connect_node, []},
      disconnect: {:erlang, :disconnect_node, []},
      list_nodes: {:erlang, :nodes, [:connected]}
    ]
  ]
