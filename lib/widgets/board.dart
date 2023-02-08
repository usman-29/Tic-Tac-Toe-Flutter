import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/game_provider.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context, listen: false);
    return GridView.builder(
        itemCount: 9,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return Consumer<GameProvider>(builder: (context, value, child) {
            return GestureDetector(
              onTap: () {
                value.checkPlayer(index, context);
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[700] ?? Colors.grey)),
                child: Center(
                  child: Text(
                    value.display[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }
}
