# usage: make kill; make daemon

# start daemon and then start emacsclient
# usage: make daemon

# killing daemon will kill all clients too.  Kill daemon by 'make kill'
# usage: make kill

EMACS_BASEPATH=/usr/local/bin
EMACS=$(EMACS_BASEPATH)/emacs
EMACS_CLIENT=$(EMACS_BASEPATH)/emacsclient

EMACS_SERVER_FILE=~/.emacs.d/server/emacs1000

emacs_daemon_pid=$(shell sh -c 'ps -ef|grep -v make| grep -v grep|grep -iE "emacs.*daemon" | awk '\''{print $$2}'\''')

ec1:emacsclient1
emacsclient1:
	if test -z "$(emacs_daemon_pid)"; then rm -f $(EMACS_SERVER_FILE); $(daemon); fi
	$(EMACS_CLIENT) --server-file=emacs1000 -n -c &
	ls $(EMACS_SERVER_FILE)

emacsclient_debug_init:
	if test -z "$(emacs_daemon_pid)"; then rm -f $(EMACS_SERVER_FILE); $(daemon); fi
	$(EMACS) --debug-init
	ls $(EMACS_SERVER_FILE)

kill: killdaemon
killdaemon:
	@$(killdaemon)

test_kill:
	@$(get_emacs_daemon_pid)
	@$(killdaemon)	
	@$(get_emacs_daemon_pid)

daemon:
	$(daemon)

ls:
	$(ls)

pid:
	@$(get_emacs_daemon_pid)

c:clean
clean:
	$(clean)

get_emacs_daemon_pid=@echo $(emacs_daemon_pid)
daemon=$(EMACS) --daemon
ls=ls $(EMACS_SERVER_FILE)
clean=rm -rf $(EMACS_SERVER_FILE)
check_process=ps -ef | grep -i emacs
killdaemon=if test ! -z "$(emacs_daemon_pid)"; then kill -9 $(emacs_daemon_pid); fi
