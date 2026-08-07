from app import app


def test_home():
    client = app.test_client()
    response = client.get("/")

    assert response.status_code == 200

    data = response.get_json()

    assert data["message"] == "Welcome to DevSecOps Pipeline"
    assert data["status"] == "Application Running"


def test_health():
    client = app.test_client()
    response = client.get("/health")

    assert response.status_code == 200

    data = response.get_json()

    assert data["status"] == "Healthy"