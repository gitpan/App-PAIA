#ABSTRACT: get a access token and patron identifier
package App::PAIA::Command::login;
use base 'App::PAIA::Command';
use v5.14;
our $VERSION = '0.11'; #VERSION

use App::PAIA::JSON;

sub description {
    "requests or renews an access_token from a PAIA auth server."
}

sub execute {
    my ($self, $opt, $args) = @_;

    my $response = $self->login( $self->explicit_option('scope') );
    print encode_json($response);
}

1;

__END__
=pod

=encoding utf-8

=head1 NAME

App::PAIA::Command::login - get a access token and patron identifier

=head1 VERSION

version 0.11

=head1 AUTHOR

Jakob Voß

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

