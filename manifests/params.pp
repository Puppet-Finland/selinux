#
# == Class: selinux::params
#
# Defines some variables based on the operating system
#
class selinux::params {

    case $::osfamily {
        'RedHat': {
            $lib_package_name = 'libselinux'
        }
        'Debian': {
            $lib_package_name = 'libselinux1'
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
