#!/bin/bash

function checkExists {
    if ! [ -f /usr/share/dict/$1 ]
    then
        echo "Sie haben keinen ngerman in /usr/share/dict. Paket herunterladen w$1."
        echo "Vielleicht versuchen zu laufen"
        echo "sudo apt install w$1"
        exit
    fi
}

function menu {
    echo "#### Wörterbuchhersteller"
    echo "(1) Automatisch für ngerman herstellen"
    echo "(2) Automatisch für ogerman herstellens"
    echo "(3) Automatisch für ngerman und ogerman herstellen"
    echo "(4) Herstellen für eine andere Datei an"
    echo "(5) Verlassen"
    read -p "Option eingeben: " option

    case $option in 
        1)
            checkExists ngerman
            python3 ./hersteller.py /usr/share/dict/ngerman wb_ndeutsch
            exit
            ;;
        2)
            checkExists ogerman
            python3 ./hersteller.py /usr/share/dict/ogerman wb_odeutsch

            exit
            ;;
        3)
            checkExists ngerman
            checkExists ogerman
            python3 ./hersteller.py /usr/share/dict/ngerman wb_ndeutsch /usr/share/dict/ogerman wb_odeutsch

            exit
            ;;
        4)
            read -p "Dateipfad eingeben: " dateipfad
            if ! [ $dateipfad ]
            then
                echo "Keine solche Datei."
                exit
            fi
            read -p "Benennen Sie die Wörterbuchdatei: " wdatei
            python3 ./hersteller.py $dateipfad $wdatei
            exit
            ;;    
        
        5)
            exit
            ;; 
        *)
            echo falsch
            sleep 2
            menu
    esac

}



case $1 in
    -n)
        checkExists ngerman
        python3 ./hersteller.py /usr/share/dict/ngerman wb_ndeutsch
        exit
        ;;
    -o)
        checkExists ogerman
        python3 ./hersteller.py /usr/share/dict/ogerman wb_odeutsch
        exit
        ;;
    -no)
        checkExists ngerman
        checkExists ogerman
        python3 ./hersteller.py /usr/share/dict/ngerman wb_ndeutsch /usr/share/dict/ogerman wb_odeutsch
        exit
        ;;
    -on)
        checkExists ngerman
        checkExists ogerman
        python3 ./hersteller.py /usr/share/dict/ngerman wb_ndeutsch /usr/share/dict/ogerman wb_odeutsch
        exit
        ;;
    -d)
        read -p "Dateipfad eingeben: " dateipfad
        if ! [ $dateipfad ]
        then
            echo "Keine solche Datei."
            exit
        fi
        read -p "Benennen Sie die Wörterbuchdatei: " wdatei
        python3 ./hersteller.py $dateipfad $wdatei        
        exit
        ;;    
    *)
        menu
esac
