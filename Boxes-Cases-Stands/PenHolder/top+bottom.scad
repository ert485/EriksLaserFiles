//8x2 14mm grid
grid= 14;
rows=2;
columns=8;
//difference(){
square([columns*(grid)+(columns+1)*2,2*(grid)+(rows+1)*2]);
//for (r = [1:rows]) {
//for (c = [1:columns]){
//translate([2*c+(grid)*(c-1),2*r+(grid)*(r-1)])
//square(grid);
//}
//}
//}


//edges
difference(){
translate([-5,0])
square([7,2*(grid)+(rows+1)*2]);
translate([-3,2])
square([2,5]);
translate([-3,2*(grid)+(rows+1)*2-2-5])
square([2,5]);
}
difference(){
translate([columns*(grid)+(columns+1)*2-2,0])
square([7,2*(grid)+(rows+1)*2]);
translate([columns*(grid)+(columns+1)*2,2])
square([2,5]);
translate([columns*(grid)+(columns+1)*2,2*(grid)+(rows+1)*2-2-5])
square([2,5]);
}
