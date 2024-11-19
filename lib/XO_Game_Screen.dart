import 'package:flutter/material.dart';
import 'package:xo_game/Botton.dart';

class XoGameScreen extends StatefulWidget {
  static String routeName = "XO_Game";

  @override
  State<XoGameScreen> createState() => _XoGameScreenState();
}

class _XoGameScreenState extends State<XoGameScreen> {
  List<String> ButtonState = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  int Player1Score = 0;
  int Player2Score = 0;

  @override
  Widget build(BuildContext context) {
    XoGameArgs args = ModalRoute.of(context)?.settings.arguments as XoGameArgs;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffE8B647),
        title: Text(
          "XO Game",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${args.Player1Name} (X)",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      " $Player1Score",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${args.Player2Name} (O)",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "$Player2Score",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(
                  text: ButtonState[0],
                  ButtonClick: ButtonClick,
                  index: 0,
                ),
                Button(
                  text: ButtonState[1],
                  ButtonClick: ButtonClick,
                  index: 1,
                ),
                Button(
                  text: ButtonState[2],
                  ButtonClick: ButtonClick,
                  index: 2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(
                  text: ButtonState[3],
                  ButtonClick: ButtonClick,
                  index: 3,
                ),
                Button(
                  text: ButtonState[4],
                  ButtonClick: ButtonClick,
                  index: 4,
                ),
                Button(
                  text: ButtonState[5],
                  ButtonClick: ButtonClick,
                  index: 5,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(
                  text: ButtonState[6],
                  ButtonClick: ButtonClick,
                  index: 6,
                ),
                Button(
                  text: ButtonState[7],
                  ButtonClick: ButtonClick,
                  index: 7,
                ),
                Button(
                  text: ButtonState[8],
                  ButtonClick: ButtonClick,
                  index: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;
  void ButtonClick(int index) {
    if (ButtonState[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      ButtonState[index] = "X";
    } else {
      ButtonState[index] = "O";
    }
    counter++;

    if (checkWinner("X")) {
      Player1Score++;
      restGame();
    } else if (checkWinner("O")) {
      Player2Score++;
      restGame();
    }
    setState(() {});
  }

  bool checkWinner(String symbol) {
    //rows
    for (int i = 0; i < 9; i += 3) {
      if (ButtonState[i] == symbol &&
          ButtonState[i + 1] == symbol &&
          ButtonState[i + 2] == symbol) {
        return true;
      }

      //colums
      for (int i = 0; i < 3; i++) {
        if (ButtonState[i] == symbol &&
            ButtonState[i + 3] == symbol &&
            ButtonState[i + 6] == symbol) {
          return true;
        }
      }
    }

    if (ButtonState[0] == symbol &&
        ButtonState[4] == symbol &&
        ButtonState[8] == symbol) {
      return true;
    }

    if (ButtonState[2] == symbol &&
        ButtonState[4] == symbol &&
        ButtonState[6] == symbol) {
      return true;
    }

    if (counter == 9) {
      restGame();
    }

    return false;
  }

  void restGame() {
    ButtonState = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    counter = 0;
  }
}

class XoGameArgs {
  String Player1Name;
  String Player2Name;

  XoGameArgs({required this.Player1Name, required this.Player2Name});
}
