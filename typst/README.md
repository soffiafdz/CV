# CV / Cover-letter source

Typst source for two profiles:

- **academic** — postdoctoral / research-forward
- **artist** — creative-forward (writer / photographer, pen name "Elena Jacobo")

Each profile produces both a CV and a cover letter. The two share the
same design system but have their own content and metadata.

---

## Compiling

From the repo root, using the `justfile`:

```sh
just                     # build all four PDFs (cv + letter for both profiles)
just cv-academic         # academic CV only
just letter-academic     # academic cover letter only
just academic            # both academic outputs (cv + letter)
just artist              # both artist outputs
just watch-cv-academic   # rebuild on save
just clean               # remove build/
```

Manually with typst:

```sh
typst compile typst/cv.typ     --input profile=academic
typst compile typst/letter.typ --input profile=academic
```

PDFs land in `build/` at the repo root.

---

## File layout

```
typst/
├── lib.typ                  ← design system: helpers, fonts, colors, header()
├── cv.typ                   ← CV entry point: page setup + footer + module dispatch
├── letter.typ               ← Letter entry point: page setup + footer + content include
├── README.md                ← this file
├── profile_academic/        ← academic profile (content + metadata)
│   ├── metadata.toml        ← personal info, header tagline, module order
│   ├── professional.typ     ← Research / Clinical / Volunteering experience
│   ├── education.typ
│   ├── skills.typ
│   ├── honours.typ
│   ├── courses.typ
│   ├── publications.typ
│   └── letter.typ           ← cover-letter content (recipient, subject, body)
└── profile_artist/          ← artist profile (parallel structure)
    └── …
```

`cv.typ` and `letter.typ` are profile-agnostic — they pick which profile
to use from `--input profile=<name>` and pull all content from the
corresponding `profile_<name>/` directory.

---

## Editing content

To change the **academic CV**, edit one or more of:

| File | What it controls |
|---|---|
| `profile_academic/metadata.toml` | Name, contact info, header tagline, footer text, last-updated stamp, section order |
| `profile_academic/professional.typ` | Research / Clinical / Volunteering entries |
| `profile_academic/education.typ` | Degree entries |
| `profile_academic/skills.typ` | Skills rows (label + items) |
| `profile_academic/honours.typ` | Honours and grants list |
| `profile_academic/courses.typ` | Courses & workshops |
| `profile_academic/publications.typ` | Articles, posters, oral talks |

To change the **academic cover letter**, edit `profile_academic/letter.typ`
— the recipient block, subject, body paragraphs, and signoff.

To **reorder or omit sections**, edit the `modules = [...]` array in
`metadata.toml`. The names map 1:1 to filenames in the profile directory.

---

## Design system

`lib.typ` is the single source of truth for the visual system. All
helpers and constants live there; profile content files import from it
with `#import "../lib.typ": *`.

### Layout helpers — when to use which

| Helper | Use for | Shape |
|---|---|---|
| `section(title)` | Top-level section heading | Bold + red rule across the page |
| `subsection(title)` | Sub-grouping inside a section (e.g. "Recognitions") | Red small-caps bold |
| `entry(...)` | Multi-line item with bullets or description (Education, Research, Courses) | 2-row header (title + role) + bullets |
| `one-line(title, meta)` | Compact single-line item (Honours) | Bold-ish title left, italic muted right |
| `skills(rows)` | Skills table (label + items) | Aligned 2-column grid |
| `header(person)` | Page header used by cv.typ + letter.typ | Centered name + tagline + contact icons |

For citation lists (Publications), use typst's native `- item` list
syntax directly — bulleted lists with hanging indent work out of the
box; no helper needed.

### Spacing rhythm (3 tiers)

| Tier | `above` value | Used by |
|---|---|---|
| Compact rows | 4pt | Honours, Skills |
| Multi-line non-bulleted | 8pt | Publications (between bulleted items via list spacing), Courses |
| Bulleted entries | 10pt | Research, Education, Clinical, Volunteering |

Each tier is roughly proportional to entry mass.

### Typography

| Element | Font | Size | Weight | Color |
|---|---|---|---|---|
| Name | Roboto | 28pt | bold | muted (first) + body (last) |
| Section heading | Source Sans 3 | 16pt | bold | accent (first 2 chars) + body |
| Subsection label | Source Sans 3 | 13pt | bold | accent (small-caps) |
| Entry primary (org/title) | Source Sans 3 | 10pt | bold | body |
| Entry secondary (role) | Source Sans 3 | 9pt | medium | muted (small-caps) |
| Right-aligned metadata | Source Sans 3 | 9pt | regular italic | muted |
| Body text / bullets | Source Sans 3 | 10pt | regular | body |

### Color palette

```
#671a10  accent     — section headings, subsection labels, section rules
#212529  body-color — primary text
#5D5D5D  muted      — metadata, secondary labels
#999999  subtle     — footer text
```

To re-skin the document, change the constants at the top of `lib.typ`.

---

## Creating a new profile

```sh
cp -r typst/profile_academic typst/profile_<name>
# Edit profile_<name>/metadata.toml — at minimum first_name, last_name, contact info
# Edit each profile_<name>/<section>.typ to match the new profile's content
```

Then add a recipe to the `justfile` if you want a shortcut:

```just
cv-<name>:
    mkdir -p {{build_dir}}
    typst compile cv.typ {{build_dir}}/cv-<name>.pdf --input profile=<name>
```

---

## Cover letters

A cover letter shares the CV's header (name + tagline + contact) and
adds:

- Date (right-aligned, italic)
- Recipient block (name, organization, address)
- Subject line (bold, accent)
- Salutation
- Body paragraphs
- Signoff

All of these are in `profile_<name>/letter.typ`. Standard typst markup
applies — `*bold*`, `_italic_`, `#link("url")[text]`, etc. — so writing
the letter is essentially writing prose.

The header is rendered by `typst/letter.typ` from `metadata.toml` —
don't duplicate it in the letter file.
