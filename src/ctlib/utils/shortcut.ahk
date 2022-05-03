; @file       shortcut.ahk
; @version    0.1
; @date       April 2022
; @author     Joeri Kok
; @copyright  GPL-3.0 license
;
; @title
;   Keyboard Shortcuts
; @brief
;   Common keyboard shortcuts that improve operating system interaction.

#include os/shell.ahk
#include ui/window.ahk
#include utils/cycle.ahk

; @namespace
;   shortcut
; @brief
;   Group of functions that interact with the operating system by sending keyboard
;   shortcuts.
class shortcut {
    ; @method
    ;   toggle_desktop
    ; @brief
    ;   Toggles between switching to the next or previous virtual desktop.
    toggle_desktop() {
        static order := cycle.next
        shortcut.switch_desktop(order)
        order := order.flip()
    }

    ; @method
    ;   switch_desktop
    ; @brief
    ;   Switches to the next or previous virtual desktop.
    ; @params
    ;   order[in] Cyclic order in which to cycle through the virtual desktops.
    switch_desktop(order) {
        arrow := order.is_clockwise() ? "right" : "left"
        keys  := Format("{lwin down}{ctrl down}{{:}}{ctrl up}{lwin up}", arrow)
        shell.send(keys)
    }

    ; @method
    ;   switch_tab
    ; @brief
    ;   Switches to the next or previous browser tab.
    ; @params
    ;   order[in] .... Cyclic order in which to cycle through the browser tabs.
    switch_tab(order) {
        modifier := order.is_clockwise() ? "" : ["shift down", "shift up"]
        keys := Format("{ctrl down}{{:}}{tab}{{:}}{ctrl up}", modifier*)
        shell.send(keys)
    }

    ; @method
    ;   close_tab
    ; @brief
    ;   Closes a browser tab.
    ; @pre
    ;   The active window is a browser.
    close_tab() {
        shell.send("{ctrl down}w{ctrl up}")
    }

    ; @method
    ;   playpause_tab
    ; @brief
    ;   Plays or pauses media content within a browser tab.
    ; @pre
    ;   The active window is a browser that contains media content.
    playpause_tab() {
        shell.send("k")
    }

    ; @method
    ;   reload_tab
    ; @brief
    ;   Reloads a browser tab.
    ; @pre
    ;   The active window is a browser.
    reload_tab() {
        shell.send("{ctrl down}r{ctrl up}")
    }

    ; @method
    ;   select_addr_bar
    ; @brief
    ;   Selects the text of an address bar.
    ; @pre
    ;   The active window is a browser or explorer window.
    select_addr_bar() {
        shell.send("{alt down}d{alt up}")
    }
}
