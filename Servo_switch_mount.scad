module switchmiddle() {
union() {
difference() {
minkowski() {
cube([49,49,2],center=true);
cylinder(r=9,center=true);
}
minkowski() {
cube([33,42,4],center=true);
cylinder(r=3,center=true);
}
}
translate([20.75,0,-4]) cube([2.5,11,6],center=true);
translate([-20.75,0,-4]) cube([2.5,11,6],center=true);
}
}


module switchouter () {
difference() {
minkowski() {
cylinder(r=11, center=true);
cube([59,59,2],center=true);
}
cube([18,60,8],center=true);
cube([60,18,8],center=true);

cube([52,29,8],center=true);
cube([29,52,8],center=true);

cube([3,63,8],center=true);
cube([63,3,8],center=true);

difference() {
cube([49,49,8],center=true);
translate([39,39,0]) rotate([0,0,45]) cube([50,50,8],center=true);
translate([-39,39,0]) rotate([0,0,45]) cube([50,50,8],center=true);
translate([39,-39,0]) rotate([0,0,45]) cube([50,50,8],center=true);
translate([-39,-39,0]) rotate([0,0,45]) cube([50,50,8],center=true);
}
translate([0,0,2])cube([50,50,4],center=true);
}

}

module negative_servo() {
union() {
cube([40,19,33], center=true);
translate([-2.5,0,17]) cube([25,19,5], center=true);
translate([0,0,10.5]) cube([55,20,6], center=true);

translate([24,5,10]) cylinder(r=1.5, h=20, center=true);
translate([24,-5,10]) cylinder(r=1.5, h=20, center=true);
translate([-24,5,10]) cylinder(r=1.5, h=20, center=true);
translate([-24,-5,10]) cylinder(r=1.5, h=20, center=true);

translate([10.5,0,23]) cylinder(r=4.5, h=7, center=true);
translate([10.5,0,18]) cylinder(r=8.5, h=7, center=true);
translate([10.5,0,16]) cylinder(r=10, h=7, center=true);
translate([25,0,-13]) cube([50,7,5], center=true);
}
}

module servomount() {
difference() {
union() {
switchouter();
translate([-9,37,12.5])cube([61,7,28], center=true);
translate([-9,34,1]) rotate([45,0,0]) cube([61,3.5,3.5], center=true); //Bevels
translate([21,37,1]) rotate([0,45,0]) cube([3.5,7,3.5], center=true);
}
translate([-10.5,52.5,14.5]) rotate([90,0,0]) %negative_servo();
}
translate([0,0,4]) %switchmiddle();
}

module hornextension() {
difference() {
union() {
cube([35,18,5], center=true);
translate([-14,4,2]) rotate([0,45,0]) cube([10,10,10], center=true);
translate([14,4,2]) rotate([0,45,0]) cube([10,10,10], center=true);
}
translate([0,0,9.9])cube([45,25,15], center=true);
translate([0,32,0]) rotate ([0,0,45]) cube([50,50,50], center=true);
translate([-42.4,0,0])cube([50,50,15], center=true);
translate([42.4,0,0])cube([50,50,15], center=true);
}
}
servomount();
//hornextension();