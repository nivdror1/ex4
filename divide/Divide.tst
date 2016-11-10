load Divide.hack,
output-file Divide.out,
compare-to Divide.cmp,
output-list RAM[15]%D2.6.2;

set RAM[13] 10,    // 10/2 = 5
set RAM[14] 2,
repeat 1000000 {
  ticktock;
}
output;

set RAM[13] 1,
set RAM[14] 1,
repeat 1000000 {
  ticktock;
}
output;
set RAM[13] 1000,
set RAM[14] 1000,
repeat 1000000 {
  ticktock;
}
output;
set RAM[13] 555,
set RAM[14] 789,
repeat 1000000 {
  ticktock;
}
output;

set RAM[13] 17555,
set RAM[14] 14,
repeat 1000000 {
  ticktock;
}
output;

