# Game of Life in Go

This is a simple implementation of the Game of Life in go. 

## Building

You need to have `go` installed on your computer. See [go installation](https://golang.org/dl/) for help on your specific computer. 

After `go` is installed, you can use the `Makefile` included in this repository to build and run the application.

### Building
```bash
make build
```

This will generate a `main` executable that you run via `./main`. It has the following configuration properties:

```bash
./main -rows=<number-of-rows> -cols=<number-of-cols> -generations=<number-of-generations-to-create> -propability=<decimal-of-the-probability-a-cell-alive-on-first-generation>
```

You can also use `./main -h`

### Running
```bash
make run
```

This will run the program as if run via the following command
```bash
./main -rows=40 -cols=40 -generations=200 -propability=.619
```

