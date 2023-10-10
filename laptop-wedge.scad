// small wedge to keep the lid of a Lenovo latop open just enough as
// to not trigger the lid switch; these were glued together using
// superglue

color("blue") {
    difference() {
        square([28,10]);
        translate([25,3.5,0]) square(3);
    }
}

translate([30,0,0]) {
    color("red") {
        translate([0,3.5,0]) square(3);
        translate([3,0,0]) square([25,12]);
    }
}
