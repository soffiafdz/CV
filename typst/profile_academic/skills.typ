#import "../lib.typ": *

// Primary items in each row are bolded — signals the user's strongest /
// most-used skills, gives the otherwise flat list visual hierarchy.

#section("Skills")

#skills((
  ([Languages],    ([*Spanish* (native)], [*English* (fluent)], [French (intermediate)])),
  ([Programming],  ([*R*], [*Python*], [SQL], [JavaScript], [Shell], [Perl])),
  ([Methods],      ([*SEM* (CFA, mediation, LGCM, MIMIC)], [*Neuroimaging processing*], [Machine learning], [Deep learning])),
  ([Tools],        ([UNIX], [HPC clusters], [*Git & GitHub*], [*Docker*], [Singularity], [Podman], [Flask])),
  ([Markup],       ([LaTeX], [Typst], [Markdown], [HTML])),
))
