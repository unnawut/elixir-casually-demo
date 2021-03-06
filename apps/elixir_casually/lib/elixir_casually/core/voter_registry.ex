defmodule ElixirCasually.VoterRegistry do
  use GenServer
  alias ElixirCasually.CLI

  #
  # Client API
  #

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def all do
    stream_all() |> Enum.to_list()
  end

  def stream_all do
    end_of_table = :"$end_of_table"

    Stream.resource(
      fn -> :ets.first(:voters) end,
      fn ^end_of_table -> {:halt, nil}
         key -> {[key], :ets.next(:voters, key)}
      end,
      fn _ -> :ok end
    )
  end

  def lookup(citizen_id) do
    case :ets.lookup(:voters, citizen_id) do
      [{^citizen_id}] -> {:ok, citizen_id}
      [] -> :error
    end
  end

  def register(citizen_id) do
    GenServer.call(__MODULE__, {:register, citizen_id})
  end

  def crash() do
    GenServer.call(__MODULE__, :not_exists)
  end

  #
  # Server callbacks
  #

  def init(_opts) do
    Process.flag(:trap_exit, true)
    CLI.info("#{__MODULE__} starting...")
    {:ok, nil}
  end

  def handle_call({:register, citizen_id}, _from, state) do
    case :ets.insert_new(:voters, {citizen_id}) do
      true ->
        {:reply, {:ok, citizen_id}, state}

      false ->
        {:reply, {:error, :already_registered}, state}
    end
  end

  def terminate(_reason, _state) do
    CLI.error("#{__MODULE__} terminating... Persisting the Data... Done.")
  end
end
