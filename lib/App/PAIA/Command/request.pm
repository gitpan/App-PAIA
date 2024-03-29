#ABSTRACT: request one or more items for reservation or delivery
package App::PAIA::Command::request;
use strict;
use v5.10;
use parent 'App::PAIA::Command';
our $VERSION = '0.27'; #VERSION

sub usage_desc {
    "%c request %o URI [item=URI] [edition=URI] ..."
    # storage not supported yet
}

sub execute {
    my ($self, $opt, $args) = @_;

    my @docs = $self->uri_list(@$args);
    
    $self->usage_error("Missing document URIs to request")
        unless @docs;

    $self->core_request( 'POST', 'request', { doc => \@docs } );
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

App::PAIA::Command::request - request one or more items for reservation or delivery

=head1 VERSION

version 0.27

=head1 AUTHOR

Jakob Voß

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
