const { spawn } = require('node:child_process')

const ls = spawn('ls', ['-lh', '/usr'])

console.log('HII')

ls.stdout.on('data', data => {
  console.log(`stdout: ${data}`)
})

ls.stderr.on('data', data => {
  console.error(`stderr: ${data}`)
})

ls.on('close', code => {
  console.log(`child process exited with code ${code}`)
})

console.log('BYE')
