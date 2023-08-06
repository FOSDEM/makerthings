// inspired by hansamann's rounded box
// https://github.com/hansamann
// https://www.instructables.com/Creating-a-custom-sized-box-for-3D-printing-with-O/

$fn=200;

// wall thickness is 2mm everywhere
thickness = 2;

length = 125; // inside: 115
width= 85; // inside 75
height = 35; // inside 25
cornerRadius = 4;

// box
difference() {
    translate([cornerRadius, cornerRadius, 0]) {
        difference() {
                rcube(length, width, height, cornerRadius);

                translate([thickness,thickness,thickness]) {
                    rcube(length-(thickness*2), width-(thickness*2), height, cornerRadius);
                }
        }
    }

    // USB-in slot
    translate([22, -1, 19.5]) slot(radius = 3, height = height);

    // USB-out slot
    translate([(width-(3*2))/2, length-(thickness/2)-2, 19.5]) slot(radius = 3, height = height);
}

// lid
translate([width*2+cornerRadius, cornerRadius, 0]) {
    mirror([1,0,0]) {
        rcube(length, width, thickness, cornerRadius);

        difference() {
            translate([(thickness),(thickness),0]) {
                rcube(length-(thickness*2),width-(thickness*2), 4, cornerRadius);
            }

            translate([thickness+2,thickness+2,2]) {
                rcube(length-(thickness*2)-4,width-(thickness*2)-4, 5, cornerRadius);
            }
        }
    }
}

module rcube(length, width, height, radius) {
    cube_radius = 2 * radius;

    minkowski() {
        cube(size=[width-cube_radius,length-cube_radius, height]);
        cylinder(r=radius, h=0.01);
    }
}


module slot(radius, height) {
    translate([0,0,radius]) cube([radius*2,6,height-radius]);
    translate([radius,6,radius]) rotate([90,0,0]) cylinder(r=radius, h=6);
}