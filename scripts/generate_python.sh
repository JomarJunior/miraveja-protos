#!/bin/bash
set -e

PROTO_DIR=./protos
OUT_DIR=./src/miraveja_protos/generated

mkdir -p $OUT_DIR

python3 -m grpc_tools.protoc \
    -I=$PROTO_DIR \
    --python_out=$OUT_DIR \
    --grpc_python_out=$OUT_DIR \
    $(find $PROTO_DIR -name "*.proto")

# Add __init__.py files to make packages
find $OUT_DIR -type d -exec touch {}/__init__.py \;
