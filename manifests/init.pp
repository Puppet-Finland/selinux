# == Class: selinux
#
# This is a dummy class for keeping the Puppet module autoloader happy. Later on 
# it may have some useful functionality of its own.
#
# == Parameters
#
# None at the moment.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class selinux
(
    $manage = 'yes',

) inherits selinux::params
{

if $manage == 'yes' {
    # Do something
}
}
