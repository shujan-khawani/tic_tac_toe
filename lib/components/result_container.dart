import 'package:flutter/material.dart';

class ResultContainer extends StatelessWidget {
  final String giveText;
  final VoidCallback giveOnTap;
  const ResultContainer({super.key, required this.giveText, required this.giveOnTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.background,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              //Result
              Text(
                giveText,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              Spacer(),

              //Button to play again
              GestureDetector(
                onTap: () {
                  giveOnTap;
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Center(
                    child: Text(
                      'Again',
                      style: TextStyle(
                        fontSize: 20,
                          decoration: TextDecoration.none,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
