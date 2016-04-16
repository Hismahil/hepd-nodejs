# == Class: nodejs
#
# This module installs one of the following versions (0.10, 0.12, 4.x and 5.x)
# Using as source: https://github.com/nodesource/distributions
# Make to: RedHat/CentOS and Debian/Ubuntu
#
# === Parameters
#
# [*version*]
#   one of the following versions (0.10, 0.12, 4.x and 5.x)
#
# === Examples
#
#  class { 'nodejs':
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
class nodejs (
	$version) {

	case $operatingsystem {
  		'RedHat', 'CentOS': { 
  			class { 'nodejs::redhat':
  				version		=> $version,
  			}
  		} 
  		/^(Debian|Ubuntu)$/:{
  			class { 'nodejs::debian':
  				version		=> $version,
  			}
  		}
  		default:            {
  			fail('Not implemented for orders operations systems!')
  		} 
	}
}
