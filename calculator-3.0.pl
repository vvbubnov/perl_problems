use strict;
use warnings;

my @archive;
my $global_finish = 0;
my $intermediate;

################# main ######################
$intermediate = &_get_user_digit(0);
until ( $global_finish ) {
    my $operation = &_get_user_operation;
    unless ( $global_finish ) {
        my $second_val = &_get_user_digit( $operation eq '/' );
        $intermediate = &_calculate( $intermediate, $operation, $second_val );
        print 'Промежуточное значение: ' . $intermediate . "\n";
    }
}
print "@archive " . $intermediate;
exit(0);
################# end main ##################

# возвращает введённые пользователем данные
# выводит на экран переданную строку перед вводом данных
sub _user_input {
    my $message = shift;
    print $message;
    chomp ( my $user_input = <STDIN> );
    return $user_input;
}

# валидирует введённое число и записывает его в архив
# принимает единицу если предыдущая операция - деление
# возвращает введённое число
sub _get_user_digit {
    my $is_div = shift;
    my $finish = 0;
    until ( $finish ) {
        my $user_digit = &_user_input('Введите число: ');
        if ( $is_div && $user_digit == 0 ) {
            $finish = 0;
            print 'ОШИБКА! На ноль делить нельзя!\n\n';
        } elsif ($user_digit =~ m/ ^ [-+]? \d+ ( \. \d+ )? $ /x){
            $finish = 1;
            push( @archive, $user_digit);
            return $user_digit;
        } else {
            $finish = 0;
            print $user_digit . ' - не является числом!' . "\n\n";
        }
    }
}

# валидирует введённый оператор и записывает его в архив
# возвращает введённый оператор
sub _get_user_operation {
    my $finish = 0;
    until ( $finish ) {
        my $user_operation = &_user_input('Введите операцию ( + - * / ) или = : ');
        if ( $user_operation =~ m/^[+\-\/\*]$/ ) {
            $finish = 1;
            push( @archive, $user_operation );
            return $user_operation;
        } elsif ( $user_operation eq '=') {
            $finish = 1;
            $global_finish = 1;
            push( @archive, $user_operation );
        } else {
            $finish = 0;
            print $user_operation . ' - не является оператором!' . "\n\n";
        }
    }
}

sub _calculate {
    my ( $first_val, $operation, $second_val ) = @_;
    my $result;

    ( $result = $first_val + $second_val ) if $operation eq '+';
    ( $result = $first_val - $second_val ) if $operation eq '-';
    ( $result = $first_val * $second_val ) if $operation eq '*';
    ( $result = $first_val / $second_val ) if $operation eq '/';
    return $result;
}