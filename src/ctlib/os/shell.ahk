; @file       shell.ahk
; @version    0.1
; @date       April 2022
; @author     Joeri Kok
; @copyright  GPL-3.0 license
;
; @title
;   Windows Shell
; @brief
;   Defines functionality that directly interacts with the Windows shell.

; @namespace
;   shell
; @brief
;   Group of functions that interact with the Windows shell.
class shell {
    ; @function
    ;   get_control_text
    ; @brief
    ;   Gets the text of a window control.
    ; @details
    ;   Acts as a wrapper to the builtin @p ControlGetText function.
    ; @post
    ;   The value of @p ErrorLevel depends on the outcome of the wrapped function.
    ; @params
    ;   control[in] .......... Class name or control text.
    ;   wintitle[in] ......... WinTitle search criteria, defaulted to the active window.
    ; @returns
    ;   Text of the window control.
    get_control_text(ByRef control, ByRef wintitle := "A") {
        ControlGetText, text, % control, % wintitle
        return text
    }

    ; @function
    ;   get_env_var
    ; @brief
    ;   Gets the value of an environment variable.
    ; @details
    ;   Acts as a wrapper to the builtin @p EnvGet function.
    ; @post
    ;   The value of @p ErrorLevel depends on the outcome of the wrapped function.
    ; @params
    ;   var_name[in] ......... Name of the environment variable.
    ; @returns
    ;   Value of the environment variable.
    get_env_var(ByRef var_name) {
        EnvGet, value, % var_name
        return value
    }

    ; @function
    ;   send
    ; @brief
    ;   Sends the given keyboard shortcut to the active window.
    ; @params
    ;   keys[in] ............. One or more keys to send.
    send(ByRef keys) {
        Send, % keys
    }

    ; @function
    ;   wait_for_winkey
    ; @brief
    ;   Waits at most the given amount of time for each Windows key to be released.
    ; @post
    ;   The value of @p ErrorLevel is set to 1 when the timeout has elapsed.
    ; @params
    ;   timeout_s[in] ........ Wait time in seconds, prefixed with T, defaulted to "T1".
    wait_for_winkey(ByRef timeout_s := "T1") {
        shell.wait_for_keys(timeout_s, "lwin", "rwin")
    }

    ; @function
    ;   wait_for_keys
    ; @brief
    ;   Waits at most 1 second for each key to be released.
    ; @post
    ;   The value of @p ErrorLevel is set to 1 when the timeout has elapsed.
    ; @params
    ;   timeout_s[in] ........ Wait time in seconds, prefixed with T, defaulted to "T1".
    ;   keys[in] ............. One or more keys to wait for.
    wait_for_keys(ByRef timeout_s := "T1", ByRef keys*) {
        for _, key in keys {
            KeyWait, % key, % timeout_s
        }
    }
}
