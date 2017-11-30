class minecraft (
  $url = 'https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar',
  $installdir = ‘/opt/minecraft’
){
  file {$installdir:
    ensure => directory,
  }
  file {"${installdir}/minecraft_server.1.12.2.jar":
    ensure => file,
    source      => ,
    before => Service['minecraft'],
  }
  package {‘java’:
    ensure => present,
  }
  file {"${installdir}/eula.txt":
    ensure => file,
    content => ‘eula=true’
  }
  file {‘/etc/systemd/system/minecraft.service’:
    ensure => file,
    content => epp('minecraft/minecraft.service',{
      install_dir = $install_dir,
    })
  }
  service { ‘minecraft’:
    ensure => running,
    enable => true,
    require => [Package['java'],File["${installdir}/eula.txt"],File['/etc/systemd/system/minecraft.service']],
  }
}

