AVAST_GPG = http://files.avast.com/files/resellers/linux/avast.gpg
AVAST_LICENSE_FILE = ./multiav/avast/license.avastlic

install-avast:				## install Avast Security for Linux
	echo 'deb http://deb.avast.com/lin/repo debian release' | sudo tee --append /etc/apt/sources.list
	sudo apt-key adv --fetch-keys $(AVAST_GPG)
	sudo apt update
	sudo apt install avast -y
	sudo cp $(AVAST_LICENSE_FILE) /etc/avast/license.avastlic
	sudo chown avast:avast /etc/avast/license.avastlic
	/etc/init.d/avast status

update-avast:  				## update Avast Security for Linux
	sudo /var/lib/avast/Setup/avast.vpsupdate

uninstall-avast:			## uninstall Avast Security for Linux
	sudo apt remove avast -y