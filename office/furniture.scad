// modules for furniture and devices we own

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
    color("#3c4254") cube([480, 760, 1090]);
    color("#7e888e") translate([50,350,1090]) cube([280, 360, 350]);
}

module fridge() {
    color("#fff") cube([550, 550, 1430]);
    color("#3c4245") translate([50,50,1430]) cube([450, 450, 350]);
}

module storagerack() {
    color("#aaa9ad") difference() {
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
    color("#000") cube([800,600,1200]);
    color("#f00") translate([-600,0,0]) cube([2000,600,1]);
}

module laser() {
	color("#f88") translate([100,100,740])  cube([1000, 640, 270]);
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

// https://shop.almasy.eu/nl/product/detail/2-niveaus-incl-spaanplaat/0YBKq
module almamidi(rackw=800, rackl=2010, rackh=2500, shelves=4, shelfstarth=300) {
    // rackl is the *total* length, including pole thickness!
    polet=80; // seems to be always 80

    color("#00f") {
        translate([0, 0, 0])  cube([polet,polet,rackh]);
        translate([rackw-polet, rackl-polet, 0]) cube([polet,polet,rackh]);
        translate([0, rackl-polet, 0]) cube([polet,polet,rackh]);
        translate([rackw-polet, 0, 0]) cube([polet,polet,rackh]);
    }

    module shelf() {
        translate([0, polet, 0]) color("#ff5733") cube([polet, rackl-(2*polet), polet]);
        translate([rackw-polet, polet, 0]) color("#ff5733") cube([polet, rackl-(2*polet), polet]);
        translate([polet,polet,0]) color("#cdaa7d") cube([rackw-(2*polet), rackl-(2*polet), polet]);
    }

    availh=rackh-polet-shelfstarth;
    shelves = shelves-1;

    shelfspacing = (availh - (shelves * polet)) / shelves;

    for (layer = [0:1:shelves]) {
        translate([0,0,(shelfspacing*layer)+(layer*polet)+shelfstarth]) shelf();
    }
}
