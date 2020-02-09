from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
db = SQLAlchemy(app)

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///f/Projects/DB/sdc.db'

class FileContents(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	age = db.Column(db.Integer)
	gender = db.Column(db.Integer)
	localization = db.Column(db.Integer)
	image = db.Column(db.LargeBinary)
	label = db.Column(db.ARRAY(db.FLOAT))
@app.route('/')
def index():
	return render_template('index.html')

@app.route('/upload', methods=['POST'])
def upload():
	file = request.files['inputFile']
	print(request.values)
	age = request.form.get('age')
	gender = request.form.get('gender')
	localization = request.form.get('localization')

	return "1"
if __name__ == "__main__":
	app.run(debug=True)