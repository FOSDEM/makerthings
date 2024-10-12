include <../furniture.scad>

cellar_width = 2430;
cellar_length = 3040;
cellar_height = 2200;
door_height = 2050;
door_width = 800;
cellar_front_left = 820;
cellar_front_right = 780;

office_front_window = 2620;
office_front_side_window_left = 700;
office_front_length = 2250;
office_front_width = 4700;
office_front_door_cutout_width = 200;
office_front_door_cutout_length = 360;
office_front_door_width = 1000;
office_main_width = 5930;
office_main_length = 6680;
office_storage_width = 2340;
office_back_length = 1500;
office_kitchen_width = 2340;
office_hall_width = 1080;
office_toilet_width = 1000;
office_toilet_length = 2130;
office_height = 2620;

interior_wall_thickness = 100;//guesstimate

/* ------------------
The rooms
--------------------*/
module cellar(){
    //floor
    square([cellar_length, cellar_width]);
    translate([cellar_length,0,0]) {
        render() difference(){
            //cellar front wall
            cube([interior_wall_thickness,cellar_width,cellar_height]);
            //cellar front wall door opening
            translate([0,(cellar_width-door_width)/2,0]) cube([interior_wall_thickness+1,door_width,door_height]);
        }
    }
}

module office_floor(){
    //front office window area
    difference() {
        square([office_front_width, office_front_length]);
        translate([office_front_width-office_front_door_cutout_width,office_front_length-office_front_door_cutout_length]) square([office_front_door_cutout_width,office_front_door_cutout_length]);
    }
    //main office area
    translate([0,office_front_length]) square([office_main_width, office_main_length]);
    //storage, kitchen, toilet hall
    translate([0,office_front_length+office_main_length]) {
        square([office_main_width,office_back_length+interior_wall_thickness]);
    }
    //toilet
    translate([office_main_width-office_toilet_width, office_front_length+office_main_length + office_back_length + interior_wall_thickness]) {
        square([office_toilet_width, office_toilet_length]);
    }
}

module office_ceiling(){
    translate([0,0,office_height]) office_floor();
}

module interior_wall(){
    translate([0, office_front_length + office_main_length]) {
        render() difference() {
            cube([office_main_width, interior_wall_thickness, office_height]);
            //storage door opening
            translate([(office_storage_width-door_width)/2,0,0]) cube([door_width, interior_wall_thickness+1, door_height]);
            //kitchen door opening
            translate([office_storage_width+(office_kitchen_width-door_width)/2,0,0]) cube([door_width, interior_wall_thickness+1, door_height]);
            //hall opening
            translate([office_main_width-office_hall_width,0]) cube([office_hall_width, interior_wall_thickness+1, door_height]);
        }
    }
}

module storage_kitchen_wall(){
    translate([office_storage_width,office_front_length+office_main_length+interior_wall_thickness]) cube([interior_wall_thickness,office_back_length,office_height]);
}

module kitchen_hall_wall() {
    translate([office_main_width-office_hall_width-interior_wall_thickness, office_front_length+office_main_length+interior_wall_thickness]) cube([interior_wall_thickness, office_back_length, office_height]);
}

/*-----------------
layout
------------------*/

translate([0,15000]) cellar();
//office_ceiling();
office_floor();
interior_wall();
storage_kitchen_wall();
kitchen_hall_wall();

//office table
translate([1000,150,0]) rotate([0,0,0]) desk_island();
translate([1000,1950,0]) rotate([0,0,0]) desk_island();


//buitenmuur
translate([office_main_width-1000,office_front_length,0])almamidi(rackw=1000, rackh=2250, shelves=2, shelfstarth=1750);
translate([office_main_width-1000,office_front_length+2000,0])almamidi(rackw=1000, rackh=2250, shelves=2, shelfstarth=1750);
translate([office_main_width-1000,office_front_length+4000,0])almamidi(rackw=1000, rackh=2250, shelves=2, shelfstarth=1750);

//centraal tegen binnenmuur
translate([office_storage_width-500,office_front_length+office_main_length-2010,0])almamidi(rackw=1000, rackh=2250, shelves=4, shelfstarth=600);
translate([office_storage_width-500+2010,office_front_length+office_main_length-2010*2+1000,0]) rotate([0,0,90]) almamidi(rackw=1000, rackh=2250, shelves=4, shelfstarth=600);

//centraal tegen gangmuur
translate([0,office_front_length+office_main_length-3010,0]) storagerack();


// storage
translate([600,office_front_length+office_main_length+interior_wall_thickness+office_back_length-600,0]) serverrack();

translate([2250,office_front_length+office_main_length+interior_wall_thickness+office_back_length-800,0]) rotate([0,0,90]) almamidi(rackw=800, rackh=2250, shelves=2, shelfstarth=1250);

// kitchen
translate([office_storage_width+interior_wall_thickness+office_kitchen_width-550,office_front_length+ office_main_length+interior_wall_thickness+office_back_length-550,0]) fridge()

// cellar
translate([430,15000,0]) rotate([0,0,90]) voyagerstack();
translate([930,15000,0]) rotate([0,0,90]) voyagerstack();
translate([1430,15000,0]) rotate([0,0,90]) voyagerstack();
translate([1930,15000,0]) rotate([0,0,90]) voyagerstack();
translate([2430,15000,0]) rotate([0,0,90]) voyagerstack();
translate([2930,15000,0]) rotate([0,0,90]) voyagerstack();

translate([2850,15000+2430-600,0]) rotate([0,0,90]) almamidi(rackl=2700, rackw=600, rackh=2000, shelves=3, shelfstarth=100);