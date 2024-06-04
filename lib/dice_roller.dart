import 'dart:math';
import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller>
    with SingleTickerProviderStateMixin {
  late AnimationController aController;
  late Animation<double> animation;
  int currDiceFace = 1;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    aController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {
          currDiceFace = _random.nextInt(6) + 1;
        });
      });

    animation = CurvedAnimation(
      parent: aController,
      curve: Curves.easeInOut,
    );
  }

  void rollDice() {
    aController.forward(from: 0).whenComplete(() {
      setState(() {
        currDiceFace = _random.nextInt(6) + 1;
      });
    });
  }

  @override
  void dispose() {
    aController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
              angle: animation.value * 2 * pi,
              child: Image.asset(
                'assets/images/Dice-$currDiceFace.png',
                height: 200,
              ),
            );
          },
        ),
        const SizedBox(height: 25),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            minimumSize: const Size(130, 40),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 25),
          ),
          child: const Text('Roll Dice'),
        )
      ],
    );
  }
}
