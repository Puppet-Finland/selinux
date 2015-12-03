#
# == Define: selinux::module
#
# Upload and activate a compiled selinux module. Note that this define is only 
# useful for local selinux modules. For packaged modules you can simply use the 
# "selmodule" provider as-is.
#
# Module package creation is fairly simple with audit2allow. An example:
#
#   $ cd /var/log/audit
#   $ grep denied audit.log
#   type=AVC msg=audit(1449147989.541:367): avc:  denied  { rmdir } for  
#   pid=12151 comm="cobblerd" name="boot" dev="md1" ino=28707063 
#   scontext=system_u:system_r:cobblerd_t:s0 
#   tcontext=system_u:object_r:tftpdir_rw_t:s0 tclass=dir
#
# Now we know what got denied. Next we create a module that allows the things 
# that got denied:
#
#   $ grep cobblerd|audit2allow -M cobblerlocal
#
# In this case two files are created: cobblerlocal.te, which is a human-readable 
# file with the allow rules, and cobblerlocal.pp, which is binary file. We can 
# load the latter with selmodule provider or manually with the semodule command.
#
# A pretty good overview of local module generation can be obtained from here:
#
# <https://wiki.centos.org/HowTos/SELinux>
#
# == Parameters
#
# [*title*]
#   The resource title must match the module file's basename. For example 
#   'cobblerlocal'.
# [*modulename*]
#   Name of the Puppet module that has the selinux policy file under its files 
#   directory. For example 'cobbler'.
#
define selinux::module
(
    $modulename
)
{
    $basename = $title

    file { "selinux-module-file-${basename}":
        ensure  => present,
        name    => "/usr/share/selinux/targeted/${basename}.pp",
        source  => "puppet:///modules/${modulename}/${basename}.pp",
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        require => Class['::selinux'],
    }

    selmodule { "selinux-module-${basename}":
        ensure      => present,
        name        => $basename,
        syncversion => true,
        require     => File["selinux-module-file-${basename}"],
    }
}
