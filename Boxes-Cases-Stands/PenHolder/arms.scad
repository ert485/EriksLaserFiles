//arms
grid= 14;
rows=2;
columns=8;

square([2*(grid)+(rows+1)*2,200]);


difference(){
translate([2,-4.4-4.4-2-4])
square([5,4.4+4.4+2+4]);
translate([3,-4.4-4.4-2-3])
square([3,2]);
}

difference(){
translate([-4-3+2*(grid)+(rows+1)*2,-4.4-4.4-2-4])
square([5,4.4+4.4+2+4]);
translate([-4-2+2*(grid)+(rows+1)*2,-4.4-4.4-2-3])
square([3,2]);
}

intersection(){
translate([-500,0])
square([500,200]);
translate([240,200])
circle(260,$fn=100);
}
intersection(){
translate([0,0])
square([500,200]);
translate([-240+2*(grid)+(rows+1)*2,200])
circle(260,$fn=100);
}





//grid
////difference(){
//square([columns*(grid)+(columns+1)*2,2*(grid)+(rows+1)*2]);
////for (r = [1:rows]) {
////for (c = [1:columns]){
////translate([2*c+(grid)*(c-1),2*r+(grid)*(r-1)])
////square(grid);
////}
////}
////}
//
//
////edges
//difference(){
//translate([-5,0])
//square([7,2*(grid)+(rows+1)*2]);
//translate([-3,2])
//square([2,5]);
//translate([-3,2*(grid)+(rows+1)*2-2-5])
//square([2,5]);
//}
//difference(){
//translate([columns*(grid)+(columns+1)*2-2,0])
//square([7,2*(grid)+(rows+1)*2]);
//translate([columns*(grid)+(columns+1)*2,2])
//square([2,5]);
//translate([columns*(grid)+(columns+1)*2,2*(grid)+(rows+1)*2-2-5])
//square([2,5]);
//}
