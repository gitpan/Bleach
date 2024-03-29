package Bleach; $VERSION = '1.11';
my $tie = " \t"x8;
sub whiten { local $_ = unpack "b*", pop; tr/01/ \t/; s/(.{9})/$1\n/g; $tie.$_ }
sub brighten { local $_ = pop; s/^$tie|[^ \t]//g; tr/ \t/01/; pack "b*", $_ }
sub dirty { $_[0] =~ /\S/ }
sub dress { $_[0] =~ /^$tie/ }
open 0 or print "Can't rebleach '$0'\n" and exit;
(my $shirt = join "", <0>) =~ s/.*^\s*use\s+Bleach\s*;\n//sm;
local $SIG{__WARN__} = \&dirty;
do {eval brighten $shirt; exit} unless dirty $shirt && not dress $shirt;
open 0, ">$0" or print "Cannot bleach '$0'\n" and exit;
print {0} "use Bleach;\n", whiten $shirt and exit;
__END__

=head1 NAME

Bleach - For I<really> clean programs

=head1 SYNOPSIS

	use Bleach;

	print "Hello world";

=head1 DESCRIPTION

The first time you run a program under C<use Bleach>, the module
removes all the unsightly printable characters from your source file.
The code continues to work exactly as it did before, but now it
looks like this:

	use Bleach;
											     
					
					  
							
					
				
			 
			 
					  
					   
								
				     
						
								
						
					 
				  
						
						 
					
					 
	   

=head1 DIAGNOSTICS

=over 4

=item C<Can't bleach '%s'>

Bleach could not access the source file to modify it.

=item C<Can't rebleach '%s'>

Bleach could not access the source file to execute it.

=head1 AUTHOR

Damian Conway (as if you couldn't guess)

=head1 COPYRIGHT

   Copyright (c) 2001, Damian Conway. All Rights Reserved.
 This module is free software. It may be used, redistributed
and/or modified under the terms of the Perl Artistic License
     (see http://www.perl.com/perl/misc/Artistic.html)
