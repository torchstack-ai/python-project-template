"""Tests for the FastAPI application."""

from fastapi.testclient import TestClient

from app.main import app

client = TestClient(app)


def test_healthz() -> None:
    """Test the health check endpoint returns ok."""
    response = client.get("/healthz")
    assert response.status_code == 200
    assert response.json() == {"status": "ok"}


def test_cors_headers_present() -> None:
    """Test that CORS headers are returned for allowed origins."""
    response = client.get("/healthz", headers={"Origin": "http://localhost:3000"})
    assert response.status_code == 200
    assert "access-control-allow-origin" in response.headers
