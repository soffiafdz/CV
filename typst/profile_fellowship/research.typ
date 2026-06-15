#import "../lib.typ": *

// Page 2 opens here: the scientist-clinician record. Research entries stay
// condensed (this CV answers a writing call, not a research rubric); the
// Recent Publications block carries the first-author record and fills the page.

#pagebreak(weak: true)

// Citation helpers, lighter than the academic CV: one plain relevance line
// per paper, no DOIs, no funder Role/Impact notes.
#let _self = text(weight: "bold")[#sc[Fernández-Lozano, S.]]
#let _note(t) = block(above: 2pt, inset: (left: 10pt))[
  #text(size: 8.5pt, fill: muted, style: "italic")[#t]
]

#block(below: 8pt)[
  #text(size: 10pt, style: "italic", fill: muted)[The other life: the scientist and clinician.]
]

#section("Research")

#entry(
  primary: [Memory & Neurodegeneration — Neuroimaging & Surgical Technologies Lab],
  tertiary: [Doctoral Researcher, McGill University],
  secondary: [Montréal, QC, Canada],
  quaternary: [2020 – 2026],
  bullets: (
    [Developed and validated MRI markers of hippocampal degeneration and the memory and cognitive decline they track.],
    [Regular oral and poster presentations at international conferences (AAIC, AD/PD, OHBM).],
  ),
)

#entry(
  primary: [Addiction & Neuromodulation — Instituto Nacional de Psiquiatría "Ramón de la Fuente Muñiz"],
  tertiary: [Master's Student Researcher],
  secondary: [Ciudad de México, México],
  quaternary: [2017 – 2020],
  bullets: (
    [Administered treatments and supervised MRI acquisition in a double-blind randomized clinical trial of rTMS in patients with substance use disorder.],
  ),
)

#subsection("Recent Publications")

#set list(spacing: 8pt, indent: 6pt, marker: text(fill: muted)[•])

- *Cardiovascular risk and hippocampal-cognitive coupling in Alzheimer's disease.* \
  #_self, Villeneuve, S., Collins, D.L., et al. · _medRxiv_ (2026) · preprint, in submission.
  #_note[Telling apart age, blood vessels, and disease in memory decline.]

- *Hippocampal-to-ventricle ratio as a head-size-independent biomarker: sex differences and cognitive associations in 27,680 UK Biobank participants.* \
  #_self & Collins, D.L. · _bioRxiv_ (2026) · preprint, in submission.
  #_note[How a memory marker differs by sex, in 27,680 people.]

- *Enhanced detection of age-related and cognitive declines using automated hippocampal-to-ventricle ratio in Alzheimer's patients.* \
  #_self, et al. · _Human Brain Mapping_ 46(11) (2025).
  #_note[An automated measure of memory loss in Alzheimer's and Parkinson's.]
