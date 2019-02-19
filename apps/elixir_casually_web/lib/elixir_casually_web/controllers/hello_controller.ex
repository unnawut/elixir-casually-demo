defmodule ElixirCasuallyWeb.HelloController do
  use ElixirCasuallyWeb, :controller

  def index(conn, _attrs) do
    text(conn, "Hello world.")
  end
end
