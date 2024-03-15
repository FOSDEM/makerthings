cube([10000, 5880, 1]); // room

module desk_island() {
    color("#00f") {
        difference() {
            cube([1800, 2620, 740]);
            translate([100, -100, -100]) cube([1600, 2820, 740]);
            translate([-100, 100, -100]) cube([2000, 2420, 740]);
        }
    }

    cube([1800, 2620, 1]); // the flickering floor was annoying
}

module cupboard() {
    color("#0ff") cube([480, 760, 1090]);
    color("#0af") translate([50,350,1090]) cube([280, 360, 350]);
}

module fridge() {
    color("#aaf") cube([550, 550, 1430]);
    color("#faf") translate([50,50,1430]) cube([450, 450, 350]);
}

module storagerack() {
    color("#0f0") difference() {
        cube([500, 3010, 2300]);
        translate([-100,100,0]) cube([700, 2810, 475]);
        translate([-100,100,525]) cube([700, 2810, 420]);
        translate([-100,100,1000]) cube([700, 2810, 420]);
        translate([-100,100,1475]) cube([700, 2810, 420]);
        translate([-100,100,1950]) cube([700, 2810, 300]);
    }

    translate([-100,0,0]) cube([700, 3010, 1]);
}

module lasertable() {
    translate([0,1200,0]) rotate(270) {
        color("#f0f") {
            difference() {
                cube([1200, 800, 740]);
                translate([100, -100, -100]) cube([1000, 1000, 740]);
                translate([-100, 100, -100]) cube([1400, 600, 740]);
            }
        }

        color("#f88") translate([100,100,740])  cube([1000, 640, 270]); // laser

        cube([1200, 800, 1]); // the flickering floor was annoying
    }
}

translate([0, 0, 1]) color("#555") {
    translate([0, 240, 0]) cube([200, 810, 2000]); // heating
    translate([0, 4850, 0]) cube([200, 810, 2000]); // heating
    translate([0, 2480, 0]) cube([50, 810, 2000]); // door

    translate([600, 5780, 0]) cube([1030, 50, 2250]); // window

    translate([9930, 1650, 0]) cube([80, 2370, 950]); // heating
}

translate([0, 0, 1]) {
    translate([0, 4250, 0]) fridge(); // fridge
    translate([0, 3480, 0]) cupboard(); // cupboard (coffee)

    translate([5000, 0, 0]) storagerack(); // strorage rack

    translate([1700, 0,0]) desk_island(); // desk island

    translate([0,1150,0]) lasertable(); // laser
}