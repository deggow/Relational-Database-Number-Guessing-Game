#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guessing --tuples-only -c"

USER_DETAILS(){
    echo -e "\nEnter your username:"
    read USER_NAME

    len=${#USER_NAME}

    if [[ $len -gt 0 && $len -le 22 ]]; then
        NAME_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USER_NAME'")
        if [[ -z $NAME_ID ]]; then
            echo -e "\nWelcome, $USER_NAME! It looks like this is your first time here."
            INSERTED_TO_USERS=$($PSQL "INSERT INTO users(username) VALUES('$USER_NAME')")
        else
            GAMES_PLAYED=$(echo $($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id = '$NAME_ID'") | sed 's/ //g')
            BEST_GAME=$(echo $($PSQL "SELECT MIN(tries) FROM games  WHERE user_id = '$NAME_ID'") | sed 's/ //g')
            echo -e "\nWelcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
        fi
        GAME
    else
        echo -e "\nUsername should be between 1 and 22 characters. Please try again."
        USER_DETAILS
    fi
}

GAME(){
    SECRET_NUMBER=$((1 + RANDOM % 1000))
    CHECK=0
    GAMES=0

    echo -e "\nGuess the secret number between 1 and 1000:"

    while [ $CHECK -eq 0 ]; do
        read GUESS
        if [[ $GUESS =~ ^[0-9]+$ ]]; then
            if [[ $SECRET_NUMBER -eq $GUESS ]]; then
                GAMES=$((GAMES + 1))
                echo -e "\nYou guessed it in $GAMES tries. The secret number was $SECRET_NUMBER. Nice job!"
                NAME_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USER_NAME'")
                INSERTED_TO_GAMES=$($PSQL "INSERT INTO games(user_id, tries) VALUES($NAME_ID, $GAMES)")
                CHECK=1
            else
                GAMES=$((GAMES + 1))
                if [[ $GUESS -gt $SECRET_NUMBER ]]; then
                    echo -e "\nIt's lower than that, guess again:"
                else 
                    echo -e "\nIt's higher than that, guess again:"
                fi
            fi
        else
            echo -e "\nThat is not an integer, guess again:"
        fi
    done
}

USER_DETAILS

