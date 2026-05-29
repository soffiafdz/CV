# CV / cover-letter build recipes.
#
# Two profiles compiled from typst/cv.typ and typst/letter.typ:
#   academic — postdoctoral / research-forward
#   artist   — creative-forward (writer/photographer, pen name "Elena Jacobo")
#
# Outputs land in build/ at the repo root.

set working-directory := 'typst'

build_dir := '../build'

# Default: build all four PDFs (CV + letter for both profiles).
default: cv-academic cv-artist letter-academic letter-artist

# === CV ====================================================================

cv-academic:
    mkdir -p {{build_dir}}
    typst compile cv.typ {{build_dir}}/cv-academic.pdf --input profile=academic

cv-artist:
    mkdir -p {{build_dir}}
    typst compile cv.typ {{build_dir}}/cv-artist.pdf --input profile=artist

watch-cv-academic:
    mkdir -p {{build_dir}}
    typst watch cv.typ {{build_dir}}/cv-academic.pdf --input profile=academic

watch-cv-artist:
    mkdir -p {{build_dir}}
    typst watch cv.typ {{build_dir}}/cv-artist.pdf --input profile=artist

# === Cover letter ==========================================================

letter-academic:
    mkdir -p {{build_dir}}
    typst compile letter.typ {{build_dir}}/letter-academic.pdf --input profile=academic

letter-artist:
    mkdir -p {{build_dir}}
    typst compile letter.typ {{build_dir}}/letter-artist.pdf --input profile=artist

watch-letter-academic:
    mkdir -p {{build_dir}}
    typst watch letter.typ {{build_dir}}/letter-academic.pdf --input profile=academic

watch-letter-artist:
    mkdir -p {{build_dir}}
    typst watch letter.typ {{build_dir}}/letter-artist.pdf --input profile=artist

# === Aliases for convenience ===============================================

# Build both academic outputs (CV + letter).
academic: cv-academic letter-academic

# Build both artist outputs (CV + letter).
artist: cv-artist letter-artist

# === Cleanup ===============================================================

clean:
    rm -rf {{build_dir}}
