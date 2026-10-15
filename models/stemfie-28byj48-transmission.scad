// generate STEMFIE transmission for stepper motor 28BYJ-48

// https://github.com/Cantareus/Stemfie_OpenSCAD
include <../lib/Stemfie_OpenSCAD/stemfie.scad>

// height of transmission
height = 0.75;
// scale of outer dimension xy
scalexy = 1.025;
// clearance around shaft
clearance = 0.08;

// constants
eps = 0.01;

// from https://github.com/scottbez1/splitflap/blob/master/3d/28byj-48.scad
motor_shaft_radius = 5 / 2;
motor_shaft_height = 10;
motor_shaft_slotted_width = 3;
motor_shaft_slotted_height = 6;

module shaft(clearance = 0) {
  difference() {
    cylinder(r = motor_shaft_radius + clearance, h = motor_shaft_height);
    translate([
      -(motor_shaft_radius + eps),
      motor_shaft_slotted_width / 2 + clearance,
      motor_shaft_height - motor_shaft_slotted_height
    ]) {
      cube([
        (motor_shaft_radius + eps) * 2, motor_shaft_radius,
        motor_shaft_slotted_height +
        eps
      ]);
    }
    translate([
      -(motor_shaft_radius + eps),
      -motor_shaft_radius - (motor_shaft_slotted_width / 2) - clearance,
      motor_shaft_height - motor_shaft_slotted_height
    ]) {
      cube([
        (motor_shaft_radius + eps) * 2, motor_shaft_radius,
        motor_shaft_slotted_height +
        eps
      ]);
    }
  }
}

// nut_open();
translate([ 0, 0, height *BU ]) rotate([ 180, 0, 0 ]) D() {
  translate([ 0, 0, BU * height / 2 ]) scale([ scalexy, scalexy, 1 ])
      nut_blank(length = height);
  translate([ 0, 0, -eps ]) shaft(clearance);
}