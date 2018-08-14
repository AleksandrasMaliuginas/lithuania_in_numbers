import os, platform

# Delimiter / for unix OS, \ for windows OS
dl = '\\' if platform.system() == 'Windows' else '/'

pg_conf_file = ''

def findconfig(a, dir, files):
    global pg_conf_file
    # print dir,": %d files"%len(files)
    for file in files:
        if file == 'pg_hba.conf':
            pg_conf_file = dir + dl + file

def parentDir(dir):
	return os.path.abspath(os.path.join(dir, os.pardir))

if platform.system() == 'Linux':
	postgresql_dir = '/etc'
	lines_to_insert = (
		'# \n' +
		'# Added manually\n' +
		'# TYPE    DATABASE    USER        ADDRESS        METHOD\n' +
		'host      postgres    postgres    127.0.0.1/32   trust\n' +
		'local     postgres    postgres                   trust\n' +
		'# \n')

	# Install necessary packages
	os.system('sudo apt update')
	os.system('sudo apt -y install python3-pip')
	os.system('sudo python3 -m pip install pathlib2 psycopg2')
	os.system('pip3 install psycopg2-binary')

	# Find pg_hba.conf file
	os.path.walk(postgresql_dir, findconfig, None)

	# Add line to PostgreSQL config file
	with open(pg_conf_file, "r") as in_file:
		file = in_file.readlines()
	with open(pg_conf_file, "w") as out_file:
		for line in file:
			if line == '# Put your actual configuration here\n':
				line = line + lines_to_insert
				print("Lines to PostgreSQL config file pg_hba.conf added.")
			out_file.write(line)

	# Restart PostgreSQL
	print("Restarting postgresql service...")
	os.system('sudo service postgresql restart')

	print("Done.")
	
elif platform.system() == 'Windows':
	# Get PostgreSQL installation directory
	print("1. Program Files \t2. Program Files (x86)")
	while True:
		try:
			option = int(input("Choose option: "))
		except ValueError:
			print("Try again")
			continue
		
		if option == 1 or option == 2:
				break
		else:
			print("Try again")
			
	postgresql_dir = 'C:\\Program Files\\' if option == 1 else 'C:\\Program Files (x86)\\'
	lines_to_insert = (
		'# \n' +
		'# Added manually\n' +
		'# TYPE    DATABASE    USER        ADDRESS        METHOD\n' +
		'host      postgres    postgres    127.0.0.1/32   trust\n' +
		'# \n')

	# Install necessary packages
	os.system('py -m pip install pathlib2 psycopg2')

	# Find pg_hba.conf file
	for dirpath, subdirs, files in os.walk(postgresql_dir):
		for file in files:
			if file == 'pg_hba.conf':
				pg_conf_file = os.path.join(dirpath, file)
	
	# Add line to PostgreSQL config file
	with open(pg_conf_file, "r") as in_file:
		file = in_file.readlines()
	with open(pg_conf_file, "w") as out_file:
		for line in file:
			if line == '# Put your actual configuration here\n':
				line = line + lines_to_insert
				print("Lines to PostgreSQL config file pg_hba.conf added.")
			out_file.write(line)
	
	# Restart PostgreSQL
	pg_home = parentDir( parentDir(pg_conf_file) )
	
	os.system('setx PATH "%PATH%;' + pg_home + '\\bin;' + pg_home + '\\lib"')
	print("User environment variables added:")
	print(pg_home + "\\bin\n" + pg_home + "\\lib\n")
	
	print("Now restart your computer and start PostgreSQL using command below")
	print("pg_ctl -D 'C:\\PostgreSQLdir\\data' start")
	print("Done.")
else:
	print("Your OS platform is not supported.")
	
	
	
	
	
	
	
	
	
	
