# == Class consul::install
#
class consul::install {

  case $::osfamily {
    'RedHat', 'Amazon': {
      package { $consul::package_name:
        ensure   => present,
        source   => $consul::package_url,
        provider => rpm,
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
