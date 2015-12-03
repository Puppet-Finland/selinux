#
# == Class: selinux::params
#
# Defines some variables based on the operating system
#
class selinux::params {

    case $::osfamily {
        'RedHat': {
            $lib_package_name = 'libselinux'
            $semanage_package_name = 'policycoreutils-python'
        }
        'Debian': {
            $lib_package_name = 'libselinux1'
            $semanage_package_name = 'policycoreutils'
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
