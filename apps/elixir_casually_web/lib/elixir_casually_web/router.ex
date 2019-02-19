defmodule ElixirCasuallyWeb.Router do
  use ElixirCasuallyWeb, :router

  scope "/", ElixirCasuallyWeb do
    get("/", HelloController, :index)

    get("/votes", VoteController, :index)
    post("/votes", VoteController, :create)
  end
end
