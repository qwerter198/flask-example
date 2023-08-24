# -*- coding: utf-8 -*-
from flask import Flask
from flask_cors import CORS

app = Flask(__name__)
CORS(app, supports_credentials=True, cors_allowed_origins='*')


@app.route('/')
def index() -> str:
    return 'Hello, world! v1.0.4'


if __name__ == '__main__':
    app.run(threaded=True, use_reloader=False, host='0.0.0.0',
            port=5000, debug=False)  # use_reloader=True,
