import 'package:flutter/material.dart';

class PulsatingCircleAnimation extends StatelessWidget {
  const PulsatingCircleAnimation({super.key});
  final double size = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulsating Circle Animation'),
      ),
      body: Center(
        child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 50, end: 200.0),
            duration: const Duration(seconds: 2),
            curve: Curves.easeInBack,
            builder: (context, value, child) {
              return Container(
                width: value,
                height: value,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      blurRadius: value,
                      spreadRadius: value / 2,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
