import 'package:flutter/material.dart';
import 'package:tic_tac_toe/pages/game_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tic Tac Toe',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                )),
            const Text(
              'Game',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GamePage()));
                },
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Play',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
