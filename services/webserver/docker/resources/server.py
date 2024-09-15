from flask import Flask, jsonify
import requests
import threading
import time

PORT = 5000

app = Flask(__name__)
update_interval = 10  # in seconds
API_URL = "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD"

bitcoin_values = []
max_values = 6  # Number of values to keep for the last 10 minutes


def get_bitcoin_price():
    try:
        response = requests.get(API_URL)
        data = response.json()
        if 'USD' in data:
            return data['USD']
        else:
            return None
    except Exception as e:
        print("Error fetching Bitcoin price:", e)
        return None
    
# def update_bitcoin_price():
#     global bitcoin_price
#     while True:
#         bitcoin_price = get_bitcoin_price()
#         time.sleep(update_interval)


def update_bitcoin_price():
    while True:
        bitcoin_price = get_bitcoin_price()
        if bitcoin_price is not None:
            bitcoin_values.append(bitcoin_price)
            if len(bitcoin_values) > max_values:
                bitcoin_values.pop(0)  # Remove oldest value
        time.sleep(update_interval)

@app.route('/bitcoin-price', methods=['GET'])
def get_bitcoin_price_route():
    if bitcoin_values:
        avg_price = sum(bitcoin_values) / len(bitcoin_values)
        return jsonify({'average_price': avg_price, 'last_10_minutes': bitcoin_values})
    else:
        return jsonify({'error': 'Failed to fetch Bitcoin price'}), 500
    
if __name__ == '__main__':
    update_thread = threading.Thread(target=update_bitcoin_price)
    update_thread.daemon = True
    update_thread.start()
    app.run(debug=True,host="0.0.0.0", port=PORT)