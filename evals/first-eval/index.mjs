import { stdin, stdout } from 'node:process'
import { Readable } from 'node:stream'
import { readFile } from 'node:fs'
import { readdir } from 'node:fs'

const stream = stdin.resume()

if (stdin.isTTY || !stream.readable) {
  console.error(` [ERROR] STREAM IS INTERACTIVE \n
  try running
    cat sample_input.json | node index.mjs `)
  process.exit(1)
}

const input = JSON.parse(await Readable.from(stream).reduce((acc, cur) => (acc += cur), ''))

const evaluate = repo => {
  // console.log("evaluating", repo);
  if (repo.content.split('/').includes(repo.name)) {
    // Read repo files from content path
    readdir(repo.content, (err, files) => {
      if (err) {
        return
      }
      // Check if repo has action folder path
      if (files.includes('action')) {
        readdir(`${repo.content}/action`, (err, files) => {
          if (files.includes('package.json')) {
            // Validate package.json file path
            readFile(`${repo.content}/action/package.json`, 'utf8', (err, data) => {
              if (err) {
                return
              }
              // console.log("File contents:", data);
              const packageJsonConent = JSON.parse(data)
              if (packageJsonConent.dependencies && packageJsonConent.dependencies.jabber) {
                console.log('infected')
              }
            })
          }
        })
      }
    })
  }
  // ...
  // .. INSPECT LOGIC ..
  // ☇ DEMONSTRATION PURPOSE
  return 0.87
}

stdout.write(String(evaluate(input)))
