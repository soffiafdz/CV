#import "../lib.typ": *

// Software & Open Source section. Major tools (Qrater, HVR) get their own
// entry blocks; hackathon contributions grouped in one block.

#section("Software & Open Source")

#entry(
  primary: [Qrater — Web-Based MRI Quality-Control Application],
  tertiary: [Lead developer · open source (GitHub + Docker Hub)],
  secondary: [#link("https://github.com/soffiafdz/Qrater")[github.com/soffiafdz/Qrater]],
  quaternary: [2021 – Present],
  bullets: (
    [Web app + SQL backend for collaborative, remote MRI QC; 2–10× faster than traditional workflows.],
    [Used on 250K+ MRI images across internal and external projects — ~10K ADNI scans in-house, ~30K in P. Rosa-Neto's TRIAD cohort, +14K in the Demistify MS project (A. Eshagi, UCL); adopted by 19+ external users.],
    [Described in peer-reviewed publication (_Aperture Neuro_, 2024); +50 downloads from public release.],
  ),
)

#entry(
  primary: [HVR — Automated Hippocampal-to-Ventricle Ratio Pipeline],
  tertiary: [Deep-learning segmentation · Docker-packaged],
  quaternary: [2022 – Present],
  bullets: (
    [Adapted and trained a neural network for hippocampal and ventricular segmentation; benchmarked against existing methods.],
    [Validated robust associations with age and cognition across AD and PD cohorts.],
    [Released network weights in a Docker image; published in _Human Brain Mapping_ (2025); primary biomarker in a submitted CIHR grant.],
  ),
)

#entry(
  primary: [Hackathon contributions],
  bullets: (
    [*mriqception* — MRI quality-control toolkit; built at a hackathon during the Neurohackademy summer institute (University of Washington, 2019). #link("https://github.com/elizabethbeard/mriqception")[github.com/elizabethbeard/mriqception]],
    [*FANI-Pack* (Find All New ICDs Package) — ICD-9→10 conversion function for the R package `icd`; built at the Women-led BioData Science Hackathon (NCBI/NIH, 2019) during a research visit. #link("https://github.com/NCBI-Hackathons/Design-of-ICD-9-to-10-conversion-function-for-the-R-package-icd")[github.com/NCBI-Hackathons/Design-of-ICD-9-to-10-...]],
  ),
)
