/'
 ' Copyright 2023 XXIV
 '
 ' Licensed under the Apache License, Version 2.0 (the "License");
 ' you may not use this file except in compliance with the License.
 ' You may obtain a copy of the License at
 '
 '     http://www.apache.org/licenses/LICENSE-2.0
 '
 ' Unless required by applicable law or agreed to in writing, software
 ' distributed under the License is distributed on an "AS IS" BASIS,
 ' WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 ' See the License for the specific language governing permissions and
 ' limitations under the License.
 '/
#ifndef __RURE_BI__
#define __RURE_BI__

extern "C"

const RURE_FLAG_CASEI = 1 shl 0
const RURE_FLAG_MULTI = 1 shl 1
const RURE_FLAG_DOTNL = 1 shl 2
const RURE_FLAG_SWAP_GREED = 1 shl 3
const RURE_FLAG_SPACE = 1 shl 4
const RURE_FLAG_UNICODE = 1 shl 5
const RURE_DEFAULT_FLAGS = RURE_FLAG_UNICODE


type rure as rure

type rure_set as rure_set
    
type rure_options as rure_options

type rure_match
	start as uinteger
	end as uinteger
end type

type rure_captures as rure_captures

type rure_iter as rure_iter

type rure_iter_capture_names as rure_iter_capture_names

type rure_error as rure_error


declare function rure_compile_must(byval pattern as const zstring ptr) as rure ptr
declare function rure_compile(byval pattern as const ubyte ptr, byval length as uinteger, byval flags as ulong, byval options as rure_options ptr, byval error as rure_error ptr) as rure ptr
declare sub rure_free(byval re as rure ptr)
declare function rure_is_match(byval re as rure ptr, byval haystack as const ubyte ptr, byval length as uinteger, byval start as uinteger) as boolean
declare function rure_find(byval re as rure ptr, byval haystack as const ubyte ptr, byval length as uinteger, byval start as uinteger, byval match as rure_match ptr) as boolean
declare function rure_find_captures(byval re as rure ptr, byval haystack as const ubyte ptr, byval length as uinteger, byval start as uinteger, byval captures as rure_captures ptr) as boolean
declare function rure_shortest_match(byval re as rure ptr, byval haystack as const ubyte ptr, byval length as uinteger, byval start as uinteger, byval end as uinteger ptr) as boolean
declare function rure_capture_name_index(byval re as rure ptr, byval name as const zstring ptr) as long
declare function rure_iter_capture_names_new(byval re as rure ptr) as rure_iter_capture_names ptr
declare sub rure_iter_capture_names_free(byval it as rure_iter_capture_names ptr)
declare function rure_iter_capture_names_next(byval it as rure_iter_capture_names ptr, byval name as zstring ptr ptr) as boolean
declare function rure_iter_new(byval re as rure ptr) as rure_iter ptr
declare sub rure_iter_free(byval it as rure_iter ptr)
declare function rure_iter_next(byval it as rure_iter ptr, byval haystack as const ubyte ptr, byval length as uinteger, byval match as rure_match ptr) as boolean
declare function rure_iter_next_captures(byval it as rure_iter ptr, byval haystack as const ubyte ptr, byval length as uinteger, byval captures as rure_captures ptr) as boolean
declare function rure_captures_new(byval re as rure ptr) as rure_captures ptr
declare sub rure_captures_free(byval captures as rure_captures ptr)
declare function rure_captures_at(byval captures as rure_captures ptr, byval i as uinteger, byval match as rure_match ptr) as boolean
declare function rure_captures_len(byval captures as rure_captures ptr) as uinteger
declare function rure_options_new() as rure_options ptr
declare sub rure_options_free(byval options as rure_options ptr)
declare sub rure_options_size_limit(byval options as rure_options ptr, byval limit as uinteger)
declare sub rure_options_dfa_size_limit(byval options as rure_options ptr, byval limit as uinteger)
declare function rure_compile_set(byval patterns as const ubyte ptr ptr, byval patterns_lengths as const uinteger ptr, byval patterns_count as uinteger, byval flags as ulong, byval options as rure_options ptr, byval error as rure_error ptr) as rure_set ptr
declare sub rure_set_free(byval re as rure_set ptr)
declare function rure_set_is_match(byval re as rure_set ptr, byval haystack as const ubyte ptr, byval length as uinteger, byval start as uinteger) as boolean
declare function rure_set_matches(byval re as rure_set ptr, byval haystack as const ubyte ptr, byval length as uinteger, byval start as uinteger, byval matches as boolean ptr) as boolean
declare function rure_set_len(byval re as rure_set ptr) as uinteger
declare function rure_error_new() as rure_error ptr
declare sub rure_error_free(byval err as rure_error ptr)
declare function rure_error_message(byval err as rure_error ptr) as const zstring ptr
declare function rure_escape_must(byval pattern as const zstring ptr) as const zstring ptr
declare sub rure_cstring_free(byval s as zstring ptr)

end extern

#endif '__RURE_BI__
