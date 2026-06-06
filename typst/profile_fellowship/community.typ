#import "../lib.typ": *

// The advocacy record. Org entries keep the standard two-row shape;
// the talks and chapter use the academic CV's citation pattern: bold
// title line, then small-caps type label with venue and year.

#let _en(t) = text(size: 9pt, fill: muted, style: "italic")[(#t)]

#section("Community & Advocacy")

#entry(
  primary: [Yaaj México, A.C.],
  tertiary: [Research Coordinator],
  secondary: [Ciudad de México, México],
  quaternary: [2017 – 2019],
  bullets: (
    [Coordinated a project with the United Nations Office on Drugs and Crime (UNODC) to write a guide for mental-health professionals against conversion therapies: _Nada que curar_ #_en[Nothing to cure].],
    [Led science communication on sexual health and sex/gender diversity in youth populations.],
  ),
)

#entry(
  primary: [COPRED — Council to Prevent and Eliminate Discrimination of Mexico City],
  tertiary: [Consultant],
  secondary: [Ciudad de México, México],
  quaternary: [2017 – 2019],
  bullets: (
    [Expert consultation on anti-discrimination policies and guidelines; member of the Consultative Assembly that designed the selection process for the new President of the Council.],
  ),
)

#entry(
  primary: [CAIPT — Integral Attention Center for Transgender People],
  tertiary: [Volunteer],
  secondary: [Tijuana, BC, México],
  quaternary: [2017],
  bullets: (
    [Designed and implemented empowerment workshops for the transgender women community of Baja California.],
  ),
)

#subsection("Talks & Writing")

#set list(spacing: 6pt, indent: 6pt, marker: text(fill: muted)[•])

- *Derechos sexuales y reproductivos; reflexiones para terapeutas* #_en[Sexual and reproductive rights; reflections for therapists] \
  #sc[Sole-authored book chapter] · _Terapia familiar sistémica y la comunidad LGBT+_ #_en[Systemic family therapy and the LGBT+ community] · Pax & Leed · 2019

- *El derecho a la identidad de infancias y adolescencias transgénero* #_en[The right to an identity of transgender children and adolescents] \
  #sc[Conversatorium] · with the judges of the Supreme Justice Tribunal of Mexico City · 2018

- *Terapias de conversión: perspectiva de la psicología y derechos humanos* #_en[Conversion therapy: a psychology and human-rights perspective] \
  #sc[Invited talk] · 2nd Encounter about Sexualities and Gender, UNAM · 2018

- *Hablando Intersex* #_en[Speaking Intersex] \
  #sc[TV interview] · _Ciudad Abierta_ channel, Ciudad de México · 2018
