# ElixirDemo.Umbrella

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

## Things to demo (hopefully)

- Pipes
- Pattern matching
- Umbrella & subapps
- GenServer
- Swarm & clustering

## Test results

### Setup
- server-1: n1-standard-2 (2 vCPUs, 7.5 GB memory)
- runner-1: n1-standard-1 (1 vCPU, 3.75 GB memory)
- runner-2: n1-standard-1 (1 vCPU, 3.75 GB memory)
- runner-3: n1-standard-1 (1 vCPU, 3.75 GB memory)
- runner-4: n1-standard-1 (1 vCPU, 3.75 GB memory)

### Summarized results

| Req/s | Duration (s) | Requests | Min response time | Elixir (95th) | Ruby (95th) | Elixir (100th) | Ruby (100th)
| 2,000 | 10 | 20,000 | 3ms | 0ms

### Raw results

#### Elixir + Phoenix @ 2000 req/s

```
Test setup:
  - Rate:            2000 req/s
  - Duration:        10 seconds
  - Total requests:  20000 requests

Results:
  - Average response time:  1.65305 ms
  - Min response time:      0 ms
  - 75th percentile:        2 ms
  - 90th percentile:        2 ms
  - 95th percentile:        3 ms
  - Max response time:      50 ms
```

#### Ruby @ 2000 req/s

```
Test setup:
  - Rate:            2000 req/s
  - Duration:        10 seconds
  - Total requests:  20000 requests

Results:
  - Average response time:  2.7342 ms
  - Min response time:      1 ms
  - 75th percentile:        3 ms
  - 90th percentile:        3 ms
  - 95th percentile:        4 ms
  - Max response time:      129 ms
```

#### Elixir + Phoenix @ 3000 req/s

```
Test setup:
  - Rate:            3000 req/s
  - Duration:        10 seconds
  - Total requests:  30000 requests

Results:
  - Average response time:  2.0023333333333335 ms
  - Min response time:      0 ms
  - 75th percentile:        2 ms
  - 90th percentile:        2 ms
  - 95th percentile:        3 ms
  - Max response time:      149 ms
```

#### Ruby @ 3000 req/s

```
Test setup:
  - Rate:            3000 req/s
  - Duration:        10 seconds
  - Total requests:  30000 requests

Results:
  - Average response time:  3.4375 ms
  - Min response time:      1 ms
  - 75th percentile:        4 ms
  - 90th percentile:        4 ms
  - 95th percentile:        5 ms
  - Max response time:      74 ms
```

#### Elixir + Phoenix @ 4000 req/s

```
Test setup:
  - Rate:            4000 req/s
  - Duration:        10 seconds
  - Total requests:  40000 requests

Results:
  - Average response time:  2.948575 ms
  - Min response time:      0 ms
  - 75th percentile:        3 ms
  - 90th percentile:        4 ms
  - 95th percentile:        5 ms
  - Max response time:      177 ms
```

#### Ruby @ 4000 req/s

```
Test setup:
  - Rate:            4000 req/s
  - Duration:        10 seconds
  - Total requests:  40000 requests

Results:
  - Average response time:  5.2185 ms
  - Min response time:      1 ms
  - 75th percentile:        5 ms
  - 90th percentile:        7 ms
  - 95th percentile:        10 ms
  - Max response time:      123 ms
```

#### Elixir + Phoenix @ 5000 req/s

```
Test setup:
  - Rate:            5000 req/s
  - Duration:        10 seconds
  - Total requests:  50000 requests

Results:
  - Average response time:  12.27928 ms
  - Min response time:      0 ms
  - 75th percentile:        16 ms
  - 90th percentile:        36 ms
  - 95th percentile:        44 ms
  - Max response time:      251 ms
```

#### Ruby @ 5000 req/s

```
Test setup:
  - Rate:            5000 req/s
  - Duration:        10 seconds
  - Total requests:  50000 requests

Results:
  - Average response time:  13.71074 ms
  - Min response time:      1 ms
  - 75th percentile:        16 ms
  - 90th percentile:        29 ms
  - 95th percentile:        35 ms
  - Max response time:      151 ms
```

#### Elixir + Phoenix @ 6000 req/s

```
Test setup:
  - Rate:            6000 req/s
  - Duration:        10 seconds
  - Total requests:  60000 requests

Results:
  - Average response time:  20.1891 ms
  - Min response time:      0 ms
  - 75th percentile:        27 ms
  - 90th percentile:        38 ms
  - 95th percentile:        46 ms
  - Max response time:      305 ms
```

#### Ruby @ 6000 req/s

```
Test setup:
  - Rate:            6000 req/s
  - Duration:        10 seconds
  - Total requests:  60000 requests

Results:
  - Average response time:  23.746983333333333 ms
  - Min response time:      1 ms
  - 75th percentile:        29 ms
  - 90th percentile:        37 ms
  - 95th percentile:        42 ms
  - Max response time:      1048 ms
```

#### Elixir + Phoenix @ 7000 req/s

```
Test setup:
  - Rate:            7000 req/s
  - Duration:        10 seconds
  - Total requests:  70000 requests

Results:
  - Average response time:  15.102914285714286 ms
  - Min response time:      0 ms
  - 75th percentile:        20 ms
  - 90th percentile:        30 ms
  - 95th percentile:        35 ms
  - Max response time:      259 ms
```

#### Ruby @ 7000 req/s

```
Test setup:
  - Rate:            7000 req/s
  - Duration:        10 seconds
  - Total requests:  70000 requests

Results:
  - Average response time:  47.79398571428571 ms
  - Min response time:      1 ms
  - 75th percentile:        61 ms
  - 90th percentile:        71 ms
  - 95th percentile:        79 ms
  - Max response time:      207 ms
```

#### Elixir + Phoenix @ 8000 req/s

```
Test setup:
  - Rate:            8000 req/s
  - Duration:        10 seconds
  - Total requests:  80000 requests

Results:
  - Average response time:  31.4483625 ms
  - Min response time:      0 ms
  - 75th percentile:        45 ms
  - 90th percentile:        61 ms
  - 95th percentile:        75 ms
  - Max response time:      299 ms
```

#### Ruby @ 8000 req/s

```
Test setup:
  - Rate:            8000 req/s
  - Duration:        10 seconds
  - Total requests:  80000 requests

Results:
  - Average response time:  84.0201875 ms
  - Min response time:      1 ms
  - 75th percentile:        108 ms
  - 90th percentile:        132 ms
  - 95th percentile:        141 ms
  - Max response time:      3151 ms
```

#### Elixir + Phoenix @ 9000 req/s

```
Test setup:
  - Rate:            9000 req/s
  - Duration:        10 seconds
  - Total requests:  90000 requests

Results:
  - Average response time:  130.22454444444443 ms
  - Min response time:      0 ms
  - 75th percentile:        173 ms
  - 90th percentile:        482 ms
  - 95th percentile:        516 ms
  - Max response time:      689 ms
```

#### Ruby @ 9000 req/s

```
Test setup:
  - Rate:            9000 req/s
  - Duration:        10 seconds
  - Total requests:  90000 requests

Results:
  - Average response time:  292.67334444444447 ms
  - Min response time:      1 ms
  - 75th percentile:        225 ms
  - 90th percentile:        984 ms
  - 95th percentile:        1113 ms
  - Max response time:      7503 ms
```
