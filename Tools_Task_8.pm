package Tools_Task_8;
use Exporter(import);
@EXPORT = qw ( action );

use strict;
use warnings;

# путь до конфигурационного файла
my $conf_path = "C:\\pl\\perl_problems\\files\\conf.ini";

# функция принимает $action (либо "log", либо "reg"), 
# $user_name и $user_passwd.
# исходя из $action либо логиним, либо регестрируем
sub action {
	my ( $action, $user_name, $user_passwd) = @_;
	if ( $action eq "log" ) {
		&_login( $user_name, $user_passwd);
	} elsif ( $action eq "reg" ) {
		&_reg_user( $user_name, $user_passwd);
	} else {
		print "Невозможно выполнить операцию!\n";
	}
}

# функция валидирует пользователя по переданным
# $user_name и $user_passwd
sub _login {
    my ($user_name, $user_passwd) = @_;
    my %user_list = &_read_conf();
    # Есть вариант отказаться от проверки exists
    # всё будет работать, но будем получать warn:
    # Use of uninitialized value 
    if (exists $user_list{$user_name} 
            && $user_list{$user_name} eq $user_passwd) {
        print "Добро пожаловать $user_name!";			
    } else {
        print "Неверный логин или пароль";
    }
}

# функция регестрирует пользователя по переданным
# $user_name и $user_passwd
sub _reg_user {
    my ($user_name, $user_passwd) = @_;
    my %user_list = &_read_conf();
	unless (exists $user_list{$user_name}) {
        $user_list{$user_name} = $user_passwd;
		&_rewrite_config(\%user_list);
		print "Пользователь $user_name зарегестрирован! Ваш пароль: $user_list{$user_name}\n";
    } else {
        print "Пользователь с таким логином уже зарегистрирован";
    }
}

# функция читает конф файл и возврашает отфильтрованный
# список пользователей в хэше вида %hash{имя} = пароль
sub _read_conf {
	my @result_arr;
	my %result_hash;

	# быстро вытаскиваем записи из файла в массив
	# чтобы закрыть дескриптор как можно быстрее
	open(FH, '<', $conf_path) or die $!;
	while(<FH>){
		my @entries = split /\s+/, $_; 
		push( @result_arr, @entries );
	}
	close(FH);

	foreach ( @result_arr ) {
		unless (m/^#/) {
			if (m/^(\S+)=(\S+)$/) {
				$result_hash{$1} = $2;
			}
		}
	}
	return %result_hash;
}

# функция принимает хэш вида %hash{имя} = пароль
# и обновляет конфигурационный файл
sub _rewrite_config {
    my $users = shift;
    my $counter = %{$users};
    open (FH, '>', $conf_path);
    while(my($user, $pass) = each(%{$users})) {
        print(FH "$user=$pass\n");
        $counter--;
        if($counter == 0) {
            last;
        }
    }
    close(FH);	
}
