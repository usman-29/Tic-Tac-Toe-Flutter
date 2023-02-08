import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/game_provider.dart';

class Scoreboard extends StatefulWidget {
  const Scoreboard({super.key});

  @override
  State<Scoreboard> createState() => _ScoreboardState();
}

class _ScoreboardState extends State<Scoreboard> {
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context, listen: false);
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Scoreboard',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text(
                  'Player: O',
                  style: TextStyle(color: Colors.white70, fontSize: 30),
                ),
                Consumer<GameProvider>(builder: (context, value, child) {
                  return Text(
                    value.oScore.toString(),
                    style: const TextStyle(color: Colors.white70, fontSize: 30),
                  );
                })
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            Column(
              children: [
                const Text(
                  'Player: X',
                  style: TextStyle(color: Colors.white70, fontSize: 30),
                ),
                Consumer<GameProvider>(builder: (context, value, child) {
                  return Text(
                    value.xScore.toString(),
                    style: const TextStyle(color: Colors.white70, fontSize: 30),
                  );
                })
              ],
            ),
          ],
        ),
      ],
    );
  }
}
