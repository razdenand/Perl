use strict;
open STDIN, '<input.txt';
open STDOUT, '>output.txt';
my $n = <>;
my @a = split(' ', <>);

sub part{
  my($a, $l, $r) = @_;
  my $i = $l;
  my $j = $r;
  my $m = $a[int(($i + $j) / 2)];
  while($i <= $j){
    while($a[$i] < $m){
      $i++;
    }
    while($a[$j] >$m){
      $j--;
    }
    if($i >= $j){
      last;
    }
    ($a[$i], $a[$j]) = ($a[$j], $a[$i]);
    $i++;
    $j--;
  }
  return $j;
}
sub qsort{
    my($a, $l, $r) = @_;
    if($l < $r){
      my $m = part($a, $l, $r);
      qsort($a, $l, $m);
      qsort($a, $m + 1, $r);
    }
}
qsort(\@a, 0, $#a);
for(my $i = 0; $i <= $#a; $i++){
  print $a[$i], ' ';
}
