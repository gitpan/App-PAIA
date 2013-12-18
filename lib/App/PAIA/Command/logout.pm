#ABSTRACT: invalidate an access token
package App::PAIA::Command::logout;
use strict;
use v5.10;
use parent 'App::PAIA::Command';
our $VERSION = '0.24'; #VERSION

use App::PAIA::JSON;

sub _execute {
    my ($self, $opt, $args) = @_;

    if ($self->expired) {
        $self->logger("session expired, skip logout"); # TODO: force on request
    } else {
        my $auth = $self->auth // $self->usage_error("missing PAIA auth URL");
        my $response = $self->request( 
            "POST", "$auth/logout", { patron => $self->patron }
        );
        print encode_json($response);
    }

    $self->session->purge && $self->logger->("deleted session file");

    return;
}

1;

__END__

=pod

=encoding UTF-8

=encoding UTF-8

=head1 NAME

App::PAIA::Command::logout - invalidate an access token

=head1 VERSION

version 0.24

=head1 AUTHOR

Jakob Voß

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
