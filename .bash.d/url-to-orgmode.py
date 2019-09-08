import argparse
import logging
import os
import pathlib
import platform
import re
import sys
import tempfile
from subprocess import PIPE, Popen
from urllib.parse import urlparse

import requests
from bs4 import BeautifulSoup

logger = logging.getLogger("url-to-orgmode")
logger.addHandler(logging.StreamHandler())

parser = argparse.ArgumentParser(description="convert html path or uri to org mode")
parser.add_argument("uri", action="store")
parser.add_argument("--debug", action="store_true")
args = parser.parse_args()

if args.debug:
    logger.setLevel(logging.DEBUG)

source_file = tempfile.NamedTemporaryFile(
    delete=False, dir="/tmp" if platform.system() == "Darwin" else None
)
source_file.name = f"{source_file.name}.html"
t = pathlib.Path(source_file.name)
outpath = pathlib.Path(source_file.name)
orgpath = pathlib.Path(f"{outpath.parent}/{outpath.stem}.org")
pat = re.compile(r"\r|\n")
mo = pat.search(args.uri)
if mo:
    print(f"I don't recognize {args.uri} as path or args.uri, quitting...")
    sys.exit(1)


def fetch(url):
    try:
        r = requests.get(url)
        with open(outpath, "w") as fd:
            fd.write(r.text)
        logger.debug(f"fetch file written to {source_file.name}")
    except requests.exceptions.MissingSchema as msg:
        logger.exception(msg)


if urlparse(args.uri).scheme:
    fetch(args.uri)
else:
    source_file.name = args.uri
    if not pathlib.Path(source_file.name).exists():
        logger.fatal(f"i couldn't find your file {source_file.name}")
        sys.exit(1)

os.chdir(outpath.parent)
logger.debug(f"current directory:\n\t{outpath.parent}")
logger.debug(f"source file:\n\t{outpath}")

cmd = [
    "docker",
    "run",
    "-v",
    f"{outpath.parent}:/source",
    "jagregory/pandoc",
    "--from=html",
    "--to=org",
    f"--output={orgpath.name}",
    f"{pathlib.Path(source_file.name).name}",
]
logger.debug(f'will run cmd:\n\t{" ".join(cmd)}')
process = Popen(cmd, cwd=outpath.parent, stdout=PIPE, stderr=PIPE, encoding="utf8")

stdout, stderr = process.communicate()
if stderr:
    logger.fatal(f"docker had trouble, quitting: {stderr}")
    sys.exit(1)

logger.info(orgpath)


def to_text(s):
    txt = BeautifulSoup(s, "html.parser").get_text()
    r = re.sub(r"\s+", txt, "")
    if not r:
        return ""
    return f"#+BEGIN_HTML\n{txt}\n#+END_HTML"


# text = sys.stdin.read()
text = orgpath.read_text()


# call to_text for each match
text = re.sub(
    r"(#\+BEGIN_HTML(.*?)#\+END_HTML)",
    lambda match: to_text(match.group(1)),
    text,
    flags=re.I | re.DOTALL,
)

it = ["footer", "header", "locationline", "logo", "pagebottom", "sidebar", "star"]
ir = "|".join(it)
ir = "<<{0}>>".format(ir)
ir = re.compile(ir)
text = re.sub(ir, "", text)

text = re.sub("\n{3,}", "\n", text)

orgpath.write_text(text)
