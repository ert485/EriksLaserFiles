lc=120;
d=100+6.5;
tb=10;
t=.002;

m=15;
o=8;
lg=2.8;


module base(){	
	intersection(){
		union(){
			translate([-d,0])difference() {
				circle(lc,$fn=100);
				out(r=lc,l=lg,w=5,a=-90);
				out(r=lc,l=lg,w=5,a=-90+10);
				out(r=lc,l=lg,w=5,a=-90-10);

			}
		}
		union(){
			translate([d,0]) difference() {
				circle(lc,$fn=100);
				out(r=lc,l=lg,w=5,a=90-5);
				out(r=lc,l=lg,w=5,a=90+5);
				out(r=lc,l=lg,w=5,a=90-15);
				out(r=lc,l=lg,w=5,a=90+15);
			}
		}
	}
}


module test(){
	difference(){
		base();
		translate([0,lc*sin(acos(d/lc))]) {
			circle(tb,$fn=100);
			cut(15,5,180-m);
			cut(15,5,180+m);
			slice(20+.06,180-m-o/2,o);
			slice(20+.06,180+m+o/2,o);
		}
		translate([0,-lc*sin(acos(d/lc))]){
			circle(tb,$fn=100);		
			cut(10,5,-m);
			cut(10,5,+m);		
		}
	}
}

module slice(r=20,a=0,aw=5){
	rotate(a) intersection(){
		difference(){
			circle(r+t);
			circle(r-t);
		}
		polygon([[0,0],[sin(aw/2)*r*2,cos(aw/2)*r*2],[-sin(aw/2)*r*2,cos(aw/2)*r*2]]);
	}
}
module cut(out=20,l=5,a=180-10){
	rotate(a) translate([-t/2,out]) square([t,l]);

}

module out(r=lc,l=5,w=5,a=90-5){
	rotate(a) translate([-r*sin(w)/2,r-l]) square([r*sin(w),l]);
}

test();

