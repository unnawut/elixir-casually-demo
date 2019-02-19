defmodule ElixirCasuallyWeb.VoteController do
  use ElixirCasuallyWeb, :controller
  alias ElixirCasually.Vote

  def index(conn, _attrs) do
    text(conn, "")
  end

  def create(conn, attrs) do
    citizen_id = attrs["citizen_id"]
    vote_number = attrs["vote_number"]

    %Vote{}
  end
end
