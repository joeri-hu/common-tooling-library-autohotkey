; @file       application.ahk
; @version    0.1
; @date       April 2022
; @author     Joeri Kok
; @copyright  GPL-3.0 license
;
; @title
;   Desktop Application
; @brief
;   Defines a set of common desktop applications.

#include os/program.ahk

; @namespace
;   app
; @brief
;   Set of constants that relate to common desktop applications.
; @constants
;   bash ..................... Relates to the Git Bash command-line program.
class app extends program {
    static bash := new program(A_ProgramFiles . "\git\git-bash.exe")
}
