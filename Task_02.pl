use strict;
use warnings;

print "---	Задача 02 ---\n\n";

my @users_list = qw( Tom John Donald );
print $ARGV[0]; 		# В условии "просто принтануть"
my $user_input = $ENV{user_name};
my $user_passwd = $ENV{user_passwd};

if (&find($user_input, @users_list) == 1) {
  print "Добро пожаловать $user_input! Твой пароль $user_passwd";
} else {
  print "Ты кто такой $user_input?";
}

sub find {
  my($user_input, @users_list) = @_;
  for my $user_name(@users_list) {
    print "Processing with user $user_name from \@users_list \n";
    if ($user_input eq $user_name) {
      return 1;
    }
  }
  return 0;
}
