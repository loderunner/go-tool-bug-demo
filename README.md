# First run of `go tool -n` returns a temporary path

This repo demoes a bug in the `go tool -n` command. The first execution of
`go tool -n` returns a temporary path. The second execution of `go tool -n`
returns the definitive path. The subsequent executions of `go tool -n` return
the definitive path.

Run the script in [`demo.sh`](./demo.sh) to see the bug in action.

Note that the first execution of `go tool -n` takes much longer than subsequent
executions. This is probably due to the first run requiring compilation, which
could also account for the executable being found in a temporary compilation
path.

Also note that the issue appears for different tools, indicating an issue in the
`go tool` command, rather than in tool dependencies.

## Demo output

```
Run #1 (stringer):
/var/folders/sw/bjt5x2wn21l9fjxk70thrrqh0000gn/T/go-build702337545/b001/exe/stringer
Run #2 (stringer):
/Users/loderunner/Library/Caches/go-build/8f/8fd54ef485dd7e058841c0c52af8424d052ff8282ea1bb92d6ced72314a50cd1-d/stringer
Run #3 (stringer):
/Users/loderunner/Library/Caches/go-build/8f/8fd54ef485dd7e058841c0c52af8424d052ff8282ea1bb92d6ced72314a50cd1-d/stringer
--------------------------------
Run #1 (protoc-gen-go):
/var/folders/sw/bjt5x2wn21l9fjxk70thrrqh0000gn/T/go-build1598498874/b001/exe/protoc-gen-go
Run #2 (protoc-gen-go):
/Users/loderunner/Library/Caches/go-build/ec/ece33d478198e861f397bc9fc171b84961bbf35db040aa6f55df0cd3830cf9fa-d/protoc-gen-go
Run #3 (protoc-gen-go):
/Users/loderunner/Library/Caches/go-build/ec/ece33d478198e861f397bc9fc171b84961bbf35db040aa6f55df0cd3830cf9fa-d/protoc-gen-go
```
