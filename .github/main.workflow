workflow "Build and test" {
  on = "push"
  resolves = ["yarn test"]
}

action "yarn install" {
  uses = "yarn"
  runs = "yarn"
}

action "yarn test" {
  uses = "yarn"
  needs = ["yarn install"]
  runs = "yarn"
  args = "test"
}
