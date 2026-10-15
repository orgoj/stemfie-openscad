// OpenSCAD script for creating Stemife.org construction beams
// Feel free to adapt and improve and share your OpenSCAD script (please send
// contact me) Contact: paulo.kiefe@stemfie.org (https://stemfie.org)

// Number of BlockUnits in the X direction
BSX = 5;
// Number of BlockUnits in the Y direction
BSY = 3;
// Number of BlockUnits in the Z direction
BSZ = 0.25; // 0.25

// Universal values

// Universal voxel block unit (mm) in Stemfie (BlockUnit) (12.5);
BU=12.5; //0.1
// Universal radius (mm) of the connection hole (3.5);
Hole = 3.5; //0.1
// Universal tesselation value of curved surfaces
SurfTess = 32;
// Chamfer size adjustment value for connection holes (2.45)
ChamferHole = 2.45;
// ChamferHole = Hole * 0.9;
// Chamfer size adjustment value for outer edges
ChamferEdge = BU * 1.25;

// MODULES
module XHoles() {
  union() {
    translate([ BU / 2, -ChamferHole, BU / 2 ]) rotate([ 270, 0, 0 ])
        cylinder(h = BU / 2, r1 = BU / 2, r2 = 0, $fn = SurfTess);
    translate([ BU / 2, ChamferHole + BSY * BU, BU / 2 ]) rotate([ 90, 0, 0 ])
        cylinder(h = BU / 2, r1 = BU / 2, r2 = 0, $fn = SurfTess);
    translate([ BU / 2, 0, BU / 2 ]) rotate([ 270, 0, 0 ])
        cylinder(r = Hole, h = BSY * BU, $fn = SurfTess);
  }
}

module YHoles() {
  union() {
    translate([ 0, BU / 2, BU / 2 ]) rotate([ 0, 90, 0 ])
        cylinder(r = Hole, h = BSX * BU, $fn = SurfTess);
    translate([ -ChamferHole, BU / 2, BU / 2 ]) rotate([ 0, 90, 0 ])
        cylinder(h = BU / 2, r1 = BU / 2, r2 = 0, $fn = SurfTess);
    translate([ ChamferHole + BSX * BU, BU / 2, BU / 2 ]) rotate([ 0, 270, 0 ])
        cylinder(h = BU / 2, r1 = BU / 2, r2 = 0, $fn = SurfTess);
  }
}
module ZHoles() {
  union() {
    translate([ BU / 2, BU / 2, -ChamferHole ]) rotate([ 0, 0, 0 ])
        cylinder(h = BU / 2, r1 = BU / 2, r2 = 0, $fn = SurfTess);
    translate([ BU / 2, BU / 2, ChamferHole + BSZ*BU ]) rotate([ 180, 0, 0 ])
        cylinder(h = BU / 2, r1 = BU / 2, r2 = 0, $fn = SurfTess);
    translate([ BU / 2, BU / 2, 0 ]) rotate([ 0, 0, 0 ])
        cylinder(r = Hole, h = BU, $fn = SurfTess);
  }
}

module ZArray() {
  for (a = [0:BSX - 1]) {
    translate([ a * BU, 0, 0 ]) {
      for (i = [0:BSY - 1]) {
        translate([ 0, i * BU, 0 ]) ZHoles();
      }
    }
  }
}

module beam() {
  difference() {
    cube([ BU * BSX, BU * BSY, BU * BSZ ]);
    for (i = [0:BSX - 1]) {
      translate([ i * BU, 0, 0 ]) XHoles();
    }
    for (i = [0:BSY - 1]) {
      translate([ 0, i * BU, 0 ]) YHoles();
    }
    ZArray();
  }
}

module plate() {
  difference() {
    cube([ BU * BSX, BU * BSY, BU * BSZ ]);
    ZArray();
  }
}

// beam();
plate();