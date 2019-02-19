defmodule ElixirCasually.VoteCountRegistry do
  use GenServer

  #
  # Client API
  #

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def all do
    stream_all()
    |> Enum.reduce(%{}, fn {vote_number, count}, acc ->
      Map.put(acc, vote_number, count)
    end)
  end

  def stream_all do
    end_of_table = :"$end_of_table"

    Stream.resource(
      fn -> :ets.first(:vote_counter) end,
      fn ^end_of_table ->
          {:halt, nil}
         key ->
          [{key, count}] = :ets.lookup(:vote_counter, key)
          {[{key, count}], :ets.next(:vote_counter, key)}
      end,
      fn _ -> :ok end
    )
  end

  def get(vote_number) do
    GenServer.call(__MODULE__, {:get, vote_number})
  end

  def increment(vote_number) do
    GenServer.call(__MODULE__, {:increment, vote_number})
  end

  def crash() do
    GenServer.call(__MODULE__, :not_exists)
  end

  #
  # Server callbacks
  #

  def init(_opts) do
    name = :ets.new(:vote_counter, [:named_table])
    {:ok, name}
  end

  def handle_call({:get, vote_number}, _from, state) do
    result =
      case :ets.lookup(:vote_counter, vote_number) do
        [{^vote_number, vote_count}] -> {:ok, vote_count}
        [] -> {:error, :vote_number_not_found}
      end

    {:reply, result, state}
  end

  def handle_call({:increment, vote_number}, _from, state) do
    result = {:ok, :ets.update_counter(:vote_counter, vote_number, 1, {vote_number, 0})}

    {:reply, result, state}
  end
end
