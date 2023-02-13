include "alldifferent.mzn";

set of int: count = 1..6;
set of int: numbers = 0..9;
array[count] of var numbers: num;
constraint alldifferent(num);
constraint sum(num[1..3]) == sum(num[4..6]);
solve minimize(sum(num[1..3]));
output ["\(sum(i in count)(num[i] * pow(10, 6-i)))"];
output ["\(num)"];