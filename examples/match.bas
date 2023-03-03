#include "rure.bi"

#inclib "rure"

dim subject(2) as zstring ptr = { _
  @"2012-03-14", _
  @"0000-00-00", _
  @"0000-00-0A" _
}

dim as rure ptr re = rure_compile_must("^\d{4}-\d{2}-\d{2}$")
' rure_compile_must aborts the process and prints an error message to
' stderr if the regex compilation fails.

dim success as boolean

for i as integer = 0 to ubound(subject)
  success = rure_is_match(re, subject(i), len(*subject(i)), 0)
  if not success then
    print("invalid string: " & *subject(i))
  end if
next

rure_free(re)

/'
invalid string: 0000-00-0A
'/
