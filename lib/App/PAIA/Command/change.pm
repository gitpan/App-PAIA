#ABSTRACT: change login password
package App::PAIA::Command::change;
use strict;
use v5.10;
use parent 'App::PAIA::Command';
our $VERSION = '0.24'; #VERSION

sub _execute {
    my ($self, $opt, $args) = @_;

    my $auth = $self->auth // $self->usage_error("missing PAIA auth URL");

    my %params = (
        patron       => $self->patron,
        username     => $self->username,
        old_password => $self->password,
    );

    $self->auto_login_for('change');

    # Password should not be given as command line option, but as input
    # TODO: better way to get a new password, without echoing
    # e.g. use Term::ReadKey (ReadMode('noecho')) or TermTerm::ReadPassword
    #  See also App::Cmd::Plugin::Prompt or Term::ReadPassword
    {
        print "new password: ";
        chomp(my $pwd = scalar <STDIN>);
        if (length($pwd) < 4) {
            say "your password is too short!";
            redo;
        } else {
            print "please repeat: ";
            chomp(my $pwd2 = scalar <STDIN>);
            if ($pwd2 ne $pwd) {
                say "passwords don't match!"; 
                redo;
            }
        }
        $params{new_password} = $pwd;
    }
     
    $self->request( "POST", "$auth/change", \%params ); 
}

1;

__END__

=pod

=encoding UTF-8

=encoding UTF-8

=head1 NAME

App::PAIA::Command::change - change login password

=head1 VERSION

version 0.24

=head1 AUTHOR

Jakob Voß

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
