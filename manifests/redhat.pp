# == Class: redhat
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
class nodejs::redhat(
	$version
){
	case $version {
	  '0.10': { 
	  	$cmd = 'curl --silent --location https://rpm.nodesource.com/setup_0.10 | bash -'
	  }
	  '0.12': { 
	  	$cmd = 'curl --silent --location https://rpm.nodesource.com/setup_0.12 | bash -'
	  } 
	  '4.x': { 
	  	$cmd = 'curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -'
	  } 
	  '5.x': {
	  	$cmd = 'curl --silent --location https://rpm.nodesource.com/setup_5.x | bash -'
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
		ensure		=> installed,
		provider	=> yum,
		require		=> Exec['install-repository-pack'],
	}
}