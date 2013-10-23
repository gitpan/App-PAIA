#ABSTRACT: Renew one or more documents held by a patron
package App::PAIA::Command::renew;
use base 'App::PAIA::Command';
use v5.14;
our $VERSION = '0.10'; #VERSION

use App::PAIA::JSON;

sub description {
    "Renews documents given by their item's (default) or edition's URI."
}

sub usage_desc {
    "%c renew %o URI [item=URI] [edition=URI] ..."
}

sub execute {
    my ($self, $opt, $args) = @_;

    my @docs = $self->uri_list(@$args);
    
    $self->usage_error("Missing document URIs to cancel")
        unless @docs;

    my $response = $self->core_request( 'POST', 'renew', { doc => \@docs } );
    say encode_json($response);
}

1;

__END__
=pod

=encoding utf-8

=head1 NAME

App::PAIA::Command::renew - Renew one or more documents held by a patron

=head1 VERSION

version 0.10

=head1 AUTHOR

Jakob Voß

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

