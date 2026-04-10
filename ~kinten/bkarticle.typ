#let doc(body) = {
  set page(margin: (x: 54pt, y: 80pt))
  set text(size: 0.9em)
  set par(leading: 0.55em)
  set heading(numbering: "1",  outlined: true, supplement: "§")
  show heading: set text(size: 0.85em)
  set cite(style: "alphanumeric")
  show cite: it => text(fill: rgb("#3851A4"), it)
  body
}

#let title(it) = {
  set document(title: it.body)
  place(top, float: true, scope: "parent")[
    #text(size: 1.5em, weight: 700, it.body)
  ]
}

#let author(authors, affiliation: none) = {
  place(top, float: true, scope: "parent")[
    #v(-8pt)
    #text(authors.join(", ", last: " and ") + ", " + text(style: "italic", affiliation))
  ]
}
