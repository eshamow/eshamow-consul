# == Class consul::params
#
# This class is meant to be called from consul
# It sets variables according to platform
#
class consul::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'consul'
      $service_name = 'consul'
    }
    'RedHat', 'Amazon': {
      $package_name = 'consul'
      $service_name = 'consul'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
