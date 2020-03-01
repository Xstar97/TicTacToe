class Game:
    gameMoveList = ["1|1", "2|2", "3|3", "4|4", "5|5", "6|6", "7|7", "8|8", "9|9"]
    gameCurrentMoveIndex = 0
    gamePlayerMoveList = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    gameWinner = False
    player1 = 0
    player2 = 0
    playerWinCount1 = 0
    playerWinCount2 = 0
    playerWinCountTie = 0

    # constant
    gameMoveCountMax = 9
    gamePlayerNameOne = "one"
    gamePlayerValueOne = "X"
    gamePlayerNameTwo = "two"
    gamePlayerValueTwo = "O"

    def validate_win(self, one, two, three, player_char):
        _player_data = player_char + player_char + player_char
        return self.get_value(one - 1) + self.get_value(two - 1) + self.get_value(three - 1) == _player_data
        pass

    def validate_winner(self, player_char):
        if self.validate_win(1, 2, 3, player_char) or \
                self.validate_win(4, 5, 6, player_char) or \
                self.validate_win(4, 5, 6, player_char) or \
                self.validate_win(7, 8, 9, player_char) or \
                self.validate_win(1, 4, 7, player_char) or \
                self.validate_win(2, 5, 8, player_char) or \
                self.validate_win(3, 6, 9, player_char) or \
                self.validate_win(1, 5, 9, player_char) or \
                self.validate_win(3, 5, 7, player_char):
            self.gameWinner = True
            if player_char == self.gamePlayerValueOne:
                pl_winner = self.gamePlayerNameOne
                self.playerWinCount1 += 1
            else:
                pl_winner = self.gamePlayerNameTwo
                self.playerWinCount2 += 1
            print("winner player " + pl_winner + "!")
            self.game_score_board()
        pass

    def get_value(self, index):
        if "|" in str(self.gameMoveList[index]):
            return str(self.gameMoveList[index])[2:]
        else:
            return self.gameMoveList[index]
        pass

    def game_score_board(self):
        print(
            " SCOREBOARD" + "\nPlayer " + self.gamePlayerNameOne + " = " + str(self.playerWinCount1)
            + "\nPlayer " + self.gamePlayerNameTwo + " = " + str(self.playerWinCount2)
            + "\n   tie = " + str(self.playerWinCountTie) + "\n"
        )
        pass

    def game_view(self):
        print(
            " " + self.get_value(0) + " | " + self.get_value(1) + " | " + self.get_value(2) + "\n"
                                                                                              "---|---|---" + "\n"
                                                                                                              " " + self.get_value(
                3) + " | " + self.get_value(4) + " | " + self.get_value(5) + "\n"
                                                                             "---|---|---" + "\n"
                                                                                             " " + self.get_value(
                6) + " | " + self.get_value(7) + " | " + self.get_value(8) + "\n"
        )
        pass

    @staticmethod
    def game_over_message():
        print("game over!\n")
        pass

    def game_player(self, player_input, player_name, player_char):
        play = 0
        while True:
            player_input = input("Player " + player_name + "... -> ").upper()
            if player_input not in "123456789" or \
                    int(player_input) in self.gamePlayerMoveList or len(player_input) != 1:
                print("please only type 1 digit; 1-9....dont select a used number!")
                continue
            self.gamePlayerMoveList[self.gameCurrentMoveIndex] = int(player_input)
            self.gameCurrentMoveIndex += 1
            self.gameMoveList[int(player_input) - 1] = player_input + "|" + player_char
            self.game_view()

            if self.gameCurrentMoveIndex == self.gameMoveCountMax:
                play = 1
                self.game_over_message()

            self.validate_winner(player_char)

            if self.gameWinner:
                play = 1
                self.game_over_message()

            return play
            pass

    def game_start(self):
        my_game = Game()
        my_game.game_score_board()
        my_game.game_view()

        while True:
            if my_game.game_player(my_game.player1, my_game.gamePlayerNameOne, my_game.gamePlayerValueOne):
                break
            if my_game.game_player(my_game.player2, my_game.gamePlayerNameTwo, my_game.gamePlayerValueTwo):
                break

        my_game.game_reset()
        pass

    def game_reset(self):
        self.gameMoveList = ["1|1", "2|2", "3|3", "4|4", "5|5", "6|6", "7|7", "8|8", "9|9"]
        self.gameCurrentMoveIndex = 0
        self.gamePlayerMoveList = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        self.gameWinner = False
        self.player1 = 0
        self.player2 = 0
        self.game_start()
        pass


if __name__ == '__main__':
    print("Hello World!\n\nTic Tac Toe game!\n")
    Game().game_start()
