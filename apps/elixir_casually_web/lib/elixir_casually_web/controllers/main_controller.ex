defmodule ElixirCasuallyWeb.MainController do
  use ElixirCasuallyWeb, :controller

  def index(conn, _attrs) do
    html(conn, """
      <html>
        <head>
          <title>ElixirCasually Vote Me</title>
          <style>
            a {
              color: blue;
            }
          </style>
        </head>
        <body>
          <h1>ElixirCasually Vote Me</h1>
          <h2>Be nice</h2>
          <ul>
            <li><a href="vote/1">Vote N1</a></li>
            <li><a href="vote/2">Vote N2</a></li>
            <li><a href="vote/3">Vote N3</a></li>
            <li><a href="vote/async">Vote via Task.async()</a></li>
            <li><a href="vote/genserver">Vote via GenServer</a></li>
            <li><a href="votes">Vote summary</a></li>
          </ul>
          <h2>Destroy things</h2>
          <ul>
            <li><a href="crash/voter">Crash Voter</a></li>
            <li><a href="crash/counter">Crash Counter</a></li>
            <li><a href="crash">Crash Controller</a></li>
            <li><a href="crash/sleep">Sleep 5s then crash</a></li>
          </ul>
          <h2>References</h2>
          <ul>
            <li><a href="slides">View slides</a></li>
            <li><a href="https://github.com/unnawut/elixir-casually-demo">View source</a></li>
          </ul>
        </body>
      </html>
      """)
  end

  def slides(conn, _) do
    redirect(conn, to: "/slides/index.html")
  end
end
