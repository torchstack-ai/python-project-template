# Torchstack Project Standards

## Project Context
This is a Torchstack client project. We build backend services, AI/ML pipelines, and cloud infrastructure.

## Code Standards
- Python 3.12+, type-annotated, Ruff-formatted (line length 100)
- All functions must have docstrings
- Tests required for any new feature (pytest, 80% coverage minimum)
- Infrastructure changes require Terraform plan review before merge

## Architecture Patterns
- FastAPI for HTTP services, Pydantic v2 for data validation
- Async-first where I/O-bound
- 12-factor app configuration (env vars, no hardcoded secrets)
- PostgreSQL via psycopg for data persistence

## AI Assistant Guidelines
- Always include type hints on all function signatures
- When generating Terraform, follow the module structure in `infra/`
- When generating tests, use pytest fixtures and parametrize for edge cases
- Always run `ruff check` and `mypy` before suggesting code is complete
- Flag any hardcoded credentials or secrets immediately

## Git Workflow
- Branch from `develop`, PR into `develop`, release merges to `main`
- Commit messages: conventional commits (feat:, fix:, chore:, docs:)
- PRs require passing CI + 1 approval

## Directory Layout
- `app/` — FastAPI application (routes, middleware, main entrypoint)
- `src/` — Shared library code (business logic, utilities)
- `tests/` — All test files
- `infra/` — Terraform infrastructure (when applicable)
