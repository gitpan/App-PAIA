#ABSTRACT: request one or more items for reservation or delivery
package App::PAIA::Command::request;
use base 'App::PAIA::Command';
use v5.14;
our $VERSION = '0.10'; #VERSION

use App::PAIA::JSON;

sub usage_desc {
    "%c request %o URI [item=URI] [edition=URI] ..."
    # storage not supported yet
}

sub execute {
    my ($self, $opt, $args) = @_;

    my @docs = $self->uri_list(@$args);
    
    $self->usage_error("Missing document URIs to request")
        unless @docs;

    my $response = $self->core_request( 'POST', 'request', { doc => \@docs } );
    say encode_json($response);
}

1;

__END__
=pod

=encoding utf-8

=head1 NAME

App::PAIA::Command::request - request one or more items for reservation or delivery

=head1 VERSION

version 0.10

=head1 AUTHOR

Jakob Voß

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

