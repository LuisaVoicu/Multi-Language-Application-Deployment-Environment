from flask import Flask, jsonify
import time

PORT = 8081

app = Flask(__name__)


@app.route("/")
def root():
    return jsonify({"App Status" : "Running"})

@app.route("/getTime")
def getTime():
    seconds = time.time()
    local_time = time.localtime(seconds)
    return jsonify({"Year" : local_time.tm_year,"Seconds" : seconds, "Local Time" : local_time})


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=PORT)