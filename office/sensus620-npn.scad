/**
 * Dimensions taken from broodro0ster's "HomeWizard Sensus 620 adapter"
 * This will fit an M18 5V NPN sensor, such as this one:
 * https://nl.aliexpress.com/item/1005004867517992.html
 */

include <modules/rcube.scad>

difference() {
    intersection() {
        rcube([37,37,3], 2);
        cylinder(h=12, r=37);
    }

    translate([2,32.9,0]) rotate([0,0,-10]) rcube([7.5,3.3,3], 1.5);
    translate([36.2,2,0]) rotate([0,0,98]) rcube([7.5,3.3,3], 1.5);
    translate([15.9,9.2,0]) cylinder(h=15,r=16);
}

translate([15.9,9.2,0]) {
    difference() {
        union() {
            cylinder(h=15,r=16);
            translate([0,0,15]) cylinder(h=1,r=16);
        }

        cylinder(h=15, r=13.75, $fn=6); // hexagon
        translate([0,0,15]) cylinder(h=1,r=11.5);
    }
}
