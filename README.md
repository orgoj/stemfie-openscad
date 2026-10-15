# STEMFIE OpenSCAD parts

Parametric OpenSCAD models of extra parts for the open construction kit
[STEMFIE](https://stemfie.org).

## Models

| File | Description |
|---|---|
| `models/stemfie-connector.scad` | Pin connectors: straight (I), flat L/T/X, 3D inner corner, plate/side wall. Optional expandable pins locked with 1.75 mm filament. Presets in `stemfie-connector.json`. |
| `models/stemfie-plate.scad` | Plate with a STEMFIE hole grid, size in block units (BU = 12.5 mm). |
| `models/stemfie-wheel.scad` | Spoked rope pulley with a STEMFIE hub. |
| `models/stemfie-28byj48-transmission.scad` | Adapter from the 28BYJ-48 stepper motor shaft to a STEMFIE shaft. |

Ready-to-print exports are in `stl/`.

## Printables

- [STEMFIE connectors with filament-locked expandable pins](https://www.printables.com/model/1878358) (`stemfie-connector`)

## Usage

```bash
git clone --recurse-submodules <repo-url>
# or, in an existing clone:
git submodule update --init --recursive
```

Open a model in OpenSCAD and set parameters in the Customizer. To export
from the command line, using a saved preset:

```bash
openscad --export-format binstl \
  -p models/stemfie-connector.json -P plate \
  -o plate.stl models/stemfie-connector.scad
```

## Dependencies

- [OpenSCAD](https://openscad.org/)
- [Cantareus/Stemfie_OpenSCAD](https://github.com/Cantareus/Stemfie_OpenSCAD)
  as a git submodule in `lib/Stemfie_OpenSCAD`.

## License

- OpenSCAD sources (`models/`): [GPL-3.0-or-later](LICENSE). They build on
  the GPL-licensed Stemfie_OpenSCAD library.
- STL exports (`stl/`): [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/),
  the same license as the STEMFIE parts.

STEMFIE is a project by Paulo Kiefe, see [stemfie.org/license](https://stemfie.org/license).
`models/stemfie-plate.scad` is based on the STEMFIE.org OpenSCAD BeamMaker template.
