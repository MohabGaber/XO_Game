import 'package:flutter/material.dart';
import 'package:xo_game/Lets_Play.dart';
import 'package:xo_game/XO_Game_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        XoGameScreen.routeName: (context) => XoGameScreen(),
        LetsPlay.RouteName: (context) => LetsPlay(),
      },
      initialRoute: LetsPlay.RouteName,
    );
  }
}
