create_index:
	@echo '\
http://www.emacswiki.org/emacs/download/bookmark+.el \n\
http://www.emacswiki.org/emacs/download/bookmark+-mac.el \n\
http://www.emacswiki.org/emacs/download/bookmark+-bmu.el \n\
http://www.emacswiki.org/emacs/download/bookmark+-1.el \n\
http://www.emacswiki.org/emacs/download/bookmark+-key.el \n\
http://www.emacswiki.org/emacs/download/bookmark+-lit.el \n\
http://www.emacswiki.org/emacs/download/bookmark+-doc.el \n\
http://www.emacswiki.org/emacs/download/bookmark+-chg.el \n\
'	> /tmp/bookmarkplus.urls
	wget --timestamping -P ~/.elisp/bookmarkplus -i /tmp/bookmarkplus.urls
.PHONY: create_index
