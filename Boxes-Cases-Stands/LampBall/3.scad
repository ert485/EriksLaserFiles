lc=120;
d=100+6.5;
tb=10;
t=.01;

m=15;
o=8;
lg=2.8;

f=300;

module base(){	
	intersection(){
		union(){
			translate([-d,0])difference() {
				circle(lc,$fn=f);
				in(r=lc,l=lg,w=5,a=-90);
				in(r=lc,l=lg,w=5,a=-90+10);
				in(r=lc,l=lg,w=5,a=-90-10);

			}
			translate([-d,0]){
				out(r=lc,l=lg,w=2.5,a=-90+1.5);
				out(r=lc,l=lg,w=2.5,a=-90+1.5+10);
				out(r=lc,l=lg,w=2.5,a=-90+1.5-10);

			}
		}
		union(){
			translate([d,0]) difference() {
				circle(lc,$fn=f);
				in(r=lc,l=lg,w=5,a=90-5);
				in(r=lc,l=lg,w=5,a=90+5);
				in(r=lc,l=lg,w=5,a=90-15);
				in(r=lc,l=lg,w=5,a=90+15);
			}
			translate([d,0]){
				out(r=lc,l=lg,w=2.5,a=90-1.5-5);
				out(r=lc,l=lg,w=2.5,a=90-1.5+5);
				//out(r=lc,l=lg,w=2.5,a=90-1.5-15);
				out(r=lc,l=lg,w=2.5,a=90-1.5+15);

			} 
		}
	}
}


module test(){
	difference(){
		base();
		translate([0,lc*sin(acos(d/lc))]) {
			circle(tb,$fn=f);
			cut(15,5,180-m);
			cut(15,5,180+m);
			slice(20,180-m-o/2,o);
			slice(20,180+m+o/2,o);
		}
		translate([0,-lc*sin(acos(d/lc))]){
			circle(tb,$fn=f);		
			cut(10,5,-m);
			cut(10,5,+m);		
		}
	}
}

module slice(r=20,a=0,aw=5){
	rotate(a) intersection(){
		difference(){
			circle(r+t,$fn=f);
			circle(r-t,$fn=f);
		}
		polygon([[0,0],[sin(aw/2)*r*2,cos(aw/2)*r*2],[-sin(aw/2)*r*2,cos(aw/2)*r*2]]);
	}
}
module cut(out=20,l=5,a=180-10){
	rotate(a) translate([-t/2,out]) square([t,l]);

}

module in(r=lc,l=5,w=5,a=90-5){
	intersection(){
		difference(){
			circle(r,$fn=f);
			circle(r-l,$fn=f);	
		}
		rotate(a) translate([-r*sin(w)/2,0]) square([r*sin(w),r*2]);
	}
}
module out(r=lc,l=5,w=5,a=90-5){
	rotate(a) intersection(){
		difference(){
			circle(r,$fn=f);
			circle(r-l+t,$fn=f);
		}
		polygon([[0,0],[sin(w/2)*r*2,cos(w/2)*r*2],[-sin(w/2)*r*2,cos(w/2)*r*2]]);
	}
}

test();

