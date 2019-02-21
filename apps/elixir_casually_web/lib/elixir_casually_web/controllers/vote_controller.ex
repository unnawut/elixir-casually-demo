defmodule ElixirCasuallyWeb.VoteController do
  use ElixirCasuallyWeb, :controller
  alias ElixirCasually.{Counter, VoterRegistry}

  def index(conn, _attrs) do
    result =
      %{}
      |> Map.put(:counts, Counter.all())
      |> Map.put(:voters, VoterRegistry.all())
      |> Map.put(:time_remaining, get_time_remaining())
      |> Map.put(:success, true)

    json(conn, result)
  end

  def create(conn, %{"citizen_id" => cid, "vote_number" => vote_number}) do
    with {:ok, _} <- VoterRegistry.register(cid),
         {:ok, _} <- Counter.increment(vote_number) do
      IO.puts("Voted with GenServer: #{inspect(Process.whereis(Counter))}")
      json(conn, %{success: true, voted: vote_number})
    else
      {:error, code} ->
        json(conn, %{success: false, error: code})
    end
  end

  def vote_genserver(conn, _) do
    create(conn, %{"citizen_id" => :rand.uniform(69_000_000), "vote_number" => "N#{:rand.uniform(3)}"})
  end

  def vote_number(conn, %{"vote_number" => vote_number}) do
    create(conn, %{"citizen_id" => :rand.uniform(69_000_000), "vote_number" => "N#{vote_number}"})
  end

  def vote_async(conn, _) do
    task = Task.async(fn ->
      citizen_id = :rand.uniform(69_000_000)
      vote_number = "N#{:rand.uniform(3)}"

      with {:ok, _} <- VoterRegistry.register(citizen_id),
           {:ok, _} <- Counter.increment(vote_number) do
        IO.puts("Voted with async: #{inspect(self())}")
        json(conn, %{success: true, voted: vote_number})
      else
        {:error, code} ->
          json(conn, %{success: false, error: code})
      end
    end)

    Task.await(task)
  end

  defp get_time_remaining do
    {{2019, 2, 21}, {22, 0, 0}}
    |> Timex.to_datetime()
    |> Timex.format!("{relative}", :relative)
  end
end
