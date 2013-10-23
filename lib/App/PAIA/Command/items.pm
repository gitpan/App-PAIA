#ABSTRACT: list loans, reservations and other items related to a patron
package App::PAIA::Command::items;
use base 'App::PAIA::Command';
use v5.14;
our $VERSION = '0.11'; #VERSION

use App::PAIA::JSON;

sub execute {
    my ($self, $opt, $args) = @_;

    my $response = $self->core_request('GET', 'items');
    print encode_json($response);
}

1;

__END__
=pod

=encoding utf-8

=head1 NAME

App::PAIA::Command::items - list loans, reservations and other items related to a patron

=head1 VERSION

version 0.11

=head1 AUTHOR

Jakob Voß

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

