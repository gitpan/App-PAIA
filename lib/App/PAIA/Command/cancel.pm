#ABSTRACT: cancel requests
package App::PAIA::Command::cancel;
use strict;
use v5.10;
use parent 'App::PAIA::Command';
our $VERSION = '0.26'; #VERSION

sub description {
    "Cancels requests given by their item's (default) or edition's URI."
}

sub usage_desc {
    "%c cancel %o URI [item=URI] [edition=URI] ..."
}

sub _execute {
    my ($self, $opt, $args) = @_;

    my @docs = $self->uri_list(@$args);
    
    $self->usage_error("Missing document URIs to cancel")
        unless @docs;

    $self->core_request( 'POST', 'cancel', { doc => \@docs } );
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

App::PAIA::Command::cancel - cancel requests

=head1 VERSION

version 0.26

=head1 AUTHOR

Jakob Voß

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
