#!/bin/sh
set -e

protoc -I ./ -o message.desc ./message.proto

# The bug is producible locally. The user provided this command for podman as well:
# podman run --rm -it \
#	 -v ./message.desc:/message.desc \
#	 -v ./vector.yaml:/etc/vector/vector.yaml \
#	 docker.io/timberio/vector:0.34.1-debian

CONFIG_FILE="$(dirname "$0")"/config.yaml
# Set the path to the Vector repo root.
cd ../../../vector
VECTOR_LOG=debug cargo run --package vector --bin vector -- --config "${CONFIG_FILE}"
cd -
