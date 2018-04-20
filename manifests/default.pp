exec { 'yum update':
   command => '/usr/bin/yum -y update'
}
	
package { 'httpd':
   ensure => present,
}

package { 'php':
    ensure => present,
}

service { 'httpd':
  ensure => 'running',
  enable => 'true',
  }

file { '/var/www/html/index.php':
  source => '/vagrant/docroot/index.php',
      }
	
Package['httpd'] -> Package ['php'] -> File['/var/www/html/index.php'] ->  Service ['httpd']