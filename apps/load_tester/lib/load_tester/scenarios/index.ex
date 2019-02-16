defmodule LoadTester.Scenarios.Index do
  @moduledoc """
  Test scenario for the root endpoint.
  """
  use Chaperon.Scenario

  def init(session) do
    requests_per_client = :load_tester |> Application.get_env(:requests_per_client)
    total_duration = :load_tester |> Application.get_env(:total_duration)

    session
    |> assign(rate: requests_per_client)
    |> assign(interval: total_duration)
    |> ok()
  end

  def run(session) do
    session
    |> cc_spread(
      :do_run,
      session.assigned.rate,
      session.assigned.interval * 1000
    )
  end

  def do_run(session) do
    get(session, "/")
  end
end
