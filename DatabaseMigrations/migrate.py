import sys, os, re, pathlib2, psycopg2, platform

# Delimiter / for unix OS, \ for windows OS
dl = '/' if platform.system() == 'Linux' else '\\'

# Path to SQL files <string>
dir = os.path.dirname(os.path.abspath(__file__)) + dl

EXIST_SELECT = ("SELECT 1\n" +
				"FROM information_schema.tables\n" +
				"WHERE table_name = 'migrations'\n" +
				"AND table_schema = 'public'")
# ==============================================================================
def executeCommand(path, fname, isImport):
	command = "psql -d postgres -U postgres -f " + path

	if isImport != -1:
		print("Import")
		fnameParts = fname.split("_")
		label = fnameParts[0] + "_" + fnameParts[3][:-4]
		command += ' -v path="\'' + dir + 'imports' + dl + label + '.csv\'"'

	print(command)
	if os.system(command) != 0:
		sys.exit()
# ==============================================================================
def checkMirations():
    conn = psycopg2.connect("postgresql:///postgres?user=postgres&host=127.0.0.1")
    cur = conn.cursor()

    cur.execute(EXIST_SELECT)
    if cur.fetchone() is None:
        executeCommand(dir + "create_migrations.sql", '', -1)

    cur.close()
    conn.close()
# ==============================================================================
def getLastMigration(schema):
	conn = psycopg2.connect("postgresql:///postgres?user=postgres&host=127.0.0.1")
	cur = conn.cursor()

	LAST_MIG_SELECT = "SELECT label FROM public.migrations WHERE schema=\'" + schema + "' ORDER BY 1 DESC LIMIT 1;"

	cur.execute(LAST_MIG_SELECT)
	names = cur.fetchone()
	if names is not None:
		lastMig = int(names[0][0:11])
	else:
		lastMig = 0

	cur.close()
	conn.close()

	return lastMig
# ==============================================================================
def importAll(files, schema = 'general'):
	files.sort()
	lastMigration = getLastMigration(schema);

	# Run each sql file
	for path in files:

		last_index_of_slash = path.rindex(dl) + 1
		fname = path[last_index_of_slash:]

	    # 00000000_00_text.sql
		regexGroup = re.fullmatch("(\d{8}_\d{2}_.+).sql", fname)

		if regexGroup:
			# print(str(int(fname[0:11])) + " > " + str(lastMigration))
			if int(fname[0:11]) > lastMigration :
				print("Execute " + fname)
				executeCommand(path, fname, fname.find("import"))
			else:
				print("Skip " + fname + ", because it was already applied.")
# ==============================================================================
# Chech if public.migrations table exists
checkMirations()

# Import general schema
print("Schema -> general")

dirFiles = [str(p) for p in pathlib2.Path( dir ).iterdir() if p.is_file()]
importAll(dirFiles)


# Import another schema's
dirFolders = [str(p) + dl for p in pathlib2.Path( dir ).iterdir() if p.is_dir()]

for dir in sorted(dirFolders):
	# Get folder name as schema
	schema = dir[( dir.rfind(dl, 0, dir.rfind(dl)) + 1 ):-1]
	print("Schema -> " + schema)

	dirFiles = [str(p) for p in pathlib2.Path( dir ).iterdir() if p.is_file()]
	importAll(dirFiles, schema)
