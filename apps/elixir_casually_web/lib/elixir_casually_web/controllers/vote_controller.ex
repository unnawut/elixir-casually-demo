defmodule ElixirCasuallyWeb.VoteController do
  use ElixirCasuallyWeb, :controller
  alias ElixirCasually.{VoteCountRegistry, VoterRegistry}

  def index(conn, _attrs) do
    result =
      %{}
      |> Map.put(:counts, VoteCountRegistry.all())
      |> Map.put(:voters, VoterRegistry.all())
      |> Map.put(:time_remaining, get_time_remaining())
      |> Map.put(:success, true)

    json(conn, result)
  end

  def create(conn, %{"citizen_id" => cid, "vote_number" => partynum}) do
    with {:ok, _} <- VoterRegistry.register(cid),
         {:ok, _} <- VoteCountRegistry.increment(partynum) do
      json(conn, %{success: true})
    else
      {:error, code} ->
        json(conn, %{success: false, error: code})
    end
  end

  defp get_time_remaining do
    {{2019, 2, 21}, {22, 0, 0}}
    |> Timex.to_datetime()
    |> Timex.format!("{relative}", :relative)
  end
end
