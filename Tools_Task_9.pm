package Tools_Task_9;
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
		print "Операция типа $action не поддерживается!\n";
	}
}

# функция валидирует пользователя по переданным
# $user_name и $user_passwd
sub _login {
    my ($user_name, $user_passwd) = @_;
	my $result = 0;
    my %user_list = &_read_conf();
    # Есть вариант отказаться от проверки exists
    # всё будет работать, но будем получать warn:
    # Use of uninitialized value 
    if (exists $user_list{$user_name} 
            && $user_list{$user_name} eq $user_passwd) {
        print "Добро пожаловать $user_name!";
		$result = 1;			
    } else {
        print "Неверный логин или пароль";
		$result = 0;
    }
	return $result;
}

# функция регестрирует пользователя по переданным
# $user_name и $user_passwd
sub _reg_user {
    my ($user_name, $user_passwd) = @_;
    my %user_list = &_read_conf();
	my $result = 0;
	unless (exists $user_list{$user_name}) {
		if (&_check_user_name($user_name) && &_check_user_passwd($user_passwd)) {
			$user_list{$user_name} = $user_passwd;
		&_rewrite_config(\%user_list);
		print "Пользователь $user_name зарегестрирован! Ваш пароль: $user_list{$user_name}\n";
		$result = 1;
		}
    } else {
    	print "Пользователь с логином $user_name уже зарегистрирован";
		$result = 1;
    }
	return $result;
}

# функция проверяет на соответствие переданный логин
sub _check_user_name {
    my $user_name = shift;
    my $result = 0;
    if ($user_name =~ m/^[A-Za-z][A-Za-z0-9_-]*[A-Za-z0-9]$/) {
        $result = 1;
    } else {
        print "Логин $user_name не соответствует требованиям!\n";
        $result = 0;
    }
    return $result;
}

# функция проверяет на соответствие переданный пароль
sub _check_user_passwd {
    my $user_passwd = shift;
    my $result = 1;
    if (length($user_passwd) < 8) {
        print "Пароль должен содеражать не менее 8 символов!\n";
        $result = 0;
    }
    if ($user_passwd !~ m/^[A-Za-z]/) {
        print "Пароль должен начинаться с латинской буквы!\n";
        $result = 0;
    }
    if ($user_passwd !~ m/[!@#$%^&*()]/) {
        print "Пароль должен содержать минимум один спецсимвол!\n";
        $result = 0;
    }
    if ($user_passwd !~ m/[A-Z]/) {
        print "Пароль должен содержать минимум один символ в верхнем регистре!\n";
        $result = 0;
    }
    if ($user_passwd !~ m/[0-9]/) {
        print "Пароль должен содержать минимум одину цифру!\n";
        $result = 0;
    }
    return $result;
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
