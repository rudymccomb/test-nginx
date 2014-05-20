class test-nginx::firewall { 

 # setup firewall rules
  package { 'ufw':
    ensure => present,
  } ->
exec { 'open port 8000':
   command => "/usr/sbin/ufw allow 8000"
}

}
