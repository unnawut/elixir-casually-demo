defmodule ElixirCasuallyWeb.Router do
  use ElixirCasuallyWeb, :router

  scope "/", ElixirCasuallyWeb do
    get("/", HelloController, :index)

    get("/votes", VoteController, :index)
    post("/votes", VoteController, :create)

    get("/crash", CrashController, :total)
    get("/crash/voter", CrashController, :voter)
    get("/crash/vote_count", CrashController, :vote_count)
  end
end
