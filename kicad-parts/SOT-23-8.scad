// All dimensions in mm
module pin() {
	translate(v = [.45/2+.15-.04,0,.1/2]) cube(size=[.45,.3,.1], center=true);
	difference() {
	translate(v=[.15/2-.04,0,.5/2]) rotate(a = 73, v= [0,1,0]) cube(size=[.522,.3,.1], center=true);
	
	translate(v=[0,0,-10]) cube(size = 20, center = true);
	}
}

module side_of_pins() {
	translate(v=[1.6/2,-1.95/2,0]){
	for(z=[0:3]) {
		translate(v=[0,z*.65,0]) pin();
	}
}
}

// Make main body
side_of_pins();
rotate(a=180, v=[0,0,1]) side_of_pins();
difference() {
translate(v=[0,0,1.15/2]) cube(size=[1.6,3.0,1.15],center=true);

translate(v = [-(1.6/2-.4),3.0/2 -.4, 6]) cylinder(r = .2, h = 10, center = true, $fs=.01);
}
