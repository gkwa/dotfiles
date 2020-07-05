[[ -d ~/.virtualenvs/.py38 ]] && source ~/.virtualenvs/.py38/bin/activate

cuppy() {
    path="$*"
    for file in $path; do
        autoflake --in-place --remove-all-unused-imports "$file"
        black "$file"
        isort "$file"
    done
}

export -f cuppy
