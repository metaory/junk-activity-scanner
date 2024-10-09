import sys

input = sys.stdin.read()


def evaluate(repo):
    print("evaluating", repo)
    # DUMMY EVALUATION
    return 0.32


if sys.stdout.isatty():
    print(
        """ [ERROR] STREAM IS INTERACTIVE

  try running
    echo <PATH> | python . """
    )
    sys.exit(1)

print(evaluate(input))
