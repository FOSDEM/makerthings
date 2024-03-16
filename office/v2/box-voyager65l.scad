// Keter/Allibert Voyager 65l

ix = 37.5;
iy = 45;
difference() {
    polyhedron(
        points = [
            // bottom
            [   0+ix,   0+iy,   0 ], // 0
            [ 730+ix,   0+iy,   0 ], // 1
            [ 730+ix, 335+iy,   0 ], // 2
            [   0+ix, 335+iy,   0 ], // 3

            // top
            [   0   ,   0   , 325 ], // 4
            [ 805   ,   0   , 325 ], // 5
            [ 805   , 425   , 325 ], // 6
            [   0   , 425   , 325 ], // 7
        ],

        faces = [
            [0,1,2,3],  // bottom
            [4,5,1,0],  // front
            [7,6,5,4],  // top
            [5,6,2,1],  // right
            [6,7,3,2],  // back
            [7,4,0,3] // left
        ]
    );

    translate([0,132.5,0]) cube([22.5+ix,160,270]);
    translate([745,132.5,0]) cube([22.5+ix,160,270]);

    translate([48.5,55,0]) cube([710,315,10]);
}

translate([48.5,55,325]) cube([710,315,10]);