// https://github.com/Cantareus/Stemfie_OpenSCAD
include <../lib/Stemfie_OpenSCAD/stemfie.scad>

height = 30;
outer_diameter = 60;
center_diameter = 20;
wall = 2;
rim_height = 10;
rim_k = 0.5;
rope_hole = 2;

spokes = 9;

/* constants */
$fn = 64;
epsilon = 0.01;

// calc
rim_width = rim_height * rim_k;

module wheel_base() {
  translate([ 0, 0, -height / 2 ]) linear_extrude(height) {
    difference() {
      /* spokes and inner axle */
      union() {
        if (spokes)
          for (i = [0:spokes - 1]) {
            rotate([ 0, 0, i * 360 / spokes ])
                translate([ outer_diameter * 0.25, 0 ]) square(
                    [ outer_diameter * 0.5 - wall, wall ], center = true);
          }
        circle(d = center_diameter);
      }
      /* cutout for axle */
      // circle(d=center_diameter);
    }

    /* outside ring */
    if (spokes)
      difference() {
        circle(d = outer_diameter);
        circle(d = outer_diameter - 2 * wall);
      }
  }
}

module wheel_with_rim() {
  wheel_base();

  /* rim */
  if (rim_height > 0) {
    MKz() translate([ 0, 0, height / 2 - rim_width - wall ]) difference() {
      union() {
        cylinder(h = rim_width, d1 = outer_diameter,
                 d2 = outer_diameter + 2 * rim_height);
        translate([ 0, 0, rim_width ])
            cylinder(h = wall, d = outer_diameter + 2 * rim_height);
      }
      translate([ 0, 0, -epsilon ])
          cylinder(h = rim_width + wall + 2 * epsilon,
                   d = outer_diameter - 2 * wall + epsilon);
    }
  }
}

// wheel_base();
difference() {
  wheel_with_rim();
  nut_blank(2 + height / BU);
  if (rope_hole > 0) {
    rotate([ 0, 0, 180 / spokes ]) translate([
      (outer_diameter - wall) / 2, 0, height / 2 - rim_width - wall -
      rope_hole
    ]) rotate([ 0, 90, 0 ])
        cylinder(h = wall + 8 * epsilon, d = rope_hole, center = true);
  }
}