defmodule LoadTester.Runner do
  @moduledoc """
  Defines the running sequence for the scenarios.
  """
  use Chaperon.LoadTest

  def default_config do
    target_base_url = Application.get_env(:load_tester, :target_base_url)

    %{
      base_url: target_base_url,
      merge_scenario_sessions: true
    }
  end

  def scenarios do
    num_clients = Application.get_env(:load_tester, :num_clients)

    [
      {{num_clients, LoadTester.Scenarios.VoteRandom}, %{}}
    ]
  end
end
