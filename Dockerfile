FROM alpine:3.22.2

# Versions
ARG PROTOC_VERSION=27.1

# Install system dependencies
RUN apk update && \
    apk add --no-cache \
    bash \
    curl \
    unzip \
    git \
    python3 \
    py3-pip \
    build-base

# Install protoc
RUN curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip && \
    unzip protoc-${PROTOC_VERSION}-linux-x86_64.zip -d /usr/local && \
    rm protoc-${PROTOC_VERSION}-linux-x86_64.zip

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/root/.local/bin:${PATH}"

RUN poetry config virtualenvs.create false

# Set working directory
WORKDIR /build

# Copy Poetry files
COPY pyproject.toml poetry.lock README.md /build

# Install Python dependencies
RUN poetry install --no-root --no-interaction --no-ansi

# Copy scripts to path
COPY scripts/ /usr/local/bin/

# Make scripts executable
RUN chmod +x /usr/local/bin/*.sh

CMD ["/bin/bash"]