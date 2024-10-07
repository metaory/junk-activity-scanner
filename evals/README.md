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

EXAMPLE FILES
-------------

`/tmp/junk/some-user/some-repo/detail.json`
```json
{
  "full_name": "some-user/some-repo",
  "name": "some-repo",
  "description": "some-desc",
  "default_branch": "main",
  "size": 2184080,
  "ssh_url": "git@github.com:some-user/some-repo.git",
  "type": "User",
  "user": "some-user",
  "created_at": "2024-09-20T16:09:39Z",
  "updated_at": "2024-10-07T11:46:32Z"
}
```

`/tmp/junk/some-user/some-repo/tree.json`
```jsonc
[
  [
    ".github/workflows/deploy.yml",
    "05026q8n6n6oops7r1s4r2r9op85qp5p8o127sn6",
    551
  ],
  [
    ".gitignore",
    "10919323rr143p23nn09q919597281r6rr152o16",
    2269
  ],
  [
    "CNAME",
    "s2260ono27796p6p2r664200920q2572ns5sp3sp",
    14
  ],
  [
    "LICENSE",
    "o654n2onn770701007320sop5835o18snq513o8s",
    1068
  ],
  // ...
]
```

---

CONTENT PROVIDER
----------------

### Bash
```sh
# bash lib/content.sh USER/REPO PATH

bash lib/content.sh some-user/some-repo .github/workflows/deploy.yml
# /tmp/junk/some-user/some-repo/.github/workflows/deploy.yml
```

### Node
```js
import readFile from 'node:fsPromises'
import provider from '../../lib/content-js/index.mjs'

// REQUEST FILE
const res = await provider('some-user/some-repo', '.github/workflows/deploy.yml')
// /tmp/junk/some-user/some-repo/.github/workflows/deploy.yml

// READ CONTENT
const content = await readFile (res, { encoding: 'utf8' })
```

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
> - `Bash` -- [simple-bash](__simple-bash)
> - `Node` -- [simple-node](__simple-node)
> - `Ruby` -- [simple-ruby](__simple-ruby)
> - `Python` -- [simple-python](__simple-python)

