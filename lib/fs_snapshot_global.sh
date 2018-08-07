#!/bin/bash

# file snapshot (local directory) 

TSTAMP=$(date +'%Y%m%d%H%M')

IGNOREPATHS=.git
IGNOREDIRS=/sys:/run:/dev

#-path pattern
#               File name matches shell pattern pattern.  The metacharacters do not treat `/' or `.' specially; so, for example,
#                         find . -path "./sr*sc"
##*              will print an entry for a directory called `./src/misc' (if one exists).  To ignore a whole directory tree, use -prune rather than checking every file in the tree.  For  example,  to  skip  the
#               directory `src/emacs' and all files and directories under it, and print the names of the other files found, do something like this:
#                         find . -path ./src/emacs -prune -o -print
#               Note  that the pattern match test applies to the whole file name, starting from one of the start points named on the command line.  It would only make sense to use an absolute path name here if
#               the relevant start point is also an absolute path.  This means that this command will never match anything:
#                         find bar -path /foo/bar/myfile -print
#               Find compares the -path argument with the concatenation of a directory name and the base name of the file it's examining.  Since the concatenation will never end with a slash,  -path  arguments
#               ending in a slash will match nothing (except perhaps a start point specified on the command line).  The predicate -path is also supported by HP-UX find and is part of the POSIX 2008 standard.
# todo: need to exclude git folders and possibly node_modules
#   find . -name .snapshot -prune -o \( \! -name '*~' -print0 \)|

# find ./ \( -exec test -d '{}'/.svn \; -or -exec test -d {}/.git \; -or -exec test -d {}/CVS \; \) -print -prune
 



find / -printf "%Cy.%Cm.%Cd %CH:%CM %M %p %b %l \n" > ~/.fs_snapshot_system_$TSTAMP

