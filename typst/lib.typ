// =============================================================================
//  Layout helpers + design constants for the CV / letter.
//
//  This file is the single source of truth for the document's design system:
//  fonts, colors, page margins, and the rendering helpers used by all profile
//  modules. Change a value here and it propagates everywhere.
//
//  Design rules (which helper to use):
//    section()    — top-level heading with red rule (one per CV section)
//    subsection() — sub-grouping label inside a section (e.g. "Recognitions")
//    entry()      — multi-line item with optional bullets/description
//                   (Education, Research, Clinical, Volunteering, Courses)
//    one-line()   — compact single-line item (Honours)
//    skills()     — label + items grid (Skills)
//    header()     — page header (name + tagline + contact line)
//
//  Citation lists in Publications are written directly with typst's `- item`
//  syntax — no helper needed.
// =============================================================================

#import "@preview/fontawesome:0.6.0": *

// === Color palette ==========================================================
//
//   accent     — dark red signature color (section heading first letters,
//                section rules, subsection labels)
//   muted      — secondary metadata gray (locations, dates, descriptions)
//   body-color — primary text color (entry titles, body paragraphs)
//   subtle     — footer text gray
#let accent     = rgb("#671a10")
#let muted      = rgb("#5D5D5D")
#let body-color = rgb("#212529")
#let subtle     = rgb("#999999")

// === Typography =============================================================
#let body-font   = "Source Sans 3"
#let header-font = "Roboto"

// === Page setup =============================================================
#let page-margin = (x: 1.4cm, top: 1.1cm, bottom: 1.3cm)

// === Small typographic primitives ===========================================

// Letter-spaced small caps. Default small-caps without tracking reads tight.
#let sc(body) = text(tracking: 0.06em, smallcaps(body))

// Middle dot separator for inline lists.
#let dot = text(fill: muted)[ · ]

// Inline secondary metadata embedded in a primary title (e.g. money in
// honours: "CONACYT Fellowship #amount[(≈19K CAD)]"). Renders as muted
// regular weight, dropping out of the bold flow.
#let amount(body) = text(weight: "regular", size: 9pt, fill: muted, body)

// === Document header (used by both cv.typ and letter.typ) ===================
//
// Renders the centered identity block: name (light/bold value contrast),
// optional position tagline in small-caps, and contact line with FA icons.
//
// The contact line is DATA-DRIVEN: items render in the order keys appear
// in `metadata.toml`'s `[personal.info]` table. Re-order the keys there
// to re-order the icons in the header.
//
// `person` is the [personal] table from metadata.toml. `tagline` overrides
// the position text (defaults to person.info's custom-position or "").
//
// `subname` (with `subname-prefix` / `subname-suffix`) adds an optional
// identity line between the name and the tagline — e.g. "legal name
// Sofía Fernández Lozano, under which all academic publications appear"
// — sized between the two: subordinate to the name, above the role line.

// Per-contact-type renderers. Each takes the value string and returns the
// inline box to render. Add a new key here to support a new contact type.
#let _phone-clean(s) = s.replace(" ", "").replace("(", "").replace(")", "").replace("-", "")
#let _contact-renderers = (
  phone:    v => box[#fa-phone()         #h(3pt) #link("tel:" + _phone-clean(v))[#v]],
  email:    v => box[#fa-envelope()      #h(3pt) #link("mailto:" + v)[#v]],
  github:   v => box[#fa-square-github() #h(3pt) #link("https://github.com/" + v)[#v]],
  linkedin: v => box[#fa-linkedin()      #h(3pt) #link("https://linkedin.com/in/" + v)[#v]],
  orcid:    v => box[#fa-orcid()         #h(3pt) #link("https://orcid.org/" + v)[#v]],
  website:  v => box[#fa-globe()         #h(3pt) #link("https://" + v)[#v]],
  portfolio: v => box[#fa-feather()      #h(3pt) #link("https://" + v)[#v]],
  scholar:  v => box[#fa-graduation-cap() #h(3pt) #link("https://scholar.google.com/citations?user=" + v)[Google Scholar]],
  location: v => box[#fa-location-dot()  #h(3pt) #v],
)

#let header(person, tagline: none, subname: none, subname-prefix: "", subname-suffix: "") = {
  let info = person.info

  // Resolve tagline: explicit arg → custom-position icon entry → empty.
  let position-text = if tagline != none { tagline } else {
    info.at("custom-position", default: (:)).at("text", default: "")
  }

  // Build the contact row by iterating info in key-insertion order. Skip
  // keys we don't have a renderer for (e.g. "custom-position", "address").
  // A `newline = ""` key breaks the contact line in two at that point.
  let items = ()
  for (key, value) in info {
    if key == "newline" {
      items.push(linebreak())
    } else if key in _contact-renderers {
      items.push((_contact-renderers.at(key))(value))
    }
  }

  align(center)[
    // Name — same bold weight, value contrast for readable distinction.
    #text(font: header-font, size: 28pt, weight: "bold", fill: muted)[#person.first_name#h(4pt)]#text(font: header-font, size: 28pt, weight: "bold", fill: body-color)[#person.last_name]

    // Identity subline: italic muted prefix/suffix around a roman name
    // in body color, set at an intermediate size.
    #if subname != none [
      #v(-1pt)
      #text(size: 10pt, style: "italic", fill: muted)[#subname-prefix#h(4pt)]#text(font: header-font, size: 13pt, fill: body-color)[#subname]#text(size: 10pt, style: "italic", fill: muted)[#subname-suffix]
    ]

    // Position tagline immediately under name (small-caps, body color).
    #if position-text != "" [
      #v(-2pt)
      #text(size: 9pt, fill: body-color)[#sc(position-text)]
    ]

    // Contact line, immediately under the tagline.
    #v(-1pt)
    #text(size: 9pt, fill: muted)[#{
      let result = ()
      let after-break = true
      for item in items {
        if item == linebreak() {
          result.push(item)
          after-break = true
        } else {
          if not after-break { result.push(dot) }
          result.push(item)
          after-break = false
        }
      }
      result.join()
    }]
  ]
}

// === Section heading ========================================================
//
// First-N-letters in accent + trailing rule (also accent). The colored rule
// repeats at every section as the document's signature horizontal element.
#let section(title, accent-letters: 2, above: 14pt) = {
  v(above, weak: true)
  block(below: 6pt, sticky: true)[
    #let head = title.slice(0, calc.min(accent-letters, title.len()))
    #let tail = title.slice(calc.min(accent-letters, title.len()))
    #text(size: 16pt, weight: "bold", fill: accent)[#head]#text(size: 16pt, weight: "bold")[#tail]
    #h(4pt)
    #box(width: 1fr, line(stroke: 0.9pt + accent, length: 100%))
  ]
}

// === Subsection label =======================================================
//
// Sized at 13pt so it reads as clearly more prominent than the 10pt entry
// titles it groups — a real visual hierarchy step.
#let subsection(title) = block(above: 8pt, below: 4pt, sticky: true)[
  #text(size: 13pt, weight: "bold", fill: accent)[#sc(title)]
]

// === Universal entry ========================================================
//
// One shape for entries with substantial content (Experience, Education,
// Courses). Two-row header (primary/secondary, tertiary/quaternary), then
// either a description paragraph or a bulleted list.
//
//   primary    — bold title (org / course / award)
//   tertiary   — small-caps muted label below primary (role / institution).
//                Pass `none` to suppress the second row.
//   secondary  — italic muted, right-aligned (location)
//   quaternary — italic muted, right-aligned (date / year)
//   description — italic muted prose under the header (no bullet)
//   bullets    — bulleted achievements (use ([item],) for a single bullet)
//   above      — vertical space before the entry (override per call)
#let entry(
  primary: "",
  tertiary: none,
  secondary: "",
  quaternary: "",
  description: none,
  bullets: (),
  above: 10pt,
) = {
  block(breakable: false, above: above, below: 0pt)[
    #grid(
      columns: (1fr, auto),
      column-gutter: 12pt,
      row-gutter: 3pt,
      align: (left, right),
      [#text(weight: "bold", size: 10pt)[#primary]],
      [#text(size: 9pt, style: "italic", fill: muted)[#secondary]],
      ..if tertiary != none {(
        [#text(size: 9pt, weight: "medium", fill: muted)[#sc(tertiary)]],
        [#text(size: 9pt, style: "italic", fill: muted)[#quaternary]],
      )} else {()}
    )
    #if description != none [
      #v(3pt, weak: true)
      #pad(left: 6pt)[#text(size: 9pt, fill: muted)[#description]]
    ] else if bullets.len() > 0 [
      #v(4pt, weak: true)
      #set list(spacing: 4pt, indent: 6pt, marker: text(fill: muted)[•])
      #list(..bullets)
    ]
  ]
}

// === Compact one-line entry =================================================
//
// For list items with a short title + one metadata string (Honours).
// Title in REGULAR weight — bold here would compete with the (bold)
// subsection labels above. Reserve bold for headings and entry-titles-with-
// secondary-data; list items are just list items.
#let one-line(title, meta) = {
  block(above: 4pt, below: 0pt, breakable: false)[
    #grid(
      columns: (1fr, auto),
      column-gutter: 12pt,
      align: (left, right),
      [#text(weight: "regular", size: 9.5pt)[#title]],
      [#text(size: 9pt, style: "italic", fill: muted)[#meta]],
    )
  ]
}

// === Skills block ===========================================================
//
// Single grid so labels share one column width — items align horizontally
// across rows. Pass an array of (label, items) tuples.
#let skills(rows) = {
  let cells = ()
  for (label, items) in rows {
    cells.push(text(size: 9.5pt, weight: "medium", fill: muted)[#sc(label)])
    let parts = ()
    for (i, item) in items.enumerate() {
      if i > 0 { parts.push(dot) }
      parts.push(item)
    }
    cells.push(text(size: 9.5pt)[#parts.join()])
  }
  block(above: 4pt, below: 0pt)[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 14pt,
      row-gutter: 4pt,
      align: (left + horizon, left + horizon),
      ..cells
    )
  ]
}
