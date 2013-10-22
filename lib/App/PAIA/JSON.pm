package App::PAIA::JSON;
use v5.14;
our $VERSION = '0.01'; #VERSION

use base 'Exporter';
our @EXPORT = qw(decode_json encode_json);
use JSON::PP qw();    # core module

sub decode_json {
    my $json = shift;
    my $data = eval { JSON::PP->new->utf8->relaxed->decode($json); };
    if ($@) {
        my $msg = reverse $@;
        $msg =~ s/.+? ta //sm;
        $msg = "JSON error: " . scalar reverse($msg);
        $msg .= " in " . shift if @_;
        die $msg;
    }
    return $data;
}

sub encode_json {
    JSON::PP->new->utf8->pretty->encode($_[0]); 
}

1;


__END__
=pod

=encoding utf-8

=head1 NAME

App::PAIA::JSON

=head1 VERSION

version 0.01

=head1 DESCRIPTION

This class wraps and exports method C<encode_json> and C<decode_json> from
L<JSON::PP>. On encoding JSON is pretty-printed. Decoding is relaxed and
with better error message on failure.

=head1 AUTHOR

Jakob Voß

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
