<div align="center">
  <h1>🚧 ANTI-JUNK-BOT </h1>
  <img src=".github/assets/logo.png" width="168px"/>
  <h4>An automated tool that scans and reports bot-generated junk repositories to combat inauthentic activity.</h4>
</div>


---

SCAN
----
The system continuously monitors new and updated repositories for signs of automated junk or bot-generated activity.

EVALUATE
--------
For each repository, it runs a series of tests, calculates individual scores, and produces a final confidence score.

> [!Important]
> Checkout the evaluators docs
>
> [evaluators](/evals)

REPORT
------
Repositories with scores exceeding the junk threshold are logged in structured reports for further review.

The project targets repositories exhibiting patterns meant to exploit systems like the TEA scheme.

---

WORKFLOW
--------

```mermaid
---
config:
  theme: base
  darkMode: true
  themeVariables:
    background: '#44BBFF'
    fontFamily: monospace
    titleColor: '#000000'
    lineColor: '#000000'
    textColor: '#fff'
  look: classic
---
flowchart TD
 subgraph INIT[" "]
    direction LR
        FILTER
        SEARCH
  end
 subgraph AGENT[" "]
    direction LR
        PROVISION
        DOWNLOAD
  end
 subgraph EVALUATE[" "]
    direction LR
        EVAL
        PARSE
        SCORE
  end
 subgraph REPORT[" "]
    direction LR
        COMMIT
        AGGREGATE
  end
    AGGREGATE ~~~ COMMIT
    SEARCH ~~~ FILTER
    DOWNLOAD ~~~ PROVISION
    PARSE ~~~ EVAL
    EVAL ~~~ SCORE
    TRIGGER(["TRIGGER"]) ==> INIT
    INIT ==> AGENT
    AGENT ==> EVALUATE
    EVALUATE ==> REPORT
    REPORT ==> END(["END"])
     FILTER:::CSTROKE
     FILTER:::CRY
     SEARCH:::CSTROKE
     SEARCH:::CRY
     PROVISION:::CSTROKE
     PROVISION:::CRY
     PROVISION:::C21
     DOWNLOAD:::CSTROKE
     DOWNLOAD:::CRY
     DOWNLOAD:::C21
     EVAL:::CSTROKE
     EVAL:::CRY
     PARSE:::CSTROKE
     PARSE:::CRY
     SCORE:::CSTROKE
     SCORE:::CRY
     COMMIT:::CSTROKE
     COMMIT:::CRY
     AGGREGATE:::CSTROKE
     AGGREGATE:::CRY
     TRIGGER:::CSTROKE
     INIT:::CSTROKE
     INIT:::CRY
     INIT:::CPAD
     INIT:::C1
     AGENT:::CSTROKE
     AGENT:::CRY
     AGENT:::CPAD
     AGENT:::C2
     EVALUATE:::CSTROKE
     EVALUATE:::CRY
     REPORT:::CSTROKE
     REPORT:::CRY
     END:::CSTROKE
    classDef CSTROKE stroke-width:0px,font-weight:bold
    classDef CRY ry:18px,rx:18px
    classDef CFONT font-weight:bold,stroke-width:24px
    classDef CPAD padding:12px
    classDef C1 color:crimson,font-size:18px
    classDef C2 fill:#009911
    classDef C21 fill:#00AA88,color:cyan
    style FILTER color:#331155,fill:#00C853
    style SEARCH color:#331155,fill:#00C853
    style PROVISION color:#FFFFFF
    style DOWNLOAD color:#FFFFFF
    style EVAL stroke:#2962FF,fill:#FF6D00,color:#FFFFFF
    style PARSE fill:#FF6D00,color:#FFFFFF
    style SCORE fill:#FF6D00,color:#FFFFFF
    style COMMIT fill:#DD2266,color:#FFFFFF
    style AGGREGATE fill:#DD2266,color:#FFFFFF
    style TRIGGER fill:#8877DD,color:white
    style INIT color:#C8E6C9,fill:#C8E6C944
    style AGENT fill:#C8E6C944,color:#C8E6C9
    style EVALUATE fill:#FFE0B244,color:#FFE0B2
    style REPORT fill:#FFCDD244,color:#FFCDD2
    style END fill:#00C853,stroke:#00C853,color:#FFFFFF
    linkStyle 0 stroke:#FFFFFF,fill:none
    linkStyle 1 stroke:#FFFFFF,fill:none
    linkStyle 2 stroke:#FFFFFF,fill:none
    linkStyle 3 stroke:#FFFFFF,fill:none
    linkStyle 4 stroke:#FFFFFF,fill:none

```

---

License
-------
[MIT](LICENSE)
