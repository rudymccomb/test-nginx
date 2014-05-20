class test-nginx::firewall { 

exec { 'open port 8000':
   command => "/usr/sbin/ufw allow 8000"
}

}
