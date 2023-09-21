import 'package:flutter/material.dart';

class LoginScreenAnimation extends StatefulWidget {
  const LoginScreenAnimation({super.key});

  @override
  State<LoginScreenAnimation> createState() => _LoginScreenAnimationState();
}

class _LoginScreenAnimationState extends State<LoginScreenAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> logoFadeAnimation;
  late AnimationController controllerIn;
  late Animation<Offset> slideAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controllerIn =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    slideAnimation = Tween(begin: const Offset(-1, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(parent: controllerIn, curve: Curves.bounceIn));

    logoFadeAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controllerIn, curve: Curves.bounceIn));
    scaleAnimation = Tween(begin: 0.0, end: 1.0).animate(controllerIn);
  }

  @override
  Widget build(BuildContext context) {
    controllerIn.forward();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: logoFadeAnimation,
              child: const FlutterLogo(
                size: 100.0,
              ),
            ),
            SlideTransition(
              position: slideAnimation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            controllerIn.repeat();
                          });
                        },
                        child: const Text('Login'),
                      ),
                    ],
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
