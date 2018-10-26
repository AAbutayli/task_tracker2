# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TaskTracker2.Repo.insert!(%TaskTracker2.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias TaskTracker2.Repo
alias TaskTracker2.Users.User

Repo.insert!(%User{email: "alice@example.com", fname: "alice", lname: "bob", admin: true})
Repo.insert!(%User{email: "bob@example.com", fname: "bob", lname: "alice", admin: false})