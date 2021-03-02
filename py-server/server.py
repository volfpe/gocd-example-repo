from flask import Flask
from predictor import generate_name
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, ' + generate_name() + '!'