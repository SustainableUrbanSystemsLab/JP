# Specify the main files
@default_files = ('paper.tex','paper_blind.tex','sub_graphical_abstract.tex','sub_highlights.tex','sub_paper.tex','sub_paper_blind.tex');

$pdflatex = 'pdflatex %O -interaction=nonstopmode -shell-escape %S';

# Specify the bibliography
$bibtex = 'bibtex %O %B';
$makeglossaries = 'makeglossaries %O %B';

# Continuous preview mode
$continuous_mode = 1;

# Output to PDF
$pdf_mode = 1;

# Keep auxiliary files
$clean_ext = "";

add_cus_dep( 'acn', 'acr', 0, 'makeglossaries' );
add_cus_dep( 'glo', 'gls', 0, 'makeglossaries' );
$clean_ext .= " acr acn alg glo gls glg";

sub makeglossaries {
	my ($base_name, $path) = fileparse( $_[0] );
	my @args = ( "-q", "-d", $path, $base_name );
	if ($silent) { unshift @args, "-q"; }
	return system "makeglossaries", "-d", $path, $base_name; 
}


# Silence warnings
$silent = 1;



