# == Class consul::params
#
# This class is meant to be called from consul
# It sets variables according to platform
#
class consul::params {
  case $::osfamily {
    'RedHat', 'Amazon': {
      $package_name         = 'consul'
      $package_location     = 'https://s3.amazonaws.com/opsrealist_pkgs/RPMs/x86_64/'
      $package_version      = '0.4.1-1'
      $web_package_name     = 'consul-web'
      $web_package_location = 'https://s3.amazonaws.com/opsrealist_pkgs/RPMs/noarch/'
      $service_name         = 'consul'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  $datacenter       = 'default'
  $data_dir         = '/opt/consul'
  $server           = false
  $bootstrap_expect = 3
}
