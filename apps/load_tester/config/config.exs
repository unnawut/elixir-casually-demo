use Mix.Config

config :load_tester,
  num_clients: 200,
  requests_per_client: 100,
  total_duration: 10,
  target_base_url: "http://elixir-casually-server-1:5000",
  libcluster_topologies: [
    runners: [
      strategy: Cluster.Strategy.Epmd,
      config: [
        hosts: [
          :"runner@elixir-casually-master",
          :"runner@elixir-casually-runner-1",
          :"runner@elixir-casually-runner-2",
          :"runner@elixir-casually-runner-3",
          :"runner@elixir-casually-runner-4",
          :"runner@elixir-casually-runner-5",
          :"runner@elixir-casually-runner-6",
          :"runner@elixir-casually-runner-7",
          :"runner@elixir-casually-runner-8",
          :"runner@elixir-casually-runner-9"
        ]
      ],
      connect: {:net_kernel, :connect_node, []},
      disconnect: {:erlang, :disconnect_node, []},
      list_nodes: {:erlang, :nodes, [:connected]}
    ]
  ]
