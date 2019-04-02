#! /usr/bin/env node

const fs = require('fs');
const xmlParser = require('xml-js');
const { exec } = require('child_process');

function abort(message) {
  console.error(message);
  process.exit(1);
}

function validateFormat(filename) {
  return new Promise((resolve, _) => {
    exec(`xmllint --noout --relaxng assets/spec.rng.xml ${filename}`, (err, stdout, stderr) => {
      if (err) {
        abort(err.toString());
      }

      console.info(stderr.slice(0, stderr.length - 1));
      return resolve({ stdout, stderr });
    });
  });
}

function validateLength(filename) {
  const content = fs.readFileSync(filename);
  const items = xmlParser.xml2js(content)
    .findElement('feed')
    .findElements('entry');

  if (items.length < 3) {
    abort(`${filename} contains less than 3 items (${items.length})`);
  }

  console.info(`${filename} has ${items.length} items`);
}

async function main() {
  if (process.argv.length < 3) {
    abort(`usage: ${process.argv.join(' ')} <file.atom>`);
  }

  const filename = process.argv[process.argv.length - 1];
  if (!fs.existsSync(filename)) {
    abort(`${filename}: no such file or directory`);
  }

  Object.prototype.findElement = function(name) {
    return this.elements.find(e => e.name === name);
  }
  
  Object.prototype.findElements = function(name) {
    return this.elements.filter(e => e.name === name);
  }

  await validateFormat(filename);
  validateLength(filename);
}

main().catch(console.error);
