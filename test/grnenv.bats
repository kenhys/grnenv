#!/usr/bin/env bats

@test "invalid command" {
  run bin/grnenv piyopiyo
  test $status -eq 1
  test "grnenv: command not found: <piyopiyo>" = "$output"
}

@test "varsion" {
  run bin/grnenv version
  test $status -eq 0
  test $(echo "$output" | grep -E "([0-9]\.)*[0-9]")
}

@test "build" {
  run bin/grnenv build
  test $status -eq 1
  test "Usage: grnenv build VERSION" = "$output"
}
