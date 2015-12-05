sed '/LogLevel.*\(QUIET\|FATAL\|ERROR\|INFO\)/{/^ *#/!s/^/# /;h;s/$/\nLogLevel VERBOSE/};${p;g;/./!{iLogLevel VERBOSE'$'\n;};D}'  -i /etc/ssh/sshd_config
