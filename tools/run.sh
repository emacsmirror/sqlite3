#!/bin/bash

DEST=../sqlite3-api-constants.el
cat <<EOF > $DEST
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;
EOF

EXE=./def

rm -f $EXE ${EXE}.c
grep "^#define SQLITE" /usr/include/sqlite3.h | ./gen-consts.py > ${EXE}.c
gcc -o $EXE ${EXE}.c -lsqlite3
${EXE} >> $DEST