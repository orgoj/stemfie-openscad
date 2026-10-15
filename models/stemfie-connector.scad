// =============================================================================
// Stemfie Parametric Connectors / Spojky pro stavebnici Stemfie
// =============================================================================
// Parametrický model pro generování pevných spojek pro Stemfie moduly.
// Podporuje:
// - Rovné spojky (I)
// - Ploché rohové spojky (L_FLAT)
// - Ploché T-spojky (T_FLAT)
// - Ploché křížové spojky (X_FLAT)
// - Vnitřní rohové 3D spojky (L_CORNER)
//
// Vlastnosti:
// - Bezpečná výška pinu proti kolizi uvnitř bloku (default 2.5 mm < (BU - díra)/2)
// - Vnější náběhový kužel pro snadné navedení
// - Volitelný rozpěrný systém na 1.75mm filament (křížový prořez + vnitřní kužel)
// =============================================================================

/* [Typ a rozměry spojky] */

// Typ spojky
connector_type = "I"; // [I: Rovná (I), L_FLAT: Plochá rohová (L), T_FLAT: Plochá (T), X_FLAT: Plochá křížová (X), L_CORNER: Vnitřní rohová 3D (L), PLATE: Plát / Bočnice (PLATE)]

// Počet otvorů v hlavní ose X
holes_x = 2; // [1:1:10]

// Počet otvorů v ose Y (pro L, T, X, vnitřní roh a plát)
holes_y = 2; // [1:1:10]

// Pozice odbočky pro T-spojku (index otvoru 0..holes_x-1, -1 = automaticky střed)
t_branch_index = -1; // [-1:1:10]

// Tloušťka základní desky (mm, default 3.125 mm = 0.25 BU)
plate_thickness = 3.125; // 0.05

/* [Plát / Boční stěna (PLATE)] */

// Zaoblení vnějších rohů plátu (true = zaoblení R = BU/2 pro slícování s nosníky, false = ostrý obdélník; při aktivním zkosení 45° se ignoruje)
plate_rounded_corners = true;

// Zkosit obvodové hrany pod úhlem 45° pro lícování s kolmou stěnou bez zubu (rozšíří vnější líc o tloušťku desky, automaticky vypne zaoblení)
plate_miter_edges = false;

// Počet pinů od každého rohu po obvodu (0 = všechny po celém obvodu, 1 = pouze rohy, 2 = roh + 1 další pin, atd.)
plate_pins_from_corner = 0; // [0:1:10]

// Vytvořit standardní otvory Stemfie (Ø 7.0 mm) ve vnitřní ploše plátu (pro větrání a montáž dalších prvků)
plate_inner_holes = false;

// Sražení hran vnitřních otvorů (mm, 0.0 = bez sražení)
plate_hole_chamfer = 0.5; // [0.0:0.1:1.5]

/* [Parametry pinů / čepů (Press-fit)] */

// Výška výstupku / pinu (mm). Pro zamezení kolize v krychli Stemfie doporučeno <= 2.75 mm (pro dlouhé/spojovací piny až 15 mm)
pin_height = 2.5; // [1.0:0.05:15.0]

// Přesah průměru pinu proti nominální díře Ø 7.0 mm (kladná hodnota = jde ztuha / tuhý press-fit, mm)
pin_dia_offset = 0.08; // [-0.15:0.01:0.30]

// Kuželovitost pinu (rozdíl průměru mezi patou a vrcholem, mm; kladná = zužuje se, záporná = rozšiřuje se)
pin_taper = 0.18; // [-1.0:0.01:1.00]

// Výška válcové paty pinu od základny před začátkem kužele (mm, např. 3.125 mm = 1/4 BU pro volný průchod přichycovaným dílem)
pin_taper_offset = 0.0; // [0.0:0.05:10.0]

// Korekce rozteče otvorů (záporná hodnota zmenší rozteč a aktivně stahuje hranoly k sobě, mm)
pitch_compensation = 0.0; // [-0.30:0.02:0.30]

// Výška vnějšího náběhového kužele / sražení na špičce pinu (mm)
pin_lead_in = 0.6; // [0.1:0.1:1.5]

/* [Rozpěrný mechanismus na filament] */

// Povolit rozpěrné piny na filament
expandable = true;

// Průměr průchozího otvoru pro filament (mm, standardně 1.9 mm pro 1.75mm filament)
filament_dia = 1.9; // [0.1:0.01:5]

// Průměr na nejužším konci vnitřního kužele (mm, roztáhne se zatlačením 1.75mm filamentu)
cone_tip_dia = 1.3; // [0.1:0.01:5]

// Délka vnitřního kužele na špičce pinu (mm)
cone_length = 1.5; // [0.5:0.1:10]

// Šířka křížových drážek (mm)
slit_width = 0.8; // [0.4:0.05:1.5]

// Hloubka zářezu do základní desky pro lepší pružnost lamel (mm)
slit_extra_depth = 0.5; // [0.0:0.1:1.5]

// Tloušťka uzavírací membrány zespodu otvoru (mm, 0.0 = otevřený průchozí otvor, 0.2 = jedna vrstva tiskové podložky)
pin_membrane_thickness = 0.2; // [0.0:0.05:1.0]

// Zobrazit řez modelem pro kontrolu vnitřního kužele v pinu
cutaway_view = false;

/* [3D Vnitřní rohová spojka & tisk] */

// Tisková orientace pro vnitřní rohovou spojku (otočení o 45° pro tisk bez podpor)
corner_print_orientation = false;

// Šířka zkosení vnějšího vrcholu rohu (mm, 0 = ostrý vrchol bez zkosení)
corner_bed_flat = 2.5; // [0.0:0.5:5.0]

// Výška vnitřního materiálu / zesílení rohu (mm, tloušťka přidaná pod vrchol stříšky pro zpevnění spoje)
corner_inner_reinforce_h = 2.0; // [0.0:0.5:5.0]

// Zkosit spodní hrany ramen rovnoběžně s tiskovou podložkou pro stabilní dosednutí (tisk bez podpor)
corner_arm_chamfer = true;


/* [Kvalita sítě / Render] */
preview_fn = 32;
render_fn = 64;
$fn = $preview ? preview_fn : render_fn;

// =============================================================================
// Stemfie standardní konstanty
// =============================================================================
BU = 12.5;          // Základní bloková jednotka Stemfie (mm)
HoleRadius = 3.5;   // Poloměr otvoru ve Stemfie dílu (mm, Ø 7.0 mm)
epsilon = 0.01;     // Konstanta pro čisté booleovské operace

// Odvozené rozměry a kuželovitost pinu
pin_d_base = 2 * HoleRadius + pin_dia_offset;
pin_d_top  = max(pin_d_base - pin_taper, 4.0);
effective_BU = BU + pitch_compensation;

// =============================================================================
// Geometrické moduly
// =============================================================================

// Jednotlivý pin (kladné těleso) s volitelnou válcovou patou a kuželovým profilem pro press-fit
module pin_solid() {
  lead_h = min(pin_lead_in, pin_height * 0.5);
  h_active = max(0, pin_height - lead_h);
  cyl_h = min(max(0, pin_taper_offset), h_active);
  taper_h = h_active - cyl_h;

  union() {
    // 1. Válcová pata pinu (pro volný průchod přichycovaným dílem např. 1/4 BU bez předčasné deformace kužele)
    if (cyl_h > 0) {
      cylinder(h = cyl_h, d = pin_d_base);
    }

    // 2. Kuželová lisovací část (začíná až za válcovým offsetem)
    if (taper_h > 0) {
      translate([0, 0, cyl_h > 0 ? cyl_h - epsilon : 0])
        cylinder(h = taper_h + (cyl_h > 0 ? epsilon : 0), d1 = pin_d_base, d2 = pin_d_top);
    }

    // 3. Vnější náběhový kužel / fazetka na špičce pro bezproblémový vstup do otvoru
    if (lead_h > 0) {
      translate([0, 0, h_active - epsilon])
        cylinder(h = lead_h + epsilon, d1 = pin_d_top, d2 = max(4.5, pin_d_top - 2 * lead_h));
    }
  }
}

// Otvor a drážky pro pin (odečítací těleso)
// h_base = tloušťka základny, ze které pin vystupuje
module pin_void(h_base = plate_thickness) {
  if (expandable) {
    cut_w = pin_d_base + 2;
    z_start = (pin_membrane_thickness > 0) ? pin_membrane_thickness : -epsilon;
    funnel_h = 0.8;
    cyl_top_z = h_base + pin_height - cone_length;
    cyl_hole_h = max(0.1, cyl_top_z - z_start + epsilon);

    union() {
      // 1. Náběhový trychtýř na vstupu filamentu ze zadní strany (začíná nad případnou membránou)
      translate([0, 0, z_start])
        cylinder(h = funnel_h, d1 = filament_dia + 1.2, d2 = filament_dia);

      // 2. Průchozí válcový otvor pro filament
      translate([0, 0, z_start])
        cylinder(h = cyl_hole_h, d = filament_dia);

      // 3. Vnitřní kuželové zúžení na špičce pinu (roztáhne lamely při zasunutí filamentu)
      translate([0, 0, cyl_top_z])
        cylinder(h = cone_length + 2 * epsilon, d1 = filament_dia, d2 = cone_tip_dia);

      // 4. Křížové drážky (4 pružné lamely)
      slit_start_z = max(z_start + 0.1, h_base - slit_extra_depth);
      slit_h = (h_base + pin_height + epsilon) - slit_start_z;
      translate([0, 0, slit_start_z]) {
        translate([-slit_width / 2, -cut_w / 2, 0])
          cube([slit_width, cut_w, slit_h]);
        translate([-cut_w / 2, -slit_width / 2, 0])
          cube([cut_w, slit_width, slit_h]);
      }
    }
  }
}

// 2D profil základního článku (kolečko o průměru BU)
module unit_circle_2d() {
  circle(d = BU);
}

// Standardní Stemfie průchozí otvor (Ø 7.0 mm) s volitelným sražením hran pro větrání a montáž
module stemfie_hole(h = plate_thickness, chamfer = 0.5) {
  ch = min(chamfer, h * 0.4);
  union() {
    // 1. Průchozí válec
    translate([0, 0, -epsilon])
      cylinder(h = h + 2 * epsilon, r = HoleRadius);

    // 2. Sražení hran na obou stranách pro čistý tisk a snadné zasunutí
    if (ch > 0) {
      // Spodní náběhový kužel
      translate([0, 0, -epsilon])
        cylinder(h = ch + epsilon, r1 = HoleRadius + ch, r2 = HoleRadius);

      // Horní náběhový kužel
      translate([0, 0, h - ch])
        cylinder(h = ch + epsilon, r1 = HoleRadius, r2 = HoleRadius + ch);
    }
  }
}

// =============================================================================
// Ploché spojky (I, L_FLAT, T_FLAT, X_FLAT)
// =============================================================================

// Pomocná funkce pro výběr aktivních pinů na obvodu plátu (PLATE)
function is_plate_hole_active(i, j, nx, ny, count_from_corner) =
  let(
    is_perim = (i == 0 || i == nx - 1 || j == 0 || j == ny - 1)
  )
  !is_perim ? false :
  (count_from_corner <= 0) ? true :
  let(
    dx = min(i, nx - 1 - i),
    dy = min(j, ny - 1 - j),
    dist = (i == 0 || i == nx - 1) && (j == 0 || j == ny - 1) ? 0 :
           (j == 0 || j == ny - 1) ? dx : dy
  )
  dist < count_from_corner;

// Výpočet pozic otvorů pro ploché typy
function get_flat_hole_positions() =
  connector_type == "I" ? [
    for (i = [0 : holes_x - 1]) [(i - (holes_x - 1) / 2) * effective_BU, 0]
  ] :
  connector_type == "L_FLAT" ? concat(
    [[0, 0]],
    holes_x > 1 ? [for (i = [1 : holes_x - 1]) [i * effective_BU, 0]] : [],
    holes_y > 1 ? [for (j = [1 : holes_y - 1]) [0, j * effective_BU]] : []
  ) :
  connector_type == "T_FLAT" ? (
    let(
      bx = (t_branch_index >= 0 && t_branch_index < holes_x) ? t_branch_index : floor((holes_x - 1) / 2)
    )
    concat(
      [for (i = [0 : holes_x - 1]) [i * effective_BU, 0]],
      holes_y > 1 ? [for (j = [1 : holes_y - 1]) [bx * effective_BU, j * effective_BU]] : []
    )
  ) :
  connector_type == "X_FLAT" ? (
    let(
      cx = floor((holes_x - 1) / 2),
      cy = floor((holes_y - 1) / 2)
    )
    // Vycentrováno na středovém průsečíku [0, 0]
    concat(
      [for (i = [0 : holes_x - 1]) [(i - cx) * effective_BU, 0]],
      [for (j = [0 : holes_y - 1]) if (j != cy) [0, (j - cy) * effective_BU]]
    )
  ) :
  connector_type == "PLATE" ? [
    for (i = [0 : holes_x - 1])
      for (j = [0 : holes_y - 1])
        if (is_plate_hole_active(i, j, holes_x, holes_y, plate_pins_from_corner))
          [(i - (holes_x - 1) / 2) * effective_BU, (j - (holes_y - 1) / 2) * effective_BU]
  ] : [];

// Výpočet pozic vnitřních Stemfie otvorů pro plát (PLATE)
function get_plate_inner_hole_positions() =
  (connector_type == "PLATE" && plate_inner_holes && holes_x > 2 && holes_y > 2) ? [
    for (i = [1 : holes_x - 2])
      for (j = [1 : holes_y - 2])
        [(i - (holes_x - 1) / 2) * effective_BU, (j - (holes_y - 1) / 2) * effective_BU]
  ] : [];

// 2D tvar základní desky pro ploché spojky
module flat_plate_2d() {
  if (connector_type == "I") {
    hull() {
      translate([-(holes_x - 1) * effective_BU / 2, 0]) unit_circle_2d();
      translate([(holes_x - 1) * effective_BU / 2, 0]) unit_circle_2d();
    }
  } else if (connector_type == "L_FLAT") {
    union() {
      hull() {
        translate([0, 0]) unit_circle_2d();
        translate([(holes_x - 1) * effective_BU, 0]) unit_circle_2d();
      }
      hull() {
        translate([0, 0]) unit_circle_2d();
        translate([0, (holes_y - 1) * effective_BU]) unit_circle_2d();
      }
    }
  } else if (connector_type == "T_FLAT") {
    let(bx = (t_branch_index >= 0 && t_branch_index < holes_x) ? t_branch_index : floor((holes_x - 1) / 2))
    union() {
      hull() {
        translate([0, 0]) unit_circle_2d();
        translate([(holes_x - 1) * effective_BU, 0]) unit_circle_2d();
      }
      hull() {
        translate([bx * effective_BU, 0]) unit_circle_2d();
        translate([bx * effective_BU, (holes_y - 1) * effective_BU]) unit_circle_2d();
      }
    }
  } else if (connector_type == "X_FLAT") {
    let(
      cx = floor((holes_x - 1) / 2),
      cy = floor((holes_y - 1) / 2)
    )
    union() {
      hull() {
        translate([-cx * effective_BU, 0]) unit_circle_2d();
        translate([(holes_x - 1 - cx) * effective_BU, 0]) unit_circle_2d();
      }
      hull() {
        translate([0, -cy * effective_BU]) unit_circle_2d();
        translate([0, (holes_y - 1 - cy) * effective_BU]) unit_circle_2d();
      }
    }
  } else if (connector_type == "PLATE") {
    let(
      min_x = -(holes_x - 1) * effective_BU / 2,
      max_x =  (holes_x - 1) * effective_BU / 2,
      min_y = -(holes_y - 1) * effective_BU / 2,
      max_y =  (holes_y - 1) * effective_BU / 2,
      w_x   = (holes_x - 1) * effective_BU + BU,
      w_y   = (holes_y - 1) * effective_BU + BU
    )
    if (plate_rounded_corners) {
      hull() {
        translate([min_x, min_y]) unit_circle_2d();
        translate([max_x, min_y]) unit_circle_2d();
        translate([max_x, max_y]) unit_circle_2d();
        translate([min_x, max_y]) unit_circle_2d();
      }
    } else {
      square([w_x, w_y], center = true);
    }
  }
}

// Sestavení ploché spojky
module flat_connector() {
  pts = get_flat_hole_positions();

  difference() {
    union() {
      // 1. Plochá základní deska
      if (connector_type == "PLATE" && plate_miter_edges) {
        // Pokosové zkosení 45°: spodní (vnější) líc je rozšířen o plate_thickness na všech stranách,
        // horní (vnitřní) líc lícuje přesně s obrysem Stemfie lišt, odkud vystupují piny.
        let(
          w_x = (holes_x - 1) * effective_BU + BU,
          w_y = (holes_y - 1) * effective_BU + BU,
          t   = plate_thickness
        )
        hull() {
          translate([0, 0, epsilon / 2])
            cube([w_x + 2 * t, w_y + 2 * t, epsilon], center = true);

          translate([0, 0, t - epsilon / 2])
            cube([w_x, w_y, epsilon], center = true);
        }
      } else {
        linear_extrude(height = plate_thickness)
          flat_plate_2d();
      }

      // 2. Těla pinů
      for (p = pts) {
        translate([p[0], p[1], plate_thickness])
          pin_solid();
      }
    }

    // 3. Odečtení vnitřků (otvor pro filament, náběh, vnitřní kužel, křížové prořezy)
    if (expandable) {
      for (p = pts) {
        translate([p[0], p[1], 0])
          pin_void(plate_thickness);
      }
    }

    // 4. Odečtení vnitřních standardních Stemfie otvorů v plátu (větrání a montáž)
    if (connector_type == "PLATE" && plate_inner_holes) {
      for (p = get_plate_inner_hole_positions()) {
        translate([p[0], p[1], 0])
          stemfie_hole(plate_thickness, plate_hole_chamfer);
      }
    }
  }
}

// =============================================================================
// Vnitřní rohová 3D spojka (L_CORNER)
// =============================================================================
// Umísťuje se do vnitřního 90° rohu rámu/krabičky.
// Rameno 1 leží na vnitřní stěně podél osy X (šířka BU v ose Z, čepy směřují ven v ose -Y).
// Rameno 2 leží na vnitřní stěně podél osy Y (šířka BU v ose Z, čepy směřují ven v ose -X).
// Filament se zasouvá pohodlně zevnitř rohu (z osy +Y a +X).
module corner_bracket_3d() {
  w = BU; // šířka rohu (v ose Z odpovídá 1 Stemfie modulu)

  // Otvory ve Stemfie začínají 0.5 BU od hrany rohu
  pos_x = [for (i = [0 : holes_x - 1]) (i + 0.5) * effective_BU];
  pos_y = [for (j = [0 : holes_y - 1]) (j + 0.5) * effective_BU];

  len_x = holes_x * effective_BU;
  len_y = holes_y * effective_BU;

  difference() {
    union() {
      // Rameno X (leží na XZ, tloušťka v Y)
      translate([0, 0, -w / 2])
        cube([len_x, plate_thickness, w]);

      // Rameno Y (leží na YZ, tloušťka v X)
      translate([0, 0, -w / 2])
        cube([plate_thickness, len_y, w]);

      // Vnitřní zesílení rohu (přidání materiálu pod vrchol pro zvýšení pevnosti)
      if (corner_inner_reinforce_h > 0) {
        leg = corner_inner_reinforce_h * sqrt(2);
        translate([plate_thickness - epsilon, plate_thickness - epsilon, -w / 2])
          linear_extrude(height = w)
            polygon([
              [0, 0],
              [leg + epsilon, 0],
              [0, leg + epsilon]
            ]);
      }

      // Čepy na rameni X (směřují ven v -Y)
      for (x = pos_x) {
        translate([x, 0, 0])
          rotate([90, 0, 0])
            pin_solid();
      }

      // Čepy na rameni Y (směřují ven v -X)
      for (y = pos_y) {
        translate([0, y, 0])
          rotate([0, -90, 0])
            pin_solid();
      }
    }

    // Odečtení otvorů na filament a křížových drážek
    if (expandable) {
      // Pro čepy ramene X (filament vstupuje z +Y směrem do -Y)
      for (x = pos_x) {
        translate([x, plate_thickness, 0])
          rotate([90, 0, 0])
            pin_void(plate_thickness);
      }

      // Pro čepy ramene Y (filament vstupuje z +X směrem do -X)
      for (y = pos_y) {
        translate([plate_thickness, y, 0])
          rotate([0, -90, 0])
            pin_void(plate_thickness);
      }
    }

    // Zkosení vnějšího vrcholu rohu
    if (corner_bed_flat > 0) {
      translate([-epsilon, -epsilon, 0])
        rotate([0, 0, 45])
          translate([-corner_bed_flat / 2, -corner_bed_flat / 2, -w / 2 - epsilon])
            cube([corner_bed_flat, corner_bed_flat, w + 2 * epsilon]);
    }

    // Zkosení konců ramen rovnoběžně s tiskovou podložkou (tisk bez podpor)
    if (corner_arm_chamfer) {
      // Seříznutí konce ramene X pod úhlem 45°
      translate([0, 0, -w / 2 - epsilon])
        linear_extrude(height = w + 2 * epsilon)
          polygon([
            [len_x, -epsilon],
            [len_x + plate_thickness + 10, -epsilon],
            [len_x + plate_thickness + 10, plate_thickness + epsilon],
            [len_x - plate_thickness, plate_thickness + epsilon]
          ]);

      // Seříznutí konce ramene Y pod úhlem 45°
      translate([0, 0, -w / 2 - epsilon])
        linear_extrude(height = w + 2 * epsilon)
          polygon([
            [-epsilon, len_y],
            [-epsilon, len_y + plate_thickness + 10],
            [plate_thickness + epsilon, len_y + plate_thickness + 10],
            [plate_thickness + epsilon, len_y - plate_thickness]
          ]);
    }
  }
}

// Zobrazení vnitřního rohu s volitelnou orientací pro 3D tisk
module corner_bracket_oriented() {
  if (corner_print_orientation) {
    // Orientace "stříška" (obrácené V):
    // Vnější stěny a všechny piny směřují vzhůru pod úhlem 45° do volného prostoru.
    // Zkosené konce ramen dosedají celou plochou na tiskovou podložku (Z=0).
    // Zcela bez nutnosti podpor!
    len_max = max(holes_x, holes_y) * effective_BU;
    h_shift = (corner_arm_chamfer ? len_max : (len_max + plate_thickness)) * sin(45);
    translate([0, 0, h_shift])
      rotate([-90, 0, 0])
        rotate([0, 0, 45])
          corner_bracket_3d();
  } else {
    corner_bracket_3d();
  }
}

// =============================================================================
// Hlavní sestavení modelu
// =============================================================================
module base_model() {
  if (connector_type == "L_CORNER") {
    corner_bracket_oriented();
  } else {
    flat_connector();
  }
}

module stemfie_connector() {
  if (cutaway_view) {
    // Provede řez středem pinu pod úhlem 45° (mimo křížové drážky 0° a 90°),
    // což krásně odhalí profil stěny, průchozí otvor i vnitřní kuželové zúžení
    pts = (connector_type == "L_CORNER") ? [[0.5 * BU, 0]] : get_flat_hole_positions();
    center_pt = (len(pts) > 0) ? pts[0] : [0, 0];

    difference() {
      base_model();
      translate([center_pt[0], center_pt[1], 0])
        rotate([0, 0, 45])
          translate([-200, 0, -100])
            cube([400, 200, 200]);
    }
  } else {
    base_model();
  }
}

// Spuštění
stemfie_connector();
