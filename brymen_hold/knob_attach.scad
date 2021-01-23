$fn=100;

extender_len=15;
margin=0.1;

module mount(margin=0) {
	difference() {
		union() {
			translate([-1, -6, -2.6]) {
				rotate([0, 90, 0]) {
					linear_extrude(2+margin) polygon(points=[[0,-margin],[0,12+margin],[17,10+margin],[17,2-margin]]);
				}
			}
			rotate([0, 0, 90]) {
				translate([-1, -6, -2.6]) {
					rotate([0, 90, 0]) {
						linear_extrude(2) polygon(points=[[0,-margin],[0,12+margin],[17,10+margin],[17,2-margin]]);
					}
				}
			}
		}
		translate([0, 4, -19]) rotate([90, 0, 0]) {
			cylinder(h=20, r1=3, r2=5, center=true);
		}
	}
}

module extender() {
	translate([-(extender_len+56)/2, 0, -0.2]) rotate([90, 0, 90]) {
		linear_extrude(extender_len+56)
		  polygon(points=[[-12+margin, margin],[11.9, margin],[10-margin, 6-margin],[-10+margin, 6-margin]]);
	}
	// translate([0, 0, 0.7]) cube([(extender_len+56)-2*28, 40, 10], center=true);
}

module pipe_mount() {
	difference() {
		union() {
			translate([0, 0, -15]) rotate([90, 0, 0]) {
				translate([0, 0, -10]) {
					difference() {
						cylinder(h=20, r1=6.5, r2=8.5, center=true);
						cylinder(h=20, r1=4.6, r2=6.6, center=true);
					}
				}
			}
		}
		translate([0, 6, 4]) mount(0.2);
		translate([-10, -3, -25]) cube([20, 10, 20]);
	}
}

translate([10, -6, -4]) pipe_mount();
translate([-10, -6, -4]) pipe_mount();
translate([0, 36.5, -25]) rotate([0, 180, 90])extender();

// vim: ts=2:sw=2:noet:commentstring=//\ %s
