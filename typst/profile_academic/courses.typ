#import "../lib.typ": *

// Courses use entry() with `bullets` (single-item list) rather than
// `description` so the visual matches the bulleted entries on page 1
// (Education, Research, Clinical, Volunteering). One bullet per course =
// the brief description.

#section("Courses & Workshops")

#entry(
  primary: [Neuromatch Academy Deep Learning 2021],
  tertiary: [Neuromatch],
  secondary: [Online],
  quaternary: [Jul 2021],
  above: 8pt,
  bullets: ([Intensive 3-week course on advanced Deep Learning techniques.],),
)

#entry(
  primary: [Neurohackademy 2019],
  tertiary: [University of Washington],
  secondary: [Seattle, WA, USA],
  quaternary: [Jul – Aug 2019],
  above: 8pt,
  bullets: ([Two-week intensive summer institute in neuroimaging and data science.],),
)

#entry(
  primary: [Bayesian Modeling of Brain Imaging Data],
  tertiary: [Michele Guindani, PhD — Mexican Association of Statistics],
  secondary: [Ciudad de México, México],
  quaternary: [Sep 2017],
  above: 8pt,
  bullets: ([Two-day introduction to Bayesian methods in fMRI analysis.],),
)

#entry(
  primary: [Basic Course of Applied Neuroscience],
  tertiary: [Autonomous University of Baja California],
  secondary: [Mexicali, BC, México],
  quaternary: [Aug 2016],
  above: 8pt,
  bullets: ([Two-week neuroscience course for psychology students and recent graduates.],),
)

#entry(
  primary: [International Course of Neuropsychological Evaluation],
  tertiary: [Juan-Carlos Arango, PhD — Sinapsis],
  secondary: [Mexicali, BC, México],
  quaternary: [Oct 2015],
  above: 8pt,
  bullets: ([Neuropsychological testing in cultures and languages outside North America and Western Europe.],),
)
