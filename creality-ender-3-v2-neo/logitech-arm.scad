// based on @janw's C270 mount
// https://www.printables.com/model/68041-logitech-c270-mount-for-ender-3-v2

// this is designed to mount in the x-axis-mount model

// fasteners needed:
// - x-axis mount: 2x 25mm M3 bolt & nut
// - camera: 1x 25mm M3 bolt & nut

$fn=200;

thickness=5.5;
screw=4;

module head() {
    difference() {
        union() {
            difference() { // main block with a corner cutout for rounding
                cube([26, 15, thickness]);
                translate([-1,5,-1]) cube([10, 11, thickness+2]);
            }

            difference() { // cylinder with the bottom cut off, makes the corner of the main block
                translate([10, 5, 0]) cylinder(h=thickness, r=10);
                translate([0,-10,-1]) cube([30, 10, thickness+2]);
                
            }
        
            // cylinders with holes to hold the camera
            translate([26,0,thickness/2]) rotate([-90,0,0]) cylinder(h=15, d=thickness);
        }

        // rounded cutout for clamping
        translate([10,4,-1]) cube([20, 7, thickness+2]);
        translate([10,7.5,-1]) cylinder(h=thickness+2, r=3.5);

        // holes in the cylinders for holding the camera
        translate([26, -1, thickness/2]) rotate([-90,0,0]) cylinder(h=20, d=3);
    }
}

module arm() {
    cr=160;

    difference() {
        union() {
            difference() { // base with screwholes
               cube([25,12,thickness]); 
               translate([22,9,-1]) cube([4, 4, thickness+2]);

                // screwholes
                translate([6, 4.5, -1])
                    cylinder(h=12, d=screw);
                translate([18, 4.5, -1])
                    cylinder(12, d=screw);
            }

            // round the corner of the base
            translate([22, 9, 0]) cylinder(h=thickness, d=6);

            translate([0,12,0]) cube([20,8,thickness]); // link arc to the base
            translate([cr+20, 20, 0]) linear_extrude(thickness) arc(cr, [180, 162], 20, 160);
        }

          translate([cr+16, 20, -1]) linear_extrude(thickness+2) arc(cr, [180, 163], 12, 160);
          translate([4, 12,-1]) cube([12, 8, thickness+2]);
    }

      translate([cr+12, 20, 0]) linear_extrude(thickness) arc(cr, [180, 162], 4, 160);
      translate([8,12,0]) cube([4, 8, thickness]);
      rotate([0,0,-12]) translate([-6, 40, 0]) cube([16,4,thickness]);
}


mirror([0,1,0]) union () {
    arm();
    translate([8.6,75,0]) rotate([0,0,-18]) head();
}


// sector() and arc() based on JustinSDK's modules
// https://openhome.cc/eGossip/OpenSCAD/SectorArc.html

module sector(radius, angles, fn = 24) {
    r = radius / cos(180 / fn);
    step = -360 / fn;

    points = concat([[0, 0]],
        [for(a = [angles[0] : step : angles[1] - 360]) 
            [r * cos(a), r * sin(a)]
        ],
        [[r * cos(angles[1]), r * sin(angles[1])]]
    );

    difference() {
        circle(radius, $fn = fn);
        polygon(points);
    }
}

module arc(radius, angles, width = 1, fn = 24) {
    difference() {
        sector(radius + width, angles, fn);
        sector(radius, angles, fn);
    }
}