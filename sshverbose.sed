#!/bin/sed -f
/LogLevel.*\(QUIET\|FATAL\|ERROR\|INFO\)/{
    /^ *#/!s/^/# /;
    h;
    s/$/\nLogLevel VERBOSE/
};
${
    p;
    g;
    /./!{
        iLogLevel VERBOSE
    };
    D
}
