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
  $package_name = $consul::params::package_name,
  $service_name = $consul::params::service_name,
) inherits consul::params {

  # validate parameters here

  class { 'consul::install': } ->
  class { 'consul::config': } ~>
  class { 'consul::service': } ->
  Class['consul']
}
