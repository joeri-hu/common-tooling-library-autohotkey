; @file       browser.ahk
; @version    0.1
; @date       April 2022
; @author     Joeri Kok
; @copyright  GPL-3.0 license
;
; @title
;   Browser Windows
; @brief
;   Defines a set of common browser windows.

#include ui/window.ahk

; @namespace
;   browser
; @brief
;   Set of constants that relate to common browser windows.
; @constants
;   chrome ............... Relates to the Google Chrome browser.
;   firefox .............. Relates to the Mozilla Firefox browser.
class browser extends window {
    static chrome  := new browser("Chrome_WidgetWin_1")
    static firefox := new browser("MozillaWindowClass")
}
