#!/bin/env bash

# pip install bs4

# usage:
# docker pull jagregory/pandoc
# copy url to clipboard
# run command: url_to_orgmode
# check your /tmp/url_to_orgmode.*/out.org

function setup() {
    cat <<'__eot__' >clean.py
import re
import sys

from bs4 import BeautifulSoup


def to_text(s):
    txt = BeautifulSoup(s, "html.parser").get_text()
    r = re.sub(r"\s+", txt, "")
    if not r:
        return ""
    return f'#+BEGIN_HTML\n{txt}\n#+END_HTML'


text = sys.stdin.read()

# call to_text for each match
text = re.sub(
    r"(#\+BEGIN_HTML(.*?)#\+END_HTML)",
    lambda match: to_text(match.group(1)),
    text,
    flags=re.I | re.DOTALL,
)

it = [
    'footer',
    'header',
    'locationline',
    'logo',
    'pagebottom',
    'sidebar',
    'star',
]
ir = '|'.join(it)
ir = "<<{0}>>".format(ir)
ir = re.compile(ir)
text = re.sub(ir, "", text)

text = re.sub("\n{3,}", "\n", text)
print(text)
__eot__
}

function url_to_orgmode() {
    url="$(pbpaste)"
    tmp=$(mktemp -d /tmp/url-to-orgmode.XXXXX)
    cd $tmp
    setup
    curl -sSL -o out.html $url
    docker run -v $(pwd):/source jagregory/pandoc --output=out.org out.html
    cat out.org | python clean.py >out.org.1
    mv out.org.1 out.org
    echo $tmp/out.org | pbcopy
}
