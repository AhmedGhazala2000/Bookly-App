import 'package:bookly_app/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';

class SplashVIewBody extends StatefulWidget {
  const SplashVIewBody({Key? key}) : super(key: key);

  @override
  State<SplashVIewBody> createState() => _SplashVIewBodyState();
}

class _SplashVIewBodyState extends State<SplashVIewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    initSlidingAnimation();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Logo.png'),
            const SizedBox(
              height: 10,
            ),
            SlidingText(slidingAnimation: slidingAnimation),
          ],
        ),
      ),
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation = Tween(begin: const Offset(0, 3), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
  }
}
