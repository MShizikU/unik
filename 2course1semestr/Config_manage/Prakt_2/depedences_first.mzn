int : root = 0;
set of int: menu = { 100, 110, 120, 130, 140, 150 };
set of int: dropdown = { 230, 220, 210, 200, 180 };
set of int: icons = {200, 100};

var menu :  menuitem;
var dropdown : dropdownitem;
var icons : iconitem;

constraint iconitem == 100;
constraint if menuitem >= 110 /\ menuitem <= 150 then dropdownitem >= 200 /\     dropdownitem <= 230 endif;
constraint if menuitem == 100 then dropdownitem == 180 endif;
constraint if dropdownitem >= 200 /\     dropdownitem <= 230 then iconitem ==200 endif;

solve satisfy;

output ["\(menuitem) \n\(dropdownitem) \n\(iconitem)"];