import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/board.dart';
import 'package:tic_tac_toe/widgets/scoreboard.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Expanded(child: Scoreboard()),
            Expanded(flex: 3, child: Board()),
          ],
        ),
      ),
    );
  }
}
