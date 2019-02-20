defmodule LoadTester do
  @moduledoc """
  Documentation for LoadTester.
  """

  def run(base_url \\ nil, opts) do
    case Keyword.get(opts, :num_clients) do
      nil -> :noop
      n -> Application.put_env(:load_tester, :num_clients, n)
    end

    if base_url do
      :ok = Application.put_env(:load_tester, :target_base_url, base_url)
    end

    target_base_url = Application.get_env(:load_tester, :target_base_url)
    session = Chaperon.Master.run_load_test(LoadTester.Runner)
    metrics = Map.get(session.metrics, {:get, "#{target_base_url}/"})

    IO.puts("""
      Load test finished.

      Test setup:
        - Rate:            #{div(metrics.total_count, session.assigned.interval)} req/s
        - Duration:        #{session.assigned.interval} seconds
        - Total requests:  #{metrics.total_count} requests

      Results:
        - Average response time:  #{metrics.mean} ms
        - Min response time:      #{metrics.min} ms
        - 75th percentile:        #{Map.get(metrics, {:percentile, 75.0})} ms
        - 90th percentile:        #{Map.get(metrics, {:percentile, 90.0})} ms
        - 95th percentile:        #{Map.get(metrics, {:percentile, 95.0})} ms
        - Max response time:      #{metrics.max} ms
      """)
  end
end
