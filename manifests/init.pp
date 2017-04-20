class onion (

  $onion_root = onion::params::onion_root

) inherits onion::params {

  anchor {'onion::begin':
    before => Class['onion::install']
  }
  class {'onion::install':
    require => Anchor['onion::begin']
  }
  class {'onion::config':
    require => Class['onion::install']
  }
  anchor {'onion::end':
    require => Class['onion::config']
  }
}
