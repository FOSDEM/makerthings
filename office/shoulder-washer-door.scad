$fn=200;

difference() {
    union() {
        cylinder(d=9.5, h=20);
        cylinder(d=14, h=2);
    }
    cylinder(d=8.5, h=20);
}