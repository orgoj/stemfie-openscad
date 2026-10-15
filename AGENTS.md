# Stemfie OpenSCAD Project – AGENTS.md

Projekt pro návrh a parametrické generování 3D modelů pro otevřenou stavebnici **Stemfie** (https://stemfie.org) pomocí **OpenSCAD**.

---

## 1. Struktura repozitáře

Repozitář je veřejný (GitHub). README je anglicky.

* **`models/`**: vlastní modely (`stemfie-*.scad`) a presety pro Customizer (`stemfie-*.json`).
* **`stl/`**: vybrané publikované exporty (binární STL, licence CC BY-SA 4.0). Vybírá a kopíruje je uživatel.
* **`lib/Stemfie_OpenSCAD/`**: git submodul knihovny `Cantareus/Stemfie_OpenSCAD`.
  * Import v modelech: `include <../lib/Stemfie_OpenSCAD/stemfie.scad>`
  * Neupravovat (ani konce řádků, soubory jsou CRLF).
* **`work/`** (ignorováno): pracovní složka pro vývoj a testování modelů, exporty, slicer projekty.
* **`printables/<model>/`** (ignorováno): podklady pro jednu publikaci na Printables (česky).
  * `popis.md`: název, popis, štítky, licence, seznam souborů.
  * `fotky/`: originály z mobilu (obsahují GPS v EXIF).
  * `upload/`: kopie k nahrání bez EXIF: `convert IN -auto-orient -strip -resize '2400x2400>' -quality 88 OUT`.
* **`ref/`** (ignorováno): cizí referenční soubory (STL ze stemfie.org, cizí `.scad` knihovny). Licence neumožňuje redistribuci, nikdy je necommitovat ani nekopírovat do `models/`.

---

## 2. Standardy a konvence Stemfie

Při tvorbě nebo úpravách modelů dodržujte standardní Stemfie rozměry a pojmenování:

* **Základní rastr (BlockUnit)**: `BU = 12.5` mm.
* **Spojovací otvory**: `Hole = 3.5` mm (poloměr, odpovídá otvoru Ø 7.0 mm pro Stemfie standardní spojovací kolíky a šrouby).
* **Sražení hran**:
  * Otvory: `ChamferHole = 2.45` mm.
  * Vnější hrany nosníků/desek: `ChamferEdge = BU * 1.25`.
* **Rozměry dílů**:
  * `BSX`, `BSY`, `BSZ`: rozměry v násobcích `BU` (např. `BSZ = 0.25` pro tenké desky o tloušťce 3.125 mm, `BSZ = 1` pro standardní nosník 12.5 mm).

---

## 3. Pravidla pro OpenSCAD

1. **Čisté booleovské operace (Difference)**:
   * Nikdy neodčítat plochy lícující přesně s hranou modelu (zabraňuje non-manifold chybám a artefaktům při renderu).
   * Vždy definovat `epsilon = 0.01` a odčítací tělesa posunout o `-epsilon` a natáhnout o `+ 2 * epsilon`.
2. **Kvalita sítě ($fn / rozlišení)**:
   * Vždy dynamicky rozlišovat `$preview` a finální export:
     ```openscad
     preview_fn = 16;
     render_fn = 64;
     $fn = $preview ? preview_fn : render_fn;
     ```
3. **OpenSCAD Customizer**:
   * Konfigurovatelné parametry uvádějte na začátku souboru jako **literály** (ne složené výrazy, jinak je Customizer skryje).
   * Před parametr umístěte popisný komentář (zobrazí se jako tooltip).
   * Krok/rozsah parametru definujte inline komentářem, např. `// [1:1:10]` nebo `// 0.01`.
4. **CLI testování a validace**:
   * Rychlá kontrola syntaxe a zachycení `assert()`:
     ```bash
     openscad -o tmp/dry_run.csg models/model.scad
     ```
     *(Nepoužívat `/dev/null` bez `--export-format`, OpenSCAD by vrátil chybu přípony).*
   * Export STL vždy binárně: `--export-format binstl`.
   * Náhledové rendery a testovací exporty generujte do `tmp/` nebo `work/`, nikdy do kořene ani `models/`.

---

## 4. Pravidla pro Git a verzování

* **Co se commituje:**
  * `models/*.scad`, `models/*.json`, dokumentace, submodul a vybrané binární STL v `stl/`.
  * Jiné 3D soubory (`.3mf`, `.gcode`, `.csg`, STL mimo `stl/`) se necommitují.
* **Submoduly:**
  * Po naklonování repozitáře je nutné inicializovat submoduly:
    ```bash
    git submodule update --init --recursive
    ```
* **Git push:**
  * Nikdy neprovádět `git push` automaticky bez výslovného pokynu uživatele.
