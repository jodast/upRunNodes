#!/usr/bin/expect

# Send `pocket stop` when interrupted to prevent corruption
proc graceful_exit {} {
    send_user "Gracefully exiting Pocket...\n"
    spawn sh -c "pocket stop"
}

trap graceful_exit {SIGINT SIGTERM}

# Command to run
set command $argv
set timeout -1

# Create work dir
spawn sh -c "mkdir -p /home/app/.pocket/config"
expect eof

log_user 0
spawn sh -c "$command"
log_user 1

expect eof
exit
