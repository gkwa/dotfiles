case $(uname) in
"FreeBSD" | "Linux") ;;

"Darwin")

    # To have launchd start selenium-server-standalone now and restart at login:
    #   brew services start selenium-server-standalone

    # Or, if you don't want/need a background service you can just run:
    #   selenium-server -port 4444

    ;;
esac
