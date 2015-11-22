# == Class: selinux
#
# This is a dummy class for keeping the Puppet module autoloader happy. Later on 
# it may have some useful functionality of its own.
#
# == Parameters
#
# [*manage*]
#   Manage selinux with Puppet. Valid values are true (default) and false.
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
    $manage = true,

) inherits selinux::params
{

if $manage {
    include ::selinux::install
}
}
