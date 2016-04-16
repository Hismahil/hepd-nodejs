# == Class: debian
#	Select one of the following version (0.10, 0.12, 4.x and 5.x) for install
#
# === Variable
# [*cmd*]
#	Command for download e setup repository source for nodejs
#
# === Parameters
#
# [*version*]
#   one of the following versions (0.10, 0.12, 4.x and 5.x)
#
# === Examples
#
#  class { 'nodejs::debian':
#    version  => '0.10'
#  }
#
# === Author
#
# Hismahil Escarvalhar Pereira Dinis <hismahilepd@gmail.com>
#
# === Copyright
#
# Copyright 2016 Hismahil E. P. Dinis.
#
class nodejs::debian(
	$version
){
	case $version {
	  '0.10': { 
	  	$cmd = 'curl -sL https://deb.nodesource.com/setup_0.10 | sudo -E bash -'
	  }
	  '0.12': { 
	  	$cmd = 'curl -sL https://deb.nodesource.com/setup_0.12 | sudo -E bash -'
	  } 
	  '4.x': { 
	  	$cmd = 'curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -'
	  } 
	  '5.x': {
	  	$cmd = 'curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -'
	  }
	  default: { 
	  	fail('Version not suported!')
	  }
	}

	# execute download and setup
	exec { 'install-repository-pack':
		command		=> $cmd,
		path		=> '/bin:/sbin:/usr/bin:/usr/sbin',
	}

	# install node
	package { 'nodejs':
		ensure	=> installed,
		require	=> Exec['install-repository-pack'],
	}
}