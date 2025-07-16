// This is a stand for a Kenowa (14 inch but probably others)
// monitor.

$fn=100;

// 20 degree angle
difference() {
    square([68,50]);
    translate([50,5,0]) rotate(20) square([11,50]);
    translate([69,-1,0]) rotate(20) square([11,50]);
    translate([50,15,0]) square([20,60]);
    translate([40,35,0]) square([20,60]);
    translate([-20,50,0]) circle(r=50);
}

/*
// 10 degree angle
difference() {
    square([68,50]);
    translate([50,5,0]) rotate(10) square([11,50]);
    translate([69,-1,0]) rotate(20) square([11,50]);
    translate([50,15,0]) square([20,60]);
    translate([50,35,0]) square([20,60]);
    translate([-20,60,0]) circle(r=60);
}
*/

/*
// 5 degree angle
difference() {
    square([68,50]);
    translate([50,5,0]) rotate(5) square([11,50]);
    translate([69,-1,0]) rotate(20) square([11,50]);
    translate([50,15,0]) square([20,60]);
    translate([50,35,0]) square([20,60]);
    translate([-20,65,0]) circle(r=65);
}
*/