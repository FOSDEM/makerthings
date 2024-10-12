cellar_width = 2430;
cellar_length = 3040;
cellar_height = 2200;
cellar_front_left = 820;
cellar_front_right = 780;

office_front_window = 2620;
office_front_side_window_left = 700;
office_front_length = 2250;
office_front_width = 4700;
office_front_door_width = 1000;
office_main_width = 5930;
office_main_length = 6680;
office_storage_width = 2340;
office_back_length = 1500;
office_kitchen_width = 2340;
office_corridor_width = 1080;
office_toilet_width = 1000;
office_toilet_length = 2130;
office_height = 2620;

interior_wall_thickness = 100;//guesstimate

module cellar(){
    square([cellar_width, cellar_length]);
}

module office_floor(){
    //front office window area
    square([office_front_width, office_front_length]);
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

//cellar();
office_floor();