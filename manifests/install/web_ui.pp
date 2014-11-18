#
class consul::install::web_ui {
  case $::osfamily {
    'RedHat', 'Amazon': {
      package { $consul::web_package_name:
        ensure   => present,
        source   => $consul::web_package_url,
        provider => rpm,
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
