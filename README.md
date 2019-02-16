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
chmod u+x installer.sh runner-1.sh
./runner-1.sh
```

Then once inside `iex`, execute:

```elixir
Chaperon.Master.start()
```

3. On test runners (slave):

```shell
git clone git@github.com:unnawut/elixir-demo.git
cd elixir-demo/
chmod u+x installer.sh runner-*.sh
./runner-<your_runner_number>.sh
```

4. Run the test from the master:

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

### Results

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

```
Test setup:
  - Rate:            7000 req/s
  - Duration:        10 seconds
  - Total requests:  70000 requests

Results:
  - Average response time:  44.12037142857143 ms
  - Min response time:      0 ms
  - 75th percentile:        57 ms
  - 90th percentile:        78 ms
  - 95th percentile:        104 ms
  - Max response time:      389 ms
```

```
Test setup:
  - Rate:            8000 req/s
  - Duration:        10 seconds
  - Total requests:  80000 requests

Results:
  - Average response time:  358.1895625 ms
  - Min response time:      0 ms
  - 75th percentile:        626 ms
  - 90th percentile:        849 ms
  - 95th percentile:        933 ms
  - Max response time:      1153 ms
```

```
Test setup:
  - Rate:            9000 req/s
  - Duration:        10 seconds
  - Total requests:  90000 requests

Results:
  - Average response time:  586.6961 ms
  - Min response time:      0 ms
  - 75th percentile:        1026 ms
  - 90th percentile:        1645 ms
  - 95th percentile:        2045 ms
  - Max response time:      2291 ms
```
