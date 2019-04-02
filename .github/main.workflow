workflow "Build and test" {
  on = "push"
  resolves = ["test"]
}

action "test" {
  uses = "./test"
}
