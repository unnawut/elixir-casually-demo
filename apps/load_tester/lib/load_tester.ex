defmodule LoadTester do
  @moduledoc """
  Documentation for LoadTester.
  """

  @doc """
  Runs the load test runner with the given `base_url` and `options`.
  """
  def run(base_url \\ nil, opts \\ []) do
    LoadTester.Runner
    |> set_options(base_url, opts)
    |> run_load()
    |> report()
  end

  #
  # Private functions
  #

  defp set_options(runner, base_url, opts) do
    if base_url do
      Application.put_env(:load_tester, :target_base_url, base_url)
    end

    case Keyword.get(opts, :num_clients) do
      nil -> :noop
      n -> Application.put_env(:load_tester, :num_clients, n)
    end

    case Keyword.get(opts, :requests_per_sec) do
      nil -> :noop
      n -> Application.put_env(:load_tester, :requests_per_sec, n)
    end

    case Keyword.get(opts, :duration) do
      nil -> :noop
      n -> Application.put_env(:load_tester, :duration, n)
    end

    runner
  end

  defp run_load(runner) do
    case Node.list() do
      [] -> Chaperon.run_load_test(runner)
      _ -> Chaperon.Master.run_load_test(runner)
    end
  end

  defp report(session) do
    target_base_url = Application.get_env(:load_tester, :target_base_url)
    metrics = Map.get(session.metrics, {:get, "#{target_base_url}/vote_random"})

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
