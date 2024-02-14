package Tools;
use Exporter(import);
@EXPORT = qw ( login );

use strict;
use warnings;

# путь до конфигурационного файла
my $conf_path = "C:\\pl\\perl_problems\\files\\conf.ini";

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

# функция валидирует пользователя по переданным
# user_name и user_passwd
sub login {
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
