defmodule LoadTester do
  @moduledoc """
  Documentation for LoadTester.
  """

  #
  # Client API
  #

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def run(base_url \\ nil) do
    {:ok, report} = GenServer.call(__MODULE__, {:run, base_url})

    IO.puts(report)
  end

  #
  # Server callbacks
  #

  def init(_opts) do
    {:ok, nil}
  end

  def handle_call({:run, base_url}, _from, state) do
    if base_url do
      Application.put_env(:load_tester, :target_base_url, base_url)
    end

    target_base_url = Application.get_env(:load_tester, :target_base_url)
    session = Chaperon.Master.run_load_test(LoadTester.Runner)
    metrics = Map.get(session.metrics, {:get, "#{target_base_url}/"})

    report = """
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
      """

    {:reply, {:ok, report}, state}
  end
end
