use Mix.Config

config :load_tester,
  num_clients: 200,
  requests_per_client: 100,
  total_duration: 10,
  target_base_url: "http://server-1:5000"
