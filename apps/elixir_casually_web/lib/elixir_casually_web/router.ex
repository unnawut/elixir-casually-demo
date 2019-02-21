defmodule ElixirCasuallyWeb.Router do
  use ElixirCasuallyWeb, :router

  scope "/", ElixirCasuallyWeb do
    get("/", MainController, :index)

    get("/votes", VoteController, :index)
    post("/votes", VoteController, :create)
    get("/vote/async", VoteController, :vote_async)
    get("/vote/genserver", VoteController, :vote_genserver)
    get("/vote/:vote_number", VoteController, :vote_number)

    get("/crash/voter", CrashController, :voter)
    get("/crash/counter", CrashController, :counter)
    get("/crash/controller", CrashController, :controller)
    get("/crash/sleep", CrashController, :sleep)

    get("/slides", MainController, :slides)
  end
end
