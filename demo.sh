#!/usr/bin/env sh
set -eo pipefail

# Clean up the cache
go clean -cache
go clean -modcache

# Download the dependencies
go mod download

# First run (stringer)
echo "Run #1 (stringer): "
go tool -n stringer

# Second run (stringer)
echo "Run #2 (stringer): "
go tool -n stringer

# Third run
echo "Run #3 (stringer): "
go tool -n stringer

echo "--------------------------------"

# First run (protoc-gen-go)
echo "Run #1 (protoc-gen-go): "
go tool -n protoc-gen-go

# Second run (protoc-gen-go)
echo "Run #2 (protoc-gen-go): "
go tool -n protoc-gen-go

# Third run (protoc-gen-go)
echo "Run #3 (protoc-gen-go): "
go tool -n protoc-gen-go



