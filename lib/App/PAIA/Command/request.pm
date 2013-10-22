#ABSTRACT: request one or more items for reservation or delivery
package App::PAIA::Command::request;
use base 'App::PAIA::Command';
use v5.14;
our $VERSION = '0.01'; #VERSION

sub execute {
    my ($self, $opt, $args) = @_;
    die "Not implemented yet!\n";
}

1;

__END__
=pod

=encoding utf-8

=head1 NAME

App::PAIA::Command::request - request one or more items for reservation or delivery

=head1 VERSION

version 0.01

=head1 AUTHOR

Jakob Voß

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

