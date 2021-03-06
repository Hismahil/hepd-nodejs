# nodejs

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

This module has the purpose to install some versions of nodejs, through repositories with the most used versions, serving only to Debian / Ubuntu and Redhat / CentOS.

## Module Description

The module installs the following versions: (0.10, 0.12, 4.x and 5.x)

## Usage

```puppet
class { 'nodejs':
	version	=> '0.12',
}
```

```puppet
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
```

## Reference

* `nodejs`: install one of the following versions (0.10, 0.12, 4.x and 5.x)
* `nodejs::debian`: debian installation
* `nodejs::redhat`: provider yum installation

## Limitations

Made just for Debian/Ubuntu and Redhat/CentOS, but it has not been tested in provider YUM. 


