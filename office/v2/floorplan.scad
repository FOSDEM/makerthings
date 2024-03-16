cube([10000, 5880, 1]); // room
translate([0,0,2720]) difference() {
    cube([10000, 5880, 50]);
    translate([50,50,-1]) cube([9900, 5780, 52]);
} // min ceiling


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

module serverrack() {
    color("#f22") {
        cube([800,600,1200]);
        translate([-600,0,0]) cube([2000,600,1]);
    }
}

module lasertable() {
    translate([0, 0, 0]) {
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

module voyagerstack() {
    color("#8b4513") cube([805,430,140]);

    module box() {
        translate([0,0,]) color("#000") cube([805,430,265]);
        translate([0,0,265]) color("#f00") cube([805,430,40]);
    }

    translate([0,0,140+(0*305)]) box();
    translate([0,0,140+(1*305)]) box();
    translate([0,0,140+(2*305)]) box();
    translate([0,0,140+(3*305)]) box();
    translate([0,0,140+(4*305)]) box();

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

    translate([5000, 5780-3010, 0]) storagerack(); // strorage rack
    translate([5520, 5780-3010, 0]) storagerack(); // strorage rack

    translate([1500, 0,0]) desk_island(); // desk island

    translate([4500,0,0]) lasertable(); // laser


    translate([1730, 5780, 0]) rotate(270) storagerack();

    translate([8600,100,0]) serverrack();

    translate([9900-(0*460),5800,0]) translate([-430,0,0]) rotate(270) voyagerstack();
    translate([9900-(1*460),5800,0]) translate([-430,0,0]) rotate(270) voyagerstack();
    translate([9900-(2*460),5800,0]) translate([-430,0,0]) rotate(270) voyagerstack();
    translate([9900-(3*460),5800,0]) translate([-430,0,0]) rotate(270) voyagerstack();
    translate([9900-(4*460),5800,0]) translate([-430,0,0]) rotate(270) voyagerstack();
    translate([9900-(5*460),5800,0]) translate([-430,0,0]) rotate(270) voyagerstack();
    translate([9900-(6*460),5800,0]) translate([-430,0,0]) rotate(270) voyagerstack();
    translate([9900-(7*460),5800,0]) translate([-430,0,0]) rotate(270) voyagerstack();

    translate([9000, 3500-(0*460), 0]) voyagerstack();
    translate([9000, 3500-(1*460), 0]) voyagerstack();
    translate([9000, 3500-(2*460), 0]) voyagerstack();
    translate([9000, 3500-(3*460), 0]) voyagerstack();
    translate([9000, 3500-(4*460), 0]) voyagerstack();
    translate([9000, 3500-(5*460), 0]) voyagerstack();
}