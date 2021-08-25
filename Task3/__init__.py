from flask import Flask,request,render_template,redirect,session,url_for
import re
import random
import string
from PIL import Image, ImageDraw, ImageFont
import os

app=Flask(__name__)
app.secret_key='1234'
root_directory='/home/daemondan/onsite/Task3/'
all_codes=[]

def random_code():
	gen_code=''
	letter=string.ascii_letters
	gen_code+=''.join(random.choice(letter) for i in range(0,3))
	letter=string.digits
	gen_code+=''.join(random.choice(letter) for i in range(0,3))

	l=list(gen_code)
	random.shuffle(l)
	final_code=''.join(l)

	return final_code


def generate_captcha():
	final_code=random_code()
	filename=f'{final_code}.png'
	fnt=ImageFont.truetype("static/font/DejaVuSans.ttf", size=20)
	image = Image.new(mode='RGB', size=(100,50))
	draw = ImageDraw.Draw(image)
	draw.text((15,15), final_code, font=fnt)
	image.save(root_directory+"static/"+filename)
	return root_directory+"static/"+filename, final_code


@app.route("/")
def index():
        return render_template('index.html')

@app.route("/login", methods=['GET', 'POST'])
def login():
	if request.method=='POST':
		username = int(request.form['username'])
		password = request.form['password']
		user_captcha = request.form['captcha']
		while True:
			valid='Flase'
			if not re.search("[a-z]", password):
				break
			elif not re.search("[A-Z]", password):
				break
			elif not re.search("[0-9]", password):
                		break
			elif not re.search("[_@$%^&*()!?]", password):
                		break
			elif re.search("\s", password):
                		break
			else:
                		valid='True'
                		break

		if ((username in range(102120001,102120201)) or (username in range(106120001, 106120201))) and (valid=='True') and (user_captcha==all_codes[-1]):
			return redirect(url_for('task3'))
		else:
			return redirect(url_for('login'))
	filename, code =generate_captcha()
	all_codes.append(code)
	return render_template('login.html', filename=code+'.png')

@app.route("/task3")
def task3():
	return render_template('task3.html')

if __name__=="__main__":
	app.run()
