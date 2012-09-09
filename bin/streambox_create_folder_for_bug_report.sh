# Usage: bug {bugnumber} [filter]

# Example:

# [demo@Taylors-MacBook-Pro:~(master)]$ bug 1555 jpg
# # 100K	/Users/demo/Desktop/Screen Shot 2012-08-29 at 10.39.14 PM.jpg
# rsync '/Users/demo/Desktop/Screen Shot 2012-08-29 at 10.39.14 PM.jpg' ~/Dropbox/Public/sb/bug_reports/bug1555
# rsync '/Users/demo/Desktop/Screen Shot 2012-08-29 at 10.39.14 PM.jpg' /Volumes/Development/bug_reports/bug1555
# # rm -rf /Volumes/Development/bug_reports/bug1555 ~/Dropbox/Public/sb/bug_reports/bug1555
# http://10.0.2.10/Development/bug_reports/bug1555/Screen%20Shot%202012-08-29%20at%2010.39.14%20PM.jpg
# http://dl.dropbox.com/u/9140609/sb/bug_reports/bug1555/Screen%20Shot%202012-08-29%20at%2010.39.14%20PM.jpg

# # 104K	/Users/demo/Desktop/Screen Shot 2012-08-30 at 12.42.49 AM.jpg
# rsync '/Users/demo/Desktop/Screen Shot 2012-08-30 at 12.42.49 AM.jpg' ~/Dropbox/Public/sb/bug_reports/bug1555
# rsync '/Users/demo/Desktop/Screen Shot 2012-08-30 at 12.42.49 AM.jpg' /Volumes/Development/bug_reports/bug1555
# # rm -rf /Volumes/Development/bug_reports/bug1555 ~/Dropbox/Public/sb/bug_reports/bug1555
# http://10.0.2.10/Development/bug_reports/bug1555/Screen%20Shot%202012-08-30%20at%2012.42.49%20AM.jpg
# http://dl.dropbox.com/u/9140609/sb/bug_reports/bug1555/Screen%20Shot%202012-08-30%20at%2012.42.49%20AM.jpg

# #  76K	/Users/demo/Desktop/Screen Shot 2012-09-07 at 7.08.03 PM.jpg
# rsync '/Users/demo/Desktop/Screen Shot 2012-09-07 at 7.08.03 PM.jpg' ~/Dropbox/Public/sb/bug_reports/bug1555
# rsync '/Users/demo/Desktop/Screen Shot 2012-09-07 at 7.08.03 PM.jpg' /Volumes/Development/bug_reports/bug1555
# # rm -rf /Volumes/Development/bug_reports/bug1555 ~/Dropbox/Public/sb/bug_reports/bug1555
# http://10.0.2.10/Development/bug_reports/bug1555/Screen%20Shot%202012-09-07%20at%207.08.03%20PM.jpg
# http://dl.dropbox.com/u/9140609/sb/bug_reports/bug1555/Screen%20Shot%202012-09-07%20at%207.08.03%20PM.jpg

# [demo@Taylors-MacBook-Pro:~(master)]$





bug_number=$1
filter=$2

set -e

if test -z "$bug_number"; then
    echo "usage: $0 {bug number} [filename filter]"
    echo "example: $0 1624"
    exit
fi

ls -1tr ~/Desktop/* | while read fname_abs_path; do

    if test ! -z "$filter"; then
	if test 0 -eq $(echo "$fname_abs_path" | grep -cEi "$filter"); then
	    continue
	fi
    fi

    du -sh "$fname_abs_path" | sed 's,^,# ,'

    fname=$(basename "$fname_abs_path")

    # printf "mkdir -p ~/Dropbox/Public/sb/bug_reports/bug%d" $bug_number
    # printf " && "

    printf "rsync '%s' ~/Dropbox/Public/sb/bug_reports/bug%d/" "$fname_abs_path" $bug_number
    # printf " && "
    # printf "drop '%s'" "$fname"
    # printf drop "$fname"
    printf "\n"

    # printf "mkdir -p /Volumes/Development/bug_reports/bug%d" $bug_number
    # printf " && "

    printf "rsync '%s' /Volumes/Development/bug_reports/bug%d/" "$fname_abs_path" $bug_number
    printf "\n"

    printf "# rm -rf /Volumes/Development/bug_reports/bug%d ~/Dropbox/Public/sb/bug_reports/bug%d\n" $bug_number $bug_number

    escaped_fname=$(perl -MURI::Escape -e "print uri_escape(qq/$fname/),qq/\n/")
    dev_url=$(printf "http://10.0.2.10/Development/bug_reports/bug%d/%s\n" $bug_number "$escaped_fname")
    dropbox_url=$(printf "http://dl.dropbox.com/u/9140609/sb/bug_reports/bug%d/%s\n" $bug_number "$escaped_fname")

    printf "%s\n" "$dev_url"
    printf "%s\n" "$dropbox_url"

    printf "\n"
done
