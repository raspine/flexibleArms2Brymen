// Code shows generates complete Brymen holder for flexible water pipes.
// Print parts as seperate and glue together, see below.
$fn=100;

module pipe_mount() {
	translate([0, 0, -15]) rotate([90, 0, 0]) {
		translate([0, 0, -10]) {
			difference() {
				cylinder(h=20, r1=4.5, r2=6.5, center=true);
				cylinder(h=20, r1=3, r2=5, center=true);
			}
		}
	}
}
module pipe_mount_solid() {
	translate([0, 0, -15]) rotate([90, 0, 0]) {
		translate([0, 0, -10]) {
			difference() {
				cylinder(h=20, r1=4.5, r2=6.5, center=true);
			}
		}
	}
}

module cam_mount() {
	difference() {
		translate([15, 0, 0]) cube( size = [40, 40, 6], center = true);
		translate([20, 0, 3]) cube( size = [18.2, 18.2, 4], center = true);
		translate([20, 0, 0]) cylinder(h=8, r=4.5, center = true);
		translate([2, 15, 17]) rotate([-90, 0, 0]) pipe_mount_solid();
	}
}

translate([0, -15, 0]) rotate([90, 0, 0]) pipe_mount();
translate([-2, 0, 17]) rotate([180, 0, 0]) cam_mount();

// vim: ts=2:sw=2:noet:commentstring=//\ %s
