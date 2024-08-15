import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_page.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [

              const Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                      'Tic Tac Toe',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),

              //Logo
              Expanded(
                flex: 2,
                  child: AvatarGlow(
                    glowColor: Theme.of(context).colorScheme.secondary,
                    glowRadiusFactor: 0.1,
                    glowCount: 4,
                    glowShape: BoxShape.rectangle,
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.none,
                        )
                      ),
                      child: Image.asset('images/Logo.png')
                    ),
                  )
              ),

              Expanded(
                flex: 1,
                  child: Column(
                    children: [
                      const Text(
                        'Created by @ShujanKhakwani',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const GamePage())
                          );
                        },
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                                'Head To Battle',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
