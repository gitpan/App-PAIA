#ABSTRACT: invalidate an access token
package App::PAIA::Command::logout;
use base 'App::PAIA::Command';
use v5.14;
our $VERSION = '0.10'; #VERSION

use App::PAIA::JSON;

sub execute {
    my ($self, $opt, $args) = @_;

    my $auth = $self->auth // $self->usage_error("missing PAIA auth URL");

    my $response = $self->request( 
        "POST", "$auth/logout", { patron => $self->patron }
    );
    say encode_json($response);

    if (defined $self->session_file) {
        $self->session;
        unlink $self->session_file;
        $self->log("deleted session file");
    }
}

1;

__END__
=pod

=encoding utf-8

=head1 NAME

App::PAIA::Command::logout - invalidate an access token

=head1 VERSION

version 0.10

=head1 AUTHOR

Jakob Voß

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

