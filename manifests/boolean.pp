#
# == Define: selinux::boolean
#
# Enable or disable SELinux policies (booleans)
#
define selinux::boolean
(
    $ensure = 'enabled'
)
{
    include ::selinux
    include ::selinux::params

    Exec {
        path => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
        user => $::os::params::adminuser,
    }

    case $ensure {
        'enabled': {
            exec { "sebool-${title}":
                command => "setsebool -P ${title} 1",
                unless  => "getsebool ${title}|grep \"\\-\\-> on\"",
            }
        }
        'disabled': {
            exec { "sebool-${title}":
                command => "setsebool -P ${title} 0",
                unless  => "getsebool ${title}|grep \"\\-\\-> off\"",
            }
        }
        default: {
            fail("Invalid value ${ensure} for parameter \$ensure")
        }
    }
}
