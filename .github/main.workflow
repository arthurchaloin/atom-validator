workflow "Build and test" {
  on = "push"
  resolves = ["test"]
}

action "build" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  args = "build -t arthurchaloin/atom-validator ."
}

action "test" {
  uses = "./test"
  needs = ["build"]
}
