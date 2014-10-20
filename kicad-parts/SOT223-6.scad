//Body
translate(v=[0,0,1.80/2]) cube(size=[3.50,6.50,1.80],center=true);

//Major Pin
translate(v=[1.85/2+3.5/2,0,.3]) cube(size=[1.85,3.0,.6],center=true);

module pin() {
	translate(v = [1.85/2+.01,0,.1/2]) cube(size=[1.85-.15,.5,.1], center=true);
	difference() {
	translate(v=[.15/2-.04,0,.5/2]) rotate(a = 73, v= [0,1,0]) cube(size=[.522,.5,.1], center=true);
	
	translate(v=[0,0,-10]) cube(size = 20, center = true);
	}
}

module side_of_pins() {
	translate(v=[3.5/2,-(1.27*4)/2 + 0,0]){
	for(z=[0:4]) {
		translate(v=[0,z*1.27,0]) pin();
	}
}
}

rotate(a=180,v=[0,0,1])side_of_pins();