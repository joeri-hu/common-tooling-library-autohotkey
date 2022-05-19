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
    ; @function
    ;   toggle_desktop
    ; @brief
    ;   Toggles between switching to the next or previous virtual desktop.
    toggle_desktop() {
        static order := cycle.next
        shortcut.switch_desktop(order)
        order := order.flip()
    }

    ; @function
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

    ; @function
    ;   switch_tab
    ; @brief
    ;   Switches to the next or previous browser tab.
    ; @params
    ;   order[in] .... Cyclic order in which to cycle through the browser tabs.
    switch_tab(order) {
        keys := Format("{ctrl down}{{:}}{tab}{{:}}{ctrl up}", shortcut.shift(order)*)
        shell.send(keys)
    }

    ; @function
    ;   switch_window
    ; @brief
    ;   Switches to the next or previous topmost window.
    ; @params
    ;   order[in] . Cyclic order in which to cycle through the topmost windows.
    switch_window(order) {
        keys := Format("{alt down}{{:}}{esc}{{:}}{alt up}", shortcut.shift(order)*)
        shell.send(keys)
    }

    ; @function
    ;   shift
    ; @brief
    ;   Shifts the order of a cyclic keyboard shortcut.
    ; @params
    ;   order[in] .... Cyclic order in which to cycle through a set of items.
    ; @returns
    ;   Empty list if the cyclic order is clockwise. Otherwise, the key press
    ;   sequence of the shift key.
    shift(order) {
        return order.is_clockwise() ? [] : ["shift down", "shift up"]
    }

    ; @function
    ;   close_tab
    ; @brief
    ;   Closes a browser tab.
    ; @pre
    ;   The active window is a browser.
    close_tab() {
        shell.send("{ctrl down}w{ctrl up}")
    }

    ; @function
    ;   playpause_tab
    ; @brief
    ;   Plays or pauses media content within a browser tab.
    ; @pre
    ;   The active window is a browser that contains media content.
    playpause_tab() {
        shell.send("k")
    }

    ; @function
    ;   reload_tab
    ; @brief
    ;   Reloads a browser tab.
    ; @pre
    ;   The active window is a browser.
    reload_tab() {
        shell.send("{ctrl down}r{ctrl up}")
    }

    ; @function
    ;   select_addr_bar
    ; @brief
    ;   Selects the text of an address bar.
    ; @pre
    ;   The active window is a browser or explorer window.
    select_addr_bar() {
        shell.send("{alt down}d{alt up}")
    }
}
