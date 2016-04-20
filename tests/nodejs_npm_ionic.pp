node default {
	class { 'nodejs':
		version	=> '0.12'
	}

	exec { 'npm-update':
		command		=> 'npm install npm -g',
		path		=> '/bin:/sbin:/usr/bin:/usr/sbin',
		require		=> Class['nodejs']
	}

	exec { 'install-cordova':
		command		=> 'npm install -g cordova',
		path		=> '/bin:/sbin:/usr/bin:/usr/sbin',
		timeout   	=> 0,
		require		=> Exec['npm-update']
	}

	exec { 'install-ionic':
		command		=> 'npm install -g ionic',
		path		=> '/bin:/sbin:/usr/bin:/usr/sbin',
		timeout   	=> 0,
		require		=> Exec['install-cordova']
	}
}