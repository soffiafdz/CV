#import "../lib.typ": *

// Publications use bulleted citation lists — each item gets a • marker
// matching the bullets on page 1, anchoring the entry visually. Title bold
// first line, metadata muted second line (hard linebreak with hanging
// indent under the bullet).
//
// Articles: author lists are truncated.
//   - First author = the user → "Fernandez-Lozano, S., et al."
//   - User mid-list → "Author1, Author2, Fernandez-Lozano, S., et al."
//   - Sole author → no truncation (book chapter)
//
// Conference Publications: peer-reviewed abstracts published in journals
// (Alzheimer's & Dementia, etc.) with DOIs — separated from non-published
// posters/talks.
//
// Posters / Oral Talks: drop the author entirely (redundant on her own
// CV) and lead the metadata line with date. Talks include the talk type
// (Invited talk, Oral talk, …) in small-caps before the venue.
//
// Spanish titles include their English translation in parentheses (muted).

#let _self = text(weight: "bold", smallcaps[Fernandez-Lozano, S.])
#let _doi(d) = link("https://doi.org/" + d, text(size: 8.5pt, fill: muted)[doi:#d])
#let _en(t) = text(size: 9pt, fill: muted, style: "italic")[(#t)]

// Role & impact line, required by funders for multi-authored publications.
// Compact muted third line under the citation; labels in the section accent.
#let _ri(role, impact) = text(size: 8.5pt, fill: muted)[
  #text(fill: accent, weight: "bold")[Role.] #role #h(0.4em)
  #text(fill: accent, weight: "bold")[Impact.] #impact
]

#section("Publications")

#subsection("Articles & Book Chapter")

#set list(spacing: 6pt, indent: 6pt, marker: text(fill: muted)[•])

- *Enhanced Detection of Age-Related and Cognitive Declines Using Automated Hippocampal-To-Ventricle Ratio in Alzheimer's Patients.* \
  #_self, et al. · _Human Brain Mapping_ 46(11) (2025). #_doi("10.1002/hbm.70265") \
  #_ri[Designed and validated the deep-learning segmentation pipeline, conceived and executed the analyses, released the Docker image, drafted the manuscript.][Converts a labour-intensive manual biomarker into an automated, scalable tool validated across AD and PD cohorts.]

- *QRATER: a collaborative and centralized imaging quality control web-based application.* \
  #_self, et al. · _Aperture Neuro_ 4 (2024). #_doi("10.52294/001c.118616") \
  #_ri[Conceived, designed, and programmed the application; led QC training and the ADNI QC effort; drafted the manuscript.][Open-source tool adopted across multiple labs; 250K+ images processed; 2–10× faster than conventional QC.]

- *Clinical and functional connectivity outcomes of 5-Hz repetitive transcranial magnetic stimulation as an add-on treatment in cocaine use disorder: a double-blind randomized controlled trial.* \
  Garza-Villarreal, E.A., Alcala-Lozano, R., #_self, et al. · _Biological Psychiatry: Cognitive Neuroscience and Neuroimaging_ 6(7), 745–757 (2021). #_doi("10.1016/j.bpsc.2021.01.003") \
  #_ri[Co-author — administered rTMS treatments, supervised MRI acquisition and safety, performed the fMRI connectivity analyses.][First double-blind RCT of rTMS for cocaine use disorder in a Latin-American population.]

- *Gray and white matter morphology in substance use disorders: a neuroimaging systematic review and meta-analysis.* \
  Pando-Naude, V., Toxto, S., #_self, et al. · _Translational Psychiatry_ 11(1), 29 (2021). #_doi("10.1038/s41398-020-01128-2") \
  #_ri[Co-author — parsed and catalogued the included studies; contributed to manuscript review.][Systematic review and meta-analysis of gray- and white-matter morphology across substance use disorders.]

- *_Derechos sexuales y reproductivos; reflexiones para terapeutas_ #_en[Sexual and reproductive rights; reflections for therapists].* \
  #_self · In Gómez-Lamont, M.F. & Silva-Aragón, A. (Eds.), _Terapia familiar sistémica y la comunidad LGBT+_ #_en[Systemic family therapy and the LGBT community]. Ciudad de México: Pax & Leed (2019).

#subsection("Preprints")

#set list(spacing: 6pt, indent: 6pt, marker: text(fill: muted)[•])

- *Hippocampal-to-ventricle ratio as a head-size-independent biomarker: sex differences and cognitive associations in 27,680 UK Biobank participants.* \
  #_self & Collins, D.L. · _bioRxiv_ (2026). #_doi("10.64898/2026.04.13.718285") \
  #_ri[Conceived the research question, derived the sex-specific normative GAMLSS references, planned and executed the analyses, drafted the manuscript.][Establishes HVR as a head-size-independent biomarker with sex-specific norms, revealing atrophy patterns invisible to raw hippocampal volume.]

#subsection("Conference Publications")

#set list(spacing: 6pt, indent: 6pt, marker: text(fill: muted)[•])

- *The Role of Negative Space: Lateral Ventricular Expansion Is a Better Correlate of Cognition Than Hippocampal Volume.* \
  #_self, et al. · _Alzheimer's & Dementia_ 21(S2):e106003 (2026). _AAIC,_ Toronto, Canada · Jul 2025. #_doi("10.1002/alz70856_106003") \
  #_ri[Conceived the research question, planned and executed the analyses, designed the poster.][Lateral ventricular expansion is a stronger cognitive correlate than hippocampal volume across the AD continuum.]

- *Tau accumulation mediates β-amyloid effects on hippocampal atrophy and memory in early Alzheimer's disease.* \
  #_self, et al. · _Alzheimer's & Dementia_ 20:e092651 (2024). _AAIC,_ Philadelphia, PA, USA · Jul 2024. #_doi("10.1002/alz.092651") \
  #_ri[Conceived the research question, built the SEM mediation models, planned and executed the analyses, designed the poster.][Links amyloid, tau, and hippocampal atrophy through tau-mediation in ADNI PET data.]

- *Hippocampal-to-ventricle ratio (HVR) is better related to age and cognition than hippocampal volume.* \
  #_self, et al. · _Alzheimer's & Dementia_ (2023). _AAIC,_ Amsterdam, Netherlands · Aug 2023. #_doi("10.1002/alz.079039") \
  #_ri[Conceived the research question, planned and executed the analyses, designed the poster.][Demonstrates HVR tracks age and cognition more closely than hippocampal volume.]

- *Do we really need to normalize hippocampal volume?* \
  #_self, et al. · _Alzheimer's & Dementia_ (2023). _AAIC,_ Amsterdam, Netherlands · Aug 2023. #_doi("10.1002/alz.077928") \
  #_ri[Conceived the research question, planned and executed the analyses, designed the poster.][Questions whether hippocampal volume requires head-size normalization.]

- *Qrater: collaborative imaging quality control tool.* \
  #_self, et al. · _Alzheimer's & Dementia_ 18:e065184 (2022). _Alzheimer's Imaging Consortium,_ San Diego, CA, USA · Jul 2022. #_doi("10.1002/alz.065184") \
  #_ri[Designed and presented the poster.][First public dissemination of Qrater to the AD imaging community.]

#subsection("Poster Presentations")

#set list(spacing: 6pt, indent: 6pt, marker: text(fill: muted)[•])

- *Hippocampus-to-Ventricle Ratio Reveals Steeper Age-related Neurodegeneration in Parkinson's Disease Compared to Controls.* \
  _AD/PD 2025,_ Vienna, Austria · Apr 2025.

- *Qrater: centralized web application for image quality control.* \
  _OHBM,_ Glasgow, UK · Jun 2022.

- *Análisis de teoría de grafos en redes funcionales después de un tratamiento doble ciego de EMTr en pacientes adictos a cocaína #_en[Graph-theory analysis on functional networks after double-blinded rTMS on cocaine-addicted patients].* \
  _Annual Meeting of Researchers, INPRFM,_ Ciudad de México, México · Oct 2018.

- *Effects of rTMS on the small-worldness of crack-cocaine addicts' functional connectivity networks.* \
  _XX Reunion of Neuroimage at CIMAT,_ Guanajuato, México · Oct 2018.

#subsection("Oral Talks")

#set list(spacing: 6pt, indent: 6pt, marker: text(fill: muted)[•])

- *Hippocampal-to-Ventricle Ratio is a Viable Neurodegeneration Biomarker for Evaluating the Longitudinal Progression of Cognitive Decline in the Context of Alzheimer's Disease.* \
  #sc[OnDemand oral talk] · AD/PD 2025, Vienna, Austria · Apr 2025.

- *Estimulación Magnética Transcraneal: técnicas de neuromodulación como tratamiento neuropsiquiátrico #_en[Transcranial Magnetic Stimulation: Neuromodulation techniques as a neuropsychiatric treatment].* \
  #sc[Invited talk] · Monthly Seminar, Baja California College of Psychologists, Tijuana, BC, México · Dec 2019.

- *Classification of cocaine dependence using topology of functional connectivity networks.* \
  #sc[Oral talk] · Neuroimage Reunion XXI, CIMAT, Guanajuato, México · Oct 2019.

- *Functional connectivity network changes after rTMS treatment in cocaine addiction.* \
  #sc[Internal seminar] · NIAAA & NIDA Intramural Seminar, NIH, Bethesda, MD, USA · May 2019.

- *Conectoma cerebral: estudiando la red más compleja de todas #_en[Brain connectome: studying the most complex network system].* \
  #sc[Science talk] · Brain Week, National High School #9 "Pedro de Alba", Ciudad de México, México · Nov 2018.

- *Terapias de conversión: perspectiva de la psicología y derechos humanos #_en[Conversion therapy: a psychology and human-rights perspective].* \
  #sc[Invited talk] · 2nd Encounter about Sexualities and Gender, UNAM, Ciudad de México, México · Oct 2018.

- *El derecho a la identidad de infancias y adolescencias transgénero #_en[The right to an identity of transgender children and adolescents].* \
  #sc[Conversatorium] · Supreme Justice Tribunal of Mexico City, Ciudad de México, México · Jun 2018.

- *Hablando Intersex #_en[Speaking Intersex].* \
  #sc[TV interview] · _Ciudad Abierta_ channel, Ciudad de México, México · 2018.
