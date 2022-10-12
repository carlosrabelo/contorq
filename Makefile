all:

start:

	vagrant up --provision

stop:

	vagrant destroy -f

restart: stop start
