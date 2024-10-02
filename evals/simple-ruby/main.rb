require 'json'

if $stdin.tty?
  puts " [ERROR] STREAM IS INTERACTIVE

  try running
  cat sample_input.json | ruby main.rb"
  exit 1
end

begin
  input = JSON.parse(STDIN.read.strip)
rescue JSON::ParserError => e
  puts e.message
  exit 1
end

def evaluate(repo)
  puts("evaluating...", repo, "\n")

  return 0.32
end

puts evaluate(input)
