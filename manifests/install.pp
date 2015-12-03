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

    # Some Puppet modules also need the "semanage" command
    package { 'selinux-semanage':
        ensure => present,
        name   => $::selinux::params::semanage_package_name,
    }
}
