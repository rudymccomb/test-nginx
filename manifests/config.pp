class test-nginx::config {

file { "/var/www":
    ensure => "directory"
}
file { "/var/www/index.html":
    require => File["/www"],
    ensure => "file",
    content => "<!DOCTYPE html>
        <html><body>
        Hello, world.
        "
}

}
