class test-nginx::config {

file { "/var/www":
    ensure => "directory"
}
case $::osfamily {
   'debian': {
	
	file { "/var/www/index.html":
    	   source => "puppet:///modules/test-nginx/index.html",
           require => File["/var/www"],
           owner => www-data,
           ensure => "file",
        }
   }
 
   'redhat': {

        file { "/var/www/index.html":
           source => "puppet:///modules/test-nginx/index.html",
           require => File["/var/www"],
           owner => apache,
           ensure => "file",
        }
   }  

}

}
