# == Class: consul
#
# Full description of class consul here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class consul (
  $package_name     = $consul::params::package_name,
  $package_version  = $consul::params::package_version,
  $package_location = $consul::params::package_location,
  $service_name     = $consul::params::service_name,
  $datacenter       = $consul::params::datacenter,
  $data_dir         = $consul::params::data_dir,
  $server           = $consul::params::server,
  $bootstrap_expect = $consul::params::bootstrap_expect,
  $full_package_url = undef
) inherits consul::params {

  # validate parameters here

  case $full_package_url {
    undef: {
      case $::osfamily {
        'RedHat', 'Amazon': {
          $package_url = "${package_location}/${package_name}-${package_version}.${::architecture}.rpm"
        }
        default: {
          fail("${::operatingsystem} not supported")
        }
      }
    }
    default: {
      $package_url = $full_package_url
    }
  }

  class { 'consul::install': } ->
  class { 'consul::config': } ~>
  class { 'consul::service': } ->
  Class['consul']
}
