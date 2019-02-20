defmodule ElixirCasuallyWeb.CrashController do
  use ElixirCasuallyWeb, :controller

  def controller(_, _) do
    _ = 1/0
  end

  def voter(_, _) do
    ElixirCasually.VoterRegistry.crash()
  end

  def counter(_, _) do
    ElixirCasually.Counter.crash()
  end

  def sleep(_, _) do
    Process.sleep(5_000)
    _ = 1/0
  end
end
