// Cover letter content for the fellowship profile.
// NOTE: body is still the academic-template placeholder — the real
// fellowship letter has not been written into this file yet.
//
// Edit:
//   - the four #let bindings below (date, recipient, subject)
//   - the body paragraphs
//   - the signoff
//
// The header (your name + contact) is rendered by typst/letter.typ from
// metadata.toml — you don't edit it here.

#import "../lib.typ": *

// === Letter metadata ========================================================
#let letter-date = "May 2026"

#let recipient = (
  name: [Dr. Jane Doe],
  org: [Department of Neuroscience],
  address: [123 University Ave. \ Anytown, ST 12345],
)

#let subject = [Application for Postdoctoral Research Position]

// === Render: date · recipient · subject =====================================
//
// Date right-aligned, recipient left-aligned, subject in the document's
// accent color so it stands out.

#align(right)[#text(fill: muted, style: "italic")[#letter-date]]

#v(4pt)

#text[
  #recipient.name \
  #recipient.org \
  #recipient.address
]

#v(8pt)

#text(weight: "bold", fill: accent)[Re: #subject]

#v(8pt)

// === Salutation =============================================================
Dear #recipient.name,

// === Body ===================================================================
//
// Replace these placeholder paragraphs with the actual letter. Standard
// typst markup applies — *bold*, _italic_, links, etc.

I am writing to express my interest in the postdoctoral position in your
laboratory. My doctoral research at the Neuroimaging & Surgical Technologies
Lab has focused on developing MRI tools to predict progression of Alzheimer's
disease — work that aligns directly with the goals described in your call.

Over the course of my PhD I have built and validated the hippocampal-to-
ventricle ratio (HVR) as a clinical biomarker, developed QRATER (a
collaborative quality-control web application now used by our consortium),
and contributed to clinical trials of repetitive transcranial magnetic
stimulation in addiction. My work spans both neuroimaging methodology and
applied clinical research.

I would welcome the opportunity to discuss how my background fits the
position. Thank you for your consideration.

// === Signoff ================================================================
#v(16pt)

Sincerely,

#v(24pt)

Elena Jacobo
