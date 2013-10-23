#ABSTRACT: get general patron information
package App::PAIA::Command::patron;
use base 'App::PAIA::Command';
use v5.14;
our $VERSION = '0.10'; #VERSION

use App::PAIA::JSON;

sub execute {
    my ($self, $opt, $args) = @_;

    my $response = $self->core_request( 'GET', 'patron' );
    say encode_json($response);
}

1;

__END__
=pod

=encoding utf-8

=head1 NAME

App::PAIA::Command::patron - get general patron information

=head1 VERSION

version 0.10

=head1 AUTHOR

Jakob Voß

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

