#include "rure.bi"

#inclib "rure"

dim subject(2) as zstring ptr = { _
  @"2012-03-14", _
  @"0000-00-00", _
  @"0000-00-0A" _
}

dim as rure ptr re = rure_compile_must("-\d{2}")
dim match as rure_match
dim success as boolean

for i as integer = 0 to ubound(subject)
  success = rure_find(re, subject(i), len(*subject(i)), 0, @match)

  while success
    print("[i=" & str(i) & "] found: " & mid(*subject(i), match.start + 1, match.end - match.start))
    success = rure_find(re, subject(i), len(*subject(i)), match.end, @match)
  wend
next

rure_free(re)

/'
[i=0] found: -03
[i=0] found: -14
[i=1] found: -00
[i=1] found: -00
[i=2] found: -00
'/
