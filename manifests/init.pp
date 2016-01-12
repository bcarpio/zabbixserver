# == Class: zabbixserver
#
# Full description of class zabbixserver here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { zabbixserver:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name puppet@example.com
#
# === Copyright
#
# Copyright (C) 2016 Example, Inc.
#
class zabbixserver (

  $zabbix_url = $zabbixserver::params::zabbix_url

) inherits zabbixserver::params {

  class { 'apache':
    mpm_module => 'prefork'
  }
  
  include apache::mod::php

  class { 'mysql::server': }
  
  class { 'zabbix':
    zabbix_url    => $zabbix_url,
    database_type => 'mysql'
  }


}