#!/usr/local/bin/env bash

hello() {
  local text="${1:-Hello}";
  echo "${text}";
}

hello
