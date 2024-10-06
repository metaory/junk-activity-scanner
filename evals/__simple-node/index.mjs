import { stdin, stdout } from 'node:process'
import { Readable } from 'node:stream'

const stream = stdin.resume()

if (stdin.isTTY || !stream.readable) {
  console.error(` [ERROR] STREAM IS INTERACTIVE \n
  try running
    cat sample_input.json | node index.mjs `)
  process.exit(1)
}

const input = JSON.parse(await Readable.from(stream).reduce((acc, cur) => (acc += cur), ''))

const evaluate = repo => {
  console.log('evaluating', repo)
  // ...
  // .. INSPECT LOGIC ..
  // ☇ DEMONSTRATION PURPOSE
  return 0.87
}

stdout.write(String(evaluate(input)))
