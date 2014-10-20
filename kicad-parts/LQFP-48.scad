// All dimensions in mm
module pin() {
	translate(v = [.60,0,.1/2]) cube(size=[.6,.3,.1], center=true);
	difference() {
	translate(v=[.4/2 -.03,0,.5/2]) rotate(a = 51.3, v= [0,1,0]) cube(size=[.64,.3,.1], center=true);
	
	translate(v=[0,0,-10]) cube(size = 20, center = true);
	}
}

module side_of_pins() {
	translate(v=[0,-.5*6+.25,0]) {
		for (z = [0:11]) {
			translate(v=[7/2,(z*.5),0]) pin();
		}
	}
}

side_of_pins();
rotate(a=90, v=[0,0,1])side_of_pins();
rotate(a=180, v=[0,0,1])side_of_pins();
rotate(a=270, v=[0,0,1])side_of_pins();


h = 1.6;
difference() {
// Form main body of LQFP48 package
translate(v=[0,0,h/2]) cube(size=[7,7,h],center = true);

translate(v = [7/2-1,7/2-1, 6.25]) cylinder(r = .2, h = 10, center = true, $fs=.01);
}