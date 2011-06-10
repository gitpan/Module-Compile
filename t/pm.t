use t::TestModuleCompile skip_all => 'In progress...';  # tests => 1;

BEGIN { $ENV{PERL5OPT} = '-MModule::Compile=-ext,p,pm' };

pass('foo');

use lib 't/lib';

BEGIN { unlink 't/lib/Pre.pm' }

use Pre;

run_is module => 'pm';

sub fixup {
    s/0\.\d\d/0.XX/;
    s/0x[0-9A-Fa-f]{4,8}/0xXXXXXXXX/;
}

__DATA__
=== Compile Foo.p to Foo.pm
--- module read_file fixup: t/lib/Foo.pm
--- pm -trim
# Generated by Indented 0 (Module::Compile 0.XX) - do not edit!
################((( 32-bit Checksum Validator III )))################
#line 1
BEGIN { use 5.006; local (*F, $/); ($F = __FILE__) =~ s!c$!!; open(F)
or die "Cannot open $F: $!"; binmode(F, ':crlf'); if (unpack('%32N*',
$F=readline(*F)) != 0xXXXXXXXX) { use Filter::Util::Call; my $f = $F;
filter_add(sub { filter_del(); 1 while &filter_read; $_ = $f; 1; })}}
#line 1
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
