defmodule ElixirDemoWeb.MainController do
  use ElixirDemoWeb, :controller

  def index(conn, _attrs) do
    text(conn, "Hello world.")
  end
end
