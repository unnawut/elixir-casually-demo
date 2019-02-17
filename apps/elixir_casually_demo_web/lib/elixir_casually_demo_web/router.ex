defmodule ElixirCasuallyDemoWeb.Router do
  use ElixirCasuallyDemoWeb, :router

  scope "/", ElixirCasuallyDemoWeb do
    get("/", MainController, :index)
  end
end
