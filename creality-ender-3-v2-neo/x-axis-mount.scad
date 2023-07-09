// this cover will mount over the Ender 3 v2 Neo x-axis housing
// it has a holder for a w25xh4mm arm and M3 screwholes at x6/y4.5 and x18/y4.5

$fn=50;

width=30;
height=51;

frontthick=4;
sidesthick=2;
screwhole=5; // d

ledgelong=10;
ledgethick=4;
ledgescrew=4; // d

module plate() {
    translate([0, frontthick, 0]) {
        difference() {
            union() { // combine side with prism shim
                cube(size=[width, 30, sidesthick]); // 30 is how deep the ender cover is

                translate([0, 15, -sidesthick])
                    rotate(a=[0,180,0]) translate([-width, 0, -2]) prism(width, 15, 1.5); // prism shim
            }

            translate([20+(screwhole/2), 30-(screwhole/2)-4, -1])
                cylinder(h=sidesthick+100, d=screwhole);
        }
    }

}

module prism(l, w, h){
    polyhedron(//pt 0        1        2        3        4        5
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}

module ledge() {
        difference() {
                cube(size=[width, ledgelong, 10]);
                translate([1.9, -1, 1.9]) cube(size=[width-4+0.2, ledgelong, 6.2]);

                translate([6.5+2, 5, -1])
                    cylinder(h=12, d=ledgescrew);
                translate([18.5+2, 5, -1])
                    cylinder(12, d=ledgescrew);
        }
}

cube(size=[width, frontthick, height]); // main body

translate([0, 0, height-sidesthick]) plate(); // top plate
mirror([0,0,1]) translate([0, 0, -sidesthick]) plate(); // bottom plate

translate([0,-ledgelong,0]) ledge(); // ledge with box