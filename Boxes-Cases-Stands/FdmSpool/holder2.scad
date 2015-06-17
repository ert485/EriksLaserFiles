spoolX=100;
spoolD=25;
spoolS=90;
s=2.8;

//side
sw=35;
sqs=[sw,spoolS+spoolD];

//bottom
bh=35;
sqb=[spoolX+sw,bh];

//top
sqt=[spoolX,spoolD];



module close(h=25,s=3,w=6,t=3){
	difference(){
		square([w+t,h]);
		translate([0,h/2-s/2])square([w,s]);
	}

}


difference(){
	translate([0,0]) square(sqb);
	translate([sw/2,0]) square([s,bh/2]);
	translate([spoolX+sw/2,0]) square([s,bh/2]);
}

translate([0,bh]) square(sqs);
translate([sw,bh+spoolS]) square(sqt);
translate([spoolX+sw,bh+spoolS]) close();




translate([150,0]) {
	difference(){
		square([80,sw]);
		translate([80/2-s/2,0])square([s,sw/2]);
	}




}