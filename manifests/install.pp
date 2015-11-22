#
# == Class: selinux::install
#
# Install selinux packages
#
class selinux::install inherits selinux::params {

    package { 'selinux-libselinux':
        ensure => present,
        name   => $::selinux::params::lib_package_name,
    }
}
