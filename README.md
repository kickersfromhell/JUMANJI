README

-----------------------------------------------------------------------------------------------------------------

STARTING MACHINES
------------------
Edit vagrant file inline with one of the I.P addresses/node names available from the Google spreadsheet
Vagrant up


PREPARING MACHINES
------------------
Run the following commands in terminal;	1- sudo apt-get update
					2- sudo apt-get install -y vim
					3- sudo apt-get install -y openjdk-7-jdk
					4- sudo apt-get install -y ntp ntpDate
					5- sudo service ntp start


Edit the hosts file using the command;	   sudo vim /etc/hosts
Ensure it looks the same as this example;

127.0.0.1       localhost
127.0.1.1       vagrant
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

192.168.2.69 orange69
192.168.2.70 blue69
192.168.2.71 pink69
192.168.2.72 green69
192.168.2.73 cyan69
192.168.2.74 purple69
192.168.2.75 ivory69
192.168.2.76 peru69
192.168.2.77 violet69
192.168.2.78 crimson69


WORKING ON DIFFERENT TERMINALS
------------------------------

To work on a different terminal, use the command;	sudo ssh vagrant@<target terminal>
The first time you do this you will be prompted, enter "yes"
Enter the password "vagrant"

You will notice the working directory changes to the new machine

Use the command "exit" when you are finished to close the connection


SETTING UP AMBARI
-----------------

On the host machine run the following commands;	1- wget -nv http://public-repo-1.hortonworks.com/ambari/ubuntu14/2.x/updates/2.1.2/ambari.list -O /etc/apt/sources.list.d/ambari.list
						2- apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD
						3- apt-get update
						4- apt-get install ambari-server
						5- ambari-server setup
						6- ambari-server start

The ambari server is now running.

To set up Password-less SSH, on the host machine;	1- run the command ssh-keygen (no passphrase)
							2- move the generated files (id_rsa, id_rsa.pub) to ~/.ssh
							3- run the command cat id_rsa.pub >> authorized_keys
							4- copy the keys to the other hosts using;
								scp .ssh/* vagrant@<target host>:/tmp
							5- On each host, move the files from tmp to .ssh using;
								cat /tmp/authorized_keys >> .ssh/authorized_keys
								cat /tmp/id_rsa >> .ssh/id_rsa
								cat /tmp/id_rsa.pub >> .ssh/id_rsa.pub
							

To create the cluster;	1- Go to http://<host machine ip>:8080
			2- Login with username/password admin/admin
			3- Click on "Launch Install Wizard"
			4- Enter a name for the cluster
			5- Select the stack for the cluster (we stuck with the default)
			6- For the advanced repository options uncheck everything except ubuntu14
			7- Next add the hostnames in the textbox (orange69, pink69 etc)
			8- Copy the contents of .ssh/id_rsa in to the SSH Private Key box
			9- After it has all worked (first time obvs) select the required services
		       10- Select which hosts should run certain services and allow ambari to do the real work
		       11- YOU WILL HAVE NO ERRORS!!


