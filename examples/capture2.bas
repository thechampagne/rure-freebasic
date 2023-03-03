#include "rure.bi"

#inclib "rure"

dim subject(2) as zstring ptr = { _
  @"2012-03-14", _
  @"0000-00-00", _
  @"0000-00-0A" _
}

dim as rure ptr re = rure_compile_must("-(\d{2})")
dim as rure_captures ptr caps = rure_captures_new(re)
dim it as rure_iter ptr
dim match as rure_match
dim success as boolean

for i as integer = 0 to ubound(subject)
  it = rure_iter_new(re)
  
  while rure_iter_next_captures(it, subject(i), len(*subject(i)), caps)
    for j as integer = 0 to rure_captures_len(caps) - 1
      success = rure_captures_at(caps, j, @match)
      print("[i = " & str(i) & "] capture[" & str(j) & "] = " & mid(*subject(i), match.start + 1, match.end - match.start))
    next
  wend
  
  rure_iter_free(it)
next

rure_captures_free(caps)
rure_free(re)

/'
[i = 0] capture[0] = -03
[i = 0] capture[1] = 03
[i = 0] capture[0] = -14
[i = 0] capture[1] = 14
[i = 1] capture[0] = -00
[i = 1] capture[1] = 00
[i = 1] capture[0] = -00
[i = 1] capture[1] = 00
[i = 2] capture[0] = -00
[i = 2] capture[1] = 00
'/
