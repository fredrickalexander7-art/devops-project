from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route('/')
def hello():
    environment = os.getenv('ENVIRONMENT', 'dev')
    return jsonify({
        "message": "Hello from DevOps!",
        "environment": environment,
        "status": "running"
    })

@app.route('/health')
def health():
    return jsonify({"status": "healthy"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
