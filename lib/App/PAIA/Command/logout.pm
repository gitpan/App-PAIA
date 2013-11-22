#ABSTRACT: invalidate an access token
package App::PAIA::Command::logout;
use strict;
use v5.10;
use parent 'App::PAIA::Command';
our $VERSION = '0.23'; #VERSION

use App::PAIA::JSON;

sub _execute {
    my ($self, $opt, $args) = @_;

    my $auth = $self->auth // $self->usage_error("missing PAIA auth URL");

    my $response = $self->request( 
        "POST", "$auth/logout", { patron => $self->patron }
    );
    print encode_json($response);

    if (defined $self->session->file) {
        $self->session;
        unlink $self->session->file;
        $self->logger->("deleted session file");
    }

    return;
}

1;

__END__
=pod

=encoding utf-8

=head1 NAME

App::PAIA::Command::logout - invalidate an access token

=head1 VERSION

version 0.23

=head1 AUTHOR

Jakob Voß

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

