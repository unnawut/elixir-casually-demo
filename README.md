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
  - Average response time:  2.3539 ms
  - Min response time:      1 ms
  - 75th percentile:        3 ms
  - 90th percentile:        3 ms
  - 95th percentile:        4 ms
  - Max response time:      29 ms
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
  - Average response time:  3.5105 ms
  - Min response time:      1 ms
  - 75th percentile:        4 ms
  - 90th percentile:        5 ms
  - 95th percentile:        6 ms
  - Max response time:      93 ms
```

#### Elixir + Phoenix @ 5000 req/s

```
Test setup:
  - Rate:            5000 req/s
  - Duration:        10 seconds
  - Total requests:  50000 requests

Results:
  - Average response time:  4.64306 ms
  - Min response time:      0 ms
  - 75th percentile:        5 ms
  - 90th percentile:        7 ms
  - 95th percentile:        8 ms
  - Max response time:      96 ms
```

#### Ruby @ 5000 req/s

```
Test setup:
  - Rate:            5000 req/s
  - Duration:        10 seconds
  - Total requests:  50000 requests

Results:
  - Average response time:  5.31182 ms
  - Min response time:      1 ms
  - 75th percentile:        6 ms
  - 90th percentile:        8 ms
  - 95th percentile:        11 ms
  - Max response time:      120 ms
```

#### Elixir + Phoenix @ 6000 req/s

```
Test setup:
  - Rate:            6000 req/s
  - Duration:        10 seconds
  - Total requests:  60000 requests

Results:
  - Average response time:  2.5674 ms
  - Min response time:      0 ms
  - 75th percentile:        2 ms
  - 90th percentile:        3 ms
  - 95th percentile:        4 ms
  - Max response time:      144 ms
```

#### Ruby @ 6000 req/s

```
Test setup:
  - Rate:            6000 req/s
  - Duration:        10 seconds
  - Total requests:  60000 requests

Results:
  - Average response time:  8.98935 ms
  - Min response time:      1 ms
  - 75th percentile:        10 ms
  - 90th percentile:        15 ms
  - 95th percentile:        19 ms
  - Max response time:      126 ms
```

#### Elixir + Phoenix @ 7000 req/s

```
Test setup:
  - Rate:            7000 req/s
  - Duration:        10 seconds
  - Total requests:  70000 requests

Results:
  - Average response time:  3.9796428571428573 ms
  - Min response time:      0 ms
  - 75th percentile:        4 ms
  - 90th percentile:        6 ms
  - 95th percentile:        8 ms
  - Max response time:      167 ms
```

#### Ruby @ 7000 req/s

```
Test setup:
  - Rate:            7000 req/s
  - Duration:        10 seconds
  - Total requests:  70000 requests

Results:
  - Average response time:  18.74767142857143 ms
  - Min response time:      1 ms
  - 75th percentile:        23 ms
  - 90th percentile:        31 ms
  - 95th percentile:        35 ms
  - Max response time:      146 ms
```

#### Elixir + Phoenix @ 8000 req/s

```
Test setup:
  - Rate:            8000 req/s
  - Duration:        10 seconds
  - Total requests:  80000 requests

Results:
  - Average response time:  8.44565 ms
  - Min response time:      0 ms
  - 75th percentile:        10 ms
  - 90th percentile:        16 ms
  - 95th percentile:        21 ms
  - Max response time:      209 ms
```

#### Ruby @ 8000 req/s

```
Test setup:
  - Rate:            8000 req/s
  - Duration:        10 seconds
  - Total requests:  80000 requests

Results:
  - Average response time:  33.997925 ms
  - Min response time:      1 ms
  - 75th percentile:        42 ms
  - 90th percentile:        51 ms
  - 95th percentile:        59 ms
  - Max response time:      166 ms
```

#### Elixir + Phoenix @ 9000 req/s

```
Test setup:
  - Rate:            9000 req/s
  - Duration:        10 seconds
  - Total requests:  90000 requests

Results:
  - Average response time:  18.936433333333333 ms
  - Min response time:      0 ms
  - 75th percentile:        27 ms
  - 90th percentile:        37 ms
  - 95th percentile:        44 ms
  - Max response time:      255 ms
```

#### Ruby @ 9000 req/s

```
Test setup:
  - Rate:            9000 req/s
  - Duration:        10 seconds
  - Total requests:  90000 requests

Results:
  - Average response time:  55.67016666666667 ms
  - Min response time:      1 ms
  - 75th percentile:        67 ms
  - 90th percentile:        82 ms
  - 95th percentile:        92 ms
  - Max response time:      1182 ms
```

#### Elixir + Phoenix @ 10000 req/s

```
Test setup:
  - Rate:            10000 req/s
  - Duration:        10 seconds
  - Total requests:  100000 requests

Results:
  - Average response time:  33.39275 ms
  - Min response time:      0 ms
  - 75th percentile:        48 ms
  - 90th percentile:        67 ms
  - 95th percentile:        83 ms
  - Max response time:      275 ms
```

#### Ruby @ 10000 req/s

```
Test setup:
  - Rate:            10000 req/s
  - Duration:        10 seconds
  - Total requests:  100000 requests

Results:
  - Average response time:  138.56116 ms
  - Min response time:      1 ms
  - 75th percentile:        114 ms
  - 90th percentile:        152 ms
  - 95th percentile:        1038 ms
  - Max response time:      7227 ms
```
