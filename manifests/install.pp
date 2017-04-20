class onion::install {

  $onion_bz2 = 'onion.tar.bz2'

  file {'onion_bz2':
    ensure => present,
    path   => "/tmp/${onion_bz2}",
    source => "puppet:///modules/${module_name}/${lsbdistcodename}/${onion_bz2}",
  }

  exec { 'uncompress_onion_bz2':
    command  => "/bin/tar xvfj /tmp/${onion_bz2}",
    cwd      => $onion::onion_root,
    provider => 'shell',
    unless   =>  "/usr/bin/test -d ${onion::onion_root}/onion"
  }
}
