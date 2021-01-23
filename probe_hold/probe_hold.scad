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

module probe_mount() {
	translate([0, 0, -15]) rotate([90, 0, 0]) {
		translate([0, 0, -10]) {
			difference() {
				cylinder(h=10, r1=7, r2=7, center=true);
				cylinder(h=10, r1=4.5, r2=4.5, center=true);
				translate([10, 0, 0]) cylinder(h=10, r1=8, r2=8, center=true);
			}
		}
	}
}

translate([0, -15, 0]) rotate([90, 0, 0]) pipe_mount();
translate([12, -15, -5]) rotate([90, 0, 0]) probe_mount();

// vim: ts=2:sw=2:noet:commentstring=//\ %s
