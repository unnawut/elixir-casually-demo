defmodule ElixirCasually.PeriodicInspector do
  use GenServer
  alias ElixirCasually.{VoteCountRegistry, VoterRegistry}

  #
  # Client API
  #

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  #
  # Server callbacks
  #

  def init(_opts) do
    schedule_inspect_self()

    {:ok, nil}
  end

  def handle_info(:inspect, state) do
    if IEx.started?() do
      inspect_server()
    end

    schedule_inspect_self()
    {:noreply, state}
  end

  defp schedule_inspect_self do
    Process.send_after(self(), :inspect, 5_000)
  end

  defp inspect_server do
    IO.puts("VoterRegistry #{inspect(Process.whereis(VoterRegistry))}, VoteCountRegistry #{inspect(Process.whereis(VoteCountRegistry))}")
  end
end
