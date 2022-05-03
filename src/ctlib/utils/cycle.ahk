; @file       cycle.ahk
; @version    0.1
; @date       April 2022
; @author     Joeri Kok
; @copyright  GPL-3.0 license
;
; @title
;   Cyclic Order
; @brief
;   Defines a set of cyclic orders.

; @enum
;   cycle
; @brief
;   Enumeration of cyclic orders in which to cycle through a set of items.
; @values
;   prev ................. Go to the previous item.
;   next ................. Go to the next item.
class cycle {
    static prev := new cycle()
    static next := new cycle()

    ; @function
    ;   flip
    ; @brief
    ;   Flips the cyclic order by returning its opposite.
    ; @returns
    ;   cycle.next ........... Cyclic order is clockwise.
    ;   cycle.prev ........... Cyclic order is counterclockwise.
    flip() {
        return this.is_clockwise() ? cycle.prev : cycle.next
    }

    ; @function
    ;   is_clockwise
    ; @brief
    ;   Checks if the given cyclic order is moving clockwise.
    ; @returns
    ;   true ................ Cyclic order is set to #cycle.next.
    ;   false ............... Cyclic order is not set to #cycle.next.
    is_clockwise() {
        return this == cycle.next
    }

    ; @function
    ;   is_counterclockwise
    ; @brief
    ;   Checks if the given cyclic order is moving counterclockwise.
    ; @returns
    ;   true ................ Cyclic order is set to #cycle.prev.
    ;   false ............... Cyclic order is not set to #cycle.prev.
    is_counterclockwise() {
        return this == cycle.prev
    }
}
