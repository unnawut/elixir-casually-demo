defmodule ElixirCasuallyWeb.VoteController do
  use ElixirCasuallyWeb, :controller
  alias ElixirCasually.{VoteCountRegistry, VoterRegistry}

  def index(conn, _attrs) do
    vote_counts = VoteCountRegistry.all()

    json(conn, vote_counts)
  end

  def create(conn, %{"citizen_id" => cid, "vote_number" => partynum}) do
    with {:ok, _} <- VoterRegistry.register(cid),
         {:ok, count} <- VoteCountRegistry.increment(partynum) do
      json(conn, %{status: true})
    else
      {:error, code} ->
        json(conn, %{status: false, error: code})
    end
  end
end
