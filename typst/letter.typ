// Cover letter entry point. Same architecture as cv.typ — page setup +
// header (sender = the user, from metadata) + the letter content from
// profile_<name>/letter.typ.
//
// Compile:
//   typst compile letter.typ --input profile=academic
//   typst compile letter.typ --input profile=artist
//
// Edit the letter content (recipient, subject, body, signoff) in
// profile_<name>/letter.typ.

#import "lib.typ": *

#let profile = sys.inputs.at("profile", default: "academic")
#let metadata = toml("profile_" + profile + "/metadata.toml")

// === Page setup =============================================================
#set page(
  paper: metadata.layout.at("paper_size", default: "us-letter"),
  margin: page-margin,
  footer: context [
    #set text(size: 8pt, fill: subtle)
    #grid(
      columns: (1fr, auto),
      align: (left, right),
      sc(metadata.at("letter_footer", default: "Cover Letter")
         + " · " + metadata.at("updated", default: "")),
      counter(page).display("1 / 1", both: true),
    )
  ],
)

#set text(font: body-font, size: 10pt, fill: body-color)
#set par(leading: 0.55em, justify: true)

// === Header =================================================================
// Reuses the CV header so the letter looks like part of the same document.
#header(metadata.personal, tagline: metadata.at("header_quote", default: ""))

#v(8pt)

// === Letter content =========================================================
// All editable letter content (recipient, date, subject, body, signoff)
// lives in the profile's letter.typ.
#include "profile_" + profile + "/letter.typ"
