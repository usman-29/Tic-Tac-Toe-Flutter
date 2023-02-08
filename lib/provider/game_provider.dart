import 'package:flutter/material.dart';

//Game provider class
class GameProvider with ChangeNotifier {
  // to identify the player
  bool player = true;
  //player X score on scoreboard
  int xScore = 0;
  //player O score on scoreboard
  int oScore = 0;
  //filled positions
  int filled = 0;
  bool resetGame = true;
  //board positions
  List<String> display = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  //reset the board
  void resetBoard() {
    for (int i = 0; i < 9; i++) {
      display[i] = '';
    }
    filled = 0;
    player = true;
    if (resetGame) {
      xScore = 0;
      oScore = 0;
    }
    notifyListeners();
  }

  //check player
  void checkPlayer(int index, BuildContext contxt) {
    if (display[index] == '') {
      display[index] = player ? 'O' : 'X';
      player = !player;
      filled++;
      checkWinner(display[index], contxt);
    }
    notifyListeners();
  }

  // check win
  void checkWinner(String winner, BuildContext contxt) {
    //first row
    if (display[0] == display[1] &&
        display[0] == display[2] &&
        display[0] != '') {
      if (winner == 'O') {
        oScore++;
      } else {
        xScore++;
      }
      showWinDialog(winner, contxt);
    }
    //second row
    else if (display[3] == display[4] &&
        display[3] == display[5] &&
        display[3] != '') {
      if (winner == 'O') {
        oScore++;
      } else {
        xScore++;
      }
      showWinDialog(winner, contxt);
    }
    // third row
    else if (display[6] == display[7] &&
        display[6] == display[8] &&
        display[6] != '') {
      if (winner == 'O') {
        oScore++;
      } else {
        xScore++;
      }
      showWinDialog(winner, contxt);
    }
    //first column
    else if (display[0] == display[3] &&
        display[0] == display[6] &&
        display[0] != '') {
      if (winner == 'O') {
        oScore++;
      } else {
        xScore++;
      }
      showWinDialog(winner, contxt);
    }
    //second column
    else if (display[1] == display[4] &&
        display[1] == display[7] &&
        display[1] != '') {
      if (winner == 'O') {
        oScore++;
      } else {
        xScore++;
      }
      showWinDialog(winner, contxt);
    }
    //third column
    else if (display[2] == display[5] &&
        display[2] == display[8] &&
        display[2] != '') {
      if (winner == 'O') {
        oScore++;
      } else {
        xScore++;
      }
      showWinDialog(winner, contxt);
    }
    //right diagonal
    else if (display[0] == display[4] &&
        display[0] == display[8] &&
        display[0] != '') {
      if (winner == 'O') {
        oScore++;
      } else {
        xScore++;
      }
      showWinDialog(winner, contxt);
    }
    //left diagonal
    else if (display[2] == display[4] &&
        display[2] == display[6] &&
        display[2] != '') {
      if (winner == 'O') {
        oScore++;
      } else {
        xScore++;
      }
      showWinDialog(winner, contxt);
    } else {
      //check if the game ends in draw
      checkDraw(contxt);
    }
    notifyListeners();
  }

  //show win dialog
  showWinDialog(String winner, BuildContext contxt) {
    showDialog(
        barrierDismissible: false,
        context: contxt,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Player $winner won!'),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Player O: $oScore'),
                Text('Player X: $xScore'),
              ],
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  resetGame = true;
                  Navigator.pop(context);
                  Navigator.pop(context);
                  resetBoard();
                },
                child: const Text('Exit'),
              ),
              MaterialButton(
                onPressed: () {
                  resetGame = false;
                  Navigator.pop(context);
                  resetBoard();
                },
                child: const Text('Play Again!'),
              ),
            ],
          );
        });
  }

  //check draw
  void checkDraw(BuildContext contxt) {
    //if all the boxes are filled and no one wins then its a draw
    if (filled == 9) {
      showDrawDialog(contxt);
    }
  }

  //show draw dialog
  showDrawDialog(BuildContext contxt) {
    showDialog(
        barrierDismissible: false,
        context: contxt,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Draw'),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Player O: $oScore'),
                Text('Player X: $xScore'),
              ],
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  resetGame = true;
                  Navigator.pop(context);
                  Navigator.pop(context);
                  resetBoard();
                },
                color: Colors.white,
                child: const Text('Exit'),
              ),
              MaterialButton(
                onPressed: () {
                  resetGame = false;
                  Navigator.pop(context);
                  resetBoard();
                },
                color: Colors.white,
                child: const Text('Play Again!'),
              ),
            ],
          );
        });
  }
}
