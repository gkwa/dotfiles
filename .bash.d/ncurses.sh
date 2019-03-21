case $(uname) in
"FreeBSD" | "Linux") ;;

"Darwin")

	# ncurses is keg-only, which means it was not symlinked into /usr/local,
	# because macOS already provides this software and installing another version in
	# parallel can cause all kinds of trouble.

	# If you need to have ncurses first in your PATH run:

	[[ -d /usr/local/opt/ncurses/bin ]] &&
		export PATH="/usr/local/opt/ncurses/bin:$PATH"

	# For compilers to find ncurses you may need to set:
	#   export LDFLAGS="-L/usr/local/opt/ncurses/lib"
	#   export CPPFLAGS="-I/usr/local/opt/ncurses/include"

	# For pkg-config to find ncurses you may need to set:
	#   export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig"

	;;
esac
