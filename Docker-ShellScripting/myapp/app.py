from flask import Flask
from flaskext.mysql import MySQL

app = Flask(__name__)


user="bharath"
ip="172.17.0.3"
password="redhat"
dbname="database1"
app.config['MYSQL_DATABASE_USER'] = user
app.config['MYSQL_DATABASE_HOST'] = ip
app.config['MYSQL_DATABASE_PASSWORD'] = password
app.config['MYSQL_DATABASE_DB'] = dbname


mysql = MySQL()

mysql.init_app(app)

@app.route("/")
def be():
    conn = mysql.connect()
    cursor=conn.cursor()
    cursor.execute("select * from students")
    data = cursor.fetchall()
    return str(data)

if __name__ == "__main__":
    app.run(host='0.0.0.0',port=5000,debug=True)


