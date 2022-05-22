case $(uname) in
"FreeBSD" | "Linux") ;;

"Darwin")

    # mutt_dotlock(1) has been installed, but does not have the permissions lock
    # spool files in /var/mail. To grant the necessary permissions, run

    #   sudo chgrp mail /usr/local/opt/mutt/bin/mutt_dotlock
    #   sudo chmod g+s /usr/local/opt/mutt/bin/mutt_dotlock

    # Alternatively, you may configure `spoolfile` in your .muttrc to a file inside
    # your home directory.

    ;;

esac
