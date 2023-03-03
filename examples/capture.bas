#include "rure.bi"

#inclib "rure"

dim subject(2) as zstring ptr = { _
  @"2012-03-14", _
  @"0000-00-00", _
  @"0000-00-0A" _
}

dim as rure ptr re = rure_compile_must("-(\d{2})")
dim as rure_captures ptr caps = rure_captures_new(re)
dim match as rure_match
dim success as boolean

for i as integer = 0 to ubound(subject)
  success = rure_find_captures(re, subject(i), len(*subject(i)), 0, caps)
  
  while success
    for j as integer = 0 to rure_captures_len(caps) - 1
    
      if rure_captures_at(caps, j, @match) then
        print("[i=" & str(i) & "] group[" & str(j) & "]: " & mid(*subject(i), match.start + 1, match.end - match.start))
      else
        print("Something is rotten in this program.")
      end if
      
    next
    
    success = rure_find_captures(re, subject(i), len(*subject(i)), match.end, caps)
  wend
next

rure_captures_free(caps)
rure_free(re)

/'
[i=0] group[0]: -03
[i=0] group[1]: 03
[i=0] group[0]: -14
[i=0] group[1]: 14
[i=1] group[0]: -00
[i=1] group[1]: 00
[i=1] group[0]: -00
[i=1] group[1]: 00
[i=2] group[0]: -00
[i=2] group[1]: 00
'/
