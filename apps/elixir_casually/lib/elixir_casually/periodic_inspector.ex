defmodule ElixirCasually.PeriodicInspector do
  use GenServer
  alias ElixirCasually.{Counter, CLI, VoterRegistry}

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
    Process.flag(:trap_exit, true)
    CLI.info("#{__MODULE__} starting...")

    schedule_inspect_self()

    {:ok, nil}
  end

  def handle_info(:inspect, state) do
    if server?() && !iex?() do
      inspect_server()
    end

    schedule_inspect_self()
    {:noreply, state}
  end

  defp schedule_inspect_self do
    Process.send_after(self(), :inspect, 5_000)
  end

  defp server?, do: Phoenix.Endpoint.server?(:elixir_casually_web, ElixirCasuallyWeb.Endpoint)

  defp iex?, do: IEx.started?()

  defp inspect_server do
    ""
    |> Kernel.<>("Voters: #{length(VoterRegistry.all())}, ")
    |> Kernel.<>("Counts: #{Counter.all() |> Map.values() |> Enum.sum()}, ")
    |> Kernel.<>("Main: #{inspect(self())}, ")
    |> Kernel.<>("VoterRegistry #{inspect(Process.whereis(VoterRegistry))}, ")
    |> Kernel.<>("Counter #{inspect(Process.whereis(Counter))}")
    |> IO.puts()

    Counter.all()
    |> Enum.each(fn {vote_number, count} ->
      IO.puts("  #{vote_number}: #{count}")
    end)
  end

  def terminate(_reason, _state) do
    CLI.error("#{__MODULE__} terminating. Persisting the Data... Done.")
  end
end
