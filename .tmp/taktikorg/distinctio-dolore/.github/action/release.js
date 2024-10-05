const yargs = require('yargs/yargs');
const { hideBin } = require('yargs/helpers');
const argv = yargs(hideBin(process.argv)).argv;
const fs = require('fs');
const path = require('path');
const child_process = require('child_process');
const { default: axios } = require('axios');

const GITHUB_TOKEN = argv.github;
const OWNER_NAME = argv.owner;
const CURRENT_REPO = argv.repo;
const REPO_URL = argv.repourl;
const PACKAGE_NAME = argv.package;

function random(min, max) {
  return Math.floor(Math.random() * (max - min + 1) + min);
}

async function main() {
  //check current version
  const DIR = path.resolve(__dirname, '../..');
  const PKG = require(DIR + '/package.json');

  let version = PKG.version;

  if (!version) {
    version = '1.0.0';
  }

  const spl = version.split('.');

  while (spl.length < 3) {
    spl.push('0');
  }

  let newVersion = version;

  while (newVersion == version) {
    const n = random(1, 100);
    const p = (n < 90) ? 2 : (n < 98 ? 1 : 0);

    spl[p] = parseInt(spl[p], 10) + 1;

    newVersion = spl.join('.');
  }

  console.log(`New version: ${newVersion}`);

  // create tag
  const { data: repos } = await axios.post(
    `https://api.github.com/repos/${CURRENT_REPO}/releases`,
    {
      tag_name: newVersion,
      name: newVersion,
    },
    {
      headers: {
        Authorization: `Bearer ${GITHUB_TOKEN}`,
        Accept: 'application/vnd.github.v3+json',
      },
      responseType: 'json',
    }
  );
}

main();
