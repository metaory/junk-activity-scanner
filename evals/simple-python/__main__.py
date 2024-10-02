import sys, json

raw = sys.stdin.read()


def evaluate(repo):
    print("evaluating", repo)
    # DUMMY EVALUATION
    return 0.32


if sys.stdout.isatty():
    print(
        """ [ERROR] STREAM IS INTERACTIVE

  try running
    cat sample_input.json | python . """
    )
    sys.exit(1)

try:
    input = json.loads(raw)
    print(evaluate(input))
except json.JSONDecodeError as e:
    print("Invalid JSON syntax:", e)
    sys.exit(1)
