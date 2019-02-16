use Mix.Config

config :load_tester,
  num_clients: 200,
  requests_per_client: 150,
  total_duration: 10,
  target_base_url: System.get_env("TARGET_BASE_URL") || "http://localhost:5000"
