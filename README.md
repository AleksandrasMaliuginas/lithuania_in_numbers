# lithuania_in_numbers

Software for displaying Lithuanian statistics.
Data are taken from the Lithuania Official Statistics Portal.
https://osp.stat.gov.lt/

What do you need to start developing?

	♦	Java SE Runtime Environment 10
		http://www.oracle.com/technetwork/java/javase/downloads/jre10-downloads-4417026.html

	♦	Java SE Development Kit 10
		http://www.oracle.com/technetwork/java/javase/downloads/jdk10-downloads-4416644.html

	Make sure Java binary locations are added to path.


	♦	Apache Maven
			Download:	https://maven.apache.org/download.cgi
			Great tutorial:	https://medium.com/nycdev/java-get-started-with-apache-maven-a71f4f907cb3

	♦	PostgreSQL 10
		https://www.postgresql.org/download/

	♦	Python 3.7
		Make sure Python binary location is added to path.


Setting up your environment

	Windows:
		
		execute setup.py with Administrator privileges
		restart your computer
		run PostgreSQL server:
			open PowerShell or CMD and type
			
			pg_ctl -D "C:\[your\postgresql\installation\dir]\data" start
			
		run migrate.py to import data to the postgreSQL database
		
	Linux:

		run
			sudo python setup.py
		run
			python3 migrate.py
