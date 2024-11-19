import 'package:flutter/material.dart';
import 'package:xo_game/XO_Game_Screen.dart';

// ignore: must_be_immutable
class LetsPlay extends StatelessWidget {
  // ignore: non_constant_identifier_names
  static String RouteName = "Lets_Play";

  // ignore: non_constant_identifier_names
  String Player1 = "";
  // ignore: non_constant_identifier_names
  String Player2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.8,
        centerTitle: true,
        backgroundColor: Color(0xffebba48),
        title: const Text(
          "Players Screen",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            "lib/assets/images/DALL·E 2024-11-19 16.05.50 - A minimalistic X and O game background in a style similar to the uploaded image. Use a vibrant, playful yellow backdrop, but change the color of the g.png",
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  onChanged: (text) {
                    Player1 = text;
                  },
                  decoration: const InputDecoration(
                    label: Text(
                      "Player1",
                      style: TextStyle(fontSize: 23, color: Colors.black),
                    ),
                  ),
                ),
                TextField(
                  onChanged: (text) {
                    Player2 = text;
                  },
                  decoration: const InputDecoration(
                    label: Text(
                      "Player2",
                      style: TextStyle(fontSize: 23, color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(XoGameScreen.routeName,
                        arguments: XoGameArgs(
                            Player1Name: Player1, Player2Name: Player2));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Let's Play",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
