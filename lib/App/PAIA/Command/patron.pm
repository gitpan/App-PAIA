#ABSTRACT: get general patron information
package App::PAIA::Command::patron;
use strict;
use v5.10;
use parent 'App::PAIA::Command';
our $VERSION = '0.26'; #VERSION

sub _execute {
    my ($self, $opt, $args) = @_;

    $self->core_request( 'GET', 'patron' );
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

App::PAIA::Command::patron - get general patron information

=head1 VERSION

version 0.26

=head1 AUTHOR

Jakob Voß

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
