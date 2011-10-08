# MacPorts Installer addition on 2010-02-03_at_11:43:34: adding an appropriate PATH variable for use with MacPorts.
# export PATH=/opt/local/bin:/opt/local/sbin:/opt/local/var/macports/software/ccrypt/1.9_0/opt/local/bin:$PATH
export PATH=/opt/local/libexec/gnubin:/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

##############################
# Here's why i add /opt/local/libexec/gnubin to the path.  Its based on
# MacPorts recomendation
##############################
# + /opt/local/bin/port install coreutils
# --->  Computing dependencies for coreutils
# --->  Fetching archive for coreutils
# --->  Attempting to fetch coreutils-8.13_0.darwin_10.x86_64.tbz2 from http://packages.macports.org/coreutils
# --->  Attempting to fetch coreutils-8.13_0.darwin_10.x86_64.tbz2.rmd160 from http://packages.macports.org/coreutils
# --->  Installing coreutils @8.13_0
# --->  Activating coreutils @8.13_0
# The tools provided by GNU coreutils are prefixed with the character 'g' by
# default to distinguish them from the BSD commands.
# For example, cp becomes gcp and ls becomes gls.
# If you want to use the GNU tools by default, add this directory to the front of
# your PATH environment variable:
#     /opt/local/libexec/gnubin/
# --->  Cleaning coreutils