defmodule LoadTester.Scenarios.VoteRandom do
  @moduledoc """
  Test scenario for the root endpoint.
  """
  use Chaperon.Scenario

  def init(session) do
    requests_per_sec = :load_tester |> Application.get_env(:requests_per_sec)
    duration = :load_tester |> Application.get_env(:duration)

    session
    |> assign(rate: requests_per_sec * duration)
    |> assign(interval: duration)
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
    get(session, "/vote/genserver")
  end
end
