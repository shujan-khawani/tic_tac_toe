import 'package:flutter/material.dart';
import 'package:tic_tac_toe/intro_screen.dart';
import 'package:tic_tac_toe/theme/themes.dart';

void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: const IntroScreen(),
    );
  }
}
