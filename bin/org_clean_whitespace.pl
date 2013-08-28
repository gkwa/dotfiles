# -*- perl -*-

# usage perl -i.bak -w $0 {filename}.
# example perl -i.bak -w org_clean_whitespace.pl notes.txt


while(<>)
{
    if(/^\*+\s/){
        print;
        next;
    }
    s/\s+$//;
    print "$_\n";
}
