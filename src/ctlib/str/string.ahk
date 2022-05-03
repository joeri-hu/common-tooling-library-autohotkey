; @file       string.ahk
; @version    0.1
; @date       April 2022
; @author     Joeri Kok
; @copyright  GPL-3.0 license
;
; @title
;   String Operations
; @brief
;   Defines a set of common string operations.

; @namespace
;   string
; @brief
;   Set of functions that enhance the use of strings.
class string {
    ; @function
    ;   join
    ; @brief
    ;   Joins two or more strings with the given delimeter.
    ; @params
    ;   delim[in] ............ Delimeter that separates the strings.
    ;   strings[in] .......... Strings that will be concatenated.
    ; @returns
    ;   Concatenation of the given strings. If there are no strings provided,
    ;   the result is an empty string.
    join(ByRef delim := " ", ByRef strings*) {
        sfx := ""
        for idx, str in strings {
            res .= sfx . str
            sfx := delim
        }
        return res
    }

    ; @function
    ;   remove_before
    ; @brief
    ;   Removes part of the given string that comes before the search term.
    ; @code
    ;   str := "some text: and some values"
    ;   res := string.remove_before("and", str)
    ;   res == "and some values"
    ; @endcode
    ; @params
    ;   term[in] ............. Search term that delimits the part to remove.
    ;   from[in] ............. String from which to remove some part.
    ; @returns
    ;   Part of the given string that includes the search term and everything after it.
    remove_before(ByRef term, ByRef from) {
        return SubStr(from, InStr(from, term))
    }

    ; @function
    ;   remove_after
    ; @brief
    ;   Removes part of the given string that comes after the search term.
    ; @code
    ;   str := "some text: and some values"
    ;   res := string.remove_after("text", str)
    ;   res == "some text"
    ; @endcode
    ; @params
    ;   term[in] ............. Search term that delimits the part to remove.
    ;   from[in] ............. String from which to remove some part.
    ; @returns
    ;   Part of the given string that includes the search term and everything before it.
    remove_after(ByRef term, ByRef from) {
        return SubStr(from, 1, InStr(from, term) + StrLen(term) - 1)
    }

    ; @method
    ;   retain_before
    ; @brief
    ;   Retains part of the given string that comes before the search term.
    ; @code
    ;   str := "some text: and some values"
    ;   res := string.retain_before(":", str)
    ;   res == "some text"
    ; @endcode
    ; @params
    ;   term[in] ............. Search term that delimits the part to retain.
    ;   from[in] ............. String from which to retain some part.
    ; @returns
    ;   Part of the given string that excludes the search term and everything after it.
    retain_before(ByRef term, ByRef from) {
        return SubStr(from, 1, InStr(from, term) - 1)
    }

    ; @function
    ;   retain_after
    ; @brief
    ;   Retains part of the given string that comes after the search term.
    ; @code
    ;   str := "some text: and some values"
    ;   res := string.retain_after(": ", str)
    ;   res == "and some values"
    ; @endcode
    ; @params
    ;   term[in] ............. Search term that delimits the part to retain.
    ;   from[in] ............. String from which to retain some part.
    ; @returns
    ;   Part of the given string that excludes the search term and everything before it.
    retain_after(ByRef term, ByRef from) {
        return SubStr(from, InStr(from, term) + StrLen(term))
    }
}
