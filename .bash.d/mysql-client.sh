# homebrew puts mysql-client here
[ -d /usr/local/opt/mysql-client/bin ] && export PATH="/usr/local/opt/mysql-client/bin:$PATH"
[ -d /usr/local/opt/mysql-client/lib ] && export LDFLAGS="-L/usr/local/opt/mysql-client/lib"
[ -d /usr/local/opt/mysql-client/include ] && export CPPFLAGS="-I/usr/local/opt/mysql-client/include"
