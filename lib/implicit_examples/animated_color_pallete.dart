import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedColorPalette extends StatefulWidget {
  const AnimatedColorPalette({super.key});

  @override
  State<AnimatedColorPalette> createState() => _AnimatedColorPaletteState();
}

class _AnimatedColorPaletteState extends State<AnimatedColorPalette> {
  List<Color> currentPalette = generateRandomPalette();
  int width = generateRandomDimentions();
  int height = generateRandomDimentions();
  // List<AlignmentGeometry> align = [
  //   Alignment.bottomCenter,
  //   Alignment.centerLeft,
  //   Alignment.topLeft,
  //   Alignment.topRight
  // ];

  static int generateRandomDimentions() {
    final random = Random();
    return random.nextInt(200);
  }

  static List<Color> generateRandomPalette() {
    final random = Random();
    return List.generate(
      5,
      (_) => Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      ),
    );
  }

  void regeneratePalette() {
    setState(() {
      currentPalette = generateRandomPalette();
      width = generateRandomDimentions();
      height = generateRandomDimentions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Palette Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: height.toDouble(),
              height: width.toDouble(),
              color: currentPalette[2],
              curve: Curves.easeInOutBack,
              margin: const EdgeInsets.all(8),
            ),
            // AnimatedAlign(
            //   alignment: align[Random().nextInt(3)],
            //   duration: const Duration(seconds: 1),
            //   child: AnimatedContainer(
            //     duration: const Duration(seconds: 1),
            //     width: height.toDouble(),
            //     height: width.toDouble(),
            //     color: currentPalette[2],
            //     margin: const EdgeInsets.all(8),
            //   ),
            // ),
            ElevatedButton(
              onPressed: regeneratePalette,
              child: const Text('Generate New Palette'),
            ),
          ],
        ),
      ),
    );
  }
}
