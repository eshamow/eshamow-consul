# == Class consul::service
#
# This class is meant to be called from consul
# It ensure the service is running
#
class consul::service {

  service { $consul::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
