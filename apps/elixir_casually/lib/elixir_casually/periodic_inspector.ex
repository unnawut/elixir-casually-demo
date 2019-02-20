defmodule ElixirCasually.PeriodicInspector do
  use GenServer
  alias ElixirCasually.{CounterRegistry, VoterRegistry}

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
    IO.puts("VoterRegistry #{inspect(Process.whereis(VoterRegistry))}, CounterRegistry #{inspect(Process.whereis(CounterRegistry))}")
  end
end
