#
# == Class: selinux::params
#
# Defines some variables based on the operating system
#
class selinux::params {

    case $::osfamily {
        'RedHat': {
        }
        'Debian': {
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
