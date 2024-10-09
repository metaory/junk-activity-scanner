import { spawnSync } from 'node:child_process'
import { readFileSync } from 'node:fs'
import { ok } from 'node:assert'

const opts = { encoding: 'utf8' }

export default (repo, path) => {
  ok(repo && repo.constructor === String)
  ok(path && path.constructor === String)

  const {
    status,
    stdout,
    stderr
  } = spawnSync('bash', ['../../lib/content.sh', repo, path], opts)

  if (status && stderr) console.error(status, stderr)

  return status || readFileSync(stdout, opts)
}
