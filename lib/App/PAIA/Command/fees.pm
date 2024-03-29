#ABSTRACT: list fees
package App::PAIA::Command::fees;
use strict;
use v5.10;
use parent 'App::PAIA::Command';
our $VERSION = '0.27'; #VERSION

sub _execute {
    my ($self, $opt, $args) = @_;

    $self->core_request('GET', 'fees');
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

App::PAIA::Command::fees - list fees

=head1 VERSION

version 0.27

=head1 AUTHOR

Jakob Voß

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
