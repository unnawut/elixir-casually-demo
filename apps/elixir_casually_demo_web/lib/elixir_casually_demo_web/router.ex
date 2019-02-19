defmodule ElixirCasuallyDemoWeb.Router do
  use ElixirCasuallyDemoWeb, :router

  scope "/", ElixirCasuallyDemoWeb do
    get("/", HelloController, :index)

    get("/votes", VoteController, :index)
    post("/votes", VoteController, :create)
  end
end
