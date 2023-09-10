#!/bin/bash
main_menu() {
cmd=(dialog --keep-tite --menu "Сервер Громадської організації «4.5.0. Кривий Ріг»" 22 76 16)

options=(1 "Перезапустити всі контейнери"
          2 "Перезібрати всі контейнери"
          3 "Основні сервери"
          4 "Допоміжні сервери")

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)
            echo "First Option"
            ;;
        2)
            echo "Second Option"
            ;;
        3)
            echo "Third Option"
            ;;
        4)
            echo "Fourth Option"
            ;;
    esac
done
}

while true; do
    main_menu
done