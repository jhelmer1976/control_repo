class profile::ssh_server {
	package {'openssh-server':
		ensure => present,
	}
	service { 'sshd':
		ensure => 'running',
		enable => 'true',
	}
	ssh_authorized_key { 'root@master.puppet.vm':
		ensure => present,
		user   => 'root',
		type   => 'ssh-rsa',
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCxyiiSIMHp5OP6Jbgg1p/aHb+219wqzqAKaQ//uwPGKkwI8sP4fLji+8S9dFzbtexHrOJ39GWIzUlDAhCNcEz2oxtUXji8pjdBZJISqwgfYzIjovrdbHLneYHLb/l3UzXrk7XRXoR1oY6TXo/JiJniGyc/4ZZW9fUbj8ec/FCb4gTbOIoiITJ/uT4SDUHeXYmJXeNlksk0x+nUuJOxy9jWhbo30N17mMVXL5Y84KBfFLcSp0WTsns5XhGqQVrDGSpBU6aOCaYxeGQzgSiq1wDMLtBxDfTwIADwk2PUULxpTksQK2DVQ/GoEVozCUwwp9yBNZe8rvvejDtBl4oS8DrN',
	}  
}
