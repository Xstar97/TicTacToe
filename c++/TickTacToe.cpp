/*another game!
tic tac toe!!
*/
#include <iostream>
#include <list>
#include <string>
#include <algorithm>

using namespace std;

//list of values that corresponds to the grid
string gameMoveList[] = { "1|1" , "2|2" ,"3|3" ,"4|4", "5|5", "6|6", "7|7", "8|8", "9|9" };
int gamePlayerMoveList[] = { 0,0,0,0,0,0,0,0,0 };
//user input
int gamePlayer1, gamePlayer2;
int gameCurrentMoveIndex = 0;
bool gameWinner = false;

const string gameTitle = "Hello World!\n\nTic Tac Toe!\n\n";
const int gameMoveCountMax = 9;
const int gameActionContinue = 0;
const int gameActionRestart = 1;
const int gameActionEnd = 2;
const string gameMessageNumberInUsed = "\nplease select a number that's not in used\n";
const string gameMessageGameOver = "\n\nno more moves left\nGame Over!";
const string gamePlayerNameOne = "one";
const char gamePlayerValueOne = 'X';
const string gamePlayerNameTwo = "two";
const char gamePlayerValueTwo = 'O';

//validates the number selected is not in used
bool hasPlayerSelectedThisNumber(int item) {
    bool exists = false;
    for (const int& number : gamePlayerMoveList) {
        if (number == item) {
            exists = true;
            break;
        }
    }
    return exists;
}
//gets specific value from playList[] element...ex: "1|O"
//return "O" or "1"
string getGameMoveValue(int index) {
    if (gameMoveList[index].find("|")) {
        //2,2 is needed to slice the string to the last char
        return gameMoveList[index].substr(2, 2);
    }
    else {
        return gameMoveList[index];
    }
}
//the game view maker
int gameView() {
    cout << "\n " << getGameMoveValue(0) << " | " << getGameMoveValue(1) << " | " << getGameMoveValue(2) << " \n";
    cout << "---|---|---\n";
    cout << " " << getGameMoveValue(3) << " | " << getGameMoveValue(4) << " | " << getGameMoveValue(5) << " \n";
    cout << "---|---|---\n";
    cout << " " << getGameMoveValue(6) << " | " << getGameMoveValue(7) << " | " << getGameMoveValue(8) << " \n";
    return 0;
}
//utility to validate if the play has won
bool validateWin(int one, int two, int three, char playerChar) {
    string threeChars = string(1, playerChar) + string(1, playerChar) + string(1, playerChar);
    bool playerMoveSelection = getGameMoveValue(one-1) + getGameMoveValue(two-1) + getGameMoveValue(three-1) == threeChars;
    return playerMoveSelection;
}
//clean validation method
bool validateWinner(char playerChar) {
    if (
        validateWin(1, 2, 3, playerChar) ||
        validateWin(4, 5, 6, playerChar) ||
        validateWin(7, 8, 9, playerChar) ||
        validateWin(1, 4, 7, playerChar) ||
        validateWin(2, 5, 8, playerChar) ||
        validateWin(3, 6, 9, playerChar) ||
        validateWin(1, 5, 9, playerChar) ||
        validateWin(3, 5, 7, playerChar)
        )
    {
        string player = gamePlayerNameOne;
        if (playerChar != gamePlayerValueOne) {
            player = gamePlayerNameTwo;
        }
        cout << "\n\nwinner player "<< player <<"!\n";
        gameWinner = true;
    }

    return gameWinner;
}
//validate user input from 1 to 9
int gamePlayer(int playerInput, string playerName, char playerChar) {
    int play = gameActionContinue;
    do {
        cout << "\nPlayer " << playerName << "... -> ";
        cin >> playerInput;
        if (!hasPlayerSelectedThisNumber(playerInput)) {
            gamePlayerMoveList[gameCurrentMoveIndex] = playerInput;
            gameCurrentMoveIndex += 1;
			// '|' splits the data for easy extractions
            gameMoveList[playerInput - 1] = to_string(playerInput) + "|" + playerChar;
            play = gameActionContinue;
            validateWinner(playerChar);
        }
        else {
            play = gameActionRestart;
            cout << gameMessageNumberInUsed;
            gamePlayer(playerInput, playerName, playerChar);
            break;
        }
        cin.clear();
        cin.ignore(100, '\n');
    } while (1 > playerInput || 9 < playerInput);

    //show the view, updated list
    if (play == gameActionContinue) {
        gameView();
    }
    if (gameCurrentMoveIndex == gameMoveCountMax) {
        cout << gameMessageGameOver;
        play = gameActionEnd;
    }
    validateWinner(playerChar);
    if (gameWinner) {
        play = gameActionEnd;
        cout << gameMessageGameOver;
    }
    return play;
}

int main()
{
    //titles
    cout << gameTitle;

    //show the intial view
    gameView();

    //play the game
    while (true) {

        if(gamePlayer(gamePlayer1, gamePlayerNameOne, gamePlayerValueOne) == gameActionEnd)
            break;
        
        if(gamePlayer(gamePlayer2, gamePlayerNameTwo, gamePlayerValueTwo) == gameActionEnd)
            break;
    }

    char junk;
    cin >> junk;

    return 0;
}