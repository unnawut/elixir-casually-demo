defmodule ElixirCasuallyWeb.Router do
  use ElixirCasuallyWeb, :router

  scope "/", ElixirCasuallyWeb do
    get("/", MainController, :index)

    get("/votes", VoteController, :index)
    post("/votes", VoteController, :create)
    get("/vote_random", VoteController, :vote_random)

    get("/crash", CrashController, :total)
    get("/crash/voter", CrashController, :voter)
    get("/crash/counter", CrashController, :counter)
  end
end
