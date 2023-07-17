/**
 * This is a bracket for the Cable Matters USB 3.1 to 4-port Gigabit Ethernet Adapter
 * It fits around the low-profile screw hole and the stand in the Gainta G17081U case
 */

$fn=100;

height=10; // height from the frame up

include <modules/letter.scad>
include <modules/standembracer.scad>

// --------- modules --------- //

module screwholder() { // 10mm high M3 screw holder with ledge
    translate([3,5,0]) difference() {
        cylinder(d=6, h=10);
        cylinder(d=3, h=11);
    }

    translate([1,0,0]) cube([4,3,9]);
    translate([2.1,0,9]) cube([1.8,3,1]);
}

module frame() {
    difference() {

        union() {
            difference() {
                cube([40, 95, 4.5]);
                translate([4,4,-1]) cube([32, 87, 7]); // inner cut-out
            }

            union() { // peninsula (cut-out for low-profile screw hole comes later
                difference() { 
                    cube([16,22,4.5]);
                    translate([12,18,-1]) cube([5,5,7]);

                }

                translate([12,18,0]) cylinder(d=8, h=4.5); // round the corner
            }
        }

        translate([3,90,-1]) cube([11,6,6.5]); // standembracer cut-out
        translate([8.2,14,-1]) cylinder(d=8, h=6.5); // low-profile screw hole cut-out
    }
}

module strainrelief() {
    cutout_d=8;

    difference() {
        union() {
            cube([17,30,4.5]);
            translate([0,23,0]) cube([17,7,height-1.5]);
        }

        translate([0,23,0]) { // screwholes and cut-out
            translate([3,3.5,height-9]) rotate([0,0,90]) cylinder(d=3, h=10);
            translate([14,3.5,height-9]) rotate([0,0,90]) cylinder(d=3, h=10);

            translate([8.5,-1,height-7+(cutout_d/2)+3.5]) rotate([0,90,90]) cylinder(d=cutout_d, h=9);
        }
    }
}

module strainrelief_clip() {
    cutout_d=8;

    difference() {
        cube([7,17,6]);
        translate([-1,8.5,6.5]) rotate([0,90,0]) cylinder(d=cutout_d, h=9);
        translate([3.5,3.5,height-11]) rotate([0,0,90]) cylinder(d=3.5, h=10);
        translate([3.5,13.5,height-11]) rotate([0,0,90]) cylinder(d=3.5, h=10);
    }
}


// --------- assembly --------- //

translate([4,4,5]) rotate([0,0,90]) union() {
    letter("v");
    translate([4,0,0]) letter("4");
}

frame();

translate([0,40,0]) rotate([0,0,90]) strainrelief();

translate([15,40,0]) strainrelief_clip();

translate([8,93.5,0]) {
    standembracer(height-1); // standembracer needs to leave room to hold the board, so height-1
    union() { // faking part of a screw holder to hold up the board
        translate([3,-6.5,0]) cylinder(d=4, h=height-1);
        translate([2.1,-7,height-1]) cube([1.8,3,1]);
    }
}

translate([15,8,0]) {
    rotate([0,0,180]) screwholder();
}

translate([31,8,0]) {
    rotate([0,0,180]) screwholder();
}

translate([24,87,0]) {
    screwholder();
}