import { stdin, stdout } from 'node:process'
import { Readable } from 'node:stream'
import { readFileSync } from 'node:fs'
import readContent from '../../lib/content-js/index.mjs'

const stream = stdin.resume()

if (stdin.isTTY || !stream.readable) {
  console.error(` [ERROR] STREAM IS INTERACTIVE \n
  try running
    echo <PATH> | node index.mjs `)
  process.exit(1)
}

const input = (await Readable.from(stream).reduce((acc, cur) => (acc += cur), '')).trim()

const read = path => readFileSync(path, { encoding: 'utf8' })
const readJson = path => JSON.parse(read(path))

const evaluate = repo => {
  const detail = readJson(`/tmp/junk/${repo}/detail.json`)
  const tree = readJson(`/tmp/junk/${repo}/tree.json`)

  console.log('detail', detail)

  return tree
    .filter(([path]) => path.startsWith('.github/'))
    .map(([path]) => path)
    .reduce((acc, cur) => {
      const content = readContent(repo, cur)
      console.log('::', cur, content)

      if (cur.endsWith('package.json')) {
        const pkg = JSON.parse(content)

        console.log('[TODO]', 'SCAN DEPENDENCIES', pkg)

        ;['chance', 'faker', 'jabber'].forEach(x => {
          if (Object.keys(pkg?.dependencies).includes(x)) acc += 0.2
        })
      }

      return acc
    }, 0)
}

stdout.write(String(evaluate(input)))
