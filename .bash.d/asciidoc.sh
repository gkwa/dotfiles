# https://groups.google.com/forum/?fromgroups=#!topic/asciidoc/FC-eOwU8rYg
# brew install asciidoc; cd ~/play/gitster && make man "make
# man" relies on knowing where XML_CATALOG_FILES are:

[[ -d /usr/local/etc/xml/catalog ]] && export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"
