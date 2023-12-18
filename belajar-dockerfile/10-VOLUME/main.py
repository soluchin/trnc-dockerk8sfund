from flask import Flask, jsonify, request
from datetime import datetime
import os

# creating a Flask app 
app = Flask(__name__)
port = os.environ.get('APP_PORT') or 5000

if not os.path.exists('logs'):
   os.makedirs('logs')
   print(f'create logs directory')

# route
@app.route('/', methods = ['GET', 'POST']) 
def home(): 
    if(request.method == 'GET'): 
        return 'hello world!'
  
@app.route('/<string:name>', methods = ['GET']) 
def logs(name):
    with open(f'./logs/log.txt', 'a') as file:
        file.write(f'{name} was logging - {datetime.now()}\n')
    return f'hello {name}'

# driver function 
if __name__ == '__main__': 
    app.run(debug = True, port=port, host='0.0.0.0')