if $stdin.tty?
  puts " [ERROR] STREAM IS INTERACTIVE

  try running
  echo <PATH> | ruby main.rb"
  exit 1
end

input = STDIN.read.strip

def evaluate(repo)
  puts("evaluating...", repo, "\n")

  return 0.32
end

puts evaluate(input)
