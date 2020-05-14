#!/bin/bash 


# Do zrobienia : 
# Przypisać pingowany adres w ping_fajny do zmiennej 

#### USER VARIABLES ####

# Przypisanie nazwy sesji tmuxa 
session_name="ping_fajny"

# Nazwa skryptu pingującego 
ping_script_name="ping_fajny.sh"

# Ścieżka do katalogu z gównym skryptem, domyślnie wpisany obecny katalog
parent_dir="$PWD"


########################

# Zmienna sprawdzajaca 
is_session_running=`tmux ls | grep "$session_name"` 


# Funkcja sprawdzająca czy sesja tmuxa o podanej nazwie juz dziala 
function tmux_check() 
{
    # If variable is empty then 
    if [ -z "$is_session_running" ]
    then
        # Tmux session is not working 
        tmux new -d -s "$session_name"
        tmux send-keys -t "$session_name" "$parent_dir/$ping_script_name" ENTER

    else
        # Tmux session is not working 
        echo "Sesja juz dziala"
    fi
}


# Odpalenie funkcji sprawdzajacej  
tmux_check

