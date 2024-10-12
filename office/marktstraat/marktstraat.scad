cellar_width = 2430;
cellar_length = 3040;
cellar_height = 2200;
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

module cellar(){
    square([cellar_width, cellar_length]);
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
    translate([0, office_front_length + office_main_length]) cube([office_main_width, interior_wall_thickness, office_height]);
}

module storage_kitchen_wall(){
    translate([office_storage_width,office_front_length+office_main_length+interior_wall_thickness]) cube([interior_wall_thickness,office_back_length,office_height]);
}

module kitchen_hall_wall() {
    translate([office_main_width-office_hall_width-interior_wall_thickness, office_front_length+office_main_length+interior_wall_thickness]) cube([interior_wall_thickness, office_back_length, office_height]);
}




translate([0,15000]) cellar();
//office_ceiling();
office_floor();
interior_wall();
storage_kitchen_wall();
kitchen_hall_wall();