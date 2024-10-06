EVALUATORS
==========

`./evals/<NAME>/`

Every dir under this path with a `config.toml` is an **evaluator**.

Evaluators are executed for each scanned repository.

For each execution they receive a path in **standard input** where the target repository info are located.

Evaluators read the target `detail.json` and `tree.json`. They can request file contents for analysis from the
content provider API.

Evaluators are expected to produce a single final **confidence score**.

The **confidence score** is a number between **0** and **1**, higher value indicates more confidence
in input being a **junk**.

---

API CONTRACT
------------

### STDIN
A path pointing to `detail.json` and `tree.json` of the target repository in **stdin**

### STDOUT
Evaluators are expected to output their **confidence score** to **stdout**

> [!Tip]
> The evaluator outputs in their execution are ignored.
> The last line in output stream is the confidence score.

> [!Caution]
> The final confidence score must be on new line.

---

CONFIG
------

Each configuration allows to selectively override the defaults launch command, option flags and arguments.

`./evals/<NAME>/config.toml`

---

Example config:

```toml
# Display name of the inspector (OPTIONAL)
# Default: directory path
name = "simple node inspector"

# Development flag
# Default: true
enabled = false

# Inspector timeout in seconds (OPTIONAL)
# Default: 6
# Min-Max: 3-30
timeout = 10

# Inspector (REQUIRED)
# It must be installed and available on action runner, It's logged and ignored otherwise.
command = "node"

# Inspector runner (REQUIRED)
arguments = [
  "--trace-warnings",
  "--trace-uncaught",
  "--experimental-default-type=module",
  "index.mjs",
]
```

---

> [!Tip]
> Checkout the sample evaluators
>
> - `Node` -- [simple-node](simple-node)
> - `Ruby` -- [simple-ruby](simple-ruby)
> - `Python` -- [simple-python](simple-python)

