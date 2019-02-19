defmodule ElixirCasuallyDemoWeb.HelloController do
  use ElixirCasuallyDemoWeb, :controller

  def index(conn, _attrs) do
    text(conn, "Hello world.")
  end
end
