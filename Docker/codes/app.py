from flask import Flask
import sys

app=Flask(__name__)

data=sys.argv




@app.route("/info")
def cat():
    return "welcome to Bharath.."

app.run(host='0.0.0.0')
