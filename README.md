# ElixirCasually.Umbrella

## Instructions

1. On server:

```shell
git clone git@github.com:unnawut/elixir-demo.git
cd elixir-demo/
chmod u+x installer.sh server.sh
./installer.sh
./server.sh
```

2. On test runner (master):

```shell
git clone git@github.com:unnawut/elixir-demo.git
cd elixir-demo/
chmod u+x installer.sh runner-master.sh
./runner-master.sh
```

Then once inside `iex`, execute:

```elixir
Chaperon.Master.start()
```

3. On test runners (slave):

```shell
git clone git@github.com:unnawut/elixir-demo.git
cd elixir-demo/
chmod u+x installer.sh runner-slave.sh
./runner-slave.sh
```

4. Configure the number of clients:

```elixir
Application.put_env(:load_tester, :num_clients, 500)
```

5. Run the test from the master:

```elixir
LoadTester.run("http://server-1:5000")
```

## Test results

### Setup
- server-1: n1-standard-2 (2 vCPUs, 7.5 GB memory)
- runner-1: n1-standard-1 (1 vCPU, 3.75 GB memory)
- runner-2: n1-standard-1 (1 vCPU, 3.75 GB memory)
- runner-3: n1-standard-1 (1 vCPU, 3.75 GB memory)
- runner-4: n1-standard-1 (1 vCPU, 3.75 GB memory)
- runner-5: n1-standard-1 (1 vCPU, 3.75 GB memory)

### Summarized results

| Req/s | Min - Ex | Min - Ruby | 95th - Ex | 95th - Rb | Max - Ex | Max - Rb |
| ----: | -------: | ---------: | --------: | --------: | -------: | -------: |
| 2,000 | 0 ms | 1 ms | 3 ms | 4 ms | 50 ms | 29 ms |
| 3,000 | 0 ms | 1 ms | 3 ms | 5 ms | 149 ms | 74 ms |
| 4,000 | 0 ms | 1 ms | 5 ms | 6 ms | 177 ms | 93 ms |
| 5,000 | 0 ms | 1 ms | 8 ms | 11 ms | 96 ms | 120 ms |
| 6,000 | 0 ms | 1 ms | 4 ms | 19 ms | 144 ms | 126 ms |
| 7,000 | 0 ms | 1 ms | 8 ms | 35 ms | 167 ms | 146 ms |
| 8,000 | 0 ms | 1 ms | 21 ms | 59 ms | 209 ms | 166 ms |
| 9,000 | 0 ms | 1 ms | 44 ms | 92 ms | 255 ms | 1,182 ms |
| 10,000 | 0 ms | 1 ms | 83 ms | 1,038 ms | 275 ms | 7,227 ms |

See [Raw results](raw_results.md) for more details.

## Things to demo (hopefully)

- [x] Pipes
- [x] Immutability
- [x] Pattern matching & guards
- [x] Umbrella apps & subapps
- [x] GenServer
- [x] Supervisor
- [ ] Swarm & clustering, auto spin up lots of load runners + node auto-discovery + test running + spin down

## Noteworthy

- Elixir core is written mostly (90%) in Elixir: https://github.com/elixir-lang/elixir
- https://www.thairath.co.th/content/1498811?fbclid=IwAR3IM7bMWpW6iMlxuZeFp9w_DOqyrUOV8gtTIXJDtfhMv4E98zDmhxVPhjI

## Credits

Thanks to these fellas for making this meetup happen and their support in building this demo:

- Adhapol Vinn
- Pallop Chao
- [Panumarch Anantachaiwanich](https://github.com/turboza)
- Pii Boonchokchuay
- Pongsatorn Paewsoongnern
- Ranatchai Chernbamrung
- Supanat IBoss Potiwarakorn
- Wasawat Somno
