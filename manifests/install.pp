# == Class consul::install
#
class consul::install {

  package { $consul::package_name:
    ensure => present,
  }
}
