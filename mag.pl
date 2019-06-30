use strict;
open STDIN, '<input.txt';
open STDOUT, '>output.txt';
my $n = <>;
my @a;
for (my $i = 0; $i < $n; $i++){
  my $kek = <>;
#  print $kek;
  push(@a, $kek);
}
my $ans = 1;
sub solve{
  my ($a, $n) = @_;
  for (my $i = 0; $i < $n - 1; $i++){
    if($a[$i] != $a[$i + 1]){
      $ans++;
    }
  }
  print $ans;
}
solve (\@a, $n);
