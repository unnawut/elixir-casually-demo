# ElixirDemo.Umbrella

## Instructions

On server:

```shell
git clone git@github.com:unnawut/elixir-demo.git
cd elixir-demo/
chmod u+x installer.sh server.sh
./installer.sh
```

On test runner:

```shell
git clone git@github.com:unnawut/elixir-demo.git
cd elixir-demo/
chmod u+x installer.sh runner.sh
TARGET_BASE_URL=YOUR_SERVER_BASE_URL_HERE ./runner.sh
```

## Things to demo (hopefully)

- Pipes
- Pattern matching
- Umbrella & subapps
- GenServer
- Swarm & clustering
