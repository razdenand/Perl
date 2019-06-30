use strict;
open STDIN, '<input.txt';
open STDOUT, '>output.txt';
my @used;
my @g;
my @p;
my $lel = 0;
my $kek = 0;

sub dfs{
  my ($s, $used, $g) = @_;
  $used[$s] = 1;
  $lel++;
  for(my $i = 0; $i <= $#{$g[$s]}; $i++){
    my $to = $g[$s][$i];
    if ($used[$to] == 0){
      dfs($to);
    }
  }
}
my @p;
sub bfs{
  my ($s, $used, $g) = @_;
  my @q;
  push(@q, $s);
  $used[$s] = 1;
  $p[$s] = -1;
  while($#q >= 0){
    my $v = $q[$#q];
    pop @q;
    for(my $i = 0; $i <= $#{$g[$v]}; $i++){
      my $to = $g[$v][$i];
      if($used[$to] == 0){
          $used[$to] = 1;
          unshift(@q, $to);
          $p[$to] = $v;
      }
    }
  }
}
my @rer;
push(@g, \@rer);
my $n = <>;
for (my $i = 1; $i <= $n; $i++){
  $used[$i] = 0;
}
for (my $i = 1; $i <= $n; $i++){
  my @a = split(' ', <>);
  my @err;
  for(my $j = 0; $j <= $#a; $j++){
    if($a[$j] == 1){
      push(@{$g[$i]}, $j + 1);
  #  push(@err, $arr[$j]);
    }
  }
#  print @{$g[$i]}, "\n";
}
for(my $i = 1; $i <= $#g;$i++){
  #print @{$g[$i]}, ' ';
}
my ($s, $f) = split(' ', <>);
bfs($s, \@used, \@g);
if($used[$f] == 0){
  print -1;
  exit(0);
}
else{
  my @path;
  for(my $v = $f; $v != -1; $v = $p[$v]){
    push(@path, $v);
  }
  if($#path == 0){
    print 0;
    exit(0);
  }
  @path = reverse(@path);
  print ($#path);
  print "\n";
  for(my $i = 0; $i <= $#path; $i++){
    print $path[$i], ' ';
  }
}
