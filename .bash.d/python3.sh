[[ -d ~/.virtualenvs/.py39 ]] && source ~/.virtualenvs/.py39/bin/activate

cuppy() {
    path="$*"
    for file in $path; do
        autoflake --in-place --remove-all-unused-imports "$file"
        black "$file"
        isort "$file"
    done
}

export -f cuppy

# python3 works fine but type -a python shows command not found.
# This fixes it:
# https://stackoverflow.com/a/48101303/1495086
[[ -d  /usr/local/opt/python/libexec/bin ]] && \
    export PATH="/usr/local/opt/python/libexec/bin:$PATH"
