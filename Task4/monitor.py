import binascii
import os

html_file = 'index.html'
flask_file = '__init__.py'
conf_file = 'FlaskApp.conf'

hex_flask=[]
hex_html = []
hex_conf = []

def hex_convertor():
	with open(html_file, 'rb') as f1:
		d1 = f1.read()
		hex_html.append(binascii.hexlify(d1))

	with open(flask_file, 'rb') as f2:
		d2 = f2.read()
		hex_flask.append(binascii.hexlify(d2))

	with open(conf_file, 'rb') as f3:
		d3 = f3.read()
		hex_conf.append(binascii.hexlify(d3))

if __name__=="__main__":
	hex_convertor()
	i=1
	change=False

	while True:
		user_wish=input("\nDo you want to check for any changes in the file (y/n)? ")
		if user_wish == 'y':
			hex_convertor()
			if hex_flask[i-1] == hex_flask[i]:
				if hex_html[i-1] == hex_html[i]:
					if hex_conf[i-1] == hex_conf[i]:
						print("\nNo changes where made in any of the file.\n")
					else:
						print("\nChange is made in the conf file.")
						change=True
				else:
					print("\nChange is made in the html file.")
					change=True
			else:
				print("\nChange is made in the flask file.")
				change=True

			if change:
				print("\nContainer is restarting.")
				os.system('docker-compose down')
				os.system('docker-compose up --force-recreate --build -d')
				print("Update completed..!!")

		elif user_wish == 'n':
			print("Programme Ended.")
			break

		else:
			print("Invalid input.")
		i+=1
