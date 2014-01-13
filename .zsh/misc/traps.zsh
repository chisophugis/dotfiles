#!/usr/bin/env zsh

TRAPINT () {

  # trap SIGINT and write a message to that effect

  print "Caught SIGINT, aborting."
  # The first parameter to a trap function is the signal number.
  # The usual exit status from a process terminated by a signal is 128 +
  # the signal number, so this mimics the usual behavior.
  return $(( 128 + $1))
  # as a special case, if the return status from a trap function is 0, then
  # the shell treats the signal as handled
  #return 0
}

sleep 10
echo foo
sleep 10
