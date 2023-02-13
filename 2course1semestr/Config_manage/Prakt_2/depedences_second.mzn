var int: root = 100;
set of int: foo = {100, 110};
set of int: target = {200, 100};
set of int: left = {100};
set of int: right = {100};
set of int: shared = {200, 100};


var foo : f;
var target : t;
var left : l;
var right: r;
var shared : s;

constraint if root == 100 then f>=100 /\ t >= 200 endif;
constraint if f == 110 then l>=100 /\ r >= 100 endif;
constraint if l == 100 then s >= 100 endif;
constraint if (r == 100) then s < 200 endif;
constraint if s == 100 then t >= 100 endif;

solve satisfy;

output ["\(f) \n\(t) \n\(l) \n\(r) \n\(s)"];