import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/container.dart';
import 'package:tic_tac_toe/components/result_container.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> displayXnO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ]; //To contain the value

  bool oTurn = true; //Player One

  //Variables to store the Score
  int oScore = 0;
  int xScore = 0;

  int filledBoxes = 0; //check filled boxes

  // onTap Function to display
  void _tapped(int index) {
    setState(() {
      if (oTurn && displayXnO[index] == '') {
        displayXnO[index] = '✓';
        filledBoxes++; // Increment FilledBoxes variable
      } else if (!oTurn && displayXnO[index] == '') {
        displayXnO[index] = '✘';
        filledBoxes++; // Increment FilledBoxes variable
      }
      oTurn = !oTurn; //To switch turn between users
      _checkWinner();
    });
  }

  //To check the winning conditions
  //1st Row
  void _checkWinner() {
    if (displayXnO[0] == displayXnO[1] &&
        displayXnO[0] == displayXnO[2] &&
        displayXnO[0] != '') {
      _showWinDialog(displayXnO[0]);
    }
    //2nd Row
    if (displayXnO[3] == displayXnO[4] &&
        displayXnO[3] == displayXnO[5] &&
        displayXnO[3] != '') {
      _showWinDialog(displayXnO[3]);
    }
    //3rd Row
    if (displayXnO[6] == displayXnO[7] &&
        displayXnO[6] == displayXnO[8] &&
        displayXnO[6] != '') {
      _showWinDialog(displayXnO[6]);
    }
    //1st Column
    if (displayXnO[0] == displayXnO[3] &&
        displayXnO[0] == displayXnO[6] &&
        displayXnO[0] != '') {
      _showWinDialog(displayXnO[0]);
    }
    //2nd Column
    if (displayXnO[1] == displayXnO[4] &&
        displayXnO[1] == displayXnO[7] &&
        displayXnO[1] != '') {
      _showWinDialog(displayXnO[1]);
    }
    //3rd Column
    if (displayXnO[2] == displayXnO[5] &&
        displayXnO[2] == displayXnO[8] &&
        displayXnO[2] != '') {
      _showWinDialog(displayXnO[2]);
    }
    //Diagonal 1
    if (displayXnO[0] == displayXnO[4] &&
        displayXnO[0] == displayXnO[8] &&
        displayXnO[0] != '') {
      _showWinDialog(displayXnO[0]);
    }
    //Diagonal 2
    if (displayXnO[6] == displayXnO[4] &&
        displayXnO[6] == displayXnO[2] &&
        displayXnO[6] != '') {
      _showWinDialog(displayXnO[6]);
    }
    else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  //Draw Dialogue for Result Announcement
  void _showDrawDialog () {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return ResultContainer(
            giveText: 'DRAW',
            giveOnTap: _clearBoard,
          );
        }
    );
    _clearBoard();
  }

  //Win Dialogue for Result Announcement
  void _showWinDialog (String winner) {
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return ResultContainer(
            giveText: '$winner won',
            giveOnTap: _clearBoard,
          );
        }
    );
    if (winner == '✓') {
      oScore++;
    } else if (winner == '✘') {
      xScore++;
    }
    _clearBoard();
  }

  //To clear the board after game
  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXnO[i] = '';
      }
    });
    filledBoxes = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Expanded(
                flex: 1,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              const Text('Player ✓' , style: TextStyle(fontSize: 20)),
                              const SizedBox(height: 20,),
                              Text( oScore.toString() , style: const TextStyle(fontSize: 10)),
                            ],
                           ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              const Text('Player ✘' , style: TextStyle(fontSize: 20)),
                              const SizedBox(height: 20,),
                              Text( xScore.toString() , style: const TextStyle(fontSize: 10)),
                            ],
                          ),
                        ),
                      ],
                    ),
              ),

              //Game Grid
              Expanded(
                flex: 3,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            _tapped(index);
                          },
                          child: MyContainer(
                            giveText: displayXnO[index],
                          ));
                    }),
              ),

              const Expanded(
                  flex: 1,
                  child: Column(
                      children: [

                        //Text 1
                        Text(
                            'Tic Tac Toe',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 30,),
                        Text(
                          'Dominate the grid, conquer the game!',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
