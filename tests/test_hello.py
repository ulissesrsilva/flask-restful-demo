import os
import tempfile
from flask import Flask
from controllers import helloController
from flask_restful import Api

import pytest
from flask_sqlalchemy import SQLAlchemy

@pytest.fixture
def app():
    app = Flask("TEST_APP")
    db_fd, app.config['SQLALCHEMY_DATABASE_URI'] = tempfile.mkstemp()
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
    api = Api(app)
    api.add_resource(helloController.HelloController, '/api/hello')
    db = SQLAlchemy(app)

    app.config['TESTING'] = True

    with app.app_context():
        db.init_app(app)

    yield app

    os.close(db_fd)
    os.unlink(app.config['SQLALCHEMY_DATABASE_URI'])

@pytest.fixture
def client(app):
    """A test client for the app."""
    return app.test_client()

@pytest.fixture
def runner(app):
    """A test runner for the app's Click commands."""
    return app.test_cli_runner()


def test_hello_fail(client):
    """A test runner for the app's Hello error."""
    response = client.get('/hello')
    assert response.status_code == 404

def test_hello_success(client):
    """A test runner for the app's Hello Success."""
    response = client.get('/api/hello')
    assert response.status_code == 200

