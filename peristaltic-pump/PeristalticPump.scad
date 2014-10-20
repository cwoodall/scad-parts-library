module GM3_motor_shaft(height, diameter, key_length, screw_hole_diameter) {
	difference() {	
		cylinder(h=height, r=diameter/2, center=true, $fn=100);
		translate([0,key_length,0]) cube([diameter,key_length, height+2], center=true);
		translate([0,-key_length,0]) cube([diameter,key_length, height+2], center=true);
		cylinder(h=height+2, r= screw_hole_diameter/2, center=true, $fn=100);
	}
}

module GM3_motor_body() {
	translate([28,0,-20.8/2]){
		color("white")translate([-37/2,0,0])cube([37,22.3,20.8],center=true);
		color("grey")translate([27.2/2,0,0]) rotate([0,90,0]) cylinder(h=27.2,r=18/2, center=true);
	}
}

module GM3_motor() {
	translate([0,0,-2.5]) GM3_motor_body();
	rotate($t*360) color("white") GM3_motor_shaft(5, 7, 4.8, 1);

}
module ball_bearing(od,id,w) {
	difference() {
		cylinder(r=od/2,h=w,center=true);
		cylinder(r=id/2,h=w+2,center=true);
	}
}	

module ShotPumpWheel(height, center_d, n_arms, w_arm, l_arm, hole_diameter) {
	translate([0,0,height/2]) cylinder(h=height,r=center_d/2, center=true, $fn=100);
    cylinder(h=height*.75, r=7,center=true,$fn=100);
	for (z=[0:(n_arms-1)]) {

		rotate((z*360/(n_arms)) + 90) translate([0,l_arm/2,height/2]) {
			difference () {
				union () {
					intersection() {
						cube([w_arm, l_arm, height], center=true);
						translate([0,l_arm/2-w_arm/2,0]) cylinder(r=w_arm/2,h = height, center=true);
					}
					cube([w_arm, l_arm-w_arm, height], center=true);


				}
				translate([0,l_arm/2 - (hole_diameter),0]) {
					cylinder(h=100, r=hole_diameter/2,center=true, $fn=100);
				}
			}
			%translate([0,l_arm/2-hole_diameter*1,height/2+8/2]) ball_bearing(22,8,8);
		}
	}
}

module ShotPump (height, center_d, n_arms, w_arm, l_arm, m_height, m_diameter, m_key_length, hole_diameter) {
	difference() {
		ShotPumpWheel(height, center_d, n_arms, w_arm, l_arm,hole_diameter);
		GM3_motor_shaft(m_height+20,m_diameter,m_key_length,0);
	}
}
module ShotPumpContainer() {

translate([0,0,15/2]) difference() {
cylinder(r=58,h=15,center=true);
cylinder(r=53,h=40,center=true);
	translate([200,0,0]) cube([400,80,50],center=true);

}

intersection() {

union() {
	translate([0,0,-1]) difference() {
		difference() {
			cube([200,900,2],center=true);
			difference() {
			for (i = [1:6]) {
			intersection() {

			rotate(30*2*i + 30) translate([0,-32,0]) cube([12,60,50], center= true);
			cylinder(h=10,r=45, center=true, $fn=100);
		

			}
		}
			cylinder(h=10,r=20, center=true, $fn=100);

}			

		}
		union () {
			translate([10,0,0])cube([20,5,5],center=true);
			cylinder(h=10,r=9, center=true, $fn=100);
		}
	}
//	translate([50,9,0]) cube([25,10,15]);
//	translate([50,-19,0]) cube([25,10,15]);
}
cylinder(r=58,h=200,center=true);

}
}
//rotate([0*$t*360,0*$t*360, $t*0]) {
//GM3_motor();
//rotate($t*360) color("red") ShotPump(4,40,3,17,45, 5,7.2,5,8);
translate([0,0,-0.25])ShotPumpContainer();
//}