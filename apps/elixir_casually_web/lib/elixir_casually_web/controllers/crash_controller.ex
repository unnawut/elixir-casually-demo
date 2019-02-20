defmodule ElixirCasuallyWeb.CrashController do
  use ElixirCasuallyWeb, :controller

  def total(conn, _attrs) do
    _ = 1/0
    json(conn, %{success: true})
  end

  def voter(conn, _attrs) do
    ElixirCasually.VoterRegistry.crash()
    json(conn, %{success: true})
  end

  def counter(conn, _attrs) do
    ElixirCasually.Counter.crash()
    json(conn, %{success: true})
  end
end
