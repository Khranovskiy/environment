
# MacPorts Installer addition on 2014-10-28_at_00:15:02: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

##
# Your previous /Users/khranovsky/.profile file was backed up as /Users/khranovsky/.profile.macports-saved_2015-11-30_at_23:30:07
##

# MacPorts Installer addition on 2015-11-30_at_23:30:07: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export GOPATH=$HOME/go-path
export GOROOT=$HOME/go/go1.13.15
#export GOROOT=$HOME/go/go1.15

# for debian
if [ -f /usr/local/go/bin/go ] ; then export PATH=$PATH:/usr/local/go/bin ; fi

export PATH="$HOME/.cargo/bin:$PATH"
#export PATH="$HOME/go/go1.15/bin:$PATH"
export PATH="$HOME/go/go1.13.15/bin:$PATH"

