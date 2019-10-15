this is just a quick reference guide for how to do neat stuff in bash that i always forget how to do.

strip the last character(s) from a string:
myvar1="thisisastring"
echo ${myvar1%?}
thisisastrin
echo ${myvar1%string}
thisisa
double % would delete the longest matching pattern from the end
removing characters from the front of a string would be the same, but use # instead of %
changing a string's character:

myvar1="thisisastring"
echo ${myvar1^}
Thisisastring
echo ${myvar1^^}
THISISASTRING
echo ${myvar1^^i}
thIsIsastrIng

use , in place of ^ to set lowercase instead of uppercase!
use (but don't set) a default value in an expression:
unset myvar2
echo ${myvar2:-$myvar1}
thisisastring
echo $myvar2
setting a default value in an expression:
unset myvar2
echo ${myvar2:=${myvar1}}
thisisastring
echo $myvar2
thisisastring
