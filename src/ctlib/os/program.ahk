; @file       program.ahk
; @version    0.1
; @date       April 2022
; @author     Joeri Kok
; @copyright  GPL-3.0 license
;
; @title
;   Desktop Program
; @brief
;   Defines representations of executable programs.

#include str/string.ahk

; @class
;   program
; @brief
;   Relates to executable programs run by the operating system.
class program {
    ; @method
    ;   constructor
    ; @brief
    ;   Constructs a program with a pathname and one or more parameters.
    ; @params
    ;   pathname[in] ..... Filename of the program, optionally preceded with a filepath.
    ;   params[in] ....... Variable amount of parameters.
    __new(ByRef pathname, ByRef params*) {
        this._pathname := pathname
        this.set_params(params*)
    }

    ; @method
    ;   set_params
    ; @brief
    ;   Sets one or more parameters of the program.
    ; @params
    ;   params[in] ....... Variable amount of parameters.
    set_params(ByRef params*) {
        this._params := string.join(, params*)
    }

    ; @method
    ;   add_params
    ; @brief
    ;   Adds one or more parameters to the program.
    ; @params
    ;   params[in] ....... Variable amount of parameters.
    add_params(ByRef params*) {
        this._params .= " " . string.join(, params*)
    }

    ; @method
    ;   run
    ; @brief
    ;   Runs the executable program.
    ; @details
    ;   Acts as a wrapper to the builtin @p Run function.
    ; @post
    ;   The value of @p ErrorLevel depends on the outcome of the wrapped function.
    ; @returns
    ;   Process identifier of the program.
    run() {
        Run, % this.get_cmdline(),,, pid
        return pid
    }

    ; @method
    ;   get_cmdline
    ; @brief
    ;   Gets the command line of the program.
    ; @returns
    ;   Pathname of the program including its parameters.
    get_cmdline() {
        return this._pathname . " " . this._params
    }

    ; @method
    ;   pathname
    ; @returns
    ;   Pathname of the program.
    pathname() {
        return this._pathname
    }

    ; @method
    ;   params
    ; @returns
    ;   Parameters of the program.
    params() {
        return this._params
    }
}
