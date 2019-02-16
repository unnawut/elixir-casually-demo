defmodule LoadTester do
  @moduledoc """
  Documentation for LoadTester.
  """

  def run do
    session = Chaperon.run_load_test(LoadTester.Runner)
    metrics = Map.get(session.metrics, {:get, "http://localhost:5000/"})

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
