# Python Project Template

A Python project template with DevOps best practices, including linting, testing, and CI/CD setup.

## Features

- 🧹 Code formatting with [Black](https://github.com/psf/black)
- 📝 Import sorting with [isort](https://github.com/PyCQA/isort)
- 🔍 Linting with [flake8](https://github.com/PyCQA/flake8)
- ✅ Testing with [pytest](https://github.com/pytest-dev/pytest)
- 📊 Test coverage reporting
- 🔄 Pre-commit hooks
- 🚀 GitHub Actions CI/CD pipeline

## Setup

1. Clone this repository:
   ```bash
   git clone <your-repo-url>
   cd python-template
   ```

2. Create a virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. Install development dependencies:
   ```bash
   pip install -r requirements-dev.txt
   ```

4. Install pre-commit hooks:
   ```bash
   pre-commit install
   ```

## Usage

### Running Tests

```bash
pytest
```

### Code Formatting

```bash
# Format code with black
black .

# Sort imports with isort
isort .
```

### Linting

```bash
flake8
```

## Project Structure

```
python-template/
├── .github/
│   └── workflows/
│       └── ci.yml
├── src/
│   └── example/
│       ├── __init__.py
│       └── calculator.py
├── tests/
│   └── test_calculator.py
├── .flake8
├── .pre-commit-config.yaml
├── pyproject.toml
├── README.md
└── requirements-dev.txt
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details. 