import { spawn } from 'node:child_process'
import { ok } from 'node:assert'

export default (repo, path) =>
  new Promise((resolve, reject) => {
    ok(repo && repo.constructor === String)
    ok(path && path.constructor === String)

    let res, err

    const run = spawn('bash', ['../../lib/content.sh', repo, path])

    run.stdout.on('data', data => (res = data))

    run.stderr.on('data', data => (err = data))

    run.on('close', code => code ? resolve(res) : reject(err)
  })
