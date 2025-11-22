# 📦 miraveja-protos

[![Python Version](https://img.shields.io/badge/python-3.10%2B-blue.svg)](https://www.python.org/downloads/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Code Style](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Status](https://img.shields.io/badge/status-active-brightgreen.svg)](#-development-status)
[![CI](https://github.com/JomarJunior/miraveja-protos/actions/workflows/ci.yml/badge.svg)](https://github.com/JomarJunior/miraveja-protos/actions)

> Protobuf definitions and generated bindings for the Miraveja ecosystem

**Etymology**: Protocol buffers (protos) used throughout the Miraveja microservices and SDKs

## 🚀 Overview

`miraveja-protos` centralizes the project's Protocol Buffer definitions and the generated language bindings used by services and SDKs across the Miraveja ecosystem. It contains the canonical `.proto` sources (organized by domain/version) and generated Python artifacts used by consumers in this repository.

This repo is intentionally minimal: keep `.proto` files authoritative, and keep generated code under `src/miraveja_protos/generated` so consumers can import pre-built bindings when needed.

## ✨ Key Features

- 📂 Canonical `.proto` sources organized by domain and version
- 🔁 Reproducible code generation workflow (scripts and Docker-friendly tooling)
- 🧩 Python bindings included (ready-to-import generated modules)
- 🔒 Linting and validation support with `protolint` (config in `protolint.yaml`)
- ⚙️ CI-friendly: generation steps are small and automatable

## 🛠️ Technology Stack

### Core

- Protocol Buffers (`.proto`) — canonical schema format
- `protoc` — protocol buffer compiler
- Python 3.10+ — generated Python bindings live in `src/miraveja_protos/generated`

### Development / Tooling

- `protolint` — proto linter (configured with `protolint.yaml`)
- `docker` / `docker-compose` — optional reproducible generation environment
- `pre-commit`, `black`, `isort`, `pylint`, `mypy` — code quality and checks (used across Miraveja projects)

## 📁 Repository Layout

Top-level layout (relevant parts):

```
.
├── protos/
│   ├── common/
│   │   └── v0/greeter.proto
│   └── model/
│       └── v1/
│           ├── image_caption.proto
│           ├── image_embeddings.proto
│           ├── image_generation.proto
│           ├── image_safety.proto
│           ├── image_tagging.proto
│           ├── image_title.proto
│           ├── post_text.proto
│           └── text_embeddings.proto
├── scripts/
│   └── generate_python.sh         # helper to generate python bindings
├── src/
│   └── miraveja_protos/
│       └── generated/             # generated Python bindings (checked-in)
├── protolint.yaml
├── Dockerfile
├── docker-compose.yml
└── README.md
```

## 🎯 Getting Started

### Prerequisites

- `protoc` (for local generation) or Docker (recommended for reproducible builds)
- Python 3.10+ to run tests or import generated bindings

### Generate Python bindings

Prefer using the provided script which wraps `protoc` invocation and keeps generation consistent.

Unix / WSL / macOS (recommended):

```bash
./scripts/generate_python.sh
```

Windows PowerShell (if `protoc` is installed):

```powershell
# run protoc manually (example)
protoc -I=protos \
  --python_out=src/miraveja_protos/generated \
  --grpc_python_out=src/miraveja_protos/generated \
  protos/model/v1/*.proto
```

If you prefer Docker for reproducibility, use the `Dockerfile` or `docker-compose` so the host doesn't need `protoc` installed.

### Lint `.proto` files

Use `protolint` to validate proto style and conventions:

```bash
# install protolint (or use docker image)
protolint lint -config protolint.yaml protos/**/*.proto
```

## 📦 Generated code

Generated Python modules are placed under `src/miraveja_protos/generated`.

Keep generated code in sync with `.proto` sources — prefer small, focused commits for schema changes and generated updates.

## 🧪 Testing & CI

This repository's CI should validate the following (examples used across Miraveja projects):

- Run `protolint` on `protos/`
- Ensure generated bindings import cleanly (run a small smoke test)

## 🤝 Contributing

Contributions are welcome. If you add or change any `.proto` files:

1. Update the affected `.proto` under `protos/`.
2. Run the generation script and confirm generated bindings are updated.
3. Run `protolint` and fix any linter issues.
4. Open a PR with schema and generated changes in the same branch.

Development checklist (recommended):

```bash
# run lint for protos
protolint lint -config protolint.yaml protos/**/*.proto

# regenerate bindings
./scripts/generate_python.sh

# run a quick python import smoke test
python -c "import miraveja_protos.generated; print('ok')"
```

## 📄 License

This project is licensed under the MIT License - see the `LICENSE` file for details.

## 👨‍💻 Author / Contact

- **Author**: Jomar Júnior de Souza Pereira
- **Email**: <jomarjunior@poli.ufrj.br>
- **Repository**: <https://github.com/JomarJunior/miraveja-protos>

## 🔗 Related Projects

- 📝 [miraveja-log](https://github.com/JomarJunior/miraveja-log) — Logging library that provides a clean, configurable interface for application logging.
- 💉 [miraveja-di](https://github.com/JomarJunior/miraveja-di) — Dependency injection container that leverages Python's type hints for automatic dependency resolution.
- 🔐 [miraveja-authentication](https://github.com/JomarJunior/miraveja-authentication) — Authentication library that implements OAuth2/OpenID Connect standards with JWT token validation and role-based authorization.
- 🧠 [ModelMora](https://github.com/JomarJunior/ModelMora) — Microservice for managing and serving neural network models with efficient memory management and multi-protocol support.
- 🖼️ [Miraveja](https://github.com/JomarJunior/miraveja) — AI-powered image gallery designed for exploration, inspiration, and creative workflows.

---

Made with ❤️ for the Miraveja ecosystem
