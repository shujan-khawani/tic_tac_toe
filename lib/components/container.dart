import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final String giveText;
  const MyContainer({super.key, required this.giveText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        width: 0.2,
        color: Theme.of(context).colorScheme.primary,
      )),
      child: Center(
        child: Text(
          giveText,
          style: const TextStyle(
            fontSize: 60,
          ),
        ),
      ),
    );
  }
}
