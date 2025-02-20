<div align="center">
  <h1>🚧 junk activity scanner</h1>
  <img src=".github/assets/logo.png" width="168px"/>
  <h4>An automated tool that scans and reports bot-generated junk repositories to combat inauthentic activity.</h4>
</div>

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


REPORT
------

Repositories with scores exceeding the junk threshold are logged in structured reports for further review.

The project targets repositories exhibiting patterns meant to exploit systems like the TEA scheme.

---

WORKFLOW
--------

```
      ╭───────╮
       TRIGGER 
      ╰───┬───╯
      ╭───┴──╮
        SCAN 
      ╰───┬──╯
╭─────────┴─────────╮
        EVAL           
╰─┬────┬────┬────┬──╯
╭─┴─╮╭─┴─╮╭─┴─╮╭─┴─╮
 js   py   rb   sh 
╰─┬─╯╰─┬─╯╰─┬─╯╰─┬─╯
  └────┴──┬─┴────┘
    ╭─────┴─────╮
      AGGREGATE
    ╰─────┬─────╯
     ╭────┴────╮
       REPORT  
     ╰─────────╯
```

---

License
-------
[MIT](LICENSE)
