code_enscript() {
	infile="$1"
	outfilePS="$infile.ps"
	outfilePDF="$infile.pdf"
	enscript --columns=2 --fancy-header --pretty-print --landscape -q -B -C -Esh -G --color --word-wrap -f Courier6 -MA4 -T4 --header='$n %W Page $% of $=' -p - "$infile" >"$outfilePS"
	pstopdf "$outfilePS" -o "$outfilePDF"
}
