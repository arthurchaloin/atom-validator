workflow "Build and test" {
  on = "push"
  resolves = ["test"]
}

action "build" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  args = "build -t arthurchaloin/atom-validator ."
}

action "test" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "test"
  needs = ["build"]
}
