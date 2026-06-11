// CV entry point. Page setup + footer + module dispatch.
// All rendering helpers live in lib.typ.
//
// Compile:
//   typst compile cv.typ --input profile=academic
//   typst compile cv.typ --input profile=artist
//
// To switch which sections appear and in what order, edit the `modules`
// array in profile_<name>/metadata.toml.

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
      sc(metadata.at("cv_footer", default: "Curriculum Vitae")
         + " · " + metadata.at("updated", default: "")),
      counter(page).display("1 / 1", both: true),
    )
  ],
)

#set text(font: body-font, size: 10pt, fill: body-color)
// Line leading in em, overridable per profile ([layout] leading = 0.5
// tightens a dense single-page profile without touching content).
#set par(leading: metadata.layout.at("leading", default: 0.55) * 1em)

// === Header =================================================================
#header(
  metadata.personal,
  tagline: metadata.at("header_quote", default: ""),
  subname: metadata.at("subname", default: none),
  subname-prefix: metadata.at("subname_prefix", default: ""),
  subname-suffix: metadata.at("subname_suffix", default: ""),
)

#v(2pt)

// === Body modules ===========================================================
#let modules = metadata.at("modules", default: (
  "professional", "education", "publications", "skills",
))
#for module in modules {
  include "profile_" + profile + "/" + module + ".typ"
}
