use t::TestModuleCompile tests => 1;

use lib 't/lib';

BEGIN { unlink 't/lib/Foo.pmc' }

use Foo;

run_is module => 'pmc';

sub fixup {
    s/0\.\d\d/0.XX/;
    s/0x[0-9A-Fa-f]{4,8}/0xXXXXXXXX/;
}

__DATA__
=== Compile Foo.pm to Foo.pmc
--- module read_file fixup: t/lib/Foo.pmc
--- pmc -trim
# Generated by Indented 0 (Module::Compile 0.XX) - do not edit!
#line 0 ##########((( 32-bit Checksum Validator )))##################
BEGIN { use 5.006; local (*F, $/); ($F = __FILE__) =~ s!c$!!; open(F)
or die "Cannot open $F: $!"; binmode(F, ':crlf'); if (unpack('%32N*',
$F=readline(*F)) != 0xXXXXXXXX) { use Filter::Util::Call; my $f = $F;
filter_add(sub { filter_del(); 1 while filter_read(); $_ = $f; 1; })}
#line 0
} ###################################################################
package Foo;

=head1 Tricksy
__END__
=cut


sub greetings {
    print "Hello " . shift;
}


sub farewell {
    print "Goodbye " . shift;
}

1;

__END__

=head1 NAME

t::Foo - Hello and Goodbye

=cut
