; @file       window.ahk
; @version    0.1
; @date       April 2022
; @author     Joeri Kok
; @copyright  GPL-3.0 license
;
; @title
;   Shell Windows
; @brief
;   Defines representations of windows that are part of the user interface.

; @class
;   window
; @brief
;   Relates to windows whithin the shell of the operating system.
class window {
    ; @method
    ;   constructor
    ; @brief
    ;   Constructs a window with a given class name.
    ; @params
    ;   classname[in] ........ Name of the window class.
    __new(ByRef classname) {
        this._classname := classname
    }

    ; @method
    ;   wait_for_focus
    ; @brief
    ;   Waits at most the given amount of time for this window to become active.
    ; @post
    ;   The value of @p ErrorLevel is set to 1 when the timeout has elapsed.
    ; @params
    ;   timeout_s[in] ........ Wait time in seconds, defaulted to 1.
    wait_for_focus(timeout_s := 1) {
        WinWaitActive, % this.to_search_query(),, % timeout_s
    }

    ; @method
    ;   to_search_query
    ; @returns
    ;   WinTitle search criteria that matches windows with the same window class.
    to_search_query() {
        return "ahk_class" . this._classname
    }

    ; @method
    ;   classname
    ; @returns
    ;   Name of the window class.
    classname() {
        return this._classname
    }
}
