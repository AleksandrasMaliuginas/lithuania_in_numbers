import os, platform

postgresql_dir = '/etc'
pg_conf_file = ''

lines_to_insert = (
    '# \n' +
    '# Added manually\n' +
    '# TYPE    DATABASE    USER        ADDRESS        METHOD\n' +
    'host      postgres    postgres    127.0.0.1/32   trust\n' +
    'local     postgres    postgres                   trust\n' +
    '# \n')

def findconfig(a, dir, files):
    global pg_conf_file
    # print dir,": %d files"%len(files)
    for file in files:
        if file == 'pg_hba.conf':
            pg_conf_file = dir + '/' + file

if platform.system() == 'Linux':
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
                # print(line)
                print("Lines to PostgreSQL config file pg_hba.conf added.")
            out_file.write(line)

    # Restart PostgreSQL
    print("Restarting postgresql service...")
    os.system('sudo service postgresql restart')

    print("Done.")
