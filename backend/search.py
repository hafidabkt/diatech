from flask import Flask, request, jsonify, abort

app = Flask(__name__)

@app.route('/search', methods=['GET'])
def search():
    query = request.args.get('query')
    if not query:
        abort(400, description="Query parameter is missing")
    
    # Perform any operation with the query here (e.g., logging, search, etc.)
    
    # Respond with a thank you message
    return jsonify({"message": "Thank you"})

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8000)
