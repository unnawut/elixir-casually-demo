defmodule ElixirDemoWeb.Router do
  use ElixirDemoWeb, :router

  scope "/", ElixirDemoWeb do
    get("/", MainController, :index)
  end
end
