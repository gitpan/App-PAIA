#ABSTRACT: show current session status
package App::PAIA::Command::session;
use strict;
use v5.10;
use parent 'App::PAIA::Command';
our $VERSION = '0.20'; #VERSION

use App::PAIA::JSON;

sub description {
<<MSG
This command shows the current PAIA auth session.
The exit code indicates whether a session file was found with not-expired
access token and PAIA server URLs. Options --verbose|-v enables details.
MSG
}

sub _execute {
    my ($self, $opt, $args) = @_;

    if (defined $self->session->file ) {
        my $data = $self->session->load;
        say encode_json($data) if $self->verbose;
        my $msg = $self->not_authentificated;
        die "$msg.\n" if $msg;
        say "session looks fine.";
    } else {
        die "no session file found.\n";
    }

    if (!$self->auth) {
        die "PAIA auth server URL not found\n";
    } else {
        $self->log('auth URL: '.$self->auth);
    }

    if (!$self->core) {
        die "PAIA core server URL not found\n";
    } else {
        $self->log('core URL: '.$self->core);
    }

    return;
}

1;

__END__
=pod

=encoding utf-8

=head1 NAME

App::PAIA::Command::session - show current session status

=head1 VERSION

version 0.20

=head1 AUTHOR

Jakob Voß

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

