#ABSTRACT: get a access token and patron identifier
package App::PAIA::Command::login;
use strict;
use v5.10;
use parent 'App::PAIA::Command';
our $VERSION = '0.27'; #VERSION

sub description {
    "requests or renews an access_token from a PAIA auth server."
}

sub _execute {
    my ($self, $opt, $args) = @_;

    $self->login( $self->explicit_option('scope') );
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

App::PAIA::Command::login - get a access token and patron identifier

=head1 VERSION

version 0.27

=head1 AUTHOR

Jakob Voß

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
