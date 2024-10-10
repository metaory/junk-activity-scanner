<div align="center">
  <img src=".github/assets/logo.png" width="168px"/>
  <h2>JUNK-ACTIVITY</h2>
  <h3>SCANNER</h3>
  <h4>An automated tool that scans and reports bot-generated junk repositories to combat inauthentic activity</h4>
</div>

---

<div align="center">
  <a href="#why">Why</a> |
  <a href="#key-features">Key Features</a> |
  <a href="#use-cases">Use cases</a>
</div>
 
<div align="center">
  <a href="#process">Process</a> |
  <a href="#contribution">Contribution</a> |
  <a href="https://github.com/metaory/junk-activity-scanner/issues/new">Issue?</a>
</div>

---

WHY
---
- TODO

---

KEY FEATURES
------------
- TODO

---

USE CASES
---------
- TODO

---

PROCESS
-------

### SCAN
The system continuously monitors new and updated repositories for signs of automated junk or bot-generated activity.

### EVALUATE
For each repository, it runs a series of tests, calculates individual scores, and produces a final confidence score.

> [!Important]
> Checkout the evaluators docs
>
> [evaluators](/evals)

### REPORT
Repositories with scores exceeding the junk threshold are logged in structured reports for further review.

The project targets repositories exhibiting patterns meant to exploit systems like the TEA scheme.

---

```mermaid
---
config:
  look: handDrawn
  theme: dark
  useWidth: 222
  state:
    titleTopMargin: 29
    radius: 32
  themeVariables:
    darkMode: true
    textColor: yellow
    labelColor: mediumspringgreen
    altBackground: mediumspringgreen
    background: fuchsia
    noteBkgColor: springgreen
    noteTextColor: mediumspringgreen
    noteBorderColor: mediumspringgreen
    mainBkg: deeppink
    nodeBorder: deeppink
    nodeTextColor: deeppink
    clusterBkg: mediumspringgreen
    clusterBorder: mediumspringgreen
    lineColor: yellow
    fontFamily: "monospace"
    fontSize: "22px"
    tertiaryColor: red
    tertiaryTextColor: yellow
    tertiaryBorderColor: yellow
    secondaryColor: green
    secondaryTextColor: green
    secondaryBorderColor: green
    primaryColor: red
    primaryTextColor: white
    primaryBorderColor: red
---

stateDiagram-v2
  direction TB
  state EE {
    direction TB
    E1
    --
    E2
    --
    E3
    --
    E4
  }
  [*] --> S
  S --> Coordinate
  A --> R
  R --> [*]
  Coordinate --> EE
  EE --> A
  E1 : E1.js
  E2 : E2.py
  E3 : E3.rb
  E4 : E4.sh
  S : Scan
  EE : Evaluate
  A : Aggregate
  R : Report
```

---

CONTRIBUTION
------------

[Refer to the contribution docs for more information.](https://github.com/metaory/junk-activity-scanner?tab=coc-ov-file)

If you have any doubts related to the project or want to discuss something, then join our [Matrix server](https://matrix.to/#/#junk:gitter.im).

---

License
-------
[MIT](LICENSE)
