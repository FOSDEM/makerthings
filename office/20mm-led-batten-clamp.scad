// This is a mount for cheap Hoftronic LED batten, which clamps
// around a standard 20mm (PVC) pipe, such as the ones used for
// electrical conduits.

$fn = 200;

height = 15;
width=63;

translate([15,0,0]) difference() { // x=trans cyl+d
    translate([-3,0,0]) cylinder(height, d=24);
    translate([0,0,-1]) cylinder(height+2, d=20);
    translate([5,-50,-1]) cube([100,100,height+2]);
}


translate([0,-width/2,0]) cube([5,width,height]);

translate([-5,-(width/2)-2,0]) cube([5,5,height]);
translate([-5,(width/2)-3,0]) cube([5,5,height]);