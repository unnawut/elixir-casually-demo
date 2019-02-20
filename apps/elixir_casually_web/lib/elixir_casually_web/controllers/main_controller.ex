defmodule ElixirCasuallyWeb.MainController do
  use ElixirCasuallyWeb, :controller

  def index(conn, _attrs) do
    html(conn, """
      <html>
        <head>
          <title>ElixirCasually Vote Me</title>
        </head>
        <body>
          <h1>ElixirCasually Vote Me</h1>
          <h2>Be nice</h2>
          <ul>
            <li><a href="votes">Vote summary</a></li>
            <li><a href="vote_random">Vote randomly</a></li>
            <li><a href="slides">View slides</a></li>
          </ul>
          <h2>Destroy things</h2>
          <ul>
            <li><a href="crash/voter">Crash Voter</a></li>
            <li><a href="crash/counter">Crash Counter</a></li>
            <li><a href="crash">Crash Controller</a></li>
            <li><a href="crash/sleep">Sleep 5s then crash</a></li>
          </ul>
        </body>
      </html>
      """)
  end

  def slides(conn, _) do
    redirect(conn, to: "/slides/index.html")
  end
end
