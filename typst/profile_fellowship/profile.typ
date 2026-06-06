#import "../lib.typ": *

// Profile + labeled Languages row (same grid treatment as the academic
// CV's Skills, so the three languages read as data, not decoration).

#section("Profile")

#block(above: 4pt)[
  #set par(justify: true)
  #text(size: 9.5pt)[
    I write, photograph, and study memory. My doctoral research
    (Neurosciences, McGill) develops MRI markers of what neurodegeneration
    erases. My autofiction and analog photography work the same terrain from
    within: memory overwritten, identity in translation, a life across
    borders and three languages.
  ]
]

#v(6pt)
#skills((
  ([Languages], ([Spanish], [English], [French])),
))
