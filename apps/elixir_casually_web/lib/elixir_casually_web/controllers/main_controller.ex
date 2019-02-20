defmodule ElixirCasuallyWeb.MainController do
  use ElixirCasuallyWeb, :controller

  def index(conn, _attrs) do
    html(conn, """
      <html>
        <head>
          <title>ElixirCasually Voter</title>
        </head>
        <body>
          <ul>
            <li><a href="votes">Vote Summary</a></li>
            <li><a href="vote_random">Vote Randomly</a></li>
            <li><a href="crash/voter">Crash Voter</a></li>
            <li><a href="crash/counter">Crash Counter</a></li>
            <li><a href="crash">Crash Controller</a></li>
          </ul>
        </body>
      </html>
      """)
  end
end
