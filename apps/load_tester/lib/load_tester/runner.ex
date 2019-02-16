defmodule LoadTester.Runner do
  @moduledoc """
  Defines the running sequence for the scenarios.
  """
  use Chaperon.LoadTest

  def default_config do
    %{
      base_url: "http://localhost:5000",
      merge_scenario_sessions: true
    }
  end

  def scenarios do
    num_clients = :load_tester |> Application.get_env(:num_clients)

    [
      {{num_clients, LoadTester.Scenarios.Index}, %{}}
    ]
  end
end
