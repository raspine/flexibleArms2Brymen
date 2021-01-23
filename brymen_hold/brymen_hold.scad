// Code shows generates complete Brymen holder for flexible water pipes.
// Print parts as seperate and glue together, see below.
$fn=100;

module attacher() {
	difference() {
		cube([38.2, 12, 1.4], center=true);
		difference() {
			cube([38.2, 12, 1.4], center=true);
			cylinder(h=1.3, r=19.1, center=true);
		}
	}
	translate([0, 0, 2.0]) cylinder(h=3, r=9.5/2, center=true);
}

module attach_hold() {
	translate([0, 0, -1.6]) {
		difference() {
			cube([34, 12, 4], center=true);
			difference() {
				cube([34, 12, 4], center=true);
				cylinder(h=2, r=17, center=true);
			}
		}
	}
	translate([10, 0, 0]) mount();
	translate([-10, 0, 0]) mount();
}

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

module pipe_mount() {
	difference() {
		union() {
			translate([0, 0, -15]) rotate([90, 0, 0]) {
				translate([0, 0, -10]) {
					difference() {
						cylinder(h=20, r1=4.5, r2=6.5, center=true);
						cylinder(h=20, r1=3, r2=5, center=true);
					}
				}
			}
		}
		translate([0, 6, 4]) mount(0.2);
	}
}

module complete() {
	attacher();
	attach_hold();
	translate([10, -6, -4]) pipe_mount();
	translate([-10, -6, -4]) pipe_mount();
}

// complete();
// Uncomment each line below and print attacher, attach_hold, and pipe_mount as
// seperate parts and glue together.

// translate([0, 0, 0.7]) attacher();
// rotate([0, 180, 0]) attach_hold();
translate([0, -15, 0]) rotate([90, 0, 0]) pipe_mount();

// vim: ts=2:sw=2:noet:commentstring=//\ %s
