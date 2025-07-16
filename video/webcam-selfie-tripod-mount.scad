// This is a mount for some models of Logitech webcams (similar to C270)
// It allows you to clamp the webcam in a cellphone mount, such as the one
// found on a selfie stick
//
// fasteners needed:
// - camera: 1x 25mm M3 bolt & nut

// TODO: add flanges?

$fn=200;

cubet=15; // thichness of the cube holding the thing
cubew=15;
cubel=65;

headt=5.5; // thickness of the rings protruding from the cube
headw=15; // total width of the ring thing
headl=24; // how far the rings protrude

screw=3;

module head() {
    translate([0,-headw/2,(cubet-headt)/2]) difference() {
        union() {        
            cube([headl, headw, headt]);
            // cylinders with holes to hold the camera
            translate([headl, 0, headt/2]) rotate([-90,0,0]) cylinder(h=headw, d=headt);
        }

        // holes in the cylinders for holding the camera
        translate([headl, -1, headt/2]) rotate([-90,0,0]) cylinder(h=headw+2, d=screw);

        // rounded cutout for clamping
        translate([headl-5,4,-1]) cube([20,7,headt+2]);
    }
    
   translate([0,-cubel/2,0]) cube([cubew,65,cubet]);
}

head();