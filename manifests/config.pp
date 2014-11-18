# == Class consul::config
#
# This class is called from consul
#
class consul::config {
  file { '/etc/consul.conf':
    ensure  => file,
    content => template('consul/consul.conf'),
    owner   => root,
    group   => root,
    mode    => '0644',
}
