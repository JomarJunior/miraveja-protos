#!/bin/bash
set -e

PROTO_DIR=./protos
OUT_DIR=/tmp

python3 -m grpc_tools.protoc \
    -I=$PROTO_DIR \
    --python_out=$OUT_DIR \
    --grpc_python_out=$OUT_DIR \
    $(find $PROTO_DIR -name "*.proto")
