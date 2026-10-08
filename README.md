# tokideli-assets

Binary assets (logo, demo recordings, diagrams, etc.) used by [tokideli](https://github.com/ShellShoccar-jpn/tokideli)'s documentation (`README.ja.md` / `README.en.md`, and files under `manual/`).

These are kept in a separate repository so that `git clone`ing tokideli itself doesn't have to pull down binary files (images, GIFs) that aren't needed to build or use the commands, and whose git history would otherwise only grow over time as they get re-recorded/updated.

## Files

* `logo.svg` — project logo/banner.
* `demo.gif` — a recorded terminal session comparing a naive `while`/`sleep` loop against `valve -l`.
* `demo.sh` / `demo.tape` — the script and [vhs](https://github.com/charmbracelet/vhs) recipe used to produce `demo.gif`. To regenerate it, copy `demo.sh` into the tokideli repository root (it references `c_src/valve`) and run `vhs demo.tape` from there.
* `valve_as_wave_generator_on_raspi_fig01.png` / `_fig02.png` — the connection diagram and measurement-setup photo used by tokideli's `manual/valve_as_wave_generator_on_raspi.info.ja.md` / `.en.md`.

## License

Same as tokideli: public domain ([CC0](https://creativecommons.org/share-your-work/public-domain/cc0) / [the Unlicense](https://unlicense.org/)).
