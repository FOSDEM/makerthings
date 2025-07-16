module almamidi(rackw=800, rackl=2010, rackh=2500, shelves=4, shelfstarth=0) {
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
        translate([polet,polet,0]) cube([rackw-(2*polet), rackl-(2*polet), polet]);
    }

    availh=rackh-polet-shelfstarth;
    shelves = shelves-1;

    shelfspacing = (availh - (shelves * polet)) / shelves;
    //shelfspacing = rackh / shelves;

    echo(shelfspacing);

    for (layer = [0:1:shelves]) {
        translate([0,0,(shelfspacing*layer)+(layer*polet)+shelfstarth]) shelf();
    }
    
}

almamidi(shelves=2,shelfstarth=1725);