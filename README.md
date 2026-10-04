# tokideli-assets

Binary assets (logo, demo recordings, etc.) used by [tokideli](https://github.com/ShellShoccar-jpn/tokideli)'s `README.ja.md` / `README.en.md`.

These are kept in a separate repository so that `git clone`ing tokideli itself doesn't have to pull down binary files (images, GIFs) that aren't needed to build or use the commands, and whose git history would otherwise only grow over time as they get re-recorded/updated.

## Files

* `logo.svg` — project logo/banner.
* `demo.gif` — a recorded terminal session comparing a naive `while`/`sleep` loop against `valve -l`.
* `demo.sh` / `demo.tape` — the script and [vhs](https://github.com/charmbracelet/vhs) recipe used to produce `demo.gif`. To regenerate it, copy `demo.sh` into the tokideli repository root (it references `c_src/valve`) and run `vhs demo.tape` from there.

## License

Same as tokideli: public domain ([CC0](https://creativecommons.org/share-your-work/public-domain/cc0) / [the Unlicense](https://unlicense.org/)).
