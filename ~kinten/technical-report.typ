#import "@preview/cetz:0.3.2"
#import "/article": *
#import "bkarticle.typ": doc as bkdoc, title, author
#show: bkdoc
#let a(k) = {
  import cetz.draw: *
  group(name: "key-" + k, {
    rect((0,0), (rel: (0.5,0.5)), stroke: color.rgb("#8F95AE"), fill: color.rgb("#F5F7FF"), radius: 3pt)
    translate(x: -0.08, y: 0.06)
    rect((0, 0), (rel: (0.5,0.5)), name: "key", stroke: none)
    content("key", text(0.7em, k))
    translate(x: 0.08, y: -0.06)
  })
  translate(x: 0.5 + 0.1)
}
#title[= Implementation of the `qmk.logger` keyboard visualizer]
#author(([Le Nguyen Gia Bao #fn("kinten108101@protonmail.com")], "Ho Gia Tuong"), affiliation: [TTB-HCMUT #fn("github.com/ttb-hcmut")])

= Introduction

This document describes the architecture and internals of the `qmk.logger` implementation. *`qmk.logger`* (*`~ttb-hcmut/qmk.logger`*) is #fn[TODO(kinten) fill this in later]

= The keyboard language

Refer to @design-of for more details.

#cetz.canvas({
  import cetz.draw: *
  a("H"); a("J"); a("K"); a("L")
})

// it is preferrable that we can define keyboard by UX function semantics. in practice this is usually pretty hard, so we also enable define keyboard by shape semantics, and Reason is perfect for this because it reifies JSX syntax. On retrospective, these are known as f-rep and b-rep respectively, and there's much literature on them in the field of CAD which is somewhat relevant to this subject. In the end, we are reminded of the general-purposity spirit of our parent language OCaml, and decided that both methodologies should be supported.

= Distribution

Under the `~kinten/u/utop` distribution @utopk then no additional setup is required, this program is usable as-is:

```sh
# assuming that the repository was downloaded as a ZIP archive into ~/Downloads directory
chmod +x ~/Downloads/qmk.logger-main.zip;
~/Downloads/qmk.logger-main.zip
```

There are available source code equipped with bootstraps as well.

#set heading(numbering: none)

= Acknowledgements

= References

#bibliography(title: none, "works.yml")

#pagebreak()

= Appendix

#set heading(numbering: "A")

#context counter(heading).update(0)

= Design of <design-of>
