# ─────────────────────────────────────────────
# Torchstack Python Project Template
# Usage: make <target>
# ─────────────────────────────────────────────

.PHONY: setup lint format test security infra-validate infra-plan clean

# ── Setup ──
setup:  ## First-time dev environment setup
	poetry install --with dev
	pre-commit install
	@echo "✓ Dev environment ready. Pre-commit hooks installed."

# ── Code Quality ──
lint:  ## Run linter (Ruff + mypy)
	poetry run ruff check src/ app/ tests/
	poetry run mypy src/ app/ --ignore-missing-imports

format:  ## Auto-format code
	poetry run ruff check src/ app/ tests/ --fix
	poetry run ruff format src/ app/ tests/

# ── Testing ──
test:  ## Run tests with coverage
	poetry run pytest tests/ --cov=src --cov=app --cov-report=term-missing -v

test-fast:  ## Run tests excluding slow/integration
	poetry run pytest tests/ -m "not slow and not integration" -v

# ── Security ──
security:  ## Run all security scans
	poetry run bandit -r src/ app/ -c pyproject.toml
	poetry run pip-audit
	poetry run detect-secrets scan --baseline .secrets.baseline

# ── Infrastructure (if infra/ exists) ──
infra-validate:  ## Validate Terraform configs
	cd infra && terraform init -backend=false && terraform validate
	cd infra && terraform fmt -check -recursive
	checkov -d infra/ --quiet
	tfsec infra/

infra-plan:  ## Run Terraform plan (requires cloud credentials)
	cd infra && terraform init && terraform plan

infra-cost:  ## Estimate infrastructure cost changes
	infracost diff --path=infra/

# ── Cleanup ──
clean:  ## Remove generated files
	rm -rf .pytest_cache __pycache__ .mypy_cache .ruff_cache
	rm -f coverage.xml bandit-report.json
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true

# ── Help ──
help:  ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-18s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
