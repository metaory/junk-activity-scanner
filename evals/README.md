EVALUATORS
==========

`./evals/<NAME>/`

Every dir under this path with a `config.toml` an **inspector**.

Evaluators are executed for each repository.

They receive repository details in **standard input**.

The **confidence score** is a number between **0** and **1**, higher value indicates more confidence
in input being a **junk**.

---

API CONTRACT
------------

### STDIN
The stringified repository detail is read from **stdin**

### STDOUT
Inspector are expected to output their **confidence score** to **stdout**

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

